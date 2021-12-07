Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B903C433EF
	for <webhook@archiver.kernel.org>; Tue,  7 Dec 2021 17:00:04 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web11.744.1638896403730701436
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Dec 2021 09:00:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=PPO4e2iJ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.173,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f173.google.com with SMTP id o17so14946198qtk.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Dec 2021 09:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=U5WhCLImqrGt5rdrL+XakYQcplLwbFP05Y1X06chpEg=;
        b=PPO4e2iJW+Dra8SvydRcL5gonGvQ039Z4cVpc8H8KkjrV1NswiRZir/FVqJbrYLkno
         n33qA3aEjEcpwLfnjXhD+GrClCIFU10kBgMArzJwDaWvF/oNIvWET076Jq2uW/Z+vmNu
         UK6HDKOIp4vkCb912VbbUQ1eueNNinineBohj562U7k1HUKuM3g7Omzv+4YiPJDR3vZC
         SlnlKr7e8njnknxW+5Nn6GOwbkPCbAC6xtaPVVViJ53iaAQOmpyXb6kiB5euVHgdvx7k
         v6ihdSy5YnQHRHd3nALXC4vIuVZq9rZgaMTAWNLC7bv5SamauzIzavlZ4EbfhXPsPsB7
         L6qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=U5WhCLImqrGt5rdrL+XakYQcplLwbFP05Y1X06chpEg=;
        b=Z8MDJ6AWIGrGAjDCAkWTyEja04KZsyT+odjDvpGu/VAH69gL92kI22nvdjc3wlWVTL
         ZAY1gnxe2tgt7jJ8c6ebHKgjeQN55NzBSOjmXcY63AZayq8tbc3nJ2GEAzj0K0TqX0DU
         m4xCHQof/dHerTJTmYEKNvkt9lreiNLoRD/f8wi+eJ1AtYQPOFphxapjJLUvy5VMllxy
         lJab+yUj1rTO2iK2nczL5lLkl2jtkk6aYvlIdCSjQe+fXD4VycvXfyMA6SvokVM2orI+
         QGtVhUsq4TlWjRf66If7n4VRE+kvP4z0Q+CdOPg8aNJZhe2QDYHSIstb91g+rRvtXA42
         Criw==
X-Gm-Message-State: AOAM532j/F0kJt+owj06lQTpCZF74oPo7476YH0zeaUTQ0yur90GcGT2
	eUMxV8693kCqqzIk2oFUmqVLmmJiG+kbfw==
X-Google-Smtp-Source: 
 ABdhPJyPu+Xss9oxwN6zuRKr1pH/o5K0es8M56PUy6NVirZatq0OuWgaXevFBXEWzb85jNmsU4M8mA==
X-Received: by 2002:a05:622a:1a83:: with SMTP id
 s3mr383366qtc.497.1638896402804;
        Tue, 07 Dec 2021 09:00:02 -0800 (PST)
Received: from localhost ([2605:a601:a626:6000:4d65:9be:8b75:b9b1])
        by smtp.gmail.com with ESMTPSA id a15sm164566qtb.5.2021.12.07.09.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 09:00:02 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Cc: Jagadeesh Krishnanjanappa <workjagadeesh@gmail.com>
Subject: [PATCH v3] tune-cortexa72: remove crypto for the default cortex-a72
Date: Tue,  7 Dec 2021 12:00:02 -0500
Message-Id: <20211207170002.1573-1-jdmason@kudzu.us>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Dec 2021 17:00:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159324

From: Jagadeesh Krishnanjanappa <workjagadeesh@gmail.com>

The cryptographic unit is optional for the Cortex-A72, but it was
included by default previously.  This breaks building systems that
lack this functionality when using tune-cortexa72.inc.

To correct this, add a crypto entry in the tune file.  Since CRC is
optional for ARMv8.0, do the same thing while we're at it.

For platforms that had been happily using tune-cortexa72.inc, a slight
degradation of performance will occur using the default.  To correct
this, simply add:
DEFAULTTUNE = "cortexa72-crc-crypto"

Signed-off-by: Jagadeesh Krishnanjanappa <workjagadeesh@gmail.com>
Signed-off-by: Jon Mason <jdmason@kudzu.us> (rewording commit message)
---
 .../include/arm/armv8a/tune-cortexa72.inc        | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc
index 2a510bd45bdf..3651cf6e802b 100644
--- a/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc
+++ b/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc
@@ -6,8 +6,16 @@ TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa72', ' -mcpu=corte
 require conf/machine/include/arm/arch-armv8a.inc
 
 # Little Endian base configs
-AVAILTUNES += "cortexa72"
+AVAILTUNES += "cortexa72 cortexa72-crc cortexa72-crc-crypto"
 ARMPKGARCH:tune-cortexa72             = "cortexa72"
-TUNE_FEATURES:tune-cortexa72          = "${TUNE_FEATURES:tune-armv8a-crc-crypto} cortexa72"
-PACKAGE_EXTRA_ARCHS:tune-cortexa72    = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc-crypto} cortexa72"
-BASE_LIB:tune-cortexa72               = "lib64"
+ARMPKGARCH:tune-cortexa72-crc         = "cortexa72"
+ARMPKGARCH:tune-cortexa72-crc-crypto  = "cortexa72"
+TUNE_FEATURES:tune-cortexa72          = "${TUNE_FEATURES:tune-armv8a} cortexa72"
+TUNE_FEATURES:tune-cortexa72-crc      = "${TUNE_FEATURES:tune-cortexa72} crc"
+TUNE_FEATURES:tune-cortexa72-crc-crypto   = "${TUNE_FEATURES:tune-cortexa72} crc crypto"
+PACKAGE_EXTRA_ARCHS:tune-cortexa72        = "${PACKAGE_EXTRA_ARCHS:tune-armv8} cortexa72"
+PACKAGE_EXTRA_ARCHS:tune-cortexa72-crc    = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc} cortexa72 cortexa72-crc"
+PACKAGE_EXTRA_ARCHS:tune-cortexa72-crc-crypto    = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc-crypto} cortexa72 cortexa72-crc cortexa72-crc-crypto"
+BASE_LIB:tune-cortexa72            = "lib64"
+BASE_LIB:tune-cortexa72-crc        = "lib64"
+BASE_LIB:tune-cortexa72-crc-crypto = "lib64"
-- 
2.20.1


