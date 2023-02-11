Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 589A1C64EC7
	for <webhook@archiver.kernel.org>; Sat, 11 Feb 2023 21:24:37 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.19562.1676150646351225590
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Feb 2023 13:24:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=ihj3j1dd;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id ct17so124067pfb.12
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Feb 2023 13:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZjBjg2h2yYwMW+5yeXAjYRHsuyhBfeziN01QsaDXYuA=;
        b=ihj3j1dd/C+K21/WdiQxVYVbyPi02jwiZ6hYYpQsKvl/ObPZCYEjF9AA+afo9h7y4s
         GiYcQUGr4Rot3BmrIdxTQiSnVwHJmROXNXU++qf2EzimHS7wvmjnVAyf0FbfTxFd4HJV
         003rjZC/tDgRT77RTqYp2QdFLSN9tZb/qh66959HSb/nb//jP6C1JHMmDM0NISXFhnGc
         XB07a4l8fAXAhDRg3mcfCagdZDsySWXGpHQ/P/GEfnHjXcqLKbtT7YIB8W9bUp7YUWVI
         EnnbSpW3mI1MT4jWKSzYaIuXbxvHM35Zpr1/0yiVSqNet7JiUbB6I84s2sBu0hy0O3Ec
         6dBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZjBjg2h2yYwMW+5yeXAjYRHsuyhBfeziN01QsaDXYuA=;
        b=DpwigddVkWKXiNTyPaLthYZbT2eQwrmCbG3lHXK3Gwd+skR2rullk6+oFAO7MRQ9QS
         RbaLyHT7G5bU3PIcaWZyK5+hZkPoK4Y7ULu8cDLIBaWFf8HJurDyC2VluDY0EIgaF2Yu
         VzJI6VCkXchRngkzmfhp+2TJ9grn+zmWqu112KohvPvEcUr7Q2cTlxMY1IJ2BW/f4Gnh
         nYme6MZPj0qmS9k75rEm5kVObJ8A8lju2FRkQAvpp9V4N50wkBDjK3f5mYDjcKpY3U+X
         PK+KR9PtiddQOkYDopo8y32/PDctMhh3eGxeQXxGP3GvpZ+N8rMvIaTKxVhlI0D2s2xK
         s8/Q==
X-Gm-Message-State: AO0yUKXazSzRa6PYkYTXSff0JBbgCPabQ3YLYRN1rQDkAxbCgjvPc2RY
	LTnllQ6dCCFZMq39MS6tgnDPdVI+wDkF6ONxKdo=
X-Google-Smtp-Source: AK7set+Ptbv9au0Ls7G3+PzGkFmt5+ZAZ+Iw3LLbdU12pRutX4em8FCXvdlx6Ev9eIgFaZRukT8mFA==
X-Received: by 2002:aa7:9988:0:b0:5a8:4bf8:1752 with SMTP id k8-20020aa79988000000b005a84bf81752mr10425483pfh.32.1676150669418;
        Sat, 11 Feb 2023 13:24:29 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id v23-20020aa78097000000b0059393d46228sm5398595pff.144.2023.02.11.13.24.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 13:24:29 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 18/28] meta: remove True option to getVar and getVarFlag calls (again)
Date: Sat, 11 Feb 2023 11:23:41 -1000
Message-Id: <f12fcb8a3f3d11c981c223569f8f40ec705c837a.1676150527.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676150527.git.steve@sakoman.com>
References: <cover.1676150527.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Feb 2023 21:24:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177028

From: Martin Jansa <Martin.Jansa@gmail.com>

* True is default since 2016 and most layers were already updated
  not to pass this parameter where not necessary, e.g. oe-core was
  updated couple times, first in:
  https://git.openembedded.org/openembedded-core/commit/?id=7c552996597faaee2fbee185b250c0ee30ea3b5f

  Updated with the same regexp as later oe-core update:
  https://git.openembedded.org/openembedded-core/commit/?id=9f551d588693328e4d99d33be94f26684eafcaba

  with small modification to replace not only d.getVar, but also data.getVar as in e.g.:
  e.data.getVar('ERR_REPORT_USERNAME', True)

  and for getVarFlag:
  sed -e 's|\(d\.getVarFlag \?\)( \?\([^,()]*, \?[^,()]*\), \?True)|\1(\2)|g' \
      -i $(git grep -E 'getVarFlag ?\( ?([^,()]*), ?([^,()]*), ?True\)' \
          | cut -d':' -f1 \
          | sort -u)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 26c74fd10614582e177437608908eb43688ab510)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/image.bbclass             |  2 +-
 meta/classes-recipe/license_image.bbclass     |  2 +-
 .../classes-recipe/rust-target-config.bbclass |  2 +-
 meta/lib/oe/package_manager/deb/__init__.py   |  8 +++----
 meta/recipes-devtools/go/go_1.19.4.bb         |  4 ++--
 meta/recipes-devtools/rust/rust.inc           | 22 +++++++++----------
 scripts/contrib/image-manifest                |  2 +-
 scripts/lib/devtool/menuconfig.py             |  2 +-
 8 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recipe/image.bbclass
index d4bf02784a..e5e5274924 100644
--- a/meta/classes-recipe/image.bbclass
+++ b/meta/classes-recipe/image.bbclass
@@ -445,7 +445,7 @@ python () {
         localdata.delVar('DATE')
         localdata.delVar('TMPDIR')
         localdata.delVar('IMAGE_VERSION_SUFFIX')
-        vardepsexclude = (d.getVarFlag('IMAGE_CMD:' + realt, 'vardepsexclude', True) or '').split()
+        vardepsexclude = (d.getVarFlag('IMAGE_CMD:' + realt, 'vardepsexclude') or '').split()
         for dep in vardepsexclude:
             localdata.delVar(dep)
 
diff --git a/meta/classes-recipe/license_image.bbclass b/meta/classes-recipe/license_image.bbclass
index b60d6e44f4..8560c27e93 100644
--- a/meta/classes-recipe/license_image.bbclass
+++ b/meta/classes-recipe/license_image.bbclass
@@ -235,7 +235,7 @@ def get_deployed_dependencies(d):
     deploy = {}
     # Get all the dependencies for the current task (rootfs).
     taskdata = d.getVar("BB_TASKDEPDATA", False)
-    pn = d.getVar("PN", True)
+    pn = d.getVar("PN")
     depends = list(set([dep[0] for dep
                     in list(taskdata.values())
                     if not dep[0].endswith("-native") and not dep[0] == pn]))
diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classes-recipe/rust-target-config.bbclass
index 9158b1918e..876fe8fd9b 100644
--- a/meta/classes-recipe/rust-target-config.bbclass
+++ b/meta/classes-recipe/rust-target-config.bbclass
@@ -114,7 +114,7 @@ def llvm_features_from_target_fpu(d):
     # TARGET_FPU can be hard or soft. +soft-float tell llvm to use soft float
     # ABI. There is no option for hard.
 
-    fpu = d.getVar('TARGET_FPU', True)
+    fpu = d.getVar('TARGET_FPU')
     return ["+soft-float"] if fpu == "soft" else []
 
 def llvm_features(d):
diff --git a/meta/lib/oe/package_manager/deb/__init__.py b/meta/lib/oe/package_manager/deb/__init__.py
index c672454072..0c23c884c1 100644
--- a/meta/lib/oe/package_manager/deb/__init__.py
+++ b/meta/lib/oe/package_manager/deb/__init__.py
@@ -82,15 +82,15 @@ class DpkgIndexer(Indexer):
             return
 
         oe.utils.multiprocess_launch(create_index, index_cmds, self.d)
-        if self.d.getVar('PACKAGE_FEED_SIGN', True) == '1':
-            signer = get_signer(self.d, self.d.getVar('PACKAGE_FEED_GPG_BACKEND', True))
+        if self.d.getVar('PACKAGE_FEED_SIGN') == '1':
+            signer = get_signer(self.d, self.d.getVar('PACKAGE_FEED_GPG_BACKEND'))
         else:
             signer = None
         if signer:
             for f in index_sign_files:
                 signer.detach_sign(f,
-                                   self.d.getVar('PACKAGE_FEED_GPG_NAME', True),
-                                   self.d.getVar('PACKAGE_FEED_GPG_PASSPHRASE_FILE', True),
+                                   self.d.getVar('PACKAGE_FEED_GPG_NAME'),
+                                   self.d.getVar('PACKAGE_FEED_GPG_PASSPHRASE_FILE'),
                                    output_suffix="gpg",
                                    use_sha256=True)
 
diff --git a/meta/recipes-devtools/go/go_1.19.4.bb b/meta/recipes-devtools/go/go_1.19.4.bb
index 98977673ee..587ee55944 100644
--- a/meta/recipes-devtools/go/go_1.19.4.bb
+++ b/meta/recipes-devtools/go/go_1.19.4.bb
@@ -12,7 +12,7 @@ export CXX_FOR_TARGET = "g++"
 # mips/rv64 doesn't support -buildmode=pie, so skip the QA checking for mips/riscv32 and its
 # variants.
 python() {
-    if 'mips' in d.getVar('TARGET_ARCH',True) or 'riscv32' in d.getVar('TARGET_ARCH',True):
-        d.appendVar('INSANE_SKIP:%s' % d.getVar('PN',True), " textrel")
+    if 'mips' in d.getVar('TARGET_ARCH') or 'riscv32' in d.getVar('TARGET_ARCH'):
+        d.appendVar('INSANE_SKIP:%s' % d.getVar('PN'), " textrel")
 }
 
diff --git a/meta/recipes-devtools/rust/rust.inc b/meta/recipes-devtools/rust/rust.inc
index 956301023a..7d87e8e1b2 100644
--- a/meta/recipes-devtools/rust/rust.inc
+++ b/meta/recipes-devtools/rust/rust.inc
@@ -72,7 +72,7 @@ python do_configure() {
     config = configparser.RawConfigParser()
 
     # [target.ARCH-poky-linux]
-    host_section = "target.{}".format(d.getVar('RUST_HOST_SYS', True))
+    host_section = "target.{}".format(d.getVar('RUST_HOST_SYS'))
     config.add_section(host_section)
 
     llvm_config_target = d.expand("${RUST_ALTERNATE_EXE_PATH}")
@@ -87,7 +87,7 @@ python do_configure() {
 
     # If we don't do this rust-native will compile it's own llvm for BUILD.
     # [target.${BUILD_ARCH}-unknown-linux-gnu]
-    build_section = "target.{}".format(d.getVar('RUST_BUILD_SYS', True))
+    build_section = "target.{}".format(d.getVar('RUST_BUILD_SYS'))
     if build_section != host_section:
         config.add_section(build_section)
 
@@ -97,7 +97,7 @@ python do_configure() {
         config.set(build_section, "cc", e(d.expand("${RUST_BUILD_CC}")))
         config.set(build_section, "linker", e(d.expand("${RUST_BUILD_CCLD}")))
 
-    target_section = "target.{}".format(d.getVar('RUST_TARGET_SYS', True))
+    target_section = "target.{}".format(d.getVar('RUST_TARGET_SYS'))
     if target_section != host_section and target_section != build_section:
         config.add_section(target_section)
 
@@ -143,26 +143,26 @@ python do_configure() {
     config.set("build", "vendor", e(True))
 
     if not "targets" in locals():
-        targets = [d.getVar("RUST_TARGET_SYS", True)]
+        targets = [d.getVar("RUST_TARGET_SYS")]
     config.set("build", "target", e(targets))
 
     if not "hosts" in locals():
-        hosts = [d.getVar("RUST_HOST_SYS", True)]
+        hosts = [d.getVar("RUST_HOST_SYS")]
     config.set("build", "host", e(hosts))
 
     # We can't use BUILD_SYS since that is something the rust snapshot knows
     # nothing about when trying to build some stage0 tools (like fabricate)
-    config.set("build", "build", e(d.getVar("RUST_BUILD_SYS", True)))
+    config.set("build", "build", e(d.getVar("RUST_BUILD_SYS")))
 
     # [install]
     config.add_section("install")
     # ./x.py install doesn't have any notion of "destdir"
     # but we can prepend ${D} to all the directories instead
-    config.set("install", "prefix",  e(d.getVar("D", True) + d.getVar("prefix", True)))
-    config.set("install", "bindir",  e(d.getVar("D", True) + d.getVar("bindir", True)))
-    config.set("install", "libdir",  e(d.getVar("D", True) + d.getVar("libdir", True)))
-    config.set("install", "datadir", e(d.getVar("D", True) + d.getVar("datadir", True)))
-    config.set("install", "mandir",  e(d.getVar("D", True) + d.getVar("mandir", True)))
+    config.set("install", "prefix",  e(d.getVar("D") + d.getVar("prefix")))
+    config.set("install", "bindir",  e(d.getVar("D") + d.getVar("bindir")))
+    config.set("install", "libdir",  e(d.getVar("D") + d.getVar("libdir")))
+    config.set("install", "datadir", e(d.getVar("D") + d.getVar("datadir")))
+    config.set("install", "mandir",  e(d.getVar("D") + d.getVar("mandir")))
 
     with open("config.toml", "w") as f:
         f.write('changelog-seen = 2\n\n')
diff --git a/scripts/contrib/image-manifest b/scripts/contrib/image-manifest
index 3c07a73a4e..4d65a99258 100755
--- a/scripts/contrib/image-manifest
+++ b/scripts/contrib/image-manifest
@@ -392,7 +392,7 @@ def export_manifest_info(args):
                     for key in rd.getVarFlags('PACKAGECONFIG').keys():
                         if key == 'doc':
                             continue
-                        rvalues[pn]['packageconfig_opts'][key] = rd.getVarFlag('PACKAGECONFIG', key, True)
+                        rvalues[pn]['packageconfig_opts'][key] = rd.getVarFlag('PACKAGECONFIG', key)
 
                 if config['patches'] == 'yes':
                     patches = oe.recipeutils.get_recipe_patches(rd)
diff --git a/scripts/lib/devtool/menuconfig.py b/scripts/lib/devtool/menuconfig.py
index d87a01e7a9..18daef30c3 100644
--- a/scripts/lib/devtool/menuconfig.py
+++ b/scripts/lib/devtool/menuconfig.py
@@ -45,7 +45,7 @@ def menuconfig(args, config, basepath, workspace):
             return 1
 
         check_workspace_recipe(workspace, args.component)
-        pn = rd.getVar('PN', True)
+        pn = rd.getVar('PN')
 
         if not rd.getVarFlag('do_menuconfig','task'):
             raise DevtoolError("This recipe does not support menuconfig option")
-- 
2.34.1


