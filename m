Received: from mail-bk0-f54.google.com ([209.85.214.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1U2l7f-0003zr-Jp
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Feb 2013 17:11:53 +0100
Received: by mail-bk0-f54.google.com with SMTP id w5so156692bku.27
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Feb 2013 07:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:mime-version:content-type
	:content-transfer-encoding;
	bh=h9XCz2I/uwjcVKRI+fIR0+4nwfVAsIYqJkafAJIkVJY=;
	b=CL6egzwFAIr50EPWUC0Bji3cATjnrXP+LLqYC7yU/CD3Np9cADhiJw8vXNPtkjQNLK
	c/fSL43b9Ef/L/S9C0kcmQhIrTUDcWwvp0qPrHoC52icX+mjllJltaLnzgMfupT4b7Em
	9V69wAZ5XXfot0DEFDKgeewWY1b0plQwAF993bmhjqhY3oUFwOc8VWzc1/HMz0S+qRDd
	dntDAzAwuPCkOo8RrAkIm5cWNnDA+UtJV4ZxVYe40L1pi+6JhZP4+TlgXKxZ1Y01c2fx
	AZnTyG5zWDb2tZeDJSIWCvpDu/VepKvW7aoNIvcmi5Jyedn4SQHm0lM/OrYm/A8Z3Tz4
	vwhw==
X-Received: by 10.204.145.86 with SMTP id c22mr6912119bkv.5.1360079761698;
	Tue, 05 Feb 2013 07:56:01 -0800 (PST)
Received: from s42.loc (91-119-139-175.dynamic.xdsl-line.inode.at.
	[91.119.139.175])
	by mx.google.com with ESMTPS id hc16sm6744961bkc.2.2013.02.05.07.55.58
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 05 Feb 2013 07:55:59 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.80)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1U2ksG-0004XT-QK; Tue, 05 Feb 2013 16:55:56 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Feb 2013 16:55:44 +0100
Message-Id: <3666e39a359b03ba1e054813f4353ddeed11d506.1360079373.git.rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1360079373.git.rep.dot.nop@gmail.com>
References: <cover.1360079373.git.rep.dot.nop@gmail.com>
In-Reply-To: <cover.1360079373.git.rep.dot.nop@gmail.com>
References: <cover.1360079373.git.rep.dot.nop@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 4/8] Revert "Add ptest for glib."
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
X-List-Received-Date: Tue, 05 Feb 2013 16:12:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This reverts commit dec6f912d68f52748f645b6af411f189cf464f85.

This breaks core-image-sato-sdk for TCLIBC="uclibc".

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 .../glib-2.0/glib-2.0/Makefile-ptest.patch         |   61 --------------------
 meta/recipes-core/glib-2.0/glib-2.0/run-ptest      |    3 -
 meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb      |   22 -------
 3 files changed, 86 deletions(-)
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/Makefile-ptest.patch
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/run-ptest

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/Makefile-ptest.patch b/meta/recipes-core/glib-2.0/glib-2.0/Makefile-ptest.patch
deleted file mode 100644
index cb36c09..0000000
--- a/meta/recipes-core/glib-2.0/glib-2.0/Makefile-ptest.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-Add 'ptest' target to Makefile, to run tests without checking dependencies.
-Add 'install-ptest' target, to copy needed files to ptest dir.
-
-Signed-off-by: Björn Stenberg <bjst@enea.com>
-Upstream-status: Pending
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
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/run-ptest b/meta/recipes-core/glib-2.0/glib-2.0/run-ptest
deleted file mode 100644
index 3deb586..0000000
--- a/meta/recipes-core/glib-2.0/glib-2.0/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-make -k ptest
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb
index e1d44e2..e4293c8 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb
@@ -13,8 +13,6 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://configure-libtool.patch \
            file://glib-2.0_fix_for_x32.patch \
            file://obsolete_automake_macros.patch \
-           file://Makefile-ptest.patch \
-           file://run-ptest \
           "
 SRC_URI[md5sum] = "a4ca31e258273c3761e3de2edd607661"
 SRC_URI[sha256sum] = "855fcbf87cb93065b488358e351774d8a39177281023bae58c286f41612658a7"
@@ -22,24 +20,6 @@ SRC_URI[sha256sum] = "855fcbf87cb93065b488358e351774d8a39177281023bae58c286f4161
 SRC_URI_append_class-native = " file://glib-gettextize-dir.patch"
 BBCLASSEXTEND = "native nativesdk"
 
-RDEPENDS_${PN}-ptest += "\
-            eglibc-gconv-utf-16 \
-            eglibc-charmap-utf-8 \
-            eglibc-gconv-cp1255 \
-            eglibc-charmap-cp1255 \
-            eglibc-gconv-utf-32 \
-            eglibc-gconv-utf-7 \
-            eglibc-charmap-invariant \
-            eglibc-localedata-translit-cjk-variants \
-            tzdata \
-            tzdata-americas \
-            tzdata-asia \
-            tzdata-europe \
-            tzdata-posix \
-            python-pygobject \
-            python-dbus \
-           "
-
 do_configure_prepend() {
 	sed -i -e '1s,#!.*,#!${USRBINPATH}/env python,' ${S}/gio/gdbus-2.0/codegen/gdbus-codegen.in
 }
@@ -56,6 +36,4 @@ do_install_append() {
   if [ -f ${D}${bindir}/glib-mkenums ]; then
     sed -i -e '1s,#!.*perl,#! ${USRBINPATH}/env perl,' ${D}${bindir}/glib-mkenums
   fi
-
-  ptest_do_install
 }
-- 
1.7.10.4



