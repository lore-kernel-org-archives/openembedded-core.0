Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id C650860FAF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2013 17:49:15 +0000 (UTC)
Received: by mail-wg0-f43.google.com with SMTP id z12so7670866wgg.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Oct 2013 10:49:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=DirjBOcv1Sc0uQ5WO0loXKzG99RWFQl+gfkPySAzWgY=;
	b=fXxtnCH4WckxmirLwkXOA30eysmY57+4jfuTzXADcXEJwd+98u6oH6Z62fK6iCoL+Z
	cKRjYG/OExOBwZKtoPHgS2QMG6ZUDvUeHESjfrcwzcT41Te+5yw3aMjnzRVsJGPUUvse
	qkr4yXt7l4NzOi1ipicdCzwuxMfwcHOwtuUlmbIqwdVcsOfdnb0fn+V5E01kJ2qC3gTW
	A5qrbkJ+1whPBEDLJoab2Uv0STufw6ANliyX/ORX3XBexXv40JWU5LptAwBowDvzQh90
	u4cDxrIyNLXFMWj7QsEOlZO5xNIyy9jaSmxYOVzDvGutssxsbHR08s7zyBtbR0rqeZ92
	gcmA==
X-Gm-Message-State: ALoCoQnZN7GX7ulaycBOPSQVuPgWLehX7o87Go1WHEL8OynIwz48eU4xCyzWzg4ULo55oaxMLHkH
X-Received: by 10.194.219.1 with SMTP id pk1mr6683480wjc.36.1381168157212;
	Mon, 07 Oct 2013 10:49:17 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id jf2sm41481831wic.2.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 07 Oct 2013 10:49:16 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Oct 2013 18:49:07 +0100
Message-Id: <1381168150-25518-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1381168150-25518-1-git-send-email-ross.burton@intel.com>
References: <1381168150-25518-1-git-send-email-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/5] glib-2.0: upgrade to 2.28.0
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
X-List-Received-Date: Mon, 07 Oct 2013 17:49:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Drop the ptest patches and instead use --enable-installed-tests, updating
run-ptest to invoke gnome-desktop-testing-runner.

Drop the x32 build patch, upstream has integrated a similar fix.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../glib-2.0/glib-2.0/Makefile-ptest.patch         |   61 ------------------
 .../glib-2.0/glib-2.0/glib-2.0_fix_for_x32.patch   |   42 -------------
 meta/recipes-core/glib-2.0/glib-2.0/run-ptest      |    4 +-
 meta/recipes-core/glib-2.0/glib-2.0_2.36.4.bb      |   66 --------------------
 meta/recipes-core/glib-2.0/glib-2.0_2.38.0.bb      |   65 +++++++++++++++++++
 meta/recipes-core/glib-2.0/glib.inc                |    9 ++-
 6 files changed, 73 insertions(+), 174 deletions(-)
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/Makefile-ptest.patch
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/glib-2.0_fix_for_x32.patch
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0_2.36.4.bb
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0_2.38.0.bb

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/Makefile-ptest.patch b/meta/recipes-core/glib-2.0/glib-2.0/Makefile-ptest.patch
deleted file mode 100644
index 40c5b9f..0000000
--- a/meta/recipes-core/glib-2.0/glib-2.0/Makefile-ptest.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-Add 'ptest' target to Makefile, to run tests without checking dependencies.
-Add 'install-ptest' target, to copy needed files to ptest dir.
-
-Signed-off-by: Björn Stenberg <bjst@enea.com>
-Upstream-Status: Pending
----
- Makefile.decl |   43 +++++++++++++++++++++++++++++++++++++++++++
- 1 file changed, 43 insertions(+)
-
---- a/Makefile.decl	2012-03-12 01:42:39.000000000 +0100
-+++ b/Makefile.decl	2012-11-26 13:42:08.436865192 +0100
-@@ -25,6 +25,49 @@
- test-nonrecursive:
- endif
- 
-+ptest: ptest-nonrecursive
-+	@ for subdir in $(SUBDIRS) .; do \
-+	    test -d "$$subdir" -a "$$subdir" != "." -a "$$subdir" != "po" && \
-+	    ( test -d $$subdir && cd $$subdir && $(MAKE) $(AM_MAKEFLAGS) $@ ) \
-+	  done
-+
-+ptest-nonrecursive:
-+	@test -z "${TEST_PROGS}" || ${GTESTER} --keep-going --verbose ${TEST_PROGS}
-+
-+install-ptest: install-ptest-nonrecursive
-+	@test -z "$(SUBDIRS)" || for subdir in $(SUBDIRS); do \
-+	    test "$$subdir" == "." || \
-+	    (cd $$subdir && $(MAKE) DESTDIR=$(DESTDIR)/$$subdir $@ ) \
-+	done
-+
-+# install files used for ptest:
-+# - copy EXTRA_DIST (for test data in glib/tests)
-+# - run dist-hook (for glib/tests/bookmarks/ and glib/tests/markups)
-+# - copy TEST_PROGS (the test programs)
-+# - copy INSTALL_PROGS (for glib/gtester)
-+# - avoid libtool wrappers by copying binaries from .libs
-+# - strip Makefile: target from all Makefiles
-+install-ptest-nonrecursive:
-+	@mkdir -p $(DESTDIR)
-+	@if [ -n "${TEST_PROGS}" ]; then \
-+		if [ -n "${EXTRA_DIST}" ]; then \
-+			cp ${EXTRA_DIST} $(DESTDIR); \
-+		fi; \
-+		grep -q dist-hook: Makefile && \
-+			$(MAKE) distdir=$(DESTDIR) dist-hook; \
-+		if [ -d .libs ] ; then \
-+			cd .libs; \
-+		fi; \
-+		cp ${TEST_PROGS} $(DESTDIR); \
-+	fi;
-+	@if [ -n "${INSTALL_PROGS}" ]; then \
-+		if [ -d .libs ]  ; then \
-+			cd .libs; \
-+		fi; \
-+		cp ${INSTALL_PROGS} $(DESTDIR); \
-+	fi
-+	@test -f Makefile && sed 's/^Makefile:/_Makefile:/' <Makefile >$(DESTDIR)/Makefile
-+
- # test-report: run tests in subdirs and generate report
- # perf-report: run tests in subdirs with -m perf and generate report
- # full-report: like test-report: with -m perf and -m slow
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/glib-2.0_fix_for_x32.patch b/meta/recipes-core/glib-2.0/glib-2.0/glib-2.0_fix_for_x32.patch
deleted file mode 100644
index 0c243cd..0000000
--- a/meta/recipes-core/glib-2.0/glib-2.0/glib-2.0_fix_for_x32.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-Upstream-Status: Pending
-
-Pass CC & CFLAGS vars so that tune parameters get used.
-This fixes compilation with x32 toolchain.
-
-Received this patch from H.J. Lu <hjl.tools@gmail.com>
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com> 2011/07/13
-
-Index: glib-2.30.0/glib/Makefile.am
-===================================================================
---- glib-2.30.0.orig/glib/Makefile.am
-+++ glib-2.30.0/glib/Makefile.am
-@@ -359,10 +359,10 @@ INSTALL_PROGS=
- 
- if ENABLE_DTRACE
- glib_probes.h: glib_probes.d Makefile
--	$(AM_V_GEN) $(DTRACE) -C -h -s $< -o $@.tmp
-+	$(AM_V_GEN) CFLAGS="$(CFLAGS)" $(DTRACE) -C -h -s $< -o $@.tmp
- 	@$(SED) -e "s,define STAP_HAS_SEMAPHORES 1,undef STAP_HAS_SEMAPHORES," < $@.tmp > $@ && rm -f $@.tmp
- glib_probes.o: glib_probes.d Makefile
--	$(AM_V_GEN) $(DTRACE) -G -s $< -o $@
-+	$(AM_V_GEN) CFLAGS="$(CFLAGS)" $(DTRACE) -G -s $< -o $@
- BUILT_SOURCES += glib_probes.h glib_probes.o
- CLEANFILES += glib_probes.h glib_probes.h.tmp
- libglib_2_0_la_LIBADD += glib_probes.o
-Index: glib-2.30.0/gobject/Makefile.am
-===================================================================
---- glib-2.30.0.orig/gobject/Makefile.am
-+++ glib-2.30.0/gobject/Makefile.am
-@@ -141,10 +141,10 @@ gobject_c_sources = \
- 
- if ENABLE_DTRACE
- gobject_probes.h: gobject_probes.d Makefile
--	$(AM_V_GEN) $(DTRACE) -C -h -s $< -o $@.tmp
-+	$(AM_V_GEN) CFLAGS="$(CFLAGS)" $(DTRACE) -C -h -s $< -o $@.tmp
- 	@$(SED) -e "s,define STAP_HAS_SEMAPHORES 1,undef STAP_HAS_SEMAPHORES," < $@.tmp > $@ && rm -f $@.tmp
- gobject_probes.o: gobject_probes.d Makefile
--	$(AM_V_GEN) $(DTRACE) -G -s $< -o $@
-+	$(AM_V_GEN) CFLAGS="$(CFLAGS)" $(DTRACE) -G -s $< -o $@
- BUILT_SOURCES += gobject_probes.h gobject_probes.o
- CLEANFILES += gobject_probes.h
- libgobject_2_0_la_LIBADD += gobject_probes.o
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/run-ptest b/meta/recipes-core/glib-2.0/glib-2.0/run-ptest
index 3deb586..130ae09 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/run-ptest
+++ b/meta/recipes-core/glib-2.0/glib-2.0/run-ptest
@@ -1,3 +1,3 @@
-#!/bin/sh
+#! /bin/sh
 
-make -k ptest
+gnome-desktop-testing-runner glib
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.36.4.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.36.4.bb
deleted file mode 100644
index d62c1fd..0000000
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.36.4.bb
+++ /dev/null
@@ -1,66 +0,0 @@
-require glib.inc
-
-PE = "1"
-
-DEPENDS += "libffi zlib"
-DEPENDS_class-native += "libffi-native"
-DEPENDS_class-nativesdk += "nativesdk-libffi nativesdk-zlib ${BPN}-native"
-
-SHRT_VER = "${@oe.utils.trim_version("${PV}", 2)}"
-
-SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
-           file://configure-libtool.patch \
-           file://glib-2.0_fix_for_x32.patch \
-           file://fix-conflicting-rand.patch \
-           file://Makefile-ptest.patch \
-           file://add-march-i486-into-CFLAGS-automatically.patch \
-           file://run-ptest \
-           file://glib-2.0-configure-readlink.patch \
-          "
-
-SRC_URI_append_class-native = " file://glib-gettextize-dir.patch"
-
-SRC_URI[md5sum] = "2f4b15f7ef43d8702d067ab987bf7aba"
-SRC_URI[sha256sum] = "f654d2542329012d8475736a165dfbf82fadf3ee940c2e0e6ddd4b2fde5cad7e"
-
-BBCLASSEXTEND = "native nativesdk"
-
-RDEPENDS_${PN}-ptest += "\
-            tzdata \
-            tzdata-americas \
-            tzdata-asia \
-            tzdata-europe \
-            tzdata-posix \
-            python-pygobject \
-            python-dbus \
-           "
-
-RDEPENDS_${PN}-ptest_append_libc-glibc = "\
-            eglibc-gconv-utf-16 \
-            eglibc-charmap-utf-8 \
-            eglibc-gconv-cp1255 \
-            eglibc-charmap-cp1255 \
-            eglibc-gconv-utf-32 \
-            eglibc-gconv-utf-7 \
-            eglibc-charmap-invariant \
-            eglibc-localedata-translit-cjk-variants \
-           "
-EXTRA_OECONF_append_class-target_libc-uclibc = " --with-libiconv=gnu"
-
-do_configure_prepend() {
-	sed -i -e '1s,#!.*,#!${USRBINPATH}/env python,' ${S}/gio/gdbus-2.0/codegen/gdbus-codegen.in
-}
-
-do_install_append() {
-  # remove some unpackaged files
-  rm -f ${D}${datadir}/glib-2.0/codegen/*.pyc
-  rm -f ${D}${datadir}/glib-2.0/codegen/*.pyo
-  # and empty dirs
-  rm -rf ${D}${libdir}/gio
-
-  # Some distros have both /bin/perl and /usr/bin/perl, but we set perl location
-  # for target as /usr/bin/perl, so fix it to /usr/bin/perl.
-  if [ -f ${D}${bindir}/glib-mkenums ]; then
-    sed -i -e '1s,#!.*perl,#! ${USRBINPATH}/env perl,' ${D}${bindir}/glib-mkenums
-  fi
-}
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.38.0.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.38.0.bb
new file mode 100644
index 0000000..4b9b112
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.38.0.bb
@@ -0,0 +1,65 @@
+require glib.inc
+
+PE = "1"
+
+DEPENDS += "libffi zlib"
+DEPENDS_class-native += "libffi-native"
+DEPENDS_class-nativesdk += "nativesdk-libffi nativesdk-zlib ${BPN}-native"
+
+SHRT_VER = "${@oe.utils.trim_version("${PV}", 2)}"
+
+SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
+           file://configure-libtool.patch \
+           file://fix-conflicting-rand.patch \
+           file://add-march-i486-into-CFLAGS-automatically.patch \
+           file://glib-2.0-configure-readlink.patch \
+           file://run-ptest \
+          "
+
+SRC_URI_append_class-native = " file://glib-gettextize-dir.patch"
+
+SRC_URI[md5sum] = "c50d2805a76763e9b4cc4385d4ea215d"
+SRC_URI[sha256sum] = "7513a7de5e814ccb48206340a8773ea523d6a7bf04dc74565de69b899bc2ff32"
+
+BBCLASSEXTEND = "native nativesdk"
+
+RDEPENDS_${PN}-ptest += "\
+            gnome-desktop-testing \
+            tzdata \
+            tzdata-americas \
+            tzdata-asia \
+            tzdata-europe \
+            tzdata-posix \
+            python-pygobject \
+            python-dbus \
+           "
+
+RDEPENDS_${PN}-ptest_append_libc-glibc = "\
+            eglibc-gconv-utf-16 \
+            eglibc-charmap-utf-8 \
+            eglibc-gconv-cp1255 \
+            eglibc-charmap-cp1255 \
+            eglibc-gconv-utf-32 \
+            eglibc-gconv-utf-7 \
+            eglibc-charmap-invariant \
+            eglibc-localedata-translit-cjk-variants \
+           "
+EXTRA_OECONF_append_class-target_libc-uclibc = " --with-libiconv=gnu"
+
+do_configure_prepend() {
+	sed -i -e '1s,#!.*,#!${USRBINPATH}/env python,' ${S}/gio/gdbus-2.0/codegen/gdbus-codegen.in
+}
+
+do_install_append() {
+  # remove some unpackaged files
+  rm -f ${D}${datadir}/glib-2.0/codegen/*.pyc
+  rm -f ${D}${datadir}/glib-2.0/codegen/*.pyo
+  # and empty dirs
+  rm -rf ${D}${libdir}/gio
+
+  # Some distros have both /bin/perl and /usr/bin/perl, but we set perl location
+  # for target as /usr/bin/perl, so fix it to /usr/bin/perl.
+  if [ -f ${D}${bindir}/glib-mkenums ]; then
+    sed -i -e '1s,#!.*perl,#! ${USRBINPATH}/env perl,' ${D}${bindir}/glib-mkenums
+  fi
+}
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index e57d2ac..ad0671a 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -27,9 +27,9 @@ S = "${WORKDIR}/glib-${PV}"
 
 CORECONF = "--disable-dtrace --disable-fam --disable-libelf --disable-systemtap --disable-man"
 
-PTEST_CONF = "${@base_contains('DISTRO_FEATURES', 'ptest', '--enable-modular-tests', '--disable-modular-tests', d)}"
+PTEST_CONF = "${@base_contains('DISTRO_FEATURES', 'ptest', '--enable-installed-tests', '--disable-installed-tests', d)}"
 EXTRA_OECONF = "--enable-included-printf=no ${CORECONF} ${PTEST_CONF}"
-EXTRA_OECONF_class-native = "${CORECONF} --disable-selinux --disable-modular-tests"
+EXTRA_OECONF_class-native = "${CORECONF} --disable-selinux"
 
 FILES_${PN} = "${libdir}/lib*${SOLIBS} ${datadir}/glib-2.0/schemas \
                ${datadir}/glib-2.0/gettext/mkinstalldirs ${datadir}/glib-2.0/gettext/po/Makefile.in.in"
@@ -37,10 +37,13 @@ FILES_${PN}-dev += "${libdir}/glib-2.0/include \
                     ${libdir}/gio/modules/lib*${SOLIBSDEV} \
                     ${libdir}/gio/modules/*.la"
 FILES_${PN}-dbg += "${datadir}/glib-2.0/gdb ${datadir}/gdb \
-                    ${libdir}/gio/modules/.debug"
+                    ${libdir}/gio/modules/.debug \
+                    ${libdir}/glib-2.0/installed-tests/glib/.debug"
 FILES_${PN}-codegen = "${datadir}/glib-2.0/codegen/*.py"
 FILES_${PN}-bash-completion = "${sysconfdir}/bash_completion.d \
                                ${datadir}/bash-completion"
+FILES_${PN}-ptest += "${libdir}/glib-2.0/installed-tests \
+                      ${datadir}/installed-tests/glib"
 
 ARM_INSTRUCTION_SET = "arm"
 USE_NLS = "yes"
-- 
1.7.10.4


