Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05923E77194
	for <webhook@archiver.kernel.org>; Thu,  2 Jan 2025 09:41:07 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.5184.1735810863599910098
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jan 2025 01:41:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=H08x4oi7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-436341f575fso116041255e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Jan 2025 01:41:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1735810861; x=1736415661; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ba3d/bVqlCJlXFnFtezZnzHjM/Dcqqj050UyLpK+vpE=;
        b=H08x4oi7UftruGvvAms+1a/FTjzY6y1hvXRkpX0wCq9Jekhz1FpyalRSpBpBmhPuKk
         JM8n7/7AKS41yH9OcXn/7cCrPuV12J+1qqm+4I1zE1FqfcgYCo+FsDH6QiPzAz3lO8Tj
         0ewskHHkvHQ6eNCI89mPW6BcmujanQ2n4PPWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735810861; x=1736415661;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ba3d/bVqlCJlXFnFtezZnzHjM/Dcqqj050UyLpK+vpE=;
        b=FoW7rtzijfTs14l/3yvNQ6KEEPlH4nZDUvfXEdkPKHYlKhdx2BXFdwVl4U97nu34E0
         VBzhjq3gw99lqDlk7eUzWVzbJvf1M6mxsB8kps4gS+e0jfV+SzLBWxJuw9Z2nX8FsusF
         ybUNBPym1Hy8Z4vUHfZKbQ2V8a95b5+m2FXYwJS8EXIhTQpA3uqrrMf/Jlv32D6W/SI7
         5xWPkM4FPO/f5Jz5BLSIa7n8WDlW8UYZrPqBqHr0bujpxrKb+n/menvETPfzHe4xATkp
         Gq4kbDL2ULQmcu0G74wJPF4VgG7KVk3jlVwqwAYs3rtwpQ4C1dzEbM1TLqD1kbRKbPAV
         ux/g==
X-Gm-Message-State: AOJu0YyHbLDMpMMTy0SBgeva9kOyKT+tK+hGLoR0oZiTJ0xWweCAsNgM
	nBbzWt1RfXlFO1y4ao84snAVL98kY1w4KujD5Yr64LrKWdJJlKtZrNSG0ZgmlrPsJ65lZ+aoUW7
	nmwM=
X-Gm-Gg: ASbGncundx5qnWGLw6Q2+WinRYCaxEux4HcoV/E6yi0eKyeyN51dqQOVF1ik2YTeR/D
	SnI73cklTZj6wMO855YsYW5lw1q2tS5DAzbhAExYBpHjzBqaWTfZcgjp1KFCBwNns43NMG98yr5
	goi9Bo1o4qG3+bOd4AGb4xBztWD8u/ENrRCW0VVCm4XwHwBTZv2kyfyG1M5y1qyzymBmi5b7Dt1
	JB2LqmlOrkIDTod+mAjXrrmR4mwHuX2ujLcgy9Sp8ILC1EsR4twXiTgMEsJoA6a3UvXJDMCNXxO
	AmNhybf1SA==
X-Google-Smtp-Source: AGHT+IFwbm8MF7Uywuxri81pZd/Vm3VmnF0NiyZSNWhc5FOu0XZyfF54dWwe67vVqrWb+Sn9zjRSNg==
X-Received: by 2002:a05:600c:1d07:b0:434:f739:7cd9 with SMTP id 5b1f17b1804b1-4366854c049mr401898755e9.9.1735810861293;
        Thu, 02 Jan 2025 01:41:01 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ae2e:9f02:55c2:739d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b119ccsm479785625e9.24.2025.01.02.01.41.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 01:41:00 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 01/21] base-passwd: upgrade 3.6.5 -> 3.6.6
Date: Thu,  2 Jan 2025 09:40:32 +0000
Message-ID: <20250102094059.322187-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jan 2025 09:41:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209261

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../base-passwd/base-passwd/0001-Add-a-shutdown-group.patch     | 2 +-
 .../base-passwd/0001-base-passwd-Add-the-sgx-group.patch        | 2 +-
 .../0002-Use-bin-sh-instead-of-bin-bash-for-the-root-user.patch | 2 +-
 ...003-Remove-for-root-since-we-do-not-have-an-etc-shadow.patch | 2 +-
 .../0004-Add-an-input-group-for-the-dev-input-devices.patch     | 2 +-
 .../base-passwd/base-passwd/0005-Add-kvm-group.patch            | 2 +-
 .../base-passwd/base-passwd/0007-Add-wheel-group.patch          | 2 +-
 .../base-passwd/{base-passwd_3.6.5.bb => base-passwd_3.6.6.bb}  | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)
 rename meta/recipes-core/base-passwd/{base-passwd_3.6.5.bb => base-passwd_3.6.6.bb} (98%)

diff --git a/meta/recipes-core/base-passwd/base-passwd/0001-Add-a-shutdown-group.patch b/meta/recipes-core/base-passwd/base-passwd/0001-Add-a-shutdown-group.patch
index 60e755fd9ad..1cdf993f537 100644
--- a/meta/recipes-core/base-passwd/base-passwd/0001-Add-a-shutdown-group.patch
+++ b/meta/recipes-core/base-passwd/base-passwd/0001-Add-a-shutdown-group.patch
@@ -1,4 +1,4 @@
-From 03150b2575c5ec1ba30726d30d47303627e6fc60 Mon Sep 17 00:00:00 2001
+From 6bbd3d01d123b042167aa6dea30b5e8d9d4de4dc Mon Sep 17 00:00:00 2001
 From: Saul Wold <sgw@linux.intel.com>
 Date: Fri, 29 Apr 2022 13:32:27 +0000
 Subject: [PATCH] Add a shutdown group
diff --git a/meta/recipes-core/base-passwd/base-passwd/0001-base-passwd-Add-the-sgx-group.patch b/meta/recipes-core/base-passwd/base-passwd/0001-base-passwd-Add-the-sgx-group.patch
index 41dfc271787..54b96c877b3 100644
--- a/meta/recipes-core/base-passwd/base-passwd/0001-base-passwd-Add-the-sgx-group.patch
+++ b/meta/recipes-core/base-passwd/base-passwd/0001-base-passwd-Add-the-sgx-group.patch
@@ -1,4 +1,4 @@
-From 6ad8995014cc30c932a8b4dae066c56ae33a107f Mon Sep 17 00:00:00 2001
+From dbd66c0ab1fd134ecba2eb1c040445e20d92f79a Mon Sep 17 00:00:00 2001
 From: Alex Kiernan <alexk@zuma.ai>
 Date: Fri, 28 Jul 2023 10:28:57 +0100
 Subject: [PATCH] base-passwd: Add the sgx group
diff --git a/meta/recipes-core/base-passwd/base-passwd/0002-Use-bin-sh-instead-of-bin-bash-for-the-root-user.patch b/meta/recipes-core/base-passwd/base-passwd/0002-Use-bin-sh-instead-of-bin-bash-for-the-root-user.patch
index 61b3ed38d79..47712c4f0fc 100644
--- a/meta/recipes-core/base-passwd/base-passwd/0002-Use-bin-sh-instead-of-bin-bash-for-the-root-user.patch
+++ b/meta/recipes-core/base-passwd/base-passwd/0002-Use-bin-sh-instead-of-bin-bash-for-the-root-user.patch
@@ -1,4 +1,4 @@
-From 54bb95b9c4532f9cbe634dd43798ce37c93d6f50 Mon Sep 17 00:00:00 2001
+From e2e6880587d4ada13e815bf132f21b42a979a607 Mon Sep 17 00:00:00 2001
 From: Scott Garman <scott.a.garman@intel.com>
 Date: Fri, 29 Apr 2022 13:32:27 +0000
 Subject: [PATCH] Use /bin/sh instead of /bin/bash for the root user
diff --git a/meta/recipes-core/base-passwd/base-passwd/0003-Remove-for-root-since-we-do-not-have-an-etc-shadow.patch b/meta/recipes-core/base-passwd/base-passwd/0003-Remove-for-root-since-we-do-not-have-an-etc-shadow.patch
index 6b13d4c9673..9396d134600 100644
--- a/meta/recipes-core/base-passwd/base-passwd/0003-Remove-for-root-since-we-do-not-have-an-etc-shadow.patch
+++ b/meta/recipes-core/base-passwd/base-passwd/0003-Remove-for-root-since-we-do-not-have-an-etc-shadow.patch
@@ -1,4 +1,4 @@
-From 03406451d66a9d561d6e32a181248e5a0bd58d58 Mon Sep 17 00:00:00 2001
+From 022cf6956c647cc193fce2b0ccdf1308d3e208cd Mon Sep 17 00:00:00 2001
 From: Scott Garman <scott.a.garman@intel.com>
 Date: Fri, 29 Apr 2022 13:32:28 +0000
 Subject: [PATCH] Remove "*" for root since we do not have an /etc/shadow
diff --git a/meta/recipes-core/base-passwd/base-passwd/0004-Add-an-input-group-for-the-dev-input-devices.patch b/meta/recipes-core/base-passwd/base-passwd/0004-Add-an-input-group-for-the-dev-input-devices.patch
index 85739d5b478..85f40a9829b 100644
--- a/meta/recipes-core/base-passwd/base-passwd/0004-Add-an-input-group-for-the-dev-input-devices.patch
+++ b/meta/recipes-core/base-passwd/base-passwd/0004-Add-an-input-group-for-the-dev-input-devices.patch
@@ -1,4 +1,4 @@
-From 662da5251f3f9634c583eeccc8242a05393d37be Mon Sep 17 00:00:00 2001
+From ef6d3257ca8308feeff40272a18e87ca7e2dc81b Mon Sep 17 00:00:00 2001
 From: Darren Hart <dvhart@linux.intel.com>
 Date: Fri, 29 Apr 2022 13:32:28 +0000
 Subject: [PATCH] Add an input group for the /dev/input/* devices
diff --git a/meta/recipes-core/base-passwd/base-passwd/0005-Add-kvm-group.patch b/meta/recipes-core/base-passwd/base-passwd/0005-Add-kvm-group.patch
index 65a9ef53a36..7264c29c827 100644
--- a/meta/recipes-core/base-passwd/base-passwd/0005-Add-kvm-group.patch
+++ b/meta/recipes-core/base-passwd/base-passwd/0005-Add-kvm-group.patch
@@ -1,4 +1,4 @@
-From c6e5c31cd276f69a4db479188efb3ab3e0f35dd8 Mon Sep 17 00:00:00 2001
+From 6c81c51ee49427175cc8bcb09b236677be4c0815 Mon Sep 17 00:00:00 2001
 From: Jacob Kroon <jacob.kroon@gmail.com>
 Date: Wed, 30 Jan 2019 04:53:48 +0000
 Subject: [PATCH] Add kvm group
diff --git a/meta/recipes-core/base-passwd/base-passwd/0007-Add-wheel-group.patch b/meta/recipes-core/base-passwd/base-passwd/0007-Add-wheel-group.patch
index a4d2dd875b0..d3b1b12246e 100644
--- a/meta/recipes-core/base-passwd/base-passwd/0007-Add-wheel-group.patch
+++ b/meta/recipes-core/base-passwd/base-passwd/0007-Add-wheel-group.patch
@@ -1,4 +1,4 @@
-From fc9790b768971d5b9e9b6d215bc29885a646c335 Mon Sep 17 00:00:00 2001
+From 00b7725977043c628129560dd8ca798c0ecb8791 Mon Sep 17 00:00:00 2001
 From: Louis Rannou <lrannou@baylibre.com>
 Date: Thu, 15 Jun 2023 13:43:55 +0200
 Subject: [PATCH] base-passwd: add the wheel group
diff --git a/meta/recipes-core/base-passwd/base-passwd_3.6.5.bb b/meta/recipes-core/base-passwd/base-passwd_3.6.6.bb
similarity index 98%
rename from meta/recipes-core/base-passwd/base-passwd_3.6.5.bb
rename to meta/recipes-core/base-passwd/base-passwd_3.6.6.bb
index 47c15e55414..cc5c9055035 100644
--- a/meta/recipes-core/base-passwd/base-passwd_3.6.5.bb
+++ b/meta/recipes-core/base-passwd/base-passwd_3.6.6.bb
@@ -15,7 +15,7 @@ SRC_URI = "https://launchpad.net/debian/+archive/primary/+files/${BPN}_${PV}.tar
            file://0001-base-passwd-Add-the-sgx-group.patch \
            "
 
-SRC_URI[sha256sum] = "bd30ab67b1f8029d3e70d3419e5033fb4595ab91c91307c3b7c00978e8d111b2"
+SRC_URI[sha256sum] = "cfcb17a5cfb5d7ce53f062b2a30c74ac7f9425af81010d3591aeffc60f269263"
 
 # the package is taken from launchpad; that source is static and goes stale
 # so we check the latest upstream from a directory that does get updated

