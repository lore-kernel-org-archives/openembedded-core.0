Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1Rppsg-0008Cn-Jy
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jan 2012 00:34:27 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 24 Jan 2012 15:26:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="59668889"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.14.34])
	by AZSMGA002.ch.intel.com with ESMTP; 24 Jan 2012 15:26:38 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Jan 2012 15:26:34 -0800
Message-Id: <f7bd8523525f541676e8b2e416a4960b45cd7d7e.1327447344.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1327447344.git.josh@linux.intel.com>
References: <cover.1327447344.git.josh@linux.intel.com>
In-Reply-To: <cover.1327447344.git.josh@linux.intel.com>
References: <cover.1327447344.git.josh@linux.intel.com>
Subject: [PATCH 2/4] linux-tools: don't build perf when GPLv3 in INCOMPATIBLE_LICENSE
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
X-List-Received-Date: Tue, 24 Jan 2012 23:34:27 -0000

As binutils is required by perf to build and is GPLv3 licensed adding
GPLv3 to INCOMPATIBLE_LICENSE will cause linux-yocto to be skipped.

Long term we should look at moving perf to a separate recipe but as a
short term solution this patch will ensure that when GPLv3 is in
INCOMPATIBLE_LICENSE perf is not built and it's dependencies are not
added to build.

Fixes [YOCTO #1880]

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 meta/recipes-kernel/linux/linux-tools.inc       |   20 ++++++++++++++++++--
 meta/recipes-kernel/linux/linux-yocto_2.6.37.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.0.bb    |    2 +-
 3 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-tools.inc b/meta/recipes-kernel/linux/linux-tools.inc
index aa45dba..69e68c0 100644
--- a/meta/recipes-kernel/linux/linux-tools.inc
+++ b/meta/recipes-kernel/linux/linux-tools.inc
@@ -1,5 +1,18 @@
 # included by kernel recipes if they want to build/provide
 # perf functionality from their tree.
+
+# perf requires binutils which is GPLv3 licensed, don't prevent the entire kernel
+# being built if GPLv3 is in INCOMPATIBLE_LICENSE
+python () {
+    d.setVar("BUILDPERF", "yes")
+    d.setVar("PERFDEPENDS", "virtual/${MLPREFIX}libc:do_populate_sysroot ${MLPREFIX}elfutils:do_populate_sysroot ${MLPREFIX}binutils:do_populate_sysroot")
+
+    if ((d.getVar("INCOMPATIBLE_LICENSE", True) or "").find("GPLv3") != -1):
+       # GPLv3, drop perf
+       d.setVar("BUILDPERF", "no")
+       d.setVar("PERFDEPENDS", "")
+}
+
 do_compile_perf_libc-uclibc () {
 	:
 }
@@ -7,11 +20,15 @@ do_install_perf_libc-uclibc () {
 	:
 }
 do_compile_perf() {
+    if [ "${BUILDPERF}" = "yes" ]; then
 	oe_runmake -C ${S}/tools/perf CC="${CC}" LD="${LD}" prefix=${prefix} NO_NEWT=1 NO_DWARF=1
+    fi
 }
 
 fakeroot do_install_perf() {
+    if [ "${BUILDPERF}" = "yes" ]; then
 	oe_runmake -C ${S}/tools/perf CC="${CC}" LD="${LD}" prefix=${prefix} DESTDIR=${D} install NO_NEWT=1 NO_DWARF=1
+    fi
 }
 
 
@@ -22,9 +39,8 @@ addtask install_perf after do_install before do_package
 do_compile_perf[umask] = 022
 do_install_perf[umask] = 022
 
-PERFDEPENDS = "virtual/${MLPREFIX}libc:do_populate_sysroot ${MLPREFIX}elfutils:do_populate_sysroot ${MLPREFIX}binutils:do_populate_sysroot"
-PERFDEPENDS_libc-uclibc = ""
 PERFRDEPENDS = "python perl elfutils"
 PERFRDEPENDS_libc-uclibc = ""
 do_compile_perf[depends] = "${PERFDEPENDS}"
+do_compile_perf_libc-uclibc[depends] = ""
 RDEPENDS_perf += "${PERFRDEPENDS}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_2.6.37.bb b/meta/recipes-kernel/linux/linux-yocto_2.6.37.bb
index 34e563c..ce71393 100644
--- a/meta/recipes-kernel/linux/linux-yocto_2.6.37.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_2.6.37.bb
@@ -20,7 +20,7 @@ SRCREV_machine_qemux86-64 = "af2bfbe5f757361b5b027a24d67a93bfdfaaf33c"
 SRCREV_machine = "4ae8f8605c81c39b959948e23f7123294a5dfb3f"
 SRCREV_meta = "aeea99683c7283f1f3320bf2ee7085ee252d4e7e"
 
-PR = "r21"
+PR = "r22"
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-2.6.37;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.0.bb b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
index 10859e7..9d51bd0 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
@@ -21,7 +21,7 @@ SRCREV_machine_qemux86-64 ?= "3551fd0412965b1f6b0b2f6ba35f7fecdaddb58a"
 SRCREV_machine ?= "6f5b11830deba4a6262c8c4abf67e608924f649e"
 SRCREV_meta ?= "665fea1c249b4f335cb1c9a46a9f2c138d611f1a"
 
-PR = "r2"
+PR = "r3"
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.0;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta"
-- 
1.7.7.6



