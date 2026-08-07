Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B756C5AC7A
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 00:17:57 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32739.1786061874865121037
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Aug 2026 17:17:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ZSTqhd8y;
 spf=pass (domain: gmail.com, ip: 209.85.160.169, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-51e4ba1cfb4so18031111cf.0
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 17:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786061874; x=1786666674; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cjhhcXKQcPZbDvw6eD5AVa4y0Fwq7PSPiaRGsCVZ/MI=;
        b=ZSTqhd8yfdR+uPuRtKXe0ujU1Cy5zLbSugZ5kLQQ+ihID1wXEdvOz5K/4KxrcEXyQM
         cSvNgJzC3vfln6q5bUA3C8C4LnXtKMA1CzqscdQrJdQuujTqFrkjZBV0bnwpm9y+hJl1
         //kQRaJem5BGhV+fJ4tQUWLqOZ5fYZWzO7FVKKMvP7qot1P2BiENXWpaMM3Weo2YDcUw
         TBRs0T2VWSDrVVpk+cNX5JfSYd516XERmmGoPcY0Cf0qSt/OtPfGTwFj/8BlTLqJv1XY
         OPtMGKV9RZWVr28WtiHZo+RB41gVR+AQIl1CheKDe0x9SzxX/+ppCC1Dx4CwwwvXOC66
         OyOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786061874; x=1786666674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=cjhhcXKQcPZbDvw6eD5AVa4y0Fwq7PSPiaRGsCVZ/MI=;
        b=TgGEmHVW1sPb7a124uME6LDt8B1Q9pfcRPOC/yyJMRMeuxgW7d8DP2XMTMX/aYyW5m
         G8/hxoNA65OHhPUA9ntS9evV8Tf4wz2mSR85pRo5fFIlFCsi7gic++6zm5G22rNx2Mg3
         shDkWyds60PvvYfLM/VTV4Nziru6LVtH2xoSTtue1gXnsYkxMAi64ORdCDYJV/Tbpzi6
         NK1iyUGAEsOC5YFr/WKRLArDmABl2HSJk+seemaj5hPKgMgWugefoQX6rqOEQL8SuAW6
         2t1/IZjR/qgAfc3V0sZueDoybWo1d7eJhcThsLIy8R9MTlPk8jtYEIOuHv6LFYUpdj47
         fWtQ==
X-Gm-Message-State: AOJu0YwgbO5sDeZIxfIJYOCrpsSmEr/YV3A+f4nBl0bmQXrzJI3Jvo/R
	e/mG/Ybr8KaKGH1tBjJ3rfa82h2QxbEcF1bOL4a/rojzzjIHDwhnj+U3D8cYVXAV
X-Gm-Gg: AR+sD11zM6YGxs2V8ya2rUF/bF9Kpc7IisrEJ8FgSN9ob31Mlhigm5F1VZZXg9p20Dp
	zOB/2ZdZaQNYRltd4PU7T2S23nFbaw48f7IznYaBsbOvg688QHiet9HoiEUfO4Ukvz4fUUJfkFo
	5BVPkIVMEt/Ohr5fkWRvyJmGYJs+BIrBmAJ2OtgmUaDCO4CFXbsOoLbo+mgCed7fYYip7dDCV5F
	gdxCvtzei7uBK19Nv8G4sxznjgBlLek1UfnA1O3y44+OmQ8DM5FxJ4fJmhVrcJF93qMTlWKbcpO
	dk0pHDmY11bdz37EUxUe0ZAHijMMuypEF8EQ0BZZndneQ6bq+FKOOMVp1SBllbGXMREJ96LnOl9
	VgZM/7eptvhbbM3Q6kjfNCz14Ac67IM3kD89Zx9MIHgyN6q7zezT+AMAcX/p7tMwUco/ptdMrlQ
	u8f8DIUf62jLuD54ccLqk87kdpykYPmqn4XJBML8t4Q+cIrEHAo4zLN1F1Np91mxgB2Zg5gAG+a
	7NombTmB2yzcl1EL+lANnPeCHsNyJc=
X-Received: by 2002:a05:622a:4a8b:b0:51c:1132:c80d with SMTP id d75a77b69052e-52ce611c93emr231060031cf.28.1786061873658;
        Thu, 06 Aug 2026 17:17:53 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52d160da94dsm993411cf.0.2026.08.06.17.17.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 17:17:52 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 2/2] sdk: fold SDK_TOOLCHAIN_LANGS into SDK_FEATURES
Date: Thu,  6 Aug 2026 20:17:44 -0400
Message-ID: <20260807001744.3874352-3-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260807001744.3874352-1-twoerner@gmail.com>
References: <20260807001744.3874352-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Aug 2026 00:17:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242973

Selecting the toolchain languages for an SDK is the same kind of choice
as selecting any other optional SDK content, so it does not need a list
of its own.

Make "go" and "rust" values of SDK_FEATURES and mark SDK_TOOLCHAIN_LANGS
as renamed so existing settings are reported rather than silently
ignored.

AI-Generated: codex/claude-opus 5 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes in v2:
- autobuilder.conf keeps += rather than switching to :append
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
index a9ae99a451e6..4f1b1ca777f6 100644
--- a/meta/conf/fragments/yocto-autobuilder/autobuilder.conf
+++ b/meta/conf/fragments/yocto-autobuilder/autobuilder.conf
@@ -9,6 +9,6 @@ IMAGE_CLASSES += 'testimage'
 SDK_EXT_TYPE = 'minimal'
 SDK_INCLUDE_TOOLCHAIN = '1'
 ESDK_LOCALCONF_REMOVE:append = 'BB_HASHSERVE'
-SDK_TOOLCHAIN_LANGS += 'go rust'
+SDK_FEATURES += 'go rust'
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


