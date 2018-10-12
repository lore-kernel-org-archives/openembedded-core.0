Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5A73979BA1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Oct 2018 11:55:08 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id g15-v6so13128365wru.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Oct 2018 04:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=rq9S/CDmy3FD+xhlMZOEhHAFLbNvW2kF8oBIq6Q2VGo=;
	b=ODUNqipGtunJAKlfXjOIQHTt7gpOhGbTiq1wIbLlAcS6vLUHChq1CgxCG4TumCl4Ao
	h1TnWYm1pxLAlNGg+v7ojlOwy0qy787XIFUfAg8g+1MvwmaAtQsKGnuGMfIN6MnDZaoe
	WPbtibrefMi4ErreOtCeEZ52K+bveK8aQNAFdJAA7E0/9L/DBoDlqCNmoRCRXxYMSNl7
	foF0ZuNY/cnOoNyvELlJRSR+Eaf48JegJxe4Lw8eJ25fETepBcB649HmwVgWv1DWHj93
	RrGdqb47H25seR6wzuUkKpIr7umFoGo1O58HpdJoYtBGjXWuyhM/gnYXXkv1Gz/LaLcF
	7gvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=rq9S/CDmy3FD+xhlMZOEhHAFLbNvW2kF8oBIq6Q2VGo=;
	b=k6qFe/QOwzNGrB6wvl6cMFy8nil+GWZj2jbwh6t1KWdTxTB6x2zTPhN/tdwqVxloC5
	t5mhvqJsudMWhmCM06gjUBO1cdSxihS6cDxLefaLjcxha6o7S9P53nuuStDWgcTMPYBD
	retDLCXp4uaBxpO0arqesj+fQvCRJXP2Y8nXrkv5SY5I/KVS7n7HfXWO2owq8AeGJjRm
	0/AnQ2fzbjG/ru+evTKhpoxc1ULKFBeicXrlQo7w+Wby+TX+ceIAHuluprzGVtgQP5q/
	lmvrq0IvSh4fmmsSRVQoVof/eQ0dkYVv/1TkoSCnaGtcacCRZqfHy/p6dBu1yanR2v1W
	8Bwg==
X-Gm-Message-State: ABuFfogtFwCfusgwfo5nbjFpT2D/goFoF69+xPwFblXa7dk9Qpk4Uxe5
	jd6yXaRk98ISef+mHOWIGn+HbzKBxpQ=
X-Google-Smtp-Source: ACcGV637cdP6p45GXAqAX/JNNNrtWOcOKthPvD6/Fx337v/z3wfhCgBlVnFMGt1jUhzznw9ksUIADA==
X-Received: by 2002:adf:8bc5:: with SMTP id
	w5-v6mr5284229wra.110.1539345308664; 
	Fri, 12 Oct 2018 04:55:08 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	a205-v6sm1223160wmh.19.2018.10.12.04.55.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 12 Oct 2018 04:55:07 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Oct 2018 12:55:02 +0100
Message-Id: <20181012115502.14205-3-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20181012115502.14205-1-ross.burton@intel.com>
References: <20181012115502.14205-1-ross.burton@intel.com>
Subject: [PATCH 3/3] python: clean up ptest
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
X-List-Received-Date: Fri, 12 Oct 2018 11:55:08 -0000

As the manifest handling is done differently now, just inherit ptest with the
other inherits.

test_shutil needs unzip so add to RDEPENDS.

Instead of using a patched Makefile, call test.regrtest directly.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../python/python/fix-makefile-for-ptest.patch     | 34 ----------------------
 meta/recipes-devtools/python/python/run-ptest      |  4 +--
 meta/recipes-devtools/python/python_2.7.15.bb      | 25 ++--------------
 3 files changed, 3 insertions(+), 60 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python/fix-makefile-for-ptest.patch

diff --git a/meta/recipes-devtools/python/python/fix-makefile-for-ptest.patch b/meta/recipes-devtools/python/python/fix-makefile-for-ptest.patch
deleted file mode 100644
index 60d782cd26b..00000000000
--- a/meta/recipes-devtools/python/python/fix-makefile-for-ptest.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-Add 'build-test' and 'runtest-TESTS' targets to Makefile, to build and run tests
-cross-compiled.
-
-Signed-off-by: Tudor Florea <tudor.florea@enea.com>
-Upstream-Status: Pending
----
-Index: Python-2.7.14/Makefile.pre.in
-===================================================================
---- Python-2.7.14.orig/Makefile.pre.in
-+++ Python-2.7.14/Makefile.pre.in
-@@ -846,14 +846,19 @@ $(LIBRARY_OBJS) $(MODOBJS) Modules/pytho
- 
- .PHONY: test testall testuniversal buildbottest pythoninfo
- 
--TESTOPTS=	-l $(EXTRATESTOPTS)
-+TESTOPTS=	-l -v $(EXTRATESTOPTS)
- TESTPROG=	$(srcdir)/Lib/test/regrtest.py
--TESTPYTHON=	$(RUNSHARED) ./$(BUILDPYTHON) -Wd -3 -E -tt $(TESTPYTHONOPTS)
--test:		@DEF_MAKE_RULE@ platform
--		-find $(srcdir)/Lib -name '*.py[co]' -print | xargs rm -f
-+TESTPYTHON=	$(RUNSHARED) $(BUILDPYTHON) -Wd -3 -E -tt $(TESTPYTHONOPTS)
-+test:		build-test
-+		$(MAKE) runtest-TESTS
-+
-+runtest-TESTS:
-+		-find $(srcdir) -name '*.py[co]' -print | xargs rm -f
- 		-$(TESTPYTHON) $(TESTPROG) $(TESTOPTS)
- 		$(TESTPYTHON) $(TESTPROG) $(TESTOPTS)
- 
-+build-test:	@DEF_MAKE_RULE@ platform
-+
- testall:	@DEF_MAKE_RULE@ platform
- 		-find $(srcdir)/Lib -name '*.py[co]' -print | xargs rm -f
- 		$(TESTPYTHON) $(srcdir)/Lib/compileall.py
diff --git a/meta/recipes-devtools/python/python/run-ptest b/meta/recipes-devtools/python/python/run-ptest
index a2f9eed4441..832551a1244 100644
--- a/meta/recipes-devtools/python/python/run-ptest
+++ b/meta/recipes-devtools/python/python/run-ptest
@@ -1,5 +1,3 @@
 #!/bin/sh
-#
-#This script is used to run python test suites
 
-make -f LIBDIR/python/ptest/Makefile -k runtest-TESTS srcdir=LIBDIR/python2.7 TESTPROG=LIBDIR/python2.7/test/regrtest.py | sed -e '/\.\.\. ok/ s/^/PASS: /g' -e '/\.\.\. [ERROR|FAIL]/ s/^/FAIL: /g' -e '/\.\.\. skipped/ s/^/SKIP: /g' -e 's/ \.\.\. ok//g' -e 's/ \.\.\. ERROR//g' -e 's/ \.\.\. FAIL//g' -e 's/ \.\.\. skipped//g'
+python -m test.regrtest -v | sed -e '/\.\.\. ok/ s/^/PASS: /g' -e '/\.\.\. [ERROR|FAIL]/ s/^/FAIL: /g' -e '/\.\.\. skipped/ s/^/SKIP: /g' -e 's/ \.\.\. ok//g' -e 's/ \.\.\. ERROR//g' -e 's/ \.\.\. FAIL//g' -e 's/ \.\.\. skipped//g'
diff --git a/meta/recipes-devtools/python/python_2.7.15.bb b/meta/recipes-devtools/python/python_2.7.15.bb
index 9bf6959a0c5..7662b165372 100644
--- a/meta/recipes-devtools/python/python_2.7.15.bb
+++ b/meta/recipes-devtools/python/python_2.7.15.bb
@@ -24,7 +24,6 @@ SRC_URI += "\
   file://avoid_warning_about_tkinter.patch \
   file://avoid_warning_for_sunos_specific_module.patch \
   file://python-2.7.3-remove-bsdb-rpath.patch \
-  file://fix-makefile-for-ptest.patch \
   file://run-ptest \
   file://parallel-makeinst-create-bindir.patch \
   file://use_sysroot_ncurses_instead_of_host.patch \
@@ -35,7 +34,7 @@ SRC_URI += "\
 
 S = "${WORKDIR}/Python-${PV}"
 
-inherit autotools multilib_header python-dir pythonnative
+inherit autotools multilib_header python-dir pythonnative ptest
 
 CONFIGUREOPTS += " --with-system-ffi "
 
@@ -169,27 +168,7 @@ FILES_${PN}-misc = "${libdir}/python${PYTHON_MAJMIN}"
 RDEPENDS_${PN}-modules += "${PN}-misc"
 
 # ptest
-RDEPENDS_${PN}-ptest = "${PN}-modules ${PN}-tests"
-#inherit ptest after "require python-${PYTHON_MAJMIN}-manifest.inc" so PACKAGES doesn't get overwritten
-inherit ptest
-
-# This must come after inherit ptest for the override to take effect
-do_install_ptest() {
-	cp ${B}/Makefile ${D}${PTEST_PATH}
-	sed -e s:LIBDIR/python/ptest:${PTEST_PATH}:g \
-	 -e s:LIBDIR:${libdir}:g \
-	 -i ${D}${PTEST_PATH}/run-ptest
-
-	#Remove build host references
-	sed -i \
-		-e 's:--with-libtool-sysroot=${STAGING_DIR_TARGET}'::g \
-	    -e 's:--sysroot=${STAGING_DIR_TARGET}::g' \
-	    -e 's|${DEBUG_PREFIX_MAP}||g' \
-	    -e 's:${HOSTTOOLS_DIR}/::g' \
-	    -e 's:${RECIPE_SYSROOT}::g' \
-	    -e 's:${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}::g' \
-	${D}/${PTEST_PATH}/Makefile
-}
+RDEPENDS_${PN}-ptest = "${PN}-modules ${PN}-tests unzip"
 
 # catch manpage
 PACKAGES += "${PN}-man"
-- 
2.11.0


