Return-Path: <rep.dot.nop@gmail.com>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 4C48D7391E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2015 12:27:59 +0000 (UTC)
Received: by wggv3 with SMTP id v3so38522282wgg.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2015 05:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=JdKGD6NlnSxxTGvOF2DoJPv1HG7HFoCr55tgD0xDjgs=;
	b=kpgju9CeVZoUE+l9dsIvd79p0KztddzxlhO3aZUcxhdZCXNelNFtjxkENjF/oqTfTA
	BouFxNKS/O25tt4NnDjnCviPUEL+L/i3lvdgzhrRxkv6zLbl0gMH1J7uq8crN+V0aKC/
	vn0Y5i4mpigRDWjEQn1ap4gLMlzquMcdBujw/5j5HTfh1vgfkVYaP2GGUR0VhvlrXPHd
	xELNyDuCwVtWMzlaCtuatRLFgQfXRL2YhEHp1s3ePMyLg2ziDs9rjD6IbuaXrEkC5ua1
	Rf6hcNl/RmEFlXB6wBb5ruwfzWmEd7fQqgCdR/UwszVmx5MnC1mPe8cejS0Y4qN5q0vh
	CMSw==
X-Received: by 10.194.174.106 with SMTP id br10mr70710498wjc.21.1426508880854; 
	Mon, 16 Mar 2015 05:28:00 -0700 (PDT)
Received: from s42.loc (91-119-229-249.dynamic.xdsl-line.inode.at.
	[91.119.229.249]) by mx.google.com with ESMTPSA id
	hd10sm15170004wib.7.2015.03.16.05.27.58
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 16 Mar 2015 05:27:58 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.80)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1YXU7h-0007rl-Lj; Mon, 16 Mar 2015 13:27:57 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Mar 2015 13:27:45 +0100
Message-Id: <36f1493ac5e4bfa3e55b27bc3115bb0d430d5cd7.1426508573.git.rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1426508573.git.rep.dot.nop@gmail.com>
References: <CAJTo0LYGf7o8G81Sufv44e1e-FwOvCVZzvTc=iCbLnEQO_GMxg@mail.gmail.com>
	<cover.1426508573.git.rep.dot.nop@gmail.com>
In-Reply-To: <cover.1426508573.git.rep.dot.nop@gmail.com>
References: <cover.1426508573.git.rep.dot.nop@gmail.com>
Subject: [PATCH v2 1/3] libtirpc: respin patches
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
X-List-Received-Date: Mon, 16 Mar 2015 12:28:02 -0000

Due to libc-dependant conditional patching (which should be completely
forbidden -- fix it properly instead) the last PV bump forgot to adjust
patches so they failed to apply.

Fix this by redoing the patches. These patches were submitted for
upstream master, add backported patches for the current tarball.

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 ...0001-configure.ac-Allow-for-disabling-NIS.patch | 169 +++++++++++++++++
 ...configure.ac-Allow-for-disabling-auth-DES.patch | 203 +++++++++++++++++++++
 .../libtirpc/0003-debug.h-Include-stdarg.patch     |  20 ++
 .../libtirpc/libtirpc/remove-des-uclibc.patch      |  38 ----
 meta/recipes-extended/libtirpc/libtirpc_0.2.5.bb   |   5 +-
 5 files changed, 396 insertions(+), 39 deletions(-)
 create mode 100644 meta/recipes-extended/libtirpc/libtirpc/0001-configure.ac-Allow-for-disabling-NIS.patch
 create mode 100644 meta/recipes-extended/libtirpc/libtirpc/0002-configure.ac-Allow-for-disabling-auth-DES.patch
 create mode 100644 meta/recipes-extended/libtirpc/libtirpc/0003-debug.h-Include-stdarg.patch
 delete mode 100644 meta/recipes-extended/libtirpc/libtirpc/remove-des-uclibc.patch

diff --git a/meta/recipes-extended/libtirpc/libtirpc/0001-configure.ac-Allow-for-disabling-NIS.patch b/meta/recipes-extended/libtirpc/libtirpc/0001-configure.ac-Allow-for-disabling-NIS.patch
new file mode 100644
index 0000000..5b2aa3d
--- /dev/null
+++ b/meta/recipes-extended/libtirpc/libtirpc/0001-configure.ac-Allow-for-disabling-NIS.patch
@@ -0,0 +1,169 @@
+From b562294d35d8a87af2bcdbc32c15cc973e50ed4e Mon Sep 17 00:00:00 2001
+From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
+Date: Sun, 1 Mar 2015 12:18:05 +0100
+Subject: [PATCH 1/2] configure.ac: Allow for disabling NIS
+To: libtirpc-devel@lists.sourceforge.net
+Cc: Steve Dickson <SteveD@redhat.com>
+
+Yellow Pages might not be available, provide a config knob to disable
+it.
+
+Upstream-Status: Submitted
+
+Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
+---
+ configure.ac    | 16 ++++++++++++++++
+ src/Makefile.am |  6 +++++-
+ src/auth_des.c  | 18 +++++++++++++++++-
+ src/auth_time.c |  3 ++-
+ 4 files changed, 40 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 10d17ea..d006ac9 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -32,6 +32,22 @@ AC_CHECK_HEADERS([arpa/inet.h fcntl.h libintl.h limits.h locale.h netdb.h netine
+ AC_CHECK_LIB([pthread], [pthread_create])
+ AC_CHECK_LIB([nsl], [yp_get_default_domain])
+ 
++AC_ARG_ENABLE([nis],
++	[AC_HELP_STRING([--disable-nis],
++		[Disable Yellow Pages (NIS) support @<:@default=no@:>@])],
++	[],[enable_nis=yes])
++if test "x$enable_nis" != xno; then
++	AC_CHECK_HEADERS([rpcsvc/nis.h])
++	if test "x$ac_cv_header_rpcsvc_nis_h" != xyes; then
++		AC_WARN([NIS enabled but no rpcsvc/nis.h header found])
++		AC_WARN([Turning off NIS / YP support])
++		enable_nis="no"
++	fi
++fi
++if test "x$enable_nis" != xno; then
++	AC_DEFINE([YP], [1], [Define to 1 if NIS is available])
++fi
++AM_CONDITIONAL([YP], [test "x$enable_nis" != xno])
+ 
+ AC_CONFIG_FILES([Makefile src/Makefile man/Makefile doc/Makefile])
+ AC_OUTPUT(libtirpc.pc)
+diff --git a/src/Makefile.am b/src/Makefile.am
+index de57c8f..7861057 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -51,7 +51,7 @@ libtirpc_la_SOURCES = auth_none.c auth_unix.c authunix_prot.c bindresvport.c cln
+         rpc_callmsg.c rpc_generic.c rpc_soc.c rpcb_clnt.c rpcb_prot.c \
+         rpcb_st_xdr.c svc.c svc_auth.c svc_dg.c svc_auth_unix.c svc_auth_none.c \
+         svc_generic.c svc_raw.c svc_run.c svc_simple.c svc_vc.c getpeereid.c \
+-        auth_time.c auth_des.c authdes_prot.c debug.c
++        auth_des.c authdes_prot.c debug.c
+ 
+ ## XDR
+ libtirpc_la_SOURCES += xdr.c xdr_rec.c xdr_array.c xdr_float.c xdr_mem.c xdr_reference.c xdr_stdio.c
+@@ -63,6 +63,10 @@ if GSS
+     libtirpc_la_CFLAGS = -DHAVE_RPCSEC_GSS $(GSSAPI_CFLAGS)
+ endif
+ 
++if YP
++    libtirpc_la_SOURCES += auth_time.c
++endif
++
+ ## libtirpc_a_SOURCES += key_call.c key_prot_xdr.c getpublickey.c
+ ## libtirpc_a_SOURCES += netname.c netnamer.c rpcdname.c \
+ ## libtirpc_a_SOURCES += rtime.c \
+diff --git a/src/auth_des.c b/src/auth_des.c
+index cff777c..be9d364 100644
+--- a/src/auth_des.c
++++ b/src/auth_des.c
+@@ -48,7 +48,9 @@
+ #include <rpc/xdr.h>
+ #include <sys/socket.h>
+ #undef NIS
++#ifdef HAVE_RPCSVC_NIS_H
+ #include <rpcsvc/nis.h>
++#endif
+ 
+ #if defined(LIBC_SCCS) && !defined(lint)
+ #endif
+@@ -68,8 +70,13 @@ extern bool_t xdr_authdes_cred( XDR *, struct authdes_cred *);
+ extern bool_t xdr_authdes_verf( XDR *, struct authdes_verf *);
+ extern int key_encryptsession_pk();
+ 
++#ifdef YP
+ extern bool_t __rpc_get_time_offset(struct timeval *, nis_server *, char *,
+ 	char **, char **);
++#else
++# define __rpc_get_time_offset(__a,__b,__c,__d, __e) (1) /* always valid */
++# define nis_server char
++#endif
+ 
+ /* 
+  * DES authenticator operations vector
+@@ -103,7 +110,9 @@ struct ad_private {
+ 	u_char ad_pkey[1024];		/* Server's actual public key */
+ 	char *ad_netid;			/* Timehost netid */
+ 	char *ad_uaddr;			/* Timehost uaddr */
++#ifdef YP
+ 	nis_server *ad_nis_srvr;	/* NIS+ server struct */
++#endif
+ };
+ 
+ AUTH *authdes_pk_seccreate(const char *, netobj *, u_int, const char *,
+@@ -148,7 +157,8 @@ authdes_seccreate(const char *servername, const u_int win,
+  */
+ AUTH *
+ authdes_pk_seccreate(const char *servername, netobj *pkey, u_int window,
+-	const char *timehost, const des_block *ckey, nis_server *srvr)
++	const char *timehost, const des_block *ckey, nis_server *srvr
++	)
+ {
+ 	AUTH *auth;
+ 	struct ad_private *ad;
+@@ -171,7 +181,9 @@ authdes_pk_seccreate(const char *servername, netobj *pkey, u_int window,
+ 	ad->ad_timehost = NULL;
+ 	ad->ad_netid = NULL;
+ 	ad->ad_uaddr = NULL;
++#ifdef YP
+ 	ad->ad_nis_srvr = NULL;
++#endif
+ 	ad->ad_timediff.tv_sec = 0;
+ 	ad->ad_timediff.tv_usec = 0;
+ 	memcpy(ad->ad_pkey, pkey->n_bytes, pkey->n_len);
+@@ -194,9 +206,11 @@ authdes_pk_seccreate(const char *servername, netobj *pkey, u_int window,
+ 		}
+ 		memcpy(ad->ad_timehost, timehost, strlen(timehost) + 1);
+ 		ad->ad_dosync = TRUE;
++#ifdef YP
+ 	} else if (srvr != NULL) {
+ 		ad->ad_nis_srvr = srvr;	/* transient */
+ 		ad->ad_dosync = TRUE;
++#endif
+ 	} else {
+ 		ad->ad_dosync = FALSE;
+ 	}
+@@ -224,7 +238,9 @@ authdes_pk_seccreate(const char *servername, netobj *pkey, u_int window,
+ 	if (!authdes_refresh(auth, NULL)) {
+ 		goto failed;
+ 	}
++#ifdef YP
+ 	ad->ad_nis_srvr = NULL; /* not needed any longer */
++#endif
+ 	auth_get(auth);		/* Reference for caller */
+ 	return (auth);
+ 
+diff --git a/src/auth_time.c b/src/auth_time.c
+index 7cfbb7e..111de90 100644
+--- a/src/auth_time.c
++++ b/src/auth_time.c
+@@ -43,8 +43,9 @@
+ //#include <clnt_soc.h>
+ #include <sys/select.h>
+ #undef NIS
++#ifdef HAVE_RPCSVC_NIS_H
+ #include <rpcsvc/nis.h>
+-
++#endif
+ 
+ #ifdef TESTING
+ #define	msg(x)	printf("ERROR: %s\n", x)
+-- 
+2.1.4
+
diff --git a/meta/recipes-extended/libtirpc/libtirpc/0002-configure.ac-Allow-for-disabling-auth-DES.patch b/meta/recipes-extended/libtirpc/libtirpc/0002-configure.ac-Allow-for-disabling-auth-DES.patch
new file mode 100644
index 0000000..098f4c4
--- /dev/null
+++ b/meta/recipes-extended/libtirpc/libtirpc/0002-configure.ac-Allow-for-disabling-auth-DES.patch
@@ -0,0 +1,203 @@
+From 538365a9319a100cd0aa8bf344b86e4c48426069 Mon Sep 17 00:00:00 2001
+From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
+Date: Sun, 1 Mar 2015 13:40:25 +0100
+Subject: [PATCH 2/2] configure.ac: Allow for disabling auth DES
+To: libtirpc-devel@lists.sourceforge.net
+Cc: Steve Dickson <SteveD@redhat.com>
+
+DES encryption might not be available.
+
+Upstream-Status: Submitted
+
+Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
+---
+ Makefile.am      | 12 ++++++++----
+ configure.ac     | 12 ++++++++++++
+ libtirpc.pc.in   |  2 +-
+ src/Makefile.am  |  6 +++++-
+ src/rpc_soc.c    |  2 ++
+ tirpc/rpc/auth.h |  9 +++++++++
+ tirpc/rpc/rpc.h  |  2 ++
+ 7 files changed, 39 insertions(+), 6 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 9b812eb..e588ae0 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -27,17 +27,21 @@ nobase_include_HEADERS = tirpc/netconfig.h \
+ 			 tirpc/rpc/pmap_prot.h \
+ 			 tirpc/rpc/pmap_clnt.h \
+ 			 tirpc/rpc/nettype.h \
+-			 tirpc/rpc/des.h \
+-			 tirpc/rpc/des_crypt.h \
+ 			 tirpc/rpc/clnt_stat.h \
+ 			 tirpc/rpc/clnt_soc.h \
+ 			 tirpc/rpc/clnt.h \
+ 			 tirpc/rpc/auth_unix.h \
+ 			 tirpc/rpc/auth_kerb.h \
+ 			 tirpc/rpc/auth.h \
+-			 tirpc/rpc/auth_gss.h \
++			 tirpc/rpc/auth_gss.h
++
++if AUTHDES
++nobase_include_HEADERS += \
++			 tirpc/rpc/des.h \
++			 tirpc/rpc/des_crypt.h \
+ 			 tirpc/rpc/auth_des.h
+-    
++endif
++
+ pkgconfigdir=$(libdir)/pkgconfig
+ pkgconfig_DATA = libtirpc.pc
+ 
+diff --git a/configure.ac b/configure.ac
+index d006ac9..6d623cf 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -49,5 +49,17 @@ if test "x$enable_nis" != xno; then
+ fi
+ AM_CONDITIONAL([YP], [test "x$enable_nis" != xno])
+ 
++AC_ARG_ENABLE([authdes],
++	[AC_HELP_STRING([--disable-authdes],
++		[Disable DES authentication @<:@default=no@:>@])],
++	[],[enable_authdes=yes])
++AM_CONDITIONAL([AUTHDES], [test "x$enable_authdes" != xno])
++if test "x$enable_authdes" != xno; then
++	AC_DEFINE([AUTHDES], [1],
++		[Define to 1 if DES authentication is enabled])
++	CFLAG_AUTHDES="-D_HAS_AUTH_DES=1"
++	AC_SUBST([CFLAG_AUTHDES])
++fi
++
+ AC_CONFIG_FILES([Makefile src/Makefile man/Makefile doc/Makefile])
+ AC_OUTPUT(libtirpc.pc)
+diff --git a/libtirpc.pc.in b/libtirpc.pc.in
+index 38034c5..ebbc66f 100644
+--- a/libtirpc.pc.in
++++ b/libtirpc.pc.in
+@@ -8,4 +8,5 @@ Description: Transport Independent RPC L
+ Requires:
+ Version: @PACKAGE_VERSION@
+ Libs: -L@libdir@ -ltirpc
++Libs.private: -lpthread
+-Cflags: -I@includedir@/tirpc
++Cflags: -I@includedir@/tirpc @CFLAG_AUTHDES@
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 7861057..121a500 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -51,7 +51,7 @@ libtirpc_la_SOURCES = auth_none.c auth_unix.c authunix_prot.c bindresvport.c cln
+         rpc_callmsg.c rpc_generic.c rpc_soc.c rpcb_clnt.c rpcb_prot.c \
+         rpcb_st_xdr.c svc.c svc_auth.c svc_dg.c svc_auth_unix.c svc_auth_none.c \
+         svc_generic.c svc_raw.c svc_run.c svc_simple.c svc_vc.c getpeereid.c \
+-        auth_des.c authdes_prot.c debug.c
++        debug.c
+ 
+ ## XDR
+ libtirpc_la_SOURCES += xdr.c xdr_rec.c xdr_array.c xdr_float.c xdr_mem.c xdr_reference.c xdr_stdio.c
+@@ -67,6 +67,10 @@ if YP
+     libtirpc_la_SOURCES += auth_time.c
+ endif
+ 
++if AUTHDES
++    libtirpc_la_SOURCES += auth_des.c authdes_prot.c
++endif
++
+ ## libtirpc_a_SOURCES += key_call.c key_prot_xdr.c getpublickey.c
+ ## libtirpc_a_SOURCES += netname.c netnamer.c rpcdname.c \
+ ## libtirpc_a_SOURCES += rtime.c \
+diff --git a/src/rpc_soc.c b/src/rpc_soc.c
+index e146ed4..c3d0e6e 100644
+--- a/src/rpc_soc.c
++++ b/src/rpc_soc.c
+@@ -520,6 +520,7 @@ clnt_broadcast(prog, vers, proc, xargs, argsp, xresults, resultsp, eachresult)
+ 	    (resultproc_t) rpc_wrap_bcast, "udp");
+ }
+ 
++#ifdef _HAS_AUTH_DES
+ /*
+  * Create the client des authentication object. Obsoleted by
+  * authdes_seccreate().
+@@ -551,6 +552,7 @@ fallback:
+ 	dummy = authdes_seccreate(servername, window, NULL, ckey);
+ 	return (dummy);
+ }
++#endif /* _HAS_AUTH_DES */
+ 
+ /*
+  * Create a client handle for a unix connection. Obsoleted by clnt_vc_create()
+diff --git a/tirpc/rpc/auth.h b/tirpc/rpc/auth.h
+index 7c8f813..4493a4d 100644
+--- a/tirpc/rpc/auth.h
++++ b/tirpc/rpc/auth.h
+@@ -164,9 +164,11 @@ union des_block {
+ 	char c[8];
+ };
+ typedef union des_block des_block;
++#ifdef _HAS_AUTH_DES
+ __BEGIN_DECLS
+ extern bool_t xdr_des_block(XDR *, des_block *);
+ __END_DECLS
++#endif /* _HAS_AUTH_DES */
+ 
+ /*
+  * Authentication info.  Opaque to client.
+@@ -305,6 +307,8 @@ extern AUTH *authunix_create(char *, uid_t, uid_t, int, uid_t *);
+ extern AUTH *authunix_create_default(void);	/* takes no parameters */
+ extern AUTH *authnone_create(void);		/* takes no parameters */
+ __END_DECLS
++
++#ifdef _HAS_AUTH_DES
+ /*
+  * DES style authentication
+  * AUTH *authsecdes_create(servername, window, timehost, ckey)
+@@ -318,6 +322,7 @@ extern AUTH *authdes_create (char *, u_int, struct sockaddr *, des_block *);
+ extern AUTH *authdes_seccreate (const char *, const u_int, const  char *,
+     const  des_block *);
+ __END_DECLS
++#endif /* _HAS_AUTH_DES */
+ 
+ __BEGIN_DECLS
+ extern bool_t xdr_opaque_auth		(XDR *, struct opaque_auth *);
+@@ -335,7 +340,9 @@ extern int host2netname(char *, const char *, const char *);
+ extern int user2netname(char *, const uid_t, const char *);
+ extern int netname2user(char *, uid_t *, gid_t *, int *, gid_t *);
+ extern int netname2host(char *, char *, const int);
++#ifdef _HAS_AUTH_DES
+ extern void passwd2des ( char *, char * );
++#endif /* _HAS_AUTH_DES */
+ __END_DECLS
+ 
+ /*
+@@ -346,7 +353,9 @@ __END_DECLS
+ __BEGIN_DECLS
+ extern int key_decryptsession(const char *, des_block *);
+ extern int key_encryptsession(const char *, des_block *);
++#ifdef _HAS_AUTH_DES
+ extern int key_gendes(des_block *);
++#endif /* _HAS_AUTH_DES */
+ extern int key_setsecret(const char *);
+ extern int key_secretkey_is_set(void);
+ __END_DECLS
+diff --git a/tirpc/rpc/rpc.h b/tirpc/rpc/rpc.h
+index 6c0222e..a7231a0 100644
+--- a/tirpc/rpc/rpc.h
++++ b/tirpc/rpc/rpc.h
+@@ -52,11 +52,13 @@
+ #include <rpc/rpc_msg.h>	/* protocol for rpc messages */
+ #include <rpc/auth_unix.h>	/* protocol for unix style cred */
+ 
++#ifdef _HAS_AUTH_DES
+ /*
+  *  Uncomment-out the next line if you are building the rpc library with
+  *  DES Authentication (see the README file in the secure_rpc/ directory).
+  */
+ #include <rpc/auth_des.h>	/* protocol for des style cred */
++#endif /* _HAS_AUTH_DES */
+ 
+ #ifdef HAVE_RPCSEC_GSS
+ #include <rpc/auth_gss.h>   /* RPCSEC_GSS */
+-- 
+2.1.4
+
diff --git a/meta/recipes-extended/libtirpc/libtirpc/0003-debug.h-Include-stdarg.patch b/meta/recipes-extended/libtirpc/libtirpc/0003-debug.h-Include-stdarg.patch
new file mode 100644
index 0000000..d29c1fb
--- /dev/null
+++ b/meta/recipes-extended/libtirpc/libtirpc/0003-debug.h-Include-stdarg.patch
@@ -0,0 +1,20 @@
+Subject: [PATCH] debug.h: add missing include
+
+Upstream-Status: Pending
+
+In file included from src/clnt_bcast.c:67:0:
+src/debug.h:39:47: error: unknown type name 'va_list'
+ vlibtirpc_log_dbg(int level, const char *fmt, va_list args)
+
+
+diff -rdup libtirpc-0.2.5.oorig/src/debug.h libtirpc-0.2.5/src/debug.h
+--- libtirpc-0.2.5.oorig/src/debug.h	2014-08-08 18:24:34.000000000 +0200
++++ libtirpc-0.2.5/src/debug.h	2015-03-11 20:55:29.141397172 +0100
+@@ -21,6 +21,7 @@
+ 
+ #ifndef _DEBUG_H
+ #define _DEBUG_H
++#include <stdarg.h>
+ #include <syslog.h>
+ 
+ extern int libtirpc_debug_level;
diff --git a/meta/recipes-extended/libtirpc/libtirpc/remove-des-uclibc.patch b/meta/recipes-extended/libtirpc/libtirpc/remove-des-uclibc.patch
deleted file mode 100644
index d003348..0000000
--- a/meta/recipes-extended/libtirpc/libtirpc/remove-des-uclibc.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-uclibc does not provide des functionality unlike eglibc so lets disable ssl support
-
-Upstream-Status: Inappropriate [uclibc specific]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Index: libtirpc-0.2.3/src/rpc_soc.c
-===================================================================
---- libtirpc-0.2.3.orig/src/rpc_soc.c	2013-03-10 16:00:51.355282153 -0700
-+++ libtirpc-0.2.3/src/rpc_soc.c	2013-03-10 16:00:51.703282148 -0700
-@@ -520,6 +520,7 @@
- 	    (resultproc_t) rpc_wrap_bcast, "udp");
- }
- 
-+#if 0
- /*
-  * Create the client des authentication object. Obsoleted by
-  * authdes_seccreate().
-@@ -551,6 +552,7 @@
- 	dummy = authdes_seccreate(servername, window, NULL, ckey);
- 	return (dummy);
- }
-+#endif
- 
- /*
-  * Create a client handle for a unix connection. Obsoleted by clnt_vc_create()
-Index: libtirpc-0.2.3/src/Makefile.am
-===================================================================
---- libtirpc-0.2.3.orig/src/Makefile.am	2013-03-10 16:00:51.355282153 -0700
-+++ libtirpc-0.2.3/src/Makefile.am	2013-03-10 16:00:51.703282148 -0700
-@@ -50,7 +50,7 @@
-         rpc_callmsg.c rpc_generic.c rpc_soc.c rpcb_clnt.c rpcb_prot.c \
-         rpcb_st_xdr.c svc.c svc_auth.c svc_dg.c svc_auth_unix.c svc_auth_none.c \
-         svc_generic.c svc_raw.c svc_run.c svc_simple.c svc_vc.c getpeereid.c \
--        auth_time.c auth_des.c authdes_prot.c
-+        auth_time.c
- 
- ## XDR
- libtirpc_la_SOURCES += xdr.c xdr_rec.c xdr_array.c xdr_float.c xdr_mem.c xdr_reference.c xdr_stdio.c
diff --git a/meta/recipes-extended/libtirpc/libtirpc_0.2.5.bb b/meta/recipes-extended/libtirpc/libtirpc_0.2.5.bb
index 3edf002..2fd45f0 100644
--- a/meta/recipes-extended/libtirpc/libtirpc_0.2.5.bb
+++ b/meta/recipes-extended/libtirpc/libtirpc_0.2.5.bb
@@ -13,9 +13,12 @@ PROVIDES = "virtual/librpc"
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.bz2;name=libtirpc \
            ${GENTOO_MIRROR}/${BPN}-glibc-nfs.tar.xz;name=glibc-nfs \
            file://libtirpc-0.2.1-fortify.patch \
+           file://0001-configure.ac-Allow-for-disabling-NIS.patch \
+           file://0002-configure.ac-Allow-for-disabling-auth-DES.patch \
+           file://0003-debug.h-Include-stdarg.patch \
           "
 
-SRC_URI_append_libc-uclibc = " file://remove-des-uclibc.patch"
+EXTRA_OECONF_append_libc-uclibc = " --disable-nis --disable-authdes"
 
 SRC_URI[libtirpc.md5sum] = "8cd41a5ef5a9b50d0fb6abb98af15368"
 SRC_URI[libtirpc.sha256sum] = "62f9de7c2c8686c568757730e1fef66502a0e00d6cacf33546d0267984e002db"
-- 
2.1.4


