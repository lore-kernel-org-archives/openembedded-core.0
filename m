Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E118C83F01
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 12:21:32 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.12263.1693398082999589261
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Aug 2023 05:21:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=fiw3z51R;
 spf=pass (domain: mvista.com, ip: 209.85.216.43, mailfrom: hprajapati@mvista.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-26d5970cd28so3158376a91.2
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 05:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1693398082; x=1694002882; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fliDh73+BmdjKxa3lg6CyuUjWv5xm/x60nvcLSPHjqk=;
        b=fiw3z51R6i+yKE9qXE1+7abg94M/YWsdhuEM9FrTK3Uz9oNr7xivEVhcMmnbXsh015
         DZotU6ke2d+ApnVZ8vTI17+UNAp93VSUr/OcZC4S7OZxCqvRgZTkLAPDaCRyGnLckYqY
         4KvV4LS67u03dBVFNyjw2ygh9z4Qy3oMMch7g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693398082; x=1694002882;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fliDh73+BmdjKxa3lg6CyuUjWv5xm/x60nvcLSPHjqk=;
        b=i87Q3NAno4DFUWZcJ6HlWDliqcIcLfqo4TFnpVBvteXX0R4SzVonnVr/TZVaJrfdXE
         PiIGAnj5D3SYi0FMEUVuODVvk9FHI/VhsCU8VAA9L6sk6elhvwoqBrwpc0D1pXUNoIkh
         q2Fx5q2VYTXQX7PENDcqV7AY+zbZ/MR2HMszIBUCaC0aAKWfqKYsqY9EaNOKMjMqLDgm
         dBM1TsCtAayE1NCUPY7+J6zPmnUmHvMctiBznIXfzXAufytWcryqLYqJ+co32t9PdXtg
         dHsQwobtgLDV/ogJdd1aK8lXAAY7uAIos12YxNPjUZrTZQE5iEZZXqjlOfEXwaBnLD3r
         sWWg==
X-Gm-Message-State: AOJu0Yz676PI6IhTW633rKIK2jp327q2Qk5gNEj2pGnt6YMzdX2k5vtE
	oXwFeMSBoJtxO+EmkZRtBMKF+9BeIJW/eaDMbvGAmA==
X-Google-Smtp-Source: AGHT+IHHcmXm2LGXlR8N+33nVznCFcvrECXu2M4Gs1ZAteEmS/gAo3U82kISf2TLnLsDB9JKTlWpew==
X-Received: by 2002:a17:90b:2392:b0:267:75ce:f6d9 with SMTP id mr18-20020a17090b239200b0026775cef6d9mr1708526pjb.3.1693398081967;
        Wed, 30 Aug 2023 05:21:21 -0700 (PDT)
Received: from MVIN00016.mvista.com ([103.250.136.242])
        by smtp.gmail.com with ESMTPSA id cq14-20020a17090af98e00b00263e4dc33aasm1161519pjb.11.2023.08.30.05.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 05:21:21 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [kirkstone][PATCH] libtiff: fix CVE-2023-26966 Buffer Overflow
Date: Wed, 30 Aug 2023 17:51:14 +0530
Message-Id: <20230830122114.26745-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 12:21:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186884

Upstream-Status: Backport from https://gitlab.com/libtiff/libtiff/-/commit/b0e1c25dd1d065200c8d8f59ad0afe014861a1b9

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
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
2.25.1


