Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f178.google.com (mail-we0-f178.google.com
	[74.125.82.178])
	by mail.openembedded.org (Postfix) with ESMTP id AC9116D354
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 18:08:01 +0000 (UTC)
Received: by mail-we0-f178.google.com with SMTP id u56so110522wes.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 10:08:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-type:content-transfer-encoding;
	bh=sh7waV4SGLgOaIc7LFM0WVyfV4m6YuGv9F3UP4AF7Rw=;
	b=B+8L6wPhVxK1pE8WslhhlYL+RB6NSm799kDWKBFdgeJej55HVnX8sVp85T8sR72Jf7
	fGBo8KHUiP/0L7eMI1lyRFLf1M+/528hUY6PIQL1QyYc2U1RAvcdeszJJ/K48Yhwh1zl
	HpkMxk38A/0IgXgw/3264Ub09SwkRGH7wmGzSXG/s8LyT51fsZ8dVA1LWxzUmz3pzmt0
	JXG+Z2t5wQV+ZPu31s7iSx4BTGFOj3JXFODllJKMePmJBzUxrz0JKGWDLeS1BmMa/W8A
	/YoKxcZVEcjOgGTyd1r4rCb0CbJMCjBkpzGuJ8lWfbALroXgj7q1NhrOw1z+MXDuLgK8
	cjKw==
X-Gm-Message-State: ALoCoQmV8ADo6zu04GxPvXUheFyZp/BqMHFaWqKEP54yOG05y5AE5Rk71x5eLGVkbdll7KTJnq0G
X-Received: by 10.180.19.201 with SMTP id h9mr30861708wie.36.1385057280830;
	Thu, 21 Nov 2013 10:08:00 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	gl10sm5919144wib.11.2013.11.21.10.07.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Nov 2013 10:08:00 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Nov 2013 18:07:54 +0000
Message-Id: <1385057274-17130-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH] json-glib: enable ptest
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
X-List-Received-Date: Thu, 21 Nov 2013 18:08:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use a patch from upstream to install the test suite and add the minimal logic to
integrate it with ptest.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../json-glib/json-glib/install-tests.patch        |  186 ++++++++++++++++++++
 meta/recipes-gnome/json-glib/json-glib/run-ptest   |    3 +
 meta/recipes-gnome/json-glib/json-glib_0.16.2.bb   |   13 +-
 3 files changed, 200 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-gnome/json-glib/json-glib/install-tests.patch
 create mode 100644 meta/recipes-gnome/json-glib/json-glib/run-ptest

diff --git a/meta/recipes-gnome/json-glib/json-glib/install-tests.patch b/meta/recipes-gnome/json-glib/json-glib/install-tests.patch
new file mode 100644
index 0000000..4bd9764
--- /dev/null
+++ b/meta/recipes-gnome/json-glib/json-glib/install-tests.patch
@@ -0,0 +1,186 @@
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 3e9858cb9c34f492ad0859bd262c8c4691260b41 Mon Sep 17 00:00:00 2001
+From: Emmanuele Bassi <ebassi@gnome.org>
+Date: Thu, 16 May 2013 23:27:56 +0100
+Subject: [PATCH] build: Add --enable-installed-tests
+
+See https://live.gnome.org/GnomeGoals/InstalledTests for more
+information.
+
+It's still possible to run `make check` with locally uninstalled tests.
+---
+ .gitignore                  |    1 +
+ configure.ac                |   16 ++++++++++++++-
+ json-glib/tests/Makefile.am |   46 +++++++++++++++++++++++++++++++++++--------
+ json-glib/tests/parser.c    |   24 +++++++++++++++++++---
+ 4 files changed, 75 insertions(+), 12 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index a84dbb3..54b9706 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -160,6 +160,19 @@ AS_IF([test "x$enable_maintainer_flags" = "xyes" && test "x$GCC" = "xyes"],
+ MAINTAINER_CFLAGS="${MAINTAINER_CFLAGS#*  }"
+ AC_SUBST([MAINTAINER_CFLAGS])
+ 
++dnl === Test suite ============================================================
++
++AC_ARG_ENABLE(modular_tests,
++              AS_HELP_STRING([--disable-modular-tests],
++                             [Disable build of test programs (default: no)]),,
++              [enable_modular_tests=yes])
++AC_ARG_ENABLE(installed_tests,
++              AS_HELP_STRING([--enable-installed-tests],
++                             [Install test programs (default: no)]),,
++              [enable_installed_tests=no])
++AM_CONDITIONAL(BUILD_MODULAR_TESTS, test x$enable_modular_tests = xyes || test x$enable_installed_tests=xyes)
++AM_CONDITIONAL(BUILDOPT_INSTALL_TESTS, test x$enable_installed_tests = xyes)
++
+ dnl === Test coverage =========================================================
+ 
+ AC_ARG_ENABLE([gcov],
+@@ -297,7 +310,8 @@ echo " • Compiler flags: ${CFLAGS} ${MAINTAINER_CFLAGS}"
+ echo ""
+ echo " • API reference: ${enable_gtk_doc}"
+ echo ""
+-echo " • Enable test suite: ${enable_glibtest}"
++echo " • Enable test suite: ${enable_modular_tests}"
++echo " • Install tests: ${enable_installed_tests}"
+ echo " • Build introspection data: ${enable_introspection}"
+ echo " • Enable test coverage: ${use_gcov}"
+ echo ""
+diff --git a/json-glib/tests/Makefile.am b/json-glib/tests/Makefile.am
+index 9815b95..23a93d6 100644
+--- a/json-glib/tests/Makefile.am
++++ b/json-glib/tests/Makefile.am
+@@ -5,22 +5,23 @@ NULL =
+ 
+ DISTCLEANFILES =
+ 
+-INCLUDES = \
+-	-I$(top_srcdir)			\
+-	-I$(top_srcdir)/json-glib	\
++insttestdir=$(pkglibexecdir)/installed-tests
++
++AM_CPPFLAGS = \
++	$(JSON_DEBUG_CFLAGS) \
++	-DTESTS_DATA_DIR=\""$(top_srcdir)/json-glib/tests"\" \
++	-I$(top_srcdir)	\
++	-I$(top_srcdir)/json-glib \
+ 	$(NULL)
+ 
+-AM_CPPFLAGS = $(JSON_DEBUG_CFLAGS) -DTESTS_DATA_DIR=\""$(top_srcdir)/json-glib/tests"\"
+ AM_CFLAGS = -g $(JSON_CFLAGS) $(MAINTAINER_CFLAGS)
++
+ LDADD = \
+ 	../libjson-glib-1.0.la \
+ 	$(JSON_LIBS) \
+ 	$(NULL)
+ 
+-EXTRA_DIST += stream-load.json
+-
+-noinst_PROGRAMS = $(TEST_PROGS)
+-TEST_PROGS += \
++all_test_programs = \
+ 	array			\
+ 	boxed			\
+ 	builder			\
+@@ -37,4 +38,33 @@ TEST_PROGS += \
+ 	serialize-full		\
+ 	$(NULL)
+ 
++test_files = \
++	stream-load.json 	\
++	$(NULL)
++
++if BUILD_MODULAR_TESTS
++TEST_PROGS += $(all_test_programs)
++noinst_PROGRAMS = $(TEST_PROGS)
++endif
++
++if BUILDOPT_INSTALL_TESTS
++insttest_PROGRAMS = $(all_test_programs)
++
++testmetadir = $(datadir)/installed-tests/$(PACKAGE)
++testmeta_DATA = $(all_test_programs:=.test)
++
++testdatadir=$(insttestdir)
++testdata_DATA = $(test_files)
++
++testdata_SCRIPTS = $(test_script_files)
++endif
++
++EXTRA_DIST += $(test_files)
++
++%.test: % Makefile
++	$(AM_V_GEN) (echo '[Test]' > $@.tmp; \
++	echo 'Type=session' >> $@.tmp; \
++	echo 'Exec=env JSON_TEST_DATA=$(pkglibexecdir)/installed-tests $(pkglibexecdir)/installed-tests/$<' >> $@.tmp; \
++	mv $@.tmp $@)
++
+ -include $(top_srcdir)/build/autotools/Makefile.am.gitignore
+diff --git a/json-glib/tests/parser.c b/json-glib/tests/parser.c
+index dc64f75..948d18e 100644
+--- a/json-glib/tests/parser.c
++++ b/json-glib/tests/parser.c
+@@ -655,10 +655,17 @@ test_stream_sync (void)
+   GFileInputStream *stream;
+   GError *error = NULL;
+   JsonNode *root;
++  const char *tests_data_dir;
++  char *path;
+ 
+   parser = json_parser_new ();
+ 
+-  file = g_file_new_for_path (TESTS_DATA_DIR "/stream-load.json");
++  tests_data_dir = g_getenv ("JSON_TEST_DATA");
++  if (tests_data_dir == NULL || *tests_data_dir == '\0')
++    tests_data_dir = TESTS_DATA_DIR;
++
++  path = g_build_filename (tests_data_dir, "stream-load.json", NULL);
++  file = g_file_new_for_path (path);
+   stream = g_file_read (file, NULL, &error);
+   g_assert (error == NULL);
+   g_assert (stream != NULL);
+@@ -673,6 +680,7 @@ test_stream_sync (void)
+   g_object_unref (stream);
+   g_object_unref (file);
+   g_object_unref (parser);
++  g_free (path);
+ }
+ 
+ static void
+@@ -703,9 +711,18 @@ test_stream_async (void)
+   GMainLoop *main_loop;
+   GError *error = NULL;
+   JsonParser *parser = json_parser_new ();
+-  GFile *file = g_file_new_for_path (TESTS_DATA_DIR "/stream-load.json");
+-  GFileInputStream *stream = g_file_read (file, NULL, &error);
++  GFile *file;
++  GFileInputStream *stream;
++  const char *tests_data_dir;
++  char *path;
+ 
++  tests_data_dir = g_getenv ("JSON_TEST_DATA");
++  if (tests_data_dir == NULL || *tests_data_dir == '\0')
++    tests_data_dir = TESTS_DATA_DIR;
++
++  path = g_build_filename (tests_data_dir, "stream-load.json", NULL);
++  file = g_file_new_for_path (path);
++  stream = g_file_read (file, NULL, &error);
+   g_assert (error == NULL);
+   g_assert (stream != NULL);
+ 
+@@ -721,6 +738,7 @@ test_stream_async (void)
+   g_object_unref (stream);
+   g_object_unref (file);
+   g_object_unref (parser);
++  g_free (path);
+ }
+ 
+ int
+-- 
+1.7.10.4
+
diff --git a/meta/recipes-gnome/json-glib/json-glib/run-ptest b/meta/recipes-gnome/json-glib/json-glib/run-ptest
new file mode 100644
index 0000000..0c6398a
--- /dev/null
+++ b/meta/recipes-gnome/json-glib/json-glib/run-ptest
@@ -0,0 +1,3 @@
+#! /bin/sh
+
+gnome-desktop-testing-runner json-glib
diff --git a/meta/recipes-gnome/json-glib/json-glib_0.16.2.bb b/meta/recipes-gnome/json-glib/json-glib_0.16.2.bb
index 350558a..90c3b60 100644
--- a/meta/recipes-gnome/json-glib/json-glib_0.16.2.bb
+++ b/meta/recipes-gnome/json-glib/json-glib_0.16.2.bb
@@ -12,10 +12,19 @@ DEPENDS = "glib-2.0"
 
 GNOME_COMPRESS_TYPE = "xz"
 
+inherit gnome gettext ptest
+
+SRC_URI += "file://install-tests.patch \
+            file://run-ptest"
+
 SRC_URI[archive.md5sum] = "0c6121741956fc34933a7ebae5868ec2"
 SRC_URI[archive.sha256sum] = "a95475364ec27ab1d2a69303cf579018558bfb6981e3498b3aaf1e6401f7422c"
 
-inherit gnome gettext
-
 EXTRA_OECONF = "--disable-introspection \
                 ${@base_contains('DISTRO_FEATURES', 'ptest', '--enable-installed-tests', '--disable-installed-tests', d)}"
+
+FILES_${PN}-ptest += "${libexecdir}/json-glib/installed-tests/* \
+                      ${datadir}/installed-tests/json-glib"
+FILES_${PN}-dbg += "${libexecdir}/json-glib/installed-tests/.debug"
+
+RDEPENDS_${PN}-ptest += "gnome-desktop-testing"
-- 
1.7.10.4


