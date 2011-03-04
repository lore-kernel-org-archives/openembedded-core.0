Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Pvav1-0006Ex-MO
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Mar 2011 20:44:07 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 04 Mar 2011 11:42:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.62,265,1297065600"; d="scan'208";a="663968528"
Received: from unknown (HELO localhost) ([10.255.12.102])
	by fmsmga002.fm.intel.com with ESMTP; 04 Mar 2011 11:42:12 -0800
Message-Id: <e807fc977770cb64a217768672c18437ea8f3057.1299267630.git.sgw@linux.intel.com>
In-Reply-To: <cover.1299267630.git.sgw@linux.intel.com>
References: <cover.1299267630.git.sgw@linux.intel.com>
Old-Date: Tue, 1 Mar 2011 14:17:55 -0800
Date: Fri, 04 Mar 2011 11:42:12 -0800
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 04/13] module: build hostprogs for each module
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 04 Mar 2011 19:44:08 -0000

From: Darren Hart <dvhart@linux.intel.com>

This fixes [BUGID #241]

The kernel hostprogs are built for the host architecture. They should not be
deployed to the target, and they should not be included in an sstate package
which might get reused on a host of a different architecture.

As we don't build many out-of-tree modules, this patch takes the approach of
building the hostprogs as part of the module compile process with a
do_compile_prepend() routine in module.bbclass.

We don't have to clean the hostprogs as modules depend on the kernel being
populate_staging, so its done with the staging directory by the time we run.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
CC: Gary Thomas <gary@mlbassoc.com>
---
 meta/classes/module.bbclass |   12 +++++++++++-
 1 files changed, 11 insertions(+), 1 deletions(-)

diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass
index d16d462..bbceaf7 100644
--- a/meta/classes/module.bbclass
+++ b/meta/classes/module.bbclass
@@ -3,6 +3,13 @@ DEPENDS += "virtual/kernel"
 
 inherit module-base
 
+# Ensure the hostprogs are available for module compilation
+module_do_compile_prepend() {
+	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS 
+	oe_runmake CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" \
+	           -C ${STAGING_KERNEL_DIR} scripts
+}
+
 module_do_compile() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
 	oe_runmake KERNEL_PATH=${STAGING_KERNEL_DIR}   \
@@ -15,7 +22,10 @@ module_do_compile() {
 
 module_do_install() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
-	oe_runmake DEPMOD=echo INSTALL_MOD_PATH="${D}" CC="${KERNEL_CC}" LD="${KERNEL_LD}" modules_install
+	oe_runmake DEPMOD=echo INSTALL_MOD_PATH="${D}" \
+	           KERNEL_SRC=${STAGING_KERNEL_DIR} \
+	           CC="${KERNEL_CC}" LD="${KERNEL_LD}" \
+	           modules_install
 }
 
 pkg_postinst_append () {
-- 
1.7.1.1



