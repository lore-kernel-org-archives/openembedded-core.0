Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
 by mx.groups.io with SMTP id smtpd.web10.62780.1600096461160012275
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2020 08:14:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=Qjim5ZVx;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.68, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f68.google.com with SMTP id q10so9126319qvs.1
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2020 08:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=p+C/IIFxm2SFrj/cxAHaWiLDMesfbyU8FjDNDSKndMU=;
        b=Qjim5ZVx3zrvihnpc47U4NM9c4C2x6jn1cGrcmctK5fRr1iFwx+PYlEhZv/oL6ppth
         pQLrTxxRsI3Nwjipr3lfPUhIV9i0w/AxsdblsIrqCIOBmO41IAiMNh6JNjt+YhQHmWGM
         AcrkOzv7EJvdDjT001BksxeU+EvoGcKdyRM+TpZ2Cv6cktYoRf5j7mUZG+9hD1GIevnJ
         8WNSwyWBujwSaaYCN2ikAf6G67Ddwi28JBPgJ06kbxW18KjweOwsDWZTRTu7NxJEo26u
         IBv2yECpbNEMrYgMsxpv6ia3PxO7N2+NFhMYOd0O0Ou8mNCS4zth9nPFM96O3QdS0cHm
         +yug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p+C/IIFxm2SFrj/cxAHaWiLDMesfbyU8FjDNDSKndMU=;
        b=oOvp8QZun4lAj5OUYfNJp3sLjW5q7I/zDOq3cKm0usOi7fdwzqACRtjjkIOLP0sfuJ
         vKy3XHK3BEoTClYYS2hHyhZSUT5oG4IRsjyMc8WPJ7D1TlYdl5zIVQG4lmi6BdO2uE5o
         jzQtb9R/dhSRlBB+FavCaLH028Uo6p6gPtnkQaLoMP8rAoj2FlR3nxsQVyXrelki6YMt
         jZdE9HACFglbDX/e7HzDU8mafhp1uLkI1mZDWLlRt3jgmqSRDN0mksCuEWkBpBGBhDQ4
         CTTTvx/AWEPDtfxEaKToXCe2kzTiSR+mGvswNphf/jkbosLWzBWa2kFb0DgS1zH2UTIC
         1xeg==
X-Gm-Message-State: AOAM532BEmH607S5zMxlcLfJEMepJseTrKHLcnl5BJOd9wXyBSV4eN3C
	o8ltgDuWTRVvDbt/G3fp4dqJ9S/JdPxf0x/X
X-Google-Smtp-Source: ABdhPJx7S9B3+j0KUWBFELbf+wvrPbfZR8HraXQ9excWduG+YGRVMgKOIpPK0XC1jNnqkcb99O7YQg==
X-Received: by 2002:a0c:e8c9:: with SMTP id m9mr14196371qvo.51.1600096459954;
        Mon, 14 Sep 2020 08:14:19 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id h18sm13949418qkl.12.2020.09.14.08.14.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 08:14:19 -0700 (PDT)
From: "Jon Mason" <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [meta-oe][PATCH 4/5] arch-armv8a.inc: Add tunes for supported ARMv8a cores
Date: Mon, 14 Sep 2020 11:13:58 -0400
Message-Id: <20200914151359.11240-5-jon.mason@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200914151359.11240-1-jon.mason@arm.com>
References: <20200914151359.11240-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add tunes for all the ARMv8a cores currently supported in GCC.  This
is: Cortex-A34, Cortex-A73, and Cortex-A73-Cortex-A35.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta/conf/machine/include/arm/arch-armv8a.inc | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/meta/conf/machine/include/arm/arch-armv8a.inc b/meta/conf/machine/include/arm/arch-armv8a.inc
index eaf601216a3d..3febbcb6a6f6 100644
--- a/meta/conf/machine/include/arm/arch-armv8a.inc
+++ b/meta/conf/machine/include/arm/arch-armv8a.inc
@@ -15,6 +15,23 @@ PACKAGE_EXTRA_ARCHS_tune-cortexa32-crypto  = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-
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
+BASE_LIB_tune-cortexa34                    = "lib64"
+BASE_LIB_tune-cortexa34-crypto             = "lib64"
+
 #
 # Tune Settings for Cortex-A35
 #
@@ -80,6 +97,20 @@ PACKAGE_EXTRA_ARCHS_tune-cortexa72         = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-
 BASE_LIB_tune-cortexa72                    = "lib64"
 BASE_LIB_tune-cortexa72-crypto             = "lib64"
 
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
+BASE_LIB_tune-cortexa73                    = "lib64"
+BASE_LIB_tune-cortexa73-crypto             = "lib64"
+
 #
 # Tune Settings for ThunderX
 #
@@ -128,6 +159,24 @@ PACKAGE_EXTRA_ARCHS_tune-cortexa72-cortexa53-crypto = "${PACKAGE_EXTRA_ARCHS_tun
 BASE_LIB_tune-cortexa72-cortexa53          = "lib64"
 BASE_LIB_tune-cortexa72-cortexa53-crypto   = "lib64"
 
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
+BASE_LIB_tune-cortexa73-cortexa35          = "lib64"
+BASE_LIB_tune-cortexa73-cortexa35-crypto   = "lib64"
+
 #
 # Tune Settings for big.LITTLE Cortex-A73 - Cortex-A53
 #
-- 
2.20.1

