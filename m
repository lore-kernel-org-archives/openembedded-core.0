Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39CE3C48BC4
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 16:18:18 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.18114.1708013894904612502
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 08:18:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=eepN0fDE;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1db5212e2f6so7760555ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 08:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1708013894; x=1708618694; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0TmshoxHMtKkNQLvYRz6Taw/7IYqklWph3EloalJQ/I=;
        b=eepN0fDEqepyQTt6hmqxH7qaiM/oP/TPSSr0+OUX8STWLG/ol+R8YqW8V5i+3IaKws
         c320mKbyolEKxJFT5Sdq82F1d+CjwCEsA0wbVAs80Y1oHg7R5d9jXO591jgilTnShtAX
         t+ljBgIt26PPmiNszOpW7zXPGzmLmDtDP2QugKZzOLC0pKcP/gpujmxQolyeNEEsPMwX
         omLsyOW0gmO4vkg6KMqwq2VIiZ+HCEmOafbLQpxIFsVx8vmgW4gi8UPUCdvef4jmlyBG
         RSh+g0Fh8wSnqXJj6TnYKdYXsCtrjdh429HdzrHKwz2TqNumX2UtkrDKpSXnjJumq55n
         MokQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708013894; x=1708618694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0TmshoxHMtKkNQLvYRz6Taw/7IYqklWph3EloalJQ/I=;
        b=QEXpnWNXBzkLUYUAqBoAa4zW2LraJ19uPjUthDGWHEyZbKZhLDCLjcP/J5vh6tVjKQ
         fuSSahoojDNqJPZ4vqkigFeBpJzh4bJPvrursV2ffMRYJb9reHaO/LD2hzgIsD5wgxKP
         YIESWVcfGJqJP9xyHfZwZaOyXZWFpUn8CbkEK1mjjmRDH3g0sK8acvAOZmIfQS9YviLd
         UqrO72pLpy3k8ZqRnw7TAUggojhN9O88fzkNkRKBU/xpNGiW23WRU64E1QSJz7u+zdJo
         lwrgoTz5Qj0F/+KXpmQnd0OUergBtullWmnbVVa9B08V8OS4iTCAwLfWpjeAPur8UsGz
         9U1g==
X-Gm-Message-State: AOJu0YwtXcsw7PW+byakPbOO51ppm7rwV0t3/1uYlHbhXOWKmxZ/gcCQ
	F5hl+puci14K5rDo5BZoyPkXkOO6sly8uD+ZkZyJdQ5xT+O7uOnIOQKNDLb4wjxsROyalc+mwuB
	iEhI=
X-Google-Smtp-Source: AGHT+IE2Yp+rIWJmjhJOw3wja0f03MoTklMuzFnQkcCpGZAi0rSAIn0OVhHsKvy3JPz7Kp5Ewy4YhA==
X-Received: by 2002:a17:902:e5c8:b0:1db:2ad2:8ee3 with SMTP id u8-20020a170902e5c800b001db2ad28ee3mr3519821plf.15.1708013894133;
        Thu, 15 Feb 2024 08:18:14 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id l17-20020a170902d05100b001db66f3748bsm1445683pll.121.2024.02.15.08.18.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 08:18:13 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 01/21] tiff: fix CVE-2023-6228
Date: Thu, 15 Feb 2024 06:17:44 -1000
Message-Id: <fe0ee74a236cd7523f8982c5699098e6b75d2b20.1708012696.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708012696.git.steve@sakoman.com>
References: <cover.1708012696.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 16:18:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195521

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
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 55735e0d75820d59e569a630679f9ac403c7fdbe)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libtiff/tiff/CVE-2023-6228.patch          | 31 +++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.6.0.bb |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2023-6228.patch

diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2023-6228.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-6228.patch
new file mode 100644
index 0000000000..2020508fdf
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-6228.patch
@@ -0,0 +1,31 @@
+From 1e7d217a323eac701b134afc4ae39b6bdfdbc96a Mon Sep 17 00:00:00 2001
+From: Su_Laus <sulau@freenet.de>
+Date: Wed, 17 Jan 2024 06:57:08 +0000
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
+index aff0626..a4f7f6b 100644
+--- a/tools/tiffcp.c
++++ b/tools/tiffcp.c
+@@ -846,6 +846,8 @@ static int tiffcp(TIFF *in, TIFF *out)
+     if (!TIFFIsCODECConfigured(compression))
+         return FALSE;
+     TIFFGetFieldDefaulted(in, TIFFTAG_COMPRESSION, &input_compression);
++    if (!TIFFIsCODECConfigured(input_compression))
++	    return FALSE;
+     TIFFGetFieldDefaulted(in, TIFFTAG_PHOTOMETRIC, &input_photometric);
+     if (input_compression == COMPRESSION_JPEG)
+     {
+--
+2.40.0
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb
index 4c472f8ef6..eb8a096f19 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb
@@ -12,6 +12,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2023-6277-At-image-reading-compare-data-size-of-some-tags-data.patch \
            file://CVE-2023-6277-At-image-reading-compare-data-size-of-some-tags-data-2.patch \
            file://CVE-2023-6277-Apply-1-suggestion-s-to-1-file-s.patch \
+           file://CVE-2023-6228.patch \
            "
 
 SRC_URI[sha256sum] = "88b3979e6d5c7e32b50d7ec72fb15af724f6ab2cbf7e10880c360a77e4b5d99a"
-- 
2.34.1


