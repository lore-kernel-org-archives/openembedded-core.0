Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id A8DB971AE8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Dec 2016 06:16:10 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="14261237"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 Dec 2016 14:16:00 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id E85B1477B1D0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Dec 2016 14:15:59 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.226.109) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Mon, 26 Dec 2016 14:16:03 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 26 Dec 2016 14:15:18 +0800
Message-ID: <1482732918-8881-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.109]
X-yoursite-MailScanner-ID: E85B1477B1D0.A7BC8
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] iproute2 4.7.0 -> 4.9.0
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
X-List-Received-Date: Mon, 26 Dec 2016 06:16:12 -0000
Content-Type: text/plain

1) Upgrade iproute2 from 4.7.0 to 4.9.0

2) Add iproute2-4.9.0-musl.patch to fix musl compile problem

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../iproute2/iproute2/iproute2-4.9.0-musl.patch    | 39 ++++++++++++++++++++++
 .../{iproute2_4.7.0.bb => iproute2_4.9.0.bb}       |  6 ++--
 2 files changed, 43 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-connectivity/iproute2/iproute2/iproute2-4.9.0-musl.patch
 rename meta/recipes-connectivity/iproute2/{iproute2_4.7.0.bb => iproute2_4.9.0.bb} (64%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2/iproute2-4.9.0-musl.patch b/meta/recipes-connectivity/iproute2/iproute2/iproute2-4.9.0-musl.patch
new file mode 100644
index 0000000..241869b
--- /dev/null
+++ b/meta/recipes-connectivity/iproute2/iproute2/iproute2-4.9.0-musl.patch
@@ -0,0 +1,39 @@
+Subject: [PATCH] fix 4.9.0  musl compile problem
+
+Avoid in6_addr redefinition
+
+Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
+---
+ include/linux/if_tunnel.h | 2 --
+ ip/ip6tunnel.c            | 1 -
+ 2 files changed, 3 deletions(-)
+
+diff --git a/include/linux/if_tunnel.h b/include/linux/if_tunnel.h
+index 4f975f5..2680646 100644
+--- a/include/linux/if_tunnel.h
++++ b/include/linux/if_tunnel.h
+@@ -2,9 +2,7 @@
+ #define _IF_TUNNEL_H_
+ 
+ #include <linux/types.h>
+-#include <linux/if.h>
+ #include <linux/ip.h>
+-#include <linux/in6.h>
+ #include <asm/byteorder.h>
+ 
+ 
+diff --git a/ip/ip6tunnel.c b/ip/ip6tunnel.c
+index b1c0ae6..8fa4eb2 100644
+--- a/ip/ip6tunnel.c
++++ b/ip/ip6tunnel.c
+@@ -28,7 +28,6 @@
+ #include <arpa/inet.h>
+ #include <sys/ioctl.h>
+ #include <linux/ip.h>
+-#include <linux/if.h>
+ #include <linux/if_arp.h>
+ #include <linux/if_tunnel.h>
+ #include <linux/ip6_tunnel.h>
+-- 
+2.7.4
+
diff --git a/meta/recipes-connectivity/iproute2/iproute2_4.7.0.bb b/meta/recipes-connectivity/iproute2/iproute2_4.9.0.bb
similarity index 64%
rename from meta/recipes-connectivity/iproute2/iproute2_4.7.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_4.9.0.bb
index 426f989..389728d 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_4.7.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_4.9.0.bb
@@ -4,9 +4,11 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://configure-cross.patch \
            file://0001-iproute2-de-bash-scripts.patch \
            file://iproute2-4.3.0-musl.patch \
+           file://iproute2-4.9.0-musl.patch \
           "
-SRC_URI[md5sum] = "d4b205830cdc2702f8a0cbd6232129cd"
-SRC_URI[sha256sum] = "8f60dbcfb33a79daae0638f53bdcaa4310c0aa59ae39af8a234020dc69bb7b92"
+
+SRC_URI[md5sum] = "44a8371a4b2c40e48e4c9f98cbd41391"
+SRC_URI[sha256sum] = "c0f30f043f7767cc1b2cd2197b08d4e9b2392c95823fabe30bbce308c30116c4"
 
 # CFLAGS are computed in Makefile and reference CCOPTS
 #
-- 
2.7.4




