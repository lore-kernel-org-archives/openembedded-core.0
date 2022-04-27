Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 408C1C433EF
	for <webhook@archiver.kernel.org>; Wed, 27 Apr 2022 10:22:18 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web08.6536.1651054934626434522
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Apr 2022 03:22:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=QI4X/vfW;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1651054935;
  x=1682590935;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=/q8DC2vE+UKl7NfG2kfSfFm1J0dqPHdDEleuaY1oG/s=;
  b=QI4X/vfWZu8P9GMLDGa2U3FeGQ2sRfy9VAXh46/GZbLt8KjXNw1Y8HyT
   Zd5bWsvEbm/DhTpUndLy6x8ex/evFUuYYHAQrur9Pac0BNx63miH8zoq0
   MwrMIC276zFQ9nxJBUzRjF4wS+WYKTol0jMzHlrk8R0HwgZvYpQdf8trE
   h+Jah2ib7F/IfCM7TVvrPjZexYFLJ9L3IgUE+n3w0HlMXZjTcArk7AOHT
   YYKKkXc4jSIMsIHodFv7dl5ajtaoujSPaszovvhjxm2BDf5EnmgkOuPi7
   2m9h8eyXbYHWgTnpCxlgsf8v864C4MvDoQOem87Gj8HMgFm8X6vBhj+xb
   g==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "Mittal, Anuj" <anuj.mittal@intel.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [honister][PATCH] shadow-native: Simplify and fix
 syslog disable patch
Thread-Topic: [OE-core] [honister][PATCH] shadow-native: Simplify and fix
 syslog disable patch
Thread-Index: AQHYVK1vhfOjVfl5f0K1KhHdenyiJa0Dlz7Q
Date: Wed, 27 Apr 2022 10:22:11 +0000
Message-ID: <1eefdd7ea82d4034bcf93d91cd522432@axis.com>
References: <16E798B084E3B979.23874@lists.openembedded.org>
In-Reply-To: <16E798B084E3B979.23874@lists.openembedded.org>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Apr 2022 10:22:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164910

*ping*

//Peter

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Peter Kjellerstedt
> Sent: den 20 april 2022 13:54
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [honister][PATCH] shadow-native: Simplify and fix sysl=
og disable patch
>=20
> From: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> Shadow is happily spamming the host syslog with messages and shouldn't be
> which suggests the patch isn't working. Redo it to work at the configure
> level which is simpler and hopefully more effective.
>=20
> This is a squashed cherry-pick of commit 8f181686 (shadow-native:
> Simplify and fix syslog disable patch) and commit e1f21d0d (shadow:
> Disable the use of syslog() for the native tools).
>=20
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  ...01-Disable-use-of-syslog-for-sysroot.patch | 150 +++++-------------
>  1 file changed, 39 insertions(+), 111 deletions(-)
>=20
> diff --git a/meta/recipes-extended/shadow/files/0001-Disable-use-of-syslo=
g-for-sysroot.patch b/meta/recipes-extended/shadow/files/0001-Disable-use-o=
f-syslog-for-sysroot.patch
> index 95728bcd3f..628db42136 100644
> --- a/meta/recipes-extended/shadow/files/0001-Disable-use-of-syslog-for-s=
ysroot.patch
> +++ b/meta/recipes-extended/shadow/files/0001-Disable-use-of-syslog-for-s=
ysroot.patch
> @@ -1,124 +1,52 @@
> -From 30a3906a0a21120fa6bbc918b6258ab9303fbeaa Mon Sep 17 00:00:00 2001
> -From: Scott Garman <scott.a.garman@intel.com>
> -Date: Thu, 14 Apr 2016 12:28:57 +0200
> -Subject: [PATCH] Disable use of syslog for sysroot
> +From 8b845fff891798a03bdf21354b52e4487c2c0200 Mon Sep 17 00:00:00 2001
> +From: Richard Purdie <richard.purdie@linuxfoundation.org>
> +Date: Thu, 14 Apr 2022 23:11:53 +0000
> +Subject: [PATCH] Disable use of syslog for shadow-native tools
>=20
>  Disable use of syslog to prevent sysroot user and group additions from
>  writing entries to the host's syslog. This patch should only be used
>  with the shadow-native recipe.
>=20
> -Upstream-Status: Inappropriate [disable feature]
> -
> -Signed-off-by: Scott Garman <scott.a.garman@intel.com>
> +Upstream-Status: Inappropriate [OE specific configuration]
> +Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>  Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> -Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>=20
>  ---
> - src/groupadd.c  | 3 +++
> - src/groupdel.c  | 3 +++
> - src/groupmems.c | 3 +++
> - src/groupmod.c  | 3 +++
> - src/useradd.c   | 3 +++
> - src/userdel.c   | 4 ++++
> - src/usermod.c   | 3 +++
> - 7 files changed, 22 insertions(+)
> + configure.ac      | 2 +-
> + src/login_nopam.c | 3 ++-
> + 2 files changed, 3 insertions(+), 2 deletions(-)
>=20
> -diff --git a/src/groupadd.c b/src/groupadd.c
> -index d7f68b1..5fe5f43 100644
> ---- a/src/groupadd.c
> -+++ b/src/groupadd.c
> -@@ -34,6 +34,9 @@
> -
> - #ident "$Id$"
> -
> -+/* Disable use of syslog since we're running this command against a sys=
root */
> -+#undef USE_SYSLOG
> -+
> - #include <ctype.h>
> - #include <fcntl.h>
> - #include <getopt.h>
> -diff --git a/src/groupdel.c b/src/groupdel.c
> -index 5c89312..2aefc5a 100644
> ---- a/src/groupdel.c
> -+++ b/src/groupdel.c
> -@@ -34,6 +34,9 @@
> -
> +diff --git a/configure.ac b/configure.ac
> +index 5dcae19..b2c58f5 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -204,7 +204,7 @@ AC_DEFINE_UNQUOTED(PASSWD_PROGRAM, "$shadow_cv_passw=
d_dir/passwd",
> + 	[Path to passwd program.])
> +
> + dnl XXX - quick hack, should disappear before anyone notices :).
> +-AC_DEFINE(USE_SYSLOG, 1, [Define to use syslog().])
> ++#AC_DEFINE(USE_SYSLOG, 1, [Define to use syslog().])
> + if test "$ac_cv_func_ruserok" =3D "yes"; then
> + 	AC_DEFINE(RLOGIN, 1, [Define if login should support the -r flag for r=
logind.])
> + 	AC_DEFINE(RUSEROK, 0, [Define to the ruserok() "success" return value =
(0 or 1).])
> +diff --git a/src/login_nopam.c b/src/login_nopam.c
> +index df6ba88..fc24e13 100644
> +--- a/src/login_nopam.c
> ++++ b/src/login_nopam.c
> +@@ -29,7 +29,6 @@
> + #ifndef USE_PAM
>   #ident "$Id$"
>=20
> -+/* Disable use of syslog since we're running this command against a sys=
root */
> -+#undef USE_SYSLOG
> -+
> - #include <ctype.h>
> - #include <fcntl.h>
> - #include <grp.h>
> -diff --git a/src/groupmems.c b/src/groupmems.c
> -index 654a8f3..6b2026b 100644
> ---- a/src/groupmems.c
> -+++ b/src/groupmems.c
> -@@ -32,6 +32,9 @@
> -
> - #include <config.h>
> -
> -+/* Disable use of syslog since we're running this command against a sys=
root */
> -+#undef USE_SYSLOG
> -+
> - #include <fcntl.h>
> - #include <getopt.h>
> - #include <grp.h>
> -diff --git a/src/groupmod.c b/src/groupmod.c
> -index acd6f35..a2c5247 100644
> ---- a/src/groupmod.c
> -+++ b/src/groupmod.c
> -@@ -34,6 +34,9 @@
> -
> - #ident "$Id$"
> -
> -+/* Disable use of syslog since we're running this command against a sys=
root */
> -+#undef USE_SYSLOG
> -+
> - #include <ctype.h>
> - #include <fcntl.h>
> - #include <getopt.h>
> -diff --git a/src/useradd.c b/src/useradd.c
> -index 127177e..b80e505 100644
> ---- a/src/useradd.c
> -+++ b/src/useradd.c
> -@@ -34,6 +34,9 @@
> -
> - #ident "$Id$"
> -
> -+/* Disable use of syslog since we're running this command against a sys=
root */
> -+#undef USE_SYSLOG
> -+
> - #include <assert.h>
> - #include <ctype.h>
> - #include <errno.h>
> -diff --git a/src/userdel.c b/src/userdel.c
> -index 79a7c89..c1e010a 100644
> ---- a/src/userdel.c
> -+++ b/src/userdel.c
> -@@ -31,6 +31,10 @@
> -  */
> -
> - #include <config.h>
> -+
> -+/* Disable use of syslog since we're running this command against a sys=
root */
> -+#undef USE_SYSLOG
> -+
> - #include <assert.h>
> - #include <dirent.h>
> - #include <errno.h>
> -diff --git a/src/usermod.c b/src/usermod.c
> -index 03bb9b9..e15fdd4 100644
> ---- a/src/usermod.c
> -+++ b/src/usermod.c
> -@@ -34,6 +34,9 @@
> -
> - #ident "$Id$"
> +-#include "prototypes.h"
> +     /*
> +      * This module implements a simple but effective form of login acce=
ss
> +      * control based on login names and on host (or domain) names, inte=
rnet
> +@@ -57,6 +56,8 @@
> + #include <netinet/in.h>
> + #include <arpa/inet.h>		/* for inet_ntoa() */
>=20
> -+/* Disable use of syslog since we're running this command against a sys=
root */
> -+#undef USE_SYSLOG
> ++#include "prototypes.h"
>  +
> - #include <assert.h>
> - #include <ctype.h>
> - #include <errno.h>
> + #if !defined(MAXHOSTNAMELEN) || (MAXHOSTNAMELEN < 64)
> + #undef MAXHOSTNAMELEN
> + #define MAXHOSTNAMELEN 256

