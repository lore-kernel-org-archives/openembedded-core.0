Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web09.234.1615417536885489038
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Mar 2021 15:05:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=n1dAZgef;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.181, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f181.google.com with SMTP id l132so18781263qke.7
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Mar 2021 15:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dzjUm+IkXOaS13uySxtlLFGpR4WxMqOEFbPRs7t67G8=;
        b=n1dAZgefNRRwaAHadFdpQQ2xF1Kvhf9dF/pgZyNdqsfj1IAD0Szs9x4Z3sFZRLpxR4
         KuNztewS15T6eClGafQUr/BGkKUXZwEcxBxgTqlDPpSfBe5jegyMuu1ea+RWwWd9/R4L
         Cxh5h1jWeeAfbD8M62yEa74hFEBKcJbTEd85G6AfRh2KNs0unegujswfNRhLa6s1RBYj
         wrrkClCyskIV8nmnL/JqKallMsYKdNuzPEGq/yYx1rKLOU1ZdCforkCiVEgI45qAV/rv
         Rsn7evBIioruZ+xvDkss8rZNFCRC8Dvk5k+qG+SH23KipCCdZDXoYD2yaIp2n/3/1ZQ8
         MuWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dzjUm+IkXOaS13uySxtlLFGpR4WxMqOEFbPRs7t67G8=;
        b=EmTIbs9h7L6yY1iVEd/CC6UGkZiFTLH9mm6G+kTB7hh5HF1ed2ahMnFyfIMZ2L8PB9
         OTiipQ0CGuPqPYPYhAnEWBWmQzizroEfNQvmXSSingiAn31JwClRShePkLt1rXoTiArs
         7Iijr5JdGVXwBdaTUhy/i0T6XhwgN8/qMf6GnnonAHXkGqjKymlbIuVfM9oX7ALOs1x8
         HfA82AepV8109dREFcFvlKhYZEPuBZv2I8UkE+dRqb+U5EASP3g1KPE47hk5e/8WQqlm
         ujIl0zbFwdKR0TH3NfmR9z4jFpCXTvsVCIY7qaVDkdY0NgeegjcUIFQKvIjK5CMzVFRJ
         tq5w==
X-Gm-Message-State: AOAM532rr7GUvaZj3Z7Eiq+wazQIOekaBGjApaLRICt6bXFW+qo0KrtR
	FS0zZHs83h0y6Fxm5kHeM77m3RskXHPq+w==
X-Google-Smtp-Source: ABdhPJx2lemt2gECWC9Hb6hjEaTZtOZ0s3AgARj927mFkaszJvx6Wo7ilp7gTmzTLbRgzEu8kjgNig==
X-Received: by 2002:a37:b2c6:: with SMTP id b189mr5188774qkf.30.1615417535831;
        Wed, 10 Mar 2021 15:05:35 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([2605:a601:a62f:6d00:81d0:be77:cd9:faa8])
        by smtp.gmail.com with ESMTPSA id f5sm522607qtj.63.2021.03.10.15.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 15:05:35 -0800 (PST)
From: "Jon Mason" <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Cc: Jon Mason <jon.mason@arm.com>
Subject: [PATCH 3/3] runqemu: modify novga to conform to documentation
Date: Wed, 10 Mar 2021 18:05:33 -0500
Message-Id: <20210310230533.30268-3-jdmason@kudzu.us>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210310230533.30268-1-jdmason@kudzu.us>
References: <20210310230533.30268-1-jdmason@kudzu.us>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Passing 'novga' only adds '-vga none' to the qemu commandline and does
not prevent other vga devices from being added, contrary to the
documentation/help.  Clean-up the vga logic and add the ability to
prevent other vga devices from being added.

Signed-off-by: Jon Mason <jon.mason@arm.com>
Change-Id: I7ff8f9f3e419ce8bae3f3847d75f9275ca30406a
---
 scripts/runqemu | 86 +++++++++++++++++++++++++++++++------------------
 1 file changed, 55 insertions(+), 31 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 842509eb145f..df4ee21d5316 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -174,6 +174,13 @@ class BaseConfig(object):
         self.nfs_running = False
         self.serialconsole = False
         self.serialstdio = False
+        self.nographic = False
+        self.sdl = False
+        self.gtk = False
+        self.gl = False
+        self.gl_es = False
+        self.egl_headless = False
+        self.novga = False
         self.cleantap = False
         self.saved_stty = ''
         self.audio_enabled = False
@@ -460,38 +467,19 @@ class BaseConfig(object):
             if arg in self.fstypes + self.vmtypes + self.wictypes:
                 self.check_arg_fstype(arg)
             elif arg == 'nographic':
-                if ('sdl' in sys.argv):
-                    raise RunQemuError('Option nographic makes no sense alongside the sdl option.' % (arg))
-                if ('gtk' in sys.argv):
-                    raise RunQemuError('Option nographic makes no sense alongside the gtk option.' % (arg))
-                self.qemu_opt_script += ' -nographic'
+                self.nographic = True
             elif arg == 'sdl':
-                if 'gl' in sys.argv[1:]:
-                    self.set_dri_path()
-                    self.qemu_opt_script += ' -vga virtio -display sdl,gl=on,show-cursor=on'
-                elif 'gl-es' in sys.argv[1:]:
-                    self.set_dri_path()
-                    self.qemu_opt_script += ' -vga virtio -display sdl,gl=es,show-cursor=on'
-                else:
-                    self.qemu_opt_script += ' -display sdl,show-cursor=on'
+                self.sdl = True
             elif arg == 'gtk':
-                if 'gl' in sys.argv[1:]:
-                    self.set_dri_path()
-                    self.qemu_opt_script += ' -vga virtio -display gtk,gl=on,show-cursor=on'
-                elif 'gl-es' in sys.argv[1:]:
-                    self.set_dri_path()
-                    self.qemu_opt_script += ' -vga virtio -display gtk,gl=es,show-cursor=on'
-                else:
-                    self.qemu_opt_script += ' -display gtk,show-cursor=on'
-            elif arg == 'gl' or arg == 'gl-es':
-                # These args are handled inside sdl or gtk blocks above
-                if ('gtk' not in sys.argv) and ('sdl' not in sys.argv):
-                    raise RunQemuError('Option %s also needs gtk or sdl option.' % (arg))
+                self.gtk = True
+            elif arg == 'gl':
+                self.gl = True
+            elif 'gl-es' in sys.argv[1:]:
+                self.gl_es = True
             elif arg == 'egl-headless':
-                self.set_dri_path()
-                self.qemu_opt_script += ' -vga virtio -display egl-headless,show-cursor=on'
+                self.egl_headless = True
             elif arg == 'novga':
-                self.qemu_opt_script += ' -vga none'
+                self.novga = True
             elif arg == 'serial':
                 self.serialconsole = True
             elif arg == "serialstdio":
@@ -1319,13 +1307,48 @@ class BaseConfig(object):
             raise RunQemuError("Failed to boot, QB_SYSTEM_NAME is NULL!")
         self.qemu_system = qemu_system
 
+    def setup_vga(self):
+        if self.nographic == True:
+            if self.sdl == True:
+                raise RunQemuError('Option nographic makes no sense alongside the sdl option.')
+            if self.gtk == True:
+                raise RunQemuError('Option nographic makes no sense alongside the gtk option.')
+            self.qemu_opt += ' -nographic'
+            return
+
+        if self.novga == True:
+            self.qemu_opt += ' -vga none'
+            return
+
+        if (self.gl_es == True or self.gl == True) and (self.sdl == False and self.gtk == False):
+            raise RunQemuError('Option gl/gl-es needs gtk or sdl option.')
+
+        if self.sdl == True or self.gtk == True or self.egl_headless == True:
+            self.set_dri_path()
+            self.qemu_opt += ' -vga virtio -display '
+            if self.egl_headless == True:
+                self.qemu_opt += 'egl-headless,'
+            else:
+                if self.sdl == True:
+                    self.qemu_opt += 'sdl,'
+                elif self.gtk == True:
+                    self.qemu_opt += 'gtk,'
+
+                if self.gl == True:
+                    self.qemu_opt += 'gl=on,'
+                elif self.gl_es == True:
+                    self.qemu_opt += 'gl=es,'
+            self.qemu_opt += 'show-cursor=on'
+
+        self.qemu_opt += ' %s' %self.get('QB_GRAPHICS')
+
     def setup_serial(self):
         # Setup correct kernel command line for serial
-        if self.serialstdio == True or self.serialconsole == True or re.search("-nographic", self.qemu_opt) or self.tcpserial_portnum:
+        if self.serialstdio == True or self.serialconsole == True or self.nographic == True or self.tcpserial_portnum:
             for entry in self.get('SERIAL_CONSOLES').split(' '):
                 self.kernel_cmdline_script += ' console=%s' %entry.split(';')[1]
 
-        if self.serialstdio == True or re.search("-nographic", self.qemu_opt):
+        if self.serialstdio == True or self.nographic == True:
             self.qemu_opt += " -serial mon:stdio"
         else:
             self.qemu_opt += " -serial mon:vc"
@@ -1364,7 +1387,7 @@ class BaseConfig(object):
         if not os.access(qemu_bin, os.X_OK):
             raise OEPathError("No QEMU binary '%s' could be found" % qemu_bin)
 
-        self.qemu_opt = "%s %s %s %s %s %s" % (qemu_bin, self.get('NETWORK_CMD'), self.get('QB_RNG'), self.get('QB_GRAPHICS'), self.get('ROOTFS_OPTIONS'), self.get('QB_OPT_APPEND'))
+        self.qemu_opt = "%s %s %s %s %s" % (qemu_bin, self.get('NETWORK_CMD'), self.get('QB_RNG'), self.get('ROOTFS_OPTIONS'), self.get('QB_OPT_APPEND'))
 
         for ovmf in self.ovmf_bios:
             format = ovmf.rsplit('.', 1)[-1]
@@ -1389,6 +1412,7 @@ class BaseConfig(object):
             self.qemu_opt += " -snapshot"
 
         self.setup_serial()
+        self.setup_vga()
 
     def start_qemu(self):
         import shlex
-- 
2.20.1

