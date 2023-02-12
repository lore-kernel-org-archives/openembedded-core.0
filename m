Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61589C05027
	for <webhook@archiver.kernel.org>; Sun, 12 Feb 2023 21:11:33 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.6.1676236287926145052
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Feb 2023 13:11:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=ynaU8BAB;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id k13so11689134plg.0
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Feb 2023 13:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=72pEbpC1kHBfsl4sLniQvvNoPWpZ/4I/F4wTdYGaWCU=;
        b=ynaU8BABHU9h8DmDuibNvUYTFoIWAkiVCI7Tnb65RuxWaVYSx4AxwKHHgIHs5dNaI+
         EhiSM3+kSxdLftnSMReQiKXq3s+01SWvLZ2UYfR7nVy3Nb1wctNtIoVGGTKQwXhfu2v8
         wCZUVxOZp+HHBeLlgfC2l1TqLblAuDpJwIft1VGA2PYInrQvvan66jHcmU5v2ZgQkQSg
         I6wqGjW0VgDwVmUE9nc9Jf6a/FGP/4TV9sY+s8zrQ0K7ysT5ajo70dNQRLGA/hB41ajX
         spKLPc91okIjr712jMxceIOCsFLQP8//agYDl+xI9USqvcsXus7BjVo8/WLV3rZzL1Ri
         kC4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=72pEbpC1kHBfsl4sLniQvvNoPWpZ/4I/F4wTdYGaWCU=;
        b=H6dMuUyQf1UQjBs0PFAkb7t0MVXPDvl3C6OLPv4ClAC3lA/1/gYApOrJNcf9oZ7urT
         zZ/sMh3XbtHj8Eydht3CE6M/v+JRq9zYE8+o/cEwyjdcgeFOkmRYfZx2hIMFvASW8GGD
         XqWTR2xW3b38YKrMH7hj/gMqrhexQ50F7fMFwmj2zYAiREiJ1TWGjqC5jNyjai+cJiTl
         EkPShjN23AGq+wLWElwrz6ssqNzNTJDdNNEvtWQhRyl9pWcoJ2FbOCXLHytDJ5RCjS0L
         XF5BlxfNMugpsx2ee8xAwtLSoCqEWJtl+Srd0adWA0rWNVWFfa0Ws2sO3XF5D4WPfldW
         e6Rg==
X-Gm-Message-State: AO0yUKVbHtotyq/4EtxN5uaivlVQvt/oyxmKMcxLhaNuldlECMTkQH23
	VtoXC5CIBfCbSLs4ldkoxKBlvUtGaqq1O1IZihY=
X-Google-Smtp-Source: AK7set8eN806SXq81aIUVzra5JvcO3ee+Ld4fLtzB+nqYMugbFFzjOBIcvG/lf6Oe46+o6PYBXmcLQ==
X-Received: by 2002:a17:903:1207:b0:196:89bc:7100 with SMTP id l7-20020a170903120700b0019689bc7100mr27388890plh.16.1676236286776;
        Sun, 12 Feb 2023 13:11:26 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id d23-20020a170902b71700b001933b4b1a49sm5675482pls.183.2023.02.12.13.11.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Feb 2023 13:11:26 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 19/27] meta: remove True option to getVar and getVarFlag calls (again)
Date: Sun, 12 Feb 2023 11:10:35 -1000
Message-Id: <de7bf6689a19dc614ce4b39c84ffd825bee1b962.1676236110.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676236110.git.steve@sakoman.com>
References: <cover.1676236110.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Feb 2023 21:11:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177062

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
(cherry picked from commit 24a86d0c55ee89ae0dc77975e1d0ee02898d2289)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/image.bbclass                  |  2 +-
 meta/classes/license_image.bbclass          |  2 +-
 meta/lib/oe/package_manager/deb/__init__.py |  8 ++++----
 meta/recipes-devtools/go/go_1.17.13.bb      |  4 ++--
 meta/recipes-devtools/rust/rust-common.inc  |  2 +-
 meta/recipes-devtools/rust/rust.inc         | 20 ++++++++++----------
 scripts/contrib/image-manifest              |  2 +-
 scripts/lib/devtool/menuconfig.py           |  2 +-
 8 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index c424c4c41d..aa14ea2316 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -440,7 +440,7 @@ python () {
         localdata.delVar('DATE')
         localdata.delVar('TMPDIR')
         localdata.delVar('IMAGE_VERSION_SUFFIX')
-        vardepsexclude = (d.getVarFlag('IMAGE_CMD:' + realt, 'vardepsexclude', True) or '').split()
+        vardepsexclude = (d.getVarFlag('IMAGE_CMD:' + realt, 'vardepsexclude') or '').split()
         for dep in vardepsexclude:
             localdata.delVar(dep)
 
diff --git a/meta/classes/license_image.bbclass b/meta/classes/license_image.bbclass
index 3213ea758e..1c06a02951 100644
--- a/meta/classes/license_image.bbclass
+++ b/meta/classes/license_image.bbclass
@@ -229,7 +229,7 @@ def get_deployed_dependencies(d):
     deploy = {}
     # Get all the dependencies for the current task (rootfs).
     taskdata = d.getVar("BB_TASKDEPDATA", False)
-    pn = d.getVar("PN", True)
+    pn = d.getVar("PN")
     depends = list(set([dep[0] for dep
                     in list(taskdata.values())
                     if not dep[0].endswith("-native") and not dep[0] == pn]))
diff --git a/meta/lib/oe/package_manager/deb/__init__.py b/meta/lib/oe/package_manager/deb/__init__.py
index 86ddb130ad..910f217b62 100644
--- a/meta/lib/oe/package_manager/deb/__init__.py
+++ b/meta/lib/oe/package_manager/deb/__init__.py
@@ -80,15 +80,15 @@ class DpkgIndexer(Indexer):
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
 
diff --git a/meta/recipes-devtools/go/go_1.17.13.bb b/meta/recipes-devtools/go/go_1.17.13.bb
index 34dc89bb0c..bb57c1c48a 100644
--- a/meta/recipes-devtools/go/go_1.17.13.bb
+++ b/meta/recipes-devtools/go/go_1.17.13.bb
@@ -11,7 +11,7 @@ export CXX_FOR_TARGET = "g++"
 # mips/rv64 doesn't support -buildmode=pie, so skip the QA checking for mips/riscv32 and its
 # variants.
 python() {
-    if 'mips' in d.getVar('TARGET_ARCH',True) or 'riscv32' in d.getVar('TARGET_ARCH',True):
-        d.appendVar('INSANE_SKIP:%s' % d.getVar('PN',True), " textrel")
+    if 'mips' in d.getVar('TARGET_ARCH') or 'riscv32' in d.getVar('TARGET_ARCH'):
+        d.appendVar('INSANE_SKIP:%s' % d.getVar('PN'), " textrel")
 }
 
diff --git a/meta/recipes-devtools/rust/rust-common.inc b/meta/recipes-devtools/rust/rust-common.inc
index ef70c48d0f..db0bd8fc1b 100644
--- a/meta/recipes-devtools/rust/rust-common.inc
+++ b/meta/recipes-devtools/rust/rust-common.inc
@@ -109,7 +109,7 @@ def llvm_features_from_target_fpu(d):
     # TARGET_FPU can be hard or soft. +soft-float tell llvm to use soft float
     # ABI. There is no option for hard.
 
-    fpu = d.getVar('TARGET_FPU', True)
+    fpu = d.getVar('TARGET_FPU')
     return ["+soft-float"] if fpu == "soft" else []
 
 def llvm_features(d):
diff --git a/meta/recipes-devtools/rust/rust.inc b/meta/recipes-devtools/rust/rust.inc
index f39228e3c0..008b2ce4a4 100644
--- a/meta/recipes-devtools/rust/rust.inc
+++ b/meta/recipes-devtools/rust/rust.inc
@@ -79,7 +79,7 @@ python do_configure() {
     config = configparser.RawConfigParser()
 
     # [target.ARCH-poky-linux]
-    target_section = "target.{}".format(d.getVar('TARGET_SYS', True))
+    target_section = "target.{}".format(d.getVar('TARGET_SYS'))
     config.add_section(target_section)
 
     llvm_config = d.expand("${YOCTO_ALTERNATE_EXE_PATH}")
@@ -90,7 +90,7 @@ python do_configure() {
 
     # If we don't do this rust-native will compile it's own llvm for BUILD.
     # [target.${BUILD_ARCH}-unknown-linux-gnu]
-    target_section = "target.{}".format(d.getVar('SNAPSHOT_BUILD_SYS', True))
+    target_section = "target.{}".format(d.getVar('SNAPSHOT_BUILD_SYS'))
     config.add_section(target_section)
 
     config.set(target_section, "llvm-config", e(llvm_config))
@@ -124,26 +124,26 @@ python do_configure() {
     config.set("build", "vendor", e(True))
 
     if not "targets" in locals():
-        targets = [d.getVar("TARGET_SYS", True)]
+        targets = [d.getVar("TARGET_SYS")]
     config.set("build", "target", e(targets))
 
     if not "hosts" in locals():
-        hosts = [d.getVar("HOST_SYS", True)]
+        hosts = [d.getVar("HOST_SYS")]
     config.set("build", "host", e(hosts))
 
     # We can't use BUILD_SYS since that is something the rust snapshot knows
     # nothing about when trying to build some stage0 tools (like fabricate)
-    config.set("build", "build", e(d.getVar("SNAPSHOT_BUILD_SYS", True)))
+    config.set("build", "build", e(d.getVar("SNAPSHOT_BUILD_SYS")))
 
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
index 95384c5333..ff9227035d 100644
--- a/scripts/lib/devtool/menuconfig.py
+++ b/scripts/lib/devtool/menuconfig.py
@@ -43,7 +43,7 @@ def menuconfig(args, config, basepath, workspace):
             return 1
 
         check_workspace_recipe(workspace, args.component)
-        pn = rd.getVar('PN', True)
+        pn = rd.getVar('PN')
 
         if not rd.getVarFlag('do_menuconfig','task'):
             raise DevtoolError("This recipe does not support menuconfig option")
-- 
2.34.1


