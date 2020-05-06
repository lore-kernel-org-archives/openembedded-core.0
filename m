Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web12.1869.1588791694395300732
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 May 2020 12:01:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eoIv9AdD;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id v4so5641367wme.1
        for <openembedded-core@lists.openembedded.org>; Wed, 06 May 2020 12:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P6OrpuAchVkaG6yfX84bYOBesnJQHupwCvePaTg8gWc=;
        b=eoIv9AdDkg/0bRl0ggjSJbWKY7YBXKijFUCt1woBLy0wscIqTOIo5n+ilwlt9+p9bE
         jgoMCRSrD6bsMmGk1wpeR6EGZwBu+F2il7mrizK5Z9/szuPsHv2ncFoOq1vSzYO3csZj
         6T3zAfWH85GtgQLxTykD4jxegoio4geY7VcQB5tn5NuOumlwH69HCus91FFnFkm7W8qW
         eErr4pZ01ecFl9Y3w4+CozRtByIb8VHmO0YxtmP7pkMdrJiCYhPKWNE0/JWKxEYmS/P4
         TXnPzyFpcv8qTb1/StTesIpMPM50mz6sgSUiiRi7+b4m5EAhmzyf4jx1czwpCZEoukCm
         jJuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P6OrpuAchVkaG6yfX84bYOBesnJQHupwCvePaTg8gWc=;
        b=K5HUUDRxgl5M9VDnLqWSl7Z0JCI0ZLPgj3ato2ZhWfCmTBWYQrt0JxzQM0EcQlPZ9W
         qji8DebTDjRtriR5xWZeppHk4gNlaY8qXYMqZ4xHwu3a5O8mM8nM8sJJQSKg3fC6OrVB
         tFOmloNDvSr+0E9NmmOhpCYTwoo7mX93fEc+ui4CNHsZvqz5+FwTjbUIxJctsroAzjWQ
         3zBBhnDZ+8/ByvBgH290JqZ0CKdqElKIfcUCHoSp2Gcdzx1kq7acDRrhZYmapb/GY/fj
         gC3qpbyhu+lK7eKWrnqUpLST+a6OIVtTTWZvTkIvyR3GtXMJeTu+1ZXU7RBaOCMvWpvm
         M1mQ==
X-Gm-Message-State: AGi0PuZdIWRB0YWD6nVjC3WhKJnnaE8Z4PMjqbCfpUuIqWZNbq2wYA98
	EPw7l8TFrWZ76PXfbhF9N+aACgOc
X-Google-Smtp-Source: APiQypKuRmsKHNfyZY2pRXXwIZ4tlM60cIIfOxBg6vdqBlmgpJnoZJ0GkpVtPAeNfcI+zzW3Tc0YDA==
X-Received: by 2002:a7b:c1d4:: with SMTP id a20mr6191999wmj.111.1588791691932;
        Wed, 06 May 2020 12:01:31 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id n131sm4197061wmf.35.2020.05.06.12.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 12:01:31 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 1/2] runqemu: set host DRI driver path for all instances of virgl usage
Date: Wed,  6 May 2020 21:01:02 +0200
Message-Id: <20200506190103.6304-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Falling through to host GL stack via epoxy chrpath hack was
found to be problematic in case of SDL particularly (because it does
not actually use epoxy, and does its own dlopen()).

So let's just use the mesa-native libraries everywhere, but instruct
them to load DRI drivers from the host.

NVidia's proprietary blob users have to take care of themselves, I'm afraid.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 scripts/runqemu | 37 ++++++++++++++++++++++---------------
 1 file changed, 22 insertions(+), 15 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 310d79fdc5..7eb7a9c7b4 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -420,6 +420,23 @@ class BaseConfig(object):
             logger.error("%s not a directory valid DEPLOY_DIR_IMAGE" % deploy_dir_image)
             self.set("MACHINE", arg)
 
+    def set_dri_path(self):
+        # As runqemu can be run within bitbake (when using testimage, for example),
+        # we need to ensure that we run host pkg-config, and that it does not
+        # get mis-directed to native build paths set by bitbake.
+        try:
+            del os.environ['PKG_CONFIG_PATH']
+            del os.environ['PKG_CONFIG_DIR']
+            del os.environ['PKG_CONFIG_LIBDIR']
+            del os.environ['PKG_CONFIG_SYSROOT_DIR']
+        except KeyError:
+            pass
+        try:
+            dripath = subprocess.check_output("PATH=/bin:/usr/bin:$PATH pkg-config --variable=dridriverdir dri", shell=True)
+        except subprocess.CalledProcessError as e:
+            raise RunQemuError("Could not determine the path to dri drivers on the host via pkg-config.\nPlease install Mesa development files (particularly, dri.pc) on the host machine.")
+        os.environ['LIBGL_DRIVERS_PATH'] = dripath.decode('utf-8').strip()
+
     def check_args(self):
         for debug in ("-d", "--debug"):
             if debug in sys.argv:
@@ -440,15 +457,19 @@ class BaseConfig(object):
                 self.kernel_cmdline_script += ' console=ttyS0'
             elif arg == 'sdl':
                 if 'gl' in sys.argv[1:]:
+                    self.set_dri_path()
                     self.qemu_opt_script += ' -vga virtio -display sdl,gl=on'
                 elif 'gl-es' in sys.argv[1:]:
+                    self.set_dri_path()
                     self.qemu_opt_script += ' -vga virtio -display sdl,gl=es'
                 else:
                     self.qemu_opt_script += ' -display sdl'
             elif arg == 'gtk':
                 if 'gl' in sys.argv[1:]:
+                    self.set_dri_path()
                     self.qemu_opt_script += ' -vga virtio -display gtk,gl=on'
                 elif 'gl-es' in sys.argv[1:]:
+                    self.set_dri_path()
                     self.qemu_opt_script += ' -vga virtio -display gtk,gl=es'
                 else:
                     self.qemu_opt_script += ' -display gtk'
@@ -456,22 +477,8 @@ class BaseConfig(object):
                 # These args are handled inside sdl or gtk blocks above
                 pass
             elif arg == 'egl-headless':
+                self.set_dri_path()
                 self.qemu_opt_script += ' -vga virtio -display egl-headless'
-                # As runqemu can be run within bitbake (when using testimage, for example),
-                # we need to ensure that we run host pkg-config, and that it does not
-                # get mis-directed to native build paths set by bitbake.
-                try:
-                    del os.environ['PKG_CONFIG_PATH']
-                    del os.environ['PKG_CONFIG_DIR']
-                    del os.environ['PKG_CONFIG_LIBDIR']
-                    del os.environ['PKG_CONFIG_SYSROOT_DIR']
-                except KeyError:
-                    pass
-                try:
-                    dripath = subprocess.check_output("PATH=/bin:/usr/bin:$PATH pkg-config --variable=dridriverdir dri", shell=True)
-                except subprocess.CalledProcessError as e:
-                    raise RunQemuError("Could not determine the path to dri drivers on the host via pkg-config.\nPlease install Mesa development files (particularly, dri.pc) on the host machine.")
-                os.environ['LIBGL_DRIVERS_PATH'] = dripath.decode('utf-8').strip()
             elif arg == 'serial':
                 self.kernel_cmdline_script += ' console=ttyS0'
                 self.serialconsole = True
-- 
2.26.1

