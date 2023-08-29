Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6B30C83F16
	for <webhook@archiver.kernel.org>; Tue, 29 Aug 2023 12:09:29 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.15733.1693310966723914060
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Aug 2023 05:09:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B67C9FEC;
	Tue, 29 Aug 2023 05:10:05 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CF61E3F64C;
	Tue, 29 Aug 2023 05:09:25 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 2/3] inetutils: don't guess target paths
Date: Tue, 29 Aug 2023 13:09:22 +0100
Message-Id: <20230829120923.3982702-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230829120923.3982702-1-ross.burton@arm.com>
References: <20230829120923.3982702-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Aug 2023 12:09:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186858

From: Ross Burton <ross.burton@arm.com>

inetutils guesses a lot of target paths in cross builds, and warns that
some of them are known to be wrong (for example, whether /proc/net/dev
exists is guessed as 'no').

Add a post-configure function to check for these warnings, and pass
--with-path-* as appropriate to set the paths explicitly.

This means we can remove the patch which was setting PATH_PROCNET_DEV,
and the autoconf cache value inetutils_cv_path_login.

The downside is that these --with-path-* options are not real autoconf
options, so the "unknown options" warning is emitted.  Losing those is
an acceptable compromise, so disable it.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../inetutils-1.9-PATH_PROCNET_DEV.patch      | 37 -------------------
 .../inetutils/inetutils_2.4.bb                | 18 ++++++++-
 2 files changed, 16 insertions(+), 39 deletions(-)
 delete mode 100644 meta/recipes-connectivity/inetutils/inetutils/inetuti=
ls-1.9-PATH_PROCNET_DEV.patch

diff --git a/meta/recipes-connectivity/inetutils/inetutils/inetutils-1.9-=
PATH_PROCNET_DEV.patch b/meta/recipes-connectivity/inetutils/inetutils/in=
etutils-1.9-PATH_PROCNET_DEV.patch
deleted file mode 100644
index 460ddf98300..00000000000
--- a/meta/recipes-connectivity/inetutils/inetutils/inetutils-1.9-PATH_PR=
OCNET_DEV.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 101130f422dd5c01a1459645d7b2a5b8d19720ab Mon Sep 17 00:00:00 2001
-From: Martin Jansa <martin.jansa@gmail.com>
-Date: Wed, 6 Mar 2019 09:36:11 -0500
-Subject: [PATCH] inetutils: define PATH_PROCNET_DEV if not already defin=
ed
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-this prevents the following compilation error :
-system/linux.c:401:15: error: 'PATH_PROCNET_DEV' undeclared (first use i=
n this function)
-
-this patch comes from :
- http://repository.timesys.com/buildsources/i/inetutils/inetutils-1.9/
-
-Upstream-Status: Inappropriate [not author]
-
-Signed-of-by: Eric B=C3=A9nard <eric@eukrea.com>
-
----
- ifconfig/system/linux.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/ifconfig/system/linux.c b/ifconfig/system/linux.c
-index e453b46..4268ca9 100644
---- a/ifconfig/system/linux.c
-+++ b/ifconfig/system/linux.c
-@@ -53,6 +53,10 @@
- #include "../ifconfig.h"
- =0C
-=20
-+#ifndef PATH_PROCNET_DEV
-+  #define PATH_PROCNET_DEV "/proc/net/dev"
-+#endif
-+
- /* ARPHRD stuff.  */
-=20
- static void
diff --git a/meta/recipes-connectivity/inetutils/inetutils_2.4.bb b/meta/=
recipes-connectivity/inetutils/inetutils_2.4.bb
index 9b4c98d63cc..16e40cc20f8 100644
--- a/meta/recipes-connectivity/inetutils/inetutils_2.4.bb
+++ b/meta/recipes-connectivity/inetutils/inetutils_2.4.bb
@@ -20,7 +20,6 @@ SRC_URI =3D "${GNU_MIRROR}/inetutils/inetutils-${PV}.ta=
r.xz \
            file://rsh.xinetd.inetutils \
            file://telnet.xinetd.inetutils \
            file://tftpd.xinetd.inetutils \
-           file://inetutils-1.9-PATH_PROCNET_DEV.patch \
            file://inetutils-only-check-pam_appl.h-when-pam-enabled.patch=
 \
            file://0001-ftpd-rcp-rlogin-rsh-rshd-uucpd-fix-check-set-id-r=
etu.patch \
 "
@@ -42,15 +41,30 @@ PACKAGECONFIG[ipv6] =3D "--enable-ipv6,--disable-ipv6=
 gl_cv_socket_ipv6=3Dno,"
 PACKAGECONFIG[ping6] =3D "--enable-ping6,--disable-ping6,"
=20
 EXTRA_OECONF =3D "--with-ncurses-include-dir=3D${STAGING_INCDIR} \
-        inetutils_cv_path_login=3D${base_bindir}/login \
         --with-libreadline-prefix=3D${STAGING_LIBDIR} \
         --enable-rpath=3Dno \
 "
=20
+EXTRA_OECONF +=3D "--with-path-login=3D${base_bindir}/login \
+                 --with-path-cp=3D${base_bindir}/cp \
+                 --with-path-uucico=3D${libexecdir}/uuico \
+                 --with-path-procnet-dev=3D/proc/net/dev"
+
 # These are horrible for security, disable them
 EXTRA_OECONF:append =3D " --disable-rsh --disable-rshd --disable-rcp \
         --disable-rlogin --disable-rlogind --disable-rexec --disable-rex=
ecd"
=20
+# The configure script guesses many paths in cross builds, check for thi=
s happening
+do_configure_cross_check() {
+    if grep "may be incorrect because of cross-compilation" ${B}/config.=
log; then
+        bberror Default path values used, these must be set explicitly
+    fi
+}
+do_configure[postfuncs] +=3D "do_configure_cross_check"
+
+# The --with-path options are not actually options, so this check needs =
to be silenced
+ERROR_QA:remove =3D "unknown-configure-option"
+
 do_configure:prepend () {
     export HELP2MAN=3D'true'
     cp ${STAGING_DATADIR_NATIVE}/gettext/config.rpath ${S}/build-aux/con=
fig.rpath
--=20
2.34.1


