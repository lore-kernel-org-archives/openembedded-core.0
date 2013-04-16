Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1USELb-0004J4-5S
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Apr 2013 00:27:36 +0200
Received: by mail-ee0-f47.google.com with SMTP id t10so451799eei.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Apr 2013 15:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=IzUfrYCNy3JcQX8r0URv75TX9mLOrPaEZ9lGuV+s4Xw=;
	b=ZfNKXeUPp196AZAyQGJlOhWMSbZQwbVeCwLmIcebhd7CEY3uHjzzapwmZJYKubODz8
	VQfA7mQW6fzktWyLVB6Yw1SmhjL1CDQxgAoBdOJ2c9fDkJA1qSbv+0Ti6/SbUQ0yxAh+
	oT/v5rJiwGGZK1gZVp2dF2a2ngYGpEluZA31r37nkM4PPSi6L26vTnda1R5MYfK5a03t
	2UqUZtK5HyIjzlDM9VxZP3wI7QFT/YHzTt/PvBAx3teXjjd7sopWtWyB+xq18034SWQD
	bbAx7Cut0+2oSo9wruysYT4gNaIijGXcRY4PfdG933HxoDf/MtikNmKOxBf4tEb40iw6
	N2VQ==
X-Received: by 10.15.94.200 with SMTP id bb48mr10994640eeb.21.1366150200606;
	Tue, 16 Apr 2013 15:10:00 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id a41sm5179830eei.4.2013.04.16.15.09.59
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 16 Apr 2013 15:09:59 -0700 (PDT)
Date: Wed, 17 Apr 2013 00:10:07 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20130416221007.GE29302@jama.dyndns-home.com>
References: <1366147707.8670.110.camel@ted>
	<1366149704-12490-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1366149704-12490-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCHv2] systemd: use AC_CHECK_TOOL instead of AC_PATH_TOOL when checking objcopy, strings, gperf
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Apr 2013 22:27:54 -0000
X-Groupsio-MsgNum: 38039
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sDKAb4OeUBrWWL6P"
Content-Disposition: inline

--sDKAb4OeUBrWWL6P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 17, 2013 at 12:01:44AM +0200, Martin Jansa wrote:
> * with external toolchain I have different HOST_PREFIX and HOST_SYS
>   AC_PATH_TOOL is using HOST_SYS as prefix and fails to find objcopy
>   then it tries objcopy without prefix which is found on host, but
>   that objcopy does not work for arm libs
> * with internal toolchain gperf is not prefixed with HOST_PREFIX, but
>   fallback to "gperf" only finds the one in native sysroot first
> * based on http://lists.linuxtogo.org/pipermail/openembedded-core/2013-Ap=
ril/037985.html
>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  ...se-AC_CHECK_TOOL-for-objcopy-strings-and-.patch | 41 ++++++++++++++++=
++++++
>  meta/recipes-core/systemd/systemd_199.bb           |  6 +++-
>  2 files changed, 46 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-core/systemd/systemd/0001-configure-use-=
AC_CHECK_TOOL-for-objcopy-strings-and-.patch
>=20
> diff --git a/meta/recipes-core/systemd/systemd/0001-configure-use-AC_CHEC=
K_TOOL-for-objcopy-strings-and-.patch b/meta/recipes-core/systemd/systemd/0=
001-configure-use-AC_CHECK_TOOL-for-objcopy-strings-and-.patch
> new file mode 100644
> index 0000000..d847bbc
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/0001-configure-use-AC_CHECK_TOOL-=
for-objcopy-strings-and-.patch
> @@ -0,0 +1,41 @@
> +From d6f92bcbbae9a577adb9588c7b2783a5d0bf343d Mon Sep 17 00:00:00 2001
> +From: Martin Jansa <Martin.Jansa@gmail.com>
> +Date: Tue, 16 Apr 2013 14:20:41 +0200
> +Subject: [PATCH] configure: use AC_CHECK_TOOL for objcopy, strings and g=
perf
> +
> +* using AC_PATH_TOOL does not allow to override it from shell environment
> +  which is useful when cross-compiling
> +* with external toolchain I have different HOST_PREFIX and HOST_SYS
> +  AC_PATH_TOOL is using HOST_SYS as prefix and fails to find objcopy
> +  which is available only as ${TARGET_PREFIX}objcopy then it tries
> +  objcopy without prefix which is found on host, but that objcopy
> +  does not work for !host (e.g. arm when building on x86) libs
> +
> +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> +Upstream-Status: Submitted
> +http://lists.freedesktop.org/archives/systemd-devel/2013-April/010468.ht=
ml
> +
> +---
> + configure.ac | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 33b0ca9..519f1a9 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -86,9 +86,9 @@ GOBJECT_INTROSPECTION_CHECK([1.31.1])
> +    AM_CONDITIONAL([HAVE_INTROSPECTION], [false])
> +    enable_introspection=3Dno])
> +=20
> +-AC_PATH_TOOL(OBJCOPY, objcopy)
> +-AC_PATH_TOOL(STRINGS, strings)
> +-AC_PATH_TOOL(GPERF, gperf)
> ++AC_CHECK_TOOL(OBJCOPY, objcopy)
> ++AC_CHECK_TOOL(STRINGS, strings)
> ++AC_CHECK_TOOL(GPERF, gperf)
> + if test -z "$GPERF" ; then
> +         AC_MSG_ERROR([*** gperf not found])
> + fi
> +--=20
> +1.8.1.5
> +
> diff --git a/meta/recipes-core/systemd/systemd_199.bb b/meta/recipes-core=
/systemd/systemd_199.bb
> index d22df12..bbe19ea 100644
> --- a/meta/recipes-core/systemd/systemd_199.bb
> +++ b/meta/recipes-core/systemd/systemd_199.bb
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.GPL2;md5=3D751419260=
aa954499f7abaabaa882bbe \
>  PROVIDES =3D "udev"
> =20
>  PE =3D "1"
> -PR =3D "r2"
> +PR =3D "r3"
> =20
>  DEPENDS =3D "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-nati=
ve acl readline dbus libcap libcgroup tcp-wrappers glib-2.0"
>  DEPENDS +=3D "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d=
)}"
> @@ -27,6 +27,7 @@ SRC_URI =3D "http://www.freedesktop.org/software/system=
d/systemd-${PV}.tar.xz \
>             file://0002-readahead-chunk-on-spinning-media.patch \
>             file://0003-readahead-cleanups.patch \
>             file://0013-systemd-sysctl-Handle-missing-etc-sysctl.conf-pro=
per.patch \
> +           file://0001-configure-use-AC_CHECK_TOOL-for-objcopy-strings-a=
nd-.patch \
>             file://199-firmware.patch \
>             file://init \
>            "
> @@ -77,6 +78,9 @@ EXTRA_OECONF_append_libc-uclibc =3D " --disable-myhostn=
ame "
>  do_configure_prepend() {
>  	export CPP=3D"${HOST_PREFIX}cpp ${TOOLCHAIN_OPTIONS} ${HOST_CC_ARCH}"
> =20
> +	export STRINGS =3D "${HOST_PREFIX}strings"
> +	export GPERF =3D "${HOST_PREFIX}gperf"

Ignore this one, extra spaces are ok for bitbake.conf but I should
remove them again here.

> +
>  	sed -i -e 's:=3D/root:=3D${ROOT_HOME}:g' units/*.service*
>  }
> =20
> --=20
> 1.8.1.5
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--sDKAb4OeUBrWWL6P
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFtzD8ACgkQN1Ujt2V2gBzwYQCgmcnK1aFw4ih3tROSXBCvns5K
IUEAmQFTThSmbEmmVMTAWSP49DqH8Laz
=Q+ES
-----END PGP SIGNATURE-----

--sDKAb4OeUBrWWL6P--
