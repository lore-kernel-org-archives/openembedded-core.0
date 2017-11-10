Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id E95D9783B2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 06:10:19 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id g6so6686440pgn.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Nov 2017 22:10:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=YygLtc51AaZX5TMZmhh6oRbb3RmqTjffh6x5pQE4gwY=;
	b=UDtMVJEqvYtaAi1Ndt9YrFoXlaP8VStBmRY4gsYCSzyXvIZS7nd3l5iEzqGUEVHCin
	bzvSmv5YsCtT0YFBovrxvMZxQErDcevKOoFIXa59/JLwpH7QQ5rBcjSnsde09+ocF+Dx
	0XbZ7dNDemkVDNvXfdjMDt9WaQTnqxOvR64RBzw93IwPzD51SkKV7A/3NyXniGozJJjW
	3pZRX9OBDAFQPhznEhjAujfyjAK71l/frmzxqZ7xMaMI6UZEe55m1YK9fZUtKxj7aOsB
	EdQcurPJFjRFGii40xBMfXcTPXdw7MGNK7hyFKE3QERsBCDcI5nyOn8HexBka5rtTu6H
	R8xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=YygLtc51AaZX5TMZmhh6oRbb3RmqTjffh6x5pQE4gwY=;
	b=tt2UzVcuF8Ay+BBHaWZuI7H+Mm2ZIM1qOX4r019+OjCGLD6vorv5ZL7FxizIUzhVlo
	53GFMWR9feSOxnUl3if6HYGXmpUTdEbfIqNaDwqt7e4lGdie85QrFd7YnuTqwRzwH54f
	+Jf5LXgsB1qLfTPQrTJAb+L3IG69gtMpIbLEytdyzCqpVs77vQqbsGgJA2oxPHJCIfqU
	zMuScfSL1JAjtp99Ytagl6Y8Sfeg9DN5wzcxuGdDyJdgBhcEOvoEegBXcIPV5Xnbtk+v
	iU7htzhNnvsge0KtWhE2Gxz2kVoz2HEjiYwVDzI4jcFif0lH7y2UiZPyAfq9l38rp3Sa
	iXYg==
X-Gm-Message-State: AJaThX7kzFJmbj5xXmBugm5QL5qUGmqmDji0vlYT3gGdrJtGv2EKfYlA
	l7IHTNKNjvIxGMWuj+duuLQYHQ==
X-Google-Smtp-Source: ABhQp+R+5d24xRbLhTjt8aNApWNEk/WeFWLItXSw9vb0Ztj4Xraqga9iNfjevQKiygyIGN+hOf0crw==
X-Received: by 10.99.109.73 with SMTP id i70mr2942328pgc.177.1510294220789;
	Thu, 09 Nov 2017 22:10:20 -0800 (PST)
Received: from e6520.gateway.sonic.net
	(173-228-90-28.dsl.dynamic.fusionbroadband.com. [173.228.90.28])
	by smtp.gmail.com with ESMTPSA id k3sm160177pgq.26.2017.11.09.22.10.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 09 Nov 2017 22:10:19 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Nov 2017 22:10:13 -0800
Message-Id: <1510294213-1343-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH v2] gcc6: enable FL_LPAE flag for armv7ve cores
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
X-List-Received-Date: Fri, 10 Nov 2017 06:10:20 -0000

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
index a42b7d8..942b39f 100644
--- a/meta/recipes-devtools/gcc/gcc-6.4.inc
+++ b/meta/recipes-devtools/gcc/gcc-6.4.inc
@@ -80,6 +80,7 @@ SRC_URI = "\
 "
 BACKPORTS = "\
            file://CVE-2016-6131.patch \
+           file://0001-enable-FL_LPAE-flag-for-armv7ve-cores.patch \
 "
 SRC_URI[md5sum] = "11ba51a0cfb8471927f387c8895fe232"
 SRC_URI[sha256sum] = "850bf21eafdfe5cd5f6827148184c08c4a0852a37ccf36ce69855334d2c914d4"
diff --git a/meta/recipes-devtools/gcc/gcc-6.4/backport/0001-enable-FL_LPAE-flag-for-armv7ve-cores.patch b/meta/recipes-devtools/gcc/gcc-6.4/backport/0001-enable-FL_LPAE-flag-for-armv7ve-cores.patch
new file mode 100644
index 0000000..9ee029c
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
1.9.1


