Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65C7DCD1296
	for <webhook@archiver.kernel.org>; Wed,  3 Apr 2024 16:57:38 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web10.17009.1712163452223383693
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Apr 2024 09:57:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=Cn5oZCn9;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.173, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-78a5580333bso1229685a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Apr 2024 09:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1712163451; x=1712768251; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=UtOOlxXx7WDAqRlg0y1sqkRn0z6uv+U5uKq1DbUh/hU=;
        b=Cn5oZCn9N6+APn4IH8Qyj7UWR7vbkn0Qb9tBKt+eQk0Va7juKsfCxXyzAjwJv7iave
         JpIhAVQYVFZoqvPm27ivRWaWL4qfs71fdh6kgL8OI+iw8BvC91UfrlfrbY1cDMDszPZh
         doerAS+cmYCn2GVeicwjpMDxTF56M8cfq+0ovuwYFd38+ebCkg4A0z33r+ys5Gb9wMyf
         cFRnX3cL/WHg0ORuhXCfJIpdg/yIe9S5fodZH8jHuc50ItkHriOC0cbsbQhzmp1HbiSN
         xnctju7TgTivH4Zg/jD1lWMCT2wKEtN3eo2MSdMKtcyPX6fSwo74uAizO3YHONEKdveB
         XTIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712163451; x=1712768251;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UtOOlxXx7WDAqRlg0y1sqkRn0z6uv+U5uKq1DbUh/hU=;
        b=fij3X0iouA6/iyyqF4YKYdaTBqCZhAqFnJNCe5lAr9E86SYmgUdSVW6XSF943k00vR
         1VLQ66OduSWL4x5C6uJab6BXZPvZWOmtlqzxC5bUNrtKrjGHbw1gbcAWAzAHUU3p1iCN
         e0Gjhjw+xNhUHKYoq/biLleZLtiwi//uq69iPxbJSQQwbw5ajlWKUmxCtn+U0A+3dIPz
         03cIwY0KTTiCbacnIEHsJB8OiIxSHoDUUS0HNKYSRrDwVK3x9+uhm50XRKOX444+1sk9
         4rmQn2fuz16SRmXnB2mPqgLU5bWTD+DchjdN8aAyVwp64jb2CKIlOq2Z+ZJEfHIdIcV/
         eMyw==
X-Gm-Message-State: AOJu0YxnoSfo7a/JC5oOTGcXDqrPLUVO8pBRYsGlaSzxJhKPad5/y5YS
	BZPD1z0tZATEsHz6l2sDi4BK07ZK4Pefzn1jJJrJr2O3rx14s07/05+lVexYiOM1aGTcgMEYsT8
	=
X-Google-Smtp-Source: AGHT+IEWDf9DHUljn5YZKzL3+eLxgHgxH8NF00CvjTzI5m5Yi4fTnFcJJ4tx1bzxtC5J1FGEyKnvWg==
X-Received: by 2002:a05:620a:811b:b0:78a:303f:700 with SMTP id os27-20020a05620a811b00b0078a303f0700mr17204098qkn.23.1712163451077;
        Wed, 03 Apr 2024 09:57:31 -0700 (PDT)
Received: from localhost ([2605:a601:a699:ba00:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id vq18-20020a05620a559200b0078be6590696sm2334088qkn.102.2024.04.03.09.57.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 09:57:30 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 1/2] acpica: use github for SRC_URI
Date: Wed,  3 Apr 2024 12:57:24 -0400
Message-Id: <20240403165725.2624214-1-jdmason@kudzu.us>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Apr 2024 16:57:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197934

Github is now the location of the ACPICA source code, per
https://www.intel.com/content/www/us/en/developer/topic-technology/open/acpica/download.html
Update to this location.  Also, this allows for devtool check for new
versions (in theory), and allows for an easier collection of the
changelog when updating versions.

Using the SRCREV SHA that matches the tarball release.  So, this should
match what is currently being used.

Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 meta/recipes-extended/acpica/acpica_20230628.bb | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-extended/acpica/acpica_20230628.bb b/meta/recipes-extended/acpica/acpica_20230628.bb
index 8974bdc1f1a6..16b3054c3a2b 100644
--- a/meta/recipes-extended/acpica/acpica_20230628.bb
+++ b/meta/recipes-extended/acpica/acpica_20230628.bb
@@ -16,13 +16,10 @@ COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 
 DEPENDS = "m4-native flex-native bison-native"
 
-SRC_URI = "https://downloadmirror.intel.com/783534/acpica-unix-${PV}.tar.gz"
-SRC_URI[sha256sum] = "86876a745e3d224dcfd222ed3de465b47559e85811df2db9820ef09a9dff5cce"
+SRC_URI = "git://github.com/acpica/acpica;protocol=https;branch=master"
+SRCREV = "f16a0b4d0f0edd7b78a332fcf507be2187fac21e"
 
-UPSTREAM_CHECK_URI = "https://www.intel.com/content/www/us/en/download/776303/acpi-component-architecture-downloads-unix-format-source-code-and-build-environment-with-an-intel-license.html"
-UPSTREAM_VERSION_UNKNOWN = "1"
-
-S = "${WORKDIR}/acpica-unix-${PV}"
+S = "${WORKDIR}/git"
 
 inherit update-alternatives
 
-- 
2.30.2


