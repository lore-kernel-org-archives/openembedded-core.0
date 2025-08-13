Return-Path: <osama.abdelkader@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02480C87FCF
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 22:12:44 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.8708.1755123157008658150
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Aug 2025 15:12:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OKm0fJ8G;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: osama.abdelkader@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6188b733bbaso552410a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 15:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755123155; x=1755727955; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fEJsrcq1pY658QbVqgiptQISBoYX7tFWRWSsL4PzmN4=;
        b=OKm0fJ8GQTpkVU6kQK27CQLVWlXZvid0MtuCJVpWLlIKEf1+6qHFhZOp+Bc4xhi8oJ
         AcxTvcihTZSq2fUQv/kY3lDq1J0oMMNxR+AemUeRE7sysmE6/YqgopbkcKIIEB2HagXa
         6Mp0o5K0jTF2tZ6E0x9aT8J+ucoSHm3SM242aIdVal0NeQnYnikg33wpXIux9zCF7X2V
         GteKcbSZlmE/65+khcVD80by17bie1Gva6LM4PWrg3CFvtvuFVeQU0HBbXJ0T06VinPu
         ECIuh/wYUH+HWpwBql0rqyCzXXf560jaM6QoCmPszxOHQNRNjLCIecoF6WiV9EZtB+jy
         g0/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755123155; x=1755727955;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fEJsrcq1pY658QbVqgiptQISBoYX7tFWRWSsL4PzmN4=;
        b=ChmtAw2d2GI4URTOcQM3qseYWhA09dncTCZzECXL7wha0RsGMjPHb++f2yLffRmUas
         CTxBX28XKnflof/oIdDBOCZBQc/+UUqNQ7IVj72Fq2yzH9CZFkHwnJ2UUHmmhEPFhjzu
         shljKnlMwPFWDamUoK0e0KmCE51zJCjyPkjb//OhvMqhtvW0eHUe0x1rftD4qc6mnTWR
         Q+tS5u4qFA8tb1IKniLVWWDS5uVWuWooAY9JbUKNqy0G3C6RDAJyrOy/W15+T8D/gj0O
         Vq10TkYAGTRFTthYKqu0CpCJEL2NzLotLfDOWhxGZGIFd8lzufTtIhWB4Vq9yNPkxRyg
         wtew==
X-Gm-Message-State: AOJu0Yw8poph5NCqu+aAl42cGIo7YycPtjdbExm/K2r3IznXlhzHX3gA
	7kN3z2/Nh7G0A8g1/NlE9B9zVOGL9aiD33sp/50sJIwUy6IbXxz2dmsGthecPRt/foY=
X-Gm-Gg: ASbGnctkPYKM8WkwfzndAPCghf6W7IEGpVh8NMDThlW/MmRSJ04+gAXHJNvNhlxnQfB
	Bwfol4rliV6h7gVYBqurvMBShqKdh/PoVtax7efGb1JM1zM+0kJ+70i3UmMkExgXBuqEA+9pMcI
	fH4Z14xuzwI1OLHRTMp/I/TEyfi0qnkiADSoMzgZ7EYstBxGuU6Ep9J3Oyut3tOd12XGZZDr9Va
	Mab3gqGQA2XVCuXtzAOQ16xPBE7x6oVvfBZbdCUTsXUobSm+AJIS9xHyyNVredTniUyyQ8a53MC
	eDTfwjfsLT6kAIp9zXDGSKwZ6X8DhiRly7jg4zv1MW0A9JbkqxPbZ97qV37vKhW6440QN0cyIBZ
	jetQbaRSR8n7TOqIKsbnF1KUjaszNtboIFb68yH/nC1Ryick3Zjc0j9ECDsG3Mj9CECtlp+IepX
	0ua51bDRbqoEyZ+cAnBevw3HRfe643g56OZoGj2w==
X-Google-Smtp-Source: AGHT+IHu0h+QdBiGkjyRFy36DZoApX8d8SmAhKpFAY2TMwM1/E3FeqP+lhd/39UgyCPWxaVtHIZOVw==
X-Received: by 2002:a05:6402:40c3:b0:615:979c:e8b2 with SMTP id 4fb4d7f45d1cf-6188c217f75mr484297a12.29.1755123155027;
        Wed, 13 Aug 2025 15:12:35 -0700 (PDT)
Received: from DESKTOP-RK42V0R.localdomain (ipservice-092-210-202-008.092.210.pools.vodafone-ip.de. [92.210.202.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8f28374sm23005386a12.24.2025.08.13.15.12.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 15:12:34 -0700 (PDT)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: liezhi.yang@windriver.com,
	Osama Abdelkader <osama.abdelkader@gmail.com>
Subject: [PATCH] strace: upgrade 6.15 -> 6.16
Date: Thu, 14 Aug 2025 00:12:27 +0200
Message-ID: <20250813221227.519186-1-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 22:12:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221840

Upgrade to the latest upstream release (2025-08-05), which includes:
- Added new -N/--arg-names option to show syscall argument names
- Implemented PTRACE_SET_SYSCALL_INFO ptrace API support from Linux 6.16
- Decoding updates for SO_RCVPRIORITY, SO_PASSRIGHTS, RTA_NH_ID, RTA_FLOWLABEL
- Enhanced statx syscall decoding and numerous new constant/ioctl updates

Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
 ...figure-Use-autoconf-macro-to-detect-largefile-sup.patch | 6 +++---
 .../strace/0001-strace-fix-reproducibilty-issues.patch     | 6 +++---
 .../strace/0002-tests-Replace-off64_t-with-off_t.patch     | 2 +-
 meta/recipes-devtools/strace/strace/Makefile-ptest.patch   | 7 +++----
 meta/recipes-devtools/strace/strace/ptest-spacesave.patch  | 6 +++---
 meta/recipes-devtools/strace/strace/skip-load.patch        | 2 +-
 .../recipes-devtools/strace/strace/update-gawk-paths.patch | 2 +-
 .../strace/{strace_6.15.bb => strace_6.16.bb}              | 2 +-
 8 files changed, 16 insertions(+), 17 deletions(-)
 rename meta/recipes-devtools/strace/{strace_6.15.bb => strace_6.16.bb} (96%)

diff --git a/meta/recipes-devtools/strace/strace/0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch b/meta/recipes-devtools/strace/strace/0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch
index 86dcd97713..46894cd9d0 100644
--- a/meta/recipes-devtools/strace/strace/0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch
+++ b/meta/recipes-devtools/strace/strace/0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch
@@ -1,4 +1,4 @@
-From ec543417b8e1df7c71dfc4728313849d9ab669a6 Mon Sep 17 00:00:00 2001
+From 267989559370a9f34646bf8a02001755bf64fb25 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 15 Dec 2022 15:54:27 -0800
 Subject: [PATCH] configure: Use autoconf macro to detect largefile support
@@ -13,10 +13,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 36fff90..9e40ab5 100644
+index ad12d20..a760789 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -42,6 +42,8 @@ AC_PROG_INSTALL
+@@ -43,6 +43,8 @@ AC_PROG_INSTALL
  AC_PROG_RANLIB
  AC_PROG_LN_S
  
diff --git a/meta/recipes-devtools/strace/strace/0001-strace-fix-reproducibilty-issues.patch b/meta/recipes-devtools/strace/strace/0001-strace-fix-reproducibilty-issues.patch
index 9cdb7c6134..ee379688bf 100644
--- a/meta/recipes-devtools/strace/strace/0001-strace-fix-reproducibilty-issues.patch
+++ b/meta/recipes-devtools/strace/strace/0001-strace-fix-reproducibilty-issues.patch
@@ -1,4 +1,4 @@
-From d5f681c2de834110de260f4d071c7bc1fb0d7564 Mon Sep 17 00:00:00 2001
+From 59077f39cce499d11de5b0a9c23c9ded67ddb22e Mon Sep 17 00:00:00 2001
 From: Jeremy Puhlman <jpuhlman@mvista.com>
 Date: Wed, 11 Mar 2020 19:56:55 +0000
 Subject: [PATCH] strace: fix reproducibilty issues
@@ -13,7 +13,7 @@ Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/tests/gen_tests.sh b/tests/gen_tests.sh
-index 8f47651..65267db 100755
+index 3c6228a..43b94ea 100755
 --- a/tests/gen_tests.sh
 +++ b/tests/gen_tests.sh
 @@ -46,7 +46,7 @@ while read -r name arg0 args; do {
@@ -25,7 +25,7 @@ index 8f47651..65267db 100755
  
  	case "$arg0" in
  		+*)
-@@ -91,7 +91,7 @@ while read -r name arg0 args; do {
+@@ -102,7 +102,7 @@ while read -r name arg0 args; do {
  
  if [ -n "$names" ]; then
  	{
diff --git a/meta/recipes-devtools/strace/strace/0002-tests-Replace-off64_t-with-off_t.patch b/meta/recipes-devtools/strace/strace/0002-tests-Replace-off64_t-with-off_t.patch
index fc6ed7ac4d..ca909d573d 100644
--- a/meta/recipes-devtools/strace/strace/0002-tests-Replace-off64_t-with-off_t.patch
+++ b/meta/recipes-devtools/strace/strace/0002-tests-Replace-off64_t-with-off_t.patch
@@ -1,4 +1,4 @@
-From 1891db87da3b204c512f47155aaa4e692008f1bf Mon Sep 17 00:00:00 2001
+From 69083e93e92437e8d9d4225fca71a053906a4af0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 15 Dec 2022 15:56:13 -0800
 Subject: [PATCH] tests: Replace off64_t with off_t
diff --git a/meta/recipes-devtools/strace/strace/Makefile-ptest.patch b/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
index 9520aa8842..212eea8618 100644
--- a/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
+++ b/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
@@ -1,4 +1,4 @@
-From 593bea35a044b55222a71737ca8455c2359817d1 Mon Sep 17 00:00:00 2001
+From 9d40d293ff73dea734f1353c354f51e51992a813 Mon Sep 17 00:00:00 2001
 From: Gabriel Barbu <gabriel.barbu@enea.com>
 Date: Thu, 25 Jul 2013 15:28:33 +0200
 Subject: [PATCH] strace: Add ptest
@@ -12,9 +12,8 @@ Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
  tests/Makefile.am | 20 ++++++++++++++++++++
  1 file changed, 20 insertions(+)
 
-
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index b29471f..b8b66f0 100644
+index 6e942b1..7a707d7 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
 @@ -18,6 +18,7 @@ SIZEOF_LONG = @SIZEOF_LONG@
@@ -25,7 +24,7 @@ index b29471f..b8b66f0 100644
  AM_CFLAGS = $(WARN_CFLAGS) $(TEST_WARN_CFLAGS)
  bundled_CPPFLAGS =
  if USE_BUNDLED_HEADERS
-@@ -932,3 +933,22 @@ BUILT_SOURCES = ksysent.h
+@@ -937,3 +938,22 @@ BUILT_SOURCES = ksysent.h
  CLEANFILES = ksysent.h
  
  include ../src/scno.am
diff --git a/meta/recipes-devtools/strace/strace/ptest-spacesave.patch b/meta/recipes-devtools/strace/strace/ptest-spacesave.patch
index 14ea469c59..661ed2c7bb 100644
--- a/meta/recipes-devtools/strace/strace/ptest-spacesave.patch
+++ b/meta/recipes-devtools/strace/strace/ptest-spacesave.patch
@@ -1,4 +1,4 @@
-From cf77d301faf96cc892c6df0e19fccbf5853f249d Mon Sep 17 00:00:00 2001
+From 8bd827339ae72eab99dc9ad6a68b0ae98e5bbb49 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 29 May 2019 00:10:32 +0100
 Subject: [PATCH] strace: Tweak ptest disk space management
@@ -14,10 +14,10 @@ Upstream-Status: Inappropriate [specific to OE image space issues]
  1 file changed, 1 insertion(+)
 
 diff --git a/tests/gen_tests.sh b/tests/gen_tests.sh
-index ce1467e..8f47651 100755
+index f22ad08..3c6228a 100755
 --- a/tests/gen_tests.sh
 +++ b/tests/gen_tests.sh
-@@ -73,6 +73,7 @@ while read -r name arg0 args; do {
+@@ -84,6 +84,7 @@ while read -r name arg0 args; do {
  		$hdr
  		. "\${srcdir=.}/init.sh"
  		run_strace_match_diff $arg0 $args
diff --git a/meta/recipes-devtools/strace/strace/skip-load.patch b/meta/recipes-devtools/strace/strace/skip-load.patch
index fe737d8f9a..6b3a6cdde4 100644
--- a/meta/recipes-devtools/strace/strace/skip-load.patch
+++ b/meta/recipes-devtools/strace/strace/skip-load.patch
@@ -1,4 +1,4 @@
-From 3af7272a3435fc79e5da729155480a346ccf2d44 Mon Sep 17 00:00:00 2001
+From d0c5cb43f0d1760323a20abb62cb8cf3113d3fff Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Mon, 31 Jan 2022 17:40:13 +0000
 Subject: [PATCH] strace: skip a number of load-sensitive tests
diff --git a/meta/recipes-devtools/strace/strace/update-gawk-paths.patch b/meta/recipes-devtools/strace/strace/update-gawk-paths.patch
index 429588d218..193a4819ef 100644
--- a/meta/recipes-devtools/strace/strace/update-gawk-paths.patch
+++ b/meta/recipes-devtools/strace/strace/update-gawk-paths.patch
@@ -1,4 +1,4 @@
-From 920ff2e0e838fae4fe49bf8e8fa093d5b2485677 Mon Sep 17 00:00:00 2001
+From c11380609788ff9c802d6527adc6b2c756d5f715 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Mon, 18 Jan 2016 11:01:00 -0800
 Subject: [PATCH] update gawk paths, /bin/gawk -> /usr/bin/gawk
diff --git a/meta/recipes-devtools/strace/strace_6.15.bb b/meta/recipes-devtools/strace/strace_6.16.bb
similarity index 96%
rename from meta/recipes-devtools/strace/strace_6.15.bb
rename to meta/recipes-devtools/strace/strace_6.16.bb
index fdc79bcf85..3e6b855df0 100644
--- a/meta/recipes-devtools/strace/strace_6.15.bb
+++ b/meta/recipes-devtools/strace/strace_6.16.bb
@@ -15,7 +15,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/strace-${PV}.tar.xz \
            file://0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch \
            file://0002-tests-Replace-off64_t-with-off_t.patch \
            "
-SRC_URI[sha256sum] = "8552dfab08abc22a0f2048c98fd9541fd4d71b6882507952780dab7c7c512f51"
+SRC_URI[sha256sum] = "3d7aee7e4f044b2f67f3d51a8a76eda18076e9fb2774de54ac351d777d4ebffa"
 
 inherit autotools github-releases ptest
 
-- 
2.43.0


