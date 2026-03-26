Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3114109E53C
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 02:09:37 +0000 (UTC)
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39421.1774490970062104528
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 19:09:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=fMBwp7D0;
 spf=pass (domain: gmail.com, ip: 74.125.82.178, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2c0c955a481so760069eec.1
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 19:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774490969; x=1775095769; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E/LDm4qa6bXS8mIhDUkeS5YAI3LIFFJJGO1MFJtAV14=;
        b=fMBwp7D0f3F719asxzC+TA/xEKDolthjh2agxk7GkSijgzFpVRCHY/yM7C4t8j9hn2
         LGliG7i1QRLByXKhlWmqFnIWIOe4IsWy6CqmDtds9FY7xQ8baOYeQT45GFgICyasBnqV
         71fRHZw7l6u6mMYfM7PUg9bXGp0K7wOkjAg2wJVSpeObacqKc26ernPWzq+vfuWXX6NS
         JINW5vCylf4i16f3JlHldNptifIe88Ts8ynVhn6cnx7UBtuPRMZfY3OkxPaKJ9Z6hWMc
         nyltJbLKcD8pueBrfj9+K3vGlwKJtqsk/Sr0w2FhtEjf+llQiddZNg5ureW7Cvpro/3k
         EaZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774490969; x=1775095769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E/LDm4qa6bXS8mIhDUkeS5YAI3LIFFJJGO1MFJtAV14=;
        b=NWDV9TPrUFpRmEKbaLa/9BPyF/VN/QO26xcb6POt4rmjh3xLjBgcbvQjjXSk+gqssV
         ZDkC3rC2GxMR4VYZntdBpKPTi0xRSuao3HKAsfQJjjRjY2VdJg4iweWk4HEMCs1wvUsy
         V+CFahh18QWhD3SQyRLbaFoGrTVVaz89s9KYnFkD4jXY32FAuR3vAascxlj/EBbwMAS5
         cR+BlQ6DeW3b4jNS73LN5Is368IFV2QPSix5Mp1hEA9g6g08leWUhVzzpzTZaXzP9h/S
         MnJ4qFD6L85B3g6GZfRJzRAekEeviRBv18HSKpBpiZQyODW33lX4kmF5liiXCOm+qm97
         vPtg==
X-Gm-Message-State: AOJu0YwkE8b1bJGGbyk+4VKjVeFZDUzu48GanCV/Z8Yqkrvz/RuxVJvC
	aRsRydssv4thgfdnJZo5N1H8KIrg+kHmPOv+4uEFOKDj75friK6HKUFp6hcfUJKuneM=
X-Gm-Gg: ATEYQzz2NSTTmT0BO9St4++I3yVRcwjzTN+QwxXthr7M4CoP3mlv72sY2OqIF8LP7qo
	Nnl6ui0OvCPourb4YABOdOYnV/ZpWugVThxC7kShYIDSLAPtQ+CCKIQwHXeBuhZrFlKc6rLSvef
	aMVP6L2ov3lpSZCV/Q+93CWTDRhx4JrEGQvT8dm+zwLuYGHbudAJRfi+t3JFn6JX0qLvlRAarMS
	siU5k1CHO2vo2FX7C/6rw78H9O9O/fB3OxKZU70WbCCgkYNOxGHBjZ9V7Q2cFw6yf8FFJQLNZ2r
	J/QyKy6foZGr5Aj3S/0/5eAOZTCu4qgAl3qblcdO7XLW8TAcNEpvpg4V3vbTRMVlFQr3VEX0bbV
	Ol4fABNxjO26XHMjlJ5dDiBuEzwibz25jdKxteMA/avYOQBnt/cpLr8l/3+vaZwTu5iAFJMOdq8
	SMHSbPvR3kbtDzbrPZaOwMTdWjxUpZPPEocwf4Uk98His4dMKEL90h6JMuMm75YHBALR7ADz1/7
	iN6QHFFEvNylb5NAnkxMQznsYG0Oo8fr/V84bKEkZxZ6V6PJCX8hkFbRjhZ
X-Received: by 2002:a05:7022:402:b0:11b:7970:ea3f with SMTP id a92af1059eb24-12a96ed3483mr3208920c88.25.1774490969051;
        Wed, 25 Mar 2026 19:09:29 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12aa6e5b38csm2359060c88.2.2026.03.25.19.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 19:09:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 3/4] spirv-llvm-translation: Upgrade to 22.0
Date: Wed, 25 Mar 2026 19:09:21 -0700
Message-ID: <20260326020923.297511-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326020923.297511-1-khem.raj@oss.qualcomm.com>
References: <20260326020923.297511-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 02:09:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233943

From: Khem Raj <raj.khem@gmail.com>

major version of spirv translator should match clang major version

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Rebased

 ...anslator_21.1.5.bb => spirv-llvm-translator_22.0.0.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/spir/{spirv-llvm-translator_21.1.5.bb => spirv-llvm-translator_22.0.0.bb} (75%)

diff --git a/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.5.bb b/meta/recipes-graphics/spir/spirv-llvm-translator_22.0.0.bb
similarity index 75%
rename from meta/recipes-graphics/spir/spirv-llvm-translator_21.1.5.bb
rename to meta/recipes-graphics/spir/spirv-llvm-translator_22.0.0.bb
index a727079a43..20f4ba8464 100644
--- a/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.5.bb
+++ b/meta/recipes-graphics/spir/spirv-llvm-translator_22.0.0.bb
@@ -5,10 +5,10 @@ LICENSE = "NCSA"
 LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=47e311aa9caedd1b3abf098bd7814d1d"

 # pattern: llvm_branch_200, currently there are no minor releases, so, no llvm_branch_201
-SPIRV_BRANCH = "llvm_release_${@oe.utils.trim_version('${PV}', 1).replace('.', '')}0"
-SRCREV = "a76fd0702de564476fb31e8a15f1415f05ad8951"
+SPIRV_BRANCH = "main"
+SRCREV = "f821423888319dd2f0c436fc9ab86c798ac48ba1"
 SRC_URI = " \
-    git://github.com/KhronosGroup/SPIRV-LLVM-Translator;protocol=https;tag=v${PV};branch=${SPIRV_BRANCH} \
+    git://github.com/KhronosGroup/SPIRV-LLVM-Translator;protocol=https;branch=${SPIRV_BRANCH} \
 "

 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
@@ -18,7 +18,7 @@ DEPENDS = "llvm spirv-tools spirv-headers"
 inherit cmake pkgconfig lib_package

 EXTRA_OECMAKE = "\
-    -DBASE_LLVM_VERSION='${@oe.utils.trim_version('${PV}', 3)}' \
+    -DBASE_LLVM_VERSION=22.1.0 \
     -DCMAKE_SKIP_BUILD_RPATH=ON \
     -DBUILD_SHARED_LIBS=ON \
     -DLLVM_EXTERNAL_SPIRV_HEADERS_SOURCE_DIR=${STAGING_INCDIR}/.. \

