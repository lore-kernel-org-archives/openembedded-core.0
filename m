Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0BE3C4167B
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 03:02:17 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.7164.1667530930715216319
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Nov 2022 20:02:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=wOpBJkbH;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id k7so3718127pll.6
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 20:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fnX+zrvFDLh+INMVPnYX+SB6DdwMqtXkgwC7wt+VCUU=;
        b=wOpBJkbHIf0Vg1eLyDHZkdKcuAJ6X8z4L1N+uEbU7C8WpIsBStrJti4gu6cU/LECVJ
         Z9B/TWTDb7lCQaoD1upIYqDKWxBIjmNxN6PfdbIsXaQJBJ8AHpItZOJvs8Bs5KKOT3Sk
         2YdIX8yLJZMP8YqkGyCEJyPARYt03i97N/kzBRIyhzEV3aiTJvYv2whgCtOYeYB5z+5z
         dC7V42qVODBNCZBMb4EafFEbFyYMiOzqarvP9+0cWYKbrhB5/qMoWUqss9uQxYLgQ1zR
         iSXnw9mmo5kOR/HUpbNYZX8Z+941AfEX/tewAcyYTWHYANzSTz78OAxUT2BounAdt63Z
         0WRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fnX+zrvFDLh+INMVPnYX+SB6DdwMqtXkgwC7wt+VCUU=;
        b=j8cmYeszNAYt4OENMoeumjVUKWfznBS2MoblVIyi4LVlIDmxKJB5Ag42sACCADi9p1
         6zH4T0mNIkaLa4V4NTnAzJ7Mj08Y0RS4JYbSApGFNbfSy0S+gjK9nX5sx9Qhav5rMOox
         7owsZuUDmv5DC0PpI9JpPuuAYY8URa9yyInLSNVIIcE//qYBo9uwb76KoT3W8LxF490/
         GQY5b00TcqYcKaRQnQai9qPhoYIX6RDWv/OKBR1JMig0u0v2d7BPC+rGok7XHAM6/4py
         yDv2VQSqxZdztYujLipGu324Oa4LZR+Z9YLLNSWDFafrXzK5GKEFKuiSUv8NtjtKH0GZ
         AEmg==
X-Gm-Message-State: ACrzQf27n3PwvAJFgueXI/7CPqcuiyOt5RtdQLbtDBI1QcfoDuEbXOhg
	j7k8/roQ0mIQK8LHSeCD7BhgC9KbBcUE6Lbf
X-Google-Smtp-Source: AMsMyM5+k/E9s1J+FrzaM2VWG+yJ0PEJff7S6CHSYmKUUqo06n9Mwfwd21yS+FWcBnel5WAsoTafmA==
X-Received: by 2002:a17:90a:8b93:b0:20a:bd84:5182 with SMTP id z19-20020a17090a8b9300b0020abd845182mr53510092pjn.161.1667530929627;
        Thu, 03 Nov 2022 20:02:09 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id r7-20020a17090a454700b0020b7de675a4sm667902pjm.41.2022.11.03.20.02.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 20:02:09 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 26/31] runqemu: Do not perturb script environment
Date: Thu,  3 Nov 2022 17:01:01 -1000
Message-Id: <5979bef7ef1822304b21e53471746600b15e7d70.1667530733.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667530733.git.steve@sakoman.com>
References: <cover.1667530733.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Nov 2022 03:02:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172687

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
index 1525081ad5..1d63281382 100755
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
@@ -1509,7 +1511,7 @@ class BaseConfig(object):
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


