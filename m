Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF977E7718F
	for <webhook@archiver.kernel.org>; Fri, 27 Dec 2024 18:44:02 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web10.17453.1735325039984224197
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Dec 2024 10:44:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Itxxqpzq;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-aa684b6d9c7so1292805766b.2
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Dec 2024 10:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735325038; x=1735929838; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8XkkHGRdS40XG3niVDSAd1nQU5/oMzywv6mXi8G+wOQ=;
        b=Itxxqpzqt8UnHootqVDPtMxeXQcuBGOwVHLPrvJMvmoFuYvUpmKw/WajhfsGkUgrYM
         Ul9T6ONnr1v4LjcJ3nEiaqZcDoiitbz2EfHiZojMI2LhgIUvIXTlnG70BLqfHLRomf52
         gUTBkmf8aF6r0bGv/nBClpnsmWPxaAFvr6BxJU5BeTZpB+HZ3cynXLCNUs0U5HkpbDDd
         Nt93nnll0BZU5C4QcuvUkzrQp6bpGrKCubR8/cUMhoKYoHeezPuKCUrMr5PG4I1j3ofT
         2CkRD8M7aEXx5fWkKCF8EbHm8xdarkUVUSOWJIshAvQpIaPbGNMLmepps+M/G3PyNRLi
         RGFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735325038; x=1735929838;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8XkkHGRdS40XG3niVDSAd1nQU5/oMzywv6mXi8G+wOQ=;
        b=g2He0xZduvnZ1RpSll1pPQ4XuhmYal0zTJHD2wul2qHPn8NVL0VwPhOPb5g5C0cvc9
         hN0q1+xLUSqzWQsM9tf8WPEhw1bd/CJ7xFQCMOHGWNNGyWBdaRCVnKYk+X6wxtMu9xu8
         dEQZvPcwbfD33qwGDtuqBnmcCYdE9cTQVWrdeftAZO9x07OPDUNSIi5ScQHDrc3/MnSI
         rVc0I5FmsxIP0hTX3PhEuX+64U0rXLDx5PUqayz8i4B9buHUC4hMpK80Vedye+35+ATk
         APWkGXJUsPb+mO0lC9g7M/1NF8Ohau1v0qcKeMJUHBkd7syOfCUyzhiAE4X4aMRvikr/
         5dXQ==
X-Gm-Message-State: AOJu0YzgGOMaxcEVjML0NfnOG05AvFXVbhMensU3E9wd+WW3Bl/hjwiD
	5aQngknI+CvHc4omxQr9yiDrlAx4xlY/+BRQz+BFHVle7W9ldLwzqez3cg==
X-Gm-Gg: ASbGncug8qzoLmxfKoiOTlq7hm1tThPcnegRP1Giiapui3Kfc7uhlVsEjIWxLwli+YW
	+GiKJ0quE4+NZStJ+ToiALQ8m1GbORNrg1ZGV8l8XyTjAVIJaUJ4ByOCeFLhicu68i1fxvT1uE6
	OGaxGYYoMGBCMhOP0Z1Abpl/8qBeYyatcq8bmhRu/KX8Dgw367Gx+B0+pIIf1LjJdrzZq2Wn7Zi
	QM0UUgcKeNYuEO3RmW0pVHBgXfXIrVpMgI3V2lj3aZ12Af9FGm1Qp7TlyvuSA5DZ2DcF9BEp7LR
	hTh/lIP26oSVrfA+sA==
X-Google-Smtp-Source: AGHT+IG9hXMRBJZ3DXMJ9cT7FamgS5LBIOc3gSXIM3ebU63oRZQ7HYgNrgvLKjW5JNR9wLBmKbpniQ==
X-Received: by 2002:a17:907:6eaa:b0:aac:501:5629 with SMTP id a640c23a62f3a-aac348c5c19mr2465162666b.56.1735325038111;
        Fri, 27 Dec 2024 10:43:58 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f0653bbsm1163303066b.184.2024.12.27.10.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 10:43:57 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] conf/bitbake.conf: move addfragments to just after the local.conf include
Date: Fri, 27 Dec 2024 19:43:52 +0100
Message-Id: <20241227184352.319519-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Dec 2024 18:44:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209107

From: Alexander Kanavin <alex@linutronix.de>

There was a report that the existing addfragments statement comes in too late,
specifically after the DISTRO/MACHINE includes have already been handled. The goal
for fragments content is to behave exactly like the settings in local.conf would
and so we need to handle the fragments just after that file.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/bitbake.conf | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 0ed0766cd2f..16e4f4429f8 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -827,6 +827,11 @@ require conf/abi_version.conf
 include conf/site.conf
 include conf/auto.conf
 include conf/local.conf
+
+OE_FRAGMENTS_PREFIX ?= "conf/fragments"
+OE_FRAGMENTS_METADATA_VARS ?= "BB_CONF_FRAGMENT_SUMMARY BB_CONF_FRAGMENT_DESCRIPTION"
+addfragments ${OE_FRAGMENTS_PREFIX} OE_FRAGMENTS OE_FRAGMENTS_METADATA_VARS
+
 require conf/multiconfig/${BB_CURRENT_MC}.conf
 include conf/machine/${MACHINE}.conf
 include conf/machine-sdk/${SDKMACHINE}.conf
@@ -837,9 +842,6 @@ include conf/documentation.conf
 include conf/licenses.conf
 require conf/sanity.conf
 include conf/bblock.conf
-OE_FRAGMENTS_PREFIX ?= "conf/fragments"
-OE_FRAGMENTS_METADATA_VARS ?= "BB_CONF_FRAGMENT_SUMMARY BB_CONF_FRAGMENT_DESCRIPTION"
-addfragments ${OE_FRAGMENTS_PREFIX} OE_FRAGMENTS OE_FRAGMENTS_METADATA_VARS
 
 ##################################################################
 # Weak variables (usually to retain backwards compatibility)
-- 
2.39.5


