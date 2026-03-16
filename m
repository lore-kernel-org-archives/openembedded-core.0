Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AE04F4643A
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 09:30:20 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46603.1773653409170073670
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Mar 2026 02:30:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Xw1vJPas;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48534237460so48097225e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 02:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1773653407; x=1774258207; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZzODoNZ0LEZvb5agjHiAOyVWWEDQjCSSibFFO1d+rrg=;
        b=Xw1vJPaspr2/HiSpSwGwWIJLPMziR1okVyWVZPb8EV9kb6V+bJjd/DCSUTijxTZHjv
         w0/lggYWlbAcR4GGD3E8t2/KY8gHfqyjE8aorogWg/drLv/JgS8oX+lt5jmdarWLoE3K
         jj6lcroNVpztUWZxxyvdvIvDDEt7aNfpJe70g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773653407; x=1774258207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZzODoNZ0LEZvb5agjHiAOyVWWEDQjCSSibFFO1d+rrg=;
        b=l33U6gH1tQ7TybJP4K7/VMGVa1fq4UWCH1ovMBT8lcAVpSirjXZUGgnfYk7JOSqhO5
         VXhdLktaKJFieId4FtQzd3Y5r/rgtHfeZaKE15dQstInjiFQnajE59Wzb1NY9eKbJ8Yg
         UJ+nUMzeSbiHrDpjrzGMR1hSXv0xBhREnwOUkuZs07qiAO+PhQqEcR3oej3BP1Rn3NkJ
         lKPIc9vZNxzM82fAzNgpOo5EK+LP2PR9ferA/NTMqkFck2FumiRL1LekJMuCqgazEAs/
         T7LCHPmsa+28r2FnQeeDfb0ZGVLztpOlUFDI1NxVlFAGjzKpWHCf5tocPwyaS2cRCVcT
         QU4Q==
X-Gm-Message-State: AOJu0YwQulY8ZJL34fcxk9uoCQADB+S3oefjbuPAoPtclWXGEJ95FMPG
	q+P5yg7QjPlZJVLRIfFguPjpz44uVwxe56e+e6dkNTP5Lg1ek+PXmEZ9IG+9qI8kFm0KSyUoBz9
	c2mjF
X-Gm-Gg: ATEYQzzcEpqBOKR3toxuMcv2ahhopgVa1wbHet1OVa27WRcmT1lZkhV3HVTQ2c6pp85
	DcHmEUD0U+YY0x6lpWqvPVL3N0Lb0EqxDQwb6apV6ZLCpmJkIF8svPfEay+QFbWAkM6ppdx/poH
	Dkxo25inMXiT3KYW7eCWVZwH+B/Vnp7EZHJ68OoZyOM9Cx9vtypt1ZZAliNN8C+n98pCsfqPGQm
	ebyJurLJkePI9oDgYZNtL86u//C4y6OuvQROOnkAJ0EBPjI+TOXZhnQE2UjOFR2IDBLhhdg08Pt
	ZdXoEc9r/3voXNOJ138rncnmOOIO5dVw0WtD+uZAlSHi3T2tj5mS0UTRb/Kq1KNPaFziUzrXEPr
	+q71avR3k1ElNMoSfvUeldwLfY9hbLz0+VkyXoJvYak5k1E966gMLRJl7UhFoEnC2kt3EvelEEL
	wuhDjlqRumBYAUVEFHf+eoXZUrnWbSNEoy5vwsA8x+ShvFRz3cn+lFtLYUsURON4TLzQZAC5y9O
	MTOo/ksa+z8/vGt4BBjVd61V4uJvBQUog==
X-Received: by 2002:a05:600c:81c5:b0:485:3812:36da with SMTP id 5b1f17b1804b1-485566cf00bmr184965645e9.9.1773653407137;
        Mon, 16 Mar 2026 02:30:07 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48557a732cesm91138265e9.12.2026.03.16.02.30.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 02:30:06 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/17] tiff: patch CVE-2025-61144
Date: Mon, 16 Mar 2026 10:28:27 +0100
Message-ID: <017b7ae54e55e24777a9b6033032911701b19b62.1773652940.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773652940.git.yoann.congal@smile.fr>
References: <cover.1773652940.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 09:30:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233230

From: Peter Marko <peter.marko@siemens.com>

Pick patch from merge request mentioned in NVD report.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libtiff/tiff/CVE-2025-61144.patch         | 27 +++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2025-61144.patch

diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2025-61144.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2025-61144.patch
new file mode 100644
index 00000000000..8b25cdfab9e
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2025-61144.patch
@@ -0,0 +1,27 @@
+From 88cf9dbb48f6e172629795ecffae35d5052f68aa Mon Sep 17 00:00:00 2001
+From: Lee Howard <faxguy@howardsilvan.com>
+Date: Fri, 5 Sep 2025 21:46:03 +0000
+Subject: [PATCH] tiffcrop: avoid buffer overflow
+
+Fixes #740
+
+CVE: CVE-2025-61144
+Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/88cf9dbb48f6e172629795ecffae35d5052f68aa]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ tools/tiffcrop.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
+index ae414efc..afa1cce5 100644
+--- a/tools/tiffcrop.c
++++ b/tools/tiffcrop.c
+@@ -3913,7 +3913,7 @@ combineSeparateSamplesBytes (unsigned char *srcbuffs[], unsigned char *out,
+     {
+     if ((dumpfile != NULL) && (level == 2))
+       {
+-      for (s = 0; s < spp; s++)
++      for (s = 0; (s < spp) && (s < MAX_SAMPLES); s++)
+         {
+         dump_info (dumpfile, format, "combineSeparateSamplesBytes","Input data, Sample %"PRIu16, s);
+         dump_buffer(dumpfile, format, 1, cols, row, srcbuffs[s] + (row * src_rowsize));
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
index 4c2b0a800b4..02fc956c232 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
@@ -66,6 +66,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2025-8961.patch \
            file://CVE-2025-9165.patch \
            file://CVE-2025-61143.patch \
+           file://CVE-2025-61144.patch \
            "
 
 SRC_URI[sha256sum] = "0e46e5acb087ce7d1ac53cf4f56a09b221537fc86dfc5daaad1c2e89e1b37ac8"

