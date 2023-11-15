Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73E70C47075
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 03:17:46 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.5026.1700018265950656866
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Nov 2023 19:17:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=n20/gOkb;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1cc3bc5df96so47786245ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Nov 2023 19:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1700018264; x=1700623064; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FB1rDZKdIyjbZSl67obGJQ9hecyACJqy+Nmr5tVmiRE=;
        b=n20/gOkbDv3wErPHSZmlM4KOAlcrLuJ9Ojrx6GKA18jt4SWPAhb9c05yBxRLlI30oW
         lUkTqaxblw8PInKnWucebi3bJrSf30Vg+/kQoCkBO1fIXI/zkTAgtUkzd8c7aOQqqftf
         FfoqZDNYqVkVdJkawefT6yy5OxzXy2SbSRqCsKvQGrpp7BnjJggqIhBC65X4gGQjvESl
         RcGhy6+8jrTT2Y3hSKqQp1PJeH8XoW/lK5X8cCr6sFZ7XnYDhe0sVhmyyP0ILVCDY3j0
         LKvdv+lL1pDXd2frL/78GI8bNVG3FbqE+O8Tgsd/QTdQjYkJgz6S87aJjUML05zFxmhJ
         8lTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700018264; x=1700623064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FB1rDZKdIyjbZSl67obGJQ9hecyACJqy+Nmr5tVmiRE=;
        b=cdFyLcypB5MuLmZ6jazjhjD906m3mzw8xzsiUQ2VTs+FJW2Grbo3Z60x4UrJAmQ1ss
         sCt4alBMPzvJvMFLrx0dm6PCyRVcHHKM9VAGmJ1jb5+A5hcoQBhoRwfxSDmDKtEbnEwD
         pgUab9l9Nz7XdHBsrDwiia2D9chZ2DRgQSmFygHZl3jHP1RHxiDk+VS7GvBW9PtuYYKK
         bnXw0QidxtTKCa4mBUlY0Do+Ak9jletOv60xlX1TK6k/yZm9gEky7a+ewFrhCB3vBWMW
         sQUw3piaSSt4NGel80n533Ml7Z0PPs5qoJ+JF4zck1dNh6EGL/QU/9wxlKX6Fja6yeID
         BG9w==
X-Gm-Message-State: AOJu0YyQtHweJhx1hJ30MbDSE430cwnU1VKReSYoRAC52jLBWfnhhTrG
	MKsNaEbKxc2e+7BqdACtF8FENpCLa9SawTlm4KMeOQ==
X-Google-Smtp-Source: AGHT+IH93YfIzm+9hh8RzbNCq7xBVXAqjRYyuP/njaHI9xlYLt8/hAFBvxl/2cNyZlhjEYUcJbchGg==
X-Received: by 2002:a17:902:d2c1:b0:1cc:251c:c381 with SMTP id n1-20020a170902d2c100b001cc251cc381mr4462541plc.29.1700018264431;
        Tue, 14 Nov 2023 19:17:44 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id l5-20020a170903120500b001c6187f2875sm6369300plh.225.2023.11.14.19.17.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 19:17:44 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/17] tiff: CVE patch correction for CVE-2023-3576
Date: Tue, 14 Nov 2023 17:17:19 -1000
Message-Id: <56088368bdd22a939b813c7aefd5ba475c6d4021.1700018112.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700018112.git.steve@sakoman.com>
References: <cover.1700018112.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 03:17:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190532

From: Vijay Anusuri <vanusuri@mvista.com>

- The commit [https://gitlab.com/libtiff/libtiff/-/commit/881a070194783561fd209b7c789a4e75566f7f37]
fixes CVE-2023-3576
- Hence, renamed the CVE-2023-3618-1.patch to CVE-2023-3576.patch
- Reference: https://security-tracker.debian.org/tracker/CVE-2023-3576
             https://security-tracker.debian.org/tracker/CVE-2023-3618

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


