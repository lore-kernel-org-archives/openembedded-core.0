Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web10.36040.1601298365926578577
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2020 06:06:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=hj0X4y6A;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.194, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f194.google.com with SMTP id c2so807581qkf.10
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2020 06:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=hq1iV/CRY47BRnPjoLHix/U/7aqbFEzea0Y0P66P5Is=;
        b=hj0X4y6AGbTStRMUvDu/aM8j2kdOX7Gf1tpC/ZZspWEBYQf/WWKhlrKBond2TxpmrG
         nPm0/txDcHkTF8m5Nufv0pVr9lqpg4qW0FI75WJnUh4Bfoa2sm7f0647daEt+CfOY6O2
         5PNa6Q3eYjvRzEx8Jjleo/cQURm0v2vr0iQtGMuCO1rVMs5YsKGSELgEoHE5RExBS6gJ
         WDOtkgv1rADipJ9siZ00MIMEPDpqCMUE6DEpT0XlLtH54t3im8jpHURc/CoegdVQtTca
         eaG1KSWcxq8FzUVLXxZRnQjKtsnl7r7Fgq8H42ZdmWV9utegJtPOAXhDn8IM7N1VXJk9
         LEMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hq1iV/CRY47BRnPjoLHix/U/7aqbFEzea0Y0P66P5Is=;
        b=iE2S2cfW2ZENRWIu+DCQNkTWaWvYftlH9ywUejFR/3Zfry5PqKuS1U2q2ci3p64CxK
         1XhDSr3OAOl1iGKJhQx+6JGw7ypNmkE7OKqJlWH6LZRRP0SnY929oyYym6kRJNYdW9Vi
         MD9y1qZQffCtmAY22gGC8z9K6H21RQuSRyPonXfVuXocwIAPNpB0AsqGACK7qM1D5hBA
         uUuj3tyi6eehOGQJPzGqBgfIVXDxnil30xWtEXBiz1SdulG+jPLR5smnoO1DDk+GWYXw
         DwxNCqfiF9dQiHLNxGdlbllF3pAtOk84wK9gsyiadkj8VikFXMRBJRj91iw3A4aaFur8
         epPQ==
X-Gm-Message-State: AOAM532FXmNmZcbl6Ie3dZ76kSUqsRmHf0s37K8aRbv51SCYEWaS08/S
	7nY0lgIVfqXGVYbwvDKUSPZ9D941DkXlugbV
X-Google-Smtp-Source: ABdhPJyJ78/hRZVf/XO1MJlyCkAMZ3Yrq2k8R5Hv5LO1sqQBMfP804chlJa9KGCx2TcYDIlAMY3Fvw==
X-Received: by 2002:a37:ef18:: with SMTP id j24mr1275804qkk.22.1601298364563;
        Mon, 28 Sep 2020 06:06:04 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id h14sm1048074qtn.76.2020.09.28.06.06.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 06:06:03 -0700 (PDT)
From: "Jon Mason" <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [meta-oe][PATCH v4 2/6] armv8/tunes: Move TUNECONFLICTS
Date: Mon, 28 Sep 2020 09:05:47 -0400
Message-Id: <20200928130551.21346-3-jon.mason@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200928130551.21346-1-jon.mason@arm.com>
References: <20200928130551.21346-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move TUNECONFLICTS to the generic arm64 inc file, so that it can provide
coverage for more than just the big.LITTLE tunes.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta/conf/machine/include/arm/arch-arm64.inc           | 1 +
 meta/conf/machine/include/tune-cortexa57-cortexa53.inc | 1 -
 meta/conf/machine/include/tune-cortexa72-cortexa53.inc | 1 -
 meta/conf/machine/include/tune-cortexa73-cortexa53.inc | 1 -
 4 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/conf/machine/include/arm/arch-arm64.inc b/meta/conf/machine/include/arm/arch-arm64.inc
index 8a7de8e78f7e..142342298f2d 100644
--- a/meta/conf/machine/include/arm/arch-arm64.inc
+++ b/meta/conf/machine/include/arm/arch-arm64.inc
@@ -3,6 +3,7 @@ DEFAULTTUNE ?= "aarch64"
 require conf/machine/include/arm/arch-armv7ve.inc
 
 TUNEVALID[aarch64] = "Enable instructions for aarch64"
+TUNECONFLICTS[aarch64] = "armv4 armv5 armv6 armv7 armv7a"
 
 MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'aarch64', 'aarch64:', '', d)}"
 
diff --git a/meta/conf/machine/include/tune-cortexa57-cortexa53.inc b/meta/conf/machine/include/tune-cortexa57-cortexa53.inc
index d86be7272f99..d4b27cc14f94 100644
--- a/meta/conf/machine/include/tune-cortexa57-cortexa53.inc
+++ b/meta/conf/machine/include/tune-cortexa57-cortexa53.inc
@@ -1,7 +1,6 @@
 DEFAULTTUNE ?= "cortexa57-cortexa53"
 
 TUNEVALID[cortexa57-cortexa53] = "Enable big.LITTLE Cortex-A57.Cortex-A53 specific processor optimizations"
-TUNECONFLICTS[aarch64] = "armv4 armv5 armv6 armv7 armv7a"
 TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa57-cortexa53", " -mcpu=cortex-a57.cortex-a53", "", d)}"
 MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "cortexa57-cortexa53", "cortexa57-cortexa53:", "", d)}"
 
diff --git a/meta/conf/machine/include/tune-cortexa72-cortexa53.inc b/meta/conf/machine/include/tune-cortexa72-cortexa53.inc
index 64bb8337c399..52a96516af02 100644
--- a/meta/conf/machine/include/tune-cortexa72-cortexa53.inc
+++ b/meta/conf/machine/include/tune-cortexa72-cortexa53.inc
@@ -1,7 +1,6 @@
 DEFAULTTUNE ?= "cortexa72-cortexa53"
 
 TUNEVALID[cortexa72-cortexa53] = "Enable big.LITTLE Cortex-A72.Cortex-A53 specific processor optimizations"
-TUNECONFLICTS[aarch64] = "armv4 armv5 armv6 armv7 armv7a"
 TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa72-cortexa53", " -mcpu=cortex-a72.cortex-a53", "", d)}"
 MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "cortexa72-cortexa53", "cortexa72-cortexa53:", "", d)}"
 
diff --git a/meta/conf/machine/include/tune-cortexa73-cortexa53.inc b/meta/conf/machine/include/tune-cortexa73-cortexa53.inc
index 4ec0f64d0ef9..765e8ebb92ea 100644
--- a/meta/conf/machine/include/tune-cortexa73-cortexa53.inc
+++ b/meta/conf/machine/include/tune-cortexa73-cortexa53.inc
@@ -1,7 +1,6 @@
 DEFAULTTUNE ?= "cortexa73-cortexa53"
 
 TUNEVALID[cortexa73-cortexa53] = "Enable big.LITTLE Cortex-A73.Cortex-A53 specific processor optimizations"
-TUNECONFLICTS[aarch64] = "armv4 armv5 armv6 armv7 armv7a"
 MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "cortexa73-cortexa53", "cortexa73-cortexa53:", "", d)}"
 TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa73-cortexa53", " -mcpu=cortex-a73.cortex-a53", "", d)}"
 
-- 
2.20.1

