Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QA2A2-0004HR-1f
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Apr 2011 17:39:18 +0200
Received: by fxm19 with SMTP id 19so628693fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Apr 2011 08:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=UdniMfsQYTdr5zych9oVDRH3R9SoCLQdOl1ELCjaxhM=;
	b=Awa0xY7Fgd6NK02HJaWiBj9LhI0WBIWvjIOeYtU4RLATw45TWTBCOa3B9rKjqz3e6/
	ZvPf399P1V7sdq9nQUJRFN3fF/fRKnyPEwdTaublUty3wT6nJMAF8rTgi43VPlTvrU/2
	vbVpWEcCSdL/lwwHXznJBm8xnIiYIk/yJY+4Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=poZX6Bs/3kHgrNSQ15BTl7YIAhZ+/oGkjplJcW3rzT0PLI+hhzbHdIdPBg5epcykuZ
	lBCD523OCuGaF5n+Kp3oUuSfdtDrukbzYM6+GvKP5SfaYVWsfyqz0j1pfeAHFGHoEmp7
	Bf6scpdRwSfLaNDeYs+w4rRIRJBvYj017eVX0=
Received: by 10.223.106.78 with SMTP id w14mr1274736fao.35.1302709020139; Wed,
	13 Apr 2011 08:37:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.115.82 with HTTP; Wed, 13 Apr 2011 08:36:30 -0700 (PDT)
In-Reply-To: <b94c6ce5656dd4bd312feda0eaf2423cae505ccd.1302686656.git.qing.he@intel.com>
References: <cover.1302686656.git.qing.he@intel.com>
	<b94c6ce5656dd4bd312feda0eaf2423cae505ccd.1302686656.git.qing.he@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 13 Apr 2011 08:36:30 -0700
Message-ID: <BANLkTikg2Bb8bCrnjJU3JyP0mHTYHFoRgg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] quilt: fix test for target build
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
X-List-Received-Date: Wed, 13 Apr 2011 15:39:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 13, 2011 at 2:26 AM, Qing He <qing.he@intel.com> wrote:
> From: Qing He <qing.he@intel.com>
>
> fixes [YOCTO #969]
>
> Signed-off-by: Qing He <qing.he@intel.com>
> ---
> =C2=A0.../quilt/quilt/gnu_patch_test_fix_target.patch =C2=A0 =C2=A0| =C2=
=A0 66 ++++++++++++++++++++
> =C2=A0meta/recipes-devtools/quilt/quilt_0.48.bb =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 =C2=A06 +-
> =C2=A02 files changed, 70 insertions(+), 2 deletions(-)
> =C2=A0create mode 100644 meta/recipes-devtools/quilt/quilt/gnu_patch_test=
_fix_target.patch
>
> diff --git a/meta/recipes-devtools/quilt/quilt/gnu_patch_test_fix_target.=
patch b/meta/recipes-devtools/quilt/quilt/gnu_patch_test_fix_target.patch
> new file mode 100644
> index 0000000..784fe76
> --- /dev/null
> +++ b/meta/recipes-devtools/quilt/quilt/gnu_patch_test_fix_target.patch
> @@ -0,0 +1,66 @@
> +The test of patch and diff should not be run for cross build,
> +rather, assume them as gnu version is rather safe. This is a
> +workaround to remove it altogether.
> +

why is this patch needed. I assume all linux distributions use GNU
diff and patch
and that what is being checked so why remove the checks ? these messages
are atleast useful for folks who are trying other build hosts e.g. darwin

> +Signed-off-by: Qing He <qing.he@intel.com>
> +
> +diff --git a/configure.ac b/configure.ac
> +index 026a36c..7b45ca4 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -245,55 +245,6 @@ fi
> + QUILT_COMPAT_PROG_PATH(DIFF, diff)
> + QUILT_COMPAT_PROG_PATH(PATCH, patch)
> +
> +-# Sun diff and others will not work because GNU patch options are used.
> +-AC_MSG_CHECKING([the version of $DIFF])
> +-if $DIFF --version 2>/dev/null | grep GNU >/dev/null; then
> +- =C2=A0set -- `$DIFF --version 2>/dev/null | $AWK '{ print $NF; exit }'=
`
> +- =C2=A0diff_version=3D$1
> +- =C2=A0AC_MSG_RESULT($diff_version)
> +- =C2=A0saved_IFS=3D$IFS; IFS=3D'.'
> +- =C2=A0set -- $diff_version
> +- =C2=A0IFS=3D$saved_IFS
> +- =C2=A0set -- `echo $1 | $TR -cd 0-9` `echo $2 | $TR -cd 0-9`
> +- =C2=A0if test 0$1 -lt 2 || test 0$1 -eq 2 -a 0$2 -lt 7 ; then
> +- =C2=A0 =C2=A0diff_version=3D
> +- =C2=A0fi
> +-else
> +- =C2=A0AC_MSG_RESULT(no GNU diff)
> +-fi
> +-if test -z "$diff_version" ; then
> +- =C2=A0AC_MSG_ERROR([
> +-$PACKAGE_NAME requires at least version 2.7 of GNU diffutils. You can
> +-download a current version of patch from ftp.gnu.org, or if you already
> +-have GNU diff then you can supply its path with the '--with-diff=3D' op=
tion.
> +-])
> +-fi
> +-
> +-
> +-# Sun's patch, and others, do not work because GNU patch options are us=
ed.
> +-AC_MSG_CHECKING([the version of $PATCH])
> +-if $PATCH --version 2> /dev/null | grep GNU >/dev/null; then
> +- =C2=A0set -- `$PATCH --version 2> /dev/null`
> +- =C2=A0patch_version=3D$2
> +- =C2=A0AC_MSG_RESULT($patch_version)
> +- =C2=A0saved_IFS=3D$IFS; IFS=3D'.'
> +- =C2=A0set -- $patch_version
> +- =C2=A0IFS=3D$saved_IFS
> +- =C2=A0set -- `echo $1 | $TR -cd 0-9` `echo $2 | $TR -cd 0-9`
> +- =C2=A0if test 0$1 -lt 2 || test 0$1 -eq 2 -a 0$2 -lt 4 ; then
> +- =C2=A0 =C2=A0patch_version=3D
> +- =C2=A0fi
> +-else
> +- =C2=A0AC_MSG_RESULT(no GNU patch)
> +-fi
> +-if test -z "$patch_version" ; then
> +- =C2=A0AC_MSG_ERROR([
> +-$PACKAGE_NAME requires at least version 2.4 of GNU patch. You can downl=
oad a
> +-current version of patch from ftp.gnu.org, or if you already have GNU p=
atch
> +-then you can supply its path with the '--with-patch=3D' option.
> +-])
> +-fi
> +-
> + QUILT_COMPAT_PROG_PATH(FIND, find)
> +
> + AC_MSG_CHECKING([whether $FIND -path works])
> diff --git a/meta/recipes-devtools/quilt/quilt_0.48.bb b/meta/recipes-dev=
tools/quilt/quilt_0.48.bb
> index 20a708d..124e2cd 100644
> --- a/meta/recipes-devtools/quilt/quilt_0.48.bb
> +++ b/meta/recipes-devtools/quilt/quilt_0.48.bb
> @@ -2,8 +2,10 @@ require quilt.inc
> =C2=A0LICENSE=3D"GPLv2"
> =C2=A0LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df0=
79bae19f"
> =C2=A0RDEPENDS_${PN} +=3D "patch diffstat bzip2 util-linux"
> -PR =3D "r0"
> -SRC_URI +=3D "file://aclocal.patch"
> +PR =3D "r1"
> +SRC_URI +=3D "file://aclocal.patch \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://gnu_patch_test_fix_targ=
et.patch \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "
>
> =C2=A0SRC_URI[md5sum] =3D "f77adda60039ffa753f3c584a286f12b"
> =C2=A0SRC_URI[sha256sum] =3D "73fd760d3b5cbf06417576591dc37d67380d189392d=
b9000c21b7cbebee49ffc"
> --
> 1.7.0
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


