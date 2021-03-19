Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web08.3573.1616143515999282147
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Mar 2021 01:45:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MkQkBgpu;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id r12so8362392ejr.5
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Mar 2021 01:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=au4Mzkr+42OJcy2ORD6IlmCYdMV8aDf03ajBdarEsLY=;
        b=MkQkBgpu1qqDq+rROXUIL/VaHpGDeoEKHmXsMVIouGrL8wZBdjmUvYyne2LEM9sYcj
         F2FmWih4OkPAG5hhUNB/jLWnyv720TMp3uZlgVsDCb6sBMtK+YgAiGOTc94Hjp7EiuCG
         PHg/iK3PQkxeV6ETBFigxsieLDeT6Q2hWOiWAcONss7wpt2TC/dtaoInWApnqPQNkXY6
         A30NobSVfMaJEoQjoXy66g2MO+mP4hUi9uVCmZTuakYpS9qrDugaWGb1MqFES+PnELyE
         7U1vju93Sjc8LmIVS0hqkAvzbAP9QIsGuhE3m/dfB+cDb373ivA/oEXgZNzkq7G7HKI3
         37OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=au4Mzkr+42OJcy2ORD6IlmCYdMV8aDf03ajBdarEsLY=;
        b=YgSxH/6814zOEPWTEQWe88tJxxiex30qxmYY+6HHbvgm4cHLbcJZOFUOVtoWYyxeFy
         hcJrjlKquJ4DMHoPWhMqkoKVi86QvclbJQ6mT8rrvUTKqiabfAF/0jIlFf4g46bHzjbC
         i2ky3XxNMJId1g6IZv+1MvD8genw9kjHNKFTn11ZkqvvcoJg28x5JGRWOtHoH9OREG1Y
         ojK198eKPSIFEevCARAwV+IBt304RBqiuaVZvqS67XI3g2L6nBYh8ITe/WONDMhDAi5v
         A1ePJhaZldrNbi66kuvoua9s+AAcOKNp9FhYF8cBz+8qdyx3avjOeJJbSAEwO1it/KgQ
         nmrg==
X-Gm-Message-State: AOAM531Q/JitITcFa4gk7UZDidXNT78DujuWtUEPSE70EcyuaUDRKPJJ
	MMo7oTU+CQcit+zWu6CS4IJhgWtCNXI7Wg==
X-Google-Smtp-Source: ABdhPJwkX7scbMkAvTfQWgCJ5oHahkJsrOy0YH9Idup2J31eZRfQPDRmxr55kmUyXOPTtReR/b5gxQ==
X-Received: by 2002:a17:906:b159:: with SMTP id bt25mr3051248ejb.364.1616143514561;
        Fri, 19 Mar 2021 01:45:14 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id nd36sm3262248ejc.21.2021.03.19.01.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Mar 2021 01:45:14 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 11/16] strace: update 5.10 -> 5.11
Date: Fri, 19 Mar 2021 09:43:56 +0100
Message-Id: <20210319084401.576728-11-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210319084401.576728-1-alex.kanavin@gmail.com>
References: <20210319084401.576728-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop disable-git-version-gen.patch as problem fixed upstream.

Add parallel builds to ptest compile.

strace-graph has been removed upstream.

Adjust ptest patch to match upstream changes.

License-Update: copyright years.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../strace/strace/Makefile-ptest.patch        | 19 ++++----
 .../strace/disable-git-version-gen.patch      | 37 ----------------
 .../strace/strace/update-gawk-paths.patch     | 44 +++++++++----------
 .../strace/{strace_5.10.bb => strace_5.11.bb} | 18 +++-----
 4 files changed, 39 insertions(+), 79 deletions(-)
 delete mode 100644 meta/recipes-devtools/strace/strace/disable-git-version-gen.patch
 rename meta/recipes-devtools/strace/{strace_5.10.bb => strace_5.11.bb} (79%)

diff --git a/meta/recipes-devtools/strace/strace/Makefile-ptest.patch b/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
index 42c1893f39..4cef0c0127 100644
--- a/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
+++ b/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
@@ -1,4 +1,4 @@
-From ee47e205255928679701a5b769bd7ae0f815119d Mon Sep 17 00:00:00 2001
+From 205e7661822987825c7149ada4eefdc5368828ce Mon Sep 17 00:00:00 2001
 From: Gabriel Barbu <gabriel.barbu@enea.com>
 Date: Thu, 25 Jul 2013 15:28:33 +0200
 Subject: [PATCH] strace: Add ptest
@@ -10,14 +10,14 @@ Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
 Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
 
 ---
- tests/Makefile.am | 19 +++++++++++++++++++
- 1 file changed, 19 insertions(+)
+ tests/Makefile.am | 20 ++++++++++++++++++++
+ 1 file changed, 20 insertions(+)
 
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 8cf4c36..66162eb 100644
+index b8efce8..fa9a1af 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -15,6 +15,7 @@ SIZEOF_LONG = @SIZEOF_LONG@
+@@ -16,6 +16,7 @@ SIZEOF_LONG = @SIZEOF_LONG@
  MPERS_NAME =
  MPERS_CC_FLAGS =
  ARCH_MFLAGS =
@@ -25,16 +25,17 @@ index 8cf4c36..66162eb 100644
  AM_CFLAGS = $(WARN_CFLAGS)
  AM_CPPFLAGS = $(ARCH_MFLAGS) \
  	      -I$(builddir) \
-@@ -538,3 +539,21 @@ BUILT_SOURCES = ksysent.h
+@@ -692,3 +693,22 @@ BUILT_SOURCES = ksysent.h
  CLEANFILES = ksysent.h
  
- include ../scno.am
+ include ../src/scno.am
 +
 +buildtest-TESTS: $(check_PROGRAMS) $(TESTS)
 +
 +install-ptest:
-+	install $(BUILDDIR)/strace $(DESTDIR)
-+	install $(srcdir)/../strace-log-merge $(DESTDIR)
++	install -d $(DESTDIR)/src
++	install $(BUILDDIR)/src/strace $(DESTDIR)/src
++	install $(srcdir)/../src/strace-log-merge $(DESTDIR)/src
 +	install -d $(DESTDIR)/$(TESTDIR)
 +	cp $(BUILDDIR)/$(TESTDIR)/Makefile $(DESTDIR)/$(TESTDIR)
 +	sed -i -e 's/^Makefile:/_Makefile:/' $(DESTDIR)/$(TESTDIR)/Makefile
diff --git a/meta/recipes-devtools/strace/strace/disable-git-version-gen.patch b/meta/recipes-devtools/strace/strace/disable-git-version-gen.patch
deleted file mode 100644
index e8dbd7f273..0000000000
--- a/meta/recipes-devtools/strace/strace/disable-git-version-gen.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From d87a7feb5ea75da7061afdd473faba044ec8eb0f Mon Sep 17 00:00:00 2001
-From: Andre McCurdy <armccurdy@gmail.com>
-Date: Mon, 18 Jan 2016 13:33:50 -0800
-Subject: [PATCH] strace: remove need for scripts
-
-git-version-gen copyright-year-gen file-date-gen are not included in
-tarball releases, so we need to avoid attempts to call them.
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
-
----
- configure.ac | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index dd4f13f..65f000b 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -12,12 +12,12 @@
- 
- AC_PREREQ(2.57)
- AC_INIT([strace],
--	st_esyscmd_s([./git-version-gen .tarball-version]),
-+	m4_esyscmd_s([cat .tarball-version]),
- 	[strace-devel@lists.strace.io],
- 	[strace],
- 	[https://strace.io])
--m4_define([copyright_year], st_esyscmd_s([./copyright-year-gen .year]))
--m4_define([manpage_date], st_esyscmd_s([./file-date-gen strace.1.in]))
-+m4_define([copyright_year], m4_esyscmd_s([cat .year]))
-+m4_define([manpage_date], m4_esyscmd_s([cat .strace.1.in.date]))
- AC_COPYRIGHT([Copyright (c) 1999-]copyright_year[ The strace developers.])
- AC_CONFIG_SRCDIR([strace.c])
- AC_CONFIG_AUX_DIR([.])
diff --git a/meta/recipes-devtools/strace/strace/update-gawk-paths.patch b/meta/recipes-devtools/strace/strace/update-gawk-paths.patch
index d46b147de5..0c683496ae 100644
--- a/meta/recipes-devtools/strace/strace/update-gawk-paths.patch
+++ b/meta/recipes-devtools/strace/strace/update-gawk-paths.patch
@@ -1,4 +1,4 @@
-From 12a726b280eca94883edcb4da1eaaf8e93d41739 Mon Sep 17 00:00:00 2001
+From 4cd26cfaec255ec87f22abe886e0be89312a9671 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Mon, 18 Jan 2016 11:01:00 -0800
 Subject: [PATCH] update gawk paths, /bin/gawk -> /usr/bin/gawk
@@ -13,7 +13,7 @@ Upstream-Status: Inappropriate [configuration]
 Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
 
 ---
- mpers.awk                   | 2 +-
+ src/mpers.awk               | 2 +-
  tests-m32/caps.awk          | 2 +-
  tests-m32/match.awk         | 2 +-
  tests-m32/rt_sigaction.awk  | 2 +-
@@ -25,18 +25,18 @@ Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
  tests/rt_sigaction.awk      | 2 +-
  10 files changed, 10 insertions(+), 10 deletions(-)
 
-diff --git a/mpers.awk b/mpers.awk
-index 17f8f2b..d69dcd5 100644
---- a/mpers.awk
-+++ b/mpers.awk
+diff --git a/src/mpers.awk b/src/mpers.awk
+index 25a212f..b2ff53f 100644
+--- a/src/mpers.awk
++++ b/src/mpers.awk
 @@ -1,4 +1,4 @@
 -#!/bin/gawk
 +#!/usr/bin/gawk
  #
  # Copyright (c) 2015 Elvira Khabirova <lineprinter0@gmail.com>
- # Copyright (c) 2015-2016 Dmitry V. Levin <ldv@altlinux.org>
+ # Copyright (c) 2015-2016 Dmitry V. Levin <ldv@strace.io>
 diff --git a/tests-m32/caps.awk b/tests-m32/caps.awk
-index 941564a..0bcc3ff 100644
+index 69500ec..e5dfd87 100644
 --- a/tests-m32/caps.awk
 +++ b/tests-m32/caps.awk
 @@ -1,4 +1,4 @@
@@ -46,27 +46,27 @@ index 941564a..0bcc3ff 100644
  # This file is part of caps strace test.
  #
 diff --git a/tests-m32/match.awk b/tests-m32/match.awk
-index d91c518..ee5d908 100644
+index 1cde87c..df63f78 100644
 --- a/tests-m32/match.awk
 +++ b/tests-m32/match.awk
 @@ -1,4 +1,4 @@
 -#!/bin/gawk
 +#!/usr/bin/gawk
  #
- # Copyright (c) 2014-2018 Dmitry V. Levin <ldv@altlinux.org>
+ # Copyright (c) 2014-2021 Dmitry V. Levin <ldv@strace.io>
  # All rights reserved.
 diff --git a/tests-m32/rt_sigaction.awk b/tests-m32/rt_sigaction.awk
-index 81dd813..9cd9549 100644
+index dce78f5..573d9ea 100644
 --- a/tests-m32/rt_sigaction.awk
 +++ b/tests-m32/rt_sigaction.awk
 @@ -1,4 +1,4 @@
 -#!/bin/gawk
 +#!/usr/bin/gawk
  #
- # Copyright (c) 2014-2015 Dmitry V. Levin <ldv@altlinux.org>
+ # Copyright (c) 2014-2015 Dmitry V. Levin <ldv@strace.io>
  # Copyright (c) 2016 Elvira Khabirova <lineprinter0@gmail.com>
 diff --git a/tests-mx32/caps.awk b/tests-mx32/caps.awk
-index 941564a..0bcc3ff 100644
+index 69500ec..e5dfd87 100644
 --- a/tests-mx32/caps.awk
 +++ b/tests-mx32/caps.awk
 @@ -1,4 +1,4 @@
@@ -76,27 +76,27 @@ index 941564a..0bcc3ff 100644
  # This file is part of caps strace test.
  #
 diff --git a/tests-mx32/match.awk b/tests-mx32/match.awk
-index d91c518..ee5d908 100644
+index 1cde87c..df63f78 100644
 --- a/tests-mx32/match.awk
 +++ b/tests-mx32/match.awk
 @@ -1,4 +1,4 @@
 -#!/bin/gawk
 +#!/usr/bin/gawk
  #
- # Copyright (c) 2014-2018 Dmitry V. Levin <ldv@altlinux.org>
+ # Copyright (c) 2014-2021 Dmitry V. Levin <ldv@strace.io>
  # All rights reserved.
 diff --git a/tests-mx32/rt_sigaction.awk b/tests-mx32/rt_sigaction.awk
-index 81dd813..9cd9549 100644
+index dce78f5..573d9ea 100644
 --- a/tests-mx32/rt_sigaction.awk
 +++ b/tests-mx32/rt_sigaction.awk
 @@ -1,4 +1,4 @@
 -#!/bin/gawk
 +#!/usr/bin/gawk
  #
- # Copyright (c) 2014-2015 Dmitry V. Levin <ldv@altlinux.org>
+ # Copyright (c) 2014-2015 Dmitry V. Levin <ldv@strace.io>
  # Copyright (c) 2016 Elvira Khabirova <lineprinter0@gmail.com>
 diff --git a/tests/caps.awk b/tests/caps.awk
-index 941564a..0bcc3ff 100644
+index 69500ec..e5dfd87 100644
 --- a/tests/caps.awk
 +++ b/tests/caps.awk
 @@ -1,4 +1,4 @@
@@ -106,22 +106,22 @@ index 941564a..0bcc3ff 100644
  # This file is part of caps strace test.
  #
 diff --git a/tests/match.awk b/tests/match.awk
-index d91c518..ee5d908 100644
+index 1cde87c..df63f78 100644
 --- a/tests/match.awk
 +++ b/tests/match.awk
 @@ -1,4 +1,4 @@
 -#!/bin/gawk
 +#!/usr/bin/gawk
  #
- # Copyright (c) 2014-2018 Dmitry V. Levin <ldv@altlinux.org>
+ # Copyright (c) 2014-2021 Dmitry V. Levin <ldv@strace.io>
  # All rights reserved.
 diff --git a/tests/rt_sigaction.awk b/tests/rt_sigaction.awk
-index 81dd813..9cd9549 100644
+index dce78f5..573d9ea 100644
 --- a/tests/rt_sigaction.awk
 +++ b/tests/rt_sigaction.awk
 @@ -1,4 +1,4 @@
 -#!/bin/gawk
 +#!/usr/bin/gawk
  #
- # Copyright (c) 2014-2015 Dmitry V. Levin <ldv@altlinux.org>
+ # Copyright (c) 2014-2015 Dmitry V. Levin <ldv@strace.io>
  # Copyright (c) 2016 Elvira Khabirova <lineprinter0@gmail.com>
diff --git a/meta/recipes-devtools/strace/strace_5.10.bb b/meta/recipes-devtools/strace/strace_5.11.bb
similarity index 79%
rename from meta/recipes-devtools/strace/strace_5.10.bb
rename to meta/recipes-devtools/strace/strace_5.11.bb
index 17bde082a3..f6a91df1d2 100644
--- a/meta/recipes-devtools/strace/strace_5.10.bb
+++ b/meta/recipes-devtools/strace/strace_5.11.bb
@@ -3,10 +3,9 @@ HOMEPAGE = "http://strace.io"
 DESCRIPTION = "strace is a diagnostic, debugging and instructional userspace utility for Linux. It is used to monitor and tamper with interactions between processes and the Linux kernel, which include system calls, signal deliveries, and changes of process state."
 SECTION = "console/utils"
 LICENSE = "LGPL-2.1+ & GPL-2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=c756d9d5dabc27663df64f0bf492166c"
+LIC_FILES_CHKSUM = "file://COPYING;md5=318cfc887fc8723f4e9d4709b55e065b"
 
 SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
-           file://disable-git-version-gen.patch \
            file://update-gawk-paths.patch \
            file://Makefile-ptest.patch \
            file://run-ptest \
@@ -16,7 +15,7 @@ SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
            file://uintptr_t.patch \
            file://0001-strace-fix-reproducibilty-issues.patch \
            "
-SRC_URI[sha256sum] = "fe3982ea4cd9aeb3b4ba35f6279f0b577a37175d3282be24b9a5537b56b8f01c"
+SRC_URI[sha256sum] = "ffe340b10c145a0f85734271e9cce56457d23f21a7ea5931ab32f8cf4e793879"
 
 inherit autotools ptest
 
@@ -34,19 +33,16 @@ CFLAGS_append_libc-musl = " -Dsigcontext_struct=sigcontext"
 TESTDIR = "tests"
 PTEST_BUILD_HOST_PATTERN = "^(DEB_CHANGELOGTIME|RPM_CHANGELOGTIME|WARN_CFLAGS_FOR_BUILD|LDFLAGS_FOR_BUILD)"
 
-do_install_append() {
-	# We don't ship strace-graph here because it needs perl
-	rm ${D}${bindir}/strace-graph
-}
-
 do_compile_ptest() {
-	oe_runmake -C ${TESTDIR} buildtest-TESTS
+	oe_runmake ${PARALLEL_MAKE} -C ${TESTDIR} buildtest-TESTS
 }
 
 do_install_ptest() {
 	oe_runmake -C ${TESTDIR} install-ptest BUILDDIR=${B} DESTDIR=${D}${PTEST_PATH} TESTDIR=${TESTDIR}
-	install -m 755 ${S}/test-driver ${D}${PTEST_PATH}
-	install -m 644 ${B}/config.h ${D}${PTEST_PATH}
+	mkdir -p ${D}${PTEST_PATH}/build-aux
+	mkdir -p ${D}${PTEST_PATH}/src
+	install -m 755 ${S}/build-aux/test-driver ${D}${PTEST_PATH}/build-aux/
+	install -m 644 ${B}/src/config.h ${D}${PTEST_PATH}/src/
         sed -i -e '/^src/s/strace.*[0-9]/ptest/' ${D}/${PTEST_PATH}/${TESTDIR}/Makefile
 }
 
-- 
2.29.2

