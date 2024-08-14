Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 074B4C3DA4A
	for <webhook@archiver.kernel.org>; Wed, 14 Aug 2024 18:19:43 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.105220.1723659579086856775
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Aug 2024 11:19:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=jB/hlerM;
 spf=pass (domain: mvista.com, ip: 209.85.210.180, mailfrom: sdoshi@mvista.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-71275436546so78521b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Aug 2024 11:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1723659578; x=1724264378; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3qeDA9pngf76U+je6zKviBbGiVaKPKbDsiIcZl7h3NQ=;
        b=jB/hlerMaS35cwjJbtv6JesEM+RWQAacjg9AGyrwQg/nqpyq4evBl/wYef4DUUibvc
         FQybq0o5HMFN0aKTNePiyIcL5aakCfQR3w61VhrhUMaEVniYxr9dxHMPoI1ldET2rbxr
         2v6kuTHLN4HkisNMWBvV2haLVc3fYu4CpdfNg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723659578; x=1724264378;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3qeDA9pngf76U+je6zKviBbGiVaKPKbDsiIcZl7h3NQ=;
        b=DOGo3IbbR/k7y9xOWCMr+JfK2+t9L2soksFmMLpoSrj0yXLMbW7FiOTU51pz1xshOo
         KJu14/Gw6JlKl8luhGVRnaBDsBMQKsjDTvWURhv3nchCU+79aTC3Rp2xVQKWKZpOqTmS
         /RKqjBqrWZM2WFtH5eGlRE4ecXJRIuNV/1vO7/WD27sOOlcCWQ87qclKs1wQw3QP0V/A
         u5O4O5OmhR86Gn46zp3wmgV3o/uRRoP4nM98r/RHjOwWNcM6vaYBqBho2q0Iz8o13Mju
         9estOs7dqYEHhuOC2t80lafXC1F4jakpImLtS4NxVUSJ9Dw9sJhPu/AleWOLA/9gtlvr
         3WlQ==
X-Gm-Message-State: AOJu0YwLuI/j4kE0Xd6aK7ZmPe8nakiy44KEo0HFJHuFI/9g35mfnqvG
	vVpWebhXFgItzXWBLwRXrdDune/pFtHwiK8y47X/xa430lwx1sy2xkQqVAgh6yNFYQfk1QUjp8b
	O
X-Google-Smtp-Source: AGHT+IGRR9RB8BNMEXkWIA1UQ+3VskJnfvMQPUbghkHXm1rsdg0Zy31yshbSZovSsuvWjJ4VTk6n6w==
X-Received: by 2002:a05:6a20:9e4e:b0:1c8:b145:29cd with SMTP id adf61e73a8af0-1c8eaeb1d64mr4793657637.24.1723659578053;
        Wed, 14 Aug 2024 11:19:38 -0700 (PDT)
Received: from siddharth-latitude-3420.mvista.com ([157.32.46.131])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-710e58aa3ecsm7656682b3a.49.2024.08.14.11.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 11:19:37 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][master][scarthgap][PATCH] Tiff: Security fix for CVE-2024-7006
Date: Wed, 14 Aug 2024 23:49:23 +0530
Message-Id: <20240814181923.40483-1-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Aug 2024 18:19:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203327

From: Siddharth Doshi <sdoshi@mvista.com>

Upstream-Status: Backport from [https://gitlab.com/libtiff/libtiff/-/commit/818fb8ce881cf839fbc710f6690aadb992aa0f9e]

CVE's Fixed:
CVE-2024-7006 libtiff: NULL pointer dereference in tif_dirinfo.c

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
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


