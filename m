Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SRQzn-0002wX-Qv
	for openembedded-core@lists.openembedded.org;
	Mon, 07 May 2012 18:41:11 +0200
Received: by eaae1 with SMTP id e1so1269414eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 May 2012 09:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=ImTwIx83TWy5ND9z7TIXVdDZB6Y5zUGI4b8icrq+FTg=;
	b=VgLgPxHodlv+VaQD5KsYm+tZyHcseaC5PJfcNWtUORbvh7lJko54lrkld+RUSbzCSz
	X08j9rmIFWhls07MtQmC+1ujpp05VsWrl+BfKVd9H7Uy72L2tqd/n6P3RB9y+JmTFYzp
	TpNwZR/5a70o8DN9Z1fSSbe7cStgmlvgAk8IOebA4969bi6RDr8dbaQdaUokbWlccnUO
	wKem7j0/lz0FHv2dwamGYWUE4HElWyWvXZNaLnpDXkCdZ/V4Gh5Uv4Va5+QdngLxHPL+
	q7VDP4raGQ73bv237gfFvUs4HG/Ye4q7gQWJvkFPst+9V2meUijEFzGjyILOD/fMYmGX
	/k5g==
Received: by 10.213.105.78 with SMTP id s14mr2727523ebo.84.1336408281492; Mon,
	07 May 2012 09:31:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.132 with HTTP; Mon, 7 May 2012 09:30:51 -0700 (PDT)
In-Reply-To: <1336384326.23777.70.camel@ted>
References: <1336384326.23777.70.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 7 May 2012 09:30:51 -0700
Message-ID: <CAMKF1sogHGqLw1YkbzgEDG04BGwjfERi5oKPudQzoDgkiaGpmg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glib-2.0: Fix issues with libelf dependency creeping in
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
X-List-Received-Date: Mon, 07 May 2012 16:41:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, May 7, 2012 at 2:52 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/nolibelf.patch b/meta/re=
cipes-core/glib-2.0/glib-2.0/nolibelf.patch
> new file mode 100644
> index 0000000..e9b3b26
> --- a/dev/null
> +++ b/meta/recipes-core/glib-2.0/glib-2.0/nolibelf.patch
> @@ -0,0 +1,37 @@
> +Ideally there would be configureation option for this but there is not. =
We

typo

> +can't allow this code since it could detect the host system's libelf wit=
h
> +disasterous effects when cross compiling.
> +
> +RP 2012/5/7
> +
> +Upstream-Status: Pending (would need to be made a configure option to di=
sabe)

typo

> +
> +Index: glib-2.32.2/configure.ac
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- glib-2.32.2.orig/configure.ac =C2=A0 =C2=A0 =C2=A02012-05-07 08:30:0=
4.481149925 +0000
> ++++ glib-2.32.2/configure.ac =C2=A0 2012-05-07 08:31:02.185148588 +0000
> +@@ -1816,23 +1816,7 @@
> + dnl *** check for libelf ***
> + dnl ************************
> +
> +-PKG_CHECK_MODULES([LIBELF], [libelf], [have_libelf=3Dyes], [have_libelf=
=3Dmaybe])
> +-
> +-if test $have_libelf =3D maybe; then
> +- =C2=A0AC_CHECK_LIB([elf], [elf_begin], , [have_libelf=3Dno])
> +- =C2=A0AC_CHECK_LIB([elf], [elf_getshdrstrndx], , [have_libelf=3Dno])
> +- =C2=A0AC_CHECK_LIB([elf], [elf_getshdrnum], , [have_libelf=3Dno])
> +- =C2=A0AC_CHECK_HEADER([libelf.h], , [have_libelf=3Dno])
> +-
> +- =C2=A0if test $have_libelf !=3D no; then
> +- =C2=A0 =C2=A0LIBELF_LIBS=3D-lelf
> +- =C2=A0 =C2=A0have_libelf =3D yes
> +- =C2=A0fi
> +-fi
> +-
> +-if test $have_libelf =3D yes; then
> +- =C2=A0AC_DEFINE(HAVE_LIBELF, 1, [Define if libelf is available])
> +-fi
> ++have_libelf=3Dno
> +
> + dnl ****************************************
> + dnl *** platform dependent source checks ***
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.32.2.bb b/meta/recipes=
-core/glib-2.0/glib-2.0_2.32.2.bb
> index f303cb4..b9b3356 100644
> --- a/meta/recipes-core/glib-2.0/glib-2.0_2.32.2.bb
> +++ b/meta/recipes-core/glib-2.0/glib-2.0_2.32.2.bb
> @@ -1,6 +1,7 @@
> =C2=A0require glib.inc
>
> =C2=A0PE =3D "1"
> +PR =3D "r1"
>
> =C2=A0DEPENDS +=3D "libffi python-argparse-native zlib"
> =C2=A0DEPENDS_virtclass-native +=3D "libffi-native python-argparse-native=
"
> @@ -13,6 +14,7 @@ SRC_URI =3D "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV=
}.tar.xz \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://60_wait-longer-for-thread=
s-to-die.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://glib-2.0_fix_for_x32.patc=
h \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://nodbus.patch \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://nolibelf.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "
> =C2=A0SRC_URI[md5sum] =3D "5bfdb6197afb90e4dbc7b1bb98f0eae0"
> =C2=A0SRC_URI[sha256sum] =3D "b1764abf00bac96e0e93e29fb9715ce75f3583579ac=
ac40648e18771d43d6136"
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


