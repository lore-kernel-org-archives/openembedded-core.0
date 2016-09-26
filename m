Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 070C360017
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2016 21:36:01 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP; 26 Sep 2016 14:36:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,401,1470726000"; d="scan'208";a="173432946"
Received: from swold-mobl2.amr.corp.intel.com ([10.254.187.201])
	by fmsmga004.fm.intel.com with ESMTP; 26 Sep 2016 14:36:02 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Mon, 26 Sep 2016 14:36:02 -0700
Message-Id: <1474925762-11288-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] linux-yocto: Move PREFERRED_PROVIDER check to be generic
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
X-List-Received-Date: Mon, 26 Sep 2016 21:36:02 -0000

This check ensures that when the PREFERRED_PROVIDER for virtual/kernel
changes, the previous instances gets removed correctly so when the new
instance installs files into the shared area there is not an overlap of
old and new.

[YOCTO #10278]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-kernel/linux/linux-yocto-dev.bb | 9 ---------
 meta/recipes-kernel/linux/linux-yocto.inc    | 9 +++++++++
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index dbe5847..9154bb7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -14,15 +14,6 @@ require recipes-kernel/linux/linux-yocto.inc
 # provide this .inc to set specific revisions
 include recipes-kernel/linux/linux-yocto-dev-revisions.inc
 
-# Skip processing of this recipe if it is not explicitly specified as the
-# PREFERRED_PROVIDER for virtual/kernel. This avoids network access required
-# by the use of AUTOREV SRCREVs, which are the default for this recipe.
-python () {
-    if d.getVar("PREFERRED_PROVIDER_virtual/kernel", True) != "linux-yocto-dev":
-        d.delVar("BB_DONT_CACHE")
-        raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-dev to enable it")
-}
-
 KBRANCH = "standard/base"
 KMETA = "kernel-meta"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index d979662..a5595ab 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -8,6 +8,15 @@ UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+(\.\d+)*)"
 
 INC_PR = "r4"
 
+# Skip processing of this recipe if it is not explicitly specified as the
+# PREFERRED_PROVIDER for virtual/kernel. This avoids network access required
+# by the use of AUTOREV SRCREVs, which are the default for this recipe.
+python () {
+    if d.getVar("PREFERRED_PROVIDER_virtual/kernel", True) != d.getVar("PN", True):
+        d.delVar("BB_DONT_CACHE")
+        raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to %s to enable it" % (d.getVar("PN", True)))
+}
+
 DEPENDS += "xz-native bc-native"
 DEPENDS_append_aarch64 = " libgcc"
 KERNEL_CC_append_aarch64 = " ${TOOLCHAIN_OPTIONS}"
-- 
2.7.4


