Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
 by mx.groups.io with SMTP id smtpd.web10.13686.1602167702464695907
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Oct 2020 07:35:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=wfZWeZLd;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.67, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f67.google.com with SMTP id 13so3144392qvc.9
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Oct 2020 07:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=hq1iV/CRY47BRnPjoLHix/U/7aqbFEzea0Y0P66P5Is=;
        b=wfZWeZLdhGRs66PSo3FpMqrzg1SCnsZ98L/5+/xzVk2QE4Atl6l7m5tIdI8BjrV2tS
         2NEfajIlJzFdXRRFkcJnKceRZGqfWNyJ5akrbZLbtVDyns9d7Pd3vkNaYukJ3DtGaktZ
         qXBorLKPgazBL+7/Q2gdNqRa/1aYd1dFydkbz+nKKzagUuzZe6aCTUVodzv/Yo30N4AK
         0hTcZtHzjhCszlT2sq7fX9zcpGJxxJzgnxg4vmunSkTzkbjacPDOTFwzTWTecbCDiguv
         rc8ClfTYzNs2GY5iAeP6T1MbtCdOtDzAk8jnUqWp8ZQRtYOtkPzi1Zn1dFVHyn8wl3mw
         0lgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hq1iV/CRY47BRnPjoLHix/U/7aqbFEzea0Y0P66P5Is=;
        b=CiigqqbpyjhBsR65VhG8gyKrw2Do+Ry/f4GGcF/YjhoFoTGNxIS+pGDNTBt2Pffr1T
         u+M6V3m81J5vXn7C2l61jC4xS4lc/N10lcp6JA1ZPjyJtRqVyYRak6LnEpD4s+agwMQZ
         id+duSGAdrSoeQ12C9N6elWva8oz3DQzQcK6iNfxV1aFkwSWPu1eB+3IsHsA+xtA50jr
         /w1ztAIUr2a24qjgLQiJtUr40hvmjmK9UVcRRznKO7whG+RM5Rtvpf2MLSCrqDKBXq+W
         qU4RfgfNkgBSJoX9o10DHgrBS+ixWPEm2MRwKguB8E595B1Ub/nF55pmlF/5GmGCLeO5
         mtXg==
X-Gm-Message-State: AOAM533gQ3rEei+y1/thQ67PQvIGvaumxMV+J/Nhldvmt5XB0UlZANlu
	uIlNSEFM8dcgs26rvAmex3uXTOHmJwOSi0vV
X-Google-Smtp-Source: ABdhPJzFI7dt70ByzW7u/Vl9Jn+w0lVTeqI19tnwIjCCvSwlWn8Ox/04RkP9yTBuSGuM3IqJE4N0Ig==
X-Received: by 2002:a0c:fec6:: with SMTP id z6mr8597619qvs.10.1602167700990;
        Thu, 08 Oct 2020 07:35:00 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id d14sm3977156qtr.62.2020.10.08.07.34.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2020 07:35:00 -0700 (PDT)
From: "Jon Mason" <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [meta-oe][PATCH v5 1/4] armv8/tunes: Move TUNECONFLICTS
Date: Thu,  8 Oct 2020 10:34:48 -0400
Message-Id: <20201008143451.18668-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201008143451.18668-1-jon.mason@arm.com>
References: <20201008143451.18668-1-jon.mason@arm.com>
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

