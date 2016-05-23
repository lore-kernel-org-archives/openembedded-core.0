Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D6BDF6FF73
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2016 15:39:24 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 23 May 2016 08:39:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,356,1459839600"; d="scan'208";a="960557544"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 23 May 2016 08:39:22 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 709B36A4006
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2016 09:26:50 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 May 2016 18:39:55 +0300
Message-Id: <1464017996-18497-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH 1/2] iproute2: upgrade to 4.6.0
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
X-List-Received-Date: Mon, 23 May 2016 15:39:25 -0000

1. Refreshed musl build fix patch for 4.6.0
2. Use the bash-completion class to package the completion files.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-connectivity/iproute2/iproute2.inc    |  2 +-
 .../iproute2/iproute2/iproute2-4.3.0-musl.patch    | 45 ++++++++++++++--------
 .../{iproute2_4.5.0.bb => iproute2_4.6.0.bb}       |  4 +-
 3 files changed, 31 insertions(+), 20 deletions(-)
 rename meta/recipes-connectivity/iproute2/{iproute2_4.5.0.bb => iproute2_4.6.0.bb} (71%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2.inc b/meta/recipes-connectivity/iproute2/iproute2.inc
index 86e9310..63e7ca9 100644
--- a/meta/recipes-connectivity/iproute2/iproute2.inc
+++ b/meta/recipes-connectivity/iproute2/iproute2.inc
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
 
 DEPENDS = "flex-native bison-native iptables elfutils"
 
-inherit update-alternatives
+inherit update-alternatives bash-completion
 
 EXTRA_OEMAKE = "CC='${CC}' KERNEL_INCLUDE=${STAGING_INCDIR} DOCDIR=${docdir}/iproute2 SUBDIRS='lib tc ip bridge misc genl' SBINDIR='${base_sbindir}' LIBDIR='${libdir}'"
 
diff --git a/meta/recipes-connectivity/iproute2/iproute2/iproute2-4.3.0-musl.patch b/meta/recipes-connectivity/iproute2/iproute2/iproute2-4.3.0-musl.patch
index bbe0242..8c078f6 100644
--- a/meta/recipes-connectivity/iproute2/iproute2/iproute2-4.3.0-musl.patch
+++ b/meta/recipes-connectivity/iproute2/iproute2/iproute2-4.3.0-musl.patch
@@ -9,16 +9,16 @@ In order to fix this, use just the C library header <netinet/in.h>.
 Original patch taken from
 http://git.alpinelinux.org/cgit/aports/tree/main/iproute2/musl-fixes.patch.
 
-(Refreshed the patch for 4.5 release)
+(Refreshed the patch for 4.6 release)
 
 Upstream-Status: Pending
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Maxin B. John <maxin.john@intel.com>
----
-diff -Naur iproute2-4.5.0-orig/include/libiptc/ipt_kernel_headers.h iproute2-4.5.0/include/libiptc/ipt_kernel_headers.h
---- iproute2-4.5.0-orig/include/libiptc/ipt_kernel_headers.h	2016-03-15 01:02:31.000000000 +0200
-+++ iproute2-4.5.0/include/libiptc/ipt_kernel_headers.h	2016-03-23 18:33:38.579062567 +0200
+----
+diff -Naur iproute2-4.6.0-orig/include/libiptc/ipt_kernel_headers.h iproute2-4.6.0/include/libiptc/ipt_kernel_headers.h
+--- iproute2-4.6.0-orig/include/libiptc/ipt_kernel_headers.h	2016-05-23 12:03:23.821826910 +0300
++++ iproute2-4.6.0/include/libiptc/ipt_kernel_headers.h	2016-05-23 12:04:23.714078154 +0300
 @@ -6,7 +6,6 @@
  #include <limits.h>
  
@@ -27,9 +27,9 @@ diff -Naur iproute2-4.5.0-orig/include/libiptc/ipt_kernel_headers.h iproute2-4.5
  #include <netinet/ip_icmp.h>
  #include <netinet/tcp.h>
  #include <netinet/udp.h>
-diff -Naur iproute2-4.5.0-orig/include/linux/if_bridge.h iproute2-4.5.0/include/linux/if_bridge.h
---- iproute2-4.5.0-orig/include/linux/if_bridge.h	2016-03-15 01:02:31.000000000 +0200
-+++ iproute2-4.5.0/include/linux/if_bridge.h	2016-03-23 18:33:58.569812648 +0200
+diff -Naur iproute2-4.6.0-orig/include/linux/if_bridge.h iproute2-4.6.0/include/linux/if_bridge.h
+--- iproute2-4.6.0-orig/include/linux/if_bridge.h	2016-05-23 12:03:23.821826910 +0300
++++ iproute2-4.6.0/include/linux/if_bridge.h	2016-05-23 12:04:23.716078129 +0300
 @@ -15,7 +15,6 @@
  
  #include <linux/types.h>
@@ -38,9 +38,9 @@ diff -Naur iproute2-4.5.0-orig/include/linux/if_bridge.h iproute2-4.5.0/include/
  
  #define SYSFS_BRIDGE_ATTR	"bridge"
  #define SYSFS_BRIDGE_FDB	"brforward"
-diff -Naur iproute2-4.5.0-orig/include/linux/netfilter.h iproute2-4.5.0/include/linux/netfilter.h
---- iproute2-4.5.0-orig/include/linux/netfilter.h	2016-03-15 01:02:31.000000000 +0200
-+++ iproute2-4.5.0/include/linux/netfilter.h	2016-03-23 18:34:38.138317974 +0200
+diff -Naur iproute2-4.6.0-orig/include/linux/netfilter.h iproute2-4.6.0/include/linux/netfilter.h
+--- iproute2-4.6.0-orig/include/linux/netfilter.h	2016-05-23 12:03:23.821826910 +0300
++++ iproute2-4.6.0/include/linux/netfilter.h	2016-05-23 12:04:23.717078117 +0300
 @@ -4,8 +4,6 @@
  #include <linux/types.h>
  
@@ -50,9 +50,20 @@ diff -Naur iproute2-4.5.0-orig/include/linux/netfilter.h iproute2-4.5.0/include/
  
  /* Responses from hook functions. */
  #define NF_DROP 0
-diff -Naur iproute2-4.5.0-orig/include/linux/xfrm.h iproute2-4.5.0/include/linux/xfrm.h
---- iproute2-4.5.0-orig/include/linux/xfrm.h	2016-03-15 01:02:31.000000000 +0200
-+++ iproute2-4.5.0/include/linux/xfrm.h	2016-03-23 18:34:57.539075431 +0200
+diff -Naur iproute2-4.6.0-orig/include/linux/netfilter_ipv4/ip_tables.h iproute2-4.6.0/include/linux/netfilter_ipv4/ip_tables.h
+--- iproute2-4.6.0-orig/include/linux/netfilter_ipv4/ip_tables.h	2016-05-18 21:56:02.000000000 +0300
++++ iproute2-4.6.0/include/linux/netfilter_ipv4/ip_tables.h	2016-05-23 12:09:22.888337961 +0300
+@@ -17,7 +17,6 @@
+ 
+ #include <linux/types.h>
+ 
+-#include <linux/if.h>
+ #include <linux/netfilter_ipv4.h>
+ 
+ #include <linux/netfilter/x_tables.h>
+diff -Naur iproute2-4.6.0-orig/include/linux/xfrm.h iproute2-4.6.0/include/linux/xfrm.h
+--- iproute2-4.6.0-orig/include/linux/xfrm.h	2016-05-23 12:03:23.821826910 +0300
++++ iproute2-4.6.0/include/linux/xfrm.h	2016-05-23 12:04:23.718078104 +0300
 @@ -1,7 +1,6 @@
  #ifndef _LINUX_XFRM_H
  #define _LINUX_XFRM_H
@@ -61,9 +72,9 @@ diff -Naur iproute2-4.5.0-orig/include/linux/xfrm.h iproute2-4.5.0/include/linux
  #include <linux/types.h>
  
  /* All of the structures in this file may not change size as they are
-diff -Naur iproute2-4.5.0-orig/include/utils.h iproute2-4.5.0/include/utils.h
---- iproute2-4.5.0-orig/include/utils.h	2016-03-15 01:02:31.000000000 +0200
-+++ iproute2-4.5.0/include/utils.h	2016-03-23 18:35:50.066418749 +0200
+diff -Naur iproute2-4.6.0-orig/include/utils.h iproute2-4.6.0/include/utils.h
+--- iproute2-4.6.0-orig/include/utils.h	2016-05-23 12:03:23.821826910 +0300
++++ iproute2-4.6.0/include/utils.h	2016-05-23 12:04:23.718078104 +0300
 @@ -1,6 +1,7 @@
  #ifndef __UTILS_H__
  #define __UTILS_H__ 1
diff --git a/meta/recipes-connectivity/iproute2/iproute2_4.5.0.bb b/meta/recipes-connectivity/iproute2/iproute2_4.6.0.bb
similarity index 71%
rename from meta/recipes-connectivity/iproute2/iproute2_4.5.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_4.6.0.bb
index c047446..4971937 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_4.5.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_4.6.0.bb
@@ -5,8 +5,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://0001-iproute2-de-bash-scripts.patch \
            file://iproute2-4.3.0-musl.patch \
           "
-SRC_URI[md5sum] = "b9ee1cbba7e20e04dfdd4b3055181955"
-SRC_URI[sha256sum] = "3f15292f53e465cb5bd6652961343ca64eb6936309ae75be5d5a541435bc494a"
+SRC_URI[md5sum] = "d015e437e4f744d51d3a1a53341826d5"
+SRC_URI[sha256sum] = "74fc6a8ad085be095a159f8158bbaf385b42af9e101619f233f1ae466829d406"
 
 # CFLAGS are computed in Makefile and reference CCOPTS
 #
-- 
2.4.0


