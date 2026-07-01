Return-Path: <anna-lena.marx@inovex.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E1F9C43458
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 10:00:58 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41144.1782900052255187894
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2026 03:00:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@inovex.de header.s=google header.b=En1nQt0w;
 spf=pass (domain: inovex.de, ip: 209.85.221.50, mailfrom: anna-lena.marx@inovex.de)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-471eee9b7d5so102314f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2026 03:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inovex.de; s=google; t=1782900050; x=1783504850; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6mRljbJaYRq0YY1Rkjv7MdZ7IBAuF38FRBjJ9PvU3UA=;
        b=En1nQt0wZYalgNW31SRglsWXlYAw5MFLq/5qbXnHLfMYImPMP47OfO5Xv7vdd3wWfd
         ZVAwEjPMErxg2qELPUODfIkaxgMtmxnHEtNRCChg0L6z33w+13lyiWiQsKfHPfj7SW0I
         dqAxcwe1PHD3EmBIgzyA151xnEmKqwWxPW/xfPPjvDWdBn42zwhrV8s0AsOyS2um0hWL
         M6ujOkSLVyTOh7JcW1uf60InYa4hCfRcbTGf2zLar0HWkiPCW653xLzIWOqZAD/K1DR5
         DtF9WzxKSyQkLMcUu3jtPu14Wjn6HNDJ2bzoXnKa4iGqwhJlaiygAcyuCJixR3CDKsyX
         gUsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782900050; x=1783504850;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6mRljbJaYRq0YY1Rkjv7MdZ7IBAuF38FRBjJ9PvU3UA=;
        b=m27g2bsCtpJ8XZxy6WtCgPQS6nkN+RmOPq+wL+pwZprltTJzyWVGEokgPSbLCVGdms
         AZvqyNmH4PntpaOcgy/Me5daKsUa4hsgK/HO8Up+V67B67iFvhxHNm6Vqdz8cWX2o1O4
         wxc6OuwVGlNCZgY+2hd6I51oBVHE/tBZwXEfx752+Q89T5ZXRLxFvqLQy218QJ3ojf5f
         f4zE3bQFM53vOMehCe1schc4aJ0k4Bkw8YhqgDFIyWbtgQ1SGQ9YszXS0zdOB0yXsKfU
         MH4OKY2SysLK3gDBaAMn+BcThpsukBSDWH1TyaeD4n7U9naskjH9gVUdro2hwV2nNdn3
         c63Q==
X-Gm-Message-State: AOJu0YzqmHEKJJBegmCIW5j5fGIHfzLlEHl17LIAO93HPICWPwr0kjcA
	q+/ET3Dqu/4w8aqHkp0H5PZe9T0rRiqNlxhkrii6FMkol9lYOxu0LyAuQDcVcBq52/zBU7Rt42M
	rQ8H3U7LcxHj1+9WDpWWDBKb6/4+lLBzu3bHhELRZA41DDiYpc+N0ltEjyuN4t6bIdvF8xmELTV
	QLx0WBY1vx+rKEf/uGBXRK/Ya4GV8AH4VnUCbOXeWGjwmMVZwf5lV1TazzNYDghS91lalPLNBXx
	Q==
X-Gm-Gg: AfdE7ck/zEzdWkYlxQWnhedK0B3UbIRqRVf/OA1PP6RjJO4XdX/KmJs6YdqgZOgr0gu
	lq/rVy3uv/o2NQvqwDgIASTcZPnzesTlAalSbFtm94BsMCcBx7XetusuYzOe0TwnHxPTeewWQgY
	FVtN4xOhoE3cnPEIkvvgR6myYbKBb4V1N235joFuYAdt/1mnHLLUqbXOqh+4AjTk9hT0ktFjHv7
	sdoWJNjlJBJZv1vLzXJ5hM23ONZgpcN1R4sGzTakrez9RptQFc6zzvy8ZUB/AYR44TOVlyueOOT
	oWXYlWby0x3Rxr7aTPtYrMLctkscPt+3tbrr8suyJnOpJVsVc1RKd5ky08KsDhiz142Fuw0DQRI
	XxjUWtpnudG1E67NzJz9G2vuyLkta1wj5jZ5cOop+pJUXgGQYcoEfYBm9VGZibXRu2K7uEKStvB
	LSjW5RGLD+Obpk0z2/pnD1ZmNKHpdX0z7JDHXORwXJjfN4dkrqAGO/Lj7oejNcCi4zNp7P4FS0Z
	o2h2qrWQkmFPf2MiQ==
X-Received: by 2002:a05:6000:4310:b0:475:f0c2:5aff with SMTP id ffacd0b85a97d-4775b08079emr1498397f8f.53.1782900049353;
        Wed, 01 Jul 2026 03:00:49 -0700 (PDT)
Received: from Phoenix.vpn.inovex ([185.113.124.99])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4756636d2cfsm17512224f8f.17.2026.07.01.03.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 03:00:48 -0700 (PDT)
From: Anna-Lena Marx <anna-lena.marx@inovex.de>
To: openembedded-core@lists.openembedded.org
Cc: Anna-Lena Marx <anna-lena.marx@inovex.de>
Subject: [PATCH] classes-recipe/sbom-cve-check: fix sstate cache mismatch in sbom path
Date: Wed,  1 Jul 2026 12:00:45 +0200
Message-ID: <20260701100045.3903557-1-anna-lena.marx@inovex.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2026 10:00:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239959

Using ${IMAGE_NAME} to construct the sbom_path causes the do_sbom_cve_check
task to fail in subsequent builds when the image generation is restored from
the sstate cache.
${IMAGE_NAME} utilizes the DATETIME variable via ${IMAGE_VERSION_SUFFIX},
which is re-evaluated during the current execution.
This results in a timestamp mismatch with the actually deployed cached
SPDX artifact.

Switching the path construction to use ${IMAGE_LINK_NAME} ensures the task
reliably targets the stable symlink in the deploy directory,
restoring cache determinism and preventing "No such file or directory"
errors on rebuilds.

Signed-off-by: Anna-Lena Marx <anna-lena.marx@inovex.de>
---
 meta/classes-recipe/sbom-cve-check.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/sbom-cve-check.bbclass b/meta/classes-recipe/sbom-cve-check.bbclass
index 451595f1d7..fe145a2212 100644
--- a/meta/classes-recipe/sbom-cve-check.bbclass
+++ b/meta/classes-recipe/sbom-cve-check.bbclass
@@ -14,7 +14,7 @@ python do_sbom_cve_check() {
     """
     Task: Run sbom-cve-check analysis on SBOM.
     """
-    sbom_path = d.expand("${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.spdx.json")
+    sbom_path = d.expand("${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.spdx.json")
     image_name = d.getVar("IMAGE_NAME")
     link_name = d.getVar("IMAGE_LINK_NAME")
     run_sbom_cve_check(d, sbom_path, image_name, link_name)
-- 
2.55.0


