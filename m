Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1SB4Gl-0002We-Ao
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 14:11:03 +0100
Received: from eb-e6520 (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 3D83D4B019A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 14:02:04 +0100 (CET)
Date: Fri, 23 Mar 2012 14:02:03 +0100
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20120323140203.51a7823b@eb-e6520>
In-Reply-To: <1332507041-30674-1-git-send-email-raj.khem@gmail.com>
References: <1332507041-30674-1-git-send-email-raj.khem@gmail.com>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.8; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Subject: Re: [PATCH] gdb-cross-canadian: Fix linking issues when python support is enabled
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
X-List-Received-Date: Fri, 23 Mar 2012 13:11:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Le Fri, 23 Mar 2012 05:50:41 -0700,
Khem Raj <raj.khem@gmail.com> a =E9crit :

> gdb-cross-canadian was linking with static version of libpython
> and looking for build host python when run. This could be mismatch
> between python-nativesdk and build host provided python. So we
> make it consistent to always use python-nativesdk
>=20
> Instead of adding bunch of -L we add -rpath and -rpath-link
> so that gdb finds all needed libraries in SDK and does not
> reach out into host
>=20
> This should fix yocto PR# 2077 as well.
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
Tested-by: Eric B=E9nard <eric@eukrea.com>
> ---
>  meta/recipes-devtools/gdb/gdb-cross-canadian.inc   |    7 ++++---
>  .../recipes-devtools/gdb/gdb-cross-canadian_7.4.bb |    2 +-
>  2 files changed, 5 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc b/meta/reci=
pes-devtools/gdb/gdb-cross-canadian.inc
> index a7cac61..59412c4 100644
> --- a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
> +++ b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
> @@ -1,4 +1,5 @@
>  inherit cross-canadian
> +inherit python-dir
> =20
>  DESCRIPTION =3D "cross-canadian gdb for ${TARGET_ARCH} target - GNU debu=
gger"
>  PN =3D "gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}"
> @@ -14,9 +15,9 @@ do_configure_prepend() {
>  cat > ${WORKDIR}/python << EOF
>  #! /bin/sh
>  case "\$2" in
> -        --includes) echo "-I${STAGING_INCDIR}/python${PYTHON_BASEVERSION=
}/" ;;
> -        --ldflags) echo "-L${STAGING_LIBDIR}/../python${PYTHON_BASEVERSI=
ON}/config -lpthread -ldl -lutil -lm -lpython${PYTHON_BASEVERSION}" ;;
> -        --exec-prefix) echo "/usr" ;;
> +        --includes) echo "-I${STAGING_INCDIR}/${PYTHON_DIR}/" ;;
> +        --ldflags) echo "-Wl,-rpath-link,${STAGING_LIBDIR}/.. -Wl,-rpath=
,${libdir}/.. -lpthread -ldl -lutil -lm -lpython${PYTHON_BASEVERSION}" ;;
> +        --exec-prefix) echo "${exec_prefix}/bin" ;;
>          *) exit 1 ;;
>  esac
>  exit 0
> diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_7.4.bb b/meta/r=
ecipes-devtools/gdb/gdb-cross-canadian_7.4.bb
> index dbcffde..dfb7d81 100644
> --- a/meta/recipes-devtools/gdb/gdb-cross-canadian_7.4.bb
> +++ b/meta/recipes-devtools/gdb/gdb-cross-canadian_7.4.bb
> @@ -1,7 +1,7 @@
>  require gdb-common.inc
>  require gdb-cross-canadian.inc
> =20
> -PR =3D "${INC_PR}.3"
> +PR =3D "${INC_PR}.4"
> =20
>  GDBPROPREFIX =3D "--program-prefix=3D'${TARGET_PREFIX}'"
>  EXPAT =3D "--with-expat"



