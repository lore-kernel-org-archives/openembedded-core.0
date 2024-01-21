Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F364FC47422
	for <webhook@archiver.kernel.org>; Sun, 21 Jan 2024 18:58:14 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web10.54355.1705863486802789810
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Jan 2024 10:58:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=akoaiS/m;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.169, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3bd72353d9fso2223055b6e.3
        for <openembedded-core@lists.openembedded.org>; Sun, 21 Jan 2024 10:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1705863485; x=1706468285; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QTfH0VOIOt3jjJyvD56pN2l+bam5meSPMyuk+Wz0bwU=;
        b=akoaiS/mYysr3S2UUWm7Qt20JqhwZrhwLNC/bvzzr+b4FZ+MpcxNiopC9ntH+Ekppd
         Dl/wrMSMR1VZy0xtDnBPZDae0mJRCJ3FM/C7bBVi3txtqHRM4UCFh+6NX8aeX/u6GtRo
         0N98eL68OJS+Ee0xAyeEKw1LUzLGDOD23I08vZy0J7RKAwvSw3MVEnO2Ei+CwSDFLR03
         qRwsFyIfElgJYJaLCqiQOhRrrQxPzENssX6zKv4e7uXJMxknWqcnYiTib5z8W8/i9ttg
         vKFVNdnZrEyIi3VA506wU8MIkk+TjWVSqpLgoF6bjSkUuBspOku0ZdDtbwzi9EOt+Ged
         3dCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705863485; x=1706468285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QTfH0VOIOt3jjJyvD56pN2l+bam5meSPMyuk+Wz0bwU=;
        b=dNvv+K2MjmTZPTw8YCvNzy4muJ7GhCqjojossX+YFfGeztjb96j8REXLC3EMNCp6LJ
         4HanCxczvUxbzLDm9ovmlgfHiXaBRMRvay6m6HAGx8Vp6KPjBBiq2JNgC4kTFODi/hRe
         DkmAs4Vv10QnNas9ue8e6KkMukR469StM2SrEL7Ac++hsWKsvn42EAi88jtJ/upA4hj9
         thpazjo2jmVxDkBnACScM/a5/5iQOsZneuGLZky7Xpc7qavHL2R7jpgMVX4hMgb3UWpV
         gfgszhCLVQpywnPoywWNYj9b60jQPB91BYD75S3i4yx1jSE+msQRovJKNc+St3iuL5Ip
         K+Jw==
X-Gm-Message-State: AOJu0YzeNawYCD4mTrd+O32p16JdvS94GCyUa4/J0M6NC1VtYojvuW4a
	YS9bBU8bNqJXCJytBVjyI0hXsukiVRPjccLObNsmCFT8cjdVDNJbqlxdyrO3Cg4znV88r4jUdoE
	21XSK1w==
X-Google-Smtp-Source: AGHT+IFBFJTznfVeeNPJGqJZ6o5oh+ww7kfaW4mKXPFabEsZWd07DfnF2vAJJWLdChBaOGa9jSbo7g==
X-Received: by 2002:a05:6808:2395:b0:3bd:b43a:2ea6 with SMTP id bp21-20020a056808239500b003bdb43a2ea6mr2421481oib.96.1705863485324;
        Sun, 21 Jan 2024 10:58:05 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id t187-20020a6281c4000000b006d99125b114sm8675277pfd.65.2024.01.21.10.58.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jan 2024 10:58:05 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 3/6] tiff: fix CVE-2023-6228
Date: Sun, 21 Jan 2024 08:57:52 -1000
Message-Id: <0730806ae39093b05ce943df1f9f5d0a25a8a673.1705863274.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1705863274.git.steve@sakoman.com>
References: <cover.1705863274.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 21 Jan 2024 18:58:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194097

From: Yogita Urade <yogita.urade@windriver.com>

CVE-2023-6228:
An issue was found in the tiffcp utility distributed by the
libtiff package where a crafted TIFF file on processing may
cause a heap-based buffer overflow leads to an application
crash.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-6228
https://gitlab.com/libtiff/libtiff/-/issues/606

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libtiff/tiff/CVE-2023-6228.patch          | 31 +++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2023-6228.patch

diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2023-6228.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-6228.patch
new file mode 100644
index 0000000000..f15cc96e19
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-6228.patch
@@ -0,0 +1,31 @@
+From 1e7d217a323eac701b134afc4ae39b6bdfdbc96a Mon Sep 17 00:00:00 2001
+From: Su_Laus <sulau@freenet.de>
+Date: Wed, 17 Jan 2024 06:38:24 +0000
+Subject: [PATCH] codec of input image is available, independently from codec
+ check of output image and return with error if not.
+
+Fixes #606.
+
+CVE: CVE-2023-6228
+Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/1e7d217a323eac701b134afc4ae39b6bdfdbc96a]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ tools/tiffcp.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/tools/tiffcp.c b/tools/tiffcp.c
+index 34b6ef2..17c6524 100644
+--- a/tools/tiffcp.c
++++ b/tools/tiffcp.c
+@@ -724,6 +724,8 @@ tiffcp(TIFF* in, TIFF* out)
+	else
+		CopyField(TIFFTAG_COMPRESSION, compression);
+	TIFFGetFieldDefaulted(in, TIFFTAG_COMPRESSION, &input_compression);
++	if (!TIFFIsCODECConfigured(input_compression))
++		return FALSE;
+	TIFFGetFieldDefaulted(in, TIFFTAG_PHOTOMETRIC, &input_photometric);
+	if (input_compression == COMPRESSION_JPEG) {
+		/* Force conversion to RGB */
+--
+2.40.0
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
index 11e3818c69..d284100ab2 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
@@ -47,6 +47,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2023-1916.patch \
            file://CVE-2023-40745.patch \
            file://CVE-2023-41175.patch \
+           file://CVE-2023-6228.patch \
            "
 
 SRC_URI[sha256sum] = "0e46e5acb087ce7d1ac53cf4f56a09b221537fc86dfc5daaad1c2e89e1b37ac8"
-- 
2.34.1


