Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6366FC25B0F
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 02:26:58 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web08.12171.1660530410549895925
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Aug 2022 19:26:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=W3jT2gF4;
 spf=pass (domain: gmail.com, ip: 209.85.215.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id bh13so5498002pgb.4
        for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Aug 2022 19:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=hBbsZCdXCnaRcvKtdoNonL1JS/BODT23GGm55vqsWZI=;
        b=W3jT2gF49Q9GJS1MlKjdAPYScbcHiCfu4wr7aMr8HBHefT7kOc5JbtHdlH3wmSwQmR
         O0scJMvAA1TWvfrdllJQ47rWCJtMD6+V5JcQQuIxkGamKCiwRar0svKOe3rh2Ff8zBAy
         TDKrLhQG+0bm/9G8J/OTb8+WUAOdPfoFA/OSmL6ZgYYPMcTnSM/9fboyKHR2aNZwKPWH
         lfZ1AZvisfvdUGu9CVf0QvKQxah90XOJY/SKT/EUy40Q+rMOJeEwWhvqMhR6bHNpVQL9
         co2faAxst+BueOeZbgw7RaxPS2uBmi0YXA8OMTwmxAZwiney5dZPs67ZTpuK/ZreoiMf
         taBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=hBbsZCdXCnaRcvKtdoNonL1JS/BODT23GGm55vqsWZI=;
        b=a9yTvHsno8OFbgdBN1zX5VDCXsJVW1dcEpAojgTPIUuaFe7PkWROyBC2TmBt4AcXXk
         QM/bZCMSmN4FSYwX8xgfDEfwz2eRUBWTFRyYcfYOv0OJIuVukLxSg9JXtENBuLGpt0B6
         BO0Lba9Wr7TINHAcfQHtJmC7F5u/MzqDd9btz0NntrtxqXtmq2iczpxbfq5VDfVvQdAX
         PW4eHHAE1rJKueq0kA9XsuLfBwi8YTL/dL3hdz5zO1hWnacA/ZrqCfEuJfut9Okq6anp
         Pi/l4EmYlZ8b+VpdUv9ClbmqSyupTgWRKAB3aGDix0YBEdfko8sgtKnbVlqxQ7478+Wb
         3Byw==
X-Gm-Message-State: ACgBeo31mMbA/vLL60MHiTZUNFSp1sBXK2n6i9mHbBFNBbLiIe31ulcC
	wbWA9WnkG9oLfhP01HKO3SpWruKspLpO+g==
X-Google-Smtp-Source: 
 AA6agR73BDkLtSBJF1mbb++a7gThICBmX9KX+PHP/j2n8d+JbRa77c12rithhPVIXFns50cLHAHozw==
X-Received: by 2002:a62:a21a:0:b0:532:4191:610a with SMTP id
 m26-20020a62a21a000000b005324191610amr14314312pff.75.1660530409486;
        Sun, 14 Aug 2022 19:26:49 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bb7a])
        by smtp.gmail.com with ESMTPSA id
 h11-20020a170902f54b00b0016db0d877e4sm6026608plf.221.2022.08.14.19.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Aug 2022 19:26:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/4] boost: Compile out stdlib unary/binary_functions for
 c++11 and newer
Date: Sun, 14 Aug 2022 19:26:43 -0700
Message-Id: <20220815022644.1665539-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220815022644.1665539-1-raj.khem@gmail.com>
References: <20220815022644.1665539-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Aug 2022 02:26:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169344

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


