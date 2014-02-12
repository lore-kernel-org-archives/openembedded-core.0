Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 0EE696E71A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2014 12:11:47 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s1CCBh5k010876 for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2014 12:11:43 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id b12hxs0a19Qk
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2014 12:11:43 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s1CCBe6x010872
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2014 12:11:41 GMT
Message-ID: <1392207094.7120.192.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 12 Feb 2014 12:11:34 +0000
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] meta/recipes: Remove virtclass references
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
X-List-Received-Date: Wed, 12 Feb 2014 12:11:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The virtclass overrides will go away at some point (apart from the multilib one).
Change them all to class-xxx instead since people enjoy copy and pasting them.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/ptest.bbclass b/meta/classes/ptest.bbclass
index caf7101..c37dfac 100644
--- a/meta/classes/ptest.bbclass
+++ b/meta/classes/ptest.bbclass
@@ -8,8 +8,8 @@ SECTION_${PN}-ptest = "devel"
 ALLOW_EMPTY_${PN}-ptest = "1"
 PTEST_ENABLED = "${@base_contains('DISTRO_FEATURES', 'ptest', '1', '0', d)}"
 PTEST_ENABLED_class-native = ""
-RDEPENDS_${PN}-ptest_virtclass-native = ""
-RDEPENDS_${PN}-ptest_virtclass-nativesdk = ""
+RDEPENDS_${PN}-ptest_class-native = ""
+RDEPENDS_${PN}-ptest_class-nativesdk = ""
 
 PACKAGES =+ "${@base_contains('DISTRO_FEATURES', 'ptest', '${PN}-ptest', '', d)}"
 
diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.bbclass
index ad803c2..4b92d8d 100644
--- a/meta/classes/update-rc.d.bbclass
+++ b/meta/classes/update-rc.d.bbclass
@@ -2,7 +2,7 @@ UPDATERCPN ?= "${PN}"
 
 DEPENDS_append = " update-rc.d-native"
 UPDATERCD = "update-rc.d"
-UPDATERCD_virtclass-cross = ""
+UPDATERCD_class-cross = ""
 UPDATERCD_class-native = ""
 UPDATERCD_class-nativesdk = ""
 
diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index 22bae97..b5f3768 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -5,7 +5,7 @@ inherit useradd_base
 # and support files needed to add and modify user and group accounts
 DEPENDS_append = "${USERADDDEPENDS}"
 USERADDDEPENDS = " base-passwd shadow-native shadow-sysroot shadow"
-USERADDDEPENDS_virtclass-cross = ""
+USERADDDEPENDS_class-cross = ""
 USERADDDEPENDS_class-native = ""
 USERADDDEPENDS_class-nativesdk = ""
 
@@ -117,17 +117,17 @@ useradd_sysroot_sstate () {
 
 do_install[prefuncs] += "${SYSROOTFUNC}"
 SYSROOTFUNC = "useradd_sysroot"
-SYSROOTFUNC_virtclass-cross = ""
+SYSROOTFUNC_class-cross = ""
 SYSROOTFUNC_class-native = ""
 SYSROOTFUNC_class-nativesdk = ""
 SSTATEPREINSTFUNCS += "${SYSROOTPOSTFUNC}"
 SYSROOTPOSTFUNC = "useradd_sysroot_sstate"
-SYSROOTPOSTFUNC_virtclass-cross = ""
+SYSROOTPOSTFUNC_class-cross = ""
 SYSROOTPOSTFUNC_class-native = ""
 SYSROOTPOSTFUNC_class-nativesdk = ""
 
 USERADDSETSCENEDEPS = "${MLPREFIX}base-passwd:do_populate_sysroot_setscene shadow-native:do_populate_sysroot_setscene ${MLPREFIX}shadow-sysroot:do_populate_sysroot_setscene"
-USERADDSETSCENEDEPS_virtclass-cross = ""
+USERADDSETSCENEDEPS_class-cross = ""
 USERADDSETSCENEDEPS_class-native = ""
 USERADDSETSCENEDEPS_class-nativesdk = ""
 do_package_setscene[depends] += "${USERADDSETSCENEDEPS}"
diff --git a/meta/recipes-core/dbus/dbus-ptest_1.6.18.bb b/meta/recipes-core/dbus/dbus-ptest_1.6.18.bb
index 386f561..30e8223 100644
--- a/meta/recipes-core/dbus/dbus-ptest_1.6.18.bb
+++ b/meta/recipes-core/dbus/dbus-ptest_1.6.18.bb
@@ -27,7 +27,7 @@ FILESPATH = "${FILE_DIRNAME}/dbus"
 inherit autotools pkgconfig gettext ptest
 
 EXTRA_OECONF_X = "${@base_contains('DISTRO_FEATURES', 'x11', '--with-x', '--without-x', d)}"
-EXTRA_OECONF_X_virtclass-native = "--without-x"
+EXTRA_OECONF_X_class-native = "--without-x"
 
 EXTRA_OECONF = "--enable-tests \
                 --enable-modular-tests \
diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index 01cdf13..a94466a 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -33,11 +33,11 @@ base_libdir_class-native = "${libdir}"
 # This was derrived from the upstream debian ncurses which uses
 # these settings for 32 and 64 bit hosts.
 EXCONFIG_ARGS = ""
-EXCONFIG_ARGS_virtclass-native = " \
+EXCONFIG_ARGS_class-native = " \
 		--disable-lp64 \
 		--with-chtype='long' \
 		--with-mmask-t='long'"
-EXCONFIG_ARGS_virtclass-nativesdk = " \
+EXCONFIG_ARGS_class-nativesdk = " \
 		--disable-lp64 \
 		--with-chtype='long' \
 		--with-mmask-t='long'"
@@ -50,11 +50,11 @@ PACKAGES_DYNAMIC = "^${PN}-lib.*"
 # because the sstate had a hard coded search path.  Until this is fixed
 # another way this is deemed good enough.
 EX_TERMCAP = ""
-EX_TERMCAP_virtclass-native = ":/etc/termcap:/usr/share/misc/termcap"
-EX_TERMCAP_virtclass-nativesdk = ":/etc/termcap:/usr/share/misc/termcap"
+EX_TERMCAP_class-native = ":/etc/termcap:/usr/share/misc/termcap"
+EX_TERMCAP_class-nativesdk = ":/etc/termcap:/usr/share/misc/termcap"
 EX_TERMINFO = ""
-EX_TERMINFO_virtclass-native = ":/etc/terminfo:/usr/share/terminfo:/usr/share/misc/terminfo:/lib/terminfo"
-EX_TERMINFO_virtclass-nativesdk = ":/etc/terminfo:/usr/share/terminfo:/usr/share/misc/terminfo:/lib/terminfo"
+EX_TERMINFO_class-native = ":/etc/terminfo:/usr/share/terminfo:/usr/share/misc/terminfo:/lib/terminfo"
+EX_TERMINFO_class-nativesdk = ":/etc/terminfo:/usr/share/terminfo:/usr/share/misc/terminfo:/lib/terminfo"
 
 # Helper function for do_configure to allow multiple configurations
 # $1 the directory to run configure in
diff --git a/meta/recipes-devtools/pseudo/pseudo.inc b/meta/recipes-devtools/pseudo/pseudo.inc
index f1d3db5..42738ab 100644
--- a/meta/recipes-devtools/pseudo/pseudo.inc
+++ b/meta/recipes-devtools/pseudo/pseudo.inc
@@ -29,7 +29,7 @@ do_configure () {
 }
 
 NO32LIBS ??= "1"
-NO32LIBS_virtclass-nativesdk = "1"
+NO32LIBS_class-nativesdk = "1"
 
 # Compile for the local machine arch...
 do_compile () {
diff --git a/meta/recipes-devtools/python/python-distribute_0.6.32.bb b/meta/recipes-devtools/python/python-distribute_0.6.32.bb
index ddc8d00..2925114 100644
--- a/meta/recipes-devtools/python/python-distribute_0.6.32.bb
+++ b/meta/recipes-devtools/python/python-distribute_0.6.32.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://setup.py;beginline=234;endline=234;md5=26f6b02022b737
 SRCNAME = "distribute"
 PR = "ml5"
 DEPENDS += "python"
-DEPENDS_virtclass-native += "python-native"
+DEPENDS_class-native += "python-native"
 
 SRC_URI = " \
   http://pypi.python.org/packages/source/d/distribute/${SRCNAME}-${PV}.tar.gz \
diff --git a/meta/recipes-devtools/python/python3-distribute_0.6.32.bb b/meta/recipes-devtools/python/python3-distribute_0.6.32.bb
index d4f00cd..d3b15c1 100644
--- a/meta/recipes-devtools/python/python3-distribute_0.6.32.bb
+++ b/meta/recipes-devtools/python/python3-distribute_0.6.32.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://setup.py;beginline=234;endline=234;md5=26f6b02022b737
 SRCNAME = "distribute"
 PR = "ml5"
 DEPENDS += "python3"
-DEPENDS_virtclass-native += "python3-native"
+DEPENDS_class-native += "python3-native"
 
 SRC_URI = " \
   http://pypi.python.org/packages/source/d/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
diff --git a/meta/recipes-graphics/wayland/wayland_1.3.0.bb b/meta/recipes-graphics/wayland/wayland_1.3.0.bb
index 212e08a..aa04f8d 100644
--- a/meta/recipes-graphics/wayland/wayland_1.3.0.bb
+++ b/meta/recipes-graphics/wayland/wayland_1.3.0.bb
@@ -21,10 +21,10 @@ inherit autotools pkgconfig
 # We need wayland-native for the wayland-scanner utility
 BBCLASSEXTEND = "native"
 
-DEPENDS_virtclass-native = "expat-native libffi-native"
+DEPENDS_class-native = "expat-native libffi-native"
 DEPENDS = "expat libffi wayland-native"
 
-EXTRA_OECONF_virtclass-native = "--disable-documentation"
+EXTRA_OECONF_class-native = "--disable-documentation"
 EXTRA_OECONF = "--disable-documentation --disable-scanner"
 
 # Wayland installs a M4 macro for other projects to use, which uses the target



