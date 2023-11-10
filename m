Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B49AFC4332F
	for <webhook@archiver.kernel.org>; Fri, 10 Nov 2023 06:12:12 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web11.22595.1699596723769558885
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Nov 2023 22:12:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=R51Qj6Uv;
 spf=pass (domain: mvista.com, ip: 209.85.160.47, mailfrom: vanusuri@mvista.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-1f060e059a3so983265fac.1
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Nov 2023 22:12:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1699596722; x=1700201522; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wcc/Yc+afWXwW1fb2w4aWrI8S9I/8g9NsnTC9Xtvz3Q=;
        b=R51Qj6UvVRhN8AGXzrm1OCDnXCZomFNFQzj5awaj916zXn2ObiZO4T7XHi8+yDeK/c
         R5EAfjypsJQRvn51Uy3xSiQcZH+p0U4DNyCvCtB/aJ2CQPd9jWm3/F7eEFkt/xMeysdl
         2Y68z3Fzputx91e1jkNP7OQe/ji+qh5sONI3s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699596722; x=1700201522;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wcc/Yc+afWXwW1fb2w4aWrI8S9I/8g9NsnTC9Xtvz3Q=;
        b=NcLi5s0ySoU0eXsbnITN4QH1Y0cQ9rQ4f9Pjs+1hZ8Fdl56q1sdoP2h6QcnQjsV9eW
         45GvZjrRjb1ws6GkKM2ZyB9/C7/fn3PUAg8J6LRpj15lVZfxlookh220p0SW8U0xGCbX
         A2cFc218TEEcJ1IPR+VBHcc4l/SJXjHuzrUZCXL5JDWwEHGOgiBfT5kYedyQNjoH0/W/
         KqQ6KX7d0KSeGG6iPwFIWy58gz1XNIhg181ugs7k8dq804lsf9CnIKv/DWA8abEShqCN
         c3ZtKpyV+bDoMFMTnCSOF8G/hA0RL6u+uKqBHbbVgs3nIo9LkWfPBi6OFjytUvJM+8+4
         NONQ==
X-Gm-Message-State: AOJu0YxiG0Cw40aj8/vlcafuLrs2mCB8h/rQtqZlGsZvMZf2v9WqpWKc
	oU1hkxy4PRKUqKWYF9yl3CQDgyu4I84LCpc2ujw=
X-Google-Smtp-Source: AGHT+IFc4v3xRH2/AbHpNZd+X2jtVmeodOIBr0k5Dh59x63LQNtF2EsBLbjNXzwOXpd15UW25Io3uw==
X-Received: by 2002:a05:6870:bb1b:b0:1e9:c18b:b2da with SMTP id nw27-20020a056870bb1b00b001e9c18bb2damr8905120oab.18.1699596721896;
        Thu, 09 Nov 2023 22:12:01 -0800 (PST)
Received: from MVIN00020.mvista.com ([49.37.147.76])
        by smtp.gmail.com with ESMTPSA id u8-20020aa78388000000b0068fe5a5a566sm12078245pfm.142.2023.11.09.22.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 22:12:01 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH] tiff: Backport fix for CVE-2023-41175
Date: Fri, 10 Nov 2023 11:39:45 +0530
Message-Id: <20231110060945.1664891-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Nov 2023 06:12:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190398

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/6e2dac5f904496d127c92ddc4e56eccfca25c2ee]

Reference: https://security-tracker.debian.org/tracker/CVE-2023-41175

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
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
2.25.1


