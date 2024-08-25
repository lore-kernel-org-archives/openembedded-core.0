Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49086C54732
	for <webhook@archiver.kernel.org>; Sun, 25 Aug 2024 18:50:05 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.37431.1724611799279652704
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Aug 2024 11:49:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=zQmrgA9A;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2d3e46ba5bcso2513946a91.0
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Aug 2024 11:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1724611798; x=1725216598; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BnfIkqWPbJGS11lpTEkZEtvnDCdQD20SbCcsLCLKFss=;
        b=zQmrgA9AI8nOEVOJ8YSjxw6OsyDLJSBG0ZaQoJwEg+7vO7ykkUO6CbqsosVxdA4bkG
         PKQ3gb8Zyqy/R203xXcKbKloEziEKbc4BRIP0G8uHlEKKk/IIp3kqZkIvkevFclLEFmK
         0g9oCdHwXThjQAqCqcpAtY0JoKgYPqgYrW+ZAuQw5eX/uOV0c2qMKuIHUukdHuD1TVxe
         Mz/jAToCY9uGwbTCOWOys6wWINDTJPcLKWV2pXVrk3zNJue6d5qrQwIwG/aZQDLeKiba
         Qi+aU99PzSbcjXkPwYFHgMy15UJDLmLy+qvK7F0EstE5s7nDpzYF4qGJO868KKkmLEde
         EpFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724611798; x=1725216598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BnfIkqWPbJGS11lpTEkZEtvnDCdQD20SbCcsLCLKFss=;
        b=ZlrgiMuve/Rt3a/vFX567zetHBtZyVObzWc+NHjzs1pqoZd3JlIGyPeyWEiIKoOccN
         5KYsmUFqF4LF3zGSEkevXQvTKvFhnk9cMhhUA//2RrtM5eqFnamGkBVnaikmimtwPdQ+
         cYJocKL6KmfaNRXdV8kaTgyQFOoriLSKzgci1lExQqocWDSNd3+0O4YSSdOuid9p9JwB
         lUdbcIILUA3uQhqYQqiaEKwPEvn1bkK+VW/hsFDAg4ScW3yigdYtwZn+Hs4afgOX7RAp
         bSZUVG+b4SKC4ClwlnGgHYdAlY+ouRhFjN162kZdi04bXkufAQIHQXfptCrFnYIy/MW9
         YegA==
X-Gm-Message-State: AOJu0YzTjchUSm+Qw3RmUc4OZa4RN58WE1k6OMXLIoYo/4FeIuFu2crw
	AV7GqAcMC0Bh2Gv4uq7nJbFiVdw7hCeNh/Pr4Onabx7W5qPwc/u7CjboUfbO2GNZPicIxv4JM5S
	3io/P2Q==
X-Google-Smtp-Source: AGHT+IG8isbP42g43UAy2yc1SP8ON6/Zt4eLm/4qPX8hNgi5bbQw5Nknbru7LXQr/cKvBbexZQrIVw==
X-Received: by 2002:a17:90b:1e06:b0:2d3:b643:8386 with SMTP id 98e67ed59e1d1-2d646b8b7f5mr6871825a91.9.1724611798407;
        Sun, 25 Aug 2024 11:49:58 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d61391fe09sm8294216a91.19.2024.08.25.11.49.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Aug 2024 11:49:58 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 2/6] Tiff: Security fix for CVE-2024-7006
Date: Sun, 25 Aug 2024 11:49:47 -0700
Message-Id: <bacab52b3d101ee99753f14542a56340dd589425.1724611692.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1724611692.git.steve@sakoman.com>
References: <cover.1724611692.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Aug 2024 18:50:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203727

From: Siddharth Doshi <sdoshi@mvista.com>

Upstream-Status: Backport from [https://gitlab.com/libtiff/libtiff/-/commit/818fb8ce881cf839fbc710f6690aadb992aa0f9e]

CVE's Fixed:
CVE-2024-7006 libtiff: NULL pointer dereference in tif_dirinfo.c

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libtiff/tiff/CVE-2024-7006.patch          | 64 +++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |  1 +
 2 files changed, 65 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2024-7006.patch

diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2024-7006.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2024-7006.patch
new file mode 100644
index 0000000000..217de0ea92
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2024-7006.patch
@@ -0,0 +1,64 @@
+From 818fb8ce881cf839fbc710f6690aadb992aa0f9e Mon Sep 17 00:00:00 2001
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
+ libtiff/tif_dirread.c | 15 ++++++---------
+ 2 files changed, 7 insertions(+), 10 deletions(-)
+
+diff --git a/libtiff/tif_dirinfo.c b/libtiff/tif_dirinfo.c
+index a212d01..95226a8 100644
+--- a/libtiff/tif_dirinfo.c
++++ b/libtiff/tif_dirinfo.c
+@@ -797,7 +797,7 @@ _TIFFFindOrRegisterField(TIFF *tif, uint32_t tag, TIFFDataType dt)
+ 	fld = TIFFFindField(tif, tag, dt);
+ 	if (fld == NULL) {
+ 		fld = _TIFFCreateAnonField(tif, tag, dt);
+-		if (!_TIFFMergeFields(tif, fld, 1))
++		if (fld == NULL || !_TIFFMergeFields(tif, fld, 1))
+ 			return NULL;
+ 	}
+ 
+diff --git a/libtiff/tif_dirread.c b/libtiff/tif_dirread.c
+index 0e283fc..1781166 100644
+--- a/libtiff/tif_dirread.c
++++ b/libtiff/tif_dirread.c
+@@ -3735,11 +3735,9 @@ TIFFReadDirectory(TIFF* tif)
+ 				    dp->tdir_tag,dp->tdir_tag);
+ 				/* the following knowingly leaks the 
+ 				   anonymous field structure */
+-				if (!_TIFFMergeFields(tif,
+-					_TIFFCreateAnonField(tif,
+-						dp->tdir_tag,
+-						(TIFFDataType) dp->tdir_type),
+-					1)) {
++                const TIFFField *fld = _TIFFCreateAnonField(
++                    tif, dp->tdir_tag, (TIFFDataType)dp->tdir_type);
++                if (fld == NULL || !_TIFFMergeFields(tif, fld, 1)) {
+ 					TIFFWarningExt(tif->tif_clientdata,
+ 					    module,
+ 					    "Registering anonymous field with tag %"PRIu16" (0x%"PRIx16") failed",
+@@ -4502,10 +4500,9 @@ TIFFReadCustomDirectory(TIFF* tif, toff_t diroff,
+ 			TIFFWarningExt(tif->tif_clientdata, module,
+ 			    "Unknown field with tag %"PRIu16" (0x%"PRIx16") encountered",
+ 			    dp->tdir_tag, dp->tdir_tag);
+-			if (!_TIFFMergeFields(tif, _TIFFCreateAnonField(tif,
+-						dp->tdir_tag,
+-						(TIFFDataType) dp->tdir_type),
+-					     1)) {
++            const TIFFField *fld = _TIFFCreateAnonField(
++                tif, dp->tdir_tag, (TIFFDataType)dp->tdir_type);
++            if (fld == NULL || !_TIFFMergeFields(tif, fld, 1)) {
+ 				TIFFWarningExt(tif->tif_clientdata, module,
+ 				    "Registering anonymous field with tag %"PRIu16" (0x%"PRIx16") failed",
+ 				    dp->tdir_tag, dp->tdir_tag);
+-- 
+2.35.7
+
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
index b4af179e76..209b38b8f2 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
@@ -53,6 +53,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2023-6277-2.patch \
            file://CVE-2023-6277-3.patch \
            file://CVE-2023-6277-4.patch \
+           file://CVE-2024-7006.patch \
            "
 
 SRC_URI[sha256sum] = "0e46e5acb087ce7d1ac53cf4f56a09b221537fc86dfc5daaad1c2e89e1b37ac8"
-- 
2.34.1


