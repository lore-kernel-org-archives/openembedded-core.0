Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD696E6916C
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:07:54 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.87652.1766434071942081987
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:07:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lkK8f96h;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b7697e8b01aso820286666b.2
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434070; x=1767038870; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q3ZSzluuZUN7Vg5eKf8B44KlCRQjDbrMvBGOEYkX5LQ=;
        b=lkK8f96hFlT1EBC2C8icEZgjC2JXYm2sMAjk6y6L9htZxlpAaKIFjxiLGYNab0NeYC
         QbNtXxFLoPF5bUCPQ1pYNCTNqv+1kXVlYh3Jh7LflxVLtyPpi9gKSc85lwCEc+TNsZXw
         5dPgbBefwhFAth653QSHrcFhcyKcb3SIcC9VyaKTi5vZpX2SFJUjnyyz+QQz/C7HCnWv
         SprkrmvJDFoM2HahtCUvZ+poKDEqQ3JLJM0gnZVmGwJmCZUtu2ch3ydbtrYaJ4Q1D/v7
         R318a4VwJ12o2RmdOMmD1dPQC951hw08SWNpfoShcXjtXO05WK7A6dtdJ7AI74kuAuWg
         WJuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434070; x=1767038870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q3ZSzluuZUN7Vg5eKf8B44KlCRQjDbrMvBGOEYkX5LQ=;
        b=f9OhgnmgEYc7Vz8WanalC55J1fcqOYrAO0zku0jze4ALIvVdQVSIwsJEHyzYHQZxlB
         9u4ZSepHSU9VGlH476e8sgS94WXskR1epdL2m1Z9WbNfKtPOOmL1XG90H6h7UfXaHpDu
         AOBKOA33jkyQaEXJ2gHsoIBSFf9Ali10SDHUBEKu+oaqK3OUhem2RgLGJjbW0CaomS4T
         R0LXWXyVsNvkYD54o4U71ktzdWgv0s4IC16RbeP99uEH7R/4A4PfuAL8sRxX/vdxfkw5
         R6onUVtnQI7/PStGLp5m4zX4pLge5a8Upa7fVlI7CihCl9maxdsgbRRBNEbxVmqQqTIs
         CHwg==
X-Gm-Message-State: AOJu0YzjWFbBgVpepdif1RWRmBPN4kPIvkvDsfSh5D+E9/xxqDuvRx0b
	DeGD4BBnrDzN0uoPRm5t2ID+PwzD07/Ep5VHxM7RBWzfY4lp1JY+jRVVCxS7eg==
X-Gm-Gg: AY/fxX6vLa7bmSDHwu3rZNCotoPKPa+jOxbpECF05mmEoqYxzOYWFJcR5uUwktbT2Yn
	gdGZedV3CC1a6eoS6aAYymTIhLRruM6hy/gQHU14uwMo3wx2NGiiz1BRlH1Z/xnwFe/CvT9WXfH
	f+q4TFf7h1sShfdL+iFw/0Pe1qJ6l81egKC5u2Jd8U1zHd9pnQFjeX7c9qcEKPxliEW6OCNNRUV
	/l0FTI7RChkRNDntsm0uoC/VW2G/LtxwTNraLwaxzyJ0QmMs32GxCBwl6/8zJPWL//DKeEuTN80
	kZkvEdphD2c3A3qTBN3DjVP82ht23S54QfdFrONIAo7CIpBDZuLFYeoE2ZEV6TxuWB0Curr/0sk
	1wTPGMNTeYGMBaBGMo8cZtYEXBxHETs8opj2LthKwyFx7SKbMxHdqT2L86myy7HvYF+uezmwkp3
	2KrC4sTRyi45ADHfMBXpGr8bQ1tuL0fOV7dYiG/og8yfhP35lSrZq4PSO+VQ==
X-Google-Smtp-Source: AGHT+IGAMRJ9Zi19f6/cwNakF2GOqQHWReNBU0NiJ7jCGHD+j+7kFqM+ogEiPl03xFd2AjIbrStE7g==
X-Received: by 2002:a17:907:7eaa:b0:b76:d89d:3710 with SMTP id a640c23a62f3a-b8036ebbe32mr1302632866b.8.1766434070013;
        Mon, 22 Dec 2025 12:07:50 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:07:49 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 007/114] bind: upgrade 9.20.15 -> 9.20.17
Date: Mon, 22 Dec 2025 21:05:49 +0100
Message-ID: <20251222200739.2278706-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:07:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228332

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../bind/bind/0001-avoid-start-failure-with-bind-user.patch | 2 +-
 ...01-named-lwresd-V-and-start-log-hide-build-options.patch | 4 ++--
 ...nd-ensure-searching-for-json-headers-searches-sysr.patch | 6 +++---
 meta/recipes-connectivity/bind/bind/conf.patch              | 2 +-
 .../bind/bind/init.d-add-support-for-read-only-rootfs.patch | 2 +-
 .../bind/bind/make-etc-initd-bind-stop-work.patch           | 2 +-
 .../bind/{bind_9.20.15.bb => bind_9.20.17.bb}               | 2 +-
 7 files changed, 10 insertions(+), 10 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.20.15.bb => bind_9.20.17.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
index dda94c14e7..4fa377a594 100644
--- a/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
@@ -1,4 +1,4 @@
-From 7128d079b0c315414410c4bcfb18b445cd7afda2 Mon Sep 17 00:00:00 2001
+From 2a3ff2a026c55dc67655baf28e0f4175232ee0ff Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 15 Oct 2018 16:55:09 +0800
 Subject: [PATCH] avoid start failure with bind user
diff --git a/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
index 5d3bd682f4..369185ad86 100644
--- a/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
@@ -1,4 +1,4 @@
-From 56249e557c820a743f1390174bd93104698e70f2 Mon Sep 17 00:00:00 2001
+From 49ca7b5432dd6c24541bbde21bca5043cd0c000b Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Mon, 27 Aug 2018 21:24:20 +0800
 Subject: [PATCH] `named/lwresd -V' and start log hide build options
@@ -20,7 +20,7 @@ Signed-off-by: Armin Kuster <akuster@mvista.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 295bfd6..5c7d7fb 100644
+index c3852ec..3b7a446 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -35,7 +35,7 @@ AC_DEFINE([PACKAGE_VERSION_EXTRA], ["][bind_VERSION_EXTRA]["], [BIND 9 Extra par
diff --git a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
index 9bbe0998c6..4a066294f0 100644
--- a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
+++ b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
@@ -1,4 +1,4 @@
-From fe34ede0bbb0c60624cc281c938b9ca784505f5a Mon Sep 17 00:00:00 2001
+From fa165cb4a9dfeb72f0db787decd527e3d587cd4e Mon Sep 17 00:00:00 2001
 From: Paul Gortmaker <paul.gortmaker@windriver.com>
 Date: Tue, 9 Jun 2015 11:22:00 -0400
 Subject: [PATCH] bind: ensure searching for json headers searches sysroot
@@ -32,10 +32,10 @@ Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 6ee5459..295bfd6 100644
+index c6a10f6..c3852ec 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -863,7 +863,7 @@ AS_CASE([$with_lmdb],
+@@ -865,7 +865,7 @@ AS_CASE([$with_lmdb],
  	[no],[],
  	[auto|yes], [PKG_CHECK_MODULES([LMDB], [lmdb],
  				       [ac_lib_lmdb_found=yes],
diff --git a/meta/recipes-connectivity/bind/bind/conf.patch b/meta/recipes-connectivity/bind/bind/conf.patch
index 8a45667fc4..ec22fe84c4 100644
--- a/meta/recipes-connectivity/bind/bind/conf.patch
+++ b/meta/recipes-connectivity/bind/bind/conf.patch
@@ -1,4 +1,4 @@
-From 24452a9a46ba21233925218e4fca066b338ba70d Mon Sep 17 00:00:00 2001
+From 4b9f6f6735340d558d9c9fba9c84d7f99d3cbde2 Mon Sep 17 00:00:00 2001
 From: Qing He <qing.he@intel.com>
 Date: Tue, 30 Nov 2010 13:35:42 +0800
 Subject: [PATCH] bind: add new recipe
diff --git a/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
index 97fac429dd..fd96d46448 100644
--- a/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
+++ b/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
@@ -1,4 +1,4 @@
-From 2fb98a36b3b35aeaa4852bd8bc268fbf66d0ad2d Mon Sep 17 00:00:00 2001
+From 19933be78902d90014f177b5633dd15984bc1bc9 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Thu, 27 Mar 2014 02:34:41 +0000
 Subject: [PATCH] init.d: add support for read-only rootfs
diff --git a/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
index 3adb694eaa..155cc5a110 100644
--- a/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
+++ b/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
@@ -1,4 +1,4 @@
-From 3f18a00d627ec06d26d189e7ef1818d2c237274b Mon Sep 17 00:00:00 2001
+From e429899c34ea8a4f85de428e22ee49c453281e82 Mon Sep 17 00:00:00 2001
 From: Roy Li <rongqing.li@windriver.com>
 Date: Thu, 15 Nov 2012 02:27:54 +0000
 Subject: [PATCH] bind: make "/etc/init.d/bind stop" work
diff --git a/meta/recipes-connectivity/bind/bind_9.20.15.bb b/meta/recipes-connectivity/bind/bind_9.20.17.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.20.15.bb
rename to meta/recipes-connectivity/bind/bind_9.20.17.bb
index 1195b5bdc3..33ba18dcbd 100644
--- a/meta/recipes-connectivity/bind/bind_9.20.15.bb
+++ b/meta/recipes-connectivity/bind/bind_9.20.17.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "d62b38fae48ba83fca6181112d0c71018d8b0f2ce285dc79dc6a0367722ccabb"
+SRC_URI[sha256sum] = "5cc89a09da0917eb1ddf640cc07c172ff44fa9bbf3a34ada4b6a2f7ee70ff1c8"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.47.3


