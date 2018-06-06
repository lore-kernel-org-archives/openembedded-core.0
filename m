Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f51.google.com (mail-pl0-f51.google.com
	[209.85.160.51])
	by mail.openembedded.org (Postfix) with ESMTP id 988D977141
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jun 2018 21:37:25 +0000 (UTC)
Received: by mail-pl0-f51.google.com with SMTP id b14-v6so4619704pls.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Jun 2018 14:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Ruq9bkUAn/ZOmpTHQ8kBAYvCUWhV86FMTtOcAjb8A1M=;
	b=iHpl2ypv0cxDNeig5PXCLKUyhEXzyI+C9YAdz+sbmyoPn0FFZ+ZD9xpMBc2+qIzjjW
	ig53BOywf0RjJLCsY2QVSq50QPf6tICXCP0nMc1v+GsEvwCog7p3eGPhcLIvbae4AwbL
	ByByylTIGcnBEN0hvSXSrIFjTz2GpMsJDuMbFnWWm9Ag55/3O/KbqFDZ+U/tOW+GNUzw
	JzWLuW+53UPARlJHfvYyP4eB64Krc/E4CfgtCIRVcJ1hh93J4EdQQq9O4IoKX0yR1KPo
	u749q/tkt25HgJAkB0njOiGwykok0FHKqd60ZmLKvn8JQv+k2HX8wC1Aadp+WIS8eEZa
	l97A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Ruq9bkUAn/ZOmpTHQ8kBAYvCUWhV86FMTtOcAjb8A1M=;
	b=R/U62a3yh4D6qTkPUcotpfhI/yFYkY5q7wDrZ9UE4Lw6uQXuzTKVjT94BcvfQ4Ij3N
	KAHTeAzFNWhtsoNYMsd4rgppwY4Bueapfv1lsM0f4FwHxlARFYf4eBYQeMnBzgl89w3f
	hM2fI79eyc2jKQgBqtxKvr86aTPCYlREuvU9AiB4+G/7XadsXf7QePl2gFBU6beSwr4K
	pU1gFDDCXbUVzxU2UGA/KqEDM4rNIwynYaMZEFLa3oQx+v5i46eIO8CIxXoGFW22ALjf
	XJAoLvfQ+zWHPMNimQJd3tHSrxg1y9yg2zV1+ZistDSutgk5taKgaPKNaaTNSFIqtR2z
	0ptA==
X-Gm-Message-State: APt69E35y1S5irRTJzJbKmrmhRcHNNhu4yBoaFVkOKf+8nguRCkL+CZ3
	46L2dDtzIBeU4ThFykginEB+qA==
X-Google-Smtp-Source: ADUXVKKNPl3uwccdiM9o9Gx8uJdAhPhgw6apax/QF/wXLUKyaYx1kdnny9AYFssA7lZcl5uMfVWXLA==
X-Received: by 2002:a17:902:1e2:: with SMTP id
	b89-v6mr4849212plb.279.1528321046324; 
	Wed, 06 Jun 2018 14:37:26 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	c191-v6sm30452374pfg.48.2018.06.06.14.37.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Jun 2018 14:37:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Jun 2018 14:37:17 -0700
Message-Id: <635c8757bf852c8a4248009f241c19146431cacd.1528320772.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1528320772.git.raj.khem@gmail.com>
References: <cover.1528320772.git.raj.khem@gmail.com>
Subject: [PATCH 01/12] tune/arm: Set -mtune instead of -mcpu
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Jun 2018 21:37:25 -0000

-march option is already used to select the base architecture
therefore using -mcpu which infact will reset march+mtune can
cause conflicts, therefore setting just mtune here will ensure
that the code is optimized for the given tune as is the intention
of mcpu, however with one advantage, it will be targetting broader
march value so can be useful for pre-compiled objects where they
can be run on wider subset

This also fixed occasional conflicts like

cc1: error: switch -mcpu=cortex-a7 conflicts with -march=armv7-a switch [-Werror]

which is possible combination in some case for packages in OE

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/machine/include/tune-arm1136jf-s.inc   | 2 +-
 meta/conf/machine/include/tune-arm920t.inc       | 2 +-
 meta/conf/machine/include/tune-arm926ejs.inc     | 2 +-
 meta/conf/machine/include/tune-arm9tdmi.inc      | 2 +-
 meta/conf/machine/include/tune-cortexa15.inc     | 2 +-
 meta/conf/machine/include/tune-cortexa17.inc     | 2 +-
 meta/conf/machine/include/tune-cortexa5.inc      | 2 +-
 meta/conf/machine/include/tune-cortexa7.inc      | 2 +-
 meta/conf/machine/include/tune-cortexa8.inc      | 2 +-
 meta/conf/machine/include/tune-cortexa9.inc      | 2 +-
 meta/conf/machine/include/tune-ep9312.inc        | 2 +-
 meta/conf/machine/include/tune-iwmmxt.inc        | 2 +-
 meta/conf/machine/include/tune-strongarm1100.inc | 2 +-
 meta/conf/machine/include/tune-thunderx.inc      | 2 +-
 meta/conf/machine/include/tune-xscale.inc        | 2 +-
 15 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta/conf/machine/include/tune-arm1136jf-s.inc b/meta/conf/machine/include/tune-arm1136jf-s.inc
index c5de63e1cc..02114284e0 100644
--- a/meta/conf/machine/include/tune-arm1136jf-s.inc
+++ b/meta/conf/machine/include/tune-arm1136jf-s.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv6hf"
 require conf/machine/include/arm/arch-armv6.inc
 
 TUNEVALID[arm1136jfs] = "Enable arm1136jfs specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'arm1136jfs', ' -mcpu=arm1136jf-s', '', d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'arm1136jfs', ' -mtune=arm1136jf-s', '', d)}"
 
 AVAILTUNES += "arm1136jfs"
 ARMPKGARCH_tune-arm1136jfs = "arm1136jfs"
diff --git a/meta/conf/machine/include/tune-arm920t.inc b/meta/conf/machine/include/tune-arm920t.inc
index c6e74b6772..5e6d4cbd91 100644
--- a/meta/conf/machine/include/tune-arm920t.inc
+++ b/meta/conf/machine/include/tune-arm920t.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv4t"
 require conf/machine/include/arm/arch-armv4.inc
 
 TUNEVALID[arm920t] = "Enable arm920t specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'arm920t', ' -mcpu=arm920t', '', d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'arm920t', ' -mtune=arm920t', '', d)}"
 
 AVAILTUNES += "arm920t"
 ARMPKGARCH_tune-arm920t = "arm920t"
diff --git a/meta/conf/machine/include/tune-arm926ejs.inc b/meta/conf/machine/include/tune-arm926ejs.inc
index 81bcda339b..dddccaaae9 100644
--- a/meta/conf/machine/include/tune-arm926ejs.inc
+++ b/meta/conf/machine/include/tune-arm926ejs.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv5te"
 require conf/machine/include/arm/arch-armv5-dsp.inc
 
 TUNEVALID[arm926ejs] = "Enable arm926ejs specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'arm926ejs', ' -mcpu=arm926ej-s', '', d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'arm926ejs', ' -mtune=arm926ej-s', '', d)}"
 
 AVAILTUNES += "arm926ejs"
 ARMPKGARCH_tune-arm926ejs = "arm926ejs"
diff --git a/meta/conf/machine/include/tune-arm9tdmi.inc b/meta/conf/machine/include/tune-arm9tdmi.inc
index e9c2b8fcf5..ebac472c5b 100644
--- a/meta/conf/machine/include/tune-arm9tdmi.inc
+++ b/meta/conf/machine/include/tune-arm9tdmi.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv4t"
 require conf/machine/include/arm/arch-armv4.inc
 
 TUNEVALID[arm9tdmi] = "Enable arm9tdmi specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'arm9tdmi', ' -mcpu=arm9tdmi', '', d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'arm9tdmi', ' -mtune=arm9tdmi', '', d)}"
 
 AVAILTUNES += "arm9tdmi"
 ARMPKGARCH_tune-arm9tdmi = "arm9tdmi"
diff --git a/meta/conf/machine/include/tune-cortexa15.inc b/meta/conf/machine/include/tune-cortexa15.inc
index 25e99f93d7..0636306e2f 100644
--- a/meta/conf/machine/include/tune-cortexa15.inc
+++ b/meta/conf/machine/include/tune-cortexa15.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv7vethf-neon"
 require conf/machine/include/arm/arch-armv7ve.inc
 
 TUNEVALID[cortexa15] = "Enable Cortex-A15 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa15', ' -mcpu=cortex-a15', '', d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa15', ' -mtune=cortex-a15', '', d)}"
 
 # Little Endian base configs
 AVAILTUNES += "cortexa15 cortexa15t cortexa15-neon cortexa15t-neon cortexa15-neon-vfpv4 cortexa15t-neon-vfpv4"
diff --git a/meta/conf/machine/include/tune-cortexa17.inc b/meta/conf/machine/include/tune-cortexa17.inc
index 40392f9bcc..f9774b8b8e 100644
--- a/meta/conf/machine/include/tune-cortexa17.inc
+++ b/meta/conf/machine/include/tune-cortexa17.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv7vethf-neon"
 require conf/machine/include/arm/arch-armv7ve.inc
 
 TUNEVALID[cortexa17] = "Enable Cortex-A17 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa17', ' -mcpu=cortex-a17', '', d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa17', ' -mtune=cortex-a17', '', d)}"
 
 # Little Endian base configs
 AVAILTUNES += "cortexa17 cortexa17t cortexa17-neon cortexa17t-neon cortexa17-neon-vfpv4 cortexa17t-neon-vfpv4"
diff --git a/meta/conf/machine/include/tune-cortexa5.inc b/meta/conf/machine/include/tune-cortexa5.inc
index 1f0cda6640..1ececf9621 100644
--- a/meta/conf/machine/include/tune-cortexa5.inc
+++ b/meta/conf/machine/include/tune-cortexa5.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv7athf-neon"
 require conf/machine/include/arm/arch-armv7a.inc
 
 TUNEVALID[cortexa5] = "Enable Cortex-A5 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa5', ' -mcpu=cortex-a5', '', d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa5', ' -mtune=cortex-a5', '', d)}"
 
 # Little Endian base configs
 AVAILTUNES += "cortexa5 cortexa5t cortexa5-neon cortexa5t-neon"
diff --git a/meta/conf/machine/include/tune-cortexa7.inc b/meta/conf/machine/include/tune-cortexa7.inc
index 52415d9c8b..08dd039338 100644
--- a/meta/conf/machine/include/tune-cortexa7.inc
+++ b/meta/conf/machine/include/tune-cortexa7.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv7vethf-neon"
 require conf/machine/include/arm/arch-armv7ve.inc
 
 TUNEVALID[cortexa7] = "Enable Cortex-A7 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa7', ' -mcpu=cortex-a7', '', d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa7', ' -mtune=cortex-a7', '', d)}"
 
 # Little Endian base configs
 AVAILTUNES += "cortexa7 cortexa7t cortexa7-neon cortexa7t-neon cortexa7-neon-vfpv4 cortexa7t-neon-vfpv4"
diff --git a/meta/conf/machine/include/tune-cortexa8.inc b/meta/conf/machine/include/tune-cortexa8.inc
index 8ee8de97f1..cdcb1c7d59 100644
--- a/meta/conf/machine/include/tune-cortexa8.inc
+++ b/meta/conf/machine/include/tune-cortexa8.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv7athf-neon"
 require conf/machine/include/arm/arch-armv7a.inc
 
 TUNEVALID[cortexa8] = "Enable Cortex-A8 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa8', ' -mcpu=cortex-a8', '', d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa8', ' -mtune=cortex-a8', '', d)}"
 
 # Little Endian base configs
 AVAILTUNES += "cortexa8 cortexa8t cortexa8-neon cortexa8t-neon"
diff --git a/meta/conf/machine/include/tune-cortexa9.inc b/meta/conf/machine/include/tune-cortexa9.inc
index 0cf323c960..620178d18a 100644
--- a/meta/conf/machine/include/tune-cortexa9.inc
+++ b/meta/conf/machine/include/tune-cortexa9.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv7athf-neon"
 require conf/machine/include/arm/arch-armv7a.inc
 
 TUNEVALID[cortexa9] = "Enable Cortex-A9 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa9', ' -mcpu=cortex-a9', '', d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa9', ' -mtune=cortex-a9', '', d)}"
 
 # Little Endian base configs
 AVAILTUNES += "cortexa9 cortexa9t cortexa9-neon cortexa9t-neon"
diff --git a/meta/conf/machine/include/tune-ep9312.inc b/meta/conf/machine/include/tune-ep9312.inc
index 84ca528d6d..897b904cd1 100644
--- a/meta/conf/machine/include/tune-ep9312.inc
+++ b/meta/conf/machine/include/tune-ep9312.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "ep9312"
 require conf/machine/include/arm/arch-armv4.inc
 
 TUNEVALID[ep9312] = "Enable Intel PXA27x specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'ep9312', ' -march=ep9312 -mcpu=ep9312', '', d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'ep9312', ' -march=ep9312 -mtune=ep9312', '', d)}"
 
 AVAILTUNES += "ep9312"
 ARMPKGARCH_tune-ep9312 = "ep9312"
diff --git a/meta/conf/machine/include/tune-iwmmxt.inc b/meta/conf/machine/include/tune-iwmmxt.inc
index f27423cb2e..15cce8d3c5 100644
--- a/meta/conf/machine/include/tune-iwmmxt.inc
+++ b/meta/conf/machine/include/tune-iwmmxt.inc
@@ -6,7 +6,7 @@ DEFAULTTUNE ?= "iwmmxt"
 require conf/machine/include/arm/arch-armv5-dsp.inc
 
 TUNEVALID[iwmmxt] = "Enable Intel PXA27x specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'iwmmxt', ' -march=iwmmxt -mcpu=iwmmxt', '', d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'iwmmxt', ' -march=iwmmxt -mtune=iwmmxt', '', d)}"
 
 AVAILTUNES += "iwmmxt"
 ARMPKGARCH_tune-iwmmxt = "iwmmxt"
diff --git a/meta/conf/machine/include/tune-strongarm1100.inc b/meta/conf/machine/include/tune-strongarm1100.inc
index 80cfb8ab8a..7b2fa8e3ab 100644
--- a/meta/conf/machine/include/tune-strongarm1100.inc
+++ b/meta/conf/machine/include/tune-strongarm1100.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv4"
 require conf/machine/include/arm/arch-armv4.inc
 
 TUNEVALID[strongarm] = "Enable Strongarm 1100 series processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'strongarm', ' -mcpu=strongarm1100', '', d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'strongarm', ' -mtune=strongarm1100', '', d)}"
 
 AVAILTUNES += "strongarm"
 ARMPKGARCH_tune-strongarm = "strongarm"
diff --git a/meta/conf/machine/include/tune-thunderx.inc b/meta/conf/machine/include/tune-thunderx.inc
index 3d43b0f7e5..e77d1cdd2d 100644
--- a/meta/conf/machine/include/tune-thunderx.inc
+++ b/meta/conf/machine/include/tune-thunderx.inc
@@ -5,7 +5,7 @@ AVAILTUNES += "thunderx thunderx_be"
 
 TUNEVALID[thunderx] = "Enable instructions for Cavium ThunderX"
 
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'thunderx', ' -mcpu=thunderx ', '',d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'thunderx', ' -mtune=thunderx ', '',d)}"
 
 ARMPKGARCH_tune-thunderx ?= "thunderx"
 ARMPKGARCH_tune-thunderx_be ?= "thunderx_be"
diff --git a/meta/conf/machine/include/tune-xscale.inc b/meta/conf/machine/include/tune-xscale.inc
index 0d07333955..2a0610fddf 100644
--- a/meta/conf/machine/include/tune-xscale.inc
+++ b/meta/conf/machine/include/tune-xscale.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv5te"
 require conf/machine/include/arm/arch-armv5-dsp.inc
 
 TUNEVALID[xscale] = "Enable PXA255/PXA26x Xscale specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'xscale', ' -mcpu=xscale', '', d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'xscale', ' -mtune=xscale', '', d)}"
 
 AVAILTUNES += "xscale"
 ARMPKGARCH_tune-xscale = "xscale"
-- 
2.17.1


