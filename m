Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1R3T9N-00068w-H5
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Sep 2011 15:35:45 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 13 Sep 2011 06:30:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="47754376"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.36.112])
	by orsmga002.jf.intel.com with ESMTP; 13 Sep 2011 06:30:34 -0700
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Sep 2011 21:30:37 +0800
Message-Id: <372fffc4e289f88388de55665b1c5d766b956b37.1315920580.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1315920580.git.dexuan.cui@intel.com>
References: <cover.1315920580.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1315920580.git.dexuan.cui@intel.com>
References: <cover.1315920580.git.dexuan.cui@intel.com>
Subject: [PATCH 1/1] dpkg: fix pkg_postinst_dpkg, don't supply {bindir}/update-alternatives
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
X-List-Received-Date: Tue, 13 Sep 2011 13:35:45 -0000

[YOCTO #1070].

The pkg_postinst_dpkg seems buggy, e.g., for dpkg-native,
${IMAGE_ROOTFS}/${sysconfdir}/rcS.d doesn't exist.
I think OE's version(do_install_prepend) at
http://git.openembedded.org/cgit.cgi/openembedded/tree/recipes/dpkg/dpkg.inc
is correct, so let's change to OE's version.

And, bth dpkg and update-alternatives-cworth supply
/usr/bin/update-alternatives and this causes conflict. e.g., bug 1070.
We can resolve the issue by ask dpkg not to supply the binary.

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 meta/recipes-devtools/dpkg/dpkg.inc         |   19 ++++++++-----------
 meta/recipes-devtools/dpkg/dpkg_1.15.8.7.bb |    2 +-
 2 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
index aa5f90e..8c2511d 100644
--- a/meta/recipes-devtools/dpkg/dpkg.inc
+++ b/meta/recipes-devtools/dpkg/dpkg.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "Package maintenance system for Debian."
 LICENSE = "GPL"
 SECTION = "base"
 
-INC_PR = "r4"
+INC_PR = "r5"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/d/dpkg/dpkg_${PV}.tar.bz2 \
            file://ignore_extra_fields.patch"
@@ -20,17 +20,14 @@ inherit autotools gettext perlnative
 
 DPKG_INIT_POSITION = "98"
 
-pkg_postinst_dpkg () {
-#!/bin/sh
-if [ "x$D" != "x" ]; then
-	install -d $D/${sysconfdir}/rcS.d
+do_install_prepend () {
+	install -d ${D}/${sysconfdir}/rcS.d
 	# this happens at S98 where our good 'ole packages script used to run
-	echo -e "#!/bin/sh
-	dpkg --configure -a
-	rm -f /${sysconfdir}/rcS.d/S${DPKG_INIT_POSITION}configure
-" > ${IMAGE_ROOTFS}/${sysconfdir}/rcS.d/S${DPKG_INIT_POSITION}configure
-	chmod 0755 $D/${sysconfdir}/rcS.d/S${DPKG_INIT_POSITION}configure
-fi
+	printf "#!/bin/sh
+dpkg --configure -a
+rm -f ${sysconfdir}/rcS.d/S${DPKG_INIT_POSITION}configure
+" > ${D}/${sysconfdir}/rcS.d/S${DPKG_INIT_POSITION}configure
+	chmod 0755 ${D}/${sysconfdir}/rcS.d/S${DPKG_INIT_POSITION}configure
 }
 
 do_configure () {
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.15.8.7.bb b/meta/recipes-devtools/dpkg/dpkg_1.15.8.7.bb
index 91535d3..99197c0 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.15.8.7.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.15.8.7.bb
@@ -20,6 +20,6 @@ EXTRA_OECONF = "--without-static-progs \
 
 BBCLASSEXTEND = "native"
 
-do_install_append_virtclass-native () {
+do_install_append () {
 	rm ${D}${bindir}/update-alternatives
 }
-- 
1.7.6



