Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E20CC25B0E
	for <webhook@archiver.kernel.org>; Tue, 16 Aug 2022 16:59:09 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.18094.1660669141050154256
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Aug 2022 09:59:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=T0APrCfS;
 spf=pass (domain: gmail.com, ip: 209.85.214.177,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id m2so9760085pls.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Aug 2022 09:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=hBbsZCdXCnaRcvKtdoNonL1JS/BODT23GGm55vqsWZI=;
        b=T0APrCfSpdrsKVcit7s2ySL0NPpM2zsH6Fxqrwh1bkwyM7/l+GIWPyxyNNZaFmKy1+
         65cg/kDkHnREytc/PiyAS+yfwyEYyxReaEnuVY4MtKNP0w1toHulZNo8IbI8QHWUWF7v
         DH40ZbsW8cE6QwXtZ9d7issAL+/vFMoPiWakatNJH29WkcVsyTezr5gLlJMtEqUSEvXx
         vh0yzGWCwGG8iwKPlg7yM1m8ZIShFa9DupAED5s8W1FLZPTb5nA3zZ4Q/okWtLl1VUDY
         jJHg4jsenMcttdppyDIKP2DRK+Xd2zC7V5m8UckaA4XWFQti4d/YLnIxh7G/XglB3Ipg
         hptA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=hBbsZCdXCnaRcvKtdoNonL1JS/BODT23GGm55vqsWZI=;
        b=nz2DrmwtJTaoTt154invAzLMfaH3sOiUFrheY6ku4WemYASvVymZ7KOZCWGYYB3J0f
         av9OCVt3QPT0Z/9LpR0/2bPSU4cviGumc5CIaycjsATLaSNamQUvlUzfnR6CC/15Ez+B
         PXWn5kPp8t3whwSh8IEB2hqD3UvkRlOybH+5yoGp3Vux/NF5peV2aUhm+eHfB0/gAOvb
         GmqQFTGSIqD9KwJUnrFWxIc/64L63rMzGNDK8abUQ/LSQIr4pNHz4LBp0hGONdPSsAfr
         INw8h8I32lnvH/e+NTNn5wPLDWYvynz5LHe3iJbFa9pUXHxYfehSTCaym3vtROSbyqcK
         +Pjw==
X-Gm-Message-State: ACgBeo2h7Fz5VNvOia8vKym0hdwQrL0V74CB92YA7lGIWbmjPGLhYSUR
	c9WcepgIMb9dSNMveZfkhoS7Ax3bNQEcYQ==
X-Google-Smtp-Source: 
 AA6agR6BVwboYV4do1TP9Bez2zUlMTPtjuNc2ffg8Pw/l8INLj4uOnRtUuUdmaspbNpZYOUt+h1B8Q==
X-Received: by 2002:a17:903:2c9:b0:172:57d5:d6f0 with SMTP id
 s9-20020a17090302c900b0017257d5d6f0mr18999116plk.61.1660669139840;
        Tue, 16 Aug 2022 09:58:59 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bb7a])
        by smtp.gmail.com with ESMTPSA id
 x21-20020a17090a531500b001f04479017fsm6562577pjh.29.2022.08.16.09.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 09:58:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/7] boost: Compile out stdlib unary/binary_functions for
 c++11 and newer
Date: Tue, 16 Aug 2022 09:58:51 -0700
Message-Id: <20220816165857.2342796-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Aug 2022 16:59:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169442

These base classes are deprecated/removed from libcpp15

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...y-binary_function-base-classes-are-d.patch | 34 +++++++++++++++++++
 meta/recipes-support/boost/boost_1.79.0.bb    |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-support/boost/boost/0001-The-std-lib-unary-binary_function-base-classes-are-d.patch

diff --git a/meta/recipes-support/boost/boost/0001-The-std-lib-unary-binary_function-base-classes-are-d.patch b/meta/recipes-support/boost/boost/0001-The-std-lib-unary-binary_function-base-classes-are-d.patch
new file mode 100644
index 00000000000..49603348eee
--- /dev/null
+++ b/meta/recipes-support/boost/boost/0001-The-std-lib-unary-binary_function-base-classes-are-d.patch
@@ -0,0 +1,34 @@
+From f9b55f5a1fab85bf73c95e6372779d6f50f75e84 Mon Sep 17 00:00:00 2001
+From: jzmaddock <john@johnmaddock.co.uk>
+Date: Mon, 11 Jul 2022 18:26:07 +0100
+Subject: [PATCH] The std lib unary/binary_function base classes are
+ deprecated/removed from libcpp15. Fixes
+ https://github.com/boostorg/container_hash/issues/24.
+
+Upstream-Status: Backport [https://github.com/boostorg/config/pull/440/commits/f0af4a9184457939b89110795ae2d293582c5f66]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ boost/config/stdlib/libcpp.hpp | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/boost/config/stdlib/libcpp.hpp b/boost/config/stdlib/libcpp.hpp
+index bc8536ead..0e9f2445e 100644
+--- a/boost/config/stdlib/libcpp.hpp
++++ b/boost/config/stdlib/libcpp.hpp
+@@ -168,4 +168,13 @@
+ #  define BOOST_NO_CXX14_HDR_SHARED_MUTEX
+ #endif
+ 
++#if _LIBCPP_VERSION >= 15000
++//
++// Unary function is now deprecated in C++11 and later:
++//
++#if __cplusplus >= 201103L
++#define BOOST_NO_CXX98_FUNCTION_BASE
++#endif
++#endif
++
+ //  --- end ---
+-- 
+2.37.2
+
diff --git a/meta/recipes-support/boost/boost_1.79.0.bb b/meta/recipes-support/boost/boost_1.79.0.bb
index dd5d6eadd61..09e25567903 100644
--- a/meta/recipes-support/boost/boost_1.79.0.bb
+++ b/meta/recipes-support/boost/boost_1.79.0.bb
@@ -5,4 +5,5 @@ SRC_URI += "file://boost-CVE-2012-2677.patch \
            file://boost-math-disable-pch-for-gcc.patch \
            file://0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch \
            file://0001-dont-setup-compiler-flags-m32-m64.patch \
+           file://0001-The-std-lib-unary-binary_function-base-classes-are-d.patch \
            "
-- 
2.37.2


