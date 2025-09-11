Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77321CAC58D
	for <webhook@archiver.kernel.org>; Thu, 11 Sep 2025 08:51:38 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.41407.1757580695720397409
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Sep 2025 01:51:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ib4OiGa4;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45dfb8e986aso5132925e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 01:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757580694; x=1758185494; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J27f86bd8e8140Fk9IqBSnshfGulIqsADK+TQMyNWQw=;
        b=ib4OiGa46ZpoW2mnZHFFBIocJ+9ELml+OU7kudkXgVTiukwlQLGZddaLbStQaNagL6
         yDxUMkIDPxZ/IFd24kKfPxCPWPUGUGbUANI5Fahdw3dJNlVCDgI0uytpP/UpN7Q1UwIb
         HK56aR5UWlgm3wxxfaBfZMTAeQ015CS1NGL0BNa9gQmPs8pOWBCR+50EmDOUspXploOG
         ONJXJUZY9o/gHs5LlTjsmUR0ZbKO6ROqdx7miaqXb8bbVzGGIhoGbh7we2c3KR29NI3h
         ZS4bFuHjD5Sp438dMO7jPm7UnH4pBRz+t4XM5QRxZoqdlzzKyOeY/lJaIK0xQoU3f+Gq
         PlfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757580694; x=1758185494;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J27f86bd8e8140Fk9IqBSnshfGulIqsADK+TQMyNWQw=;
        b=mtMaqx4zqyQp2F+6g6S0tkdPitfnYxSoRpvkS6pyUci2givGVj/Smv4gUr46yco2BG
         EYmI3pW2EOqrqG3MS4venAm4LQcQFzMqNwht8UA9NP5HR7DkW4gDlu9XjX+k0PblA3+I
         FMrXR7D7dGSUMRw4XnLiPC+srW1oXr1Y7aokjOaVEnzTS1Wyxoftm+kEOJ46PBgjRK5K
         TZfCZW+cr+whfhUfJpGUYIb5c7arKCuZ9JjUSxecNQamn1wEucReIqZRZ4ToiVmrFlPl
         UzWRi7gedWsEcVjZuYf130LYkoIa8vc4y0crOJdW+Np0oDDtHwSOZfHTpYj2RV+iCzdV
         wwTg==
X-Gm-Message-State: AOJu0Yx9uDUYa+6ADxwT6ko5n5fLR7YV+23IpxMri/uo4hcFb/YDlTTQ
	tPI/nCaJtO8ormtysSHBY/1DS1PGu8QjExP/OVt3L23xr6pEn/dE0OS65fbtDQ==
X-Gm-Gg: ASbGnctiMPJraM4RmFh9qD3BAgalw9KC6aUsxTZauoIxP0qyhJC0pFQ7xc3wreHFLUJ
	AdmS1ph1cE3Os+LxXpNB/rGXaBnbTZRv5DmP2DJYIOmjC/IdwSCmsIp9g7wQcvp1zb36o0HB7Ju
	EDeAmuBFEbqG0OjpaUT2v5ToQ7DRVbpr+ZLbamFZe5aYX0XbX3w/1LU0l4Lkc+nckpm8uYls7av
	ckpt+6T4iXgyGaHXYqEzwuTqwT7YDDmPxHZNSRwusadI7hrFGtIWKpOPnV4DfFARRyhpiS/w8xt
	NEsSDk4myECrHgtn4FE86HMa4sUZNdEY9kyf8+3MIo5JmVrAG5Dt5TWDS+7hwehbRSAr7aAoN9V
	iq20yC0sEqvBiL8JRiyEEDNWKTYhagcDvpJ8UEGPLZab/QfTVyRmaDbtHyhgti92pJpHA+yZE8+
	Or8kto1mBPJa9vRYikGi3amgqx60GICPiLlUZKN4HczeabwNZbH7+ZEJNbfkhwHD0sqVgq
X-Google-Smtp-Source: AGHT+IF7vOGuE2aVUjB4JdNy3qDmBmUdG5k4D+m8ny+RxtRVSFl/q2wRHs5/cnvUEDW55cBYDVzowA==
X-Received: by 2002:a05:600c:630e:b0:45d:d8d6:7fcc with SMTP id 5b1f17b1804b1-45dddee5da3mr150185875e9.27.1757580693879;
        Thu, 11 Sep 2025 01:51:33 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e017b2f4esm19382005e9.17.2025.09.11.01.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 01:51:33 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 01/16] gnupg: update 2.5.5 -> 2.5.11
Date: Thu, 11 Sep 2025 10:51:08 +0200
Message-Id: <20250911085123.1551425-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 08:51:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223248

From: Alexander Kanavin <alex@linutronix.de>

2.5.x are pre-releases (there was an update to 2.5.0 one year ago by mistake), but
it's good to pull in bug fixes and stabilisation and stay close to eventual final release.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch  | 2 +-
 ...configure.ac-use-a-custom-value-for-the-location-of-.patch | 4 ++--
 .../gnupg/0002-use-pkgconfig-instead-of-npth-config.patch     | 2 +-
 meta/recipes-support/gnupg/gnupg/relocate.patch               | 2 +-
 .../recipes-support/gnupg/{gnupg_2.5.5.bb => gnupg_2.5.11.bb} | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-support/gnupg/{gnupg_2.5.5.bb => gnupg_2.5.11.bb} (97%)

diff --git a/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch b/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch
index 6299eb95cec..b48db409704 100644
--- a/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch
+++ b/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch
@@ -1,4 +1,4 @@
-From 690faa62529c584cd80c8eaa56210ec1e4a96d7f Mon Sep 17 00:00:00 2001
+From 9b7ef8aa1a5d71fc95f36a92874d3faa4579fc4e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 20 Dec 2018 17:37:48 -0800
 Subject: [PATCH] Woverride-init is not needed with gcc 9
diff --git a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
index ed94145833e..bfee9c99043 100644
--- a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
+++ b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
@@ -1,4 +1,4 @@
-From c9392c615a95c965dd58b0896cb3b87deafc62a4 Mon Sep 17 00:00:00 2001
+From 84a16d46a72a2501cbe3a4a83ea7f8393ada4038 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 22 Jan 2018 18:00:21 +0200
 Subject: [PATCH] configure.ac: use a custom value for the location of
@@ -13,7 +13,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 23a9101..3e10021 100644
+index 023604b..c84442c 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -1908,7 +1908,7 @@ AC_DEFINE_UNQUOTED(GPGCONF_DISP_NAME, "GPGConf",
diff --git a/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch b/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch
index 2d23ca1e669..90d53674d4e 100644
--- a/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch
+++ b/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch
@@ -1,4 +1,4 @@
-From 9f7cf2e4770697c24f8d24ce9f79b8548120bbf8 Mon Sep 17 00:00:00 2001
+From 0c3a09a95875e5744a910a0d3c93fa2e9dbe8c69 Mon Sep 17 00:00:00 2001
 From: Saul Wold <sgw@linux.intel.com>
 Date: Wed, 16 Aug 2017 11:16:30 +0800
 Subject: [PATCH] use pkgconfig instead of npth config
diff --git a/meta/recipes-support/gnupg/gnupg/relocate.patch b/meta/recipes-support/gnupg/gnupg/relocate.patch
index 1ae8a564d40..fedb7f6407d 100644
--- a/meta/recipes-support/gnupg/gnupg/relocate.patch
+++ b/meta/recipes-support/gnupg/gnupg/relocate.patch
@@ -1,4 +1,4 @@
-From 917a98f9380d581548f3cbb59428cee3a5c29bae Mon Sep 17 00:00:00 2001
+From 8d7658741da050f604bcf26f8a6c24a0b15df94b Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Wed, 19 Sep 2018 14:44:40 +0100
 Subject: [PATCH] Allow the environment to override where gnupg looks for its
diff --git a/meta/recipes-support/gnupg/gnupg_2.5.5.bb b/meta/recipes-support/gnupg/gnupg_2.5.11.bb
similarity index 97%
rename from meta/recipes-support/gnupg/gnupg_2.5.5.bb
rename to meta/recipes-support/gnupg/gnupg_2.5.11.bb
index cbf0988953f..9cc063f8374 100644
--- a/meta/recipes-support/gnupg/gnupg_2.5.5.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.5.11.bb
@@ -24,7 +24,7 @@ SRC_URI:append:class-native = " file://0001-configure.ac-use-a-custom-value-for-
                                 file://relocate.patch"
 SRC_URI:append:class-nativesdk = " file://relocate.patch"
 
-SRC_URI[sha256sum] = "7afa71d72ff9aaff75a6810b87b486bc492fd752e4f77b07c41759ce4ef36b31"
+SRC_URI[sha256sum] = "5f765ec1eb605dce9e9c48679cd43b5818d4d4b84c8ea4c0c60eb5dca13c405c"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
2.39.5


