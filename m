Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96797CDB485
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 21:53:13 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.51155.1697233985638462597
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Oct 2023 14:53:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=nKM7bg0Q;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6b36e1fcea0so805679b3a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 14:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697233985; x=1697838785; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=821Uia7rSkThgpi/fOYW7Y/KdPt6Bu7jZKrZl5STKQ0=;
        b=nKM7bg0QeWKeJ1AovNUZSfzb9wFvM7DodqgBPGT3G5051jqXlt/D+/YPel1y5iu+VN
         QggzOc5E54hPnUTwLMqyNyrF/M7eLw1/Bs2HUds3s3YHJsZ/6WgFjg30VpdA8VCRsN3Y
         E9HHv8phuZPB9+ShFR6o4FeuJ9wqGBJydpP1105pz7z32VUwgT9fJ39k3J2KigjLSzUl
         lZvhDQ8ETREG3y3ZVcikZrNdsrcFktLuj84eqfDBODFmwDz3BvtoF7BY17YVLTX83xRZ
         LkpUdKvOhlTyrBLLxeG/YDNcjfNsKI9zimjSnxOH0tuHrgERohmZfUSkF72JTy5IofuL
         8KOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697233985; x=1697838785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=821Uia7rSkThgpi/fOYW7Y/KdPt6Bu7jZKrZl5STKQ0=;
        b=KK/o2yGTFg9ReRkODrAFmQ8YU5n5jr6g0s9heiJHUaWO7uxOhN4E5JwgmlPoXpcx38
         DrXoyEXMmAjCsMQ8GATSqJr4NzgS3/Fzr8W68J6lJci/+yMIDL8DlcN/1wBmzq2/Of6x
         uTV+rsh2JOvP018EtSOJ3VEWJiLTEo7hsdHoiO+Tto/dF/jofyl1sc0XVhFoShaz4mWK
         LakxoWYbRquVtSeFzTEZK+VQlwjN7XtHLXy3SFrpOmSg9WTlws1Tgtr1nLJe69bx927E
         OMn+7eDLCtklR9fFaepsl77liG+21nt+SFMSJzP67JWPoGKq5x1aFqp4nEtKIlBkDIfe
         Il9g==
X-Gm-Message-State: AOJu0Yz83tK/y4S+Xe9tVVTfLMdHppFFV58/TsBE6Dvfe1UWGBbPWvnK
	lDfaEcbtjEqcb1hpUEtYbIhaeQjJXXN3/Wsx5+Q=
X-Google-Smtp-Source: AGHT+IENTE8W75JbkDk1iC8tflLQNn587hUPMYOUE0vo8NVm6C4KxePY6yJhrG2lpv5suR/xbIpvvA==
X-Received: by 2002:aa7:9689:0:b0:6b6:7a04:6f9 with SMTP id f9-20020aa79689000000b006b67a0406f9mr1404501pfk.28.1697233984637;
        Fri, 13 Oct 2023 14:53:04 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id u22-20020a62ed16000000b00690fe1c928csm14307334pfh.147.2023.10.13.14.53.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 14:53:04 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 02/27] tiff: fix CVE-2023-41175
Date: Fri, 13 Oct 2023 11:52:26 -1000
Message-Id: <b2518923dff885778c550f0faa22e99bf76b6288.1697233866.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697233866.git.steve@sakoman.com>
References: <cover.1697233866.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 21:53:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189079

From: Yogita Urade <yogita.urade@windriver.com>

libtiff: potential integer overflow in raw2tiff.c

References:
https://bugzilla.redhat.com/show_bug.cgi?id=2235264
https://security-tracker.debian.org/tracker/CVE-2023-41175
https://gitlab.com/libtiff/libtiff/-/issues/592

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4ee806cbc12fbc830b09ba6222e96b1e5f24539f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libtiff/files/CVE-2023-41175.patch        | 63 +++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.5.1.bb |  1 +
 2 files changed, 64 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2023-41175.patch

diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2023-41175.patch b/meta/recipes-multimedia/libtiff/files/CVE-2023-41175.patch
new file mode 100644
index 0000000000..cca30b2196
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2023-41175.patch
@@ -0,0 +1,63 @@
+From 6e2dac5f904496d127c92ddc4e56eccfca25c2ee Mon Sep 17 00:00:00 2001
+From: Arie Haenel <arie.haenel@jct.ac.il>
+Date: Thu, 14 Sep 2023 04:36:58 +0000
+Subject: [PATCH] raw2tiff: fix integer overflow and bypass of the check (fixes
+   #592)
+
+CVE: CVE-2023-41175
+
+Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/6e2dac5f904496d127c92ddc4e56eccfca25c2ee]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ tools/raw2tiff.c | 28 ++++++++++++++++++++++++++++
+ 1 file changed, 28 insertions(+)
+
+diff --git a/tools/raw2tiff.c b/tools/raw2tiff.c
+index 4ee59e5..a811077 100644
+--- a/tools/raw2tiff.c
++++ b/tools/raw2tiff.c
+@@ -101,6 +101,7 @@ int main(int argc, char *argv[])
+     int fd;
+     char *outfilename = NULL;
+     TIFF *out;
++    uint32_t temp_limit_check = 0;     /* temp for integer overflow checking*/
+
+     uint32_t row, col, band;
+     int c;
+@@ -221,6 +222,33 @@ int main(int argc, char *argv[])
+     if (guessSize(fd, dtype, hdr_size, nbands, swab, &width, &length) < 0)
+         return EXIT_FAILURE;
+
++    /* check for integer overflow in */
++    /* hdr_size + (*width) * (*length) * nbands * depth */
++
++    if ((width == 0) || (length == 0) ){
++        fprintf(stderr, "Too large nbands value specified.\n");
++        return (EXIT_FAILURE);
++    }
++
++    temp_limit_check = nbands * depth;
++
++    if ( !temp_limit_check || length > ( UINT_MAX / temp_limit_check ) )  {
++        fprintf(stderr, "Too large length size specified.\n");
++        return (EXIT_FAILURE);
++    }
++    temp_limit_check = temp_limit_check * length;
++
++    if ( !temp_limit_check || width > ( UINT_MAX / temp_limit_check ) )  {
++        fprintf(stderr, "Too large width size specified.\n");
++        return (EXIT_FAILURE);
++    }
++    temp_limit_check = temp_limit_check * width;
++
++    if ( !temp_limit_check || hdr_size > ( UINT_MAX - temp_limit_check ) )  {
++        fprintf(stderr, "Too large header size specified.\n");
++        return (EXIT_FAILURE);
++    }
++
+     if (outfilename == NULL)
+         outfilename = argv[optind + 1];
+     out = TIFFOpen(outfilename, "w");
+--
+2.35.5
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb b/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb
index 9cd790a2da..2a5b7e7fcf 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb
@@ -10,6 +10,7 @@ CVE_PRODUCT = "libtiff"
 
 SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2023-40745.patch \
+           file://CVE-2023-41175.patch \
            "
 
 SRC_URI[sha256sum] = "d7f38b6788e4a8f5da7940c5ac9424f494d8a79eba53d555f4a507167dca5e2b"
-- 
2.34.1


