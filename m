Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A23A7CFD2F6
	for <webhook@archiver.kernel.org>; Sat, 29 Nov 2025 18:59:46 +0000 (UTC)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.887.1764442778904332356
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Nov 2025 10:59:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kJTWfAkL;
 spf=pass (domain: gmail.com, ip: 209.85.161.48, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6574de1cda1so1147578eaf.3
        for <openembedded-core@lists.openembedded.org>; Sat, 29 Nov 2025 10:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764442778; x=1765047578; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TjtKoml/lXK1ZOJgHwuk/esfdCnbdNfgYaBGy6ydRtE=;
        b=kJTWfAkLjhovVy15h2e8k543s+PKqdHK1l3FdzkNQ5F/xjpaolrzZfAg3BrTTqd8Zx
         +7NTkW0XrXuC7bsOFrkvztMxRsAuw++jqjss+UN5/6iVWsh0OCKL7ESkoAGQwFvgYtWA
         6rk83iq0TsmvsuPbX53ZyExtQo0JI3lx/kMSk/tR/mSGUEg6z48IqDo5syq7xlFJB/dR
         cFCWw7S8Olj3Qh6oK2M/vh+97YEac8DJbGUjGeFKzkaJgVPs4MhGMmIq2FnTPAzNc91S
         aHEZIh21wqEcz37oa6o30HqLmRzXJV/7ZMV2UbJ787SLmWPharJAmEzIJy0accwMh9NA
         PvpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764442778; x=1765047578;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TjtKoml/lXK1ZOJgHwuk/esfdCnbdNfgYaBGy6ydRtE=;
        b=mZ8kvHI7Uv8CEWVUJXtslPlBzz0DwH+NZQGEaO+yOcPiZGHZZE7qmHfABiAsSZbCU/
         E2cgrbTvC1z+AxDnWOY7zzExkVBk070d/zn1BlT+WwG5C+btP47rPXJaYyFPW6xbST4H
         2BAumvatmH48ZfDslfpfJ4AsJpuJZw7KRbnnYko9iLsOLRIcvFWwou1dD77ACV2s7AQQ
         PZjibEPLT6dw59u1+lc1EvEWh3cFNwZyBmSc82GfENYpDkSnEZAbUnndnc1mVAz3WTrc
         PwV7tVRsMUgFlsfxTdmz5y7HwffqJWCn7T8K5NyL3qG87iM3F6+96kjDbSyImMXHdBPI
         JCMA==
X-Gm-Message-State: AOJu0YylbjBrO68ceHrjF7o7w3FxAe7pBFCLRtVaOS7+/tlhCF1mo9tp
	SzkBwoUIPhD/dJyLtbvJg6xZZIC95NmqFz1UVo798nD+OuYxytlJVUbaM8wnvY8pYwKSQX9lcxY
	GRyJaCa6x7cspzjda6IafjkrBbz7leIA=
X-Gm-Gg: ASbGncuZDoUq6b/M1tViWzupC0qSmO9H2i4i7NpyfXcvAb5s1ibt/tEScVQqxXSWpAf
	mzAfmKs0JPPS4wPxjskEWbZ1JdNlefDEYBY7sVETlPYVT73zzny099slpyx00LY92KA0N+Ivt1Z
	0x8GWIU7MuXYfINDVVZ+8aMmxfdHQ/+X2Jl8sJGl+dTOzejM5D6iPGk1BAizIFsNsYAXFezxR62
	mw/ZRlxfH3eQU+39wZlEe9DfcJcGOg0iTl/iI4AgvTYW0ERtZKEASCTYBvyJ4X2rgEnNpc=
X-Google-Smtp-Source: AGHT+IGvJUlqeRa+OcwCZciRLhRS6pYynM5un+jznQbcY8d/wvu0lEbwMzJK/fcfKvBclPAhOXN+1nzBaip5gSlOh7k=
X-Received: by 2002:a05:6808:8953:b0:450:d568:a50 with SMTP id
 5614622812f47-4514e834249mr9288563b6e.56.1764442777816; Sat, 29 Nov 2025
 10:59:37 -0800 (PST)
MIME-Version: 1.0
References: <20251128061851.1634479-1-ankur.tyagi85@gmail.com>
 <20251128061851.1634479-7-ankur.tyagi85@gmail.com> <CAMKF1sq_5HD9ptwr50tAqd7q7D+AUVEkpj2UydsrbG595hj=bA@mail.gmail.com>
In-Reply-To: <CAMKF1sq_5HD9ptwr50tAqd7q7D+AUVEkpj2UydsrbG595hj=bA@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Sun, 30 Nov 2025 07:59:26 +1300
X-Gm-Features: AWmQ_bld993zevs-Ng69tMhGapQ-FPd3qxZuRRxZNp_6IwWb6NnTNU1qvCi2CVc
Message-ID: <CADySD0G3OF5C0sO8tCYeDDAY6fqJbkBuJshP8FsKH9Q_J9o+UQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH 07/14] libtirpc: upgrade 1.3.6 -> 1.3.7
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Nov 2025 18:59:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226947

On Sat, Nov 29, 2025 at 3:24=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> have you tried building it with -fuse-ld=3Dlld and TOOLCHAIN =3D "clang"
>
Hi Khem,

I gave it a try and it failed to configure with error:

configure: error: C compiler cannot create executables

config.log has following error:

configure:4033: x86_64-poky-linux-clang  -m64 -march=3Dx86-64-v3
-fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=3D2 -Wformat
-Wformat-security -Werror=3Dformat-security
--sysroot=3D/yocto/bitbake-builds/distro_poky-master/build/tmp/work/x86-64-=
v3-poky-linux/libtirpc/1.3.7/recipe-sysroot
 -O2 -g   -ffile-prefix-map=3D/yocto/bitbake-builds/distro_poky-master/buil=
d/tmp/work/x86-64-v3-poky-linux/libtirpc/1.3.7/sources/libtirpc-1.3.7=3D/us=
r/src/debug/libtirpc/1.3.7
 -ffile-prefix-map=3D/yocto/bitbake-builds/distro_poky-master/build/tmp/wor=
k/x86-64-v3-poky-linux/libtirpc/1.3.7/build=3D/usr/src/debug/libtirpc/1.3.7
 -ffile-prefix-map=3D/yocto/bitbake-builds/distro_poky-master/build/tmp/wor=
k/x86-64-v3-poky-linux/libtirpc/1.3.7/recipe-sysroot=3D
 -ffile-prefix-map=3D/yocto/bitbake-builds/distro_poky-master/build/tmp/wor=
k/x86-64-v3-poky-linux/libtirpc/1.3.7/recipe-sysroot-native=3D
 -pipe  -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed
-ffile-prefix-map=3D/yocto/bitbake-builds/distro_poky-master/build/tmp/work=
/x86-64-v3-poky-linux/libtirpc/1.3.7/sources/libtirpc-1.3.7=3D/usr/src/debu=
g/libtirpc/1.3.7
 -ffile-prefix-map=3D/yocto/bitbake-builds/distro_poky-master/build/tmp/wor=
k/x86-64-v3-poky-linux/libtirpc/1.3.7/build=3D/usr/src/debug/libtirpc/1.3.7
 -ffile-prefix-map=3D/yocto/bitbake-builds/distro_poky-master/build/tmp/wor=
k/x86-64-v3-poky-linux/libtirpc/1.3.7/recipe-sysroot=3D
 -ffile-prefix-map=3D/yocto/bitbake-builds/distro_poky-master/build/tmp/wor=
k/x86-64-v3-poky-linux/libtirpc/1.3.7/recipe-sysroot-native=3D
 -Wl,-z,relro,-z,now -fuse-ld=3Dlld conftest.c  >&5
x86_64-poky-linux-ld.lld: error: unable to find library -lgcc_s
x86_64-poky-linux-ld.lld: error: unable to find library -lgcc_s

I will look into it, thanks for highlighting it.

cheers
Ankur
> On Thu, Nov 27, 2025 at 10:19=E2=80=AFPM Ankur Tyagi via lists.openembedd=
ed.org <ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
>>
>> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>>
>> Dropped patches merged in the upstream.
>>
>> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
>> ---
>>  ...d-conditional-version-script-support.patch | 810 ------------------
>>  ...rations-to-allow-compile-with-gcc-15.patch |  64 --
>>  ...d-key_call-declarations-to-allow-com.patch |  60 --
>>  .../{libtirpc_1.3.6.bb =3D> libtirpc_1.3.7.bb}  |   5 +-
>>  4 files changed, 1 insertion(+), 938 deletions(-)
>>  delete mode 100644 meta/recipes-extended/libtirpc/libtirpc/0001-Add-con=
ditional-version-script-support.patch
>>  delete mode 100644 meta/recipes-extended/libtirpc/libtirpc/0001-Update-=
declarations-to-allow-compile-with-gcc-15.patch
>>  delete mode 100644 meta/recipes-extended/libtirpc/libtirpc/0002-update-=
signal-and-key_call-declarations-to-allow-com.patch
>>  rename meta/recipes-extended/libtirpc/{libtirpc_1.3.6.bb =3D> libtirpc_=
1.3.7.bb} (78%)
>>
>> diff --git a/meta/recipes-extended/libtirpc/libtirpc/0001-Add-conditiona=
l-version-script-support.patch b/meta/recipes-extended/libtirpc/libtirpc/00=
01-Add-conditional-version-script-support.patch
>> deleted file mode 100644
>> index 2764f65284..0000000000
>> --- a/meta/recipes-extended/libtirpc/libtirpc/0001-Add-conditional-versi=
on-script-support.patch
>> +++ /dev/null
>> @@ -1,810 +0,0 @@
>> -From 8ae9a335d56fc4aba8454159b326d809efca597f Mon Sep 17 00:00:00 2001
>> -From: Khem Raj <raj.khem@gmail.com>
>> -Date: Mon, 11 Aug 2025 21:13:59 -0700
>> -Subject: [PATCH] Add conditional version script support
>> -
>> -This patch adds conditional symbol versioning to libtirpc, allowing
>> -GSS-API, DES crypto, and RPC database symbols to be conditionally
>> -included in the version script based on build configuration.
>> -
>> -LLD is strict about undefined symbols referenced in a version script.
>> -Some libtirpc symbols (rpcsec_gss, old DES helpers, rpc database
>> -helpers) are optional and may not be built depending on configure
>> -options or missing deps. GNU ld tolerated this; LLD errors out.
>> -
>> -This change keeps the canonical symbol map in src/libtirpc.map, but
>> -adds a make-time rule to generate a filtered copy
>> -where names from disabled features are deleted. The lib is then linked
>> -against the generated linker map file.
>> -
>> -Fixes linking errors when these features are not available.
>> -
>> -Upstream-Status: Submitted [https://lore.kernel.org/linux-nfs/202508121=
80809.2182301-1-raj.khem@gmail.com/T/#u]
>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ----
>> - configure.ac                          | 50 +++++++++++++++++++++++++++
>> - src/Makefile.am                       | 21 +++++++++--
>> - src/{libtirpc.map =3D> libtirpc.map.in} | 48 +++++--------------------
>> - 3 files changed, 77 insertions(+), 42 deletions(-)
>> - rename src/{libtirpc.map =3D> libtirpc.map.in} (84%)
>> -
>> ---- a/configure.ac
>> -+++ b/configure.ac
>> -@@ -77,6 +77,19 @@ if test "x$enable_ipv6" !=3D xno; then
>> -       AC_DEFINE(INET6, 1, [Define to 1 if IPv6 is available])
>> - fi
>> -
>> -+# RPC database support
>> -+AC_ARG_ENABLE(rpcdb,
>> -+    [AS_HELP_STRING([--enable-rpcdb], [Enable RPC Database support @<:=
@default=3Dno@:>@])],
>> -+    [], [enable_rpcdb=3Dno])
>> -+AM_CONDITIONAL(RPCDB, test "x$enable_rpcdb" =3D xyes)
>> -+if test "x$enable_rpcdb" !=3D "xno"; then
>> -+    AC_CHECK_FUNCS([getrpcent getrpcbyname getrpcbynumber], [have_rpcd=
b=3Dyes])
>> -+
>> -+    if test "x$have_rpcdb" =3D "xyes"; then
>> -+        AC_DEFINE([RPCDB], [1], [Define if RPC database support is ava=
ilable])
>> -+    fi
>> -+fi
>> -+
>> - AC_ARG_ENABLE(symvers,
>> -       [AS_HELP_STRING([--disable-symvers],[Disable symbol versioning @=
<:@default=3Dno@:>@])],
>> -       [],[enable_symvers=3Dmaybe])
>> -@@ -97,6 +110,33 @@ fi
>> -
>> - AM_CONDITIONAL(SYMVERS, test "x$enable_symvers" =3D xyes)
>> -
>> -+# Generate symbol lists for version script
>> -+if test "x$enable_gssapi" =3D "xyes"; then
>> -+    GSS_SYMBOLS=3D"_svcauth_gss; authgss_create; authgss_create_defaul=
t; authgss_free_private_data; authgss_get_private_data; authgss_service; gs=
s_log_debug; gss_log_hexdump; gss_log_status; rpc_gss_get_error; rpc_gss_ge=
t_mech_info; rpc_gss_get_mechanisms; rpc_gss_get_principal_name; rpc_gss_ge=
t_versions; rpc_gss_qop_to_num; rpc_gss_seccreate; rpc_gss_set_callback; rp=
c_gss_set_defaults; rpc_gss_set_svc_name; rpc_gss_svc_max_data_length;"
>> -+
>> -+    GSS_SYMBOLS_031=3D"svcauth_gss_get_principal; svcauth_gss_set_svc_=
name;"
>> -+else
>> -+    GSS_SYMBOLS=3D""
>> -+    GSS_SYMBOLS_031=3D""
>> -+fi
>> -+
>> -+if test "x$enable_authdes" =3D "xyes"; then
>> -+    DES_SYMBOLS=3D"cbc_crypt; ecb_crypt; xdr_authdes_cred; xdr_authdes=
_verf; xdr_rpc_gss_cred; xdr_rpc_gss_data; xdr_rpc_gss_init_args; xdr_rpc_g=
ss_init_res;"
>> -+else
>> -+    DES_SYMBOLS=3D""
>> -+fi
>> -+
>> -+if test "x$enable_rpcdb" =3D "xyes"; then
>> -+    RPCDB_SYMBOLS=3D"endrpcent; getrpcent; getrpcbynumber; getrpcbynam=
e; setrpcent;"
>> -+else
>> -+    RPCDB_SYMBOLS=3D""
>> -+fi
>> -+
>> -+AC_SUBST([GSS_SYMBOLS])
>> -+AC_SUBST([GSS_SYMBOLS_031])
>> -+AC_SUBST([DES_SYMBOLS])
>> -+AC_SUBST([RPCDB_SYMBOLS])
>> -+
>> - AC_CANONICAL_BUILD
>> - # Check for which host we are on and setup a few things
>> - # specifically based on the host
>> -@@ -167,7 +207,16 @@ AC_CHECK_FUNCS([getpeereid getrpcbyname
>> - AC_CHECK_TYPES(struct rpcent,,, [
>> -       #include <netdb.h>])
>> - AC_CONFIG_FILES([Makefile src/Makefile man/Makefile doc/Makefile])
>> -+AC_CONFIG_FILES([src/libtirpc.map])
>> - AC_CONFIG_FILES([libtirpc.pc])
>> - AC_OUTPUT
>> -
>> -+# Configuration summary
>> -+AC_MSG_NOTICE([
>> -+libtirpc configuration summary:
>> -+  GSS-API support: $enable_gssapi
>> -+  DES crypto support: $enable_authdes
>> -+  RPC database support: $enable_rpcdb
>> -+  Symbol versioning: $enable_symvers
>> -+])
>> -
>> ---- a/src/Makefile.am
>> -+++ b/src/Makefile.am
>> -@@ -6,6 +6,9 @@
>> - ## anything like that.
>> -
>> - noinst_HEADERS =3D rpc_com.h debug.h
>> -+EXTRA_DIST =3D libtirpc.map.in
>> -+# Generated files
>> -+BUILT_SOURCES =3D libtirpc.map
>> -
>> - AM_CPPFLAGS =3D -I$(top_srcdir)/tirpc -include config.h -DPORTMAP -DIN=
ET6 \
>> -               -D_GNU_SOURCE -Wall -pipe
>> -@@ -15,10 +18,19 @@ lib_LTLIBRARIES =3D libtirpc.la
>> - libtirpc_la_LDFLAGS =3D @LDFLAG_NOUNDEFINED@ -no-undefined @PTHREAD_LI=
BS@
>> - libtirpc_la_LDFLAGS +=3D -version-info @LT_VERSION_INFO@
>> -
>> -+# Generate version script from template
>> -+libtirpc.map: $(srcdir)/libtirpc.map.in
>> -+      $(AM_V_GEN)$(SED) \
>> -+              -e 's|@GSS_SYMBOLS@|$(GSS_SYMBOLS)|g' \
>> -+              -e 's|@GSS_SYMBOLS_031@|$(GSS_SYMBOLS_031)|g' \
>> -+              -e 's|@DES_SYMBOLS@|$(DES_SYMBOLS)|g' \
>> -+              -e 's|@RPCDB_SYMBOLS@|$(RPCDB_SYMBOLS)|g' \
>> -+              < $(srcdir)/libtirpc.map.in > $@ || rm -f $@
>> -+
>> - libtirpc_la_SOURCES =3D auth_none.c auth_unix.c authunix_prot.c \
>> -         binddynport.c bindresvport.c \
>> -         clnt_bcast.c clnt_dg.c clnt_generic.c clnt_perror.c clnt_raw.c=
 clnt_simple.c \
>> --        clnt_vc.c rpc_dtablesize.c getnetconfig.c getnetpath.c getrpce=
nt.c \
>> -+        clnt_vc.c rpc_dtablesize.c getnetconfig.c getnetpath.c \
>> -         getrpcport.c mt_misc.c pmap_clnt.c pmap_getmaps.c pmap_getport=
.c \
>> -         pmap_prot.c pmap_prot2.c pmap_rmt.c rpc_prot.c rpc_commondata.=
c \
>> -         rpc_callmsg.c rpc_generic.c rpc_soc.c rpcb_clnt.c rpcb_prot.c =
\
>> -@@ -34,19 +46,23 @@ endif
>> - libtirpc_la_SOURCES +=3D xdr.c xdr_rec.c xdr_array.c xdr_float.c xdr_m=
em.c xdr_reference.c xdr_stdio.c xdr_sizeof.c
>> -
>> - if SYMVERS
>> --    libtirpc_la_LDFLAGS +=3D -Wl,--version-script=3D$(srcdir)/libtirpc=
.map
>> -+    libtirpc_la_LDFLAGS +=3D -Wl,--version-script=3D$(builddir)/libtir=
pc.map
>> - endif
>> -
>> - ## Secure-RPC
>> - if GSS
>> --    libtirpc_la_SOURCES +=3D auth_gss.c authgss_prot.c svc_auth_gss.c =
\
>> --                         rpc_gss_utils.c
>> --    libtirpc_la_LIBADD =3D $(GSSAPI_LIBS)
>> --    libtirpc_la_CFLAGS =3D -DHAVE_RPCSEC_GSS $(GSSAPI_CFLAGS)
>> -+libtirpc_la_SOURCES +=3D auth_gss.c authgss_prot.c svc_auth_gss.c rpc_=
gss_utils.c
>> -+libtirpc_la_LIBADD =3D $(GSSAPI_LIBS)
>> -+libtirpc_la_CFLAGS =3D -DHAVE_RPCSEC_GSS $(GSSAPI_CFLAGS)
>> -+endif
>> -+
>> -+# Conditionally add RPC database sources
>> -+if RPCDB
>> -+libtirpc_la_SOURCES +=3D getrpcent.c
>> - endif
>> -
>> - libtirpc_la_SOURCES +=3D key_call.c key_prot_xdr.c getpublickey.c
>> - libtirpc_la_SOURCES +=3D netname.c netnamer.c rpcdname.c rtime.c
>> -
>> --CLEANFILES           =3D cscope.* *~
>> -+CLEANFILES           =3D cscope.* libtirpc.map *~
>> - DISTCLEANFILES               =3D Makefile.in
>> ---- a/src/libtirpc.map
>> -+++ /dev/null
>> -@@ -1,335 +0,0 @@
>> --TIRPC_0.3.0 {
>> --  global:
>> --    # __*
>> --    __rpc_createerr;
>> --    __rpc_dtbsize;
>> --    __rpc_endconf;
>> --    __rpc_fd2sockinfo;
>> --    __rpc_fixup_addr;
>> --    __rpc_get_a_size;
>> --    __rpc_get_local_uid;
>> --    __rpc_get_t_size;
>> --    __rpc_getconf;
>> --    __rpc_getconfip;
>> --    __rpc_nconf2fd;
>> --    __rpc_nconf2fd_flags;
>> --    __rpc_nconf2sockinfo;
>> --    __rpc_rawcombuf;
>> --    __rpc_seman2socktype;
>> --    __rpc_setconf;
>> --    __rpc_sockinfo2netid;
>> --    __rpc_sockisbound;
>> --    __rpc_socktype2seman;
>> --    __rpc_taddr2uaddr_af;
>> --    __rpc_uaddr2taddr_af;
>> --    __rpcgettp;
>> --
>> --    # _*
>> --    _authenticate;
>> --    _get_next_token;
>> --    _gss_authenticate;
>> --    _null_auth;
>> --    _rpc_dtablesize;
>> --    _seterr_reply;
>> --    _svcauth_none;
>> --    _svcauth_short;
>> --    _svcauth_unix;
>> --    _svcauth_gss;
>> --
>> --    # a*
>> --    authdes_create;
>> --    authdes_seccreate;
>> --    authgss_create;
>> --    authgss_create_default;
>> --    authgss_free_private_data;
>> --    authgss_get_private_data;
>> --    authgss_service;
>> --    authnone_create;
>> --    authunix_create;
>> --    authunix_create_default;
>> --
>> --    # b*
>> --    bindresvport;
>> --    bindresvport_sa;
>> --
>> --    # c*
>> --    callrpc;
>> --    cbc_crypt;
>> --    clnt_broadcast;
>> --    clnt_create;
>> --    clnt_create_timed;
>> --    clnt_create_vers;
>> --    clnt_create_vers_timed;
>> --    clnt_dg_create;
>> --    clnt_pcreateerror;
>> --    clnt_perrno;
>> --    clnt_perror;
>> --    clnt_raw_create;
>> --    clnt_spcreateerror;
>> --    clnt_sperrno;
>> --    clnt_sperror;
>> --    clnt_tli_create;
>> --    clnt_tp_create;
>> --    clnt_tp_create_timed;
>> --    clnt_vc_create;
>> --    clntraw_create;
>> --    clnttcp_create;
>> --    clntudp_bufcreate;
>> --    clntudp_create;
>> --    clntunix_create;
>> --
>> --    # e*
>> --    ecb_crypt;
>> --    endnetconfig;
>> --    endnetpath;
>> --    endrpcent;
>> --
>> --    # f*
>> --    freenetconfigent;
>> --
>> --    # g*
>> --    get_myaddress;
>> --    getnetconfig;
>> --    getnetconfigent;
>> --    getnetpath;
>> --    getrpcent;
>> --    getrpcbynumber;
>> --    getrpcbyname;
>> --    getrpcport;
>> --    gss_log_debug;
>> --    gss_log_hexdump;
>> --    gss_log_status;
>> --
>> --    # n*
>> --    nc_perror;
>> --    nc_sperror;
>> --
>> --    # p*
>> --    pmap_getmaps;
>> --    pmap_getport;
>> --    pmap_rmtcall;
>> --    pmap_set;
>> --    pmap_unset;
>> --
>> --    # r*
>> --    registerrpc;
>> --    rpc_broadcast;
>> --    rpc_broadcast_exp;
>> --    rpc_call;
>> --    rpc_control;
>> --    rpc_createerr;
>> --    rpc_gss_get_error;
>> --    rpc_gss_get_mech_info;
>> --    rpc_gss_get_mechanisms;
>> --    rpc_gss_get_principal_name;
>> --    rpc_gss_get_versions;
>> --    rpc_gss_getcred;
>> --    rpc_gss_is_installed;
>> --    rpc_gss_max_data_length;
>> --    rpc_gss_mech_to_oid;
>> --    rpc_gss_qop_to_num;
>> --    rpc_gss_seccreate;
>> --    rpc_gss_set_callback;
>> --    rpc_gss_set_defaults;
>> --    rpc_gss_set_svc_name;
>> --    rpc_gss_svc_max_data_length;
>> --    rpc_nullproc;
>> --    rpc_reg;
>> --    rpcb_getaddr;
>> --    rpcb_getmaps;
>> --    rpcb_gettime;
>> --    rpcb_rmtcall;
>> --    rpcb_set;
>> --    rpcb_taddr2uaddr;
>> --    rpcb_uaddr2taddr;
>> --    rpcb_unset;
>> --
>> --    # s*
>> --    setnetconfig;
>> --    setnetpath;
>> --    setrpcent;
>> --    svc_auth_reg;
>> --    svc_create;
>> --    svc_dg_create;
>> --    svc_dg_enablecache;
>> --    svc_exit;
>> --    svc_fd_create;
>> --    svc_fdset;
>> --    svc_getreq;
>> --    svc_getreq_common;
>> --    svc_getreq_poll;
>> --    svc_getreqset;
>> --    svc_maxfd;
>> --    svc_raw_create;
>> --    svc_reg;
>> --    svc_register;
>> --    svc_run;
>> --    svc_sendreply;
>> --    svc_tli_create;
>> --    svc_tp_create;
>> --    svc_unreg;
>> --    svc_unregister;
>> --    svc_vc_create;
>> --    svcerr_auth;
>> --    svcerr_decode;
>> --    svcerr_noproc;
>> --    svcerr_noprog;
>> --    svcerr_progvers;
>> --    svcerr_systemerr;
>> --    svcerr_weakauth;
>> --    svcfd_create;
>> --    svcraw_create;
>> --    svctcp_create;
>> --    svcudp_bufcreate;
>> --    svcudp_create;
>> --    svcunix_create;
>> --    svcunixfd_create;
>> --
>> --    # t*
>> --    taddr2uaddr;
>> --
>> --    # u*
>> --    uaddr2taddr;
>> --
>> --    # x*
>> --    xdr_accepted_reply;
>> --    xdr_array;
>> --    xdr_authdes_cred;
>> --    xdr_authdes_verf;
>> --    xdr_authunix_parms;
>> --    xdr_bool;
>> --    xdr_bytes;
>> --    xdr_callhdr; xdr_callmsg;
>> --    xdr_char;
>> --    xdr_des_block;
>> --    xdr_double;
>> --    xdr_enum;
>> --    xdr_float;
>> --    xdr_free;
>> --    xdr_hyper;
>> --    xdr_int16_t;
>> --    xdr_int32_t;
>> --    xdr_int64_t;
>> --    xdr_int8_t;
>> --    xdr_int;
>> --    xdr_long;
>> --    xdr_longlong_t;
>> --    xdr_netbuf;
>> --    xdr_netobj;
>> --    xdr_opaque;
>> --    xdr_opaque_auth;
>> --    xdr_pmap;
>> --    xdr_pmaplist;
>> --    xdr_pmaplist_ptr;
>> --    xdr_pointer;
>> --    xdr_quad_t;
>> --    xdr_reference;
>> --    xdr_rejected_reply;
>> --    xdr_replymsg;
>> --    xdr_rmtcall_args;
>> --    xdr_rmtcallres;
>> --    xdr_rpc_gss_cred;
>> --    xdr_rpc_gss_data;
>> --    xdr_rpc_gss_init_args;
>> --    xdr_rpc_gss_init_res;
>> --    xdr_rpcb;
>> --    xdr_rpcb_entry;
>> --    xdr_rpcb_entry_list_ptr;
>> --    xdr_rpcb_rmtcallargs;
>> --    xdr_rpcb_rmtcallres;
>> --    xdr_rpcb_stat;
>> --    xdr_rpcb_stat_byvers;
>> --    xdr_rpcblist;
>> --    xdr_rpcblist_ptr;
>> --    xdr_rpcbs_addrlist;
>> --    xdr_rpcbs_addrlist_ptr;
>> --    xdr_rpcbs_proc;
>> --    xdr_rpcbs_rmtcalllist;
>> --    xdr_rpcbs_rmtcalllist_ptr;
>> --    xdr_short;
>> --    xdr_string;
>> --    xdr_u_char;
>> --    xdr_u_hyper;
>> --    xdr_u_int16_t;
>> --    xdr_u_int32_t;
>> --    xdr_u_int64_t;
>> --    xdr_u_int8_t;
>> --    xdr_u_int;
>> --    xdr_u_long;
>> --    xdr_u_longlong_t;
>> --    xdr_u_quad_t;
>> --    xdr_u_short;
>> --    xdr_uint16_t;
>> --    xdr_uint32_t;
>> --    xdr_uint64_t;
>> --    xdr_uint8_t;
>> --    xdr_union;
>> --    xdr_vector;
>> --    xdr_void;
>> --    xdr_wrapstring;
>> --    xdrmem_create;
>> --    xdrrec_create;
>> --    xdrrec_endofrecord;
>> --    xdrrec_eof;
>> --    xdrrec_skiprecord;
>> --    xdrstdio_create;
>> --    xprt_register;
>> --    xprt_unregister;
>> --
>> --  local:
>> --    *;
>> --};
>> --
>> --TIRPC_0.3.1 {
>> --    svcauth_gss_get_principal;
>> --    svcauth_gss_set_svc_name;
>> --} TIRPC_0.3.0;
>> --
>> --TIRPC_0.3.2 {
>> --    getnetname;
>> --    getpublicandprivatekey;
>> --    getpublickey;
>> --    host2netname;
>> --    key_call_destroy;
>> --    key_decryptsession;
>> --    key_decryptsession_pk;
>> --    key_encryptsession;
>> --    key_encryptsession_pk;
>> --    key_gendes;
>> --    key_get_conv;
>> --    key_setsecret;
>> --    key_secretkey_is_set;
>> --    key_setnet;
>> --    netname2host;
>> --    netname2user;
>> --    rtime;
>> --    user2netname;
>> --    xdr_cryptkeyarg;
>> --    xdr_cryptkeyarg2;
>> --    xdr_cryptkeyres;
>> --    xdr_getcredres;
>> --    xdr_key_netstarg;
>> --    xdr_key_netstres;
>> --    xdr_keybuf;
>> --    xdr_keystatus;
>> --    xdr_netnamestr;
>> --    xdr_unixcred;
>> --} TIRPC_0.3.1;
>> --
>> --TIRPC_0.3.3 {
>> --    __getpublickey_LOCAL;
>> --    __key_decryptsession_pk_LOCAL;
>> --    __key_encryptsession_pk_LOCAL;
>> --    __key_gendes_LOCAL;
>> --    xdr_sizeof;
>> --    authdes_pk_create;
>> --    svc_pollfd;
>> --    svc_max_pollfd;
>> --} TIRPC_0.3.2;
>> --
>> --TIRPC_PRIVATE {
>> --  global:
>> --    __libc_clntudp_bufcreate;
>> --  # private, but used by rpcbind:
>> --    __svc_clean_idle; svc_auth_none; libtirpc_set_debug;
>> --};
>> ---- /dev/null
>> -+++ b/src/libtirpc.map.in
>> -@@ -0,0 +1,303 @@
>> -+TIRPC_0.3.0 {
>> -+  global:
>> -+    # __*
>> -+    __rpc_createerr;
>> -+    __rpc_dtbsize;
>> -+    __rpc_endconf;
>> -+    __rpc_fd2sockinfo;
>> -+    __rpc_fixup_addr;
>> -+    __rpc_get_a_size;
>> -+    __rpc_get_local_uid;
>> -+    __rpc_get_t_size;
>> -+    __rpc_getconf;
>> -+    __rpc_getconfip;
>> -+    __rpc_nconf2fd;
>> -+    __rpc_nconf2fd_flags;
>> -+    __rpc_nconf2sockinfo;
>> -+    __rpc_rawcombuf;
>> -+    __rpc_seman2socktype;
>> -+    __rpc_setconf;
>> -+    __rpc_sockinfo2netid;
>> -+    __rpc_sockisbound;
>> -+    __rpc_socktype2seman;
>> -+    __rpc_taddr2uaddr_af;
>> -+    __rpc_uaddr2taddr_af;
>> -+    __rpcgettp;
>> -+
>> -+    # _*
>> -+    _authenticate;
>> -+    _get_next_token;
>> -+    _gss_authenticate;
>> -+    _null_auth;
>> -+    _rpc_dtablesize;
>> -+    _seterr_reply;
>> -+    _svcauth_none;
>> -+    _svcauth_short;
>> -+    _svcauth_unix;
>> -+
>> -+    # a*
>> -+    authdes_create;
>> -+    authdes_seccreate;
>> -+    authnone_create;
>> -+    authunix_create;
>> -+    authunix_create_default;
>> -+
>> -+    # b*
>> -+    bindresvport;
>> -+    bindresvport_sa;
>> -+
>> -+    # c*
>> -+    callrpc;
>> -+    clnt_broadcast;
>> -+    clnt_create;
>> -+    clnt_create_timed;
>> -+    clnt_create_vers;
>> -+    clnt_create_vers_timed;
>> -+    clnt_dg_create;
>> -+    clnt_pcreateerror;
>> -+    clnt_perrno;
>> -+    clnt_perror;
>> -+    clnt_raw_create;
>> -+    clnt_spcreateerror;
>> -+    clnt_sperrno;
>> -+    clnt_sperror;
>> -+    clnt_tli_create;
>> -+    clnt_tp_create;
>> -+    clnt_tp_create_timed;
>> -+    clnt_vc_create;
>> -+    clntraw_create;
>> -+    clnttcp_create;
>> -+    clntudp_bufcreate;
>> -+    clntudp_create;
>> -+    clntunix_create;
>> -+
>> -+    # e*
>> -+    endnetconfig;
>> -+    endnetpath;
>> -+
>> -+    # f*
>> -+    freenetconfigent;
>> -+
>> -+    # g*
>> -+    get_myaddress;
>> -+    getnetconfig;
>> -+    getnetconfigent;
>> -+    getnetpath;
>> -+    getrpcport;
>> -+
>> -+    # n*
>> -+    nc_perror;
>> -+    nc_sperror;
>> -+
>> -+    # p*
>> -+    pmap_getmaps;
>> -+    pmap_getport;
>> -+    pmap_rmtcall;
>> -+    pmap_set;
>> -+    pmap_unset;
>> -+
>> -+    # r*
>> -+    registerrpc;
>> -+    rpc_broadcast;
>> -+    rpc_broadcast_exp;
>> -+    rpc_call;
>> -+    rpc_control;
>> -+    rpc_createerr;
>> -+    rpc_nullproc;
>> -+    rpc_reg;
>> -+    rpcb_getaddr;
>> -+    rpcb_getmaps;
>> -+    rpcb_gettime;
>> -+    rpcb_rmtcall;
>> -+    rpcb_set;
>> -+    rpcb_taddr2uaddr;
>> -+    rpcb_uaddr2taddr;
>> -+    rpcb_unset;
>> -+
>> -+    # s*
>> -+    setnetconfig;
>> -+    setnetpath;
>> -+    svc_auth_reg;
>> -+    svc_create;
>> -+    svc_dg_create;
>> -+    svc_dg_enablecache;
>> -+    svc_exit;
>> -+    svc_fd_create;
>> -+    svc_fdset;
>> -+    svc_getreq;
>> -+    svc_getreq_common;
>> -+    svc_getreq_poll;
>> -+    svc_getreqset;
>> -+    svc_maxfd;
>> -+    svc_raw_create;
>> -+    svc_reg;
>> -+    svc_register;
>> -+    svc_run;
>> -+    svc_sendreply;
>> -+    svc_tli_create;
>> -+    svc_tp_create;
>> -+    svc_unreg;
>> -+    svc_unregister;
>> -+    svc_vc_create;
>> -+    svcerr_auth;
>> -+    svcerr_decode;
>> -+    svcerr_noproc;
>> -+    svcerr_noprog;
>> -+    svcerr_progvers;
>> -+    svcerr_systemerr;
>> -+    svcerr_weakauth;
>> -+    svcfd_create;
>> -+    svcraw_create;
>> -+    svctcp_create;
>> -+    svcudp_bufcreate;
>> -+    svcudp_create;
>> -+    svcunix_create;
>> -+    svcunixfd_create;
>> -+
>> -+    # t*
>> -+    taddr2uaddr;
>> -+
>> -+    # u*
>> -+    uaddr2taddr;
>> -+
>> -+    # x*
>> -+    xdr_accepted_reply;
>> -+    xdr_array;
>> -+    xdr_authunix_parms;
>> -+    xdr_bool;
>> -+    xdr_bytes;
>> -+    xdr_callhdr; xdr_callmsg;
>> -+    xdr_char;
>> -+    xdr_des_block;
>> -+    xdr_double;
>> -+    xdr_enum;
>> -+    xdr_float;
>> -+    xdr_free;
>> -+    xdr_hyper;
>> -+    xdr_int16_t;
>> -+    xdr_int32_t;
>> -+    xdr_int64_t;
>> -+    xdr_int8_t;
>> -+    xdr_int;
>> -+    xdr_long;
>> -+    xdr_longlong_t;
>> -+    xdr_netbuf;
>> -+    xdr_netobj;
>> -+    xdr_opaque;
>> -+    xdr_opaque_auth;
>> -+    xdr_pmap;
>> -+    xdr_pmaplist;
>> -+    xdr_pmaplist_ptr;
>> -+    xdr_pointer;
>> -+    xdr_quad_t;
>> -+    xdr_reference;
>> -+    xdr_rejected_reply;
>> -+    xdr_replymsg;
>> -+    xdr_rmtcall_args;
>> -+    xdr_rmtcallres;
>> -+    xdr_rpcb;
>> -+    xdr_rpcb_entry;
>> -+    xdr_rpcb_entry_list_ptr;
>> -+    xdr_rpcb_rmtcallargs;
>> -+    xdr_rpcb_rmtcallres;
>> -+    xdr_rpcb_stat;
>> -+    xdr_rpcb_stat_byvers;
>> -+    xdr_rpcblist;
>> -+    xdr_rpcblist_ptr;
>> -+    xdr_rpcbs_addrlist;
>> -+    xdr_rpcbs_addrlist_ptr;
>> -+    xdr_rpcbs_proc;
>> -+    xdr_rpcbs_rmtcalllist;
>> -+    xdr_rpcbs_rmtcalllist_ptr;
>> -+    xdr_short;
>> -+    xdr_string;
>> -+    xdr_u_char;
>> -+    xdr_u_hyper;
>> -+    xdr_u_int16_t;
>> -+    xdr_u_int32_t;
>> -+    xdr_u_int64_t;
>> -+    xdr_u_int8_t;
>> -+    xdr_u_int;
>> -+    xdr_u_long;
>> -+    xdr_u_longlong_t;
>> -+    xdr_u_quad_t;
>> -+    xdr_u_short;
>> -+    xdr_uint16_t;
>> -+    xdr_uint32_t;
>> -+    xdr_uint64_t;
>> -+    xdr_uint8_t;
>> -+    xdr_union;
>> -+    xdr_vector;
>> -+    xdr_void;
>> -+    xdr_wrapstring;
>> -+    xdrmem_create;
>> -+    xdrrec_create;
>> -+    xdrrec_endofrecord;
>> -+    xdrrec_eof;
>> -+    xdrrec_skiprecord;
>> -+    xdrstdio_create;
>> -+    xprt_register;
>> -+    xprt_unregister;
>> -+    # GSS-API symbols (conditionally included)
>> -+@GSS_SYMBOLS@
>> -+    # DES crypto symbols (conditionally included)
>> -+@DES_SYMBOLS@
>> -+    # RPC database symbols (conditionally included)
>> -+@RPCDB_SYMBOLS@
>> -+
>> -+  local:
>> -+    *;
>> -+};
>> -+
>> -+TIRPC_0.3.1 {
>> -+# GSS-API symbols (conditionally included)
>> -+@GSS_SYMBOLS_031@
>> -+} TIRPC_0.3.0;
>> -+
>> -+TIRPC_0.3.2 {
>> -+    getnetname;
>> -+    getpublicandprivatekey;
>> -+    getpublickey;
>> -+    host2netname;
>> -+    key_decryptsession;
>> -+    key_decryptsession_pk;
>> -+    key_encryptsession;
>> -+    key_encryptsession_pk;
>> -+    key_gendes;
>> -+    key_get_conv;
>> -+    key_setsecret;
>> -+    key_secretkey_is_set;
>> -+    key_setnet;
>> -+    netname2host;
>> -+    netname2user;
>> -+    rtime;
>> -+    user2netname;
>> -+    xdr_cryptkeyarg;
>> -+    xdr_cryptkeyarg2;
>> -+    xdr_cryptkeyres;
>> -+    xdr_getcredres;
>> -+    xdr_key_netstarg;
>> -+    xdr_key_netstres;
>> -+    xdr_keybuf;
>> -+    xdr_keystatus;
>> -+    xdr_netnamestr;
>> -+    xdr_unixcred;
>> -+} TIRPC_0.3.1;
>> -+
>> -+TIRPC_0.3.3 {
>> -+    __getpublickey_LOCAL;
>> -+    __key_decryptsession_pk_LOCAL;
>> -+    __key_encryptsession_pk_LOCAL;
>> -+    __key_gendes_LOCAL;
>> -+    xdr_sizeof;
>> -+    authdes_pk_create;
>> -+    svc_pollfd;
>> -+    svc_max_pollfd;
>> -+} TIRPC_0.3.2;
>> -+
>> -+TIRPC_PRIVATE {
>> -+  global:
>> -+    __libc_clntudp_bufcreate;
>> -+  # private, but used by rpcbind:
>> -+    __svc_clean_idle; svc_auth_none; libtirpc_set_debug;
>> -+};
>> diff --git a/meta/recipes-extended/libtirpc/libtirpc/0001-Update-declara=
tions-to-allow-compile-with-gcc-15.patch b/meta/recipes-extended/libtirpc/l=
ibtirpc/0001-Update-declarations-to-allow-compile-with-gcc-15.patch
>> deleted file mode 100644
>> index 7bfe7c2924..0000000000
>> --- a/meta/recipes-extended/libtirpc/libtirpc/0001-Update-declarations-t=
o-allow-compile-with-gcc-15.patch
>> +++ /dev/null
>> @@ -1,64 +0,0 @@
>> -From b526c0a90953f47d4cbf7ef01e9ac13e9e76904a Mon Sep 17 00:00:00 2001
>> -From: Rudi Heitbaum <rudi@heitbaum.com>
>> -Date: Thu, 12 Dec 2024 04:16:02 -0500
>> -Subject: [PATCH 1/2] Update declarations to allow compile with gcc-15
>> -
>> -This patch fixes some of the compile errors with gcc 15-20241117.
>> -
>> -In addition the follow declarations need to be fixed:
>> -  sed -n 75,77p libtirpc-1.3.6/src/key_call.c
>> -  cryptkeyres *(*__key_encryptsession_pk_LOCAL)() =3D 0;
>> -  cryptkeyres *(*__key_decryptsession_pk_LOCAL)() =3D 0;
>> -  des_block *(*__key_gendes_LOCAL)() =3D 0;
>> -
>> -Upstream-Status: Backport [https://git.linux-nfs.org/?p=3Dsteved/libtir=
pc.git;a=3Dcommit;h=3Dd473f1e1f6ba80bfaee4daa058da159305167323]
>> -Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
>> -Signed-off-by: Steve Dickson <steved@redhat.com>
>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ----
>> - src/auth_none.c     | 2 +-
>> - src/getpublickey.c  | 2 +-
>> - src/svc_auth_none.c | 4 ++--
>> - 3 files changed, 4 insertions(+), 4 deletions(-)
>> -
>> -diff --git a/src/auth_none.c b/src/auth_none.c
>> -index 0b0bbd1..aca6e71 100644
>> ---- a/src/auth_none.c
>> -+++ b/src/auth_none.c
>> -@@ -62,7 +62,7 @@ static bool_t authnone_validate (AUTH *, struct opaqu=
e_auth *);
>> - static bool_t authnone_refresh (AUTH *, void *);
>> - static void authnone_destroy (AUTH *);
>> -
>> --extern bool_t xdr_opaque_auth();
>> -+extern bool_t xdr_opaque_auth(XDR *, struct opaque_auth *);
>> -
>> - static struct auth_ops *authnone_ops();
>> -
>> -diff --git a/src/getpublickey.c b/src/getpublickey.c
>> -index be37a24..4e96c7c 100644
>> ---- a/src/getpublickey.c
>> -+++ b/src/getpublickey.c
>> -@@ -52,7 +52,7 @@
>> - /*
>> -  * Hack to let ypserv/rpc.nisd use AUTH_DES.
>> -  */
>> --int (*__getpublickey_LOCAL)() =3D 0;
>> -+int (*__getpublickey_LOCAL)(const char *, char *) =3D 0;
>> -
>> - /*
>> -  * Get somebody's public key
>> -diff --git a/src/svc_auth_none.c b/src/svc_auth_none.c
>> -index 887e809..5ca98e9 100644
>> ---- a/src/svc_auth_none.c
>> -+++ b/src/svc_auth_none.c
>> -@@ -37,8 +37,8 @@
>> -
>> - #include <rpc/rpc.h>
>> -
>> --static bool_t svcauth_none_destroy();
>> --static bool_t   svcauth_none_wrap();
>> -+static bool_t svcauth_none_destroy(SVCAUTH *);
>> -+static bool_t   svcauth_none_wrap(SVCAUTH *, XDR *, bool_t (*)(XDR *, =
...), char *);
>> -
>> - struct svc_auth_ops svc_auth_none_ops =3D {
>> -       svcauth_none_wrap,
>> diff --git a/meta/recipes-extended/libtirpc/libtirpc/0002-update-signal-=
and-key_call-declarations-to-allow-com.patch b/meta/recipes-extended/libtir=
pc/libtirpc/0002-update-signal-and-key_call-declarations-to-allow-com.patch
>> deleted file mode 100644
>> index 83e2105a1a..0000000000
>> --- a/meta/recipes-extended/libtirpc/libtirpc/0002-update-signal-and-key=
_call-declarations-to-allow-com.patch
>> +++ /dev/null
>> @@ -1,60 +0,0 @@
>> -From 55452e6ae71869880f8c85d5dba9aa24d7147d8b Mon Sep 17 00:00:00 2001
>> -From: Rudi Heitbaum <rudi@heitbaum.com>
>> -Date: Thu, 2 Jan 2025 08:46:24 -0500
>> -Subject: [PATCH 2/2] update signal and key_call declarations to allow c=
ompile
>> - with gcc-15
>> -
>> -Follow up patch addressing the following declarations:
>> -  sed -n 75,77p libtirpc-1.3.6/src/key_call.c
>> -  cryptkeyres *(*__key_encryptsession_pk_LOCAL)() =3D 0;
>> -  cryptkeyres *(*__key_decryptsession_pk_LOCAL)() =3D 0;
>> -  des_block *(*__key_gendes_LOCAL)() =3D 0;
>> -
>> -Upstream-Status: Backport [https://git.linux-nfs.org/?p=3Dsteved/libtir=
pc.git;a=3Dcommit;h=3D240ee6c774729c9c24812aa8912f1fcf8996b162]
>> -Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
>> -Signed-off-by: Steve Dickson <steved@redhat.com>
>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ----
>> - src/auth_time.c | 4 ++--
>> - src/key_call.c  | 6 +++---
>> - 2 files changed, 5 insertions(+), 5 deletions(-)
>> -
>> -diff --git a/src/auth_time.c b/src/auth_time.c
>> -index 936dd76..c21b1df 100644
>> ---- a/src/auth_time.c
>> -+++ b/src/auth_time.c
>> -@@ -248,7 +248,7 @@ __rpc_get_time_offset(td, srv, thost, uaddr, netid)
>> -       char                    ut[64], ipuaddr[64];
>> -       endpoint                teps[32];
>> -       nis_server              tsrv;
>> --      void                    (*oldsig)() =3D NULL; /* old alarm handl=
er */
>> -+      void                    (*oldsig)(int) =3D NULL; /* old alarm ha=
ndler */
>> -       struct sockaddr_in      sin;
>> -       int                     s =3D RPC_ANYSOCK;
>> -       socklen_t len;
>> -@@ -417,7 +417,7 @@ __rpc_get_time_offset(td, srv, thost, uaddr, netid)
>> -               } else {
>> -                       int res;
>> -
>> --                      oldsig =3D (void (*)())signal(SIGALRM, alarm_hnd=
ler);
>> -+                      oldsig =3D (void (*)(int))signal(SIGALRM, alarm_=
hndler);
>> -                       saw_alarm =3D 0; /* global tracking the alarm */
>> -                       alarm(20); /* only wait 20 seconds */
>> -                       res =3D connect(s, (struct sockaddr *)&sin, size=
of(sin));
>> -diff --git a/src/key_call.c b/src/key_call.c
>> -index 9f4b1d2..43f990e 100644
>> ---- a/src/key_call.c
>> -+++ b/src/key_call.c
>> -@@ -72,9 +72,9 @@
>> -  * implementations of these functions, and to call those in key_call()=
.
>> -  */
>> -
>> --cryptkeyres *(*__key_encryptsession_pk_LOCAL)() =3D 0;
>> --cryptkeyres *(*__key_decryptsession_pk_LOCAL)() =3D 0;
>> --des_block *(*__key_gendes_LOCAL)() =3D 0;
>> -+cryptkeyres *(*__key_encryptsession_pk_LOCAL)(uid_t, char *) =3D 0;
>> -+cryptkeyres *(*__key_decryptsession_pk_LOCAL)(uid_t, char *) =3D 0;
>> -+des_block *(*__key_gendes_LOCAL)(uid_t, char *) =3D 0;
>> -
>> - static int key_call( u_long, xdrproc_t, void *, xdrproc_t, void *);
>> -
>> diff --git a/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb b/meta/rec=
ipes-extended/libtirpc/libtirpc_1.3.7.bb
>> similarity index 78%
>> rename from meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb
>> rename to meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb
>> index c6901839c1..edc75a8366 100644
>> --- a/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb
>> +++ b/meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb
>> @@ -10,13 +10,10 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df835cce88=
52481e4b2bbbdd23b5e47f3 \
>>  PROVIDES =3D "virtual/librpc"
>>
>>  SRC_URI =3D "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.bz2 \
>> -           file://0001-Update-declarations-to-allow-compile-with-gcc-15=
.patch \
>> -           file://0002-update-signal-and-key_call-declarations-to-allow=
-com.patch \
>> -           file://0001-Add-conditional-version-script-support.patch \
>>            "
>>  UPSTREAM_CHECK_URI =3D "https://sourceforge.net/projects/libtirpc/files=
/libtirpc/"
>>  UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)/"
>> -SRC_URI[sha256sum] =3D "bbd26a8f0df5690a62a47f6aa30f797f3ef8d02560d1bc4=
49a83066b5a1d3508"
>> +SRC_URI[sha256sum] =3D "b47d3ac19d3549e54a05d0019a6c400674da716123858cf=
db6d3bdd70a66c702"
>>
>>  inherit autotools pkgconfig
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#226890): https://lists.openembedded.org/g/openembedd=
ed-core/message/226890
>> Mute This Topic: https://lists.openembedded.org/mt/116510360/1997914
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [r=
aj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

