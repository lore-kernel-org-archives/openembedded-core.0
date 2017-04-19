Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7A1B571AEF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Apr 2017 01:58:55 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id 63so1695916pgh.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Apr 2017 18:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=T2xgOtnJMT4/CY/BxeV6dRUIgW9HgElYLBgbJnD70DU=;
	b=clqcKZ0U5huW4glN7705XCa/HRlO113nbgy1fFlWz/0Yb8eVWb+BP+J1dplItejpwc
	Lkb4Z/ejOb+0FmM7M/MlsELfUtZwwC3aMnVAS2XXEZcU71t9CwZAQz4OAdtin4WmPTGs
	CEN4u/4horLvelQmW52FjHA4PYRH/SF+Gbhi4llcbPtiMqnWsTEx8WsMQOMy1Gt9QZzy
	mhaU7srudRPPQMYr77YHP636jqXuSG+tpodY3fEKSPf7UDrQqPU3Vlwo6MrTPlgY0/XI
	F9g/VezY+yOG+O7BRcaz4VWF79JMmF7/ubQfuOA5ypLKPr4VbiBhykjxA34sA329umiX
	umYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=T2xgOtnJMT4/CY/BxeV6dRUIgW9HgElYLBgbJnD70DU=;
	b=fsymx4670Y2u2y24YDa1Bjgsb3SEx5aol3hLCttsz/HWYxsfb2hvVgHR8Kd9nb2Oyx
	Bj2vYy9/ZOFoRE1lsGsZGVBilMmqYU3kj/OkvnPtkQuPc7MnaTbJp1jjUmTCXI+sbThF
	1RpqSKEipvBxIy9YCULuSFZ/mw8Ow4clGySHqkq+/QeB3As/MfRiE0uXKlemEWaAiMJi
	7WqarXzYh4MBzorYUGOYm0v5Cetw0+xfo51PkIuSsGJu1azk+1F4DfF0y073N57bQBNs
	r5vy8f9JFZOkTrIJkxVF+3x9Injv1Jlw/mNOHe6JOIzhQWckc1FxisH4ulldWGU7WrBh
	Bs4Q==
X-Gm-Message-State: AN3rC/4T5NajqCFm08sqmwdVW46MgOZ7KmmdT1ScNI81XlRozR05fYum
	HoskTjkICE2da49F
X-Received: by 10.84.254.74 with SMTP id a10mr604373pln.185.1492567136415;
	Tue, 18 Apr 2017 18:58:56 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a190sm787128pgc.60.2017.04.18.18.58.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Apr 2017 18:58:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Apr 2017 18:58:37 -0700
Message-Id: <20170419015839.1294-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170419015839.1294-1-raj.khem@gmail.com>
References: <20170419015839.1294-1-raj.khem@gmail.com>
Subject: [PATCH 3/5] libtirpc: Enable des APIs for musl
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
X-List-Received-Date: Wed, 19 Apr 2017 01:58:55 -0000

Use memset() API instead of __bzero()
Drop the patch removing des_* functions for musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-replace-__bzero-with-memset-API.patch     |  28 +++++
 .../libtirpc/remove-des-functionality.patch        | 139 ---------------------
 meta/recipes-extended/libtirpc/libtirpc_1.0.1.bb   |   5 +-
 3 files changed, 31 insertions(+), 141 deletions(-)
 create mode 100644 meta/recipes-extended/libtirpc/libtirpc/0001-replace-__bzero-with-memset-API.patch
 delete mode 100644 meta/recipes-extended/libtirpc/libtirpc/remove-des-functionality.patch

diff --git a/meta/recipes-extended/libtirpc/libtirpc/0001-replace-__bzero-with-memset-API.patch b/meta/recipes-extended/libtirpc/libtirpc/0001-replace-__bzero-with-memset-API.patch
new file mode 100644
index 00000000000..ef7ddb7d99b
--- /dev/null
+++ b/meta/recipes-extended/libtirpc/libtirpc/0001-replace-__bzero-with-memset-API.patch
@@ -0,0 +1,28 @@
+From 20badc3e3608953fb5b36bb2e16fa51bd731aebc Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 18 Apr 2017 09:35:35 -0700
+Subject: [PATCH] replace __bzero() with memset() API
+
+memset is available across all libc implementation
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/des_impl.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/des_impl.c b/src/des_impl.c
+index 9dbccaf..15bec2a 100644
+--- a/src/des_impl.c
++++ b/src/des_impl.c
+@@ -588,7 +588,7 @@ _des_crypt (char *buf, unsigned len, struct desparams *desp)
+     }
+   tin0 = tin1 = tout0 = tout1 = xor0 = xor1 = 0;
+   tbuf[0] = tbuf[1] = 0;
+-  __bzero (schedule, sizeof (schedule));
++  memset (schedule, 0, sizeof (schedule));
+ 
+   return (1);
+ }
+-- 
+2.12.2
+
diff --git a/meta/recipes-extended/libtirpc/libtirpc/remove-des-functionality.patch b/meta/recipes-extended/libtirpc/libtirpc/remove-des-functionality.patch
deleted file mode 100644
index 31e97744cbb..00000000000
--- a/meta/recipes-extended/libtirpc/libtirpc/remove-des-functionality.patch
+++ /dev/null
@@ -1,139 +0,0 @@
-uclibc and musl does not provide des functionality. Lets disable it.
-
-Upstream-Status: Inappropriate [uclibc and musl specific]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Signed-off-by: Maxin B. John <maxin.john@intel.com>
----
-Index: libtirpc-1.0.1/src/Makefile.am
-===================================================================
---- libtirpc-1.0.1.orig/src/Makefile.am
-+++ libtirpc-1.0.1/src/Makefile.am
-@@ -22,9 +22,8 @@ libtirpc_la_SOURCES = auth_none.c auth_u
-         pmap_prot.c pmap_prot2.c pmap_rmt.c rpc_prot.c rpc_commondata.c \
-         rpc_callmsg.c rpc_generic.c rpc_soc.c rpcb_clnt.c rpcb_prot.c \
-         rpcb_st_xdr.c svc.c svc_auth.c svc_dg.c svc_auth_unix.c svc_auth_none.c \
--	svc_auth_des.c \
-         svc_generic.c svc_raw.c svc_run.c svc_simple.c svc_vc.c getpeereid.c \
--        auth_time.c auth_des.c authdes_prot.c debug.c des_crypt.c des_impl.c
-+        debug.c
- 
- ## XDR
- libtirpc_la_SOURCES += xdr.c xdr_rec.c xdr_array.c xdr_float.c xdr_mem.c xdr_reference.c xdr_stdio.c xdr_sizeof.c
-@@ -41,8 +40,8 @@ if GSS
-     libtirpc_la_CFLAGS = -DHAVE_RPCSEC_GSS $(GSSAPI_CFLAGS)
- endif
- 
--libtirpc_la_SOURCES += key_call.c key_prot_xdr.c getpublickey.c
--libtirpc_la_SOURCES += netname.c netnamer.c rpcdname.c rtime.c
-+#libtirpc_la_SOURCES += key_call.c key_prot_xdr.c getpublickey.c
-+#libtirpc_la_SOURCES += netname.c netnamer.c rpcdname.c rtime.c
- 
- CLEANFILES	       = cscope.* *~
- DISTCLEANFILES	       = Makefile.in
-Index: libtirpc-1.0.1/src/rpc_soc.c
-===================================================================
---- libtirpc-1.0.1.orig/src/rpc_soc.c
-+++ libtirpc-1.0.1/src/rpc_soc.c
-@@ -522,86 +522,6 @@ clnt_broadcast(prog, vers, proc, xargs,
- }
- 
- /*
-- * Create the client des authentication object. Obsoleted by
-- * authdes_seccreate().
-- */
--AUTH *
--authdes_create(servername, window, syncaddr, ckey)
--	char *servername;		/* network name of server */
--	u_int window;			/* time to live */
--	struct sockaddr *syncaddr;	/* optional hostaddr to sync with */
--	des_block *ckey;		/* optional conversation key to use */
--{
--	AUTH *nauth;
--	char hostname[NI_MAXHOST];
--
--	if (syncaddr) {
--		/*
--		 * Change addr to hostname, because that is the way
--		 * new interface takes it.
--		 */
--	        switch (syncaddr->sa_family) {
--		case AF_INET:
--		  if (getnameinfo(syncaddr, sizeof(struct sockaddr_in), hostname,
--				  sizeof hostname, NULL, 0, 0) != 0)
--		    goto fallback;
--		  break;
--		case AF_INET6:
--		  if (getnameinfo(syncaddr, sizeof(struct sockaddr_in6), hostname,
--				  sizeof hostname, NULL, 0, 0) != 0)
--		    goto fallback;
--		  break;
--		default:
--		  goto fallback;
--		}
--		nauth = authdes_seccreate(servername, window, hostname, ckey);
--		return (nauth);
--	}
--fallback:
--	return authdes_seccreate(servername, window, NULL, ckey);
--}
--
--/*
-- * Create the client des authentication object. Obsoleted by
-- * authdes_pk_seccreate().
-- */
--extern AUTH *authdes_pk_seccreate(const char *, netobj *, u_int, const char *,
--        const des_block *, nis_server *);
--
--AUTH *
--authdes_pk_create(servername, pkey, window, syncaddr, ckey)
--	char *servername;		/* network name of server */
--	netobj *pkey;			/* public key */
--	u_int window;			/* time to live */
--	struct sockaddr *syncaddr;	/* optional hostaddr to sync with */
--	des_block *ckey;		/* optional conversation key to use */
--{
--	AUTH *nauth;
--	char hostname[NI_MAXHOST];
--
--	if (syncaddr) {
--		/*
--		 * Change addr to hostname, because that is the way
--		 * new interface takes it.
--		 */
--	        switch (syncaddr->sa_family) {
--		case AF_INET:
--		  if (getnameinfo(syncaddr, sizeof(struct sockaddr_in), hostname,
--				  sizeof hostname, NULL, 0, 0) != 0)
--		    goto fallback;
--		  break;
--		default:
--		  goto fallback;
--		}
--		nauth = authdes_pk_seccreate(servername, pkey, window, hostname, ckey, NULL);
--		return (nauth);
--	}
--fallback:
--	return authdes_pk_seccreate(servername, pkey, window, NULL, ckey, NULL);
--}
--
--
--/*
-  * Create a client handle for a unix connection. Obsoleted by clnt_vc_create()
-  */
- CLIENT *
-Index: libtirpc-1.0.1/src/svc_auth.c
-===================================================================
---- libtirpc-1.0.1.orig/src/svc_auth.c
-+++ libtirpc-1.0.1/src/svc_auth.c
-@@ -114,9 +114,6 @@ _gss_authenticate(rqst, msg, no_dispatch
- 	case AUTH_SHORT:
- 		dummy = _svcauth_short(rqst, msg);
- 		return (dummy);
--	case AUTH_DES:
--		dummy = _svcauth_des(rqst, msg);
--		return (dummy);
- #ifdef HAVE_RPCSEC_GSS
- 	case RPCSEC_GSS:
- 		dummy = _svcauth_gss(rqst, msg, no_dispatch);
diff --git a/meta/recipes-extended/libtirpc/libtirpc_1.0.1.bb b/meta/recipes-extended/libtirpc/libtirpc_1.0.1.bb
index b96abc4d57e..662c8999c20 100644
--- a/meta/recipes-extended/libtirpc/libtirpc_1.0.1.bb
+++ b/meta/recipes-extended/libtirpc/libtirpc_1.0.1.bb
@@ -14,12 +14,13 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.bz2;name=libtirpc \
            file://libtirpc-1.0.2-rc3.patch \
            file://libtirpc-0.2.1-fortify.patch \
            file://export_key_secretkey_is_set.patch \
-          "
+           file://0001-replace-__bzero-with-memset-API.patch \
+           "
 
 SRC_URI_append_libc-uclibc = " file://remove-des-functionality.patch \
                              "
 
-SRC_URI_append_libc-musl = " file://remove-des-functionality.patch \
+SRC_URI_append_libc-musl = " \
                              file://Use-netbsd-queue.h.patch \
                            "
 
-- 
2.12.2


