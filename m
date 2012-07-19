Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SrlgZ-0006vy-PH
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 10:02:11 +0200
Received: by bkcik5 with SMTP id ik5so1760726bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2012 00:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=pNHAN8cidSrbctFbLfLOJJGkRLDILIRrFQf1XMFEuME=;
	b=M9JLlA/PTbcp3ng/ESd7Xl4DWEfrruGiFaVyeD43ZP8THkRQgJ77oeNywkzzL89Ni/
	+oZ5QEzJIZjVfnWkT4NuMJ/nZcif/y/5uF99Tb7iienPX26EmK6iEyyWIfcvQRRjCV1r
	MKJ26su5HtSjNDMcqYydPIGY+VxZMAyw0VG9tEcKpEH9Yrmczju1gN/sYhWbyKTb+xHy
	W0bTmh+u5izO714nGplI4YpCIgGwKe7qcjfrZhw0UuZKkdhmF2l+xx9pTuBGTTP0W7cy
	kSKBTgj6d2d/sMq5xf9+rosEO2XPNL1KP01xmoyfLUiw1mw08xFFU6G6ZmG0e15itZSQ
	PA7Q==
Received: by 10.204.129.27 with SMTP id m27mr261201bks.115.1342684250249;
	Thu, 19 Jul 2012 00:50:50 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id g6sm437215bkg.2.2012.07.19.00.50.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Jul 2012 00:50:49 -0700 (PDT)
Date: Thu, 19 Jul 2012 09:51:00 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120719075100.GD3331@jama.jama.net>
References: <1341940070-27715-1-git-send-email-raj.khem@gmail.com>
	<1341940070-27715-2-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1341940070-27715-2-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 2/2] kernel.bbclass: Make tree available for cross building external modules
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
X-List-Received-Date: Thu, 19 Jul 2012 08:02:11 -0000
X-Groupsio-MsgNum: 25694
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZJcv+A0YCCLh2VIg"
Content-Disposition: inline

--ZJcv+A0YCCLh2VIg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 10, 2012 at 10:07:50AM -0700, Khem Raj wrote:
> We shave too much from kernel sources for making it work
> for on device external kernel module development that cross
> development of external modules wont work from same tree
> anymore. This patch makes a copy of tree which will eventually
> be staged for building external modules

Does this solve also this issue?
http://lists.linuxtogo.org/pipermail/openembedded-devel/2012-July/040584.ht=
ml

Cheers,

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/classes/kernel.bbclass |   15 +++++++++++++--
>  1 files changed, 13 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 81c334b..b2b6fcd 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -80,6 +80,7 @@ KERNEL_ALT_IMAGETYPE ??=3D ""
>  # Define where the kernel headers are installed on the target as well as=
 where
>  # they are staged.
>  KERNEL_SRC_PATH =3D "/usr/src/kernel"
> +UNPRUNED_KERNEL_SRC_PATH =3D "/usr/src/kernel-unpruned"
> =20
>  KERNEL_IMAGETYPE_FOR_MAKE =3D "${@(lambda s: s[:-3] if s[-3:] =3D=3D ".g=
z" else s)(d.getVar('KERNEL_IMAGETYPE', True))}"
> =20
> @@ -135,7 +136,9 @@ kernel_do_install() {
>  	# kernel source tree.
>  	#
>  	kerneldir=3D${D}${KERNEL_SRC_PATH}
> +	unrprunedkerneldir=3D${D}${UNPRUNED_KERNEL_SRC_PATH}
>  	install -d $kerneldir
> +	install -d $unrprunedkerneldir
> =20
>  	#
>  	# Store the kernel version in sysroots for module-base.bbclass
> @@ -176,7 +179,6 @@ kernel_do_install() {
>  	# and include files.
>  	#
>  	oe_runmake -C $kerneldir CC=3D"${KERNEL_CC}" LD=3D"${KERNEL_LD}" clean
> -	make -C $kerneldir _mrproper_scripts
>  	find $kerneldir -path $kerneldir/lib -prune -o -path $kerneldir/tools -=
prune -o -path $kerneldir/scripts -prune -o -name "*.[csS]" -exec rm '{}' \;
>  	find $kerneldir/Documentation -name "*.txt" -exec rm '{}' \;
> =20
> @@ -186,6 +188,9 @@ kernel_do_install() {
>  	if [ ${ARCH} =3D "powerpc" ]; then
>  		cp arch/powerpc/lib/crtsavres.o $kerneldir/arch/powerpc/lib/crtsavres.o
>  	fi
> +	# make a copy of unpruned kernel tree
> +	cp -fR $kerneldir/* $unrprunedkerneldir
> +	make -C $kerneldir _mrproper_scripts
> =20
>  	# Remove the following binaries which cause strip or arch QA errors
>  	# during do_package for cross-compiled platforms
> @@ -197,8 +202,14 @@ kernel_do_install() {
>  	done
>  }
> =20
> +PACKAGE_PREPROCESS_FUNCS +=3D "kernel_package_preprocess"
> +
> +kernel_package_preprocess () {
> +	rm -rf ${PKGD}/${UNPRUNED_KERNEL_SRC_PATH}
> +}
> +
>  sysroot_stage_all_append() {
> -	sysroot_stage_dir ${D}${KERNEL_SRC_PATH} ${SYSROOT_DESTDIR}${KERNEL_SRC=
_PATH}
> +	sysroot_stage_dir ${D}${UNPRUNED_KERNEL_SRC_PATH} ${SYSROOT_DESTDIR}${K=
ERNEL_SRC_PATH}
>  }
> =20
>  kernel_do_configure() {
> --=20
> 1.7.5.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ZJcv+A0YCCLh2VIg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAHvGQACgkQN1Ujt2V2gBxLxgCdGLGNrXaSgIF8tCxlkw8v+MRh
mqIAn2gsxXXpBcc5SXhZ9LyXgy3Cmgci
=Bs3v
-----END PGP SIGNATURE-----

--ZJcv+A0YCCLh2VIg--
