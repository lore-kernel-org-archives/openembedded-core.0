Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A781C44501
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 17:17:44 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.155327.1783358260359448033
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 10:17:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=pehYRP79;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493ae59eca6so23975845e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 10:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783358259; x=1783963059; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ksptBoE2cAMP+WTrcxEEvcMl5XjkN87DttRSp86QHW8=;
        b=pehYRP79OqqKe3rYYy6tRzqYQsQAmHoL/KWyRvjfBjLDKXA/s4z2fi6JM3UDkksri3
         wUTOzKG+7k5mQsQa+F5uStMeeNH++ib2OuYiZqSFZUgJj71FmLrlYn2Jhnfb9IV01hyv
         HfnRJANdvnrdaz3kCMmqJF/CyQShAMDoyBkZEFvQJe3n38ACRCAXUQ/X4Us8+uzbLnw5
         knfpv+g9WVvvFZD3pNVknG+G98/ypB1JXqQHcRcqMkl0zdfCpo+uTArgOUQYbalx3xtw
         XR8PvYhp2fP6VmZopNsdqJHMS61pDHtqaVByV0itPSTWPLCbrUohorwCsIdegS0yT/xy
         BEQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783358259; x=1783963059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ksptBoE2cAMP+WTrcxEEvcMl5XjkN87DttRSp86QHW8=;
        b=U52uuOvKL79nFizdoBGyflpqaXMwatlBStM1w0VLrMMRmAUDc9eR+SXef/lhfPDg73
         9G+qzjqMXSZhCjkTfDuPrq9A/BJ6asZxQFpPqc79/1fLuXcdCvozQ22+CtFi9E7nt1SD
         saPDbWETUAaVcBAMjsmKOotY2NLnBz0hhMPM5zaaaq+Y7RnJSnuE6k+K4O8Uu8phxGiY
         bDSzW/X+4NT6JKTyZqyLHu5lefdCwiMnYa18vGqSCsGugqFbqxLkgCDjtsSQzTAa83zx
         HrBSiBuXVzsUgFyi5wvTZrXljhmFE8hd1RqXPGODm+IlOGf6pcdFQxJmvpwnnAAD0w4r
         doQA==
X-Gm-Message-State: AOJu0YzXRuVt7kfb+H/sgBGhiEFo5XTJIQZwtU3SwzcqT4CkRkYRt0Nq
	OPD6SDT7rR/bx864G14JNeni3fT3SgT+R8crDLZS5RyZh6Br3BMomJejWQ6LMA==
X-Gm-Gg: AfdE7cl+NlGFI3l70ZtrySB8ysQ5VyJNKcUYxM1SAP7Su1e1poHtFuw5BlaitIivTM5
	6QXmvkyF6DcgdDCPCP6mnjyEEiiYi2vk2t3+KVITkkk+cYbr2GnTfsxJSH6ha5cDnf9WXY3ntqa
	VviWURxCJmF4cClpys/ze8apRLnb41AJWCq4XUXgQ50NdF/4zE2xHUNZxnk6hcWGHlvwy3Szw66
	BXXkcFxtOVSyO8MJt+ZTlerN1pIUYPYnHWpH9gKvSqbfygO9nXqb/z1nRaQ9rZsbWXPDHugP35m
	ctbXZ11Wf6vqPws65ong6+jTAX5hBMp+VQrda8zPj6DdlAhZZoPQ9q+CyWjfNQ+4LkkQ2pfXUv6
	zuNxDdzAzUsgGQlGcP+q60B0LgAeZD1BpRXNzQ0IySw279eg3QJREFqHhEw20QvS8xzZmfQ7K6m
	EYrZD3XrGzAOp3e6mIyFrkiYtH754xSMJ3ZBw9HsvEx632OsQH
X-Received: by 2002:a05:600c:ac3:b0:493:d21f:8f98 with SMTP id 5b1f17b1804b1-493df0799e2mr14719925e9.36.1783358258518;
        Mon, 06 Jul 2026 10:17:38 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63ba971sm640541005e9.13.2026.07.06.10.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:17:38 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 38/45] strace: upgrade 7.0 -> 7.1
Date: Mon,  6 Jul 2026 19:16:52 +0200
Message-ID: <20260706171701.70536-38-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260706171701.70536-1-alex.kanavin@gmail.com>
References: <20260706171701.70536-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 17:17:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240324

From: Alexander Kanavin <alex@linutronix.de>

Tweak ptest Makefile to avoid make error due to an irrelevant missing file on target.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...nfigure-Use-autoconf-macro-to-detect-largefile-sup.patch | 2 +-
 .../0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch   | 2 +-
 .../strace/0001-strace-fix-reproducibilty-issues.patch      | 2 +-
 .../strace/0002-tests-Replace-off64_t-with-off_t.patch      | 2 +-
 meta/recipes-devtools/strace/strace/Makefile-ptest.patch    | 6 +++---
 meta/recipes-devtools/strace/strace/ptest-spacesave.patch   | 2 +-
 meta/recipes-devtools/strace/strace/skip-load.patch         | 6 +++---
 meta/recipes-devtools/strace/strace/update-gawk-paths.patch | 2 +-
 .../strace/{strace_7.0.bb => strace_7.1.bb}                 | 3 ++-
 9 files changed, 14 insertions(+), 13 deletions(-)
 rename meta/recipes-devtools/strace/{strace_7.0.bb => strace_7.1.bb} (95%)

diff --git a/meta/recipes-devtools/strace/strace/0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch b/meta/recipes-devtools/strace/strace/0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch
index bda5156cdf..5a7d05ae41 100644
--- a/meta/recipes-devtools/strace/strace/0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch
+++ b/meta/recipes-devtools/strace/strace/0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch
@@ -1,4 +1,4 @@
-From 36df82284b1e8c3d7338c315016a8e74c0978e32 Mon Sep 17 00:00:00 2001
+From 65fb22e302a4dbec675377e61593b52c2e291705 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 15 Dec 2022 15:54:27 -0800
 Subject: [PATCH] configure: Use autoconf macro to detect largefile support
diff --git a/meta/recipes-devtools/strace/strace/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch b/meta/recipes-devtools/strace/strace/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch
index 920c2e4faf..d3e35077de 100644
--- a/meta/recipes-devtools/strace/strace/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch
+++ b/meta/recipes-devtools/strace/strace/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch
@@ -1,4 +1,4 @@
-From dd821aebdefb3531202bcd51fce5e2bd74c1512d Mon Sep 17 00:00:00 2001
+From 77790a889ca5227936e2de2c587ef1fd9c8e718c Mon Sep 17 00:00:00 2001
 From: Khem Raj <khem.raj@oss.qualcomm.com>
 Date: Fri, 10 Apr 2026 23:39:47 +0000
 Subject: [PATCH] m4: Backport ax_prog_cc_for_build.m4 macros
diff --git a/meta/recipes-devtools/strace/strace/0001-strace-fix-reproducibilty-issues.patch b/meta/recipes-devtools/strace/strace/0001-strace-fix-reproducibilty-issues.patch
index 77f90bf0d1..78509da2b1 100644
--- a/meta/recipes-devtools/strace/strace/0001-strace-fix-reproducibilty-issues.patch
+++ b/meta/recipes-devtools/strace/strace/0001-strace-fix-reproducibilty-issues.patch
@@ -1,4 +1,4 @@
-From bb0cd804214054ef95193daa0b7076ed5be1c881 Mon Sep 17 00:00:00 2001
+From 455905ce2a3f886264e6344051654d7c2d9faf88 Mon Sep 17 00:00:00 2001
 From: Jeremy Puhlman <jpuhlman@mvista.com>
 Date: Wed, 11 Mar 2020 19:56:55 +0000
 Subject: [PATCH] strace: fix reproducibilty issues
diff --git a/meta/recipes-devtools/strace/strace/0002-tests-Replace-off64_t-with-off_t.patch b/meta/recipes-devtools/strace/strace/0002-tests-Replace-off64_t-with-off_t.patch
index 7daf3f6763..ec1905321a 100644
--- a/meta/recipes-devtools/strace/strace/0002-tests-Replace-off64_t-with-off_t.patch
+++ b/meta/recipes-devtools/strace/strace/0002-tests-Replace-off64_t-with-off_t.patch
@@ -1,4 +1,4 @@
-From 2d6384cd2b6b923ea3eb6863beb0bfaf6bf628c2 Mon Sep 17 00:00:00 2001
+From 447203bdced57a521534c4fb7d1962318a81c1bd Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 15 Dec 2022 15:56:13 -0800
 Subject: [PATCH] tests: Replace off64_t with off_t
diff --git a/meta/recipes-devtools/strace/strace/Makefile-ptest.patch b/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
index 3d23e34244..d864b68fc1 100644
--- a/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
+++ b/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
@@ -1,4 +1,4 @@
-From 21747b62c36689b68fac7e987a9b93b998f692e3 Mon Sep 17 00:00:00 2001
+From 6f9eb5907fa2a7d6127737e41fb4e9fb5fb091d3 Mon Sep 17 00:00:00 2001
 From: Gabriel Barbu <gabriel.barbu@enea.com>
 Date: Thu, 25 Jul 2013 15:28:33 +0200
 Subject: [PATCH] strace: Add ptest
@@ -13,7 +13,7 @@ Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
  1 file changed, 20 insertions(+)
 
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 7d80e07..1e0e064 100644
+index f37d053..975f878 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
 @@ -18,6 +18,7 @@ SIZEOF_LONG = @SIZEOF_LONG@
@@ -24,7 +24,7 @@ index 7d80e07..1e0e064 100644
  AM_CFLAGS = $(WARN_CFLAGS) $(TEST_WARN_CFLAGS)
  bundled_CPPFLAGS =
  if USE_BUNDLED_HEADERS
-@@ -950,3 +951,22 @@ BUILT_SOURCES = ksysent.h
+@@ -967,3 +968,22 @@ check-valgrind-local: $(check_LIBRARIES) $(check_PROGRAMS)
  CLEANFILES = ksysent.h
  
  include ../src/scno.am
diff --git a/meta/recipes-devtools/strace/strace/ptest-spacesave.patch b/meta/recipes-devtools/strace/strace/ptest-spacesave.patch
index 14ad35be74..33f9c86894 100644
--- a/meta/recipes-devtools/strace/strace/ptest-spacesave.patch
+++ b/meta/recipes-devtools/strace/strace/ptest-spacesave.patch
@@ -1,4 +1,4 @@
-From 0b3d278fa808a21d4300a71d062807f905671bf9 Mon Sep 17 00:00:00 2001
+From 868dff21f47036dec4db603129d46d4f8ea4a29d Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 29 May 2019 00:10:32 +0100
 Subject: [PATCH] strace: Tweak ptest disk space management
diff --git a/meta/recipes-devtools/strace/strace/skip-load.patch b/meta/recipes-devtools/strace/strace/skip-load.patch
index dc88706948..1bdcb77ddb 100644
--- a/meta/recipes-devtools/strace/strace/skip-load.patch
+++ b/meta/recipes-devtools/strace/strace/skip-load.patch
@@ -1,4 +1,4 @@
-From 7fc69711b5e216c385b22a5b64c6c7c8be693600 Mon Sep 17 00:00:00 2001
+From 537e44aa0204590171936eec0fcd279b74fbbfee Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Sat, 30 Aug 2025 00:47:03 +0200
 Subject: [PATCH] strace: skip a number of load-sensitive tests
@@ -49,7 +49,7 @@ index 41928de..f8a87cb 100755
 +skip_ "Test not reliable under load"
  run_strace_match_diff -a20 
 diff --git a/tests/strace-r.test b/tests/strace-r.test
-index 8299737..e894234 100755
+index a85558d..9ae9677 100755
 --- a/tests/strace-r.test
 +++ b/tests/strace-r.test
 @@ -9,6 +9,7 @@
@@ -59,4 +59,4 @@ index 8299737..e894234 100755
 +skip_ "Test not reliable under load"
  r_opt="${1:--r}"
  
- run_prog ../sleep 0
+ run_prog ../sleep-timing 0 "$TIMING_FILE"
diff --git a/meta/recipes-devtools/strace/strace/update-gawk-paths.patch b/meta/recipes-devtools/strace/strace/update-gawk-paths.patch
index c47ca08dd4..a83eb49ba3 100644
--- a/meta/recipes-devtools/strace/strace/update-gawk-paths.patch
+++ b/meta/recipes-devtools/strace/strace/update-gawk-paths.patch
@@ -1,4 +1,4 @@
-From 6bc97ed4e26ca4d275c10f5b4f56fc43a8e12925 Mon Sep 17 00:00:00 2001
+From 7066b2e49ddbde0379ca52cebeefeca4f80fb75b Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Mon, 18 Jan 2016 11:01:00 -0800
 Subject: [PATCH] update gawk paths, /bin/gawk -> /usr/bin/gawk
diff --git a/meta/recipes-devtools/strace/strace_7.0.bb b/meta/recipes-devtools/strace/strace_7.1.bb
similarity index 95%
rename from meta/recipes-devtools/strace/strace_7.0.bb
rename to meta/recipes-devtools/strace/strace_7.1.bb
index fa86f7bb4e..c4ca3a7f27 100644
--- a/meta/recipes-devtools/strace/strace_7.0.bb
+++ b/meta/recipes-devtools/strace/strace_7.1.bb
@@ -19,7 +19,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/strace-${PV}.tar.xz \
 SRC_URI:append:libc-musl = "\
            file://0001-Ignore-pwritev-pwrite64-tests-on-musl.patch \
            "
-SRC_URI[sha256sum] = "6c92419be3f2ec560b31728a4652217c59864c8642ba7b1b3771b1b013ad074b"
+SRC_URI[sha256sum] = "81743ecf2a5b44186b2f5038afdc8beda7e5c70aed15b4fbfbcc6e9ece24490f"
 
 inherit autotools github-releases ptest
 
@@ -51,6 +51,7 @@ do_install_ptest() {
 	sed -e 's/^srcdir = .*/srcdir = ..\/..\/ptest\/tests/' \
 	    -e "/^TEST_LOG_DRIVER =/s|(top_srcdir)|(top_builddir)|" \
 	    -e '/^CC_FOR_BUILD/s/\s-std=gnu23//g' \
+            -e '/^_hide_from_automake/d' \
 	    -i ${D}/${PTEST_PATH}/${TESTDIR}/Makefile
 }
 
-- 
2.47.3


