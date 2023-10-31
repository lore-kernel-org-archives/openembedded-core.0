Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DB01C4332F
	for <webhook@archiver.kernel.org>; Tue, 31 Oct 2023 04:27:48 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.179589.1698726465194532730
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Oct 2023 21:27:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=DYRdkHGt;
 spf=pass (domain: mvista.com, ip: 209.85.216.53, mailfrom: vanusuri@mvista.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-28035cf6a30so1562491a91.3
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Oct 2023 21:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1698726464; x=1699331264; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fDbGmOjpQWs/MLOVUsVFNaCKX8WpU5JLF861iwieBww=;
        b=DYRdkHGtakITTuY0wcTV/iIbQzFWltS4ZbtgMBRFBmpjOnLJtmq3Ur+Gt4MpML9BdG
         /PDJb4boynl9Z5VTzeCfLQyod76kzeZ5tmEZPHq37VCzmh+3+QATCgrt9ER3AwEpTJwr
         5QPN9C1uJpQ6oaAZLwNk70tbAwZ/z60CmWyq8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698726464; x=1699331264;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fDbGmOjpQWs/MLOVUsVFNaCKX8WpU5JLF861iwieBww=;
        b=jWZAi1utDVli3yrGp2se0NRJ4QMPHFx6kGE6nHllm2Fyj+qjwZrfvvz68NdhZEF4O9
         8zD6o0CDL586inZNIc61ZTTny8FXQQohszPChsTKirun/knrkEX9Riv4djQxydfKvwcb
         xACwBuRGuA5aQu3Hq+1EYio3E1W8g1GCWkrIBpl7as9U6VlT3mJoYBNtuudWslTKCZhD
         dFx+XaVfSJX8HiiwtFCCdhM1UpBcVzziyoiFPiKeL6X1+MBH3E4cfDfSO+qKxofMgUYT
         /g2OUaJnPcQJIy86UiAHL9d+3z/6e0eLvIzORmne1YDXGTBz9KeRmT9bJp/QHFJMGfwl
         UHXg==
X-Gm-Message-State: AOJu0Yx+lQUq7Y/dt7JTdY9PF+PjsP2W8Dehzzt/6SXHppCbiomwiL/r
	cl6rm3tFz6cCFXHaX0XjD9qpNn9Y++f1hE08yr8=
X-Google-Smtp-Source: AGHT+IFHhyR64aQgH83OiTdWW2TwTO4bUGyTdlybgqwXDjX9r9hb028frR5p2j1pzqEAktqsRu9d6Q==
X-Received: by 2002:a17:90a:f2d7:b0:27d:3439:c141 with SMTP id gt23-20020a17090af2d700b0027d3439c141mr8180162pjb.39.1698726464191;
        Mon, 30 Oct 2023 21:27:44 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c01c:7c68:c051:396e:dcea:8798])
        by smtp.gmail.com with ESMTPSA id h16-20020a17090adb9000b0027e289ac436sm266027pjv.8.2023.10.30.21.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 21:27:43 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][dunfell][PATCH] tiff: CVE patch correction for CVE-2023-3576
Date: Tue, 31 Oct 2023 09:57:34 +0530
Message-Id: <20231031042734.520582-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 04:27:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189824

From: Vijay Anusuri <vanusuri@mvista.com>

- The commit [https://gitlab.com/libtiff/libtiff/-/commit/881a070194783561fd209b7c789a4e75566f7f37]
fixes CVE-2023-3576
- Hence, renamed the CVE-2023-3618-1.patch to CVE-2023-3576.patch
- Reference: https://security-tracker.debian.org/tracker/CVE-2023-3576
             https://security-tracker.debian.org/tracker/CVE-2023-3618

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../files/{CVE-2023-3618-1.patch => CVE-2023-3576.patch}      | 3 ++-
 .../files/{CVE-2023-3618-2.patch => CVE-2023-3618.patch}      | 0
 meta/recipes-multimedia/libtiff/tiff_4.1.0.bb                 | 4 ++--
 3 files changed, 4 insertions(+), 3 deletions(-)
 rename meta/recipes-multimedia/libtiff/files/{CVE-2023-3618-1.patch => CVE-2023-3576.patch} (93%)
 rename meta/recipes-multimedia/libtiff/files/{CVE-2023-3618-2.patch => CVE-2023-3618.patch} (100%)

diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2023-3618-1.patch b/meta/recipes-multimedia/libtiff/files/CVE-2023-3576.patch
similarity index 93%
rename from meta/recipes-multimedia/libtiff/files/CVE-2023-3618-1.patch
rename to meta/recipes-multimedia/libtiff/files/CVE-2023-3576.patch
index 35ed852519..67837fe142 100644
--- a/meta/recipes-multimedia/libtiff/files/CVE-2023-3618-1.patch
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2023-3576.patch
@@ -4,8 +4,9 @@ Date: Tue, 7 Mar 2023 15:02:08 +0800
 Subject: [PATCH] Fix memory leak in tiffcrop.c
 
 Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/881a070194783561fd209b7c789a4e75566f7f37]
-CVE: CVE-2023-3618
+CVE: CVE-2023-3576
 Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
 ---
  tools/tiffcrop.c | 7 ++++++-
  1 file changed, 6 insertions(+), 1 deletion(-)
diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2023-3618-2.patch b/meta/recipes-multimedia/libtiff/files/CVE-2023-3618.patch
similarity index 100%
rename from meta/recipes-multimedia/libtiff/files/CVE-2023-3618-2.patch
rename to meta/recipes-multimedia/libtiff/files/CVE-2023-3618.patch
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
index 6df4244697..d27381b4cd 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
@@ -43,8 +43,8 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2023-26966.patch \
            file://CVE-2023-2908.patch \
            file://CVE-2023-3316.patch \
-           file://CVE-2023-3618-1.patch \
-           file://CVE-2023-3618-2.patch \
+           file://CVE-2023-3576.patch \
+           file://CVE-2023-3618.patch \
           "
 SRC_URI[md5sum] = "2165e7aba557463acc0664e71a3ed424"
 SRC_URI[sha256sum] = "5d29f32517dadb6dbcd1255ea5bbc93a2b54b94fbf83653b4d65c7d6775b8634"
-- 
2.25.1


