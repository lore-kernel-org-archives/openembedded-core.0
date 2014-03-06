Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 40B8E6F465
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Mar 2014 12:15:49 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 06 Mar 2014 04:15:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,599,1389772800"; d="scan'208";a="467688632"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by orsmga001.jf.intel.com with ESMTP; 06 Mar 2014 04:15:49 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Mar 2014 14:15:42 +0200
Message-Id: <823cc54137098c5cc765b3f6ef52dc4cfc94388f.1394099850.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1394099850.git.laurentiu.palcu@intel.com>
References: <cover.1394099850.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1394099850.git.laurentiu.palcu@intel.com>
References: <cover.1394099850.git.laurentiu.palcu@intel.com>
Subject: [PATCH 2/2] opkg/dpkg: remove the postinstalls
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
X-List-Received-Date: Thu, 06 Mar 2014 12:15:49 -0000

Just use the run-postinsts recipe for running first boot postinstalls.

[YOCTO #5666]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/recipes-devtools/dpkg/dpkg.inc |   24 +-----------------------
 meta/recipes-devtools/opkg/opkg.inc |   28 +---------------------------
 2 files changed, 2 insertions(+), 50 deletions(-)

diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
index 471151e..eef7ce9 100644
--- a/meta/recipes-devtools/dpkg/dpkg.inc
+++ b/meta/recipes-devtools/dpkg/dpkg.inc
@@ -7,7 +7,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/d/dpkg/dpkg_${PV}.tar.xz \
 
 DEPENDS = "zlib bzip2 perl ncurses"
 DEPENDS_class-native = "bzip2-replacement-native zlib-native virtual/update-alternatives-native gettext-native perl-native"
-RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_update-alternatives} xz"
+RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_update-alternatives} xz run-postinsts"
 RDEPENDS_${PN}_class-native = "xz-native"
 
 S = "${WORKDIR}/${BPN}-${PV}"
@@ -43,8 +43,6 @@ do_configure () {
     autotools_do_configure
 }
 
-DPKG_INIT_POSITION ?= "98"
-
 do_install_append () {
 	if [ "${PN}" = "dpkg-native" ]; then
 		# update-alternatives doesn't have an offline mode
@@ -66,26 +64,6 @@ do_install_append () {
 	fi
 }
 
-pkg_postinst_${PN} () {
-#!/bin/sh
-if ${@base_contains('DISTRO_FEATURES','sysvinit','true','false',d)} && \
-	[ "x$D" != "x" ] && [ -f $D/var/lib/dpkg/status ]; then
-	install -d $D${sysconfdir}/rcS.d
-
-	# this happens at S98 where our good 'ole packages script used to run
-	echo "#!/bin/sh
-[ -e ${sysconfdir}/default/postinst ] && . ${sysconfdir}/default/postinst
-if [ \"\$POSTINST_LOGGING\" = \"1\" ]; then
-    dpkg --configure -a >\$LOGFILE 2>&1
-else
-    dpkg --configure -a
-fi
-rm -f ${sysconfdir}/rcS.d/S${DPKG_INIT_POSITION}run-postinsts
-" > $D${sysconfdir}/rcS.d/S${DPKG_INIT_POSITION}run-postinsts
-	chmod 0755 $D${sysconfdir}/rcS.d/S${DPKG_INIT_POSITION}run-postinsts
-fi
-}
-
 PROV = "virtual/update-alternatives"
 PROV_class-native = ""
 
diff --git a/meta/recipes-devtools/opkg/opkg.inc b/meta/recipes-devtools/opkg/opkg.inc
index 7bea26d..9f87df5 100644
--- a/meta/recipes-devtools/opkg/opkg.inc
+++ b/meta/recipes-devtools/opkg/opkg.inc
@@ -38,7 +38,7 @@ EXTRA_OECONF = "\
   --with-opkglibdir=${OPKGLIBDIR} \
 "
 
-RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_update-alternatives} opkg-config-base"
+RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_update-alternatives} opkg-config-base run-postinsts"
 RDEPENDS_${PN}_class-native = ""
 RDEPENDS_${PN}_class-nativesdk = ""
 RREPLACES_${PN} = "opkg-nogpg"
@@ -73,30 +73,4 @@ do_install_append() {
 	rm ${D}${bindir}/update-alternatives
 }
 
-pkg_postinst_${PN} () {
-#!/bin/sh
-if ${@base_contains('DISTRO_FEATURES','sysvinit','true','false',d)} && \
-	[ "x$D" != "x" ] && [ -f $D${OPKGLIBDIR}/opkg/status ]; then
-	install -d $D${sysconfdir}/rcS.d
-
-	# this happens at S98 where our good 'ole packages script used to run
-	echo "#!/bin/sh
-[ -e ${sysconfdir}/default/postinst ] && . ${sysconfdir}/default/postinst
-if [ \"\$POSTINST_LOGGING\" = \"1\" ]; then
-    opkg-cl configure >\$LOGFILE 2>&1
-else
-    opkg-cl configure
-fi
-rm -f ${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts
-" > $D${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts
-	chmod 0755 $D${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts
-fi
-}
-
 BBCLASSEXTEND = "native nativesdk"
-
-# Define a variable to allow distros to run configure earlier.
-# (for example, to enable loading of ethernet kernel modules before networking starts)
-# note: modifying name or default value for POSTINSTALL_INITPOSITION requires
-# changes in systemd-compat-units.bb
-POSTINSTALL_INITPOSITION ?= "98"
-- 
1.7.9.5


