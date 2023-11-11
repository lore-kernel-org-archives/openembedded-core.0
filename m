Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B4F9C41535
	for <webhook@archiver.kernel.org>; Sat, 11 Nov 2023 15:03:24 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.52964.1699715002077416170
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Nov 2023 07:03:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=3WWrvDQx;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1cc3542e328so23548115ad.1
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Nov 2023 07:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1699715001; x=1700319801; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4e44cLhcXml4x69mZ5XNAr/6o64pHStDuF8PMv1pW4Q=;
        b=3WWrvDQxeaBa+uSI/zT/6lVqtdvvcU9QuYR+38vaojJ7p4T0/HpPN/4MWADdmatkii
         y9JWIJ6q/jv+P6kVAwYX6sprmE+4Vc6MRiDdJDxQspGu3vOMUWvndeA5yXtRujLryYmX
         mofFiNCphQ2Z+97HuCk19NCeH14UGOrGtJAXCpCsjQis/ghPO04efNxqz0vOasOdTG0W
         uWVklAsT0P2Gog/4cHsQZyGKMH6XkXfmTlSJdYJbL1UWYe4QsclmrxbBxnkqU+L95UQf
         aG+46zRLBGARGezXgCUF03ZgHWge1FXKPAXx7bFga/of/fzU3cpwCDBTt1R6tTGLJghX
         /eUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699715001; x=1700319801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4e44cLhcXml4x69mZ5XNAr/6o64pHStDuF8PMv1pW4Q=;
        b=Y5cL3NnZ2KgQIg+97bcmwazsSAKGBSwEDOTu7AybIESCcLPL2vMgCRAt2BEwlFEL7c
         /jEsmGJUusW5Ag4o9HrXpUerZdspnONTUGdVjlzlLOYOECHlqHzLpa0u01ADwCXJPs9i
         5mLmgAt3i7aBS7qn14jSc2mo/xXU5APzGKuy0BDL8xIMPaKEaa1WdYlTNZrEXg+We9fu
         cx61TLRRdvfe/WplTdVkVC7qE2vgCOngpKRcTP2BMNInjmY7TLTgyw/smOW+KnZHK4fo
         Eh7SfISFlZjLuQe/lQzz84kcj3Whhdu5/XuAL4xleJryVOAKe3bqgElV6+SYnE+LRGvk
         oeWw==
X-Gm-Message-State: AOJu0Yy80RGUj938cQcc2JTrM0907+Why56mXAnIZllxd4LtCpR6aU+e
	OjYFKnEKLAgsGSXzrEp7u1Fgycy5km0G/PwWLezhig==
X-Google-Smtp-Source: AGHT+IFIDj+uCnpfAZjJ1BP/SdQaV5BDyIgusUcV/bTaAXLiUveo1qhpLKpVUg1WaBEmBopqWERmFg==
X-Received: by 2002:a17:903:11cd:b0:1cc:7ebe:4db6 with SMTP id q13-20020a17090311cd00b001cc7ebe4db6mr2124689plh.39.1699715000503;
        Sat, 11 Nov 2023 07:03:20 -0800 (PST)
Received: from hexa.lan (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id y18-20020a1709027c9200b001b53c8659fesm1379200pll.30.2023.11.11.07.03.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Nov 2023 07:03:20 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/15] tiff: Security fix for CVE-2023-40745
Date: Sat, 11 Nov 2023 05:02:54 -1000
Message-Id: <19d070e69d2ab683225a0779d75d111cf40d5e5d.1699714834.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1699714834.git.steve@sakoman.com>
References: <cover.1699714834.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Nov 2023 15:03:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190420

From: Hitendra Prajapati <hprajapati@mvista.com>

Upstream-Status: Backport from https://gitlab.com/libtiff/libtiff/-/commit/4fc16f649fa2875d5c388cf2edc295510a247ee5

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libtiff/files/CVE-2023-40745.patch        | 34 +++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.1.0.bb |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2023-40745.patch

diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2023-40745.patch b/meta/recipes-multimedia/libtiff/files/CVE-2023-40745.patch
new file mode 100644
index 0000000000..6eb286039f
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2023-40745.patch
@@ -0,0 +1,34 @@
+From 4fc16f649fa2875d5c388cf2edc295510a247ee5 Mon Sep 17 00:00:00 2001
+From: Arie Haenel <arie.haenel@jct.ac.il>
+Date: Wed, 19 Jul 2023 19:34:25 +0000
+Subject: [PATCH] tiffcp: fix memory corruption (overflow) on hostile images
+ (fixes #591)
+
+Upstream-Status: Backport from [https://gitlab.com/libtiff/libtiff/-/commit/4fc16f649fa2875d5c388cf2edc295510a247ee5]
+CVE: CVE-2023-40745
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ tools/tiffcp.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/tools/tiffcp.c b/tools/tiffcp.c
+index 83b3910..007bd05 100644
+--- a/tools/tiffcp.c
++++ b/tools/tiffcp.c
+@@ -1437,6 +1437,13 @@ DECLAREreadFunc(readSeparateTilesIntoBuffer)
+ 		TIFFError(TIFFFileName(in), "Error, cannot handle that much samples per tile row (Tile Width * Samples/Pixel)");
+ 		return 0;
+ 	}
++
++	if ( (imagew - tilew * spp) > INT_MAX ){
++        TIFFError(TIFFFileName(in),
++                  "Error, image raster scan line size is too large");
++        return 0;
++	}
++
+ 	iskew = imagew - tilew*spp;
+ 	tilebuf = _TIFFmalloc(tilesize);
+ 	if (tilebuf == 0)
+-- 
+2.25.1
+
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
index d27381b4cd..31e7db19aa 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
@@ -45,6 +45,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2023-3316.patch \
            file://CVE-2023-3576.patch \
            file://CVE-2023-3618.patch \
+           file://CVE-2023-40745.patch \
           "
 SRC_URI[md5sum] = "2165e7aba557463acc0664e71a3ed424"
 SRC_URI[sha256sum] = "5d29f32517dadb6dbcd1255ea5bbc93a2b54b94fbf83653b4d65c7d6775b8634"
-- 
2.34.1


