Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64B59CCD18F
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 19:31:29 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.9241.1760038288098786715
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Oct 2025 12:31:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=amv/0ChV;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-78f3bfe3f69so1314388b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 12:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760038287; x=1760643087; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B/opPl4AzNKYnOWwq/M40T2028m0xwQiZctIFrqThtw=;
        b=amv/0ChVKO8Bhk8eGa8PxFmImtpA99QQYaoI9jwCVtVRUVhD4czQ6OZFHhNip7PSJn
         3qsdf5VOLEx2QPuLPDze20EbYrcgClEpTaaqE7D8fJWwiibPQyxpdRB4zQ6N1tGv+oGi
         3eTJMU52Cz2bA2HqQ1TIrKnWdBcTCi5fFqxKUPP0ou5IbMbMZLb+uGVHuHHoPdhKY4Nk
         HGjTfALcQ6wj19M0eJmzUKVR5eUjoBEPjRmvbj1wOwlm1H6IpTXJBmCwdawept/tuynq
         pvr9DaKtJw1fE7GyQli3Zs7hxgZd2kAA6ptlPpq1KxMlPtCJjdWbM/4FDam+VDGsuzOu
         sydA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760038287; x=1760643087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B/opPl4AzNKYnOWwq/M40T2028m0xwQiZctIFrqThtw=;
        b=gRrzPqRH5NdGuQm/k0MlhA35UN4PTRov6VblVKvwVnG91kiJAirpXD0eQnMgTKErXx
         gC/AyMPI24TGA+p/aQ1jGwx5gcVEd1KxdBTT/BrZDE1nNCi98J9Sb2aUr1yyUnXch6ux
         C3DvK00rLoo3zs9yS+34YQ26plDJWZYtgRI6VfgTY8yJfXDjtmak55nPUUvKm/B/mxv6
         XERftV/YVSUyMfHzx/pKbXmNLrX3fG9EtNv84tbncfXzgL6ChNB9wvoiBOZbkl4UDdc0
         Uh64VfNhCBEEZvGeHpBTgLTfhS8em7GKeKooKcNLRud9xXzYj9buisXqcBaunOtlakGk
         dw9g==
X-Gm-Message-State: AOJu0Yw2wIwCOiwyCUp8ny6w5h6S1QlAlAkRYgDby872Vl3dmIV7WHTP
	dBHPodvvQ8ghYoQrO+Ih+027QLllHmc3YJZda73MMbI3CMZRuaI7Owf9IATojf/WYCVDgQNXm+b
	Kn4i3
X-Gm-Gg: ASbGncvP9m2XAUcl6jqI2WIqP1C/Mxs3u7wsoyHNpWUP0yaaCVvshQBaDcEEDN/BPas
	HehJelD1CQ/ueYuHMi8F3eoHfvcZtAERAziazYZUnQouF+W0vDENqkqLoUP8udb6XGIzKEyo//C
	tszIkezRN9x7272oXm7b/Mp//QP4fGufH+G2ajV0pRqThmtPxq9RbIGFsCjTMQQtmB2GxQXGHbZ
	vS2GlFtdURIZZzps2D5SM4x+GAP5J1wl3/TQG6kJFNCHsynaOC55FfdeMHcDDU5jbMkJVaHn+us
	5g6S4e5FjTyVUQuycSGA4QbweqqJ8ldThGqRmN/zZwY5MzIl0abtBevc0NOp/fW72+YX3USf4zr
	VKJ14M3R4vsLFehqgrS6ap3pxB1GOkkE8N19fzg==
X-Google-Smtp-Source: AGHT+IG28Qmr9RC+dGQFpa7Xel9S/WRNKWYEUhIEFRmR8u3ujw7Qd3NJe8JhW/iIXnMx4X4sV0O/Ew==
X-Received: by 2002:a05:6a00:b8a:b0:77e:f03b:d49a with SMTP id d2e1a72fcca58-7938763693cmr9332369b3a.19.1760038287131;
        Thu, 09 Oct 2025 12:31:27 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:b96e:4301:8642:779c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e2d51sm495864b3a.65.2025.10.09.12.31.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 12:31:26 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/24] tiff: Fix CVE-2025-9165
Date: Thu,  9 Oct 2025 12:30:50 -0700
Message-ID: <08823f96a400055e5924bae3af0d2dfaf488148b.1760038088.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760038088.git.steve@sakoman.com>
References: <cover.1760038088.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 19:31:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224625

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Commit: https://gitlab.com/libtiff/libtiff/-/commit/ed141286a37f6e5ddafb5069347ff5d587e7a4e0

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libtiff/tiff/CVE-2025-9165.patch          | 32 +++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2025-9165.patch

diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2025-9165.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2025-9165.patch
new file mode 100644
index 0000000000..3694b11c67
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2025-9165.patch
@@ -0,0 +1,32 @@
+From ed141286a37f6e5ddafb5069347ff5d587e7a4e0 Mon Sep 17 00:00:00 2001
+From: Su_Laus <sulau@freenet.de>
+Date: Fri, 8 Aug 2025 21:35:30 +0200
+Subject: [PATCH] tiffcmp: fix memory leak when second file cannot be opened.
+
+Closes #728, #729
+
+Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/ed141286a37f6e5ddafb5069347ff5d587e7a4e0]
+CVE: CVE-2025-9165
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ tools/tiffcmp.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/tools/tiffcmp.c b/tools/tiffcmp.c
+index 2a35fe6..f812c7d 100644
+--- a/tools/tiffcmp.c
++++ b/tools/tiffcmp.c
+@@ -103,7 +103,10 @@ main(int argc, char* argv[])
+ 		return (2);
+ 	tif2 = TIFFOpen(argv[optind+1], "r");
+ 	if (tif2 == NULL)
++	{
++		TIFFClose(tif1);
+ 		return (2);
++	}
+ 	dirnum = 0;
+ 	while (tiffcmp(tif1, tif2)) {
+ 		if (!TIFFReadDirectory(tif1)) {
+-- 
+2.25.1
+
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
index 2ee6cdef73..84c3028b45 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
@@ -64,6 +64,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2025-8851.patch \
            file://CVE-2025-9900.patch \
            file://CVE-2025-8961.patch \
+           file://CVE-2025-9165.patch \
            "
 
 SRC_URI[sha256sum] = "0e46e5acb087ce7d1ac53cf4f56a09b221537fc86dfc5daaad1c2e89e1b37ac8"
-- 
2.43.0


