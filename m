Return-Path: <Daniel.Bornaz@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 8BF4E6AC9D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jul 2014 08:37:42 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.158.1;
	Thu, 10 Jul 2014 10:37:37 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4483)	id B349E288F30;
	Thu, 10 Jul 2014 10:37:37 +0200 (CEST)
From: Daniel BORNAZ <daniel.bornaz@enea.com>
To: <yocto@yoctoproject.org>, <openembedded-core@lists.openembedded.org>
Date: Thu, 10 Jul 2014 10:37:34 +0200
Message-ID: <1404981454-20330-1-git-send-email-daniel.bornaz@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: daniel.bornaz@enea.com does not
	designate permitted sender hosts)
Subject: [PATCH 1/1] dbus update to 1.8.6 (CVE-2014-3532)
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
X-List-Received-Date: Thu, 10 Jul 2014 08:37:45 -0000
Content-Type: text/plain

Version update for fixing two DoS vulnerabilities in dbus-daemon (CVE-2014-3532).

[LXCR-3405]

Signed-off-by: Daniel BORNAZ <daniel.bornaz@enea.com>
---
 .../dbus/dbus-glib-0.102/no-examples.patch         | 15 ++++++
 .../dbus-glib-0.102/obsolete_automake_macros.patch | 15 ++++++
 .../dbus-glib-0.102/test-install-makefile.patch    | 48 ++++++++++++++++++
 meta/recipes-core/dbus/dbus-glib_0.102.bb          |  8 +++
 meta/recipes-core/dbus/dbus-test_1.8.6.bb          | 59 ++++++++++++++++++++++
 meta/recipes-core/dbus/dbus_1.8.6.bb               |  4 ++
 6 files changed, 149 insertions(+)
 create mode 100644 meta/recipes-core/dbus/dbus-glib-0.102/no-examples.patch
 create mode 100644 meta/recipes-core/dbus/dbus-glib-0.102/obsolete_automake_macros.patch
 create mode 100644 meta/recipes-core/dbus/dbus-glib-0.102/test-install-makefile.patch
 create mode 100644 meta/recipes-core/dbus/dbus-glib_0.102.bb
 create mode 100644 meta/recipes-core/dbus/dbus-test_1.8.6.bb
 create mode 100644 meta/recipes-core/dbus/dbus_1.8.6.bb

diff --git a/meta/recipes-core/dbus/dbus-glib-0.102/no-examples.patch b/meta/recipes-core/dbus/dbus-glib-0.102/no-examples.patch
new file mode 100644
index 0000000..fbb4967
--- /dev/null
+++ b/meta/recipes-core/dbus/dbus-glib-0.102/no-examples.patch
@@ -0,0 +1,15 @@
+Disable compiling examples
+
+Upstream-Status: Inappropriate [disable feature]
+
+Signed-off-by: Kevin Tian <kevin.tian@intel.com>
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
+--- dbus-glib-0.70/dbus/Makefile.am.orig	2006-07-23 16:04:43.000000000 +0200
++++ dbus-glib-0.70/dbus/Makefile.am	2006-07-23 16:04:52.000000000 +0200
+@@ -1,4 +1,4 @@
+-SUBDIRS = . examples
++SUBDIRS = .
+ 
+ INCLUDES=-I$(top_srcdir) $(DBUS_CFLAGS) $(DBUS_GLIB_CFLAGS) $(DBUS_GLIB_TOOL_CFLAGS) -DDBUS_COMPILATION=1 -DDBUS_LOCALEDIR=\"$(prefix)/@DATADIRNAME@/locale\" 
+ 
diff --git a/meta/recipes-core/dbus/dbus-glib-0.102/obsolete_automake_macros.patch b/meta/recipes-core/dbus/dbus-glib-0.102/obsolete_automake_macros.patch
new file mode 100644
index 0000000..40e3b12
--- /dev/null
+++ b/meta/recipes-core/dbus/dbus-glib-0.102/obsolete_automake_macros.patch
@@ -0,0 +1,15 @@
+Upstream-Status: Submitted [https://bugs.freedesktop.org/show_bug.cgi?id=59003]
+
+Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
+diff -Nurd dbus-glib-0.100/configure.ac dbus-glib-0.100/configure.ac
+--- dbus-glib-0.100/configure.ac	2012-06-25 19:26:39.000000000 +0300
++++ dbus-glib-0.100/configure.ac	2013-01-03 04:53:22.314976758 +0200
+@@ -8,7 +8,7 @@
+
+ AM_INIT_AUTOMAKE([1.9])
+
+-AM_CONFIG_HEADER(config.h)
++AC_CONFIG_HEADERS(config.h)
+
+ # Honor aclocal flags
+ ACLOCAL="$ACLOCAL $ACLOCAL_FLAGS"
diff --git a/meta/recipes-core/dbus/dbus-glib-0.102/test-install-makefile.patch b/meta/recipes-core/dbus/dbus-glib-0.102/test-install-makefile.patch
new file mode 100644
index 0000000..2e8e178
--- /dev/null
+++ b/meta/recipes-core/dbus/dbus-glib-0.102/test-install-makefile.patch
@@ -0,0 +1,48 @@
+Change Makefile.am to install regression tests for test package purpose.
+
+Upstream-Status: Inappropriate [test not install is for purpose from upstream]
+
+Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
+
+diff --git a/test/Makefile.am b/test/Makefile.am
+index 7ba11a8..249f0e7 100644
+--- a/test/Makefile.am
++++ b/test/Makefile.am
+@@ -13,7 +13,8 @@ else
+ TEST_BINARIES=
+ endif
+ 
+-noinst_PROGRAMS= $(TEST_BINARIES)
++testdir = $(datadir)/@PACKAGE@/tests
++test_PROGRAMS= $(TEST_BINARIES)
+ 
+ test_service_SOURCES=				\
+ 	test-service.c
+diff --git a/test/interfaces/Makefile.am b/test/interfaces/Makefile.am
+index 3cb2c39..e6de67d 100644
+--- a/test/interfaces/Makefile.am
++++ b/test/interfaces/Makefile.am
+@@ -39,7 +39,8 @@ if DBUS_BUILD_TESTS
+ 
+ ## we use noinst_PROGRAMS not check_PROGRAMS for TESTS so that we
+ ## build even when not doing "make check"
+-noinst_PROGRAMS = test-service test-client
++testdir = $(datadir)/@PACKAGE@/tests/interfaces
++test_PROGRAMS = test-service test-client
+ 
+ test_service_SOURCES = \
+ 	test-interfaces.c \
+diff --git a/test/core/Makefile.am b/test/core/Makefile.am
+index ef6cb26..9786c3a 100644
+--- a/test/core/Makefile.am
++++ b/test/core/Makefile.am
+@@ -46,7 +46,8 @@ endif
+ 
+ ## we use noinst_PROGRAMS not check_PROGRAMS for TESTS so that we
+ ## build even when not doing "make check"
+-noinst_PROGRAMS = \
++testdir = $(datadir)/@PACKAGE@/tests/core
++test_PROGRAMS = \
+ 	test-dbus-glib \
+ 	test-service-glib \
+ 	$(THREAD_APPS) \
diff --git a/meta/recipes-core/dbus/dbus-glib_0.102.bb b/meta/recipes-core/dbus/dbus-glib_0.102.bb
new file mode 100644
index 0000000..28e8a72
--- /dev/null
+++ b/meta/recipes-core/dbus/dbus-glib_0.102.bb
@@ -0,0 +1,8 @@
+require dbus-glib.inc
+
+SRC_URI = "http://dbus.freedesktop.org/releases/dbus-glib/dbus-glib-${PV}.tar.gz \
+           file://no-examples.patch \
+"
+
+SRC_URI[md5sum] = "f76b8558fd575d0106c3a556eaa49184"
+SRC_URI[sha256sum] = "6964ed585bb8149a14ab744b5ded5e77cf71ec5446e6dcc5fcf5eebcc52df29c"
diff --git a/meta/recipes-core/dbus/dbus-test_1.8.6.bb b/meta/recipes-core/dbus/dbus-test_1.8.6.bb
new file mode 100644
index 0000000..53c5d9a
--- /dev/null
+++ b/meta/recipes-core/dbus/dbus-test_1.8.6.bb
@@ -0,0 +1,59 @@
+SUMMARY = "D-Bus test package (for D-bus functionality testing only)"
+HOMEPAGE = "http://dbus.freedesktop.org"
+SECTION = "base"
+LICENSE = "AFL-2 | GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=10dded3b58148f3f1fd804b26354af3e \
+                    file://dbus/dbus.h;beginline=6;endline=20;md5=7755c9d7abccd5dbd25a6a974538bb3c"
+
+DEPENDS = "python-pygobject dbus dbus-glib"
+
+RDEPENDS_${PN} += "make"
+RDEPENDS_${PN}-dev = ""
+
+SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
+           file://tmpdir.patch \
+           file://dbus-1.init  \
+           file://run-ptest \
+           file://python-config.patch \
+           file://clear-guid_from_server-if-send_negotiate_unix_f.patch \
+           "
+
+SRC_URI[md5sum] = "6a08ba555d340e9dfe2d623b83c0eea8"
+
+S="${WORKDIR}/dbus-${PV}"
+FILESEXTRAPATHS =. "${FILE_DIRNAME}/dbus:"
+
+inherit autotools pkgconfig gettext ptest
+
+EXTRA_OECONF_X = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '--with-x', '--without-x', d)}"
+EXTRA_OECONF_X_class-native = "--without-x"
+
+EXTRA_OECONF = "--enable-tests \
+                --enable-modular-tests \
+                --enable-installed-tests \
+                --enable-checks \
+                --enable-asserts \
+                --enable-verbose-mode \
+                --disable-xml-docs \
+                --disable-doxygen-docs \
+                --disable-libaudit \
+                --disable-systemd \
+                --without-systemdsystemunitdir \
+                --with-dbus-test-dir=${PTEST_PATH} \
+                ${EXTRA_OECONF_X}"
+
+do_install() {
+}
+
+do_install_ptest() {
+	install -d ${D}${PTEST_PATH}/test
+	case1="shell printf refs syslog"
+	for i in ${case1}; do install ${B}/test/test-$i ${D}${PTEST_PATH}/test; done
+	case2="marshal syntax corrupt dbus-daemon dbus-daemon-eavesdrop loopback relay"
+	for i in ${case2}; do install ${B}/test/.libs/test-$i ${D}${PTEST_PATH}/test; done
+	case3="bus bus-system bus-launch-helper"
+	for i in ${case3}; do install ${B}/bus/test-$i ${D}${PTEST_PATH}/test; done
+	install ${B}/dbus/test-dbus ${D}${PTEST_PATH}/test
+	cp -r ${B}/test/data ${D}${PTEST_PATH}/test
+}
+RDEPENDS_${PN}-ptest += "bash"
diff --git a/meta/recipes-core/dbus/dbus_1.8.6.bb b/meta/recipes-core/dbus/dbus_1.8.6.bb
new file mode 100644
index 0000000..2fd630f
--- /dev/null
+++ b/meta/recipes-core/dbus/dbus_1.8.6.bb
@@ -0,0 +1,4 @@
+include dbus.inc
+
+SRC_URI[md5sum] = "6a08ba555d340e9dfe2d623b83c0eea8"
+SRC_URI[sha256sum] = "eded83ca007b719f32761e60fd8b9ffd0f5796a4caf455b01b5a5ef740ebd23f"
-- 
1.9.1


