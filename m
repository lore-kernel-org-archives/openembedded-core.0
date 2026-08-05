Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 157ADC55822
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 07:01:53 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34900.1785913304704188910
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2026 00:01:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=bQfr8EZ5;
 spf=pass (domain: gmail.com, ip: 209.85.160.171, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-517dc520840so4192831cf.3
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 00:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785913304; x=1786518104; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fqt55ZacNaifi2DIB/BOlUp8ocAljMBr1AmnBSn/y58=;
        b=bQfr8EZ5VIjfzgtXjN9OirVn3O1aFmovbnf2VVfEOycGP7Rk2ZKkZoSh2z1Wg9rBa+
         5KkjHtIuDDyOHz8GsUf1bN8pIYHDrcVjm06gjIZWL8uzrSQWCBcodh6yW7xcug7duVLR
         tSg5Qn99M9H+gO3nAT4u7xd4fp8mr8Cy63j7chvxND6tj4Wa/FFdo03KYjSm7wqqomDS
         sprXb39/6//uTfDNe9JRgbmvjTfZYh4TLgyXy1i9syTwG6xB6Jlo5ImRX3CnVohVrhij
         66tLRu3zXGVm5PsoN1mlUn89mNn1XypC33NYwCPMNQ9OBOi0obw9D13lSUGOFqd8xoLz
         b53Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785913304; x=1786518104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=fqt55ZacNaifi2DIB/BOlUp8ocAljMBr1AmnBSn/y58=;
        b=VG5Pay6HWlbVdLrvc/76iZ5Rb8t3fahJtYVlIt7aI2JarlOrdGbEDypXJRgPKRu7RB
         cxW7FUkft9b2d+a3ISSks0H0R91ChR9j7MHVTP/jC0HYxiy8zSMbnrXxx7Pj51rMrL5c
         le7rhAQf2uoS6du9UgpEpHyKMuPgRX1CY/yidsYSeXk50/mng8w+uhE6r9GseLOO+K1V
         3AovN8Aw66vXP7IUtbj/4sUivyTGQVWxhaEbv007OeXiH2kGsHIliEbAj2tKQ2g2ximB
         JgeyKkowYF4mcyeK1+Q4AOQrp6ITc+dhvI9JaeH0kYBkoghSJ5OZXBdKemNSvenOk+fD
         NfCw==
X-Gm-Message-State: AOJu0YyreRAB6NdQeITTANWm12EagvMRoRV4T8cAtu4AIraKCiYd2gDQ
	0Ea7gJSVVVtfgItRM6tgth/xcI1KKoIjF4zQvGx62YqXmo16IpYwCsLmQgK0hg==
X-Gm-Gg: AR+sD12FWcGSty87yAl4v/HMI/eYAn4bwyMU4cW5MZkWgeuD19LukMdvqcRDW4Xorm9
	EfsbeORNG0df5ilzZ9Dqoz28YjqWtKMjvfe8fNFB41T6o534y8mTW2dNAEkrkwzeUUR/ECDfmtJ
	XAegTEILih1GREiLv/AhE1Bti8TfFPyTYzr8Z7W5/vcP+5WSqIcOa4JScmtJvINMEWihIy8ipc7
	GmSZfj/7ofSHCgKSakdyWjORFrEw7/woueQYWVNXh5JENd77q4vspXqfGvXmhQz+AC6sQPwDXQ4
	Wu1pfMUxz0anI0UiZb9MqhrGjjWbCvR5GAQHVDOgYWQo8mNV39BH7X3r3t3lzJPd8Mb0w3RX8nA
	7nlzath75roUEnX1zE/mPOgfm5QRC+1LZbO5b9R+v4YWT+IdMm89qNC0hIO/oBX3DCDqhUfgEGj
	FZXONwUFBTlmvQotL1GXHi0C9lVdhM7sRMGTN1tlSOeCY4xBP4Qk0G3xOyp3Zz0go/wVlFHplZL
	UWVQfenNQSRM6myRbl7zyjln/lII5WkrGqf0jUiqQ==
X-Received: by 2002:a05:622a:1112:b0:51c:24a:ea6b with SMTP id d75a77b69052e-52ce5fa4664mr41923741cf.4.1785913303646;
        Wed, 05 Aug 2026 00:01:43 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52ce8975b3dsm13211661cf.30.2026.08.05.00.01.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 00:01:42 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] sdk: fold SDK_TOOLCHAIN_LANGS into SDK_FEATURES
Date: Wed,  5 Aug 2026 03:01:36 -0400
Message-ID: <20260805070136.3499233-3-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260805070136.3499233-1-twoerner@gmail.com>
References: <20260805070136.3499233-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 07:01:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242832

Selecting the toolchain languages for an SDK is the same kind of choice
as selecting any other optional SDK content, so it does not need a list
of its own.

Make "go" and "rust" values of SDK_FEATURES and mark SDK_TOOLCHAIN_LANGS
as renamed so existing settings are reported rather than silently
ignored.

AI-Generated: codex/claude-opus 5 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/classes-recipe/populate_sdk_base.bbclass | 21 +++++++++----------
 meta/conf/bitbake.conf                        |  1 +
 .../yocto-autobuilder/autobuilder.conf        |  2 +-
 .../packagegroups/packagegroup-core-sdk.bb    |  2 +-
 4 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/classes-recipe/populate_sdk_base.bbclass b/meta/classes-recipe/populate_sdk_base.bbclass
index aea4226ec33e..b2e6f1cae9eb 100644
--- a/meta/classes-recipe/populate_sdk_base.bbclass
+++ b/meta/classes-recipe/populate_sdk_base.bbclass
@@ -59,27 +59,26 @@ B:task-populate-sdk = "${SDK_DIR}"
 
 SDKTARGETSYSROOT = "${SDKPATH}/sysroots/${REAL_MULTIMACH_TARGET_SYS}"
 
-SDK_TOOLCHAIN_LANGS ??= ""
-SDK_TOOLCHAIN_LANGS:remove:sdkmingw32 = "rust"
+SDK_FEATURES:remove:sdkmingw32 = "rust"
 # libstd-rs doesn't build for mips n32 with compiler constraint errors
-SDK_TOOLCHAIN_LANGS:remove:mipsarchn32 = "rust"
+SDK_FEATURES:remove:mipsarchn32 = "rust"
 # go will not build for x86-x32 or mingw
-SDK_TOOLCHAIN_LANGS:remove:linux-gnux32 = "go"
-SDK_TOOLCHAIN_LANGS:remove:riscv32 = "go"
-SDK_TOOLCHAIN_LANGS:remove:sdkmingw32 = "go"
-SDK_TOOLCHAIN_LANGS:remove:powerpc = "go"
+SDK_FEATURES:remove:linux-gnux32 = "go"
+SDK_FEATURES:remove:riscv32 = "go"
+SDK_FEATURES:remove:sdkmingw32 = "go"
+SDK_FEATURES:remove:powerpc = "go"
 
 TOOLCHAIN_HOST_TASK ?= " \
     nativesdk-packagegroup-sdk-host \
     packagegroup-cross-canadian-${MACHINE} \
-    ${@bb.utils.contains('SDK_TOOLCHAIN_LANGS', 'go', 'packagegroup-go-cross-canadian-${MACHINE}', '', d)} \
-    ${@bb.utils.contains('SDK_TOOLCHAIN_LANGS', 'rust', 'packagegroup-rust-cross-canadian-${MACHINE}', '', d)} \
+    ${@bb.utils.contains('SDK_FEATURES', 'go', 'packagegroup-go-cross-canadian-${MACHINE}', '', d)} \
+    ${@bb.utils.contains('SDK_FEATURES', 'rust', 'packagegroup-rust-cross-canadian-${MACHINE}', '', d)} \
 "
 TOOLCHAIN_HOST_TASK_ATTEMPTONLY ?= ""
 TOOLCHAIN_TARGET_TASK ?= " \
     ${@oe.utils.multilib_pkg_extend(d, 'packagegroup-core-standalone-sdk-target')} \
-    ${@bb.utils.contains('SDK_TOOLCHAIN_LANGS', 'go', oe.utils.multilib_pkg_extend(d, 'packagegroup-go-sdk-target'), '', d)} \
-    ${@bb.utils.contains('SDK_TOOLCHAIN_LANGS', 'rust', oe.utils.multilib_pkg_extend(d, 'libstd-rs'), '', d)} \
+    ${@bb.utils.contains('SDK_FEATURES', 'go', oe.utils.multilib_pkg_extend(d, 'packagegroup-go-sdk-target'), '', d)} \
+    ${@bb.utils.contains('SDK_FEATURES', 'rust', oe.utils.multilib_pkg_extend(d, 'libstd-rs'), '', d)} \
     target-sdk-provides-dummy \
 "
 TOOLCHAIN_TARGET_TASK_ATTEMPTONLY ?= ""
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index c402f9f0b7c8..8eae49650bd3 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -128,6 +128,7 @@ BB_RENAMED_VARIABLES[DISTRO_FEATURES_BACKFILL_CONSIDERED] = "DISTRO_FEATURES_OPT
 BB_RENAMED_VARIABLES[MACHINE_FEATURES_DEFAULT] = "is obsolete, add all default features to MACHINE_FEATURES_DEFAULTS"
 BB_RENAMED_VARIABLES[MACHINE_FEATURES_BACKFILL] = "is obsolete, add all default features to MACHINE_FEATURES_DEFAULTS"
 BB_RENAMED_VARIABLES[MACHINE_FEATURES_BACKFILL_CONSIDERED] = "MACHINE_FEATURES_OPTED_OUT"
+BB_RENAMED_VARIABLES[SDK_TOOLCHAIN_LANGS] = "SDK_FEATURES"
 
 ##################################################################
 # Architecture-dependent build variables.
diff --git a/meta/conf/fragments/yocto-autobuilder/autobuilder.conf b/meta/conf/fragments/yocto-autobuilder/autobuilder.conf
index a9ae99a451e6..601cf269ab04 100644
--- a/meta/conf/fragments/yocto-autobuilder/autobuilder.conf
+++ b/meta/conf/fragments/yocto-autobuilder/autobuilder.conf
@@ -9,6 +9,6 @@ IMAGE_CLASSES += 'testimage'
 SDK_EXT_TYPE = 'minimal'
 SDK_INCLUDE_TOOLCHAIN = '1'
 ESDK_LOCALCONF_REMOVE:append = 'BB_HASHSERVE'
-SDK_TOOLCHAIN_LANGS += 'go rust'
+SDK_FEATURES:append = ' go rust'
 PTEST_EXPECT_FAILURE = '1'
 
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
index 4a147c059e96..b3010d767456 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
@@ -10,7 +10,7 @@ inherit packagegroup
 
 #PACKAGEFUNCS =+ 'generate_sdk_pkgs'
 
-TARGET_TOOLCHAIN_LANGS ??= "${SDK_TOOLCHAIN_LANGS}"
+TARGET_TOOLCHAIN_LANGS ??= "${@bb.utils.filter('SDK_FEATURES', 'go rust', d)}"
 TARGET_TOOLCHAIN_LANGS:remove:sdkmingw32 = "rust"
 # libstd-rs doesn't build for mips n32 with compiler constraint errors
 TARGET_TOOLCHAIN_LANGS:remove:mipsarchn32 = "rust"
-- 
2.50.0.173.g8b6f19ccfc3a


