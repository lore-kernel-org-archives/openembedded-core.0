Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45F56C47077
	for <webhook@archiver.kernel.org>; Wed, 17 Jan 2024 02:40:47 +0000 (UTC)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
 by mx.groups.io with SMTP id smtpd.web11.81.1705459246861973568
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jan 2024 18:40:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=WJeV3/jN;
 spf=pass (domain: mvista.com, ip: 209.85.166.178, mailfrom: vanusuri@mvista.com)
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3619299e551so2572375ab.3
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 18:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1705459245; x=1706064045; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=313BlZdqjHLx+LbqLIfMEv74MB4HPnp2mSOs7X5UzD0=;
        b=WJeV3/jNOWPWRThyYFurY4h6Zvr+su92eraYs+75KMXsudMJDVfgLBorm1imENGe9+
         kgyujV3ZlpwFqUjxgTQ/KinEqKDxOZTnzGPtrAm11hrSBL2vXwTj439HR3jyn1My0OGh
         t7rgZH6yTzoUMF+ZpxR1SanuqYxioSly2RUzw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705459245; x=1706064045;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=313BlZdqjHLx+LbqLIfMEv74MB4HPnp2mSOs7X5UzD0=;
        b=p8DPkl3Rhd5DLYRNR/SBwDdRDKtIZ/sh6bDtpsKtx515IcwAt8gs4Xbq+xqTH2xQZD
         qtkq+ci3kNHhbyI6BhjxkuxYICgx24oqYRUQu4jU9Bq3+SZHyEJ8uUFzCQRqbjI9zj47
         Z5s6der0IHlgpVeUJtWuZ0I5adsqkZ+n5+XizvcI0b72oRVJpS2/HIdnrYKQZ3rQ2Vdq
         MXTuMUGTJPtsF8a3LwhK2/Qx0Nc0gB9+XjGc7RlBcFLjpJeHHFA1eM6O2Ei+4Hra9Gjy
         33DTj6vCeM2Nb+GzPyt48sbZF0hMqG8sUAQLS2j4Z4XI4Y7D8oIVF5W6wokAszBrzUTT
         yMBg==
X-Gm-Message-State: AOJu0YwKWPkCCZWyUFG6dzW4fBLl+c3zgn0Wl2yROEc4rEL5F1rolkjA
	8+zJ3TqwobOfbFoRjPDD0KAjERKCBa3d4KbLScId9bEeDzg=
X-Google-Smtp-Source: AGHT+IGcrZV55vzkim5xhpdQmwgTSOpf3ecrlchs1Yy1QWPzqzs3BBQ1cNkVcMe7FWDQJA12MfAtgg==
X-Received: by 2002:a05:6e02:18cb:b0:35d:689b:de92 with SMTP id s11-20020a056e0218cb00b0035d689bde92mr12059992ilu.18.1705459245206;
        Tue, 16 Jan 2024 18:40:45 -0800 (PST)
Received: from MVIN00020.mvista.com ([49.43.219.75])
        by smtp.gmail.com with ESMTPSA id t8-20020a656088000000b005cd945c0399sm9472446pgu.80.2024.01.16.18.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jan 2024 18:40:44 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][dunfell][PATCH] libtiff: Fix for CVE-2023-6228
Date: Wed, 17 Jan 2024 08:08:35 +0530
Message-Id: <20240117023835.9909-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 02:40:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193884

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/1e7d217a323eac701b134afc4ae39b6bdfdbc96a]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
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
2.25.1


