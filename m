Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6117C433F5
	for <webhook@archiver.kernel.org>; Fri, 10 Dec 2021 14:22:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.7782.1639146168651730239
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 06:22:48 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3F61E13A1
	for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 06:22:48 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DED9A3F5A1
	for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 06:22:47 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 03/10] pkgconfig: remove obsolete support for renamed
 libtool
Date: Fri, 10 Dec 2021 14:22:35 +0000
Message-Id: <20211210142242.2698587-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211210142242.2698587-1-ross.burton@arm.com>
References: <20211210142242.2698587-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Dec 2021 14:22:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159528

libtool is now longer renamed to ${host}-libtool, so remove the changes
to support this.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../fix-glib-configure-libtool-usage.patch    | 45 -------------------
 .../pkgconfig/pkgconfig_git.bb                |  1 -
 2 files changed, 46 deletions(-)
 delete mode 100644 meta/recipes-devtools/pkgconfig/pkgconfig/fix-glib-co=
nfigure-libtool-usage.patch

diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig/fix-glib-configure=
-libtool-usage.patch b/meta/recipes-devtools/pkgconfig/pkgconfig/fix-glib=
-configure-libtool-usage.patch
deleted file mode 100644
index 01c62472c1d..00000000000
--- a/meta/recipes-devtools/pkgconfig/pkgconfig/fix-glib-configure-libtoo=
l-usage.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
-
-
-Index: pkg-config-0.28/glib/configure.ac
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- pkg-config-0.28.orig/glib/configure.ac
-+++ pkg-config-0.28/glib/configure.ac
-@@ -1438,7 +1438,7 @@ if test x"$glib_native_win32" =3D xyes; th
-   G_MODULE_LDFLAGS=3D
- else
-   export SED
--  G_MODULE_LDFLAGS=3D`(./libtool --config; echo eval echo \\$export_dyn=
amic_flag_spec) | sh`
-+  G_MODULE_LDFLAGS=3D`(./${host_alias}-libtool --config; echo eval echo=
 \\$export_dynamic_flag_spec) | sh`
- fi
- dnl G_MODULE_IMPL=3D don't reset, so cmd-line can override
- G_MODULE_NEED_USCORE=3D0
-@@ -1503,13 +1503,13 @@ if test "$G_MODULE_IMPL" =3D "G_MODULE_IMP
- 	LDFLAGS=3D"$LDFLAGS $G_MODULE_LDFLAGS"
- dnl *** check for OSF1/5.0 RTLD_GLOBAL brokenness
- 	echo "void glib_plugin_test(void) { }" > plugin.c
--	${SHELL} ./libtool --mode=3Dcompile --tag=3DCC ${CC} ${CFLAGS} \
-+	${SHELL} ./${host_alias}-libtool --mode=3Dcompile --tag=3DCC ${CC} ${C=
FLAGS} \
- 		${CPPFLAGS} -c -o plugin.lo plugin.c >/dev/null 2>&1
--	${SHELL} ./libtool --mode=3Dlink --tag=3DCC ${CC} ${CFLAGS} \
-+	${SHELL} ./${host_alias}-libtool --mode=3Dlink --tag=3DCC ${CC} ${CFLA=
GS} \
- 		${LDFLAGS} -module -o plugin.la -export-dynamic \
- 		-shrext ".o" -avoid-version plugin.lo \
- 		-rpath /dont/care >/dev/null 2>&1
--	eval `./libtool --config | grep ^objdir`
-+	eval `./${host_alias}-libtool --config | grep ^objdir`
- 	AC_CACHE_CHECK([for RTLD_GLOBAL brokenness],
- 		glib_cv_rtldglobal_broken,[
- 		AC_TRY_RUN([
-@@ -1582,7 +1582,7 @@ fi
-=20
- AC_MSG_CHECKING(for the suffix of module shared libraries)
- export SED
--shrext_cmds=3D`./libtool --config | grep '^shrext_cmds=3D'`
-+shrext_cmds=3D`./${host_alias}-libtool --config | grep '^shrext_cmds=3D=
'`
- eval $shrext_cmds
- module=3Dyes eval std_shrext=3D$shrext_cmds
- # chop the initial dot
diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb b/meta/reci=
pes-devtools/pkgconfig/pkgconfig_git.bb
index c220bafd905..16efcef5613 100644
--- a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
@@ -14,7 +14,6 @@ PV =3D "0.29.2+git${SRCPV}"
 SRC_URI =3D "git://gitlab.freedesktop.org/pkg-config/pkg-config.git;bran=
ch=3Dmaster;protocol=3Dhttps \
            file://pkg-config-esdk.in \
            file://pkg-config-native.in \
-           file://fix-glib-configure-libtool-usage.patch \
            file://0001-glib-gettext.m4-Update-AM_GLIB_GNU_GETTEXT-to-mat=
ch-.patch \
            file://0001-autotools-remove-support-for-the-__int64-type.-Se=
e-1.patch \
            file://0001-autotools-use-C99-printf-format-specifiers-on-Win=
dow.patch \
--=20
2.25.1


