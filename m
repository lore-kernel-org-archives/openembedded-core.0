Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D791CA1012
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 16:15:13 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.16915.1756916110346197606
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Sep 2025 09:15:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=vs+LPQVw;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7726c7ff7e5so82297b3a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Sep 2025 09:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756916110; x=1757520910; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wih1XiJi2E8k6INEAIHaHmq84g1FWptYU7kj7MxynSM=;
        b=vs+LPQVwXMf6TCoSHVAPPGZ2IuPzBj+H+kHrytAgwNQkRPun4kmJqY6fNy9BKK9dm9
         F/xLUg+X/T9cC6IXx0Xpb/nw49NIkoh7UnNAs741gjTrXFfz5LcRNhCCe7sgiDuGY4gE
         frQAI+xO5OB8D1kt56/mqk+D+hNZ5GVVCZI5SAnv2KhUFl+TfYd4JfqBKVYaBhVO2A+7
         IYJWfLn0yfNZICfga7GdJbN+c46EyGf0SMkzjfHuetW2amfMGM/reivySvsejkdrz67P
         FwRdUGqmma/uycsqAAX9mef9D9d5mLFj6sQ2pUgseM2PL4j+u1ULmEpg2493wsG7QWaj
         tiUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756916110; x=1757520910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wih1XiJi2E8k6INEAIHaHmq84g1FWptYU7kj7MxynSM=;
        b=ISzX2PXTRhAJrlFrmAO1cC+WRdNQcnleay3j/VZ/4HP8T6dTp+5ebSG8FkSq7keqUZ
         CZsjyqT/cpMlwEg2o/4vEXVA2cY2kgcDPX9uqSEARiLH0EIx3NKMLPM1L+iAOSptLHux
         faxv+M1L9I4/THG8J0VnujwlY1/DDFuMcg2BRqq3XyWdC0WCE3IAdtHUflgKE+QiCxTB
         nvlUBGJ+PEoJL179Y+J6+juq8f7x3JmP6vd82v+B1qLGXaAlKbEoaqI+sApfZLP6a2+D
         Qsro90OVYnTvYEUi6X2BZycOxz4nRAUaEMdFwgWwODDNgv1xqHLcDPJNfNYB9vAU80cV
         VBOg==
X-Gm-Message-State: AOJu0YyJfgwNaGu1yyex+BNMvnQSpB3fK6CcF1mAd/RfL8O7ds5dvd5z
	17aO3LhLyFb6sUINYJ4tcgmqrr1NXPQFhEQyErsSjOde61653/yvlR4Jyl6qtb/Iof+74ETQ+bG
	g1o4Z
X-Gm-Gg: ASbGnctT5m/oF7j1wMPX7jmagPCSdM2AcqPybCAHrGcZgKPaXhZRNMghsio6xrgXi46
	pUUQaJ8eCzc136yDpSfh80C/J0aNndfwmBFn5WmYSDj4jdwl97Xlr/XZHOxGxwY0TaGUJX0amFU
	LuEO3Y96+jVMtj8wzgp3jqViX4vsxWhwncp91eApqLcw8sTJdvoTnX3z0cBQ/81FoNJ2PSemaNw
	r2G08erbeLNPTRwPvzZ6w8sRXRjU95fRp487vaZh7+GHy/SycqBj8OYoiGDTIfcWcbbuDZF8mus
	xOYQHdQ1y3hiwVkJm1DZ5tTHKUAOtzqoIezSswLAVJaif70/AGIXLfuFYlnvCwu6efa7TUugrKO
	ZbqXBHssjtFMJig==
X-Google-Smtp-Source: AGHT+IEH0/7AzUkueH+AdWM9cd09iqyz04T4I61bsi4ZkcyLPa1LFweUJf8g2tM6S458gpU4c/Qt/Q==
X-Received: by 2002:a05:6a00:7496:b0:772:4319:e7ed with SMTP id d2e1a72fcca58-7724319ece8mr17612075b3a.29.1756916109438;
        Wed, 03 Sep 2025 09:15:09 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:9ffe:4bb4:e2b3:4b1c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7724f079b88sm11027602b3a.40.2025.09.03.09.15.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 09:15:09 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 2/9] tiff: fix CVE-2025-8534
Date: Wed,  3 Sep 2025 09:14:52 -0700
Message-ID: <c897368cd363d3e50372ab1fc95bc31f1a883dc4.1756915922.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756915922.git.steve@sakoman.com>
References: <cover.1756915922.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Sep 2025 16:15:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222867

From: Yogita Urade <yogita.urade@windriver.com>

A vulnerability classified as problematic was found in libtiff
4.6.0. This vulnerability affects the function PS_Lvl2page of
the file tools/tiff2ps.c of the component tiff2ps. The
manipulation leads to null pointer dereference. It is possible
to launch the attack on the local host. The complexity of an
attack is rather high. The exploitation appears to be difficult.
The exploit has been disclosed to the public and may be used.
The name of the patch is 6ba36f159fd396ad11bf6b7874554197736ecc8b.
It is recommended to apply a patch to fix this issue. One of the
maintainers explains, that "[t]his error only occurs if
DEFER_STRILE_LOAD (defer-strile-load:BOOL=ON) or TIFFOpen( .. "rD")
option is used."

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-8534

Upstream patch:
https://gitlab.com/libtiff/libtiff/-/commit/6ba36f159fd396ad11bf6b7874554197736ecc8b

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libtiff/tiff/CVE-2025-8534.patch          | 60 +++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2025-8534.patch

diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8534.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8534.patch
new file mode 100644
index 0000000000..59c14e2703
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8534.patch
@@ -0,0 +1,60 @@
+From 6ba36f159fd396ad11bf6b7874554197736ecc8b Mon Sep 17 00:00:00 2001
+From: Su_Laus <sulau@freenet.de>
+Date: Sat, 2 Aug 2025 18:55:54 +0200
+Subject: [PATCH] tiff2ps: check return of TIFFGetFiled() for 
+ TIFFTAG_STRIPBYTECOUNTS and TIFFTAG_TILEBYTECOUNTS to avoid NULL pointer 
+ dereference.
+
+Closes #718
+
+CVE: CVE-2025-8534
+Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/6ba36f159fd396ad11bf6b7874554197736ecc8b]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ tools/tiff2ps.c | 20 +++++++++++++++++---
+ 1 file changed, 17 insertions(+), 3 deletions(-)
+
+diff --git a/tools/tiff2ps.c b/tools/tiff2ps.c
+index a598ede..05a346a 100644
+--- a/tools/tiff2ps.c
++++ b/tools/tiff2ps.c
+@@ -2193,10 +2193,20 @@ PS_Lvl2page(FILE* fd, TIFF* tif, uint32_t w, uint32_t h)
+ 	tiled_image = TIFFIsTiled(tif);
+ 	if (tiled_image) {
+ 		num_chunks = TIFFNumberOfTiles(tif);
+-		TIFFGetField(tif, TIFFTAG_TILEBYTECOUNTS, &bc);
++		if (!TIFFGetField(tif, TIFFTAG_TILEBYTECOUNTS, &bc))
++                {
++                   TIFFError(filename,
++                             "Can't read bytecounts of tiles at PS_Lvl2page()");
++                   return (FALSE);
++                }
+ 	} else {
+ 		num_chunks = TIFFNumberOfStrips(tif);
+-		TIFFGetField(tif, TIFFTAG_STRIPBYTECOUNTS, &bc);
++		if (!TIFFGetField(tif, TIFFTAG_STRIPBYTECOUNTS, &bc))
++                {
++                   TIFFError(filename,
++                             "Can't read bytecounts of strips at PS_Lvl2page()");
++                   return (FALSE);
++                 }
+ 	}
+ 
+ 	if (use_rawdata) {
+@@ -2791,7 +2801,11 @@ PSRawDataBW(FILE* fd, TIFF* tif, uint32_t w, uint32_t h)
+ 
+ 	(void) w; (void) h;
+ 	TIFFGetFieldDefaulted(tif, TIFFTAG_FILLORDER, &fillorder);
+-	TIFFGetField(tif, TIFFTAG_STRIPBYTECOUNTS, &bc);
++        if (!TIFFGetField(tif, TIFFTAG_STRIPBYTECOUNTS, &bc))
++        {
++           TIFFError(filename, "Can't read bytecounts of strips at PSRawDataBW()");
++           return;
++        }
+ 
+ 	/*
+ 	 * Find largest strip:
+-- 
+2.40.0
+
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
index d5ae82bc7c..137dc7f478 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
@@ -60,6 +60,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2025-8176-0003.patch \
            file://CVE-2025-8177.patch \
            file://CVE-2024-13978.patch \
+           file://CVE-2025-8534.patch \
            "
 
 SRC_URI[sha256sum] = "0e46e5acb087ce7d1ac53cf4f56a09b221537fc86dfc5daaad1c2e89e1b37ac8"
-- 
2.43.0


