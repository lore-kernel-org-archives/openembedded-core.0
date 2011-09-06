Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1R0vTP-0004hO-Ta
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Sep 2011 15:13:56 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 06 Sep 2011 06:08:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,338,1312182000"; d="scan'208";a="48488286"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.36.112])
	by fmsmga001.fm.intel.com with ESMTP; 06 Sep 2011 06:08:37 -0700
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Sep 2011 21:08:37 +0800
Message-Id: <96b83521070f288a294160a093bc52943119d1b3.1315313790.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1315313790.git.dexuan.cui@intel.com>
References: <cover.1315313790.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1315313790.git.dexuan.cui@intel.com>
References: <cover.1315313790.git.dexuan.cui@intel.com>
Subject: [PATCH 3/5] dpkg, dpkg-native: fix DEPENDS, RDEPENDS and pkg_postinst_dpkg
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
X-List-Received-Date: Tue, 06 Sep 2011 13:13:56 -0000

dpkg-native should depend on update-alternatives-dpkg-native rather than
opkg-native.

dpkg should Rdepend on update-alternatives-dpkg rather than
update-alternatives-cworth.

The pkg_postinst_dpkg seems buggy, e.g., for dpkg-native,
${IMAGE_ROOTFS}/${sysconfdir}/rcS.d doesn't exist.
I think OE's version(do_install_prepend) at
http://git.openembedded.org/cgit.cgi/openembedded/tree/recipes/dpkg/dpkg.inc
is corrent. So let's change to OE's version.

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 meta/recipes-devtools/dpkg/dpkg.inc |   23 ++++++++++-------------
 1 files changed, 10 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
index aa5f90e..2ff757a 100644
--- a/meta/recipes-devtools/dpkg/dpkg.inc
+++ b/meta/recipes-devtools/dpkg/dpkg.inc
@@ -2,14 +2,14 @@ DESCRIPTION = "Package maintenance system for Debian."
 LICENSE = "GPL"
 SECTION = "base"
 
-INC_PR = "r4"
+INC_PR = "r5"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/d/dpkg/dpkg_${PV}.tar.bz2 \
            file://ignore_extra_fields.patch"
 
 DEPENDS = "zlib bzip2 perl"
-DEPENDS_virtclass-native = "bzip2-native zlib-native virtual/update-alternatives-native gettext-native perl-native-runtime"
-RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_update-alternatives}"
+DEPENDS_virtclass-native = "bzip2-native zlib-native update-alternatives-dpkg-native gettext-native perl-native-runtime"
+RDEPENDS_${PN} = "update-alternatives-dpkg"
 RDEPENDS_${PN}_virtclass-native = ""
 
 S = "${WORKDIR}/${BPN}-${PV}"
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
-- 
1.7.6



