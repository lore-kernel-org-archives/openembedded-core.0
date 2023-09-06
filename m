Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33A71EB8FC0
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 12:48:42 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.7461.1694004516281455723
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Sep 2023 05:48:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=nRRaQff5;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-26fc9e49859so2354862a91.0
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 05:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1694004515; x=1694609315; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WmdWaHoaL7p2SOubT49UylIqXbHt/Tnh1KMw0CuOc4k=;
        b=nRRaQff576pbnkkfqxdFrA5PV3Nr86AjhnQRHhjhXG5Pc1jGcZA69UG78q1PMus1gg
         Al0wfBvDOBkGF1C0QTCK3vNxjZ9QiUtISfCkyepKNjGjukdJRIB9vpKSxMs5f3cTE02H
         YBHAycLWS6joo2ni6fyMOobxs6bDS0qKR4kOW/2BCHSJ7XIZQnqjRac1sdaIfCHToY9a
         TaD4+/FJcaxS/1G0NYrlJp2hmHNQVxyEmICYXasZbaO55d/X6WH3NuxK/g6fmYOHa+HR
         mc4mMUuHPTs8IlWDmm8jZX+ET8VALj6bYxb6zQpQjAjF0Yzy4hGcoaK1zMlLXqs3kR4C
         L/BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694004515; x=1694609315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WmdWaHoaL7p2SOubT49UylIqXbHt/Tnh1KMw0CuOc4k=;
        b=QwRYr1YXq1L1oqbiaTLjamhS4mAP62uRHYbTOWyS/TSxHSOV7NOL1yfju2UkLJpGqD
         a+5gR9xlFzSH/xF3/UE2VaKbi0BC3PRd84QybqAa73v1+3O0NUHIG0UeoLgDPxQynGBV
         fyQCikVkNU/nuU9bn/E0n882LChYfqPpdRtz1MjdT6BWfQbBtGKdoG1P3iUE/ISRItTS
         5rMS20VqWGgEKD0VtwQIwh+ywJcJ/Uyvl61XPNe95wB0RuXvFG5JW33w7plMCtc4v/1F
         tYWEqNUBGQe7GFe6/957nMIx97+vEHDUXxZo78LH+7vpcShc/dD8/4MWYG5t7ZwewfR9
         29Sw==
X-Gm-Message-State: AOJu0YxfsPb3MgCoJYPHBd44dpxbtNK7/aEgu9OvwEbxutNqm2UxQedm
	YI/+kMlgWQ5dNecOBqmOCVskFSdFPIQCqWfxQLY=
X-Google-Smtp-Source: AGHT+IFeIyhpSz8GdJXOPHTkXPBpPZlP6w5A5yVHma/YZrn7tKlWpc2Mydpv2zxIiytvQ0D1XSLlhg==
X-Received: by 2002:a17:90a:138e:b0:268:3f6d:9751 with SMTP id i14-20020a17090a138e00b002683f6d9751mr13016938pja.23.1694004515387;
        Wed, 06 Sep 2023 05:48:35 -0700 (PDT)
Received: from xps13.. ([65.154.164.134])
        by smtp.gmail.com with ESMTPSA id n10-20020a17090a928a00b00267d9f4d340sm12495009pjo.44.2023.09.06.05.48.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 05:48:34 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/14] libtiff: fix CVE-2023-26966 Buffer Overflow
Date: Wed,  6 Sep 2023 02:48:10 -1000
Message-Id: <0619953c9d87ec2dd670dc50f15170e5c42f95c7.1694004064.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694004064.git.steve@sakoman.com>
References: <cover.1694004064.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 12:48:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187298

From: Hitendra Prajapati <hprajapati@mvista.com>

Upstream-Status: Backport from https://gitlab.com/libtiff/libtiff/-/commit/b0e1c25dd1d065200c8d8f59ad0afe014861a1b9

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libtiff/tiff/CVE-2023-26966.patch         | 35 +++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2023-26966.patch

diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2023-26966.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-26966.patch
new file mode 100644
index 0000000000..85764304f9
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-26966.patch
@@ -0,0 +1,35 @@
+From b0e1c25dd1d065200c8d8f59ad0afe014861a1b9 Mon Sep 17 00:00:00 2001
+From: Su_Laus <sulau@freenet.de>
+Date: Thu, 16 Feb 2023 12:03:16 +0100
+Subject: [PATCH] tif_luv: Check and correct for NaN data in uv_encode().
+
+Closes #530
+
+Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/b0e1c25dd1d065200c8d8f59ad0afe014861a1b9]
+CVE: CVE-2023-26966
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ libtiff/tif_luv.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/libtiff/tif_luv.c b/libtiff/tif_luv.c
+index 13765ea..40b2719 100644
+--- a/libtiff/tif_luv.c
++++ b/libtiff/tif_luv.c
+@@ -908,6 +908,13 @@ uv_encode(double u, double v, int em)	/* encode (u',v') coordinates */
+ {
+ 	register int	vi, ui;
+ 
++	/* check for NaN */
++	if (u != u || v != v)
++	{
++		u = U_NEU;
++		v = V_NEU;
++        }
++
+ 	if (v < UV_VSTART)
+ 		return oog_encode(u, v);
+ 	vi = tiff_itrunc((v - UV_VSTART)*(1./UV_SQSIZ), em);
+-- 
+2.25.1
+
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
index 8e69621afb..61d8142e41 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
@@ -42,6 +42,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2023-3316.patch \
            file://CVE-2023-3618-1.patch \
            file://CVE-2023-3618-2.patch \
+           file://CVE-2023-26966.patch \
            "
 
 SRC_URI[sha256sum] = "0e46e5acb087ce7d1ac53cf4f56a09b221537fc86dfc5daaad1c2e89e1b37ac8"
-- 
2.34.1


