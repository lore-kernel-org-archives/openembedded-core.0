Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 35B107889F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 17:23:28 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id m26so14693381pfj.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 09:23:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=iL/4IrIV2YLcB5rfdqaUwQCAhM5aJqppu+sAr06BpJ0=;
	b=TxSHUY5ygr3vbIiDp4ClN374WguypyA/D4yHqKVM997/lNTZ6ZFezi+fXxcZV1gu3r
	imc3hct4HNdu5tQssblWZpT7RMOj8n0tmCKdIx8FABMETMt0Tpdepk8fwe6ALjn0g2/l
	qHN9vZ/Zneiug1bhPjcMJhFxgRvZoWz4WlQCuzY+QVQczZnvKiYqpStbtEpZ1AoEkXTT
	46v7uVouJ26yUWsglVhpCA3ilGTiBNO5kDd1tGfETK4KUzZsFUcwXH4gcXzNEQIKufFs
	/cwmavH0Ooa7NhtmMnbpRgl7PA2C7tBdVQ379wsg76/ydr0nr1TtoYBtZvY09wKgNGxl
	r9LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=iL/4IrIV2YLcB5rfdqaUwQCAhM5aJqppu+sAr06BpJ0=;
	b=SpXbCXHrO3SmXgzfeEV/0mGdpiTXad9H+ws1zzQQBswOBRLFqCYaWWJ719AhEFt9Tw
	ZI9JKqVGInRHbGbIuJcD9nOxLAin4rKG+3icifZghINpszzJnC8ObAYnEnqYGPtZXFFC
	Qonis79bt6NJgUdejThBedA5SFPJwoShA6NnSLhLXF1hGMDAChunyWv3Xw9vR/M3Zis3
	xCX0HKKWzI2lOA8fCymWkM1Bl2eF2YwppHmaKlkvVHwa+GdcYVlcurOBNgIvsn5KoZJB
	aXL0zO1Pr6EZpltGI1D2FSgVz6dmdXXxu7lY9OKaBf+jDpD586Iu9QIZEDzjBDIxIYH1
	Rr8A==
X-Gm-Message-State: AKGB3mKHyTxV42ULSHIfc4Lk1CVXsPqseKpDEasiTx9Nyl+ovfuSk/Zp
	zixmPmN8Bn5LNxj9OeJs5epTcQ==
X-Google-Smtp-Source: ACJfBosbdUJWQeIr6ruO9oyR1rFRYtqWpuBkur4zxR/UWCrMJQXBOeJ0nb+a132yOXsNmuF4kpev0Q==
X-Received: by 10.84.246.20 with SMTP id k20mr2976139pll.209.1513099409897;
	Tue, 12 Dec 2017 09:23:29 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c::c579])
	by smtp.gmail.com with ESMTPSA id
	k197sm18790329pga.42.2017.12.12.09.23.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Dec 2017 09:23:29 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Dec 2017 09:23:12 -0800
Message-Id: <20171212172317.601-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171212172317.601-1-raj.khem@gmail.com>
References: <20171212172317.601-1-raj.khem@gmail.com>
Subject: [PATCH 4/9] gcc6: enable FL_LPAE flag for armv7ve cores
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
X-List-Received-Date: Tue, 12 Dec 2017 17:23:29 -0000

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
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-6.4.inc              |  1 +
 ...001-enable-FL_LPAE-flag-for-armv7ve-cores.patch | 67 ++++++++++++++++++++++
 2 files changed, 68 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0001-enable-FL_LPAE-flag-for-armv7ve-cores.patch

diff --git a/meta/recipes-devtools/gcc/gcc-6.4.inc b/meta/recipes-devtools/gcc/gcc-6.4.inc
index 37e996afb7..03f2bf045d 100644
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
index 0000000000..3f664c5885
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
+Upstream-Status: Backport
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


