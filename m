Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C81FCE64AAA
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 13:56:34 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web11.20131.1733234192392589937
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Dec 2024 05:56:32 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout04.t-online.de (Postfix) with SMTP id 4832511E9
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Dec 2024 14:56:30 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.235.82]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tITO1-1f3UPa0; Tue, 3 Dec 2024 14:56:21 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [RFC][oe-core][PATCHv2 2/2] libpam: build twice and package libpam separately
Date: Tue,  3 Dec 2024 14:56:13 +0100
Message-ID: <20241203135613.1955725-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241203135613.1955725-1-f_l_k@t-online.de>
References: <20241203135613.1955725-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1733234181-D7FEF365-789B887C/0/0 CLEAN NORMAL
X-TOI-MSGID: 152e0894-1756-4094-8329-bfaacabec364
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 13:56:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208211

This commit splits the libpam recipe and now compiles twice. First only t=
he
libs are packaged and afterwards the libpam modules. This breaks a depend=
ency loop
and makes it possible to link against systemd to enable 'logind' support =
for
the modules.

It compiles for x86-64/arm/arm64 and mutlilib and it seems to fix the bui=
ld for
libpam-native (and a missing DISTRO_FEATURES issue).
Although not yet compilable, it also reduces the dependency loops between=
 systemd<->shadow
and should allow to build pam without systemd in DISTRO_FEATURES

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/conf/distro/include/maintainers.inc      |   1 +
 ...ect-check-for-existence-of-two-prepr.patch |   0
 .../pam/{libpam =3D> files}/99_pam              |   0
 .../pam/{libpam =3D> files}/pam-volatiles.conf  |   0
 .../{libpam =3D> files}/pam.d/common-account    |   0
 .../pam/{libpam =3D> files}/pam.d/common-auth   |   0
 .../{libpam =3D> files}/pam.d/common-password   |   0
 .../{libpam =3D> files}/pam.d/common-session    |   0
 .../pam.d/common-session-noninteractive       |   0
 .../pam/{libpam =3D> files}/pam.d/other         |   0
 .../pam/{libpam =3D> files}/run-ptest           |   0
 meta/recipes-extended/pam/libpam-modules.bb   | 112 ++++++++++++
 meta/recipes-extended/pam/libpam.bb           |  17 ++
 meta/recipes-extended/pam/libpam.inc          |  57 ++++++
 meta/recipes-extended/pam/libpam_1.7.0.bb     | 168 ------------------
 15 files changed, 187 insertions(+), 168 deletions(-)
 rename meta/recipes-extended/pam/{libpam =3D> files}/0001-meson.build-co=
rrect-check-for-existence-of-two-prepr.patch (100%)
 rename meta/recipes-extended/pam/{libpam =3D> files}/99_pam (100%)
 rename meta/recipes-extended/pam/{libpam =3D> files}/pam-volatiles.conf =
(100%)
 rename meta/recipes-extended/pam/{libpam =3D> files}/pam.d/common-accoun=
t (100%)
 rename meta/recipes-extended/pam/{libpam =3D> files}/pam.d/common-auth (=
100%)
 rename meta/recipes-extended/pam/{libpam =3D> files}/pam.d/common-passwo=
rd (100%)
 rename meta/recipes-extended/pam/{libpam =3D> files}/pam.d/common-sessio=
n (100%)
 rename meta/recipes-extended/pam/{libpam =3D> files}/pam.d/common-sessio=
n-noninteractive (100%)
 rename meta/recipes-extended/pam/{libpam =3D> files}/pam.d/other (100%)
 rename meta/recipes-extended/pam/{libpam =3D> files}/run-ptest (100%)
 create mode 100644 meta/recipes-extended/pam/libpam-modules.bb
 create mode 100644 meta/recipes-extended/pam/libpam.bb
 create mode 100644 meta/recipes-extended/pam/libpam.inc
 delete mode 100644 meta/recipes-extended/pam/libpam_1.7.0.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index 9151a348ee..0f375c146e 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -370,6 +370,7 @@ RECIPE_MAINTAINER:pn-libnss-mdns =3D "Alexander Kanav=
in <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-libnss-nis =3D "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-libogg =3D "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-libpam =3D "Anuj Mittal <anuj.mittal@intel.com>"
+RECIPE_MAINTAINER:pn-libpam-modules =3D "Unassigned <unassigned@yoctopro=
ject.org>"
 RECIPE_MAINTAINER:pn-libpcap =3D "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-libpciaccess =3D "Wang Mingyu <wangmy@fujitsu.com>"
 RECIPE_MAINTAINER:pn-libpcre =3D "Yi Zhao <yi.zhao@windriver.com>"
diff --git a/meta/recipes-extended/pam/libpam/0001-meson.build-correct-ch=
eck-for-existence-of-two-prepr.patch b/meta/recipes-extended/pam/files/00=
01-meson.build-correct-check-for-existence-of-two-prepr.patch
similarity index 100%
rename from meta/recipes-extended/pam/libpam/0001-meson.build-correct-che=
ck-for-existence-of-two-prepr.patch
rename to meta/recipes-extended/pam/files/0001-meson.build-correct-check-=
for-existence-of-two-prepr.patch
diff --git a/meta/recipes-extended/pam/libpam/99_pam b/meta/recipes-exten=
ded/pam/files/99_pam
similarity index 100%
rename from meta/recipes-extended/pam/libpam/99_pam
rename to meta/recipes-extended/pam/files/99_pam
diff --git a/meta/recipes-extended/pam/libpam/pam-volatiles.conf b/meta/r=
ecipes-extended/pam/files/pam-volatiles.conf
similarity index 100%
rename from meta/recipes-extended/pam/libpam/pam-volatiles.conf
rename to meta/recipes-extended/pam/files/pam-volatiles.conf
diff --git a/meta/recipes-extended/pam/libpam/pam.d/common-account b/meta=
/recipes-extended/pam/files/pam.d/common-account
similarity index 100%
rename from meta/recipes-extended/pam/libpam/pam.d/common-account
rename to meta/recipes-extended/pam/files/pam.d/common-account
diff --git a/meta/recipes-extended/pam/libpam/pam.d/common-auth b/meta/re=
cipes-extended/pam/files/pam.d/common-auth
similarity index 100%
rename from meta/recipes-extended/pam/libpam/pam.d/common-auth
rename to meta/recipes-extended/pam/files/pam.d/common-auth
diff --git a/meta/recipes-extended/pam/libpam/pam.d/common-password b/met=
a/recipes-extended/pam/files/pam.d/common-password
similarity index 100%
rename from meta/recipes-extended/pam/libpam/pam.d/common-password
rename to meta/recipes-extended/pam/files/pam.d/common-password
diff --git a/meta/recipes-extended/pam/libpam/pam.d/common-session b/meta=
/recipes-extended/pam/files/pam.d/common-session
similarity index 100%
rename from meta/recipes-extended/pam/libpam/pam.d/common-session
rename to meta/recipes-extended/pam/files/pam.d/common-session
diff --git a/meta/recipes-extended/pam/libpam/pam.d/common-session-nonint=
eractive b/meta/recipes-extended/pam/files/pam.d/common-session-nonintera=
ctive
similarity index 100%
rename from meta/recipes-extended/pam/libpam/pam.d/common-session-noninte=
ractive
rename to meta/recipes-extended/pam/files/pam.d/common-session-noninterac=
tive
diff --git a/meta/recipes-extended/pam/libpam/pam.d/other b/meta/recipes-=
extended/pam/files/pam.d/other
similarity index 100%
rename from meta/recipes-extended/pam/libpam/pam.d/other
rename to meta/recipes-extended/pam/files/pam.d/other
diff --git a/meta/recipes-extended/pam/libpam/run-ptest b/meta/recipes-ex=
tended/pam/files/run-ptest
similarity index 100%
rename from meta/recipes-extended/pam/libpam/run-ptest
rename to meta/recipes-extended/pam/files/run-ptest
diff --git a/meta/recipes-extended/pam/libpam-modules.bb b/meta/recipes-e=
xtended/pam/libpam-modules.bb
new file mode 100644
index 0000000000..aa5703ba3b
--- /dev/null
+++ b/meta/recipes-extended/pam/libpam-modules.bb
@@ -0,0 +1,112 @@
+require libpam.inc
+
+PACKAGECONFIG +=3D "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}=
"
+
+PACKAGES +=3D "libpam-runtime ${PN}-xtests"
+
+FILES:${PN} =3D ""
+FILES:${PN}-dev =3D ""
+FILES:libpam-runtime +=3D "${sysconfdir} ${sbindir} ${systemd_system_uni=
tdir} ${nonarch_libdir}/tmpfiles.d/pam.conf"
+FILES:${PN}-xtests =3D "${datadir}/Linux-PAM/xtests"
+
+# libpam installs /etc/environment for use with the pam_env plugin. Make=
 sure it is
+# packaged with the pam-plugin-env package to avoid breaking installatio=
ns which
+# install that file via other packages
+FILES:pam-plugin-env +=3D "${sysconfdir}/environment"
+
+PACKAGES_DYNAMIC +=3D "^${MLPREFIX}pam-plugin-.*"
+
+RPROVIDES:${PN} +=3D "libpam-modules-${libpam_suffix} libpam-runtime"
+RPROVIDES:libpam-runtime +=3D "libpam-runtime-${libpam_suffix}"
+
+RDEPENDS:libpam-runtime +=3D "${MLPREFIX}libpam-${libpam_suffix} \
+    ${MLPREFIX}pam-plugin-deny-${libpam_suffix} \
+    ${MLPREFIX}pam-plugin-permit-${libpam_suffix} \
+    ${MLPREFIX}pam-plugin-warn-${libpam_suffix} \
+    ${MLPREFIX}pam-plugin-unix-${libpam_suffix} \
+    "
+
+RDEPENDS:${PN}-xtests =3D "${MLPREFIX}libpam-${libpam_suffix} \
+    ${MLPREFIX}pam-plugin-access-${libpam_suffix} \
+    ${MLPREFIX}pam-plugin-debug-${libpam_suffix} \
+    ${MLPREFIX}pam-plugin-pwhistory-${libpam_suffix} \
+    ${MLPREFIX}pam-plugin-succeed-if-${libpam_suffix} \
+    ${MLPREFIX}pam-plugin-time-${libpam_suffix} \
+    bash coreutils"
+# FIXME: Native suffix breaks here, disable it for now
+RDEPENDS:${PN} +=3D "${MLPREFIX}libpam-${libpam_suffix}"
+RRECOMMENDS:${PN} +=3D "${MLPREFIX}libpam-runtime-${libpam_suffix}"
+RRECOMMENDS:${PN}:class-native =3D ""
+
+python populate_packages:prepend () {
+    def pam_plugin_hook(file, pkg, pattern, format, basename):
+        pn =3D d.getVar('PN')
+        libpam_suffix =3D d.getVar('libpam_suffix')
+
+        rdeps =3D d.getVar('RDEPENDS:' + pkg)
+        if rdeps:
+            rdeps =3D rdeps + " " + "${MLPREFIX}libpam" + "-" + libpam_s=
uffix
+        else:
+            rdeps =3D "${MLPREFIX}libpam" + "-" + libpam_suffix
+        d.setVar('RDEPENDS:' + pkg, rdeps)
+
+        provides =3D d.getVar('RPROVIDES:' + pkg)
+        if provides:
+            provides =3D provides + " " + pkg + "-" + libpam_suffix
+        else:
+            provides =3D pkg + "-" + libpam_suffix
+        d.setVar('RPROVIDES:' + pkg, provides)
+
+    mlprefix =3D d.getVar('MLPREFIX') or ''
+    dvar =3D d.expand('${WORKDIR}/package')
+    pam_libdir =3D d.expand('${nonarch_libdir}/security')
+    pam_sbindir =3D d.expand('${sbindir}')
+    pam_filterdir =3D d.expand('${nonarch_libdir}/security/pam_filter')
+    pam_pkgname =3D mlprefix + 'pam-plugin%s'
+
+    do_split_packages(d, pam_libdir, r'^pam(.*)\.so$', pam_pkgname,
+                      'PAM plugin for %s', hook=3Dpam_plugin_hook, extra=
_depends=3D'', prepend=3DTrue)
+    do_split_packages(d, pam_filterdir, r'^(.*)$', 'pam-filter-%s', 'PAM=
 filter for %s', extra_depends=3D'')
+}
+
+do_install:append() {
+
+	rm -rf ${D}${includedir} ${D}${libdir}/pkgconfig ${D}${libdir}/*.so* ${=
D}${localstatedir}
+
+        if ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','false','tr=
ue',d)}; then
+            rm -rf ${D}${sysconfdir}/init.d/
+            rm -rf ${D}${sysconfdir}/rc*
+            install -d ${D}${nonarch_libdir}/tmpfiles.d
+            install -m 0644 ${UNPACKDIR}/pam-volatiles.conf \
+                    ${D}${nonarch_libdir}/tmpfiles.d/pam.conf
+        else
+            install -d ${D}${sysconfdir}/default/volatiles
+            install -m 0644 ${UNPACKDIR}/99_pam \
+                    ${D}${sysconfdir}/default/volatiles/
+        fi
+
+	install -d ${D}${sysconfdir}/pam.d/
+	install -m 0644 ${UNPACKDIR}/pam.d/* ${D}${sysconfdir}/pam.d/
+
+	# The lsb requires unix_chkpwd has setuid permission
+	chmod 4755 ${D}${sbindir}/unix_chkpwd
+
+	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)};=
 then
+		echo "session optional pam_systemd.so" >> ${D}${sysconfdir}/pam.d/comm=
on-session
+	fi
+}
+
+pkg_postinst:${PN}() {
+         if [ -z "$D" ] && [ -e /etc/init.d/populate-volatile.sh ] ; the=
n
+                 /etc/init.d/populate-volatile.sh update
+         fi
+}
+
+BBCLASSEXTEND =3D "nativesdk native"
+
+CONFFILES:libpam-runtime +=3D "${sysconfdir}/pam.d/common-session"
+CONFFILES:libpam-runtime +=3D "${sysconfdir}/pam.d/common-auth"
+CONFFILES:libpam-runtime +=3D "${sysconfdir}/pam.d/common-password"
+CONFFILES:libpam-runtime +=3D "${sysconfdir}/pam.d/common-session-nonint=
eractive"
+CONFFILES:libpam-runtime +=3D "${sysconfdir}/pam.d/common-account"
+CONFFILES:libpam-runtime +=3D "${sysconfdir}/security/limits.conf"
diff --git a/meta/recipes-extended/pam/libpam.bb b/meta/recipes-extended/=
pam/libpam.bb
new file mode 100644
index 0000000000..68a52ca75b
--- /dev/null
+++ b/meta/recipes-extended/pam/libpam.bb
@@ -0,0 +1,17 @@
+require libpam.inc
+
+do_install() {
+	install -d ${D}${libdir}/pkgconfig ${D}${includedir}/security
+	for file in ${B}/libpam/libpam.so* ${B}/libpamc/libpamc.so* ${B}/libpam=
_misc/libpam_misc.so*; do
+		if ! [ -d "$file" ]; then
+			cp -rfd "$file" ${D}${libdir}
+		fi
+	done
+	for file in ${S}/libpam/include/security/*.h ${S}/libpamc/include/secur=
ity/*.h ${S}/libpam_misc/include/security/*.h; do
+		install -m644 "$file" ${D}${includedir}/security
+	done
+	cp ${B}/meson-private/*.pc ${D}${nonarch_libdir}/pkgconfig
+}
+
+RPROVIDES:${PN} +=3D "libpam-${libpam_suffix}"
+BBCLASSEXTEND +=3D "native nativesdk"
diff --git a/meta/recipes-extended/pam/libpam.inc b/meta/recipes-extended=
/pam/libpam.inc
new file mode 100644
index 0000000000..e103aa4878
--- /dev/null
+++ b/meta/recipes-extended/pam/libpam.inc
@@ -0,0 +1,57 @@
+DISABLE_STATIC =3D ""
+SUMMARY =3D "Linux-PAM (Pluggable Authentication Modules)"
+DESCRIPTION =3D "Linux-PAM (Pluggable Authentication Modules for Linux),=
 a flexible mechanism for authenticating users"
+HOMEPAGE =3D "https://fedorahosted.org/linux-pam/"
+BUGTRACKER =3D "https://fedorahosted.org/linux-pam/newticket"
+SECTION =3D "base"
+# PAM is dual licensed under GPL and BSD.
+# /etc/pam.d comes from Debian libpam-runtime in 2009-11 (at that time
+# libpam-runtime-1.0.1 is GPL-2.0-or-later), by openembedded
+LICENSE =3D "GPL-2.0-or-later | BSD-3-Clause"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D7eb5c1bf854e8881005d673599ee7=
4d3 \
+                    file://libpamc/License;md5=3Da4da476a14c093fdc73be3c=
3c9ba8fb3 \
+                    "
+
+SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/Linux-PAM-${PV}.tar.xz \
+           file://99_pam \
+           file://pam.d/common-account \
+           file://pam.d/common-auth \
+           file://pam.d/common-password \
+           file://pam.d/common-session \
+           file://pam.d/common-session-noninteractive \
+           file://pam.d/other \
+           file://pam-volatiles.conf \
+           file://0001-meson.build-correct-check-for-existence-of-two-pr=
epr.patch \
+           "
+
+SRC_URI[sha256sum] =3D "57dcd7a6b966ecd5bbd95e1d11173734691e16b68692fa59=
661cdae9b13b1697"
+PV =3D "1.7.0"
+
+DEPENDS =3D "bison-native flex-native libxml2-native virtual/crypt"
+
+EXTRA_OEMESON =3D "-Ddocs=3Ddisabled"
+
+S =3D "${WORKDIR}/Linux-PAM-${PV}"
+
+inherit meson gettext pkgconfig systemd github-releases features_check
+
+PACKAGECONFIG ?=3D ""
+PACKAGECONFIG[audit] =3D "-Daudit=3Denabled,-Daudit=3Ddisabled,audit,"
+PACKAGECONFIG[examples] =3D "-Dexamples=3Dtrue,-Dexamples=3Dfalse"
+PACKAGECONFIG[openssl] =3D "-Dopenssl=3Denabled,-Dopenssl=3Ddisabled,ope=
nssl"
+PACKAGECONFIG[selinux] =3D "-Dselinux=3Denabled,-Dselinux=3Ddisabled,lib=
selinux"
+PACKAGECONFIG[systemd] =3D "-Dlogind=3Denabled,-Dlogind=3Ddisabled,syste=
md"
+PACKAGECONFIG[userdb] =3D "-Dpam_userdb=3Denabled -Ddb=3Dgdbm,-Dpam_user=
db=3Ddisabled,gdbm,"
+PACKAGECONFIG[xtests] =3D "-Dxtests=3Dtrue,-Dxtests=3Dfalse"
+
+def get_multilib_bit(d):
+    baselib =3D d.getVar('baselib') or ''
+    return baselib.replace('lib', '')
+
+libpam_suffix =3D "suffix${@get_multilib_bit(d)}"
+
+REQUIRED_DISTRO_FEATURES:class-target =3D "pam"
+
+GITHUB_BASE_URI =3D "https://github.com/linux-pam/linux-pam/releases"
+
+CVE_PRODUCT =3D "linux-pam"
diff --git a/meta/recipes-extended/pam/libpam_1.7.0.bb b/meta/recipes-ext=
ended/pam/libpam_1.7.0.bb
deleted file mode 100644
index 2c134c1378..0000000000
--- a/meta/recipes-extended/pam/libpam_1.7.0.bb
+++ /dev/null
@@ -1,168 +0,0 @@
-DISABLE_STATIC =3D ""
-SUMMARY =3D "Linux-PAM (Pluggable Authentication Modules)"
-DESCRIPTION =3D "Linux-PAM (Pluggable Authentication Modules for Linux),=
 a flexible mechanism for authenticating users"
-HOMEPAGE =3D "https://fedorahosted.org/linux-pam/"
-BUGTRACKER =3D "https://fedorahosted.org/linux-pam/newticket"
-SECTION =3D "base"
-# PAM is dual licensed under GPL and BSD.
-# /etc/pam.d comes from Debian libpam-runtime in 2009-11 (at that time
-# libpam-runtime-1.0.1 is GPL-2.0-or-later), by openembedded
-LICENSE =3D "GPL-2.0-or-later | BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D7eb5c1bf854e8881005d673599ee7=
4d3 \
-                    file://libpamc/License;md5=3Da4da476a14c093fdc73be3c=
3c9ba8fb3 \
-                    "
-
-SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/Linux-PAM-${PV}.tar.xz \
-           file://99_pam \
-           file://pam.d/common-account \
-           file://pam.d/common-auth \
-           file://pam.d/common-password \
-           file://pam.d/common-session \
-           file://pam.d/common-session-noninteractive \
-           file://pam.d/other \
-           file://run-ptest \
-           file://pam-volatiles.conf \
-           file://0001-meson.build-correct-check-for-existence-of-two-pr=
epr.patch \
-           "
-
-SRC_URI[sha256sum] =3D "57dcd7a6b966ecd5bbd95e1d11173734691e16b68692fa59=
661cdae9b13b1697"
-
-DEPENDS =3D "bison-native flex-native libxml2-native virtual/crypt"
-
-EXTRA_OEMESON =3D "-Ddocs=3Ddisabled"
-
-S =3D "${WORKDIR}/Linux-PAM-${PV}"
-
-inherit meson gettext pkgconfig systemd ptest github-releases
-
-PACKAGECONFIG ?=3D ""
-PACKAGECONFIG[audit] =3D "-Daudit=3Denabled,-Daudit=3Ddisabled,audit,"
-PACKAGECONFIG[examples] =3D "-Dexamples=3Dtrue,-Dexamples=3Dfalse"
-PACKAGECONFIG[openssl] =3D "-Dopenssl=3Denabled,-Dopenssl=3Ddisabled,ope=
nssl"
-PACKAGECONFIG[selinux] =3D "-Dselinux=3Denabled,-Dselinux=3Ddisabled,lib=
selinux"
-PACKAGECONFIG[systemd] =3D "-Dlogind=3Denabled,-Dlogind=3Ddisabled,syste=
md"
-PACKAGECONFIG[userdb] =3D "-Dpam_userdb=3Denabled -Ddb=3Dgdbm,-Dpam_user=
db=3Ddisabled,gdbm,"
-PACKAGECONFIG[xtests] =3D "-Dxtests=3Dtrue,-Dxtests=3Dfalse"
-
-PACKAGES +=3D "${PN}-runtime ${PN}-xtests"
-FILES:${PN} =3D " \
-    ${libdir}/lib*${SOLIBS} \
-    ${nonarch_libdir}/tmpfiles.d/*.conf \
-"
-FILES:${PN}-dev +=3D "${libdir}/security/*.la ${libdir}/*.la ${libdir}/l=
ib*${SOLIBSDEV}"
-FILES:${PN}-runtime =3D "${sysconfdir} ${sbindir} ${nonarch_libdir}/syst=
emd/system"
-FILES:${PN}-xtests =3D "${datadir}/Linux-PAM/xtests"
-
-# libpam installs /etc/environment for use with the pam_env plugin. Make=
 sure it is
-# packaged with the pam-plugin-env package to avoid breaking installatio=
ns which
-# install that file via other packages
-FILES:pam-plugin-env =3D "${sysconfdir}/environment"
-
-PACKAGES_DYNAMIC +=3D "^${MLPREFIX}pam-plugin-.*"
-
-def get_multilib_bit(d):
-    baselib =3D d.getVar('baselib') or ''
-    return baselib.replace('lib', '')
-
-libpam_suffix =3D "suffix${@get_multilib_bit(d)}"
-
-RPROVIDES:${PN} +=3D "${PN}-${libpam_suffix}"
-RPROVIDES:${PN}-runtime +=3D "${PN}-runtime-${libpam_suffix}"
-
-RDEPENDS:${PN}-runtime =3D "${PN}-${libpam_suffix} \
-    ${MLPREFIX}pam-plugin-deny-${libpam_suffix} \
-    ${MLPREFIX}pam-plugin-permit-${libpam_suffix} \
-    ${MLPREFIX}pam-plugin-warn-${libpam_suffix} \
-    ${MLPREFIX}pam-plugin-unix-${libpam_suffix} \
-    "
-RDEPENDS:${PN}-xtests =3D "${PN}-${libpam_suffix} \
-    ${MLPREFIX}pam-plugin-access-${libpam_suffix} \
-    ${MLPREFIX}pam-plugin-debug-${libpam_suffix} \
-    ${MLPREFIX}pam-plugin-pwhistory-${libpam_suffix} \
-    ${MLPREFIX}pam-plugin-succeed-if-${libpam_suffix} \
-    ${MLPREFIX}pam-plugin-time-${libpam_suffix} \
-    bash coreutils"
-
-# FIXME: Native suffix breaks here, disable it for now
-RRECOMMENDS:${PN} =3D "${PN}-runtime-${libpam_suffix}"
-RRECOMMENDS:${PN}:class-native =3D ""
-
-python populate_packages:prepend () {
-    def pam_plugin_hook(file, pkg, pattern, format, basename):
-        pn =3D d.getVar('PN')
-        libpam_suffix =3D d.getVar('libpam_suffix')
-
-        rdeps =3D d.getVar('RDEPENDS:' + pkg)
-        if rdeps:
-            rdeps =3D rdeps + " " + pn + "-" + libpam_suffix
-        else:
-            rdeps =3D pn + "-" + libpam_suffix
-        d.setVar('RDEPENDS:' + pkg, rdeps)
-
-        provides =3D d.getVar('RPROVIDES:' + pkg)
-        if provides:
-            provides =3D provides + " " + pkg + "-" + libpam_suffix
-        else:
-            provides =3D pkg + "-" + libpam_suffix
-        d.setVar('RPROVIDES:' + pkg, provides)
-
-    mlprefix =3D d.getVar('MLPREFIX') or ''
-    dvar =3D d.expand('${WORKDIR}/package')
-    pam_libdir =3D d.expand('${libdir}/security')
-    pam_sbindir =3D d.expand('${sbindir}')
-    pam_filterdir =3D d.expand('${libdir}/security/pam_filter')
-    pam_pkgname =3D mlprefix + 'pam-plugin%s'
-
-    do_split_packages(d, pam_libdir, r'^pam(.*)\.so$', pam_pkgname,
-                      'PAM plugin for %s', hook=3Dpam_plugin_hook, extra=
_depends=3D'', prepend=3DTrue)
-    do_split_packages(d, pam_filterdir, r'^(.*)$', 'pam-filter-%s', 'PAM=
 filter for %s', extra_depends=3D'')
-}
-
-do_install:append() {
-	# don't install /var/run when populating rootfs. Do it through volatile
-	rm -rf ${D}${localstatedir}
-
-        if ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','false','tr=
ue',d)}; then
-            rm -rf ${D}${sysconfdir}/init.d/
-            rm -rf ${D}${sysconfdir}/rc*
-            install -d ${D}${nonarch_libdir}/tmpfiles.d
-            install -m 0644 ${UNPACKDIR}/pam-volatiles.conf \
-                    ${D}${nonarch_libdir}/tmpfiles.d/pam.conf
-        else
-            install -d ${D}${sysconfdir}/default/volatiles
-            install -m 0644 ${UNPACKDIR}/99_pam \
-                    ${D}${sysconfdir}/default/volatiles/
-        fi
-
-	install -d ${D}${sysconfdir}/pam.d/
-	install -m 0644 ${UNPACKDIR}/pam.d/* ${D}${sysconfdir}/pam.d/
-
-	# The lsb requires unix_chkpwd has setuid permission
-	chmod 4755 ${D}${sbindir}/unix_chkpwd
-
-	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)};=
 then
-		echo "session optional pam_systemd.so" >> ${D}${sysconfdir}/pam.d/comm=
on-session
-	fi
-}
-
-pkg_postinst:${PN}() {
-         if [ -z "$D" ] && [ -e /etc/init.d/populate-volatile.sh ] ; the=
n
-                 /etc/init.d/populate-volatile.sh update
-         fi
-}
-
-inherit features_check
-ANY_OF_DISTRO_FEATURES =3D "pam systemd"
-
-BBCLASSEXTEND =3D "nativesdk native"
-
-CONFFILES:${PN}-runtime +=3D "${sysconfdir}/pam.d/common-session"
-CONFFILES:${PN}-runtime +=3D "${sysconfdir}/pam.d/common-auth"
-CONFFILES:${PN}-runtime +=3D "${sysconfdir}/pam.d/common-password"
-CONFFILES:${PN}-runtime +=3D "${sysconfdir}/pam.d/common-session-noninte=
ractive"
-CONFFILES:${PN}-runtime +=3D "${sysconfdir}/pam.d/common-account"
-CONFFILES:${PN}-runtime +=3D "${sysconfdir}/security/limits.conf"
-
-GITHUB_BASE_URI =3D "https://github.com/linux-pam/linux-pam/releases"
-
-CVE_PRODUCT =3D "linux-pam"
--=20
2.47.0


