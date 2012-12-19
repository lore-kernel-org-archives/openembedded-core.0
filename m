Received: from sestofw01.enea.se ([192.36.1.252] helo=mx-3.enea.com)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <Bjoern.Stenberg@enea.com>) id 1TlMa5-0004uo-Vl
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Dec 2012 17:33:18 +0100
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.2.318.1;
	Wed, 19 Dec 2012 17:18:33 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4331)	id 0C621290C64;
	Wed, 19 Dec 2012 17:18:33 +0100 (CET)
From: =?UTF-8?q?Bj=C3=B6rn=20Stenberg?= <bjst@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 19 Dec 2012 17:18:30 +0100
Message-ID: <1355933911-48562-5-git-send-email-bjst@enea.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1355933911-48562-1-git-send-email-bjst@enea.com>
References: <1355933911-48562-1-git-send-email-bjst@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: bjst@enea.com does not designate
	permitted sender hosts)
Subject: [PATCH 4/5] Add ptest for dbus.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Dec 2012 16:33:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This patch adds a new recipe dbus-test to build and package the dbus test
suite. The reason for a separate recipe is that the dbus test suite depends
on dbus-glib, so it cannot be compiled at the same time as dbus.

Signed-off-by: Bj=C3=B6rn Stenberg <bjst@enea.com>
---
 meta/recipes-core/dbus/dbus-1.6.4/ptest.patch      |  144 ++++++++++++++++=
++++
 meta/recipes-core/dbus/dbus-1.6.4/run-ptest        |    3 +
 .../dbus/dbus-1.6.4/test-run-path.patch            |   26 ++++
 meta/recipes-core/dbus/dbus-ptest_1.6.4.bb         |   46 ++++++
 meta/recipes-core/dbus/dbus.inc                    |    2 +
 5 files changed, 221 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-core/dbus/dbus-1.6.4/ptest.patch
 create mode 100755 meta/recipes-core/dbus/dbus-1.6.4/run-ptest
 create mode 100644 meta/recipes-core/dbus/dbus-1.6.4/test-run-path.patch
 create mode 100644 meta/recipes-core/dbus/dbus-ptest_1.6.4.bb

diff --git a/meta/recipes-core/dbus/dbus-1.6.4/ptest.patch b/meta/recipes-c=
ore/dbus/dbus-1.6.4/ptest.patch
new file mode 100644
index 0000000..106bfb4
--- /dev/null
+++ b/meta/recipes-core/dbus/dbus-1.6.4/ptest.patch
@@ -0,0 +1,144 @@
+Add install-ptest rules.
+Change TEST_ENVIRONMENT to allow running outside build dir.
+
+ Makefile.am                |    7 +++++++
+ bus/Makefile.am            |    6 ++++++
+ dbus/Makefile.am           |    6 ++++++
+ doc/Makefile.am            |    4 ++++
+ test/Makefile.am           |   25 ++++++++++++++++++++-----
+ test/name-test/Makefile.am |    9 +++++++++
+ tools/Makefile.am          |   12 ++++++++++++
+ 7 files changed, 64 insertions(+), 5 deletions(-)
+
+Signed-off-by: Bj=C3=B6rn Stenberg <bjst@enea.com>
+Upstream-Status: Pending
+
+diff -ur a/Makefile.am b/Makefile.am
+--- a/Makefile.am	2012-12-06 14:34:01.157414449 +0100
++++ b/Makefile.am	2012-12-06 15:21:14.447113035 +0100
+@@ -30,4 +30,11 @@
+=20
+ ACLOCAL_AMFLAGS =3D -I m4 ${ACLOCAL_FLAGS}
+=20
++if DBUS_BUILD_TESTS
++install-ptest:
++	@for subdir in $(SUBDIRS); do \
++		$(MAKE) -C $$subdir DESTDIR=3D$(DESTDIR)/$$subdir $@; \
++	done
++endif
++
+ include tools/lcov.am
+diff -ur a/bus/Makefile.am b/bus/Makefile.am
+--- a/bus/Makefile.am	2012-12-06 14:34:01.169413931 +0100
++++ b/bus/Makefile.am	2012-12-06 15:21:14.463112346 +0100
+@@ -290,3 +290,9 @@
+ #### Extra dist
+=20
+ EXTRA_DIST=3D$(CONFIG_IN_FILES) $(SCRIPT_IN_FILES)
++
++if DBUS_BUILD_TESTS
++install-ptest:
++	@$(MKDIR_P) $(DESTDIR)
++	@install $(dbus_daemon_exec_PROGRAMS) $(noinst_PROGRAMS) $(DESTDIR)
++endif
+diff -ur a/dbus/Makefile.am b/dbus/Makefile.am
+--- a/dbus/Makefile.am	2012-12-06 14:34:01.161414276 +0100
++++ b/dbus/Makefile.am	2012-12-06 15:21:14.451112862 +0100
+@@ -310,3 +310,9 @@
+ update-systemd:
+ 	curl http://cgit.freedesktop.org/systemd/plain/src/sd-daemon.c > sd-daem=
on.c
+ 	curl http://cgit.freedesktop.org/systemd/plain/src/sd-daemon.h > sd-daem=
on.h
++
++if DBUS_BUILD_TESTS
++install-ptest:
++	@$(MKDIR_P) $(DESTDIR)
++	@install $(noinst_PROGRAMS) $(DESTDIR)
++endif
+diff -ur a/test/Makefile.am b/test/Makefile.am
+--- a/test/Makefile.am	2012-12-06 14:34:01.165414103 +0100
++++ b/test/Makefile.am	2012-12-06 15:21:14.455112690 +0100
+@@ -119,12 +119,13 @@
+ 	DBUS_TEST_HOMEDIR=3D@abs_top_builddir@/dbus \
+ 	DBUS_TEST_SYSCONFDIR=3D$(DESTDIR)$(sysconfdir)
+=20
++ptest_run_dir =3D ..
++
+ TESTS_ENVIRONMENT =3D \
+-	DBUS_BLOCK_ON_ABORT=3D1 \
+-	DBUS_FATAL_WARNINGS=3D1 \
+-	DBUS_TEST_DAEMON=3D@abs_top_builddir@/bus/dbus-daemon$(EXEEXT) \
+-	DBUS_TEST_DATA=3D@abs_top_builddir@/test/data \
+-	DBUS_TEST_HOMEDIR=3D@abs_top_builddir@/dbus \
++	DBUS_FATAL_WARNINGS=3D0 \
++	DBUS_TEST_DAEMON=3D$(ptest_run_dir)/bus/dbus-daemon$(EXEEXT) \
++	DBUS_TEST_DATA=3D$(ptest_run_dir)/test/data \
++	DBUS_TEST_HOMEDIR=3D$(ptest_run_dir)/dbus \
+ 	$(NULL)
+=20
+ test_corrupt_SOURCES =3D corrupt.c
+@@ -325,3 +326,18 @@
+ data/valid-config-files/system.conf: $(top_builddir)/bus/system.conf
+ 	$(AM_V_at)$(MKDIR_P) data/valid-config-files
+ 	$(AM_V_GEN)cp $< $@
++
++if DBUS_BUILD_TESTS
++install-ptest: install-ptest-nonrecursive
++	@for subdir in $(SUBDIRS); do \
++		if [ $$subdir !=3D "." ]; then \
++			$(MAKE) -C $$subdir DESTDIR=3D$(DESTDIR)/$$subdir $@; \
++		fi; \
++	done
++
++install-ptest-nonrecursive:
++	@$(MKDIR_P) $(DESTDIR)/data/valid-config-files/session.d
++	@for file in Makefile $(installable_tests) $(EXTRA_DIST) $(noinst_DATA);=
 do \
++		install -D $${file%.in} $(DESTDIR)/$${file%.in}; \
++	done;
++endif
+diff -ur a/test/name-test/Makefile.am b/test/name-test/Makefile.am
+--- a/test/name-test/Makefile.am	2012-12-06 14:34:01.169413931 +0100
++++ b/test/name-test/Makefile.am	2012-12-06 15:21:14.459112518 +0100
+@@ -36,4 +36,13 @@
+ test_privserver_client_LDADD=3D../libdbus-testutils.la
+ test_autolaunch_LDADD=3D../libdbus-testutils.la
+=20
++install-ptest:
++	@$(MKDIR_P) $(DESTDIR)
++	@for file in Makefile $(noinst_PROGRAMS) $(EXTRA_DIST); do \
++		if [ -f .libs/$$file ]; then \
++			install .libs/$$file $(DESTDIR); \
++		else \
++			install $$file $(DESTDIR); \
++		fi \
++	done;
+ endif
+diff -ur a/tools/Makefile.am b/tools/Makefile.am
+--- a/tools/Makefile.am	2012-12-06 14:34:01.161414276 +0100
++++ b/tools/Makefile.am	2012-12-06 15:21:14.455112690 +0100
+@@ -78,3 +78,15 @@
+=20
+ installcheck-local:
+ 	test -d $(DESTDIR)$(localstatedir)/lib/dbus
++
++if DBUS_BUILD_TESTS
++install-ptest:
++	@$(MKDIR_P) $(DESTDIR)
++	@for file in $(bin_PROGRAMS); do \
++		if [ -f .libs/$$file ]; then \
++			install .libs/$$file $(DESTDIR); \
++		else \
++			install $$file $(DESTDIR); \
++		fi; \
++	done;
++endif
+diff -ur a/doc/Makefile.am b/doc/Makefile.am
+--- a/doc/Makefile.am	2012-06-06 12:45:55.000000000 +0200
++++ b/doc/Makefile.am	2012-12-06 16:04:58.990070587 +0100
+@@ -174,3 +174,7 @@
+=20
+ maintainer-clean-local:
+ 	rm -f $(XMLTO_OUTPUT)
++
++if DBUS_BUILD_TESTS
++install-ptest:
++endif
diff --git a/meta/recipes-core/dbus/dbus-1.6.4/run-ptest b/meta/recipes-cor=
e/dbus/dbus-1.6.4/run-ptest
new file mode 100755
index 0000000..e08ecb1
--- /dev/null
+++ b/meta/recipes-core/dbus/dbus-1.6.4/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+cd test
+make -k runtest-TESTS
diff --git a/meta/recipes-core/dbus/dbus-1.6.4/test-run-path.patch b/meta/r=
ecipes-core/dbus/dbus-1.6.4/test-run-path.patch
new file mode 100644
index 0000000..5c08c93
--- /dev/null
+++ b/meta/recipes-core/dbus/dbus-1.6.4/test-run-path.patch
@@ -0,0 +1,26 @@
+
+
+Signed-off-by: Bj=C3=B6rn Stenberg <bjst@enea.com>
+Upstream-Status: Pending
+
+--- a/test/Makefile.am	2012-06-15 15:25:43.000000000 +0200
++++ b/test/Makefile.am	2012-11-16 09:24:44.263140840 +0100
+@@ -119,12 +119,13 @@
+ 	DBUS_TEST_HOMEDIR=3D@abs_top_builddir@/dbus \
+ 	DBUS_TEST_SYSCONFDIR=3D$(DESTDIR)$(sysconfdir)
+=20
++ptest_run_dir =3D ..
++
+ TESTS_ENVIRONMENT =3D \
+-	DBUS_BLOCK_ON_ABORT=3D1 \
+-	DBUS_FATAL_WARNINGS=3D1 \
+-	DBUS_TEST_DAEMON=3D@abs_top_builddir@/bus/dbus-daemon$(EXEEXT) \
+-	DBUS_TEST_DATA=3D@abs_top_builddir@/test/data \
+-	DBUS_TEST_HOMEDIR=3D@abs_top_builddir@/dbus \
++	DBUS_FATAL_WARNINGS=3D0 \
++	DBUS_TEST_DAEMON=3D$(ptest_run_dir)/bus/dbus-daemon$(EXEEXT) \
++	DBUS_TEST_DATA=3D$(ptest_run_dir)/test/data \
++	DBUS_TEST_HOMEDIR=3D$(ptest_run_dir)/dbus \
+ 	$(NULL)
+=20
+ test_corrupt_SOURCES =3D corrupt.c
diff --git a/meta/recipes-core/dbus/dbus-ptest_1.6.4.bb b/meta/recipes-core=
/dbus/dbus-ptest_1.6.4.bb
new file mode 100644
index 0000000..2982439
--- /dev/null
+++ b/meta/recipes-core/dbus/dbus-ptest_1.6.4.bb
@@ -0,0 +1,46 @@
+DESCRIPTION =3D "D-Bus test package, only used for D-bus functionality tes=
t."
+HOMEPAGE =3D "http://dbus.freedesktop.org"
+SECTION =3D "base"
+LICENSE =3D "AFL-2 | GPLv2+"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D10dded3b58148f3f1fd804b26354af3=
e \
+                    file://dbus/dbus.h;firstline=3D6;endline=3D20;md5=3D6e=
ea2e0c7750dd8e620dcb1437312fa5"
+
+DEPENDS =3D "python-pygobject dbus dbus-glib"
+
+RDEPENDS =3D "make"
+
+SRC_URI =3D "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
+           file://tmpdir.patch \
+           file://ptest.patch \
+           file://dbus-1.init  \
+           file://run-ptest \
+           "
+
+SRC_URI[md5sum] =3D "5ec43dc4554cba638917317b2b4f7640"
+SRC_URI[sha256sum] =3D "5fba6b7a415d761a843fb8e0aee72db61cf13057a9ef8cdc79=
5e5d369dc74cf1"
+
+S=3D"${WORKDIR}/dbus-${PV}"
+FILESPATH =3D "${FILE_DIRNAME}/dbus-${PV}"
+
+inherit autotools pkgconfig gettext ptest
+
+EXTRA_OECONF_X =3D "${@base_contains('DISTRO_FEATURES', 'x11', '--with-x',=
 '--without-x', d)}"
+EXTRA_OECONF_X_virtclass-native =3D "--without-x"
+
+EXTRA_OECONF =3D "--enable-tests \
+                --enable-modular-tests \
+                --enable-installed-tests \
+                --enable-checks \
+                --enable-asserts \
+                --enable-verbose-mode \
+                --disable-xml-docs \
+                --disable-doxygen-docs \
+                --disable-libaudit \
+                --with-xml=3Dexpat \
+                --with-systemdsystemunitdir=3D${systemd_unitdir}/system/ \
+                ${EXTRA_OECONF_X}"
+
+do_install() {
+    ptest_do_install
+    find ${D}${PTEST_PATH} -name Makefile | xargs sed -i 's/^Makefile:/_Ma=
kefile:/'
+}
diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.=
inc
index d165cdd..112400f 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -9,6 +9,8 @@ X11DEPENDS =3D "virtual/libx11 libsm"
 DEPENDS =3D "expat virtual/libintl ${@base_contains('DISTRO_FEATURES', 'x1=
1', '${X11DEPENDS}', '', d)}"
 DEPENDS_class-native =3D "expat-native virtual/libintl-native"
 DEPENDS_class-nativesdk =3D "nativesdk-expat virtual/nativesdk-libintl vir=
tual/libx11"
+RDEPENDS =3D "${@base_contains('DISTRO_FEATURES', 'ptest', 'dbus-ptest', '=
', d)}"
+RDEPENDS_class-native =3D ""
=20
 INC_PR =3D "r5"
=20
--=20
1.7.5.4



