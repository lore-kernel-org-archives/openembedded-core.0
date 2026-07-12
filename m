Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B963C4450C
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 18:43:38 +0000 (UTC)
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.888.1783881809897157827
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jul 2026 11:43:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=d7en4rmQ;
 spf=pass (domain: underview.tech, ip: 74.125.224.48, mailfrom: vince@underview.tech)
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-667923d86a7so4215204d50.0
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 11:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783881809; x=1784486609; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=52V2lB6SOTx+tXjml57+r7QEFF2uVbn0jE1cTUQdaAE=;
        b=d7en4rmQqGDmgFnEXQx6pHVJxM6JxZtZyKghg+6Vh6yVigZNnDPk9LCeN4Po90NRTS
         yrZdYd2PMunM0avs2i4dJnq8ZjFueLaUiSGCzYdEEFtZVlcYTSsqcmbZKEDIM83hevMd
         nrW6fM+L2ztOyejfnRodkKNc0LpQ/8AK3nYtJ4qxLERvMxDfkCVPlrVafT1BI2rOG58m
         3RoB4QbfsW88sqjnjBir850V45ndghlcEUR9ctIBVHD6Oiuz0h2MIaVulLyCghUzGPKL
         B9S0/MsSOGlpo+AYl34ssyitr5KfES5Lx27B07e8HrFp2aj4KERAFPAUX+P9njYqRB9R
         FV+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783881809; x=1784486609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=52V2lB6SOTx+tXjml57+r7QEFF2uVbn0jE1cTUQdaAE=;
        b=MPi4EMGeibDoiuDTjE7TjXHliixATy1WKIuPgDclKn5nCyr3NuzMQrNFrDh6Dwz11T
         fhYfz0PEtrdo1SaXXjyb+Da5OZmdfiw6e326XdQGmpHLFIsSMbwHEHF0fe6UAe/x+KDS
         2tFEAIydpjVFaOy7GCqqF/UT9cUFPdEeAvTGdcn5wZcz1Cd1LOlKCJqDhnn8Mfl6of8g
         7fTm85qmcsPEX3tX66345cp1J0kIhKHaJPZWKVqND9/Le4zL9AqIJ+83X7P5SRbkI/Ti
         D8d+UjE20fp6sRSrvwR92HAMctLgs4Aza/bkdoX279IZ/HR+1n90buY5w7pBZGCN4QL7
         tyLQ==
X-Gm-Message-State: AOJu0YxMW3aLVAgRu22aTpz4HBuKJfl5yTTDc612b+55CCwRpUK1dZnl
	vljXXerc6neyKZ7ZM1Lwsev/19dIkKGe5HSOhgWhYOMM87zgzW7rVJhfLgVjZLupB92ZV2q+j7K
	7OlJ5ojk=
X-Gm-Gg: AfdE7cklr4VA8cHexRwY2wkYfyREI1O2icVz+MiQaCgf/vPcLN//VifO5g35ATSCgAx
	UAdl+hKtiKn+XmXUtJWk8x1VeV9RRDtLpxo9Dgq6NlmoTuWRwb3DK0qcglgAchGMsAnbtUHa9PZ
	b11lq3qvwKLXqNxKulTcTmTjrT2diJqAsBSGD9z0UEbZ15IQYFPr16WIBNPxeqxt1CnZJSs2Vjk
	bIP18bW4MSEnZ0dKvBzrTdaIrBg1jhjsruHF1biNwC6FLh3Y+cTiGHv+vxJ7Iu5gv1A5sqojciR
	kWnPu9aA/AyQYlSwSBWcgQEQLtuJqqqBahvR6Ce45o29VAi9KWc2sxIfBJq90ErwiARCyAhSXXA
	ykxrnuhdPKQHlJR6TXMdWPbG0Pndi1myDYGUduCKCLlfq+Y5+jOM7B0Dsgi4aRIuSQ/l2ETWRRg
	mKRZyl7tt5uXk2qigQA9wiiP7I
X-Received: by 2002:a05:690e:1605:b0:667:8b93:4fe1 with SMTP id 956f58d0204a3-667c5d010fbmr5804474d50.51.1783881808951;
        Sun, 12 Jul 2026 11:43:28 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66787b23b35sm11768236d50.21.2026.07.12.11.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 11:43:28 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v4 13/27] mdadm: rename kernel prefix
Date: Sun, 12 Jul 2026 14:42:53 -0400
Message-ID: <20260712184307.3259642-13-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712184307.3259642-1-vince@underview.tech>
References: <20260712184307.3259642-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 18:43:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240803

Utilize preset variable KERNEL_PACKAGE_NAME
to ensure uniformity with builds if
KERNEL_PACKAGE_NAME variable were to
change.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/recipes-extended/mdadm/mdadm_4.6.bb | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-extended/mdadm/mdadm_4.6.bb b/meta/recipes-extended/mdadm/mdadm_4.6.bb
index b1d0a27c7f..41726bc37b 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.6.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.6.bb
@@ -85,12 +85,12 @@ RDEPENDS:${PN}-ptest += " \
 "
 RRECOMMENDS:${PN}-ptest += " \
     coreutils \
-    kernel-module-loop \
-    kernel-module-linear \
-    kernel-module-raid0 \
-    kernel-module-raid1 \
-    kernel-module-raid10 \
-    kernel-module-raid456 \
+    ${KERNEL_PACKAGE_NAME}-module-loop \
+    ${KERNEL_PACKAGE_NAME}-module-linear \
+    ${KERNEL_PACKAGE_NAME}-module-raid0 \
+    ${KERNEL_PACKAGE_NAME}-module-raid1 \
+    ${KERNEL_PACKAGE_NAME}-module-raid10 \
+    ${KERNEL_PACKAGE_NAME}-module-raid456 \
 "
 
 FILES:${PN} += "${systemd_unitdir}/*"
-- 
2.43.0


