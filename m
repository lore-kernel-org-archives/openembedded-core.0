Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C107FE6E7E6
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 10:19:34 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13486.1770113970654341009
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Feb 2026 02:19:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=alm+U5C1;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-435a11957f6so4228410f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 02:19:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770113969; x=1770718769; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y6Spzk7r+/ZPe8BJaSqxqZ+Z5LTsQ7ZNbAfkct6fYBs=;
        b=alm+U5C17YNZuI4ueQ7ZQHUNwMpHbasPf4/3BZmZKjuypBi5q7tyMJ7OGVEAE8BBQy
         suc7R4Zyx65FWTMP3o2SVKLDQm/W3Z/v17Mr1fRjIbtakBHhL6gQhGcbIPbkCqOfMXWz
         SkRFarcXCGBkQBBUtuVNxbCCuMNhfc+3AUcqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770113969; x=1770718769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y6Spzk7r+/ZPe8BJaSqxqZ+Z5LTsQ7ZNbAfkct6fYBs=;
        b=Vqpdv7PhmRQQQzmhYRV8UEo20+qMJoW/UUkCruJOc7hDtSV7gbfk8kBHuycDwSTYpo
         i/GuyX/TCX4SbBZpaIV4vmPud/GL4jJFWlI6MDmcda3EnbH1zPQbd9heQHH8eknNq+Gl
         P3SakdsbBt5se+a00k1WdHopw+lZ/fEt0wRCybLITq9nUHPlZ+qPFhZb2QwpFptTFQAb
         m7JvGDUtlgn8prmO7Uq8HvnnD2N7hxwNqAyjy20CcSvO4g0uT6CWXXIiN0zGyQicT7F1
         PYEuPBriac884HrrLCo1bT1E9+1MYFp9uvQCv5f+XitoRG+brhlp3KyBgXDfNyyx3/Dd
         38Dw==
X-Gm-Message-State: AOJu0YyWPsSidINH4iY/hpZRBsJbwI45kXzd8oGFo3FYr+TZgFqMHt8d
	vdVBCTFrcCQYEDmpBeCnnIsvGCDlcoXSJ4uI27+Bec6Tl2RvwBEhAPYYuFfdD4TCmoIkc4DkzcM
	lo9USUsc=
X-Gm-Gg: AZuq6aLzMj2oW/10Hf6qxDXMTb4sPlqUjRucSaSwqCXWOqDpebmwnoXxCjs/h4lrLX3
	1NvpScNJsgNy1D/GPqA4lywyJTHWSAvmhq6yqi3zHwvBzrRNuB1+TSEwt6E1Ab92CamQfyAZzed
	4ReWofiXTAs7u8TASLR56TVNrU+rA6oRSAOib1gtcqK3pCjZ94nAk0n9dJOYWcZNJyGXANKA8ZH
	7VIu1YBFJqt8lmIPrLCpiw5fs9sX5TsVqfLN04Yo56tDmLuoISOAnePoDoKU+gUT7FZoeCsuQTR
	+Zf5Lf/FQ9IJzy3MaaUvCl0vPyglLsQw7fhOT/5oIB4XPzVe/pJ9YwAT3RWofdRydvelff0SRuX
	tbO9xaalTHl58eVt6dZpSOnZEMx16dSg+U78t66mIXnXuGNNb/e2USg1iUB9QCksCRPdhkIjQSx
	NKAo5SiNgl2mCmSlt88CGAnQyo7U51kXJIyhlS4uxErwqUlL/qFkXo8GZcdDo61lY1b9+++syop
	mIvMMuCyP9KVYw=
X-Received: by 2002:adf:ef09:0:b0:436:145a:e55b with SMTP id ffacd0b85a97d-436145ae73cmr1195696f8f.19.1770113968667;
        Tue, 03 Feb 2026 02:19:28 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131ce70sm52293041f8f.27.2026.02.03.02.19.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 02:19:28 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter v2 09/22] glibc: stable 2.42 branch updates
Date: Tue,  3 Feb 2026 11:16:38 +0100
Message-ID: <0c942cc1ddf64bf796c7e8a36be98c3d0f224bc0.1770109549.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1770109549.git.yoann.congal@smile.fr>
References: <cover.1770109549.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 10:19:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230437

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

