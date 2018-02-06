Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4DA9E7857A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Feb 2018 16:22:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w16GM5Kv019752
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 6 Feb 2018 08:22:05 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Tue, 6 Feb 2018 08:22:01 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 6 Feb 2018 11:21:54 -0500
Message-ID: <32a036f83555079dabaa328391c88aa986e638a1.1517931042.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1517931042.git.bruce.ashfield@windriver.com>
References: <cover.1517931042.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/9] linux-libc-headers: update to v4.15
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
X-List-Received-Date: Tue, 06 Feb 2018 16:22:04 -0000
Content-Type: text/plain

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/conf/distro/include/tcmode-default.inc        |  2 +-
 ...mpat.h-fix-some-issues-arising-from-in6.h.patch | 29 ++++++++---------
 ...t.h-prevent-redefinition-of-struct-ethhdr.patch | 36 +++-------------------
 ...aders_4.14.13.bb => linux-libc-headers_4.15.bb} |  4 +--
 4 files changed, 23 insertions(+), 48 deletions(-)
 rename meta/recipes-kernel/linux-libc-headers/{linux-libc-headers_4.14.13.bb => linux-libc-headers_4.15.bb} (71%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 64ffeb5ef74c..2e7243f32c2c 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -27,7 +27,7 @@ SDKGCCVERSION ?= "${GCCVERSION}"
 BINUVERSION ?= "2.29%"
 GDBVERSION ?= "8.0%"
 GLIBCVERSION ?= "2.26%"
-LINUXLIBCVERSION ?= "4.14%"
+LINUXLIBCVERSION ?= "4.15%"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
 PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?= "${GCCVERSION}"
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-libc-compat.h-fix-some-issues-arising-from-in6.h.patch b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-libc-compat.h-fix-some-issues-arising-from-in6.h.patch
index 8bb775ccf74a..a3fa59001d2d 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-libc-compat.h-fix-some-issues-arising-from-in6.h.patch
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-libc-compat.h-fix-some-issues-arising-from-in6.h.patch
@@ -11,11 +11,11 @@ Upstream-Status: Submitted
  include/uapi/linux/libc-compat.h | 25 ++++++++-----------------
  1 file changed, 8 insertions(+), 17 deletions(-)
 
-Index: linux-4.8-rc4/include/uapi/linux/libc-compat.h
+Index: linux-4.15/include/uapi/linux/libc-compat.h
 ===================================================================
---- linux-4.8-rc4.orig/include/uapi/linux/libc-compat.h
-+++ linux-4.8-rc4/include/uapi/linux/libc-compat.h
-@@ -48,13 +48,12 @@
+--- linux-4.15.orig/include/uapi/linux/libc-compat.h	2018-02-05 17:37:44.724314379 -0500
++++ linux-4.15/include/uapi/linux/libc-compat.h	2018-02-05 17:38:02.148913820 -0500
+@@ -49,13 +49,12 @@
  #ifndef _UAPI_LIBC_COMPAT_H
  #define _UAPI_LIBC_COMPAT_H
  
@@ -33,7 +33,7 @@ Index: linux-4.8-rc4/include/uapi/linux/libc-compat.h
   * that would already be defined. */
  
  #define __UAPI_DEF_IF_IFCONF 0
-@@ -98,15 +97,7 @@
+@@ -99,15 +98,7 @@
  #define __UAPI_DEF_IN_CLASS		0
  
  #define __UAPI_DEF_IN6_ADDR		0
@@ -49,7 +49,7 @@ Index: linux-4.8-rc4/include/uapi/linux/libc-compat.h
  #define __UAPI_DEF_SOCKADDR_IN6		0
  #define __UAPI_DEF_IPV6_MREQ		0
  #define __UAPI_DEF_IPPROTO_V6		0
-@@ -114,10 +105,10 @@
+@@ -115,10 +106,10 @@
  #define __UAPI_DEF_IN6_PKTINFO		0
  #define __UAPI_DEF_IP6_MTUINFO		0
  
@@ -62,7 +62,7 @@ Index: linux-4.8-rc4/include/uapi/linux/libc-compat.h
   * __UAPI_DEF_* defines and adjust appropriately. */
  #define __UAPI_DEF_IN_ADDR		1
  #define __UAPI_DEF_IN_IPPROTO		1
-@@ -127,7 +118,7 @@
+@@ -128,7 +119,7 @@
  #define __UAPI_DEF_IN_CLASS		1
  
  #define __UAPI_DEF_IN6_ADDR		1
@@ -71,20 +71,21 @@ Index: linux-4.8-rc4/include/uapi/linux/libc-compat.h
   * coordinate. */
  #define __UAPI_DEF_IN6_ADDR_ALT		1
  #define __UAPI_DEF_SOCKADDR_IN6		1
-@@ -149,7 +140,7 @@
- /* If we did not see any headers from any supported C libraries,
+@@ -170,7 +161,7 @@
   * or we are being included in the kernel, then define everything
-  * that we need. */
+  * that we need. Check for previous __UAPI_* definitions to give
+  * unsupported C libraries a way to opt out of any kernel definition. */
 -#else /* !defined(__GLIBC__) */
 +#else /* __KERNEL__ */
  
  /* Definitions for if.h */
- #define __UAPI_DEF_IF_IFCONF 1
-@@ -182,6 +173,6 @@
- /* Definitions for xattr.h */
+ #ifndef __UAPI_DEF_IF_IFCONF
+@@ -262,7 +253,7 @@
  #define __UAPI_DEF_XATTR		1
+ #endif
  
 -#endif /* __GLIBC__ */
 +#endif /* __KERNEL__ */
  
- #endif /* _UAPI_LIBC_COMPAT_H */
+ /* Definitions for if_ether.h */
+ /* allow libcs like musl to deactivate this, glibc does not implement this. */
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0002-libc-compat.h-prevent-redefinition-of-struct-ethhdr.patch b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0002-libc-compat.h-prevent-redefinition-of-struct-ethhdr.patch
index 8dc1edc33be5..fb7e1de17a6e 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0002-libc-compat.h-prevent-redefinition-of-struct-ethhdr.patch
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0002-libc-compat.h-prevent-redefinition-of-struct-ethhdr.patch
@@ -11,37 +11,11 @@ Upstream-Status: Submitted
  include/uapi/linux/libc-compat.h | 6 ++++++
  2 files changed, 9 insertions(+), 1 deletion(-)
 
-Index: linux-4.8-rc4/include/uapi/linux/if_ether.h
+Index: linux-4.15/include/uapi/linux/libc-compat.h
 ===================================================================
---- linux-4.8-rc4.orig/include/uapi/linux/if_ether.h
-+++ linux-4.8-rc4/include/uapi/linux/if_ether.h
-@@ -22,6 +22,7 @@
- #define _UAPI_LINUX_IF_ETHER_H
- 
- #include <linux/types.h>
-+#include <linux/libc-compat.h>
- 
- /*
-  *	IEEE 802.3 Ethernet magic constants.  The frame sizes omit the preamble
-@@ -138,11 +139,12 @@
-  *	This is an Ethernet frame header.
-  */
- 
-+#if __UAPI_DEF_ETHHDR
- struct ethhdr {
- 	unsigned char	h_dest[ETH_ALEN];	/* destination eth addr	*/
- 	unsigned char	h_source[ETH_ALEN];	/* source ether addr	*/
- 	__be16		h_proto;		/* packet type ID field	*/
- } __attribute__((packed));
--
-+#endif
- 
- #endif /* _UAPI_LINUX_IF_ETHER_H */
-Index: linux-4.8-rc4/include/uapi/linux/libc-compat.h
-===================================================================
---- linux-4.8-rc4.orig/include/uapi/linux/libc-compat.h
-+++ linux-4.8-rc4/include/uapi/linux/libc-compat.h
-@@ -50,6 +50,12 @@
+--- linux-4.15.orig/include/uapi/linux/libc-compat.h	2018-02-05 17:40:42.338370731 -0500
++++ linux-4.15/include/uapi/linux/libc-compat.h	2018-02-05 17:40:42.334370603 -0500
+@@ -51,6 +51,12 @@
  
  #ifndef __KERNEL__ /* we're used from userspace */
  
@@ -52,5 +26,5 @@ Index: linux-4.8-rc4/include/uapi/linux/libc-compat.h
 +#endif
 +
  /* Coordinate with libc net/if.h header. */
- #if defined(_NET_IF_H) && defined(__USE_MISC)
+ #if defined(_NET_IF_H)
  
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.14.13.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.15.bb
similarity index 71%
rename from meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.14.13.bb
rename to meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.15.bb
index 455ad4b15ee3..b511cd118105 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.14.13.bb
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.15.bb
@@ -7,5 +7,5 @@ SRC_URI_append_libc-musl = "\
     file://0001-libc-compat.h-musl-_does_-define-IFF_LOWER_UP-DORMAN.patch \
    "
 
-SRC_URI[md5sum] = "4e8bb562f8fd33d5ef1feb0435ed2b02"
-SRC_URI[sha256sum] = "4ab46d1b5a0f8ef83b80760f89ae4f5c88431b19b3cf79ffa0c66d6b33e45772"
+SRC_URI[md5sum] = "0d701ac1e2a67d47ce7127432df2c32b"
+SRC_URI[sha256sum] = "5a26478906d5005f4f809402e981518d2b8844949199f60c4b6e1f986ca2a769"
-- 
2.5.0


