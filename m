Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 952E5CA9ED9
	for <webhook@archiver.kernel.org>; Sun, 11 Oct 2026 08:41:29 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23572.1791708080936399438
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 01:41:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=m8/ubSCd;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48b0946c2c2so467102f8f.3
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 01:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791708079; x=1792312879; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fybJs4nCNdBhTsOkuZObdXHg9eC9TQiMY2Hta8Nq9Xg=;
        b=m8/ubSCdw16N2l4e0+0xnaidBrBWCxbmfvWZ0akPjWAwa+oYuIoWOLDw0QlSdxmfdY
         2PWenqmv0HdoH4fRYirgjz1Xg/VtKfv80Ek8IIme2eUxQwxzNB08e4KEoTfGSHdi2A6t
         v1uEw7MySdXcyPtMF0DBi9qGz5Wx9jYecjF80=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791708079; x=1792312879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=fybJs4nCNdBhTsOkuZObdXHg9eC9TQiMY2Hta8Nq9Xg=;
        b=MAl8LmhMFWmHpuwWOQRK4ALUSMIY561U89Ghk++gRsx1hgsz4EedSEhVgaYq1KhyzR
         lc1BVnqab/eR9d/R9r3bwyrmkQxkbjhsuuxL4FcPUIjTtWtS+J/4MsY9fqCoyyr45T2E
         xGAQeWOn+21syg7aCpxul+LiYCXFWGppueRpAGw6RnMowYl6wNdkji16ejuT6RB+bmIB
         Fg2MyLPQDLqgC+mbG3Kua01wbkTqTw7oSP8Na+93s/QrHuahwT9k2Sg2JWoiAclvNxjn
         yghCLPcniEPaq/XdsxJTa3TpKfhPEAPPB7xg0SGuUofHS4PSW2DESpaYAeI8uYEJARWI
         xFiA==
X-Gm-Message-State: AFq9FYKHmtXQD6rhEHS0AbZTLE4TYUz57IBSxJHj7FXAcRTkMVy+BGh4
	NMO3NaYyOMikAKb95h+ihrEFlVHtm+J6S7oq5EFWO4c5Zmr2JL0LL9HKWU9qZ9/dc1PWBK95NXe
	Me/uHj9Q=
X-Gm-Gg: AYBFou3Iv4Hz1lod36plnhgZLe3VH5pP/0ViyF+UE55H0zkPqWVF37KlFp8w+SEW9Y5
	r6ZtcEHitonPIwt63wUgn+xmJc7+3eeWQ/cClCh4diNyEQvNHgwgullZINknkyVOZqzoEAmSG+G
	r3ktzEaJ6Bh2q++5uW96eDHFb7GJcaj7lKGGv7nmKu7obWqCNbpaSeSVqTHSzxPlC4VGfs/QNSP
	piwMWctehPwPDWnrYFD/86HiZhP6VlWd0MdIFrWVgPe4MWJQ2wyzuVELmw0j6En3IurMxm/h4Yr
	1jaF6CRHbl4CpoGW/dAQAZ18gA96TYHSB5VxC/YfF5ayxlnmGgt8G2YGaQxeqplRhLT2LLmOaj8
	nAjBVZtkRxJgerTETsYyQMcCIbAOJ9BcA3hp86UGJ1J9ZVVEzZSn2iNiriHyqbfU22Qtw0Rc/jX
	GhvuItqOomq1PEGulZ1MGrCiB7xG7aRDwK3ZfdlU5eNfHtCR1uHiNRYjU6jtJlVvfPit0fqngnt
	pgDWY32FJRnAttuUjtzt5nDeszBdtueHFBdAX6X4ddNg73WLtPIqOPR+w1fFMU8J0Rt6VsWjA==
X-Received: by 2002:a05:6000:481a:b0:48c:4d32:ccf8 with SMTP id ffacd0b85a97d-48dbaade745mr11173112f8f.16.1791708079070;
        Sun, 11 Oct 2026 01:41:19 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9acfa28sm13481734f8f.51.2026.10.11.01.41.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 01:41:18 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 28/60] glibc: stable 2.43 branch updates to 9cda6fc96ab
Date: Sun, 11 Oct 2026 10:40:01 +0200
Message-ID: <1af34609676b625b7817bf06020e0897206d2f5f.1791707817.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791707817.git.yoann.congal@smile.fr>
References: <cover.1791707817.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 08:41:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247537

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Update SRCREV to pull the latest fixes from the upstream
release/2.43/master branch, including fixes for the following CVEs:

CVE-2026-6368 CVE-2026-19499 CVE-2026-77117
CVE-2026-80489 CVE-2026-18374 CVE-2026-8674

Commits between the old SRCREV (1c9988e5254) and the new SRCREV (9cda6fc96ab):

9cda6fc96a stdlib: Don't call clearenv from __libc_setenv_freemem
d6c6dd71c6 resolv: Fix assertion failure on search list truncation [BZ 31026, CVE-2026-8674]
65f2295a98 zic: keep needed last transition to new type (bug 34618)
f8f3d451ba nptl: Skip pretty-printer tests without python3 [BZ #34507]
d9a8ff5c01 hesiod: use booleans in parser macro calls
1c1f5103a9 hesiod: fix swapped arguments in service parser
049168237f nss_files: use booleans in parser macro calls
0770e8b07c nss_files: fix swapped arguments in service parser
20b3e87176 libio: Add test for fopen with an empty ", ccs=" value [BZ #34574]
72351055c6 libio: Fix CVE-2026-18374 heap buffer overflow in ccs= handling
8dad0ee453 alpha: expect test-float32x-float64-div to fail
f024355965 alpha: add the denormal trap enable bit to FE_NOMASK_ENV
c4dac931ab alpha: Fix stack alignment in makecontext
76115597fe alpha: fix setrlimit compat symbol for negative rlim values besides -1
c29ca5d216 iconvdata: Test case for bug 34556, bug 34568
3ad1bbd8f9 iconvdata: EUC_JISX0213 decoding lacks pending character reset (CVE-2026-80489)
138c43f018 iconvdata: SHIFT_JISX0213 decoding lacks pending character reset (CVE-2026-77117)
713998bf00 stdlib: Fix right-justification in strfmon (bug 34510, CVE-2026-19499)
2a35bab35b posix: Remove unnecessary overflow check in wordexp (BZ 34090)
4964178b4d m68k: remove sysdeps/m68k/m680x0/fpu/w_fmod_compat.c (bug 34559)
0afa34adb0 misc: Fix out-of-bounds array write in tdelete (bug 34506)
7d26579873 malloc: Show hugetlb tunable default in --list-tunables
8017bcfc4d m68k: Fix fmod/fmodf infinite recursion (BZ 34508)
a388c4002d posix: Fix wordexp WRDE_APPEND to preserve state on non-NOSPACE errors (BZ 34090, CVE-2026-6368)
bc95068f5f ppc64le: Restore optimized memchr for power10 [BZ #34300]

Testing Results:
+--------------+--------+--------+------+
| Result       | Before | After  | Diff |
+--------------+--------+--------+------+
| PASS         | 6592   | 6598   | +6   |
| XPASS        | 4      | 4      |  0   |
| FAIL         | 127    | 125    | -2   |
| XFAIL        | 16     | 16     |  0   |
| UNSUPPORTED  | 559    | 559    |  0   |
+--------------+--------+--------+------+

Changes in testcases:                     Before   After
malloc/tst-malloc-too-large-malloc-check   FAIL     PASS
malloc/tst-malloc-too-large-mcheck         FAIL     PASS
iconvdata/tst-jisx0213-progress(NEW)         -      PASS
libio/tst-fopen-ccs-empty      (NEW)         -      PASS
posix/tst-wordexp-append       (NEW)         -      PASS
stdlib/tst-strfmon-bug34510    (NEW)         -      PASS

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 meta/recipes-core/glibc/glibc_2.43.bb     | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index cf5a4440956..5f6863df160 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.43/master"
 PV = "2.43+git"
-SRCREV_glibc ?= "1c9988e52540c844928c6d93ff45305adc2c24a0"
+SRCREV_glibc ?= "9cda6fc96abd035d9cbe68482138d4a78a51a7d5"
 SRCREV_localedef ?= "cba02c503d7c853a38ccfb83c57e343ca5ecd7e5"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
diff --git a/meta/recipes-core/glibc/glibc_2.43.bb b/meta/recipes-core/glibc/glibc_2.43.bb
index 5c21223b55f..56942e86dcd 100644
--- a/meta/recipes-core/glibc/glibc_2.43.bb
+++ b/meta/recipes-core/glibc/glibc_2.43.bb
@@ -23,6 +23,7 @@ CVE_STATUS_GROUPS += "CVE_STATUS_STABLE_BACKPORTS"
 CVE_STATUS_STABLE_BACKPORTS = "CVE-2025-15281 CVE-2026-0861 CVE-2026-0915 CVE-2026-4437 CVE-2026-4438 \
     CVE-2026-4046 \
     CVE-2026-5435 CVE-2026-5450 CVE-2026-5928 CVE-2026-6238 CVE-2026-6791 \
+    CVE-2026-6368 CVE-2026-19499 CVE-2026-77117 CVE-2026-80489 CVE-2026-18374 CVE-2026-8674 \
 "
 CVE_STATUS_STABLE_BACKPORTS[status] = "cpe-stable-backport: fix available in used git hash"
 

