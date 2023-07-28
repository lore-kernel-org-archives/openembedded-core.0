Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13CDEC001DE
	for <webhook@archiver.kernel.org>; Fri, 28 Jul 2023 05:54:25 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.26678.1690523659668331312
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jul 2023 22:54:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=dbuoqzcE;
 spf=pass (domain: mvista.com, ip: 209.85.210.176, mailfrom: hprajapati@mvista.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-686ba29ccb1so1091241b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 22:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1690523659; x=1691128459;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fliDh73+BmdjKxa3lg6CyuUjWv5xm/x60nvcLSPHjqk=;
        b=dbuoqzcED2LnAiuN3OoYuxx5YJoT19sJyqTRtBoJfB3Vl0VYrdB/tgOXknQdpqeh9b
         u5pBuzZKjRvYtWycKAJcGtKY2zczNH6X7dt5C3K4DjPbRuAjNk0MhIYrAe9/HNVbdouz
         VTqHNHQzORcpPSFiVgpDs4ZWE8t9O1nkTFOsg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690523659; x=1691128459;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fliDh73+BmdjKxa3lg6CyuUjWv5xm/x60nvcLSPHjqk=;
        b=VApPBqwCQ08VxO2Eg5GNSGWJ6azLzvYbP4By2ffW+LiYbT66oWI8aV/4tlekRY8tZX
         8QZR50Ehea/BccuQsZ+yn237huDY3SRJ2jovqMH16ZiGJqDd1JTBFW8nkdYzoJ9SbEea
         gOBfTML9BEMnkq+hC+2zJ+VTggChXCky7CzNn7WLMrk1jneX+scNA3dgdmgwtatxf+U6
         e6m0ViluHtkOKJn+fzNqAsLILODknpIbeXhoRkcCFbspLWV9G4+xn3QfCVpVDmC+/6AB
         RLCh1CnU+BLjrxIMoZFy3wbJRcncpQyxiff7gZHO0qli4pGbEyG/XAyHJSgxUEE+Voyk
         WO6Q==
X-Gm-Message-State: ABy/qLbArQyolC9NDwF8vuM1hFq7qV1KAQoavku5+UMczLFytXAYruTc
	YCKuTIDwlpZuIsFYFr3AbLtiNvWu6awzWXVA3zQ=
X-Google-Smtp-Source: APBJJlFmuqfRyLu5v1oqX43sL5bahCXlzLM1Vn/iGrdcgH8VkPDrN6iyP8Pa2jPOyYHZYrqsfNLbog==
X-Received: by 2002:a05:6a00:2d0f:b0:668:8ad5:778f with SMTP id fa15-20020a056a002d0f00b006688ad5778fmr1217661pfb.17.1690523658843;
        Thu, 27 Jul 2023 22:54:18 -0700 (PDT)
Received: from MVIN00024 ([43.249.234.171])
        by smtp.gmail.com with ESMTPSA id j8-20020aa78d08000000b006828e49c04csm2408867pfe.75.2023.07.27.22.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 22:54:18 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation); Fri, 28 Jul 2023 11:24:13 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [kirkstone][PATCHv2] libtiff: fix CVE-2023-26966 Buffer Overflow
Date: Fri, 28 Jul 2023 11:24:12 +0530
Message-Id: <20230728055412.23404-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Jul 2023 05:54:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185014

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


