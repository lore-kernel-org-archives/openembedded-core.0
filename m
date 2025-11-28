Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC140D116F6
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 06:19:17 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10261.1764310750198091513
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Nov 2025 22:19:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aIdMKutf;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-295548467c7so17542645ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 22:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764310749; x=1764915549; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YVxpaOz5+6kIUPw4b6Q05BXVV+rt+k9UcsQsZwGoCNg=;
        b=aIdMKutfI2KWVmEJk6QI992aeMErvaRyO+a3vxN+Mx7PDd3xQWZMTOntlWdXq0N/mD
         a2sWmSG0TiSN7YFmYnAF5v60OPv34JjA+XoD3R9o15brGpAt261UMxIymJtkbBJKKwnH
         UbyVsw/iqxOmEL1K7dwUuautf1yyk+y+WQOFKy9kKuuWSa468Yi2RywfTPlsBunvce58
         Yhg4eFntqvRqEYZDSEXoBvHiiOMUCI1KvJ/AzrH/SYguY41cPZVn11LFc0NiZeFSoZfL
         T075nO0B3CiJs3wHU0azXVg/8fS5Ih2pmqqy/cXY3CgDJEVFXQdLYUW72zezgQ/dCIw8
         SA3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764310749; x=1764915549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YVxpaOz5+6kIUPw4b6Q05BXVV+rt+k9UcsQsZwGoCNg=;
        b=m35HfOcEtXaUA2O4qZ0puw0/hCFpQljpc3bmsvptzXXGyEeiOWKNcBppXwIHpr05Px
         sA+M8K+oJWAX+8vPy0T4K/8w/tYLayv7ZjMSnyIs7974+7gUIYG8Y/8ZBoxHe5pYNcTQ
         dNgd86Kxh3HJ6zr760OBrrkCxnPzeAY4c0sB7U/pG99yQHVtgIF/F0GZsPx+p64kvg2T
         F9rt5dCGOBOCLqMKdp7cdG/aw5y/L0KKNbFFUM89vdAaa4CVaJWxk0PRup9Vp37pKt0T
         CHhYm/mMIPOmZhtTJqzmSK0YvWNCMmtjGeSJNJiWplvjhM6u5jnZiI6vqLQMLyefnCia
         IAiA==
X-Gm-Message-State: AOJu0YxHcFdoqDcQdjXOwNArYTSZJWpFW7qY48fPzpyluJpkdcLLMR4N
	qx2TQaIX8yEgc9nN4dcHk23Q2Hy+OdsbxMSJN+8YwBs1OpQ50V8cEf+94HqWew==
X-Gm-Gg: ASbGnctG2w2hk7odA0x70uV0QoB1eXK9IORffEq18Lnw0KQd7+v0+qr776UKfhQLK90
	w9c89f2iIEAiXZEs3/RZDHNiwPyVejXTMTMQ+fm+IFBN77OmSSt/q5fZSn/OE3TxwPN+0znLf6I
	An1fRIP8DhoYmDAu3vruzP2wibkm/TxVNey7Cqloufi15/cpuPrZqQ0YixZltKvfqwIN91vSIZU
	+LRADWZd6n3sIm7LgBclqoV5in6jaVOIKnQbcnm7ROnXnjTgXD7KEJu/3fjDW22NzoE6UgF8Cxg
	qLH5n7O44sWrAiSSzswU1mhnwluGttS3nDVU6WY/ysewbyKb/Xfr6F/JjwniWnjJ6w+oNlLzG2K
	D8rNKz7Cunxv7l8ldQHqxrMGRuOCs+IRAkYn7mujE9ywJWHVKYiQdcIqFiXOMQeZeXucugzt0IJ
	rJXaM16tmTyTE1BTGKsgUCcyHZ
X-Google-Smtp-Source: AGHT+IF21CWbtzpsx+OMsqPBi3RwniAK3v/J7XUPLUpdNVUoIOfZEQsXEVoTrXApmwFbWP0OmMFujA==
X-Received: by 2002:a17:902:ef0f:b0:299:bdaa:a71b with SMTP id d9443c01a7336-29b6be8c5femr305213595ad.2.1764310749190;
        Thu, 27 Nov 2025 22:19:09 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([165.225.124.245])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce40a60asm35427335ad.19.2025.11.27.22.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 22:19:08 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][PATCH 07/14] libtirpc: upgrade 1.3.6 -> 1.3.7
Date: Fri, 28 Nov 2025 19:18:44 +1300
Message-ID: <20251128061851.1634479-7-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251128061851.1634479-1-ankur.tyagi85@gmail.com>
References: <20251128061851.1634479-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 06:19:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226890

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Dropped patches merged in the upstream.

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...d-conditional-version-script-support.patch | 810 ------------------
 ...rations-to-allow-compile-with-gcc-15.patch |  64 --
 ...d-key_call-declarations-to-allow-com.patch |  60 --
 .../{libtirpc_1.3.6.bb => libtirpc_1.3.7.bb}  |   5 +-
 4 files changed, 1 insertion(+), 938 deletions(-)
 delete mode 100644 meta/recipes-extended/libtirpc/libtirpc/0001-Add-conditional-version-script-support.patch
 delete mode 100644 meta/recipes-extended/libtirpc/libtirpc/0001-Update-declarations-to-allow-compile-with-gcc-15.patch
 delete mode 100644 meta/recipes-extended/libtirpc/libtirpc/0002-update-signal-and-key_call-declarations-to-allow-com.patch
 rename meta/recipes-extended/libtirpc/{libtirpc_1.3.6.bb => libtirpc_1.3.7.bb} (78%)

diff --git a/meta/recipes-extended/libtirpc/libtirpc/0001-Add-conditional-version-script-support.patch b/meta/recipes-extended/libtirpc/libtirpc/0001-Add-conditional-version-script-support.patch
deleted file mode 100644
index 2764f65284..0000000000
--- a/meta/recipes-extended/libtirpc/libtirpc/0001-Add-conditional-version-script-support.patch
+++ /dev/null
@@ -1,810 +0,0 @@
-From 8ae9a335d56fc4aba8454159b326d809efca597f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 11 Aug 2025 21:13:59 -0700
-Subject: [PATCH] Add conditional version script support
-
-This patch adds conditional symbol versioning to libtirpc, allowing
-GSS-API, DES crypto, and RPC database symbols to be conditionally
-included in the version script based on build configuration.
-
-LLD is strict about undefined symbols referenced in a version script.
-Some libtirpc symbols (rpcsec_gss, old DES helpers, rpc database
-helpers) are optional and may not be built depending on configure
-options or missing deps. GNU ld tolerated this; LLD errors out.
-
-This change keeps the canonical symbol map in src/libtirpc.map, but
-adds a make-time rule to generate a filtered copy
-where names from disabled features are deleted. The lib is then linked
-against the generated linker map file.
-
-Fixes linking errors when these features are not available.
-
-Upstream-Status: Submitted [https://lore.kernel.org/linux-nfs/20250812180809.2182301-1-raj.khem@gmail.com/T/#u]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure.ac                          | 50 +++++++++++++++++++++++++++
- src/Makefile.am                       | 21 +++++++++--
- src/{libtirpc.map => libtirpc.map.in} | 48 +++++--------------------
- 3 files changed, 77 insertions(+), 42 deletions(-)
- rename src/{libtirpc.map => libtirpc.map.in} (84%)
-
---- a/configure.ac
-+++ b/configure.ac
-@@ -77,6 +77,19 @@ if test "x$enable_ipv6" != xno; then
- 	AC_DEFINE(INET6, 1, [Define to 1 if IPv6 is available])
- fi
- 
-+# RPC database support
-+AC_ARG_ENABLE(rpcdb,
-+    [AS_HELP_STRING([--enable-rpcdb], [Enable RPC Database support @<:@default=no@:>@])],
-+    [], [enable_rpcdb=no])
-+AM_CONDITIONAL(RPCDB, test "x$enable_rpcdb" = xyes)
-+if test "x$enable_rpcdb" != "xno"; then
-+    AC_CHECK_FUNCS([getrpcent getrpcbyname getrpcbynumber], [have_rpcdb=yes])
-+
-+    if test "x$have_rpcdb" = "xyes"; then
-+        AC_DEFINE([RPCDB], [1], [Define if RPC database support is available])
-+    fi
-+fi
-+
- AC_ARG_ENABLE(symvers,
- 	[AS_HELP_STRING([--disable-symvers],[Disable symbol versioning @<:@default=no@:>@])],
-       [],[enable_symvers=maybe])
-@@ -97,6 +110,33 @@ fi
- 
- AM_CONDITIONAL(SYMVERS, test "x$enable_symvers" = xyes)
- 
-+# Generate symbol lists for version script
-+if test "x$enable_gssapi" = "xyes"; then
-+    GSS_SYMBOLS="_svcauth_gss; authgss_create; authgss_create_default; authgss_free_private_data; authgss_get_private_data; authgss_service; gss_log_debug; gss_log_hexdump; gss_log_status; rpc_gss_get_error; rpc_gss_get_mech_info; rpc_gss_get_mechanisms; rpc_gss_get_principal_name; rpc_gss_get_versions; rpc_gss_qop_to_num; rpc_gss_seccreate; rpc_gss_set_callback; rpc_gss_set_defaults; rpc_gss_set_svc_name; rpc_gss_svc_max_data_length;"
-+
-+    GSS_SYMBOLS_031="svcauth_gss_get_principal; svcauth_gss_set_svc_name;"
-+else
-+    GSS_SYMBOLS=""
-+    GSS_SYMBOLS_031=""
-+fi
-+
-+if test "x$enable_authdes" = "xyes"; then
-+    DES_SYMBOLS="cbc_crypt; ecb_crypt; xdr_authdes_cred; xdr_authdes_verf; xdr_rpc_gss_cred; xdr_rpc_gss_data; xdr_rpc_gss_init_args; xdr_rpc_gss_init_res;"
-+else
-+    DES_SYMBOLS=""
-+fi
-+
-+if test "x$enable_rpcdb" = "xyes"; then
-+    RPCDB_SYMBOLS="endrpcent; getrpcent; getrpcbynumber; getrpcbyname; setrpcent;"
-+else
-+    RPCDB_SYMBOLS=""
-+fi
-+
-+AC_SUBST([GSS_SYMBOLS])
-+AC_SUBST([GSS_SYMBOLS_031])
-+AC_SUBST([DES_SYMBOLS])
-+AC_SUBST([RPCDB_SYMBOLS])
-+
- AC_CANONICAL_BUILD
- # Check for which host we are on and setup a few things
- # specifically based on the host
-@@ -167,7 +207,16 @@ AC_CHECK_FUNCS([getpeereid getrpcbyname
- AC_CHECK_TYPES(struct rpcent,,, [
-       #include <netdb.h>])
- AC_CONFIG_FILES([Makefile src/Makefile man/Makefile doc/Makefile])
-+AC_CONFIG_FILES([src/libtirpc.map])
- AC_CONFIG_FILES([libtirpc.pc])
- AC_OUTPUT
- 
-+# Configuration summary
-+AC_MSG_NOTICE([
-+libtirpc configuration summary:
-+  GSS-API support: $enable_gssapi
-+  DES crypto support: $enable_authdes
-+  RPC database support: $enable_rpcdb
-+  Symbol versioning: $enable_symvers
-+])
- 
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -6,6 +6,9 @@
- ## anything like that.
- 
- noinst_HEADERS = rpc_com.h debug.h
-+EXTRA_DIST = libtirpc.map.in
-+# Generated files
-+BUILT_SOURCES = libtirpc.map
- 
- AM_CPPFLAGS = -I$(top_srcdir)/tirpc -include config.h -DPORTMAP -DINET6 \
- 		-D_GNU_SOURCE -Wall -pipe
-@@ -15,10 +18,19 @@ lib_LTLIBRARIES = libtirpc.la
- libtirpc_la_LDFLAGS = @LDFLAG_NOUNDEFINED@ -no-undefined @PTHREAD_LIBS@
- libtirpc_la_LDFLAGS += -version-info @LT_VERSION_INFO@
- 
-+# Generate version script from template
-+libtirpc.map: $(srcdir)/libtirpc.map.in
-+	$(AM_V_GEN)$(SED) \
-+		-e 's|@GSS_SYMBOLS@|$(GSS_SYMBOLS)|g' \
-+		-e 's|@GSS_SYMBOLS_031@|$(GSS_SYMBOLS_031)|g' \
-+		-e 's|@DES_SYMBOLS@|$(DES_SYMBOLS)|g' \
-+		-e 's|@RPCDB_SYMBOLS@|$(RPCDB_SYMBOLS)|g' \
-+		< $(srcdir)/libtirpc.map.in > $@ || rm -f $@
-+
- libtirpc_la_SOURCES = auth_none.c auth_unix.c authunix_prot.c \
-         binddynport.c bindresvport.c \
-         clnt_bcast.c clnt_dg.c clnt_generic.c clnt_perror.c clnt_raw.c clnt_simple.c \
--        clnt_vc.c rpc_dtablesize.c getnetconfig.c getnetpath.c getrpcent.c \
-+        clnt_vc.c rpc_dtablesize.c getnetconfig.c getnetpath.c \
-         getrpcport.c mt_misc.c pmap_clnt.c pmap_getmaps.c pmap_getport.c \
-         pmap_prot.c pmap_prot2.c pmap_rmt.c rpc_prot.c rpc_commondata.c \
-         rpc_callmsg.c rpc_generic.c rpc_soc.c rpcb_clnt.c rpcb_prot.c \
-@@ -34,19 +46,23 @@ endif
- libtirpc_la_SOURCES += xdr.c xdr_rec.c xdr_array.c xdr_float.c xdr_mem.c xdr_reference.c xdr_stdio.c xdr_sizeof.c
- 
- if SYMVERS
--    libtirpc_la_LDFLAGS += -Wl,--version-script=$(srcdir)/libtirpc.map
-+    libtirpc_la_LDFLAGS += -Wl,--version-script=$(builddir)/libtirpc.map
- endif
- 
- ## Secure-RPC
- if GSS
--    libtirpc_la_SOURCES += auth_gss.c authgss_prot.c svc_auth_gss.c \
--			   rpc_gss_utils.c
--    libtirpc_la_LIBADD = $(GSSAPI_LIBS)
--    libtirpc_la_CFLAGS = -DHAVE_RPCSEC_GSS $(GSSAPI_CFLAGS)
-+libtirpc_la_SOURCES += auth_gss.c authgss_prot.c svc_auth_gss.c rpc_gss_utils.c
-+libtirpc_la_LIBADD = $(GSSAPI_LIBS)
-+libtirpc_la_CFLAGS = -DHAVE_RPCSEC_GSS $(GSSAPI_CFLAGS)
-+endif
-+
-+# Conditionally add RPC database sources
-+if RPCDB
-+libtirpc_la_SOURCES += getrpcent.c
- endif
- 
- libtirpc_la_SOURCES += key_call.c key_prot_xdr.c getpublickey.c
- libtirpc_la_SOURCES += netname.c netnamer.c rpcdname.c rtime.c
- 
--CLEANFILES	       = cscope.* *~
-+CLEANFILES	       = cscope.* libtirpc.map *~
- DISTCLEANFILES	       = Makefile.in
---- a/src/libtirpc.map
-+++ /dev/null
-@@ -1,335 +0,0 @@
--TIRPC_0.3.0 {
--  global:
--    # __*
--    __rpc_createerr;
--    __rpc_dtbsize;
--    __rpc_endconf;
--    __rpc_fd2sockinfo;
--    __rpc_fixup_addr;
--    __rpc_get_a_size;
--    __rpc_get_local_uid;
--    __rpc_get_t_size;
--    __rpc_getconf;
--    __rpc_getconfip;
--    __rpc_nconf2fd;
--    __rpc_nconf2fd_flags;
--    __rpc_nconf2sockinfo;
--    __rpc_rawcombuf;
--    __rpc_seman2socktype;
--    __rpc_setconf;
--    __rpc_sockinfo2netid;
--    __rpc_sockisbound;
--    __rpc_socktype2seman;
--    __rpc_taddr2uaddr_af;
--    __rpc_uaddr2taddr_af;
--    __rpcgettp;
--
--    # _*
--    _authenticate;
--    _get_next_token;
--    _gss_authenticate;
--    _null_auth;
--    _rpc_dtablesize;
--    _seterr_reply;
--    _svcauth_none;
--    _svcauth_short;
--    _svcauth_unix;
--    _svcauth_gss;
--
--    # a*
--    authdes_create;
--    authdes_seccreate;
--    authgss_create;
--    authgss_create_default;
--    authgss_free_private_data;
--    authgss_get_private_data;
--    authgss_service;
--    authnone_create;
--    authunix_create;
--    authunix_create_default;
--
--    # b*
--    bindresvport;
--    bindresvport_sa;
--
--    # c*
--    callrpc;
--    cbc_crypt;
--    clnt_broadcast;
--    clnt_create;
--    clnt_create_timed;
--    clnt_create_vers;
--    clnt_create_vers_timed;
--    clnt_dg_create;
--    clnt_pcreateerror;
--    clnt_perrno;
--    clnt_perror;
--    clnt_raw_create;
--    clnt_spcreateerror;
--    clnt_sperrno;
--    clnt_sperror;
--    clnt_tli_create;
--    clnt_tp_create;
--    clnt_tp_create_timed;
--    clnt_vc_create;
--    clntraw_create;
--    clnttcp_create;
--    clntudp_bufcreate;
--    clntudp_create;
--    clntunix_create;
--
--    # e*
--    ecb_crypt;
--    endnetconfig;
--    endnetpath;
--    endrpcent;
--
--    # f*
--    freenetconfigent;
--
--    # g*
--    get_myaddress;
--    getnetconfig;
--    getnetconfigent;
--    getnetpath;
--    getrpcent;
--    getrpcbynumber;
--    getrpcbyname;
--    getrpcport;
--    gss_log_debug;
--    gss_log_hexdump;
--    gss_log_status;
--
--    # n*
--    nc_perror;
--    nc_sperror;
--
--    # p*
--    pmap_getmaps;
--    pmap_getport;
--    pmap_rmtcall;
--    pmap_set;
--    pmap_unset;
--
--    # r*
--    registerrpc;
--    rpc_broadcast;
--    rpc_broadcast_exp;
--    rpc_call;
--    rpc_control;
--    rpc_createerr;
--    rpc_gss_get_error;
--    rpc_gss_get_mech_info;
--    rpc_gss_get_mechanisms;
--    rpc_gss_get_principal_name;
--    rpc_gss_get_versions;
--    rpc_gss_getcred;
--    rpc_gss_is_installed;
--    rpc_gss_max_data_length;
--    rpc_gss_mech_to_oid;
--    rpc_gss_qop_to_num;
--    rpc_gss_seccreate;
--    rpc_gss_set_callback;
--    rpc_gss_set_defaults;
--    rpc_gss_set_svc_name;
--    rpc_gss_svc_max_data_length;
--    rpc_nullproc;
--    rpc_reg;
--    rpcb_getaddr;
--    rpcb_getmaps;
--    rpcb_gettime;
--    rpcb_rmtcall;
--    rpcb_set;
--    rpcb_taddr2uaddr;
--    rpcb_uaddr2taddr;
--    rpcb_unset;
--
--    # s*
--    setnetconfig;
--    setnetpath;
--    setrpcent;
--    svc_auth_reg;
--    svc_create;
--    svc_dg_create;
--    svc_dg_enablecache;
--    svc_exit;
--    svc_fd_create;
--    svc_fdset;
--    svc_getreq;
--    svc_getreq_common;
--    svc_getreq_poll;
--    svc_getreqset;
--    svc_maxfd;
--    svc_raw_create;
--    svc_reg;
--    svc_register;
--    svc_run;
--    svc_sendreply;
--    svc_tli_create;
--    svc_tp_create;
--    svc_unreg;
--    svc_unregister;
--    svc_vc_create;
--    svcerr_auth;
--    svcerr_decode;
--    svcerr_noproc;
--    svcerr_noprog;
--    svcerr_progvers;
--    svcerr_systemerr;
--    svcerr_weakauth;
--    svcfd_create;
--    svcraw_create;
--    svctcp_create;
--    svcudp_bufcreate;
--    svcudp_create;
--    svcunix_create;
--    svcunixfd_create;
--
--    # t*
--    taddr2uaddr;
--
--    # u*
--    uaddr2taddr;
--
--    # x*
--    xdr_accepted_reply;
--    xdr_array;
--    xdr_authdes_cred;
--    xdr_authdes_verf;
--    xdr_authunix_parms;
--    xdr_bool;
--    xdr_bytes;
--    xdr_callhdr; xdr_callmsg;
--    xdr_char;
--    xdr_des_block;
--    xdr_double;
--    xdr_enum;
--    xdr_float;
--    xdr_free;
--    xdr_hyper;
--    xdr_int16_t;
--    xdr_int32_t;
--    xdr_int64_t;
--    xdr_int8_t;
--    xdr_int;
--    xdr_long;
--    xdr_longlong_t;
--    xdr_netbuf;
--    xdr_netobj;
--    xdr_opaque;
--    xdr_opaque_auth;
--    xdr_pmap;
--    xdr_pmaplist;
--    xdr_pmaplist_ptr;
--    xdr_pointer;
--    xdr_quad_t;
--    xdr_reference;
--    xdr_rejected_reply;
--    xdr_replymsg;
--    xdr_rmtcall_args;
--    xdr_rmtcallres;
--    xdr_rpc_gss_cred;
--    xdr_rpc_gss_data;
--    xdr_rpc_gss_init_args;
--    xdr_rpc_gss_init_res;
--    xdr_rpcb;
--    xdr_rpcb_entry;
--    xdr_rpcb_entry_list_ptr;
--    xdr_rpcb_rmtcallargs;
--    xdr_rpcb_rmtcallres;
--    xdr_rpcb_stat;
--    xdr_rpcb_stat_byvers;
--    xdr_rpcblist;
--    xdr_rpcblist_ptr;
--    xdr_rpcbs_addrlist;
--    xdr_rpcbs_addrlist_ptr;
--    xdr_rpcbs_proc;
--    xdr_rpcbs_rmtcalllist;
--    xdr_rpcbs_rmtcalllist_ptr;
--    xdr_short;
--    xdr_string;
--    xdr_u_char;
--    xdr_u_hyper;
--    xdr_u_int16_t;
--    xdr_u_int32_t;
--    xdr_u_int64_t;
--    xdr_u_int8_t;
--    xdr_u_int;
--    xdr_u_long;
--    xdr_u_longlong_t;
--    xdr_u_quad_t;
--    xdr_u_short;
--    xdr_uint16_t;
--    xdr_uint32_t;
--    xdr_uint64_t;
--    xdr_uint8_t;
--    xdr_union;
--    xdr_vector;
--    xdr_void;
--    xdr_wrapstring;
--    xdrmem_create;
--    xdrrec_create;
--    xdrrec_endofrecord;
--    xdrrec_eof;
--    xdrrec_skiprecord;
--    xdrstdio_create;
--    xprt_register;
--    xprt_unregister;
--
--  local:
--    *;
--};
--
--TIRPC_0.3.1 {
--    svcauth_gss_get_principal;
--    svcauth_gss_set_svc_name;
--} TIRPC_0.3.0;
--
--TIRPC_0.3.2 {
--    getnetname;
--    getpublicandprivatekey;
--    getpublickey;
--    host2netname;
--    key_call_destroy;
--    key_decryptsession;
--    key_decryptsession_pk;
--    key_encryptsession;
--    key_encryptsession_pk;
--    key_gendes;
--    key_get_conv;
--    key_setsecret;
--    key_secretkey_is_set;
--    key_setnet;
--    netname2host;
--    netname2user;
--    rtime;
--    user2netname;
--    xdr_cryptkeyarg;
--    xdr_cryptkeyarg2;
--    xdr_cryptkeyres;
--    xdr_getcredres;
--    xdr_key_netstarg;
--    xdr_key_netstres;
--    xdr_keybuf;
--    xdr_keystatus;
--    xdr_netnamestr;
--    xdr_unixcred;
--} TIRPC_0.3.1;
--
--TIRPC_0.3.3 {
--    __getpublickey_LOCAL;
--    __key_decryptsession_pk_LOCAL;
--    __key_encryptsession_pk_LOCAL;
--    __key_gendes_LOCAL;
--    xdr_sizeof;
--    authdes_pk_create;
--    svc_pollfd;
--    svc_max_pollfd;
--} TIRPC_0.3.2;
--
--TIRPC_PRIVATE {
--  global:
--    __libc_clntudp_bufcreate;
--  # private, but used by rpcbind:
--    __svc_clean_idle; svc_auth_none; libtirpc_set_debug;
--};
---- /dev/null
-+++ b/src/libtirpc.map.in
-@@ -0,0 +1,303 @@
-+TIRPC_0.3.0 {
-+  global:
-+    # __*
-+    __rpc_createerr;
-+    __rpc_dtbsize;
-+    __rpc_endconf;
-+    __rpc_fd2sockinfo;
-+    __rpc_fixup_addr;
-+    __rpc_get_a_size;
-+    __rpc_get_local_uid;
-+    __rpc_get_t_size;
-+    __rpc_getconf;
-+    __rpc_getconfip;
-+    __rpc_nconf2fd;
-+    __rpc_nconf2fd_flags;
-+    __rpc_nconf2sockinfo;
-+    __rpc_rawcombuf;
-+    __rpc_seman2socktype;
-+    __rpc_setconf;
-+    __rpc_sockinfo2netid;
-+    __rpc_sockisbound;
-+    __rpc_socktype2seman;
-+    __rpc_taddr2uaddr_af;
-+    __rpc_uaddr2taddr_af;
-+    __rpcgettp;
-+
-+    # _*
-+    _authenticate;
-+    _get_next_token;
-+    _gss_authenticate;
-+    _null_auth;
-+    _rpc_dtablesize;
-+    _seterr_reply;
-+    _svcauth_none;
-+    _svcauth_short;
-+    _svcauth_unix;
-+
-+    # a*
-+    authdes_create;
-+    authdes_seccreate;
-+    authnone_create;
-+    authunix_create;
-+    authunix_create_default;
-+
-+    # b*
-+    bindresvport;
-+    bindresvport_sa;
-+
-+    # c*
-+    callrpc;
-+    clnt_broadcast;
-+    clnt_create;
-+    clnt_create_timed;
-+    clnt_create_vers;
-+    clnt_create_vers_timed;
-+    clnt_dg_create;
-+    clnt_pcreateerror;
-+    clnt_perrno;
-+    clnt_perror;
-+    clnt_raw_create;
-+    clnt_spcreateerror;
-+    clnt_sperrno;
-+    clnt_sperror;
-+    clnt_tli_create;
-+    clnt_tp_create;
-+    clnt_tp_create_timed;
-+    clnt_vc_create;
-+    clntraw_create;
-+    clnttcp_create;
-+    clntudp_bufcreate;
-+    clntudp_create;
-+    clntunix_create;
-+
-+    # e*
-+    endnetconfig;
-+    endnetpath;
-+
-+    # f*
-+    freenetconfigent;
-+
-+    # g*
-+    get_myaddress;
-+    getnetconfig;
-+    getnetconfigent;
-+    getnetpath;
-+    getrpcport;
-+
-+    # n*
-+    nc_perror;
-+    nc_sperror;
-+
-+    # p*
-+    pmap_getmaps;
-+    pmap_getport;
-+    pmap_rmtcall;
-+    pmap_set;
-+    pmap_unset;
-+
-+    # r*
-+    registerrpc;
-+    rpc_broadcast;
-+    rpc_broadcast_exp;
-+    rpc_call;
-+    rpc_control;
-+    rpc_createerr;
-+    rpc_nullproc;
-+    rpc_reg;
-+    rpcb_getaddr;
-+    rpcb_getmaps;
-+    rpcb_gettime;
-+    rpcb_rmtcall;
-+    rpcb_set;
-+    rpcb_taddr2uaddr;
-+    rpcb_uaddr2taddr;
-+    rpcb_unset;
-+
-+    # s*
-+    setnetconfig;
-+    setnetpath;
-+    svc_auth_reg;
-+    svc_create;
-+    svc_dg_create;
-+    svc_dg_enablecache;
-+    svc_exit;
-+    svc_fd_create;
-+    svc_fdset;
-+    svc_getreq;
-+    svc_getreq_common;
-+    svc_getreq_poll;
-+    svc_getreqset;
-+    svc_maxfd;
-+    svc_raw_create;
-+    svc_reg;
-+    svc_register;
-+    svc_run;
-+    svc_sendreply;
-+    svc_tli_create;
-+    svc_tp_create;
-+    svc_unreg;
-+    svc_unregister;
-+    svc_vc_create;
-+    svcerr_auth;
-+    svcerr_decode;
-+    svcerr_noproc;
-+    svcerr_noprog;
-+    svcerr_progvers;
-+    svcerr_systemerr;
-+    svcerr_weakauth;
-+    svcfd_create;
-+    svcraw_create;
-+    svctcp_create;
-+    svcudp_bufcreate;
-+    svcudp_create;
-+    svcunix_create;
-+    svcunixfd_create;
-+
-+    # t*
-+    taddr2uaddr;
-+
-+    # u*
-+    uaddr2taddr;
-+
-+    # x*
-+    xdr_accepted_reply;
-+    xdr_array;
-+    xdr_authunix_parms;
-+    xdr_bool;
-+    xdr_bytes;
-+    xdr_callhdr; xdr_callmsg;
-+    xdr_char;
-+    xdr_des_block;
-+    xdr_double;
-+    xdr_enum;
-+    xdr_float;
-+    xdr_free;
-+    xdr_hyper;
-+    xdr_int16_t;
-+    xdr_int32_t;
-+    xdr_int64_t;
-+    xdr_int8_t;
-+    xdr_int;
-+    xdr_long;
-+    xdr_longlong_t;
-+    xdr_netbuf;
-+    xdr_netobj;
-+    xdr_opaque;
-+    xdr_opaque_auth;
-+    xdr_pmap;
-+    xdr_pmaplist;
-+    xdr_pmaplist_ptr;
-+    xdr_pointer;
-+    xdr_quad_t;
-+    xdr_reference;
-+    xdr_rejected_reply;
-+    xdr_replymsg;
-+    xdr_rmtcall_args;
-+    xdr_rmtcallres;
-+    xdr_rpcb;
-+    xdr_rpcb_entry;
-+    xdr_rpcb_entry_list_ptr;
-+    xdr_rpcb_rmtcallargs;
-+    xdr_rpcb_rmtcallres;
-+    xdr_rpcb_stat;
-+    xdr_rpcb_stat_byvers;
-+    xdr_rpcblist;
-+    xdr_rpcblist_ptr;
-+    xdr_rpcbs_addrlist;
-+    xdr_rpcbs_addrlist_ptr;
-+    xdr_rpcbs_proc;
-+    xdr_rpcbs_rmtcalllist;
-+    xdr_rpcbs_rmtcalllist_ptr;
-+    xdr_short;
-+    xdr_string;
-+    xdr_u_char;
-+    xdr_u_hyper;
-+    xdr_u_int16_t;
-+    xdr_u_int32_t;
-+    xdr_u_int64_t;
-+    xdr_u_int8_t;
-+    xdr_u_int;
-+    xdr_u_long;
-+    xdr_u_longlong_t;
-+    xdr_u_quad_t;
-+    xdr_u_short;
-+    xdr_uint16_t;
-+    xdr_uint32_t;
-+    xdr_uint64_t;
-+    xdr_uint8_t;
-+    xdr_union;
-+    xdr_vector;
-+    xdr_void;
-+    xdr_wrapstring;
-+    xdrmem_create;
-+    xdrrec_create;
-+    xdrrec_endofrecord;
-+    xdrrec_eof;
-+    xdrrec_skiprecord;
-+    xdrstdio_create;
-+    xprt_register;
-+    xprt_unregister;
-+    # GSS-API symbols (conditionally included)
-+@GSS_SYMBOLS@
-+    # DES crypto symbols (conditionally included)
-+@DES_SYMBOLS@
-+    # RPC database symbols (conditionally included)
-+@RPCDB_SYMBOLS@
-+
-+  local:
-+    *;
-+};
-+
-+TIRPC_0.3.1 {
-+# GSS-API symbols (conditionally included)
-+@GSS_SYMBOLS_031@
-+} TIRPC_0.3.0;
-+
-+TIRPC_0.3.2 {
-+    getnetname;
-+    getpublicandprivatekey;
-+    getpublickey;
-+    host2netname;
-+    key_decryptsession;
-+    key_decryptsession_pk;
-+    key_encryptsession;
-+    key_encryptsession_pk;
-+    key_gendes;
-+    key_get_conv;
-+    key_setsecret;
-+    key_secretkey_is_set;
-+    key_setnet;
-+    netname2host;
-+    netname2user;
-+    rtime;
-+    user2netname;
-+    xdr_cryptkeyarg;
-+    xdr_cryptkeyarg2;
-+    xdr_cryptkeyres;
-+    xdr_getcredres;
-+    xdr_key_netstarg;
-+    xdr_key_netstres;
-+    xdr_keybuf;
-+    xdr_keystatus;
-+    xdr_netnamestr;
-+    xdr_unixcred;
-+} TIRPC_0.3.1;
-+
-+TIRPC_0.3.3 {
-+    __getpublickey_LOCAL;
-+    __key_decryptsession_pk_LOCAL;
-+    __key_encryptsession_pk_LOCAL;
-+    __key_gendes_LOCAL;
-+    xdr_sizeof;
-+    authdes_pk_create;
-+    svc_pollfd;
-+    svc_max_pollfd;
-+} TIRPC_0.3.2;
-+
-+TIRPC_PRIVATE {
-+  global:
-+    __libc_clntudp_bufcreate;
-+  # private, but used by rpcbind:
-+    __svc_clean_idle; svc_auth_none; libtirpc_set_debug;
-+};
diff --git a/meta/recipes-extended/libtirpc/libtirpc/0001-Update-declarations-to-allow-compile-with-gcc-15.patch b/meta/recipes-extended/libtirpc/libtirpc/0001-Update-declarations-to-allow-compile-with-gcc-15.patch
deleted file mode 100644
index 7bfe7c2924..0000000000
--- a/meta/recipes-extended/libtirpc/libtirpc/0001-Update-declarations-to-allow-compile-with-gcc-15.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From b526c0a90953f47d4cbf7ef01e9ac13e9e76904a Mon Sep 17 00:00:00 2001
-From: Rudi Heitbaum <rudi@heitbaum.com>
-Date: Thu, 12 Dec 2024 04:16:02 -0500
-Subject: [PATCH 1/2] Update declarations to allow compile with gcc-15
-
-This patch fixes some of the compile errors with gcc 15-20241117.
-
-In addition the follow declarations need to be fixed:
-  sed -n 75,77p libtirpc-1.3.6/src/key_call.c
-  cryptkeyres *(*__key_encryptsession_pk_LOCAL)() = 0;
-  cryptkeyres *(*__key_decryptsession_pk_LOCAL)() = 0;
-  des_block *(*__key_gendes_LOCAL)() = 0;
-
-Upstream-Status: Backport [https://git.linux-nfs.org/?p=steved/libtirpc.git;a=commit;h=d473f1e1f6ba80bfaee4daa058da159305167323]
-Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
-Signed-off-by: Steve Dickson <steved@redhat.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/auth_none.c     | 2 +-
- src/getpublickey.c  | 2 +-
- src/svc_auth_none.c | 4 ++--
- 3 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/src/auth_none.c b/src/auth_none.c
-index 0b0bbd1..aca6e71 100644
---- a/src/auth_none.c
-+++ b/src/auth_none.c
-@@ -62,7 +62,7 @@ static bool_t authnone_validate (AUTH *, struct opaque_auth *);
- static bool_t authnone_refresh (AUTH *, void *);
- static void authnone_destroy (AUTH *);
- 
--extern bool_t xdr_opaque_auth();
-+extern bool_t xdr_opaque_auth(XDR *, struct opaque_auth *);
- 
- static struct auth_ops *authnone_ops();
- 
-diff --git a/src/getpublickey.c b/src/getpublickey.c
-index be37a24..4e96c7c 100644
---- a/src/getpublickey.c
-+++ b/src/getpublickey.c
-@@ -52,7 +52,7 @@
- /*
-  * Hack to let ypserv/rpc.nisd use AUTH_DES.
-  */
--int (*__getpublickey_LOCAL)() = 0;
-+int (*__getpublickey_LOCAL)(const char *, char *) = 0;
- 
- /*
-  * Get somebody's public key
-diff --git a/src/svc_auth_none.c b/src/svc_auth_none.c
-index 887e809..5ca98e9 100644
---- a/src/svc_auth_none.c
-+++ b/src/svc_auth_none.c
-@@ -37,8 +37,8 @@
- 
- #include <rpc/rpc.h>
- 
--static bool_t	svcauth_none_destroy();
--static bool_t   svcauth_none_wrap();
-+static bool_t	svcauth_none_destroy(SVCAUTH *);
-+static bool_t   svcauth_none_wrap(SVCAUTH *, XDR *, bool_t (*)(XDR *, ...), char *);
- 
- struct svc_auth_ops svc_auth_none_ops = {
- 	svcauth_none_wrap,
diff --git a/meta/recipes-extended/libtirpc/libtirpc/0002-update-signal-and-key_call-declarations-to-allow-com.patch b/meta/recipes-extended/libtirpc/libtirpc/0002-update-signal-and-key_call-declarations-to-allow-com.patch
deleted file mode 100644
index 83e2105a1a..0000000000
--- a/meta/recipes-extended/libtirpc/libtirpc/0002-update-signal-and-key_call-declarations-to-allow-com.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 55452e6ae71869880f8c85d5dba9aa24d7147d8b Mon Sep 17 00:00:00 2001
-From: Rudi Heitbaum <rudi@heitbaum.com>
-Date: Thu, 2 Jan 2025 08:46:24 -0500
-Subject: [PATCH 2/2] update signal and key_call declarations to allow compile
- with gcc-15
-
-Follow up patch addressing the following declarations:
-  sed -n 75,77p libtirpc-1.3.6/src/key_call.c
-  cryptkeyres *(*__key_encryptsession_pk_LOCAL)() = 0;
-  cryptkeyres *(*__key_decryptsession_pk_LOCAL)() = 0;
-  des_block *(*__key_gendes_LOCAL)() = 0;
-
-Upstream-Status: Backport [https://git.linux-nfs.org/?p=steved/libtirpc.git;a=commit;h=240ee6c774729c9c24812aa8912f1fcf8996b162]
-Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
-Signed-off-by: Steve Dickson <steved@redhat.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/auth_time.c | 4 ++--
- src/key_call.c  | 6 +++---
- 2 files changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/src/auth_time.c b/src/auth_time.c
-index 936dd76..c21b1df 100644
---- a/src/auth_time.c
-+++ b/src/auth_time.c
-@@ -248,7 +248,7 @@ __rpc_get_time_offset(td, srv, thost, uaddr, netid)
- 	char			ut[64], ipuaddr[64];
- 	endpoint		teps[32];
- 	nis_server		tsrv;
--	void			(*oldsig)() = NULL; /* old alarm handler */
-+	void			(*oldsig)(int) = NULL; /* old alarm handler */
- 	struct sockaddr_in	sin;
- 	int			s = RPC_ANYSOCK;
- 	socklen_t len;
-@@ -417,7 +417,7 @@ __rpc_get_time_offset(td, srv, thost, uaddr, netid)
- 		} else {
- 			int res;
- 
--			oldsig = (void (*)())signal(SIGALRM, alarm_hndler);
-+			oldsig = (void (*)(int))signal(SIGALRM, alarm_hndler);
- 			saw_alarm = 0; /* global tracking the alarm */
- 			alarm(20); /* only wait 20 seconds */
- 			res = connect(s, (struct sockaddr *)&sin, sizeof(sin));
-diff --git a/src/key_call.c b/src/key_call.c
-index 9f4b1d2..43f990e 100644
---- a/src/key_call.c
-+++ b/src/key_call.c
-@@ -72,9 +72,9 @@
-  * implementations of these functions, and to call those in key_call().
-  */
- 
--cryptkeyres *(*__key_encryptsession_pk_LOCAL)() = 0;
--cryptkeyres *(*__key_decryptsession_pk_LOCAL)() = 0;
--des_block *(*__key_gendes_LOCAL)() = 0;
-+cryptkeyres *(*__key_encryptsession_pk_LOCAL)(uid_t, char *) = 0;
-+cryptkeyres *(*__key_decryptsession_pk_LOCAL)(uid_t, char *) = 0;
-+des_block *(*__key_gendes_LOCAL)(uid_t, char *) = 0;
- 
- static int key_call( u_long, xdrproc_t, void *, xdrproc_t, void *);
- 
diff --git a/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb b/meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb
similarity index 78%
rename from meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb
rename to meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb
index c6901839c1..edc75a8366 100644
--- a/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb
+++ b/meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb
@@ -10,13 +10,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f835cce8852481e4b2bbbdd23b5e47f3 \
 PROVIDES = "virtual/librpc"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.bz2 \
-           file://0001-Update-declarations-to-allow-compile-with-gcc-15.patch \
-           file://0002-update-signal-and-key_call-declarations-to-allow-com.patch \
-           file://0001-Add-conditional-version-script-support.patch \
           "
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/libtirpc/files/libtirpc/"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)/"
-SRC_URI[sha256sum] = "bbd26a8f0df5690a62a47f6aa30f797f3ef8d02560d1bc449a83066b5a1d3508"
+SRC_URI[sha256sum] = "b47d3ac19d3549e54a05d0019a6c400674da716123858cfdb6d3bdd70a66c702"
 
 inherit autotools pkgconfig
 

