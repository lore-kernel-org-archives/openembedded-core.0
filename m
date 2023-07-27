Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA23BC001DC
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 14:36:50 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web10.8995.1690468603139574483
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jul 2023 07:36:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=QOjS2GOh;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2b95d5ee18dso15592931fa.1
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 07:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690468601; x=1691073401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KyYnCSpQ4Y+1RSIfW7LvQyutIWoQ45pp+Ih+IT9sYBY=;
        b=QOjS2GOhMBL/Qb/v9nw+IGGrDjugycCrDr8vIbOKQcXd3r+J8EtT/Ndy/ZLZsId/YM
         Flc6X/+jci60K/Vqc9CIkQspiqCDE3emaaWH03bdJ/hBm4B4SF9LW4FNg/BWf/bKp2rc
         967HxFG/3rF7wuF6txCHOPAifmkA+vTGaSRRWMhXdnBBMsSYMmOHG9Nirs9nEZmAGaGk
         5sAc5eak/ugmeJj5i0FpteGhTCctdruhFdvSp6W9FF20pJ7bGIATp6II8BsYzTe2KAnm
         G5T0HR5rlkyiehEynuzkE5/FGIP4pPqZ4QNO55i1DoF7mGq1fbLuRZt3quGYWvT2+/4z
         rXFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690468601; x=1691073401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KyYnCSpQ4Y+1RSIfW7LvQyutIWoQ45pp+Ih+IT9sYBY=;
        b=JkfPL8ecyr6ClthBikW/6/CJJ04tcpiRt6PLlNBh+QcndqjoBDM+h8NdnGh54e5NvH
         b5RNHCk8SCKPKeBfdYzGzJQ5kQ5TzK20cCX1S9pP1Pc4D/rPx+1rtdVAL0gRA19Yekxi
         JTXEHXjEh3gX3WQFB7kBA3iVn2zy2jPlcjN/vzbSaZ63ktg6en73f5aDjEpMOCBHYcG/
         j0PfD1LczjdV+Js08Gf8sBXy6wU9vh2kW+O5nrHeWD30MzoZaVQ4R23KR2uS7+eswr1T
         RZXTI6rj4Ji3k7vc4BzaVNtEdM83pGotONWkvTWpuBEqWq7jnGIxUF+PXzQk8/UhJLyz
         hgUQ==
X-Gm-Message-State: ABy/qLYkb7oCVre0hglU5gcgxQ1AloK2VeLKlkSFhuqljBYR48PQmxN4
	Prvr1qa+AA8psl/W64/wA1pb2gNdDk8=
X-Google-Smtp-Source: APBJJlFNjJF0AEY01wL5jJpfwYMzyEUAgi/MZeW+lpdbnumY6fjA2rnXMO+x2OTMWS79Pv+Ww+hGOg==
X-Received: by 2002:a2e:9ed4:0:b0:2b6:ccc7:4908 with SMTP id h20-20020a2e9ed4000000b002b6ccc74908mr1681328ljk.15.1690468601209;
        Thu, 27 Jul 2023 07:36:41 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m10-20020a17090607ca00b0099bcf9c2ec6sm846725ejc.75.2023.07.27.07.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 07:36:40 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 20/21] buildtools-extended-tarball: install the full set of gconv modules
Date: Thu, 27 Jul 2023 16:36:26 +0200
Message-Id: <20230727143627.3718496-20-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230727143627.3718496-1-alex@linutronix.de>
References: <20230727143627.3718496-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 14:36:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184960

The specific set was written to ensure vim builds reproducibly; this is
however prone to silent regressions (if vim adds more usage of iconv with
different encodings). Installing the full set also matches what standard
desktop distributions do, and thus meets expectations of upstream projects in general.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../recipes-core/meta/buildtools-extended-tarball.bb | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-core/meta/buildtools-extended-tarball.bb b/meta/recipes-core/meta/buildtools-extended-tarball.bb
index 83e3fddccc1..633f8e6b99d 100644
--- a/meta/recipes-core/meta/buildtools-extended-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-extended-tarball.bb
@@ -28,21 +28,13 @@ TOOLCHAIN_HOST_TASK += "\
     nativesdk-libtool \
     nativesdk-pkgconfig \
     nativesdk-glibc-utils \
-    nativesdk-glibc-gconv-ibm850 \
-    nativesdk-glibc-gconv-iso8859-1 \
-    nativesdk-glibc-gconv-utf-16 \
-    nativesdk-glibc-gconv-cp1250 \
-    nativesdk-glibc-gconv-cp1251 \
-    nativesdk-glibc-gconv-cp1252 \
-    nativesdk-glibc-gconv-euc-jp \
-    nativesdk-glibc-gconv-libjis \
+    nativesdk-glibc-gconvs \
     nativesdk-libxcrypt-dev \
     nativesdk-parted \
     nativesdk-dosfstools \
     nativesdk-gptfdisk \
     "
-# gconv-cp1250, cp1251 and euc-jp needed for iconv to work in vim builds
-# also copied list from uninative
+# gconvs needed for iconv to work in vim builds
 
 TOOLCHAIN_OUTPUTNAME = "${SDK_ARCH}-buildtools-extended-nativesdk-standalone-${DISTRO_VERSION}"
 
-- 
2.30.2


