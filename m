Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id D990373288
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Mar 2017 23:29:53 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id b5so4214956pgg.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Mar 2017 15:29:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=CwMGmFshgvtmV4+YfWk63WcTQKmlatEZxAzCz74gxdY=;
	b=nHRbRimiabzVPc2H0o4EaPmcy0ppEssBXiLV35wPadAYRhOS0LvfQaelUOmFXrE61X
	6CRdep2jIMOFMQjxQTyBMWxQniXVuGFPB3Ij7LbfmoWmMI5ddiXFGBq9uSjOaiLin+oj
	s7EgUEVmCs8qGENrLUv9XuZNFLSl+A7PHZJ+BaKuDJNi5U4UvGYW20plmvsVSZipe9B9
	WVSgzJujqltr6IY1aNZuVvtTWM0v1qJJryE18NZOJ7rwVDNzEphdM/OpyMpeKBSLgkuF
	a/CV5WyO2Qvc6IGvs00d1YZFZEL0RMiBkA/OudKNmZ8YJ9qKMQx2HO/h0COOtc3SCbQK
	VXxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=CwMGmFshgvtmV4+YfWk63WcTQKmlatEZxAzCz74gxdY=;
	b=UVtIfUKltyQowL67KAtLO3N85C5EsqY1MLRvcP29yvHL17gE44oIMkXENF1miF0Skx
	XgK5erjJOCCYsjioaQKLNQyDC2zN10YxdF7+Jml+7kmKpKCKPvmibuzd7dJMAWHqjPyR
	fgd/LGrSvgX9MMZIg5tBijOXZrI9w1DOLpvXuidDx0Q5tNzr3DgcwoHOI8pGH8Ram9vD
	t/mCFXMxmjI4JPtdMy3Sw1uM0DKBsc8Y+Lb9bo3fpfe0Ychq2JzRF2xVGSLooqgRVfaj
	907ASy9pv3VMGYHtE+kIDhHdA0/m4jvCeD9xTNfnHjmvYxTx0l3BKZTRZbTG/gNnaXmF
	ROnQ==
X-Gm-Message-State: AMke39lA6wvN+952hTf8miD4RTe/4WexH8+mMR4r1s5Vw2V/d0xY3fsjdv5hxjSn2rz7gA==
X-Received: by 10.84.218.78 with SMTP id f14mr30534835plm.146.1488842994891;
	Mon, 06 Mar 2017 15:29:54 -0800 (PST)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	y16sm41517811pfk.52.2017.03.06.15.29.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Mar 2017 15:29:53 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Mar 2017 15:29:48 -0800
Message-Id: <1488842988-19924-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH v2] conf/machine/include: enable hardfloat by default for ARMv6 and above
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
X-List-Received-Date: Mon, 06 Mar 2017 23:29:54 -0000

Defaulting to softfp probably isn't the best choice anymore,
especially as there are now ARM BSP layers which leave DEFAULTTUNE
entirely up to the distro:

  https://lists.yoctoproject.org/pipermail/yocto/2017-February/034637.html

Also add 't' to the ARMv7 default DEFAULTTUNEs, since there's no
clear reason to default to ignoring ARM_INSTRUCTION_SET for ARMv7.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/conf/machine/include/arm/arch-armv6.inc   | 2 +-
 meta/conf/machine/include/arm/arch-armv7a.inc  | 2 +-
 meta/conf/machine/include/arm/arch-armv7ve.inc | 2 +-
 meta/conf/machine/include/tune-arm1136jf-s.inc | 2 +-
 meta/conf/machine/include/tune-cortexa15.inc   | 2 +-
 meta/conf/machine/include/tune-cortexa17.inc   | 2 +-
 meta/conf/machine/include/tune-cortexa5.inc    | 2 +-
 meta/conf/machine/include/tune-cortexa7.inc    | 2 +-
 meta/conf/machine/include/tune-cortexa8.inc    | 2 +-
 meta/conf/machine/include/tune-cortexa9.inc    | 2 +-
 10 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/conf/machine/include/arm/arch-armv6.inc b/meta/conf/machine/include/arm/arch-armv6.inc
index 91f0f07..6c838e9 100644
--- a/meta/conf/machine/include/arm/arch-armv6.inc
+++ b/meta/conf/machine/include/arm/arch-armv6.inc
@@ -1,4 +1,4 @@
-DEFAULTTUNE ?= "armv6"
+DEFAULTTUNE ?= "armv6hf"
 
 TUNEVALID[armv6] = "Enable instructions for ARMv6"
 TUNECONFLICTS[armv6] = "armv4 armv5"
diff --git a/meta/conf/machine/include/arm/arch-armv7a.inc b/meta/conf/machine/include/arm/arch-armv7a.inc
index 5446048..bad1c27 100644
--- a/meta/conf/machine/include/arm/arch-armv7a.inc
+++ b/meta/conf/machine/include/arm/arch-armv7a.inc
@@ -1,4 +1,4 @@
-DEFAULTTUNE ?= "armv7a"
+DEFAULTTUNE ?= "armv7athf"
 
 TUNEVALID[armv7a] = "Enable instructions for ARMv7-a"
 TUNECONFLICTS[armv7a] = "armv4 armv5 armv6 armv7"
diff --git a/meta/conf/machine/include/arm/arch-armv7ve.inc b/meta/conf/machine/include/arm/arch-armv7ve.inc
index 42d8d04..4d9260f 100644
--- a/meta/conf/machine/include/arm/arch-armv7ve.inc
+++ b/meta/conf/machine/include/arm/arch-armv7ve.inc
@@ -1,4 +1,4 @@
-DEFAULTTUNE ?= "armv7ve"
+DEFAULTTUNE ?= "armv7vethf"
 
 TUNEVALID[armv7ve] = "Enable instructions for ARMv7ve"
 TUNECONFLICTS[armv7ve] = "armv4 armv5 armv6 armv7 armv7a"
diff --git a/meta/conf/machine/include/tune-arm1136jf-s.inc b/meta/conf/machine/include/tune-arm1136jf-s.inc
index 53994ef..c5de63e 100644
--- a/meta/conf/machine/include/tune-arm1136jf-s.inc
+++ b/meta/conf/machine/include/tune-arm1136jf-s.inc
@@ -1,4 +1,4 @@
-DEFAULTTUNE ?= "armv6"
+DEFAULTTUNE ?= "armv6hf"
 
 require conf/machine/include/arm/arch-armv6.inc
 
diff --git a/meta/conf/machine/include/tune-cortexa15.inc b/meta/conf/machine/include/tune-cortexa15.inc
index 03de602..25e99f9 100644
--- a/meta/conf/machine/include/tune-cortexa15.inc
+++ b/meta/conf/machine/include/tune-cortexa15.inc
@@ -1,4 +1,4 @@
-DEFAULTTUNE ?= "armv7ve-neon"
+DEFAULTTUNE ?= "armv7vethf-neon"
 
 require conf/machine/include/arm/arch-armv7ve.inc
 
diff --git a/meta/conf/machine/include/tune-cortexa17.inc b/meta/conf/machine/include/tune-cortexa17.inc
index f659a62..40392f9 100644
--- a/meta/conf/machine/include/tune-cortexa17.inc
+++ b/meta/conf/machine/include/tune-cortexa17.inc
@@ -1,4 +1,4 @@
-DEFAULTTUNE ?= "armv7ve-neon"
+DEFAULTTUNE ?= "armv7vethf-neon"
 
 require conf/machine/include/arm/arch-armv7ve.inc
 
diff --git a/meta/conf/machine/include/tune-cortexa5.inc b/meta/conf/machine/include/tune-cortexa5.inc
index 93f9ca4..1f0cda6 100644
--- a/meta/conf/machine/include/tune-cortexa5.inc
+++ b/meta/conf/machine/include/tune-cortexa5.inc
@@ -1,4 +1,4 @@
-DEFAULTTUNE ?= "armv7a-neon"
+DEFAULTTUNE ?= "armv7athf-neon"
 
 require conf/machine/include/arm/arch-armv7a.inc
 
diff --git a/meta/conf/machine/include/tune-cortexa7.inc b/meta/conf/machine/include/tune-cortexa7.inc
index 52e06b8..52415d9 100644
--- a/meta/conf/machine/include/tune-cortexa7.inc
+++ b/meta/conf/machine/include/tune-cortexa7.inc
@@ -1,4 +1,4 @@
-DEFAULTTUNE ?= "armv7ve-neon"
+DEFAULTTUNE ?= "armv7vethf-neon"
 
 require conf/machine/include/arm/arch-armv7ve.inc
 
diff --git a/meta/conf/machine/include/tune-cortexa8.inc b/meta/conf/machine/include/tune-cortexa8.inc
index a831bd5..8ee8de9 100644
--- a/meta/conf/machine/include/tune-cortexa8.inc
+++ b/meta/conf/machine/include/tune-cortexa8.inc
@@ -1,4 +1,4 @@
-DEFAULTTUNE ?= "armv7a-neon"
+DEFAULTTUNE ?= "armv7athf-neon"
 
 require conf/machine/include/arm/arch-armv7a.inc
 
diff --git a/meta/conf/machine/include/tune-cortexa9.inc b/meta/conf/machine/include/tune-cortexa9.inc
index 8b84e60..0cf323c 100644
--- a/meta/conf/machine/include/tune-cortexa9.inc
+++ b/meta/conf/machine/include/tune-cortexa9.inc
@@ -1,4 +1,4 @@
-DEFAULTTUNE ?= "armv7a-neon"
+DEFAULTTUNE ?= "armv7athf-neon"
 
 require conf/machine/include/arm/arch-armv7a.inc
 
-- 
1.9.1


