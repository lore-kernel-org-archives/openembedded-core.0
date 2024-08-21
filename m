Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2518C5321D
	for <webhook@archiver.kernel.org>; Wed, 21 Aug 2024 12:50:43 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.18782.1724244638502807810
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Aug 2024 05:50:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=IRRE36Kd;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-713dc00ce9dso3552196b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Aug 2024 05:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1724244638; x=1724849438; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lBAMQJDmmTVkH6IjHf2EILSEoRh20JRqoBE3VTOnhDQ=;
        b=IRRE36KdFL4qZrewKWLUFHSma00zyY/gOPq9g3PIadzIjPMP5/rBMdpVHMoZ8RudPn
         WtTjeSsGgOD60vUW2UHF+fTrU2b9Gy+6phejMj5NyN4Y/+jCzkPxyhhl4QZFf1yl4jaS
         Wmpr6o2UkqpRoajTdqO8+9lQ2eCL22eiDUtZjodZHs2hQQzBe7f5BkIKj6gNpohv/0J4
         lM4jrvLdnBMCsOppgOZM96yM9v6b4MwNJ+IRqDkJ0ePii26V7rDIXcxXD3nMo6I5RWzC
         E54kJ3TufgLkATjWV8xueUsNJPxrtReSXd5P8dPTuYTCZHuYhRDP/J0w148PdhnmZYGI
         1T1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724244638; x=1724849438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lBAMQJDmmTVkH6IjHf2EILSEoRh20JRqoBE3VTOnhDQ=;
        b=NBmeBbc3EHHMWX1Yj/XK8NTBJfq2xEBZGn5FamUQo0Dgg44T3hdW6fovgKyN3oIE/A
         h+SAkfQczYyiYMOfcvoH/NXUK9dUqB10s5psExWkBviwZ8hwHyn4eGvwgIo5IrS066Si
         erx+JtH6bmMfAS2q87BeSHg79OaS7Qd1ticy84iSJzWFg9inexDkNdKpUvOAmeZbD+RI
         J4u+h5AdTKxLs+EM5Vk1CakiizCrbp4xSmdLaBkr3iuRB87/Ry5EKbIHKGDWunXuxa6H
         QlcTaInS8RwxZ9GAOeeCAaM1s6lbYYt3p9tMvvlakR6QSToCJ9cw/nvN6fHsGEMX4miV
         0cew==
X-Gm-Message-State: AOJu0YzxFDyL7ok/nPw5uMULEm+yayLNbM1vbAa7tF07IRHHsJ4dsUaL
	TG682PFfuX/ovoyo+fJLVuhjpyTNMcK2iOwNaeM4gY6T39+cECwRm5+ptCX95rC8UNQJs1JZf5R
	OABE=
X-Google-Smtp-Source: AGHT+IGykLIvO2TVBKLcCsS4CWzyU205o4+gi6SPgHc8ls4/KCayUr4bM/RkUSfDWqdKg+ra4JACPQ==
X-Received: by 2002:a05:6a00:194b:b0:714:1f6d:11e5 with SMTP id d2e1a72fcca58-7142378e057mr2979452b3a.12.1724244637769;
        Wed, 21 Aug 2024 05:50:37 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7142a8a481dsm691789b3a.36.2024.08.21.05.50.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 05:50:37 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 02/18] Tiff: Security fix for CVE-2024-7006
Date: Wed, 21 Aug 2024 05:50:13 -0700
Message-Id: <7fd3c7e9742a4efa0fbebc1d0ed1da8f6d960175.1724244509.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1724244509.git.steve@sakoman.com>
References: <cover.1724244509.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Aug 2024 12:50:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203590

From: Siddharth Doshi <sdoshi@mvista.com>

Upstream-Status: Backport from [https://gitlab.com/libtiff/libtiff/-/commit/818fb8ce881cf839fbc710f6690aadb992aa0f9e]

CVE's Fixed:
CVE-2024-7006 libtiff: NULL pointer dereference in tif_dirinfo.c

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5313b4b233a486e8a1483757ad9c9aed3a213aae)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libtiff/tiff/CVE-2024-7006.patch          | 65 +++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.6.0.bb |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2024-7006.patch

diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2024-7006.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2024-7006.patch
new file mode 100644
index 0000000000..785244bdea
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2024-7006.patch
@@ -0,0 +1,65 @@
+From 8ee0e7d2bdcc1a5a5a3241904b243964ab947b7b Mon Sep 17 00:00:00 2001
+From: Su_Laus <sulau@freenet.de>
+Date: Fri, 1 Dec 2023 20:12:25 +0100
+Subject: [PATCH] Check return value of _TIFFCreateAnonField().
+
+Fixes #624
+
+Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/818fb8ce881cf839fbc710f6690aadb992aa0f9e]
+CVE: CVE-2024-7006
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ libtiff/tif_dirinfo.c |  2 +-
+ libtiff/tif_dirread.c | 16 ++++++----------
+ 2 files changed, 7 insertions(+), 11 deletions(-)
+
+diff --git a/libtiff/tif_dirinfo.c b/libtiff/tif_dirinfo.c
+index 0e705e8..4cfdaad 100644
+--- a/libtiff/tif_dirinfo.c
++++ b/libtiff/tif_dirinfo.c
+@@ -887,7 +887,7 @@ const TIFFField *_TIFFFindOrRegisterField(TIFF *tif, uint32_t tag,
+     if (fld == NULL)
+     {
+         fld = _TIFFCreateAnonField(tif, tag, dt);
+-        if (!_TIFFMergeFields(tif, fld, 1))
++        if (fld == NULL || !_TIFFMergeFields(tif, fld, 1))
+             return NULL;
+     }
+ 
+diff --git a/libtiff/tif_dirread.c b/libtiff/tif_dirread.c
+index 58a4276..738df9f 100644
+--- a/libtiff/tif_dirread.c
++++ b/libtiff/tif_dirread.c
+@@ -4275,11 +4275,9 @@ int TIFFReadDirectory(TIFF *tif)
+                                 dp->tdir_tag, dp->tdir_tag);
+                 /* the following knowingly leaks the
+                    anonymous field structure */
+-                if (!_TIFFMergeFields(
+-                        tif,
+-                        _TIFFCreateAnonField(tif, dp->tdir_tag,
+-                                             (TIFFDataType)dp->tdir_type),
+-                        1))
++                const TIFFField *fld = _TIFFCreateAnonField(
++                    tif, dp->tdir_tag, (TIFFDataType)dp->tdir_type);
++                if (fld == NULL || !_TIFFMergeFields(tif, fld, 1))
+                 {
+                     TIFFWarningExtR(
+                         tif, module,
+@@ -5153,11 +5151,9 @@ int TIFFReadCustomDirectory(TIFF *tif, toff_t diroff,
+                             "Unknown field with tag %" PRIu16 " (0x%" PRIx16
+                             ") encountered",
+                             dp->tdir_tag, dp->tdir_tag);
+-            if (!_TIFFMergeFields(
+-                    tif,
+-                    _TIFFCreateAnonField(tif, dp->tdir_tag,
+-                                         (TIFFDataType)dp->tdir_type),
+-                    1))
++            const TIFFField *fld = _TIFFCreateAnonField(
++                tif, dp->tdir_tag, (TIFFDataType)dp->tdir_type);
++            if (fld == NULL || !_TIFFMergeFields(tif, fld, 1))
+             {
+                 TIFFWarningExtR(tif, module,
+                                 "Registering anonymous field with tag %" PRIu16
+-- 
+2.44.1
+
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb
index d42ea6a6e5..89681be634 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb
@@ -16,6 +16,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2023-52355-0001.patch \
            file://CVE-2023-52355-0002.patch \
            file://CVE-2023-52356.patch \
+           file://CVE-2024-7006.patch \
            "
 
 SRC_URI[sha256sum] = "88b3979e6d5c7e32b50d7ec72fb15af724f6ab2cbf7e10880c360a77e4b5d99a"
-- 
2.34.1


