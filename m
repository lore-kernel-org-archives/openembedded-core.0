Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F292BD5AE4C
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 09:59:48 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2852.1765619988350424559
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Dec 2025 01:59:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MBKMF5dH;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2a0ac29fca1so309405ad.2
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 01:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765619987; x=1766224787; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e0UpbOKK2T3S559traAViwm8OhrR3pIm6tUNk4dUUOo=;
        b=MBKMF5dHsvo1RQhNEwBsmpOTDJ8yCkPh+2KCHtfrHJxXPWq85EBZex2ysjXUn0zHPo
         yajh7N2gOROKdyfvQh4LWAXOCMJ4dS/gJh+tLasfsthvwrx5GlR3QDTStwkMPm5DwEXz
         /myhTHvN1RBNWKEcq0A7I43oyvqTyoKngg4foME/XtR+du3zV0+io6RnYxDMUuclTY8O
         8Phf0tslolRy3P9kmcgEBZJJ+oZpOCBZk3vh8EoHDRIzUlJL7evVzuN6RChqE3Y21Cap
         Zk37zCMjm+HZKx6dWtpSnQACjpa9e8CNHqYMEZBqhNM+zzd+ZEGt+z0F5NouXmXoQkIA
         ezwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765619987; x=1766224787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e0UpbOKK2T3S559traAViwm8OhrR3pIm6tUNk4dUUOo=;
        b=DLD13ON82EpgnaSwAL7evMvpWoyDSZ8dFf/rkqXGNMWT06axcZYFjjve5zn3Jgvg/S
         xnCHVa9EKzdTIzOmmi3bJedCYqO3bXW7yTe3/l8BLFUT2MTDJk1LgIS8qtDDpNEJXH/E
         s5y89jOHYQilW0DOEBLPvnzdrDZxWY9aObTlFiuOGYI8Yr55FhdRyw6fxGN0lfRhLMpA
         vrPsBadqrIa37c83IJII5GmqNYlHMoiuSglE7siHMz7yzRjdtjiAFMQwR0yiIrndZAvE
         FawOo1hoWuggpbsZs5Udm/2fUOKgmvusJdZQ5jRCDDrM/TyXbNQVfbdtgkfHIMDIfqY3
         7DDg==
X-Gm-Message-State: AOJu0YzGgqcbwGqVXQFUCxJFpfpGwKh989dYA5KI0PBgpfAAt6IECEqL
	F0sS9ivxQbALt4zyhJOzQ6XBAyJPvr48NUTN3W3ZLJcAunoSsLBDS49tjOChtg==
X-Gm-Gg: AY/fxX6sHVOWgglnYS2vT/gAkfgLro4MK8Gwe93LK9qmBsdhddWa4msbUHTa7rJt4M/
	xA3rbC5Bo1T5TSpc/xFynJkmWqsfCCk2c4AsWoqL2hMz6n9K0bE0I9MpD6sVqWcgJmTO7U8y0rB
	XY+J1YCV7QzkyIGHyzluQaaPfW+sGUw9ARIJJ3Du03KgZDwBnjaT4l0igUy1KXYX2652SlhhAqI
	abwp/TljSqVjps+sioWqHMy8Rtt+UTwyc+7urEQIfruRn8QfWq8Na3b/gxlp/fXBlefliazpQgr
	ErUw90K3pRMmYUQfJiQTmJbCmjLLW2X/MzBeD2RIqIxopxti43lqQFoCaheFwE9nG2OdNumP85j
	/Zg1WKz1a5ihtO1SKoXR3MpF0rZXiiRagrjTaAcVNYXpxEH17kuCmZVPNLIoioqA904xn5fUHZk
	epl4Eu4Rmu9GHKAZoDXXvo3L9B
X-Google-Smtp-Source: AGHT+IEIPbsce0+OUGMxn6YG6NxECErDoqD6CUwdmXrDIGcZu0rbXUXcNSwP2GEEp/QDqLwvIqT+JQ==
X-Received: by 2002:a17:902:e804:b0:29d:975a:2123 with SMTP id d9443c01a7336-29f23d26f90mr38309915ad.60.1765619987542;
        Sat, 13 Dec 2025 01:59:47 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.230.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a082b13b6bsm26173725ad.99.2025.12.13.01.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 01:59:47 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Robert Yang <liezhi.yang@windriver.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH 04/67] strace: 6.16 -> 6.17
Date: Sat, 13 Dec 2025 15:28:28 +0530
Message-ID: <20251213095931.2571498-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
References: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 09:59:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227622

From: Robert Yang <liezhi.yang@windriver.com>

* Remove backported patch 0001-tests-fix-uio.test-with-musl-libc.patch
* Refresh other patches.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit c568c2e56697bbf95818f46bb8fb832b73d3573f)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...toconf-macro-to-detect-largefile-sup.patch |  2 +-
 ...001-strace-fix-reproducibilty-issues.patch |  2 +-
 ...01-tests-fix-uio.test-with-musl-libc.patch | 30 -------------------
 ...002-tests-Replace-off64_t-with-off_t.patch |  2 +-
 .../strace/strace/Makefile-ptest.patch        |  6 ++--
 .../strace/strace/ptest-spacesave.patch       |  2 +-
 .../strace/strace/skip-load.patch             | 13 ++++----
 .../strace/strace/update-gawk-paths.patch     |  2 +-
 .../strace/{strace_6.16.bb => strace_6.17.bb} |  3 +-
 9 files changed, 14 insertions(+), 48 deletions(-)
 delete mode 100644 meta/recipes-devtools/strace/strace/0001-tests-fix-uio.test-with-musl-libc.patch
 rename meta/recipes-devtools/strace/{strace_6.16.bb => strace_6.17.bb} (94%)

diff --git a/meta/recipes-devtools/strace/strace/0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch b/meta/recipes-devtools/strace/strace/0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch
index 46894cd9d0..1750f34518 100644
--- a/meta/recipes-devtools/strace/strace/0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch
+++ b/meta/recipes-devtools/strace/strace/0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch
@@ -1,4 +1,4 @@
-From 267989559370a9f34646bf8a02001755bf64fb25 Mon Sep 17 00:00:00 2001
+From 4c7112f36a70d3034c583ab45058491129111585 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 15 Dec 2022 15:54:27 -0800
 Subject: [PATCH] configure: Use autoconf macro to detect largefile support
diff --git a/meta/recipes-devtools/strace/strace/0001-strace-fix-reproducibilty-issues.patch b/meta/recipes-devtools/strace/strace/0001-strace-fix-reproducibilty-issues.patch
index ee379688bf..c633531f44 100644
--- a/meta/recipes-devtools/strace/strace/0001-strace-fix-reproducibilty-issues.patch
+++ b/meta/recipes-devtools/strace/strace/0001-strace-fix-reproducibilty-issues.patch
@@ -1,4 +1,4 @@
-From 59077f39cce499d11de5b0a9c23c9ded67ddb22e Mon Sep 17 00:00:00 2001
+From d0bbbf170f70746b2b8e9bb6129b0b9441a1c4b5 Mon Sep 17 00:00:00 2001
 From: Jeremy Puhlman <jpuhlman@mvista.com>
 Date: Wed, 11 Mar 2020 19:56:55 +0000
 Subject: [PATCH] strace: fix reproducibilty issues
diff --git a/meta/recipes-devtools/strace/strace/0001-tests-fix-uio.test-with-musl-libc.patch b/meta/recipes-devtools/strace/strace/0001-tests-fix-uio.test-with-musl-libc.patch
deleted file mode 100644
index a879ca50ca..0000000000
--- a/meta/recipes-devtools/strace/strace/0001-tests-fix-uio.test-with-musl-libc.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 7fadf6947761cc5248aa4a376bb9517481dbaa52 Mon Sep 17 00:00:00 2001
-From: Gyorgy Sarvari <skandigraun@gmail.com>
-Date: Tue, 12 Aug 2025 20:02:31 +0200
-Subject: [PATCH] tests: fix uio.test with musl-libc
-
-musl-libc handles the pwrite calls differently than glibc, making
-the uio test fail.  Using glibc, there are separated pwrite and pwritev
-calls, however musl uses only pwritev2 for both pwrite and pwritev.
-
-To account to this difference, modify the expected matching regexp
-to also match the musl output (append it with an OR).
-
-Upstream-Status: Backport [https://github.com/strace/strace/pull/347]
-Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- tests/uio.expected | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/tests/uio.expected b/tests/uio.expected
-index 98d5c06..2a712a1 100644
---- a/tests/uio.expected
-+++ b/tests/uio.expected
-@@ -1,4 +1,4 @@
- pread(64)?\(0, "\\0\\0\\0\\0", 4, 1004211379570065135\) += 4
- preadv\(0, \[\{iov_base="\\0\\0\\0\\0", iov_len=4\}\], 1, 1004211379570065135\) += 4
--pwrite(64)?\(0, "\\0\\0\\0\\0", 4, 1004211379570065135\) += 4
--pwritev\(0, \[\{iov_base="\\0\\0\\0\\0", iov_len=4\}\], 1, 1004211379570065135\) += 4
-+pwrite(64)?\(0, "\\0\\0\\0\\0", 4, 1004211379570065135\) += 4|pwritev2\(0, \[\{iov_base="\\0\\0\\0\\0", iov_len=4}], 1, 1004211379570065135, RWF_NOAPPEND\) += 4
-+pwritev\(0, \[\{iov_base="\\0\\0\\0\\0", iov_len=4\}\], 1, 1004211379570065135\) += 4|pwritev2\(0, \[\{iov_base="\\0\\0\\0\\0", iov_len=4}], 1, 1004211379570065135, RWF_NOAPPEND\) += 4
diff --git a/meta/recipes-devtools/strace/strace/0002-tests-Replace-off64_t-with-off_t.patch b/meta/recipes-devtools/strace/strace/0002-tests-Replace-off64_t-with-off_t.patch
index ca909d573d..093cedc233 100644
--- a/meta/recipes-devtools/strace/strace/0002-tests-Replace-off64_t-with-off_t.patch
+++ b/meta/recipes-devtools/strace/strace/0002-tests-Replace-off64_t-with-off_t.patch
@@ -1,4 +1,4 @@
-From 69083e93e92437e8d9d4225fca71a053906a4af0 Mon Sep 17 00:00:00 2001
+From f487e2a0f1568c989a0294f4335f3dc9a6012d8d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 15 Dec 2022 15:56:13 -0800
 Subject: [PATCH] tests: Replace off64_t with off_t
diff --git a/meta/recipes-devtools/strace/strace/Makefile-ptest.patch b/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
index 212eea8618..60562ae7d9 100644
--- a/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
+++ b/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
@@ -1,4 +1,4 @@
-From 9d40d293ff73dea734f1353c354f51e51992a813 Mon Sep 17 00:00:00 2001
+From 6d77203fb22e076918dc983db47b48b28cbbc06d Mon Sep 17 00:00:00 2001
 From: Gabriel Barbu <gabriel.barbu@enea.com>
 Date: Thu, 25 Jul 2013 15:28:33 +0200
 Subject: [PATCH] strace: Add ptest
@@ -13,7 +13,7 @@ Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
  1 file changed, 20 insertions(+)
 
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 6e942b1..7a707d7 100644
+index d76b5c6..d4fc206 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
 @@ -18,6 +18,7 @@ SIZEOF_LONG = @SIZEOF_LONG@
@@ -24,7 +24,7 @@ index 6e942b1..7a707d7 100644
  AM_CFLAGS = $(WARN_CFLAGS) $(TEST_WARN_CFLAGS)
  bundled_CPPFLAGS =
  if USE_BUNDLED_HEADERS
-@@ -937,3 +938,22 @@ BUILT_SOURCES = ksysent.h
+@@ -939,3 +940,22 @@ BUILT_SOURCES = ksysent.h
  CLEANFILES = ksysent.h
  
  include ../src/scno.am
diff --git a/meta/recipes-devtools/strace/strace/ptest-spacesave.patch b/meta/recipes-devtools/strace/strace/ptest-spacesave.patch
index 661ed2c7bb..3e66b15850 100644
--- a/meta/recipes-devtools/strace/strace/ptest-spacesave.patch
+++ b/meta/recipes-devtools/strace/strace/ptest-spacesave.patch
@@ -1,4 +1,4 @@
-From 8bd827339ae72eab99dc9ad6a68b0ae98e5bbb49 Mon Sep 17 00:00:00 2001
+From 76c23e018608421624d1e00b9e387b265e6da469 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 29 May 2019 00:10:32 +0100
 Subject: [PATCH] strace: Tweak ptest disk space management
diff --git a/meta/recipes-devtools/strace/strace/skip-load.patch b/meta/recipes-devtools/strace/strace/skip-load.patch
index 34948fd2ba..20535fe005 100644
--- a/meta/recipes-devtools/strace/strace/skip-load.patch
+++ b/meta/recipes-devtools/strace/strace/skip-load.patch
@@ -1,4 +1,4 @@
-From 46eceefb3bd184354cdaf0fd3dff6f2ad979aad9 Mon Sep 17 00:00:00 2001
+From 40244c27de6b8fa0f6f6685d20e64309884e73bf Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Sat, 30 Aug 2025 00:47:03 +0200
 Subject: [PATCH] strace: skip a number of load-sensitive tests
@@ -17,7 +17,7 @@ Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
  4 files changed, 4 insertions(+)
 
 diff --git a/tests/clock_nanosleep.gen.test b/tests/clock_nanosleep.gen.test
-index 7a6025bbd..f0e6dbb73 100755
+index 7a6025b..f0e6dbb 100755
 --- a/tests/clock_nanosleep.gen.test
 +++ b/tests/clock_nanosleep.gen.test
 @@ -1,4 +1,5 @@
@@ -27,7 +27,7 @@ index 7a6025bbd..f0e6dbb73 100755
 +skip_ "Test not reliable under load"
  run_strace_match_diff -e trace=clock_nanosleep,clock_gettime
 diff --git a/tests/delay.test b/tests/delay.test
-index f74e27f1e..1510c7647 100755
+index f74e27f..1510c76 100755
 --- a/tests/delay.test
 +++ b/tests/delay.test
 @@ -9,6 +9,7 @@
@@ -39,7 +39,7 @@ index f74e27f1e..1510c7647 100755
  	[ -n "$denter" ] || continue
  
 diff --git a/tests/nanosleep.gen.test b/tests/nanosleep.gen.test
-index 41928ded8..f8a87cb8e 100755
+index 41928de..f8a87cb 100755
 --- a/tests/nanosleep.gen.test
 +++ b/tests/nanosleep.gen.test
 @@ -1,4 +1,5 @@
@@ -49,7 +49,7 @@ index 41928ded8..f8a87cb8e 100755
 +skip_ "Test not reliable under load"
  run_strace_match_diff -a20 
 diff --git a/tests/strace-r.test b/tests/strace-r.test
-index 829973753..e89423485 100755
+index 8299737..e894234 100755
 --- a/tests/strace-r.test
 +++ b/tests/strace-r.test
 @@ -9,6 +9,7 @@
@@ -60,6 +60,3 @@ index 829973753..e89423485 100755
  r_opt="${1:--r}"
  
  run_prog ../sleep 0
--- 
-2.43.0
-
diff --git a/meta/recipes-devtools/strace/strace/update-gawk-paths.patch b/meta/recipes-devtools/strace/strace/update-gawk-paths.patch
index 193a4819ef..bf4a8cd123 100644
--- a/meta/recipes-devtools/strace/strace/update-gawk-paths.patch
+++ b/meta/recipes-devtools/strace/strace/update-gawk-paths.patch
@@ -1,4 +1,4 @@
-From c11380609788ff9c802d6527adc6b2c756d5f715 Mon Sep 17 00:00:00 2001
+From 71bcc83993dd1f8f30c3defaece23211c9b73f33 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Mon, 18 Jan 2016 11:01:00 -0800
 Subject: [PATCH] update gawk paths, /bin/gawk -> /usr/bin/gawk
diff --git a/meta/recipes-devtools/strace/strace_6.16.bb b/meta/recipes-devtools/strace/strace_6.17.bb
similarity index 94%
rename from meta/recipes-devtools/strace/strace_6.16.bb
rename to meta/recipes-devtools/strace/strace_6.17.bb
index 0552caa2b6..b6fda2b8ce 100644
--- a/meta/recipes-devtools/strace/strace_6.16.bb
+++ b/meta/recipes-devtools/strace/strace_6.17.bb
@@ -14,12 +14,11 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/strace-${PV}.tar.xz \
            file://skip-load.patch \
            file://0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch \
            file://0002-tests-Replace-off64_t-with-off_t.patch \
-           file://0001-tests-fix-uio.test-with-musl-libc.patch \
            "
 SRC_URI:append:libc-musl = "\
            file://0001-Ignore-pwritev-pwrite64-tests-on-musl.patch \
            "
-SRC_URI[sha256sum] = "3d7aee7e4f044b2f67f3d51a8a76eda18076e9fb2774de54ac351d777d4ebffa"
+SRC_URI[sha256sum] = "0a7c7bedc7efc076f3242a0310af2ae63c292a36dd4236f079e88a93e98cb9c0"
 
 inherit autotools github-releases ptest
 

