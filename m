Return-Path: <workjagadeesh@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59673C433EF
	for <webhook@archiver.kernel.org>; Sun,  5 Dec 2021 18:15:27 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web09.40567.1638728126760230630
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Dec 2021 10:15:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bPJnDzt/;
 spf=pass (domain: gmail.com, ip: 209.85.214.173,
 mailfrom: workjagadeesh@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id o14so5605772plg.5
        for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Dec 2021 10:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=ttKMkWtHic4uB8KKhOS6zZnoAvV2q0yk2m2EKALoCU0=;
        b=bPJnDzt/mXSnkwzimyz39VjAOybDqLeB2pvfqUuct2odBO2juHqygdqjuG7eHGp+pO
         343p6uPYraC/CrudSxPyC/TFtIHkl1YwEhYXCgRJXlHslwS3mA7GYe/cd0imaY9xifdU
         6dn/EqsQakdT5lLM8XBKy4M8vdVSPILrg+UJKafMrT5NWnjFEbzQ1OeSZmNdKXCswDPS
         SNifoYGv8fxDVxVe29zfXkhdlC0laDIBERJnYmpkIOTXOlYrKv2sBiEwshNE8kRvPr+p
         7VcKMnCWcFhINlzZDKLeT5x1d2sycDMQ05ptO9LDBSpf85rERnYAhenra5SxQOpmPE7D
         BixA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=ttKMkWtHic4uB8KKhOS6zZnoAvV2q0yk2m2EKALoCU0=;
        b=oh4G/lh1yzTKFkScYaxOXw+HtK3VDcsFXDj5vidmawXD5K2h4i96p1eKhriIX4aZJi
         0RIU9Etoc8ucXxiLWTGOudxstUjfF6ERfGCxRAJYmoSy1VmAkZCpSmpLd+22DVaSI9yI
         E7CvjQ682mYE7IAvRN2EGEuBdQ+YKGU0/lNNvOc8uMv/0IFXfokPFmReGV8Tz7mbH+ld
         q96Nhm+kQqGynLfCUJh/WKSr1JGYdcMlx2VNUtdYv622bn/lklM0Ew/TTmNH+Cnk7E5n
         tMRu9IkCsim0fYlWekJTP3OeQhOngJeTV+BizYDwYxKvnHwAaGL06Puo99p8aO4tPy59
         smDg==
X-Gm-Message-State: AOAM530fKeIZAssPu3EVDh4auvWh8rw0tnU1gynFOhHv/eocDsSn5MBF
	ataSdWDNYnILfG0Yw7GCCXpzPAln03nL+g==
X-Google-Smtp-Source: 
 ABdhPJz7RVhebxcI0SFGERjqnbkU1jSsznsQKR/W1nN8B3C0msQVf/zi+xPJs8SOJAla3j4hfqE+5g==
X-Received: by 2002:a17:902:c713:b0:141:bc54:f32c with SMTP id
 p19-20020a170902c71300b00141bc54f32cmr37970898plp.82.1638728126101;
        Sun, 05 Dec 2021 10:15:26 -0800 (PST)
Received: from localhost.localdomain ([157.45.169.150])
        by smtp.gmail.com with ESMTPSA id
 d18sm2127908pfv.0.2021.12.05.10.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Dec 2021 10:15:25 -0800 (PST)
From: Jagadeesh Krishnanjanappa <workjagadeesh@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jagadeesh Krishnanjanappa <workjagadeesh@gmail.com>
Subject: [OE-core][PATCH v2] tune-cortexa72: Add new tune for crc and crypto
Date: Sun,  5 Dec 2021 18:14:46 +0000
Message-Id: <20211205181446.591-1-workjagadeesh@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Dec 2021 18:15:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159199

The newly added
* cortexa72-crc tune builds programs for armv8a with crc.
* cortexa72-crc-crypto builds programs for armv8a with crc and crypto.

The default tune cortexa72 builds programs with armv8a only.

Changes in v2:
Separate tunes for cortexa72-crc and cortexa72-crc-crypto.

[YOCTO #14641]

Signed-off-by: Jagadeesh Krishnanjanappa <workjagadeesh@gmail.com>
---
 .../include/arm/armv8a/tune-cortexa72.inc        | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc
index 2a510bd45b..3651cf6e80 100644
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
2.17.1


