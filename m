Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27610C44536
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 16:38:53 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15896.1769013523037330570
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jan 2026 08:38:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=EKs0NNNB;
 spf=pass (domain: snapchat.com, ip: 209.85.221.53, mailfrom: ecordonnier@snapchat.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-435903c4040so4166f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Jan 2026 08:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1769013521; x=1769618321; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MgFOzsp4xDsblNRZ+kmKX7QTjM3apjWTtgenNe2YSAI=;
        b=EKs0NNNBVq7BKTzCQNFl2yZgLxNOSLbxNVwE0gA1ZV6SDCVXOgCgCmw0AQyDR1wzmL
         VLAfB8pLmUXQ1K7THvlQBgABUZKrQS9l4nyu8D0fYGIhS3uL9gOfjtEgZPPi86RMAi8q
         c/t2Gsvl4wN2R06nqnRO3TY33DdwKLvTLapOQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769013521; x=1769618321;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MgFOzsp4xDsblNRZ+kmKX7QTjM3apjWTtgenNe2YSAI=;
        b=CdbtXwRIzeCblvGcKYSs/uXQ/KCx/xUUC8ZB/JMukQey2b2+D6W74FZbI+k9qqdnGv
         UmehVv4cRXg434RXJwy0VcjmoxPZny/QMDbrjcysYmxajKRO4o2iV0Owj3ylns9QE/sS
         BpjE07R/t1VZslGcUP6eyGTp1/53xD4Fhk4sNHQYH8ZVQ97fxJXMYhyCJEBtja5iL+b4
         ACwPuO2omaI328tHui6snkG5pbKLvfXicOj+2WDpnNyl18lL0WkXD/BmVL+/BQ4nPUCq
         EN49ZDNtNbVd3ABqWD4eWn19Uun0DOu9nVl+xJ7fzUbRdtQ0tOZdrjDbZvte/XkwcGX2
         0IBQ==
X-Gm-Message-State: AOJu0YxiwBnnH4YpVNDru53SmoHi91pGnB0ojPDETYMhjtMJcfCxhAmU
	xCWht7zx0RKGH4YYT6K2Qz/gzNc4wURg/c3wJYJtkcD3N/qykzl7GBwLWkmwQRTKkkPBpzXYrYy
	WBWh0JL1XpQtT
X-Gm-Gg: AZuq6aL1uEhBjiF+RqUp8QgGYkL6bEKU6MvXpsuS+ILUQJvOrPVoX5wiDaazzV9Gf+6
	mfJ4ElvQx2osVVhxYsg+UhZ4LAnahwBcorl9F0WzAyjI4cpIIsbNvuBzs529DPqU6gTBaAvU14H
	XRy1VUZs1MYeWEuRBQpeEARYjihgnN/6VB+Ub0Pm/KPFlgqaxDYcPBGWyau/duyRhXdVoB0qLF+
	s5RBKP1nTGjOGhExf0Seg8ClBqDtV5uNivPfwrDWSKenBExWLUkLfVcURGb/+pZR8cpqo+JMF30
	jx83j4RTKkhraxXx+wGvHo5OqP1Vfu8AqBJ/Kb3hKIIwl2vCso7VDysr6O/beQcBfR4gwFPBpel
	gM7o3dBo7w1uhHKxsxrphJFodjaCIJDn/J3t6HgkW/9NgAcYEBB4M0keIkbPwoANDCE1LTE2fHE
	dr7f38XN2c0P4h8jHbD3SDSpsiIqpE4GwytROgJVDjyMHO9X0NEeDNZ+rgg85AVXNkHQ==
X-Received: by 2002:adf:ea88:0:b0:435:8d02:b9d2 with SMTP id ffacd0b85a97d-4358d02c853mr8992591f8f.60.1769013521067;
        Wed, 21 Jan 2026 08:38:41 -0800 (PST)
Received: from lj8k2dq3.sc-core.net ([213.249.125.50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435924ae6f1sm10987986f8f.33.2026.01.21.08.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 08:38:40 -0800 (PST)
From: ecordonnier@snap.com
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [PATCH] gcc: fix patch format
Date: Wed, 21 Jan 2026 17:38:29 +0100
Message-ID: <20260121163829.124179-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Jan 2026 16:38:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229819

From: Etienne Cordonnier <ecordonnier@snap.com>

This is the only gcc patch which doesn't work with git am:

```
git am gcc-15.2.0-r0/sources/*.patch
...
Applying: Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
fatal: empty ident name (for <>) not allowed
```

Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 .../gcc/gcc/0026-fix-pr90579-testcases.patch  | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc/0026-fix-pr90579-testcases.patch b/meta/recipes-devtools/gcc/gcc/0026-fix-pr90579-testcases.patch
index bee147abc1..6ada61b74f 100644
--- a/meta/recipes-devtools/gcc/gcc/0026-fix-pr90579-testcases.patch
+++ b/meta/recipes-devtools/gcc/gcc/0026-fix-pr90579-testcases.patch
@@ -1,3 +1,23 @@
+From 679e24f5a751663998ff7202149a749e0f7251f9 Mon Sep 17 00:00:00 2001
+From: Harish Sadineni <Harish.Sadineni@windriver.com>
+Date: Sun, 10 Aug 2025 20:28:00 +0800
+Subject: [PATCH] testsuite: i386: Fix gcc.target/i386/pr90579.c when PIE is
+ enabled [PR118885]
+
+When gcc build with --enable-deafult-pie the following tests
+were getting failed:
+ FAIL: gcc.target/i386/pr90579.c scan-assembler vaddsd\tr\\+40
+ FAIL: gcc.target/i386/pr90579.c scan-assembler vaddsd\tr\\+32
+ FAIL: gcc.target/i386/pr90579.c scan-assembler vaddsd\tr\\+24
+ FAIL: gcc.target/i386/pr90579.c scan-assembler vaddsd\tr\\+16
+
+    PR target/118885
+
+gcc/testsuite/ChangeLog:
+
+    * gcc.target/i386/pr90579.c: add -fno-pie to dg-options
+    to fix tests when PIE is enabled.
+
 Upstream-Status: Backport [https://gcc.gnu.org/cgit/gcc/commit/?id=679e24f5a751663998ff7202149a749e0f7251f9]
 
 Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
-- 
2.43.0


