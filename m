Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7D30D6C104
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jan 2019 20:05:31 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id u6so1699171pfh.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jan 2019 12:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=PZevWrmB1IE2l+40oSso5sYOt6We/BeRHagP+HEeYmo=;
	b=TYJypzWalgP/W5BQ5OXMKM45FT2wy2UBhHSJyc2Bf09Oc3KQyqBXhm5n42WXHqcIbT
	APCxQ8sw0LyCW7QFUtBSNILttR8EMeA5LRerbZf6nIuaCcUmYrSCGT3Q4a71cOQgyOSi
	FJmMWjhbWmXovjiLiaoRp66aupvqwm9SoAFQHTYMng/KqPMIKQ/sWAXpyAFhA8/xm/8D
	Mi/d8BdJfXB4Isck6SpvG++eOLnIfvJpUMCR1pbY3qiUvczk9/OSgQIzbOPSp4dXNsDu
	NnzF5WZc4LF3R2er7vTJ5wjIRoNGzoxB0xhbpO7FOZVQZfg1W5nisi/aeh033FYYmOb6
	TbLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=PZevWrmB1IE2l+40oSso5sYOt6We/BeRHagP+HEeYmo=;
	b=Qu0Ko3Z/C1b8PdmvpqOb/DxUAS3lOFHiiFZKxdNn6owJaQGs6Ci0o0VEW68DGbRWNa
	0LlFBklPOWF6SOLdEpbjG7EShWAxfWNsJ57QGYyqonW2Hhce34Zf8P8s5gCl6+mhBfw1
	XH5OnY8HmJr4K3nLUYV1ukGKXfCnIZuk9+CWXmp8Z7L1YJejvujdkhYdnYUKlB7LU7yM
	gvOBcfejNnnW/k4nykVY1qYSk0ZT7MVeciuR+NxT52xs7j39MDxKENnkHJCoqzmDRbHN
	rQlqk+ruXoEYt0wI7ErNtdfFXFiaswfI1FDdY8uyK9N8y2c8rBz9GpjwlTUBg/PIkJVF
	rfOg==
X-Gm-Message-State: AJcUukcjo7ImpeCUoKT3dpM/ANyPCXIfiDePGsT2spV0OQMGOqSmTvwJ
	hNazsR1xD0gSyNx6d189WAfdmk+/myc=
X-Google-Smtp-Source: ALg8bN6naraTOqon1m8lCz3Aft12AI7ORspm2qDA6dtIf6avyI9pLNazm7k8P1Ic0mQsjX2d10gG/A==
X-Received: by 2002:a63:9501:: with SMTP id p1mr3263696pgd.149.1548273931486; 
	Wed, 23 Jan 2019 12:05:31 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::b601])
	by smtp.gmail.com with ESMTPSA id
	a15sm21794865pgb.1.2019.01.23.12.05.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Jan 2019 12:05:30 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Jan 2019 12:05:20 -0800
Message-Id: <20190123200520.14956-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] arch-arm: Do not add -march options for arm architecture
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
X-List-Received-Date: Wed, 23 Jan 2019 20:05:31 -0000
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

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/machine/include/arm/arch-armv4.inc   | 1 -
 meta/conf/machine/include/arm/arch-armv5.inc   | 1 -
 meta/conf/machine/include/arm/arch-armv6.inc   | 1 -
 meta/conf/machine/include/arm/arch-armv7a.inc  | 1 -
 meta/conf/machine/include/arm/arch-armv7ve.inc | 1 -
 meta/conf/machine/include/tune-iwmmxt.inc      | 2 +-
 6 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/meta/conf/machine/include/arm/arch-armv4.inc b/meta/conf/machine/include/arm/arch-armv4.inc
index 47a7ad2830..52d8ab1e8f 100644
--- a/meta/conf/machine/include/arm/arch-armv4.inc
+++ b/meta/conf/machine/include/arm/arch-armv4.inc
@@ -2,7 +2,6 @@ DEFAULTTUNE ?= "armv4"
 
 TUNEVALID[arm] = "Enable ARM instruction set"
 TUNEVALID[armv4] = "Enable instructions for ARMv4"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv4', ' -march=armv4t', '', d)}"
 # enable --fix-v4bx when we have armv4 in TUNE_FEATURES, but then disable it when we have also armv5 or thumb
 # maybe we should extend bb.utils.contains to support check for any checkvalues in value, now it does 
 # checkvalues.issubset(val) which cannot be used for negative test of foo neither bar in value
diff --git a/meta/conf/machine/include/arm/arch-armv5.inc b/meta/conf/machine/include/arm/arch-armv5.inc
index f9068af9de..1fe1b6b8e4 100644
--- a/meta/conf/machine/include/arm/arch-armv5.inc
+++ b/meta/conf/machine/include/arm/arch-armv5.inc
@@ -2,7 +2,6 @@ DEFAULTTUNE ?= "armv5"
 
 TUNEVALID[armv5] = "Enable instructions for ARMv5"
 TUNECONFLICTS[armv5] = "armv4"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv5', ' -march=armv5t${ARMPKGSFX_DSP}', '', d)}"
 MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv5', 'armv5:', '' ,d)}"
 
 require conf/machine/include/arm/arch-armv4.inc
diff --git a/meta/conf/machine/include/arm/arch-armv6.inc b/meta/conf/machine/include/arm/arch-armv6.inc
index 6c838e999c..adb9be8050 100644
--- a/meta/conf/machine/include/arm/arch-armv6.inc
+++ b/meta/conf/machine/include/arm/arch-armv6.inc
@@ -2,7 +2,6 @@ DEFAULTTUNE ?= "armv6hf"
 
 TUNEVALID[armv6] = "Enable instructions for ARMv6"
 TUNECONFLICTS[armv6] = "armv4 armv5"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv6', ' -march=armv6', '', d)}"
 MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv6', 'armv6:', '' ,d)}"
 
 require conf/machine/include/arm/arch-armv5-dsp.inc
diff --git a/meta/conf/machine/include/arm/arch-armv7a.inc b/meta/conf/machine/include/arm/arch-armv7a.inc
index a2663d8008..09d2c03a5d 100644
--- a/meta/conf/machine/include/arm/arch-armv7a.inc
+++ b/meta/conf/machine/include/arm/arch-armv7a.inc
@@ -3,7 +3,6 @@ ARM_INSTRUCTION_SET ?= "thumb"
 
 TUNEVALID[armv7a] = "Enable instructions for ARMv7-a"
 TUNECONFLICTS[armv7a] = "armv4 armv5 armv6 armv7"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7a', ' -march=armv7-a', '', d)}"
 MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv7a', 'armv7a:', '' ,d)}"
 
 require conf/machine/include/arm/arch-armv6.inc
diff --git a/meta/conf/machine/include/arm/arch-armv7ve.inc b/meta/conf/machine/include/arm/arch-armv7ve.inc
index 4d9260fecb..31e334f645 100644
--- a/meta/conf/machine/include/arm/arch-armv7ve.inc
+++ b/meta/conf/machine/include/arm/arch-armv7ve.inc
@@ -2,7 +2,6 @@ DEFAULTTUNE ?= "armv7vethf"
 
 TUNEVALID[armv7ve] = "Enable instructions for ARMv7ve"
 TUNECONFLICTS[armv7ve] = "armv4 armv5 armv6 armv7 armv7a"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7ve', ' -march=armv7ve', '', d)}"
 MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv7ve', 'armv7ve:', '' ,d)}"
 
 require conf/machine/include/arm/arch-armv7a.inc
diff --git a/meta/conf/machine/include/tune-iwmmxt.inc b/meta/conf/machine/include/tune-iwmmxt.inc
index f27423cb2e..6e577697cc 100644
--- a/meta/conf/machine/include/tune-iwmmxt.inc
+++ b/meta/conf/machine/include/tune-iwmmxt.inc
@@ -6,7 +6,7 @@ DEFAULTTUNE ?= "iwmmxt"
 require conf/machine/include/arm/arch-armv5-dsp.inc
 
 TUNEVALID[iwmmxt] = "Enable Intel PXA27x specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'iwmmxt', ' -march=iwmmxt -mcpu=iwmmxt', '', d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'iwmmxt', ' -mcpu=iwmmxt', '', d)}"
 
 AVAILTUNES += "iwmmxt"
 ARMPKGARCH_tune-iwmmxt = "iwmmxt"
-- 
2.20.1


