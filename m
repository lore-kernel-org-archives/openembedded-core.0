Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BCBAD78308
	for <webhook@archiver.kernel.org>; Mon,  2 Dec 2024 10:53:58 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web10.170637.1733136829924705463
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Dec 2024 02:53:50 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd88.aul.t-online.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout09.t-online.de (Postfix) with SMTP id 03463563
	for <openembedded-core@lists.openembedded.org>; Mon,  2 Dec 2024 11:53:48 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.160.60]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tI43n-3JMmbh0; Mon, 2 Dec 2024 11:53:47 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [RFC][oe-core][PATCH] pam: update 1.6.1 -> 1.7.0
Date: Mon,  2 Dec 2024 11:53:39 +0100
Message-ID: <20241202105339.58026-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1733136827-F4FFFC42-8B1B6C63/0/0 CLEAN NORMAL
X-TOI-MSGID: f5d13991-d1b4-4b83-866c-8da11aea4040
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Dec 2024 10:53:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208137

- switch to meson build system

I've been testing this patch for a few days now. In libpam the autotools
buildsystem was removed. This patch switches to meson.

The libpam recipe was split into two parts and now compiles twice. First =
only the
libs are packaged and afterwards the libpam modules. This breaks a depend=
ency loop
and makes it possible to link against systemd to enable 'logind' support =
for
the modules.

The patch is invasive, but my tests so far are promising. It compiles for=
 x86-64/arm/arm64
and mutlilib and it seems to fix the build for libpam-native (and a missi=
ng DISTRO_FEATURES issue).
Although not yet compilable, it also reduces the dependency loops between=
 systemd<->shadow
and should allow to build pam without systemd in DISTRO_FEATURES

One file is still packed into libpam-modules. This should be moved to the=
 appropriate module,
but I'm not sure what the /run/sepermit directory is needed for.
There is also a patch added that fixes a problem in meson when checking f=
or keyring. But when
I wanted to send it upstream, I saw that the problem was already solved a=
nd submitted nicer by
Alexander Kanavin

The ptest part is also still missing. When xtests is enabled, the tests c=
ompile without errors,
but by default they are neither built nor installed. So I wanted to ask f=
irst, what of this is
still needed?

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/conf/distro/include/maintainers.inc      |   1 +
 .../0001-meson.build-fix-keyring-check.patch  |  39 ++++
 .../pam/{libpam =3D> files}/99_pam              |   0
 .../pam/{libpam =3D> files}/libpam-xtests.patch |   0
 .../pam/{libpam =3D> files}/pam-volatiles.conf  |   0
 .../{libpam =3D> files}/pam.d/common-account    |   0
 .../pam/{libpam =3D> files}/pam.d/common-auth   |   0
 .../{libpam =3D> files}/pam.d/common-password   |   0
 .../{libpam =3D> files}/pam.d/common-session    |   0
 .../pam.d/common-session-noninteractive       |   0
 .../pam/{libpam =3D> files}/pam.d/other         |   0
 .../pam/{libpam =3D> files}/run-ptest           |   0
 meta/recipes-extended/pam/libpam-modules.bb   | 110 ++++++++++
 meta/recipes-extended/pam/libpam.bb           |  16 ++
 meta/recipes-extended/pam/libpam.inc          |  56 ++++++
 meta/recipes-extended/pam/libpam_1.6.1.bb     | 190 ------------------
 16 files changed, 222 insertions(+), 190 deletions(-)
 create mode 100644 meta/recipes-extended/pam/files/0001-meson.build-fix-=
keyring-check.patch
 rename meta/recipes-extended/pam/{libpam =3D> files}/99_pam (100%)
 rename meta/recipes-extended/pam/{libpam =3D> files}/libpam-xtests.patch=
 (100%)
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
 delete mode 100644 meta/recipes-extended/pam/libpam_1.6.1.bb

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
diff --git a/meta/recipes-extended/pam/files/0001-meson.build-fix-keyring=
-check.patch b/meta/recipes-extended/pam/files/0001-meson.build-fix-keyri=
ng-check.patch
new file mode 100644
index 0000000000..6cd3ab4724
--- /dev/null
+++ b/meta/recipes-extended/pam/files/0001-meson.build-fix-keyring-check.=
patch
@@ -0,0 +1,39 @@
+From 5dbe719b22e9e779ef44cbe5b01a4235eaf02132 Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Sat, 30 Nov 2024 13:53:49 +0100
+Subject: [PATCH] meson.build: fix keyring check
+
+The check for enable_pam_keyinit fails with -1
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+
+Upstream-Status: Pending []
+---
+ meson.build | 11 ++++++++++-
+ 1 file changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 2be21282..444e626c 100644
+--- a/meson.build
++++ b/meson.build
+@@ -198,7 +198,16 @@ foreach ident: check_functions
+   endif
+ endforeach
+=20
+-enable_pam_keyinit =3D cc.sizeof('__NR_keyctl', prefix: '#include <sys/=
syscall.h>') > 0
++enable_pam_keyinit =3D \
++    cc.compiles('''
++    #include <errno.h>
++    #include <asm/unistd.h>
++    #include <linux/keyctl.h>
++    #include <sys/syscall.h>
++    #include <unistd.h>
++    int main(void) {
++        return syscall(__NR_keyctl, KEYCTL_READ, 0, NULL, NULL, 0);
++    }''')
+=20
+ if get_option('mailspool') !=3D ''
+   cdata.set_quoted('PAM_PATH_MAILDIR', get_option('mailspool'))
+--=20
+2.47.0
+
diff --git a/meta/recipes-extended/pam/libpam/99_pam b/meta/recipes-exten=
ded/pam/files/99_pam
similarity index 100%
rename from meta/recipes-extended/pam/libpam/99_pam
rename to meta/recipes-extended/pam/files/99_pam
diff --git a/meta/recipes-extended/pam/libpam/libpam-xtests.patch b/meta/=
recipes-extended/pam/files/libpam-xtests.patch
similarity index 100%
rename from meta/recipes-extended/pam/libpam/libpam-xtests.patch
rename to meta/recipes-extended/pam/files/libpam-xtests.patch
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
index 0000000000..7903c6d6f8
--- /dev/null
+++ b/meta/recipes-extended/pam/libpam-modules.bb
@@ -0,0 +1,110 @@
+require libpam.inc
+
+PACKAGECONFIG +=3D "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}=
"
+
+PACKAGES +=3D "libpam-runtime"
+
+FILES:${PN} =3D " \
+    ${nonarch_libdir}/tmpfiles.d/*.conf \
+"
+FILES:${PN}-dev +=3D "${nonarch_libdir}/security/*.la ${base_libdir}/*.l=
a ${base_libdir}/lib*${SOLIBSDEV}"
+FILES:libpam-runtime =3D "${sysconfdir} ${sbindir} ${systemd_system_unit=
dir}"
+
+# libpam installs /etc/environment for use with the pam_env plugin. Make=
 sure it is
+# packaged with the pam-plugin-env package to avoid breaking installatio=
ns which
+# install that file via other packages
+FILES:pam-plugin-env =3D "${sysconfdir}/environment"
+
+PACKAGES_DYNAMIC +=3D "^${MLPREFIX}pam-plugin-.*"
+
+def get_multilib_bit(d):
+    baselib =3D d.getVar('baselib') or ''
+    return baselib.replace('lib', '')
+
+libpam_suffix =3D "suffix${@get_multilib_bit(d)}"
+
+RPROVIDES:${PN} +=3D "libpam-modules-${libpam_suffix} libpam-runtime"
+RPROVIDES:libpam-runtime +=3D "libpam-runtime-${libpam_suffix}"
+
+RDEPENDS:libpam-runtime =3D "${MLPREFIX}libpam libpam-modules-${libpam_s=
uffix} \
+    ${MLPREFIX}pam-plugin-deny-${libpam_suffix} \
+    ${MLPREFIX}pam-plugin-permit-${libpam_suffix} \
+    ${MLPREFIX}pam-plugin-warn-${libpam_suffix} \
+    ${MLPREFIX}pam-plugin-unix-${libpam_suffix} \
+    "
+
+# FIXME: Native suffix breaks here, disable it for now
+RDEPENDS:${MLPREFIX}${PN} +=3D "${MLPREFIX}libpam libpam-runtime-${libpa=
m_suffix}"
+RDEPENDS:${MLPREFIX}pam-filter-upperlower +=3D "${MLPREFIX}libpam"
+RRECOMMENDS:${PN}:class-native +=3D ""
+
+python populate_packages:prepend () {
+    def pam_plugin_hook(file, pkg, pattern, format, basename):
+        pn =3D d.getVar('PN')
+        libpam_suffix =3D d.getVar('libpam_suffix')
+
+        rdeps =3D "${MLPREFIX}libpam"
+        if rdeps:
+            rdeps =3D rdeps + " " + pn + "-" + libpam_suffix
+        else:
+            rdeps =3D pn + "-" + libpam_suffix
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
+	rm -rf ${D}${includedir}/security ${D}${libdir}/pkgconfig ${D}${libdir}=
/*.so*
+
+        if ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','false','tr=
ue',d)}; then
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
index 0000000000..781595ac72
--- /dev/null
+++ b/meta/recipes-extended/pam/libpam.bb
@@ -0,0 +1,16 @@
+require libpam.inc
+
+do_install() {
+	install -d ${D}${libdir}/pkgconfig ${D}${includedir}/security
+	for file in ${B}/libpam/libpam.so* ${B}/libpamc/libpamc.so* ${B}/libpam=
_misc/libpam_misc.so*; do
+		if ! [ -d "$file" ]; then
+			cp -fd "$file" ${D}${libdir}
+		fi
+	done
+	for file in ${S}/libpam/include/security/*.h ${S}/libpamc/include/secur=
ity/*.h ${S}/libpam_misc/include/security/*.h; do
+		install -m644 "$file" ${D}${includedir}/security
+	done
+	cp ${B}/meson-private/*.pc ${D}${nonarch_libdir}/pkgconfig
+}
+
+BBCLASSEXTEND +=3D "native nativesdk"
diff --git a/meta/recipes-extended/pam/libpam.inc b/meta/recipes-extended=
/pam/libpam.inc
new file mode 100644
index 0000000000..bb6776dcca
--- /dev/null
+++ b/meta/recipes-extended/pam/libpam.inc
@@ -0,0 +1,56 @@
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
+           file://libpam-xtests.patch;apply=3Dno \
+           file://run-ptest \
+           file://pam-volatiles.conf \
+           file://0001-meson.build-fix-keyring-check.patch \
+           "
+
+SRC_URI[sha256sum] =3D "57dcd7a6b966ecd5bbd95e1d11173734691e16b68692fa59=
661cdae9b13b1697"
+PV =3D "1.7.0"
+
+DEPENDS =3D "bison-native flex-native libxml2-native virtual/crypt"
+
+EXTRA_OEMESON =3D " \
+                -Dsystemdunitdir=3D${systemd_system_unitdir} \
+                -Dnis=3Ddisabled \
+                -Ddocs=3Ddisabled \
+"
+
+S =3D "${WORKDIR}/Linux-PAM-${PV}"
+
+inherit meson gettext pkgconfig github-releases features_check
+
+PACKAGECONFIG ??=3D ""
+PACKAGECONFIG[systemd] =3D "-Dlogind=3Denabled,-Dlogind=3Ddisabled,syste=
md"
+PACKAGECONFIG[audit] =3D "-Daudit=3Denabled,-Daudit=3Ddisabled,audit"
+PACKAGECONFIG[userdb] =3D "-Ddb=3Ddb,-Dpam_userdb=3Ddisabled,db"
+PACKAGECONFIG[xtests] =3D "-Dxtests=3Dtrue,-Dxtests=3Dfalse"
+PACKAGECONFIG[openssl] =3D "-Dopenssl=3Denabled,-Dopenssl=3Ddisabled,ope=
nssl"
+PACKAGECONFIG[examples] =3D "-Dexamples=3Dtrue,-Dexamples=3Dfalse"
+
+REQUIRED_DISTRO_FEATURES:class-target =3D "pam"
+
+GITHUB_BASE_URI =3D "https://github.com/linux-pam/linux-pam/releases"
+
+CVE_PRODUCT =3D "linux-pam"
diff --git a/meta/recipes-extended/pam/libpam_1.6.1.bb b/meta/recipes-ext=
ended/pam/libpam_1.6.1.bb
deleted file mode 100644
index a48f78187b..0000000000
--- a/meta/recipes-extended/pam/libpam_1.6.1.bb
+++ /dev/null
@@ -1,190 +0,0 @@
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
-           file://libpam-xtests.patch \
-           file://run-ptest \
-           file://pam-volatiles.conf \
-           "
-
-SRC_URI[sha256sum] =3D "f8923c740159052d719dbfc2a2f81942d68dd34fcaf61c70=
6a02c9b80feeef8e"
-
-DEPENDS =3D "bison-native flex-native libxml2-native virtual/crypt"
-
-EXTRA_OECONF =3D "--includedir=3D${includedir}/security \
-                --libdir=3D${base_libdir} \
-                --with-systemdunitdir=3D${systemd_system_unitdir} \
-                --disable-nis \
-                --disable-regenerate-docu \
-                --disable-doc \
-		--disable-prelude"
-
-CFLAGS +=3D "-fPIC "
-
-S =3D "${WORKDIR}/Linux-PAM-${PV}"
-
-inherit autotools gettext pkgconfig systemd ptest github-releases
-
-PACKAGECONFIG ??=3D ""
-PACKAGECONFIG[audit] =3D "--enable-audit,--disable-audit,audit,"
-PACKAGECONFIG[userdb] =3D "--enable-db=3Ddb,--enable-db=3Dno,db,"
-
-PACKAGES +=3D "${PN}-runtime ${PN}-xtests"
-FILES:${PN} =3D " \
-    ${base_libdir}/lib*${SOLIBS} \
-    ${nonarch_libdir}/tmpfiles.d/*.conf \
-"
-FILES:${PN}-dev +=3D "${base_libdir}/security/*.la ${base_libdir}/*.la $=
{base_libdir}/lib*${SOLIBSDEV}"
-FILES:${PN}-runtime =3D "${sysconfdir} ${sbindir} ${systemd_system_unitd=
ir}"
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
-    pam_libdir =3D d.expand('${base_libdir}/security')
-    pam_sbindir =3D d.expand('${sbindir}')
-    pam_filterdir =3D d.expand('${base_libdir}/security/pam_filter')
-    pam_pkgname =3D mlprefix + 'pam-plugin%s'
-
-    do_split_packages(d, pam_libdir, r'^pam(.*)\.so$', pam_pkgname,
-                      'PAM plugin for %s', hook=3Dpam_plugin_hook, extra=
_depends=3D'', prepend=3DTrue)
-    do_split_packages(d, pam_filterdir, r'^(.*)$', 'pam-filter-%s', 'PAM=
 filter for %s', extra_depends=3D'')
-}
-
-do_compile_ptest() {
-        cd tests
-        sed -i -e 's/$(MAKE) $(AM_MAKEFLAGS) check-TESTS//' Makefile
-        oe_runmake check-am
-        cd -
-}
-
-do_install() {
-	autotools_do_install
-
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
-	if [ "${base_libdir}" !=3D "${libdir}" ]; then
-		install -d ${D}/${libdir}/
-		mv ${D}/${base_libdir}/pkgconfig ${D}/${libdir}/
-	fi
-}
-
-do_install_ptest() {
-    mkdir -p ${D}${PTEST_PATH}/tests
-    install -m 0755 ${B}/tests/.libs/* ${D}${PTEST_PATH}/tests
-    install -m 0644 ${S}/tests/confdir ${D}${PTEST_PATH}/tests
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


