Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5983EC61D92
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 02:31:24 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.10870.1700620281811977523
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Nov 2023 18:31:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=W8YVjL7M;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6cb66f23eddso2584091b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 18:31:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1700620280; x=1701225080; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rp7DNsdY3FhCu/a6jK8wYb0TrBEkteGl1T9PXPfDNgc=;
        b=W8YVjL7MmJxtXAvWx50rAS+fRUFqyqCkwiCPuqiZYgKb93aCsjJhxFsIR8+NY/upEZ
         LN7j3P1jn1QXvEphYxNLErl+spiFZ7zMAzQ3FI7iUPkhSqbTq+wMD1OGH312o09DSJKD
         qlk6y/xNZK6cP5vI6Lx6zKOnLkR6GyHNW6w7H0d2prn80cB+66DzobAKKwSZzd1l7we9
         D/v0rukmTXpjSaFP5HuhVrFYUYWO5Dz7vgFoDIcA1FD0iKAvBWOqYcZsyN5ceYxHL41R
         bYtB7VU4mrpzD268dQrwQ5Ya3AC4cAYxxUan8AoU5425AZpt3mQelSUdmtmIv2ouCWNx
         YC0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700620280; x=1701225080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rp7DNsdY3FhCu/a6jK8wYb0TrBEkteGl1T9PXPfDNgc=;
        b=r1crl5m3Eam7yUmgYszC3PD6ZAnW0EGjmdkNJCL2kfhiGJraRHHqofdkaYqohHsgme
         5J34XXXp4brW+toaYnmtBKgfpn8CUoiaSRKkuk+vtgXBtmxBvx47HVUL9nAh1khkN2W3
         jZVRzDFriVZ+x1UcM7LReuKNuiG3pruRd15IDZsEQRvHJw5DbxIX4xj4e+lAjuV9vU+5
         h1hckN/iuXPpMwfmeuivUjQSLigNkgjTVzddaxF1mu0glzHQ5Ibq/XllyQ+nsEZZJRgh
         oS+vWtvXICHnE6GXhzQUt7fBbIlbDcpBAzibufH/jgc4xYwM77kNw36KCXmXtgnBvlcU
         qCOg==
X-Gm-Message-State: AOJu0YzvE3khGechOBPyJX78pnN8jjYSunGgtRm5LFaxp9Dh5Tg0LV3F
	UomjEFQ0XmkIKDkKEdlrATvKfeloflU/gJ9Kfimhjw==
X-Google-Smtp-Source: AGHT+IH5gE+BuGzlw/NAO1XzZErfx/rPfCDnQCPogRJ1okdfQ9lG0aSJWZ8g3aLQv1lmyW3RnM9FyA==
X-Received: by 2002:a05:6a20:1593:b0:187:e646:4faf with SMTP id h19-20020a056a20159300b00187e6464fafmr1174491pzj.14.1700620280371;
        Tue, 21 Nov 2023 18:31:20 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id d11-20020a056a00198b00b006cb9a43ae4esm4384182pfl.215.2023.11.21.18.31.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 18:31:20 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/16] tiff: Backport fix for CVE-2023-41175
Date: Tue, 21 Nov 2023 16:30:58 -1000
Message-Id: <dcdcd9dcab750927701deb78b798c8fedeec67e0.1700620126.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700620126.git.steve@sakoman.com>
References: <cover.1700620126.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 02:31:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191000

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/6e2dac5f904496d127c92ddc4e56eccfca25c2ee]

Reference: https://security-tracker.debian.org/tracker/CVE-2023-41175

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libtiff/tiff/CVE-2023-41175.patch         | 69 +++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |  1 +
 2 files changed, 70 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2023-41175.patch

diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2023-41175.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-41175.patch
new file mode 100644
index 0000000000..06645bed68
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-41175.patch
@@ -0,0 +1,69 @@
+From 6e2dac5f904496d127c92ddc4e56eccfca25c2ee Mon Sep 17 00:00:00 2001
+From: Arie Haenel <arie.haenel@jct.ac.il>
+Date: Wed, 19 Jul 2023 19:40:01 +0000
+Subject: [PATCH] raw2tiff: fix integer overflow and bypass of the check (fixes #592)
+
+Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/6e2dac5f904496d127c92ddc4e56eccfca25c2ee]
+CVE: CVE-2023-41175
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ tools/raw2tiff.c | 29 +++++++++++++++++++++++++++++
+ 1 file changed, 29 insertions(+)
+
+diff --git a/tools/raw2tiff.c b/tools/raw2tiff.c
+index dfee715..253c023 100644
+--- a/tools/raw2tiff.c
++++ b/tools/raw2tiff.c
+@@ -36,6 +36,7 @@
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
++	uint32_t temp_limit_check = 0;     /* temp for integer overflow checking*/
+ 
+ 	uint32_t row, col, band;
+ 	int	c;
+@@ -212,6 +214,33 @@ main(int argc, char* argv[])
+ 	if (guessSize(fd, dtype, hdr_size, nbands, swab, &width, &length) < 0)
+ 		return EXIT_FAILURE;
+ 
++	/* check for integer overflow in */
++	/* hdr_size + (*width) * (*length) * nbands * depth */
++
++	if ((width == 0) || (length == 0) ){
++	    fprintf(stderr, "Too large nbands value specified.\n");
++	    return (EXIT_FAILURE);
++	}
++
++	temp_limit_check = nbands * depth;
++
++	if ( !temp_limit_check || length > ( UINT_MAX / temp_limit_check ) )  {
++	    fprintf(stderr, "Too large length size specified.\n");
++	    return (EXIT_FAILURE);
++	}
++	temp_limit_check = temp_limit_check * length;
++
++	if ( !temp_limit_check || width > ( UINT_MAX / temp_limit_check ) )  {
++	    fprintf(stderr, "Too large width size specified.\n");
++	    return (EXIT_FAILURE);
++	}
++	temp_limit_check = temp_limit_check * width;
++
++	if ( !temp_limit_check || hdr_size > ( UINT_MAX - temp_limit_check ) )  {
++	    fprintf(stderr, "Too large header size specified.\n");
++	    return (EXIT_FAILURE);
++	}
++
+ 	if (outfilename == NULL)
+ 		outfilename = argv[optind+1];
+ 	out = TIFFOpen(outfilename, "w");
+-- 
+2.25.1
+
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
index e925b7d652..11e3818c69 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
@@ -46,6 +46,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2022-40090.patch \
            file://CVE-2023-1916.patch \
            file://CVE-2023-40745.patch \
+           file://CVE-2023-41175.patch \
            "
 
 SRC_URI[sha256sum] = "0e46e5acb087ce7d1ac53cf4f56a09b221537fc86dfc5daaad1c2e89e1b37ac8"
-- 
2.34.1


