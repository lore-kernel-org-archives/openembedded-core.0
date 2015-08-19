Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6383F608B7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Aug 2015 09:29:22 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t7J9TLIC023795
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Aug 2015 02:29:21 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.235.1; Wed, 19 Aug 2015 02:29:21 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 19 Aug 2015 17:25:30 +0800
Message-ID: <1439976330-20413-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][v2] glibc: package nscd related files
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
X-List-Received-Date: Wed, 19 Aug 2015 09:29:25 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

install nscd related configuration file, startup files, and package them,
make nscd easy to startup

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta/recipes-core/glibc/glibc-package.inc | 40 ++++++++++++++++++++++++++++++-
 meta/recipes-core/glibc/glibc.inc         |  2 +-
 2 files changed, 40 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index def0e0c..9bded67 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -49,7 +49,8 @@ FILES_libsotruss = "${libdir}/audit/sotruss-lib.so"
 FILES_SOLIBSDEV = "${libdir}/lib*${SOLIBSDEV}"
 FILES_${PN}-dev += "${bindir}/rpcgen ${libdir}/*_nonshared.a ${base_libdir}/*_nonshared.a ${base_libdir}/*.o ${datadir}/aclocal"
 FILES_${PN}-staticdev += "${libdir}/*.a ${base_libdir}/*.a"
-FILES_nscd = "${sbindir}/nscd*"
+FILES_nscd = "${sbindir}/nscd* ${sysconfdir}/init.d/nscd ${systemd_unitdir}/system/nscd* ${sysconfdir}/tmpfiles.d/nscd.conf \
+              ${sysconfdir}/nscd.conf ${sysconfdir}/default/volatiles/98_nscd ${localstatedir}/db/nscd"
 FILES_${PN}-mtrace = "${bindir}/mtrace"
 FILES_tzcode = "${bindir}/tzselect ${sbindir}/zic ${sbindir}/zdump"
 FILES_${PN}-utils = "${bindir}/* ${sbindir}/*"
@@ -105,6 +106,29 @@ do_install_append () {
 			rmdir ${D}${sysconfdir}
 		fi
 	fi
+
+	if echo ${PN}|grep -q "glibc-initial"; then
+		return
+	fi
+
+	install -d ${D}${sysconfdir}/init.d
+	install -d ${D}${localstatedir}/db/nscd
+	install -m 0755 ${S}/nscd/nscd.init ${D}${sysconfdir}/init.d/nscd
+	install -m 0755 ${S}/nscd/nscd.conf ${D}${sysconfdir}/nscd.conf
+	sed -i "s%daemon%start-stop-daemon --start --exec%g" ${D}${sysconfdir}/init.d/nscd
+
+	install -d ${D}${systemd_unitdir}/system
+	install -m 0644 ${S}/nscd/nscd.service ${D}${systemd_unitdir}/system/
+
+	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+		install -d ${D}${sysconfdir}/tmpfiles.d
+		echo "d /run/nscd 755 root root -" \
+			> ${D}${sysconfdir}/tmpfiles.d/nscd.conf
+	else
+		install -d ${D}${sysconfdir}/default/volatiles
+		echo "d root root 0755 /var/run/nscd none" \
+			> ${D}${sysconfdir}/default/volatiles/98_nscd
+	fi
 }
 
 do_install_append_aarch64 () {
@@ -174,3 +198,17 @@ glibc_package_preprocess () {
 		rm -rf ${PKGD}${exec_prefix}/lib
 	fi
 }
+
+pkg_postinst_nscd () {
+	if [ -z "$D" ]; then
+		if command -v systemd-tmpfiles >/dev/null; then
+			systemd-tmpfiles --create ${sysconfdir}/tmpfiles.d/nscd.conf
+		elif [ -e ${sysconfdir}/init.d/populate-volatile.sh ]; then
+			${sysconfdir}/init.d/populate-volatile.sh update
+		fi
+	fi
+}
+CONFFILES_nscd="${sysconfdir}/nscd.conf"
+
+SYSTEMD_PACKAGES = "nscd"
+SYSTEMD_SERVICE_nscd = "nscd.service"
diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/glibc.inc
index 74ad0b5..03ffb2f 100644
--- a/meta/recipes-core/glibc/glibc.inc
+++ b/meta/recipes-core/glibc/glibc.inc
@@ -41,7 +41,7 @@ DEPENDS = "virtual/${TARGET_PREFIX}gcc-initial libgcc-initial linux-libc-headers
 #RDEPENDS_${PN} += "${@['','libgcc']['nptl' in '${GLIBC_ADDONS}']}"
 PROVIDES = "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc"
 PROVIDES += "virtual/libintl virtual/libiconv"
-inherit autotools texinfo distro_features_check
+inherit autotools texinfo distro_features_check systemd
 require glibc-options.inc
 
 # The main purpose of setting this variable is to prevent users from accidently
-- 
1.9.1


