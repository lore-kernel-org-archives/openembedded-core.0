Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6DC2C02198
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 16:41:40 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.92640.1738600898438158807
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 08:41:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RV4F4O34;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4361e89b6daso32204095e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 08:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738600896; x=1739205696; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F8501HG/H0NUL7jvSfPPDUvaeSFcKBJhfnPCB/f9jV8=;
        b=RV4F4O34Z0G6/sFVprpv3Ur7GvkULZ5qQ9qmGPLjkYzTJDQ/KHCSiXuF1i/3gSNLt1
         HUwJilcRkl1kOUeG3p2l3iU4pcqywpVgbl6ThxvxJb+Qxo9PuhRa4kWbSbIj8aX837KH
         HS8ruQG9xjTNpTM4gW44gNlmiedvP9em/zEJg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738600896; x=1739205696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F8501HG/H0NUL7jvSfPPDUvaeSFcKBJhfnPCB/f9jV8=;
        b=eGyYMreB9JB4ErF/zJfNB2r/j9rhwBw5OUk50+EhATGzGsZB5R5UIxAjNJwHe/DOOw
         En5SbqoS8yk6nyQh1y1DCWpUuH8ajcRf0nuljwEYH9as0Gdov4pQ+BFZ6XrpFOGwMVLZ
         DN+odSC7ON1qSmVSyCngGM7f3nOdnCV9XWu11xBkZYI8Va6NiJ8uznLeGXrH7jNgxDTn
         DvQehsNhe8e/x08EPNPHctxU/HS7u3Ps2rlNyp0SMrfgLllnPmbF/4lSbybQ/QeIaMsT
         7kwfQEC9Ekxb2hL07mlVeTroVacC5eeG45dYeSogMvcXW9+gQ8QMcVinKGWRBCCHi/zF
         0Fxw==
X-Gm-Message-State: AOJu0Yw5ampPfs2vrRiOKmxNCN3NkqgFlTsKHIYupYvF+KVB1efyBm9v
	RibzkfDGT40B5PyjlPkLJRa9ERZod9HCcJpQbHc05gjFbhpzxvsTJklNksnKzOzl8AC94BVAb3f
	s
X-Gm-Gg: ASbGncvyx0UP9CxpRyyvmiUK3N1IdOC6wOp+VUt5PnQJSfZge6ffAzCKKi5sHnn2Q5x
	xK8Bc4+bd+9qdXFCCroa2RceOAcVTkdwzqisBd9+JSv1+THqBO7p0JYrPkPn6qFXgf0661+wzkU
	DtAcf6VLFiU2ZxZxOcEEwJCD2VjpeJAAuXjw3qnwLRup1wXRp80+pPMUplv7yUWpWwMVrTVBqDj
	RVj6dDB45dwXIvuj+dEnUb56TRO+/KxDfxuNHMSj0YbOmEqv9YtV4kJ+S3kDCuYHGKRVyqDykY4
	0xSl1tRJ4MoS1kpEr669AQzxdn/XsB0yvzgxFcBmFpsJ
X-Google-Smtp-Source: AGHT+IEgsGM79byJaGJWVZ1xO+pS2iny1JqwZ8P4YvI1uLB+Dpyz2geop4uZqCUKlWk6ln/D64tgPQ==
X-Received: by 2002:a05:6000:4029:b0:38c:5b52:3a5e with SMTP id ffacd0b85a97d-38c5b523dafmr15314731f8f.8.1738600896472;
        Mon, 03 Feb 2025 08:41:36 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:41c1:3919:865f:692c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c0ec886sm13122395f8f.1.2025.02.03.08.41.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 08:41:35 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 06/46] gnupg: upgrade 2.5.2 -> 2.5.3
Date: Mon,  3 Feb 2025 16:40:50 +0000
Message-ID: <20250203164130.3403325-6-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
References: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 16:41:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210679

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch  | 2 +-
 ...configure.ac-use-a-custom-value-for-the-location-of-.patch | 4 ++--
 .../gnupg/0002-use-pkgconfig-instead-of-npth-config.patch     | 2 +-
 .../0004-autogen.sh-fix-find-version-for-beta-checking.patch  | 2 +-
 meta/recipes-support/gnupg/gnupg/relocate.patch               | 2 +-
 meta/recipes-support/gnupg/{gnupg_2.5.2.bb => gnupg_2.5.3.bb} | 2 +-
 6 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-support/gnupg/{gnupg_2.5.2.bb => gnupg_2.5.3.bb} (97%)

diff --git a/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch b/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch
index 024f4a9f106..fcd25285133 100644
--- a/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch
+++ b/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch
@@ -1,4 +1,4 @@
-From 69d132c4cca738f148551af24932010fb1029ea1 Mon Sep 17 00:00:00 2001
+From bbf09a439d56ddcae6f641c8f1cf7544e3dd4d6f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 20 Dec 2018 17:37:48 -0800
 Subject: [PATCH] Woverride-init is not needed with gcc 9
diff --git a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
index 702cba4b71f..6e2f8d6fe62 100644
--- a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
+++ b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
@@ -1,4 +1,4 @@
-From d9ef954b602c17839c52a1d7dc73e2354e5fbbbb Mon Sep 17 00:00:00 2001
+From c9cef60c7be6a5cb5a9557117f4d285278cc6f47 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 22 Jan 2018 18:00:21 +0200
 Subject: [PATCH] configure.ac: use a custom value for the location of
@@ -13,7 +13,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 29592fd..7286862 100644
+index 6252d57..1da2c6f 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -1911,7 +1911,7 @@ AC_DEFINE_UNQUOTED(GPGCONF_DISP_NAME, "GPGConf",
diff --git a/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch b/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch
index a7a6f03c7d0..9c87788e80e 100644
--- a/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch
+++ b/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch
@@ -1,4 +1,4 @@
-From d5fc05998d7260fd94a558c53f6e6c35a384d163 Mon Sep 17 00:00:00 2001
+From 7c0163fd17b78284495da382023074ee7dd629b6 Mon Sep 17 00:00:00 2001
 From: Saul Wold <sgw@linux.intel.com>
 Date: Wed, 16 Aug 2017 11:16:30 +0800
 Subject: [PATCH] use pkgconfig instead of npth config
diff --git a/meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch b/meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch
index 8aeb87dfd41..3b4b01721a4 100644
--- a/meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch
+++ b/meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch
@@ -1,4 +1,4 @@
-From 21396a6e74d188a2198439aa27403c29c1dbcea8 Mon Sep 17 00:00:00 2001
+From 24ae21dce9fc7546468580ab37db3bf9559e6efc Mon Sep 17 00:00:00 2001
 From: Wenzong Fan <wenzong.fan@windriver.com>
 Date: Wed, 16 Aug 2017 11:23:22 +0800
 Subject: [PATCH] autogen.sh: fix find-version for beta checking
diff --git a/meta/recipes-support/gnupg/gnupg/relocate.patch b/meta/recipes-support/gnupg/gnupg/relocate.patch
index 08e70fb444e..b67744419ea 100644
--- a/meta/recipes-support/gnupg/gnupg/relocate.patch
+++ b/meta/recipes-support/gnupg/gnupg/relocate.patch
@@ -1,4 +1,4 @@
-From 93fef8f493ee66856ef02351da25583eea94202d Mon Sep 17 00:00:00 2001
+From db9e4933176b7919077120cedb8a8b0a40c2115b Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Wed, 19 Sep 2018 14:44:40 +0100
 Subject: [PATCH] Allow the environment to override where gnupg looks for its
diff --git a/meta/recipes-support/gnupg/gnupg_2.5.2.bb b/meta/recipes-support/gnupg/gnupg_2.5.3.bb
similarity index 97%
rename from meta/recipes-support/gnupg/gnupg_2.5.2.bb
rename to meta/recipes-support/gnupg/gnupg_2.5.3.bb
index 8e87382f129..cca4feaf6c2 100644
--- a/meta/recipes-support/gnupg/gnupg_2.5.2.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.5.3.bb
@@ -23,7 +23,7 @@ SRC_URI:append:class-native = " file://0001-configure.ac-use-a-custom-value-for-
                                 file://relocate.patch"
 SRC_URI:append:class-nativesdk = " file://relocate.patch"
 
-SRC_URI[sha256sum] = "7f404ccc6a58493fedc15faef59f3ae914831cff866a23f0bf9d66cfdd0fea29"
+SRC_URI[sha256sum] = "23128b136aed4e5121e793d1b6c60ee50c8007a9d926c1313e524d05386b54ac"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \

