Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.354.1587835710078394967
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Apr 2020 10:28:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=C1P7IcBD;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id g12so15397195wmh.3
        for <openembedded-core@lists.openembedded.org>; Sat, 25 Apr 2020 10:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QGwxlvmUIImCgP8VdiAi9jVdUZjORO/llpJzoSNFVWI=;
        b=C1P7IcBD2DZvRdO3B7iv+u4XuoaQWjOy6PGrNPJvwJPq3+EjS8PmD1DwkBQSXAstGw
         /1uYrQe8LJ3UoOn9A14Wrrw6vTZg1g7mUKvY/AbloYhWZClV6cjfcs1ds8Vho6QhXBWu
         0aemFy5eWxGhMF2tSrhIbnAW1l3wosoRznQtRhXzCNupriHKznQxoKcMfZHKFEhLwrsk
         0U/3iFrFcEvrNke7dKOvvkZW1PVJT7oplXtlAY+8Fo0dPiL60s9jFVwk+pUh4XmxpsXy
         1187ATI4UJlRoH2KS3XfX63EGOdf9xfOT/Ti4cOgO1rdsH7alwUlondyNxwvOGqtnx3q
         /mcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QGwxlvmUIImCgP8VdiAi9jVdUZjORO/llpJzoSNFVWI=;
        b=er5/iXa4pFzcM2+IQxz+paWoVL5hqAGyn8OjWQgcwKgmn1SPXkXEQ+18xl5jC4CzPo
         pT3ggZli7TP9jWkkyTZaFRTRwxK9TJIBEjT2mU34s4PpFpqJx3rsOzGzOjFmknqdrKfy
         zbzOx/atxF2Ke3voAqo7KQ5o/nVNSUUnySNWVMeiHxioEQM/UtDkB7x/dYqkH4HJJSDB
         QhrB5/A4zcvAlYMHyPj3fYPBub810BehXvohk9dey4siNFVwSRXLEE60eM56APkr9xLc
         jW80BlkiZtLdicCiRUiKiWvbyutEK/prDDTFCDIQSvSQJ/EMOoJYTefzRweGeWdD7YBd
         NCgQ==
X-Gm-Message-State: AGi0PuYESiMiy/TPOhl2/J3AZOmdF4otEjeH96Vv7DnC8uFkYrLX0yrj
	AEBpmnUFGQ7z3YNSo4nZMyeyzzf2
X-Google-Smtp-Source: APiQypI7Y5z5IeDj6aCmfCp5Gpy8pnoyOAa7VLiyJvhL7ftCmoX9onkaXMTJ0TlJ9QVCcwYNOh/f6g==
X-Received: by 2002:a1c:7d4b:: with SMTP id y72mr17315678wmc.11.1587835707702;
        Sat, 25 Apr 2020 10:28:27 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id g25sm7751253wmh.24.2020.04.25.10.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2020 10:28:26 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 01/15] rpm: upgrade to 4.15.1
Date: Sat, 25 Apr 2020 19:28:00 +0200
Message-Id: <20200425172814.27370-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop patches that were merged upstream.

0001-mono-find-provides-requires-do-not-use-monodis-from-.patch
modifies a file that was removed upstream.

Add a 0001-rpmfc.c-do-not-run-file-classification-in-parallel.patch
as unfortunately the new parallel file classification feature from
upstream trips over somewhere in libmagic when inspected files are
compressed:
https://github.com/rpm-software-management/rpm/issues/756

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...satisfiable-dependency-when-building.patch |  28 +-
 ...lib-rpm-as-the-installation-path-for.patch |  14 +-
 ...kage-building-into-a-separate-functi.patch |  84 -----
 ...es-requires-do-not-use-monodis-from-.patch |  58 ---
 ...-run-file-classification-in-parallel.patch |  65 ++++
 ...ry-package-creation-via-thread-pools.patch | 127 -------
 ...e-operations-over-string-pools-threa.patch | 207 -----------
 ...ove-static-local-variables-from-buil.patch | 336 ------------------
 .../rpm/{rpm_4.14.2.1.bb => rpm_4.15.1.bb}    |  16 +-
 9 files changed, 90 insertions(+), 845 deletions(-)
 delete mode 100644 meta/recipes-devtools/rpm/files/0001-Split-binary-package-building-into-a-separate-functi.patch
 delete mode 100644 meta/recipes-devtools/rpm/files/0001-mono-find-provides-requires-do-not-use-monodis-from-.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0001-rpmfc.c-do-not-run-file-classification-in-parallel.patch
 delete mode 100644 meta/recipes-devtools/rpm/files/0002-Run-binary-package-creation-via-thread-pools.patch
 delete mode 100644 meta/recipes-devtools/rpm/files/0003-rpmstrpool.c-make-operations-over-string-pools-threa.patch
 delete mode 100644 meta/recipes-devtools/rpm/files/0004-build-pack.c-remove-static-local-variables-from-buil.patch
 rename meta/recipes-devtools/rpm/{rpm_4.14.2.1.bb => rpm_4.15.1.bb} (89%)

diff --git a/meta/recipes-devtools/rpm/files/0001-Do-not-add-an-unsatisfiable-dependency-when-building.patch b/meta/recipes-devtools/rpm/files/0001-Do-not-add-an-unsatisfiable-dependency-when-building.patch
index 80e2f0fad7..4029233fb7 100644
--- a/meta/recipes-devtools/rpm/files/0001-Do-not-add-an-unsatisfiable-dependency-when-building.patch
+++ b/meta/recipes-devtools/rpm/files/0001-Do-not-add-an-unsatisfiable-dependency-when-building.patch
@@ -1,4 +1,4 @@
-From 87cfc0db1ed6fe381a5ed5f0016d8c3344a31a11 Mon Sep 17 00:00:00 2001
+From f39c28eb52f12ae6e82db360ffd5a903ac8faca5 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 9 Jan 2017 18:52:11 +0200
 Subject: [PATCH] Do not add an unsatisfiable dependency when building rpms in
@@ -9,25 +9,23 @@ hand produces rpms that way by design.
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  build/pack.c | 4 ----
  1 file changed, 4 deletions(-)
 
 diff --git a/build/pack.c b/build/pack.c
-index 1261cdbba..bb2d6f4f6 100644
+index e6cec1816..810cd7351 100644
 --- a/build/pack.c
 +++ b/build/pack.c
-@@ -595,10 +595,6 @@ rpmRC packageBinaries(rpmSpec spec, const char *cookie, int cheating)
- 	    headerPutBin(pkg->header, RPMTAG_SOURCEPKGID, spec->sourcePkgId,16);
- 	}
+@@ -724,10 +724,6 @@ static rpmRC packageBinary(rpmSpec spec, Package pkg, const char *cookie, int ch
+ 	headerPutBin(pkg->header, RPMTAG_SOURCEPKGID, spec->sourcePkgId,16);
+     }
+ 
+-    if (cheating) {
+-	(void) rpmlibNeedsFeature(pkg, "ShortCircuited", "4.9.0-1");
+-    }
+-
+     if ((rc = getPkgFilename(pkg->header, filename)))
+ 	return rc;
  
--	if (cheating) {
--	    (void) rpmlibNeedsFeature(pkg, "ShortCircuited", "4.9.0-1");
--	}
--	
- 	{   char *binFormat = rpmGetPath("%{_rpmfilename}", NULL);
- 	    char *binRpm, *binDir;
- 	    binRpm = headerFormat(pkg->header, binFormat, &errorString);
--- 
-2.11.0
-
diff --git a/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch b/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
index 82e7328757..52440d6818 100644
--- a/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
+++ b/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
@@ -1,4 +1,4 @@
-From bd08eb0ae1312f347f49949481daa7c923752df2 Mon Sep 17 00:00:00 2001
+From 2f3d1619b6510bc131c4375827caf912559f0fa2 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 27 Feb 2017 09:43:30 +0200
 Subject: [PATCH] Do not hardcode "lib/rpm" as the installation path for
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  3 files changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 09af7c4..9bd6903 100644
+index d3aeab86e..1a1f3f91f 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1055,7 +1055,7 @@ else
+@@ -1086,7 +1086,7 @@ else
      usrprefix=$prefix
  fi
  
@@ -27,10 +27,10 @@ index 09af7c4..9bd6903 100644
  
  AC_SUBST(OBJDUMP)
 diff --git a/macros.in b/macros.in
-index a3aa7a9..62cee5c 100644
+index fe9803aad..d128675bf 100644
 --- a/macros.in
 +++ b/macros.in
-@@ -970,7 +970,7 @@ package or when debugging this package.\
+@@ -985,7 +985,7 @@ package or when debugging this package.\
  %_sharedstatedir	%{_prefix}/com
  %_localstatedir		%{_prefix}/var
  %_lib			lib
@@ -40,7 +40,7 @@ index a3aa7a9..62cee5c 100644
  %_infodir		%{_datadir}/info
  %_mandir		%{_datadir}/man
 diff --git a/rpm.am b/rpm.am
-index 82c2d7c..6341b51 100644
+index 40b4ec55f..3139ce8f6 100644
 --- a/rpm.am
 +++ b/rpm.am
 @@ -1,10 +1,10 @@
@@ -55,4 +55,4 @@ index 82c2d7c..6341b51 100644
 +rpmconfigdir = $(libdir)/rpm
  
  # Libtool version (current-revision-age) for all our libraries
- rpm_version_info = 9:0:1
+ rpm_version_info = 9:1:0
diff --git a/meta/recipes-devtools/rpm/files/0001-Split-binary-package-building-into-a-separate-functi.patch b/meta/recipes-devtools/rpm/files/0001-Split-binary-package-building-into-a-separate-functi.patch
deleted file mode 100644
index 6e44f0b7fc..0000000000
--- a/meta/recipes-devtools/rpm/files/0001-Split-binary-package-building-into-a-separate-functi.patch
+++ /dev/null
@@ -1,84 +0,0 @@
-From 721a660a507d6d062e7aecafad886c643970a5d5 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Thu, 25 May 2017 18:15:27 +0300
-Subject: [PATCH 1/4] Split binary package building into a separate function
-
-So that it can be run as a thread pool task.
-
-Upstream-Status: Submitted [https://github.com/rpm-software-management/rpm/pull/226]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- build/pack.c | 33 +++++++++++++++++++++------------
- 1 file changed, 21 insertions(+), 12 deletions(-)
-
-diff --git a/build/pack.c b/build/pack.c
-index 518f4e92a..ccfd614cc 100644
---- a/build/pack.c
-+++ b/build/pack.c
-@@ -546,18 +546,13 @@ static rpmRC checkPackages(char *pkgcheck)
-     return RPMRC_OK;
- }
- 
--rpmRC packageBinaries(rpmSpec spec, const char *cookie, int cheating)
-+static rpmRC packageBinary(rpmSpec spec, Package pkg, const char *cookie, int cheating, char** filename)
- {
--    rpmRC rc;
--    const char *errorString;
--    Package pkg;
--    char *pkglist = NULL;
--
--    for (pkg = spec->packages; pkg != NULL; pkg = pkg->next) {
--	char *fn;
-+	const char *errorString;
-+	rpmRC rc = RPMRC_OK;
- 
- 	if (pkg->fileList == NULL)
--	    continue;
-+	    return rc;
- 
- 	if ((rc = processScriptFiles(spec, pkg)))
- 	    return rc;
-@@ -587,7 +582,7 @@ rpmRC packageBinaries(rpmSpec spec, const char *cookie, int cheating)
- 		     headerGetString(pkg->header, RPMTAG_NAME), errorString);
- 		return RPMRC_FAIL;
- 	    }
--	    fn = rpmGetPath("%{_rpmdir}/", binRpm, NULL);
-+	    *filename = rpmGetPath("%{_rpmdir}/", binRpm, NULL);
- 	    if ((binDir = strchr(binRpm, '/')) != NULL) {
- 		struct stat st;
- 		char *dn;
-@@ -609,14 +604,28 @@ rpmRC packageBinaries(rpmSpec spec, const char *cookie, int cheating)
- 	    free(binRpm);
- 	}
- 
--	rc = writeRPM(pkg, NULL, fn, NULL);
-+	rc = writeRPM(pkg, NULL, *filename, NULL);
- 	if (rc == RPMRC_OK) {
- 	    /* Do check each written package if enabled */
--	    char *pkgcheck = rpmExpand("%{?_build_pkgcheck} ", fn, NULL);
-+	    char *pkgcheck = rpmExpand("%{?_build_pkgcheck} ", *filename, NULL);
- 	    if (pkgcheck[0] != ' ') {
- 		rc = checkPackages(pkgcheck);
- 	    }
- 	    free(pkgcheck);
-+	}
-+	return rc;
-+}
-+
-+rpmRC packageBinaries(rpmSpec spec, const char *cookie, int cheating)
-+{
-+    rpmRC rc;
-+    Package pkg;
-+    char *pkglist = NULL;
-+
-+    for (pkg = spec->packages; pkg != NULL; pkg = pkg->next) {
-+	char *fn = NULL;
-+	rc = packageBinary(spec, pkg, cookie, cheating, &fn);
-+	if (rc == RPMRC_OK) {
- 	    rstrcat(&pkglist, fn);
- 	    rstrcat(&pkglist, " ");
- 	}
--- 
-2.11.0
-
diff --git a/meta/recipes-devtools/rpm/files/0001-mono-find-provides-requires-do-not-use-monodis-from-.patch b/meta/recipes-devtools/rpm/files/0001-mono-find-provides-requires-do-not-use-monodis-from-.patch
deleted file mode 100644
index 24aa4c7fff..0000000000
--- a/meta/recipes-devtools/rpm/files/0001-mono-find-provides-requires-do-not-use-monodis-from-.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 43fbc3f53302a395463e8450ac81c53f623eec3f Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Tue, 27 Aug 2019 17:42:34 +0200
-Subject: [PATCH] mono-find-provides/requires: do not use monodis from the host
-
-There was a host contamination issue here: if monodis was installed
-on the host, do_package would use that to resolve dependencies
-of mono libraries (and often fail in that). Without monodis,
-no dependencies are resolved, which is seemingly how things
-are supposed to work.
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- scripts/mono-find-provides | 8 ++++----
- scripts/mono-find-requires | 8 ++++----
- 2 files changed, 8 insertions(+), 8 deletions(-)
-
-diff --git a/scripts/mono-find-provides b/scripts/mono-find-provides
-index 9348457d3..b28872ffb 100644
---- a/scripts/mono-find-provides
-+++ b/scripts/mono-find-provides
-@@ -18,11 +18,11 @@ monolist=($(printf "%s\n" "${filelist[@]}" | grep -E "\\.(exe|dll)\$"))
- build_bindir="$2/usr/bin"
- build_libdir="$2$3"
- 
--if [ -x $build_bindir/monodis ]; then
--    monodis="$build_bindir/monodis"
-+if [ -x $build_bindir/monodis.bogus ]; then
-+    monodis="$build_bindir/monodis.bogus"
-     export LD_LIBRARY_PATH=$build_libdir${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}
--elif [ -x /usr/bin/monodis ]; then
--    monodis="/usr/bin/monodis"
-+elif [ -x /usr/bin/monodis.bogus ]; then
-+    monodis="/usr/bin/monodis.bogus"
- else
-     exit 0;
- fi
-diff --git a/scripts/mono-find-requires b/scripts/mono-find-requires
-index ea58cae48..d270169e1 100644
---- a/scripts/mono-find-requires
-+++ b/scripts/mono-find-requires
-@@ -18,11 +18,11 @@ monolist=($(printf "%s\n" "${filelist[@]}" | grep -E "\\.(exe|dll)\$"))
- build_bindir="$2/usr/bin"
- build_libdir="$2$3"
- 
--if [ -x $build_bindir/monodis ]; then
--    monodis="$build_bindir/monodis"
-+if [ -x $build_bindir/monodis.bogus ]; then
-+    monodis="$build_bindir/monodis.bogus"
-     export LD_LIBRARY_PATH=$build_libdir${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}
--elif [ -x /usr/bin/monodis ]; then
--    monodis="/usr/bin/monodis"
-+elif [ -x /usr/bin/monodis.bogus ]; then
-+    monodis="/usr/bin/monodis.bogus"
- else
-     exit 0;
- fi
diff --git a/meta/recipes-devtools/rpm/files/0001-rpmfc.c-do-not-run-file-classification-in-parallel.patch b/meta/recipes-devtools/rpm/files/0001-rpmfc.c-do-not-run-file-classification-in-parallel.patch
new file mode 100644
index 0000000000..d8d338792d
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/0001-rpmfc.c-do-not-run-file-classification-in-parallel.patch
@@ -0,0 +1,65 @@
+From 93c3c7f043f62e96941274e957c4ad9432032af1 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Mon, 18 Nov 2019 16:22:56 +0100
+Subject: [PATCH] rpmfc.c: do not run file classification in parallel
+
+This is causing freezes with libmagic when the file in question is compressed:
+https://github.com/rpm-software-management/rpm/issues/756
+
+Upstream-Status: Inappropriate [upstream wants a proper fix]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ build/rpmfc.c | 8 --------
+ 1 file changed, 8 deletions(-)
+
+diff --git a/build/rpmfc.c b/build/rpmfc.c
+index 3db7a9352..17afdd57a 100644
+--- a/build/rpmfc.c
++++ b/build/rpmfc.c
+@@ -680,7 +680,6 @@ static void rpmfcAttributes(rpmfc fc, int ix, const char *ftype, const char *ful
+ 	/* Add attributes on libmagic type & path pattern matches */
+ 	if (matches(&(*attr)->incl, ftype, path, is_executable)) {
+ 	    argvAddTokens(&fc->fattrs[ix], (*attr)->name);
+-	    #pragma omp critical(fahash)
+ 	    fattrHashAddEntry(fc->fahash, attr-fc->atypes, ix);
+ 	}
+     }
+@@ -1105,7 +1104,6 @@ rpmRC rpmfcClassify(rpmfc fc, ARGV_t argv, rpm_mode_t * fmode)
+     /* Build (sorted) file class dictionary. */
+     fc->cdict = rpmstrPoolCreate();
+ 
+-    #pragma omp parallel
+     {
+     /* libmagic is not thread-safe, each thread needs to a private handle */
+     magic_t ms = magic_open(msflags);
+@@ -1113,15 +1111,12 @@ rpmRC rpmfcClassify(rpmfc fc, ARGV_t argv, rpm_mode_t * fmode)
+     if (ms == NULL) {
+ 	rpmlog(RPMLOG_ERR, _("magic_open(0x%x) failed: %s\n"),
+ 		msflags, strerror(errno));
+-	#pragma omp cancel parallel
+     }
+ 
+     if (magic_load(ms, NULL) == -1) {
+ 	rpmlog(RPMLOG_ERR, _("magic_load failed: %s\n"), magic_error(ms));
+-	#pragma omp cancel parallel
+     }
+ 
+-    #pragma omp for ordered reduction(+:nerrors)
+     for (int ix = 0; ix < fc->nfiles; ix++) {
+ 	rpmsid ftypeId;
+ 	const char * ftype;
+@@ -1185,14 +1180,11 @@ rpmRC rpmfcClassify(rpmfc fc, ARGV_t argv, rpm_mode_t * fmode)
+ 	fc->fcolor[ix] = fcolor;
+ 
+ 	/* Add to file class dictionary and index array */
+-	#pragma omp ordered
+ 	if (fcolor != RPMFC_WHITE && (fcolor & RPMFC_INCLUDE)) {
+ 	    ftypeId = rpmstrPoolId(fc->cdict, ftype, 1);
+-	    #pragma omp atomic
+ 	    fc->fknown++;
+ 	} else {
+ 	    ftypeId = rpmstrPoolId(fc->cdict, "", 1);
+-	    #pragma omp atomic
+ 	    fc->fwhite++;
+ 	}
+ 	/* Pool id's start from 1, for headers we want it from 0 */
diff --git a/meta/recipes-devtools/rpm/files/0002-Run-binary-package-creation-via-thread-pools.patch b/meta/recipes-devtools/rpm/files/0002-Run-binary-package-creation-via-thread-pools.patch
deleted file mode 100644
index d10041c2e1..0000000000
--- a/meta/recipes-devtools/rpm/files/0002-Run-binary-package-creation-via-thread-pools.patch
+++ /dev/null
@@ -1,127 +0,0 @@
-From 513200cf76758de4668312c628d6362bdabfaf4b Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Thu, 25 May 2017 19:30:20 +0300
-Subject: [PATCH 1/3] Run binary package creation via thread pools.
-
-Upstream-Status: Submitted [https://github.com/rpm-software-management/rpm/pull/226]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- build/pack.c | 81 +++++++++++++++++++++++++++++++++++++++++++++++++-----------
- configure.ac |  3 +++
- 2 files changed, 70 insertions(+), 14 deletions(-)
-
-diff --git a/build/pack.c b/build/pack.c
-index ccfd614cc..ed5b9ab4e 100644
---- a/build/pack.c
-+++ b/build/pack.c
-@@ -616,25 +616,78 @@ static rpmRC packageBinary(rpmSpec spec, Package pkg, const char *cookie, int ch
- 	return rc;
- }
- 
--rpmRC packageBinaries(rpmSpec spec, const char *cookie, int cheating)
-+struct binaryPackageTaskData
- {
--    rpmRC rc;
-     Package pkg;
-+    char *filename;
-+    rpmRC result;
-+    struct binaryPackageTaskData *next;
-+};
-+
-+static struct binaryPackageTaskData* runBinaryPackageTasks(rpmSpec spec, const char *cookie, int cheating)
-+{
-+    struct binaryPackageTaskData *tasks = NULL;
-+    struct binaryPackageTaskData *task = NULL;
-+    struct binaryPackageTaskData *prev = NULL;
-+
-+    for (Package pkg = spec->packages; pkg != NULL; pkg = pkg->next) {
-+        task = rcalloc(1, sizeof(*task));
-+        task->pkg = pkg;
-+        if (pkg == spec->packages) {
-+            // the first package needs to be processed ahead of others, as they copy
-+            // changelog data from it, and so otherwise data races would happen
-+            task->result = packageBinary(spec, pkg, cookie, cheating, &(task->filename));
-+            rpmlog(RPMLOG_NOTICE, _("Finished binary package job, result %d, filename %s\n"), task->result, task->filename);
-+            tasks = task;
-+        }
-+        if (prev != NULL) {
-+            prev->next = task;
-+        }
-+        prev = task;
-+    }
-+
-+    #pragma omp parallel
-+    #pragma omp single
-+    // re-declaring task variable is necessary, or older gcc versions will produce code that segfaults
-+    for (struct binaryPackageTaskData *task = tasks; task != NULL; task = task->next) {
-+        if (task != tasks)
-+        #pragma omp task
-+        {
-+            task->result = packageBinary(spec, task->pkg, cookie, cheating, &(task->filename));
-+            rpmlog(RPMLOG_NOTICE, _("Finished binary package job, result %d, filename %s\n"), task->result, task->filename);
-+        }
-+    }
-+
-+    return tasks;
-+}
-+
-+static void freeBinaryPackageTasks(struct binaryPackageTaskData* tasks)
-+{
-+    while (tasks != NULL) {
-+        struct binaryPackageTaskData* next = tasks->next;
-+        rfree(tasks->filename);
-+        rfree(tasks);
-+        tasks = next;
-+    }
-+}
-+
-+rpmRC packageBinaries(rpmSpec spec, const char *cookie, int cheating)
-+{
-     char *pkglist = NULL;
- 
--    for (pkg = spec->packages; pkg != NULL; pkg = pkg->next) {
--	char *fn = NULL;
--	rc = packageBinary(spec, pkg, cookie, cheating, &fn);
--	if (rc == RPMRC_OK) {
--	    rstrcat(&pkglist, fn);
--	    rstrcat(&pkglist, " ");
--	}
--	free(fn);
--	if (rc != RPMRC_OK) {
--	    pkglist = _free(pkglist);
--	    return rc;
--	}
-+    struct binaryPackageTaskData *tasks = runBinaryPackageTasks(spec, cookie, cheating);
-+
-+    for (struct binaryPackageTaskData *task = tasks; task != NULL; task = task->next) {
-+        if (task->result == RPMRC_OK) {
-+            rstrcat(&pkglist, task->filename);
-+            rstrcat(&pkglist, " ");
-+        } else {
-+            _free(pkglist);
-+            freeBinaryPackageTasks(tasks);
-+            return RPMRC_FAIL;
-+        }
-     }
-+    freeBinaryPackageTasks(tasks);
- 
-     /* Now check the package set if enabled */
-     if (pkglist != NULL) {
-diff --git a/configure.ac b/configure.ac
-index a506ec819..59fa0acaf 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -17,6 +17,9 @@ AC_DISABLE_STATIC
- 
- PKG_PROG_PKG_CONFIG
- 
-+AC_OPENMP
-+RPMCFLAGS="$OPENMP_CFLAGS $RPMCFLAGS"
-+
- dnl Checks for programs.
- AC_PROG_CXX
- AC_PROG_AWK
--- 
-2.11.0
-
diff --git a/meta/recipes-devtools/rpm/files/0003-rpmstrpool.c-make-operations-over-string-pools-threa.patch b/meta/recipes-devtools/rpm/files/0003-rpmstrpool.c-make-operations-over-string-pools-threa.patch
deleted file mode 100644
index c348ae5330..0000000000
--- a/meta/recipes-devtools/rpm/files/0003-rpmstrpool.c-make-operations-over-string-pools-threa.patch
+++ /dev/null
@@ -1,207 +0,0 @@
-From c80892f17e44331206c8318d53b63bb6a99554d0 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Tue, 30 May 2017 13:58:30 +0300
-Subject: [PATCH 3/4] rpmstrpool.c: make operations over string pools
- thread-safe
-
-Otherwise multithreaded rpm building explodes in various ways due
-to data races.
-
-Upstream-Status: Submitted [https://github.com/rpm-software-management/rpm/pull/226]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- rpmio/rpmstrpool.c | 56 +++++++++++++++++++++++++++++++++++++++++++++---------
- 1 file changed, 47 insertions(+), 9 deletions(-)
-
-diff --git a/rpmio/rpmstrpool.c b/rpmio/rpmstrpool.c
-index 30a57eb10..58ba95a02 100644
---- a/rpmio/rpmstrpool.c
-+++ b/rpmio/rpmstrpool.c
-@@ -113,6 +113,8 @@ static poolHash poolHashCreate(int numBuckets)
-     return ht;
- }
- 
-+static const char * rpmstrPoolStrNoLock(rpmstrPool pool, rpmsid sid);
-+
- static void poolHashResize(rpmstrPool pool, int numBuckets)
- {
-     poolHash ht = pool->hash;
-@@ -120,7 +122,7 @@ static void poolHashResize(rpmstrPool pool, int numBuckets)
- 
-     for (int i=0; i<ht->numBuckets; i++) {
-         if (!ht->buckets[i].keyid) continue;
--        unsigned int keyHash = rstrhash(rpmstrPoolStr(pool, ht->buckets[i].keyid));
-+        unsigned int keyHash = rstrhash(rpmstrPoolStrNoLock(pool, ht->buckets[i].keyid));
-         for (unsigned int j=0;;j++) {
-             unsigned int hash = hashbucket(keyHash, j) % numBuckets;
-             if (!buckets[hash].keyid) {
-@@ -149,7 +151,7 @@ static void poolHashAddHEntry(rpmstrPool pool, const char * key, unsigned int ke
-             ht->buckets[hash].keyid = keyid;
-             ht->keyCount++;
-             break;
--        } else if (!strcmp(rpmstrPoolStr(pool, ht->buckets[hash].keyid), key)) {
-+        } else if (!strcmp(rpmstrPoolStrNoLock(pool, ht->buckets[hash].keyid), key)) {
-             return;
-         }
-     }
-@@ -191,7 +193,7 @@ static void poolHashPrintStats(rpmstrPool pool)
-     int maxcollisions = 0;
- 
-     for (i=0; i<ht->numBuckets; i++) {
--        unsigned int keyHash = rstrhash(rpmstrPoolStr(pool, ht->buckets[i].keyid));
-+        unsigned int keyHash = rstrhash(rpmstrPoolStrNoLock(pool, ht->buckets[i].keyid));
-         for (unsigned int j=0;;j++) {
-             unsigned int hash = hashbucket(keyHash, i) % ht->numBuckets;
-             if (hash==i) {
-@@ -221,7 +223,7 @@ static void rpmstrPoolRehash(rpmstrPool pool)
- 
-     pool->hash = poolHashCreate(sizehint);
-     for (int i = 1; i <= pool->offs_size; i++)
--	poolHashAddEntry(pool, rpmstrPoolStr(pool, i), i);
-+	poolHashAddEntry(pool, rpmstrPoolStrNoLock(pool, i), i);
- }
- 
- rpmstrPool rpmstrPoolCreate(void)
-@@ -245,6 +247,8 @@ rpmstrPool rpmstrPoolCreate(void)
- 
- rpmstrPool rpmstrPoolFree(rpmstrPool pool)
- {
-+    #pragma omp critical(rpmstrpool)
-+    {
-     if (pool) {
- 	if (pool->nrefs > 1) {
- 	    pool->nrefs--;
-@@ -260,18 +264,24 @@ rpmstrPool rpmstrPoolFree(rpmstrPool pool)
- 	    free(pool);
- 	}
-     }
-+    }
-     return NULL;
- }
- 
- rpmstrPool rpmstrPoolLink(rpmstrPool pool)
- {
-+    #pragma omp critical(rpmstrpool)
-+    {
-     if (pool)
- 	pool->nrefs++;
-+    }
-     return pool;
- }
- 
- void rpmstrPoolFreeze(rpmstrPool pool, int keephash)
- {
-+    #pragma omp critical(rpmstrpool)
-+    {
-     if (pool && !pool->frozen) {
- 	if (!keephash) {
- 	    pool->hash = poolHashFree(pool->hash);
-@@ -281,16 +291,20 @@ void rpmstrPoolFreeze(rpmstrPool pool, int keephash)
- 			      pool->offs_alloced * sizeof(*pool->offs));
- 	pool->frozen = 1;
-     }
-+    }
- }
- 
- void rpmstrPoolUnfreeze(rpmstrPool pool)
- {
-+    #pragma omp critical(rpmstrpool)
-+    {
-     if (pool) {
- 	if (pool->hash == NULL) {
- 	    rpmstrPoolRehash(pool);
- 	}
- 	pool->frozen = 0;
-     }
-+    }
- }
- 
- static rpmsid rpmstrPoolPut(rpmstrPool pool, const char *s, size_t slen, unsigned int hash)
-@@ -350,7 +364,7 @@ static rpmsid rpmstrPoolGet(rpmstrPool pool, const char * key, size_t keylen,
-             return 0;
-         }
- 
--	s = rpmstrPoolStr(pool, ht->buckets[hash].keyid);
-+	s = rpmstrPoolStrNoLock(pool, ht->buckets[hash].keyid);
- 	/* pool string could be longer than keylen, require exact matche */
- 	if (strncmp(s, key, keylen) == 0 && s[keylen] == '\0')
- 	    return ht->buckets[hash].keyid;
-@@ -373,27 +387,31 @@ static inline rpmsid strn2id(rpmstrPool pool, const char *s, size_t slen,
- rpmsid rpmstrPoolIdn(rpmstrPool pool, const char *s, size_t slen, int create)
- {
-     rpmsid sid = 0;
--
-+    #pragma omp critical(rpmstrpool)
-+    {
-     if (s != NULL) {
- 	unsigned int hash = rstrnhash(s, slen);
- 	sid = strn2id(pool, s, slen, hash, create);
-     }
-+    }
-     return sid;
- }
- 
- rpmsid rpmstrPoolId(rpmstrPool pool, const char *s, int create)
- {
-     rpmsid sid = 0;
--
-+    #pragma omp critical(rpmstrpool)
-+    {
-     if (s != NULL) {
- 	size_t slen;
- 	unsigned int hash = rstrlenhash(s, &slen);
- 	sid = strn2id(pool, s, slen, hash, create);
-     }
-+    }
-     return sid;
- }
- 
--const char * rpmstrPoolStr(rpmstrPool pool, rpmsid sid)
-+static const char * rpmstrPoolStrNoLock(rpmstrPool pool, rpmsid sid)
- {
-     const char *s = NULL;
-     if (pool && sid > 0 && sid <= pool->offs_size)
-@@ -401,12 +419,25 @@ const char * rpmstrPoolStr(rpmstrPool pool, rpmsid sid)
-     return s;
- }
- 
-+const char * rpmstrPoolStr(rpmstrPool pool, rpmsid sid)
-+{
-+    const char *s = NULL;
-+    #pragma omp critical(rpmstrpool)
-+    {
-+    s = rpmstrPoolStrNoLock(pool, sid);
-+    }
-+    return s;
-+}
-+
- size_t rpmstrPoolStrlen(rpmstrPool pool, rpmsid sid)
- {
-     size_t slen = 0;
-+    #pragma omp critical(rpmstrpool)
-+    {
-     if (pool && sid > 0 && sid <= pool->offs_size) {
- 	slen = strlen(pool->offs[sid]);
-     }
-+    }
-     return slen;
- }
- 
-@@ -421,5 +452,12 @@ int rpmstrPoolStreq(rpmstrPool poolA, rpmsid sidA,
- 
- rpmsid rpmstrPoolNumStr(rpmstrPool pool)
- {
--    return (pool != NULL) ? pool->offs_size : 0;
-+    rpmsid id = 0;
-+    #pragma omp critical(rpmstrpool)
-+    {
-+    if (pool) {
-+	id = pool->offs_size;
-+    }
-+    }
-+    return id;
- }
--- 
-2.11.0
-
diff --git a/meta/recipes-devtools/rpm/files/0004-build-pack.c-remove-static-local-variables-from-buil.patch b/meta/recipes-devtools/rpm/files/0004-build-pack.c-remove-static-local-variables-from-buil.patch
deleted file mode 100644
index 652e30b3e4..0000000000
--- a/meta/recipes-devtools/rpm/files/0004-build-pack.c-remove-static-local-variables-from-buil.patch
+++ /dev/null
@@ -1,336 +0,0 @@
-From 792693bb90768cfde4898e8dd31ee1b5de803d2f Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Thu, 8 Jun 2017 17:08:09 +0300
-Subject: [PATCH] build/pack.c: remove static local variables from buildHost()
- and getBuildTime()
-
-Their use is causing difficult to diagnoze data races when building multiple
-packages in parallel, and is a bad idea in general, as it also makes it more
-difficult to reason about code.
-
-Upstream-Status: Submitted [https://github.com/rpm-software-management/rpm/pull/226]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- build/build.c             | 54 ++++++++++++++++++++++++++++--
- build/pack.c              | 84 +++++++++--------------------------------------
- build/rpmbuild_internal.h |  8 +++--
- 3 files changed, 74 insertions(+), 72 deletions(-)
-
-diff --git a/build/build.c b/build/build.c
-index 13c3df2..b154f08 100644
---- a/build/build.c
-+++ b/build/build.c
-@@ -6,6 +6,8 @@
- #include "system.h"
- 
- #include <errno.h>
-+#include <netdb.h>
-+#include <time.h>
- #include <sys/wait.h>
- 
- #include <rpm/rpmlog.h>
-@@ -16,6 +18,50 @@
- 
- #include "debug.h"
- 
-+static rpm_time_t getBuildTime(void)
-+{
-+    rpm_time_t buildTime = 0;
-+    char *srcdate;
-+    time_t epoch;
-+    char *endptr;
-+
-+    srcdate = getenv("SOURCE_DATE_EPOCH");
-+    if (srcdate) {
-+        errno = 0;
-+        epoch = strtol(srcdate, &endptr, 10);
-+        if (srcdate == endptr || *endptr || errno != 0)
-+            rpmlog(RPMLOG_ERR, _("unable to parse SOURCE_DATE_EPOCH\n"));
-+        else
-+            buildTime = (int32_t) epoch;
-+    } else
-+        buildTime = (int32_t) time(NULL);
-+
-+    return buildTime;
-+}
-+
-+static char * buildHost(void)
-+{
-+    char* hostname;
-+    struct hostent *hbn;
-+    char *bhMacro;
-+
-+    bhMacro = rpmExpand("%{?_buildhost}", NULL);
-+    if (strcmp(bhMacro, "") != 0) {
-+        rasprintf(&hostname, "%s", bhMacro);
-+    } else {
-+        hostname = rcalloc(1024, sizeof(*hostname));
-+        (void) gethostname(hostname, 1024);
-+        hbn = gethostbyname(hostname);
-+        if (hbn)
-+            strcpy(hostname, hbn->h_name);
-+        else
-+            rpmlog(RPMLOG_WARNING,
-+                    _("Could not canonicalize hostname: %s\n"), hostname);
-+    }
-+    free(bhMacro);
-+    return(hostname);
-+}
-+
- /**
-  */
- static rpmRC doRmSource(rpmSpec spec)
-@@ -201,6 +247,9 @@ static rpmRC buildSpec(BTA_t buildArgs, rpmSpec spec, int what)
-     rpmRC rc = RPMRC_OK;
-     int test = (what & RPMBUILD_NOBUILD);
-     char *cookie = buildArgs->cookie ? xstrdup(buildArgs->cookie) : NULL;
-+    const char* host = buildHost();
-+    rpm_time_t buildTime = getBuildTime();
-+
- 
-     if (rpmExpandNumeric("%{?source_date_epoch_from_changelog}") &&
- 	getenv("SOURCE_DATE_EPOCH") == NULL) {
-@@ -269,11 +318,11 @@ static rpmRC buildSpec(BTA_t buildArgs, rpmSpec spec, int what)
- 		goto exit;
- 
- 	if (((what & RPMBUILD_PACKAGESOURCE) && !test) &&
--	    (rc = packageSources(spec, &cookie)))
-+	    (rc = packageSources(spec, &cookie, buildTime, host)))
- 		goto exit;
- 
- 	if (((what & RPMBUILD_PACKAGEBINARY) && !test) &&
--	    (rc = packageBinaries(spec, cookie, (didBuild == 0))))
-+	    (rc = packageBinaries(spec, cookie, (didBuild == 0), buildTime, host)))
- 		goto exit;
- 	
- 	if ((what & RPMBUILD_CLEAN) &&
-@@ -293,6 +342,7 @@ static rpmRC buildSpec(BTA_t buildArgs, rpmSpec spec, int what)
- 	(void) unlink(spec->specFile);
- 
- exit:
-+    free(host);
-     free(cookie);
-     spec->rootDir = NULL;
-     if (rc != RPMRC_OK && rpmlogGetNrecs() > 0) {
-diff --git a/build/pack.c b/build/pack.c
-index df15876..17a4b09 100644
---- a/build/pack.c
-+++ b/build/pack.c
-@@ -6,8 +6,6 @@
- #include "system.h"
- 
- #include <errno.h>
--#include <netdb.h>
--#include <time.h>
- #include <sys/wait.h>
- 
- #include <rpm/rpmlib.h>			/* RPMSIGTAG*, rpmReadPackageFile */
-@@ -152,57 +150,6 @@ exit:
-     return rc;
- }
- 
--static rpm_time_t * getBuildTime(void)
--{
--    static rpm_time_t buildTime[1];
--    char *srcdate;
--    time_t epoch;
--    char *endptr;
--
--    if (buildTime[0] == 0) {
--        srcdate = getenv("SOURCE_DATE_EPOCH");
--        if (srcdate) {
--            errno = 0;
--            epoch = strtol(srcdate, &endptr, 10);
--            if (srcdate == endptr || *endptr || errno != 0)
--                rpmlog(RPMLOG_ERR, _("unable to parse SOURCE_DATE_EPOCH\n"));
--            else
--                buildTime[0] = (int32_t) epoch;
--        } else
--            buildTime[0] = (int32_t) time(NULL);
--    }
--
--    return buildTime;
--}
--
--static const char * buildHost(void)
--{
--    static char hostname[1024];
--    static int oneshot = 0;
--    struct hostent *hbn;
--    char *bhMacro;
--
--    if (! oneshot) {
--        bhMacro = rpmExpand("%{?_buildhost}", NULL);
--        if (strcmp(bhMacro, "") != 0 && strlen(bhMacro) < 1024) {
--            strcpy(hostname, bhMacro);
--        } else {
--            if (strcmp(bhMacro, "") != 0)
--                rpmlog(RPMLOG_WARNING, _("The _buildhost macro is too long\n"));
--            (void) gethostname(hostname, sizeof(hostname));
--            hbn = gethostbyname(hostname);
--            if (hbn)
--                strcpy(hostname, hbn->h_name);
--            else
--                rpmlog(RPMLOG_WARNING,
--                        _("Could not canonicalize hostname: %s\n"), hostname);
--        }
--        free(bhMacro);
--        oneshot = 1;
--    }
--    return(hostname);
--}
--
- static rpmRC processScriptFiles(rpmSpec spec, Package pkg)
- {
-     struct TriggerFileEntry *p;
-@@ -476,7 +423,8 @@ exit:
-  * order to how the RPM format is laid on disk.
-  */
- static rpmRC writeRPM(Package pkg, unsigned char ** pkgidp,
--		      const char *fileName, char **cookie)
-+		      const char *fileName, char **cookie,
-+		      rpm_time_t buildTime, const char* buildHost)
- {
-     FD_t fd = NULL;
-     char * rpmio_flags = NULL;
-@@ -500,7 +448,7 @@ static rpmRC writeRPM(Package pkg, unsigned char ** pkgidp,
- 
-     /* Create and add the cookie */
-     if (cookie) {
--	rasprintf(cookie, "%s %d", buildHost(), (int) (*getBuildTime()));
-+	rasprintf(cookie, "%s %d", buildHost, buildTime);
- 	headerPutString(pkg->header, RPMTAG_COOKIE, *cookie);
-     }
- 
-@@ -641,7 +589,7 @@ static rpmRC checkPackages(char *pkgcheck)
-     return RPMRC_OK;
- }
- 
--static rpmRC packageBinary(rpmSpec spec, Package pkg, const char *cookie, int cheating, char** filename)
-+static rpmRC packageBinary(rpmSpec spec, Package pkg, const char *cookie, int cheating, char** filename, rpm_time_t buildTime, const char* buildHost)
- {
- 	const char *errorString;
- 	rpmRC rc = RPMRC_OK;
-@@ -660,8 +608,8 @@ static rpmRC packageBinary(rpmSpec spec, Package pkg, const char *cookie, int ch
- 	headerCopyTags(spec->packages->header, pkg->header, copyTags);
- 	
- 	headerPutString(pkg->header, RPMTAG_RPMVERSION, VERSION);
--	headerPutString(pkg->header, RPMTAG_BUILDHOST, buildHost());
--	headerPutUint32(pkg->header, RPMTAG_BUILDTIME, getBuildTime(), 1);
-+	headerPutString(pkg->header, RPMTAG_BUILDHOST, buildHost);
-+	headerPutUint32(pkg->header, RPMTAG_BUILDTIME, &buildTime, 1);
- 
- 	if (spec->sourcePkgId != NULL) {
- 	    headerPutBin(pkg->header, RPMTAG_SOURCEPKGID, spec->sourcePkgId,16);
-@@ -699,7 +647,7 @@ static rpmRC packageBinary(rpmSpec spec, Package pkg, const char *cookie, int ch
- 	    free(binRpm);
- 	}
- 
--	rc = writeRPM(pkg, NULL, *filename, NULL);
-+	rc = writeRPM(pkg, NULL, *filename, NULL, buildTime, buildHost);
- 	if (rc == RPMRC_OK) {
- 	    /* Do check each written package if enabled */
- 	    char *pkgcheck = rpmExpand("%{?_build_pkgcheck} ", *filename, NULL);
-@@ -719,7 +667,7 @@ struct binaryPackageTaskData
-     struct binaryPackageTaskData *next;
- };
- 
--static struct binaryPackageTaskData* runBinaryPackageTasks(rpmSpec spec, const char *cookie, int cheating)
-+static struct binaryPackageTaskData* runBinaryPackageTasks(rpmSpec spec, const char *cookie, int cheating, rpm_time_t buildTime, char* buildHost)
- {
-     struct binaryPackageTaskData *tasks = NULL;
-     struct binaryPackageTaskData *task = NULL;
-@@ -731,7 +679,7 @@ static struct binaryPackageTaskData* runBinaryPackageTasks(rpmSpec spec, const c
-         if (pkg == spec->packages) {
-             // the first package needs to be processed ahead of others, as they copy
-             // changelog data from it, and so otherwise data races would happen
--            task->result = packageBinary(spec, pkg, cookie, cheating, &(task->filename));
-+            task->result = packageBinary(spec, pkg, cookie, cheating, &(task->filename), buildTime, buildHost);
-             rpmlog(RPMLOG_NOTICE, _("Finished binary package job, result %d, filename %s\n"), task->result, task->filename);
-             tasks = task;
-         }
-@@ -748,7 +696,7 @@ static struct binaryPackageTaskData* runBinaryPackageTasks(rpmSpec spec, const c
-         if (task != tasks)
-         #pragma omp task
-         {
--            task->result = packageBinary(spec, task->pkg, cookie, cheating, &(task->filename));
-+            task->result = packageBinary(spec, task->pkg, cookie, cheating, &(task->filename), buildTime, buildHost);
-             rpmlog(RPMLOG_NOTICE, _("Finished binary package job, result %d, filename %s\n"), task->result, task->filename);
-         }
-     }
-@@ -766,11 +714,11 @@ static void freeBinaryPackageTasks(struct binaryPackageTaskData* tasks)
-     }
- }
- 
--rpmRC packageBinaries(rpmSpec spec, const char *cookie, int cheating)
-+rpmRC packageBinaries(rpmSpec spec, const char *cookie, int cheating, rpm_time_t buildTime, char* buildHost)
- {
-     char *pkglist = NULL;
- 
--    struct binaryPackageTaskData *tasks = runBinaryPackageTasks(spec, cookie, cheating);
-+    struct binaryPackageTaskData *tasks = runBinaryPackageTasks(spec, cookie, cheating, buildTime, buildHost);
- 
-     for (struct binaryPackageTaskData *task = tasks; task != NULL; task = task->next) {
-         if (task->result == RPMRC_OK) {
-@@ -797,7 +745,7 @@ rpmRC packageBinaries(rpmSpec spec, const char *cookie, int cheating)
-     return RPMRC_OK;
- }
- 
--rpmRC packageSources(rpmSpec spec, char **cookie)
-+rpmRC packageSources(rpmSpec spec, char **cookie, rpm_time_t buildTime, char* buildHost)
- {
-     Package sourcePkg = spec->sourcePackage;
-     rpmRC rc;
-@@ -805,8 +753,8 @@ rpmRC packageSources(rpmSpec spec, char **cookie)
- 
-     /* Add some cruft */
-     headerPutString(sourcePkg->header, RPMTAG_RPMVERSION, VERSION);
--    headerPutString(sourcePkg->header, RPMTAG_BUILDHOST, buildHost());
--    headerPutUint32(sourcePkg->header, RPMTAG_BUILDTIME, getBuildTime(), 1);
-+    headerPutString(sourcePkg->header, RPMTAG_BUILDHOST, buildHost);
-+    headerPutUint32(sourcePkg->header, RPMTAG_BUILDTIME, &buildTime, 1);
-     headerPutUint32(sourcePkg->header, RPMTAG_SOURCEPACKAGE, &one, 1);
- 
-     /* XXX this should be %_srpmdir */
-@@ -814,7 +762,7 @@ rpmRC packageSources(rpmSpec spec, char **cookie)
- 	char *pkgcheck = rpmExpand("%{?_build_pkgcheck_srpm} ", fn, NULL);
- 
- 	spec->sourcePkgId = NULL;
--	rc = writeRPM(sourcePkg, &spec->sourcePkgId, fn, cookie);
-+	rc = writeRPM(sourcePkg, &spec->sourcePkgId, fn, cookie, buildTime, buildHost);
- 
- 	/* Do check SRPM package if enabled */
- 	if (rc == RPMRC_OK && pkgcheck[0] != ' ') {
-diff --git a/build/rpmbuild_internal.h b/build/rpmbuild_internal.h
-index 439b7d3..07e8338 100644
---- a/build/rpmbuild_internal.h
-+++ b/build/rpmbuild_internal.h
-@@ -427,19 +427,23 @@ rpmRC processSourceFiles(rpmSpec spec, rpmBuildPkgFlags pkgFlags);
-  * @param spec		spec file control structure
-  * @param cookie	build identifier "cookie" or NULL
-  * @param cheating	was build shortcircuited?
-+ * @param buildTime	the build timestamp that goes into packages
-+ * @param buildHost	the hostname where the build is happening
-  * @return		RPMRC_OK on success
-  */
- RPM_GNUC_INTERNAL
--rpmRC packageBinaries(rpmSpec spec, const char *cookie, int cheating);
-+rpmRC packageBinaries(rpmSpec spec, const char *cookie, int cheating, rpm_time_t buildTime, char* buildHost);
- 
- /** \ingroup rpmbuild
-  * Generate source package.
-  * @param spec		spec file control structure
-  * @retval cookie	build identifier "cookie" or NULL
-+ * @param buildTime	the build timestamp that goes into packages
-+ * @param buildHost	the hostname where the build is happening
-  * @return		RPMRC_OK on success
-  */
- RPM_GNUC_INTERNAL
--rpmRC packageSources(rpmSpec spec, char **cookie);
-+rpmRC packageSources(rpmSpec spec, char **cookie, rpm_time_t buildTime, char* buildHost);
- 
- RPM_GNUC_INTERNAL
- int addLangTag(rpmSpec spec, Header h, rpmTagVal tag,
diff --git a/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb b/meta/recipes-devtools/rpm/rpm_4.15.1.bb
similarity index 89%
rename from meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
rename to meta/recipes-devtools/rpm/rpm_4.15.1.bb
index 17255dc87a..5c1190a3df 100644
--- a/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.15.1.bb
@@ -24,7 +24,7 @@ HOMEPAGE = "http://www.rpm.org"
 LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c0bf017c0fd1920e6158a333acabfd4a"
 
-SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.14.x \
+SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.15.x \
            file://0001-Do-not-add-an-unsatisfiable-dependency-when-building.patch \
            file://0001-Do-not-read-config-files-from-HOME.patch \
            file://0001-When-cross-installing-execute-package-scriptlets-wit.patch \
@@ -34,20 +34,15 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.14.x \
            file://0001-Fix-build-with-musl-C-library.patch \
            file://0001-Add-a-color-setting-for-mips64_n32-binaries.patch \
            file://0011-Do-not-require-that-ELF-binaries-are-executable-to-b.patch \
-           file://0001-Split-binary-package-building-into-a-separate-functi.patch \
-           file://0002-Run-binary-package-creation-via-thread-pools.patch \
-           file://0003-rpmstrpool.c-make-operations-over-string-pools-threa.patch \
-           file://0004-build-pack.c-remove-static-local-variables-from-buil.patch \
            file://0001-perl-disable-auto-reqs.patch \
            file://0001-rpm-rpmio.c-restrict-virtual-memory-usage-if-limit-s.patch \
            file://0016-rpmscript.c-change-logging-level-around-scriptlets-t.patch \
-           file://0001-mono-find-provides-requires-do-not-use-monodis-from-.patch \
-           file://0001-Rip-out-partial-support-for-unused-MD2-and-RIPEMD160.patch \
            file://0001-rpmplugins.c-call-dlerror-prior-to-dlsym.patch \
+           file://0001-rpmfc.c-do-not-run-file-classification-in-parallel.patch \
            "
 
 PE = "1"
-SRCREV = "4a9440006398646583f0d9ae1837dad2875013aa"
+SRCREV = "ab2179452c5be276a6b96c591afded485c7e58c3"
 
 S = "${WORKDIR}/git"
 
@@ -61,7 +56,7 @@ export PYTHON_ABI
 EXTRA_AUTORECONF_append = " --exclude=gnu-configize"
 
 EXTRA_OECONF_append = " --without-lua --enable-python --with-crypto=openssl"
-EXTRA_OECONF_append_libc-musl = " --disable-nls"
+EXTRA_OECONF_append_libc-musl = " --disable-nls --disable-openmp"
 
 # --sysconfdir prevents rpm from attempting to access machine-specific configuration in sysroot/etc; we need to have it in rootfs
 #
@@ -127,8 +122,7 @@ do_install_append () {
 	    ${D}/${libdir}/rpm/macros
 
 	sed -i -e 's|/usr/bin/python|${USRBINPATH}/env ${PYTHON_PN}|' \
-	    ${D}${libdir}/rpm/pythondistdeps.py \
-	    ${D}${libdir}/rpm/python-macro-helper
+	    ${D}${libdir}/rpm/pythondistdeps.py
 }
 
 FILES_${PN} += "${libdir}/rpm-plugins/*.so \
-- 
2.26.1

