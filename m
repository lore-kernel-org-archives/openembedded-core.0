Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E06AEC5473B
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 05:24:19 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web10.71680.1724736254410030892
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Aug 2024 22:24:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Is3/5a6x;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a86883231b4so659080966b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 22:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724736253; x=1725341053; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O/lNqo4Uw/MHnNRclT8Cqs8x4aGSP1q/vq6FmPMzjvM=;
        b=Is3/5a6x7TKxxzMEdCD36nCwPV6o8n5nQA4NqX4jHGuV0IgGEt8PnwquHv9Q+BgGNZ
         HIQtSr+UpYQDUyZA937gNyrVav+AdXD8y9AcLkIY+Fu2ZsUgyAngkFz32xir1WioIBvJ
         YLbRpBrh+7yjj8Lq7hs9V4QKwNdMhNH6gU1gbBrXBVeAKONxl7JbmCt8cs8ezXuJUOC/
         m4gtT0HmQal9cB7iVfq0hzVvDY0EQ7M3YU96NizMq7M2+UnOjloFXH8xRlwC45vRr8GD
         XpEOoI4JWLjBoSRAIqZptR9R/sveABIlUGQ2SBER0caaSkltFqRqzuuB26+BIDiyrU76
         lT7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724736253; x=1725341053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O/lNqo4Uw/MHnNRclT8Cqs8x4aGSP1q/vq6FmPMzjvM=;
        b=puXJcBf3y5uP8cgHgEBI6mZ0moygu+3nJ0cWQHNu+h0lPL37pkQ4ztqyud99IiBBoQ
         kvA4lOLZezfovGZLgj2LWSYuJpsL/0DkMlgGoEdSwp53nMCbzAMQILhwG0OW64ii8N1V
         DyN5v3mTdIDwMWmphyA9WXqgCodd1U+r2b2B93eVNEAmOpUgSwWMGsAY2g4WMuOms92N
         9s29XdzZHvJfbppUwvWJfJFbhJfpmFaiEhYkdFa8CU0ots5FzViynkbi+I9WLnh8/Oyx
         B7V928c9kAnXrE9pa+Ne3AZ2FiuMSeS3lhUL+22oNfqWblOFmQAWYyvtHSt6AvWBaSlv
         vXvg==
X-Gm-Message-State: AOJu0YyPZvHDK50k1TOchqkQvi5VfwnRV6sDvQvIG8KMrgAkv5K4vwMa
	kcky/kYvQKNNdjbXIf7vvhKmOB5ECwKEuiJPH/yOp2raiLSnPJqLpabeHQ==
X-Google-Smtp-Source: AGHT+IGqNXeABFuhQmsFhwkbdLGJdIMOGDsRoAnur0UbZKZdJBEtg33KVDk3zdPEDndqs96erOfBGA==
X-Received: by 2002:a17:907:6088:b0:a86:7a84:abb7 with SMTP id a640c23a62f3a-a86a51b4cc7mr860077466b.20.1724736252493;
        Mon, 26 Aug 2024 22:24:12 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e675aa07sm57704166b.17.2024.08.26.22.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 22:24:12 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 25/34] libdnf: upgrade 0.73.2 -> 0.73.3
Date: Tue, 27 Aug 2024 07:23:45 +0200
Message-Id: <20240827052354.1319810-25-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240827052354.1319810-1-alex.kanavin@gmail.com>
References: <20240827052354.1319810-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 05:24:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203801

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...FindGtkDoc.cmake-drop-the-requirement-for-GTKDOC_SCA.patch | 2 +-
 ...Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch | 4 ++--
 .../libdnf/libdnf/0001-drop-FindPythonInstDir.cmake.patch     | 2 +-
 ...Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch | 4 ++--
 meta/recipes-devtools/libdnf/libdnf/armarch.patch             | 2 +-
 .../libdnf/libdnf/enable_test_data_dir_set.patch              | 4 ++--
 .../libdnf/{libdnf_0.73.2.bb => libdnf_0.73.3.bb}             | 2 +-
 7 files changed, 10 insertions(+), 10 deletions(-)
 rename meta/recipes-devtools/libdnf/{libdnf_0.73.2.bb => libdnf_0.73.3.bb} (97%)

diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-FindGtkDoc.cmake-drop-the-requirement-for-GTKDOC_SCA.patch b/meta/recipes-devtools/libdnf/libdnf/0001-FindGtkDoc.cmake-drop-the-requirement-for-GTKDOC_SCA.patch
index 046e09eab21..52e74263719 100644
--- a/meta/recipes-devtools/libdnf/libdnf/0001-FindGtkDoc.cmake-drop-the-requirement-for-GTKDOC_SCA.patch
+++ b/meta/recipes-devtools/libdnf/libdnf/0001-FindGtkDoc.cmake-drop-the-requirement-for-GTKDOC_SCA.patch
@@ -1,4 +1,4 @@
-From 5d6db56791d326e6b486dca54fe2335af0225229 Mon Sep 17 00:00:00 2001
+From 09ff4670e0717ea1a79430c14e108f93fb6f5f34 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 24 Nov 2016 14:33:07 +0200
 Subject: [PATCH] FindGtkDoc.cmake: drop the requirement for
diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch b/meta/recipes-devtools/libdnf/libdnf/0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch
index 223c1be2188..3f70b855c82 100644
--- a/meta/recipes-devtools/libdnf/libdnf/0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch
+++ b/meta/recipes-devtools/libdnf/libdnf/0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch
@@ -1,4 +1,4 @@
-From bf9bde4af952b67cc357d25b9863889099ea9665 Mon Sep 17 00:00:00 2001
+From 15de1b4266b85ffdf17fad374a43e0ed315b9f22 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 7 Feb 2017 12:16:03 +0200
 Subject: [PATCH] Get parameters for both libsolv and libsolvext (libdnf is
@@ -12,7 +12,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index e99b28d0..548a9137 100644
+index a6f14318..60c66e94 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
 @@ -51,7 +51,7 @@ endif()
diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-drop-FindPythonInstDir.cmake.patch b/meta/recipes-devtools/libdnf/libdnf/0001-drop-FindPythonInstDir.cmake.patch
index 27f76077d74..5d77bcb41a1 100644
--- a/meta/recipes-devtools/libdnf/libdnf/0001-drop-FindPythonInstDir.cmake.patch
+++ b/meta/recipes-devtools/libdnf/libdnf/0001-drop-FindPythonInstDir.cmake.patch
@@ -1,4 +1,4 @@
-From a6b3bc4fb3db996cd6c5616a99c16d085704dae0 Mon Sep 17 00:00:00 2001
+From 2a4a5f2da7d1b578619a8d0886f6db00bacefdc2 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 1 Jun 2021 10:23:59 +0800
 Subject: [PATCH] drop FindPythonInstDir.cmake
diff --git a/meta/recipes-devtools/libdnf/libdnf/0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch b/meta/recipes-devtools/libdnf/libdnf/0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch
index ecab47e5afa..25d61095252 100644
--- a/meta/recipes-devtools/libdnf/libdnf/0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch
+++ b/meta/recipes-devtools/libdnf/libdnf/0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch
@@ -1,4 +1,4 @@
-From e40def862bdeb10da295b15c5904fe2829d391c7 Mon Sep 17 00:00:00 2001
+From 9fb0e6130ef5d9fa68240c279d235eee8658c0fa Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:24:50 +0200
 Subject: [PATCH] Set libsolv variables with pkg-config (cmake's own module
@@ -12,7 +12,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 6444c374..e99b28d0 100644
+index c6bd46a6..a6f14318 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
 @@ -51,7 +51,8 @@ endif()
diff --git a/meta/recipes-devtools/libdnf/libdnf/armarch.patch b/meta/recipes-devtools/libdnf/libdnf/armarch.patch
index 63debdb58f5..54df0aab99d 100644
--- a/meta/recipes-devtools/libdnf/libdnf/armarch.patch
+++ b/meta/recipes-devtools/libdnf/libdnf/armarch.patch
@@ -1,4 +1,4 @@
-From aa0f8b65feec64420a9b7b61cfcc8bcce161e14b Mon Sep 17 00:00:00 2001
+From 8159808516543237fb110d0883e702385a1a866c Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Thu, 9 Nov 2023 10:29:31 +0000
 Subject: [PATCH] libdnf: Fix arm arch mapping issues for qemuarmv5
diff --git a/meta/recipes-devtools/libdnf/libdnf/enable_test_data_dir_set.patch b/meta/recipes-devtools/libdnf/libdnf/enable_test_data_dir_set.patch
index e4f6d447f17..986b71c4e6a 100644
--- a/meta/recipes-devtools/libdnf/libdnf/enable_test_data_dir_set.patch
+++ b/meta/recipes-devtools/libdnf/libdnf/enable_test_data_dir_set.patch
@@ -1,4 +1,4 @@
-From 25229773a9d4472235278bb45f75439e56630cee Mon Sep 17 00:00:00 2001
+From 3d77c2ff41b1a65d0f4852ed21d7a8ec41b368a8 Mon Sep 17 00:00:00 2001
 From: Joe Slater <joe.slater@windriver.com>
 Date: Wed, 22 Jul 2020 13:31:11 -0700
 Subject: [PATCH] libdnf: allow reproducible binary builds
@@ -14,7 +14,7 @@ Signed-off-by: Joe Slater <joe.slater@windriver.com>
  1 file changed, 6 insertions(+), 1 deletion(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 548a9137..c378e7d9 100644
+index 60c66e94..1459dfbf 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
 @@ -132,7 +132,12 @@ add_definitions(-DGETTEXT_DOMAIN=\\"libdnf\\")
diff --git a/meta/recipes-devtools/libdnf/libdnf_0.73.2.bb b/meta/recipes-devtools/libdnf/libdnf_0.73.3.bb
similarity index 97%
rename from meta/recipes-devtools/libdnf/libdnf_0.73.2.bb
rename to meta/recipes-devtools/libdnf/libdnf_0.73.3.bb
index ed433d4a9fb..e4a34f8ff6a 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.73.2.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.73.3.bb
@@ -13,7 +13,7 @@ SRC_URI = "git://github.com/rpm-software-management/libdnf;branch=dnf-4-master;p
            file://armarch.patch \
            "
 
-SRCREV = "86bbb159732e43dd6dff98c96e99382843f7c63b"
+SRCREV = "fbd34472e5edea0a3ed88ae14a47666e23538e4a"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(?!4\.90)\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.39.2


