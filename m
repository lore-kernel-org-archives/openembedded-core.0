Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RVMw6-0001Rq-0v
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 13:37:22 +0100
Received: by bkbzs2 with SMTP id zs2so9289786bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 04:30:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=UvxPCSs6nUa6FUOKIRUN57XSKMpRTxEH5CVYt+D/BR8=;
	b=gukrCnIBhzFzU6HYMmG+u7yDND1xVq75YFdK9QqtDwOaow/wCRaSVJ39Tr/mx1n5Ha
	4N0CE7DwgSD/Ven5MGbDI/EisPE8Scs4C0SqacPz0DoPc3G1hFyp9V4O+C+nRqTGftSv
	ou1aEQIaRcc/GLiBDHuoOGdAIBlT/pg3Sd2oo=
Received: by 10.204.149.215 with SMTP id u23mr51234989bkv.105.1322569842760;
	Tue, 29 Nov 2011 04:30:42 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id c4sm36702719bkk.13.2011.11.29.04.30.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 29 Nov 2011 04:30:39 -0800 (PST)
Date: Tue, 29 Nov 2011 13:30:27 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111129123027.GF7441@jama.jama.net>
References: <1322521031-26849-1-git-send-email-msm@freescale.com>
	<CAEsOVNfRuMJfh3HW-6=0ivjngv+e8Dxk7fKo_ySUSgB4EYDrLg@mail.gmail.com>
	<1322569564.3166.1.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1322569564.3166.1.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: McClintock Matthew-B29882 <B29882@freescale.com>
Subject: Re: [PATCH] eglibc-initial: Ensure symlinks point to the correct location when built from sstate cache
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
X-List-Received-Date: Tue, 29 Nov 2011 12:37:22 -0000
X-Groupsio-MsgNum: 13096
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QXO0/MSS4VvK6f+D"
Content-Disposition: inline

--QXO0/MSS4VvK6f+D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 29, 2011 at 12:26:04PM +0000, Richard Purdie wrote:
> If the sstate files are installed into a sysroot from the sstate cache,
> the directory to the main sysroot can change and the symlinks aren't
> adjusted to account for this. This is a problem specific to the toolchain
> bootstrap process. This patch adds up a function to recreate the
> symlinks, hence ensuring they always point at the correct location.

Similar issue is IMHO in python and apr (and probably more)
http://lists.linuxtogo.org/pipermail/openembedded-core/2011-November/012149=
=2Ehtml

Cheers,

> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/recipes-core/eglibc/eglibc-initial.inc b/meta/recipes-c=
ore/eglibc/eglibc-initial.inc
> index 448f73a..9062516 100644
> --- a/meta/recipes-core/eglibc/eglibc-initial.inc
> +++ b/meta/recipes-core/eglibc/eglibc-initial.inc
> @@ -60,4 +60,16 @@ do_siteconfig () {
>  	:
>  }
> =20
> +SSTATEPOSTINSTFUNCS +=3D "eglibcinitial_sstate_postinst"
> +eglibcinitial_sstate_postinst() {
> +	if [ "${BB_CURRENTTASK}" =3D "populate_sysroot" -o "${BB_CURRENTTASK}" =
=3D "populate_sysroot_setscene" ]
> +	then
> +		# Recreate the symlinks to ensure they point to the correct location
> +		for t in linux asm asm-generic; do
> +			rm -f ${STAGING_DIR_TCBOOTSTRAP}${includedir}/$t
> +			ln -s ${STAGING_DIR_TARGET}${includedir}/$t ${STAGING_DIR_TCBOOTSTRAP=
}${includedir}/
> +		done
> +	fi
> +}
> +
>  do_populate_sysroot[sstate-outputdirs] =3D "${STAGING_DIR_TCBOOTSTRAP}"
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--QXO0/MSS4VvK6f+D
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7U0GMACgkQN1Ujt2V2gBzxVgCffBxtrn37pmGlO9Qbzv1Wwh8y
XTAAnip76zRIjMyXE3Kxc5n4A+V5VLws
=W7wC
-----END PGP SIGNATURE-----

--QXO0/MSS4VvK6f+D--
