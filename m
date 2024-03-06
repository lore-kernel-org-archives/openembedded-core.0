Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07889C54E4A
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 15:42:10 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.14858.1709739723451101051
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 07:42:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EGuUuBDF;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a44ad785a44so640824266b.3
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 07:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709739722; x=1710344522; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OiWrDlHftwormEHx0JaBpE6EVRg40WtJtGoHvq0aHf4=;
        b=EGuUuBDF9JWQCNRTzP6/+JKJ2+/djrOi94bDNz5H7GDC9Ua5dWFTVXJ9/lKkKrq+on
         ichmGGcg0HMAxoaQM5VlCXD8j4tKVcZARyUFjvfbhCkqKpps9PTRYq2kqRO8AKJY6MaB
         P9RqeylzQBPKzodUAiS64ihIsgCc/36013WbJgUR9b4NneqkGZmTsgUnv195N02HHTTI
         64K0BHm7EVGCHpFXdzo73yKTb/BYHOf1BhfFoHhNzfWvyxuulFTAhblPF28+UB7EvVsR
         o3WA98WabHidyGWVdAyYkQY7Iz9rUcYKd+gQVT9mR8eCKX3ZbAX+CfZsMHoBchn2keB9
         9GGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709739722; x=1710344522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OiWrDlHftwormEHx0JaBpE6EVRg40WtJtGoHvq0aHf4=;
        b=rCMF6CK31zxHdJ3hDuKhbiCVSdl3qwZLj/5BcKtHXbDgbAWyecZjmXzAhh5lXfh+dX
         HV7e72oHjK8Rxgz91WO7hDMBHF042NKWgLyHUNg96MGrbnc0ftZs3UDnDR/gBWguphy2
         IX/3/yvrMZDv1vlrpsAg2jaqk6QyBwb05NzqSVw1HIOMirNbF3GTreH9UaHKHQJDJqW4
         M0vp0g2z2Hw+kmcevN5kneS9hcgIHA18P9HtnrLKNrNVf0ADySLYXrBg/9zID9oP1+8l
         WMaDR8rW3w/C1Uk4QJJbICyl31RnZBeykj+8ozVALzJxZkDKel2RGyg88RyRiobRB1kB
         eG1w==
X-Gm-Message-State: AOJu0YxemkGgpX/O3qIkADCBIcvkgCHspenfN6diR43ctzddukFkSuln
	z9xUjd9xAJVA+X4ywJWRNVHGDqWE2Dg37gWvVMPSODVy+mIHu6Obl8p3z4yB
X-Google-Smtp-Source: AGHT+IFsxxCBjgXxu4xpZq6CV4axbfForNP3YweW7C0ZHSIymGwOflXG6ieGfHLmJhm6E9v7ogkLZQ==
X-Received: by 2002:a17:906:d0d6:b0:a45:ad59:cbc6 with SMTP id bq22-20020a170906d0d600b00a45ad59cbc6mr3126259ejb.26.1709739721839;
        Wed, 06 Mar 2024 07:42:01 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id x11-20020a170906710b00b00a4434e9938asm7209343ejj.84.2024.03.06.07.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 07:42:01 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 04/47] boost: upgrade 1.83.0 -> 1.84.0
Date: Wed,  6 Mar 2024 16:41:08 +0100
Message-Id: <20240306154151.3741709-4-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240306154151.3741709-1-alex@linutronix.de>
References: <20240306154151.3741709-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 15:42:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196687

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../boost/{boost-1.83.0.inc => boost-1.84.0.inc}  |  2 +-
 ...ive_1.83.0.bb => boost-build-native_1.84.0.bb} |  0
 ...-arch-instruction-set-flags-we-do-that-o.patch |  7 +++----
 .../0001-dont-setup-compiler-flags-m32-m64.patch  | 15 ++++++---------
 .../boost/boost-math-disable-pch-for-gcc.patch    |  9 +++------
 .../boost/{boost_1.83.0.bb => boost_1.84.0.bb}    |  0
 6 files changed, 13 insertions(+), 20 deletions(-)
 rename meta/recipes-support/boost/{boost-1.83.0.inc => boost-1.84.0.inc} (90%)
 rename meta/recipes-support/boost/{boost-build-native_1.83.0.bb => boost-build-native_1.84.0.bb} (100%)
 rename meta/recipes-support/boost/{boost_1.83.0.bb => boost_1.84.0.bb} (100%)

diff --git a/meta/recipes-support/boost/boost-1.83.0.inc b/meta/recipes-support/boost/boost-1.84.0.inc
similarity index 90%
rename from meta/recipes-support/boost/boost-1.83.0.inc
rename to meta/recipes-support/boost/boost-1.84.0.inc
index da275f18c1f..5bbea2ba5bc 100644
--- a/meta/recipes-support/boost/boost-1.83.0.inc
+++ b/meta/recipes-support/boost/boost-1.84.0.inc
@@ -12,7 +12,7 @@ BOOST_MAJ = "${@"_".join(d.getVar("PV").split(".")[0:2])}"
 BOOST_P = "boost_${BOOST_VER}"
 
 SRC_URI = "https://boostorg.jfrog.io/artifactory/main/release/${PV}/source/${BOOST_P}.tar.bz2"
-SRC_URI[sha256sum] = "6478edfe2f3305127cffe8caf73ea0176c53769f4bf1585be237eb30798c3b8e"
+SRC_URI[sha256sum] = "cc4b893acf645c9d4b698e9a0f08ca8846aa5d6c68275c14c3e7949c24109454"
 
 UPSTREAM_CHECK_URI = "http://www.boost.org/users/download/"
 UPSTREAM_CHECK_REGEX = "release/(?P<pver>.*)/source/"
diff --git a/meta/recipes-support/boost/boost-build-native_1.83.0.bb b/meta/recipes-support/boost/boost-build-native_1.84.0.bb
similarity index 100%
rename from meta/recipes-support/boost/boost-build-native_1.83.0.bb
rename to meta/recipes-support/boost/boost-build-native_1.84.0.bb
diff --git a/meta/recipes-support/boost/boost/0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch b/meta/recipes-support/boost/boost/0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch
index 4fe15741bf6..9ba5d5cc334 100644
--- a/meta/recipes-support/boost/boost/0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch
+++ b/meta/recipes-support/boost/boost/0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch
@@ -1,4 +1,4 @@
-From 21ba558abe074e7d49bdc931018ce2138e6e8eb5 Mon Sep 17 00:00:00 2001
+From 18185e939ca121335a6172c8e50872af8122a759 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 18 Dec 2018 15:42:57 +0100
 Subject: [PATCH] Don't set up arch/instruction-set flags, we do that
@@ -8,16 +8,15 @@ ourselves
 Upstream-Status: Inappropriate
 Signed-off-by: Christopher Larson <chris_larson@mentor.com>
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  tools/build/src/tools/gcc.jam | 153 ----------------------------------
  1 file changed, 153 deletions(-)
 
 diff --git a/tools/build/src/tools/gcc.jam b/tools/build/src/tools/gcc.jam
-index 726555369..5c5f8ba91 100644
+index 834f5e1bf..493a43e6d 100644
 --- a/tools/build/src/tools/gcc.jam
 +++ b/tools/build/src/tools/gcc.jam
-@@ -1124,156 +1124,3 @@ local rule cpu-flags ( toolset variable : architecture : instruction-set + :
+@@ -1113,156 +1113,3 @@ local rule cpu-flags ( toolset variable : architecture : instruction-set + :
          <architecture>$(architecture)/<instruction-set>$(instruction-set)
          : $(values) ;
  }
diff --git a/meta/recipes-support/boost/boost/0001-dont-setup-compiler-flags-m32-m64.patch b/meta/recipes-support/boost/boost/0001-dont-setup-compiler-flags-m32-m64.patch
index 78b19225d43..913810a3400 100644
--- a/meta/recipes-support/boost/boost/0001-dont-setup-compiler-flags-m32-m64.patch
+++ b/meta/recipes-support/boost/boost/0001-dont-setup-compiler-flags-m32-m64.patch
@@ -1,4 +1,4 @@
-From 59402e3a61d14eb7ce8c2019ea1a87ad4bd28605 Mon Sep 17 00:00:00 2001
+From bbb0845c0a79238fb2e84cca41826a0944b6ce7e Mon Sep 17 00:00:00 2001
 From: Anuj Mittal <anuj.mittal@intel.com>
 Date: Thu, 14 Nov 2019 10:13:53 +0800
 Subject: [PATCH] dont setup compiler flags -m32/-m64
@@ -13,13 +13,14 @@ Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
  1 file changed, 14 deletions(-)
 
 diff --git a/tools/build/src/tools/gcc.jam b/tools/build/src/tools/gcc.jam
-index c7e3cf3..24486e0 100644
+index 493a43e6d..42dccbdfe 100644
 --- a/tools/build/src/tools/gcc.jam
 +++ b/tools/build/src/tools/gcc.jam
-@@ -430,20 +430,6 @@ local rule compile-link-flags ( * )
+@@ -360,20 +360,6 @@ local rule compile-link-flags ( * )
+     compile-link-flags <link>shared/<target-os>$(non-windows) : -fPIC ;
  }
  
- {
+-{
 -    # Handle address-model
 -    compile-link-flags <target-os>aix/<address-model>32 : -maix32 ;
 -    compile-link-flags <target-os>aix/<address-model>64 : -maix64 ;
@@ -33,10 +34,6 @@ index c7e3cf3..24486e0 100644
 -    compile-link-flags <target-os>$(generic-os)/<architecture>$(arch)/<address-model>64 : -m64 ;
 -}
 -
--{
+ {
      # Handle threading
      local rule threading-flags ( * )
-     {
--- 
-2.7.4
-
diff --git a/meta/recipes-support/boost/boost/boost-math-disable-pch-for-gcc.patch b/meta/recipes-support/boost/boost/boost-math-disable-pch-for-gcc.patch
index 595ba178650..9b6fcc63588 100644
--- a/meta/recipes-support/boost/boost/boost-math-disable-pch-for-gcc.patch
+++ b/meta/recipes-support/boost/boost/boost-math-disable-pch-for-gcc.patch
@@ -1,4 +1,4 @@
-From cabfcba1ff7511ffd6b91ca244288d44f585aad2 Mon Sep 17 00:00:00 2001
+From d6864bd78c01c5e8578805a7b67555c70a0e99a2 Mon Sep 17 00:00:00 2001
 From: Jackie Huang <jackie.huang@windriver.com>
 Date: Fri, 23 Sep 2016 01:04:50 -0700
 Subject: [PATCH] boost-math: disable pch for gcc
@@ -14,10 +14,10 @@ Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/libs/math/build/Jamfile.v2 b/libs/math/build/Jamfile.v2
-index e19fb2e..82472a7 100644
+index fd840287e..5aff7d724 100644
 --- a/libs/math/build/Jamfile.v2
 +++ b/libs/math/build/Jamfile.v2
-@@ -13,7 +13,7 @@ project
+@@ -14,7 +14,7 @@ project
        #<toolset>intel-linux:<pch>off
        <toolset>intel-darwin:<pch>off
        <toolset>msvc-7.1:<pch>off
@@ -26,6 +26,3 @@ index e19fb2e..82472a7 100644
        #<toolset>gcc:<cxxflags>-fvisibility=hidden
        <toolset>intel-linux:<cxxflags>-fvisibility=hidden
        #<toolset>sun:<cxxflags>-xldscope=hidden
--- 
-2.7.4
-
diff --git a/meta/recipes-support/boost/boost_1.83.0.bb b/meta/recipes-support/boost/boost_1.84.0.bb
similarity index 100%
rename from meta/recipes-support/boost/boost_1.83.0.bb
rename to meta/recipes-support/boost/boost_1.84.0.bb
-- 
2.39.2


