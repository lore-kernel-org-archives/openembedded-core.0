Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id C15D67D723
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 May 2019 19:07:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 451c5q2c08z23
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 May 2019 21:07:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557601647;
	bh=Kll2uxEyHQWPcpIFd2BDwVE6Qq+vK/R79N8HFywjS6A=;
	h=From:To:Subject:Date:From;
	b=iKerrMwqjTsI1sctOsjnsuWqVYwkEvlDa1pipEHlJgpM9GnqYSy2aYmqVrdgcv1Ci
	JcWnDP1eAFbO6Tp781C+ZF6fkMtomVtvqJMQRlzvX9r2lrSanDDHwF4MLE0p8yb6IJ
	q7wm2mQz+GaqOPC/GYWe3xGWn4LyjHktd8Pq6avSQvOGt6Ka6iYA1ynFkFEYlsXoL1
	tQEPZO35IqnCIXpucsW4O6jB6JKkDzSoCDh7b7iSdlL4wP8fqVT6jfjoyJOMJNenOb
	Kc5plg27xxZf1GwcKO0u9X5PhYBaFou2ldR7TyfaDdgrwNli4TFHF6E6fA3mSYlHKe
	U6cZ5kH0qV8S3yd+qWPAhQvnnYfLgTh7DtbXe40bvQWHiMeWUMjs6IRjTxRv0G6u2A
	pyTcQ91PZ5/rv2S9JvXfHBBk05F24W3ZZvCxn/C8qjfu5EFNLKEGkkECyPkk5rrkYF
	8mj0EKrd4rcDmsu+t/6Be5BVv4mlnhCWlFCCAaPWm9nnhVU4/Fm9lXwGKauU7MB6of
	JNN2CzOgQpA6O4Tb3xwwk5jl0e+QBmz/V89u5uz2vZuKBglLVPmEiUe3oDw+Du2U1i
	id+dw3rdWgjZjd4buhyqD7zgq9IZMFAt2HDScjVLdSERPpsWzjxH4nSUpA8NEhX0NX
	7Vh8EKyFSCA6v35UpJHaP3NY=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Sat, 11 May 2019 22:07:25 +0300
Message-Id: <20190511190725.5758-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] iproute2: Remove bogus workaround patch for musl
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
X-List-Received-Date: Sat, 11 May 2019 19:07:28 -0000

This patch worked around a problem in musl but caused
the following:

iplink_bridge.c: In function 'br_dump_bridge_id':
iplink_bridge.c:77:2: warning: implicit declaration of function 'ether_ntoa_r'; did you mean 'inet_ntoa'? [-Wimplicit-function-declaration]
  ether_ntoa_r((const struct ether_addr *)id->addr, eaddr);
  ^~~~~~~~~~~~

In the meantime upstream has already implemented a different
workaround for musl, so this patch can just be dropped.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../0001-ip-Remove-unneed-header.patch        | 30 -------------------
 .../iproute2/iproute2_5.0.0.bb                |  1 -
 2 files changed, 31 deletions(-)
 delete mode 100644 meta/recipes-connectivity/iproute2/iproute2/0001-ip-Remove-unneed-header.patch

diff --git a/meta/recipes-connectivity/iproute2/iproute2/0001-ip-Remove-unneed-header.patch b/meta/recipes-connectivity/iproute2/iproute2/0001-ip-Remove-unneed-header.patch
deleted file mode 100644
index a9027c5b58..0000000000
--- a/meta/recipes-connectivity/iproute2/iproute2/0001-ip-Remove-unneed-header.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 02ed10fc5215c4a32e6740b0a0c2439659be6801 Mon Sep 17 00:00:00 2001
-From: Changhyeok Bae <changhyeok.bae@gmail.com>
-Date: Mon, 13 Nov 2017 15:59:35 +0000
-Subject: [PATCH] ip: Remove unneed header
-
-Fix redefinition of struct ethhdr with a suitably patched musl libc
-that suppresses the kernel if_ether.h.
-
-Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
-
-Upstream-Status: Pending [netdev@vger.kernel.org]
----
- ip/iplink_bridge.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/ip/iplink_bridge.c b/ip/iplink_bridge.c
-index cccdec1..f065b22 100644
---- a/ip/iplink_bridge.c
-+++ b/ip/iplink_bridge.c
-@@ -13,7 +13,6 @@
- #include <stdlib.h>
- #include <string.h>
- #include <netinet/in.h>
--#include <netinet/ether.h>
- #include <linux/if_link.h>
- #include <linux/if_bridge.h>
- #include <net/if.h>
--- 
-2.7.4
-
diff --git a/meta/recipes-connectivity/iproute2/iproute2_5.0.0.bb b/meta/recipes-connectivity/iproute2/iproute2_5.0.0.bb
index c5ac987b6f..8f33c7fe19 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_5.0.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_5.0.0.bb
@@ -3,7 +3,6 @@ require iproute2.inc
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://configure-cross.patch \
            file://0001-libc-compat.h-add-musl-workaround.patch \
-           file://0001-ip-Remove-unneed-header.patch \
           "
 
 SRC_URI[md5sum] = "d22107b4d7cfb999eeb8ad8a0aec1124"
-- 
2.17.1


