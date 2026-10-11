Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E80FCA9ED4
	for <webhook@archiver.kernel.org>; Sun, 11 Oct 2026 08:41:29 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23443.1791708081497145950
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 01:41:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Vec/XnK1;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a020e65269so5686745e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 01:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791708080; x=1792312880; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FdgPesECK4bbr5VoRuG9us7SakLJBFLJUF63ZYc8plo=;
        b=Vec/XnK1Adu4v88YpUGV9quBdQ+5bDB7BNEua2S72hA4md40RFwmH894CCoIssFWyI
         ZndKEHEq82ZjEIctnYaRMI2i2BC/mUjp6IxYaKZy4BpIsQTwmcfBmiipGsp6IkUKPgRG
         UcFLkvOEMdE8rgLaB9fnoJmk+FLUEYnj3ei3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791708080; x=1792312880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FdgPesECK4bbr5VoRuG9us7SakLJBFLJUF63ZYc8plo=;
        b=KiR+Fj+v2a/VghT34TchZoMKKzH/TBxsmGPgzIx3EzdiPLwbmPkVJxenhZ/lYpEFgS
         X7SOu7ew8eK2HKbxrtKkHSI+rlWcVPo0u9YkY054ps0Y9G0z3gyPXgYHlsst4Dqm3tg9
         QCn6QjjeR5BRoFil4DffhCk1gXl1CbexXtB50OdFrEegmnLNV6U8nqgBFBqG4qTyDwdt
         ukiRyW202WbhEmcrEOhfVZD3ljtm7ZcbhCHk2vIWyl/nbcz2HH2sOJq//1ZXhP/teTH5
         4WP37SiMMyp8b6y0ZAEw03xK9zwIfYs606dL3hHX4Q32j40A+btKUudCpWwwpMz3F1Z+
         iTPA==
X-Gm-Message-State: AFq9FYJq7Er8SxqDFXbFfv8uykeKhr3ar/jQ1CaI8JOGEwrxh5ztpO4x
	tkCX3m7GAy8N9A742h9hTQcANKw83StCQC5fUl2row/8SK0v345AmW2Fkh6T2wFWH9PiXGvlfRW
	MLBHtls4=
X-Gm-Gg: AYBFou2ngI4zro1Fetw237Ibj2Jgj85Ysy3gT8rC7zQWVqUxgida+SMvGhuFbjdXDkj
	97qom9IhYkGv9NYlSGmKD7+sCyUtrft/bIPjmaLpjb9gE7QxlIdQmci6A+LMlGIxQxyjbn1f6ne
	9xpzZWoJbIvG/fKGyitmc8Uw5clh/VANehSQOGWGoJ66Njf98B65/NAtkkQI9XQt/t2BSTPUuNh
	2y41n+GFoP9BcaRGF/HpD/iG+mHdss7OANVQ+n3i99gPWKykyKQHuRNQnDvSyuSXihhsnNX34Bl
	0hORlDhJHS/4QTtLOCSbMuuq4JGcaoHfcCjEb1T4coHj8zh8Fb3KIZIOCBU+hojbPSZOYjthliU
	NITi0MgBfeyBoCSsFTbxKQSQTnOZbDc13xrdKmPkMHau4G33pDkyGOhSp/MwUtZNZ/jG3VwqHCY
	8cmQLFY5IzV3k64TZKFD2M/ZumY0UChtKJqo2z/PP4DpaqfOVQIwMSEMv3aUaebv3MIUsVttTSV
	iNc2sYK4yw2uwQDZLM6bdhEbiVlWu7wUFe5FrAiuQgHwvlo9zKaceRZ4FrUjPKmaZ73V8iCTA==
X-Received: by 2002:a05:600c:3541:b0:4a0:2488:71cc with SMTP id 5b1f17b1804b1-4a18e4e9ee8mr108838965e9.32.1791708079599;
        Sun, 11 Oct 2026 01:41:19 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9acfa28sm13481734f8f.51.2026.10.11.01.41.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 01:41:19 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 29/60] glibc: stable 2.43 branch updates to 562cd7badd
Date: Sun, 11 Oct 2026 10:40:02 +0200
Message-ID: <98ff1c9d3e272a1773775211b0d7dc4c20b28f8b.1791707817.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791707817.git.yoann.congal@smile.fr>
References: <cover.1791707817.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 08:41:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247538

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Update SRCREV to pull the latest fixes from the upstream
release/2.43/master branch, including fixes for the following CVEs:

CVE-2026-89092 CVE-2026-97399

Commits between the old SRCREV (9cda6fc96ab) and the new SRCREV (562cd7badd):

562cd7badd powerpc: Fix one byte overread in strncasecmp (bug 34683, CVE-2026-97399)
533e1c955c elf: Open the normalized $ORIGIN rpath in AT_SECURE programs (BZ 34360)
8305f5b8fa realloc: Fix mmap non-mremap reallocation case [BZ #34697]
e51efbc44f CVE-2026-89092: nscd: replace alloca with malloc in aicache, hstcache

Testing Results:
+--------------+--------+--------+------+
| Result       | Before | After  | Diff |
+--------------+--------+--------+------+
| PASS         | 6601   | 6601   | +0   |
| XPASS        | 4      | 4      |  0   |
| FAIL         | 142    | 143    | +1   |
| XFAIL        | 16     | 16     |  0   |
| UNSUPPORTED  | 559    | 560    | +1   |
+--------------+--------+--------+------+

Changes in testcases:                     Before   After
elf/tst-dl-path-normalize                  ---     PASS
elf/tst-origin-secure                      ---     UNSUPPORTED
malloc/tst-malloc-too-large-malloc-check   PASS    FAIL

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
[YC: CVE-2026-19542 was fixed before this patch in the 2.43 branch ]
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 meta/recipes-core/glibc/glibc_2.43.bb     | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 5f6863df160..e8e6bb665ae 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.43/master"
 PV = "2.43+git"
-SRCREV_glibc ?= "9cda6fc96abd035d9cbe68482138d4a78a51a7d5"
+SRCREV_glibc ?= "562cd7badd3f9edd74b68316439f910f6f7c4c1f"
 SRCREV_localedef ?= "cba02c503d7c853a38ccfb83c57e343ca5ecd7e5"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
diff --git a/meta/recipes-core/glibc/glibc_2.43.bb b/meta/recipes-core/glibc/glibc_2.43.bb
index 56942e86dcd..3d642e6738d 100644
--- a/meta/recipes-core/glibc/glibc_2.43.bb
+++ b/meta/recipes-core/glibc/glibc_2.43.bb
@@ -24,6 +24,7 @@ CVE_STATUS_STABLE_BACKPORTS = "CVE-2025-15281 CVE-2026-0861 CVE-2026-0915 CVE-20
     CVE-2026-4046 \
     CVE-2026-5435 CVE-2026-5450 CVE-2026-5928 CVE-2026-6238 CVE-2026-6791 \
     CVE-2026-6368 CVE-2026-19499 CVE-2026-77117 CVE-2026-80489 CVE-2026-18374 CVE-2026-8674 \
+    CVE-2026-89092 CVE-2026-97399 CVE-2026-19542 \
 "
 CVE_STATUS_STABLE_BACKPORTS[status] = "cpe-stable-backport: fix available in used git hash"
 

