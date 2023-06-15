Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18005EB64D9
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 10:00:40 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.14369.1686823234247263342
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 03:00:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=jp/r+QnZ;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-311183ef595so270597f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Jun 2023 03:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686823232; x=1689415232;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U2AIv2kjosOmCj1SgWEdMmQZ5iaKs7rkUUjGVsEndgc=;
        b=jp/r+QnZyd3nQI78fIYyStrGffCwOs/uwwAj1qa/v64nf/SPUOesHd4CBoFvin5V0S
         6kljAuormrk65ndcJln5jTYFA+xOWeVz+V2tI14nmKmnhYM7Mk+JWdQ6dpVk7KDhDIoC
         suSup3xHz9ZC9zt9kyvhyYTQLBtyy9JZxWfOdhwHxRmU65KimzhCT5xgXl5+eLtiocb1
         F2cF5kn2L5xMQoLwsGeNnvqkRcLYpT+uImY3FYLCY5ra2tqIm1V6hKECmysavrc6YbIX
         1NLovpVawcqXA5TfKmCHB55RsdSquHf9ZOUXbpoPjMUl5TA6pU2pPTdBU8tmJ7Z+lJ1m
         E+Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686823232; x=1689415232;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U2AIv2kjosOmCj1SgWEdMmQZ5iaKs7rkUUjGVsEndgc=;
        b=cWYBJj+5b0i8GkMrRAyBRMo86KxouFYqesmPhjjJuEJKH6dXuFU2RAW5m6lgV20XGN
         wGSaQMuKv7bArZ1KdWNPVTRqHRcmJ2PNNghObga4hezttkutfarHHUE+ZpUQHvrAqhsp
         22g4naNfCPlqgmwPW+OgeAm25/JLMBcA647e0ASD7KbkunW5WRF1gH5dxIjuc/QGKBaK
         LSDE+BrRfvzMu4SJuthU+TLCse9lbshFq7L+A7unvXGoXYPFlZZ9x1E+a5Q55+AcnkGH
         K+0RaS9lkXkmv0o2fOjeoLBJaPYZ58I+DniVoIWFG8fx5eFOrCe5/BJMowlDnmJU2qI+
         rm5g==
X-Gm-Message-State: AC+VfDzNquBYWpXUqZOVyMYHCrlRhzjL9YWszrhPTvefVyQX+lbcT/L3
	UcCFCOFyyFiIcz+xeuOtI5pBCZ6W+Rk=
X-Google-Smtp-Source: ACHHUZ4i8Le0JavuraCo/F5STYRPhULJ/wwppHXvMT9S2tyk9kDZCUoTetdqNCEtOG9NcTbrQ8+ewA==
X-Received: by 2002:adf:fe90:0:b0:30c:5e52:5bad with SMTP id l16-20020adffe90000000b0030c5e525badmr11624658wrr.18.1686823232172;
        Thu, 15 Jun 2023 03:00:32 -0700 (PDT)
Received: from localhost.localdomain (bl20-169-214.dsl.telepac.pt. [2.81.169.214])
        by smtp.gmail.com with ESMTPSA id b10-20020adfe30a000000b00300aee6c9cesm20658306wrj.20.2023.06.15.03.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 03:00:31 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH] selftest/reproducible: Allow chose the package manager
Date: Thu, 15 Jun 2023 11:00:26 +0100
Message-ID: <20230615100026.86842-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jun 2023 10:00:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182843

This is a follow-up of 76e5fcb2 that also allow users to chose
the package manager using OEQA_REPRODUCIBLE_TEST_PACKAGE

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index e9447a2a92c..0f7e6eb376e 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -128,7 +128,11 @@ class DiffoscopeTests(OESelftestTestCase):
 class ReproducibleTests(OESelftestTestCase):
     # Test the reproducibility of whatever is built between sstate_targets and targets
 
-    package_classes = ['deb', 'ipk', 'rpm']
+    package_classes = get_bb_var("OEQA_REPRODUCIBLE_TEST_PACKAGE")
+    if package_classes:
+        package_classes = package_classes.split()
+    else:
+        package_classes = ['deb', 'ipk', 'rpm']
 
     # Maximum report size, in bytes
     max_report_size = 250 * 1024 * 1024
-- 
2.41.0


