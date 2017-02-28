Return-Path: <california.l.sullivan@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id AB46665CC6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 01:02:50 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Feb 2017 17:02:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,216,1484035200"; d="scan'208";a="53702396"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga002.jf.intel.com with ESMTP; 27 Feb 2017 17:02:51 -0800
From: California Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Feb 2017 17:02:43 -0800
Message-Id: <1488243763-1757-1-git-send-email-california.l.sullivan@intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1486684537-17517-1-git-send-email-california.l.sullivan@intel.com>
References: <1486684537-17517-1-git-send-email-california.l.sullivan@intel.com>
Cc: saul.wold@intel.com
Subject: [PATCH v3 1/1] kernel.bbclass: Give sanity check function an opt-out variable
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
X-List-Received-Date: Tue, 28 Feb 2017 01:02:51 -0000

Having no opt-out method and adding the task to linux-yocto.inc was
causing issues. For example, linux-yocto-dev would often fail because
it uses AUTOREV with no way to dynamically change the PV.

Add a variable to turn off the sanity check, allowing an easy opt out,
and set the opt-out variable in linux-yocto-dev, fixing the issue with
AUTOREV.

v2 changes:
 * Update commit message, removing typos and highlighting the patch will
   effect all kernels.

v3 changes:
 * It was decided the change was too invasive, so move function back to
   linux-yocto.inc so that what it doesn't affect all kernels. Remove
   note about effecting all kernels.

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
---
 meta/classes/kernel.bbclass                  | 6 +++++-
 meta/recipes-kernel/linux/linux-yocto-dev.bb | 1 +
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 97cba92..1fa33e2 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -325,6 +325,10 @@ do_install[prefuncs] += "package_get_auto_pr"
 
 # Must be ran no earlier than after do_kernel_checkout or else Makefile won't be in ${S}/Makefile
 do_kernel_version_sanity_check() {
+	if [ "x${KERNEL_VERSION_SANITY_SKIP}" = "x1" ]; then
+		exit 0
+	fi
+
 	# The Makefile determines the kernel version shown at runtime
 	# Don't use KERNEL_VERSION because the headers it grabs the version from aren't generated until do_compile
 	VERSION=$(grep "^VERSION =" ${S}/Makefile | sed s/.*=\ *//)
@@ -348,7 +352,7 @@ do_kernel_version_sanity_check() {
 	reg="${reg}${EXTRAVERSION}"
 
 	if [ -z `echo ${PV} | grep -E "${reg}"` ]; then
-		bbfatal "Package Version (${PV}) does not match of kernel being built (${vers}). Please update the PV variable to match the kernel source."
+		bbfatal "Package Version (${PV}) does not match of kernel being built (${vers}). Please update the PV variable to match the kernel source or set KERNEL_VERSION_SANITY_SKIP=\"1\" in your recipe."
 	fi
 	exit 0
 }
diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index a4e02db..d5579b2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -43,3 +43,4 @@ KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc"
 KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
 
+KERNEL_VERSION_SANITY_SKIP = "1"
-- 
2.5.5


