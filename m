Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id 8DD7373192
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Dec 2015 23:52:35 +0000 (UTC)
Received: by mail-qk0-f180.google.com with SMTP id t125so125240932qkh.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Dec 2015 15:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=c6I5i6EF2bOHlJisXFb6s/IW0Hxfe6/OeinqvYAkzKY=;
	b=Wv0IbLXTEYFPh1469qxIbou7SP4wp0fgEWgK5lB16ryuefO4l7j3MHucqMwSUN7Mhd
	kR7C9+N8JQoAXFq1pUAXy1+39s8Uy9xN4ock/eF9wUK1vbZhpQrN37t6M7Qu3BwZzXrg
	UoRtdvDK6oYWxKn93EuL2GJWK8plgSWf8jk+wBWtO1+bVYpTW9PfJQQCL+Rnq95PTumV
	E2JP7SfxZWsWeG1XCvtwFyW4zzXOfBbDTWx/HOPAXOOLhsPnbjWvUzeILaDpPgnfMCZD
	WsZz/FH/x5ZNWUgAPS8jsHcoGChRlHnGp5J4I3f+A3Xj05PN7T0xj4fMDE//fCFE357C
	C6IQ==
X-Received: by 10.55.195.221 with SMTP id r90mr15832308qkl.4.1450569156351;
	Sat, 19 Dec 2015 15:52:36 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id c2sm9785372qkb.41.2015.12.19.15.52.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 19 Dec 2015 15:52:35 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 19 Dec 2015 23:52:16 +0000
Message-Id: <4bae2f6471c3ba8c10f76f976eeb4463e097d8ea.1450568936.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <81170e1970685f34735007c496ce175279d46304.1450568936.git.raj.khem@gmail.com>
References: <81170e1970685f34735007c496ce175279d46304.1450568936.git.raj.khem@gmail.com>
In-Reply-To: <cover.1450568936.git.raj.khem@gmail.com>
References: <cover.1450568936.git.raj.khem@gmail.com>
Subject: [PATCH 07/17] libtirpc: Fix build for musl
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
X-List-Received-Date: Sat, 19 Dec 2015 23:52:36 -0000

NIS support is really not there in musl and some fixes
are break the linux = glibc assumption

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...rpcbynumber-and-getrpcbyname-if-those-are.patch |   89 +
 ...-use-of-internal-glibc-sys-cdefs.h-header.patch | 1754 ++++++++++++++++++++
 ...gure-option-to-disable-DES-authentication.patch |   99 ++
 ...-compile-error-IPPORT_RESERVED-undeclared.patch |   35 +
 ...0006-Define-struct-rpcent-on-non-GNU-libc.patch |   50 +
 .../libtirpc/libtirpc/0007-use-bsd-queue.patch     |  561 +++++++
 meta/recipes-extended/libtirpc/libtirpc/nis.h      |  545 ++++++
 meta/recipes-extended/libtirpc/libtirpc_0.2.5.bb   |   14 +
 8 files changed, 3147 insertions(+)
 create mode 100644 meta/recipes-extended/libtirpc/libtirpc/0002-Provide-getrpcbynumber-and-getrpcbyname-if-those-are.patch
 create mode 100644 meta/recipes-extended/libtirpc/libtirpc/0003-Avoid-use-of-internal-glibc-sys-cdefs.h-header.patch
 create mode 100644 meta/recipes-extended/libtirpc/libtirpc/0004-Add-configure-option-to-disable-DES-authentication.patch
 create mode 100644 meta/recipes-extended/libtirpc/libtirpc/0005-Fix-compile-error-IPPORT_RESERVED-undeclared.patch
 create mode 100644 meta/recipes-extended/libtirpc/libtirpc/0006-Define-struct-rpcent-on-non-GNU-libc.patch
 create mode 100644 meta/recipes-extended/libtirpc/libtirpc/0007-use-bsd-queue.patch
 create mode 100644 meta/recipes-extended/libtirpc/libtirpc/nis.h

diff --git a/meta/recipes-extended/libtirpc/libtirpc/0002-Provide-getrpcbynumber-and-getrpcbyname-if-those-are.patch b/meta/recipes-extended/libtirpc/libtirpc/0002-Provide-getrpcbynumber-and-getrpcbyname-if-those-are.patch
new file mode 100644
index 0000000..93149b9
--- /dev/null
+++ b/meta/recipes-extended/libtirpc/libtirpc/0002-Provide-getrpcbynumber-and-getrpcbyname-if-those-are.patch
@@ -0,0 +1,89 @@
+From fe103d60b2d4c71f11095232dadc8352c6c096da Mon Sep 17 00:00:00 2001
+From: Natanael Copa <ncopa@alpinelinux.org>
+Date: Thu, 24 Apr 2014 09:19:45 +0200
+Subject: [PATCH 2/9] Provide getrpcbynumber and getrpcbyname if those are
+ missing
+
+We enable the config.h again and check if getrpcbynumber and
+getrpcbyname exists on the building patform. If it does not exist, then
+provide those functions.
+
+This is needed for musl libc.
+
+Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
+---
+Upstream-Status: Pending
+
+ configure.ac    |  6 ++++--
+ src/getrpcent.c | 10 ++++++++--
+ 2 files changed, 12 insertions(+), 4 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 10d17ea..0180801 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -24,14 +24,16 @@ if test "x$enable_ipv6" != xno; then
+ fi
+ 
+ AC_PROG_CC
+-m4_pattern_allow(AM_CONFIG_HEADERS(config.h))
++AC_CONFIG_HEADERS([config.h])
+ AC_PROG_LIBTOOL
+ AC_HEADER_DIRENT
+ AC_PREFIX_DEFAULT(/usr)
+ AC_CHECK_HEADERS([arpa/inet.h fcntl.h libintl.h limits.h locale.h netdb.h netinet/in.h stddef.h stdint.h stdlib.h string.h sys/ioctl.h sys/param.h sys/socket.h sys/time.h syslog.h unistd.h])
+ AC_CHECK_LIB([pthread], [pthread_create])
+ AC_CHECK_LIB([nsl], [yp_get_default_domain])
+-
++AC_CHECK_FUNCS([getrpcbyname getrpcbynumber])
+ 
+ AC_CONFIG_FILES([Makefile src/Makefile man/Makefile doc/Makefile])
+ AC_OUTPUT(libtirpc.pc)
++
++
+diff --git a/src/getrpcent.c b/src/getrpcent.c
+index 1b54b6d..6da006a 100644
+--- a/src/getrpcent.c
++++ b/src/getrpcent.c
+@@ -50,6 +50,10 @@
+ #include <libc_private.h>
+ #endif
+ 
++#if HAVE_CONFIG_H
++#include "config.h"
++#endif
++
+ /*
+  * Internet version.
+  */
+@@ -89,7 +93,7 @@ _rpcdata()
+ 	return (d);
+ }
+ 
+-#ifdef GQ
++#if !HAVE_GETRPCBYNYMBER
+ struct rpcent *
+ getrpcbynumber(number)
+ 	int number;
+@@ -135,7 +139,9 @@ no_yp:
+ 	endrpcent();
+ 	return (p);
+ }
++#endif /* !HAVE_GETRPCBYNUMBER */
+ 
++#if !HAVE_GETRPCBYNAME
+ struct rpcent *
+ getrpcbyname(name)
+ 	const char *name;
+@@ -158,7 +164,7 @@ done:
+ 	endrpcent();
+ 	return (rpc);
+ }
+-#endif /* GQ */
++#endif /* !HAVE_GETRPCBYNAME */
+ 
+ void
+ setrpcent(f)
+-- 
+2.2.0
+
diff --git a/meta/recipes-extended/libtirpc/libtirpc/0003-Avoid-use-of-internal-glibc-sys-cdefs.h-header.patch b/meta/recipes-extended/libtirpc/libtirpc/0003-Avoid-use-of-internal-glibc-sys-cdefs.h-header.patch
new file mode 100644
index 0000000..5585d7a
--- /dev/null
+++ b/meta/recipes-extended/libtirpc/libtirpc/0003-Avoid-use-of-internal-glibc-sys-cdefs.h-header.patch
@@ -0,0 +1,1754 @@
+From d859292140e52c055b2a51ded67cbb966531ac4c Mon Sep 17 00:00:00 2001
+From: Natanael Copa <ncopa@alpinelinux.org>
+Date: Mon, 15 Dec 2014 09:29:32 +0100
+Subject: [PATCH 3/9] Avoid use of internal glibc sys/cdefs.h header
+
+This header was never intended to be used by programs.
+
+Expand the macros used, __BEGIN_CDECLS, __END_CDECLS and __P()
+
+The __THROW macro is a non-portable hint for optimization so we simply
+remove those.
+
+Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
+---
+Upstream-Status: Pending
+
+ src/auth_des.c        |  2 --
+ src/auth_none.c       |  1 -
+ src/auth_time.c       |  1 -
+ src/auth_unix.c       |  1 -
+ src/authdes_prot.c    |  1 -
+ src/authunix_prot.c   |  1 -
+ src/bindresvport.c    |  1 -
+ src/clnt_bcast.c      |  1 -
+ src/clnt_perror.c     |  3 --
+ src/clnt_simple.c     |  1 -
+ src/crypt_client.c    |  1 -
+ src/des_crypt.c       |  1 -
+ src/getnetconfig.c    |  1 -
+ src/getnetpath.c      |  2 --
+ src/getpeereid.c      |  1 -
+ src/getpublickey.c    |  3 --
+ src/key_call.c        |  1 -
+ src/key_prot_xdr.c    |  1 -
+ src/mt_misc.c         |  1 -
+ src/pmap_clnt.c       |  1 -
+ src/pmap_getmaps.c    |  1 -
+ src/rpc_com.h         |  9 ++++--
+ src/rpc_generic.c     |  1 -
+ src/rpcb_st_xdr.c     |  1 -
+ src/rpcdname.c        |  1 -
+ src/svc_dg.c          |  1 -
+ src/svc_simple.c      |  1 -
+ src/svc_vc.c          |  1 -
+ src/xdr.c             |  1 -
+ src/xdr_array.c       |  1 -
+ src/xdr_float.c       |  1 -
+ src/xdr_mem.c         |  1 -
+ src/xdr_rec.c         |  2 --
+ src/xdr_reference.c   |  2 --
+ src/xdr_sizeof.c      |  1 -
+ src/xdr_stdio.c       |  1 -
+ tirpc/netconfig.h     |  8 +++--
+ tirpc/rpc/auth.h      | 89 ++++++++++++++++++++++++++++++++++++++-------------
+ tirpc/rpc/auth_des.h  | 16 ++++++---
+ tirpc/rpc/auth_gss.h  | 47 ++++++++++++++-------------
+ tirpc/rpc/auth_unix.h |  9 ++++--
+ tirpc/rpc/clnt.h      | 57 ++++++++++++++++++++++++---------
+ tirpc/rpc/clnt_soc.h  | 33 +++++++++++++------
+ tirpc/rpc/des_crypt.h | 25 +++++++++++----
+ tirpc/rpc/nettype.h   |  8 +++--
+ tirpc/rpc/pmap_clnt.h |  9 ++++--
+ tirpc/rpc/pmap_prot.h |  9 ++++--
+ tirpc/rpc/pmap_rmt.h  |  9 ++++--
+ tirpc/rpc/rpc.h       | 18 ++++++++---
+ tirpc/rpc/rpc_com.h   |  9 ++++--
+ tirpc/rpc/rpc_msg.h   |  8 +++--
+ tirpc/rpc/rpcb_clnt.h |  8 +++--
+ tirpc/rpc/rpcent.h    | 12 ++++---
+ tirpc/rpc/svc.h       | 65 +++++++++++++++++++++++++++----------
+ tirpc/rpc/svc_auth.h  |  8 +++--
+ tirpc/rpc/svc_soc.h   | 49 ++++++++++++++++++++--------
+ tirpc/rpc/xdr.h       | 17 +++++++---
+ 57 files changed, 369 insertions(+), 196 deletions(-)
+
+diff --git a/src/auth_des.c b/src/auth_des.c
+index cff777c..1ccbf28 100644
+--- a/src/auth_des.c
++++ b/src/auth_des.c
+@@ -38,7 +38,6 @@
+ #include <string.h>
+ #include <stdlib.h>
+ #include <unistd.h>
+-#include <sys/cdefs.h>
+ #include <rpc/des_crypt.h>
+ #include <syslog.h>
+ #include <rpc/types.h>
+@@ -52,7 +51,6 @@
+ 
+ #if defined(LIBC_SCCS) && !defined(lint)
+ #endif
+-#include <sys/cdefs.h>
+ 
+ #include "debug.h"
+ 
+diff --git a/src/auth_none.c b/src/auth_none.c
+index affc92b..0b0bbd1 100644
+--- a/src/auth_none.c
++++ b/src/auth_none.c
+@@ -31,7 +31,6 @@
+ static char *sccsid = "@(#)auth_none.c 1.19 87/08/11 Copyr 1984 Sun Micro";
+ static char *sccsid = "@(#)auth_none.c	2.1 88/07/29 4.0 RPCSRC";
+ #endif
+-#include <sys/cdefs.h>
+ __FBSDID("$FreeBSD: src/lib/libc/rpc/auth_none.c,v 1.12 2002/03/22 23:18:35 obrien Exp $");
+ */
+ 
+diff --git a/src/auth_time.c b/src/auth_time.c
+index 7cfbb7e..ace86bf 100644
+--- a/src/auth_time.c
++++ b/src/auth_time.c
+@@ -25,7 +25,6 @@
+  *	needed to deal with TCP connections.
+  */
+ 
+-#include <sys/cdefs.h>
+ #include <stdio.h>
+ #include <syslog.h>
+ #include <string.h>
+diff --git a/src/auth_unix.c b/src/auth_unix.c
+index 4b9b13f..3009543 100644
+--- a/src/auth_unix.c
++++ b/src/auth_unix.c
+@@ -26,7 +26,6 @@
+  * POSSIBILITY OF SUCH DAMAGE.
+  */
+ 
+-#include <sys/cdefs.h>
+ 
+ /*
+  * auth_unix.c, Implements UNIX style authentication parameters.
+diff --git a/src/authdes_prot.c b/src/authdes_prot.c
+index ed061a5..227d08a 100644
+--- a/src/authdes_prot.c
++++ b/src/authdes_prot.c
+@@ -1,4 +1,3 @@
+-#include <sys/cdefs.h>
+ /*
+  * Copyright (c) 2009, Sun Microsystems, Inc.
+  * All rights reserved.
+diff --git a/src/authunix_prot.c b/src/authunix_prot.c
+index bf76a9d..0a04336 100644
+--- a/src/authunix_prot.c
++++ b/src/authunix_prot.c
+@@ -26,7 +26,6 @@
+  * POSSIBILITY OF SUCH DAMAGE.
+  */
+ 
+-#include <sys/cdefs.h>
+ 
+ /*
+  * authunix_prot.c
+diff --git a/src/bindresvport.c b/src/bindresvport.c
+index d6d9c14..950fbd1 100644
+--- a/src/bindresvport.c
++++ b/src/bindresvport.c
+@@ -26,7 +26,6 @@
+  * POSSIBILITY OF SUCH DAMAGE.
+  */
+ 
+-#include <sys/cdefs.h>
+ 
+ /*
+  * Copyright (c) 1987 by Sun Microsystems, Inc.
+diff --git a/src/clnt_bcast.c b/src/clnt_bcast.c
+index 373d8a5..be05af4 100644
+--- a/src/clnt_bcast.c
++++ b/src/clnt_bcast.c
+@@ -28,7 +28,6 @@
+ /*
+  * Copyright (c) 1986-1991 by Sun Microsystems Inc. 
+  */
+-#include <sys/cdefs.h>
+ 
+ /*
+  * clnt_bcast.c
+diff --git a/src/clnt_perror.c b/src/clnt_perror.c
+index bcd8af8..fb7fb80 100644
+--- a/src/clnt_perror.c
++++ b/src/clnt_perror.c
+@@ -27,9 +27,6 @@
+  */
+ 
+ /*
+-#include <sys/cdefs.h>
+-*/
+-/*
+  * clnt_perror.c
+  *
+  * Copyright (C) 1984, Sun Microsystems, Inc.
+diff --git a/src/clnt_simple.c b/src/clnt_simple.c
+index 7ee9542..1700060 100644
+--- a/src/clnt_simple.c
++++ b/src/clnt_simple.c
+@@ -29,7 +29,6 @@
+  * Copyright (c) 1986-1991 by Sun Microsystems Inc. 
+  */
+ 
+-#include <sys/cdefs.h>
+ 
+ /*
+  * clnt_simple.c
+diff --git a/src/crypt_client.c b/src/crypt_client.c
+index 670b253..f393926 100644
+--- a/src/crypt_client.c
++++ b/src/crypt_client.c
+@@ -30,7 +30,6 @@
+  * SUCH DAMAGE.
+  */
+ 
+-#include <sys/cdefs.h>
+ 
+ #include <err.h>
+ #include <sys/types.h>
+diff --git a/src/des_crypt.c b/src/des_crypt.c
+index 37a1022..980a6cb 100644
+--- a/src/des_crypt.c
++++ b/src/des_crypt.c
+@@ -39,7 +39,6 @@
+ static char sccsid[] = "@(#)des_crypt.c	2.2 88/08/10 4.0 RPCSRC; from 1.13 88/02/08 SMI";
+ #endif
+ #endif
+-#include <sys/cdefs.h>
+ 
+ static int common_crypt( char *, char *, unsigned, unsigned, struct desparams * );
+ int (*__des_crypt_LOCAL)() = 0;
+diff --git a/src/getnetconfig.c b/src/getnetconfig.c
+index 635c03a..92e7c43 100644
+--- a/src/getnetconfig.c
++++ b/src/getnetconfig.c
+@@ -32,7 +32,6 @@
+  
+ #include <pthread.h>
+ #include <reentrant.h>
+-#include <sys/cdefs.h>
+ #include <stdio.h>
+ #include <errno.h>
+ #include <netconfig.h>
+diff --git a/src/getnetpath.c b/src/getnetpath.c
+index cd80dca..7c19932 100644
+--- a/src/getnetpath.c
++++ b/src/getnetpath.c
+@@ -25,13 +25,11 @@
+  * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
+  * POSSIBILITY OF SUCH DAMAGE.
+  */
+-#include <sys/cdefs.h>
+ 
+ /*
+  * Copyright (c) 1989 by Sun Microsystems, Inc.
+  */
+ 
+-#include <sys/cdefs.h>
+ #include <stdio.h>
+ #include <errno.h>
+ #include <netconfig.h>
+diff --git a/src/getpeereid.c b/src/getpeereid.c
+index 57ee197..dd85270 100644
+--- a/src/getpeereid.c
++++ b/src/getpeereid.c
+@@ -24,7 +24,6 @@
+  * SUCH DAMAGE.
+  */
+ 
+-#include <sys/cdefs.h>
+ 
+ #include <sys/param.h>
+ #include <sys/socket.h>
+diff --git a/src/getpublickey.c b/src/getpublickey.c
+index 85935d8..764a5f9 100644
+--- a/src/getpublickey.c
++++ b/src/getpublickey.c
+@@ -25,9 +25,6 @@
+  * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
+  * POSSIBILITY OF SUCH DAMAGE.
+  */
+-/*
+-#include <sys/cdefs.h>
+-*/
+ 
+ /*
+  * publickey.c
+diff --git a/src/key_call.c b/src/key_call.c
+index 8b9f388..1a6430b 100644
+--- a/src/key_call.c
++++ b/src/key_call.c
+@@ -30,7 +30,6 @@
+  */
+ 
+ 
+-#include <sys/cdefs.h>
+ 
+ /*
+  * key_call.c, Interface to keyserver
+diff --git a/src/key_prot_xdr.c b/src/key_prot_xdr.c
+index df2842f..772f582 100644
+--- a/src/key_prot_xdr.c
++++ b/src/key_prot_xdr.c
+@@ -33,7 +33,6 @@
+  */
+ /* Copyright (c)  1990, 1991 Sun Microsystems, Inc. */
+ 
+-#include <sys/cdefs.h>
+ 
+ /* 
+  * Compiled from key_prot.x using rpcgen.
+diff --git a/src/mt_misc.c b/src/mt_misc.c
+index 093086e..a50f385 100644
+--- a/src/mt_misc.c
++++ b/src/mt_misc.c
+@@ -1,5 +1,4 @@
+ 
+-#include <sys/cdefs.h>
+ #include <pthread.h>
+ #include <reentrant.h>
+ #include <rpc/rpc.h>
+diff --git a/src/pmap_clnt.c b/src/pmap_clnt.c
+index 1d5d153..4b5fd85 100644
+--- a/src/pmap_clnt.c
++++ b/src/pmap_clnt.c
+@@ -26,7 +26,6 @@
+  * POSSIBILITY OF SUCH DAMAGE.
+  */
+ 
+-#include <sys/cdefs.h>
+ 
+ /*
+  * pmap_clnt.c
+diff --git a/src/pmap_getmaps.c b/src/pmap_getmaps.c
+index 54338f7..853f724 100644
+--- a/src/pmap_getmaps.c
++++ b/src/pmap_getmaps.c
+@@ -26,7 +26,6 @@
+  * POSSIBILITY OF SUCH DAMAGE.
+  */
+ 
+-#include <sys/cdefs.h>
+ 
+ /*
+  * pmap_getmap.c
+diff --git a/src/rpc_com.h b/src/rpc_com.h
+index 38c2cfe..52a8c48 100644
+--- a/src/rpc_com.h
++++ b/src/rpc_com.h
+@@ -40,7 +40,6 @@
+ #ifndef _TIRPC_RPCCOM_H
+ #define	_TIRPC_RPCCOM_H
+ 
+-#include <sys/cdefs.h>
+ 
+ /* #pragma ident	"@(#)rpc_com.h	1.11	93/07/05 SMI" */
+ 
+@@ -54,7 +53,9 @@
+ #define __RPC_GETXID(now) ((u_int32_t)getpid() ^ (u_int32_t)(now)->tv_sec ^ \
+     (u_int32_t)(now)->tv_usec)
+ 
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ extern u_int __rpc_get_a_size(int);
+ extern int __rpc_dtbsize(void);
+ extern struct netconfig * __rpcgettp(int);
+@@ -90,6 +91,8 @@ void __xprt_set_raddr(SVCXPRT *, const struct sockaddr_storage *);
+ SVCXPRT **__svc_xports;
+ int __svc_maxrec;
+ 
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ #endif /* _TIRPC_RPCCOM_H */
+diff --git a/src/rpc_generic.c b/src/rpc_generic.c
+index a43906c..0ceadb4 100644
+--- a/src/rpc_generic.c
++++ b/src/rpc_generic.c
+@@ -29,7 +29,6 @@
+  * Copyright (c) 1986-1991 by Sun Microsystems Inc. 
+  */
+ 
+-#include <sys/cdefs.h>
+ 
+ /*
+  * rpc_generic.c, Miscl routines for RPC.
+diff --git a/src/rpcb_st_xdr.c b/src/rpcb_st_xdr.c
+index c5d3575..08db745 100644
+--- a/src/rpcb_st_xdr.c
++++ b/src/rpcb_st_xdr.c
+@@ -35,7 +35,6 @@
+  * routines used with the rpcbind stats facility.
+  */
+ 
+-#include <sys/cdefs.h>
+ 
+ #include <rpc/rpc.h>
+ 
+diff --git a/src/rpcdname.c b/src/rpcdname.c
+index 094cea3..3e6a988 100644
+--- a/src/rpcdname.c
++++ b/src/rpcdname.c
+@@ -25,7 +25,6 @@
+  * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
+  * POSSIBILITY OF SUCH DAMAGE.
+  */
+-#include <sys/cdefs.h>
+ 
+ /*
+  * rpcdname.c
+diff --git a/src/svc_dg.c b/src/svc_dg.c
+index f8255cc..1fd6f92 100644
+--- a/src/svc_dg.c
++++ b/src/svc_dg.c
+@@ -31,7 +31,6 @@
+  * Copyright (c) 1986-1991 by Sun Microsystems Inc.
+  */
+ 
+-#include <sys/cdefs.h>
+ 
+ /*
+  * svc_dg.c, Server side for connectionless RPC.
+diff --git a/src/svc_simple.c b/src/svc_simple.c
+index b6c371e..cb58002 100644
+--- a/src/svc_simple.c
++++ b/src/svc_simple.c
+@@ -29,7 +29,6 @@
+  * Copyright (c) 1986-1991 by Sun Microsystems Inc. 
+  */
+ 
+-#include <sys/cdefs.h>
+ 
+ /*
+  * svc_simple.c
+diff --git a/src/svc_vc.c b/src/svc_vc.c
+index 4d3ea51..9dba72a 100644
+--- a/src/svc_vc.c
++++ b/src/svc_vc.c
+@@ -27,7 +27,6 @@
+  * POSSIBILITY OF SUCH DAMAGE.
+  */
+ 
+-#include <sys/cdefs.h>
+ 
+ /*
+  * svc_vc.c, Server side for Connection Oriented based RPC. 
+diff --git a/src/xdr.c b/src/xdr.c
+index 1142a88..f3fb9ad 100644
+--- a/src/xdr.c
++++ b/src/xdr.c
+@@ -26,7 +26,6 @@
+  * POSSIBILITY OF SUCH DAMAGE.
+  */
+ 
+-#include <sys/cdefs.h>
+ 
+ /*
+  * xdr.c, Generic XDR routines implementation.
+diff --git a/src/xdr_array.c b/src/xdr_array.c
+index 216173d..7fc8fb8 100644
+--- a/src/xdr_array.c
++++ b/src/xdr_array.c
+@@ -27,7 +27,6 @@
+  * POSSIBILITY OF SUCH DAMAGE.
+  */
+ 
+-#include <sys/cdefs.h>
+ 
+ /*
+  * xdr_array.c, Generic XDR routines impelmentation.
+diff --git a/src/xdr_float.c b/src/xdr_float.c
+index 90daf3f..26bc865 100644
+--- a/src/xdr_float.c
++++ b/src/xdr_float.c
+@@ -27,7 +27,6 @@
+  * POSSIBILITY OF SUCH DAMAGE.
+  */
+ 
+-#include <sys/cdefs.h>
+ 
+ /*
+  * xdr_float.c, Generic XDR routines implementation.
+diff --git a/src/xdr_mem.c b/src/xdr_mem.c
+index bd86f00..ecdc932 100644
+--- a/src/xdr_mem.c
++++ b/src/xdr_mem.c
+@@ -26,7 +26,6 @@
+  * POSSIBILITY OF SUCH DAMAGE.
+  */
+ 
+-#include <sys/cdefs.h>
+ 
+ /*
+  * xdr_mem.h, XDR implementation using memory buffers.
+diff --git a/src/xdr_rec.c b/src/xdr_rec.c
+index 2aca623..7d535cf 100644
+--- a/src/xdr_rec.c
++++ b/src/xdr_rec.c
+@@ -27,8 +27,6 @@
+  * POSSIBILITY OF SUCH DAMAGE.
+  */
+ 
+-#include <sys/cdefs.h>
+-#include <sys/cdefs.h>
+ 
+ /*
+  * xdr_rec.c, Implements TCP/IP based XDR streams with a "record marking"
+diff --git a/src/xdr_reference.c b/src/xdr_reference.c
+index affe19e..13f6410 100644
+--- a/src/xdr_reference.c
++++ b/src/xdr_reference.c
+@@ -26,8 +26,6 @@
+  * POSSIBILITY OF SUCH DAMAGE.
+  */
+ 
+-#include <sys/cdefs.h>
+-#include <sys/cdefs.h>
+ 
+ /*
+  * xdr_reference.c, Generic XDR routines impelmentation.
+diff --git a/src/xdr_sizeof.c b/src/xdr_sizeof.c
+index a805e31..cc5414b 100644
+--- a/src/xdr_sizeof.c
++++ b/src/xdr_sizeof.c
+@@ -34,7 +34,6 @@
+  * when serialized using XDR.
+  */
+ 
+-#include <sys/cdefs.h>
+ 
+ #include <rpc/types.h>
+ #include <rpc/xdr.h>
+diff --git a/src/xdr_stdio.c b/src/xdr_stdio.c
+index 45b1150..4410262 100644
+--- a/src/xdr_stdio.c
++++ b/src/xdr_stdio.c
+@@ -26,7 +26,6 @@
+  * POSSIBILITY OF SUCH DAMAGE.
+  */
+ 
+-#include <sys/cdefs.h>
+ 
+ /*
+  * xdr_stdio.c, XDR implementation on standard i/o file.
+diff --git a/tirpc/netconfig.h b/tirpc/netconfig.h
+index 7d6c2bc..c25788c 100644
+--- a/tirpc/netconfig.h
++++ b/tirpc/netconfig.h
+@@ -74,7 +74,9 @@ typedef struct {
+ #define NC_UDP		"udp"
+ #define NC_ICMP		"icmp"
+ 
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ 
+ extern void *setnetconfig (void);
+ extern struct netconfig *getnetconfig (void *);
+@@ -89,6 +91,8 @@ extern int endnetpath (void *);
+ extern void nc_perror (const char *);
+ extern char *nc_sperror (void);
+ 
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ #endif /* _NETCONFIG_H_ */
+diff --git a/tirpc/rpc/auth.h b/tirpc/rpc/auth.h
+index 7c8f813..434d35c 100644
+--- a/tirpc/rpc/auth.h
++++ b/tirpc/rpc/auth.h
+@@ -48,7 +48,6 @@
+ 
+ #include <rpc/xdr.h>
+ #include <rpc/clnt_stat.h>
+-#include <sys/cdefs.h>
+ #include <sys/socket.h>
+ #include <sys/types.h>
+ 
+@@ -164,9 +163,13 @@ union des_block {
+ 	char c[8];
+ };
+ typedef union des_block des_block;
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ extern bool_t xdr_des_block(XDR *, des_block *);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ /*
+  * Authentication info.  Opaque to client.
+@@ -277,9 +280,13 @@ auth_put(AUTH *auth)
+ 		xfunc, xwhere))
+ 
+ 
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ extern struct opaque_auth _null_auth;
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ /*
+  * Any style authentication.  These routines can be used by any
+@@ -300,11 +307,15 @@ int authany_wrap(void), authany_unwrap(void);
+  *	int len;
+  *	int *aup_gids;
+  */
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ extern AUTH *authunix_create(char *, uid_t, uid_t, int, uid_t *);
+ extern AUTH *authunix_create_default(void);	/* takes no parameters */
+ extern AUTH *authnone_create(void);		/* takes no parameters */
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ /*
+  * DES style authentication
+  * AUTH *authsecdes_create(servername, window, timehost, ckey)
+@@ -313,15 +324,23 @@ __END_DECLS
+  * 	const char *timehost;			- optional hostname to sync with
+  * 	des_block *ckey;		- optional conversation key to use
+  */
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ extern AUTH *authdes_create (char *, u_int, struct sockaddr *, des_block *);
+ extern AUTH *authdes_seccreate (const char *, const u_int, const  char *,
+     const  des_block *);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ extern bool_t xdr_opaque_auth		(XDR *, struct opaque_auth *);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ #define authsys_create(c,i1,i2,i3,ip) authunix_create((c),(i1),(i2),(i3),(ip))
+ #define authsys_create_default() authunix_create_default()
+@@ -329,36 +348,48 @@ __END_DECLS
+ /*
+  * Netname manipulation routines.
+  */
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ extern int getnetname(char *);
+ extern int host2netname(char *, const char *, const char *);
+ extern int user2netname(char *, const uid_t, const char *);
+ extern int netname2user(char *, uid_t *, gid_t *, int *, gid_t *);
+ extern int netname2host(char *, char *, const int);
+ extern void passwd2des ( char *, char * );
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ /*
+  *
+  * These routines interface to the keyserv daemon
+  *
+  */
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ extern int key_decryptsession(const char *, des_block *);
+ extern int key_encryptsession(const char *, des_block *);
+ extern int key_gendes(des_block *);
+ extern int key_setsecret(const char *);
+ extern int key_secretkey_is_set(void);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ /*
+  * Publickey routines.
+  */
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ extern int getpublickey (const char *, char *);
+ extern int getpublicandprivatekey (char *, char *);
+ extern int getsecretkey (char *, char *, char *);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ #ifdef KERBEROS
+ /*
+@@ -371,10 +402,14 @@ __END_DECLS
+  *	const char *timehost;			- optional hostname to sync with
+  *	int *status;				- kerberos status returned
+  */
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ extern AUTH	*authkerb_seccreate(const char *, const char *, const  char *,
+ 		    const u_int, const char *, int *);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ /*
+  * Map a kerberos credential into a unix cred.
+@@ -387,20 +422,28 @@ __END_DECLS
+  *	int *groups;
+  *
+  */
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ extern int	authkerb_getucred(/* struct svc_req *, uid_t *, gid_t *,
+ 		    short *, int * */);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ #endif /* KERBEROS */
+ 
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ struct svc_req;
+ struct rpc_msg;
+ enum auth_stat _svcauth_none (struct svc_req *, struct rpc_msg *);
+ enum auth_stat _svcauth_short (struct svc_req *, struct rpc_msg *);
+ enum auth_stat _svcauth_unix (struct svc_req *, struct rpc_msg *);
+ enum auth_stat _svcauth_gss (struct svc_req *, struct rpc_msg *, bool_t *);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ #define AUTH_NONE	0		/* no authentication */
+ #define	AUTH_NULL	0		/* backward compatibility */
+diff --git a/tirpc/rpc/auth_des.h b/tirpc/rpc/auth_des.h
+index 39b5332..77e169d 100644
+--- a/tirpc/rpc/auth_des.h
++++ b/tirpc/rpc/auth_des.h
+@@ -114,17 +114,25 @@ struct authdes_verf {
+  * Map a des credential into a unix cred.
+  *
+  */
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ extern int authdes_getucred( struct authdes_cred *, uid_t *, gid_t *, int *, gid_t * );
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ extern bool_t	xdr_authdes_cred(XDR *, struct authdes_cred *);
+ extern bool_t	xdr_authdes_verf(XDR *, struct authdes_verf *);
+ extern int	rtime(dev_t, struct netbuf *, int, struct timeval *,
+ 		    struct timeval *);
+ extern void	kgetnetname(char *);
+ extern enum auth_stat _svcauth_des(struct svc_req *, struct rpc_msg *);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ #endif /* ndef _TI_AUTH_DES_ */
+diff --git a/tirpc/rpc/auth_gss.h b/tirpc/rpc/auth_gss.h
+index d6f2bbd..a17b34b 100644
+--- a/tirpc/rpc/auth_gss.h
++++ b/tirpc/rpc/auth_gss.h
+@@ -104,28 +104,29 @@ struct rpc_gss_init_res {
+ #define MAXSEQ		0x80000000
+ 
+ /* Prototypes. */
+-__BEGIN_DECLS
+-bool_t	xdr_rpc_gss_cred	__P((XDR *xdrs, struct rpc_gss_cred *p));
+-bool_t	xdr_rpc_gss_init_args	__P((XDR *xdrs, gss_buffer_desc *p));
+-bool_t	xdr_rpc_gss_init_res	__P((XDR *xdrs, struct rpc_gss_init_res *p));
+-bool_t	xdr_rpc_gss_data	__P((XDR *xdrs, xdrproc_t xdr_func,
+-				     caddr_t xdr_ptr, gss_ctx_id_t ctx,
+-				     gss_qop_t qop, rpc_gss_svc_t svc,
+-				     u_int seq));
+-
+-AUTH   *authgss_create		__P((CLIENT *, gss_name_t,
+-				     struct rpc_gss_sec *));
+-AUTH   *authgss_create_default	__P((CLIENT *, char *, struct rpc_gss_sec *));
+-bool_t authgss_service		__P((AUTH *auth, int svc));
+-bool_t authgss_get_private_data	__P((AUTH *auth,
+-	    			     struct authgss_private_data *));
+-bool_t authgss_free_private_data __P((struct authgss_private_data *));
+-
+-void	gss_log_debug		__P((const char *fmt, ...));
+-void	gss_log_status		__P((char *m, OM_uint32 major,
+-				     OM_uint32 minor));
+-void	gss_log_hexdump		__P((const u_char *buf, int len, int offset));
+-
+-__END_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
++bool_t	xdr_rpc_gss_cred	(XDR *xdrs, struct rpc_gss_cred *p);
++bool_t	xdr_rpc_gss_init_args	(XDR *xdrs, gss_buffer_desc *p);
++bool_t	xdr_rpc_gss_init_res	(XDR *xdrs, struct rpc_gss_init_res *p);
++bool_t	xdr_rpc_gss_data	(XDR *xdrs, xdrproc_t xdr_func,
++				 caddr_t xdr_ptr, gss_ctx_id_t ctx,
++				 gss_qop_t qop, rpc_gss_svc_t svc,
++				 u_int seq);
++
++AUTH   *authgss_create		(CLIENT *, gss_name_t, struct rpc_gss_sec *);
++AUTH   *authgss_create_default	(CLIENT *, char *, struct rpc_gss_sec *);
++bool_t authgss_service		(AUTH *auth, int svc);
++bool_t authgss_get_private_data	(AUTH *auth, struct authgss_private_data *);
++bool_t authgss_free_private_data (struct authgss_private_data *);
++
++void	gss_log_debug		(const char *fmt, ...);
++void	gss_log_status		(char *m, OM_uint32 major, OM_uint32 minor);
++void	gss_log_hexdump		(const u_char *buf, int len, int offset);
++
++#ifdef __cplusplus
++}
++#endif
+ 
+ #endif /* !_TIRPC_AUTH_GSS_H */
+diff --git a/tirpc/rpc/auth_unix.h b/tirpc/rpc/auth_unix.h
+index 602889b..b10e71d 100644
+--- a/tirpc/rpc/auth_unix.h
++++ b/tirpc/rpc/auth_unix.h
+@@ -45,7 +45,6 @@
+ 
+ #ifndef _TIRPC_AUTH_UNIX_H
+ #define _TIRPC_AUTH_UNIX_H
+-#include <sys/cdefs.h>
+ 
+ /* The machine name is part of a credential; it may not exceed 255 bytes */
+ #define MAX_MACHINE_NAME 255
+@@ -67,9 +66,13 @@ struct authunix_parms {
+ 
+ #define authsys_parms authunix_parms
+ 
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ extern bool_t xdr_authunix_parms(XDR *, struct authunix_parms *);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ /*
+  * If a response verifier has flavor AUTH_SHORT,
+diff --git a/tirpc/rpc/clnt.h b/tirpc/rpc/clnt.h
+index 9ee619e..05f2215 100644
+--- a/tirpc/rpc/clnt.h
++++ b/tirpc/rpc/clnt.h
+@@ -42,7 +42,6 @@
+ #include <rpc/clnt_stat.h>
+ #include <rpc/auth.h>
+ 
+-#include <sys/cdefs.h>
+ #include <netconfig.h>
+ #include <sys/un.h>
+ 
+@@ -267,7 +266,9 @@ struct rpc_timers {
+  * Generic client creation routine. Supported protocols are those that
+  * belong to the nettype namespace (/etc/netconfig).
+  */
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ extern CLIENT *clnt_create(const char *, const rpcprog_t, const rpcvers_t,
+ 			   const char *);
+ /*
+@@ -414,32 +415,46 @@ extern CLIENT *clnt_dg_create(const int, const struct netbuf *,
+  */
+ extern CLIENT *clnt_raw_create(rpcprog_t, rpcvers_t);
+ 
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ 
+ /*
+  * Print why creation failed
+  */
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ extern void clnt_pcreateerror(const char *);			/* stderr */
+ extern char *clnt_spcreateerror(const char *);			/* string */
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ /*
+  * Like clnt_perror(), but is more verbose in its output
+  */
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ extern void clnt_perrno(enum clnt_stat);		/* stderr */
+ extern char *clnt_sperrno(enum clnt_stat);		/* string */
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ /*
+  * Print an English error message, given the client error code
+  */
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ extern void clnt_perror(CLIENT *, const char *);	 	/* stderr */
+ extern char *clnt_sperror(CLIENT *, const char *);		/* string */
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ 
+ /*
+@@ -450,9 +465,13 @@ struct rpc_createerr {
+ 	struct rpc_err cf_error; /* useful when cf_stat == RPC_PMAPFAILURE */
+ };
+ 
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ extern struct rpc_createerr	*__rpc_createerr(void);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ #define get_rpc_createerr()	(*(__rpc_createerr()))
+ #define rpc_createerr		(*(__rpc_createerr()))
+ 
+@@ -469,12 +488,16 @@ __END_DECLS
+  *	char *out;
+  *	const char *nettype;
+  */
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ extern enum clnt_stat rpc_call(const char *, const rpcprog_t,
+ 			       const rpcvers_t, const rpcproc_t,
+ 			       const xdrproc_t, const char *,
+ 			       const xdrproc_t, char *, const char *);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ /*
+  * RPC broadcast interface
+@@ -522,7 +545,9 @@ __END_DECLS
+ 
+ typedef bool_t (*resultproc_t)(caddr_t, ...);
+ 
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ extern enum clnt_stat rpc_broadcast(const rpcprog_t, const rpcvers_t,
+ 				    const rpcproc_t, const xdrproc_t,
+ 				    caddr_t, const xdrproc_t, caddr_t,
+@@ -532,7 +557,9 @@ extern enum clnt_stat rpc_broadcast_exp(const rpcprog_t, const rpcvers_t,
+ 					caddr_t, const xdrproc_t, caddr_t,
+ 					const resultproc_t, const int,
+ 					const int, const char *);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ /* For backward compatibility */
+ #include <rpc/clnt_soc.h>
+diff --git a/tirpc/rpc/clnt_soc.h b/tirpc/rpc/clnt_soc.h
+index 82330a3..6ec545c 100644
+--- a/tirpc/rpc/clnt_soc.h
++++ b/tirpc/rpc/clnt_soc.h
+@@ -46,7 +46,6 @@
+  * with TS-RPC.
+  */
+ 
+-#include <sys/cdefs.h>
+ 
+ #define UDPMSGSIZE      8800    /* rpc imposed limit on udp msg size */  
+ 
+@@ -61,27 +60,39 @@
+  *	u_int sendsz;
+  *	u_int recvsz;
+  */
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ extern CLIENT *clnttcp_create(struct sockaddr_in *, u_long, u_long, int *,
+ 			      u_int, u_int);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ /*
+  * Raw (memory) rpc.
+  */
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ extern CLIENT *clntraw_create(u_long, u_long);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ 
+ /*
+ IPv6 socket version 
+ */
+ #ifdef INET6
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ extern CLIENT *clnttcp6_create(struct sockaddr_in6 *, u_long, u_long, int *,
+ 			      u_int, u_int);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ #endif
+ 
+ /*
+@@ -105,7 +116,9 @@ __END_DECLS
+  *	u_int sendsz;
+  *	u_int recvsz;
+  */
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ extern CLIENT *clntudp_create(struct sockaddr_in *, u_long, u_long, 
+ 			      struct timeval, int *);
+ extern CLIENT *clntudp_bufcreate(struct sockaddr_in *, u_long, u_long,
+@@ -116,7 +129,9 @@ extern CLIENT *clntudp6_create(struct sockaddr_in6 *, u_long, u_long,
+ extern CLIENT *clntudp6_bufcreate(struct sockaddr_in6 *, u_long, u_long,
+ 				 struct timeval, int *, u_int, u_int);
+ #endif
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ 
+ #endif /* _RPC_CLNT_SOC_H */
+diff --git a/tirpc/rpc/des_crypt.h b/tirpc/rpc/des_crypt.h
+index 837088c..2358960 100644
+--- a/tirpc/rpc/des_crypt.h
++++ b/tirpc/rpc/des_crypt.h
+@@ -43,7 +43,6 @@
+ #ifndef _DES_DES_CRYPT_H
+ #define _DES_DES_CRYPT_H
+ 
+-#include <sys/cdefs.h>
+ #include <rpc/rpc.h>
+ 
+ #define DES_MAXDATA 8192	/* max bytes encrypted in one call */
+@@ -83,23 +82,35 @@
+ /*
+  * Cipher Block Chaining mode
+  */
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ int cbc_crypt( char *, char *, unsigned int, unsigned int, char *);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ /*
+  * Electronic Code Book mode
+  */
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ int ecb_crypt( char *, char *, unsigned int, unsigned int );
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ /* 
+  * Set des parity for a key.
+  * DES parity is odd and in the low bit of each byte
+  */
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ void des_setparity( char *);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ #endif  /* _DES_DES_CRYPT_H */
+diff --git a/tirpc/rpc/nettype.h b/tirpc/rpc/nettype.h
+index 92063c6..926797a 100644
+--- a/tirpc/rpc/nettype.h
++++ b/tirpc/rpc/nettype.h
+@@ -53,11 +53,15 @@
+ #define	_RPC_TCP	7
+ #define	_RPC_UDP	8
+ 
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ extern void *__rpc_setconf(const char *);
+ extern void __rpc_endconf(void *);
+ extern struct netconfig *__rpc_getconf(void *);
+ extern struct netconfig *__rpc_getconfip(const char *);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ #endif	/* !_TIRPC_NETTYPE_H */
+diff --git a/tirpc/rpc/pmap_clnt.h b/tirpc/rpc/pmap_clnt.h
+index 0d23908..6abd583 100644
+--- a/tirpc/rpc/pmap_clnt.h
++++ b/tirpc/rpc/pmap_clnt.h
+@@ -63,9 +63,10 @@
+ 
+ #ifndef _RPC_PMAP_CLNT_H_
+ #define _RPC_PMAP_CLNT_H_
+-#include <sys/cdefs.h>
+ 
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ extern bool_t		pmap_set(u_long, u_long, int, int);
+ extern bool_t		pmap_unset(u_long, u_long);
+ extern struct pmaplist	*pmap_getmaps(struct sockaddr_in *);
+@@ -80,6 +81,8 @@ extern enum clnt_stat	clnt_broadcast(u_long, u_long, u_long,
+ 				       resultproc_t);
+ extern u_short		pmap_getport(struct sockaddr_in *,
+ 				     u_long, u_long, u_int);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ #endif /* !_RPC_PMAP_CLNT_H_ */
+diff --git a/tirpc/rpc/pmap_prot.h b/tirpc/rpc/pmap_prot.h
+index c1a2546..75354ce 100644
+--- a/tirpc/rpc/pmap_prot.h
++++ b/tirpc/rpc/pmap_prot.h
+@@ -71,7 +71,6 @@
+ 
+ #ifndef _RPC_PMAP_PROT_H
+ #define _RPC_PMAP_PROT_H
+-#include <sys/cdefs.h>
+ 
+ #define PMAPPORT		((u_short)111)
+ #define PMAPPROG		((u_long)100000)
+@@ -97,10 +96,14 @@ struct pmaplist {
+ 	struct pmaplist *pml_next;
+ };
+ 
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ extern bool_t xdr_pmap(XDR *, struct pmap *);
+ extern bool_t xdr_pmaplist(XDR *, struct pmaplist **);
+ extern bool_t xdr_pmaplist_ptr(XDR *, struct pmaplist *);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ #endif /* !_RPC_PMAP_PROT_H */
+diff --git a/tirpc/rpc/pmap_rmt.h b/tirpc/rpc/pmap_rmt.h
+index dd59a15..2a385e7 100644
+--- a/tirpc/rpc/pmap_rmt.h
++++ b/tirpc/rpc/pmap_rmt.h
+@@ -41,7 +41,6 @@
+ 
+ #ifndef _RPC_PMAP_RMT_H
+ #define _RPC_PMAP_RMT_H
+-#include <sys/cdefs.h>
+ 
+ struct rmtcallargs {
+ 	u_long prog, vers, proc, arglen;
+@@ -56,9 +55,13 @@ struct rmtcallres {
+ 	xdrproc_t xdr_results;
+ };
+ 
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ extern bool_t xdr_rmtcall_args(XDR *, struct rmtcallargs *);
+ extern bool_t xdr_rmtcallres(XDR *, struct rmtcallres *);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ #endif /* !_RPC_PMAP_RMT_H */
+diff --git a/tirpc/rpc/rpc.h b/tirpc/rpc/rpc.h
+index 6c0222e..fac2fa9 100644
+--- a/tirpc/rpc/rpc.h
++++ b/tirpc/rpc/rpc.h
+@@ -79,9 +79,11 @@
+ #define UDPMSGSIZE 8800
+ #endif
+ 
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ extern int get_myaddress(struct sockaddr_in *);
+-extern int bindresvport(int, struct sockaddr_in *) __THROW;
++extern int bindresvport(int, struct sockaddr_in *);
+ extern int registerrpc(int, int, int, char *(*)(char [UDPMSGSIZE]),
+     xdrproc_t, xdrproc_t);
+ extern int callrpc(const char *, int, int, int, xdrproc_t, void *,
+@@ -93,18 +95,24 @@ struct netbuf *uaddr2taddr(const struct netconfig *, const char *);
+ 
+ struct sockaddr;
+ extern int bindresvport_sa(int, struct sockaddr *);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ /*
+  * The following are not exported interfaces, they are for internal library
+  * and rpcbind use only. Do not use, they may change without notice.
+  */
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ int __rpc_nconf2fd(const struct netconfig *);
+ int __rpc_nconf2fd_flags(const struct netconfig *, int);
+ int __rpc_nconf2sockinfo(const struct netconfig *, struct __rpc_sockinfo *);
+ int __rpc_fd2sockinfo(int, struct __rpc_sockinfo *);
+ u_int __rpc_get_t_size(int, int, int);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ #endif /* !_RPC_RPC_H */
+diff --git a/tirpc/rpc/rpc_com.h b/tirpc/rpc/rpc_com.h
+index cb3bbbb..236fcee 100644
+--- a/tirpc/rpc/rpc_com.h
++++ b/tirpc/rpc/rpc_com.h
+@@ -41,7 +41,6 @@
+ #ifndef _RPC_RPCCOM_H
+ #define	_RPC_RPCCOM_H
+ 
+-#include <sys/cdefs.h>
+ 
+ /* #pragma ident	"@(#)rpc_com.h	1.11	93/07/05 SMI" */
+ 
+@@ -55,7 +54,9 @@
+ #define __RPC_GETXID(now) ((u_int32_t)getpid() ^ (u_int32_t)(now)->tv_sec ^ \
+     (u_int32_t)(now)->tv_usec)
+ 
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ extern u_int __rpc_get_a_size(int);
+ extern int __rpc_dtbsize(void);
+ extern int _rpc_dtablesize(void);
+@@ -77,6 +78,8 @@ bool_t rpc_control(int,void *);
+ 
+ char *_get_next_token(char *, int);
+ 
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ #endif /* _RPC_RPCCOM_H */
+diff --git a/tirpc/rpc/rpc_msg.h b/tirpc/rpc/rpc_msg.h
+index 16d8eef..f7aabd8 100644
+--- a/tirpc/rpc/rpc_msg.h
++++ b/tirpc/rpc/rpc_msg.h
+@@ -161,7 +161,9 @@ struct rpc_msg {
+ #define	acpted_rply	ru.RM_rmb.ru.RP_ar
+ #define	rjcted_rply	ru.RM_rmb.ru.RP_dr
+ 
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ /*
+  * XDR routine to handle a rpc message.
+  * xdr_callmsg(xdrs, cmsg)
+@@ -210,6 +212,8 @@ extern bool_t	xdr_rejected_reply(XDR *, struct rejected_reply *);
+  * 	struct rpc_err *error;
+  */
+ extern void	_seterr_reply(struct rpc_msg *, struct rpc_err *);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ #endif /* !_TIRPC_RPC_MSG_H */
+diff --git a/tirpc/rpc/rpcb_clnt.h b/tirpc/rpc/rpcb_clnt.h
+index 7e64f8f..86d81f6 100644
+--- a/tirpc/rpc/rpcb_clnt.h
++++ b/tirpc/rpc/rpcb_clnt.h
+@@ -59,7 +59,9 @@
+ 
+ #include <rpc/types.h>
+ #include <rpc/rpcb_prot.h>
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ extern bool_t rpcb_set(const rpcprog_t, const rpcvers_t,
+ 		       const struct netconfig  *, const struct netbuf *);
+ extern bool_t rpcb_unset(const rpcprog_t, const rpcvers_t,
+@@ -78,6 +80,8 @@ extern bool_t rpcb_getaddr(const rpcprog_t, const rpcvers_t,
+ extern bool_t rpcb_gettime(const char *, time_t *);
+ extern char *rpcb_taddr2uaddr(struct netconfig *, struct netbuf *);
+ extern struct netbuf *rpcb_uaddr2taddr(struct netconfig *, char *);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ #endif	/* !_RPC_RPCB_CLNT_H */
+diff --git a/tirpc/rpc/rpcent.h b/tirpc/rpc/rpcent.h
+index c865e51..6619cd3 100644
+--- a/tirpc/rpc/rpcent.h
++++ b/tirpc/rpc/rpcent.h
+@@ -44,7 +44,9 @@
+ /*	#pragma ident "@(#)rpcent.h   1.13    94/04/25 SMI"	*/
+ /*      @(#)rpcent.h 1.1 88/12/06 SMI   */
+ 
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ 
+ /* These are defined in /usr/include/rpc/netdb.h */
+ #if 0
+@@ -60,8 +62,10 @@ extern struct rpcent *getrpcbynumber(int);
+ extern struct rpcent *getrpcent(void);
+ #endif
+ 
+-extern void setrpcent(int) __THROW;
+-extern void endrpcent(void) __THROW;
+-__END_DECLS
++extern void setrpcent(int);
++extern void endrpcent(void);
++#ifdef __cplusplus
++}
++#endif
+ 
+ #endif /* !_RPC_CENT_H */
+diff --git a/tirpc/rpc/svc.h b/tirpc/rpc/svc.h
+index b9691a8..8273c95 100644
+--- a/tirpc/rpc/svc.h
++++ b/tirpc/rpc/svc.h
+@@ -40,7 +40,6 @@
+ 
+ #ifndef _TIRPC_SVC_H
+ #define _TIRPC_SVC_H
+-#include <sys/cdefs.h>
+ 
+ /*
+  * This interface must manage two items concerning remote procedure calling:
+@@ -200,11 +199,15 @@ struct svc_req {
+  *	const struct netconfig *nconf;
+  */
+ 
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ extern bool_t	svc_reg(SVCXPRT *, const rpcprog_t, const rpcvers_t,
+ 			void (*)(struct svc_req *, SVCXPRT *),
+ 			const struct netconfig *);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ /*
+  * Service un-registration
+@@ -214,9 +217,13 @@ __END_DECLS
+  *	const rpcvers_t vers;
+  */
+ 
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ extern void	svc_unreg(const rpcprog_t, const rpcvers_t);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ /*
+  * Transport registration.
+@@ -224,9 +231,13 @@ __END_DECLS
+  * xprt_register(xprt)
+  *	SVCXPRT *xprt;
+  */
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ extern void	xprt_register(SVCXPRT *);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ /*
+  * Transport un-register
+@@ -234,9 +245,13 @@ __END_DECLS
+  * xprt_unregister(xprt)
+  *	SVCXPRT *xprt;
+  */
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ extern void	xprt_unregister(SVCXPRT *);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ 
+ /*
+@@ -265,7 +280,9 @@ __END_DECLS
+  * deadlock the caller and server processes!
+  */
+ 
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ extern bool_t	svc_sendreply(SVCXPRT *, xdrproc_t, void *);
+ extern void	svcerr_decode(SVCXPRT *);
+ extern void	svcerr_weakauth(SVCXPRT *);
+@@ -277,7 +294,9 @@ extern void	svcerr_systemerr(SVCXPRT *);
+ extern int	rpc_reg(rpcprog_t, rpcvers_t, rpcproc_t,
+ 			char *(*)(char *), xdrproc_t, xdrproc_t,
+ 			char *);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ /*
+  * Lowest level dispatching -OR- who owns this process anyway.
+@@ -306,11 +325,17 @@ extern int svc_fds;
+  * a small program implemented by the svc_rpc implementation itself;
+  * also see clnt.h for protocol numbers.
+  */
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ extern void rpctest_service(void);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ extern void	svc_getreq(int);
+ extern void	svc_getreqset(fd_set *);
+ extern void	svc_getreq_common(int);
+@@ -319,7 +344,9 @@ extern void	svc_getreq_poll(struct pollfd *, int);
+ 
+ extern void	svc_run(void);
+ extern void	svc_exit(void);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ /*
+  * Socket to use on svcxxx_create call to get default socket
+@@ -331,7 +358,9 @@ __END_DECLS
+  * These are the existing service side transport implementations
+  */
+ 
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ /*
+  * Transport independent svc_create routine.
+  */
+@@ -427,7 +456,9 @@ int svc_dg_enablecache(SVCXPRT *, const u_int);
+ 
+ int __rpc_get_local_uid(SVCXPRT *_transp, uid_t *_uid);
+ 
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ 
+ /* for backward compatibility */
+diff --git a/tirpc/rpc/svc_auth.h b/tirpc/rpc/svc_auth.h
+index 723c989..67608d0 100644
+--- a/tirpc/rpc/svc_auth.h
++++ b/tirpc/rpc/svc_auth.h
+@@ -65,13 +65,17 @@ typedef struct SVCAUTH {
+ /*
+  * Server side authenticator
+  */
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ extern enum auth_stat _gss_authenticate(struct svc_req *, struct rpc_msg *,
+ 		bool_t *);
+ extern enum auth_stat _authenticate(struct svc_req *, struct rpc_msg *);
+ extern int svc_auth_reg(int, enum auth_stat (*)(struct svc_req *,
+ 			  struct rpc_msg *));
+ 
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ #endif /* !_RPC_SVC_AUTH_H */
+diff --git a/tirpc/rpc/svc_soc.h b/tirpc/rpc/svc_soc.h
+index 6148d7b..9b7befa 100644
+--- a/tirpc/rpc/svc_soc.h
++++ b/tirpc/rpc/svc_soc.h
+@@ -38,7 +38,6 @@
+ 
+ #ifndef _RPC_SVC_SOC_H
+ #define _RPC_SVC_SOC_H
+-#include <sys/cdefs.h>
+ 
+ /* #pragma ident   "@(#)svc_soc.h  1.11    94/04/25 SMI" */
+ /*      svc_soc.h 1.8 89/05/01 SMI      */
+@@ -64,10 +63,14 @@
+  *	void (*dispatch)();
+  *	int protocol;    like TCP or UDP, zero means do not register 
+  */
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ extern bool_t	svc_register(SVCXPRT *, u_long, u_long,
+ 		    void (*)(struct svc_req *, SVCXPRT *), int);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ /*
+  * Service un-registration
+@@ -76,44 +79,64 @@ __END_DECLS
+  *	u_long prog;
+  *	u_long vers;
+  */
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ extern void	svc_unregister(u_long, u_long);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ 
+ /*
+  * Memory based rpc for testing and timing.
+  */
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ extern SVCXPRT *svcraw_create(void);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ 
+ /*
+  * Udp based rpc.
+  */
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ extern SVCXPRT *svcudp_create(int);
+ extern SVCXPRT *svcudp_bufcreate(int, u_int, u_int);
+ extern int svcudp_enablecache(SVCXPRT *, u_long);
+ extern SVCXPRT *svcudp6_create(int);
+ extern SVCXPRT *svcudp6_bufcreate(int, u_int, u_int);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ 
+ /*
+  * Tcp based rpc.
+  */
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ extern SVCXPRT *svctcp_create(int, u_int, u_int);
+ extern SVCXPRT *svctcp6_create(int, u_int, u_int);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ /*
+  * Fd based rpc.
+  */
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ extern SVCXPRT *svcfd_create(int, u_int, u_int);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ #endif /* !_RPC_SVC_SOC_H */
+diff --git a/tirpc/rpc/xdr.h b/tirpc/rpc/xdr.h
+index 613fab0..917c067 100644
+--- a/tirpc/rpc/xdr.h
++++ b/tirpc/rpc/xdr.h
+@@ -40,7 +40,6 @@
+ 
+ #ifndef _TIRPC_XDR_H
+ #define _TIRPC_XDR_H
+-#include <sys/cdefs.h>
+ #include <stdio.h>
+ #include <netinet/in.h>
+ 
+@@ -287,7 +286,9 @@ struct xdr_discrim {
+ /*
+  * These are the "generic" xdr routines.
+  */
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ extern bool_t	xdr_void(void);
+ extern bool_t	xdr_int(XDR *, int *);
+ extern bool_t	xdr_u_int(XDR *, u_int *);
+@@ -330,7 +331,9 @@ extern bool_t	xdr_hyper(XDR *, quad_t *);
+ extern bool_t	xdr_u_hyper(XDR *, u_quad_t *);
+ extern bool_t	xdr_longlong_t(XDR *, quad_t *);
+ extern bool_t	xdr_u_longlong_t(XDR *, u_quad_t *);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ /*
+  * Common opaque bytes objects used by many rpc protocols;
+@@ -348,7 +351,9 @@ extern bool_t   xdr_netobj(XDR *, struct netobj *);
+  * These are the public routines for the various implementations of
+  * xdr streams.
+  */
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ /* XDR using memory buffers */
+ extern void   xdrmem_create(XDR *, char *, u_int, enum xdr_op);
+ 
+@@ -369,6 +374,8 @@ extern bool_t xdrrec_skiprecord(XDR *);
+ /* true if no more input */
+ extern bool_t xdrrec_eof(XDR *);
+ extern u_int xdrrec_readbytes(XDR *, caddr_t, u_int);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ #endif /* !_TIRPC_XDR_H */
+-- 
+2.2.0
+
diff --git a/meta/recipes-extended/libtirpc/libtirpc/0004-Add-configure-option-to-disable-DES-authentication.patch b/meta/recipes-extended/libtirpc/libtirpc/0004-Add-configure-option-to-disable-DES-authentication.patch
new file mode 100644
index 0000000..4957ac8
--- /dev/null
+++ b/meta/recipes-extended/libtirpc/libtirpc/0004-Add-configure-option-to-disable-DES-authentication.patch
@@ -0,0 +1,99 @@
+From 5aff70a8fc06163c4ed5fcc45df4a734447000bd Mon Sep 17 00:00:00 2001
+From: Natanael Copa <ncopa@alpinelinux.org>
+Date: Mon, 15 Dec 2014 11:40:20 +0100
+Subject: [PATCH 4/9] Add configure option to disable DES authentication
+
+DES is not good for encryption anymore and some C libraries does not
+even implement it. We add a --disable-authdes to optionally disable
+it, but let it be enabled by default for compatibility.
+
+This is needed for musl libc.
+
+Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
+---
+Upstream-Status: Pending
+
+ configure.ac    |  6 ++++++
+ src/Makefile.am | 12 ++++++++++--
+ src/rpc_soc.c   |  2 ++
+ 3 files changed, 18 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 0180801..e6d3df5 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -15,6 +15,12 @@ if test x$enable_gssapi = xyes; then
+ 	AC_SUBST([GSSAPI_CFLAGS])
+ 	AC_SUBST([GSSAPI_LIBS])
+ fi
++
++AC_ARG_ENABLE(authdes,
++	[AC_HELP_STRING([--disable-authdes], [Disable DES authentication @<:@default=no@:>@])],
++      [],[enable_authdes=yes])
++AM_CONDITIONAL(AUTHDES, test x$enable_authdes = xyes)
++
+ AC_ARG_ENABLE(ipv6,
+ 	[AC_HELP_STRING([--disable-ipv6], [Disable IPv6 support @<:@default=no@:>@])],
+ 	[],[enable_ipv6=yes])
+diff --git a/src/Makefile.am b/src/Makefile.am
+index de57c8f..26ccbdf 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -42,6 +42,7 @@ lib_LTLIBRARIES = libtirpc.la
+ # misunderstanding of the purpose of library versions."
+ #
+ libtirpc_la_LDFLAGS = -lpthread -version-info 1:10:0
++libtirpc_la_CFLAGS =
+ 
+ libtirpc_la_SOURCES = auth_none.c auth_unix.c authunix_prot.c bindresvport.c clnt_bcast.c \
+         clnt_dg.c clnt_generic.c clnt_perror.c clnt_raw.c clnt_simple.c \
+@@ -51,7 +52,7 @@ libtirpc_la_SOURCES = auth_none.c auth_unix.c authunix_prot.c bindresvport.c cln
+         rpc_callmsg.c rpc_generic.c rpc_soc.c rpcb_clnt.c rpcb_prot.c \
+         rpcb_st_xdr.c svc.c svc_auth.c svc_dg.c svc_auth_unix.c svc_auth_none.c \
+         svc_generic.c svc_raw.c svc_run.c svc_simple.c svc_vc.c getpeereid.c \
+-        auth_time.c auth_des.c authdes_prot.c debug.c
++        auth_time.c debug.c
+ 
+ ## XDR
+ libtirpc_la_SOURCES += xdr.c xdr_rec.c xdr_array.c xdr_float.c xdr_mem.c xdr_reference.c xdr_stdio.c
+@@ -60,9 +61,16 @@ libtirpc_la_SOURCES += xdr.c xdr_rec.c xdr_array.c xdr_float.c xdr_mem.c xdr_ref
+ if GSS
+     libtirpc_la_SOURCES += auth_gss.c authgss_prot.c svc_auth_gss.c
+     libtirpc_la_LDFLAGS += $(GSSAPI_LIBS)
+-    libtirpc_la_CFLAGS = -DHAVE_RPCSEC_GSS $(GSSAPI_CFLAGS)
++    libtirpc_la_CFLAGS += -DHAVE_RPCSEC_GSS $(GSSAPI_CFLAGS)
+ endif
+ 
++## DES authentication
++if AUTHDES
++    libtirpc_la_SOURCES += auth_des.c authdes_prot.c
++    libtirpc_la_CFLAGS += -DHAVE_AUTHDES
++endif
++
++
+ ## libtirpc_a_SOURCES += key_call.c key_prot_xdr.c getpublickey.c
+ ## libtirpc_a_SOURCES += netname.c netnamer.c rpcdname.c \
+ ## libtirpc_a_SOURCES += rtime.c \
+diff --git a/src/rpc_soc.c b/src/rpc_soc.c
+index 338edbb..b12b116 100644
+--- a/src/rpc_soc.c
++++ b/src/rpc_soc.c
+@@ -520,6 +520,7 @@ clnt_broadcast(prog, vers, proc, xargs, argsp, xresults, resultsp, eachresult)
+ 	    (resultproc_t) rpc_wrap_bcast, "udp");
+ }
+ 
++#if HAVE_AUTHDES
+ /*
+  * Create the client des authentication object. Obsoleted by
+  * authdes_seccreate().
+@@ -551,6 +552,7 @@ fallback:
+ 	dummy = authdes_seccreate(servername, window, NULL, ckey);
+ 	return (dummy);
+ }
++#endif
+ 
+ /*
+  * Create a client handle for a unix connection. Obsoleted by clnt_vc_create()
+-- 
+2.2.0
+
diff --git a/meta/recipes-extended/libtirpc/libtirpc/0005-Fix-compile-error-IPPORT_RESERVED-undeclared.patch b/meta/recipes-extended/libtirpc/libtirpc/0005-Fix-compile-error-IPPORT_RESERVED-undeclared.patch
new file mode 100644
index 0000000..f76678b
--- /dev/null
+++ b/meta/recipes-extended/libtirpc/libtirpc/0005-Fix-compile-error-IPPORT_RESERVED-undeclared.patch
@@ -0,0 +1,35 @@
+From 90c2dea527d8fd95065e2a10147d050f978fe8a5 Mon Sep 17 00:00:00 2001
+From: Natanael Copa <ncopa@alpinelinux.org>
+Date: Thu, 24 Apr 2014 08:58:20 +0200
+Subject: [PATCH 5/9] Fix compile error: 'IPPORT_RESERVED' undeclared
+
+The IPPORT_RESERVED is declared in netdb.h. This fixes the following
+compile error with musl libc:
+
+bindresvport.c: In function 'bindresvport_sa':
+bindresvport.c:67:18: error: 'IPPORT_RESERVED' undeclared (first use in
+this function)
+ #define ENDPORT (IPPORT_RESERVED - 1)
+                   ^
+Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
+---
+Upstream-Status: Pending
+
+ src/bindresvport.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/bindresvport.c b/src/bindresvport.c
+index 950fbd1..2d8f2bc 100644
+--- a/src/bindresvport.c
++++ b/src/bindresvport.c
+@@ -36,6 +36,7 @@
+ #include <sys/types.h>
+ #include <sys/socket.h>
+ 
++#include <netdb.h>
+ #include <netinet/in.h>
+ 
+ #include <errno.h>
+-- 
+2.2.0
+
diff --git a/meta/recipes-extended/libtirpc/libtirpc/0006-Define-struct-rpcent-on-non-GNU-libc.patch b/meta/recipes-extended/libtirpc/libtirpc/0006-Define-struct-rpcent-on-non-GNU-libc.patch
new file mode 100644
index 0000000..21911f5
--- /dev/null
+++ b/meta/recipes-extended/libtirpc/libtirpc/0006-Define-struct-rpcent-on-non-GNU-libc.patch
@@ -0,0 +1,50 @@
+From 182305b99d3a63b6caf72fe5abba3fb88ebea679 Mon Sep 17 00:00:00 2001
+From: Natanael Copa <ncopa@alpinelinux.org>
+Date: Mon, 15 Dec 2014 14:55:37 +0100
+Subject: [PATCH 6/9] Define struct rpcent on non GNU libc
+
+This fixes the following compile error with musl libc:
+getrpcent.c:65:16: error: field 'rpc' has incomplete type
+  struct rpcent rpc;
+                ^
+
+Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
+---
+Upstream-Status: Pending
+
+This patch could probably be better. It assumes that only GNU libc has
+the rpcent struct defined, but the BSDs probably has it too.
+
+I am not sure if uClibc has it, but uClibc does define __GLIBC__ so it
+might be broken there too.
+
+I looked into using AC_CHECK_MEMBER but I don't think it is a good idea
+so depend on config.h since this is a header that will be installed on
+the system.
+
+I also found out that struct rpcent is also defined in
+/usr/include/gssrpc/netdb.h but I am unsure if we can depend on that
+too since GSS is optional.
+
+So I am a bit in doubt what the proper fix is. Meanwhile, this works
+for musl libc.
+
+ tirpc/rpc/rpcent.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tirpc/rpc/rpcent.h b/tirpc/rpc/rpcent.h
+index 6619cd3..147f909 100644
+--- a/tirpc/rpc/rpcent.h
++++ b/tirpc/rpc/rpcent.h
+@@ -49,7 +49,7 @@ extern "C" {
+ #endif
+ 
+ /* These are defined in /usr/include/rpc/netdb.h */
+-#if 0
++#if !defined(__GLIBC__)
+ struct rpcent {
+ 	char	*r_name;	/* name of server for this rpc program */
+ 	char	**r_aliases;	/* alias list */
+-- 
+2.2.0
+
diff --git a/meta/recipes-extended/libtirpc/libtirpc/0007-use-bsd-queue.patch b/meta/recipes-extended/libtirpc/libtirpc/0007-use-bsd-queue.patch
new file mode 100644
index 0000000..d717de7
--- /dev/null
+++ b/meta/recipes-extended/libtirpc/libtirpc/0007-use-bsd-queue.patch
@@ -0,0 +1,561 @@
+Add missing file from musl
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+
+Index: libtirpc-0.2.5/src/bsdqueue.h
+===================================================================
+--- /dev/null
++++ libtirpc-0.2.5/src/bsdqueue.h
+@@ -0,0 +1,531 @@
++/*	$OpenBSD: queue.h,v 1.31 2005/11/25 08:06:25 otto Exp $	*/
++/*	$NetBSD: queue.h,v 1.11 1996/05/16 05:17:14 mycroft Exp $	*/
++
++/*
++ * Copyright (c) 1991, 1993
++ *	The Regents of the University of California.  All rights reserved.
++ *
++ * Redistribution and use in source and binary forms, with or without
++ * modification, are permitted provided that the following conditions
++ * are met:
++ * 1. Redistributions of source code must retain the above copyright
++ *    notice, this list of conditions and the following disclaimer.
++ * 2. Redistributions in binary form must reproduce the above copyright
++ *    notice, this list of conditions and the following disclaimer in the
++ *    documentation and/or other materials provided with the distribution.
++ * 3. Neither the name of the University nor the names of its contributors
++ *    may be used to endorse or promote products derived from this software
++ *    without specific prior written permission.
++ *
++ * THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS'' AND
++ * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
++ * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
++ * ARE DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE
++ * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
++ * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
++ * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
++ * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
++ * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
++ * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
++ * SUCH DAMAGE.
++ *
++ *	@(#)queue.h	8.5 (Berkeley) 8/20/94
++ */
++
++#ifndef	_SYS_QUEUE_H_
++#define	_SYS_QUEUE_H_
++
++/*
++ * This file defines five types of data structures: singly-linked lists,
++ * lists, simple queues, tail queues, and circular queues.
++ *
++ *
++ * A singly-linked list is headed by a single forward pointer. The elements
++ * are singly linked for minimum space and pointer manipulation overhead at
++ * the expense of O(n) removal for arbitrary elements. New elements can be
++ * added to the list after an existing element or at the head of the list.
++ * Elements being removed from the head of the list should use the explicit
++ * macro for this purpose for optimum efficiency. A singly-linked list may
++ * only be traversed in the forward direction.  Singly-linked lists are ideal
++ * for applications with large datasets and few or no removals or for
++ * implementing a LIFO queue.
++ *
++ * A list is headed by a single forward pointer (or an array of forward
++ * pointers for a hash table header). The elements are doubly linked
++ * so that an arbitrary element can be removed without a need to
++ * traverse the list. New elements can be added to the list before
++ * or after an existing element or at the head of the list. A list
++ * may only be traversed in the forward direction.
++ *
++ * A simple queue is headed by a pair of pointers, one the head of the
++ * list and the other to the tail of the list. The elements are singly
++ * linked to save space, so elements can only be removed from the
++ * head of the list. New elements can be added to the list before or after
++ * an existing element, at the head of the list, or at the end of the
++ * list. A simple queue may only be traversed in the forward direction.
++ *
++ * A tail queue is headed by a pair of pointers, one to the head of the
++ * list and the other to the tail of the list. The elements are doubly
++ * linked so that an arbitrary element can be removed without a need to
++ * traverse the list. New elements can be added to the list before or
++ * after an existing element, at the head of the list, or at the end of
++ * the list. A tail queue may be traversed in either direction.
++ *
++ * A circle queue is headed by a pair of pointers, one to the head of the
++ * list and the other to the tail of the list. The elements are doubly
++ * linked so that an arbitrary element can be removed without a need to
++ * traverse the list. New elements can be added to the list before or after
++ * an existing element, at the head of the list, or at the end of the list.
++ * A circle queue may be traversed in either direction, but has a more
++ * complex end of list detection.
++ *
++ * For details on the use of these macros, see the queue(3) manual page.
++ */
++
++#ifdef QUEUE_MACRO_DEBUG
++#define _Q_INVALIDATE(a) (a) = ((void *)-1)
++#else
++#define _Q_INVALIDATE(a)
++#endif
++
++/*
++ * Singly-linked List definitions.
++ */
++#define SLIST_HEAD(name, type)						\
++struct name {								\
++	struct type *slh_first;	/* first element */			\
++}
++
++#define	SLIST_HEAD_INITIALIZER(head)					\
++	{ NULL }
++
++#ifdef SLIST_ENTRY
++#undef SLIST_ENTRY
++#endif
++
++#define SLIST_ENTRY(type)						\
++struct {								\
++	struct type *sle_next;	/* next element */			\
++}
++
++/*
++ * Singly-linked List access methods.
++ */
++#define	SLIST_FIRST(head)	((head)->slh_first)
++#define	SLIST_END(head)		NULL
++#define	SLIST_EMPTY(head)	(SLIST_FIRST(head) == SLIST_END(head))
++#define	SLIST_NEXT(elm, field)	((elm)->field.sle_next)
++
++#define	SLIST_FOREACH(var, head, field)					\
++	for((var) = SLIST_FIRST(head);					\
++	    (var) != SLIST_END(head);					\
++	    (var) = SLIST_NEXT(var, field))
++
++#define	SLIST_FOREACH_PREVPTR(var, varp, head, field)			\
++	for ((varp) = &SLIST_FIRST((head));				\
++	    ((var) = *(varp)) != SLIST_END(head);			\
++	    (varp) = &SLIST_NEXT((var), field))
++
++/*
++ * Singly-linked List functions.
++ */
++#define	SLIST_INIT(head) {						\
++	SLIST_FIRST(head) = SLIST_END(head);				\
++}
++
++#define	SLIST_INSERT_AFTER(slistelm, elm, field) do {			\
++	(elm)->field.sle_next = (slistelm)->field.sle_next;		\
++	(slistelm)->field.sle_next = (elm);				\
++} while (0)
++
++#define	SLIST_INSERT_HEAD(head, elm, field) do {			\
++	(elm)->field.sle_next = (head)->slh_first;			\
++	(head)->slh_first = (elm);					\
++} while (0)
++
++#define	SLIST_REMOVE_NEXT(head, elm, field) do {			\
++	(elm)->field.sle_next = (elm)->field.sle_next->field.sle_next;	\
++} while (0)
++
++#define	SLIST_REMOVE_HEAD(head, field) do {				\
++	(head)->slh_first = (head)->slh_first->field.sle_next;		\
++} while (0)
++
++#define SLIST_REMOVE(head, elm, type, field) do {			\
++	if ((head)->slh_first == (elm)) {				\
++		SLIST_REMOVE_HEAD((head), field);			\
++	} else {							\
++		struct type *curelm = (head)->slh_first;		\
++									\
++		while (curelm->field.sle_next != (elm))			\
++			curelm = curelm->field.sle_next;		\
++		curelm->field.sle_next =				\
++		    curelm->field.sle_next->field.sle_next;		\
++		_Q_INVALIDATE((elm)->field.sle_next);			\
++	}								\
++} while (0)
++
++/*
++ * List definitions.
++ */
++#define LIST_HEAD(name, type)						\
++struct name {								\
++	struct type *lh_first;	/* first element */			\
++}
++
++#define LIST_HEAD_INITIALIZER(head)					\
++	{ NULL }
++
++#define LIST_ENTRY(type)						\
++struct {								\
++	struct type *le_next;	/* next element */			\
++	struct type **le_prev;	/* address of previous next element */	\
++}
++
++/*
++ * List access methods
++ */
++#define	LIST_FIRST(head)		((head)->lh_first)
++#define	LIST_END(head)			NULL
++#define	LIST_EMPTY(head)		(LIST_FIRST(head) == LIST_END(head))
++#define	LIST_NEXT(elm, field)		((elm)->field.le_next)
++
++#define LIST_FOREACH(var, head, field)					\
++	for((var) = LIST_FIRST(head);					\
++	    (var)!= LIST_END(head);					\
++	    (var) = LIST_NEXT(var, field))
++
++/*
++ * List functions.
++ */
++#define	LIST_INIT(head) do {						\
++	LIST_FIRST(head) = LIST_END(head);				\
++} while (0)
++
++#define LIST_INSERT_AFTER(listelm, elm, field) do {			\
++	if (((elm)->field.le_next = (listelm)->field.le_next) != NULL)	\
++		(listelm)->field.le_next->field.le_prev =		\
++		    &(elm)->field.le_next;				\
++	(listelm)->field.le_next = (elm);				\
++	(elm)->field.le_prev = &(listelm)->field.le_next;		\
++} while (0)
++
++#define	LIST_INSERT_BEFORE(listelm, elm, field) do {			\
++	(elm)->field.le_prev = (listelm)->field.le_prev;		\
++	(elm)->field.le_next = (listelm);				\
++	*(listelm)->field.le_prev = (elm);				\
++	(listelm)->field.le_prev = &(elm)->field.le_next;		\
++} while (0)
++
++#define LIST_INSERT_HEAD(head, elm, field) do {				\
++	if (((elm)->field.le_next = (head)->lh_first) != NULL)		\
++		(head)->lh_first->field.le_prev = &(elm)->field.le_next;\
++	(head)->lh_first = (elm);					\
++	(elm)->field.le_prev = &(head)->lh_first;			\
++} while (0)
++
++#define LIST_REMOVE(elm, field) do {					\
++	if ((elm)->field.le_next != NULL)				\
++		(elm)->field.le_next->field.le_prev =			\
++		    (elm)->field.le_prev;				\
++	*(elm)->field.le_prev = (elm)->field.le_next;			\
++	_Q_INVALIDATE((elm)->field.le_prev);				\
++	_Q_INVALIDATE((elm)->field.le_next);				\
++} while (0)
++
++#define LIST_REPLACE(elm, elm2, field) do {				\
++	if (((elm2)->field.le_next = (elm)->field.le_next) != NULL)	\
++		(elm2)->field.le_next->field.le_prev =			\
++		    &(elm2)->field.le_next;				\
++	(elm2)->field.le_prev = (elm)->field.le_prev;			\
++	*(elm2)->field.le_prev = (elm2);				\
++	_Q_INVALIDATE((elm)->field.le_prev);				\
++	_Q_INVALIDATE((elm)->field.le_next);				\
++} while (0)
++
++/*
++ * Simple queue definitions.
++ */
++#define SIMPLEQ_HEAD(name, type)					\
++struct name {								\
++	struct type *sqh_first;	/* first element */			\
++	struct type **sqh_last;	/* addr of last next element */		\
++}
++
++#define SIMPLEQ_HEAD_INITIALIZER(head)					\
++	{ NULL, &(head).sqh_first }
++
++#define SIMPLEQ_ENTRY(type)						\
++struct {								\
++	struct type *sqe_next;	/* next element */			\
++}
++
++/*
++ * Simple queue access methods.
++ */
++#define	SIMPLEQ_FIRST(head)	    ((head)->sqh_first)
++#define	SIMPLEQ_END(head)	    NULL
++#define	SIMPLEQ_EMPTY(head)	    (SIMPLEQ_FIRST(head) == SIMPLEQ_END(head))
++#define	SIMPLEQ_NEXT(elm, field)    ((elm)->field.sqe_next)
++
++#define SIMPLEQ_FOREACH(var, head, field)				\
++	for((var) = SIMPLEQ_FIRST(head);				\
++	    (var) != SIMPLEQ_END(head);					\
++	    (var) = SIMPLEQ_NEXT(var, field))
++
++/*
++ * Simple queue functions.
++ */
++#define	SIMPLEQ_INIT(head) do {						\
++	(head)->sqh_first = NULL;					\
++	(head)->sqh_last = &(head)->sqh_first;				\
++} while (0)
++
++#define SIMPLEQ_INSERT_HEAD(head, elm, field) do {			\
++	if (((elm)->field.sqe_next = (head)->sqh_first) == NULL)	\
++		(head)->sqh_last = &(elm)->field.sqe_next;		\
++	(head)->sqh_first = (elm);					\
++} while (0)
++
++#define SIMPLEQ_INSERT_TAIL(head, elm, field) do {			\
++	(elm)->field.sqe_next = NULL;					\
++	*(head)->sqh_last = (elm);					\
++	(head)->sqh_last = &(elm)->field.sqe_next;			\
++} while (0)
++
++#define SIMPLEQ_INSERT_AFTER(head, listelm, elm, field) do {		\
++	if (((elm)->field.sqe_next = (listelm)->field.sqe_next) == NULL)\
++		(head)->sqh_last = &(elm)->field.sqe_next;		\
++	(listelm)->field.sqe_next = (elm);				\
++} while (0)
++
++#define SIMPLEQ_REMOVE_HEAD(head, field) do {			\
++	if (((head)->sqh_first = (head)->sqh_first->field.sqe_next) == NULL) \
++		(head)->sqh_last = &(head)->sqh_first;			\
++} while (0)
++
++/*
++ * Tail queue definitions.
++ */
++#define TAILQ_HEAD(name, type)						\
++struct name {								\
++	struct type *tqh_first;	/* first element */			\
++	struct type **tqh_last;	/* addr of last next element */		\
++}
++
++#define TAILQ_HEAD_INITIALIZER(head)					\
++	{ NULL, &(head).tqh_first }
++
++#define TAILQ_ENTRY(type)						\
++struct {								\
++	struct type *tqe_next;	/* next element */			\
++	struct type **tqe_prev;	/* address of previous next element */	\
++}
++
++/*
++ * tail queue access methods
++ */
++#define	TAILQ_FIRST(head)		((head)->tqh_first)
++#define	TAILQ_END(head)			NULL
++#define	TAILQ_NEXT(elm, field)		((elm)->field.tqe_next)
++#define TAILQ_LAST(head, headname)					\
++	(*(((struct headname *)((head)->tqh_last))->tqh_last))
++/* XXX */
++#define TAILQ_PREV(elm, headname, field)				\
++	(*(((struct headname *)((elm)->field.tqe_prev))->tqh_last))
++#define	TAILQ_EMPTY(head)						\
++	(TAILQ_FIRST(head) == TAILQ_END(head))
++
++#define TAILQ_FOREACH(var, head, field)					\
++	for((var) = TAILQ_FIRST(head);					\
++	    (var) != TAILQ_END(head);					\
++	    (var) = TAILQ_NEXT(var, field))
++
++#define TAILQ_FOREACH_REVERSE(var, head, headname, field)		\
++	for((var) = TAILQ_LAST(head, headname);				\
++	    (var) != TAILQ_END(head);					\
++	    (var) = TAILQ_PREV(var, headname, field))
++
++/*
++ * Tail queue functions.
++ */
++#define	TAILQ_INIT(head) do {						\
++	(head)->tqh_first = NULL;					\
++	(head)->tqh_last = &(head)->tqh_first;				\
++} while (0)
++
++#define TAILQ_INSERT_HEAD(head, elm, field) do {			\
++	if (((elm)->field.tqe_next = (head)->tqh_first) != NULL)	\
++		(head)->tqh_first->field.tqe_prev =			\
++		    &(elm)->field.tqe_next;				\
++	else								\
++		(head)->tqh_last = &(elm)->field.tqe_next;		\
++	(head)->tqh_first = (elm);					\
++	(elm)->field.tqe_prev = &(head)->tqh_first;			\
++} while (0)
++
++#define TAILQ_INSERT_TAIL(head, elm, field) do {			\
++	(elm)->field.tqe_next = NULL;					\
++	(elm)->field.tqe_prev = (head)->tqh_last;			\
++	*(head)->tqh_last = (elm);					\
++	(head)->tqh_last = &(elm)->field.tqe_next;			\
++} while (0)
++
++#define TAILQ_INSERT_AFTER(head, listelm, elm, field) do {		\
++	if (((elm)->field.tqe_next = (listelm)->field.tqe_next) != NULL)\
++		(elm)->field.tqe_next->field.tqe_prev =			\
++		    &(elm)->field.tqe_next;				\
++	else								\
++		(head)->tqh_last = &(elm)->field.tqe_next;		\
++	(listelm)->field.tqe_next = (elm);				\
++	(elm)->field.tqe_prev = &(listelm)->field.tqe_next;		\
++} while (0)
++
++#define	TAILQ_INSERT_BEFORE(listelm, elm, field) do {			\
++	(elm)->field.tqe_prev = (listelm)->field.tqe_prev;		\
++	(elm)->field.tqe_next = (listelm);				\
++	*(listelm)->field.tqe_prev = (elm);				\
++	(listelm)->field.tqe_prev = &(elm)->field.tqe_next;		\
++} while (0)
++
++#define TAILQ_REMOVE(head, elm, field) do {				\
++	if (((elm)->field.tqe_next) != NULL)				\
++		(elm)->field.tqe_next->field.tqe_prev =			\
++		    (elm)->field.tqe_prev;				\
++	else								\
++		(head)->tqh_last = (elm)->field.tqe_prev;		\
++	*(elm)->field.tqe_prev = (elm)->field.tqe_next;			\
++	_Q_INVALIDATE((elm)->field.tqe_prev);				\
++	_Q_INVALIDATE((elm)->field.tqe_next);				\
++} while (0)
++
++#define TAILQ_REPLACE(head, elm, elm2, field) do {			\
++	if (((elm2)->field.tqe_next = (elm)->field.tqe_next) != NULL)	\
++		(elm2)->field.tqe_next->field.tqe_prev =		\
++		    &(elm2)->field.tqe_next;				\
++	else								\
++		(head)->tqh_last = &(elm2)->field.tqe_next;		\
++	(elm2)->field.tqe_prev = (elm)->field.tqe_prev;			\
++	*(elm2)->field.tqe_prev = (elm2);				\
++	_Q_INVALIDATE((elm)->field.tqe_prev);				\
++	_Q_INVALIDATE((elm)->field.tqe_next);				\
++} while (0)
++
++/*
++ * Circular queue definitions.
++ */
++#define CIRCLEQ_HEAD(name, type)					\
++struct name {								\
++	struct type *cqh_first;		/* first element */		\
++	struct type *cqh_last;		/* last element */		\
++}
++
++#define CIRCLEQ_HEAD_INITIALIZER(head)					\
++	{ CIRCLEQ_END(&head), CIRCLEQ_END(&head) }
++
++#define CIRCLEQ_ENTRY(type)						\
++struct {								\
++	struct type *cqe_next;		/* next element */		\
++	struct type *cqe_prev;		/* previous element */		\
++}
++
++/*
++ * Circular queue access methods
++ */
++#define	CIRCLEQ_FIRST(head)		((head)->cqh_first)
++#define	CIRCLEQ_LAST(head)		((head)->cqh_last)
++#define	CIRCLEQ_END(head)		((void *)(head))
++#define	CIRCLEQ_NEXT(elm, field)	((elm)->field.cqe_next)
++#define	CIRCLEQ_PREV(elm, field)	((elm)->field.cqe_prev)
++#define	CIRCLEQ_EMPTY(head)						\
++	(CIRCLEQ_FIRST(head) == CIRCLEQ_END(head))
++
++#define CIRCLEQ_FOREACH(var, head, field)				\
++	for((var) = CIRCLEQ_FIRST(head);				\
++	    (var) != CIRCLEQ_END(head);					\
++	    (var) = CIRCLEQ_NEXT(var, field))
++
++#define CIRCLEQ_FOREACH_REVERSE(var, head, field)			\
++	for((var) = CIRCLEQ_LAST(head);					\
++	    (var) != CIRCLEQ_END(head);					\
++	    (var) = CIRCLEQ_PREV(var, field))
++
++/*
++ * Circular queue functions.
++ */
++#define	CIRCLEQ_INIT(head) do {						\
++	(head)->cqh_first = CIRCLEQ_END(head);				\
++	(head)->cqh_last = CIRCLEQ_END(head);				\
++} while (0)
++
++#define CIRCLEQ_INSERT_AFTER(head, listelm, elm, field) do {		\
++	(elm)->field.cqe_next = (listelm)->field.cqe_next;		\
++	(elm)->field.cqe_prev = (listelm);				\
++	if ((listelm)->field.cqe_next == CIRCLEQ_END(head))		\
++		(head)->cqh_last = (elm);				\
++	else								\
++		(listelm)->field.cqe_next->field.cqe_prev = (elm);	\
++	(listelm)->field.cqe_next = (elm);				\
++} while (0)
++
++#define CIRCLEQ_INSERT_BEFORE(head, listelm, elm, field) do {		\
++	(elm)->field.cqe_next = (listelm);				\
++	(elm)->field.cqe_prev = (listelm)->field.cqe_prev;		\
++	if ((listelm)->field.cqe_prev == CIRCLEQ_END(head))		\
++		(head)->cqh_first = (elm);				\
++	else								\
++		(listelm)->field.cqe_prev->field.cqe_next = (elm);	\
++	(listelm)->field.cqe_prev = (elm);				\
++} while (0)
++
++#define CIRCLEQ_INSERT_HEAD(head, elm, field) do {			\
++	(elm)->field.cqe_next = (head)->cqh_first;			\
++	(elm)->field.cqe_prev = CIRCLEQ_END(head);			\
++	if ((head)->cqh_last == CIRCLEQ_END(head))			\
++		(head)->cqh_last = (elm);				\
++	else								\
++		(head)->cqh_first->field.cqe_prev = (elm);		\
++	(head)->cqh_first = (elm);					\
++} while (0)
++
++#define CIRCLEQ_INSERT_TAIL(head, elm, field) do {			\
++	(elm)->field.cqe_next = CIRCLEQ_END(head);			\
++	(elm)->field.cqe_prev = (head)->cqh_last;			\
++	if ((head)->cqh_first == CIRCLEQ_END(head))			\
++		(head)->cqh_first = (elm);				\
++	else								\
++		(head)->cqh_last->field.cqe_next = (elm);		\
++	(head)->cqh_last = (elm);					\
++} while (0)
++
++#define	CIRCLEQ_REMOVE(head, elm, field) do {				\
++	if ((elm)->field.cqe_next == CIRCLEQ_END(head))			\
++		(head)->cqh_last = (elm)->field.cqe_prev;		\
++	else								\
++		(elm)->field.cqe_next->field.cqe_prev =			\
++		    (elm)->field.cqe_prev;				\
++	if ((elm)->field.cqe_prev == CIRCLEQ_END(head))			\
++		(head)->cqh_first = (elm)->field.cqe_next;		\
++	else								\
++		(elm)->field.cqe_prev->field.cqe_next =			\
++		    (elm)->field.cqe_next;				\
++	_Q_INVALIDATE((elm)->field.cqe_prev);				\
++	_Q_INVALIDATE((elm)->field.cqe_next);				\
++} while (0)
++
++#define CIRCLEQ_REPLACE(head, elm, elm2, field) do {			\
++	if (((elm2)->field.cqe_next = (elm)->field.cqe_next) ==		\
++	    CIRCLEQ_END(head))						\
++		(head).cqh_last = (elm2);				\
++	else								\
++		(elm2)->field.cqe_next->field.cqe_prev = (elm2);	\
++	if (((elm2)->field.cqe_prev = (elm)->field.cqe_prev) ==		\
++	    CIRCLEQ_END(head))						\
++		(head).cqh_first = (elm2);				\
++	else								\
++		(elm2)->field.cqe_prev->field.cqe_next = (elm2);	\
++	_Q_INVALIDATE((elm)->field.cqe_prev);				\
++	_Q_INVALIDATE((elm)->field.cqe_next);				\
++} while (0)
++
++#endif	/* !_SYS_QUEUE_H_ */
+Index: libtirpc-0.2.5/src/clnt_bcast.c
+===================================================================
+--- libtirpc-0.2.5.orig/src/clnt_bcast.c
++++ libtirpc-0.2.5/src/clnt_bcast.c
+@@ -40,7 +40,6 @@
+  */
+ #include <sys/socket.h>
+ #include <sys/types.h>
+-#include <sys/queue.h>
+ 
+ #include <net/if.h>
+ #include <netinet/in.h>
+@@ -64,6 +63,7 @@
+ 
+ #include "rpc_com.h"
+ #include "debug.h"
++#include "bsdqueue.h"
+ 
+ #define	MAXBCAST 20	/* Max no of broadcasting transports */
+ #define	INITTIME 4000	/* Time to wait initially */
diff --git a/meta/recipes-extended/libtirpc/libtirpc/nis.h b/meta/recipes-extended/libtirpc/libtirpc/nis.h
new file mode 100644
index 0000000..8e29596
--- /dev/null
+++ b/meta/recipes-extended/libtirpc/libtirpc/nis.h
@@ -0,0 +1,545 @@
+/*
+ * Sun RPC is a product of Sun Microsystems, Inc. and is provided for
+ * unrestricted use provided that this legend is included on all tape
+ * media and as a part of the software program in whole or part.  Users
+ * may copy or modify Sun RPC without charge, but are not authorized
+ * to license or distribute it to anyone else except as part of a product or
+ * program developed by the user or with the express written consent of
+ * Sun Microsystems, Inc.
+ *
+ * SUN RPC IS PROVIDED AS IS WITH NO WARRANTIES OF ANY KIND INCLUDING THE
+ * WARRANTIES OF DESIGN, MERCHANTIBILITY AND FITNESS FOR A PARTICULAR
+ * PURPOSE, OR ARISING FROM A COURSE OF DEALING, USAGE OR TRADE PRACTICE.
+ *
+ * Sun RPC is provided with no support and without any obligation on the
+ * part of Sun Microsystems, Inc. to assist in its use, correction,
+ * modification or enhancement.
+ *
+ * SUN MICROSYSTEMS, INC. SHALL HAVE NO LIABILITY WITH RESPECT TO THE
+ * INFRINGEMENT OF COPYRIGHTS, TRADE SECRETS OR ANY PATENTS BY SUN RPC
+ * OR ANY PART THEREOF.
+ *
+ * In no event will Sun Microsystems, Inc. be liable for any lost revenue
+ * or profits or other special, indirect and consequential damages, even if
+ * Sun has been advised of the possibility of such damages.
+ *
+ * Sun Microsystems, Inc.
+ * 2550 Garcia Avenue
+ * Mountain View, California  94043
+ */
+
+#ifndef _RPCSVC_NIS_H
+#define _RPCSVC_NIS_H 1
+
+#include <features.h>
+//#include <rpc/rpc.h>
+//#include <rpcsvc/nis_tags.h>
+
+#ifdef __cplusplus
+extern "C" {
+#endif
+
+/*
+ *	nis.h
+ *
+ *	This file is the main include file for NIS clients. It contains
+ *	both the client library function defines and the various data
+ * 	structures used by the NIS service. It includes the file nis_tags.h
+ *	which defines the tag values. This allows the tags to change without
+ *	having to change the nis.x file.
+ *
+ *	NOTE : THIS FILE IS NOT GENERATED WITH RPCGEN ! SO YOU HAVE TO
+ *             ADD ALL THE CHANGES ON nis_*.x FILES HERE AGAIN !
+ *
+ *      I have removed all the Solaris internal structs and variables,
+ *      because they are not supported, Sun changed them between various
+ *      releases and they shouldn't be used in user programs.
+ *                                              <kukuk@suse.de>
+ */
+
+
+#ifndef __nis_object_h
+#define __nis_object_h
+
+#define NIS_MAXSTRINGLEN 255
+#define NIS_MAXNAMELEN 1024
+#define NIS_MAXATTRNAME 32
+#define NIS_MAXATTRVAL 2048
+#define NIS_MAXCOLUMNS 64
+#define NIS_MAXATTR 16
+#define NIS_MAXPATH 1024
+#define NIS_MAXREPLICAS 128
+#define NIS_MAXLINKS 16
+#define NIS_PK_NONE 0
+#define NIS_PK_DH 1
+#define NIS_PK_RSA 2
+#define NIS_PK_KERB 3
+#define NIS_PK_DHEXT 4
+
+struct nis_attr {
+	char *zattr_ndx;
+	struct {
+		u_int zattr_val_len;
+		char *zattr_val_val;
+	} zattr_val;
+};
+typedef struct nis_attr nis_attr;
+
+typedef char *nis_name;
+
+enum zotypes {
+	BOGUS_OBJ = 0,
+	NO_OBJ = 1,
+	DIRECTORY_OBJ = 2,
+	GROUP_OBJ = 3,
+	TABLE_OBJ = 4,
+	ENTRY_OBJ = 5,
+	LINK_OBJ = 6,
+	PRIVATE_OBJ = 7,
+	NIS_BOGUS_OBJ = 0,
+	NIS_NO_OBJ = 1,
+	NIS_DIRECTORY_OBJ = 2,
+	NIS_GROUP_OBJ = 3,
+	NIS_TABLE_OBJ = 4,
+	NIS_ENTRY_OBJ = 5,
+	NIS_LINK_OBJ = 6,
+	NIS_PRIVATE_OBJ = 7
+};
+typedef enum zotypes zotypes;
+
+enum nstype {
+	UNKNOWN = 0,
+	NIS = 1,
+	SUNYP = 2,
+	IVY = 3,
+	DNS = 4,
+	X500 = 5,
+	DNANS = 6,
+	XCHS = 7,
+	CDS = 8,
+};
+typedef enum nstype nstype;
+
+struct oar_mask {
+        uint32_t oa_rights;
+        zotypes oa_otype;
+};
+typedef struct oar_mask oar_mask;
+
+struct endpoint {
+	char *uaddr;
+	char *family;
+	char *proto;
+};
+typedef struct endpoint endpoint;
+
+struct nis_server {
+	nis_name name;
+	struct {
+		u_int ep_len;
+		endpoint *ep_val;
+	} ep;
+	uint32_t key_type;
+	netobj pkey;
+};
+typedef struct nis_server nis_server;
+
+struct directory_obj {
+	nis_name do_name;
+	nstype do_type;
+	struct {
+		u_int do_servers_len;
+		nis_server *do_servers_val;
+	} do_servers;
+	uint32_t do_ttl;
+	struct {
+		u_int do_armask_len;
+		oar_mask *do_armask_val;
+	} do_armask;
+};
+typedef struct directory_obj directory_obj;
+
+#define EN_BINARY 1
+#define EN_CRYPT 2
+#define EN_XDR 4
+#define EN_MODIFIED 8
+#define EN_ASN1 64
+
+struct entry_col {
+	uint32_t ec_flags;
+	struct {
+		u_int ec_value_len;
+		char *ec_value_val;
+	} ec_value;
+};
+typedef struct entry_col entry_col;
+
+struct entry_obj {
+	char *en_type;
+	struct {
+		u_int en_cols_len;
+		entry_col *en_cols_val;
+	} en_cols;
+};
+typedef struct entry_obj entry_obj;
+
+struct group_obj {
+	uint32_t gr_flags;
+	struct {
+		u_int gr_members_len;
+		nis_name *gr_members_val;
+	} gr_members;
+};
+typedef struct group_obj group_obj;
+
+struct link_obj {
+	zotypes li_rtype;
+	struct {
+		u_int li_attrs_len;
+		nis_attr *li_attrs_val;
+	} li_attrs;
+	nis_name li_name;
+};
+typedef struct link_obj link_obj;
+
+#define TA_BINARY 1
+#define TA_CRYPT 2
+#define TA_XDR 4
+#define TA_SEARCHABLE 8
+#define TA_CASE 16
+#define TA_MODIFIED 32
+#define TA_ASN1 64
+
+struct table_col {
+	char *tc_name;
+	uint32_t tc_flags;
+	uint32_t tc_rights;
+};
+typedef struct table_col table_col;
+
+struct table_obj {
+	char *ta_type;
+	int ta_maxcol;
+	u_char ta_sep;
+	struct {
+		u_int ta_cols_len;
+		table_col *ta_cols_val;
+	} ta_cols;
+	char *ta_path;
+};
+typedef struct table_obj table_obj;
+
+struct objdata {
+	zotypes zo_type;
+	union {
+		struct directory_obj di_data;
+		struct group_obj gr_data;
+		struct table_obj ta_data;
+		struct entry_obj en_data;
+		struct link_obj li_data;
+		struct {
+			u_int po_data_len;
+			char *po_data_val;
+		} po_data;
+	} objdata_u;
+};
+typedef struct objdata objdata;
+
+struct nis_oid {
+	uint32_t ctime;
+	uint32_t mtime;
+};
+typedef struct nis_oid nis_oid;
+
+struct nis_object {
+	nis_oid zo_oid;
+	nis_name zo_name;
+	nis_name zo_owner;
+	nis_name zo_group;
+	nis_name zo_domain;
+	uint32_t zo_access;
+	uint32_t zo_ttl;
+	objdata zo_data;
+};
+typedef struct nis_object nis_object;
+
+#endif /* if __nis_object_h */
+
+enum nis_error {
+	NIS_SUCCESS = 0,
+	NIS_S_SUCCESS = 1,
+	NIS_NOTFOUND = 2,
+	NIS_S_NOTFOUND = 3,
+	NIS_CACHEEXPIRED = 4,
+	NIS_NAMEUNREACHABLE = 5,
+	NIS_UNKNOWNOBJ = 6,
+	NIS_TRYAGAIN = 7,
+	NIS_SYSTEMERROR = 8,
+	NIS_CHAINBROKEN = 9,
+	NIS_PERMISSION = 10,
+	NIS_NOTOWNER = 11,
+	NIS_NOT_ME = 12,
+	NIS_NOMEMORY = 13,
+	NIS_NAMEEXISTS = 14,
+	NIS_NOTMASTER = 15,
+	NIS_INVALIDOBJ = 16,
+	NIS_BADNAME = 17,
+	NIS_NOCALLBACK = 18,
+	NIS_CBRESULTS = 19,
+	NIS_NOSUCHNAME = 20,
+	NIS_NOTUNIQUE = 21,
+	NIS_IBMODERROR = 22,
+	NIS_NOSUCHTABLE = 23,
+	NIS_TYPEMISMATCH = 24,
+	NIS_LINKNAMEERROR = 25,
+	NIS_PARTIAL = 26,
+	NIS_TOOMANYATTRS = 27,
+	NIS_RPCERROR = 28,
+	NIS_BADATTRIBUTE = 29,
+	NIS_NOTSEARCHABLE = 30,
+	NIS_CBERROR = 31,
+	NIS_FOREIGNNS = 32,
+	NIS_BADOBJECT = 33,
+	NIS_NOTSAMEOBJ = 34,
+	NIS_MODFAIL = 35,
+	NIS_BADREQUEST = 36,
+	NIS_NOTEMPTY = 37,
+	NIS_COLDSTART_ERR = 38,
+	NIS_RESYNC = 39,
+	NIS_FAIL = 40,
+	NIS_UNAVAIL = 41,
+	NIS_RES2BIG = 42,
+	NIS_SRVAUTH = 43,
+	NIS_CLNTAUTH = 44,
+	NIS_NOFILESPACE = 45,
+	NIS_NOPROC = 46,
+	NIS_DUMPLATER = 47,
+};
+typedef enum nis_error nis_error;
+
+struct nis_result {
+	nis_error status;
+	struct {
+		u_int objects_len;
+		nis_object *objects_val;
+	} objects;
+	netobj cookie;
+	uint32_t zticks;
+	uint32_t dticks;
+	uint32_t aticks;
+	uint32_t cticks;
+};
+typedef struct nis_result nis_result;
+
+struct ns_request {
+	nis_name ns_name;
+	struct {
+		u_int ns_object_len;
+		nis_object *ns_object_val;
+	} ns_object;
+};
+typedef struct ns_request ns_request;
+
+struct ib_request {
+	nis_name ibr_name;
+	struct {
+		u_int ibr_srch_len;
+		nis_attr *ibr_srch_val;
+	} ibr_srch;
+	uint32_t ibr_flags;
+	struct {
+		u_int ibr_obj_len;
+		nis_object *ibr_obj_val;
+	} ibr_obj;
+	struct {
+		u_int ibr_cbhost_len;
+		nis_server *ibr_cbhost_val;
+	} ibr_cbhost;
+	u_int ibr_bufsize;
+	netobj ibr_cookie;
+};
+typedef struct ib_request ib_request;
+
+struct ping_args {
+	nis_name dir;
+	uint32_t stamp;
+};
+typedef struct ping_args ping_args;
+
+enum log_entry_t {
+	LOG_NOP = 0,
+	ADD_NAME = 1,
+	REM_NAME = 2,
+	MOD_NAME_OLD = 3,
+	MOD_NAME_NEW = 4,
+	ADD_IBASE = 5,
+	REM_IBASE = 6,
+	MOD_IBASE = 7,
+	UPD_STAMP = 8,
+};
+typedef enum log_entry_t log_entry_t;
+
+struct log_entry {
+	uint32_t le_time;
+	log_entry_t le_type;
+	nis_name le_princp;
+	nis_name le_name;
+	struct {
+		u_int le_attrs_len;
+		nis_attr *le_attrs_val;
+	} le_attrs;
+	nis_object le_object;
+};
+typedef struct log_entry log_entry;
+
+struct log_result {
+	nis_error lr_status;
+	netobj lr_cookie;
+	struct {
+		u_int lr_entries_len;
+		log_entry *lr_entries_val;
+	} lr_entries;
+};
+typedef struct log_result log_result;
+
+struct cp_result {
+	nis_error cp_status;
+	uint32_t cp_zticks;
+	uint32_t cp_dticks;
+};
+typedef struct cp_result cp_result;
+
+struct nis_tag {
+	uint32_t tag_type;
+	char *tag_val;
+};
+typedef struct nis_tag nis_tag;
+
+struct nis_taglist {
+	struct {
+		u_int tags_len;
+		nis_tag *tags_val;
+	} tags;
+};
+typedef struct nis_taglist nis_taglist;
+
+struct dump_args {
+	nis_name da_dir;
+	uint32_t da_time;
+	struct {
+		u_int da_cbhost_len;
+		nis_server *da_cbhost_val;
+	} da_cbhost;
+};
+typedef struct dump_args dump_args;
+
+struct fd_args {
+	nis_name dir_name;
+	nis_name requester;
+};
+typedef struct fd_args fd_args;
+
+struct fd_result {
+	nis_error status;
+	nis_name source;
+	struct {
+		u_int dir_data_len;
+		char *dir_data_val;
+	} dir_data;
+	struct {
+		u_int signature_len;
+		char *signature_val;
+	} signature;
+};
+typedef struct fd_result fd_result;
+
+/* Generic client creating flags */
+#define ZMH_VC		1
+#define ZMH_DG		2
+#define ZMH_AUTH	4
+
+/* Testing Access rights for objects */
+
+#define NIS_READ_ACC		1
+#define NIS_MODIFY_ACC		2
+#define NIS_CREATE_ACC		4
+#define NIS_DESTROY_ACC	8
+/* Test macros. a == access rights, m == desired rights. */
+#define NIS_WORLD(a, m)        (((a) & (m)) != 0)
+#define NIS_GROUP(a, m)        (((a) & ((m) << 8)) != 0)
+#define NIS_OWNER(a, m)        (((a) & ((m) << 16)) != 0)
+#define NIS_NOBODY(a, m)       (((a) & ((m) << 24)) != 0)
+/*
+ * EOL Alert - The following non-prefixed test macros are
+ * here for backward compatability, and will be not be present
+ * in future releases - use the NIS_*() macros above.
+ */
+#define WORLD(a, m)	(((a) & (m)) != 0)
+#define GROUP(a, m)	(((a) & ((m) << 8)) != 0)
+#define OWNER(a, m)	(((a) & ((m) << 16)) != 0)
+#define NOBODY(a, m)	(((a) & ((m) << 24)) != 0)
+
+#define OATYPE(d, n) (((d)->do_armask.do_armask_val+n)->oa_otype)
+#define OARIGHTS(d, n) (((d)->do_armask.do_armask_val+n)->oa_rights)
+#define WORLD_DEFAULT (NIS_READ_ACC)
+#define GROUP_DEFAULT (NIS_READ_ACC << 8)
+#define OWNER_DEFAULT ((NIS_READ_ACC + NIS_MODIFY_ACC + NIS_CREATE_ACC +\
+			NIS_DESTROY_ACC) << 16)
+#define DEFAULT_RIGHTS (WORLD_DEFAULT | GROUP_DEFAULT | OWNER_DEFAULT)
+
+/* Result manipulation defines ... */
+#define NIS_RES_NUMOBJ(x)	((x)->objects.objects_len)
+#define NIS_RES_OBJECT(x)	((x)->objects.objects_val)
+#define NIS_RES_COOKIE(x)	((x)->cookie)
+#define NIS_RES_STATUS(x)	((x)->status)
+
+/* These defines make getting at the variant part of the object easier. */
+#define TA_data zo_data.objdata_u.ta_data
+#define EN_data zo_data.objdata_u.en_data
+#define DI_data zo_data.objdata_u.di_data
+#define LI_data zo_data.objdata_u.li_data
+#define GR_data zo_data.objdata_u.gr_data
+
+#define __type_of(o) ((o)->zo_data.zo_type)
+
+/* Declarations for the internal subroutines in nislib.c */
+enum name_pos {SAME_NAME, HIGHER_NAME, LOWER_NAME, NOT_SEQUENTIAL, BAD_NAME};
+typedef enum name_pos name_pos;
+
+/*
+ * Defines for getting at column data in entry objects. Because RPCGEN
+ * generates some rather wordy structures, we create some defines that
+ * collapse the needed keystrokes to access a particular value using
+ * these definitions they take an nis_object *, and an int and return
+ * a u_char * for Value, and an int for length.
+ */
+#define ENTRY_VAL(obj, col) (obj)->EN_data.en_cols.en_cols_val[col].ec_value.ec_value_val
+#define ENTRY_LEN(obj, col) (obj)->EN_data.en_cols.en_cols_val[col].ec_value.ec_value_len
+
+
+/* Prototypes, and extern declarations for the NIS library functions. */
+//#include <rpcsvc/nislib.h>
+#endif
+
+/*
+ * nis_3.h
+ *
+ * This file contains definitions that are only of interest to the actual
+ * service daemon and client stubs. Normal users of NIS will not include
+ * this file.
+ *
+ * NOTE : This include file is automatically created by a combination
+ * of rpcgen and sed. DO NOT EDIT IT, change the nis.x file instead
+ * and then remake this file.
+ */
+#ifndef __nis_3_h
+#define __nis_3_h
+
+#define NIS_PROG 100300
+#define NIS_VERSION 3
+
+#ifdef __cplusplus
+}
+#endif
+
+#endif /* ! _RPCSVC_NIS_H */
diff --git a/meta/recipes-extended/libtirpc/libtirpc_0.2.5.bb b/meta/recipes-extended/libtirpc/libtirpc_0.2.5.bb
index 330b829..9ee6570 100644
--- a/meta/recipes-extended/libtirpc/libtirpc_0.2.5.bb
+++ b/meta/recipes-extended/libtirpc/libtirpc_0.2.5.bb
@@ -19,6 +19,16 @@ SRC_URI_append_libc-uclibc = " file://remove-des-uclibc.patch \
                                file://va_list.patch \
                              "
 
+SRC_URI_append_libc-musl = "\
+            file://0002-Provide-getrpcbynumber-and-getrpcbyname-if-those-are.patch \
+            file://0003-Avoid-use-of-internal-glibc-sys-cdefs.h-header.patch \
+            file://0004-Add-configure-option-to-disable-DES-authentication.patch \
+            file://0005-Fix-compile-error-IPPORT_RESERVED-undeclared.patch \
+            file://0006-Define-struct-rpcent-on-non-GNU-libc.patch \
+            file://0007-use-bsd-queue.patch \
+            file://nis.h \
+           "
+
 SRC_URI[libtirpc.md5sum] = "8cd41a5ef5a9b50d0fb6abb98af15368"
 SRC_URI[libtirpc.sha256sum] = "62f9de7c2c8686c568757730e1fef66502a0e00d6cacf33546d0267984e002db"
 SRC_URI[glibc-nfs.md5sum] = "5ae500b9d0b6b72cb875bc04944b9445"
@@ -27,11 +37,15 @@ SRC_URI[glibc-nfs.sha256sum] = "2677cfedf626f3f5a8f6e507aed5bb8f79a7453b589d684d
 inherit autotools pkgconfig
 
 EXTRA_OECONF = "--disable-gssapi"
+EXTRA_OECONF_append_libc-musl = " --disable-authdes"
 
 do_configure_prepend () {
         cp -r ${S}/../tirpc ${S}
 }
 
+do_configure_prepend_libc-musl () {
+        cp ${WORKDIR}/nis.h ${S}/../tirpc/rpcsvc/nis.h
+}
 do_install_append() {
         chown root:root ${D}${sysconfdir}/netconfig
 }
-- 
2.6.4


