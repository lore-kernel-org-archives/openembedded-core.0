Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23DC8E6ADF2
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:08:58 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87839.1766434133598860732
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:08:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QPNMeR7N;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b72b495aa81so716699266b.2
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434132; x=1767038932; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cjshUifaBpWdEHtEVqqRzF7XFXz9jNzHQu6mHJpAlCY=;
        b=QPNMeR7N6Z9umxD36rFHYAFyZ65iJQaNEZYfNAPKati41EwHZC/x/9b/omlFu+JBi2
         VAvOho9nrhiMLwvLeoEyHCAWk6Gw1Oav7pvLTZZkvYxcAbSHuBiJZHTcTnmSIKQ9wUs7
         G8glNekglFGtDKC4a3mPSQTJHXHs2HYC/KEjHMn1xBAYC4LoCHkTYQ1kjwFPsXTn+vFU
         M63Uwt51LyftvxdmOfKReX0aGCvoJRUgbYUTkcqi3BmdosZDXQABYG2hn2HHxgca5W2w
         jjayhfOcXlrAPfXo7WxhJZUIopKOOFbqabBtDjcTcYEWiIat+OnUZQPazbdLcw4Ss655
         xCjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434132; x=1767038932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cjshUifaBpWdEHtEVqqRzF7XFXz9jNzHQu6mHJpAlCY=;
        b=xA3kM0SjEGCPStkrqadY/s+pegyfCF6AxuviZJhItuZtKamJBxW1Jn1HU46RZSYagm
         0Goft+HP5aimAdJ0nmPzXBTr49L5gCmBCVlpWlPFdswk82QeuQFjTnn2yOK5JS5aVKc0
         JSPH9o4shdghQE32GTm7e40djp3YQY5opkdVxD8Q371PENMQj5mMSKqM5Oq7ozye2tqH
         vtgI2XN7enIfb4bvc71ONLMtgsT2iu2fvZiWs0ywfrmg03ndvKw4aBn9bpq0wGXQDwYq
         gGPXBOP8g+AvSNZ7SL5GzEIqaj72qG4tuzTe8ncOP3FkwOlQAoOUCKu2wFMt8ZKMqVkf
         O+gQ==
X-Gm-Message-State: AOJu0YxsJfMocrq5mdjfL6Ln74KX9MHKOFqvzlD1RTPK1vseVkD/PO6L
	thHlsBB3ZeiXTeTDRuy0w8/h7QiqjKGwAUG6Ww0lo3CsWs2pbruRqBRDHNGiCg==
X-Gm-Gg: AY/fxX6sS13byOCA31NcD3QLKfjWZYi8DiF0BwXpapX8kceVMl2utLros4+uzXn2d86
	HiLlS6HQL5WoJ9HdmiXeMHKbVo5bg7KkEg/1OlslYLnRRex2EqG9KFzj3ALZemoJKt/kESuy/iO
	NYujigdudHfGpuiHCv9dwt8arFTe4eLwaGWU42G+g6PrfNvuctask62j/ip+F9kmV2POg15M+mN
	epgyS7oqkbVWEvCyL6qY4jPYUQgYw2vSsznsFoGFSkEyDfnnewzL272zoR1iDGnabhG3Gd/tUOk
	cLFHvDXD8f2+xLQnytTLUc/cCzRFFLadbwbC6wE4ufGMCiApSp4Wuyp4FSHvGVid8GgfmM2W5x4
	+S6kGRbZjnZYqBgvzxrwapvJXXNFyPpIE3u7kfjVxzX0SrA2HUrtrUBfZ7iZJgY/OmLtZTADUEB
	v8ej3XEA+NA10BV9MB0qH+3qxRwwlgZ2LYT1UuXNPqPCf6CCkxLWIUE6IycQ==
X-Google-Smtp-Source: AGHT+IEURXo1NfHH6oonBJNbyzNcKtJ/eu2hbdojC/UYhSnFIUo5940FsPIYQ9hBarE6OSPtAROWJg==
X-Received: by 2002:a17:906:ef08:b0:b72:6728:5bb1 with SMTP id a640c23a62f3a-b803726dd35mr1447189866b.56.1766434131741;
        Mon, 22 Dec 2025 12:08:51 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:08:51 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 097/114] strace: upgrade 6.17 -> 6.18
Date: Mon, 22 Dec 2025 21:07:19 +0100
Message-ID: <20251222200739.2278706-97-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:08:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228422

From: Alexander Kanavin <alex@linutronix.de>

Add a patch to skip tests with newly appeared failures.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...gnore-pwritev-pwrite64-tests-on-musl.patch | 16 +++++++---
 ...toconf-macro-to-detect-largefile-sup.patch |  4 +--
 ...001-strace-fix-reproducibilty-issues.patch |  2 +-
 .../strace/0001-tests-skip-bpf-tests.patch    | 32 +++++++++++++++++++
 ...002-tests-Replace-off64_t-with-off_t.patch |  2 +-
 .../strace/strace/Makefile-ptest.patch        |  6 ++--
 .../strace/strace/ptest-spacesave.patch       |  2 +-
 .../strace/strace/skip-load.patch             |  2 +-
 .../strace/strace/update-gawk-paths.patch     |  2 +-
 .../strace/{strace_6.17.bb => strace_6.18.bb} |  3 +-
 10 files changed, 55 insertions(+), 16 deletions(-)
 create mode 100644 meta/recipes-devtools/strace/strace/0001-tests-skip-bpf-tests.patch
 rename meta/recipes-devtools/strace/{strace_6.17.bb => strace_6.18.bb} (94%)

diff --git a/meta/recipes-devtools/strace/strace/0001-Ignore-pwritev-pwrite64-tests-on-musl.patch b/meta/recipes-devtools/strace/strace/0001-Ignore-pwritev-pwrite64-tests-on-musl.patch
index f21f68001f..86447939b8 100644
--- a/meta/recipes-devtools/strace/strace/0001-Ignore-pwritev-pwrite64-tests-on-musl.patch
+++ b/meta/recipes-devtools/strace/strace/0001-Ignore-pwritev-pwrite64-tests-on-musl.patch
@@ -1,4 +1,4 @@
-From 13fd22ad0df5b80c428d3ecc0114fb340f3b3894 Mon Sep 17 00:00:00 2001
+From 0d37c910b2a944eb216700d3630dc18bfe8753b1 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 18 Aug 2025 22:18:58 -0700
 Subject: [PATCH] Ignore pwritev/pwrite64 tests on musl
@@ -19,11 +19,13 @@ Issue is reported upstream [3]
 Upstream-Status: Inappropriate [Musl Specific]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- tests/pread64-pwrite64.gen.test | 2 ++
- tests/preadv-pwritev.gen.test   | 2 ++
- tests/pwritev.gen.test          | 2 ++
- 3 files changed, 6 insertions(+)
+ tests/pread64-pwrite64.gen.test | 3 +++
+ tests/preadv-pwritev.gen.test   | 3 +++
+ tests/pwritev.gen.test          | 3 +++
+ 3 files changed, 9 insertions(+)
 
+diff --git a/tests/pread64-pwrite64.gen.test b/tests/pread64-pwrite64.gen.test
+index b53e069..0a1e6e6 100755
 --- a/tests/pread64-pwrite64.gen.test
 +++ b/tests/pread64-pwrite64.gen.test
 @@ -1,4 +1,7 @@
@@ -34,6 +36,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 +skip_ "Test not ported to musl, musl generates pwritev2"
 +
  run_strace_match_diff -a21 -eread=0 -ewrite=1 -e trace=pread64,pwrite64 -P pread64-pwrite64-tmpfile -P /dev/zero -P /dev/null
+diff --git a/tests/preadv-pwritev.gen.test b/tests/preadv-pwritev.gen.test
+index 5ed8297..b83f129 100755
 --- a/tests/preadv-pwritev.gen.test
 +++ b/tests/preadv-pwritev.gen.test
 @@ -1,4 +1,7 @@
@@ -44,6 +48,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 +skip_ "Test not ported to musl, musl generates pwritev2"
 +
  run_strace_match_diff -a19 -eread=0 -ewrite=1 -e trace=preadv,pwritev
+diff --git a/tests/pwritev.gen.test b/tests/pwritev.gen.test
+index e54fd15..4999816 100755
 --- a/tests/pwritev.gen.test
 +++ b/tests/pwritev.gen.test
 @@ -1,4 +1,7 @@
diff --git a/meta/recipes-devtools/strace/strace/0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch b/meta/recipes-devtools/strace/strace/0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch
index 1750f34518..d5d61823fb 100644
--- a/meta/recipes-devtools/strace/strace/0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch
+++ b/meta/recipes-devtools/strace/strace/0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch
@@ -1,4 +1,4 @@
-From 4c7112f36a70d3034c583ab45058491129111585 Mon Sep 17 00:00:00 2001
+From b3991207af0ea13b38a64172b9cbd9a6390a34ef Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 15 Dec 2022 15:54:27 -0800
 Subject: [PATCH] configure: Use autoconf macro to detect largefile support
@@ -13,7 +13,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index ad12d20..a760789 100644
+index b9450c3..2bde478 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -43,6 +43,8 @@ AC_PROG_INSTALL
diff --git a/meta/recipes-devtools/strace/strace/0001-strace-fix-reproducibilty-issues.patch b/meta/recipes-devtools/strace/strace/0001-strace-fix-reproducibilty-issues.patch
index c633531f44..7c9b77463a 100644
--- a/meta/recipes-devtools/strace/strace/0001-strace-fix-reproducibilty-issues.patch
+++ b/meta/recipes-devtools/strace/strace/0001-strace-fix-reproducibilty-issues.patch
@@ -1,4 +1,4 @@
-From d0bbbf170f70746b2b8e9bb6129b0b9441a1c4b5 Mon Sep 17 00:00:00 2001
+From b97b0c867fe6241b2a3b6146174c860f1ab93578 Mon Sep 17 00:00:00 2001
 From: Jeremy Puhlman <jpuhlman@mvista.com>
 Date: Wed, 11 Mar 2020 19:56:55 +0000
 Subject: [PATCH] strace: fix reproducibilty issues
diff --git a/meta/recipes-devtools/strace/strace/0001-tests-skip-bpf-tests.patch b/meta/recipes-devtools/strace/strace/0001-tests-skip-bpf-tests.patch
new file mode 100644
index 0000000000..e50aee352e
--- /dev/null
+++ b/meta/recipes-devtools/strace/strace/0001-tests-skip-bpf-tests.patch
@@ -0,0 +1,32 @@
+From 62a51905c5ccf06f2fecd8fed284adc21c1860d2 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Thu, 18 Dec 2025 12:20:57 +0100
+Subject: [PATCH] tests: skip bpf tests
+
+Upstream-Status: Inappropriate [issue reported at https://github.com/strace/strace/issues/370]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ tests/bpf-v.gen.test | 1 +
+ tests/bpf.gen.test   | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/tests/bpf-v.gen.test b/tests/bpf-v.gen.test
+index e57154e..4abde9a 100755
+--- a/tests/bpf-v.gen.test
++++ b/tests/bpf-v.gen.test
+@@ -1,4 +1,5 @@
+ #!/bin/sh -efu
+ # Generated by ./tests/gen_tests.sh from ./tests/gen_tests.in (bpf-v -a20 -v -e trace=bpf); do not edit.
+ . "${srcdir=.}/init.sh"
++skip_ "Issue reported at https://github.com/strace/strace/issues/370"
+ run_strace_match_diff -a20 -v -e trace=bpf
+diff --git a/tests/bpf.gen.test b/tests/bpf.gen.test
+index 1391d6b..c11e5be 100755
+--- a/tests/bpf.gen.test
++++ b/tests/bpf.gen.test
+@@ -1,4 +1,5 @@
+ #!/bin/sh -efu
+ # Generated by ./tests/gen_tests.sh from ./tests/gen_tests.in (bpf -a20 ); do not edit.
+ . "${srcdir=.}/init.sh"
++skip_ "Issue reported at https://github.com/strace/strace/issues/370"
+ run_strace_match_diff -a20 
diff --git a/meta/recipes-devtools/strace/strace/0002-tests-Replace-off64_t-with-off_t.patch b/meta/recipes-devtools/strace/strace/0002-tests-Replace-off64_t-with-off_t.patch
index 093cedc233..1c423be8ea 100644
--- a/meta/recipes-devtools/strace/strace/0002-tests-Replace-off64_t-with-off_t.patch
+++ b/meta/recipes-devtools/strace/strace/0002-tests-Replace-off64_t-with-off_t.patch
@@ -1,4 +1,4 @@
-From f487e2a0f1568c989a0294f4335f3dc9a6012d8d Mon Sep 17 00:00:00 2001
+From 331f84f0fa88885206aec173f3dec80bad84e97b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 15 Dec 2022 15:56:13 -0800
 Subject: [PATCH] tests: Replace off64_t with off_t
diff --git a/meta/recipes-devtools/strace/strace/Makefile-ptest.patch b/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
index 60562ae7d9..b3d4e226da 100644
--- a/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
+++ b/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
@@ -1,4 +1,4 @@
-From 6d77203fb22e076918dc983db47b48b28cbbc06d Mon Sep 17 00:00:00 2001
+From 89257167c9beeacf0e36bd93505b120b915fe1a3 Mon Sep 17 00:00:00 2001
 From: Gabriel Barbu <gabriel.barbu@enea.com>
 Date: Thu, 25 Jul 2013 15:28:33 +0200
 Subject: [PATCH] strace: Add ptest
@@ -13,7 +13,7 @@ Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
  1 file changed, 20 insertions(+)
 
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index d76b5c6..d4fc206 100644
+index 8971a88..7e3e072 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
 @@ -18,6 +18,7 @@ SIZEOF_LONG = @SIZEOF_LONG@
@@ -24,7 +24,7 @@ index d76b5c6..d4fc206 100644
  AM_CFLAGS = $(WARN_CFLAGS) $(TEST_WARN_CFLAGS)
  bundled_CPPFLAGS =
  if USE_BUNDLED_HEADERS
-@@ -939,3 +940,22 @@ BUILT_SOURCES = ksysent.h
+@@ -943,3 +944,22 @@ BUILT_SOURCES = ksysent.h
  CLEANFILES = ksysent.h
  
  include ../src/scno.am
diff --git a/meta/recipes-devtools/strace/strace/ptest-spacesave.patch b/meta/recipes-devtools/strace/strace/ptest-spacesave.patch
index 3e66b15850..cf7c718149 100644
--- a/meta/recipes-devtools/strace/strace/ptest-spacesave.patch
+++ b/meta/recipes-devtools/strace/strace/ptest-spacesave.patch
@@ -1,4 +1,4 @@
-From 76c23e018608421624d1e00b9e387b265e6da469 Mon Sep 17 00:00:00 2001
+From cee971bb430e53b9c3018301f4c52e8d73c705ad Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 29 May 2019 00:10:32 +0100
 Subject: [PATCH] strace: Tweak ptest disk space management
diff --git a/meta/recipes-devtools/strace/strace/skip-load.patch b/meta/recipes-devtools/strace/strace/skip-load.patch
index 20535fe005..7b1ea09ef6 100644
--- a/meta/recipes-devtools/strace/strace/skip-load.patch
+++ b/meta/recipes-devtools/strace/strace/skip-load.patch
@@ -1,4 +1,4 @@
-From 40244c27de6b8fa0f6f6685d20e64309884e73bf Mon Sep 17 00:00:00 2001
+From d15c005d4046516c1b06fe8301db43dbaf3699a4 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Sat, 30 Aug 2025 00:47:03 +0200
 Subject: [PATCH] strace: skip a number of load-sensitive tests
diff --git a/meta/recipes-devtools/strace/strace/update-gawk-paths.patch b/meta/recipes-devtools/strace/strace/update-gawk-paths.patch
index bf4a8cd123..374336bf2e 100644
--- a/meta/recipes-devtools/strace/strace/update-gawk-paths.patch
+++ b/meta/recipes-devtools/strace/strace/update-gawk-paths.patch
@@ -1,4 +1,4 @@
-From 71bcc83993dd1f8f30c3defaece23211c9b73f33 Mon Sep 17 00:00:00 2001
+From 1e685396975f489380b06404569a556b5d64dd34 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Mon, 18 Jan 2016 11:01:00 -0800
 Subject: [PATCH] update gawk paths, /bin/gawk -> /usr/bin/gawk
diff --git a/meta/recipes-devtools/strace/strace_6.17.bb b/meta/recipes-devtools/strace/strace_6.18.bb
similarity index 94%
rename from meta/recipes-devtools/strace/strace_6.17.bb
rename to meta/recipes-devtools/strace/strace_6.18.bb
index b6fda2b8ce..7b735e2d6a 100644
--- a/meta/recipes-devtools/strace/strace_6.17.bb
+++ b/meta/recipes-devtools/strace/strace_6.18.bb
@@ -14,11 +14,12 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/strace-${PV}.tar.xz \
            file://skip-load.patch \
            file://0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch \
            file://0002-tests-Replace-off64_t-with-off_t.patch \
+           file://0001-tests-skip-bpf-tests.patch \
            "
 SRC_URI:append:libc-musl = "\
            file://0001-Ignore-pwritev-pwrite64-tests-on-musl.patch \
            "
-SRC_URI[sha256sum] = "0a7c7bedc7efc076f3242a0310af2ae63c292a36dd4236f079e88a93e98cb9c0"
+SRC_URI[sha256sum] = "0ad5dcba973a69e779650ef1cb335b12ee60716fc7326609895bd33e6d2a7325"
 
 inherit autotools github-releases ptest
 
-- 
2.47.3


