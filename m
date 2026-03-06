Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7819F01810
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 07:23:10 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.64691.1772781790211904019
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 23:23:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=TE+khRcd;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4806ce0f97bso77951005e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 23:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1772781788; x=1773386588; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b2VJvrdz5xeANJHnx1vxIlPoImSYTd+5/ifwSVg7OhE=;
        b=TE+khRcd0ER0esiluftVREHU05QjDtvXA4KFGeSCjdn8z+7gGaejjLdWgVDFQhq8FK
         /99N4RbfeX2eIF2H8Tnuejq/u68Ewaebg76mtbI/6Q8KLi3XXjjYP8pRX38roovkJBYX
         7pnK4QGU1PULKohaxePzzIV5HBNGs7XV28/yU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772781788; x=1773386588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b2VJvrdz5xeANJHnx1vxIlPoImSYTd+5/ifwSVg7OhE=;
        b=bEj54+Tvo4WJk84OHQFZFyLbMkOWvbpu1Q1MzsgVfJiqjT2t7OV4nipPNmmsb4kHzS
         P4gatUi1uNScwG1cl8j1xKmFd0h0w/ekHiEOzE8/S9FcJG0R9+D+bgenQMv0gi4vGtWv
         e4zLQ32h4SVLunYvUfLzsV6gpXeE0rXeOlQ1cE0/sI95ZfIrPENdYJT5SLt5DeaC3Ulm
         /nOGcWZvkHoHnZ7DbIRw8TPzaObg0JdiEdS6Wz/n8cvvGsovW1nye5xm8iLUL31mHySK
         aWH5ela3aaPVlfrE1gPfhBvXxdtfl8uG75h1NT56bex5YrncQMb5xQaHfFkDbX2FwuEo
         StfA==
X-Gm-Message-State: AOJu0YxW0/aWPIgOCJTyV4R5zoRkbw+lbPK61Q9+yFBZqU2PAs2ApjvJ
	wj9fgpYPvMu5LRfdXDWZ9/cmiJRUsnCiCQn4A/WF6eeQJMToEwqaR1hQ+bQgUJkK39i+C1yOHfJ
	p/Mjv
X-Gm-Gg: ATEYQzzEqmCXHGmdCbm0aDxWSTXmXa9n+SGVJx/y8ELtRC4tl9YDFhO+Tw1Vds5yC6v
	ar8ty1OqONRZHPrU/WCaCUntZ0acwMpScYLKA2jlj/sYKYD5077YbSrS9UlLq0GtISICY6h54wg
	KIvkfIT2hJGz4GpmmWCDgNBNIa/zpuW56iJt2wI5PIVCNI8dYAhbCx/2J+5zOM9UIqCTz+5e0v1
	Ha7v2g6Y6h2BIr8bzEpohzMyNaNm5GlEs5V0A/8Cuk2pKVPhSe2tlodfCCarXCNwt/hj3MF0zpn
	wAFjB/5MJ3lpfenjhKwDox+wLWMPktL1XihFXpNqFkHfqJlyJMtLA1UISK5Ew1bVKQfhfC4IH4C
	79RoOzRXn1f5sTIzR/F0DZ1cLk59mvdw303AYdEVP6exAlSwDCl90SldYJZZ9W1Cjb8M+Qnprya
	g6dF0VC+Im6NxoQlvP/XjBzylJufGlxibzzrf9N8bduBKVWvT6PiI6Qy/M095D/2GnSknIW4CpK
	em1JiBnGxSxEHgYxyakkr0mrZTk
X-Received: by 2002:a05:600c:620b:b0:483:6a8d:b2fc with SMTP id 5b1f17b1804b1-4852691c73dmr14843665e9.8.1772781788188;
        Thu, 05 Mar 2026 23:23:08 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00bdeac353f6fa5aa8.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bdea:c353:f6fa:5aa8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485276b09casm23106445e9.11.2026.03.05.23.23.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 23:23:07 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter v2 15/16] lz4: Remove a reference to the rejected CVE-2025-62813
Date: Fri,  6 Mar 2026 08:22:15 +0100
Message-ID: <0e59e9fdfda1907738ce8d9d90c34c55e6f27a24.1772780989.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772780989.git.yoann.congal@smile.fr>
References: <cover.1772780989.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 07:23:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232554

From: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>

The CVE-2025-62813 is rejected so do not reference it anymore.
So keep the patch but without referencing the CVE identifier.

The CVE database indicates the following reason:
  This candidate was withdrawn by its CNA. Further investigation
  showed that it was not a security issue.

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9c840a69b62a5fdffb3679a44d68dd5630b2916c)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../lz4/{CVE-2025-62813.patch => fix-null-error-handling.patch} | 1 -
 meta/recipes-support/lz4/lz4_1.10.0.bb                          | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-support/lz4/lz4/{CVE-2025-62813.patch => fix-null-error-handling.patch} (99%)

diff --git a/meta/recipes-support/lz4/lz4/CVE-2025-62813.patch b/meta/recipes-support/lz4/lz4/fix-null-error-handling.patch
similarity index 99%
rename from meta/recipes-support/lz4/lz4/CVE-2025-62813.patch
rename to meta/recipes-support/lz4/lz4/fix-null-error-handling.patch
index 4fa0373ff77..1527cc75912 100644
--- a/meta/recipes-support/lz4/lz4/CVE-2025-62813.patch
+++ b/meta/recipes-support/lz4/lz4/fix-null-error-handling.patch
@@ -4,7 +4,6 @@ Date: Mon, 31 Mar 2025 20:48:52 +0200
 Subject: [PATCH] fix(null) : improve error handlings when passing a null
  pointer to some functions from lz4frame
 
-CVE: CVE-2025-62813
 Upstream-Status: Backport [https://github.com/lz4/lz4/commit/f64efec011c058bd70348576438abac222fe6c82]
 Signed-off-by: Peter Marko <peter.marko@siemens.com>
 ---
diff --git a/meta/recipes-support/lz4/lz4_1.10.0.bb b/meta/recipes-support/lz4/lz4_1.10.0.bb
index f2a86036b56..fae5796c2b9 100644
--- a/meta/recipes-support/lz4/lz4_1.10.0.bb
+++ b/meta/recipes-support/lz4/lz4_1.10.0.bb
@@ -15,7 +15,7 @@ SRCREV = "ebb370ca83af193212df4dcbadcc5d87bc0de2f0"
 SRC_URI = "git://github.com/lz4/lz4.git;branch=release;protocol=https \
            file://reproducibility.patch \
            file://run-ptest \
-           file://CVE-2025-62813.patch \
+           file://fix-null-error-handling.patch \
 "
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
 

