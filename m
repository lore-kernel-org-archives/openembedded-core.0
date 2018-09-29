Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9A6537998B
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Sep 2018 07:12:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w8T7C93w016729
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Sep 2018 00:12:19 -0700
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.408.0; Sat, 29 Sep 2018 00:11:58 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 29 Sep 2018 15:23:10 +0800
Message-ID: <430a712a163518acce156e652838fa01c09e7940.1538205765.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1538205765.git.liezhi.yang@windriver.com>
References: <cover.1538205765.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] multilib: avoid expanding grub and grub-efi to multilib
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 29 Sep 2018 07:12:28 -0000
Content-Type: text/plain

It doesn't make much sense to expand them to multilib, and there is an error on
qemuarm64 since grub-efi supports arm64, but doesn't support armv7a or armv7ve:

* Fixed:
  MACHINE = "qemuarm64"
  require conf/multilib.conf
  MULTILIBS = "multilib:lib32"
  DEFAULTTUNE_virtclass-multilib-lib32 = "armv7a"
  MACHINE_FEATURES_append = " efi"

  $ bitbake lib32-core-image-minimal

Also introduced a variable NON_MULTILIB_RECIPES in multilib.conf, so that we
can easily add other recipes, such as syslinux if needed.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/multilib.bbclass        | 8 ++++++--
 meta/classes/multilib_global.bbclass | 5 ++++-
 meta/conf/multilib.conf              | 4 ++++
 3 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index e7b717e..8fa5b40 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -11,8 +11,12 @@ python multilib_virtclass_handler () {
     # There should only be one kernel in multilib configs
     # We also skip multilib setup for module packages.
     provides = (e.data.getVar("PROVIDES") or "").split()
-    if "virtual/kernel" in provides or bb.data.inherits_class('module-base', e.data) or "make-mod-scripts" in e.data.getVar("PN"):
-        raise bb.parse.SkipRecipe("We shouldn't have multilib variants for the kernel")
+    non_ml_recipes = d.getVar('NON_MULTILIB_RECIPES').split()
+    bpn = e.data.getVar("BPN")
+    if "virtual/kernel" in provides or \
+            bb.data.inherits_class('module-base', e.data) or \
+            bpn in non_ml_recipes:
+        raise bb.parse.SkipRecipe("We shouldn't have multilib variants for %s" % bpn)
 
     save_var_name=e.data.getVar("MULTILIB_SAVE_VARNAME") or ""
     for name in save_var_name.split():
diff --git a/meta/classes/multilib_global.bbclass b/meta/classes/multilib_global.bbclass
index 1bb6242..649cc09 100644
--- a/meta/classes/multilib_global.bbclass
+++ b/meta/classes/multilib_global.bbclass
@@ -164,8 +164,11 @@ python multilib_virtclass_handler_global () {
     if variant:
         return
 
+    non_ml_recipes = d.getVar('NON_MULTILIB_RECIPES').split()
+
     if bb.data.inherits_class('kernel', e.data) or \
-            bb.data.inherits_class('module-base', e.data):
+            bb.data.inherits_class('module-base', e.data) or \
+            d.getVar('BPN') in non_ml_recipes:
             variants = (e.data.getVar("MULTILIB_VARIANTS") or "").split()
 
             import oe.classextend
diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
index e74dec8..65a28dd 100644
--- a/meta/conf/multilib.conf
+++ b/meta/conf/multilib.conf
@@ -26,3 +26,7 @@ OPKG_ARGS_append = " --force-maintainer --force-overwrite"
 PKG_CONFIG_PATH .= ":${WORKDIR}/recipe-sysroot/${datadir}/pkgconfig"
 PKG_CONFIG_PATH[vardepsexclude] = "datadir WORKDIR"
 PKG_CONFIG_PATH[vardepvalueexclude] = ":${WORKDIR}/recipe-sysroot/${datadir}/pkgconfig"
+
+# These recipes don't need multilib variants, the ${BPN} PROVDES/RPROVDES
+# ${MLPREFIX}${BPN}
+NON_MULTILIB_RECIPES = "grub grub-efi make-mod-scripts"
-- 
2.7.4


