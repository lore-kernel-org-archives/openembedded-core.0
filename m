Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73A82C47076
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 03:17:56 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.5028.1700018268899278446
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Nov 2023 19:17:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=pwY6L4+U;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1cc3bc5df96so47786595ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Nov 2023 19:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1700018268; x=1700623068; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WxMx6sWNf2Ln+qEe1ikCzwpv9ZqTJafGD9HxWPQbgqE=;
        b=pwY6L4+UPOZnicTAXB4cW8wNK24sYdeiGJpHYfIbqNIqDDgkTs83W1j+aS632U6Y5z
         ILPmJCQkXEuC8N/Lm/dLEArCfM3clZhasQY5WahtgOO9fnMMyPFK6Xg2WRX12Vi43u9a
         pE7JQ62RCZaMdDDIfgLSoQVSXGzRuw2Ec/W0g9PO/8KfdjF0D8j/zjSr6Ulq1jjjqVZG
         rXJzHDs9krmkDXkhBnGAU6zjJprXO5+lpbfBkjsDn4f1XOB7HsFVqcSgudFrMznK0E8Q
         CXjSaAy3myOuHUqGC7eh6lw1+CVLRkuvLJNDYDq0G+cNFZcIpNfdOa94TfbT4T3O7LxC
         iufA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700018268; x=1700623068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WxMx6sWNf2Ln+qEe1ikCzwpv9ZqTJafGD9HxWPQbgqE=;
        b=g7b1K7jt1abl4bxqe8PwgbROeJSHJWXY1CFCvVy+1ofoGzgRwG2qwNrDFv4dQpmBcs
         MqRyQ8e5ChMrvsuJUQ/PHd4wrg1hR3Xz75KBnnAEwJflzkXty7eTu2S32hzv5QaWJnJG
         xrsmlO34BpX3p7m3UDBczE84C0Uew2/6dfDIKlca4UcJOkgeSQNRne7m0V1wTkCkWEV1
         3vKhq+9FbP8wdAPidfdhF2VjapoK48JPPthrFzKmjMTj9reqeKNIoOG76HjG4OA0r/Kx
         uNCecEJTjCoARSt+aShbvGgetrk7OYbAfotIVgfbmekfVzpeaPN6B151+Vu0FPZ1LPdP
         tB3Q==
X-Gm-Message-State: AOJu0YyzyomXH7T3pookQRt1XWzqzYPWOZ43+w5o/vNw6fIeBUEQtvJY
	xvfxvufHek+S+8iVh0W3KrW0+7Ghd3qGGy/MzVl+8A==
X-Google-Smtp-Source: AGHT+IHmrinZ8Eyv0SpUESegemcPxCJOQG2iWMUVEoh/ySsLF0el4YQfBf/r41fp0ji7fULdRy3VGQ==
X-Received: by 2002:a17:902:e892:b0:1cc:5648:f15c with SMTP id w18-20020a170902e89200b001cc5648f15cmr5012966plg.48.1700018268054;
        Tue, 14 Nov 2023 19:17:48 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id l5-20020a170903120500b001c6187f2875sm6369300plh.225.2023.11.14.19.17.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 19:17:47 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/17] tiff: backport Debian patch to fix CVE-2023-41175
Date: Tue, 14 Nov 2023 17:17:21 -1000
Message-Id: <ef66190f834fde453af431cc2aadebac82b7e5b5.1700018112.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700018112.git.steve@sakoman.com>
References: <cover.1700018112.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 03:17:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190534

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport [import from debian security.debian.org/debian-security/pool/updates/main/t/tiff/tiff_4.1.0+git191117-2~deb10u8.debian.tar.xz
Upstream commit https://gitlab.com/libtiff/libtiff/-/commit/6e2dac5f904496d127c92ddc4e56eccfca25c2ee]

Reference: https://security-tracker.debian.org/tracker/CVE-2023-41175

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libtiff/files/CVE-2023-41175.patch        | 67 +++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.1.0.bb |  1 +
 2 files changed, 68 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2023-41175.patch

diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2023-41175.patch b/meta/recipes-multimedia/libtiff/files/CVE-2023-41175.patch
new file mode 100644
index 0000000000..3f44a42012
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2023-41175.patch
@@ -0,0 +1,67 @@
+From 4cc97e3dfa6559f4d17af0d0687bcae07ca4b73d Mon Sep 17 00:00:00 2001
+From: Arie Haenel <arie.haenel@jct.ac.il>
+Date: Wed, 19 Jul 2023 19:40:01 +0000
+Subject: raw2tiff: fix integer overflow and bypass of the check (fixes #592)
+
+Upstream-Status: Backport [import from debian security.debian.org/debian-security/pool/updates/main/t/tiff/tiff_4.1.0+git191117-2~deb10u8.debian.tar.xz
+Upstream commit https://gitlab.com/libtiff/libtiff/-/commit/6e2dac5f904496d127c92ddc4e56eccfca25c2ee]
+CVE: CVE-2023-41175
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ tools/raw2tiff.c | 26 ++++++++++++++++++++++++++
+ 1 file changed, 26 insertions(+)
+
+diff --git a/tools/raw2tiff.c b/tools/raw2tiff.c
+index ab36ff4e..a905da52 100644
+--- a/tools/raw2tiff.c
++++ b/tools/raw2tiff.c
+@@ -35,6 +35,7 @@
+ #include <sys/types.h>
+ #include <math.h>
+ #include <ctype.h>
++#include <limits.h>
+ 
+ #ifdef HAVE_UNISTD_H
+ # include <unistd.h>
+@@ -101,6 +102,7 @@ main(int argc, char* argv[])
+ 	int	fd;
+ 	char	*outfilename = NULL;
+ 	TIFF	*out;
++	uint32  temp_limit_check = 0;
+ 
+ 	uint32 row, col, band;
+ 	int	c;
+@@ -212,6 +214,30 @@ main(int argc, char* argv[])
+ 	if (guessSize(fd, dtype, hdr_size, nbands, swab, &width, &length) < 0)
+ 		return 1;
+ 
++	if ((width == 0) || (length == 0) ){
++		fprintf(stderr, "Too large nbands value specified.\n");
++		return (EXIT_FAILURE);
++	}
++
++	temp_limit_check = nbands * depth;
++
++	if ( !temp_limit_check || length > ( UINT_MAX / temp_limit_check ) )  {
++		fprintf(stderr, "Too large length size specified.\n");
++		return (EXIT_FAILURE);
++	}
++	temp_limit_check = temp_limit_check * length;
++
++	if ( !temp_limit_check || width > ( UINT_MAX / temp_limit_check ) )  {
++		fprintf(stderr, "Too large width size specified.\n");
++		return (EXIT_FAILURE);
++	}
++	temp_limit_check = temp_limit_check * width;
++
++	if ( !temp_limit_check || hdr_size > ( UINT_MAX - temp_limit_check ) )  {
++		fprintf(stderr, "Too large header size specified.\n");
++		return (EXIT_FAILURE);
++	}
++
+ 	if (outfilename == NULL)
+ 		outfilename = argv[optind+1];
+ 	out = TIFFOpen(outfilename, "w");
+-- 
+2.30.2
+
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
index 31e7db19aa..2697a28463 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
@@ -46,6 +46,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2023-3576.patch \
            file://CVE-2023-3618.patch \
            file://CVE-2023-40745.patch \
+           file://CVE-2023-41175.patch \
           "
 SRC_URI[md5sum] = "2165e7aba557463acc0664e71a3ed424"
 SRC_URI[sha256sum] = "5d29f32517dadb6dbcd1255ea5bbc93a2b54b94fbf83653b4d65c7d6775b8634"
-- 
2.34.1


