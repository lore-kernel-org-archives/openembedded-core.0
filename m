Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f169.google.com (mail-we0-f169.google.com
	[74.125.82.169])
	by mail.openembedded.org (Postfix) with ESMTP id 7F40E6065C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jun 2013 10:05:43 +0000 (UTC)
Received: by mail-we0-f169.google.com with SMTP id n57so1136531wev.28
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Jun 2013 03:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=G3FADPa4TwyByeP7TvT+mf9eV9wq01xsucZfOvlRAl0=;
	b=UO2y+iOWLCBPzST7z6GCl/a0IjQaNB8XLi28L1Pd+eLeLRx9LIZbDg0JJCjwtz+sNM
	Z6B5aKLfm3SuivCJOgopkI2+fv5VM3IWPeDZvViLZGkovzVQnRSnPZJrioMEIUuDFUiK
	FihE7wCULkBzz8rem+y3mI8+19jnd7sBIciTHv7JCo8glwrwgVmbNjz5v20fIxjifiYJ
	LnprQqTf7WdZC/mzvtG94qfHl6aJOCHrA/P1F7i6oqaekRrdKFXQiukWH1cfwn5ekfH4
	yi1lLdZYIRBY6qzPxD2e2gwEKINmNj0y9r8vg8txr+tPoaAbvdfLH8k/Ds5CnmDvIVU6
	gMSA==
X-Received: by 10.180.9.80 with SMTP id x16mr5653262wia.63.1370426743604;
	Wed, 05 Jun 2013 03:05:43 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	d10sm9263223wik.0.2013.06.05.03.05.42 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 05 Jun 2013 03:05:42 -0700 (PDT)
Date: Wed, 5 Jun 2013 12:05:59 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Yi Zhao <yi.zhao@windriver.com>
Message-ID: <20130605100559.GE30727@jama>
References: <cover.1370414193.git.yi.zhao@windriver.com>
	<d26bc9ddb088a29796402194ab5649cfbf916248.1370414193.git.yi.zhao@windriver.com>
MIME-Version: 1.0
In-Reply-To: <d26bc9ddb088a29796402194ab5649cfbf916248.1370414193.git.yi.zhao@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] kernel.bbclass: Fix link for modules-${MACHINE}.tgz
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Jun 2013 10:05:43 -0000
X-Groupsio-MsgNum: 40178
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uCPdOCrL+PnN2Vxy"
Content-Disposition: inline

--uCPdOCrL+PnN2Vxy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 05, 2013 at 05:20:50PM +0800, Yi Zhao wrote:
> The modules-${MACHINE}.tgz should link to ${MODULE_TARBALL_BASE_NAME}.
> But now it links to an invalid file ${MODULE_TARBALL_BASE_NAME}.bin.
> Remove the extra .bin suffix.
>=20
> [YOCTO #4595]

Looks good, thanks for fixing it.

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

>=20
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>  meta/classes/kernel.bbclass |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 6550615..40a6b5b 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -375,7 +375,7 @@ kernel_do_deploy() {
>  	if [ ${MODULE_TARBALL_DEPLOY} =3D "1" ] && (grep -q -i -e '^CONFIG_MODU=
LES=3Dy$' .config); then
>  		mkdir -p ${D}/lib
>  		tar -cvzf ${DEPLOYDIR}/${MODULE_TARBALL_BASE_NAME} -C ${D} lib
> -		ln -sf ${MODULE_TARBALL_BASE_NAME}.bin ${DEPLOYDIR}/${MODULE_TARBALL_S=
YMLINK_NAME}
> +		ln -sf ${MODULE_TARBALL_BASE_NAME} ${DEPLOYDIR}/${MODULE_TARBALL_SYMLI=
NK_NAME}
>  	fi
> =20
>  	ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin ${DEPLOYDIR}/${KERNEL_IMAGE_SYMLIN=
K_NAME}.bin
> --=20
> 1.7.9.5
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--uCPdOCrL+PnN2Vxy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlGvDYcACgkQN1Ujt2V2gByYvgCeLDNO+qkqrN9AvXHkMDgZcGs/
QdkAoJkYsoglUfTrkizUPoN8FD5TPUnY
=5fsC
-----END PGP SIGNATURE-----

--uCPdOCrL+PnN2Vxy--
