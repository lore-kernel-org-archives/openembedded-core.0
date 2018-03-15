Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6B53A788CC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2018 14:06:41 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w2FE6UBn018656
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 15 Mar 2018 14:06:32 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1ewT7w-0002Qk-Fh; Thu, 15 Mar 2018 06:41:04 -0700
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Mar 2018 06:40:55 -0700
Message-Id: <1521121262-9269-6-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1521121262-9269-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1521121262-9269-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Virus-Scanned: clamav-milter 0.99.3 at dan
X-Virus-Status: Clean
Cc: Fan Xin <fan.xin@jp.fujitsu.com>
Subject: [pyro][PATCH 06/13] libtirpc: Fix CVE-2017-8779
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
X-List-Received-Date: Thu, 15 Mar 2018 14:06:42 -0000

From: Fan Xin <fan.xin@jp.fujitsu.com>

This vulnerability is also called "rpcbomb".
Backport upstream patch to fix this vulnerability.
CVE: CVE-2017-8779

Signed-off-by: Fan Xin<fan.xin@jp.fujitsu.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../libtirpc/0001-Fix-for-CVE-2017-8779.patch      | 276 +++++++++++++++++++++
 meta/recipes-extended/libtirpc/libtirpc_1.0.1.bb   |   1 +
 2 files changed, 277 insertions(+)
 create mode 100644 meta/recipes-extended/libtirpc/libtirpc/0001-Fix-for-CVE-2017-8779.patch

diff --git a/meta/recipes-extended/libtirpc/libtirpc/0001-Fix-for-CVE-2017-8779.patch b/meta/recipes-extended/libtirpc/libtirpc/0001-Fix-for-CVE-2017-8779.patch
new file mode 100644
index 0000000..b3bae67
--- /dev/null
+++ b/meta/recipes-extended/libtirpc/libtirpc/0001-Fix-for-CVE-2017-8779.patch
@@ -0,0 +1,276 @@
+From dd9c7cf4f8f375c6d641b760d124650c418c2ce3 Mon Sep 17 00:00:00 2001
+From: Guido Vranken <guidovranken@gmail.com>
+Date: Mon, 15 May 2017 11:12:21 -0400
+Subject: [PATCH] Fix for CVE-2017-8779
+
+Signed-off-by: Steve Dickson <steved@redhat.com>
+---
+ src/rpc_generic.c |  8 ++++++++
+ src/rpcb_prot.c   | 22 ++++++++++++++--------
+ src/rpcb_st_xdr.c |  9 +++++----
+ src/xdr.c         | 30 +++++++++++++++++++++++++-----
+ 4 files changed, 52 insertions(+), 17 deletions(-)
+
+CVE: CVE-2017-8779
+Upstream-Status: Backport
+
+Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
+
+diff --git a/src/rpc_generic.c b/src/rpc_generic.c
+index 2f09a8f..589cbd5 100644
+--- a/src/rpc_generic.c
++++ b/src/rpc_generic.c
+@@ -615,6 +615,9 @@ __rpc_taddr2uaddr_af(int af, const struct netbuf *nbuf)
+ 
+ 	switch (af) {
+ 	case AF_INET:
++		if (nbuf->len < sizeof(*sin)) {
++			return NULL;
++		}
+ 		sin = nbuf->buf;
+ 		if (inet_ntop(af, &sin->sin_addr, namebuf, sizeof namebuf)
+ 		    == NULL)
+@@ -626,6 +629,9 @@ __rpc_taddr2uaddr_af(int af, const struct netbuf *nbuf)
+ 		break;
+ #ifdef INET6
+ 	case AF_INET6:
++		if (nbuf->len < sizeof(*sin6)) {
++			return NULL;
++		}
+ 		sin6 = nbuf->buf;
+ 		if (inet_ntop(af, &sin6->sin6_addr, namebuf6, sizeof namebuf6)
+ 		    == NULL)
+@@ -667,6 +673,8 @@ __rpc_uaddr2taddr_af(int af, const char *uaddr)
+ 
+ 	port = 0;
+ 	sin = NULL;
++	if (uaddr == NULL)
++		return NULL;
+ 	addrstr = strdup(uaddr);
+ 	if (addrstr == NULL)
+ 		return NULL;
+diff --git a/src/rpcb_prot.c b/src/rpcb_prot.c
+index 43fd385..a923c8e 100644
+--- a/src/rpcb_prot.c
++++ b/src/rpcb_prot.c
+@@ -41,6 +41,7 @@
+ #include <rpc/types.h>
+ #include <rpc/xdr.h>
+ #include <rpc/rpcb_prot.h>
++#include "rpc_com.h"
+ 
+ bool_t
+ xdr_rpcb(xdrs, objp)
+@@ -53,13 +54,13 @@ xdr_rpcb(xdrs, objp)
+ 	if (!xdr_u_int32_t(xdrs, &objp->r_vers)) {
+ 		return (FALSE);
+ 	}
+-	if (!xdr_string(xdrs, &objp->r_netid, (u_int)~0)) {
++	if (!xdr_string(xdrs, &objp->r_netid, RPC_MAXDATASIZE)) {
+ 		return (FALSE);
+ 	}
+-	if (!xdr_string(xdrs, &objp->r_addr, (u_int)~0)) {
++	if (!xdr_string(xdrs, &objp->r_addr, RPC_MAXDATASIZE)) {
+ 		return (FALSE);
+ 	}
+-	if (!xdr_string(xdrs, &objp->r_owner, (u_int)~0)) {
++	if (!xdr_string(xdrs, &objp->r_owner, RPC_MAXDATASIZE)) {
+ 		return (FALSE);
+ 	}
+ 	return (TRUE);
+@@ -159,19 +160,19 @@ xdr_rpcb_entry(xdrs, objp)
+ 	XDR *xdrs;
+ 	rpcb_entry *objp;
+ {
+-	if (!xdr_string(xdrs, &objp->r_maddr, (u_int)~0)) {
++	if (!xdr_string(xdrs, &objp->r_maddr, RPC_MAXDATASIZE)) {
+ 		return (FALSE);
+ 	}
+-	if (!xdr_string(xdrs, &objp->r_nc_netid, (u_int)~0)) {
++	if (!xdr_string(xdrs, &objp->r_nc_netid, RPC_MAXDATASIZE)) {
+ 		return (FALSE);
+ 	}
+ 	if (!xdr_u_int32_t(xdrs, &objp->r_nc_semantics)) {
+ 		return (FALSE);
+ 	}
+-	if (!xdr_string(xdrs, &objp->r_nc_protofmly, (u_int)~0)) {
++	if (!xdr_string(xdrs, &objp->r_nc_protofmly, RPC_MAXDATASIZE)) {
+ 		return (FALSE);
+ 	}
+-	if (!xdr_string(xdrs, &objp->r_nc_proto, (u_int)~0)) {
++	if (!xdr_string(xdrs, &objp->r_nc_proto, RPC_MAXDATASIZE)) {
+ 		return (FALSE);
+ 	}
+ 	return (TRUE);
+@@ -292,7 +293,7 @@ xdr_rpcb_rmtcallres(xdrs, p)
+ 	bool_t dummy;
+ 	struct r_rpcb_rmtcallres *objp = (struct r_rpcb_rmtcallres *)(void *)p;
+ 
+-	if (!xdr_string(xdrs, &objp->addr, (u_int)~0)) {
++	if (!xdr_string(xdrs, &objp->addr, RPC_MAXDATASIZE)) {
+ 		return (FALSE);
+ 	}
+ 	if (!xdr_u_int(xdrs, &objp->results.results_len)) {
+@@ -312,6 +313,11 @@ xdr_netbuf(xdrs, objp)
+ 	if (!xdr_u_int32_t(xdrs, (u_int32_t *) &objp->maxlen)) {
+ 		return (FALSE);
+ 	}
++
++	if (objp->maxlen > RPC_MAXDATASIZE) {
++		return (FALSE);
++	}
++
+ 	dummy = xdr_bytes(xdrs, (char **)&(objp->buf),
+ 			(u_int *)&(objp->len), objp->maxlen);
+ 	return (dummy);
+diff --git a/src/rpcb_st_xdr.c b/src/rpcb_st_xdr.c
+index 08db745..28e6a48 100644
+--- a/src/rpcb_st_xdr.c
++++ b/src/rpcb_st_xdr.c
+@@ -37,6 +37,7 @@
+ 
+ 
+ #include <rpc/rpc.h>
++#include "rpc_com.h"
+ 
+ /* Link list of all the stats about getport and getaddr */
+ 
+@@ -58,7 +59,7 @@ xdr_rpcbs_addrlist(xdrs, objp)
+ 	    if (!xdr_int(xdrs, &objp->failure)) {
+ 		return (FALSE);
+ 	    }
+-	    if (!xdr_string(xdrs, &objp->netid, (u_int)~0)) {
++	    if (!xdr_string(xdrs, &objp->netid, RPC_MAXDATASIZE)) {
+ 		return (FALSE);
+ 	    }
+ 
+@@ -109,7 +110,7 @@ xdr_rpcbs_rmtcalllist(xdrs, objp)
+ 		IXDR_PUT_INT32(buf, objp->failure);
+ 		IXDR_PUT_INT32(buf, objp->indirect);
+ 	}
+-	if (!xdr_string(xdrs, &objp->netid, (u_int)~0)) {
++	if (!xdr_string(xdrs, &objp->netid, RPC_MAXDATASIZE)) {
+ 		return (FALSE);
+ 	}
+ 	if (!xdr_pointer(xdrs, (char **)&objp->next,
+@@ -147,7 +148,7 @@ xdr_rpcbs_rmtcalllist(xdrs, objp)
+ 		objp->failure = (int)IXDR_GET_INT32(buf);
+ 		objp->indirect = (int)IXDR_GET_INT32(buf);
+ 	}
+-	if (!xdr_string(xdrs, &objp->netid, (u_int)~0)) {
++	if (!xdr_string(xdrs, &objp->netid, RPC_MAXDATASIZE)) {
+ 		return (FALSE);
+ 	}
+ 	if (!xdr_pointer(xdrs, (char **)&objp->next,
+@@ -175,7 +176,7 @@ xdr_rpcbs_rmtcalllist(xdrs, objp)
+ 	if (!xdr_int(xdrs, &objp->indirect)) {
+ 		return (FALSE);
+ 	}
+-	if (!xdr_string(xdrs, &objp->netid, (u_int)~0)) {
++	if (!xdr_string(xdrs, &objp->netid, RPC_MAXDATASIZE)) {
+ 		return (FALSE);
+ 	}
+ 	if (!xdr_pointer(xdrs, (char **)&objp->next,
+diff --git a/src/xdr.c b/src/xdr.c
+index f3fb9ad..b9a1558 100644
+--- a/src/xdr.c
++++ b/src/xdr.c
+@@ -42,8 +42,10 @@
+ #include <stdlib.h>
+ #include <string.h>
+ 
++#include <rpc/rpc.h>
+ #include <rpc/types.h>
+ #include <rpc/xdr.h>
++#include <rpc/rpc_com.h>
+ 
+ typedef quad_t          longlong_t;     /* ANSI long long type */
+ typedef u_quad_t        u_longlong_t;   /* ANSI unsigned long long type */
+@@ -53,7 +55,6 @@ typedef u_quad_t        u_longlong_t;   /* ANSI unsigned long long type */
+  */
+ #define XDR_FALSE	((long) 0)
+ #define XDR_TRUE	((long) 1)
+-#define LASTUNSIGNED	((u_int) 0-1)
+ 
+ /*
+  * for unit alignment
+@@ -629,6 +630,7 @@ xdr_bytes(xdrs, cpp, sizep, maxsize)
+ {
+ 	char *sp = *cpp;  /* sp is the actual string pointer */
+ 	u_int nodesize;
++	bool_t ret, allocated = FALSE;
+ 
+ 	/*
+ 	 * first deal with the length since xdr bytes are counted
+@@ -652,6 +654,7 @@ xdr_bytes(xdrs, cpp, sizep, maxsize)
+ 		}
+ 		if (sp == NULL) {
+ 			*cpp = sp = mem_alloc(nodesize);
++			allocated = TRUE;
+ 		}
+ 		if (sp == NULL) {
+ 			warnx("xdr_bytes: out of memory");
+@@ -660,7 +663,14 @@ xdr_bytes(xdrs, cpp, sizep, maxsize)
+ 		/* FALLTHROUGH */
+ 
+ 	case XDR_ENCODE:
+-		return (xdr_opaque(xdrs, sp, nodesize));
++		ret = xdr_opaque(xdrs, sp, nodesize);
++		if ((xdrs->x_op == XDR_DECODE) && (ret == FALSE)) {
++			if (allocated == TRUE) {
++				free(sp);
++				*cpp = NULL;
++			}
++		}
++		return (ret);
+ 
+ 	case XDR_FREE:
+ 		if (sp != NULL) {
+@@ -754,6 +764,7 @@ xdr_string(xdrs, cpp, maxsize)
+ 	char *sp = *cpp;  /* sp is the actual string pointer */
+ 	u_int size;
+ 	u_int nodesize;
++	bool_t ret, allocated = FALSE;
+ 
+ 	/*
+ 	 * first deal with the length since xdr strings are counted-strings
+@@ -793,8 +804,10 @@ xdr_string(xdrs, cpp, maxsize)
+ 	switch (xdrs->x_op) {
+ 
+ 	case XDR_DECODE:
+-		if (sp == NULL)
++		if (sp == NULL) {
+ 			*cpp = sp = mem_alloc(nodesize);
++			allocated = TRUE;
++		}
+ 		if (sp == NULL) {
+ 			warnx("xdr_string: out of memory");
+ 			return (FALSE);
+@@ -803,7 +816,14 @@ xdr_string(xdrs, cpp, maxsize)
+ 		/* FALLTHROUGH */
+ 
+ 	case XDR_ENCODE:
+-		return (xdr_opaque(xdrs, sp, size));
++		ret = xdr_opaque(xdrs, sp, size);
++		if ((xdrs->x_op == XDR_DECODE) && (ret == FALSE)) {
++			if (allocated == TRUE) {
++				free(sp);
++				*cpp = NULL;
++			}
++		}
++		return (ret);
+ 
+ 	case XDR_FREE:
+ 		mem_free(sp, nodesize);
+@@ -823,7 +843,7 @@ xdr_wrapstring(xdrs, cpp)
+ 	XDR *xdrs;
+ 	char **cpp;
+ {
+-	return xdr_string(xdrs, cpp, LASTUNSIGNED);
++	return xdr_string(xdrs, cpp, RPC_MAXDATASIZE);
+ }
+ 
+ /*
+-- 
+1.9.1
+
diff --git a/meta/recipes-extended/libtirpc/libtirpc_1.0.1.bb b/meta/recipes-extended/libtirpc/libtirpc_1.0.1.bb
index 5518fb3..f41d2f3 100644
--- a/meta/recipes-extended/libtirpc/libtirpc_1.0.1.bb
+++ b/meta/recipes-extended/libtirpc/libtirpc_1.0.1.bb
@@ -16,6 +16,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.bz2;name=libtirpc \
            file://export_key_secretkey_is_set.patch \
            file://0001-replace-__bzero-with-memset-API.patch \
            file://0001-include-stdint.h-for-uintptr_t.patch \
+           file://0001-Fix-for-CVE-2017-8779.patch \
            "
 
 SRC_URI_append_libc-uclibc = " file://remove-des-functionality.patch \
-- 
2.7.4


