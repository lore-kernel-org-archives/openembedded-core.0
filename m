Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26912D7974F
	for <webhook@archiver.kernel.org>; Sat, 31 Jan 2026 07:57:06 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5106.1769846222651565278
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jan 2026 23:57:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=GoBWqTw0;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4806f3fc50bso28476045e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Jan 2026 23:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1769846221; x=1770451021; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y6Spzk7r+/ZPe8BJaSqxqZ+Z5LTsQ7ZNbAfkct6fYBs=;
        b=GoBWqTw0floMqCPZEQW8iftheB5vGANSQf6nrEwZtI2aJmx9tQ7w73Iguh3yRGWciS
         WnLPI7YeK2BHAPyTZl4Up8jyMPB7fih3MZFv9nqgN1rgbGQz3eivCjhMiW743Fiq+jTo
         9xyu/tzLfVUjLzacQwW+yptKLSTAoXSj7ns+E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769846221; x=1770451021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y6Spzk7r+/ZPe8BJaSqxqZ+Z5LTsQ7ZNbAfkct6fYBs=;
        b=v/qrjKFtvNkQq7dbT1LH3mw56SGbCuCBer4MAwiz7wC/Ev2J0GRbaeYtwRyhkiKvOg
         jp/jm7MB+vOXWJmsgs1G2qAYkRKfkxP5/WCoocv4YC36Yx9MJr7tAAr4SL6ILYgd+smZ
         h6SQkybYRwa/nBBcPbrdMfEN09IPfQiRa5TNs1AwEtVwdD9a2tsjiZfK64eiAnAOkjYh
         2J6MJP8J68+5SwTU5IVWgTl9abetNZoruyfSeSWJ276Cmm5lq+viUXslEbUQsV+eNgWx
         GMh+XmxmO8ZYv0kkO+pEXCvG40djWzOB4cAuC6Q1955g3NKr2IGnIcL66n7/nUhjWBnC
         j1sg==
X-Gm-Message-State: AOJu0YwXpnSS2uHwljpbhntftqeyVx5hrVm9Qou2qcYto0Ri4bVAZuYG
	K7vK13vGU5Jabbljxh3tg8THxSGD+H4tSn1+dKfoTvLQJnOoMfa0hAwV8NpYP4+F11firIQqhz2
	gGqMmA+0=
X-Gm-Gg: AZuq6aLGiS9FP8Y2ds9icLUx8tykqozinHEX3aiANOBINqquokHlp0Oyx9F6KDOVhTZ
	5FTmq3Pq1A8TvoUpKAY3mAjYYNR5cWN5h9njAYGjUrOebp7HxKXufoT9ZvhNxpSXc7jO7/VkjTy
	9lBMmETvfG4KgXR7yic+ui1NHLs0t9fQhe6y7e2qLu2/4upgEUo3XMcbFxqfyVuPc/u3nEgFxSY
	r8q4tuBWxMvVCqPT3/gi5/61OQEcKbNzvkzWvBHnvn6minvuOLdPLTmcU6FSZ75ZzWMzzvJz7mR
	nN55gt31JNUkz158Q3nMsSx8btT+St/31yhggUL3ZpBdZxfEAzYQUJKfljSMDzDtG3g92fjvjrq
	8GeqpmPUcZGtU0GyQGlD/zVH6BNqek/n0x+PCU+edJMIm5z2/ifJRESvWI17lwWEA0JZdfpVYIm
	e9b6E/xlmoh6NP0cgFZ5/Un4/kGUzF7OaK/6hPuPBN/oHTHX1zE4bZ2B5O6xGWmnNb/547rw7Gq
	8D3IIAyl5llr7+/
X-Received: by 2002:a05:600c:4591:b0:480:4a4f:c363 with SMTP id 5b1f17b1804b1-482db45fc65mr65322665e9.9.1769846220789;
        Fri, 30 Jan 2026 23:57:00 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00fa8b238ae1dd6dd8.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:fa8b:238a:e1dd:6dd8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806ce564f9sm258621475e9.14.2026.01.30.23.57.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 23:57:00 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 10/22] glibc: stable 2.42 branch updates
Date: Sat, 31 Jan 2026 08:56:21 +0100
Message-ID: <c5401d89c51fe73d93afc73d73cb0f93c00bbca7.1769845858.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1769845858.git.yoann.congal@smile.fr>
References: <cover.1769845858.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 31 Jan 2026 07:57:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230215

From: Peter Marko <peter.marko@siemens.com>

git log --oneline e34453cd6a8c592c325756ff3c7ac0afd3975cb4..912d89a766847649a3857985a3b5e6065c51bfd4
912d89a766 (HEAD -> release/2.42/master, origin/release/2.42/master) Switch currency symbol for the bg_BG locale to euro
cbf39c26b2 posix: Reset wordexp_t fields with WRDE_REUSE (CVE-2025-15281 / BZ 33814)
453e6b8dba resolv: Fix NSS DNS backend for getnetbyaddr (CVE-2026-0915)
b0ec8fb689 memalign: reinstate alignment overflow check (CVE-2026-0861)
f122d0b4d1 nptl: Optimize trylock for high cache contention workloads (BZ #33704)
a1d3294a5b support: Exit on consistency check failure in resolv_response_add_name
8dfb84ad4e support: Fix FILE * leak in check_for_unshare_hints in test-container
2a0873aa81 sprof: fix -Wformat warnings on 32-bit hosts
efdf4c0c87 sprof: check pread size and offset for overflow
b11411fe2e posix: Fix invalid flags test for p{write,read}v2
8aaf4b732d ppc64le: Power 10 rawmemchr clobbers v20 (bug #33091)
2dbf973fe0 ppc64le: Restore optimized strncmp for power10
6b2957cfe8 ppc64le: Restore optimized strcmp for power10
828b8d23f3 AArch64: Fix and improve SVE pow(f) special cases
710d7a2e83 AArch64: fix SVE tanpi(f) [BZ #33642]
0c9430ed97 AArch64: Fix instability in AdvSIMD sinh
ec041b1f53 AArch64: Fix instability in AdvSIMD tan
97297120ce AArch64: Optimise SVE scalar callbacks
17c3eab387 aarch64: fix includes in SME tests
de1fe81f47 aarch64: fix cfi directives around __libc_arm_za_disable
bf499c2a49 x86: fix wmemset ifunc stray '!' (bug 33542)
71874f167a aarch64: tests for SME
256030b984 aarch64: clear ZA state of SME before clone and clone3 syscalls
6de12fc9ad aarch64: define macro for calling __libc_arm_za_disable
ab8c1b5d62 x86: Detect Intel Nova Lake Processor
bf48b17a28 x86: Detect Intel Wildcat Lake Processor
18fd689cdc nptl: Fix MADV_GUARD_INSTALL logic for thread without guard page (BZ 33356)
46b4e37c9e nss: Group merge does not react to ERANGE during merge (bug 33361)
1166170d95 libio: Define AT_RENAME_* with the same tokens as Linux

Testing Results:
             Before     After   Diff
PASS         6809      6815     +6
XPASS        4         4         0
FAIL         180       173      -7
XFAIL        16        16        0
UNSUPPORTED  129       129       0

Changes in failed testcases:

testcase-name                                   before   after
malloc/tst-malloc_info                          FAIL     PASS
malloc/tst-malloc-too-large                     FAIL     PASS
malloc/tst-malloc-too-large-malloc-check        FAIL     PASS
malloc/tst-malloc-too-large-malloc-hugetlb1     FAIL     PASS
malloc/tst-malloc-too-large-malloc-largetcache  FAIL     PASS
malloc/tst-malloc-too-large-mcheck              FAIL     PASS
nptl/tst-robustpi7                              FAIL     PASS
posix/tst-wait3                                 FAIL     PASS
stdio-common/tst-read-offset                    PASS     FAIL

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 meta/recipes-core/glibc/glibc_2.42.bb     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index a3ce970c29c..9991c024953 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.42/master"
 PV = "2.42+git"
-SRCREV_glibc ?= "e34453cd6a8c592c325756ff3c7ac0afd3975cb4"
+SRCREV_glibc ?= "912d89a766847649a3857985a3b5e6065c51bfd4"
 SRCREV_localedef ?= "cba02c503d7c853a38ccfb83c57e343ca5ecd7e5"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
diff --git a/meta/recipes-core/glibc/glibc_2.42.bb b/meta/recipes-core/glibc/glibc_2.42.bb
index f9c1cdc2f14..a8717c0eae2 100644
--- a/meta/recipes-core/glibc/glibc_2.42.bb
+++ b/meta/recipes-core/glibc/glibc_2.42.bb
@@ -17,7 +17,7 @@ Allows for ASLR bypass so can bypass some hardening, not an exploit in itself, m
 easier access for another. 'ASLR bypass itself is not a vulnerability.'"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_STABLE_BACKPORTS"
-CVE_STATUS_STABLE_BACKPORTS = ""
+CVE_STATUS_STABLE_BACKPORTS = "CVE-2025-15281 CVE-2026-0861 CVE-2026-0915"
 CVE_STATUS_STABLE_BACKPORTS[status] = "cpe-stable-backport: fix available in used git hash"
 
 DEPENDS += "gperf-native bison-native"

