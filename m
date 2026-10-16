Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADD24CCF2C1
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 22:24:56 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5939.1792189486559843888
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2026 15:24:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=TLmYlxS2;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-487049569b6so189603f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 15:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792189485; x=1792794285; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DV/dXIQ2ig5IZMxUi3Z7aFRhqGJvl5nQ8iu5CVilAWI=;
        b=TLmYlxS2u6++8BywbaARlguKclzlDYAY/EjdGTgAQstoZ/QSJwEzgMcVYBJjm9wNF4
         MuxfjHuE0UGjd9rC4l87uu2lkVqPl2/3ykXLojbJkMlaXvJOl1VfKhu13ucO1Bkg6lsY
         BpCZGMFsDVwZtdsp/zW7txQTsp2TyeO8F7Jrc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792189485; x=1792794285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=DV/dXIQ2ig5IZMxUi3Z7aFRhqGJvl5nQ8iu5CVilAWI=;
        b=jAsD020RmbukMnT41pOjQdaOlTRdbTfvrlQ+9jWTe/fhNyFUnkXUGGkatYmgV6wPad
         HvwEKqSqZuEAe+Ns/Ny3qoU3OFffSglKb85s0FXnBbR+6+ElTWUgp8dnQuRIr78xU+fT
         j5gV7U/1di8O7yvxiywNCWb1ChXQAfESPp40bE8oSTihaxmPirNqMsG7oCxXUfya2HQD
         f112/xGs7A2VJFNrQXOPVJy7v194OEaYzCGj8F88HwQ83cm2vsfQ+cx873Finqdq0CVo
         TmCHoq5EcsageH08IQ4HXX0UuVIHw5qDbOC0uODzkXBWn1YcoJQRl9tloPqmYPg2sDy2
         ytdw==
X-Gm-Message-State: AFq9FYLhPhWVKV4G8FfO4OoMjc0rHCIuqQ++ekf+W6be8F5I0sCDzYxS
	nDGKJnLcUnx28R7UVcmdOmMksHEV+wEuYz38S+dTj+lT35Yge4k9v4VEf48Q4qGRtJPlfqCt/O0
	ie9y0sEg=
X-Gm-Gg: AYBFou1P2JxMWAE/zf477aMIlirPutEu+DMjb/1fZeZUb5zrZraZ7HqPhgbdfQ7z3Xp
	OhKofWiFSxcuNfeuj7bGhj4Oe2aPwITAssbjq1GHsY45hmV80pwlka6ndR6E0HLSKqx+AYo3OV4
	v8i9yPrBk6TBxV8Jc9AG02aNT31DmFnXACbf72ZIGHfNNi4/qChapRn9BjYMQO5WkjngmqCa5O4
	wAMHI7vYqzCv5ltTNuWe1NnjYOnjLCVD86x1K2xWLyrLpA3uETKB44AyO+/epEokHD9TFdI5AvH
	+ynJkM/R5KwenNsdNaA7jUzcrxJb/QC9GrVo8hsUUBSl69XlTpWRnFYFEfa0nhEFjmux4e9DeOJ
	pE28lGnFV+xsy1WXo4UT8ziCdUBhqpTLvnfnY2SsWcCOa360gd3SMFBhfTwgUXUYzYh6AeciLbN
	32saVQqe1pDD7uwZkUz8rkKjx0V+4KcJkfDrtH4pCD2ujQUAdkBZ/1skD/BUZSp1NUEcXCludXU
	Q6qHqaUoJYiv3TEhaFH9eN/Vo0ZHKbfyvkVao2OHJ6t0KrzzOt2Ii7e9z1lCghClTlr0IdCwe0o
	/CRlUKGK
X-Received: by 2002:a5d:4e05:0:b0:48d:f855:d1e0 with SMTP id ffacd0b85a97d-48e07fc2061mr1333862f8f.57.1792189484572;
        Fri, 16 Oct 2026 15:24:44 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd503862sm7639515f8f.46.2026.10.16.15.24.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 15:24:44 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 08/17] glibc: stable 2.44 branch updates to 34106fee69
Date: Sat, 17 Oct 2026 00:24:10 +0200
Message-ID: <1237ff69778e8fcbb8fb5482bc74ef802cff7168.1792189264.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792189264.git.yoann.congal@smile.fr>
References: <cover.1792189264.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 22:24:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248058

From: Peter Marko <peter.marko@siemens.com>

Update SRCREV to pull the latest fixes from the upstream
release/2.44/master branch, including fixes for the following CVEs:

CVE-2026-18374 CVE-2026-8674 CVE-2026-86805 CVE-2026-89092
CVE-2026-95818 CVE-2026-97399

Also mark following CVEs are fixed as they have been included in
previous hash already:

cb61572ea3 iconvdata: EUC_JISX0213 decoding lacks pending character reset (CVE-2026-80489)
6f9b2bfa50 iconvdata: SHIFT_JISX0213 decoding lacks pending character reset (CVE-2026-77117)
[CVE-2026-19499] e88b9f0e5c stdio-common: Convert vfprintf and related functions to buffers

Commits between the old SRCREV (5c479454d1) and the new SRCREV (34106fee69):

34106fee69 powerpc: Fix one byte overread in strncasecmp (bug 34683, CVE-2026-97399)
07dc0a64a3 realloc: Fix mmap non-mremap reallocation case [BZ #34697]
c90398e005 CVE-2026-89092: nscd: replace alloca with malloc in aicache, hstcache
67dd5150c6 LoongArch: Add standard search paths for 32-bit
2ee4e25c97 LoongArch: Support pointer guard on LoongArch32
6dea23eeac LoongArch: Fix intermittent nptl/tst-cancel32 failure
13fd9fe7df Revert "posix: Add POSIX aliases to some spawn functions" (BZ 34437)
1848099f06 stdlib: Don't call clearenv from __libc_setenv_freemem
[CVE-2026-86805,CVE-2026-95818] 6b48c0b29c elf: Open the normalized $ORIGIN rpath in AT_SECURE programs (BZ 34360)
1f50262410 resolv: Fix assertion failure on search list truncation [BZ 31026, CVE-2026-8674]
e01330dcec fcntl: drop nonnull attribute for openat, openat2's path argument [BZ #34313]
e58294a5a7 io: drop nonnull attribute for fchmodat, faccessat, fchownat's path argument [BZ #34313]
d7179269b7 Revert "io: drop nonnull attribute for fchmodat, faccessat, fchownat's path argument [BZ #34313]"
d19791b12a x86-64: Link tst-shstk-legacy-1{f,g} with -Wl,--no-as-needed
b14c4b0bc9 io: drop nonnull attribute for fchmodat, faccessat, fchownat's path argument [BZ #34313]
b84047b5b7 elf: Do not load cache extensions from an old-format ld.so.cache [BZ #34600]
b4f51887c4 nptl: Skip pretty-printer tests without python3 [BZ #34507]
30950ce64d libio: Add test for fopen with an empty ", ccs=" value [BZ #34574]
0b4e41fc51 libio: Fix CVE-2026-18374 heap buffer overflow in ccs= handling

Testing Results:
+--------------+--------+--------+------+
| Result       | Before | After  | Diff |
+--------------+--------+--------+------+
| PASS         | 6029   | 6031   | +2   |
| FAIL         | 76     | 74     | -2   |
| XFAIL        | 16     | 16     |  0   |
| UNSUPPORTED  | 587    | 589    | +2   |
+--------------+--------+--------+------+

Changes in testcases:                            Before   After
elf/tst-dl-cache-old-format                       ---     UNSUPPORTED
elf/tst-origin-secure                             ---     UNSUPPORTED
malloc/tst-malloc-tcache-leak-malloc-largetcache  FAIL    PASS
malloc/tst-malloc-too-large-malloc-check          FAIL    PASS
malloc/tst-mallocfork3-malloc-largetcache         FAIL    PASS
posix/tst-regcomp-truncated                       PASS    FAIL

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: b3534113dd2dc47d3f45e66ba59f19d30f16f18b)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 meta/recipes-core/glibc/glibc_2.44.bb     | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index b9a45392772..2fb355a29bd 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.44/master"
 PV = "2.44+git"
-SRCREV_glibc ?= "5c479454d1232f71c78fa21584e90a2f57883407"
+SRCREV_glibc ?= "34106fee698c83eb0af71d4d0381e66b399be746"
 SRCREV_localedef ?= "cba02c503d7c853a38ccfb83c57e343ca5ecd7e5"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
diff --git a/meta/recipes-core/glibc/glibc_2.44.bb b/meta/recipes-core/glibc/glibc_2.44.bb
index d547f595abf..886a15f1572 100644
--- a/meta/recipes-core/glibc/glibc_2.44.bb
+++ b/meta/recipes-core/glibc/glibc_2.44.bb
@@ -22,7 +22,8 @@ CVE_STATUS[CVE-2025-0577] = "not-applicable-platform: specific to RHEL patches"
 # when upgrading, clear CVE list but keep the variables
 CVE_STATUS_GROUPS += "CVE_STATUS_STABLE_BACKPORTS"
 CVE_STATUS_STABLE_BACKPORTS = "\
-    CVE-2026-5435 CVE-2026-19542 \
+    CVE-2026-5435 CVE-2026-19542 CVE-2026-18374 CVE-2026-19499 CVE-2026-77117 CVE-2026-80489 \
+    CVE-2026-8674 CVE-2026-86805 CVE-2026-89092 CVE-2026-95818 CVE-2026-97399 \
 "
 CVE_STATUS_STABLE_BACKPORTS[status] = "cpe-stable-backport: fix available in used git hash"
 

