Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QkABe-0008Se-7D
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jul 2011 09:30:18 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 22 Jul 2011 00:26:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,246,1309762800"; d="scan'208";a="31084133"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.1])
	by fmsmga002.fm.intel.com with ESMTP; 22 Jul 2011 00:26:07 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jul 2011 00:25:51 -0700
Message-Id: <3a4362125ebecf0d71a0e68e173198e291c0d01e.1311318447.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311318447.git.sgw@linux.intel.com>
References: <cover.1311318447.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311318447.git.sgw@linux.intel.com>
References: <cover.1311318447.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 03/16] kernel: copy defconfig to {B} vs {S}
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
X-List-Received-Date: Fri, 22 Jul 2011 07:30:18 -0000

From: Bruce Ashfield <bruce.ashfield@windriver.com>

For kernel's that use a split source/object build the copy
of defconfig to {S} in the base kernel class is problematic.
The previous solution for this was to override the do_configure
of the base kernel class in a subclass. While this is still
a viable/valid option, it does mean that changes to the base
do_configure will be missed.

The solution to this is to copy a defconfig to {B} which is
typically the same as {S}, so most kernel recipes won't see or
care about this change.

With this change in place, linux-yocto.bbclass can drop its
override of do_configure.

Tested with linux-yocto and oe linux recipes.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass |    6 ------
 meta/classes/kernel.bbclass       |    4 ++--
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 98272fc..a374df1 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -118,12 +118,6 @@ python do_kernel_configcheck() {
     bb.plain( "%s" % result )
 }
 
-# overrides the base kernel_do_configure, since we don't want all the
-# defconfig processing in there
-kernel_do_configure() {
-        yes '' | oe_runmake oldconfig
-}
-
 
 # Ensure that the branches (BSP and meta) are on the locatios specified by
 # their SRCREV values. If they are NOT on the right commits, the branches
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 2e36e86..9c492a3 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -181,8 +181,8 @@ sysroot_stage_all_append() {
 kernel_do_configure() {
 	# Copy defconfig to .config if .config does not exist. This allows
 	# recipes to manage the .config themselves in do_configure_prepend().
-	if [ -f "${WORKDIR}/defconfig" ] && [ ! -f "${S}/.config" ]; then
-		cp "${WORKDIR}/defconfig" "${S}/.config"
+	if [ -f "${WORKDIR}/defconfig" ] && [ ! -f "${B}/.config" ]; then
+		cp "${WORKDIR}/defconfig" "${B}/.config"
 	fi
 	yes '' | oe_runmake oldconfig
 
-- 
1.7.3.4



