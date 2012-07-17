Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <yao.zhao@windriver.com>) id 1SrEq9-0007K2-NY
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 22:57:54 +0200
Received: from yzhao2-OptiPlex-990.corp.ad.wrs.com
	(yzhao2-optiplex-990.corp.ad.wrs.com [128.224.147.210])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q6HKkWQP012588
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2012 13:46:33 -0700 (PDT)
From: Yao Zhao <yao.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jul 2012 16:46:30 -0400
Message-Id: <1342557990-15381-1-git-send-email-yao.zhao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH v2] dbus-glib: add support for install regression tests
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
X-List-Received-Date: Tue, 17 Jul 2012 20:57:54 -0000

dbus-glib.inc: default turn off unit test as libdbus-glib-1.so.2.2.2 will
have unit test code if DBUS_BUILD_TESTS enabled. User can turn it on with
PACKAGECONFIG_pn-dbus-glib = "tests" in local.conf or
PACKAGECONFIG ??= "tests" in recipe itself.

test-install-makefile.patch: install unit tests for test purpose

Add tests and tests-dbg package.

Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
---
 .../dbus-glib-0.98/test-install-makefile.patch     |   48 ++++++++++++++++++++
 meta/recipes-core/dbus/dbus-glib.inc               |   14 +++++-
 2 files changed, 61 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/dbus/dbus-glib-0.98/test-install-makefile.patch

diff --git a/meta/recipes-core/dbus/dbus-glib-0.98/test-install-makefile.patch b/meta/recipes-core/dbus/dbus-glib-0.98/test-install-makefile.patch
new file mode 100644
index 0000000..2e8e178
--- /dev/null
+++ b/meta/recipes-core/dbus/dbus-glib-0.98/test-install-makefile.patch
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
diff --git a/meta/recipes-core/dbus/dbus-glib.inc b/meta/recipes-core/dbus/dbus-glib.inc
index f554ce8..a8e6d42 100644
--- a/meta/recipes-core/dbus/dbus-glib.inc
+++ b/meta/recipes-core/dbus/dbus-glib.inc
@@ -13,15 +13,21 @@ DEPENDS_virtclass-native = "glib-2.0-native dbus-native"
 SRC_URI = "http://dbus.freedesktop.org/releases/dbus-glib/dbus-glib-${PV}.tar.gz \
            file://no-examples.patch \
            file://test-service-glib-include-glib-only.patch \
+           file://test-install-makefile.patch \
 "
 
 inherit autotools pkgconfig gettext
 
+#default disable regression tests, some unit test code in non testing code
+#PACKAGECONFIG_pn-${PN} = "tests" enable regression tests local.conf
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[tests] = "--enable-tests,,,"
+
 EXTRA_OECONF = "--with-introspect-xml=${STAGING_DATADIR_NATIVE}/dbus/dbus-bus-introspect.xml \
                 --with-dbus-binding-tool=${STAGING_BINDIR_NATIVE}/dbus-binding-tool"
 EXTRA_OECONF_virtclass-native = "--with-introspect-xml=${STAGING_DATADIR_NATIVE}/dbus/dbus-bus-introspect.xml"
 
-PACKAGES += "${PN}-bash-completion"
+PACKAGES += "${PN}-bash-completion ${PN}-tests-dbg ${PN}-tests"
 
 FILES_${PN} = "${libdir}/lib*${SOLIBS}"
 FILES_${PN}-bash-completion = "${sysconfdir}/bash_completion.d/dbus-bash-completion.sh \
@@ -29,4 +35,10 @@ FILES_${PN}-bash-completion = "${sysconfdir}/bash_completion.d/dbus-bash-complet
 FILES_${PN}-dev += "${libdir}/dbus-1.0/include ${bindir}/dbus-glib-tool"
 FILES_${PN}-dev += "${bindir}/dbus-binding-tool"
 
+RDEPENDS_${PN}-tests += "dbus-x11"
+FILES_${PN}-tests = "${datadir}/${PN}/tests"
+FILES_${PN}-tests-dbg = "${datadir}/${PN}/tests/.debug/* \
+                         ${datadir}/${PN}/tests/core/.debug/* \
+                         ${datadir}/${PN}/tests/interfaces/.debug/*"
+
 BBCLASSEXTEND = "native"
-- 
1.7.9.5



