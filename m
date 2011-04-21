Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QCuii-0002bb-OA
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Apr 2011 16:19:01 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 21 Apr 2011 07:16:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,251,1301900400"; d="scan'208";a="423281471"
Received: from unknown (HELO helios) ([10.255.13.60])
	by azsmga001.ch.intel.com with SMTP; 21 Apr 2011 07:16:33 -0700
Received: by helios (sSMTP sendmail emulation); Thu, 21 Apr 2011 15:16:30 +0100
Message-Id: <26550f2341e57513e399342eb219159c69ec1152.1303395060.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1303395060.git.paul.eggleton@linux.intel.com>
References: <cover.1303395060.git.paul.eggleton@linux.intel.com>
Old-Date: Thu, 21 Apr 2011 15:04:58 +0100
Date: Thu, 21 Apr 2011 15:16:30 +0100
To: openembedded-core@lists.openembedded.org
CC: 
From: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] Remove distro-specific metadata for distros not in oe-core
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
X-List-Received-Date: Thu, 21 Apr 2011 14:19:01 -0000

From: Paul Eggleton <paul.eggleton@linux.intel.com>

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../openswan/openswan_2.4.7.bb                     |    3 +-
 meta/recipes-connectivity/dhcp/dhcp3.inc           |    4 ---
 meta/recipes-connectivity/dhcp/dhcp4.inc           |    4 ---
 meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb       |    2 +-
 meta/recipes-connectivity/ppp/ppp_2.4.5.bb         |    5 +---
 meta/recipes-core/base-files/base-files_3.0.14.bb  |   29 --------------------
 .../recipes-core/base-passwd/base-passwd_3.5.22.bb |    7 +----
 meta/recipes-core/dropbear/dropbear.inc            |    2 +-
 meta/recipes-core/dropbear/dropbear_0.52.bb        |    2 +-
 .../netbase/netbase-4.45/colinux/interfaces        |    8 -----
 .../recipes-core/netbase/netbase-4.45/openmn/hosts |    2 -
 .../netbase/netbase-4.45/openmn/interfaces         |   10 -------
 meta/recipes-core/netbase/netbase_4.45.bb          |    5 ---
 meta/recipes-devtools/perl/perl-native_5.12.2.bb   |    8 +-----
 .../update-modules-1.0/openmn/update-modules       |    3 --
 15 files changed, 7 insertions(+), 87 deletions(-)
 delete mode 100644 meta/recipes-core/netbase/netbase-4.45/colinux/interfaces
 delete mode 100644 meta/recipes-core/netbase/netbase-4.45/openmn/hosts
 delete mode 100644 meta/recipes-core/netbase/netbase-4.45/openmn/interfaces
 delete mode 100755 meta/recipes-kernel/update-modules/update-modules-1.0/openmn/update-modules

diff --git a/meta-demoapps/recipes-connectivity/openswan/openswan_2.4.7.bb b/meta-demoapps/recipes-connectivity/openswan/openswan_2.4.7.bb
index d647f68..f783a85 100644
--- a/meta-demoapps/recipes-connectivity/openswan/openswan_2.4.7.bb
+++ b/meta-demoapps/recipes-connectivity/openswan/openswan_2.4.7.bb
@@ -6,8 +6,7 @@ HOMEPAGE = "http://www.openswan.org"
 LICENSE = "GPLv2"
 DEPENDS = "gmp flex-native"
 RRECOMMENDS_${PN} = "kernel-module-ipsec"
-RDEPENDS_${PN}_nylon = "perl"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://www.openswan.org/download/old/openswan-${PV}.tar.gz \
 	   file://openswan-2.4.7-gentoo.patch;patch=1 \
diff --git a/meta/recipes-connectivity/dhcp/dhcp3.inc b/meta/recipes-connectivity/dhcp/dhcp3.inc
index 3f68f45..6c7483e 100644
--- a/meta/recipes-connectivity/dhcp/dhcp3.inc
+++ b/meta/recipes-connectivity/dhcp/dhcp3.inc
@@ -47,7 +47,3 @@ FILES_dhcp-client = "${base_sbindir}/dhclient ${base_sbindir}/dhclient-script ${
 RDEPENDS_dhcp-client = "bash"
 
 FILES_dhcp-omshell = "${bindir}/omshell"
-
-CONFFILES_dhcp-server_nylon = "/etc/dhcp/dhcpd.conf"
-CONFFILES_dhcp-relay_nylon = "/etc/default/dhcp-relay"
-CONFFILES_dhcp-client_nylon = "/etc/dhcp/dhclient.conf"
diff --git a/meta/recipes-connectivity/dhcp/dhcp4.inc b/meta/recipes-connectivity/dhcp/dhcp4.inc
index e7cff3e..159ae89 100644
--- a/meta/recipes-connectivity/dhcp/dhcp4.inc
+++ b/meta/recipes-connectivity/dhcp/dhcp4.inc
@@ -60,7 +60,3 @@ FILES_dhcp-client = "${base_sbindir}/dhclient ${base_sbindir}/dhclient-script ${
 RDEPENDS_dhcp-client = "bash"
 
 FILES_dhcp-omshell = "${bindir}/omshell"
-
-CONFFILES_dhcp-server_nylon = "/etc/dhcp/dhcpd.conf"
-CONFFILES_dhcp-relay_nylon = "/etc/default/dhcp-relay"
-CONFFILES_dhcp-client_nylon = "/etc/dhcp/dhclient.conf"
diff --git a/meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb b/meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb
index c273b2c..85f473d 100644
--- a/meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb
+++ b/meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb
@@ -1,6 +1,6 @@
 require dhcp4.inc
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI += "file://fixincludes.patch \
             file://dhcp-3.0.3-dhclient-dbus.patch;striplevel=0 \
diff --git a/meta/recipes-connectivity/ppp/ppp_2.4.5.bb b/meta/recipes-connectivity/ppp/ppp_2.4.5.bb
index bbbcb32..785eab1 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.4.5.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.4.5.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://pppd/ccp.c;beginline=1;endline=29;md5=e2c43fe6e81ff77
                     file://pppd/plugins/passprompt.c;beginline=1;endline=10;md5=3bcbcdbf0e369c9a3e0b8c8275b065d8 \
                     file://pppd/tdb.c;beginline=1;endline=27;md5=4ca3a9991b011038d085d6675ae7c4e6 \
                     file://chat/chat.c;beginline=1;endline=15;md5=0d374b8545ee5c62d7aff1acbd38add2"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://ppp.samba.org/ftp/ppp/ppp-${PV}.tar.gz \
            file://makefile.patch \
@@ -29,8 +29,6 @@ SRC_URI = "http://ppp.samba.org/ftp/ppp/ppp-${PV}.tar.gz \
 SRC_URI[md5sum] = "4621bc56167b6953ec4071043fe0ec57"
 SRC_URI[sha256sum] = "43317afec9299f9920b96f840414c977f0385410202d48e56d2fdb8230003505"
 
-SRC_URI_append_nylon = " file://ppp-tdbread.patch;patch=1"
-
 inherit autotools
 
 EXTRA_OEMAKE = "STRIPPROG=${STRIP} MANDIR=${D}${datadir}/man/man8 INCDIR=${D}/usr/include LIBDIR=${D}/usr/lib/pppd/${PV} BINDIR=${D}/usr/sbin"
@@ -54,7 +52,6 @@ do_install_append () {
 CONFFILES_${PN} = "${sysconfdir}/ppp/pap-secrets ${sysconfdir}/ppp/chap-secrets ${sysconfdir}/ppp/options"
 PACKAGES += "ppp-oa ppp-oe ppp-radius ppp-winbind ppp-minconn ppp-password ppp-tools"
 FILES_${PN}        = "/etc /usr/bin /usr/sbin/chat /usr/sbin/pppd"
-FILES_${PN}_nylon  = "/etc /usr/bin /usr/sbin/chat /usr/sbin/pppd /usr/sbin/tdbread"
 FILES_${PN}-dbg += "${libdir}/pppd/2.4.3/.debug"
 FILES_ppp-oa       = "/usr/lib/pppd/2.4.3/pppoatm.so"
 FILES_ppp-oe       = "/usr/sbin/pppoe-discovery /usr/lib/pppd/2.4.3/rp-pppoe.so"
diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
index 1c5078e..4445081 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -63,8 +63,6 @@ conffiles = "${sysconfdir}/debian_version ${sysconfdir}/host.conf \
 # set standard hostname, might be a candidate for a DISTRO variable? :M:
 #
 hostname = "openembedded"
-hostname_slugos = "nslu2"
-hostname_jlime = "JLime"
 
 BASEFILESISSUEINSTALL ?= "do_install_basefilesissue"
 
@@ -133,22 +131,6 @@ do_install_basefilesissue () {
  	fi
 }
 
-do_install_append_nylon() {
-	printf "" "" >${D}${sysconfdir}/resolv.conf
-	rm -r ${D}/mnt/*
-	rm -r ${D}/media
-	rm -rf ${D}/tmp
-	ln -sf /var/tmp ${D}/tmp
-}
-
-do_install_append_slugos() {
-	printf "" "" >${D}${sysconfdir}/resolv.conf
-	rm -r ${D}/mnt/*
-	rmdir ${D}/home/root
-	install -m 0755 -d ${D}/root
-	ln -s ../root ${D}/home/root
-}
-
 do_install_append_linuxstdbase() {
 	for d in ${dirs3755}; do
                 install -m 0755 -d ${D}$d
@@ -165,16 +147,5 @@ FILES_${PN}-doc = "${docdir} ${datadir}/common-licenses"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-# Unslung distribution specific packaging
-
-PACKAGES_unslung = "${PN}-unslung"
-PACKAGE_ARCH_${PN}-unslung = "nslu2"
-RDEPENDS_${PN}-unslung = "nslu2-linksys-ramdisk"
-RPROVIDES_${PN}-unslung = "${PN}"
-
-FILES_${PN}-unslung = ""
-
 CONFFILES_${PN} = "${sysconfdir}/fstab ${sysconfdir}/hostname"
-CONFFILES_${PN}_nylon = "${sysconfdir}/resolv.conf ${sysconfdir}/fstab ${sysconfdir}/hostname"
-CONFFILES_${PN}_slugos = "${sysconfdir}/resolv.conf ${sysconfdir}/fstab ${sysconfdir}/hostname"
 
diff --git a/meta/recipes-core/base-passwd/base-passwd_3.5.22.bb b/meta/recipes-core/base-passwd/base-passwd_3.5.22.bb
index aed8491..6f768ca 100644
--- a/meta/recipes-core/base-passwd/base-passwd_3.5.22.bb
+++ b/meta/recipes-core/base-passwd/base-passwd_3.5.22.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Base system master password/group files."
 DESCRIPTION = "The master copies of the user database files (/etc/passwd and /etc/group).  The update-passwd tool is also provided to keep the system databases synchronized with these master files."
 SECTION = "base"
-PR = "r0"
+PR = "r1"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
 
@@ -35,11 +35,6 @@ do_install () {
 	install -p -m 644 debian/copyright ${D}${docdir}/${PN}/
 }
 
-do_install_append_openmn() {
-	echo "0:Jn6tcg/qjqvUE:0:0:root:/root:/bin/sh" >>${D}${datadir}/base-passwd/passwd.master
-}
-
-
 pkg_postinst_${PN} () {
 	set -e
 
diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/dropbear/dropbear.inc
index ab7719c..8bcdc37 100644
--- a/meta/recipes-core/dropbear/dropbear.inc
+++ b/meta/recipes-core/dropbear/dropbear.inc
@@ -33,7 +33,7 @@ EXTRA_OEMAKE = 'MULTI=1 SCPPROGRESS=1 PROGRAMS="${SBINCOMMANDS} ${BINCOMMANDS}"'
 DISTRO_TYPE = "${@base_contains("IMAGE_FEATURES", "debug-tweaks", "debug", "",d)}"
 
 do_configure_prepend() {
-	if [ "x${DISTRO}" != "xfamiliar" -a "${DISTRO_TYPE}" = "debug" ]; then
+	if [ "${DISTRO_TYPE}" = "debug" ]; then
 		oenote "WARNING: applying allow-nopw.patch which allows password-less logins!"
 		patch -p1 < ${WORKDIR}/allow-nopw.patch
 	fi
diff --git a/meta/recipes-core/dropbear/dropbear_0.52.bb b/meta/recipes-core/dropbear/dropbear_0.52.bb
index 6556bb4..912054c 100644
--- a/meta/recipes-core/dropbear/dropbear_0.52.bb
+++ b/meta/recipes-core/dropbear/dropbear_0.52.bb
@@ -3,4 +3,4 @@ require dropbear.inc
 SRC_URI[md5sum] = "1c69ec674481d7745452f68f2ea5597e"
 SRC_URI[sha256sum] = "e3a2ca49ed85ce562240c0ac06e2f72826d7e52a83e80d91c067c8b97bf5c108"
 
-PR="r0"
+PR = "r1"
diff --git a/meta/recipes-core/netbase/netbase-4.45/colinux/interfaces b/meta/recipes-core/netbase/netbase-4.45/colinux/interfaces
deleted file mode 100644
index 0e495e1..0000000
--- a/meta/recipes-core/netbase/netbase-4.45/colinux/interfaces
+++ /dev/null
@@ -1,8 +0,0 @@
-# /etc/network/interfaces -- configuration file for ifup(8), ifdown(8)
-
-# The loopback interface
-auto lo
-iface lo inet loopback
-
-# Wired or wireless interfaces
-iface eth0 inet dhcp
diff --git a/meta/recipes-core/netbase/netbase-4.45/openmn/hosts b/meta/recipes-core/netbase/netbase-4.45/openmn/hosts
deleted file mode 100644
index 0205b98..0000000
--- a/meta/recipes-core/netbase/netbase-4.45/openmn/hosts
+++ /dev/null
@@ -1,2 +0,0 @@
-127.0.0.1               localhost.localdomain localhost
-192.168.233.1           www.mn-solutions.de
diff --git a/meta/recipes-core/netbase/netbase-4.45/openmn/interfaces b/meta/recipes-core/netbase/netbase-4.45/openmn/interfaces
deleted file mode 100644
index 9ebe9b8..0000000
--- a/meta/recipes-core/netbase/netbase-4.45/openmn/interfaces
+++ /dev/null
@@ -1,10 +0,0 @@
-auto lo
-auto eth1
-
-iface lo inet loopback
-
-iface eth0 inet dhcp
-
-iface eth1 inet dhcp
-	wireless_mode managed
-	wireless_essid any
diff --git a/meta/recipes-core/netbase/netbase_4.45.bb b/meta/recipes-core/netbase/netbase_4.45.bb
index 85daa16..04ef3a0 100644
--- a/meta/recipes-core/netbase/netbase_4.45.bb
+++ b/meta/recipes-core/netbase/netbase_4.45.bb
@@ -10,11 +10,6 @@ inherit update-rc.d
 
 INITSCRIPT_NAME = "networking"
 INITSCRIPT_PARAMS = "start 40 S . stop 40 0 6 1 ."
-# On MNCI etc, start very late so that our own apps come up faster
-INITSCRIPT_PARAMS_openmn = "start 85 1 2 3 4 5 . stop 85 0 6 1 ."
-# On SlugOS (NSLU2) delay the stop until after network apps have exited
-# Do not stop in single user - there's no way to sulogin!
-INITSCRIPT_PARAMS_slugos = "start 42 S 0 6 ."
 
 SRC_URI = "${DEBIAN_MIRROR}/main/n/netbase/netbase_${PV}.tar.gz \
            file://init \
diff --git a/meta/recipes-devtools/perl/perl-native_5.12.2.bb b/meta/recipes-devtools/perl/perl-native_5.12.2.bb
index c9882a9..9080b0b 100644
--- a/meta/recipes-devtools/perl/perl-native_5.12.2.bb
+++ b/meta/recipes-devtools/perl/perl-native_5.12.2.bb
@@ -4,7 +4,7 @@ SECTION = "libs"
 LICENSE = "Artistic|GPL"
 LIC_FILES_CHKSUM = "file://Copying;md5=2b4c6ffbcfcbdee469f02565f253d81a \
 		    file://Artistic;md5=f921793d03cc6d63ec4b15e9be8fd3f8"
-PR = "r8"
+PR = "r9"
 
 LIC_FILES_CHKSUM = "file://Copying;md5=2b4c6ffbcfcbdee469f02565f253d81a \
                     file://Artistic;md5=f921793d03cc6d63ec4b15e9be8fd3f8"
@@ -98,9 +98,3 @@ do_install () {
 
 	create_wrapper ${D}${bindir}/perl PERL5LIB='$PERL5LIB:${STAGING_LIBDIR}/perl/5.12.2:${STAGING_LIBDIR}/perl/'
 }
-do_install_append_nylon() {
-	# get rid of definitions not supported by the gcc version we use for nylon...
-	for i in ${D}${libdir}/perl/${PV}/Config_heavy.pl ${D}${libdir}/perl/config.sh; do
-		perl -pi -e 's/-Wdeclaration-after-statement //g' ${i}
-	done
-}
diff --git a/meta/recipes-kernel/update-modules/update-modules-1.0/openmn/update-modules b/meta/recipes-kernel/update-modules/update-modules-1.0/openmn/update-modules
deleted file mode 100755
index 976161f..0000000
--- a/meta/recipes-kernel/update-modules/update-modules-1.0/openmn/update-modules
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-depmod -ae
-exit 0
-- 
1.7.1



