Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17CB7C32771
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 11:09:30 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web09.1852.1660907366765768788
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 04:09:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=BIPBVThb;
 spf=pass (domain: mvista.com, ip: 209.85.210.172,
 mailfrom: hprajapati@mvista.com)
Received: by mail-pf1-f172.google.com with SMTP id z187so4003544pfb.12
        for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 04:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=xYycNa5zKgMhdoBSC6Jcr6E/QCUTH+a2mr/6HAzk43M=;
        b=BIPBVThbBF9+W8qeXxlauRB4vkvcdNaejGW67hafK6qckTFkosjKTGvTgu+wQhrlKt
         dCGNjODj04jUEIUTSvTJXQ5Y0MbXFFc/HhXF4tgFgdgV4ZXh4EruXfQTkrurFn1dyHym
         5nOm1jv/Tv4O1Tc0yOes6JA+8gL/FGWM/Gujw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=xYycNa5zKgMhdoBSC6Jcr6E/QCUTH+a2mr/6HAzk43M=;
        b=DPiM5oPBbGyWU2c+vgaIXrMkcGrC+UcmYvZqodjZUwHpkoqiXoAfeAFbQa2Y6u7Yel
         hwEvjmCvAjHf9zjLwxcsW4SRWnJAfzrAlBDVrx6dvu2auNYGoVneEWXOlYCupy2JjrUd
         kbZZrV5cnJcz6keDd1Eia6CUXfoUHL76bQUXXa5YOQ8d7SaCk94UY00C0yUcuLsQMhCq
         BESMxyka/heqAnce1WmaibMQRj74s+cUq2SH0slxsRCUTf0uHHcUSKQqTNnbpHId3f5b
         G3Ux2ie/Y4mjFftD1oL8FjGs66jobgGQFNDO7BJ9f6fxiyLjVppVmP4mX7Sp1s41wLgP
         LkbA==
X-Gm-Message-State: ACgBeo0o0CvqmWvbwUkJvcrIXPwIxDmD+buSijmlm6jLi7WgaJdU+v9S
	WPGMKBxLerTvfGrwEabzBCyL5q8mbLTAlQ==
X-Google-Smtp-Source: 
 AA6agR5escK2xiwV5o7C+wynFToOeuT5qqidXFDIF4LUkiLQEiAEECF6RV1BSJEWsOBnhycic/JxZQ==
X-Received: by 2002:a65:4c0e:0:b0:41b:c11a:c006 with SMTP id
 u14-20020a654c0e000000b0041bc11ac006mr6029526pgq.299.1660907365956;
        Fri, 19 Aug 2022 04:09:25 -0700 (PDT)
Received: from MVIN00024 ([43.249.234.148])
        by smtp.gmail.com with ESMTPSA id
 c16-20020a056a00009000b0052dce4edceesm3251018pfj.169.2022.08.19.04.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 04:09:25 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation);
 Fri, 19 Aug 2022 16:39:19 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [kirkstone][PATCH] libtiff: CVE-2022-34526 A stack overflow was
 discovered
Date: Fri, 19 Aug 2022 16:39:18 +0530
Message-Id: <20220819110918.13511-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 11:09:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169623

Source: https://gitlab.com/libtiff/libtiff
MR: 120544
Type: Security Fix
Disposition: Backport from https://gitlab.com/libtiff/libtiff/-/commit/275735d0354e39c0ac1dc3c0db2120d6f31d1990
ChangeID: 2f9df449974f5436c1690f3ace5d74b1ab4670c9
Description:
          CVE-2022-34526 libtiff: A stack overflow was discovered in the _TIFFVGetField function of Tiffsplit.

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../libtiff/tiff/CVE-2022-34526.patch         | 29 +++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2022-34526.patch

diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2022-34526.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2022-34526.patch
new file mode 100644
index 0000000000..48ca56982f
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2022-34526.patch
@@ -0,0 +1,29 @@
+From 3fc1fdda0068981340cc7ae136173731275e2c5e Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Thu, 18 Aug 2022 10:46:30 +0530
+Subject: [PATCH] CVE-2022-34526
+
+Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/275735d0354e39c0ac1dc3c0db2120d6f31d1990]
+CVE: CVE-2022-34526
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ libtiff/tif_dirinfo.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/libtiff/tif_dirinfo.c b/libtiff/tif_dirinfo.c
+index 8565dfb..0f722a5 100644
+--- a/libtiff/tif_dirinfo.c
++++ b/libtiff/tif_dirinfo.c
+@@ -1157,6 +1157,9 @@ _TIFFCheckFieldIsValidForCodec(TIFF *tif, ttag_t tag)
+ 	    default:
+ 		return 1;
+ 	}
++	if( !TIFFIsCODECConfigured(tif->tif_dir.td_compression) ) {
++		return 0;
++	}
+ 	/* Check if codec specific tags are allowed for the current
+ 	 * compression scheme (codec) */
+ 	switch (tif->tif_dir.td_compression) {
+-- 
+2.25.1
+
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
index 149516508f..b5ccd859f3 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
@@ -21,6 +21,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://0001-fix-the-FPE-in-tiffcrop-415-427-and-428.patch \
            file://CVE-2022-1354.patch \
            file://CVE-2022-1355.patch \
+           file://CVE-2022-34526.patch \
            "
 
 SRC_URI[sha256sum] = "0e46e5acb087ce7d1ac53cf4f56a09b221537fc86dfc5daaad1c2e89e1b37ac8"
-- 
2.25.1


