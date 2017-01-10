Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id DE9D86093A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2017 01:59:55 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="14610659"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 10 Jan 2017 09:59:50 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 171A747AD1C4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2017 09:59:48 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.226.109) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Tue, 10 Jan 2017 09:59:59 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 Jan 2017 09:59:06 +0800
Message-ID: <1484013546-60559-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.109]
X-yoursite-MailScanner-ID: 171A747AD1C4.A7EBE
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH V2] iproute2 4.7->4.9
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
X-List-Received-Date: Tue, 10 Jan 2017 01:59:56 -0000
Content-Type: text/plain

Upgrade iproute2 from 4.7 to 4.9

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../iproute2/iproute2/iproute2-4.3.0-musl.patch    |  85 -------------
 .../iproute2/iproute2/iproute2-4.9.0-musl.patch    | 131 +++++++++++++++++++++
 .../{iproute2_4.7.0.bb => iproute2_4.9.0.bb}       |   7 +-
 3 files changed, 135 insertions(+), 88 deletions(-)
 delete mode 100644 meta/recipes-connectivity/iproute2/iproute2/iproute2-4.3.0-musl.patch
 create mode 100644 meta/recipes-connectivity/iproute2/iproute2/iproute2-4.9.0-musl.patch
 rename meta/recipes-connectivity/iproute2/{iproute2_4.7.0.bb => iproute2_4.9.0.bb} (61%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2/iproute2-4.3.0-musl.patch b/meta/recipes-connectivity/iproute2/iproute2/iproute2-4.3.0-musl.patch
deleted file mode 100644
index 8c078f6..0000000
--- a/meta/recipes-connectivity/iproute2/iproute2/iproute2-4.3.0-musl.patch
+++ /dev/null
@@ -1,85 +0,0 @@
-Subject: [PATCH] Avoid in6_addr redefinition
-
-Due to both <netinet/in.h> and <linux/in6.h> being included, the
-in6_addr is being redefined: once from the C library headers and once
-from the kernel headers. This causes some build failures with for
-example the musl C library.
-
-In order to fix this, use just the C library header <netinet/in.h>.
-Original patch taken from
-http://git.alpinelinux.org/cgit/aports/tree/main/iproute2/musl-fixes.patch.
-
-(Refreshed the patch for 4.6 release)
-
-Upstream-Status: Pending
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Signed-off-by: Maxin B. John <maxin.john@intel.com>
-----
-diff -Naur iproute2-4.6.0-orig/include/libiptc/ipt_kernel_headers.h iproute2-4.6.0/include/libiptc/ipt_kernel_headers.h
---- iproute2-4.6.0-orig/include/libiptc/ipt_kernel_headers.h	2016-05-23 12:03:23.821826910 +0300
-+++ iproute2-4.6.0/include/libiptc/ipt_kernel_headers.h	2016-05-23 12:04:23.714078154 +0300
-@@ -6,7 +6,6 @@
- #include <limits.h>
- 
- #include <netinet/ip.h>
--#include <netinet/in.h>
- #include <netinet/ip_icmp.h>
- #include <netinet/tcp.h>
- #include <netinet/udp.h>
-diff -Naur iproute2-4.6.0-orig/include/linux/if_bridge.h iproute2-4.6.0/include/linux/if_bridge.h
---- iproute2-4.6.0-orig/include/linux/if_bridge.h	2016-05-23 12:03:23.821826910 +0300
-+++ iproute2-4.6.0/include/linux/if_bridge.h	2016-05-23 12:04:23.716078129 +0300
-@@ -15,7 +15,6 @@
- 
- #include <linux/types.h>
- #include <linux/if_ether.h>
--#include <linux/in6.h>
- 
- #define SYSFS_BRIDGE_ATTR	"bridge"
- #define SYSFS_BRIDGE_FDB	"brforward"
-diff -Naur iproute2-4.6.0-orig/include/linux/netfilter.h iproute2-4.6.0/include/linux/netfilter.h
---- iproute2-4.6.0-orig/include/linux/netfilter.h	2016-05-23 12:03:23.821826910 +0300
-+++ iproute2-4.6.0/include/linux/netfilter.h	2016-05-23 12:04:23.717078117 +0300
-@@ -4,8 +4,6 @@
- #include <linux/types.h>
- 
- #include <linux/sysctl.h>
--#include <linux/in.h>
--#include <linux/in6.h>
- 
- /* Responses from hook functions. */
- #define NF_DROP 0
-diff -Naur iproute2-4.6.0-orig/include/linux/netfilter_ipv4/ip_tables.h iproute2-4.6.0/include/linux/netfilter_ipv4/ip_tables.h
---- iproute2-4.6.0-orig/include/linux/netfilter_ipv4/ip_tables.h	2016-05-18 21:56:02.000000000 +0300
-+++ iproute2-4.6.0/include/linux/netfilter_ipv4/ip_tables.h	2016-05-23 12:09:22.888337961 +0300
-@@ -17,7 +17,6 @@
- 
- #include <linux/types.h>
- 
--#include <linux/if.h>
- #include <linux/netfilter_ipv4.h>
- 
- #include <linux/netfilter/x_tables.h>
-diff -Naur iproute2-4.6.0-orig/include/linux/xfrm.h iproute2-4.6.0/include/linux/xfrm.h
---- iproute2-4.6.0-orig/include/linux/xfrm.h	2016-05-23 12:03:23.821826910 +0300
-+++ iproute2-4.6.0/include/linux/xfrm.h	2016-05-23 12:04:23.718078104 +0300
-@@ -1,7 +1,6 @@
- #ifndef _LINUX_XFRM_H
- #define _LINUX_XFRM_H
- 
--#include <linux/in6.h>
- #include <linux/types.h>
- 
- /* All of the structures in this file may not change size as they are
-diff -Naur iproute2-4.6.0-orig/include/utils.h iproute2-4.6.0/include/utils.h
---- iproute2-4.6.0-orig/include/utils.h	2016-05-23 12:03:23.821826910 +0300
-+++ iproute2-4.6.0/include/utils.h	2016-05-23 12:04:23.718078104 +0300
-@@ -1,6 +1,7 @@
- #ifndef __UTILS_H__
- #define __UTILS_H__ 1
- 
-+#include <sys/param.h>  /* MAXPATHLEN */
- #include <sys/types.h>
- #include <asm/types.h>
- #include <resolv.h>
diff --git a/meta/recipes-connectivity/iproute2/iproute2/iproute2-4.9.0-musl.patch b/meta/recipes-connectivity/iproute2/iproute2/iproute2-4.9.0-musl.patch
new file mode 100644
index 0000000..737a90c
--- /dev/null
+++ b/meta/recipes-connectivity/iproute2/iproute2/iproute2-4.9.0-musl.patch
@@ -0,0 +1,131 @@
+Subject: [PATCH] Avoid in6_addr redefinition
+
+Due to both <netinet/in.h> and <linux/in6.h> being included, the 
+in6_addr is being redefined: once from the C library headers and once
+from the kernel headers. This causes some build failures with for 
+example the musl C library.
+
+In order to fix this, use just the C library header <netinet/in.h>.
+Original patch taken from
+http://git.alpinelinux.org/cgit/aports/tree/main/iproute2/musl-fixes.patch.
+
+(Refreshed the patch for 4.9 release)
+
+Upstream-Status: Pending
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: Maxin B. John <maxin.john@intel.com>
+Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
+---
+ include/libiptc/ipt_kernel_headers.h     | 1 -
+ include/linux/if_bridge.h                | 1 -
+ include/linux/if_tunnel.h                | 2 --
+ include/linux/netfilter.h                | 2 --
+ include/linux/netfilter_ipv4/ip_tables.h | 1 -
+ include/linux/xfrm.h                     | 1 -
+ include/utils.h                          | 1 +
+ ip/ip6tunnel.c                           | 1 -
+ 8 files changed, 1 insertion(+), 9 deletions(-)
+
+diff --git a/include/libiptc/ipt_kernel_headers.h b/include/libiptc/ipt_kernel_headers.h
+index a5963e9..42f8610 100644
+--- a/include/libiptc/ipt_kernel_headers.h
++++ b/include/libiptc/ipt_kernel_headers.h
+@@ -6,7 +6,6 @@
+ #include <limits.h>
+ 
+ #include <netinet/ip.h>
+-#include <netinet/in.h>
+ #include <netinet/ip_icmp.h>
+ #include <netinet/tcp.h>
+ #include <netinet/udp.h>
+diff --git a/include/linux/if_bridge.h b/include/linux/if_bridge.h
+index b7393dd..a7028ab 100644
+--- a/include/linux/if_bridge.h
++++ b/include/linux/if_bridge.h
+@@ -15,7 +15,6 @@
+ 
+ #include <linux/types.h>
+ #include <linux/if_ether.h>
+-#include <linux/in6.h>
+ 
+ #define SYSFS_BRIDGE_ATTR	"bridge"
+ #define SYSFS_BRIDGE_FDB	"brforward"
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
+diff --git a/include/linux/netfilter.h b/include/linux/netfilter.h
+index b71b4c9..3e4e6ae 100644
+--- a/include/linux/netfilter.h
++++ b/include/linux/netfilter.h
+@@ -4,8 +4,6 @@
+ #include <linux/types.h>
+ 
+ #include <linux/sysctl.h>
+-#include <linux/in.h>
+-#include <linux/in6.h>
+ 
+ /* Responses from hook functions. */
+ #define NF_DROP 0
+diff --git a/include/linux/netfilter_ipv4/ip_tables.h b/include/linux/netfilter_ipv4/ip_tables.h
+index 456fb86..38542b4 100644
+--- a/include/linux/netfilter_ipv4/ip_tables.h
++++ b/include/linux/netfilter_ipv4/ip_tables.h
+@@ -17,7 +17,6 @@
+ 
+ #include <linux/types.h>
+ 
+-#include <linux/if.h>
+ #include <linux/netfilter_ipv4.h>
+ 
+ #include <linux/netfilter/x_tables.h>
+diff --git a/include/linux/xfrm.h b/include/linux/xfrm.h
+index d2dd1fd..8c72966 100644
+--- a/include/linux/xfrm.h
++++ b/include/linux/xfrm.h
+@@ -1,7 +1,6 @@
+ #ifndef _LINUX_XFRM_H
+ #define _LINUX_XFRM_H
+ 
+-#include <linux/in6.h>
+ #include <linux/types.h>
+ 
+ /* All of the structures in this file may not change size as they are
+diff --git a/include/utils.h b/include/utils.h
+index 1b4f939..d10840b 100644
+--- a/include/utils.h
++++ b/include/utils.h
+@@ -1,6 +1,7 @@
+ #ifndef __UTILS_H__
+ #define __UTILS_H__ 1
+ 
++#include <sys/param.h>  /* MAXPATHLEN */
+ #include <sys/types.h>
+ #include <asm/types.h>
+ #include <resolv.h>
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
similarity index 61%
rename from meta/recipes-connectivity/iproute2/iproute2_4.7.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_4.9.0.bb
index 426f989..808e550 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_4.7.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_4.9.0.bb
@@ -3,10 +3,11 @@ require iproute2.inc
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://configure-cross.patch \
            file://0001-iproute2-de-bash-scripts.patch \
-           file://iproute2-4.3.0-musl.patch \
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




