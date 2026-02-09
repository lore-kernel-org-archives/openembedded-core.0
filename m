Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EA98E7E0A7
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 09:29:47 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43995.1770629376837609747
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 01:29:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=w+iDVi1o;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4327790c4e9so2505888f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 01:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770629375; x=1771234175; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wrr/tU1fz1OGMBqa9wYxRgu1lVrjJyfEE7X4ddcDDRg=;
        b=w+iDVi1o+hgwssXZJWqwndguP5TOW1XuTqk/9a7amztUtb6fH4oaqsCHecRyk2ka7e
         xB4BJDJ9RA1Crmg3YBcrlMMeNM6i0wlNg1L9E8XgxVeoMmCVp3CG5FAWkePe4qao6i2b
         1i883airhJhCQuCo0Jh2FqDANr9ZJQSz2G03Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770629375; x=1771234175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Wrr/tU1fz1OGMBqa9wYxRgu1lVrjJyfEE7X4ddcDDRg=;
        b=Q7L2MbzQ6ks3GfMn5WngG+NY3IPVDv6DO9vEo8E/AQLzC7fGyQHgyBlsRGPDn3FUQl
         bNULPNs5ytwsjGFhy13kcAP4drLVkFank1avM87n+PfilrnNQmAFpBLsVvq28yGemkRZ
         jjT/M0KCbReKLz2NOcXyX9BdO58DqetJsU85vljcGo2lKWdnQjeVWyTME9YHTbYvhEO2
         MBErhr/N1A0Op7R+g1KJcqfa3BRrrT+Eq6q/tidIWD4DmoRwpYU+VAt5lHuqTGZVuq6G
         vm+UDlS+vAYDDRjPkhOOOAF3LfspfDWAS5Zg8vjFgT6sNnxl7aM7VF799B6CrFsxXTso
         CXLA==
X-Gm-Message-State: AOJu0YzhkmVkYFNXmFjNfeSUrDfyr9mcY6yNKv6tgijF92EW0m/j8qQs
	xchkypi/KzKqfB6psny+kSTbKmP/HJn4rwkBFm9h3+W3OXq7pchc6y4U2QXDQQLoN/0FEohfToK
	qfdLcZPk=
X-Gm-Gg: AZuq6aKMImHyWmW6ThXpNzBkj0om6NTAg7P0X38KQ0ixXYCwTFGIKgWFbp+s3ud5cJU
	eq3q+QpVI7XiGFIQ2FFfK2nIGXvhm7NaYMbqsddDGgVS2nO5WMNTWowg5zHjX79hcgElx5B/ibk
	UNIkhqoT9qmejfwyJqRajMDOBL1J1vcnRY70mvfq9+buM8w+ZZpE9+t5a/FdGy08CRP8iel00Bx
	1HgniViTLQh5Be3uCAWyXuGgI0lgbe1NK1yrGxgIP1YEAlH0iEKfmfa40iyqqk/5dXDJ4WQowg6
	3p15PpIh3R+nnyjiBq0utNy85Q5dhhp2j3iNyYJ92uxW0zwVew+MjkSSWPoxfYWeQWALjfL9CHO
	ZtCP6P6lJyoBjRgJA/Gv3rvjvn9Lf0YWLPnJvo1ItsMGljjh84YcmsBHB3E/5wB9K8AVaX5BGPy
	FgkysX30Ohx2c1+0UKEtgRkWRtyJeQA1zyCN9FOtlVeH1KCsvkQIvbIDzx8J76xEF7C+Sb/eDoM
	6mpwueZ2nmb+uk=
X-Received: by 2002:a05:6000:184d:b0:435:a370:2d71 with SMTP id ffacd0b85a97d-43629388a20mr18378694f8f.33.1770629374805;
        Mon, 09 Feb 2026 01:29:34 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4376a78d796sm9575656f8f.20.2026.02.09.01.29.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 01:29:33 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 19/25] glibc: stable 2.39 branch updates
Date: Mon,  9 Feb 2026 10:29:02 +0100
Message-ID: <3f86db0e4faf9519fcfcb981e57f673daeb20269.1770626074.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1770626074.git.yoann.congal@smile.fr>
References: <cover.1770626074.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 09:29:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230770

From: Peter Marko <peter.marko@siemens.com>

git log --oneline 58cbbd43fe82910cf8ae9008351b0b0665104500..ce65d944e38a20cb70af2a48a4b8aa5d8fabe1cc
ce65d944e3 (HEAD -> release/2.39/master, origin/release/2.39/master) posix: Reset wordexp_t fields with WRDE_REUSE (CVE-2025-15281 / BZ 33814)
831f63b94c resolv: Fix NSS DNS backend for getnetbyaddr (CVE-2026-0915)
fb22fd3f5b memalign: reinstate alignment overflow check (CVE-2026-0861)
10c0bcb3d3 support: Exit on consistency check failure in resolv_response_add_name
f47dd22366 support: Fix FILE * leak in check_for_unshare_hints in test-container
4a53354eaf sprof: fix -Wformat warnings on 32-bit hosts
beb8267909 sprof: check pread size and offset for overflow
c07002038f getaddrinfo.c: Avoid uninitialized pointer access [BZ #32465]
ae5fb93559 nptl: Optimize trylock for high cache contention workloads (BZ #33704)
efff7cb659 ppc64le: Power 10 rawmemchr clobbers v20 (bug #33091)
f6becd8ae8 ppc64le: Restore optimized strncmp for power10
0daa4e46b8 ppc64le: Restore optimized strcmp for power10
28c1de6580 AArch64: Fix instability in AdvSIMD tan
03d0393343 AArch64: Optimise SVE scalar callbacks
0d05a895f1 aarch64: fix includes in SME tests
c1dc4412f8 aarch64: fix cfi directives around __libc_arm_za_disable
d60f15dc89 aarch64: tests for SME
d1d0d09e9e aarch64: clear ZA state of SME before clone and clone3 syscalls
dbe1904b7c aarch64: define macro for calling __libc_arm_za_disable
58cf4aa421 aarch64: update tests for SME
1b3bd9a9a6 aarch64: Disable ZA state of SME in setjmp and sigsetjmp
38942a336b linux: Also check pkey_get for ENOSYS on tst-pkey (BZ 31996)
c74d59a656 aarch64: Do not link conform tests with -Wl,-z,force-bti (bug 33601)
323ad087a1 x86: fix wmemset ifunc stray '!' (bug 33542)

Testing Results:
             Before    After    Diff
PASS         4926      4921     -5
XPASS        4         4         0
FAIL         223       229      +6
XFAIL        16        16        0
UNSUPPORTED  224       224       0

Changes in failed testcases:

testcase-name                                before  after
elf/tst-audit21                              PASS    FAIL
malloc/tst-malloc-too-large                  PASS    FAIL
malloc/tst-malloc-too-large-malloc-check     PASS    FAIL
malloc/tst-malloc-too-large-malloc-hugetlb1  PASS    FAIL
malloc/tst-malloc-too-large-malloc-hugetlb2  PASS    FAIL
malloc/tst-malloc-too-large-mcheck           PASS    FAIL

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 meta/recipes-core/glibc/glibc_2.39.bb     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 2ca15711587..03a8e5d01e3 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.39/master"
 PV = "2.39+git"
-SRCREV_glibc ?= "58cbbd43fe82910cf8ae9008351b0b0665104500"
+SRCREV_glibc ?= "ce65d944e38a20cb70af2a48a4b8aa5d8fabe1cc"
 SRCREV_localedef ?= "cba02c503d7c853a38ccfb83c57e343ca5ecd7e5"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
diff --git a/meta/recipes-core/glibc/glibc_2.39.bb b/meta/recipes-core/glibc/glibc_2.39.bb
index ff6c8f3b437..7958d64eed1 100644
--- a/meta/recipes-core/glibc/glibc_2.39.bb
+++ b/meta/recipes-core/glibc/glibc_2.39.bb
@@ -18,7 +18,7 @@ easier access for another. 'ASLR bypass itself is not a vulnerability.'"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_STABLE_BACKPORTS"
 CVE_STATUS_STABLE_BACKPORTS = "CVE-2024-2961 CVE-2024-33599 CVE-2024-33600 CVE-2024-33601 CVE-2024-33602 CVE-2025-0395 \
-    CVE-2025-4802 CVE-2025-5702 CVE-2025-8058"
+    CVE-2025-4802 CVE-2025-5702 CVE-2025-8058 CVE-2025-15281 CVE-2026-0861 CVE-2026-0915"
 CVE_STATUS_STABLE_BACKPORTS[status] = "cpe-stable-backport: fix available in used git hash"
 
 DEPENDS += "gperf-native bison-native"

