Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FFC3CCF2C9
	for <webhook@archiver.kernel.org>; Sun, 18 Oct 2026 22:36:54 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23093.1792363012067111585
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Oct 2026 15:36:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=aYPpuNiR;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e9cf928dc9so3386875ad.0
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Oct 2026 15:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792363011; x=1792967811; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZEDObkTXZcz5vRkArTf+ZE0JALS1AI3xFz4fvVmBSzE=;
        b=aYPpuNiR0qkj92ay3lkW24FhFWIFk/oYBBeRgKwYOdmzyZ8bsNql8BLMMwyTAEgppn
         TArSPbE3sj1/yLHF9hDTfVpdOgXLIi3NCUrXYH+IdSr6E99Oc5gLLmy+zJ7Opiqv2VAV
         X8N+KoMHkyGSTfLgQwR4ZyB7hEcuNKMv7YNQR95OIP3aocYmiOhlqbRm+nAQsyF/xyOk
         8Ng0yy0syEHBfXRHvQ7fCsASU95gcHSOI1kbY9JZlVIPejZnHdfmDC2ZNWJpyavReC+h
         fZ/y0zAAs37iX/tvne7pj75sG6CamTjG2ZIWtCGQuRv4Nl334Ix4Owa1fg+6lLMGBGo7
         EpUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792363011; x=1792967811;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZEDObkTXZcz5vRkArTf+ZE0JALS1AI3xFz4fvVmBSzE=;
        b=knB+qKWtS1YJMQiXyStso3JSW9nQq6It9ZQcghZTiTdZYv9nZHt17yDy8+AdFeqpBe
         Jnwl8QnyH82yfge35+Flp3nTieCCl/BtbwtS4EuwP+pVq3imbczKjqvTzZazHop/hGPw
         N3c286Q0KqHdS3upTNlyu1TIHvuJXLm7p/HlmeksQ7VPj5Ruy+s9YoiYL/ycjG3+A8NI
         hMJY7qoxB0J7jysDY9+7QDdEu+ZtgWhpPQse/fGg7UUose5R/imBkr8XRuEjfUdQc/ko
         Mq/DzeHoAJqJFuQKt7iT2oIJ9ywDR5lRFXZFqrRIP/7T5o2uoXHGAUopXASBmNsct/O8
         TOrg==
X-Gm-Message-State: AFq9FYKKs4rrA1LqREQerXrmQk8Qpktb4rLdpq7JOQyljIyfVEaBNNkV
	wZ279hLodU+rXsnp8wVE/uiGj9d+JYoqu2nMDD4MuD0BM3CALsOezeV97CVeEg==
X-Gm-Gg: AYBFou1M2fJDIAZ+UkF0irqMIdwNqcWwxrCs4/Vj546ApBtCnsF7RrCnn4MuhJ7ejOA
	1XhlRNEkDlCw3na6BcmEEE4SxDPaLsX4R7Qoi0VG7wXDXbbjUfx8IOjhabHi1bEp7xEyTlzHu7A
	U9Bh2qt1uFHcv6Eq8q3dxRDpLuzSgpnLDKi3St44AiJmlm6EmNWTLUXpibrUfI9Qu2IL3MC0dlC
	JBt0LQOrv7pyCgL+x1oqTISIxh0NOh+wxFTbMSjgiYUMfPv58nx5r/y69ptwybfbMNCEDPDUZ0X
	jh3A7leG3GBuGMn5E3S8IWCa4vvyp55vfBUnou0QcaykPKMS5tlIqCX4hJQt7m4qjOil8buNSNA
	Ys1YjmUE0uozomDPQb64KuLwFWZp/chyQ2VU0kbYzsbT4DhDcD81AZ5NYg8ecCWKXwvYgTlUmb1
	i7wUxbgL2ZovirlJXos3xBBRXuNb7ehDL1fFeH2ytdnJ12ogyEuHV5/l6oWTuv5PHUZDXNOsFqO
	ZUMl8mGqAH+4htjrIXm80/gQvM4RGPUud+7dZ8=
X-Received: by 2002:a17:90a:c885:b0:3ab:b764:8256 with SMTP id 98e67ed59e1d1-3acef13517cmr3459525a91.17.1792363011109;
        Sun, 18 Oct 2026 15:36:51 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac940055f5sm17875989a91.0.2026.10.18.15.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 15:36:50 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][PATCH 1/5] sqlite3: upgrade 3.54.0 -> 3.54.1
Date: Mon, 19 Oct 2026 11:36:39 +1300
Message-ID: <20261018223644.291257-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 Oct 2026 22:36:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248110

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://www.sqlite.org/releaselog/3_54_1.html

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../sqlite/{sqlite3_3.54.0.bb => sqlite3_3.54.1.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.54.0.bb => sqlite3_3.54.1.bb} (97%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.54.0.bb b/meta/recipes-support/sqlite/sqlite3_3.54.1.bb
similarity index 97%
rename from meta/recipes-support/sqlite/sqlite3_3.54.0.bb
rename to meta/recipes-support/sqlite/sqlite3_3.54.1.bb
index 96c9d76558..681b8e1e20 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.54.0.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.54.1.bb
@@ -22,7 +22,7 @@ B = "${WORKDIR}/build"
 SRC_URI = "http://www.sqlite.org/2026/sqlite-autoconf-${SQLITE_PV}.tar.gz"
 SRC_URI += "file://0001-Add-option-to-disable-zlib.patch"
 
-SRC_URI[sha256sum] = "134ec0802dda5795816e25d25872d20b312cb3973438c49b30bc40b7705ea9ed"
+SRC_URI[sha256sum] = "926ef8d3eab93fbf6e06011901273eec076b25594a4e1cdadd50c987f4f6d64e"
 
 UPSTREAM_CHECK_URI = "http://www.sqlite.org/"
 UPSTREAM_CHECK_REGEX = "releaselog/(?P<pver>(\d+[\.\-_]*)+)\.html"

