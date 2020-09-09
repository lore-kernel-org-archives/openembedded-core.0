Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web11.8831.1599691564979103545
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2020 15:46:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=OfES1cJP;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.195, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f195.google.com with SMTP id 16so4159238qkf.4
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2020 15:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=j3FiXwtyqCzhsGZ4Cbwyyt1+6gleRDUMFk445lXqm1o=;
        b=OfES1cJPx88WPM1fxF6G+d6oJl7jrdIl6XmVw8mxPKtq7W06WkoxHl2tivlEX7PASz
         xA/HOVCAfatsKa4T/iwxT4bPXnNxZxgt3T3QBiumMnfMQHwQPOvfwQ9goB5LRldMFFmY
         4k0Ff8N3qgxmpdpKT/MEiEoWr04WZope0/JwcZQtTEhtfOG/sXV9YSwR4+vNPG5BWiQK
         YexhNT8tSitGbQq7WHuM0NcHwWFbqfRArAtCY/xjkB6WVxsuhpQmhUpXZN8iOG/RvevM
         QJfqVDbMaEQclfWoMpHP7lfMgv85ixhs+1O9TYObdyjcF0VkeiPkEy/9WDWicMiY4FJm
         2mNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j3FiXwtyqCzhsGZ4Cbwyyt1+6gleRDUMFk445lXqm1o=;
        b=HfRSs5oHOqTmY0Er3qVtR3LCgMUVyRP46Ya+utKHKaUxxu8HsGCOiAPHf7lhq3uJ6C
         BtRJAKzO13wJyaYRDfh6lcQlluw0jm5Yero5IGZSlRwkSlGBpjpqa86Tc/Z2hhptFLB/
         1WXfnJTPp9Y/VLegPNpxWotEZEGVequlbbvSnDbesEoXI6cWaLRVUnTs3hVpSj0onsMi
         6GFojrXpooHMAnGVJnWiPdz8lggo1lCr6S73DJBObzQI0LW1noHx18N1BeqVNQjDVWFJ
         iAkcaaJnRiRi/w2VWvgYb6WicxlErRVpraQLW00PU837aQLz57H0KNSndI0CPrIMIiFX
         dOCA==
X-Gm-Message-State: AOAM531ZsZOqJYQp6B8JsUpYQQvcOlgpf/SnCVRPN64X2/tIcl78AasJ
	/jrAEXhPb469WmCNKYwN4R5DkH2d35eLI8/h
X-Google-Smtp-Source: ABdhPJxKQHPWKvBMZMgnUKNP/wIdqTICCL4DAY8bG04gL1Kl79ijnDvLjRakLn7JdLbT8RxQIqwbbg==
X-Received: by 2002:a37:71c7:: with SMTP id m190mr5217494qkc.361.1599691563684;
        Wed, 09 Sep 2020 15:46:03 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id n7sm3004890qtf.27.2020.09.09.15.46.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 15:46:03 -0700 (PDT)
From: "Jon Mason" <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [meta-oe][RFC 2/6] arch-armv8-2a.inc: Add Cortex-A55 tunings
Date: Wed,  9 Sep 2020 18:45:31 -0400
Message-Id: <20200909224535.27164-3-jon.mason@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200909224535.27164-1-jon.mason@arm.com>
References: <20200909224535.27164-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Migrate the settings in tune-cortexa55.inc to arch-armv8-2a.inc.  This
will allow for a single file to include all of the tunings of a family
of processors.  This will reduce the proliferation of unique files per
processor currently occuring in conf/machine/include/

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../machine/include/arm/arch-armv8-2a.inc     | 31 ++++++++++++++-----
 meta/conf/machine/include/tune-cortexa55.inc  | 12 -------
 2 files changed, 23 insertions(+), 20 deletions(-)
 delete mode 100644 meta/conf/machine/include/tune-cortexa55.inc

diff --git a/meta/conf/machine/include/arm/arch-armv8-2a.inc b/meta/conf/machine/include/arm/arch-armv8-2a.inc
index b40ebf176e43..38564a17d98b 100644
--- a/meta/conf/machine/include/arm/arch-armv8-2a.inc
+++ b/meta/conf/machine/include/arm/arch-armv8-2a.inc
@@ -1,4 +1,19 @@
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
+
+#
+# Defaults for ARMv8-a
+#
+DEFAULTTUNE                                        ?= "armv8-2a"
 
 TUNEVALID[armv8-2a] = "Enable instructions for ARMv8-a"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv8-2a', ' -march=armv8.2-a', '', d)}"
@@ -8,10 +23,10 @@ MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv8-2a', 'armv8-2a
 require conf/machine/include/arm/arch-armv8a.inc
 
 # Little Endian base configs
-AVAILTUNES += "armv8-2a armv8-2a-crypto"
-ARMPKGARCH_tune-armv8-2a                    ?= "armv8-2a"
-ARMPKGARCH_tune-armv8-2a-crypto             ?= "armv8-2a"
-TUNE_FEATURES_tune-armv8-2a                  = "aarch64 armv8-2a"
-TUNE_FEATURES_tune-armv8-2a-crypto           = "${TUNE_FEATURES_tune-armv8-2a} crypto"
-PACKAGE_EXTRA_ARCHS_tune-armv8-2a            = "${PACKAGE_EXTRA_ARCHS_tune-armv8a} armv8-2a"
-PACKAGE_EXTRA_ARCHS_tune-armv8-2a-crypto     = "${PACKAGE_EXTRA_ARCHS_tune-armv8-2a} armv8-2a-crypto"
+AVAILTUNES                                         += "armv8-2a armv8-2a-crypto"
+ARMPKGARCH_tune-armv8-2a                           ?= "armv8-2a"
+ARMPKGARCH_tune-armv8-2a-crypto                    ?= "armv8-2a"
+TUNE_FEATURES_tune-armv8-2a                         = "aarch64 armv8-2a"
+TUNE_FEATURES_tune-armv8-2a-crypto                  = "${TUNE_FEATURES_tune-armv8-2a} crypto"
+PACKAGE_EXTRA_ARCHS_tune-armv8-2a                   = "${PACKAGE_EXTRA_ARCHS_tune-armv8a} armv8-2a"
+PACKAGE_EXTRA_ARCHS_tune-armv8-2a-crypto            = "${PACKAGE_EXTRA_ARCHS_tune-armv8-2a} armv8-2a-crypto"
diff --git a/meta/conf/machine/include/tune-cortexa55.inc b/meta/conf/machine/include/tune-cortexa55.inc
deleted file mode 100644
index 099b6d72851a..000000000000
--- a/meta/conf/machine/include/tune-cortexa55.inc
+++ /dev/null
@@ -1,12 +0,0 @@
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
-- 
2.20.1

