Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 5BB7B73174
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 May 2016 14:50:02 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 03 May 2016 07:50:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,572,1455004800"; d="scan'208";a="797794813"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 03 May 2016 07:50:03 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id C14656A4006
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 May 2016 08:37:37 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 May 2016 17:49:49 +0300
Message-Id: <1462286989-22848-11-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1462286989-22848-1-git-send-email-maxin.john@intel.com>
References: <1462286989-22848-1-git-send-email-maxin.john@intel.com>
MIME-Version: 1.0
Subject: [PATCH 10/10] iproute2: upgrade to version 4.5.0
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
X-List-Received-Date: Tue, 03 May 2016 14:50:02 -0000
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

4.4.0 -> 4.5.0

Refreshed iproute2 musl build fix patch for 4.5.0
Remove backported patch:
        iproute2-fix-building-with-musl.patch

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../iproute2/iproute2/iproute2-4.3.0-musl.patch    | 97 +++++++++-------------
 .../iproute2/iproute2-fix-building-with-musl.patch | 24 ------
 .../iproute2/iproute2_4.4.0.bb                     | 14 ----
 .../iproute2/iproute2_4.5.0.bb                     | 13 +++
 4 files changed, 50 insertions(+), 98 deletions(-)
 delete mode 100644 meta/recipes-connectivity/iproute2/iproute2/iproute2-fix-building-with-musl.patch
 delete mode 100644 meta/recipes-connectivity/iproute2/iproute2_4.4.0.bb
 create mode 100644 meta/recipes-connectivity/iproute2/iproute2_4.5.0.bb

diff --git a/meta/recipes-connectivity/iproute2/iproute2/iproute2-4.3.0-musl.patch b/meta/recipes-connectivity/iproute2/iproute2/iproute2-4.3.0-musl.patch
index 1b415a5..bbe0242 100644
--- a/meta/recipes-connectivity/iproute2/iproute2/iproute2-4.3.0-musl.patch
+++ b/meta/recipes-connectivity/iproute2/iproute2/iproute2-4.3.0-musl.patch
@@ -1,64 +1,35 @@
-From 48596709d8ab59727b79a5c6db33ebb251c36543 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Thu, 19 Nov 2015 17:44:25 +0100
 Subject: [PATCH] Avoid in6_addr redefinition
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
 
 Due to both <netinet/in.h> and <linux/in6.h> being included, the
 in6_addr is being redefined: once from the C library headers and once
 from the kernel headers. This causes some build failures with for
-example the musl C library:
-
-In file included from ../include/linux/xfrm.h:4:0,
-                 from xfrm.h:29,
-                 from ipxfrm.c:39:
-../include/linux/in6.h:32:8: error: redefinition of ‘struct in6_addr’
- struct in6_addr {
-        ^
-In file included from .../output/host/usr/x86_64-buildroot-linux-musl/sysroot/usr/include/netdb.h:9:0,
-                 from ipxfrm.c:34:
-.../output/host/usr/x86_64-buildroot-linux-musl/sysroot/usr/include/netinet/in.h:24:8: note: originally defined here
- struct in6_addr
-        ^
+example the musl C library.
 
 In order to fix this, use just the C library header <netinet/in.h>.
-
 Original patch taken from
 http://git.alpinelinux.org/cgit/aports/tree/main/iproute2/musl-fixes.patch.
 
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
-Upstream-Status: Pending
+(Refreshed the patch for 4.5 release)
 
- include/libiptc/ipt_kernel_headers.h | 2 --
- include/linux/if_bridge.h            | 1 -
- include/linux/netfilter.h            | 2 --
- include/linux/xfrm.h                 | 1 -
- 4 files changed, 6 deletions(-)
+Upstream-Status: Pending
 
-diff --git a/include/libiptc/ipt_kernel_headers.h b/include/libiptc/ipt_kernel_headers.h
-index 7e87828..9566be5 100644
---- a/include/libiptc/ipt_kernel_headers.h
-+++ b/include/libiptc/ipt_kernel_headers.h
-@@ -15,12 +15,10 @@
- #else /* libc5 */
- #include <sys/socket.h>
- #include <linux/ip.h>
--#include <linux/in.h>
- #include <linux/if.h>
- #include <linux/icmp.h>
- #include <linux/tcp.h>
- #include <linux/udp.h>
- #include <linux/types.h>
--#include <linux/in6.h>
- #endif
- #endif
-diff --git a/include/linux/if_bridge.h b/include/linux/if_bridge.h
-index ee197a3..f823aa4 100644
---- a/include/linux/if_bridge.h
-+++ b/include/linux/if_bridge.h
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: Maxin B. John <maxin.john@intel.com>
+---
+diff -Naur iproute2-4.5.0-orig/include/libiptc/ipt_kernel_headers.h iproute2-4.5.0/include/libiptc/ipt_kernel_headers.h
+--- iproute2-4.5.0-orig/include/libiptc/ipt_kernel_headers.h	2016-03-15 01:02:31.000000000 +0200
++++ iproute2-4.5.0/include/libiptc/ipt_kernel_headers.h	2016-03-23 18:33:38.579062567 +0200
+@@ -6,7 +6,6 @@
+ #include <limits.h>
+ 
+ #include <netinet/ip.h>
+-#include <netinet/in.h>
+ #include <netinet/ip_icmp.h>
+ #include <netinet/tcp.h>
+ #include <netinet/udp.h>
+diff -Naur iproute2-4.5.0-orig/include/linux/if_bridge.h iproute2-4.5.0/include/linux/if_bridge.h
+--- iproute2-4.5.0-orig/include/linux/if_bridge.h	2016-03-15 01:02:31.000000000 +0200
++++ iproute2-4.5.0/include/linux/if_bridge.h	2016-03-23 18:33:58.569812648 +0200
 @@ -15,7 +15,6 @@
  
  #include <linux/types.h>
@@ -67,10 +38,9 @@ index ee197a3..f823aa4 100644
  
  #define SYSFS_BRIDGE_ATTR	"bridge"
  #define SYSFS_BRIDGE_FDB	"brforward"
-diff --git a/include/linux/netfilter.h b/include/linux/netfilter.h
-index b71b4c9..3e4e6ae 100644
---- a/include/linux/netfilter.h
-+++ b/include/linux/netfilter.h
+diff -Naur iproute2-4.5.0-orig/include/linux/netfilter.h iproute2-4.5.0/include/linux/netfilter.h
+--- iproute2-4.5.0-orig/include/linux/netfilter.h	2016-03-15 01:02:31.000000000 +0200
++++ iproute2-4.5.0/include/linux/netfilter.h	2016-03-23 18:34:38.138317974 +0200
 @@ -4,8 +4,6 @@
  #include <linux/types.h>
  
@@ -80,10 +50,9 @@ index b71b4c9..3e4e6ae 100644
  
  /* Responses from hook functions. */
  #define NF_DROP 0
-diff --git a/include/linux/xfrm.h b/include/linux/xfrm.h
-index b8f5451..a9761a5 100644
---- a/include/linux/xfrm.h
-+++ b/include/linux/xfrm.h
+diff -Naur iproute2-4.5.0-orig/include/linux/xfrm.h iproute2-4.5.0/include/linux/xfrm.h
+--- iproute2-4.5.0-orig/include/linux/xfrm.h	2016-03-15 01:02:31.000000000 +0200
++++ iproute2-4.5.0/include/linux/xfrm.h	2016-03-23 18:34:57.539075431 +0200
 @@ -1,7 +1,6 @@
  #ifndef _LINUX_XFRM_H
  #define _LINUX_XFRM_H
@@ -92,6 +61,14 @@ index b8f5451..a9761a5 100644
  #include <linux/types.h>
  
  /* All of the structures in this file may not change size as they are
--- 
-2.6.3
-
+diff -Naur iproute2-4.5.0-orig/include/utils.h iproute2-4.5.0/include/utils.h
+--- iproute2-4.5.0-orig/include/utils.h	2016-03-15 01:02:31.000000000 +0200
++++ iproute2-4.5.0/include/utils.h	2016-03-23 18:35:50.066418749 +0200
+@@ -1,6 +1,7 @@
+ #ifndef __UTILS_H__
+ #define __UTILS_H__ 1
+ 
++#include <sys/param.h>  /* MAXPATHLEN */
+ #include <sys/types.h>
+ #include <asm/types.h>
+ #include <resolv.h>
diff --git a/meta/recipes-connectivity/iproute2/iproute2/iproute2-fix-building-with-musl.patch b/meta/recipes-connectivity/iproute2/iproute2/iproute2-fix-building-with-musl.patch
deleted file mode 100644
index c83a243..0000000
--- a/meta/recipes-connectivity/iproute2/iproute2/iproute2-fix-building-with-musl.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-iproute2: fix building with musl
-
-We need limits.h for PATH_MAX, fixes:
-
-rt_names.c:364:13: error: ‘PATH_MAX’ undeclared (first use in this
-function)
-
-Upstream-Status: Backport
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Signed-off-by: Maxin B. John <maxin.john@intel.com>
----
-diff --git a/lib/rt_names.c b/lib/rt_names.c
-index f6d17c0..b665d3e 100644
---- a/lib/rt_names.c
-+++ b/lib/rt_names.c
-@@ -18,6 +18,7 @@
- #include <sys/time.h>
- #include <sys/socket.h>
- #include <dirent.h>
-+#include <limits.h>
- 
- #include <asm/types.h>
- #include <linux/rtnetlink.h>
diff --git a/meta/recipes-connectivity/iproute2/iproute2_4.4.0.bb b/meta/recipes-connectivity/iproute2/iproute2_4.4.0.bb
deleted file mode 100644
index 7979e8b..0000000
--- a/meta/recipes-connectivity/iproute2/iproute2_4.4.0.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-require iproute2.inc
-
-SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
-           file://configure-cross.patch \
-           file://0001-iproute2-de-bash-scripts.patch \
-           file://iproute2-4.3.0-musl.patch \
-           file://iproute2-fix-building-with-musl.patch \
-          "
-SRC_URI[md5sum] = "d762653ec3e1ab0d4a9689e169ca184f"
-SRC_URI[sha256sum] = "bc91c367288a19f78ef800cd6840363be1f22da8436fbae88e1a7250490d6514"
-
-# CFLAGS are computed in Makefile and reference CCOPTS
-#
-EXTRA_OEMAKE_append = " CCOPTS='${CFLAGS}'"
diff --git a/meta/recipes-connectivity/iproute2/iproute2_4.5.0.bb b/meta/recipes-connectivity/iproute2/iproute2_4.5.0.bb
new file mode 100644
index 0000000..c047446
--- /dev/null
+++ b/meta/recipes-connectivity/iproute2/iproute2_4.5.0.bb
@@ -0,0 +1,13 @@
+require iproute2.inc
+
+SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
+           file://configure-cross.patch \
+           file://0001-iproute2-de-bash-scripts.patch \
+           file://iproute2-4.3.0-musl.patch \
+          "
+SRC_URI[md5sum] = "b9ee1cbba7e20e04dfdd4b3055181955"
+SRC_URI[sha256sum] = "3f15292f53e465cb5bd6652961343ca64eb6936309ae75be5d5a541435bc494a"
+
+# CFLAGS are computed in Makefile and reference CCOPTS
+#
+EXTRA_OEMAKE_append = " CCOPTS='${CFLAGS}'"
-- 
2.4.0


