Return-Path: <anna-lena.marx@inovex.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CBA1CAC592
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 13:28:22 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.33522.1757942899663905367
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 06:28:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@inovex.de header.s=google header.b=Qp2MIW1m;
 spf=pass (domain: inovex.de, ip: 209.85.128.45, mailfrom: anna-lena.marx@inovex.de)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45dec026c78so43574475e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 06:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inovex.de; s=google; t=1757942898; x=1758547698; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s5rzx86DPZjDaWjlJqKRPoejhpkIlmP16cxWHUHSHkk=;
        b=Qp2MIW1mMk/FbyCrVa9ixckwXgT868JDQwFU6hc1g1ZWYU6L8De75mvz+gcXQm6LjH
         lnw1mfIYUVGnOuYzZ/H/lhNFOmcVbAD7H31Hs8GNMu0uGLqVms5k6ALPXjfqYvWfwEum
         g7UIYhX1Iu7vtvzoCMjyxaIc9WOiQEQbCLWxI71LIEt794qcSubCBedfsGmvRGrKr9T9
         aHp9BveTB7/vXyzKBWQHgPtmiyP0PZUKdlfStTUoQDitcKo2avORtQLzju2Yxp+3FBe/
         t2axpnnEP0rmtVi9x/PmXdeaV3PJwU1bID4BkYZm/NgWzAd+cvqcgblW0TE4sZAK8jHl
         XCOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757942898; x=1758547698;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s5rzx86DPZjDaWjlJqKRPoejhpkIlmP16cxWHUHSHkk=;
        b=NK8IICJo2IApSiPblF0LnuM24MP9NidXBPx99xSuH6eKVUXsP3OSJzreM1BtPpRRY5
         zAIKjoRjstiL1RpsLkNtDwubssv+wUGVbX+kcG0hVMz+TmlXkVC9B6tPO7Z5TGEjoa1x
         /OiFM8HmvpNaIdBQWQCxWCtcz5dRpp5xyKFTsOFXUnoqIibJUA28KhHzJWYTqafCfusQ
         36EhksfhCAtKRtaqeAr3qELbJOy2aVSk2rHiGUG3oOjLJ7tGgO8XqOVY3OQcFU59hxds
         JoQvQBqBymEREKmiik9MmkqHYdPSYD1t0NlqNOTzgaT78bsci+/8qxlpt/h7Lh0H38f1
         WgKw==
X-Gm-Message-State: AOJu0YywwYXmzPY4gh3Eokz7h+LML7wKWME3wDVJoz2xlsFLjy1h2yhA
	iZdGP6w4PHu7NEj+l7VV91472/+mbt2Iaqro10op6gZ3p9UyIhgUNm+pv6vDK7QEUDkn7Ka02DI
	9GSfLfSHvTYbepAQpGE1E7k8O/SNrsl4+/ByxozDSuYlCbKGh0T3CSjSCLh7r7UkfslN4fwlhVI
	//ldompkFXmDNNjKpLczsO/rckN9W4jEuUwaByRavMooqAko/rI3/vJpkYRflcmPRTalH335A=
X-Gm-Gg: ASbGnctYYzfwzfEAKYRB7G4WZMi/nYamjTOym8RlRWYed1oUQDiCMV5L29iKmkBh4UF
	Bf+x/CH1hrsca8zkXRSOMQSnaaDpxxjGu6Dvyt/t8pHRZmtUt60J7u184bUnbP8J7NueKqDxoM6
	SGFKIxgLx4CKVhU8dDCLXpmb0b2datDWYST2RpEWtTK2fnvc2q5kBTAqL0C1RDshU3Cb7U74GwJ
	v2NLXd3P3jEq+zJqyM9nJRuK+01DWNTfDUlsdeAZaQOtjfoAxIBZ880Roxe20yJU74YJ/t3Jpfn
	ugxPROhgY3lJCAivYh4+CTXw+MLkX45TLvPbc0ECW6OBbe+zh4qH5+dWfFQHjy621NBjyJPm4NG
	P2YdaEmU9z7LMKWRHbNQiw22zLZz3f6OlH+rNzq2Ouw==
X-Google-Smtp-Source: AGHT+IF+yPz/XrQnIAviHJWESZsjvXRiG7M1JQp4ShT5C5l22BAFlM2YDaXMoTilhdMUW8v2YjRJqw==
X-Received: by 2002:a05:600c:1c0c:b0:45f:2962:5ad9 with SMTP id 5b1f17b1804b1-45f2c1a10ccmr44108835e9.6.1757942897028;
        Mon, 15 Sep 2025 06:28:17 -0700 (PDT)
Received: from Phoenix.fritz.box ([2001:16b8:cc73:8e00:4e2e:d566:6ce7:ec30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e01865ff7sm97288565e9.2.2025.09.15.06.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 06:28:16 -0700 (PDT)
From: Anna-Lena Marx <anna-lena.marx@inovex.de>
To: openembedded-core@lists.openembedded.org
Cc: tim.orling@konsulko.com,
	Anna-Lena Marx <anna-lena.marx@inovex.de>
Subject: [PATCH] bind: upgrade 9.20.12 -> 9.20.13
Date: Mon, 15 Sep 2025 15:28:05 +0200
Message-ID: <20250915132805.2824258-1-anna-lena.marx@inovex.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 13:28:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223489

Upgrade bind to 9.20.13.
Changelog: https://downloads.isc.org/isc/bind9/cur/9.20/doc/arm/html/changelog.html

Signed-off-by: Anna-Lena Marx <anna-lena.marx@inovex.de>
---
 .../bind/bind/0001-avoid-start-failure-with-bind-user.patch   | 2 +-
 ...0001-named-lwresd-V-and-start-log-hide-build-options.patch | 4 ++--
 ...bind-ensure-searching-for-json-headers-searches-sysr.patch | 4 ++--
 meta/recipes-connectivity/bind/bind/conf.patch                | 2 +-
 .../bind/bind/init.d-add-support-for-read-only-rootfs.patch   | 2 +-
 .../bind/bind/make-etc-initd-bind-stop-work.patch             | 2 +-
 .../bind/{bind_9.20.12.bb => bind_9.20.13.bb}                 | 2 +-
 7 files changed, 9 insertions(+), 9 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.20.12.bb => bind_9.20.13.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
index 78ab6b87fc..dda94c14e7 100644
--- a/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
@@ -1,4 +1,4 @@
-From c70f74164bea8a8c54c03becffb2f21103dd1f31 Mon Sep 17 00:00:00 2001
+From 7128d079b0c315414410c4bcfb18b445cd7afda2 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 15 Oct 2018 16:55:09 +0800
 Subject: [PATCH] avoid start failure with bind user
diff --git a/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
index 53e439721f..5d3bd682f4 100644
--- a/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
@@ -1,4 +1,4 @@
-From 0dd67d85705cbcfa9a2759c46f3cdf3d0d6375de Mon Sep 17 00:00:00 2001
+From 56249e557c820a743f1390174bd93104698e70f2 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Mon, 27 Aug 2018 21:24:20 +0800
 Subject: [PATCH] `named/lwresd -V' and start log hide build options
@@ -20,7 +20,7 @@ Signed-off-by: Armin Kuster <akuster@mvista.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index f9cf4a4..0ce3d26 100644
+index 295bfd6..5c7d7fb 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -35,7 +35,7 @@ AC_DEFINE([PACKAGE_VERSION_EXTRA], ["][bind_VERSION_EXTRA]["], [BIND 9 Extra par
diff --git a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
index 38d208fc1c..9bbe0998c6 100644
--- a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
+++ b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
@@ -1,4 +1,4 @@
-From 8c9c817933eef20328f10237bbd964580db0a3ad Mon Sep 17 00:00:00 2001
+From fe34ede0bbb0c60624cc281c938b9ca784505f5a Mon Sep 17 00:00:00 2001
 From: Paul Gortmaker <paul.gortmaker@windriver.com>
 Date: Tue, 9 Jun 2015 11:22:00 -0400
 Subject: [PATCH] bind: ensure searching for json headers searches sysroot
@@ -32,7 +32,7 @@ Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 334b551..f9cf4a4 100644
+index 6ee5459..295bfd6 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -863,7 +863,7 @@ AS_CASE([$with_lmdb],
diff --git a/meta/recipes-connectivity/bind/bind/conf.patch b/meta/recipes-connectivity/bind/bind/conf.patch
index 102fe46ffe..8a45667fc4 100644
--- a/meta/recipes-connectivity/bind/bind/conf.patch
+++ b/meta/recipes-connectivity/bind/bind/conf.patch
@@ -1,4 +1,4 @@
-From 83a892af19bf1455ce7132350332ed6d7f1e2b94 Mon Sep 17 00:00:00 2001
+From 24452a9a46ba21233925218e4fca066b338ba70d Mon Sep 17 00:00:00 2001
 From: Qing He <qing.he@intel.com>
 Date: Tue, 30 Nov 2010 13:35:42 +0800
 Subject: [PATCH] bind: add new recipe
diff --git a/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
index 984d401c70..97fac429dd 100644
--- a/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
+++ b/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
@@ -1,4 +1,4 @@
-From 1393cbf6b0084128fdfc9b5afb3bcc307265d094 Mon Sep 17 00:00:00 2001
+From 2fb98a36b3b35aeaa4852bd8bc268fbf66d0ad2d Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Thu, 27 Mar 2014 02:34:41 +0000
 Subject: [PATCH] init.d: add support for read-only rootfs
diff --git a/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
index 74f2ef83a0..3adb694eaa 100644
--- a/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
+++ b/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
@@ -1,4 +1,4 @@
-From ce06506bb3fe661e03161af3a603bd228590a254 Mon Sep 17 00:00:00 2001
+From 3f18a00d627ec06d26d189e7ef1818d2c237274b Mon Sep 17 00:00:00 2001
 From: Roy Li <rongqing.li@windriver.com>
 Date: Thu, 15 Nov 2012 02:27:54 +0000
 Subject: [PATCH] bind: make "/etc/init.d/bind stop" work
diff --git a/meta/recipes-connectivity/bind/bind_9.20.12.bb b/meta/recipes-connectivity/bind/bind_9.20.13.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.20.12.bb
rename to meta/recipes-connectivity/bind/bind_9.20.13.bb
index d3db481930..de39924c3d 100644
--- a/meta/recipes-connectivity/bind/bind_9.20.12.bb
+++ b/meta/recipes-connectivity/bind/bind_9.20.13.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "dd32d6eb67504e8a430aaf70b4ef894f3d0226b44c7e02370c9b0d377f1c7999"
+SRC_URI[sha256sum] = "151f9376ead317e646a5d0c9f01c060386d891118d7437a7f829bb9727c7b34c"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.51.0


