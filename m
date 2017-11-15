Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 240EB78518
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 03:09:35 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id v41so31301073qtv.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 19:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=0zz+fGrAWh1bhCodaHw3TNfmu1FqjlDBg3lbMezM1ko=;
	b=F8j5tDHUenffU8Ul6y+xobux1hpSNfcoTE7LF81Mhdr+QOMjhNGVsIRT3eOhkzYLVl
	DoFUCO3fc2c7IfAKLNHwyjQbooTXYoDu/WIDJbUrlCyN7mvXdQnXrBOa5sHBjZTf0/3l
	cmjElXd+6qWVu6l1itbR/Ls5XzpjrbSHYx0P423zjyLKw0CtqN2qOX+gpmGxGiR8glrt
	xBCHIpURrnuArj4dk9WBviQW8wltoSoXJUtZ6MAz0poKzyO1hv23W/4VOf0Rf3MlHYIE
	IEqsNSg7bEkWPcsyZhazbIbkHtFzspCV7I6V19tn6YvtJBmkuaV24JSwTHS4jbsTbSqo
	qCnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=0zz+fGrAWh1bhCodaHw3TNfmu1FqjlDBg3lbMezM1ko=;
	b=bSOdozDG2MUGzK6ROTSIFAYRXLZiHhsoX2cabJTldXAUrIsRTLjwFBT7wbWp+F0f/W
	CWVwsJemAuS3OQGl0OdbolZNBQWsGpKrjbhR7vrTwh8TbV2QlgtG4BhnIT++kru8ygr7
	3WNwKebsFKjQeeuMQnK+1TrYzxMWUrG3N6aMWynqb5GJSVWXVFfZjhkcYd/FFn3wwOeh
	SjMfyW+0PA1DuvPf1e6DQUXmEnUWAf/Nl8eHjSKzgkun/IF5dNwEunMFXhBGAQVzPzEc
	qfUT3KRS4mkb7v4f36f+jbeyXrEyuvvYPA3xIrVWf7uwbQYOhoLXGYy3VYzhwgSflx5z
	6G2A==
X-Gm-Message-State: AJaThX5bQj3iWhiQlats3ljW8ZVA1DGTtr0A4yJ8zbkEoobl0hUn2NZH
	kx0DR3rs7nTOxnrol0IpTo0iuQ==
X-Google-Smtp-Source: AGs4zMaDu6IgvbSGhSpg0WVBhTAfYbzeZSv0Q5HTcSeNnJ3HYkr9pbLurCNMjKpdBFXwxRn5CrejMw==
X-Received: by 10.55.34.135 with SMTP id i129mr20991019qki.86.1510715376095;
	Tue, 14 Nov 2017 19:09:36 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8882:b8c::a4a])
	by smtp.gmail.com with ESMTPSA id
	r21sm7319968qkh.89.2017.11.14.19.09.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Nov 2017 19:09:35 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Nov 2017 19:09:16 -0800
Message-Id: <7b9266b576ae0ce3ae990661c54f13fc2294067e.1510715185.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <cover.1510715185.git.raj.khem@gmail.com>
References: <cover.1510715185.git.raj.khem@gmail.com>
Subject: [PATCH 5/8] gcc6: enable FL_LPAE flag for armv7ve cores
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
X-List-Received-Date: Wed, 15 Nov 2017 03:09:35 -0000

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
2.15.0


