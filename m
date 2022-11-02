Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E54A4C433FE
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 02:43:01 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web09.1962.1667356978809709232
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 19:42:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=fXTYwxD+;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id y13so15190589pfp.7
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 19:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g0Tp5J7jLn1xY+/g437xXHA2BsXvB8wll9TLtvE0VcU=;
        b=fXTYwxD+VGDGM5vBIuDW+G2qUr4k8uLqwk705GrHVBDZTnbNUAqUtgiyfvd4ix2bPe
         yl6jRcxqnApDrLMtAp+flv9LUFi+TjoeHiq2SEUT2p31JLFNt53IswxebYo8e19L4PFM
         Av20DXu81qlrTmuMc1xFiE61XgRXx4bXhWOBnbCZMSYgoRiKiGlUMoHLGKlMI7nA0THq
         IOy7FCDpYmAPK00UdXkfPnWRUuAylDHaU35oB231ujlNN369kCJlNkifSpxiSF1YJac0
         8ybEKwBbErUSfz1HQBdOmaWOSk3/BgNo0lLGYI3QMTNvlYkSZwXpyMi32h6XEKzRQBfz
         QqXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g0Tp5J7jLn1xY+/g437xXHA2BsXvB8wll9TLtvE0VcU=;
        b=HeM0sBZqrF6i7UDYBx+z1b20MT4WeJRVqQ1NOKAyqKYwr6rFJ9iBV/yEnnDYL9WR8H
         jgETjnuDIRMm70HMrIRw0piys/HtHsREL1JuMbpQfQz87MjLzUKtfsqrXDSv3hY4PIro
         VvyJKzy7XS0n6VN6nRTMTTQJSmmzK9BQoQMUF5ynlr9RHLWwmJqFJ1N5linCIgc8Jx1P
         qnCee/caQa5T+qyJ+eMXX4eyKn4NdTLND+29VFe8ie2Gla+NZKO1rmLig59KQSav9Xxv
         LpcSXI5P8GlkvDgjkvNtWXDN8QFiB82HPVGuptdkDrKG9HQ1F6JcWaNbJUfW4Y92Ryjz
         mPzg==
X-Gm-Message-State: ACrzQf2MVlPz4siJ81CAGJdnK6Y2+E9KkUGY3eaQIBMfaZaa06U5uDIe
	HB3B501eNKT2Kb+mgcmMdcbMtEIC5pr074K4
X-Google-Smtp-Source: AMsMyM7iupN9A3T6k6bKtHfUzjPOfdyl7bfDTk5oRs/P7etnDPTGQKx+/WxWEg5fbJkXbZ5wNIScHw==
X-Received: by 2002:a05:6a00:16c1:b0:563:177f:99ee with SMTP id l1-20020a056a0016c100b00563177f99eemr23060405pfc.7.1667356977783;
        Tue, 01 Nov 2022 19:42:57 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id d18-20020a170902e15200b00186da904da0sm1462846pla.154.2022.11.01.19.42.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 19:42:57 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 17/20] runqemu: Do not perturb script environment
Date: Tue,  1 Nov 2022 16:42:07 -1000
Message-Id: <91c2449d4e873b2cec8777d71e218a12f899669d.1667356805.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667356805.git.steve@sakoman.com>
References: <cover.1667356805.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 02:43:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172557

From: Joshua Watt <JPEWhacker@gmail.com>

Instead of changing the script environment to affect the child
processes, make a copy of the environment with modifications and pass
that to subprocess.

Specifically, when dri rendering is enabled, LD_PRELOAD was being passed
to all processes created by the script which resulted in other commands
(e.g. stty) exiting with a failure like:

 /bin/sh: symbol lookup error: sysroots-uninative/x86_64-linux/lib/librt.so.1: undefined symbol: __libc_unwind_link_get, version GLIBC_PRIVATE

Making a copy of the environment fixes this because the LD_PRELOAD is
now only passed to qemu itself.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 2232599d330bd5f2a9e206b490196569ad855de8)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/runqemu | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 983f7514c7..5daf492bac 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -210,6 +210,7 @@ class BaseConfig(object):
         self.mac_tap = "52:54:00:12:34:"
         self.mac_slirp = "52:54:00:12:35:"
         # pid of the actual qemu process
+        self.qemu_environ = os.environ.copy()
         self.qemupid = None
         # avoid cleanup twice
         self.cleaned = False
@@ -449,18 +450,19 @@ class BaseConfig(object):
         # As runqemu can be run within bitbake (when using testimage, for example),
         # we need to ensure that we run host pkg-config, and that it does not
         # get mis-directed to native build paths set by bitbake.
+        env = os.environ.copy()
         try:
-            del os.environ['PKG_CONFIG_PATH']
-            del os.environ['PKG_CONFIG_DIR']
-            del os.environ['PKG_CONFIG_LIBDIR']
-            del os.environ['PKG_CONFIG_SYSROOT_DIR']
+            del env['PKG_CONFIG_PATH']
+            del env['PKG_CONFIG_DIR']
+            del env['PKG_CONFIG_LIBDIR']
+            del env['PKG_CONFIG_SYSROOT_DIR']
         except KeyError:
             pass
         try:
-            dripath = subprocess.check_output("PATH=/bin:/usr/bin:$PATH pkg-config --variable=dridriverdir dri", shell=True)
+            dripath = subprocess.check_output("PATH=/bin:/usr/bin:$PATH pkg-config --variable=dridriverdir dri", shell=True, env=env)
         except subprocess.CalledProcessError as e:
             raise RunQemuError("Could not determine the path to dri drivers on the host via pkg-config.\nPlease install Mesa development files (particularly, dri.pc) on the host machine.")
-        os.environ['LIBGL_DRIVERS_PATH'] = dripath.decode('utf-8').strip()
+        self.qemu_environ['LIBGL_DRIVERS_PATH'] = dripath.decode('utf-8').strip()
 
         # This preloads uninative libc pieces and therefore ensures that RPATH/RUNPATH
         # in host mesa drivers doesn't trick uninative into loading host libc.
@@ -468,7 +470,7 @@ class BaseConfig(object):
         uninative_path = os.path.dirname(self.get("UNINATIVE_LOADER"))
         if os.path.exists(uninative_path):
             preload_paths = [os.path.join(uninative_path, i) for i in preload_items]
-            os.environ['LD_PRELOAD'] = " ".join(preload_paths)
+            self.qemu_environ['LD_PRELOAD'] = " ".join(preload_paths)
 
     def check_args(self):
         for debug in ("-d", "--debug"):
@@ -482,8 +484,8 @@ class BaseConfig(object):
                 sys.argv.remove(quiet)
 
         if 'gl' not in sys.argv[1:] and 'gl-es' not in sys.argv[1:]:
-            os.environ['SDL_RENDER_DRIVER'] = 'software'
-            os.environ['SDL_FRAMEBUFFER_ACCELERATION'] = 'false'
+            self.qemu_environ['SDL_RENDER_DRIVER'] = 'software'
+            self.qemu_environ['SDL_FRAMEBUFFER_ACCELERATION'] = 'false'
 
         unknown_arg = ""
         for arg in sys.argv[1:]:
@@ -1369,7 +1371,7 @@ class BaseConfig(object):
         # need our font setup and show-cusor below so we need to see what qemu --help says
         # is supported so we can pass our correct config in.
         if not self.nographic and not self.sdl and not self.gtk and not self.publicvnc and not self.egl_headless == True:
-            output = subprocess.check_output([self.qemu_bin, "--help"], universal_newlines=True)
+            output = subprocess.check_output([self.qemu_bin, "--help"], universal_newlines=True, env=self.qemu_environ)
             if "-display gtk" in output:
                 self.gtk = True
             elif "-display sdl" in output:
@@ -1393,7 +1395,7 @@ class BaseConfig(object):
                 if self.sdl == True:
                     self.qemu_opt += 'sdl,'
                 elif self.gtk == True:
-                    os.environ['FONTCONFIG_PATH'] = '/etc/fonts'
+                    self.qemu_environ['FONTCONFIG_PATH'] = '/etc/fonts'
                     self.qemu_opt += 'gtk,'
 
                 if self.gl == True:
@@ -1514,7 +1516,7 @@ class BaseConfig(object):
         if len(self.portlocks):
             for descriptor in self.portlocks.values():
                 pass_fds.append(descriptor.fileno())
-        process = subprocess.Popen(cmds, stderr=subprocess.PIPE, pass_fds=pass_fds)
+        process = subprocess.Popen(cmds, stderr=subprocess.PIPE, pass_fds=pass_fds, env=self.qemu_environ)
         self.qemupid = process.pid
         retcode = process.wait()
         if retcode:
-- 
2.25.1


