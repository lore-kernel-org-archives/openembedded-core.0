Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D52C1757E9
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jun 2015 14:48:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t52EmuCe027750
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Jun 2015 07:48:56 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 2 Jun 2015 07:48:56 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 2 Jun 2015 07:48:52 -0700
Message-ID: <8703c6645221ab40d10054a946b53fcf046e6fc7.1433256486.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1433256486.git.liezhi.yang@windriver.com>
References: <cover.1433256486.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/6] ethtool: 3.16 -> 4.0
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
X-List-Received-Date: Tue, 02 Jun 2015 14:48:57 -0000
Content-Type: text/plain

Removed ethtool-uint.patch since it is already in the source.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../ethtool/ethtool/ethtool-uint.patch             |   50 --------------------
 .../ethtool/{ethtool_3.16.bb => ethtool_4.0.bb}    |    5 +-
 2 files changed, 2 insertions(+), 53 deletions(-)
 delete mode 100644 meta/recipes-extended/ethtool/ethtool/ethtool-uint.patch
 rename meta/recipes-extended/ethtool/{ethtool_3.16.bb => ethtool_4.0.bb} (85%)

diff --git a/meta/recipes-extended/ethtool/ethtool/ethtool-uint.patch b/meta/recipes-extended/ethtool/ethtool/ethtool-uint.patch
deleted file mode 100644
index bb96a18..0000000
--- a/meta/recipes-extended/ethtool/ethtool/ethtool-uint.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-Fix build with musl by using correct uint type names.
-
-This patch is taken from Sabotage Linux, the license statement for patches and
-build scripts in Sabotage Linux says:
-
-    To the extent possible under law, Christian Neukirchen has waived
-    all copyright and related or neighboring rights to this work.
-
-    http://creativecommons.org/publicdomain/zero/1.0/
-
-Therefore this should be good to include in OpenEmbedded.
-
-Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
-
-Upstream-status: Pending
-
-diff -u ethtool-3.14.org/internal.h ethtool-3.14/internal.h
---- ethtool-3.14.org/internal.h
-+++ ethtool-3.14/internal.h
-@@ -7,6 +7,7 @@
- #include "ethtool-config.h"
- #endif
- #include <stdio.h>
-+#include <stdint.h>
- #include <stdlib.h>
- #include <string.h>
- #include <sys/types.h>
-@@ -17,16 +18,16 @@
- 
- /* ethtool.h expects these to be defined by <linux/types.h> */
- #ifndef HAVE_BE_TYPES
--typedef __uint16_t __be16;
--typedef __uint32_t __be32;
-+typedef uint16_t __be16;
-+typedef uint32_t __be32;
- typedef unsigned long long __be64;
- #endif
- 
- typedef unsigned long long u64;
--typedef __uint32_t u32;
--typedef __uint16_t u16;
--typedef __uint8_t u8;
--typedef __int32_t s32;
-+typedef uint32_t u32;
-+typedef uint16_t u16;
-+typedef uint8_t u8;
-+typedef int32_t s32;
- 
- #include "ethtool-copy.h"
- #include "net_tstamp-copy.h"
diff --git a/meta/recipes-extended/ethtool/ethtool_3.16.bb b/meta/recipes-extended/ethtool/ethtool_4.0.bb
similarity index 85%
rename from meta/recipes-extended/ethtool/ethtool_3.16.bb
rename to meta/recipes-extended/ethtool/ethtool_4.0.bb
index 92a0704..13f2b1c 100644
--- a/meta/recipes-extended/ethtool/ethtool_3.16.bb
+++ b/meta/recipes-extended/ethtool/ethtool_4.0.bb
@@ -9,11 +9,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
            file://run-ptest \
            file://avoid_parallel_tests.patch \
-           file://ethtool-uint.patch \
            "
 
-SRC_URI[md5sum] = "3806bae34c153e2b9e2859e85c54788d"
-SRC_URI[sha256sum] = "a6f1433824af7b390ed4e66dfc7cee047d6d1f56dbb8ceef9fe905d63aef5275"
+SRC_URI[md5sum] = "0a1c78787c7dcf077016ed86372a472f"
+SRC_URI[sha256sum] = "e200516727cc9583e8b63fd6e72f667f9ed41bb4f0577ff4803b60c64cfd1dbc"
 
 inherit autotools ptest
 RDEPENDS_${PN}-ptest += "make"
-- 
1.7.9.5


