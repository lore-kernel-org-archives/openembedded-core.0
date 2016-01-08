Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id 5CE1C731FE
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 10:19:32 +0000 (UTC)
Received: by mail-qk0-f173.google.com with SMTP id q19so143326339qke.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 02:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=xEG91cAfwrj159UOyRPg+7Lmtw4TIiy/r+Of09o34kc=;
	b=kogW96hfi1N+J9JQnqYhRZ84IAXJ/tkrpIhNu6pmAzUBSEqaanR5JBCfjjzUoANMHW
	tag48jnE6F9/9koSX7AcUNk8zKafgjPZxiGP6P6Semv2xevmYAbci0aeK06HVOAbant5
	GsHU0dFZ8+YK4tu1o3FlxcD/GwY/QYlc1E6x154S2c9fx40/w314vWeMvZAFtXHQserH
	+FffBKIcWemCOOs7tVL5vPjot80EagWsUxNE2qMarDCIA/LqfhlwV9PJvTlft5r1yz9c
	YHEjDHoVzYEbGOIZVB4o5xAGU2BosM7spWnA9LAcwRzXNnEMGJEQaJ9hm4lx1l8uHZCJ
	toMA==
X-Received: by 10.55.215.20 with SMTP id m20mr12333652qki.100.1452248373643;
	Fri, 08 Jan 2016 02:19:33 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	d129sm48549987qka.31.2016.01.08.02.19.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 Jan 2016 02:19:33 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jan 2016 10:18:37 +0000
Message-Id: <95082fd2f80223697ed31434107dfdeda74252c4.1452248145.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
References: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
In-Reply-To: <cover.1452248145.git.raj.khem@gmail.com>
References: <cover.1452248145.git.raj.khem@gmail.com>
Subject: [PATCH 09/53] linux-libc-headers: Port patches for linux-headers for musl
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
X-List-Received-Date: Fri, 08 Jan 2016 10:19:33 -0000

These patches have revealed issues with linux kernel headers which has
been proposed upstream but hasnt been applied yet

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...mpat.h-fix-some-issues-arising-from-in6.h.patch | 82 ++++++++++++++++++++++
 ...t.h-prevent-redefinition-of-struct-ethhdr.patch | 59 ++++++++++++++++
 ...remove-inclusion-of-sysinfo.h-in-kernel.h.patch | 32 +++++++++
 .../linux-libc-headers/linux-libc-headers_4.1.bb   |  5 ++
 4 files changed, 178 insertions(+)
 create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-libc-compat.h-fix-some-issues-arising-from-in6.h.patch
 create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0002-libc-compat.h-prevent-redefinition-of-struct-ethhdr.patch
 create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0003-remove-inclusion-of-sysinfo.h-in-kernel.h.patch

diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-libc-compat.h-fix-some-issues-arising-from-in6.h.patch b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-libc-compat.h-fix-some-issues-arising-from-in6.h.patch
new file mode 100644
index 0000000..3db52cf
--- /dev/null
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-libc-compat.h-fix-some-issues-arising-from-in6.h.patch
@@ -0,0 +1,82 @@
+From 2872f5d8bcef84e62b15b37ba4ffeccfb6402dad Mon Sep 17 00:00:00 2001
+From: rofl0r <retnyg@gmx.net>
+Date: Wed, 22 Jan 2014 00:48:28 +0100
+Subject: [PATCH 1/3] libc-compat.h: fix some issues arising from in6.h
+
+namely redefinition of some structs provided by netinet/in.h.
+---
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Submitted
+
+ include/uapi/linux/libc-compat.h | 25 ++++++++-----------------
+ 1 file changed, 8 insertions(+), 17 deletions(-)
+
+diff --git a/include/uapi/linux/libc-compat.h b/include/uapi/linux/libc-compat.h
+index fa673e9..afe15c2 100644
+--- a/include/uapi/linux/libc-compat.h
++++ b/include/uapi/linux/libc-compat.h
+@@ -48,24 +48,15 @@
+ #ifndef _UAPI_LIBC_COMPAT_H
+ #define _UAPI_LIBC_COMPAT_H
+ 
+-/* We have included glibc headers... */
+-#if defined(__GLIBC__)
++#ifndef __KERNEL__ /* we're used from userspace */
+ 
+-/* Coordinate with glibc netinet/in.h header. */
++/* Coordinate with libc netinet/in.h header. */
+ #if defined(_NETINET_IN_H)
+ 
+-/* GLIBC headers included first so don't define anything
++/* libc headers included first so don't define anything
+  * that would already be defined. */
+ #define __UAPI_DEF_IN6_ADDR		0
+-/* The exception is the in6_addr macros which must be defined
+- * if the glibc code didn't define them. This guard matches
+- * the guard in glibc/inet/netinet/in.h which defines the
+- * additional in6_addr macros e.g. s6_addr16, and s6_addr32. */
+-#if defined(__USE_MISC) || defined (__USE_GNU)
+ #define __UAPI_DEF_IN6_ADDR_ALT		0
+-#else
+-#define __UAPI_DEF_IN6_ADDR_ALT		1
+-#endif
+ #define __UAPI_DEF_SOCKADDR_IN6		0
+ #define __UAPI_DEF_IPV6_MREQ		0
+ #define __UAPI_DEF_IPPROTO_V6		0
+@@ -73,13 +64,13 @@
+ #define __UAPI_DEF_IN6_PKTINFO		0
+ #define __UAPI_DEF_IP6_MTUINFO		0
+ 
+-#else
++#else /* defined(_NETINET_IN_H) */
+ 
+ /* Linux headers included first, and we must define everything
+- * we need. The expectation is that glibc will check the
++ * we need. The expectation is that the libc will check the
+  * __UAPI_DEF_* defines and adjust appropriately. */
+ #define __UAPI_DEF_IN6_ADDR		1
+-/* We unconditionally define the in6_addr macros and glibc must
++/* We unconditionally define the in6_addr macros and libc must
+  * coordinate. */
+ #define __UAPI_DEF_IN6_ADDR_ALT		1
+ #define __UAPI_DEF_SOCKADDR_IN6		1
+@@ -101,7 +92,7 @@
+ /* If we did not see any headers from any supported C libraries,
+  * or we are being included in the kernel, then define everything
+  * that we need. */
+-#else /* !defined(__GLIBC__) */
++#else /* __KERNEL__ */
+ 
+ /* Definitions for in6.h */
+ #define __UAPI_DEF_IN6_ADDR		1
+@@ -116,6 +107,6 @@
+ /* Definitions for xattr.h */
+ #define __UAPI_DEF_XATTR		1
+ 
+-#endif /* __GLIBC__ */
++#endif /* __KERNEL__ */
+ 
+ #endif /* _UAPI_LIBC_COMPAT_H */
+-- 
+2.6.4
+
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0002-libc-compat.h-prevent-redefinition-of-struct-ethhdr.patch b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0002-libc-compat.h-prevent-redefinition-of-struct-ethhdr.patch
new file mode 100644
index 0000000..c617093
--- /dev/null
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0002-libc-compat.h-prevent-redefinition-of-struct-ethhdr.patch
@@ -0,0 +1,59 @@
+From 75ba4a547282f91d653872a4bba5f5eae234ea6c Mon Sep 17 00:00:00 2001
+From: rofl0r <retnyg@gmx.net>
+Date: Wed, 22 Jan 2014 00:57:48 +0100
+Subject: [PATCH 2/3] libc-compat.h: prevent redefinition of struct ethhdr
+
+---
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Submitted
+
+ include/uapi/linux/if_ether.h    | 4 +++-
+ include/uapi/linux/libc-compat.h | 6 ++++++
+ 2 files changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/include/uapi/linux/if_ether.h b/include/uapi/linux/if_ether.h
+index aa63ed0..e94da57 100644
+--- a/include/uapi/linux/if_ether.h
++++ b/include/uapi/linux/if_ether.h
+@@ -22,6 +22,7 @@
+ #define _UAPI_LINUX_IF_ETHER_H
+ 
+ #include <linux/types.h>
++#include <linux/libc-compat.h>
+ 
+ /*
+  *	IEEE 802.3 Ethernet magic constants.  The frame sizes omit the preamble
+@@ -134,11 +135,12 @@
+  *	This is an Ethernet frame header.
+  */
+ 
++#if __UAPI_DEF_ETHHDR
+ struct ethhdr {
+ 	unsigned char	h_dest[ETH_ALEN];	/* destination eth addr	*/
+ 	unsigned char	h_source[ETH_ALEN];	/* source ether addr	*/
+ 	__be16		h_proto;		/* packet type ID field	*/
+ } __attribute__((packed));
+-
++#endif
+ 
+ #endif /* _UAPI_LINUX_IF_ETHER_H */
+diff --git a/include/uapi/linux/libc-compat.h b/include/uapi/linux/libc-compat.h
+index afe15c2..7d0c78a 100644
+--- a/include/uapi/linux/libc-compat.h
++++ b/include/uapi/linux/libc-compat.h
+@@ -50,6 +50,12 @@
+ 
+ #ifndef __KERNEL__ /* we're used from userspace */
+ 
++#ifdef _NETINET_IF_ETHER_H /* musl */
++#define __UAPI_DEF_ETHHDR 0
++#else /* glibc uses __NETINET_IF_ETHER_H, and includes the kernel header. */
++#define __UAPI_DEF_ETHHDR 1
++#endif
++
+ /* Coordinate with libc netinet/in.h header. */
+ #if defined(_NETINET_IN_H)
+ 
+-- 
+2.6.4
+
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0003-remove-inclusion-of-sysinfo.h-in-kernel.h.patch b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0003-remove-inclusion-of-sysinfo.h-in-kernel.h.patch
new file mode 100644
index 0000000..6d9e8d8
--- /dev/null
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0003-remove-inclusion-of-sysinfo.h-in-kernel.h.patch
@@ -0,0 +1,32 @@
+From 8e69b663d6ddef132041a1186f081fdd74d4a31d Mon Sep 17 00:00:00 2001
+From: rofl0r <retnyg@gmx.net>
+Date: Mon, 20 Jan 2014 21:31:34 +0100
+Subject: [PATCH 3/3] remove inclusion of sysinfo.h in kernel.h
+
+the declaration of struct sysinfo clashes with userspace.
+it's not quite clear why that header was included from kernel.h,
+as none of its functionality is needed.
+---
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Submitted
+
+ include/uapi/linux/kernel.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/include/uapi/linux/kernel.h b/include/uapi/linux/kernel.h
+index 321e399..e8ff821 100644
+--- a/include/uapi/linux/kernel.h
++++ b/include/uapi/linux/kernel.h
+@@ -1,7 +1,9 @@
+ #ifndef _UAPI_LINUX_KERNEL_H
+ #define _UAPI_LINUX_KERNEL_H
+ 
++#ifdef __GLIBC__
+ #include <linux/sysinfo.h>
++#endif
+ 
+ /*
+  * 'kernel.h' contains some often-used function prototypes etc
+-- 
+2.6.4
+
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.1.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.1.bb
index 01037c1..6f2c427 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.1.bb
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.1.bb
@@ -1,4 +1,9 @@
 require linux-libc-headers.inc
 
+SRC_URI_append_libc-musl = "\
+    file://0001-libc-compat.h-fix-some-issues-arising-from-in6.h.patch \
+    file://0002-libc-compat.h-prevent-redefinition-of-struct-ethhdr.patch \
+    file://0003-remove-inclusion-of-sysinfo.h-in-kernel.h.patch \
+   "
 SRC_URI[md5sum] = "fe9dc0f6729f36400ea81aa41d614c37"
 SRC_URI[sha256sum] = "caf51f085aac1e1cea4d00dbbf3093ead07b551fc07b31b2a989c05f8ea72d9f"
-- 
2.7.0


