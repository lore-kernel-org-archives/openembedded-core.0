Return-Path: <maxin.john@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 844AE77507
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2017 16:05:27 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga105.jf.intel.com with ESMTP; 24 Feb 2017 08:05:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,201,1484035200"; d="scan'208";a="828088078"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 24 Feb 2017 08:05:28 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	by linux.intel.com (Postfix) with ESMTP id F02EA6A4080
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2017 08:05:26 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Feb 2017 18:07:07 +0200
Message-Id: <1487952428-22486-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH 1/2] iproute2: upgrade to 4.10.0
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
X-List-Received-Date: Fri, 24 Feb 2017 16:05:27 -0000

4.9.0 -> 4.10.0

added the following patch to fix build with musl libc
 1) 0001-libc-compat.h-add-musl-workaround.patch

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../0001-libc-compat.h-add-musl-workaround.patch   |  41 +++++++
 .../iproute2/iproute2/iproute2-4.9.0-musl.patch    | 131 ---------------------
 .../{iproute2_4.9.0.bb => iproute2_4.10.0.bb}      |   6 +-
 3 files changed, 44 insertions(+), 134 deletions(-)
 create mode 100644 meta/recipes-connectivity/iproute2/iproute2/0001-libc-compat.h-add-musl-workaround.patch
 delete mode 100644 meta/recipes-connectivity/iproute2/iproute2/iproute2-4.9.0-musl.patch
 rename meta/recipes-connectivity/iproute2/{iproute2_4.9.0.bb => iproute2_4.10.0.bb} (59%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2/0001-libc-compat.h-add-musl-workaround.patch b/meta/recipes-connectivity/iproute2/iproute2/0001-libc-compat.h-add-musl-workaround.patch
new file mode 100644
index 0000000..3d324c9
--- /dev/null
+++ b/meta/recipes-connectivity/iproute2/iproute2/0001-libc-compat.h-add-musl-workaround.patch
@@ -0,0 +1,41 @@
+From b7d96340c55afb7023ded0041107c63dbd886196 Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Thu, 22 Dec 2016 15:26:30 +0200
+Subject: [PATCH] libc-compat.h: add musl workaround
+
+The libc-compat.h kernel header uses glibc specific macros (__GLIBC__ and
+__USE_MISC) to solve conflicts with libc provided headers. This patch makes
+libc-compat.h work for musl libc as well.
+
+Upstream-Status: Pending
+
+Taken From:
+https://git.buildroot.net/buildroot/tree/package/iproute2/0001-Add-the-musl-workaround-to-the-libc-compat.h-copy.patch
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+Signed-off-by: Maxin B. John <maxin.john@intel.com>
+---
+ include/linux/libc-compat.h | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/include/linux/libc-compat.h b/include/linux/libc-compat.h
+index f38571d..30f0b67 100644
+--- a/include/linux/libc-compat.h
++++ b/include/linux/libc-compat.h
+@@ -49,10 +49,12 @@
+ #define _LIBC_COMPAT_H
+ 
+ /* We have included glibc headers... */
+-#if defined(__GLIBC__)
++#if 1
++#define __USE_MISC
+ 
+ /* Coordinate with glibc net/if.h header. */
+ #if defined(_NET_IF_H) && defined(__USE_MISC)
++#define __UAPI_DEF_IF_NET_DEVICE_FLAGS_LOWER_UP_DORMANT_ECHO 0
+ 
+ /* GLIBC headers included first so don't define anything
+  * that would already be defined. */
+-- 
+2.4.0
+
diff --git a/meta/recipes-connectivity/iproute2/iproute2/iproute2-4.9.0-musl.patch b/meta/recipes-connectivity/iproute2/iproute2/iproute2-4.9.0-musl.patch
deleted file mode 100644
index 737a90c..0000000
--- a/meta/recipes-connectivity/iproute2/iproute2/iproute2-4.9.0-musl.patch
+++ /dev/null
@@ -1,131 +0,0 @@
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
-(Refreshed the patch for 4.9 release)
-
-Upstream-Status: Pending
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Signed-off-by: Maxin B. John <maxin.john@intel.com>
-Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
----
- include/libiptc/ipt_kernel_headers.h     | 1 -
- include/linux/if_bridge.h                | 1 -
- include/linux/if_tunnel.h                | 2 --
- include/linux/netfilter.h                | 2 --
- include/linux/netfilter_ipv4/ip_tables.h | 1 -
- include/linux/xfrm.h                     | 1 -
- include/utils.h                          | 1 +
- ip/ip6tunnel.c                           | 1 -
- 8 files changed, 1 insertion(+), 9 deletions(-)
-
-diff --git a/include/libiptc/ipt_kernel_headers.h b/include/libiptc/ipt_kernel_headers.h
-index a5963e9..42f8610 100644
---- a/include/libiptc/ipt_kernel_headers.h
-+++ b/include/libiptc/ipt_kernel_headers.h
-@@ -6,7 +6,6 @@
- #include <limits.h>
- 
- #include <netinet/ip.h>
--#include <netinet/in.h>
- #include <netinet/ip_icmp.h>
- #include <netinet/tcp.h>
- #include <netinet/udp.h>
-diff --git a/include/linux/if_bridge.h b/include/linux/if_bridge.h
-index b7393dd..a7028ab 100644
---- a/include/linux/if_bridge.h
-+++ b/include/linux/if_bridge.h
-@@ -15,7 +15,6 @@
- 
- #include <linux/types.h>
- #include <linux/if_ether.h>
--#include <linux/in6.h>
- 
- #define SYSFS_BRIDGE_ATTR	"bridge"
- #define SYSFS_BRIDGE_FDB	"brforward"
-diff --git a/include/linux/if_tunnel.h b/include/linux/if_tunnel.h
-index 4f975f5..2680646 100644
---- a/include/linux/if_tunnel.h
-+++ b/include/linux/if_tunnel.h
-@@ -2,9 +2,7 @@
- #define _IF_TUNNEL_H_
- 
- #include <linux/types.h>
--#include <linux/if.h>
- #include <linux/ip.h>
--#include <linux/in6.h>
- #include <asm/byteorder.h>
- 
- 
-diff --git a/include/linux/netfilter.h b/include/linux/netfilter.h
-index b71b4c9..3e4e6ae 100644
---- a/include/linux/netfilter.h
-+++ b/include/linux/netfilter.h
-@@ -4,8 +4,6 @@
- #include <linux/types.h>
- 
- #include <linux/sysctl.h>
--#include <linux/in.h>
--#include <linux/in6.h>
- 
- /* Responses from hook functions. */
- #define NF_DROP 0
-diff --git a/include/linux/netfilter_ipv4/ip_tables.h b/include/linux/netfilter_ipv4/ip_tables.h
-index 456fb86..38542b4 100644
---- a/include/linux/netfilter_ipv4/ip_tables.h
-+++ b/include/linux/netfilter_ipv4/ip_tables.h
-@@ -17,7 +17,6 @@
- 
- #include <linux/types.h>
- 
--#include <linux/if.h>
- #include <linux/netfilter_ipv4.h>
- 
- #include <linux/netfilter/x_tables.h>
-diff --git a/include/linux/xfrm.h b/include/linux/xfrm.h
-index d2dd1fd..8c72966 100644
---- a/include/linux/xfrm.h
-+++ b/include/linux/xfrm.h
-@@ -1,7 +1,6 @@
- #ifndef _LINUX_XFRM_H
- #define _LINUX_XFRM_H
- 
--#include <linux/in6.h>
- #include <linux/types.h>
- 
- /* All of the structures in this file may not change size as they are
-diff --git a/include/utils.h b/include/utils.h
-index 1b4f939..d10840b 100644
---- a/include/utils.h
-+++ b/include/utils.h
-@@ -1,6 +1,7 @@
- #ifndef __UTILS_H__
- #define __UTILS_H__ 1
- 
-+#include <sys/param.h>  /* MAXPATHLEN */
- #include <sys/types.h>
- #include <asm/types.h>
- #include <resolv.h>
-diff --git a/ip/ip6tunnel.c b/ip/ip6tunnel.c
-index b1c0ae6..8fa4eb2 100644
---- a/ip/ip6tunnel.c
-+++ b/ip/ip6tunnel.c
-@@ -28,7 +28,6 @@
- #include <arpa/inet.h>
- #include <sys/ioctl.h>
- #include <linux/ip.h>
--#include <linux/if.h>
- #include <linux/if_arp.h>
- #include <linux/if_tunnel.h>
- #include <linux/ip6_tunnel.h>
--- 
-2.7.4
-
diff --git a/meta/recipes-connectivity/iproute2/iproute2_4.9.0.bb b/meta/recipes-connectivity/iproute2/iproute2_4.10.0.bb
similarity index 59%
rename from meta/recipes-connectivity/iproute2/iproute2_4.9.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_4.10.0.bb
index 808e550..a050e87 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_4.9.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_4.10.0.bb
@@ -3,11 +3,11 @@ require iproute2.inc
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://configure-cross.patch \
            file://0001-iproute2-de-bash-scripts.patch \
-           file://iproute2-4.9.0-musl.patch \
+           file://0001-libc-compat.h-add-musl-workaround.patch \
           "
 
-SRC_URI[md5sum] = "44a8371a4b2c40e48e4c9f98cbd41391"
-SRC_URI[sha256sum] = "c0f30f043f7767cc1b2cd2197b08d4e9b2392c95823fabe30bbce308c30116c4"
+SRC_URI[md5sum] = "b94a2b0edefaeac124dc8f5d006931b9"
+SRC_URI[sha256sum] = "22b1e1c1fc704ad35837e5a66103739727b8b48ac90b48c13f79b7367ff0a9a8"
 
 # CFLAGS are computed in Makefile and reference CCOPTS
 #
-- 
2.4.0


