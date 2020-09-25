Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web11.5728.1601062104484809191
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Sep 2020 12:28:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=aqNso1wr;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.196, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f196.google.com with SMTP id t138so4002636qka.0
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Sep 2020 12:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=hq1iV/CRY47BRnPjoLHix/U/7aqbFEzea0Y0P66P5Is=;
        b=aqNso1wrAZJ4z7qzEY0tvImpJX/avQPs+Sg82DctoEk+0iGScuhFVEcW3FmNz3EzmX
         pi9WqRPDWIEld6/qm8wE1I0Ok4vlTOja71lBANnymhIbRNryVE3Izyitg/BUnGX5Ms4V
         S0RkYUhZSgjpbfEXDxv9hGligEo/p6pZGINj1hHc3Uf3e95wYKWQcXapnSteO+NM0goQ
         XYsvXL3Fs/4doX+dzSP4brnWxbOaqnLjG2M0zQjWBDtBi98m1KNCvTh0/1stm8POdllC
         GJwnTRjU0FMrwzc9tn1ENhHSttXuBLS3+astbNzRiK1SwKtDl6xc+bdK/FzIwE8yUb9O
         IA2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hq1iV/CRY47BRnPjoLHix/U/7aqbFEzea0Y0P66P5Is=;
        b=b7I71WhyYpk868jlgPnp74Z2+s0ti6LHTWhO18YCaueNSzK2zj8kZDmURpksHfNIhY
         o1oXXcR2X4cPtoONzZBQ9d30LhZgxE32XAPNERZ5oihhVvWdwI2StLOVlp/OIgRu8UIJ
         M4nr5I3ZFjUwF+A29l23yXdEWsqGjKGP2vipxFhyYAHGIcmkEc0+/LXUN87OdnuIiiSp
         rwE7kAmmwp17hwiHMPQTiZr7sbk4vLr9RbUL4T64JbuFm/on0zJM7PbIo53qxIYVsmUq
         4FRh4FNIjpAPujP7xT4j4Vb+cz88qICt8ejT5U0/vAQFwWmJGGE69sb7cLAVEYyFQXIq
         vDKw==
X-Gm-Message-State: AOAM533alshNEWgNO3XnAInE44lhRSyOLsle0EYEwgxYAeTb2Lyzw6HO
	PuirIGAd5I0lrf9G6/WKQMXlGLaRewW47zhP
X-Google-Smtp-Source: ABdhPJx5LI4Lqb6sG0Cgj8LzyFjh+qziV9Ix20LeA1wjt/20hpvfTgBVqly6FKlP4GW/11u28TEDMw==
X-Received: by 2002:a37:909:: with SMTP id 9mr1605766qkj.317.1601062101314;
        Fri, 25 Sep 2020 12:28:21 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id b9sm2708048qta.39.2020.09.25.12.28.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2020 12:28:20 -0700 (PDT)
From: "Jon Mason" <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [meta-oe][PATCH v2 2/6] armv8/tunes: Move TUNECONFLICTS
Date: Fri, 25 Sep 2020 15:28:06 -0400
Message-Id: <20200925192810.1372-3-jon.mason@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200925192810.1372-1-jon.mason@arm.com>
References: <20200925192810.1372-1-jon.mason@arm.com>
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

