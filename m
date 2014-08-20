Return-Path: <paul.betafive@gmail.com>
Received: from mail-la0-f50.google.com (mail-la0-f50.google.com
	[209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id 6404465DD0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Aug 2014 12:21:22 +0000 (UTC)
Received: by mail-la0-f50.google.com with SMTP id pi18so7118877lab.23
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Aug 2014 05:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=4RU0+oF9odqtAzhyxZEKeZWhsbk1ixeSwt0aAPi5RaU=;
	b=I/Pv53LagGznGpDfhz1x4C+s4kX/nwWgF5skuCYjPm5qrXOPNGfq9inWUv7YOAVyVD
	gJ4EZ3XdOVt94DYSDKfb0zucpEjczro5QfM0oV6axBDAanuLVN0xwb9i1B9QWgc68QOc
	vSQiR500xpLUm2iY66mgFZijc5X4hpqRQrpqWqX+6JyqcslkRAcjAESh1x49BZhZbyCk
	edf87b53FaXQtq4+D3GJA+1AlU+uI6ro58EOQldnV8fAeky3Fc2Sy72wzVyawJ/FMz1b
	BODexfM0tQ6ORel59pFIUJ5S8Jb49JzZFhP+R9q02stTlP/rG8YQw/x8QygbnzuOOVA6
	9nhg==
X-Received: by 10.152.229.133 with SMTP id sq5mr41801267lac.67.1408537282955; 
	Wed, 20 Aug 2014 05:21:22 -0700 (PDT)
Received: from localhost.localdomain (ygg.betafive.co.uk. [5.9.90.21])
	by mx.google.com with ESMTPSA id u6sm14369097laj.7.2014.08.20.05.21.19
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Aug 2014 05:21:20 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Aug 2014 12:21:12 +0000
Message-Id: <1408537272-28431-1-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 2.0.4
Subject: [PATCH] ethtool: Fix musl build failure
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
X-List-Received-Date: Wed, 20 Aug 2014 12:21:26 -0000

We just need to ensure the proper names for uint types are used.

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 .../ethtool/ethtool/ethtool-uint.patch             | 50 ++++++++++++++++++++++
 meta/recipes-extended/ethtool/ethtool_3.14.bb      |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-extended/ethtool/ethtool/ethtool-uint.patch

diff --git a/meta/recipes-extended/ethtool/ethtool/ethtool-uint.patch b/meta/recipes-extended/ethtool/ethtool/ethtool-uint.patch
new file mode 100644
index 0000000..bb96a18
--- /dev/null
+++ b/meta/recipes-extended/ethtool/ethtool/ethtool-uint.patch
@@ -0,0 +1,50 @@
+Fix build with musl by using correct uint type names.
+
+This patch is taken from Sabotage Linux, the license statement for patches and
+build scripts in Sabotage Linux says:
+
+    To the extent possible under law, Christian Neukirchen has waived
+    all copyright and related or neighboring rights to this work.
+
+    http://creativecommons.org/publicdomain/zero/1.0/
+
+Therefore this should be good to include in OpenEmbedded.
+
+Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
+
+Upstream-status: Pending
+
+diff -u ethtool-3.14.org/internal.h ethtool-3.14/internal.h
+--- ethtool-3.14.org/internal.h
++++ ethtool-3.14/internal.h
+@@ -7,6 +7,7 @@
+ #include "ethtool-config.h"
+ #endif
+ #include <stdio.h>
++#include <stdint.h>
+ #include <stdlib.h>
+ #include <string.h>
+ #include <sys/types.h>
+@@ -17,16 +18,16 @@
+ 
+ /* ethtool.h expects these to be defined by <linux/types.h> */
+ #ifndef HAVE_BE_TYPES
+-typedef __uint16_t __be16;
+-typedef __uint32_t __be32;
++typedef uint16_t __be16;
++typedef uint32_t __be32;
+ typedef unsigned long long __be64;
+ #endif
+ 
+ typedef unsigned long long u64;
+-typedef __uint32_t u32;
+-typedef __uint16_t u16;
+-typedef __uint8_t u8;
+-typedef __int32_t s32;
++typedef uint32_t u32;
++typedef uint16_t u16;
++typedef uint8_t u8;
++typedef int32_t s32;
+ 
+ #include "ethtool-copy.h"
+ #include "net_tstamp-copy.h"
diff --git a/meta/recipes-extended/ethtool/ethtool_3.14.bb b/meta/recipes-extended/ethtool/ethtool_3.14.bb
index 49c79b6..bc3b295 100644
--- a/meta/recipes-extended/ethtool/ethtool_3.14.bb
+++ b/meta/recipes-extended/ethtool/ethtool_3.14.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
            file://run-ptest \
            file://avoid_parallel_tests.patch \
+           file://ethtool-uint.patch \
            "
 
 SRC_URI[md5sum] = "997e20c25c43ad5800f8ae3204455a8a"
-- 
2.0.4


