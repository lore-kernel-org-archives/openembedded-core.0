Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02BAFC4725D
	for <webhook@archiver.kernel.org>; Thu, 18 Jan 2024 02:52:02 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.2911.1705546315149786495
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jan 2024 18:51:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=hzKQy2xi;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1d706c117ceso957775ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 18:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1705546314; x=1706151114; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E/M/e8ts6M121iXkydnVX4Y+7oOwlsSYhclymqjykCA=;
        b=hzKQy2xiQII/YrVG2GPeU9+7qWfscSjRMbw/og00tLAoKu3bCDIdBUpELqHmL2QVdN
         H3KWCNTOGpnGZm1FpXXiIPmxf9YL9jVUR93gj2dx16lhDUoyu3Xm8M8LNo7RQ+FC5pZO
         RzzgnyUtcIo5up/yl9FInW81bHqVNTHcqmfL4n2Zb4f9eaCHNhSdNE69LyPxk8qkkWA7
         ElfzQjCrOpxbtd47TUHNbSIU5xJdO1snc3WohPUbzzxWLn0mTUkhAjoANciGkCBUDceP
         DdZPQ13S+cz+ma13zThs0ouNXnASfadiK4w16+eO3Roj9x2IRZ4aac75fCXRMTg04Rja
         11gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705546314; x=1706151114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E/M/e8ts6M121iXkydnVX4Y+7oOwlsSYhclymqjykCA=;
        b=Gg7avfEE5t/vRxlWTjXloZEa9RGDfdAUvGfkamnP878ya7k+DGlXKNpoAA/JMrgMQM
         FoEuNucCR+1+QwImFKcOb43ObtmnGir/MUgHnRL7rjO6kLbnQbcOex+TLFl4nB76DSkL
         RSA0bHXncsGrNDZ6EAUyMdy+k6aAnx718uUADnpM3cs38x5sHBPh0YjgQsByE2eZRCgd
         Yeh33E4lsjnDHvQDZtPTI/LIoyYXvukEgJk7JBOAH5nDgLURa7UNs66VkLOWEYKPbsqY
         HCsvyy4vSQVpeqy3mgzxOulLIv6QHVT9fjtjJkto8LwusvkgjOZhwqpxprfC39qnsJew
         F8VQ==
X-Gm-Message-State: AOJu0YzYWyGeUGuIjwotgUI8SQOeHhxb8iBGtGaRWaFShw9c5yepuLKq
	BuryhKspJshg9o/Ps14YpibQcQe9zLiwzu7XO4H6JISK/Oa1HHG//bxnS7gB06KNmka2QAIJ+HJ
	GGto=
X-Google-Smtp-Source: AGHT+IGphfIz83yvfYSoKkBFzgG2F8KR/0Lf+BLoh/Tr3juTYy/GO0vohcbsFl4BVDJh3WA62wkxfg==
X-Received: by 2002:a17:90a:6396:b0:28f:fe38:18e3 with SMTP id f22-20020a17090a639600b0028ffe3818e3mr199216pjj.64.1705546314078;
        Wed, 17 Jan 2024 18:51:54 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id qb2-20020a17090b280200b0028dd956835bsm441844pjb.2.2024.01.17.18.51.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 18:51:53 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 6/6] libtiff: Fix for CVE-2023-6228
Date: Wed, 17 Jan 2024 16:51:38 -1000
Message-Id: <ff66998ef81dbc35465e30eec96ee9be51f5da80.1705546122.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1705546122.git.steve@sakoman.com>
References: <cover.1705546122.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 02:52:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193961

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/1e7d217a323eac701b134afc4ae39b6bdfdbc96a]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libtiff/files/CVE-2023-6228.patch         | 30 +++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.1.0.bb |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2023-6228.patch

diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2023-6228.patch b/meta/recipes-multimedia/libtiff/files/CVE-2023-6228.patch
new file mode 100644
index 0000000000..a777dea9b0
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2023-6228.patch
@@ -0,0 +1,30 @@
+From 1e7d217a323eac701b134afc4ae39b6bdfdbc96a Mon Sep 17 00:00:00 2001
+From: Su_Laus <sulau@freenet.de>
+Date: Sat, 9 Sep 2023 15:45:47 +0200
+Subject: [PATCH] Check also if codec of input image is available,
+ independently from codec check of output image and return with error if not.
+ Fixes #606.
+
+Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/1e7d217a323eac701b134afc4ae39b6bdfdbc96a]
+CVE: CVE-2023-6228
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ tools/tiffcp.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/tools/tiffcp.c b/tools/tiffcp.c
+index 007bd05..d2f7b66 100644
+--- a/tools/tiffcp.c
++++ b/tools/tiffcp.c
+@@ -628,6 +628,8 @@ tiffcp(TIFF* in, TIFF* out)
+ 	else
+ 		CopyField(TIFFTAG_COMPRESSION, compression);
+ 	TIFFGetFieldDefaulted(in, TIFFTAG_COMPRESSION, &input_compression);
++	if (!TIFFIsCODECConfigured(input_compression))
++	    return FALSE;
+ 	TIFFGetFieldDefaulted(in, TIFFTAG_PHOTOMETRIC, &input_photometric);
+ 	if (input_compression == COMPRESSION_JPEG) {
+ 		/* Force conversion to RGB */
+-- 
+2.25.1
+
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
index 8b130826e3..c739f3a7fa 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
@@ -48,6 +48,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2023-40745.patch \
            file://CVE-2023-41175.patch \
            file://CVE-2022-40090.patch \
+           file://CVE-2023-6228.patch \
           "
 SRC_URI[md5sum] = "2165e7aba557463acc0664e71a3ed424"
 SRC_URI[sha256sum] = "5d29f32517dadb6dbcd1255ea5bbc93a2b54b94fbf83653b4d65c7d6775b8634"
-- 
2.34.1


