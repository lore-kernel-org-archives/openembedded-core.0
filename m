Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QZJIX-00030P-B4
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 11:00:33 +0200
Received: by wwg12 with SMTP id 12so502533wwg.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2011 01:56:59 -0700 (PDT)
Received: by 10.216.59.16 with SMTP id r16mr454517wec.25.1308732624130;
	Wed, 22 Jun 2011 01:50:24 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id d7sm165269wek.45.2011.06.22.01.50.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 22 Jun 2011 01:50:23 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1308558297-1939-1-git-send-email-koen@dominion.thruhere.net>
Date: Wed, 22 Jun 2011 10:50:17 +0200
Message-Id: <119CAE38-0BAA-4803-B214-A263BAF3EAC3@dominion.thruhere.net>
References: <1308558297-1939-1-git-send-email-koen@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH] glib-2.0 2.28.x: update to 2.28.8
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Jun 2011 09:00:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

This fixes the mkenum problem people keep reporting, so can this go in =
before Saul gets back from his holiday?

Op 20 jun 2011, om 10:24 heeft Koen Kooi het volgende geschreven:

> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
> ...003-gatomic-proper-pointer-get-cast.patch.patch |   28 =
++++++++++++++++++++
> .../0005-glib-mkenums-interpreter.patch.patch      |   25 =
+++++++++++++++++
> meta/recipes-core/glib-2.0/glib-2.0_2.28.6.bb      |   18 ------------
> meta/recipes-core/glib-2.0/glib-2.0_2.28.8.bb      |   22 =
+++++++++++++++
> meta/recipes-core/glib-2.0/glib.inc                |    3 +-
> 5 files changed, 77 insertions(+), 19 deletions(-)
> create mode 100644 =
meta/recipes-core/glib-2.0/glib-2.0/0003-gatomic-proper-pointer-get-cast.p=
atch.patch
> create mode 100644 =
meta/recipes-core/glib-2.0/glib-2.0/0005-glib-mkenums-interpreter.patch.pa=
tch
> delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0_2.28.6.bb
> create mode 100644 meta/recipes-core/glib-2.0/glib-2.0_2.28.8.bb
>=20
> diff --git =
a/meta/recipes-core/glib-2.0/glib-2.0/0003-gatomic-proper-pointer-get-cast=
.patch.patch =
b/meta/recipes-core/glib-2.0/glib-2.0/0003-gatomic-proper-pointer-get-cast=
.patch.patch
> new file mode 100644
> index 0000000..ad1ca12
> --- /dev/null
> +++ =
b/meta/recipes-core/glib-2.0/glib-2.0/0003-gatomic-proper-pointer-get-cast=
.patch.patch
> @@ -0,0 +1,28 @@
> +=46rom 3d371334d5668bcd02a38ff99884bd343c244d68 Mon Sep 17 00:00:00 =
2001
> +From: Koen Kooi <koen@dominion.thruhere.net>
> +Date: Sat, 18 Jun 2011 23:51:35 +0200
> +Subject: [PATCH 3/7] gatomic-proper-pointer-get-cast.patch
> +
> +Upstream-Status: Unknown
> +
> +Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> +---
> + glib/gatomic.h |    2 +-
> + 1 files changed, 1 insertions(+), 1 deletions(-)
> +
> +diff --git a/glib/gatomic.h b/glib/gatomic.h
> +index ddd39b8..b758142 100644
> +--- a/glib/gatomic.h
> ++++ b/glib/gatomic.h
> +@@ -70,7 +70,7 @@ void     g_atomic_pointer_set                  =
(volatile gpointer G_GNUC_MAY_ALI
> +   (g_atomic_int_set) ((volatile gint G_GNUC_MAY_ALIAS *) (volatile =
void *) (atomic), (newval)))
> + # define g_atomic_pointer_get(atomic) \
> +  ((void) sizeof (gchar [sizeof (*(atomic)) =3D=3D sizeof (gpointer) =
? 1 : -1]), \
> +-  (g_atomic_pointer_get) ((volatile gpointer G_GNUC_MAY_ALIAS *) =
(volatile void *) (atomic)))
> ++  (g_atomic_pointer_get) ((volatile gpointer G_GNUC_MAY_ALIAS *) =
(volatile void G_GNUC_MAY_ALIAS *) (atomic)))
> + # define g_atomic_pointer_set(atomic, newval) \
> +  ((void) sizeof (gchar [sizeof (*(atomic)) =3D=3D sizeof (gpointer) =
? 1 : -1]), \
> +   (g_atomic_pointer_set) ((volatile gpointer G_GNUC_MAY_ALIAS *) =
(volatile void *) (atomic), (newval)))
> +--=20
> +1.6.6.1
> +
> diff --git =
a/meta/recipes-core/glib-2.0/glib-2.0/0005-glib-mkenums-interpreter.patch.=
patch =
b/meta/recipes-core/glib-2.0/glib-2.0/0005-glib-mkenums-interpreter.patch.=
patch
> new file mode 100644
> index 0000000..6780330
> --- /dev/null
> +++ =
b/meta/recipes-core/glib-2.0/glib-2.0/0005-glib-mkenums-interpreter.patch.=
patch
> @@ -0,0 +1,25 @@
> +=46rom a8e5c4a808e7f8572bd5023645a6cb4386b9aff8 Mon Sep 17 00:00:00 =
2001
> +From: Koen Kooi <koen@dominion.thruhere.net>
> +Date: Sat, 18 Jun 2011 23:52:17 +0200
> +Subject: [PATCH 5/7] don't leak buildpaths into perl hashbang
> +
> +Upstream-Status: Unknown
> +
> +Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> +---
> + gobject/glib-mkenums.in |    2 +-
> + 1 files changed, 1 insertions(+), 1 deletions(-)
> +
> +diff --git a/gobject/glib-mkenums.in b/gobject/glib-mkenums.in
> +index 6372245..b486fe9 100755
> +--- a/gobject/glib-mkenums.in
> ++++ b/gobject/glib-mkenums.in
> +@@ -1,4 +1,4 @@
> +-#! @PERL_PATH@
> ++#! /usr/bin/env perl
> +=20
> + use warnings;
> + use File::Basename;
> +--=20
> +1.6.6.1
> +
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.28.6.bb =
b/meta/recipes-core/glib-2.0/glib-2.0_2.28.6.bb
> deleted file mode 100644
> index ca5f4c8..0000000
> --- a/meta/recipes-core/glib-2.0/glib-2.0_2.28.6.bb
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -require glib.inc
> -
> -PE =3D "1"
> -PR =3D "r1"
> -
> -SRC_URI =3D "${GNOME_MIRROR}/glib/2.28/glib-${PV}.tar.bz2 \
> -           file://configure-libtool.patch \
> -           file://60_wait-longer-for-threads-to-die.patch \
> -           file://g_once_init_enter.patch \
> -          "
> -# Only apply this patch for target recipe on uclibc
> -SRC_URI_append_libc-uclibc =3D " ${@['', =
'file://no-iconv.patch']['${PN}' =3D=3D '${BPN}']}"
> -
> -SRC_URI[md5sum] =3D "7d8fc15ae70d5111c0cf2a79d50ef717"
> -SRC_URI[sha256sum] =3D =
"557fb7c39d21b9359fbac51fd6b0b883bc97a2561c0166eef993a4078312f578"
> -
> -SRC_URI_append_virtclass-native =3D " =
file://glib-gettextize-dir.patch"
> -BBCLASSEXTEND =3D "native"
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.28.8.bb =
b/meta/recipes-core/glib-2.0/glib-2.0_2.28.8.bb
> new file mode 100644
> index 0000000..e84aea5
> --- /dev/null
> +++ b/meta/recipes-core/glib-2.0/glib-2.0_2.28.8.bb
> @@ -0,0 +1,22 @@
> +require glib.inc
> +
> +PR =3D "r1"
> +PE =3D "1"
> +
> +SRC_URI =3D "${GNOME_MIRROR}/glib/2.28/glib-${PV}.tar.bz2 \
> +           file://configure-libtool.patch \
> +           file://60_wait-longer-for-threads-to-die.patch \
> +           file://g_once_init_enter.patch \
> +           file://0003-gatomic-proper-pointer-get-cast.patch.patch \
> +           file://0005-glib-mkenums-interpreter.patch.patch \
> +          "
> +# Only apply this patch for target recipe on uclibc
> +SRC_URI_append_libc-uclibc =3D " ${@['', =
'file://no-iconv.patch']['${PN}' =3D=3D '${BPN}']}"
> +
> +SRC_URI_append_virtclass-native =3D " =
file://glib-gettextize-dir.patch"
> +
> +SRC_URI[md5sum] =3D "789e7520f71c6a4bf08bc683ec764d24"
> +SRC_URI[sha256sum] =3D =
"222f3055d6c413417b50901008c654865e5a311c73f0ae918b0a9978d1f9466f"
> +
> +BBCLASSEXTEND =3D "native"
> +
> diff --git a/meta/recipes-core/glib-2.0/glib.inc =
b/meta/recipes-core/glib-2.0/glib.inc
> index 0488490..0800c85 100644
> --- a/meta/recipes-core/glib-2.0/glib.inc
> +++ b/meta/recipes-core/glib-2.0/glib.inc
> @@ -31,7 +31,8 @@ EXTRA_OECONF =3D "--disable-debug =
--enable-included-printf=3Dno"
> EXTRA_OECONF_virtclass-native =3D ""
> EXTRA_OECONF_linuxstdbase =3D "--enable-included-printf=3Dno"
>=20
> -FILES_${PN} =3D "${libdir}/lib*${SOLIBS}"
> +FILES_${PN} =3D "${libdir}/lib*${SOLIBS} =
${sysconfdir}/bash_completion.d ${datadir}/glib-2.0/schemas"
> FILES_${PN}-dev +=3D "${libdir}/glib-2.0/include"
> +FILES_${PN}-dbg +=3D "${datadir}/glib-2.0/gdb ${datadir}/gdb"
>=20
> ARM_INSTRUCTION_SET =3D "arm"
> --=20
> 1.6.6.1
>=20



