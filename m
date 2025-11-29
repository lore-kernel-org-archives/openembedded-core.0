Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AC20D116E2
	for <webhook@archiver.kernel.org>; Sat, 29 Nov 2025 02:24:53 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8329.1764383084690702910
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Nov 2025 18:24:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=W6kPGpyW;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-78a6c7ac3caso25870587b3.0
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 18:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764383084; x=1764987884; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=S0TtOc0dQ8Ruj2FXLzXSGtmH4gaqfN8hiqlqs6pJK8E=;
        b=W6kPGpyW/S/HMw7vJHVs3aOvddFlD4NgvjALhiAyIrSwP+i8cUHHPQ2Wn1JfN8z66t
         ttIpoCJhR+Iqv30eu9WwsOz9203o+Fj1GEY1hOuih4umPTqaJ5Fj/I7E9Q7IzXHyiw2q
         hykzROFv72PzhtGZY9lZ8fdtFN92W+v1cYQ7mpnjRn4PG255HxnenEO6X8LO4KvpXGee
         bCOx4Dcj8p5Uooj8suu8jCbS0S3lV2Hutoa/zfF0pbEJa0Cm/iflFD7Hk4AL9GdLkv74
         1/qSZ0vflDLLKC8pk8zRJohpHxGtPfMguw3vIA3y+Xnsas4UQFbQvHPETkgvYRlRAw0q
         +JUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764383084; x=1764987884;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S0TtOc0dQ8Ruj2FXLzXSGtmH4gaqfN8hiqlqs6pJK8E=;
        b=ZBEdOz8SmtxsAIAu7w0hLfD7tQc7VP4XDxLhEMQl5QJinkBVSaoo4zS2/IwUQIqEn/
         Nz2J72EuxYPJzJJdwsudK/RQfTakKqre8meI9i4h21lHRxm7duRQt7zy+Jti+VT5vFcb
         c6zm4AFYlE6uAxq1vozLEdhiuUqi36SiW/uA+x2bhdRBBqu24ndwVjqkquX2hhXFo5DN
         q/3edmYehkG9aNMtnZczWEetFm0t6qugfNzLeAMJMpPdroTLjUC93PAePeDt2UPr+oDe
         FbAS5v3cQq/rBe31KmEK43+feQhioN0IaRHwrK8cQ88qorP45yMQFUExucvA1xPZyOsD
         CohQ==
X-Gm-Message-State: AOJu0YyHBL+4rOearx2jb5s9kysFCCaHERgToVru7Wgk3ZD9nT6AVH/0
	MmXNzBqcJhgRXfRLIBa9CZ1e7P79c4qnmyAcHRrKAaQm8wNMkENMOmS0qLdZqO8O2nQlE993wYS
	K0RS0wAAMgvBpFX1cdPdzNmEGzIuv9B0=
X-Gm-Gg: ASbGncvtvlRHJw3yRBjUVxLdhrveH7XDxLKztctAahVMFoJQNglyhadB8++nUra5InW
	2vruMSaLZF1asgkiVqHE87y81/vBy0PiS5kNdWj5WMANEA9IckAqQlEHH11V+8y9S+1XYQJivyv
	qy1uSiZuNkwv1+C4q1vDy13KAYjKpIB6g6zy+v2iS+7ZRANAoqh0Mf108UVl2DH8iePrOkA5/JE
	expSqOfqpJKPLpzWRl7Vk65RWXdioBcPNNTGC51xzJKNRFBBReGRwoH4GZH2BxH9kxOjwDkVe6g
	R/inXHkqoEyFWsfjTzFAdWZOvoL2sNg/VPlaqxXmgS3TGOr21Zigd/xE3i4c4fI615UuY0L3Fe9
	Es7WGohRZiVMpaVwdIxAvbYh8etQKcbS1bUd/5nAgQVfKcA==
X-Google-Smtp-Source: AGHT+IEojH+uEOv9fx8EFDKoaVhtq4vJfnBfUhYVyWLWIfgl6dJiNXYIIDI07yktA4oQRJBwetgciKjdEshE5ZyWTY4=
X-Received: by 2002:a05:690c:887:b0:786:5be2:d460 with SMTP id
 00721157ae682-78a8b4550b7mr242881667b3.1.1764383083497; Fri, 28 Nov 2025
 18:24:43 -0800 (PST)
MIME-Version: 1.0
References: <20251128061851.1634479-1-ankur.tyagi85@gmail.com> <20251128061851.1634479-7-ankur.tyagi85@gmail.com>
In-Reply-To: <20251128061851.1634479-7-ankur.tyagi85@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 28 Nov 2025 18:24:16 -0800
X-Gm-Features: AWmQ_bltKo-YAOcG8MA5LunNlewqmiZn5L0rzOg02eEaffDg5Yy58Kyuk-uz2uE
Message-ID: <CAMKF1sq_5HD9ptwr50tAqd7q7D+AUVEkpj2UydsrbG595hj=bA@mail.gmail.com>
Subject: Re: [OE-core][PATCH 07/14] libtirpc: upgrade 1.3.6 -> 1.3.7
To: ankur.tyagi85@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f08ec50644b2724d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Nov 2025 02:24:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226922

--000000000000f08ec50644b2724d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

have you tried building it with -fuse-ld=3Dlld and TOOLCHAIN =3D "clang"

On Thu, Nov 27, 2025 at 10:19=E2=80=AFPM Ankur Tyagi via lists.openembedded=
.org
<ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:

> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>
> Dropped patches merged in the upstream.
>
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  ...d-conditional-version-script-support.patch | 810 ------------------
>  ...rations-to-allow-compile-with-gcc-15.patch |  64 --
>  ...d-key_call-declarations-to-allow-com.patch |  60 --
>  .../{libtirpc_1.3.6.bb =3D> libtirpc_1.3.7.bb}  |   5 +-
>  4 files changed, 1 insertion(+), 938 deletions(-)
>  delete mode 100644
> meta/recipes-extended/libtirpc/libtirpc/0001-Add-conditional-version-scri=
pt-support.patch
>  delete mode 100644
> meta/recipes-extended/libtirpc/libtirpc/0001-Update-declarations-to-allow=
-compile-with-gcc-15.patch
>  delete mode 100644
> meta/recipes-extended/libtirpc/libtirpc/0002-update-signal-and-key_call-d=
eclarations-to-allow-com.patch
>  rename meta/recipes-extended/libtirpc/{libtirpc_1.3.6.bb =3D>
> libtirpc_1.3.7.bb} (78%)
>
> diff --git
> a/meta/recipes-extended/libtirpc/libtirpc/0001-Add-conditional-version-sc=
ript-support.patch
> b/meta/recipes-extended/libtirpc/libtirpc/0001-Add-conditional-version-sc=
ript-support.patch
> deleted file mode 100644
> index 2764f65284..0000000000
> ---
> a/meta/recipes-extended/libtirpc/libtirpc/0001-Add-conditional-version-sc=
ript-support.patch
> +++ /dev/null
> @@ -1,810 +0,0 @@
> -From 8ae9a335d56fc4aba8454159b326d809efca597f Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Mon, 11 Aug 2025 21:13:59 -0700
> -Subject: [PATCH] Add conditional version script support
> -
> -This patch adds conditional symbol versioning to libtirpc, allowing
> -GSS-API, DES crypto, and RPC database symbols to be conditionally
> -included in the version script based on build configuration.
> -
> -LLD is strict about undefined symbols referenced in a version script.
> -Some libtirpc symbols (rpcsec_gss, old DES helpers, rpc database
> -helpers) are optional and may not be built depending on configure
> -options or missing deps. GNU ld tolerated this; LLD errors out.
> -
> -This change keeps the canonical symbol map in src/libtirpc.map, but
> -adds a make-time rule to generate a filtered copy
> -where names from disabled features are deleted. The lib is then linked
> -against the generated linker map file.
> -
> -Fixes linking errors when these features are not available.
> -
> -Upstream-Status: Submitted [
> https://lore.kernel.org/linux-nfs/20250812180809.2182301-1-raj.khem@gmail=
.com/T/#u
> ]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - configure.ac                          | 50 +++++++++++++++++++++++++++
> - src/Makefile.am                       | 21 +++++++++--
> - src/{libtirpc.map =3D> libtirpc.map.in} | 48 +++++--------------------
> - 3 files changed, 77 insertions(+), 42 deletions(-)
> - rename src/{libtirpc.map =3D> libtirpc.map.in} (84%)
> -
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -77,6 +77,19 @@ if test "x$enable_ipv6" !=3D xno; then
> -       AC_DEFINE(INET6, 1, [Define to 1 if IPv6 is available])
> - fi
> -
> -+# RPC database support
> -+AC_ARG_ENABLE(rpcdb,
> -+    [AS_HELP_STRING([--enable-rpcdb], [Enable RPC Database support
> @<:@default=3Dno@:>@])],
> -+    [], [enable_rpcdb=3Dno])
> -+AM_CONDITIONAL(RPCDB, test "x$enable_rpcdb" =3D xyes)
> -+if test "x$enable_rpcdb" !=3D "xno"; then
> -+    AC_CHECK_FUNCS([getrpcent getrpcbyname getrpcbynumber],
> [have_rpcdb=3Dyes])
> -+
> -+    if test "x$have_rpcdb" =3D "xyes"; then
> -+        AC_DEFINE([RPCDB], [1], [Define if RPC database support is
> available])
> -+    fi
> -+fi
> -+
> - AC_ARG_ENABLE(symvers,
> -       [AS_HELP_STRING([--disable-symvers],[Disable symbol versioning
> @<:@default=3Dno@:>@])],
> -       [],[enable_symvers=3Dmaybe])
> -@@ -97,6 +110,33 @@ fi
> -
> - AM_CONDITIONAL(SYMVERS, test "x$enable_symvers" =3D xyes)
> -
> -+# Generate symbol lists for version script
> -+if test "x$enable_gssapi" =3D "xyes"; then
> -+    GSS_SYMBOLS=3D"_svcauth_gss; authgss_create; authgss_create_default=
;
> authgss_free_private_data; authgss_get_private_data; authgss_service;
> gss_log_debug; gss_log_hexdump; gss_log_status; rpc_gss_get_error;
> rpc_gss_get_mech_info; rpc_gss_get_mechanisms; rpc_gss_get_principal_name=
;
> rpc_gss_get_versions; rpc_gss_qop_to_num; rpc_gss_seccreate;
> rpc_gss_set_callback; rpc_gss_set_defaults; rpc_gss_set_svc_name;
> rpc_gss_svc_max_data_length;"
> -+
> -+    GSS_SYMBOLS_031=3D"svcauth_gss_get_principal;
> svcauth_gss_set_svc_name;"
> -+else
> -+    GSS_SYMBOLS=3D""
> -+    GSS_SYMBOLS_031=3D""
> -+fi
> -+
> -+if test "x$enable_authdes" =3D "xyes"; then
> -+    DES_SYMBOLS=3D"cbc_crypt; ecb_crypt; xdr_authdes_cred;
> xdr_authdes_verf; xdr_rpc_gss_cred; xdr_rpc_gss_data;
> xdr_rpc_gss_init_args; xdr_rpc_gss_init_res;"
> -+else
> -+    DES_SYMBOLS=3D""
> -+fi
> -+
> -+if test "x$enable_rpcdb" =3D "xyes"; then
> -+    RPCDB_SYMBOLS=3D"endrpcent; getrpcent; getrpcbynumber; getrpcbyname=
;
> setrpcent;"
> -+else
> -+    RPCDB_SYMBOLS=3D""
> -+fi
> -+
> -+AC_SUBST([GSS_SYMBOLS])
> -+AC_SUBST([GSS_SYMBOLS_031])
> -+AC_SUBST([DES_SYMBOLS])
> -+AC_SUBST([RPCDB_SYMBOLS])
> -+
> - AC_CANONICAL_BUILD
> - # Check for which host we are on and setup a few things
> - # specifically based on the host
> -@@ -167,7 +207,16 @@ AC_CHECK_FUNCS([getpeereid getrpcbyname
> - AC_CHECK_TYPES(struct rpcent,,, [
> -       #include <netdb.h>])
> - AC_CONFIG_FILES([Makefile src/Makefile man/Makefile doc/Makefile])
> -+AC_CONFIG_FILES([src/libtirpc.map])
> - AC_CONFIG_FILES([libtirpc.pc])
> - AC_OUTPUT
> -
> -+# Configuration summary
> -+AC_MSG_NOTICE([
> -+libtirpc configuration summary:
> -+  GSS-API support: $enable_gssapi
> -+  DES crypto support: $enable_authdes
> -+  RPC database support: $enable_rpcdb
> -+  Symbol versioning: $enable_symvers
> -+])
> -
> ---- a/src/Makefile.am
> -+++ b/src/Makefile.am
> -@@ -6,6 +6,9 @@
> - ## anything like that.
> -
> - noinst_HEADERS =3D rpc_com.h debug.h
> -+EXTRA_DIST =3D libtirpc.map.in
> -+# Generated files
> -+BUILT_SOURCES =3D libtirpc.map
> -
> - AM_CPPFLAGS =3D -I$(top_srcdir)/tirpc -include config.h -DPORTMAP -DINE=
T6 \
> -               -D_GNU_SOURCE -Wall -pipe
> -@@ -15,10 +18,19 @@ lib_LTLIBRARIES =3D libtirpc.la
> - libtirpc_la_LDFLAGS =3D @LDFLAG_NOUNDEFINED@ -no-undefined @PTHREAD_LIB=
S@
> - libtirpc_la_LDFLAGS +=3D -version-info @LT_VERSION_INFO@
> -
> -+# Generate version script from template
> -+libtirpc.map: $(srcdir)/libtirpc.map.in
> -+      $(AM_V_GEN)$(SED) \
> -+              -e 's|@GSS_SYMBOLS@|$(GSS_SYMBOLS)|g' \
> -+              -e 's|@GSS_SYMBOLS_031@|$(GSS_SYMBOLS_031)|g' \
> -+              -e 's|@DES_SYMBOLS@|$(DES_SYMBOLS)|g' \
> -+              -e 's|@RPCDB_SYMBOLS@|$(RPCDB_SYMBOLS)|g' \
> -+              < $(srcdir)/libtirpc.map.in > $@ || rm -f $@
> -+
> - libtirpc_la_SOURCES =3D auth_none.c auth_unix.c authunix_prot.c \
> -         binddynport.c bindresvport.c \
> -         clnt_bcast.c clnt_dg.c clnt_generic.c clnt_perror.c clnt_raw.c
> clnt_simple.c \
> --        clnt_vc.c rpc_dtablesize.c getnetconfig.c getnetpath.c
> getrpcent.c \
> -+        clnt_vc.c rpc_dtablesize.c getnetconfig.c getnetpath.c \
> -         getrpcport.c mt_misc.c pmap_clnt.c pmap_getmaps.c pmap_getport.=
c
> \
> -         pmap_prot.c pmap_prot2.c pmap_rmt.c rpc_prot.c rpc_commondata.c=
 \
> -         rpc_callmsg.c rpc_generic.c rpc_soc.c rpcb_clnt.c rpcb_prot.c \
> -@@ -34,19 +46,23 @@ endif
> - libtirpc_la_SOURCES +=3D xdr.c xdr_rec.c xdr_array.c xdr_float.c xdr_me=
m.c
> xdr_reference.c xdr_stdio.c xdr_sizeof.c
> -
> - if SYMVERS
> --    libtirpc_la_LDFLAGS +=3D -Wl,--version-script=3D$(srcdir)/libtirpc.=
map
> -+    libtirpc_la_LDFLAGS +=3D -Wl,--version-script=3D$(builddir)/libtirp=
c.map
> - endif
> -
> - ## Secure-RPC
> - if GSS
> --    libtirpc_la_SOURCES +=3D auth_gss.c authgss_prot.c svc_auth_gss.c \
> --                         rpc_gss_utils.c
> --    libtirpc_la_LIBADD =3D $(GSSAPI_LIBS)
> --    libtirpc_la_CFLAGS =3D -DHAVE_RPCSEC_GSS $(GSSAPI_CFLAGS)
> -+libtirpc_la_SOURCES +=3D auth_gss.c authgss_prot.c svc_auth_gss.c
> rpc_gss_utils.c
> -+libtirpc_la_LIBADD =3D $(GSSAPI_LIBS)
> -+libtirpc_la_CFLAGS =3D -DHAVE_RPCSEC_GSS $(GSSAPI_CFLAGS)
> -+endif
> -+
> -+# Conditionally add RPC database sources
> -+if RPCDB
> -+libtirpc_la_SOURCES +=3D getrpcent.c
> - endif
> -
> - libtirpc_la_SOURCES +=3D key_call.c key_prot_xdr.c getpublickey.c
> - libtirpc_la_SOURCES +=3D netname.c netnamer.c rpcdname.c rtime.c
> -
> --CLEANFILES           =3D cscope.* *~
> -+CLEANFILES           =3D cscope.* libtirpc.map *~
> - DISTCLEANFILES               =3D Makefile.in
> ---- a/src/libtirpc.map
> -+++ /dev/null
> -@@ -1,335 +0,0 @@
> --TIRPC_0.3.0 {
> --  global:
> --    # __*
> --    __rpc_createerr;
> --    __rpc_dtbsize;
> --    __rpc_endconf;
> --    __rpc_fd2sockinfo;
> --    __rpc_fixup_addr;
> --    __rpc_get_a_size;
> --    __rpc_get_local_uid;
> --    __rpc_get_t_size;
> --    __rpc_getconf;
> --    __rpc_getconfip;
> --    __rpc_nconf2fd;
> --    __rpc_nconf2fd_flags;
> --    __rpc_nconf2sockinfo;
> --    __rpc_rawcombuf;
> --    __rpc_seman2socktype;
> --    __rpc_setconf;
> --    __rpc_sockinfo2netid;
> --    __rpc_sockisbound;
> --    __rpc_socktype2seman;
> --    __rpc_taddr2uaddr_af;
> --    __rpc_uaddr2taddr_af;
> --    __rpcgettp;
> --
> --    # _*
> --    _authenticate;
> --    _get_next_token;
> --    _gss_authenticate;
> --    _null_auth;
> --    _rpc_dtablesize;
> --    _seterr_reply;
> --    _svcauth_none;
> --    _svcauth_short;
> --    _svcauth_unix;
> --    _svcauth_gss;
> --
> --    # a*
> --    authdes_create;
> --    authdes_seccreate;
> --    authgss_create;
> --    authgss_create_default;
> --    authgss_free_private_data;
> --    authgss_get_private_data;
> --    authgss_service;
> --    authnone_create;
> --    authunix_create;
> --    authunix_create_default;
> --
> --    # b*
> --    bindresvport;
> --    bindresvport_sa;
> --
> --    # c*
> --    callrpc;
> --    cbc_crypt;
> --    clnt_broadcast;
> --    clnt_create;
> --    clnt_create_timed;
> --    clnt_create_vers;
> --    clnt_create_vers_timed;
> --    clnt_dg_create;
> --    clnt_pcreateerror;
> --    clnt_perrno;
> --    clnt_perror;
> --    clnt_raw_create;
> --    clnt_spcreateerror;
> --    clnt_sperrno;
> --    clnt_sperror;
> --    clnt_tli_create;
> --    clnt_tp_create;
> --    clnt_tp_create_timed;
> --    clnt_vc_create;
> --    clntraw_create;
> --    clnttcp_create;
> --    clntudp_bufcreate;
> --    clntudp_create;
> --    clntunix_create;
> --
> --    # e*
> --    ecb_crypt;
> --    endnetconfig;
> --    endnetpath;
> --    endrpcent;
> --
> --    # f*
> --    freenetconfigent;
> --
> --    # g*
> --    get_myaddress;
> --    getnetconfig;
> --    getnetconfigent;
> --    getnetpath;
> --    getrpcent;
> --    getrpcbynumber;
> --    getrpcbyname;
> --    getrpcport;
> --    gss_log_debug;
> --    gss_log_hexdump;
> --    gss_log_status;
> --
> --    # n*
> --    nc_perror;
> --    nc_sperror;
> --
> --    # p*
> --    pmap_getmaps;
> --    pmap_getport;
> --    pmap_rmtcall;
> --    pmap_set;
> --    pmap_unset;
> --
> --    # r*
> --    registerrpc;
> --    rpc_broadcast;
> --    rpc_broadcast_exp;
> --    rpc_call;
> --    rpc_control;
> --    rpc_createerr;
> --    rpc_gss_get_error;
> --    rpc_gss_get_mech_info;
> --    rpc_gss_get_mechanisms;
> --    rpc_gss_get_principal_name;
> --    rpc_gss_get_versions;
> --    rpc_gss_getcred;
> --    rpc_gss_is_installed;
> --    rpc_gss_max_data_length;
> --    rpc_gss_mech_to_oid;
> --    rpc_gss_qop_to_num;
> --    rpc_gss_seccreate;
> --    rpc_gss_set_callback;
> --    rpc_gss_set_defaults;
> --    rpc_gss_set_svc_name;
> --    rpc_gss_svc_max_data_length;
> --    rpc_nullproc;
> --    rpc_reg;
> --    rpcb_getaddr;
> --    rpcb_getmaps;
> --    rpcb_gettime;
> --    rpcb_rmtcall;
> --    rpcb_set;
> --    rpcb_taddr2uaddr;
> --    rpcb_uaddr2taddr;
> --    rpcb_unset;
> --
> --    # s*
> --    setnetconfig;
> --    setnetpath;
> --    setrpcent;
> --    svc_auth_reg;
> --    svc_create;
> --    svc_dg_create;
> --    svc_dg_enablecache;
> --    svc_exit;
> --    svc_fd_create;
> --    svc_fdset;
> --    svc_getreq;
> --    svc_getreq_common;
> --    svc_getreq_poll;
> --    svc_getreqset;
> --    svc_maxfd;
> --    svc_raw_create;
> --    svc_reg;
> --    svc_register;
> --    svc_run;
> --    svc_sendreply;
> --    svc_tli_create;
> --    svc_tp_create;
> --    svc_unreg;
> --    svc_unregister;
> --    svc_vc_create;
> --    svcerr_auth;
> --    svcerr_decode;
> --    svcerr_noproc;
> --    svcerr_noprog;
> --    svcerr_progvers;
> --    svcerr_systemerr;
> --    svcerr_weakauth;
> --    svcfd_create;
> --    svcraw_create;
> --    svctcp_create;
> --    svcudp_bufcreate;
> --    svcudp_create;
> --    svcunix_create;
> --    svcunixfd_create;
> --
> --    # t*
> --    taddr2uaddr;
> --
> --    # u*
> --    uaddr2taddr;
> --
> --    # x*
> --    xdr_accepted_reply;
> --    xdr_array;
> --    xdr_authdes_cred;
> --    xdr_authdes_verf;
> --    xdr_authunix_parms;
> --    xdr_bool;
> --    xdr_bytes;
> --    xdr_callhdr; xdr_callmsg;
> --    xdr_char;
> --    xdr_des_block;
> --    xdr_double;
> --    xdr_enum;
> --    xdr_float;
> --    xdr_free;
> --    xdr_hyper;
> --    xdr_int16_t;
> --    xdr_int32_t;
> --    xdr_int64_t;
> --    xdr_int8_t;
> --    xdr_int;
> --    xdr_long;
> --    xdr_longlong_t;
> --    xdr_netbuf;
> --    xdr_netobj;
> --    xdr_opaque;
> --    xdr_opaque_auth;
> --    xdr_pmap;
> --    xdr_pmaplist;
> --    xdr_pmaplist_ptr;
> --    xdr_pointer;
> --    xdr_quad_t;
> --    xdr_reference;
> --    xdr_rejected_reply;
> --    xdr_replymsg;
> --    xdr_rmtcall_args;
> --    xdr_rmtcallres;
> --    xdr_rpc_gss_cred;
> --    xdr_rpc_gss_data;
> --    xdr_rpc_gss_init_args;
> --    xdr_rpc_gss_init_res;
> --    xdr_rpcb;
> --    xdr_rpcb_entry;
> --    xdr_rpcb_entry_list_ptr;
> --    xdr_rpcb_rmtcallargs;
> --    xdr_rpcb_rmtcallres;
> --    xdr_rpcb_stat;
> --    xdr_rpcb_stat_byvers;
> --    xdr_rpcblist;
> --    xdr_rpcblist_ptr;
> --    xdr_rpcbs_addrlist;
> --    xdr_rpcbs_addrlist_ptr;
> --    xdr_rpcbs_proc;
> --    xdr_rpcbs_rmtcalllist;
> --    xdr_rpcbs_rmtcalllist_ptr;
> --    xdr_short;
> --    xdr_string;
> --    xdr_u_char;
> --    xdr_u_hyper;
> --    xdr_u_int16_t;
> --    xdr_u_int32_t;
> --    xdr_u_int64_t;
> --    xdr_u_int8_t;
> --    xdr_u_int;
> --    xdr_u_long;
> --    xdr_u_longlong_t;
> --    xdr_u_quad_t;
> --    xdr_u_short;
> --    xdr_uint16_t;
> --    xdr_uint32_t;
> --    xdr_uint64_t;
> --    xdr_uint8_t;
> --    xdr_union;
> --    xdr_vector;
> --    xdr_void;
> --    xdr_wrapstring;
> --    xdrmem_create;
> --    xdrrec_create;
> --    xdrrec_endofrecord;
> --    xdrrec_eof;
> --    xdrrec_skiprecord;
> --    xdrstdio_create;
> --    xprt_register;
> --    xprt_unregister;
> --
> --  local:
> --    *;
> --};
> --
> --TIRPC_0.3.1 {
> --    svcauth_gss_get_principal;
> --    svcauth_gss_set_svc_name;
> --} TIRPC_0.3.0;
> --
> --TIRPC_0.3.2 {
> --    getnetname;
> --    getpublicandprivatekey;
> --    getpublickey;
> --    host2netname;
> --    key_call_destroy;
> --    key_decryptsession;
> --    key_decryptsession_pk;
> --    key_encryptsession;
> --    key_encryptsession_pk;
> --    key_gendes;
> --    key_get_conv;
> --    key_setsecret;
> --    key_secretkey_is_set;
> --    key_setnet;
> --    netname2host;
> --    netname2user;
> --    rtime;
> --    user2netname;
> --    xdr_cryptkeyarg;
> --    xdr_cryptkeyarg2;
> --    xdr_cryptkeyres;
> --    xdr_getcredres;
> --    xdr_key_netstarg;
> --    xdr_key_netstres;
> --    xdr_keybuf;
> --    xdr_keystatus;
> --    xdr_netnamestr;
> --    xdr_unixcred;
> --} TIRPC_0.3.1;
> --
> --TIRPC_0.3.3 {
> --    __getpublickey_LOCAL;
> --    __key_decryptsession_pk_LOCAL;
> --    __key_encryptsession_pk_LOCAL;
> --    __key_gendes_LOCAL;
> --    xdr_sizeof;
> --    authdes_pk_create;
> --    svc_pollfd;
> --    svc_max_pollfd;
> --} TIRPC_0.3.2;
> --
> --TIRPC_PRIVATE {
> --  global:
> --    __libc_clntudp_bufcreate;
> --  # private, but used by rpcbind:
> --    __svc_clean_idle; svc_auth_none; libtirpc_set_debug;
> --};
> ---- /dev/null
> -+++ b/src/libtirpc.map.in
> -@@ -0,0 +1,303 @@
> -+TIRPC_0.3.0 {
> -+  global:
> -+    # __*
> -+    __rpc_createerr;
> -+    __rpc_dtbsize;
> -+    __rpc_endconf;
> -+    __rpc_fd2sockinfo;
> -+    __rpc_fixup_addr;
> -+    __rpc_get_a_size;
> -+    __rpc_get_local_uid;
> -+    __rpc_get_t_size;
> -+    __rpc_getconf;
> -+    __rpc_getconfip;
> -+    __rpc_nconf2fd;
> -+    __rpc_nconf2fd_flags;
> -+    __rpc_nconf2sockinfo;
> -+    __rpc_rawcombuf;
> -+    __rpc_seman2socktype;
> -+    __rpc_setconf;
> -+    __rpc_sockinfo2netid;
> -+    __rpc_sockisbound;
> -+    __rpc_socktype2seman;
> -+    __rpc_taddr2uaddr_af;
> -+    __rpc_uaddr2taddr_af;
> -+    __rpcgettp;
> -+
> -+    # _*
> -+    _authenticate;
> -+    _get_next_token;
> -+    _gss_authenticate;
> -+    _null_auth;
> -+    _rpc_dtablesize;
> -+    _seterr_reply;
> -+    _svcauth_none;
> -+    _svcauth_short;
> -+    _svcauth_unix;
> -+
> -+    # a*
> -+    authdes_create;
> -+    authdes_seccreate;
> -+    authnone_create;
> -+    authunix_create;
> -+    authunix_create_default;
> -+
> -+    # b*
> -+    bindresvport;
> -+    bindresvport_sa;
> -+
> -+    # c*
> -+    callrpc;
> -+    clnt_broadcast;
> -+    clnt_create;
> -+    clnt_create_timed;
> -+    clnt_create_vers;
> -+    clnt_create_vers_timed;
> -+    clnt_dg_create;
> -+    clnt_pcreateerror;
> -+    clnt_perrno;
> -+    clnt_perror;
> -+    clnt_raw_create;
> -+    clnt_spcreateerror;
> -+    clnt_sperrno;
> -+    clnt_sperror;
> -+    clnt_tli_create;
> -+    clnt_tp_create;
> -+    clnt_tp_create_timed;
> -+    clnt_vc_create;
> -+    clntraw_create;
> -+    clnttcp_create;
> -+    clntudp_bufcreate;
> -+    clntudp_create;
> -+    clntunix_create;
> -+
> -+    # e*
> -+    endnetconfig;
> -+    endnetpath;
> -+
> -+    # f*
> -+    freenetconfigent;
> -+
> -+    # g*
> -+    get_myaddress;
> -+    getnetconfig;
> -+    getnetconfigent;
> -+    getnetpath;
> -+    getrpcport;
> -+
> -+    # n*
> -+    nc_perror;
> -+    nc_sperror;
> -+
> -+    # p*
> -+    pmap_getmaps;
> -+    pmap_getport;
> -+    pmap_rmtcall;
> -+    pmap_set;
> -+    pmap_unset;
> -+
> -+    # r*
> -+    registerrpc;
> -+    rpc_broadcast;
> -+    rpc_broadcast_exp;
> -+    rpc_call;
> -+    rpc_control;
> -+    rpc_createerr;
> -+    rpc_nullproc;
> -+    rpc_reg;
> -+    rpcb_getaddr;
> -+    rpcb_getmaps;
> -+    rpcb_gettime;
> -+    rpcb_rmtcall;
> -+    rpcb_set;
> -+    rpcb_taddr2uaddr;
> -+    rpcb_uaddr2taddr;
> -+    rpcb_unset;
> -+
> -+    # s*
> -+    setnetconfig;
> -+    setnetpath;
> -+    svc_auth_reg;
> -+    svc_create;
> -+    svc_dg_create;
> -+    svc_dg_enablecache;
> -+    svc_exit;
> -+    svc_fd_create;
> -+    svc_fdset;
> -+    svc_getreq;
> -+    svc_getreq_common;
> -+    svc_getreq_poll;
> -+    svc_getreqset;
> -+    svc_maxfd;
> -+    svc_raw_create;
> -+    svc_reg;
> -+    svc_register;
> -+    svc_run;
> -+    svc_sendreply;
> -+    svc_tli_create;
> -+    svc_tp_create;
> -+    svc_unreg;
> -+    svc_unregister;
> -+    svc_vc_create;
> -+    svcerr_auth;
> -+    svcerr_decode;
> -+    svcerr_noproc;
> -+    svcerr_noprog;
> -+    svcerr_progvers;
> -+    svcerr_systemerr;
> -+    svcerr_weakauth;
> -+    svcfd_create;
> -+    svcraw_create;
> -+    svctcp_create;
> -+    svcudp_bufcreate;
> -+    svcudp_create;
> -+    svcunix_create;
> -+    svcunixfd_create;
> -+
> -+    # t*
> -+    taddr2uaddr;
> -+
> -+    # u*
> -+    uaddr2taddr;
> -+
> -+    # x*
> -+    xdr_accepted_reply;
> -+    xdr_array;
> -+    xdr_authunix_parms;
> -+    xdr_bool;
> -+    xdr_bytes;
> -+    xdr_callhdr; xdr_callmsg;
> -+    xdr_char;
> -+    xdr_des_block;
> -+    xdr_double;
> -+    xdr_enum;
> -+    xdr_float;
> -+    xdr_free;
> -+    xdr_hyper;
> -+    xdr_int16_t;
> -+    xdr_int32_t;
> -+    xdr_int64_t;
> -+    xdr_int8_t;
> -+    xdr_int;
> -+    xdr_long;
> -+    xdr_longlong_t;
> -+    xdr_netbuf;
> -+    xdr_netobj;
> -+    xdr_opaque;
> -+    xdr_opaque_auth;
> -+    xdr_pmap;
> -+    xdr_pmaplist;
> -+    xdr_pmaplist_ptr;
> -+    xdr_pointer;
> -+    xdr_quad_t;
> -+    xdr_reference;
> -+    xdr_rejected_reply;
> -+    xdr_replymsg;
> -+    xdr_rmtcall_args;
> -+    xdr_rmtcallres;
> -+    xdr_rpcb;
> -+    xdr_rpcb_entry;
> -+    xdr_rpcb_entry_list_ptr;
> -+    xdr_rpcb_rmtcallargs;
> -+    xdr_rpcb_rmtcallres;
> -+    xdr_rpcb_stat;
> -+    xdr_rpcb_stat_byvers;
> -+    xdr_rpcblist;
> -+    xdr_rpcblist_ptr;
> -+    xdr_rpcbs_addrlist;
> -+    xdr_rpcbs_addrlist_ptr;
> -+    xdr_rpcbs_proc;
> -+    xdr_rpcbs_rmtcalllist;
> -+    xdr_rpcbs_rmtcalllist_ptr;
> -+    xdr_short;
> -+    xdr_string;
> -+    xdr_u_char;
> -+    xdr_u_hyper;
> -+    xdr_u_int16_t;
> -+    xdr_u_int32_t;
> -+    xdr_u_int64_t;
> -+    xdr_u_int8_t;
> -+    xdr_u_int;
> -+    xdr_u_long;
> -+    xdr_u_longlong_t;
> -+    xdr_u_quad_t;
> -+    xdr_u_short;
> -+    xdr_uint16_t;
> -+    xdr_uint32_t;
> -+    xdr_uint64_t;
> -+    xdr_uint8_t;
> -+    xdr_union;
> -+    xdr_vector;
> -+    xdr_void;
> -+    xdr_wrapstring;
> -+    xdrmem_create;
> -+    xdrrec_create;
> -+    xdrrec_endofrecord;
> -+    xdrrec_eof;
> -+    xdrrec_skiprecord;
> -+    xdrstdio_create;
> -+    xprt_register;
> -+    xprt_unregister;
> -+    # GSS-API symbols (conditionally included)
> -+@GSS_SYMBOLS@
> -+    # DES crypto symbols (conditionally included)
> -+@DES_SYMBOLS@
> -+    # RPC database symbols (conditionally included)
> -+@RPCDB_SYMBOLS@
> -+
> -+  local:
> -+    *;
> -+};
> -+
> -+TIRPC_0.3.1 {
> -+# GSS-API symbols (conditionally included)
> -+@GSS_SYMBOLS_031@
> -+} TIRPC_0.3.0;
> -+
> -+TIRPC_0.3.2 {
> -+    getnetname;
> -+    getpublicandprivatekey;
> -+    getpublickey;
> -+    host2netname;
> -+    key_decryptsession;
> -+    key_decryptsession_pk;
> -+    key_encryptsession;
> -+    key_encryptsession_pk;
> -+    key_gendes;
> -+    key_get_conv;
> -+    key_setsecret;
> -+    key_secretkey_is_set;
> -+    key_setnet;
> -+    netname2host;
> -+    netname2user;
> -+    rtime;
> -+    user2netname;
> -+    xdr_cryptkeyarg;
> -+    xdr_cryptkeyarg2;
> -+    xdr_cryptkeyres;
> -+    xdr_getcredres;
> -+    xdr_key_netstarg;
> -+    xdr_key_netstres;
> -+    xdr_keybuf;
> -+    xdr_keystatus;
> -+    xdr_netnamestr;
> -+    xdr_unixcred;
> -+} TIRPC_0.3.1;
> -+
> -+TIRPC_0.3.3 {
> -+    __getpublickey_LOCAL;
> -+    __key_decryptsession_pk_LOCAL;
> -+    __key_encryptsession_pk_LOCAL;
> -+    __key_gendes_LOCAL;
> -+    xdr_sizeof;
> -+    authdes_pk_create;
> -+    svc_pollfd;
> -+    svc_max_pollfd;
> -+} TIRPC_0.3.2;
> -+
> -+TIRPC_PRIVATE {
> -+  global:
> -+    __libc_clntudp_bufcreate;
> -+  # private, but used by rpcbind:
> -+    __svc_clean_idle; svc_auth_none; libtirpc_set_debug;
> -+};
> diff --git
> a/meta/recipes-extended/libtirpc/libtirpc/0001-Update-declarations-to-all=
ow-compile-with-gcc-15.patch
> b/meta/recipes-extended/libtirpc/libtirpc/0001-Update-declarations-to-all=
ow-compile-with-gcc-15.patch
> deleted file mode 100644
> index 7bfe7c2924..0000000000
> ---
> a/meta/recipes-extended/libtirpc/libtirpc/0001-Update-declarations-to-all=
ow-compile-with-gcc-15.patch
> +++ /dev/null
> @@ -1,64 +0,0 @@
> -From b526c0a90953f47d4cbf7ef01e9ac13e9e76904a Mon Sep 17 00:00:00 2001
> -From: Rudi Heitbaum <rudi@heitbaum.com>
> -Date: Thu, 12 Dec 2024 04:16:02 -0500
> -Subject: [PATCH 1/2] Update declarations to allow compile with gcc-15
> -
> -This patch fixes some of the compile errors with gcc 15-20241117.
> -
> -In addition the follow declarations need to be fixed:
> -  sed -n 75,77p libtirpc-1.3.6/src/key_call.c
> -  cryptkeyres *(*__key_encryptsession_pk_LOCAL)() =3D 0;
> -  cryptkeyres *(*__key_decryptsession_pk_LOCAL)() =3D 0;
> -  des_block *(*__key_gendes_LOCAL)() =3D 0;
> -
> -Upstream-Status: Backport [
> https://git.linux-nfs.org/?p=3Dsteved/libtirpc.git;a=3Dcommit;h=3Dd473f1e=
1f6ba80bfaee4daa058da159305167323
> ]
> -Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
> -Signed-off-by: Steve Dickson <steved@redhat.com>
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - src/auth_none.c     | 2 +-
> - src/getpublickey.c  | 2 +-
> - src/svc_auth_none.c | 4 ++--
> - 3 files changed, 4 insertions(+), 4 deletions(-)
> -
> -diff --git a/src/auth_none.c b/src/auth_none.c
> -index 0b0bbd1..aca6e71 100644
> ---- a/src/auth_none.c
> -+++ b/src/auth_none.c
> -@@ -62,7 +62,7 @@ static bool_t authnone_validate (AUTH *, struct
> opaque_auth *);
> - static bool_t authnone_refresh (AUTH *, void *);
> - static void authnone_destroy (AUTH *);
> -
> --extern bool_t xdr_opaque_auth();
> -+extern bool_t xdr_opaque_auth(XDR *, struct opaque_auth *);
> -
> - static struct auth_ops *authnone_ops();
> -
> -diff --git a/src/getpublickey.c b/src/getpublickey.c
> -index be37a24..4e96c7c 100644
> ---- a/src/getpublickey.c
> -+++ b/src/getpublickey.c
> -@@ -52,7 +52,7 @@
> - /*
> -  * Hack to let ypserv/rpc.nisd use AUTH_DES.
> -  */
> --int (*__getpublickey_LOCAL)() =3D 0;
> -+int (*__getpublickey_LOCAL)(const char *, char *) =3D 0;
> -
> - /*
> -  * Get somebody's public key
> -diff --git a/src/svc_auth_none.c b/src/svc_auth_none.c
> -index 887e809..5ca98e9 100644
> ---- a/src/svc_auth_none.c
> -+++ b/src/svc_auth_none.c
> -@@ -37,8 +37,8 @@
> -
> - #include <rpc/rpc.h>
> -
> --static bool_t svcauth_none_destroy();
> --static bool_t   svcauth_none_wrap();
> -+static bool_t svcauth_none_destroy(SVCAUTH *);
> -+static bool_t   svcauth_none_wrap(SVCAUTH *, XDR *, bool_t (*)(XDR *,
> ...), char *);
> -
> - struct svc_auth_ops svc_auth_none_ops =3D {
> -       svcauth_none_wrap,
> diff --git
> a/meta/recipes-extended/libtirpc/libtirpc/0002-update-signal-and-key_call=
-declarations-to-allow-com.patch
> b/meta/recipes-extended/libtirpc/libtirpc/0002-update-signal-and-key_call=
-declarations-to-allow-com.patch
> deleted file mode 100644
> index 83e2105a1a..0000000000
> ---
> a/meta/recipes-extended/libtirpc/libtirpc/0002-update-signal-and-key_call=
-declarations-to-allow-com.patch
> +++ /dev/null
> @@ -1,60 +0,0 @@
> -From 55452e6ae71869880f8c85d5dba9aa24d7147d8b Mon Sep 17 00:00:00 2001
> -From: Rudi Heitbaum <rudi@heitbaum.com>
> -Date: Thu, 2 Jan 2025 08:46:24 -0500
> -Subject: [PATCH 2/2] update signal and key_call declarations to allow
> compile
> - with gcc-15
> -
> -Follow up patch addressing the following declarations:
> -  sed -n 75,77p libtirpc-1.3.6/src/key_call.c
> -  cryptkeyres *(*__key_encryptsession_pk_LOCAL)() =3D 0;
> -  cryptkeyres *(*__key_decryptsession_pk_LOCAL)() =3D 0;
> -  des_block *(*__key_gendes_LOCAL)() =3D 0;
> -
> -Upstream-Status: Backport [
> https://git.linux-nfs.org/?p=3Dsteved/libtirpc.git;a=3Dcommit;h=3D240ee6c=
774729c9c24812aa8912f1fcf8996b162
> ]
> -Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
> -Signed-off-by: Steve Dickson <steved@redhat.com>
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - src/auth_time.c | 4 ++--
> - src/key_call.c  | 6 +++---
> - 2 files changed, 5 insertions(+), 5 deletions(-)
> -
> -diff --git a/src/auth_time.c b/src/auth_time.c
> -index 936dd76..c21b1df 100644
> ---- a/src/auth_time.c
> -+++ b/src/auth_time.c
> -@@ -248,7 +248,7 @@ __rpc_get_time_offset(td, srv, thost, uaddr, netid)
> -       char                    ut[64], ipuaddr[64];
> -       endpoint                teps[32];
> -       nis_server              tsrv;
> --      void                    (*oldsig)() =3D NULL; /* old alarm handle=
r */
> -+      void                    (*oldsig)(int) =3D NULL; /* old alarm
> handler */
> -       struct sockaddr_in      sin;
> -       int                     s =3D RPC_ANYSOCK;
> -       socklen_t len;
> -@@ -417,7 +417,7 @@ __rpc_get_time_offset(td, srv, thost, uaddr, netid)
> -               } else {
> -                       int res;
> -
> --                      oldsig =3D (void (*)())signal(SIGALRM, alarm_hndl=
er);
> -+                      oldsig =3D (void (*)(int))signal(SIGALRM,
> alarm_hndler);
> -                       saw_alarm =3D 0; /* global tracking the alarm */
> -                       alarm(20); /* only wait 20 seconds */
> -                       res =3D connect(s, (struct sockaddr *)&sin,
> sizeof(sin));
> -diff --git a/src/key_call.c b/src/key_call.c
> -index 9f4b1d2..43f990e 100644
> ---- a/src/key_call.c
> -+++ b/src/key_call.c
> -@@ -72,9 +72,9 @@
> -  * implementations of these functions, and to call those in key_call().
> -  */
> -
> --cryptkeyres *(*__key_encryptsession_pk_LOCAL)() =3D 0;
> --cryptkeyres *(*__key_decryptsession_pk_LOCAL)() =3D 0;
> --des_block *(*__key_gendes_LOCAL)() =3D 0;
> -+cryptkeyres *(*__key_encryptsession_pk_LOCAL)(uid_t, char *) =3D 0;
> -+cryptkeyres *(*__key_decryptsession_pk_LOCAL)(uid_t, char *) =3D 0;
> -+des_block *(*__key_gendes_LOCAL)(uid_t, char *) =3D 0;
> -
> - static int key_call( u_long, xdrproc_t, void *, xdrproc_t, void *);
> -
> diff --git a/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb
> b/meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb
> similarity index 78%
> rename from meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb
> rename to meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb
> index c6901839c1..edc75a8366 100644
> --- a/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb
> +++ b/meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb
> @@ -10,13 +10,10 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Df835cce8852481e4b2bbbdd23b5e47f3 \
>  PROVIDES =3D "virtual/librpc"
>
>  SRC_URI =3D "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.bz2 \
> -
>  file://0001-Update-declarations-to-allow-compile-with-gcc-15.patch \
> -
>  file://0002-update-signal-and-key_call-declarations-to-allow-com.patch \
> -           file://0001-Add-conditional-version-script-support.patch \
>            "
>  UPSTREAM_CHECK_URI =3D "
> https://sourceforge.net/projects/libtirpc/files/libtirpc/"
>  UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)/"
> -SRC_URI[sha256sum] =3D
> "bbd26a8f0df5690a62a47f6aa30f797f3ef8d02560d1bc449a83066b5a1d3508"
> +SRC_URI[sha256sum] =3D
> "b47d3ac19d3549e54a05d0019a6c400674da716123858cfdb6d3bdd70a66c702"
>
>  inherit autotools pkgconfig
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#226890):
> https://lists.openembedded.org/g/openembedded-core/message/226890
> Mute This Topic: https://lists.openembedded.org/mt/116510360/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000f08ec50644b2724d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">have you tried building it with -fuse-ld=3Dlld and TOOLCHA=
IN =3D &quot;clang&quot;</div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov 27, 2025 at 10:19=
=E2=80=AFPM Ankur Tyagi via <a href=3D"http://lists.openembedded.org">lists=
.openembedded.org</a> &lt;ankur.tyagi85=3D<a href=3D"mailto:gmail.com@lists=
.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">From: Ankur Tyagi &lt;<a=
 href=3D"mailto:ankur.tyagi85@gmail.com" target=3D"_blank">ankur.tyagi85@gm=
ail.com</a>&gt;<br>
<br>
Dropped patches merged in the upstream.<br>
<br>
Signed-off-by: Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gmail.com" t=
arget=3D"_blank">ankur.tyagi85@gmail.com</a>&gt;<br>
---<br>
=C2=A0...d-conditional-version-script-support.patch | 810 -----------------=
-<br>
=C2=A0...rations-to-allow-compile-with-gcc-15.patch |=C2=A0 64 --<br>
=C2=A0...d-key_call-declarations-to-allow-com.patch |=C2=A0 60 --<br>
=C2=A0.../{<a href=3D"http://libtirpc_1.3.6.bb" rel=3D"noreferrer" target=
=3D"_blank">libtirpc_1.3.6.bb</a> =3D&gt; <a href=3D"http://libtirpc_1.3.7.=
bb" rel=3D"noreferrer" target=3D"_blank">libtirpc_1.3.7.bb</a>}=C2=A0 |=C2=
=A0 =C2=A05 +-<br>
=C2=A04 files changed, 1 insertion(+), 938 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-extended/libtirpc/libtirpc/0001-Add-c=
onditional-version-script-support.patch<br>
=C2=A0delete mode 100644 meta/recipes-extended/libtirpc/libtirpc/0001-Updat=
e-declarations-to-allow-compile-with-gcc-15.patch<br>
=C2=A0delete mode 100644 meta/recipes-extended/libtirpc/libtirpc/0002-updat=
e-signal-and-key_call-declarations-to-allow-com.patch<br>
=C2=A0rename meta/recipes-extended/libtirpc/{<a href=3D"http://libtirpc_1.3=
.6.bb" rel=3D"noreferrer" target=3D"_blank">libtirpc_1.3.6.bb</a> =3D&gt; <=
a href=3D"http://libtirpc_1.3.7.bb" rel=3D"noreferrer" target=3D"_blank">li=
btirpc_1.3.7.bb</a>} (78%)<br>
<br>
diff --git a/meta/recipes-extended/libtirpc/libtirpc/0001-Add-conditional-v=
ersion-script-support.patch b/meta/recipes-extended/libtirpc/libtirpc/0001-=
Add-conditional-version-script-support.patch<br>
deleted file mode 100644<br>
index 2764f65284..0000000000<br>
--- a/meta/recipes-extended/libtirpc/libtirpc/0001-Add-conditional-version-=
script-support.patch<br>
+++ /dev/null<br>
@@ -1,810 +0,0 @@<br>
-From 8ae9a335d56fc4aba8454159b326d809efca597f Mon Sep 17 00:00:00 2001<br>
-From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank"=
>raj.khem@gmail.com</a>&gt;<br>
-Date: Mon, 11 Aug 2025 21:13:59 -0700<br>
-Subject: [PATCH] Add conditional version script support<br>
-<br>
-This patch adds conditional symbol versioning to libtirpc, allowing<br>
-GSS-API, DES crypto, and RPC database symbols to be conditionally<br>
-included in the version script based on build configuration.<br>
-<br>
-LLD is strict about undefined symbols referenced in a version script.<br>
-Some libtirpc symbols (rpcsec_gss, old DES helpers, rpc database<br>
-helpers) are optional and may not be built depending on configure<br>
-options or missing deps. GNU ld tolerated this; LLD errors out.<br>
-<br>
-This change keeps the canonical symbol map in src/libtirpc.map, but<br>
-adds a make-time rule to generate a filtered copy<br>
-where names from disabled features are deleted. The lib is then linked<br>
-against the generated linker map file.<br>
-<br>
-Fixes linking errors when these features are not available.<br>
-<br>
-Upstream-Status: Submitted [<a href=3D"https://lore.kernel.org/linux-nfs/2=
0250812180809.2182301-1-raj.khem@gmail.com/T/#u" rel=3D"noreferrer" target=
=3D"_blank">https://lore.kernel.org/linux-nfs/20250812180809.2182301-1-raj.=
khem@gmail.com/T/#u</a>]<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
----<br>
- <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">conf=
igure.ac</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 50 +++++++++++++++++++++++++++<br>
- src/Makefile.am=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 21 +++++++++--<br>
- src/{libtirpc.map =3D&gt; <a href=3D"http://libtirpc.map.in" rel=3D"noref=
errer" target=3D"_blank">libtirpc.map.in</a>} | 48 +++++-------------------=
-<br>
- 3 files changed, 77 insertions(+), 42 deletions(-)<br>
- rename src/{libtirpc.map =3D&gt; <a href=3D"http://libtirpc.map.in" rel=
=3D"noreferrer" target=3D"_blank">libtirpc.map.in</a>} (84%)<br>
-<br>
---- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
-+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
-@@ -77,6 +77,19 @@ if test &quot;x$enable_ipv6&quot; !=3D xno; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0AC_DEFINE(INET6, 1, [Define to 1 if IPv6 is ava=
ilable])<br>
- fi<br>
- <br>
-+# RPC database support<br>
-+AC_ARG_ENABLE(rpcdb,<br>
-+=C2=A0 =C2=A0 [AS_HELP_STRING([--enable-rpcdb], [Enable RPC Database supp=
ort @&lt;:@default=3Dno@:&gt;@])],<br>
-+=C2=A0 =C2=A0 [], [enable_rpcdb=3Dno])<br>
-+AM_CONDITIONAL(RPCDB, test &quot;x$enable_rpcdb&quot; =3D xyes)<br>
-+if test &quot;x$enable_rpcdb&quot; !=3D &quot;xno&quot;; then<br>
-+=C2=A0 =C2=A0 AC_CHECK_FUNCS([getrpcent getrpcbyname getrpcbynumber], [ha=
ve_rpcdb=3Dyes])<br>
-+<br>
-+=C2=A0 =C2=A0 if test &quot;x$have_rpcdb&quot; =3D &quot;xyes&quot;; then=
<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_DEFINE([RPCDB], [1], [Define if RPC databa=
se support is available])<br>
-+=C2=A0 =C2=A0 fi<br>
-+fi<br>
-+<br>
- AC_ARG_ENABLE(symvers,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0[AS_HELP_STRING([--disable-symvers],[Disable sy=
mbol versioning @&lt;:@default=3Dno@:&gt;@])],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0[],[enable_symvers=3Dmaybe])<br>
-@@ -97,6 +110,33 @@ fi<br>
- <br>
- AM_CONDITIONAL(SYMVERS, test &quot;x$enable_symvers&quot; =3D xyes)<br>
- <br>
-+# Generate symbol lists for version script<br>
-+if test &quot;x$enable_gssapi&quot; =3D &quot;xyes&quot;; then<br>
-+=C2=A0 =C2=A0 GSS_SYMBOLS=3D&quot;_svcauth_gss; authgss_create; authgss_c=
reate_default; authgss_free_private_data; authgss_get_private_data; authgss=
_service; gss_log_debug; gss_log_hexdump; gss_log_status; rpc_gss_get_error=
; rpc_gss_get_mech_info; rpc_gss_get_mechanisms; rpc_gss_get_principal_name=
; rpc_gss_get_versions; rpc_gss_qop_to_num; rpc_gss_seccreate; rpc_gss_set_=
callback; rpc_gss_set_defaults; rpc_gss_set_svc_name; rpc_gss_svc_max_data_=
length;&quot;<br>
-+<br>
-+=C2=A0 =C2=A0 GSS_SYMBOLS_031=3D&quot;svcauth_gss_get_principal; svcauth_=
gss_set_svc_name;&quot;<br>
-+else<br>
-+=C2=A0 =C2=A0 GSS_SYMBOLS=3D&quot;&quot;<br>
-+=C2=A0 =C2=A0 GSS_SYMBOLS_031=3D&quot;&quot;<br>
-+fi<br>
-+<br>
-+if test &quot;x$enable_authdes&quot; =3D &quot;xyes&quot;; then<br>
-+=C2=A0 =C2=A0 DES_SYMBOLS=3D&quot;cbc_crypt; ecb_crypt; xdr_authdes_cred;=
 xdr_authdes_verf; xdr_rpc_gss_cred; xdr_rpc_gss_data; xdr_rpc_gss_init_arg=
s; xdr_rpc_gss_init_res;&quot;<br>
-+else<br>
-+=C2=A0 =C2=A0 DES_SYMBOLS=3D&quot;&quot;<br>
-+fi<br>
-+<br>
-+if test &quot;x$enable_rpcdb&quot; =3D &quot;xyes&quot;; then<br>
-+=C2=A0 =C2=A0 RPCDB_SYMBOLS=3D&quot;endrpcent; getrpcent; getrpcbynumber;=
 getrpcbyname; setrpcent;&quot;<br>
-+else<br>
-+=C2=A0 =C2=A0 RPCDB_SYMBOLS=3D&quot;&quot;<br>
-+fi<br>
-+<br>
-+AC_SUBST([GSS_SYMBOLS])<br>
-+AC_SUBST([GSS_SYMBOLS_031])<br>
-+AC_SUBST([DES_SYMBOLS])<br>
-+AC_SUBST([RPCDB_SYMBOLS])<br>
-+<br>
- AC_CANONICAL_BUILD<br>
- # Check for which host we are on and setup a few things<br>
- # specifically based on the host<br>
-@@ -167,7 +207,16 @@ AC_CHECK_FUNCS([getpeereid getrpcbyname<br>
- AC_CHECK_TYPES(struct rpcent,,, [<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0#include &lt;netdb.h&gt;])<br>
- AC_CONFIG_FILES([Makefile src/Makefile man/Makefile doc/Makefile])<br>
-+AC_CONFIG_FILES([src/libtirpc.map])<br>
- AC_CONFIG_FILES([libtirpc.pc])<br>
- AC_OUTPUT<br>
- <br>
-+# Configuration summary<br>
-+AC_MSG_NOTICE([<br>
-+libtirpc configuration summary:<br>
-+=C2=A0 GSS-API support: $enable_gssapi<br>
-+=C2=A0 DES crypto support: $enable_authdes<br>
-+=C2=A0 RPC database support: $enable_rpcdb<br>
-+=C2=A0 Symbol versioning: $enable_symvers<br>
-+])<br>
- <br>
---- a/src/Makefile.am<br>
-+++ b/src/Makefile.am<br>
-@@ -6,6 +6,9 @@<br>
- ## anything like that.<br>
- <br>
- noinst_HEADERS =3D rpc_com.h debug.h<br>
-+EXTRA_DIST =3D <a href=3D"http://libtirpc.map.in" rel=3D"noreferrer" targ=
et=3D"_blank">libtirpc.map.in</a><br>
-+# Generated files<br>
-+BUILT_SOURCES =3D libtirpc.map<br>
- <br>
- AM_CPPFLAGS =3D -I$(top_srcdir)/tirpc -include config.h -DPORTMAP -DINET6=
 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-D_GNU_SOURCE -Wall=
 -pipe<br>
-@@ -15,10 +18,19 @@ lib_LTLIBRARIES =3D <a href=3D"http://libtirpc.la" rel=
=3D"noreferrer" target=3D"_blank">libtirpc.la</a><br>
- libtirpc_la_LDFLAGS =3D @LDFLAG_NOUNDEFINED@ -no-undefined @PTHREAD_LIBS@=
<br>
- libtirpc_la_LDFLAGS +=3D -version-info @LT_VERSION_INFO@<br>
- <br>
-+# Generate version script from template<br>
-+libtirpc.map: $(srcdir)/<a href=3D"http://libtirpc.map.in" rel=3D"norefer=
rer" target=3D"_blank">libtirpc.map.in</a><br>
-+=C2=A0 =C2=A0 =C2=A0 $(AM_V_GEN)$(SED) \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s|@GSS_SYMBOLS@|=
$(GSS_SYMBOLS)|g&#39; \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s|@GSS_SYMBOLS_0=
31@|$(GSS_SYMBOLS_031)|g&#39; \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s|@DES_SYMBOLS@|=
$(DES_SYMBOLS)|g&#39; \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s|@RPCDB_SYMBOLS=
@|$(RPCDB_SYMBOLS)|g&#39; \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt; $(srcdir)/<a href=
=3D"http://libtirpc.map.in" rel=3D"noreferrer" target=3D"_blank">libtirpc.m=
ap.in</a> &gt; $@ || rm -f $@<br>
-+<br>
- libtirpc_la_SOURCES =3D auth_none.c auth_unix.c authunix_prot.c \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0binddynport.c bindresvport.c \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clnt_bcast.c clnt_dg.c clnt_generic.c cl=
nt_perror.c clnt_raw.c clnt_simple.c \<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 clnt_vc.c rpc_dtablesize.c getnetconfig.c get=
netpath.c getrpcent.c \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 clnt_vc.c rpc_dtablesize.c getnetconfig.c get=
netpath.c \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0getrpcport.c mt_misc.c pmap_clnt.c pmap_=
getmaps.c pmap_getport.c \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pmap_prot.c pmap_prot2.c pmap_rmt.c rpc_=
prot.c rpc_commondata.c \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rpc_callmsg.c rpc_generic.c rpc_soc.c rp=
cb_clnt.c rpcb_prot.c \<br>
-@@ -34,19 +46,23 @@ endif<br>
- libtirpc_la_SOURCES +=3D xdr.c xdr_rec.c xdr_array.c xdr_float.c xdr_mem.=
c xdr_reference.c xdr_stdio.c xdr_sizeof.c<br>
- <br>
- if SYMVERS<br>
--=C2=A0 =C2=A0 libtirpc_la_LDFLAGS +=3D -Wl,--version-script=3D$(srcdir)/l=
ibtirpc.map<br>
-+=C2=A0 =C2=A0 libtirpc_la_LDFLAGS +=3D -Wl,--version-script=3D$(builddir)=
/libtirpc.map<br>
- endif<br>
- <br>
- ## Secure-RPC<br>
- if GSS<br>
--=C2=A0 =C2=A0 libtirpc_la_SOURCES +=3D auth_gss.c authgss_prot.c svc_auth=
_gss.c \<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0rpc_gss_utils.c<br>
--=C2=A0 =C2=A0 libtirpc_la_LIBADD =3D $(GSSAPI_LIBS)<br>
--=C2=A0 =C2=A0 libtirpc_la_CFLAGS =3D -DHAVE_RPCSEC_GSS $(GSSAPI_CFLAGS)<b=
r>
-+libtirpc_la_SOURCES +=3D auth_gss.c authgss_prot.c svc_auth_gss.c rpc_gss=
_utils.c<br>
-+libtirpc_la_LIBADD =3D $(GSSAPI_LIBS)<br>
-+libtirpc_la_CFLAGS =3D -DHAVE_RPCSEC_GSS $(GSSAPI_CFLAGS)<br>
-+endif<br>
-+<br>
-+# Conditionally add RPC database sources<br>
-+if RPCDB<br>
-+libtirpc_la_SOURCES +=3D getrpcent.c<br>
- endif<br>
- <br>
- libtirpc_la_SOURCES +=3D key_call.c key_prot_xdr.c getpublickey.c<br>
- libtirpc_la_SOURCES +=3D netname.c netnamer.c rpcdname.c rtime.c<br>
- <br>
--CLEANFILES=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D cscope.* *~<br>
-+CLEANFILES=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D cscope.* libtirpc.=
map *~<br>
- DISTCLEANFILES=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D =
Makefile.in<br>
---- a/src/libtirpc.map<br>
-+++ /dev/null<br>
-@@ -1,335 +0,0 @@<br>
--TIRPC_0.3.0 {<br>
--=C2=A0 global:<br>
--=C2=A0 =C2=A0 # __*<br>
--=C2=A0 =C2=A0 __rpc_createerr;<br>
--=C2=A0 =C2=A0 __rpc_dtbsize;<br>
--=C2=A0 =C2=A0 __rpc_endconf;<br>
--=C2=A0 =C2=A0 __rpc_fd2sockinfo;<br>
--=C2=A0 =C2=A0 __rpc_fixup_addr;<br>
--=C2=A0 =C2=A0 __rpc_get_a_size;<br>
--=C2=A0 =C2=A0 __rpc_get_local_uid;<br>
--=C2=A0 =C2=A0 __rpc_get_t_size;<br>
--=C2=A0 =C2=A0 __rpc_getconf;<br>
--=C2=A0 =C2=A0 __rpc_getconfip;<br>
--=C2=A0 =C2=A0 __rpc_nconf2fd;<br>
--=C2=A0 =C2=A0 __rpc_nconf2fd_flags;<br>
--=C2=A0 =C2=A0 __rpc_nconf2sockinfo;<br>
--=C2=A0 =C2=A0 __rpc_rawcombuf;<br>
--=C2=A0 =C2=A0 __rpc_seman2socktype;<br>
--=C2=A0 =C2=A0 __rpc_setconf;<br>
--=C2=A0 =C2=A0 __rpc_sockinfo2netid;<br>
--=C2=A0 =C2=A0 __rpc_sockisbound;<br>
--=C2=A0 =C2=A0 __rpc_socktype2seman;<br>
--=C2=A0 =C2=A0 __rpc_taddr2uaddr_af;<br>
--=C2=A0 =C2=A0 __rpc_uaddr2taddr_af;<br>
--=C2=A0 =C2=A0 __rpcgettp;<br>
--<br>
--=C2=A0 =C2=A0 # _*<br>
--=C2=A0 =C2=A0 _authenticate;<br>
--=C2=A0 =C2=A0 _get_next_token;<br>
--=C2=A0 =C2=A0 _gss_authenticate;<br>
--=C2=A0 =C2=A0 _null_auth;<br>
--=C2=A0 =C2=A0 _rpc_dtablesize;<br>
--=C2=A0 =C2=A0 _seterr_reply;<br>
--=C2=A0 =C2=A0 _svcauth_none;<br>
--=C2=A0 =C2=A0 _svcauth_short;<br>
--=C2=A0 =C2=A0 _svcauth_unix;<br>
--=C2=A0 =C2=A0 _svcauth_gss;<br>
--<br>
--=C2=A0 =C2=A0 # a*<br>
--=C2=A0 =C2=A0 authdes_create;<br>
--=C2=A0 =C2=A0 authdes_seccreate;<br>
--=C2=A0 =C2=A0 authgss_create;<br>
--=C2=A0 =C2=A0 authgss_create_default;<br>
--=C2=A0 =C2=A0 authgss_free_private_data;<br>
--=C2=A0 =C2=A0 authgss_get_private_data;<br>
--=C2=A0 =C2=A0 authgss_service;<br>
--=C2=A0 =C2=A0 authnone_create;<br>
--=C2=A0 =C2=A0 authunix_create;<br>
--=C2=A0 =C2=A0 authunix_create_default;<br>
--<br>
--=C2=A0 =C2=A0 # b*<br>
--=C2=A0 =C2=A0 bindresvport;<br>
--=C2=A0 =C2=A0 bindresvport_sa;<br>
--<br>
--=C2=A0 =C2=A0 # c*<br>
--=C2=A0 =C2=A0 callrpc;<br>
--=C2=A0 =C2=A0 cbc_crypt;<br>
--=C2=A0 =C2=A0 clnt_broadcast;<br>
--=C2=A0 =C2=A0 clnt_create;<br>
--=C2=A0 =C2=A0 clnt_create_timed;<br>
--=C2=A0 =C2=A0 clnt_create_vers;<br>
--=C2=A0 =C2=A0 clnt_create_vers_timed;<br>
--=C2=A0 =C2=A0 clnt_dg_create;<br>
--=C2=A0 =C2=A0 clnt_pcreateerror;<br>
--=C2=A0 =C2=A0 clnt_perrno;<br>
--=C2=A0 =C2=A0 clnt_perror;<br>
--=C2=A0 =C2=A0 clnt_raw_create;<br>
--=C2=A0 =C2=A0 clnt_spcreateerror;<br>
--=C2=A0 =C2=A0 clnt_sperrno;<br>
--=C2=A0 =C2=A0 clnt_sperror;<br>
--=C2=A0 =C2=A0 clnt_tli_create;<br>
--=C2=A0 =C2=A0 clnt_tp_create;<br>
--=C2=A0 =C2=A0 clnt_tp_create_timed;<br>
--=C2=A0 =C2=A0 clnt_vc_create;<br>
--=C2=A0 =C2=A0 clntraw_create;<br>
--=C2=A0 =C2=A0 clnttcp_create;<br>
--=C2=A0 =C2=A0 clntudp_bufcreate;<br>
--=C2=A0 =C2=A0 clntudp_create;<br>
--=C2=A0 =C2=A0 clntunix_create;<br>
--<br>
--=C2=A0 =C2=A0 # e*<br>
--=C2=A0 =C2=A0 ecb_crypt;<br>
--=C2=A0 =C2=A0 endnetconfig;<br>
--=C2=A0 =C2=A0 endnetpath;<br>
--=C2=A0 =C2=A0 endrpcent;<br>
--<br>
--=C2=A0 =C2=A0 # f*<br>
--=C2=A0 =C2=A0 freenetconfigent;<br>
--<br>
--=C2=A0 =C2=A0 # g*<br>
--=C2=A0 =C2=A0 get_myaddress;<br>
--=C2=A0 =C2=A0 getnetconfig;<br>
--=C2=A0 =C2=A0 getnetconfigent;<br>
--=C2=A0 =C2=A0 getnetpath;<br>
--=C2=A0 =C2=A0 getrpcent;<br>
--=C2=A0 =C2=A0 getrpcbynumber;<br>
--=C2=A0 =C2=A0 getrpcbyname;<br>
--=C2=A0 =C2=A0 getrpcport;<br>
--=C2=A0 =C2=A0 gss_log_debug;<br>
--=C2=A0 =C2=A0 gss_log_hexdump;<br>
--=C2=A0 =C2=A0 gss_log_status;<br>
--<br>
--=C2=A0 =C2=A0 # n*<br>
--=C2=A0 =C2=A0 nc_perror;<br>
--=C2=A0 =C2=A0 nc_sperror;<br>
--<br>
--=C2=A0 =C2=A0 # p*<br>
--=C2=A0 =C2=A0 pmap_getmaps;<br>
--=C2=A0 =C2=A0 pmap_getport;<br>
--=C2=A0 =C2=A0 pmap_rmtcall;<br>
--=C2=A0 =C2=A0 pmap_set;<br>
--=C2=A0 =C2=A0 pmap_unset;<br>
--<br>
--=C2=A0 =C2=A0 # r*<br>
--=C2=A0 =C2=A0 registerrpc;<br>
--=C2=A0 =C2=A0 rpc_broadcast;<br>
--=C2=A0 =C2=A0 rpc_broadcast_exp;<br>
--=C2=A0 =C2=A0 rpc_call;<br>
--=C2=A0 =C2=A0 rpc_control;<br>
--=C2=A0 =C2=A0 rpc_createerr;<br>
--=C2=A0 =C2=A0 rpc_gss_get_error;<br>
--=C2=A0 =C2=A0 rpc_gss_get_mech_info;<br>
--=C2=A0 =C2=A0 rpc_gss_get_mechanisms;<br>
--=C2=A0 =C2=A0 rpc_gss_get_principal_name;<br>
--=C2=A0 =C2=A0 rpc_gss_get_versions;<br>
--=C2=A0 =C2=A0 rpc_gss_getcred;<br>
--=C2=A0 =C2=A0 rpc_gss_is_installed;<br>
--=C2=A0 =C2=A0 rpc_gss_max_data_length;<br>
--=C2=A0 =C2=A0 rpc_gss_mech_to_oid;<br>
--=C2=A0 =C2=A0 rpc_gss_qop_to_num;<br>
--=C2=A0 =C2=A0 rpc_gss_seccreate;<br>
--=C2=A0 =C2=A0 rpc_gss_set_callback;<br>
--=C2=A0 =C2=A0 rpc_gss_set_defaults;<br>
--=C2=A0 =C2=A0 rpc_gss_set_svc_name;<br>
--=C2=A0 =C2=A0 rpc_gss_svc_max_data_length;<br>
--=C2=A0 =C2=A0 rpc_nullproc;<br>
--=C2=A0 =C2=A0 rpc_reg;<br>
--=C2=A0 =C2=A0 rpcb_getaddr;<br>
--=C2=A0 =C2=A0 rpcb_getmaps;<br>
--=C2=A0 =C2=A0 rpcb_gettime;<br>
--=C2=A0 =C2=A0 rpcb_rmtcall;<br>
--=C2=A0 =C2=A0 rpcb_set;<br>
--=C2=A0 =C2=A0 rpcb_taddr2uaddr;<br>
--=C2=A0 =C2=A0 rpcb_uaddr2taddr;<br>
--=C2=A0 =C2=A0 rpcb_unset;<br>
--<br>
--=C2=A0 =C2=A0 # s*<br>
--=C2=A0 =C2=A0 setnetconfig;<br>
--=C2=A0 =C2=A0 setnetpath;<br>
--=C2=A0 =C2=A0 setrpcent;<br>
--=C2=A0 =C2=A0 svc_auth_reg;<br>
--=C2=A0 =C2=A0 svc_create;<br>
--=C2=A0 =C2=A0 svc_dg_create;<br>
--=C2=A0 =C2=A0 svc_dg_enablecache;<br>
--=C2=A0 =C2=A0 svc_exit;<br>
--=C2=A0 =C2=A0 svc_fd_create;<br>
--=C2=A0 =C2=A0 svc_fdset;<br>
--=C2=A0 =C2=A0 svc_getreq;<br>
--=C2=A0 =C2=A0 svc_getreq_common;<br>
--=C2=A0 =C2=A0 svc_getreq_poll;<br>
--=C2=A0 =C2=A0 svc_getreqset;<br>
--=C2=A0 =C2=A0 svc_maxfd;<br>
--=C2=A0 =C2=A0 svc_raw_create;<br>
--=C2=A0 =C2=A0 svc_reg;<br>
--=C2=A0 =C2=A0 svc_register;<br>
--=C2=A0 =C2=A0 svc_run;<br>
--=C2=A0 =C2=A0 svc_sendreply;<br>
--=C2=A0 =C2=A0 svc_tli_create;<br>
--=C2=A0 =C2=A0 svc_tp_create;<br>
--=C2=A0 =C2=A0 svc_unreg;<br>
--=C2=A0 =C2=A0 svc_unregister;<br>
--=C2=A0 =C2=A0 svc_vc_create;<br>
--=C2=A0 =C2=A0 svcerr_auth;<br>
--=C2=A0 =C2=A0 svcerr_decode;<br>
--=C2=A0 =C2=A0 svcerr_noproc;<br>
--=C2=A0 =C2=A0 svcerr_noprog;<br>
--=C2=A0 =C2=A0 svcerr_progvers;<br>
--=C2=A0 =C2=A0 svcerr_systemerr;<br>
--=C2=A0 =C2=A0 svcerr_weakauth;<br>
--=C2=A0 =C2=A0 svcfd_create;<br>
--=C2=A0 =C2=A0 svcraw_create;<br>
--=C2=A0 =C2=A0 svctcp_create;<br>
--=C2=A0 =C2=A0 svcudp_bufcreate;<br>
--=C2=A0 =C2=A0 svcudp_create;<br>
--=C2=A0 =C2=A0 svcunix_create;<br>
--=C2=A0 =C2=A0 svcunixfd_create;<br>
--<br>
--=C2=A0 =C2=A0 # t*<br>
--=C2=A0 =C2=A0 taddr2uaddr;<br>
--<br>
--=C2=A0 =C2=A0 # u*<br>
--=C2=A0 =C2=A0 uaddr2taddr;<br>
--<br>
--=C2=A0 =C2=A0 # x*<br>
--=C2=A0 =C2=A0 xdr_accepted_reply;<br>
--=C2=A0 =C2=A0 xdr_array;<br>
--=C2=A0 =C2=A0 xdr_authdes_cred;<br>
--=C2=A0 =C2=A0 xdr_authdes_verf;<br>
--=C2=A0 =C2=A0 xdr_authunix_parms;<br>
--=C2=A0 =C2=A0 xdr_bool;<br>
--=C2=A0 =C2=A0 xdr_bytes;<br>
--=C2=A0 =C2=A0 xdr_callhdr; xdr_callmsg;<br>
--=C2=A0 =C2=A0 xdr_char;<br>
--=C2=A0 =C2=A0 xdr_des_block;<br>
--=C2=A0 =C2=A0 xdr_double;<br>
--=C2=A0 =C2=A0 xdr_enum;<br>
--=C2=A0 =C2=A0 xdr_float;<br>
--=C2=A0 =C2=A0 xdr_free;<br>
--=C2=A0 =C2=A0 xdr_hyper;<br>
--=C2=A0 =C2=A0 xdr_int16_t;<br>
--=C2=A0 =C2=A0 xdr_int32_t;<br>
--=C2=A0 =C2=A0 xdr_int64_t;<br>
--=C2=A0 =C2=A0 xdr_int8_t;<br>
--=C2=A0 =C2=A0 xdr_int;<br>
--=C2=A0 =C2=A0 xdr_long;<br>
--=C2=A0 =C2=A0 xdr_longlong_t;<br>
--=C2=A0 =C2=A0 xdr_netbuf;<br>
--=C2=A0 =C2=A0 xdr_netobj;<br>
--=C2=A0 =C2=A0 xdr_opaque;<br>
--=C2=A0 =C2=A0 xdr_opaque_auth;<br>
--=C2=A0 =C2=A0 xdr_pmap;<br>
--=C2=A0 =C2=A0 xdr_pmaplist;<br>
--=C2=A0 =C2=A0 xdr_pmaplist_ptr;<br>
--=C2=A0 =C2=A0 xdr_pointer;<br>
--=C2=A0 =C2=A0 xdr_quad_t;<br>
--=C2=A0 =C2=A0 xdr_reference;<br>
--=C2=A0 =C2=A0 xdr_rejected_reply;<br>
--=C2=A0 =C2=A0 xdr_replymsg;<br>
--=C2=A0 =C2=A0 xdr_rmtcall_args;<br>
--=C2=A0 =C2=A0 xdr_rmtcallres;<br>
--=C2=A0 =C2=A0 xdr_rpc_gss_cred;<br>
--=C2=A0 =C2=A0 xdr_rpc_gss_data;<br>
--=C2=A0 =C2=A0 xdr_rpc_gss_init_args;<br>
--=C2=A0 =C2=A0 xdr_rpc_gss_init_res;<br>
--=C2=A0 =C2=A0 xdr_rpcb;<br>
--=C2=A0 =C2=A0 xdr_rpcb_entry;<br>
--=C2=A0 =C2=A0 xdr_rpcb_entry_list_ptr;<br>
--=C2=A0 =C2=A0 xdr_rpcb_rmtcallargs;<br>
--=C2=A0 =C2=A0 xdr_rpcb_rmtcallres;<br>
--=C2=A0 =C2=A0 xdr_rpcb_stat;<br>
--=C2=A0 =C2=A0 xdr_rpcb_stat_byvers;<br>
--=C2=A0 =C2=A0 xdr_rpcblist;<br>
--=C2=A0 =C2=A0 xdr_rpcblist_ptr;<br>
--=C2=A0 =C2=A0 xdr_rpcbs_addrlist;<br>
--=C2=A0 =C2=A0 xdr_rpcbs_addrlist_ptr;<br>
--=C2=A0 =C2=A0 xdr_rpcbs_proc;<br>
--=C2=A0 =C2=A0 xdr_rpcbs_rmtcalllist;<br>
--=C2=A0 =C2=A0 xdr_rpcbs_rmtcalllist_ptr;<br>
--=C2=A0 =C2=A0 xdr_short;<br>
--=C2=A0 =C2=A0 xdr_string;<br>
--=C2=A0 =C2=A0 xdr_u_char;<br>
--=C2=A0 =C2=A0 xdr_u_hyper;<br>
--=C2=A0 =C2=A0 xdr_u_int16_t;<br>
--=C2=A0 =C2=A0 xdr_u_int32_t;<br>
--=C2=A0 =C2=A0 xdr_u_int64_t;<br>
--=C2=A0 =C2=A0 xdr_u_int8_t;<br>
--=C2=A0 =C2=A0 xdr_u_int;<br>
--=C2=A0 =C2=A0 xdr_u_long;<br>
--=C2=A0 =C2=A0 xdr_u_longlong_t;<br>
--=C2=A0 =C2=A0 xdr_u_quad_t;<br>
--=C2=A0 =C2=A0 xdr_u_short;<br>
--=C2=A0 =C2=A0 xdr_uint16_t;<br>
--=C2=A0 =C2=A0 xdr_uint32_t;<br>
--=C2=A0 =C2=A0 xdr_uint64_t;<br>
--=C2=A0 =C2=A0 xdr_uint8_t;<br>
--=C2=A0 =C2=A0 xdr_union;<br>
--=C2=A0 =C2=A0 xdr_vector;<br>
--=C2=A0 =C2=A0 xdr_void;<br>
--=C2=A0 =C2=A0 xdr_wrapstring;<br>
--=C2=A0 =C2=A0 xdrmem_create;<br>
--=C2=A0 =C2=A0 xdrrec_create;<br>
--=C2=A0 =C2=A0 xdrrec_endofrecord;<br>
--=C2=A0 =C2=A0 xdrrec_eof;<br>
--=C2=A0 =C2=A0 xdrrec_skiprecord;<br>
--=C2=A0 =C2=A0 xdrstdio_create;<br>
--=C2=A0 =C2=A0 xprt_register;<br>
--=C2=A0 =C2=A0 xprt_unregister;<br>
--<br>
--=C2=A0 local:<br>
--=C2=A0 =C2=A0 *;<br>
--};<br>
--<br>
--TIRPC_0.3.1 {<br>
--=C2=A0 =C2=A0 svcauth_gss_get_principal;<br>
--=C2=A0 =C2=A0 svcauth_gss_set_svc_name;<br>
--} TIRPC_0.3.0;<br>
--<br>
--TIRPC_0.3.2 {<br>
--=C2=A0 =C2=A0 getnetname;<br>
--=C2=A0 =C2=A0 getpublicandprivatekey;<br>
--=C2=A0 =C2=A0 getpublickey;<br>
--=C2=A0 =C2=A0 host2netname;<br>
--=C2=A0 =C2=A0 key_call_destroy;<br>
--=C2=A0 =C2=A0 key_decryptsession;<br>
--=C2=A0 =C2=A0 key_decryptsession_pk;<br>
--=C2=A0 =C2=A0 key_encryptsession;<br>
--=C2=A0 =C2=A0 key_encryptsession_pk;<br>
--=C2=A0 =C2=A0 key_gendes;<br>
--=C2=A0 =C2=A0 key_get_conv;<br>
--=C2=A0 =C2=A0 key_setsecret;<br>
--=C2=A0 =C2=A0 key_secretkey_is_set;<br>
--=C2=A0 =C2=A0 key_setnet;<br>
--=C2=A0 =C2=A0 netname2host;<br>
--=C2=A0 =C2=A0 netname2user;<br>
--=C2=A0 =C2=A0 rtime;<br>
--=C2=A0 =C2=A0 user2netname;<br>
--=C2=A0 =C2=A0 xdr_cryptkeyarg;<br>
--=C2=A0 =C2=A0 xdr_cryptkeyarg2;<br>
--=C2=A0 =C2=A0 xdr_cryptkeyres;<br>
--=C2=A0 =C2=A0 xdr_getcredres;<br>
--=C2=A0 =C2=A0 xdr_key_netstarg;<br>
--=C2=A0 =C2=A0 xdr_key_netstres;<br>
--=C2=A0 =C2=A0 xdr_keybuf;<br>
--=C2=A0 =C2=A0 xdr_keystatus;<br>
--=C2=A0 =C2=A0 xdr_netnamestr;<br>
--=C2=A0 =C2=A0 xdr_unixcred;<br>
--} TIRPC_0.3.1;<br>
--<br>
--TIRPC_0.3.3 {<br>
--=C2=A0 =C2=A0 __getpublickey_LOCAL;<br>
--=C2=A0 =C2=A0 __key_decryptsession_pk_LOCAL;<br>
--=C2=A0 =C2=A0 __key_encryptsession_pk_LOCAL;<br>
--=C2=A0 =C2=A0 __key_gendes_LOCAL;<br>
--=C2=A0 =C2=A0 xdr_sizeof;<br>
--=C2=A0 =C2=A0 authdes_pk_create;<br>
--=C2=A0 =C2=A0 svc_pollfd;<br>
--=C2=A0 =C2=A0 svc_max_pollfd;<br>
--} TIRPC_0.3.2;<br>
--<br>
--TIRPC_PRIVATE {<br>
--=C2=A0 global:<br>
--=C2=A0 =C2=A0 __libc_clntudp_bufcreate;<br>
--=C2=A0 # private, but used by rpcbind:<br>
--=C2=A0 =C2=A0 __svc_clean_idle; svc_auth_none; libtirpc_set_debug;<br>
--};<br>
---- /dev/null<br>
-+++ b/src/<a href=3D"http://libtirpc.map.in" rel=3D"noreferrer" target=3D"=
_blank">libtirpc.map.in</a><br>
-@@ -0,0 +1,303 @@<br>
-+TIRPC_0.3.0 {<br>
-+=C2=A0 global:<br>
-+=C2=A0 =C2=A0 # __*<br>
-+=C2=A0 =C2=A0 __rpc_createerr;<br>
-+=C2=A0 =C2=A0 __rpc_dtbsize;<br>
-+=C2=A0 =C2=A0 __rpc_endconf;<br>
-+=C2=A0 =C2=A0 __rpc_fd2sockinfo;<br>
-+=C2=A0 =C2=A0 __rpc_fixup_addr;<br>
-+=C2=A0 =C2=A0 __rpc_get_a_size;<br>
-+=C2=A0 =C2=A0 __rpc_get_local_uid;<br>
-+=C2=A0 =C2=A0 __rpc_get_t_size;<br>
-+=C2=A0 =C2=A0 __rpc_getconf;<br>
-+=C2=A0 =C2=A0 __rpc_getconfip;<br>
-+=C2=A0 =C2=A0 __rpc_nconf2fd;<br>
-+=C2=A0 =C2=A0 __rpc_nconf2fd_flags;<br>
-+=C2=A0 =C2=A0 __rpc_nconf2sockinfo;<br>
-+=C2=A0 =C2=A0 __rpc_rawcombuf;<br>
-+=C2=A0 =C2=A0 __rpc_seman2socktype;<br>
-+=C2=A0 =C2=A0 __rpc_setconf;<br>
-+=C2=A0 =C2=A0 __rpc_sockinfo2netid;<br>
-+=C2=A0 =C2=A0 __rpc_sockisbound;<br>
-+=C2=A0 =C2=A0 __rpc_socktype2seman;<br>
-+=C2=A0 =C2=A0 __rpc_taddr2uaddr_af;<br>
-+=C2=A0 =C2=A0 __rpc_uaddr2taddr_af;<br>
-+=C2=A0 =C2=A0 __rpcgettp;<br>
-+<br>
-+=C2=A0 =C2=A0 # _*<br>
-+=C2=A0 =C2=A0 _authenticate;<br>
-+=C2=A0 =C2=A0 _get_next_token;<br>
-+=C2=A0 =C2=A0 _gss_authenticate;<br>
-+=C2=A0 =C2=A0 _null_auth;<br>
-+=C2=A0 =C2=A0 _rpc_dtablesize;<br>
-+=C2=A0 =C2=A0 _seterr_reply;<br>
-+=C2=A0 =C2=A0 _svcauth_none;<br>
-+=C2=A0 =C2=A0 _svcauth_short;<br>
-+=C2=A0 =C2=A0 _svcauth_unix;<br>
-+<br>
-+=C2=A0 =C2=A0 # a*<br>
-+=C2=A0 =C2=A0 authdes_create;<br>
-+=C2=A0 =C2=A0 authdes_seccreate;<br>
-+=C2=A0 =C2=A0 authnone_create;<br>
-+=C2=A0 =C2=A0 authunix_create;<br>
-+=C2=A0 =C2=A0 authunix_create_default;<br>
-+<br>
-+=C2=A0 =C2=A0 # b*<br>
-+=C2=A0 =C2=A0 bindresvport;<br>
-+=C2=A0 =C2=A0 bindresvport_sa;<br>
-+<br>
-+=C2=A0 =C2=A0 # c*<br>
-+=C2=A0 =C2=A0 callrpc;<br>
-+=C2=A0 =C2=A0 clnt_broadcast;<br>
-+=C2=A0 =C2=A0 clnt_create;<br>
-+=C2=A0 =C2=A0 clnt_create_timed;<br>
-+=C2=A0 =C2=A0 clnt_create_vers;<br>
-+=C2=A0 =C2=A0 clnt_create_vers_timed;<br>
-+=C2=A0 =C2=A0 clnt_dg_create;<br>
-+=C2=A0 =C2=A0 clnt_pcreateerror;<br>
-+=C2=A0 =C2=A0 clnt_perrno;<br>
-+=C2=A0 =C2=A0 clnt_perror;<br>
-+=C2=A0 =C2=A0 clnt_raw_create;<br>
-+=C2=A0 =C2=A0 clnt_spcreateerror;<br>
-+=C2=A0 =C2=A0 clnt_sperrno;<br>
-+=C2=A0 =C2=A0 clnt_sperror;<br>
-+=C2=A0 =C2=A0 clnt_tli_create;<br>
-+=C2=A0 =C2=A0 clnt_tp_create;<br>
-+=C2=A0 =C2=A0 clnt_tp_create_timed;<br>
-+=C2=A0 =C2=A0 clnt_vc_create;<br>
-+=C2=A0 =C2=A0 clntraw_create;<br>
-+=C2=A0 =C2=A0 clnttcp_create;<br>
-+=C2=A0 =C2=A0 clntudp_bufcreate;<br>
-+=C2=A0 =C2=A0 clntudp_create;<br>
-+=C2=A0 =C2=A0 clntunix_create;<br>
-+<br>
-+=C2=A0 =C2=A0 # e*<br>
-+=C2=A0 =C2=A0 endnetconfig;<br>
-+=C2=A0 =C2=A0 endnetpath;<br>
-+<br>
-+=C2=A0 =C2=A0 # f*<br>
-+=C2=A0 =C2=A0 freenetconfigent;<br>
-+<br>
-+=C2=A0 =C2=A0 # g*<br>
-+=C2=A0 =C2=A0 get_myaddress;<br>
-+=C2=A0 =C2=A0 getnetconfig;<br>
-+=C2=A0 =C2=A0 getnetconfigent;<br>
-+=C2=A0 =C2=A0 getnetpath;<br>
-+=C2=A0 =C2=A0 getrpcport;<br>
-+<br>
-+=C2=A0 =C2=A0 # n*<br>
-+=C2=A0 =C2=A0 nc_perror;<br>
-+=C2=A0 =C2=A0 nc_sperror;<br>
-+<br>
-+=C2=A0 =C2=A0 # p*<br>
-+=C2=A0 =C2=A0 pmap_getmaps;<br>
-+=C2=A0 =C2=A0 pmap_getport;<br>
-+=C2=A0 =C2=A0 pmap_rmtcall;<br>
-+=C2=A0 =C2=A0 pmap_set;<br>
-+=C2=A0 =C2=A0 pmap_unset;<br>
-+<br>
-+=C2=A0 =C2=A0 # r*<br>
-+=C2=A0 =C2=A0 registerrpc;<br>
-+=C2=A0 =C2=A0 rpc_broadcast;<br>
-+=C2=A0 =C2=A0 rpc_broadcast_exp;<br>
-+=C2=A0 =C2=A0 rpc_call;<br>
-+=C2=A0 =C2=A0 rpc_control;<br>
-+=C2=A0 =C2=A0 rpc_createerr;<br>
-+=C2=A0 =C2=A0 rpc_nullproc;<br>
-+=C2=A0 =C2=A0 rpc_reg;<br>
-+=C2=A0 =C2=A0 rpcb_getaddr;<br>
-+=C2=A0 =C2=A0 rpcb_getmaps;<br>
-+=C2=A0 =C2=A0 rpcb_gettime;<br>
-+=C2=A0 =C2=A0 rpcb_rmtcall;<br>
-+=C2=A0 =C2=A0 rpcb_set;<br>
-+=C2=A0 =C2=A0 rpcb_taddr2uaddr;<br>
-+=C2=A0 =C2=A0 rpcb_uaddr2taddr;<br>
-+=C2=A0 =C2=A0 rpcb_unset;<br>
-+<br>
-+=C2=A0 =C2=A0 # s*<br>
-+=C2=A0 =C2=A0 setnetconfig;<br>
-+=C2=A0 =C2=A0 setnetpath;<br>
-+=C2=A0 =C2=A0 svc_auth_reg;<br>
-+=C2=A0 =C2=A0 svc_create;<br>
-+=C2=A0 =C2=A0 svc_dg_create;<br>
-+=C2=A0 =C2=A0 svc_dg_enablecache;<br>
-+=C2=A0 =C2=A0 svc_exit;<br>
-+=C2=A0 =C2=A0 svc_fd_create;<br>
-+=C2=A0 =C2=A0 svc_fdset;<br>
-+=C2=A0 =C2=A0 svc_getreq;<br>
-+=C2=A0 =C2=A0 svc_getreq_common;<br>
-+=C2=A0 =C2=A0 svc_getreq_poll;<br>
-+=C2=A0 =C2=A0 svc_getreqset;<br>
-+=C2=A0 =C2=A0 svc_maxfd;<br>
-+=C2=A0 =C2=A0 svc_raw_create;<br>
-+=C2=A0 =C2=A0 svc_reg;<br>
-+=C2=A0 =C2=A0 svc_register;<br>
-+=C2=A0 =C2=A0 svc_run;<br>
-+=C2=A0 =C2=A0 svc_sendreply;<br>
-+=C2=A0 =C2=A0 svc_tli_create;<br>
-+=C2=A0 =C2=A0 svc_tp_create;<br>
-+=C2=A0 =C2=A0 svc_unreg;<br>
-+=C2=A0 =C2=A0 svc_unregister;<br>
-+=C2=A0 =C2=A0 svc_vc_create;<br>
-+=C2=A0 =C2=A0 svcerr_auth;<br>
-+=C2=A0 =C2=A0 svcerr_decode;<br>
-+=C2=A0 =C2=A0 svcerr_noproc;<br>
-+=C2=A0 =C2=A0 svcerr_noprog;<br>
-+=C2=A0 =C2=A0 svcerr_progvers;<br>
-+=C2=A0 =C2=A0 svcerr_systemerr;<br>
-+=C2=A0 =C2=A0 svcerr_weakauth;<br>
-+=C2=A0 =C2=A0 svcfd_create;<br>
-+=C2=A0 =C2=A0 svcraw_create;<br>
-+=C2=A0 =C2=A0 svctcp_create;<br>
-+=C2=A0 =C2=A0 svcudp_bufcreate;<br>
-+=C2=A0 =C2=A0 svcudp_create;<br>
-+=C2=A0 =C2=A0 svcunix_create;<br>
-+=C2=A0 =C2=A0 svcunixfd_create;<br>
-+<br>
-+=C2=A0 =C2=A0 # t*<br>
-+=C2=A0 =C2=A0 taddr2uaddr;<br>
-+<br>
-+=C2=A0 =C2=A0 # u*<br>
-+=C2=A0 =C2=A0 uaddr2taddr;<br>
-+<br>
-+=C2=A0 =C2=A0 # x*<br>
-+=C2=A0 =C2=A0 xdr_accepted_reply;<br>
-+=C2=A0 =C2=A0 xdr_array;<br>
-+=C2=A0 =C2=A0 xdr_authunix_parms;<br>
-+=C2=A0 =C2=A0 xdr_bool;<br>
-+=C2=A0 =C2=A0 xdr_bytes;<br>
-+=C2=A0 =C2=A0 xdr_callhdr; xdr_callmsg;<br>
-+=C2=A0 =C2=A0 xdr_char;<br>
-+=C2=A0 =C2=A0 xdr_des_block;<br>
-+=C2=A0 =C2=A0 xdr_double;<br>
-+=C2=A0 =C2=A0 xdr_enum;<br>
-+=C2=A0 =C2=A0 xdr_float;<br>
-+=C2=A0 =C2=A0 xdr_free;<br>
-+=C2=A0 =C2=A0 xdr_hyper;<br>
-+=C2=A0 =C2=A0 xdr_int16_t;<br>
-+=C2=A0 =C2=A0 xdr_int32_t;<br>
-+=C2=A0 =C2=A0 xdr_int64_t;<br>
-+=C2=A0 =C2=A0 xdr_int8_t;<br>
-+=C2=A0 =C2=A0 xdr_int;<br>
-+=C2=A0 =C2=A0 xdr_long;<br>
-+=C2=A0 =C2=A0 xdr_longlong_t;<br>
-+=C2=A0 =C2=A0 xdr_netbuf;<br>
-+=C2=A0 =C2=A0 xdr_netobj;<br>
-+=C2=A0 =C2=A0 xdr_opaque;<br>
-+=C2=A0 =C2=A0 xdr_opaque_auth;<br>
-+=C2=A0 =C2=A0 xdr_pmap;<br>
-+=C2=A0 =C2=A0 xdr_pmaplist;<br>
-+=C2=A0 =C2=A0 xdr_pmaplist_ptr;<br>
-+=C2=A0 =C2=A0 xdr_pointer;<br>
-+=C2=A0 =C2=A0 xdr_quad_t;<br>
-+=C2=A0 =C2=A0 xdr_reference;<br>
-+=C2=A0 =C2=A0 xdr_rejected_reply;<br>
-+=C2=A0 =C2=A0 xdr_replymsg;<br>
-+=C2=A0 =C2=A0 xdr_rmtcall_args;<br>
-+=C2=A0 =C2=A0 xdr_rmtcallres;<br>
-+=C2=A0 =C2=A0 xdr_rpcb;<br>
-+=C2=A0 =C2=A0 xdr_rpcb_entry;<br>
-+=C2=A0 =C2=A0 xdr_rpcb_entry_list_ptr;<br>
-+=C2=A0 =C2=A0 xdr_rpcb_rmtcallargs;<br>
-+=C2=A0 =C2=A0 xdr_rpcb_rmtcallres;<br>
-+=C2=A0 =C2=A0 xdr_rpcb_stat;<br>
-+=C2=A0 =C2=A0 xdr_rpcb_stat_byvers;<br>
-+=C2=A0 =C2=A0 xdr_rpcblist;<br>
-+=C2=A0 =C2=A0 xdr_rpcblist_ptr;<br>
-+=C2=A0 =C2=A0 xdr_rpcbs_addrlist;<br>
-+=C2=A0 =C2=A0 xdr_rpcbs_addrlist_ptr;<br>
-+=C2=A0 =C2=A0 xdr_rpcbs_proc;<br>
-+=C2=A0 =C2=A0 xdr_rpcbs_rmtcalllist;<br>
-+=C2=A0 =C2=A0 xdr_rpcbs_rmtcalllist_ptr;<br>
-+=C2=A0 =C2=A0 xdr_short;<br>
-+=C2=A0 =C2=A0 xdr_string;<br>
-+=C2=A0 =C2=A0 xdr_u_char;<br>
-+=C2=A0 =C2=A0 xdr_u_hyper;<br>
-+=C2=A0 =C2=A0 xdr_u_int16_t;<br>
-+=C2=A0 =C2=A0 xdr_u_int32_t;<br>
-+=C2=A0 =C2=A0 xdr_u_int64_t;<br>
-+=C2=A0 =C2=A0 xdr_u_int8_t;<br>
-+=C2=A0 =C2=A0 xdr_u_int;<br>
-+=C2=A0 =C2=A0 xdr_u_long;<br>
-+=C2=A0 =C2=A0 xdr_u_longlong_t;<br>
-+=C2=A0 =C2=A0 xdr_u_quad_t;<br>
-+=C2=A0 =C2=A0 xdr_u_short;<br>
-+=C2=A0 =C2=A0 xdr_uint16_t;<br>
-+=C2=A0 =C2=A0 xdr_uint32_t;<br>
-+=C2=A0 =C2=A0 xdr_uint64_t;<br>
-+=C2=A0 =C2=A0 xdr_uint8_t;<br>
-+=C2=A0 =C2=A0 xdr_union;<br>
-+=C2=A0 =C2=A0 xdr_vector;<br>
-+=C2=A0 =C2=A0 xdr_void;<br>
-+=C2=A0 =C2=A0 xdr_wrapstring;<br>
-+=C2=A0 =C2=A0 xdrmem_create;<br>
-+=C2=A0 =C2=A0 xdrrec_create;<br>
-+=C2=A0 =C2=A0 xdrrec_endofrecord;<br>
-+=C2=A0 =C2=A0 xdrrec_eof;<br>
-+=C2=A0 =C2=A0 xdrrec_skiprecord;<br>
-+=C2=A0 =C2=A0 xdrstdio_create;<br>
-+=C2=A0 =C2=A0 xprt_register;<br>
-+=C2=A0 =C2=A0 xprt_unregister;<br>
-+=C2=A0 =C2=A0 # GSS-API symbols (conditionally included)<br>
-+@GSS_SYMBOLS@<br>
-+=C2=A0 =C2=A0 # DES crypto symbols (conditionally included)<br>
-+@DES_SYMBOLS@<br>
-+=C2=A0 =C2=A0 # RPC database symbols (conditionally included)<br>
-+@RPCDB_SYMBOLS@<br>
-+<br>
-+=C2=A0 local:<br>
-+=C2=A0 =C2=A0 *;<br>
-+};<br>
-+<br>
-+TIRPC_0.3.1 {<br>
-+# GSS-API symbols (conditionally included)<br>
-+@GSS_SYMBOLS_031@<br>
-+} TIRPC_0.3.0;<br>
-+<br>
-+TIRPC_0.3.2 {<br>
-+=C2=A0 =C2=A0 getnetname;<br>
-+=C2=A0 =C2=A0 getpublicandprivatekey;<br>
-+=C2=A0 =C2=A0 getpublickey;<br>
-+=C2=A0 =C2=A0 host2netname;<br>
-+=C2=A0 =C2=A0 key_decryptsession;<br>
-+=C2=A0 =C2=A0 key_decryptsession_pk;<br>
-+=C2=A0 =C2=A0 key_encryptsession;<br>
-+=C2=A0 =C2=A0 key_encryptsession_pk;<br>
-+=C2=A0 =C2=A0 key_gendes;<br>
-+=C2=A0 =C2=A0 key_get_conv;<br>
-+=C2=A0 =C2=A0 key_setsecret;<br>
-+=C2=A0 =C2=A0 key_secretkey_is_set;<br>
-+=C2=A0 =C2=A0 key_setnet;<br>
-+=C2=A0 =C2=A0 netname2host;<br>
-+=C2=A0 =C2=A0 netname2user;<br>
-+=C2=A0 =C2=A0 rtime;<br>
-+=C2=A0 =C2=A0 user2netname;<br>
-+=C2=A0 =C2=A0 xdr_cryptkeyarg;<br>
-+=C2=A0 =C2=A0 xdr_cryptkeyarg2;<br>
-+=C2=A0 =C2=A0 xdr_cryptkeyres;<br>
-+=C2=A0 =C2=A0 xdr_getcredres;<br>
-+=C2=A0 =C2=A0 xdr_key_netstarg;<br>
-+=C2=A0 =C2=A0 xdr_key_netstres;<br>
-+=C2=A0 =C2=A0 xdr_keybuf;<br>
-+=C2=A0 =C2=A0 xdr_keystatus;<br>
-+=C2=A0 =C2=A0 xdr_netnamestr;<br>
-+=C2=A0 =C2=A0 xdr_unixcred;<br>
-+} TIRPC_0.3.1;<br>
-+<br>
-+TIRPC_0.3.3 {<br>
-+=C2=A0 =C2=A0 __getpublickey_LOCAL;<br>
-+=C2=A0 =C2=A0 __key_decryptsession_pk_LOCAL;<br>
-+=C2=A0 =C2=A0 __key_encryptsession_pk_LOCAL;<br>
-+=C2=A0 =C2=A0 __key_gendes_LOCAL;<br>
-+=C2=A0 =C2=A0 xdr_sizeof;<br>
-+=C2=A0 =C2=A0 authdes_pk_create;<br>
-+=C2=A0 =C2=A0 svc_pollfd;<br>
-+=C2=A0 =C2=A0 svc_max_pollfd;<br>
-+} TIRPC_0.3.2;<br>
-+<br>
-+TIRPC_PRIVATE {<br>
-+=C2=A0 global:<br>
-+=C2=A0 =C2=A0 __libc_clntudp_bufcreate;<br>
-+=C2=A0 # private, but used by rpcbind:<br>
-+=C2=A0 =C2=A0 __svc_clean_idle; svc_auth_none; libtirpc_set_debug;<br>
-+};<br>
diff --git a/meta/recipes-extended/libtirpc/libtirpc/0001-Update-declaratio=
ns-to-allow-compile-with-gcc-15.patch b/meta/recipes-extended/libtirpc/libt=
irpc/0001-Update-declarations-to-allow-compile-with-gcc-15.patch<br>
deleted file mode 100644<br>
index 7bfe7c2924..0000000000<br>
--- a/meta/recipes-extended/libtirpc/libtirpc/0001-Update-declarations-to-a=
llow-compile-with-gcc-15.patch<br>
+++ /dev/null<br>
@@ -1,64 +0,0 @@<br>
-From b526c0a90953f47d4cbf7ef01e9ac13e9e76904a Mon Sep 17 00:00:00 2001<br>
-From: Rudi Heitbaum &lt;<a href=3D"mailto:rudi@heitbaum.com" target=3D"_bl=
ank">rudi@heitbaum.com</a>&gt;<br>
-Date: Thu, 12 Dec 2024 04:16:02 -0500<br>
-Subject: [PATCH 1/2] Update declarations to allow compile with gcc-15<br>
-<br>
-This patch fixes some of the compile errors with gcc 15-20241117.<br>
-<br>
-In addition the follow declarations need to be fixed:<br>
-=C2=A0 sed -n 75,77p libtirpc-1.3.6/src/key_call.c<br>
-=C2=A0 cryptkeyres *(*__key_encryptsession_pk_LOCAL)() =3D 0;<br>
-=C2=A0 cryptkeyres *(*__key_decryptsession_pk_LOCAL)() =3D 0;<br>
-=C2=A0 des_block *(*__key_gendes_LOCAL)() =3D 0;<br>
-<br>
-Upstream-Status: Backport [<a href=3D"https://git.linux-nfs.org/?p=3Dsteve=
d/libtirpc.git;a=3Dcommit;h=3Dd473f1e1f6ba80bfaee4daa058da159305167323" rel=
=3D"noreferrer" target=3D"_blank">https://git.linux-nfs.org/?p=3Dsteved/lib=
tirpc.git;a=3Dcommit;h=3Dd473f1e1f6ba80bfaee4daa058da159305167323</a>]<br>
-Signed-off-by: Rudi Heitbaum &lt;<a href=3D"mailto:rudi@heitbaum.com" targ=
et=3D"_blank">rudi@heitbaum.com</a>&gt;<br>
-Signed-off-by: Steve Dickson &lt;<a href=3D"mailto:steved@redhat.com" targ=
et=3D"_blank">steved@redhat.com</a>&gt;<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
----<br>
- src/auth_none.c=C2=A0 =C2=A0 =C2=A0| 2 +-<br>
- src/getpublickey.c=C2=A0 | 2 +-<br>
- src/svc_auth_none.c | 4 ++--<br>
- 3 files changed, 4 insertions(+), 4 deletions(-)<br>
-<br>
-diff --git a/src/auth_none.c b/src/auth_none.c<br>
-index 0b0bbd1..aca6e71 100644<br>
---- a/src/auth_none.c<br>
-+++ b/src/auth_none.c<br>
-@@ -62,7 +62,7 @@ static bool_t authnone_validate (AUTH *, struct opaque_a=
uth *);<br>
- static bool_t authnone_refresh (AUTH *, void *);<br>
- static void authnone_destroy (AUTH *);<br>
- <br>
--extern bool_t xdr_opaque_auth();<br>
-+extern bool_t xdr_opaque_auth(XDR *, struct opaque_auth *);<br>
- <br>
- static struct auth_ops *authnone_ops();<br>
- <br>
-diff --git a/src/getpublickey.c b/src/getpublickey.c<br>
-index be37a24..4e96c7c 100644<br>
---- a/src/getpublickey.c<br>
-+++ b/src/getpublickey.c<br>
-@@ -52,7 +52,7 @@<br>
- /*<br>
-=C2=A0 * Hack to let ypserv/rpc.nisd use AUTH_DES.<br>
-=C2=A0 */<br>
--int (*__getpublickey_LOCAL)() =3D 0;<br>
-+int (*__getpublickey_LOCAL)(const char *, char *) =3D 0;<br>
- <br>
- /*<br>
-=C2=A0 * Get somebody&#39;s public key<br>
-diff --git a/src/svc_auth_none.c b/src/svc_auth_none.c<br>
-index 887e809..5ca98e9 100644<br>
---- a/src/svc_auth_none.c<br>
-+++ b/src/svc_auth_none.c<br>
-@@ -37,8 +37,8 @@<br>
- <br>
- #include &lt;rpc/rpc.h&gt;<br>
- <br>
--static bool_t svcauth_none_destroy();<br>
--static bool_t=C2=A0 =C2=A0svcauth_none_wrap();<br>
-+static bool_t svcauth_none_destroy(SVCAUTH *);<br>
-+static bool_t=C2=A0 =C2=A0svcauth_none_wrap(SVCAUTH *, XDR *, bool_t (*)(=
XDR *, ...), char *);<br>
- <br>
- struct svc_auth_ops svc_auth_none_ops =3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0svcauth_none_wrap,<br>
diff --git a/meta/recipes-extended/libtirpc/libtirpc/0002-update-signal-and=
-key_call-declarations-to-allow-com.patch b/meta/recipes-extended/libtirpc/=
libtirpc/0002-update-signal-and-key_call-declarations-to-allow-com.patch<br=
>
deleted file mode 100644<br>
index 83e2105a1a..0000000000<br>
--- a/meta/recipes-extended/libtirpc/libtirpc/0002-update-signal-and-key_ca=
ll-declarations-to-allow-com.patch<br>
+++ /dev/null<br>
@@ -1,60 +0,0 @@<br>
-From 55452e6ae71869880f8c85d5dba9aa24d7147d8b Mon Sep 17 00:00:00 2001<br>
-From: Rudi Heitbaum &lt;<a href=3D"mailto:rudi@heitbaum.com" target=3D"_bl=
ank">rudi@heitbaum.com</a>&gt;<br>
-Date: Thu, 2 Jan 2025 08:46:24 -0500<br>
-Subject: [PATCH 2/2] update signal and key_call declarations to allow comp=
ile<br>
- with gcc-15<br>
-<br>
-Follow up patch addressing the following declarations:<br>
-=C2=A0 sed -n 75,77p libtirpc-1.3.6/src/key_call.c<br>
-=C2=A0 cryptkeyres *(*__key_encryptsession_pk_LOCAL)() =3D 0;<br>
-=C2=A0 cryptkeyres *(*__key_decryptsession_pk_LOCAL)() =3D 0;<br>
-=C2=A0 des_block *(*__key_gendes_LOCAL)() =3D 0;<br>
-<br>
-Upstream-Status: Backport [<a href=3D"https://git.linux-nfs.org/?p=3Dsteve=
d/libtirpc.git;a=3Dcommit;h=3D240ee6c774729c9c24812aa8912f1fcf8996b162" rel=
=3D"noreferrer" target=3D"_blank">https://git.linux-nfs.org/?p=3Dsteved/lib=
tirpc.git;a=3Dcommit;h=3D240ee6c774729c9c24812aa8912f1fcf8996b162</a>]<br>
-Signed-off-by: Rudi Heitbaum &lt;<a href=3D"mailto:rudi@heitbaum.com" targ=
et=3D"_blank">rudi@heitbaum.com</a>&gt;<br>
-Signed-off-by: Steve Dickson &lt;<a href=3D"mailto:steved@redhat.com" targ=
et=3D"_blank">steved@redhat.com</a>&gt;<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
----<br>
- src/auth_time.c | 4 ++--<br>
- src/key_call.c=C2=A0 | 6 +++---<br>
- 2 files changed, 5 insertions(+), 5 deletions(-)<br>
-<br>
-diff --git a/src/auth_time.c b/src/auth_time.c<br>
-index 936dd76..c21b1df 100644<br>
---- a/src/auth_time.c<br>
-+++ b/src/auth_time.c<br>
-@@ -248,7 +248,7 @@ __rpc_get_time_offset(td, srv, thost, uaddr, netid)<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0char=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ut[64], ipuaddr[64];<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0endpoint=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 teps[32];<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0nis_server=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 tsrv;<br>
--=C2=A0 =C2=A0 =C2=A0 void=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 (*oldsig)() =3D NULL; /* old alarm handler */<br>
-+=C2=A0 =C2=A0 =C2=A0 void=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 (*oldsig)(int) =3D NULL; /* old alarm handler */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct sockaddr_in=C2=A0 =C2=A0 =C2=A0 sin;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s =3D RPC_ANYSOCK;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0socklen_t len;<br>
-@@ -417,7 +417,7 @@ __rpc_get_time_offset(td, srv, thost, uaddr, netid)<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0int res;<br>
- <br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 oldsig =3D (void (*)())signal(SIGALRM, alarm_hndler);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 oldsig =3D (void (*)(int))signal(SIGALRM, alarm_hndler);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0saw_alarm =3D 0; /* global tracking the alarm */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0alarm(20); /* only wait 20 seconds */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0res =3D connect(s, (struct sockaddr *)&amp;sin, sizeof(sin));<br>
-diff --git a/src/key_call.c b/src/key_call.c<br>
-index 9f4b1d2..43f990e 100644<br>
---- a/src/key_call.c<br>
-+++ b/src/key_call.c<br>
-@@ -72,9 +72,9 @@<br>
-=C2=A0 * implementations of these functions, and to call those in key_call=
().<br>
-=C2=A0 */<br>
- <br>
--cryptkeyres *(*__key_encryptsession_pk_LOCAL)() =3D 0;<br>
--cryptkeyres *(*__key_decryptsession_pk_LOCAL)() =3D 0;<br>
--des_block *(*__key_gendes_LOCAL)() =3D 0;<br>
-+cryptkeyres *(*__key_encryptsession_pk_LOCAL)(uid_t, char *) =3D 0;<br>
-+cryptkeyres *(*__key_decryptsession_pk_LOCAL)(uid_t, char *) =3D 0;<br>
-+des_block *(*__key_gendes_LOCAL)(uid_t, char *) =3D 0;<br>
- <br>
- static int key_call( u_long, xdrproc_t, void *, xdrproc_t, void *);<br>
- <br>
diff --git a/meta/recipes-extended/libtirpc/<a href=3D"http://libtirpc_1.3.=
6.bb" rel=3D"noreferrer" target=3D"_blank">libtirpc_1.3.6.bb</a> b/meta/rec=
ipes-extended/libtirpc/<a href=3D"http://libtirpc_1.3.7.bb" rel=3D"noreferr=
er" target=3D"_blank">libtirpc_1.3.7.bb</a><br>
similarity index 78%<br>
rename from meta/recipes-extended/libtirpc/<a href=3D"http://libtirpc_1.3.6=
.bb" rel=3D"noreferrer" target=3D"_blank">libtirpc_1.3.6.bb</a><br>
rename to meta/recipes-extended/libtirpc/<a href=3D"http://libtirpc_1.3.7.b=
b" rel=3D"noreferrer" target=3D"_blank">libtirpc_1.3.7.bb</a><br>
index c6901839c1..edc75a8366 100644<br>
--- a/meta/recipes-extended/libtirpc/<a href=3D"http://libtirpc_1.3.6.bb" r=
el=3D"noreferrer" target=3D"_blank">libtirpc_1.3.6.bb</a><br>
+++ b/meta/recipes-extended/libtirpc/<a href=3D"http://libtirpc_1.3.7.bb" r=
el=3D"noreferrer" target=3D"_blank">libtirpc_1.3.7.bb</a><br>
@@ -10,13 +10,10 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Df835cce=
8852481e4b2bbbdd23b5e47f3 \<br>
=C2=A0PROVIDES =3D &quot;virtual/librpc&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.bz2 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Update-declarations-t=
o-allow-compile-with-gcc-15.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-update-signal-and-key=
_call-declarations-to-allow-com.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Add-conditional-versi=
on-script-support.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://sourceforge.net/proje=
cts/libtirpc/files/libtirpc/" rel=3D"noreferrer" target=3D"_blank">https://=
sourceforge.net/projects/libtirpc/files/libtirpc/</a>&quot;<br>
=C2=A0UPSTREAM_CHECK_REGEX =3D &quot;(?P&lt;pver&gt;\d+(\.\d+)+)/&quot;<br>
-SRC_URI[sha256sum] =3D &quot;bbd26a8f0df5690a62a47f6aa30f797f3ef8d02560d1b=
c449a83066b5a1d3508&quot;<br>
+SRC_URI[sha256sum] =3D &quot;b47d3ac19d3549e54a05d0019a6c400674da716123858=
cfdb6d3bdd70a66c702&quot;<br>
<br>
=C2=A0inherit autotools pkgconfig<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#226890): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/226890" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/226890</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116510360/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116510360/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000f08ec50644b2724d--

