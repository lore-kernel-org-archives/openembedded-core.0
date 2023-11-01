Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3642C0018C
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 11:01:49 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.4302.1698836502749136536
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 04:01:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bczjuDr+;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-9d2c54482fbso559300766b.2
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 04:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698836501; x=1699441301; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zxrbPbfpK1eBWsLP1yeiaQ0JzzZ3oWLRU89NKUZZJQg=;
        b=bczjuDr+g1u/LnoVZbhs+nrH7L1i3qsLPCJEqdhq2oSCUX/Rdd/rkaUDJI+XTixs5M
         LC1BpeBEswVueumnozz107dU3rSlfVtyBUrlWCNSBSgRcRsi/NeZYrrYVf6Xw8GuSGCN
         cw2p3lxir78q0L5p0m3nb0rBEe5ca8PBff+EZCQB+NWtfmNso8zkrrEhaspmjc8faC/E
         KNGIPGLflnBZ1kXHFZHwxmwuKyvwLkgVcASsY4G18YpPM94Te3V0TccDcpE5wotNpOG6
         vmzHp8UYffot1uzv5w36zz2jnPsrfnOoc8zJHrSSViblUTmXL0AkkVpUbVtN45cIQ/VJ
         Up6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698836501; x=1699441301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zxrbPbfpK1eBWsLP1yeiaQ0JzzZ3oWLRU89NKUZZJQg=;
        b=EExCIZNAmmA5Iy/REf/0G8lKQM88BkHhkhY2gcCvH9aNeDe6LCvp+EfT6HHS4g8W8f
         dKD87rYeA8zXf02INXzN0CpHN5pd7WiisI2wLNRcB2BiVhAEaWM/ew8IXTieklXGJqVz
         XM2yWzGwcpw/uQXu0OlV/gUzoI5V3lIVOzp0Dre6bryeS4JDX864gaJt/c5fwJlD8umU
         Tl7f7jBLJoHm3ggGbz65O/eGzIRdbQ3TYnlKAtx5BA3RyxKCVuqTDjD+mOKDfz+ym06R
         tfmjM8d+uX/kXudc6x54qDHr5vmOEyQFEhDaBOwl49vZlma1H7hq0u8MD4qQJbRvT73o
         a+xg==
X-Gm-Message-State: AOJu0YzDed6Fst1NeQmhvQtzhw24gNVXHPmnE2ECrLoGJIdUUZClNgMu
	veGpIXOKmmBzMAzyUG6zLPQPWKZRlmg=
X-Google-Smtp-Source: AGHT+IEqW2kOgtRM9i2vq4XKCWTncU7B4p64IR7AskHtslqLvv0LVPbzatmtqqdNx6sSLEHB4ZeW4A==
X-Received: by 2002:a17:907:97ce:b0:9bf:20e0:bfe8 with SMTP id js14-20020a17090797ce00b009bf20e0bfe8mr1510975ejc.9.1698836500803;
        Wed, 01 Nov 2023 04:01:40 -0700 (PDT)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id m12-20020a17090607cc00b009c7608eb499sm2262426ejc.94.2023.11.01.04.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 04:01:40 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v8 3/8] image-combined-dbg: make this the default
Date: Wed,  1 Nov 2023 12:01:24 +0100
Message-ID: <20231101110129.647878-4-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231101110129.647878-1-adrian.freihofer@siemens.com>
References: <20231101110129.647878-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 11:01:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189902

Remove the image-combined-dbg.bbclass and make this the default
behavior for the rootfs-dbg. A rootfs-dbg with only debug symbols but
no executable binaries also causes problems with gdb, which is
probably the most common use case for the roofs-dbg. This change
simplifies and improves the user experience for a slightly larger
rootfs-dbg.

If the rootfs-dbg contains a complete copy of the rootfs, it is also
usable for booting the target device over the network. This in turn
simplifies other use cases with e.g. the use of perf on a device
booted over the network.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 .../classes-recipe/image-combined-dbg.bbclass | 15 --------
 meta/lib/oe/rootfs.py                         | 35 ++++---------------
 scripts/crosstap                              | 28 +--------------
 3 files changed, 7 insertions(+), 71 deletions(-)
 delete mode 100644 meta/classes-recipe/image-combined-dbg.bbclass

diff --git a/meta/classes-recipe/image-combined-dbg.bbclass b/meta/classes-recipe/image-combined-dbg.bbclass
deleted file mode 100644
index 729313739c1..00000000000
--- a/meta/classes-recipe/image-combined-dbg.bbclass
+++ /dev/null
@@ -1,15 +0,0 @@
-#
-# Copyright OpenEmbedded Contributors
-#
-# SPDX-License-Identifier: MIT
-#
-
-IMAGE_PREPROCESS_COMMAND:append = " combine_dbg_image"
-
-combine_dbg_image () {
-        if [ "${IMAGE_GEN_DEBUGFS}" = "1" -a -e ${IMAGE_ROOTFS}-dbg ]; then
-                # copy target files into -dbg rootfs, so it can be used for
-                # debug purposes directly
-                tar -C ${IMAGE_ROOTFS} -cf - . | tar -C ${IMAGE_ROOTFS}-dbg -xf -
-        fi
-}
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 1a48ed10b3f..a1cc28a6dd0 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -111,40 +111,17 @@ class Rootfs(object, metaclass=ABCMeta):
         if gen_debugfs != '1':
            return
 
+        rootfs_orig = self.image_rootfs + '-orig'
+
         bb.note("  Renaming the original rootfs...")
         try:
-            shutil.rmtree(self.image_rootfs + '-orig')
+            shutil.rmtree(rootfs_orig)
         except:
             pass
-        bb.utils.rename(self.image_rootfs, self.image_rootfs + '-orig')
+        bb.utils.rename(self.image_rootfs, rootfs_orig)
 
         bb.note("  Creating debug rootfs...")
-        bb.utils.mkdirhier(self.image_rootfs)
-
-        bb.note("  Copying back package database...")
-        for path in package_paths:
-            bb.utils.mkdirhier(self.image_rootfs + os.path.dirname(path))
-            if os.path.isdir(self.image_rootfs + '-orig' + path):
-                shutil.copytree(self.image_rootfs + '-orig' + path, self.image_rootfs + path, symlinks=True)
-            elif os.path.isfile(self.image_rootfs + '-orig' + path):
-                shutil.copyfile(self.image_rootfs + '-orig' + path, self.image_rootfs + path)
-
-        # Copy files located in /usr/lib/debug or /usr/src/debug
-        for dir in ["/usr/lib/debug", "/usr/src/debug"]:
-            src = self.image_rootfs + '-orig' + dir
-            if os.path.exists(src):
-                dst = self.image_rootfs + dir
-                bb.utils.mkdirhier(os.path.dirname(dst))
-                shutil.copytree(src, dst)
-
-        # Copy files with suffix '.debug' or located in '.debug' dir.
-        for root, dirs, files in os.walk(self.image_rootfs + '-orig'):
-            relative_dir = root[len(self.image_rootfs + '-orig'):]
-            for f in files:
-                if f.endswith('.debug') or '/.debug' in relative_dir:
-                    bb.utils.mkdirhier(self.image_rootfs + relative_dir)
-                    shutil.copy(os.path.join(root, f),
-                                self.image_rootfs + relative_dir)
+        shutil.copytree(rootfs_orig, self.image_rootfs, symlinks=True)
 
         bb.note("  Install complementary '*-dbg' packages...")
         self.pm.install_complementary('*-dbg')
@@ -178,7 +155,7 @@ class Rootfs(object, metaclass=ABCMeta):
         bb.utils.rename(self.image_rootfs, self.image_rootfs + '-dbg')
 
         bb.note("  Restoring original rootfs...")
-        bb.utils.rename(self.image_rootfs + '-orig', self.image_rootfs)
+        bb.utils.rename(rootfs_orig, self.image_rootfs)
 
     def _exec_shell_cmd(self, cmd):
         try:
diff --git a/scripts/crosstap b/scripts/crosstap
index 5aa72f14d44..87dac33e064 100755
--- a/scripts/crosstap
+++ b/scripts/crosstap
@@ -170,18 +170,6 @@ class BitbakeEnv(object):
         return ret
 
 class ParamDiscovery(object):
-    SYMBOLS_CHECK_MESSAGE = """
-WARNING: image '%s' does not have dbg-pkgs IMAGE_FEATURES enabled and no
-"image-combined-dbg" in inherited classes is specified. As result the image
-does not have symbols for user-land processes DWARF based probes. Consider
-adding 'dbg-pkgs' to EXTRA_IMAGE_FEATURES or adding "image-combined-dbg" to
-USER_CLASSES. I.e add this line 'USER_CLASSES += "image-combined-dbg"' to
-local.conf file.
-
-Or you may use IMAGE_GEN_DEBUGFS="1" option, and then after build you need
-recombine/unpack image and image-dbg tarballs and pass resulting dir location
-with --sysroot option.
-"""
 
     def __init__(self, image):
         self.image = image
@@ -204,8 +192,6 @@ with --sysroot option.
 
         self.staging_dir_native = None
 
-        self.image_combined_dbg = False
-
     def discover(self):
         if self.image:
             benv_image = BitbakeEnv(self.image)
@@ -248,10 +234,6 @@ with --sysroot option.
         (self.staging_dir_native
         ) = benv_systemtap.get_vars(["STAGING_DIR_NATIVE"])
 
-        if self.inherit:
-            if "image-combined-dbg" in self.inherit.split():
-                self.image_combined_dbg = True
-
     def check(self, sysroot_option):
         ret = True
         if self.image_rootfs:
@@ -280,10 +262,6 @@ with --sysroot option.
                 if "dbg-pkgs" in image_features:
                     dbg_pkgs_found = True
 
-            if not dbg_pkgs_found \
-               and not self.image_combined_dbg:
-                print(ParamDiscovery.SYMBOLS_CHECK_MESSAGE % (self.image))
-
         if not ret:
             print("")
 
@@ -310,10 +288,7 @@ with --sysroot option.
         stap.stap = self.staging_dir_native + "/usr/bin/stap"
         if not stap.sysroot:
             if self.image_rootfs:
-                if self.image_combined_dbg:
-                    stap.sysroot = self.image_rootfs + "-dbg"
-                else:
-                    stap.sysroot = self.image_rootfs
+                stap.sysroot = self.image_rootfs + "-dbg"
         stap.runtime = self.staging_dir_native + "/usr/share/systemtap/runtime"
         stap.tapset = self.staging_dir_native + "/usr/share/systemtap/tapset"
         stap.arch = self.__map_systemtap_arch()
@@ -362,7 +337,6 @@ configuration is recommended:
 # enables symbol + target binaries rootfs-dbg in workspace
 IMAGE_GEN_DEBUGFS = "1"
 IMAGE_FSTYPES_DEBUGFS = "tar.bz2"
-USER_CLASSES += "image-combined-dbg"
 
 # enables kernel debug symbols
 KERNEL_EXTRA_FEATURES:append = " features/debug/debug-kernel.scc"
-- 
2.41.0


