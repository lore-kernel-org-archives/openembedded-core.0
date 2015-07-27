Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C6D4D73D13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 02:47:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6R2m0xk014142
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Jul 2015 19:48:00 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Sun, 26 Jul 2015 19:47:45 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 27 Jul 2015 10:45:49 +0800
Message-ID: <1437965149-22922-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] bind: upgrade to 9.10.2-P2
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
X-List-Received-Date: Mon, 27 Jul 2015 02:48:00 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

upgrade to fix CVE-2015-4620:
    name.c in named in ISC BIND 9.7.x through 9.9.x before 9.9.7-P1 and 9.10.x
    before 9.10.2-P2, when configured as a recursive resolver with DNSSEC
    validation, allows remote attackers to cause a denial of service (REQUIRE
    assertion failure and daemon exit) by constructing crafted zone data and
    then making a query for a name in that zone.

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta/recipes-connectivity/bind/bind_9.10.2-P2.bb | 103 +++++++++++++++++++++++
 meta/recipes-connectivity/bind/bind_9.10.2.bb    | 103 -----------------------
 2 files changed, 103 insertions(+), 103 deletions(-)
 create mode 100644 meta/recipes-connectivity/bind/bind_9.10.2-P2.bb
 delete mode 100644 meta/recipes-connectivity/bind/bind_9.10.2.bb

diff --git a/meta/recipes-connectivity/bind/bind_9.10.2-P2.bb b/meta/recipes-connectivity/bind/bind_9.10.2-P2.bb
new file mode 100644
index 0000000..0d2af55
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind_9.10.2-P2.bb
@@ -0,0 +1,103 @@
+SUMMARY = "ISC Internet Domain Name Server"
+HOMEPAGE = "http://www.isc.org/sw/bind/"
+SECTION = "console/network"
+
+LICENSE = "ISC & BSD"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=0a95f52a0ab6c5f52dedc9a45e7abb3f"
+
+DEPENDS = "openssl libcap"
+
+SRC_URI = "ftp://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
+           file://conf.patch \
+           file://make-etc-initd-bind-stop-work.patch \
+           file://mips1-not-support-opcode.diff \
+           file://dont-test-on-host.patch \
+           file://generate-rndc-key.sh \
+           file://named.service \
+           file://bind9 \
+           file://init.d-add-support-for-read-only-rootfs.patch \
+           file://bind-confgen-build-unix.o-once.patch \
+           file://0001-build-use-pkg-config-to-find-libxml2.patch \
+           file://bind-ensure-searching-for-json-headers-searches-sysr.patch \
+           "
+
+SRC_URI[md5sum] = "55d8f094bc10baae0e23e5e9100ba320"
+SRC_URI[sha256sum] = "b1e6f0af88634aaf48fb9d06bbf82968264f49b8e2685f061dd3fd4c1ab76c5f"
+
+# --enable-exportlib is necessary for building dhcp
+ENABLE_IPV6 = "--enable-ipv6=${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'yes', 'no', d)}"
+EXTRA_OECONF = " ${ENABLE_IPV6} --with-randomdev=/dev/random --disable-threads \
+                 --disable-devpoll --disable-epoll --with-gost=no \
+                 --with-gssapi=no --with-ecdsa=yes \
+                 --sysconfdir=${sysconfdir}/bind \
+                 --with-openssl=${STAGING_LIBDIR}/.. \
+               "
+inherit autotools update-rc.d systemd useradd pkgconfig
+
+PR = "r1"
+
+PACKAGECONFIG ?= ""
+PACKAGECONFIG[httpstats] = "--with-libxml2,--without-libxml2,libxml2"
+
+USERADD_PACKAGES = "${PN}"
+USERADD_PARAM_${PN} = "--system --home /var/cache/bind --no-create-home \
+                       --user-group bind"
+
+INITSCRIPT_NAME = "bind"
+INITSCRIPT_PARAMS = "defaults"
+
+SYSTEMD_SERVICE_${PN} = "named.service"
+
+PARALLEL_MAKE = ""
+
+RDEPENDS_${PN} = "python-core"
+
+PACKAGE_BEFORE_PN += "${PN}-utils"
+FILES_${PN}-utils = "${bindir}/host ${bindir}/dig"
+FILES_${PN}-dev += "${bindir}/isc-config.h"
+FILES_${PN} += "${sbindir}/generate-rndc-key.sh"
+
+do_install_prepend() {
+	# clean host path in isc-config.sh before the hardlink created
+	# by "make install":
+	#   bind9-config -> isc-config.sh
+	sed -i -e "s,${STAGING_LIBDIR},${libdir}," ${B}/isc-config.sh
+}
+
+do_install_append() {
+	rm "${D}${bindir}/nslookup"
+	rm "${D}${mandir}/man1/nslookup.1"
+	rmdir "${D}${localstatedir}/run"
+	rmdir --ignore-fail-on-non-empty "${D}${localstatedir}"
+	install -d "${D}${localstatedir}/cache/bind"
+	install -d "${D}${sysconfdir}/bind"
+	install -d "${D}${sysconfdir}/init.d"
+	install -m 644 ${S}/conf/* "${D}${sysconfdir}/bind/"
+	install -m 755 "${S}/init.d" "${D}${sysconfdir}/init.d/bind"
+	sed -i -e '1s,#!.*python,#! /usr/bin/env python,' ${D}${sbindir}/dnssec-coverage ${D}${sbindir}/dnssec-checkds
+
+	# Install systemd related files
+	install -d ${D}${localstatedir}/cache/bind
+	install -d ${D}${sbindir}
+	install -m 755 ${WORKDIR}/generate-rndc-key.sh ${D}${sbindir}
+	install -d ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/named.service ${D}${systemd_unitdir}/system
+	sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
+	       -e 's,@SBINDIR@,${sbindir},g' \
+	       ${D}${systemd_unitdir}/system/named.service
+
+	install -d ${D}${sysconfdir}/default
+	install -m 0644 ${WORKDIR}/bind9 ${D}${sysconfdir}/default
+}
+
+CONFFILES_${PN} = " \
+	${sysconfdir}/bind/named.conf \
+	${sysconfdir}/bind/named.conf.local \
+	${sysconfdir}/bind/named.conf.options \
+	${sysconfdir}/bind/db.0 \
+	${sysconfdir}/bind/db.127 \
+	${sysconfdir}/bind/db.empty \
+	${sysconfdir}/bind/db.local \
+	${sysconfdir}/bind/db.root \
+	"
+
diff --git a/meta/recipes-connectivity/bind/bind_9.10.2.bb b/meta/recipes-connectivity/bind/bind_9.10.2.bb
deleted file mode 100644
index 43f1798..0000000
--- a/meta/recipes-connectivity/bind/bind_9.10.2.bb
+++ /dev/null
@@ -1,103 +0,0 @@
-SUMMARY = "ISC Internet Domain Name Server"
-HOMEPAGE = "http://www.isc.org/sw/bind/"
-SECTION = "console/network"
-
-LICENSE = "ISC & BSD"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=0a95f52a0ab6c5f52dedc9a45e7abb3f"
-
-DEPENDS = "openssl libcap"
-
-SRC_URI = "ftp://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
-           file://conf.patch \
-           file://make-etc-initd-bind-stop-work.patch \
-           file://mips1-not-support-opcode.diff \
-           file://dont-test-on-host.patch \
-           file://generate-rndc-key.sh \
-           file://named.service \
-           file://bind9 \
-           file://init.d-add-support-for-read-only-rootfs.patch \
-           file://bind-confgen-build-unix.o-once.patch \
-           file://0001-build-use-pkg-config-to-find-libxml2.patch \
-           file://bind-ensure-searching-for-json-headers-searches-sysr.patch \
-           "
-
-SRC_URI[md5sum] = "dca7a9967947bffa98547fca6130fc04"
-SRC_URI[sha256sum] = "6f9bb7908aa45c1edfa391e356fc0afc1ded175386cdefb6cf9e1289f7457a98"
-
-# --enable-exportlib is necessary for building dhcp
-ENABLE_IPV6 = "--enable-ipv6=${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'yes', 'no', d)}"
-EXTRA_OECONF = " ${ENABLE_IPV6} --with-randomdev=/dev/random --disable-threads \
-                 --disable-devpoll --disable-epoll --with-gost=no \
-                 --with-gssapi=no --with-ecdsa=yes \
-                 --sysconfdir=${sysconfdir}/bind \
-                 --with-openssl=${STAGING_LIBDIR}/.. \
-               "
-inherit autotools update-rc.d systemd useradd pkgconfig
-
-PR = "r1"
-
-PACKAGECONFIG ?= ""
-PACKAGECONFIG[httpstats] = "--with-libxml2,--without-libxml2,libxml2"
-
-USERADD_PACKAGES = "${PN}"
-USERADD_PARAM_${PN} = "--system --home /var/cache/bind --no-create-home \
-                       --user-group bind"
-
-INITSCRIPT_NAME = "bind"
-INITSCRIPT_PARAMS = "defaults"
-
-SYSTEMD_SERVICE_${PN} = "named.service"
-
-PARALLEL_MAKE = ""
-
-RDEPENDS_${PN} = "python-core"
-
-PACKAGE_BEFORE_PN += "${PN}-utils"
-FILES_${PN}-utils = "${bindir}/host ${bindir}/dig"
-FILES_${PN}-dev += "${bindir}/isc-config.h"
-FILES_${PN} += "${sbindir}/generate-rndc-key.sh"
-
-do_install_prepend() {
-	# clean host path in isc-config.sh before the hardlink created
-	# by "make install":
-	#   bind9-config -> isc-config.sh
-	sed -i -e "s,${STAGING_LIBDIR},${libdir}," ${B}/isc-config.sh
-}
-
-do_install_append() {
-	rm "${D}${bindir}/nslookup"
-	rm "${D}${mandir}/man1/nslookup.1"
-	rmdir "${D}${localstatedir}/run"
-	rmdir --ignore-fail-on-non-empty "${D}${localstatedir}"
-	install -d "${D}${localstatedir}/cache/bind"
-	install -d "${D}${sysconfdir}/bind"
-	install -d "${D}${sysconfdir}/init.d"
-	install -m 644 ${S}/conf/* "${D}${sysconfdir}/bind/"
-	install -m 755 "${S}/init.d" "${D}${sysconfdir}/init.d/bind"
-	sed -i -e '1s,#!.*python,#! /usr/bin/env python,' ${D}${sbindir}/dnssec-coverage ${D}${sbindir}/dnssec-checkds
-
-	# Install systemd related files
-	install -d ${D}${localstatedir}/cache/bind
-	install -d ${D}${sbindir}
-	install -m 755 ${WORKDIR}/generate-rndc-key.sh ${D}${sbindir}
-	install -d ${D}${systemd_unitdir}/system
-	install -m 0644 ${WORKDIR}/named.service ${D}${systemd_unitdir}/system
-	sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
-	       -e 's,@SBINDIR@,${sbindir},g' \
-	       ${D}${systemd_unitdir}/system/named.service
-
-	install -d ${D}${sysconfdir}/default
-	install -m 0644 ${WORKDIR}/bind9 ${D}${sysconfdir}/default
-}
-
-CONFFILES_${PN} = " \
-	${sysconfdir}/bind/named.conf \
-	${sysconfdir}/bind/named.conf.local \
-	${sysconfdir}/bind/named.conf.options \
-	${sysconfdir}/bind/db.0 \
-	${sysconfdir}/bind/db.127 \
-	${sysconfdir}/bind/db.empty \
-	${sysconfdir}/bind/db.local \
-	${sysconfdir}/bind/db.root \
-	"
-
-- 
1.9.1


