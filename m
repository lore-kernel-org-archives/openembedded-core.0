Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7F48E6BA0E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2019 00:18:14 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id j10so1847089pga.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jan 2019 16:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=mlm/kNp6XTcDci50z+A4zyBtBaXjuu2sMQyG110KnrY=;
	b=lEFwWehQt8FTaiyUJbgkRuw8UI7LnAKs/t5Keu/r7PQP/6iyHXjRisOJjbn5dwXESF
	ekyDzZgsw3VeR9LZV6BEMWYPzAwA5yfv8yHy7MzcxRu3eAqlUsjvgtVwmJuMY1mXom9O
	KUcXIL1gxHqeguKDJRLcnNZVmLrnafkvp42zwmr6QjA0ISJ6U1mbjym1W2XK0MCyRUvT
	aUoxJ06JlqS3seeGTPVylzoJMxE8uUeo7acU9f+Czo/QmjOgXuKKB8PU26S45sPTGNod
	Yj3Nr4TigPgbVcZRQmv5oZhuV50OOzHT3IHWIPeuDhaX+MIL9VDuTFm4imTT4IeHNRgM
	TMPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=mlm/kNp6XTcDci50z+A4zyBtBaXjuu2sMQyG110KnrY=;
	b=t05ZaDSkMCdWQy/K1bg1mMsu/U1dldftYTHH3g+pgI0Sr2N1YpzyUoZlQDZ9PtySaO
	GwgazA0IK/mTsC3X0tq7kk/IUKfjIafyYy6krHMOH+/ltut6RfpV1c2dcKwrWgkQ/Aml
	MxT/Rsp8Wto+kZzOStdTG+aVCsNGCzwAkRCQyFzn4lGjDSFHIE5xt/T9fkm2158EGGnq
	3OznuOnCW4zQYH7KAzjQTcf8MQ6ZhpmWUAB6eNo9ypJ99vxuKToFBMA45CdpAEm/lxcB
	tdYDLBk/D3izI7jPddJXpxqWrVsF309oFlh1gIcEJ981GTW0j7agwz+sLRHChNTEMnBN
	HE4A==
X-Gm-Message-State: AJcUukf213kqapJrXhwfPTZ3impJktr034sXw9lUGEebbABmKUDL1gvO
	XIkysvpDurwYQn+6ti+qryuciaDl5OE=
X-Google-Smtp-Source: ALg8bN7E40kWJM96P1jiGpsWdlhwFYOKexUZB7yyqJebwTNsP2bKDRVBi24szSRZUG/DUxRpQsUutw==
X-Received: by 2002:a63:6442:: with SMTP id y63mr3928994pgb.450.1548289094801; 
	Wed, 23 Jan 2019 16:18:14 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::b601])
	by smtp.gmail.com with ESMTPSA id
	v184sm26752287pfb.182.2019.01.23.16.18.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Jan 2019 16:18:14 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Jan 2019 16:18:02 -0800
Message-Id: <20190124001802.32109-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH V2] arch-arm: Do not add -march options for arm architecture along with -mcpu
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
X-List-Received-Date: Thu, 24 Jan 2019 00:18:14 -0000
Content-Transfer-Encoding: 8bit

tune files which inherit the arch definitions already define appropriate
-mcpu option, which is equivalent of right -march and -mtune combination
and is preferred since gcc is getting stricter and stricter with option
check semantics and can now find incompatible -march and -mcpu options
better with every release. It does internal feature consistency check
and if it finds out discrepency between what -mcpu would expand to as
compared to -march it will flag the options to be incompatible, for
naked eye it sounds wrong but gcc would translate -mcpu to a given
-march internally and it might not match to what we set in these arch
files.

The effects are quite subtle, where this can result in configure test
failing to compile due to these incompatible options and a feature
option getting disabled for a recipe for no reason.

e.g. with gcc9 which can now detect that -mcpu=cortex-a5 and
-march=armv7-a are incompatible, many features in libstdc++ ends up
disabled due to configure check failures e.g. size_t size, ptrdiff_t
sizes, which inturn results in compiling libstdc++ with unwanted
disabled features.

If user has machine definitions which do not inherit the arm tune files
then they can still use the -march switch as such

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Only delete -march if -mcpu is set

 meta/conf/machine/include/arm/arch-armv4.inc     | 3 ++-
 meta/conf/machine/include/arm/arch-armv5.inc     | 3 ++-
 meta/conf/machine/include/arm/arch-armv6.inc     | 3 ++-
 meta/conf/machine/include/arm/arch-armv7a.inc    | 3 ++-
 meta/conf/machine/include/arm/arch-armv7ve.inc   | 3 ++-
 meta/conf/machine/include/tune-arm1136jf-s.inc   | 2 ++
 meta/conf/machine/include/tune-arm920t.inc       | 2 ++
 meta/conf/machine/include/tune-arm926ejs.inc     | 2 ++
 meta/conf/machine/include/tune-arm9tdmi.inc      | 2 ++
 meta/conf/machine/include/tune-cortexa15.inc     | 2 ++
 meta/conf/machine/include/tune-cortexa17.inc     | 2 ++
 meta/conf/machine/include/tune-cortexa5.inc      | 2 ++
 meta/conf/machine/include/tune-cortexa7.inc      | 2 ++
 meta/conf/machine/include/tune-cortexa8.inc      | 2 ++
 meta/conf/machine/include/tune-cortexa9.inc      | 2 ++
 meta/conf/machine/include/tune-ep9312.inc        | 4 +++-
 meta/conf/machine/include/tune-iwmmxt.inc        | 4 +++-
 meta/conf/machine/include/tune-strongarm1100.inc | 2 ++
 meta/conf/machine/include/tune-thunderx.inc      | 2 ++
 meta/conf/machine/include/tune-xscale.inc        | 2 ++
 20 files changed, 42 insertions(+), 7 deletions(-)

diff --git a/meta/conf/machine/include/arm/arch-armv4.inc b/meta/conf/machine/include/arm/arch-armv4.inc
index 47a7ad2830..d31b67623c 100644
--- a/meta/conf/machine/include/arm/arch-armv4.inc
+++ b/meta/conf/machine/include/arm/arch-armv4.inc
@@ -2,7 +2,8 @@ DEFAULTTUNE ?= "armv4"
 
 TUNEVALID[arm] = "Enable ARM instruction set"
 TUNEVALID[armv4] = "Enable instructions for ARMv4"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv4', ' -march=armv4t', '', d)}"
+TUNE_MARCH ?= "-march=armv4t"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv4', ' ${TUNE_MARCH}', '', d)}"
 # enable --fix-v4bx when we have armv4 in TUNE_FEATURES, but then disable it when we have also armv5 or thumb
 # maybe we should extend bb.utils.contains to support check for any checkvalues in value, now it does 
 # checkvalues.issubset(val) which cannot be used for negative test of foo neither bar in value
diff --git a/meta/conf/machine/include/arm/arch-armv5.inc b/meta/conf/machine/include/arm/arch-armv5.inc
index f9068af9de..868694a44c 100644
--- a/meta/conf/machine/include/arm/arch-armv5.inc
+++ b/meta/conf/machine/include/arm/arch-armv5.inc
@@ -2,7 +2,8 @@ DEFAULTTUNE ?= "armv5"
 
 TUNEVALID[armv5] = "Enable instructions for ARMv5"
 TUNECONFLICTS[armv5] = "armv4"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv5', ' -march=armv5t${ARMPKGSFX_DSP}', '', d)}"
+TUNE_MARCH ?= "-march=armv5t${ARMPKGSFX_DSP}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv5', ' ${TUNE_MARCH}', '', d)}"
 MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv5', 'armv5:', '' ,d)}"
 
 require conf/machine/include/arm/arch-armv4.inc
diff --git a/meta/conf/machine/include/arm/arch-armv6.inc b/meta/conf/machine/include/arm/arch-armv6.inc
index 6c838e999c..e5d3ecec06 100644
--- a/meta/conf/machine/include/arm/arch-armv6.inc
+++ b/meta/conf/machine/include/arm/arch-armv6.inc
@@ -2,7 +2,8 @@ DEFAULTTUNE ?= "armv6hf"
 
 TUNEVALID[armv6] = "Enable instructions for ARMv6"
 TUNECONFLICTS[armv6] = "armv4 armv5"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv6', ' -march=armv6', '', d)}"
+TUNE_MARCH ?= "-march=armv6"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv6', ' ${TUNE_MARCH}', '', d)}"
 MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv6', 'armv6:', '' ,d)}"
 
 require conf/machine/include/arm/arch-armv5-dsp.inc
diff --git a/meta/conf/machine/include/arm/arch-armv7a.inc b/meta/conf/machine/include/arm/arch-armv7a.inc
index a2663d8008..301334dab7 100644
--- a/meta/conf/machine/include/arm/arch-armv7a.inc
+++ b/meta/conf/machine/include/arm/arch-armv7a.inc
@@ -3,7 +3,8 @@ ARM_INSTRUCTION_SET ?= "thumb"
 
 TUNEVALID[armv7a] = "Enable instructions for ARMv7-a"
 TUNECONFLICTS[armv7a] = "armv4 armv5 armv6 armv7"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7a', ' -march=armv7-a', '', d)}"
+TUNE_MARCH ?= "-march=armv7-a"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7a', ' ${TUNE_MARCH}', '', d)}"
 MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv7a', 'armv7a:', '' ,d)}"
 
 require conf/machine/include/arm/arch-armv6.inc
diff --git a/meta/conf/machine/include/arm/arch-armv7ve.inc b/meta/conf/machine/include/arm/arch-armv7ve.inc
index 4d9260fecb..f1f13c17ce 100644
--- a/meta/conf/machine/include/arm/arch-armv7ve.inc
+++ b/meta/conf/machine/include/arm/arch-armv7ve.inc
@@ -2,7 +2,8 @@ DEFAULTTUNE ?= "armv7vethf"
 
 TUNEVALID[armv7ve] = "Enable instructions for ARMv7ve"
 TUNECONFLICTS[armv7ve] = "armv4 armv5 armv6 armv7 armv7a"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7ve', ' -march=armv7ve', '', d)}"
+TUNE_MARCH ?= "-march=armv7ve"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7ve', ' ${TUNE_MARCH}', '', d)}"
 MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv7ve', 'armv7ve:', '' ,d)}"
 
 require conf/machine/include/arm/arch-armv7a.inc
diff --git a/meta/conf/machine/include/tune-arm1136jf-s.inc b/meta/conf/machine/include/tune-arm1136jf-s.inc
index c5de63e1cc..86e3a56119 100644
--- a/meta/conf/machine/include/tune-arm1136jf-s.inc
+++ b/meta/conf/machine/include/tune-arm1136jf-s.inc
@@ -3,6 +3,8 @@ DEFAULTTUNE ?= "armv6hf"
 require conf/machine/include/arm/arch-armv6.inc
 
 TUNEVALID[arm1136jfs] = "Enable arm1136jfs specific processor optimizations"
+# Since we set -mcpu option here, Do not add -march option
+TUNE_MARCH = ""
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'arm1136jfs', ' -mcpu=arm1136jf-s', '', d)}"
 
 AVAILTUNES += "arm1136jfs"
diff --git a/meta/conf/machine/include/tune-arm920t.inc b/meta/conf/machine/include/tune-arm920t.inc
index c6e74b6772..4d65d63bc9 100644
--- a/meta/conf/machine/include/tune-arm920t.inc
+++ b/meta/conf/machine/include/tune-arm920t.inc
@@ -3,6 +3,8 @@ DEFAULTTUNE ?= "armv4t"
 require conf/machine/include/arm/arch-armv4.inc
 
 TUNEVALID[arm920t] = "Enable arm920t specific processor optimizations"
+# Since we set -mcpu option here, Do not add -march option
+TUNE_MARCH = ""
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'arm920t', ' -mcpu=arm920t', '', d)}"
 
 AVAILTUNES += "arm920t"
diff --git a/meta/conf/machine/include/tune-arm926ejs.inc b/meta/conf/machine/include/tune-arm926ejs.inc
index 81bcda339b..9c1bc919ee 100644
--- a/meta/conf/machine/include/tune-arm926ejs.inc
+++ b/meta/conf/machine/include/tune-arm926ejs.inc
@@ -3,6 +3,8 @@ DEFAULTTUNE ?= "armv5te"
 require conf/machine/include/arm/arch-armv5-dsp.inc
 
 TUNEVALID[arm926ejs] = "Enable arm926ejs specific processor optimizations"
+# Since we set -mcpu option here, Do not add -march option
+TUNE_MARCH = ""
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'arm926ejs', ' -mcpu=arm926ej-s', '', d)}"
 
 AVAILTUNES += "arm926ejs"
diff --git a/meta/conf/machine/include/tune-arm9tdmi.inc b/meta/conf/machine/include/tune-arm9tdmi.inc
index e9c2b8fcf5..62c333cce6 100644
--- a/meta/conf/machine/include/tune-arm9tdmi.inc
+++ b/meta/conf/machine/include/tune-arm9tdmi.inc
@@ -3,6 +3,8 @@ DEFAULTTUNE ?= "armv4t"
 require conf/machine/include/arm/arch-armv4.inc
 
 TUNEVALID[arm9tdmi] = "Enable arm9tdmi specific processor optimizations"
+# Since we set -mcpu option here, Do not add -march option
+TUNE_MARCH = ""
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'arm9tdmi', ' -mcpu=arm9tdmi', '', d)}"
 
 AVAILTUNES += "arm9tdmi"
diff --git a/meta/conf/machine/include/tune-cortexa15.inc b/meta/conf/machine/include/tune-cortexa15.inc
index 25e99f93d7..fbef6fee36 100644
--- a/meta/conf/machine/include/tune-cortexa15.inc
+++ b/meta/conf/machine/include/tune-cortexa15.inc
@@ -3,6 +3,8 @@ DEFAULTTUNE ?= "armv7vethf-neon"
 require conf/machine/include/arm/arch-armv7ve.inc
 
 TUNEVALID[cortexa15] = "Enable Cortex-A15 specific processor optimizations"
+# Since we set -mcpu option here, Do not add -march option
+TUNE_MARCH = ""
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa15', ' -mcpu=cortex-a15', '', d)}"
 
 # Little Endian base configs
diff --git a/meta/conf/machine/include/tune-cortexa17.inc b/meta/conf/machine/include/tune-cortexa17.inc
index 40392f9bcc..92437d05ce 100644
--- a/meta/conf/machine/include/tune-cortexa17.inc
+++ b/meta/conf/machine/include/tune-cortexa17.inc
@@ -3,6 +3,8 @@ DEFAULTTUNE ?= "armv7vethf-neon"
 require conf/machine/include/arm/arch-armv7ve.inc
 
 TUNEVALID[cortexa17] = "Enable Cortex-A17 specific processor optimizations"
+# Since we set -mcpu option here, Do not add -march option
+TUNE_MARCH = ""
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa17', ' -mcpu=cortex-a17', '', d)}"
 
 # Little Endian base configs
diff --git a/meta/conf/machine/include/tune-cortexa5.inc b/meta/conf/machine/include/tune-cortexa5.inc
index e9eddb407f..f321070072 100644
--- a/meta/conf/machine/include/tune-cortexa5.inc
+++ b/meta/conf/machine/include/tune-cortexa5.inc
@@ -3,6 +3,8 @@ DEFAULTTUNE ?= "armv7athf-neon"
 require conf/machine/include/arm/arch-armv7a.inc
 
 TUNEVALID[cortexa5] = "Enable Cortex-A5 specific processor optimizations"
+# Since we set -mcpu option here, Do not add -march option
+TUNE_MARCH = ""
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa5', ' -mcpu=cortex-a5', '', d)}"
 
 # Little Endian base configs
diff --git a/meta/conf/machine/include/tune-cortexa7.inc b/meta/conf/machine/include/tune-cortexa7.inc
index 52415d9c8b..ef3fc3f1da 100644
--- a/meta/conf/machine/include/tune-cortexa7.inc
+++ b/meta/conf/machine/include/tune-cortexa7.inc
@@ -3,6 +3,8 @@ DEFAULTTUNE ?= "armv7vethf-neon"
 require conf/machine/include/arm/arch-armv7ve.inc
 
 TUNEVALID[cortexa7] = "Enable Cortex-A7 specific processor optimizations"
+# Since we set -mcpu option here, Do not add -march option
+TUNE_MARCH = ""
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa7', ' -mcpu=cortex-a7', '', d)}"
 
 # Little Endian base configs
diff --git a/meta/conf/machine/include/tune-cortexa8.inc b/meta/conf/machine/include/tune-cortexa8.inc
index 8ee8de97f1..18e37faeda 100644
--- a/meta/conf/machine/include/tune-cortexa8.inc
+++ b/meta/conf/machine/include/tune-cortexa8.inc
@@ -3,6 +3,8 @@ DEFAULTTUNE ?= "armv7athf-neon"
 require conf/machine/include/arm/arch-armv7a.inc
 
 TUNEVALID[cortexa8] = "Enable Cortex-A8 specific processor optimizations"
+# Since we set -mcpu option here, Do not add -march option
+TUNE_MARCH = ""
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa8', ' -mcpu=cortex-a8', '', d)}"
 
 # Little Endian base configs
diff --git a/meta/conf/machine/include/tune-cortexa9.inc b/meta/conf/machine/include/tune-cortexa9.inc
index 0cf323c960..af3c93febc 100644
--- a/meta/conf/machine/include/tune-cortexa9.inc
+++ b/meta/conf/machine/include/tune-cortexa9.inc
@@ -3,6 +3,8 @@ DEFAULTTUNE ?= "armv7athf-neon"
 require conf/machine/include/arm/arch-armv7a.inc
 
 TUNEVALID[cortexa9] = "Enable Cortex-A9 specific processor optimizations"
+# Since we set -mcpu option here, Do not add -march option
+TUNE_MARCH = ""
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa9', ' -mcpu=cortex-a9', '', d)}"
 
 # Little Endian base configs
diff --git a/meta/conf/machine/include/tune-ep9312.inc b/meta/conf/machine/include/tune-ep9312.inc
index 84ca528d6d..fefc8abc66 100644
--- a/meta/conf/machine/include/tune-ep9312.inc
+++ b/meta/conf/machine/include/tune-ep9312.inc
@@ -3,7 +3,9 @@ DEFAULTTUNE ?= "ep9312"
 require conf/machine/include/arm/arch-armv4.inc
 
 TUNEVALID[ep9312] = "Enable Intel PXA27x specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'ep9312', ' -march=ep9312 -mcpu=ep9312', '', d)}"
+# Since we set -mcpu option here, Do not add -march option
+TUNE_MARCH = ""
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'ep9312', ' -mcpu=ep9312', '', d)}"
 
 AVAILTUNES += "ep9312"
 ARMPKGARCH_tune-ep9312 = "ep9312"
diff --git a/meta/conf/machine/include/tune-iwmmxt.inc b/meta/conf/machine/include/tune-iwmmxt.inc
index f27423cb2e..3627834e8a 100644
--- a/meta/conf/machine/include/tune-iwmmxt.inc
+++ b/meta/conf/machine/include/tune-iwmmxt.inc
@@ -6,7 +6,9 @@ DEFAULTTUNE ?= "iwmmxt"
 require conf/machine/include/arm/arch-armv5-dsp.inc
 
 TUNEVALID[iwmmxt] = "Enable Intel PXA27x specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'iwmmxt', ' -march=iwmmxt -mcpu=iwmmxt', '', d)}"
+# Since we set -mcpu option here, Do not add -march option
+TUNE_MARCH = ""
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'iwmmxt', ' -mcpu=iwmmxt', '', d)}"
 
 AVAILTUNES += "iwmmxt"
 ARMPKGARCH_tune-iwmmxt = "iwmmxt"
diff --git a/meta/conf/machine/include/tune-strongarm1100.inc b/meta/conf/machine/include/tune-strongarm1100.inc
index 80cfb8ab8a..b111641048 100644
--- a/meta/conf/machine/include/tune-strongarm1100.inc
+++ b/meta/conf/machine/include/tune-strongarm1100.inc
@@ -3,6 +3,8 @@ DEFAULTTUNE ?= "armv4"
 require conf/machine/include/arm/arch-armv4.inc
 
 TUNEVALID[strongarm] = "Enable Strongarm 1100 series processor optimizations"
+# Since we set -mcpu option here, Do not add -march option
+TUNE_MARCH = ""
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'strongarm', ' -mcpu=strongarm1100', '', d)}"
 
 AVAILTUNES += "strongarm"
diff --git a/meta/conf/machine/include/tune-thunderx.inc b/meta/conf/machine/include/tune-thunderx.inc
index 3d43b0f7e5..1db579e393 100644
--- a/meta/conf/machine/include/tune-thunderx.inc
+++ b/meta/conf/machine/include/tune-thunderx.inc
@@ -5,6 +5,8 @@ AVAILTUNES += "thunderx thunderx_be"
 
 TUNEVALID[thunderx] = "Enable instructions for Cavium ThunderX"
 
+# Since we set -mcpu option here, Do not add -march option
+TUNE_MARCH = ""
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'thunderx', ' -mcpu=thunderx ', '',d)}"
 
 ARMPKGARCH_tune-thunderx ?= "thunderx"
diff --git a/meta/conf/machine/include/tune-xscale.inc b/meta/conf/machine/include/tune-xscale.inc
index 0d07333955..ce0a9c5bcc 100644
--- a/meta/conf/machine/include/tune-xscale.inc
+++ b/meta/conf/machine/include/tune-xscale.inc
@@ -3,6 +3,8 @@ DEFAULTTUNE ?= "armv5te"
 require conf/machine/include/arm/arch-armv5-dsp.inc
 
 TUNEVALID[xscale] = "Enable PXA255/PXA26x Xscale specific processor optimizations"
+# Since we set -mcpu option here, Do not add -march option
+TUNE_MARCH = ""
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'xscale', ' -mcpu=xscale', '', d)}"
 
 AVAILTUNES += "xscale"
-- 
2.20.1


