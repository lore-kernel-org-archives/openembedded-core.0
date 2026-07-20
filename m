Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8584C44534
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 17:23:36 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2883.1784568209788604924
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 10:23:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=YBZkhntD;
 spf=pass (domain: smile.fr, ip: 209.85.221.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47c6e9a694bso5777484f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 10:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784568208; x=1785173008; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7kGv2rQZTt4Xu26Tv273nNGbbyH0hMk0AMfE3Rb2vyE=;
        b=YBZkhntDmjzOOovSqjVQ/3QiL7d8Vifr7gcyNON5xZBOrOlgSqF8HZ28HiNdGtShkf
         KbpRf1CaZefP+hJ8S5vDMrvqVpKnCZi4PbL54YDwhADpGvlxW483utYKacC3wRSUbccG
         jeTYPbf+pCGl1PACkIOte9eXKCksqwsUV1yhQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784568208; x=1785173008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=7kGv2rQZTt4Xu26Tv273nNGbbyH0hMk0AMfE3Rb2vyE=;
        b=plEA1VIh7pRg9czXQIhAhWZc1bu55cCACClsOsvQhHxbLqc3MmQaPfjngeYdtJYpXc
         ABJGvO2ICOf5T7xDN4brfvw1Yu4MeZ54bCqKtAyZtga6zu1YF1CPfFOATHFE3Yb0g4Ub
         MYEM6QFwE1EGvwXRBCBvM8k3QSVZ5LYp1+CnJTebyk3mjdWwIHSJBQ7gzdYiMMydXyZI
         0rStEuoVrUg5uijz4HA2NfQRnlFHumkeA8sXfEDnFh8qojChBVxQ9zgdHyY/uDKWSkgR
         dyzr5JzWYnEzWa0ff5MkzWp9dDmUlDlNzo5/twPsPVScXS8J4kjqlSTP/tEPRE+3NIgn
         niEA==
X-Gm-Message-State: AOJu0YyAiUx26+ni3ihi1PaU+fxveocaCglrH5pZL05BOavOzkvKj0Dp
	BN9Yjg/88dPBWzF1eGgQlTAW9Chb1laL7PF+yGHFuAA8kdPslH39xr8wbPUILvuyYNDwLPFA/ZD
	tIUJshUQ=
X-Gm-Gg: AfdE7cmdvCb7Xw/J567DhndB7ZHsAuYJpGrGuD10Pt3jzgU0fdVL4oggf8YPIOuHLYN
	gyBCf5hEztaGeqRDTjKGL3gc0zLHknlBQRKQkGKyy36/XWoVKjUHy0Ocv5EXe79BsDcZP6ZwIbP
	IekxPUQmgCJ9OeduTUm7hDSmdCi+mPn2Qs392r0z+QD1UStEdgfCbyWyO48kJ82pbDTfBdcuV57
	9gMlvOANtbnsBavCBYCQvxtEkUCdgy2Xg6fSkkIvvFAbmcPhSnzsDAB48YY0noKJhpjJi1iuqwa
	+17TfrmsjjhEYv/GRY32wd8dVGfIWQX6koqjPP+EbI2VQFFjRCm5Yfmhty1rUXGzcgQmQhjlxPJ
	6tU/1fDilWld7c13yBvn2Bp+VJETmDTW4nlP9SBhLqrPki++QPjKoeGsI7UR45i+5n09Lh8/LCe
	8ANmWkhSaveeG+RpoASwMVwwu36GtV8IEh/klH6J0wxeS0nz3eTrZwmTx8mLdiWcBycj0FYrfVY
	8xvCXeo
X-Received: by 2002:a05:600c:190b:b0:493:c77c:108a with SMTP id 5b1f17b1804b1-4954aa1a10amr160775265e9.36.1784568207780;
        Mon, 20 Jul 2026 10:23:27 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-b501-5b7b-2580-caa3-ecc1-dea5.rev.sfr.net. [2a02:8440:b501:5b7b:2580:caa3:ecc1:dea5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49563eee22esm36508575e9.1.2026.07.20.10.23.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 10:23:27 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 02/33] glibc: stable 2.39 branch updates
Date: Mon, 20 Jul 2026 19:22:35 +0200
Message-ID: <2afc207fb9d2b720912a5eedb0f368e40f5a236e.1784567958.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784567958.git.yoann.congal@smile.fr>
References: <cover.1784567958.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 17:23:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241436

From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>

git log --oneline ce65d944e38a20cb70af2a48a4b8aa5d8fabe1cc..be1e627cd72db31161a3b4ce1c8114674f0895eb
be1e627cd7 Linux: Only define OPEN_TREE_* macros in <sys/mount.h> if undefined (bug 33921)
98bc06a361 include: isolate __O_CLOEXEC flag for sys/mount.h and fcntl.h
3e13579841 Use pending character state in IBM1390, IBM1399 character sets (CVE-2026-4046)
0dc95ae109 elf: parse /proc/self/maps as the last resort to find the gap for tst-link-map-contiguous-ldso
9344c796f7 resolv: Check hostname for validity (CVE-2026-4438)
5663ab0b83 resolv: Count records correctly (CVE-2026-4437)
c53cd6e738 posix: Run tst-wordexp-reuse-mem test
2760e4c5ed iconvdata: Fix invalid pointer arithmetic in ANSI_X3.110 module
ba29a36aa3 posix: Fix invalid flags test for p{write,read}v2
60b039bf6a socket: Add new test for shutdown

Testing Results:
             Before    After    Diff
PASS         4892      4896     +4
XPASS        4         4         0
FAIL         371       372      +1
XFAIL        16        16        0
UNSUPPORTED  224       224       0

Changes in testcases:

testcase-name                                before  after
posix/tst-wordexp-reuse-mem(new)               -     PASS (native)

[Note: posix/tst-wordexp-reuse-mem is a new test added by this uplift
(c53cd6e738). It fails under QEMU user-mode because the test-wrapper
cannot support LD_PRELOAD and MALLOC_TRACE needed for mtrace. Running
natively with LD_PRELOAD=libc_malloc_debug.so confirms the test passes
with no memory leaks.

nptl/tst-getpid3 is a flaky test under QEMU user-mode (passes 7/10
re-runs). No nptl code was changed in this uplift.]

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 meta/recipes-core/glibc/glibc_2.39.bb     | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 03a8e5d01e3..5d57dafed0a 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.39/master"
 PV = "2.39+git"
-SRCREV_glibc ?= "ce65d944e38a20cb70af2a48a4b8aa5d8fabe1cc"
+SRCREV_glibc ?= "be1e627cd72db31161a3b4ce1c8114674f0895eb"
 SRCREV_localedef ?= "cba02c503d7c853a38ccfb83c57e343ca5ecd7e5"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
diff --git a/meta/recipes-core/glibc/glibc_2.39.bb b/meta/recipes-core/glibc/glibc_2.39.bb
index 7958d64eed1..f6be1b5fc93 100644
--- a/meta/recipes-core/glibc/glibc_2.39.bb
+++ b/meta/recipes-core/glibc/glibc_2.39.bb
@@ -18,7 +18,8 @@ easier access for another. 'ASLR bypass itself is not a vulnerability.'"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_STABLE_BACKPORTS"
 CVE_STATUS_STABLE_BACKPORTS = "CVE-2024-2961 CVE-2024-33599 CVE-2024-33600 CVE-2024-33601 CVE-2024-33602 CVE-2025-0395 \
-    CVE-2025-4802 CVE-2025-5702 CVE-2025-8058 CVE-2025-15281 CVE-2026-0861 CVE-2026-0915"
+    CVE-2025-4802 CVE-2025-5702 CVE-2025-8058 CVE-2025-15281 CVE-2026-0861 CVE-2026-0915 \
+    CVE-2026-4046 CVE-2026-4437 CVE-2026-4438"
 CVE_STATUS_STABLE_BACKPORTS[status] = "cpe-stable-backport: fix available in used git hash"
 
 DEPENDS += "gperf-native bison-native"

