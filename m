Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3C78C789A0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Mar 2018 00:43:26 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id 139so9981891wmn.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Mar 2018 16:43:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=RgSBmlp3299G1PB43wNTV150DWNEFKD4P1+OVvPaQRQ=;
	b=GDsiIT7q2nl5BEqa5FSUfjC1942dDD3mUIWE6wNEgmgb+4hMxinygNImwLtomYvqFN
	p+2cE0SW+iR8K80FaA0DXsPHDYy+rd53j5AIyranm8ATKkTAc6pUWh6UtKnL8KWiBAmQ
	UHXGmxTMm/QykYTKcnWk5cjQXSjcSJJOOk3jZiL39QgED9s+5YTO4lh+YzZc/pIbodyS
	qfb1jjsetIWSfpralY1soS2p9zMO2lqskrQXl3fT37YWarwLcm5Pf7LnsiGlY+NggNJT
	GMefqyanx0C4T+e5gy/EVP5A3diqbpB4rj+H1iZZXnVISrdoFPJXB94p/bTDcFId7vSn
	k7xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=RgSBmlp3299G1PB43wNTV150DWNEFKD4P1+OVvPaQRQ=;
	b=fBPeOYyyvPXL0tvxVPTgvLCoM49U5LQ3SmoB/9EnbcSDklK3eJrl4ffzP8cqnXNv54
	dxukQJMi6Mj9CP2ksmj/g9OR2dGNqMmMuqN6C4GJb8yQF1bEJWcAS5f1YkpRhamB/mhh
	qtFYtPiJlN+DhyUBivCEhwQeMm2IpM1Ae/QoyKGZcZNxtBtQocTuHuHqMJ2gPxhKBNnE
	cDCm1555MhGgEyyx8oKZc+5EHZ1fbWxOPM/d3Kc8Ote+5Gdy/9XPY6a7cw2T9RbO/wdU
	U6SX8t0lpKSRg3qrsv0um6E2XsEsKP/pphLO3idcPVieshYzQNt3nGkzZMpDYKPHq6Mi
	dxFw==
X-Gm-Message-State: AElRT7FUYIjVB7xcJo/iBmdBpgG8+gfuCAoUN4veGI5zFXyH8S14B6fl
	U/8qN5WxEYNuyqIBa8ujl6A=
X-Google-Smtp-Source: AG47ELuEHcJFzYgrCqON8gDK3du4pdAdgB5uhHjslfpawqbzzqZR8uIXclLnVrUwsm9RBgahkK7KKQ==
X-Received: by 10.28.93.82 with SMTP id r79mr1963801wmb.73.1520729007231;
	Sat, 10 Mar 2018 16:43:27 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id 2sm2515324wmk.29.2018.03.10.16.43.26
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 10 Mar 2018 16:43:26 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: Armin Kuster <akuster808@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Sun, 11 Mar 2018 00:43:16 +0000
Message-Id: <869be322718708283b53ebeb061c3363fe62614b.1520728804.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <cover.1520728804.git.Martin.Jansa@gmail.com>
References: <cover.1520728804.git.Martin.Jansa@gmail.com>
Subject: [rocko][PATCH 7/8] gcc6: enable FL_LPAE flag for armv7ve cores
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
X-List-Received-Date: Sun, 11 Mar 2018 00:43:26 -0000

From: Andre McCurdy <armccurdy@gmail.com>

The following commit added the FL_LPAE flag to FL_FOR_ARCH7VE, but
neglected to also add it to the armv7ve compatible cores defined in
arm-cores.def.

  https://github.com/gcc-mirror/gcc/commit/af2d9b9e58e8be576c53d94f30c48c68146b0c98

The result is that gcc 6.4 now refuses to allow -march=armv7ve and
-mcpu=XXX to be used together, even when -mcpu is set to an armv7ve
compatible core:

  arm-linux-gnueabi-gcc -march=armv7ve -mcpu=cortex-a7 -Werror ...
  error: switch -mcpu=cortex-a7 conflicts with -march=armv7ve switch [-Werror]

Fix by defining flags for armv7ve compatible cores directly from
FL_FOR_ARCH7VE, rather than re-creating the armv7ve flags
independently by combining FL_FOR_ARCH7A with the armv7ve specific
FL_THUMB_DIV and FL_ARM_DIV flags.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-6.4.inc              |  1 +
 ...001-enable-FL_LPAE-flag-for-armv7ve-cores.patch | 67 ++++++++++++++++++++++
 2 files changed, 68 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0001-enable-FL_LPAE-flag-for-armv7ve-cores.patch

diff --git a/meta/recipes-devtools/gcc/gcc-6.4.inc b/meta/recipes-devtools/gcc/gcc-6.4.inc
index 93a1f24896..1a4a0ed128 100644
--- a/meta/recipes-devtools/gcc/gcc-6.4.inc
+++ b/meta/recipes-devtools/gcc/gcc-6.4.inc
@@ -81,6 +81,7 @@ SRC_URI = "\
 BACKPORTS = "\
            file://CVE-2016-6131.patch \
            file://0057-ARM-PR-82445-suppress-32-bit-aligned-ldrd-strd-peeph.patch \
+           file://0001-enable-FL_LPAE-flag-for-armv7ve-cores.patch \
 "
 SRC_URI[md5sum] = "11ba51a0cfb8471927f387c8895fe232"
 SRC_URI[sha256sum] = "850bf21eafdfe5cd5f6827148184c08c4a0852a37ccf36ce69855334d2c914d4"
diff --git a/meta/recipes-devtools/gcc/gcc-6.4/backport/0001-enable-FL_LPAE-flag-for-armv7ve-cores.patch b/meta/recipes-devtools/gcc/gcc-6.4/backport/0001-enable-FL_LPAE-flag-for-armv7ve-cores.patch
new file mode 100644
index 0000000000..9ee029c29d
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.4/backport/0001-enable-FL_LPAE-flag-for-armv7ve-cores.patch
@@ -0,0 +1,67 @@
+From 22fcc126fad61a8e9ddaaabbc8036644273642dc Mon Sep 17 00:00:00 2001
+From: ktkachov <ktkachov@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Thu, 9 Nov 2017 14:34:28 +0000
+Subject: [PATCH] enable FL_LPAE flag for armv7ve cores
+
+The following commit added the FL_LPAE flag to FL_FOR_ARCH7VE, but
+neglected to also add it to the armv7ve compatible cores defined in
+arm-cores.def.
+
+  https://github.com/gcc-mirror/gcc/commit/af2d9b9e58e8be576c53d94f30c48c68146b0c98
+
+The result is that gcc 6.4 now refuses to allow -march=armv7ve and
+-mcpu=XXX to be used together, even when -mcpu is set to an armv7ve
+compatible core:
+
+  arm-linux-gnueabi-gcc -march=armv7ve -mcpu=cortex-a7 -Werror ...
+  error: switch -mcpu=cortex-a7 conflicts with -march=armv7ve switch [-Werror]
+
+Fix by defining flags for armv7ve compatible cores directly from
+FL_FOR_ARCH7VE, rather than re-creating the armv7ve flags
+independently by combining FL_FOR_ARCH7A with the armv7ve specific
+FL_THUMB_DIV and FL_ARM_DIV flags.
+
+UpStream-Status: Backport
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-6-branch@254584 138bc75d-0d04-0410-961f-82ee72b054a4
+
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+---
+ gcc/config/arm/arm-cores.def | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/gcc/config/arm/arm-cores.def b/gcc/config/arm/arm-cores.def
+index 829b839..ca37e6f 100644
+--- a/gcc/config/arm/arm-cores.def
++++ b/gcc/config/arm/arm-cores.def
+@@ -145,12 +145,12 @@ ARM_CORE("cortex-m0plus.small-multiply",cortexm0plussmallmultiply, cortexm0plus,
+ /* V7 Architecture Processors */
+ ARM_CORE("generic-armv7-a",	genericv7a, genericv7a,		7A,	ARM_FSET_MAKE_CPU1 (FL_LDSCHED | FL_FOR_ARCH7A), cortex)
+ ARM_CORE("cortex-a5",		cortexa5, cortexa5,		7A,	ARM_FSET_MAKE_CPU1 (FL_LDSCHED | FL_FOR_ARCH7A), cortex_a5)
+-ARM_CORE("cortex-a7",		cortexa7, cortexa7,		7A,	ARM_FSET_MAKE_CPU1 (FL_LDSCHED | FL_THUMB_DIV | FL_ARM_DIV | FL_FOR_ARCH7A), cortex_a7)
++ARM_CORE("cortex-a7",		cortexa7, cortexa7,		7A,	ARM_FSET_MAKE_CPU1 (FL_LDSCHED | FL_FOR_ARCH7VE), cortex_a7)
+ ARM_CORE("cortex-a8",		cortexa8, cortexa8,		7A,	ARM_FSET_MAKE_CPU1 (FL_LDSCHED | FL_FOR_ARCH7A), cortex_a8)
+ ARM_CORE("cortex-a9",		cortexa9, cortexa9,		7A,	ARM_FSET_MAKE_CPU1 (FL_LDSCHED | FL_FOR_ARCH7A), cortex_a9)
+-ARM_CORE("cortex-a12",		cortexa12, cortexa17,		7A,	ARM_FSET_MAKE_CPU1 (FL_LDSCHED | FL_THUMB_DIV | FL_ARM_DIV | FL_FOR_ARCH7A), cortex_a12)
+-ARM_CORE("cortex-a15",		cortexa15, cortexa15,		7A,	ARM_FSET_MAKE_CPU1 (FL_LDSCHED | FL_THUMB_DIV | FL_ARM_DIV | FL_FOR_ARCH7A), cortex_a15)
+-ARM_CORE("cortex-a17",		cortexa17, cortexa17,		7A,	ARM_FSET_MAKE_CPU1 (FL_LDSCHED | FL_THUMB_DIV | FL_ARM_DIV | FL_FOR_ARCH7A), cortex_a12)
++ARM_CORE("cortex-a12",		cortexa12, cortexa17,		7A,	ARM_FSET_MAKE_CPU1 (FL_LDSCHED | FL_FOR_ARCH7VE), cortex_a12)
++ARM_CORE("cortex-a15",		cortexa15, cortexa15,		7A,	ARM_FSET_MAKE_CPU1 (FL_LDSCHED | FL_FOR_ARCH7VE), cortex_a15)
++ARM_CORE("cortex-a17",		cortexa17, cortexa17,		7A,	ARM_FSET_MAKE_CPU1 (FL_LDSCHED | FL_FOR_ARCH7VE), cortex_a12)
+ ARM_CORE("cortex-r4",		cortexr4, cortexr4,		7R,	ARM_FSET_MAKE_CPU1 (FL_LDSCHED | FL_FOR_ARCH7R), cortex)
+ ARM_CORE("cortex-r4f",		cortexr4f, cortexr4f,		7R,	ARM_FSET_MAKE_CPU1 (FL_LDSCHED | FL_FOR_ARCH7R), cortex)
+ ARM_CORE("cortex-r5",		cortexr5, cortexr5,		7R,	ARM_FSET_MAKE_CPU1 (FL_LDSCHED | FL_ARM_DIV | FL_FOR_ARCH7R), cortex)
+@@ -162,8 +162,8 @@ ARM_CORE("cortex-m3",		cortexm3, cortexm3,		7M,	ARM_FSET_MAKE_CPU1 (FL_LDSCHED |
+ ARM_CORE("marvell-pj4",		marvell_pj4, marvell_pj4,	7A,	ARM_FSET_MAKE_CPU1 (FL_LDSCHED | FL_FOR_ARCH7A), marvell_pj4)
+ 
+ /* V7 big.LITTLE implementations */
+-ARM_CORE("cortex-a15.cortex-a7", cortexa15cortexa7, cortexa7,	7A,	ARM_FSET_MAKE_CPU1 (FL_LDSCHED | FL_THUMB_DIV | FL_ARM_DIV | FL_FOR_ARCH7A), cortex_a15)
+-ARM_CORE("cortex-a17.cortex-a7", cortexa17cortexa7, cortexa7,	7A,	ARM_FSET_MAKE_CPU1 (FL_LDSCHED | FL_THUMB_DIV | FL_ARM_DIV | FL_FOR_ARCH7A), cortex_a12)
++ARM_CORE("cortex-a15.cortex-a7", cortexa15cortexa7, cortexa7,	7A,	ARM_FSET_MAKE_CPU1 (FL_LDSCHED | FL_FOR_ARCH7VE), cortex_a15)
++ARM_CORE("cortex-a17.cortex-a7", cortexa17cortexa7, cortexa7,	7A,	ARM_FSET_MAKE_CPU1 (FL_LDSCHED | FL_FOR_ARCH7VE), cortex_a12)
+ 
+ /* V8 Architecture Processors */
+ ARM_CORE("cortex-a32",	cortexa32, cortexa53,	8A,	ARM_FSET_MAKE_CPU1 (FL_LDSCHED | FL_CRC32 | FL_FOR_ARCH8A), cortex_a35)
+-- 
+1.9.1
+
-- 
2.15.1


