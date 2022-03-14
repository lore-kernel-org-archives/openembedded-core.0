Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D527BC433EF
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 19:10:19 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web12.778.1647285018102706664
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 12:10:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=ddt5LzEY;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1647285018;
  x=1678821018;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=skwX6OdO0irTs9g6juHwTzV2BihEgKVba26JSNhKrg4=;
  b=ddt5LzEYCH3aauvxt0G0Bzzv1IcdO8ZWVCBLesG0up7qzZXvPKD2h9TW
   PA8z7P808+gkQwV78ONFOJf9yakVpRq0XK6Q3j8uYEaL0AEU0Ym6BLG7D
   ANZGVpB28Po8OEavk6ZqmBJz5lW3wjSEFk2dHWZC7dQ0uC5NC9mvorCIY
   DkqjsydXrYZE6O0piyNWRdOa0o6a9AgD5dwDH0ppsp3d37EWTr5/wFJca
   wXgfSeAcCYQ0Nt/VXKDecOnU1pkKS4S0d+nIEmr7G3CV3sEoHa5CgkPxm
   w8pksG+z3ULIAf+foJ6WeBRZa3C4QUBY3TGjQfp+vV+s4oNKQ0/zmzLKQ
   g==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 2/2] shadow-native: Simplify and fix syslog
 disable patch
Thread-Topic: [OE-core] [PATCH 2/2] shadow-native: Simplify and fix syslog
 disable patch
Thread-Index: AQHYN80Ir1ZTtyvQUkKJoXFHb8xk26y/PRXg
Date: Mon, 14 Mar 2022 19:10:13 +0000
Message-ID: <c886e8beebb74603a78b97bc68b026b4@axis.com>
References: <20220314175732.827665-1-richard.purdie@linuxfoundation.org>
 <20220314175732.827665-2-richard.purdie@linuxfoundation.org>
In-Reply-To: <20220314175732.827665-2-richard.purdie@linuxfoundation.org>
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
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 19:10:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163164

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Richard Purdie
> Sent: den 14 mars 2022 18:58
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 2/2] shadow-native: Simplify and fix syslog dis=
able patch
>=20
> Shadow is happily spamming the host syslog with messages and shouldn't be
> which suggests the patch isn't working. Redo it to work at the configure
> level which is simpler and hopefully more effective.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  ...01-Disable-use-of-syslog-for-sysroot.patch | 122 ++----------------
>  1 file changed, 13 insertions(+), 109 deletions(-)
>=20
> diff --git a/meta/recipes-extended/shadow/files/0001-Disable-use-of-syslo=
g-for-sysroot.patch b/meta/recipes-extended/shadow/files/0001-Disable-use-o=
f-syslog-for-sysroot.patch
> index 4d6f6d68ec2..23640824f14 100644
> --- a/meta/recipes-extended/shadow/files/0001-Disable-use-of-syslog-for-s=
ysroot.patch
> +++ b/meta/recipes-extended/shadow/files/0001-Disable-use-of-syslog-for-s=
ysroot.patch
> @@ -13,112 +13,16 @@ Signed-off-by: Scott Garman <scott.a.garman@intel.co=
m>
>  Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
>  Signed-off-by: Chen Qi <Qi.Chen@windriver.com>

Since this is a completely new patch you should replace the=20
Signed-off-by's above as they obviously no longer apply.

>=20
> ----
> - src/groupadd.c  | 3 +++
> - src/groupdel.c  | 3 +++
> - src/groupmems.c | 3 +++
> - src/groupmod.c  | 3 +++
> - src/useradd.c   | 3 +++
> - src/userdel.c   | 4 ++++
> - src/usermod.c   | 3 +++
> - 7 files changed, 22 insertions(+)
> -
> -diff --git a/src/groupadd.c b/src/groupadd.c
> -index 66ccb53..776ea51 100644
> ---- a/src/groupadd.c
> -+++ b/src/groupadd.c
> -@@ -11,6 +11,9 @@
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
> -index c84faa7..1076f4b 100644
> ---- a/src/groupdel.c
> -+++ b/src/groupdel.c
> -@@ -11,6 +11,9 @@
> -
> - #ident "$Id$"
> -
> -+/* Disable use of syslog since we're running this command against a sys=
root */
> -+#undef USE_SYSLOG
> -+
> - #include <ctype.h>
> - #include <fcntl.h>
> - #include <grp.h>
> -diff --git a/src/groupmems.c b/src/groupmems.c
> -index a0e3266..6540cb1 100644
> ---- a/src/groupmems.c
> -+++ b/src/groupmems.c
> -@@ -9,6 +9,9 @@
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
> -index 006eca1..78b1ad6 100644
> ---- a/src/groupmod.c
> -+++ b/src/groupmod.c
> -@@ -11,6 +11,9 @@
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
> -index 456b9de..2b0d703 100644
> ---- a/src/useradd.c
> -+++ b/src/useradd.c
> -@@ -11,6 +11,9 @@
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
> -index 7012b0e..08bb5d1 100644
> ---- a/src/userdel.c
> -+++ b/src/userdel.c
> -@@ -8,6 +8,10 @@
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
> -index 9473a7d..7d4f7b5 100644
> ---- a/src/usermod.c
> -+++ b/src/usermod.c
> -@@ -11,6 +11,9 @@
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
> +Index: shadow-4.11.1/configure.ac
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- shadow-4.11.1.orig/configure.ac
> ++++ shadow-4.11.1/configure.ac
> +@@ -204,7 +204,7 @@ AC_DEFINE_UNQUOTED(PASSWD_PROGRAM, "$sha
> + 	[Path to passwd program.])
> +
> + dnl XXX - quick hack, should disappear before anyone notices :).
> +-AC_DEFINE(USE_SYSLOG, 1, [Define to use syslog().])
> ++AC_DEFINE(USE_SYSLOG, 0, [Define to use syslog().])
> + if test "$ac_cv_func_ruserok" =3D "yes"; then
> + 	AC_DEFINE(RLOGIN, 1, [Define if login should support the -r flag for r=
logind.])
> + 	AC_DEFINE(RUSEROK, 0, [Define to the ruserok() "success" return value =
(0 or 1).])
> --
> 2.32.0

//Peter


