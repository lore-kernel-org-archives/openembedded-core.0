Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAA2AC25B6B
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 10:51:15 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.67706.1698317474827101844
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Oct 2023 03:51:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AUL62sdt;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: rybczynska@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-32caaa1c493so517655f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Oct 2023 03:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698317473; x=1698922273; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=35/TOKOZbRE3hYp6PBH2WHz7dIEN2p2OxUNNlV5al8g=;
        b=AUL62sdt6CmiNGiq8f4wJgkTt/MgG2LrN0bY7JsY6JBQRGON7FOylfT8CVM7Izb/F8
         CWquf6VEKe3oCxlsiNgEE9JTegme4HrTKDAmVrs3OYj8hVPdOC/Tw/eQ0I8LFvs0MMbA
         GZyK2Is1PhEv9KOj/+zRptgRA/vkkF2pFHxTCaTJF/uVIAI6E8/nK5wGPcU8wqo6Jc5N
         2hoWHUqnsVOC8VH0RBYYW/Gtf7i5zQbv8bnTP1MKA0xn83u4uW0wTVvYLp8I6iOhlf5O
         l2R7nooa/xklLoQ2wXgsG11d1siTCtPkcNaR+iMNbGA3X6mysZYeYxq52XXzrqY3rdVO
         Zb/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698317473; x=1698922273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=35/TOKOZbRE3hYp6PBH2WHz7dIEN2p2OxUNNlV5al8g=;
        b=LnpKFVvEHS50vpOK0Nic2X/ndp+JQCeC5kdrGAngRbY88/4LgwpGMDiktNWFbMCKZi
         H4O4WwI640T+4svk5S3qfUNhPkkgVj1ujSwdCKznyOTawaebg18UuXLJUoCnZTPOA1N1
         af/kopx+ewH4YYqsgF7gQwKBTdOL2BcI1YhP9LBTctF5FFbvJJBezjbs/4IHAXDaFsD1
         9vJ7Q3UWhdQioflkZTyFwT0OqBfi+oTckdIDqvS2pVX/w7W7jJDv9cE3nS4vKOw1Yg9m
         HBWFT1bXFv7y8nVpxHVNSiZvp0+Gm2PZUZxXSBy5vqcQ5+KrCMzzcVAD3vLNIuTz9JkB
         /BNA==
X-Gm-Message-State: AOJu0Ywl5/dRJ1a6X7vkRBDSA29IVDignMIAFvnq7axqQb/AFm1ABqti
	3QmuMdIVoTT0RN29KQjfNUZCNsqyxoE3Uw==
X-Google-Smtp-Source: AGHT+IH33ATktxahjScTdxhnVniAUEtWr2bmmrTsUgUrbHWiM6P1fSDxgqvMmkqH2FMDpRoE7oVgiQ==
X-Received: by 2002:adf:f74f:0:b0:32d:90f7:ce50 with SMTP id z15-20020adff74f000000b0032d90f7ce50mr13235139wrp.17.1698317472565;
        Thu, 26 Oct 2023 03:51:12 -0700 (PDT)
Received: from localhost.localdomain ([31.32.81.187])
        by smtp.gmail.com with ESMTPSA id f1-20020adff8c1000000b0032da75af3easm13936004wrq.80.2023.10.26.03.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 03:51:11 -0700 (PDT)
From: Marta Rybczynska <rybczynska@gmail.com>
X-Google-Original-From: Marta Rybczynska <marta.rybczynska@syslinbit.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	Louis Rannou <louis.rannou@syslinbit.com>,
	Marta Rybczynska <marta.rybczynska@syslinbit.com>,
	Samantha Jalabert <samantha.jalabert@syslinbit.com>
Subject: [RFC][OE-core 3/7] oe/sbom: change the write_doc to prepare for spdx3
Date: Thu, 26 Oct 2023 12:48:43 +0200
Message-ID: <20231026105033.257971-4-marta.rybczynska@syslinbit.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231026105033.257971-1-marta.rybczynska@syslinbit.com>
References: <20231026105033.257971-1-marta.rybczynska@syslinbit.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Oct 2023 10:51:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189714

From: Louis Rannou <louis.rannou@syslinbit.com>

This changes the prototype of write_doc as the SPDX3 documentation does not
specify yet which is the root element.

Signed-off-by: Louis Rannou <louis.rannou@syslinbit.com>
Signed-off-by: Marta Rybczynska <marta.rybczynska@syslinbit.com>
Signed-off-by: Samantha Jalabert <samantha.jalabert@syslinbit.com>
---
 meta/lib/oe/sbom.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/sbom.py b/meta/lib/oe/sbom.py
index 824839378a..28db9cf719 100644
--- a/meta/lib/oe/sbom.py
+++ b/meta/lib/oe/sbom.py
@@ -68,7 +68,8 @@ def doc_path(spdx_deploy, doc_name, arch, subdir):
     return spdx_deploy / arch / subdir / (doc_name + ".spdx.json")
 
 
-def write_doc(d, spdx_doc, arch, subdir, spdx_deploy=None, indent=None):
+# WARNING: Changed for SPDX3
+def write_doc(d, spdx_graph, spdx_doc, arch, subdir, spdx_deploy=None, indent=None):
     from pathlib import Path
 
     if spdx_deploy is None:
@@ -77,7 +78,7 @@ def write_doc(d, spdx_doc, arch, subdir, spdx_deploy=None, indent=None):
     dest = doc_path(spdx_deploy, spdx_doc.name, arch, subdir)
     dest.parent.mkdir(exist_ok=True, parents=True)
     with dest.open("wb") as f:
-        doc_sha1 = spdx_doc.to_json(f, sort_keys=False, indent=indent)
+        doc_sha1 = spdx_graph.to_json(f, sort_keys=False, indent=indent)
 
     l = _doc_path_by_namespace(spdx_deploy, arch, spdx_doc.documentNamespace)
     l.parent.mkdir(exist_ok=True, parents=True)
-- 
2.42.0


