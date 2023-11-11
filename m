Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2841C4332F
	for <webhook@archiver.kernel.org>; Sat, 11 Nov 2023 15:03:23 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.52961.1699714995737279629
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Nov 2023 07:03:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=mjAOTlSo;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1cc58219376so27051615ad.1
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Nov 2023 07:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1699714994; x=1700319794; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FB1rDZKdIyjbZSl67obGJQ9hecyACJqy+Nmr5tVmiRE=;
        b=mjAOTlSoaUXTPmlezz22Q8hZ3mNRmc+pq2AI/qNgDe5zMHgyYexzaSEHQlcu2aiAAz
         T7LyNNYi/fEuioDM5TAwzJZukln3ZJ+5sLo0rTg6VMsG9kQ1305ZzWSrgOgwixCzk5mJ
         FWBIfuhuZR+ORCp0KWogngI2vLxktodbyFaXmIJun1i9VPwuPf/wSwnQHpeOw9oXpuGD
         JaPUYGKvyDeo94nZvTxk6QctY6R5NBuTdwPLmcSOcbxKSJ/IqfSSxBr7kX2mCz5fJPtY
         cW8PPIhI4syStjgF8DCrHQxeyrMQV1aWXrKvdUUu/RtlO8hwmqXMpchz2/3Ozheq48GV
         CyoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699714994; x=1700319794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FB1rDZKdIyjbZSl67obGJQ9hecyACJqy+Nmr5tVmiRE=;
        b=Ijwh+715eBOG1wu8BMUkY6JJvjBoHnR5k0LodmAQ79RwpeMMSir2hD9BP436B5ao9N
         6xCjhVb3K1DOHLjqR+6Lmj2MY0Ggy7eE68bJ9pS9TWjywEvxj3xVll8UgPu34hFcp5xR
         QN0oioZMGirzfoUMz/LW9cZ0zNiCdTbOfKKtDnH931SOmboW5O9IOUnekBBqUYhipxOI
         sKENORxwHGuh36GyhwdoRwh7kvEiZKNkQe9+O6IT5Aft9UQeVB/o+nEHGqvbyrm+Yx2C
         TGLZ87+dpGgD7kdSpkStBnz610YrqjmSECHI/C9wSSxKZDKVLX+3L53PXRToKEALqHOy
         v2Hw==
X-Gm-Message-State: AOJu0Yw9ZGQ8CJwsHUpv1NO+AVvYsGFiKLTINEzBbSRY90mp189EhyhL
	eLWJoje5pcvkNwD3T3ZiAcZDPvgPTQYeAw66ye9AAA==
X-Google-Smtp-Source: AGHT+IH6jTxXgOlnH7kyxqiUePEUKsclCjIaeWY4Kom7d+im1q9sbzJI94vCtGSDXwXh+992FWICvA==
X-Received: by 2002:a17:903:278b:b0:1cc:686a:4120 with SMTP id jw11-20020a170903278b00b001cc686a4120mr2502564plb.55.1699714994427;
        Sat, 11 Nov 2023 07:03:14 -0800 (PST)
Received: from hexa.lan (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id y18-20020a1709027c9200b001b53c8659fesm1379200pll.30.2023.11.11.07.03.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Nov 2023 07:03:14 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/15] tiff: CVE patch correction for CVE-2023-3576
Date: Sat, 11 Nov 2023 05:02:51 -1000
Message-Id: <56088368bdd22a939b813c7aefd5ba475c6d4021.1699714834.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1699714834.git.steve@sakoman.com>
References: <cover.1699714834.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Nov 2023 15:03:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190417

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


