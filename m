Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1PvNhG-0006C4-J4
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Mar 2011 06:37:02 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 03 Mar 2011 21:34:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.62,262,1297065600"; d="scan'208";a="716035368"
Received: from unknown (HELO localhost) ([10.255.12.133])
	by orsmga001.jf.intel.com with ESMTP; 03 Mar 2011 21:34:28 -0800
Message-Id: <6f048077181c39d34af60cce25a89c7e8adf5a34.1299216097.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1299216097.git.dvhart@linux.intel.com>
References: <cover.1299216097.git.dvhart@linux.intel.com>
Old-Date: Tue, 1 Mar 2011 14:17:55 -0800
Date: Thu, 03 Mar 2011 21:34:28 -0800
To: openembedded-core@lists.openembedded.org
From: Darren Hart <dvhart@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 1/2] module: build hostprogs for each module
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
X-List-Received-Date: Fri, 04 Mar 2011 05:37:02 -0000

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
1.7.1



