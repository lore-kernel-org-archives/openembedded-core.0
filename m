Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 602A2C433FE
	for <webhook@archiver.kernel.org>; Fri, 21 Oct 2022 19:23:53 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web11.2158.1666380228463385928
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Oct 2022 12:23:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jnloBW0K;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-13af2d12469so4730745fac.13
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Oct 2022 12:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UNEeNMUsSH9VnUni8Y5qdkjU+lloTJJM2rp+Vj78Sdg=;
        b=jnloBW0Kot4oneIa9MICy43/fgsJIeAOF+4pT1kfVvty+I400U6LjS6RcYoVoDuxVN
         +Q9zsFlEZYAxsvh/PLYrQADOXFK0BH0mo6dcsB6YID/2FS/Rwuw70a9zK0ZCM3xgZ4ta
         cTo0zCmY+wDpbmUyrM+vK0Xm5PdioZwVgoXIBp0K6CQCtWmgVkGCPhmdTDHkSrj6GMrx
         Hg4/loQbPdNDMn0MlSQXqqKBdY8x7dkgmb2nQ6BsKtZHU95FtlTEtz4fdXn8iJ8ZFTju
         tj+v72bv96HV+YUNPknLhDBt+7dFoV5NxV8khlIn1JQWcIgsoxqeD6TL1ryWYE9ML/Gc
         l0BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UNEeNMUsSH9VnUni8Y5qdkjU+lloTJJM2rp+Vj78Sdg=;
        b=8IXC0785unvkUOu7AVnsBv8logmTDvDegJhrq9Tq0TvIg9oUxkd6DpgTvBFbE0o7u7
         J0cBg8CmyF8AVzk82HckBB3O38hZVXC4HghcN4Na4FynzXNfcYuASfIbM83RoPSjQLmo
         qB0L6jt8GTBaBe9H6zeOxB5n1i5/6ryY9rsqrvcOmpSh7IAWFsbXS059MzZ13rJy+k0v
         28roCYNceE1kdMkpTC4yj2Bo4cflrFxn9PEiqQt2p+RokPp9quMSudKq9aMXPLmtmnqR
         erkMGRJtWSSoKT3kYjauK13hjuwramUB7jkHLpHl9Nx5AQWgOBaZRsZbOH+KtDveEbXh
         g6sQ==
X-Gm-Message-State: ACrzQf21iEJvv7eXBns1jEbDcEaUjnZLZKVUOocdcrt8dIxKGd93QjpG
	IcETW6M1QjQxfheHxqx2a3uGIfk9AAg=
X-Google-Smtp-Source: AMsMyM526yXU4LBHoQ5o7aM8DJsSSZXB4spyV4xmPqHh4/MyoOkvgUSBrux+GgZugzkpvg6n8fYAyA==
X-Received: by 2002:a05:6870:9711:b0:131:d82c:f4cb with SMTP id n17-20020a056870971100b00131d82cf4cbmr30510147oaq.215.1666380227321;
        Fri, 21 Oct 2022 12:23:47 -0700 (PDT)
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id y22-20020a056870459600b0011d02a3fa63sm10697124oao.14.2022.10.21.12.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 12:23:46 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] runqemu: Do not perturb script environment
Date: Fri, 21 Oct 2022 14:23:44 -0500
Message-Id: <20221021192344.147477-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Oct 2022 19:23:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172041

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
---
 scripts/runqemu | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 189fc3da91..a6ea578564 100755
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
2.33.0


