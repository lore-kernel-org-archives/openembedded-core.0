Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id 75A5073D46
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 10:19:29 +0000 (UTC)
Received: by mail-qk0-f181.google.com with SMTP id q19so143325897qke.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 02:19:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=srjlpHsFz4vs5UX/XIyO2+vd/w8BmLoySFEM15XdgY8=;
	b=MIEPHUKUqpHOQ1hwrcEfddLBEJEM2SJ3xRH6GVcBsq0tr+k+H8sQovDK+8Mg9N1pKX
	WiJgBydK+obQbdfqikegm2wYu6agOkLHXSo+2OgFtVgnEBhT6pzIOH+9ZWabsTaA+LmD
	ucB3vJp4pQKam8OdiT3NUk1rDvRz2q/UJR26+2Xf9uYHedKUsprTKqpQsSohevG+o8b6
	wcAxfB3xGX5Ia0MKEEgVaCuQq2yCmPRHj2QxYDSyoJB9ga8UCSsWNmKpufkTvH/7/byR
	9+OrEr556sw1YZWl8ATMCuj5OcXfg4v4uGKYjICr6YkoT13yEgG/UYI3CJv0ZjT1+QHR
	50yQ==
X-Received: by 10.55.41.66 with SMTP id p63mr13980972qkh.69.1452248369911;
	Fri, 08 Jan 2016 02:19:29 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	d129sm48549987qka.31.2016.01.08.02.19.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 Jan 2016 02:19:29 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jan 2016 10:18:32 +0000
Message-Id: <d675b5517057948e2d69f93b0b4456938c4e6d1b.1452248145.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
References: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
In-Reply-To: <cover.1452248145.git.raj.khem@gmail.com>
References: <cover.1452248145.git.raj.khem@gmail.com>
Subject: [PATCH 04/53] ppp: Fix build with musl
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
X-List-Received-Date: Fri, 08 Jan 2016 10:19:29 -0000

Therer are assumptions about glibc headers and features which needs to
be addressed for musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../ppp/ppp/0001-Fix-build-with-musl.patch         | 163 +++++++++++++++++++++
 meta/recipes-connectivity/ppp/ppp_2.4.7.bb         |   3 +
 2 files changed, 166 insertions(+)
 create mode 100644 meta/recipes-connectivity/ppp/ppp/0001-Fix-build-with-musl.patch

diff --git a/meta/recipes-connectivity/ppp/ppp/0001-Fix-build-with-musl.patch b/meta/recipes-connectivity/ppp/ppp/0001-Fix-build-with-musl.patch
new file mode 100644
index 0000000..763e374
--- /dev/null
+++ b/meta/recipes-connectivity/ppp/ppp/0001-Fix-build-with-musl.patch
@@ -0,0 +1,163 @@
+From 52a1e41d7541b2c936285844c59bd1be21797860 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 29 May 2015 14:57:05 -0700
+Subject: [PATCH] Fix build with musl
+
+There are several assumption about glibc
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ include/net/ppp_defs.h                  | 2 ++
+ pppd/Makefile.linux                     | 2 +-
+ pppd/magic.h                            | 6 +++---
+ pppd/plugins/rp-pppoe/config.h          | 5 ++++-
+ pppd/plugins/rp-pppoe/plugin.c          | 1 -
+ pppd/plugins/rp-pppoe/pppoe-discovery.c | 8 ++++----
+ pppd/plugins/rp-pppoe/pppoe.h           | 2 +-
+ pppd/sys-linux.c                        | 3 ++-
+ 8 files changed, 17 insertions(+), 12 deletions(-)
+
+diff --git a/include/net/ppp_defs.h b/include/net/ppp_defs.h
+index b06eda5..dafa36c 100644
+--- a/include/net/ppp_defs.h
++++ b/include/net/ppp_defs.h
+@@ -38,6 +38,8 @@
+ #ifndef _PPP_DEFS_H_
+ #define _PPP_DEFS_H_
+ 
++#include <sys/time.h>
++
+ /*
+  * The basic PPP frame.
+  */
+diff --git a/pppd/Makefile.linux b/pppd/Makefile.linux
+index 8ab2102..d7e2564 100644
+--- a/pppd/Makefile.linux
++++ b/pppd/Makefile.linux
+@@ -126,7 +126,7 @@ LIBS	+= -lcrypt
+ #endif
+ 
+ ifdef USE_LIBUTIL
+-CFLAGS	+= -DHAVE_LOGWTMP=1
++#CFLAGS	+= -DHAVE_LOGWTMP=1
+ LIBS	+= -lutil
+ endif
+ 
+diff --git a/pppd/magic.h b/pppd/magic.h
+index c81213b..9d399e3 100644
+--- a/pppd/magic.h
++++ b/pppd/magic.h
+@@ -42,8 +42,8 @@
+  * $Id: magic.h,v 1.5 2003/06/11 23:56:26 paulus Exp $
+  */
+ 
+-void magic_init __P((void));	/* Initialize the magic number generator */
+-u_int32_t magic __P((void));	/* Returns the next magic number */
++void magic_init (void);	/* Initialize the magic number generator */
++u_int32_t magic (void);	/* Returns the next magic number */
+ 
+ /* Fill buffer with random bytes */
+-void random_bytes __P((unsigned char *buf, int len));
++void random_bytes (unsigned char *buf, int len);
+diff --git a/pppd/plugins/rp-pppoe/config.h b/pppd/plugins/rp-pppoe/config.h
+index 5703087..fff032e 100644
+--- a/pppd/plugins/rp-pppoe/config.h
++++ b/pppd/plugins/rp-pppoe/config.h
+@@ -78,8 +78,9 @@
+ #define HAVE_NET_IF_ARP_H 1
+ 
+ /* Define if you have the <net/ethernet.h> header file.  */
++#ifdef __GLIBC__
+ #define HAVE_NET_ETHERNET_H 1
+-
++#endif
+ /* Define if you have the <net/if.h> header file.  */
+ #define HAVE_NET_IF_H 1
+ 
+@@ -102,7 +103,9 @@
+ #define HAVE_NETPACKET_PACKET_H 1
+ 
+ /* Define if you have the <sys/cdefs.h> header file.  */
++#ifdef __GLIBC__
+ #define HAVE_SYS_CDEFS_H 1
++#endif
+ 
+ /* Define if you have the <sys/dlpi.h> header file.  */
+ /* #undef HAVE_SYS_DLPI_H */
+diff --git a/pppd/plugins/rp-pppoe/plugin.c b/pppd/plugins/rp-pppoe/plugin.c
+index a8c2bb4..ca34d79 100644
+--- a/pppd/plugins/rp-pppoe/plugin.c
++++ b/pppd/plugins/rp-pppoe/plugin.c
+@@ -46,7 +46,6 @@ static char const RCSID[] =
+ #include <unistd.h>
+ #include <fcntl.h>
+ #include <signal.h>
+-#include <net/ethernet.h>
+ #include <net/if_arp.h>
+ #include <linux/ppp_defs.h>
+ #include <linux/if_pppox.h>
+diff --git a/pppd/plugins/rp-pppoe/pppoe-discovery.c b/pppd/plugins/rp-pppoe/pppoe-discovery.c
+index 3d3bf4e..d42f619 100644
+--- a/pppd/plugins/rp-pppoe/pppoe-discovery.c
++++ b/pppd/plugins/rp-pppoe/pppoe-discovery.c
+@@ -27,10 +27,6 @@
+ #include <linux/if_packet.h>
+ #endif
+ 
+-#ifdef HAVE_NET_ETHERNET_H
+-#include <net/ethernet.h>
+-#endif
+-
+ #ifdef HAVE_ASM_TYPES_H
+ #include <asm/types.h>
+ #endif
+@@ -47,6 +43,10 @@
+ #include <net/if_arp.h>
+ #endif
+ 
++#ifndef __GLIBC__
++#define error(x...) fprintf(stderr, x)
++#endif
++
+ char *xstrdup(const char *s);
+ void usage(void);
+ 
+diff --git a/pppd/plugins/rp-pppoe/pppoe.h b/pppd/plugins/rp-pppoe/pppoe.h
+index 9ab2eee..75b9004 100644
+--- a/pppd/plugins/rp-pppoe/pppoe.h
++++ b/pppd/plugins/rp-pppoe/pppoe.h
+@@ -92,7 +92,7 @@ typedef unsigned long UINT32_t;
+ #ifdef HAVE_SYS_SOCKET_H
+ #include <sys/socket.h>
+ #endif
+-#ifndef HAVE_SYS_DLPI_H
++#if !defined HAVE_SYS_DLPI_H && defined HAVE_NET_ETHERNET_H
+ #include <netinet/if_ether.h>
+ #endif
+ #endif
+diff --git a/pppd/sys-linux.c b/pppd/sys-linux.c
+index a105505..49b0273 100644
+--- a/pppd/sys-linux.c
++++ b/pppd/sys-linux.c
+@@ -112,7 +112,7 @@
+ #include <linux/types.h>
+ #include <linux/if.h>
+ #include <linux/if_arp.h>
+-#include <linux/route.h>
++/* #include <linux/route.h> */
+ #include <linux/if_ether.h>
+ #endif
+ #include <netinet/in.h>
+@@ -145,6 +145,7 @@
+ #endif
+ 
+ #ifdef INET6
++#include <net/route.h>
+ #ifndef _LINUX_IN6_H
+ /*
+  *    This is in linux/include/net/ipv6.h.
+-- 
+2.1.4
+
diff --git a/meta/recipes-connectivity/ppp/ppp_2.4.7.bb b/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
index 5f06034..4437b5c 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
@@ -32,6 +32,9 @@ SRC_URI = "http://ppp.samba.org/ftp/ppp/ppp-${PV}.tar.gz \
            file://fix-CVE-2015-3310.patch \
 "
 
+SRC_URI_append_libc-musl = "\
+           file://0001-Fix-build-with-musl.patch \
+"
 SRC_URI[md5sum] = "78818f40e6d33a1d1de68a1551f6595a"
 SRC_URI[sha256sum] = "02e0a3dd3e4799e33103f70ec7df75348c8540966ee7c948e4ed8a42bbccfb30"
 
-- 
2.7.0


