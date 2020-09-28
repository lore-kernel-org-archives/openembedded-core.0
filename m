Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web11.27479.1601258530889224747
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Sep 2020 19:02:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=BfkCAr29;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.194, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f194.google.com with SMTP id v123so8693824qkd.9
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2020 19:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=hq1iV/CRY47BRnPjoLHix/U/7aqbFEzea0Y0P66P5Is=;
        b=BfkCAr29OxNZILNVJ9femm8JQGpun+XAaXHaPfnV+srV68mWlDR9/KyOreBlcVFBl2
         0g+UVfzgfILeeJryhJXHsQia7GtF68eV/2QhPc4jS6F5iRqNaPU6HKYsZbKVH4H5xnEk
         B1qyvYH88kmWD8InOz/FVJq7dM+tOqMOHSO3qghw4k+3nDINh/RKV2pany+d7vI7KZ58
         0IhgM7+gzkNDj1E7p9jvQePZx1tKbXcAWsUZrF/GvKjkPN0tPOmAvnK4lGlsUf330dPp
         8h2gHyLLzmafluX9Vqg0e8ZIM3aJGCcqR4NSfQjekPU/t9KT60M2KzCdtvlY9WVeU+Gw
         dr4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hq1iV/CRY47BRnPjoLHix/U/7aqbFEzea0Y0P66P5Is=;
        b=YcCWLeX8GzdyUzETS0rrBwPOgyzL3EDy9FThxO9D3KpZSt188m7N/nWjllLpB+O27m
         Xdz4SpUpt70n8gBx896vaDycB0fLzl0tpRBOnoQ52K+K/uWs3MEgogOqzdldFMujEcFp
         iIGBfpwbkPZVWZXglH6c9sePVg6a+5qsGYUiYzViTJCE8vTbe3m9Lich2gHsARDVwNhx
         Lk1F0kYxynp6nFBh7d2cjcEnApWvp7M2GhzSnlrkpPRI1ltNcZUuhv/ffbFO7ahOcY8T
         4vEb8aSGyXVyNCqudajmk7a7mZSeIUmaxu+DSSZg3BJYWYrBOzunmJzjwmUPBFu/ZUf9
         yIMg==
X-Gm-Message-State: AOAM532ru8s/hfxgivNH+HxUxTsi91ea+Yxl+Nfxw2bG9WVKNiooZgYw
	Fn/B4fItcy7F33B5Tyc9V2LITmNw/F4PyY8R
X-Google-Smtp-Source: ABdhPJx7EQqQm4uUvjYA5BR0RCh3FEGyzKbwKw8IDx9WzsigTzkmw1zBa5YY64OEUj4+ombJmrE3+Q==
X-Received: by 2002:ae9:e70b:: with SMTP id m11mr9659958qka.210.1601258529738;
        Sun, 27 Sep 2020 19:02:09 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id l13sm9282832qtv.82.2020.09.27.19.02.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2020 19:02:09 -0700 (PDT)
From: "Jon Mason" <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [meta-oe][PATCH v3 2/6] armv8/tunes: Move TUNECONFLICTS
Date: Sun, 27 Sep 2020 22:01:38 -0400
Message-Id: <20200928020142.5706-3-jon.mason@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200928020142.5706-1-jon.mason@arm.com>
References: <20200928020142.5706-1-jon.mason@arm.com>
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

