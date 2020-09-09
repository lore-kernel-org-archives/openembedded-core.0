Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web11.8840.1599691579426360463
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2020 15:46:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=lFHJw66F;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.179, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f179.google.com with SMTP id p4so4177365qkf.0
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2020 15:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=vT6E/zHPvruOK6ontthAGo2GFBo9LysGobzc89Jj/sA=;
        b=lFHJw66FiVNuBcCU7rMJlbNRzXscb9SuJU197uULCkZ63i/MYW7IE/vAMNdr38+oBY
         IUn4VDxCfs4ukhS6Nj5hH+c6LRqN/Y4Cot66Ch/MJymkA4+R/ZuWp5jJv2BLU8iDIUGd
         7SY7wqDioDuUxwWuhM5apxrQq/E6qhoKcNmCRqDRGVIAg4/0R4TZ9u+5vfpyWNuG+lI0
         lysEt+VeteGMEA2RIvtyfNllpBVCmNJl5oWGFFbGIckn4OG/DNjOGDYSJ9CgbAKqvIRj
         A3xqaM11HvGzPxivmVJ8SbEDUsTGUbgActWNvGTy6fe2MSrTjUANxr1VCfNd3DI3q7JA
         eyzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vT6E/zHPvruOK6ontthAGo2GFBo9LysGobzc89Jj/sA=;
        b=Z3H9RytvEcpc0sQSLRdM63f0ll48flKuTZr3mOc7WGgBxZeax00aXp3fVcaVtkvXkx
         zTUnlVFsApPnMqW1VHICdWGLDObsStNsSHCo79/pBz0M7wdsBUD9eZHlp5Ad8vMvKHM6
         FkLbZQrv1nKx4R7Ou8S1cGxSMMQcz2Vty2vJqsFKEN6ibH3WMMQYbkPLzu1YEQmnGSiL
         oHGojOtqqmWr7vzCQu9Nq4wyd07bpFIYa/ysG/Q+GbncCEy36ro3ETp9PV5188GxnfiE
         jH67aoJFlX6ly0i59juslwlJ7JxSFTJkq3kUz9c7Y+Kus4qYnUZwyH+5bhQgUsV6dlaG
         WdyQ==
X-Gm-Message-State: AOAM530RY+JbC9EOMJUlqFrZu4YPIeUn73GdVZBMDQJM87pp0ud/I9Gj
	u8qZcLl4OaSeikCskH5Ron8IVF//H4obLrhO
X-Google-Smtp-Source: ABdhPJwQ+hIOxVeOGWc9o56+fcj2Hj6vr5KafVH9OV+hRMLNURrZTuy++7ovxZIB7Bl6kEqKzei9xg==
X-Received: by 2002:a05:620a:2404:: with SMTP id d4mr4937006qkn.284.1599691576824;
        Wed, 09 Sep 2020 15:46:16 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id l19sm4850781qtu.16.2020.09.09.15.46.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 15:46:16 -0700 (PDT)
From: "Jon Mason" <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [meta-oe][RFC 5/6] arch-armv8a.inc: Add tunes for supported ARMv8a cores
Date: Wed,  9 Sep 2020 18:45:34 -0400
Message-Id: <20200909224535.27164-6-jon.mason@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200909224535.27164-1-jon.mason@arm.com>
References: <20200909224535.27164-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add tunes for all the ARMv8a cores currently supported in GCC.  This
is: Cortex-A34, Cortex-A73, and Cortex-A73-Cortex-A35.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta/conf/machine/include/arm/arch-armv8a.inc | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/meta/conf/machine/include/arm/arch-armv8a.inc b/meta/conf/machine/include/arm/arch-armv8a.inc
index 0d01a8f49f88..db22d5ac69f9 100644
--- a/meta/conf/machine/include/arm/arch-armv8a.inc
+++ b/meta/conf/machine/include/arm/arch-armv8a.inc
@@ -15,6 +15,21 @@ PACKAGE_EXTRA_ARCHS_tune-cortexa32-crypto  = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-
 BASE_LIB_tune-cortexa32                    = "lib"
 BASE_LIB_tune-cortexa32-crypto             = "lib"
 
+#
+# Tune Settings for Cortex-A34
+#
+TUNEVALID[cortexa34] = "Enable Cortex-A34 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa34', ' -mcpu=cortex-a34', '', d)}"
+
+# Little Endian base configs
+AVAILTUNES                                += "cortexa34 cortexa34-crypto"
+ARMPKGARCH_tune-cortexa34                  = "cortexa34"
+ARMPKGARCH_tune-cortexa34-crypto           = "cortexa34"
+TUNE_FEATURES_tune-cortexa34               = "aarch64 cortexa34 crc"
+TUNE_FEATURES_tune-cortexa34-crypto        = "${TUNE_FEATURES_tune-cortexa34} crypto"
+PACKAGE_EXTRA_ARCHS_tune-cortexa34         = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa34"
+PACKAGE_EXTRA_ARCHS_tune-cortexa34-crypto  = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa34 cortexa34-crypto"
+
 #
 # Tune Settings for Cortex-A35
 #
@@ -72,6 +87,18 @@ ARMPKGARCH_tune-cortexa72                  = "cortexa72"
 TUNE_FEATURES_tune-cortexa72               = "aarch64 cortexa72 crc crypto"
 PACKAGE_EXTRA_ARCHS_tune-cortexa72         = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa72"
 
+#
+# Tune Settings for Cortex-A73
+#
+TUNEVALID[cortexa73] = "Enable Cortex-A73 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa73', ' -mcpu=cortex-a73', '', d)}"
+
+# Little Endian base configs
+AVAILTUNES                                += "cortexa73"
+ARMPKGARCH_tune-cortexa73                  = "cortexa73"
+TUNE_FEATURES_tune-cortexa73               = "aarch64 cortexa73 crc crypto"
+PACKAGE_EXTRA_ARCHS_tune-cortexa73         = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa73"
+
 #
 # Tune Settings for ThunderX
 #
@@ -115,6 +142,22 @@ TUNE_FEATURES_tune-cortexa72-cortexa53-crypto = "${TUNE_FEATURES_tune-cortexa72-
 PACKAGE_EXTRA_ARCHS_tune-cortexa72-cortexa53  = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa72-cortexa53"
 PACKAGE_EXTRA_ARCHS_tune-cortexa72-cortexa53-crypto = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa72-cortexa53 cortexa72-cortexa53-crypto"
 
+#
+# Tune Settings for big.LITTLE Cortex-A73 - Cortex-A35
+#
+TUNEVALID[cortexa73-cortexa35] = "Enable big.LITTLE Cortex-A73.Cortex-A35 specific processor optimizations"
+MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "cortexa73-cortexa35", "cortexa73-cortexa35:", "" ,d)}"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa73-cortexa35", " -mcpu=cortex-a73.cortex-a35", "", d)}"
+
+# cortexa73.cortexa35 implies crc support
+AVAILTUNES                                += "cortexa73-cortexa35 cortexa73-cortexa35-crypto"
+ARMPKGARCH_tune-cortexa73-cortexa35        = "cortexa73-cortexa35"
+ARMPKGARCH_tune-cortexa73-cortexa35-crypto = "cortexa73-cortexa35-crypto"
+TUNE_FEATURES_tune-cortexa73-cortexa35     = "aarch64 crc cortexa73-cortexa35"
+TUNE_FEATURES_tune-cortexa73-cortexa35-crypto = "${TUNE_FEATURES_tune-cortexa73-cortexa35} crypto"
+PACKAGE_EXTRA_ARCHS_tune-cortexa73-cortexa35  = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa73-cortexa35"
+PACKAGE_EXTRA_ARCHS_tune-cortexa73-cortexa35-crypto  = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa73-cortexa35 cortexa73-cortexa35-crypto"
+
 #
 # Tune Settings for big.LITTLE Cortex-A73 - Cortex-A53
 #
-- 
2.20.1

