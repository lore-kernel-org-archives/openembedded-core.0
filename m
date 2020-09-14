Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web10.62775.1600096448770497363
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2020 08:14:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=hQSwqyEQ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.195, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f195.google.com with SMTP id d20so431413qka.5
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2020 08:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=R81MmGNhUf1jZ56kur8i4dzgk0RPbBEa1XHc7ZiKN/w=;
        b=hQSwqyEQUUXzL+wD95+dBYOOotAHnK852KnAihDlZ1RY1WM1DXQ3ZT+n6j3ei/yUss
         ZTVUy2dwCgEHLUgbHNi4MqkceIyu4xqH1V+nxKx/rJMfpiMq/D4JsN7FF3Ukkv8P+/18
         msUHX3IUlO/ZQDi6zWxMsfWGxdDmI1cfYfB0VHRW902iuRt2D0oR8H1gMPDvYVZYv6qG
         O3Pdls5y5Yu4n/MKe+gz6tSydPu6mKC3ERyYxj82qhXWC7VlId6gB/1Yp+vTGvPMMlMt
         Zo/5zFNsxUnjxKt6BH50MljWXAnYmYuq/7wkJmBnIO28zRdMITOm5++i508zwSc3uhWn
         5ECg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=R81MmGNhUf1jZ56kur8i4dzgk0RPbBEa1XHc7ZiKN/w=;
        b=YdUImLuklvNEiQUil/amRFpvL7XHhDJnyU9W79Ma8Bwe86PSNoy7GuMimz1krm+oxd
         Pc4YvL6Vds/x/M0fPJXlG+JEQvigSJ4844oAnMpzAJoiuQ0XgRuTZ9yAkt1pHmOUU4q4
         FFn1I13/00bu1/EfNSY2jQJ4UpWY9FWrc79W1bcXiH/sgJswa4U+gAYjgjQTYkIjMJKb
         31NEhuE0vlhBTDfieZXD1GEyEWaKekZioLlhKVI0p37mAq7p/gmTB9KVe8OpJZnkYplQ
         Ai0ZYaeupxjVmyx7fbStLreijmIE1TILrjWJMJniK1zKDFQKe6vN0939lFQ1v70sZNLG
         2c/g==
X-Gm-Message-State: AOAM53002ZId3RiwTO3wEu1N5HbFKnWp58V80iGOOuea1yyNA0Mo+uyu
	g2RMISAqkRz5jSN0qsOijV6/zqEYsW6itT90
X-Google-Smtp-Source: ABdhPJx2UjW4ZNglbVFKEjThNrjV99ysB6hhMvIdnyhKDG0JcHenBEO2LDOgQkjk4s47HRK86o+cGA==
X-Received: by 2002:a05:620a:94e:: with SMTP id w14mr12827748qkw.86.1600096447499;
        Mon, 14 Sep 2020 08:14:07 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id e13sm13775009qtr.85.2020.09.14.08.14.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 08:14:07 -0700 (PDT)
From: "Jon Mason" <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [meta-oe][PATCH 1/5] arch-armv8-2a.inc: Add Cortex-A55 tunings
Date: Mon, 14 Sep 2020 11:13:55 -0400
Message-Id: <20200914151359.11240-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200914151359.11240-1-jon.mason@arm.com>
References: <20200914151359.11240-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Migrate the settings in tune-cortexa55.inc to arch-armv8-2a.inc.  This
will allow for a single file to include all of the tunings of a family
of processors.  This will reduce the proliferation of unique files per
processor currently occurring in conf/machine/include/

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../machine/include/arm/arch-armv8-2a.inc     | 36 +++++++++++++------
 meta/conf/machine/include/tune-cortexa55.inc  | 13 -------
 2 files changed, 26 insertions(+), 23 deletions(-)
 delete mode 100644 meta/conf/machine/include/tune-cortexa55.inc

diff --git a/meta/conf/machine/include/arm/arch-armv8-2a.inc b/meta/conf/machine/include/arm/arch-armv8-2a.inc
index 1c095256d185..3fc9658400a3 100644
--- a/meta/conf/machine/include/arm/arch-armv8-2a.inc
+++ b/meta/conf/machine/include/arm/arch-armv8-2a.inc
@@ -1,4 +1,20 @@
-DEFAULTTUNE ?= "armv8-2a"
+#
+# Tune Settings for Cortex-A55
+#
+TUNEVALID[cortexa55] = "Enable Cortex-A55 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa55', ' -mcpu=cortex-a55', '', d)}"
+
+# Little Endian base configs
+AVAILTUNES                                         += "cortexa55"
+ARMPKGARCH_tune-cortexa55                           = "cortexa55"
+TUNE_FEATURES_tune-cortexa55                        = "aarch64 cortexa55 crypto"
+PACKAGE_EXTRA_ARCHS_tune-cortexa55                  = "${PACKAGE_EXTRA_ARCHS_tune-armv8-2a-crypto} cortexa55"
+BASE_LIB_tune-cortexa55                             = "lib64"
+
+#
+# Defaults for ARMv8-a
+#
+DEFAULTTUNE                                        ?= "armv8-2a"
 
 TUNEVALID[armv8-2a] = "Enable instructions for ARMv8-a"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv8-2a', ' -march=armv8.2-a', '', d)}"
@@ -8,12 +24,12 @@ MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv8-2a', 'armv8-2a
 require conf/machine/include/arm/arch-armv8a.inc
 
 # Little Endian base configs
-AVAILTUNES += "armv8-2a armv8-2a-crypto"
-ARMPKGARCH_tune-armv8-2a                    ?= "armv8-2a"
-ARMPKGARCH_tune-armv8-2a-crypto             ?= "armv8-2a"
-TUNE_FEATURES_tune-armv8-2a                  = "aarch64 armv8-2a"
-TUNE_FEATURES_tune-armv8-2a-crypto           = "${TUNE_FEATURES_tune-armv8-2a} crypto"
-PACKAGE_EXTRA_ARCHS_tune-armv8-2a            = "${PACKAGE_EXTRA_ARCHS_tune-armv8a} armv8-2a"
-PACKAGE_EXTRA_ARCHS_tune-armv8-2a-crypto     = "${PACKAGE_EXTRA_ARCHS_tune-armv8-2a} armv8-2a-crypto"
-BASE_LIB_tune-armv8-2a                       = "lib64"
-BASE_LIB_tune-armv8-2a-crypto                = "lib64"
+AVAILTUNES                                         += "armv8-2a armv8-2a-crypto"
+ARMPKGARCH_tune-armv8-2a                           ?= "armv8-2a"
+ARMPKGARCH_tune-armv8-2a-crypto                    ?= "armv8-2a"
+TUNE_FEATURES_tune-armv8-2a                         = "aarch64 armv8-2a"
+TUNE_FEATURES_tune-armv8-2a-crypto                  = "${TUNE_FEATURES_tune-armv8-2a} crypto"
+PACKAGE_EXTRA_ARCHS_tune-armv8-2a                   = "${PACKAGE_EXTRA_ARCHS_tune-armv8a} armv8-2a"
+PACKAGE_EXTRA_ARCHS_tune-armv8-2a-crypto            = "${PACKAGE_EXTRA_ARCHS_tune-armv8-2a} armv8-2a-crypto"
+BASE_LIB_tune-armv8-2a                              = "lib64"
+BASE_LIB_tune-armv8-2a-crypto                       = "lib64"
diff --git a/meta/conf/machine/include/tune-cortexa55.inc b/meta/conf/machine/include/tune-cortexa55.inc
deleted file mode 100644
index 66a5d0c437ee..000000000000
--- a/meta/conf/machine/include/tune-cortexa55.inc
+++ /dev/null
@@ -1,13 +0,0 @@
-DEFAULTTUNE ?= "cortexa55"
-
-TUNEVALID[cortexa55] = "Enable Cortex-A55 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa55', ' -mcpu=cortex-a55', '', d)}"
-
-require conf/machine/include/arm/arch-armv8-2a.inc
-
-# Little Endian base configs
-AVAILTUNES += "cortexa55"
-ARMPKGARCH_tune-cortexa55             = "cortexa55"
-TUNE_FEATURES_tune-cortexa55          = "aarch64 cortexa55 crypto"
-PACKAGE_EXTRA_ARCHS_tune-cortexa55    = "${PACKAGE_EXTRA_ARCHS_tune-armv8-2a-crypto} cortexa55"
-BASE_LIB_tune-cortexa55               = "lib64"
-- 
2.20.1

