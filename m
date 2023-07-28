Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31686C001DE
	for <webhook@archiver.kernel.org>; Fri, 28 Jul 2023 05:53:25 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.26668.1690523598099963611
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jul 2023 22:53:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Mlz4AFI/;
 spf=pass (domain: mvista.com, ip: 209.85.214.173, mailfrom: hprajapati@mvista.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1bbc7b2133fso11089725ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 22:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1690523597; x=1691128397;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fliDh73+BmdjKxa3lg6CyuUjWv5xm/x60nvcLSPHjqk=;
        b=Mlz4AFI/inPPz8dkaeJKTRTa9Fjtqt/wOMgmecfxNjz7a5/GC58xRkyouOgpwzzxFM
         i4BjHzeBrPeJRiXdOGepXRPjb4YXl6RU+xKO644MS7EVJjmc9S52HkToxuSdk6PhDzOJ
         tStc+NHEhE/8e6PrKOuKZqTl19XwX3oV+7IOU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690523597; x=1691128397;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fliDh73+BmdjKxa3lg6CyuUjWv5xm/x60nvcLSPHjqk=;
        b=Fwna4vWVjjhMfgNbxVrBPw0udsnYcBn1/GyR6u4KCxvUkTqM9ISTrO8SWEis7LM3ju
         t55xuZaaYuYSNoeEJ+SFKiW+BAiSVpYeHr1UUB12wynBFAiiVRT1NWM/krsbGKC0PzGE
         QhNUpE4MNWF1eDI7BMU5+3U/T0zL2+a7T1W6aFihvD4vLtayLlXFIDvu3jt2YJ4qEqMb
         bQRKVj4Cwa8WRqAy8/gnu22MMS98p0ey+FsZz0dvE+JsYJFF23ShVzn31mvCUpi3cdfm
         6CZ7w/YzH/+c+Vl8PX3p3QElb7S+yW7gkXDKk8nxW2+uLcQGAct2IK+4JlfOj/S5GFZs
         tCxQ==
X-Gm-Message-State: ABy/qLaEQXOnyStVXf2lQj5P5DzsloPIm2pkUIfBw9vBe9sEZjPo5dVw
	FvDe2FE2pI4HyiUrnAP7mJSojdqbzVBKWja6nHs=
X-Google-Smtp-Source: APBJJlFSkguWZES1hzb+8B1XkcfzZTNqNzSDmhk+h5o30VDpdhVf9WslxAYyDrLetRdFOKMGVgS8MA==
X-Received: by 2002:a17:902:8217:b0:1b6:771a:3516 with SMTP id x23-20020a170902821700b001b6771a3516mr642008pln.22.1690523597242;
        Thu, 27 Jul 2023 22:53:17 -0700 (PDT)
Received: from MVIN00024 ([43.249.234.171])
        by smtp.gmail.com with ESMTPSA id c17-20020a170903235100b001bb9d6b1baasm2616955plh.198.2023.07.27.22.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 22:53:16 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation); Fri, 28 Jul 2023 11:23:11 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [kirkstone][PATCH] libtiff: fix CVE-2023-26966 libtiff: Buffer Overflow
Date: Fri, 28 Jul 2023 11:23:10 +0530
Message-Id: <20230728055310.23309-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Jul 2023 05:53:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185013

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


