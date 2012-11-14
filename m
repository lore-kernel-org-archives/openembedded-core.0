Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TYeoU-0000By-QF
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Nov 2012 16:23:43 +0100
Received: by mail-bk0-f47.google.com with SMTP id jk7so243137bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2012 07:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=1b5f3dOuwAVMwLVrj9F/GLgTK961hX9qUglKIQcnG2k=;
	b=EyX1lHKx4E53hKtRICl2fz5DJAfP1Vfe1OIBTyb/D0hhovg+4//o+S7spESMvElnlV
	Rxzh00YsfHYfumSCfYS2pYgEvjEf6Ih6eeP2qiG6JcM4fwQnS3aXOHsjNlaLam8wkTSV
	1/SqvzTUUQfTeQR0IuIueokcagSeuolxX0sh8wIJRVoc6s6EKzS44jcJYNRbD4LbJtp6
	l2oiUDjnTboQBE7EtKOiHbi2wlGiPWdtRNMfC8s8uD/HrTHnH3zwfm8V3qsa4mu4qEGP
	WuqYCYOCXydU1xvcqDfjdYZfCVO+1HGBRLZNtp7bH9/556vWrCn2amWgYaEv6tEeGiMb
	Sn8g==
Received: by 10.205.125.137 with SMTP id gs9mr2311682bkc.22.1352905782980;
	Wed, 14 Nov 2012 07:09:42 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z13sm8265360bkv.8.2012.11.14.07.09.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 14 Nov 2012 07:09:34 -0800 (PST)
Date: Wed, 14 Nov 2012 16:09:45 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20121114150945.GN3928@jama.jama.net>
References: <1352815500.24487.123.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1352815500.24487.123.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] classes: Be consistent about sstate-inputdirs/outputdirs ending with '/'
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
X-List-Received-Date: Wed, 14 Nov 2012 15:23:43 -0000
X-Groupsio-MsgNum: 31362
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+mr2ctTDD1GjnQwB"
Content-Disposition: inline

--+mr2ctTDD1GjnQwB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 13, 2012 at 02:05:00PM +0000, Richard Purdie wrote:
> If sstate-inputdirs and sstate-outputdirs don't match with ending '/'
> characters, the manifest file can end up corrupted. This change
> ensures the metadata is consistent in ending do_populate_root tasks
> with this character to avoid manifest file corruption.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/classes/cross.bbclass b/meta/classes/cross.bbclass
> index 735f6d2..b57e523 100644
> --- a/meta/classes/cross.bbclass
> +++ b/meta/classes/cross.bbclass
> @@ -54,7 +54,7 @@ base_sbindir =3D "${bindir}"
>  libdir =3D "${exec_prefix}/lib/${CROSS_TARGET_SYS_DIR}"
>  libexecdir =3D "${exec_prefix}/libexec/${CROSS_TARGET_SYS_DIR}"
> =20
> -do_populate_sysroot[sstate-inputdirs] =3D "${SYSROOT_DESTDIR}/${STAGING_=
DIR_NATIVE}"
> +do_populate_sysroot[sstate-inputdirs] =3D "${SYSROOT_DESTDIR}/${STAGING_=
DIR_NATIVE}/"
> =20
>  python cross_virtclass_handler () {
>      if not isinstance(e, bb.event.RecipePreFinalise):
> diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
> index 6314ba1..1462ffb 100644
> --- a/meta/classes/native.bbclass
> +++ b/meta/classes/native.bbclass
> @@ -82,8 +82,8 @@ bindir .=3D "${NATIVE_PACKAGE_PATH_SUFFIX}"
>  libdir .=3D "${NATIVE_PACKAGE_PATH_SUFFIX}"
>  libexecdir .=3D "${NATIVE_PACKAGE_PATH_SUFFIX}"
> =20
> -do_populate_sysroot[sstate-inputdirs] =3D "${SYSROOT_DESTDIR}/${STAGING_=
DIR_NATIVE}"
> -do_populate_sysroot[sstate-outputdirs] =3D "${STAGING_DIR_NATIVE}"
> +do_populate_sysroot[sstate-inputdirs] =3D "${SYSROOT_DESTDIR}/${STAGING_=
DIR_NATIVE}/"
> +do_populate_sysroot[sstate-outputdirs] =3D "${STAGING_DIR_NATIVE}/"
> =20
>  # Since we actually install these into situ there is no staging prefix
>  STAGING_DIR_HOST =3D ""
> diff --git a/meta/recipes-core/eglibc/eglibc-initial.inc b/meta/recipes-c=
ore/eglibc/eglibc-initial.inc
> index c1a090e..83b1d2c 100644
> --- a/meta/recipes-core/eglibc/eglibc-initial.inc
> +++ b/meta/recipes-core/eglibc/eglibc-initial.inc
> @@ -72,7 +72,7 @@ eglibcinitial_sstate_postinst() {
>  	fi
>  }
> =20
> -do_populate_sysroot[sstate-outputdirs] =3D "${STAGING_DIR_TCBOOTSTRAP}"
> +do_populate_sysroot[sstate-outputdirs] =3D "${STAGING_DIR_TCBOOTSTRAP}/"
> =20
>  # We don't install any scripts so there is nothing to evacuate
>  do_evacuate_scripts () {
> diff --git a/meta/recipes-core/uclibc/uclibc-initial_0.9.33.bb b/meta/rec=
ipes-core/uclibc/uclibc-initial_0.9.33.bb
> index 22f56de..4620c96 100644
> --- a/meta/recipes-core/uclibc/uclibc-initial_0.9.33.bb
> +++ b/meta/recipes-core/uclibc/uclibc-initial_0.9.33.bb
> @@ -33,4 +33,4 @@ do_siteconfig () {
>          :
>  }
> =20
> -do_populate_sysroot[sstate-outputdirs] =3D "${STAGING_DIR_TCBOOTSTRAP}"
> +do_populate_sysroot[sstate-outputdirs] =3D "${STAGING_DIR_TCBOOTSTRAP}/"
> diff --git a/meta/recipes-core/uclibc/uclibc-initial_git.bb b/meta/recipe=
s-core/uclibc/uclibc-initial_git.bb
> index c0b7d52..9e3edbd 100644
> --- a/meta/recipes-core/uclibc/uclibc-initial_git.bb
> +++ b/meta/recipes-core/uclibc/uclibc-initial_git.bb
> @@ -33,4 +33,4 @@ do_siteconfig () {
>          :
>  }
> =20
> -do_populate_sysroot[sstate-outputdirs] =3D "${STAGING_DIR_TCBOOTSTRAP}"
> +do_populate_sysroot[sstate-outputdirs] =3D "${STAGING_DIR_TCBOOTSTRAP}/"
> diff --git a/meta/recipes-devtools/gcc/gcc-cross-initial.inc b/meta/recip=
es-devtools/gcc/gcc-cross-initial.inc
> index ff6556c..1ac1db6 100644
> --- a/meta/recipes-devtools/gcc/gcc-cross-initial.inc
> +++ b/meta/recipes-devtools/gcc/gcc-cross-initial.inc
> @@ -74,6 +74,6 @@ sysroot_stage_all() {
>  	mv ${SYSROOT_DESTDIR}${target_libdir}/* ${SYSROOT_DESTDIR}${STAGING_DIR=
_TARGET}${target_libdir}/ || true
>  }
> =20
> -do_populate_sysroot[sstate-inputdirs] =3D "${SYSROOT_DESTDIR}/${STAGING_=
DIR_HOST} ${SYSROOT_DESTDIR}/${STAGING_DIR_TARGET}/${target_base_libdir}"
> -do_populate_sysroot[sstate-outputdirs] =3D "${STAGING_DIR_HOST} ${STAGIN=
G_DIR_TCBOOTSTRAP}/${target_base_libdir}"
> +do_populate_sysroot[sstate-inputdirs] =3D "${SYSROOT_DESTDIR}/${STAGING_=
DIR_HOST}/ ${SYSROOT_DESTDIR}/${STAGING_DIR_TARGET}/${target_base_libdir}/"
> +do_populate_sysroot[sstate-outputdirs] =3D "${STAGING_DIR_HOST}/ ${STAGI=
NG_DIR_TCBOOTSTRAP}/${target_base_libdir}/"

Not sure if it can be caused by this, but building from scratch fails
today with:

NOTE: Running setscene task 430 of 457 (/OE/oe-core/openembedded-core/meta/=
recipes-kernel/linux-libc-headers/linux-libc-headers_3.4.3.bb, do_populate_=
sysroot_setscene)
ERROR: Error executing a python function in /OE/oe-core/openembedded-core/m=
eta/recipes-devtools/gcc/gcc-cross-initial_4.7.bb:
OSError: [Errno 2] No such file or directory

ERROR: The stack trace of python calls that resulted in this exception/fail=
ure was:
ERROR:   File "do_populate_sysroot_setscene", line 6, in <module>
ERROR:
ERROR:   File "do_populate_sysroot_setscene", line 3, in do_populate_sysroo=
t_setscene
ERROR:
ERROR:   File "sstate.bbclass", line 3, in sstate_setscene
ERROR:
ERROR:   File "sstate.bbclass", line 63, in sstate_installpkg
ERROR:
ERROR: The code that was being executed was:
ERROR:      0002:def do_populate_sysroot_setscene(d):
ERROR:      0003:    sstate_setscene(d)
ERROR:      0004:
ERROR:      0005:
ERROR:  *** 0006:do_populate_sysroot_setscene(d)
ERROR:      0007:
ERROR: [From file: 'do_populate_sysroot_setscene', lineno: 6, function: <mo=
dule>]
ERROR:      0001:
ERROR:      0002:def do_populate_sysroot_setscene(d):
ERROR:  *** 0003:    sstate_setscene(d)
ERROR:      0004:
ERROR:      0005:
ERROR:      0006:do_populate_sysroot_setscene(d)
ERROR:      0007:
ERROR: [From file: 'do_populate_sysroot_setscene', lineno: 3, function: do_=
populate_sysroot_setscene]
ERROR:      0001:def sstate_setscene(d):
ERROR:      0002:    shared_state =3D sstate_state_fromvars(d)
ERROR:  *** 0003:    accelerate =3D sstate_installpkg(shared_state, d)
ERROR:      0004:    if not accelerate:
ERROR:      0005:        raise bb.build.FuncFailed("No suitable staging pac=
kage found")
ERROR:      0006:
ERROR: [From file: 'sstate.bbclass', lineno: 3, function: sstate_setscene]
ERROR:      0059:        os.remove(fixmefn)
ERROR:      0060:
ERROR:      0061:    for state in ss['dirs']:
ERROR:      0062:        prepdir(state[1])
ERROR:  *** 0063:        os.rename(sstateinst + state[0], state[1])
ERROR:      0064:    sstate_install(ss, d)
ERROR:      0065:
ERROR:      0066:    for plain in ss['plaindirs']:
ERROR:      0067:        workdir =3D d.getVar('WORKDIR', True)
ERROR: [From file: 'sstate.bbclass', lineno: 63, function: sstate_installpk=
g]
NOTE: recipe gcc-cross-initial-4.7.2-r13: task do_populate_sysroot_setscene=
: Failed
WARNING: Setscene task 92 (/OE/oe-core/openembedded-core/meta/recipes-devto=
ols/gcc/gcc-cross-initial_4.7.bb, do_populate_sysroot_setscene) failed with=
 exit co
de '1' - real task will be run instead

It's not fatal, but it wasn't there yesterday AFAIK.

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--+mr2ctTDD1GjnQwB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCjtDkACgkQN1Ujt2V2gBzb0gCggTFPJHC6g6sBq60jnb3u0E3W
LzEAnihxI7NKIE0ULuDkPq354Peo0YhN
=t/B/
-----END PGP SIGNATURE-----

--+mr2ctTDD1GjnQwB--
