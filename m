Received: from smtp3-g21.free.fr ([212.27.42.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1RdI0I-0007s2-7p
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Dec 2011 09:58:26 +0100
Received: from [192.168.2.8] (unknown [82.233.81.124])
	by smtp3-g21.free.fr (Postfix) with ESMTP id CA8A3A6621
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2011 09:51:19 +0100 (CET)
Message-ID: <4EF19E06.6030004@eukrea.com>
Date: Wed, 21 Dec 2011 09:51:18 +0100
From: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1324044340-21898-1-git-send-email-eric@eukrea.com>
In-Reply-To: <1324044340-21898-1-git-send-email-eric@eukrea.com>
Subject: Re: [PATCH] gdb-cross-canadian: build gdb with python support
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
X-List-Received-Date: Wed, 21 Dec 2011 08:58:26 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Le 16/12/2011 15:05, Eric B=C3=A9nard a =C3=A9crit :
> * python support is needed for providing finer scripting control
> in gdb, and for remote controling gdb for example from qtcreator
> * gdb/configure tries to autodetect python using python executable
> with --includes --ldflags --exec-prefix to get the right flags
> As it's difficult to achieve in OE's context, we generate a
> script which will return the right values and make gdb's build
> system happy. This idea was taken from the following article :
> http://www.mentby.com/doug-evans-2/python-enabled-gdb-on-windows-and-re=
location.html
> * tested using angstrom&  armv7 target&  qtcreator 201005&  2.4.0
>
> Signed-off-by: Eric B=C3=A9nard<eric@eukrea.com>
> Cc: fcooper@ti.com
> ---
>   meta/recipes-devtools/gdb/gdb-cross-canadian.inc |   20 +++++++++++++=
++++++-
>   1 files changed, 19 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc b/meta/re=
cipes-devtools/gdb/gdb-cross-canadian.inc
> index ec0748e..e0e6e30 100644
> --- a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
> +++ b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
> @@ -4,4 +4,22 @@ DESCRIPTION =3D "cross-canadian gdb for ${TARGET_ARCH}=
 target - GNU debugger"
>   PN =3D "gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}"
>   BPN =3D "gdb"
>
> -DEPENDS =3D "ncurses-nativesdk expat-nativesdk gettext-nativesdk readl=
ine-nativesdk"
> +DEPENDS =3D "ncurses-nativesdk expat-nativesdk gettext-nativesdk readl=
ine-nativesdk python-nativesdk"
> +RDEPENDS +=3D "python-nativesdk-core python-nativesdk-lang python-nati=
vesdk-re \
> +             python-nativesdk-codecs python-nativesdk-netclient"
> +
> +EXTRA_OECONF_append =3D "--with-python=3D${WORKDIR}/python"
> +
> +do_configure_prepend() {
> +cat>  ${WORKDIR}/python<<  EOF
> +#! /bin/sh
> +case "\$2" in
> +        --includes) echo "-I${STAGING_DIR}/${HOST_ARCH}-nativesdk${HOS=
T_VENDOR}-${HOST_OS}${exec_prefix}/include/python${PYTHON_BASEVERSION}/" =
;;
> +        --ldflags) echo "-L${STAGING_DIR}/${HOST_ARCH}-nativesdk${HOST=
_VENDOR}-${HOST_OS}${libdir}/python${PYTHON_BASEVERSION}/config/config -l=
pthread -ldl -lutil -lm -lpython${PYTHON_BASEVERSION}" ;;
> +        --exec-prefix) echo "/usr" ;;
> +        *) exit 1 ;;
> +esac
> +exit 0
> +EOF
> +        chmod +x ${WORKDIR}/python
> +}
> \ No newline at end of file

any comment concerning this patch ?

Thanks
Eric


