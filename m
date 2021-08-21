Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web10.2244.1629574338522055409
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Aug 2021 12:32:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=hSl+DVQL;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.170, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f170.google.com with SMTP id t190so14640209qke.7
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Aug 2021 12:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eg66pwPzQcG+5V/DOn8BQFWBEbaUND0fy80qt/kJABo=;
        b=hSl+DVQLQJ9kKm37SnXNyrfTyQSWJdmuCKw51LilL5t6sPSevRwOl1bCWI5F17icoJ
         GBzkQZHk7JzmJQIiY5hI/LISUFh5jINnqPu1InenfVb+zoJLW+S858k3qNIzE4V51JKF
         UDzSYeDzu7AXegAdD1LC8YM2Tx/GgA1VLj2pevCR4/0Qx5D/fYNBhPc79TQhipk6L/iB
         08xipL1WgZxpgU4lBRP2WAVuasd/enj2H+xaKLgSiXH51c8MsDYa2rIPQ4EY60tV7zu/
         kJHzXgJo/RAefwMXN8etoeaB2TabLmRuw01dvr9OzArVzl9V/4kRLhgcKi5FQ9E9cLrE
         lFvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eg66pwPzQcG+5V/DOn8BQFWBEbaUND0fy80qt/kJABo=;
        b=HMtphPyfE4NLAV9QVJck48wvzJiCRLwkBnX4/OdxGG91VuIXJip/T5QC3aPELCs/j5
         zU8hBZ4s7p6hmj+oTH6Pf9ANlBNgwds9kQfXUVdwNl8mKaUVXEpMqNH19WlkOj8zflce
         pIw0TOmjCPZbiAnTcSO7cOzGUJVZS2B5SGvxrG0w9VeKxUb+rVdM53Da3Udd3gC8TXAt
         6f+yWeXitN7oFs81PMOhoh3hu04iCnU8GTHhw1NghFaUBQmnh88Ass0RLs8zPwtu1LXM
         lZsy7jUjnFW0qXCESQN+pvGpjs/r0ysCzPr23Kn4kjPVIRujnVHLCJ0vOo045vEYz3wX
         c94A==
X-Gm-Message-State: AOAM5302jndtO/SmTbmtrK30aQrKKOZUk2XiTE1BS8PNA7GxL6vk9Y/l
	OfHHGaCJflm6vWXrqML0088eS99cFdW2TA==
X-Google-Smtp-Source: ABdhPJzYWvhpTG+2NkTG//Tef2MsFWRr1f2JR0Fy9WnoNOje+NvZzM31AtXHO9V+XBpMQly8GtOBNQ==
X-Received: by 2002:a05:620a:14a2:: with SMTP id x2mr12336809qkj.194.1629574337452;
        Sat, 21 Aug 2021 12:32:17 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([2605:a601:a632:4e00:d40d:8071:1130:9f29])
        by smtp.gmail.com with ESMTPSA id o7sm4185425qtw.80.2021.08.21.12.32.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Aug 2021 12:32:17 -0700 (PDT)
From: "Jon Mason" <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] arch-arm*: Fix bugs with dsp and simd feature include files
Date: Sat, 21 Aug 2021 15:32:16 -0400
Message-Id: <20210821193216.29134-1-jdmason@kudzu.us>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix bugs found with a duplicate inclusion of feature-arm-simd.inc and
dsp not being defined in feature-arm-dsp.inc

Found by compiling with DEFAULTTUNE set to 'armv8r' and 'cortexm33'
respectively.

Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 meta/conf/machine/include/arm/arch-armv5-dsp.inc  | 1 +
 meta/conf/machine/include/arm/arch-armv8r.inc     | 1 -
 meta/conf/machine/include/arm/feature-arm-dsp.inc | 3 ++-
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/conf/machine/include/arm/arch-armv5-dsp.inc b/meta/conf/machine/include/arm/arch-armv5-dsp.inc
index d296e827cf66..f3c749d7223e 100644
--- a/meta/conf/machine/include/arm/arch-armv5-dsp.inc
+++ b/meta/conf/machine/include/arm/arch-armv5-dsp.inc
@@ -1,3 +1,4 @@
+# Can't use feature-arm-dsp.inc, since that will add "+dsp", which isn't supported in GCC for ARMv5
 ARMPKGSFX_DSP = "${@bb.utils.contains('TUNE_FEATURES', [ 'dsp' ], 'e', '', d)}"
 TUNEVALID[dsp] = "ARM DSP functionality"
 
diff --git a/meta/conf/machine/include/arm/arch-armv8r.inc b/meta/conf/machine/include/arm/arch-armv8r.inc
index be4ef3e629df..0dcfd34c1a2b 100644
--- a/meta/conf/machine/include/arm/arch-armv8r.inc
+++ b/meta/conf/machine/include/arm/arch-armv8r.inc
@@ -8,7 +8,6 @@ TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'armv8r', ' -march=a
 MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv8r', 'armv8r:', '', d)}"
 
 require conf/machine/include/arm/arch-arm64.inc
-require conf/machine/include/arm/feature-arm-simd.inc
 require conf/machine/include/arm/feature-arm-crc.inc
 require conf/machine/include/arm/feature-arm-crypto.inc
 
diff --git a/meta/conf/machine/include/arm/feature-arm-dsp.inc b/meta/conf/machine/include/arm/feature-arm-dsp.inc
index ec5007a8ca75..7f7ada7461ca 100644
--- a/meta/conf/machine/include/arm/feature-arm-dsp.inc
+++ b/meta/conf/machine/include/arm/feature-arm-dsp.inc
@@ -1,2 +1,3 @@
-# Note: TUNEVALID set in conf/machine/include/arm/arch-armv5-dsp.inc
+ARMPKGSFX_DSP = "${@bb.utils.contains('TUNE_FEATURES', [ 'dsp' ], 'e', '', d)}"
+TUNEVALID[dsp] = "ARM DSP functionality"
 TUNE_CCARGS_MARCH_OPTS .= "${@bb.utils.contains('TUNE_FEATURES', [ 'dsp' ], '+dsp', '', d)}"
-- 
2.20.1

