Return-Path: <dvhart@linux.intel.com>
Received: from mga09.intel.com (unknown [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A436F6B7CA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 May 2014 16:51:05 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 23 May 2014 09:45:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,894,1392192000"; d="scan'208";a="545621627"
Received: from fear.jf.intel.com (HELO localhost) ([10.7.201.149])
	by orsmga002.jf.intel.com with ESMTP; 23 May 2014 09:50:54 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org, Saul Wold <sgw@linux.intel.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Fri, 23 May 2014 09:57:59 -0700
Message-Id: <b3bebaeb85b2dbd47744319dbd3bcf38f452537a.1400864279.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH] linux-yocto-dev: Dynamic SRCREV update
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
X-List-Received-Date: Fri, 23 May 2014 16:51:09 -0000

The current implementation would result in the default SRCREVs being
used by the fetcher, even though the anonymous python would update them
to AUTOREV. This appears to be something to do with early parsing
bitbake black magic.

This patch ensures the default is never assigned if we are actually
building the recipe by using a function to assign it in the first place.

The USE_DEFAULT* variables are removed as they are not necessary to
allow for overriding the SRCREVs.

The anonymous python parse check is moved closer to the top of the
recipe to be a bit more logically representative of its intended
purpose.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 meta/recipes-kernel/linux/linux-yocto-dev.bb |   29 ++++++++++----------------
 1 file changed, 11 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index 5e09720..9b49eee 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -11,37 +11,30 @@
 inherit kernel
 require recipes-kernel/linux/linux-yocto.inc
 
-USE_MACHINE_AUTOREV ?= "1"
-USE_META_AUTOREV ?= "1"
-
 # provide this .inc to set specific revisions
 include recipes-kernel/linux/linux-yocto-dev-revisions.inc
 
+# Skip processing of this recipe if it is not explicitly specified as the
+# PREFERRED_PROVIDER for virtual/kernel. This avoids network access required
+# by the use of AUTOREV SRCREVs, which are the default for this recipe.
+python () {
+    if d.getVar("PREFERRED_PROVIDER_virtual/kernel", True) != "linux-yocto-dev":
+        raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-dev to enable it")
+}
+
 KBRANCH = "standard/base"
 KBRANCH_DEFAULT = "${KBRANCH}"
 KMETA = "meta"
 
-SRC_URI = "git://git.pokylinux.org/linux-yocto-dev.git;nocheckout=1;branch=${KBRANCH},${KMETA};name=machine,meta"
+SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
 # Set default SRCREVs. Both the machine and meta SRCREVs are statically set
 # to the korg v3.7 tag, and hence prevent network access during parsing. If
 # linux-yocto-dev is the preferred provider, they will be overridden to
 # AUTOREV in following anonymous python routine and resolved when the
 # variables are finalized.
-SRCREV_machine ?= "29594404d7fe73cd80eaa4ee8c43dcc53970c60e"
-SRCREV_meta ?= "29594404d7fe73cd80eaa4ee8c43dcc53970c60e"
-
-python () {
-    if d.getVar("PREFERRED_PROVIDER_virtual/kernel", True) != "linux-yocto-dev":
-        raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-dev to enable it")
-    else:
-        # if the revisions have been changed from the defaults above we leave them
-        # alone. But if the defaults are left, we change to AUTOREV.
-        if d.getVar("USE_MACHINE_AUTOREV", True) == "1":
-            d.setVar("SRCREV_machine", "${AUTOREV}")
-        if d.getVar("USE_META_AUTOREV", True) == "1":
-            d.setVar("SRCREV_meta", "${AUTOREV}")
-}
+SRCREV_machine ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
+SRCREV_meta ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 
 LINUX_VERSION ?= "3.14+"
 LINUX_VERSION_EXTENSION ?= "-yoctodev-${LINUX_KERNEL_TYPE}"
-- 
1.7.9.5


