Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
 by mx.groups.io with SMTP id smtpd.web11.27119.1590717787341535181
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2020 19:03:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MGITeSw6;
 spf=pass (domain: gmail.com, ip: 209.85.216.67, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f67.google.com with SMTP id s69so445178pjb.4
        for <openembedded-core@lists.openembedded.org>; Thu, 28 May 2020 19:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TfmDAIZlN1wyQU82RblASgzMOIS0nX3BmuToGaCZuZ0=;
        b=MGITeSw6qInzQidJnIzNwG4KC9Hf7OA7rfdpLVuYVNelyHEwgUwfqWXZzVUoyAzp9E
         QeK9sht5EeaTuwpEtV6ws+AoVvteYzCxl8NlgJgur7bwF2J9PpPxsAVl9egxIVo9XzSJ
         0Fw+tXaOoLMMMjekRmTuVbQHnwEVi5so2B9VxUiqCiPs74YK9KkW8yRnuBqWDJc/Rhgx
         65S9Y68bjO67yJzOXC/OByY0sSvUJa6L4+vhqdKxV3TsJRrcdx18jvc2g/EP6i2roHsm
         L5CZcZ1MuPjRZhaOJZATOYhGEWTgUBb2Zn0OsZqJmUkCpwyx1J7fq9kMZVm7yuuKRqC3
         ii9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TfmDAIZlN1wyQU82RblASgzMOIS0nX3BmuToGaCZuZ0=;
        b=T62ObmtsxqLkhRm76LFWFToNEiW8xcpMdP9ms3lvU9TcLrOwvSl40GHBegqrWASeWJ
         T0vDECpt8P12F0/D+JEZmShybJkwt3U4wPxtWVob5UFhih4MrkY6qlRgoLPocl2wP818
         f+IyMbUirwblm6Ku+smKrIDJpk4Y4AFFnbeti0WAtTQMFu/xzgEn0h9BXw+LlQWFNFeT
         ahwUVXVBUxmuL52WHmTmQS5eShmN9csFnea3CwKBtqCMpRoFGk9xFK/ikhvuZRbi3gTx
         MbKVtnoiY7pKlY3CqinL1LA+l7l6Jz5I8s9lr9QlIpyHb6VQsSpPP15b0J7UUfCZ9jYL
         VuaQ==
X-Gm-Message-State: AOAM533qOEf+/3VuQTp+QmjQv2gv1MDzhuH2ryoPzPg1X9MpBJee8hqZ
	dmcBwYEDHMHE69Hl+lXZfmZ2L2vNrLA=
X-Google-Smtp-Source: ABdhPJwwjzxBZvFRX/ZP9Z/MwZAbIG7FsuOvRC1K3+7uyQxdj2WHPklj8HYOk7QRGwokhrVkD7z1bg==
X-Received: by 2002:a17:902:ba8d:: with SMTP id k13mr6517576pls.290.1590717786276;
        Thu, 28 May 2020 19:03:06 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net (c-73-63-224-124.hsd1.ca.comcast.net. [73.63.224.124])
        by smtp.gmail.com with ESMTPSA id p8sm5508739pgs.29.2020.05.28.19.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 19:03:05 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] ltp: Disable sigwaitinfo tests relying on undefined behavior
Date: Thu, 28 May 2020 19:03:02 -0700
Message-Id: <20200529020302.3816212-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Musl finds these issues, which were undetected thus far.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...not-run-invalid-undefined-test-cases.patch | 69 +++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20200515.bb     |  1 +
 2 files changed, 70 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-sigwaitinfo-Do-not-run-invalid-undefined-test-cases.patch

diff --git a/meta/recipes-extended/ltp/ltp/0001-sigwaitinfo-Do-not-run-invalid-undefined-test-cases.patch b/meta/recipes-extended/ltp/ltp/0001-sigwaitinfo-Do-not-run-invalid-undefined-test-cases.patch
new file mode 100644
index 0000000000..17d5af89e2
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0001-sigwaitinfo-Do-not-run-invalid-undefined-test-cases.patch
@@ -0,0 +1,69 @@
+From e0a63deb1857eb90288e90d6368df70cdd0c0ec9 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 28 May 2020 13:04:33 -0700
+Subject: [PATCH] sigwaitinfo: Do not run invalid/undefined test cases
+
+These testcases run for eternity on musl
+
+test_bad_address* cases are passing invalid pointers to a function; that's always UB
+empty_set and timeout rely on the implementation-defined "may fail" for EINTR in sigtimedwait [1]
+
+normally "may fail" is an "unspecified" but here the impl
+is supposed to document it so it's "impl-defined"
+
+[1] https://pubs.opengroup.org/onlinepubs/9699919799/functions/sigtimedwait.html
+
+Upstream-Status: Submitted [https://patchwork.ozlabs.org/project/ltp/patch/20200528204556.2444156-1-raj.khem@gmail.com/]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Cc: Rich Felker <dalias@aerifal.cx>
+---
+ .../kernel/syscalls/sigwaitinfo/sigwaitinfo01.c      | 12 ++----------
+ 1 file changed, 2 insertions(+), 10 deletions(-)
+
+--- a/testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c
++++ b/testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c
+@@ -422,15 +422,10 @@ struct test_desc {
+ } tests[] = {
+ #ifdef TEST_RT_SIGTIMEDWAIT
+ 	{
+-	test_empty_set, my_rt_sigtimedwait, SIGUSR1}, {
+ 	test_unmasked_matching, my_rt_sigtimedwait, SIGUSR1}, {
+ 	test_masked_matching, my_rt_sigtimedwait, SIGUSR1}, {
+ 	test_unmasked_matching_noinfo, my_rt_sigtimedwait, SIGUSR1}, {
+-	test_masked_matching_noinfo, my_rt_sigtimedwait, SIGUSR1}, {
+-	test_bad_address, my_rt_sigtimedwait, SIGUSR1}, {
+-	test_bad_address2, my_rt_sigtimedwait, SIGUSR1}, {
+-	test_bad_address3, my_rt_sigtimedwait, SIGUSR1}, {
+-	test_timeout, my_rt_sigtimedwait, 0},
++	test_masked_matching_noinfo, my_rt_sigtimedwait, SIGUSR1}, 
+ 	    /* Special cases */
+ 	    /* 1: sigwaitinfo does respond to ignored signal */
+ 	{
+@@ -452,25 +447,17 @@ struct test_desc {
+ #endif
+ #if defined TEST_SIGWAITINFO
+ 	{
+-	test_empty_set, my_sigwaitinfo, SIGUSR1}, {
+ 	test_unmasked_matching, my_sigwaitinfo, SIGUSR1}, {
+ 	test_masked_matching, my_sigwaitinfo, SIGUSR1}, {
+ 	test_unmasked_matching_noinfo, my_sigwaitinfo, SIGUSR1}, {
+-	test_masked_matching_noinfo, my_sigwaitinfo, SIGUSR1}, {
+-	test_bad_address, my_sigwaitinfo, SIGUSR1}, {
+-	test_bad_address2, my_sigwaitinfo, SIGUSR1},
++	test_masked_matching_noinfo, my_sigwaitinfo, SIGUSR1},
+ #endif
+ #if defined TEST_SIGTIMEDWAIT
+ 	{
+-	test_empty_set, my_sigtimedwait, SIGUSR1}, {
+ 	test_unmasked_matching, my_sigtimedwait, SIGUSR1}, {
+ 	test_masked_matching, my_sigtimedwait, SIGUSR1}, {
+ 	test_unmasked_matching_noinfo, my_sigtimedwait, SIGUSR1}, {
+-	test_masked_matching_noinfo, my_sigtimedwait, SIGUSR1}, {
+-	test_bad_address, my_sigtimedwait, SIGUSR1}, {
+-	test_bad_address2, my_sigtimedwait, SIGUSR1}, {
+-	test_bad_address3, my_sigtimedwait, SIGUSR1}, {
+-	test_timeout, my_sigtimedwait, 0},
++	test_masked_matching_noinfo, my_sigtimedwait, SIGUSR1},
+ #endif
+ };
+ 
diff --git a/meta/recipes-extended/ltp/ltp_20200515.bb b/meta/recipes-extended/ltp/ltp_20200515.bb
index 67c7590320..f2510baa68 100644
--- a/meta/recipes-extended/ltp/ltp_20200515.bb
+++ b/meta/recipes-extended/ltp/ltp_20200515.bb
@@ -35,6 +35,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0007-Fix-test_proc_kill-hanging.patch \
            file://0001-Add-more-musl-exclusions.patch \
            file://0001-ptrace01-Fix-missing-format-string.patch \
+           file://0001-sigwaitinfo-Do-not-run-invalid-undefined-test-cases.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.26.2

