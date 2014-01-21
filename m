Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id EB37360155
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 13:01:11 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id e49so4099945eek.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 05:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=jJvHhly1V/VDSE3hqHyvGOzAqUkCBHp4a2zyjeQqFjQ=;
	b=0JNvuM4LRdcYCtENF7h2c6u2pCTFm1nQ8yoVlv/hYtZvK5aMFUcz1nPnHiBVkXSv/P
	1CVyeE676qMkb0lWPYYAmzORNM30t0Jt09G01eNEuSdhsFcTjP+RI0wzsGcfOlq9jJkj
	G25yN2i5f2RLvJRef7wQ7IyB1VV7pLHqsM6LZudnzqblXvLRds69eJ2TLwsMrb3X2kla
	9Sgkg7aShFgSlr6DxXl6TEWPv8nMPSVLfAb7dJ+GFv21yPTOCeNcqncz+fDDz4vEt2UE
	3kNyNhTbbGj1KocUsBmd1dVD4Iip/9HwXZFz2oA5bFiAInNSQHXNgHMV0Bz1xV9VY6j4
	XJyA==
X-Received: by 10.14.172.69 with SMTP id s45mr23664870eel.9.1390309272110;
	Tue, 21 Jan 2014 05:01:12 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id u7sm14585898eep.11.2014.01.21.05.01.10
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Jan 2014 05:01:11 -0800 (PST)
Date: Tue, 21 Jan 2014 14:01:10 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Koen Kooi <koen.kooi@linaro.org>
Message-ID: <20140121130110.GC4100@jama>
References: <1390302081-29499-1-git-send-email-koen.kooi@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1390302081-29499-1-git-send-email-koen.kooi@linaro.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd 208: move stray /usr/lib/systemd/* into /lib/systemd
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
X-List-Received-Date: Tue, 21 Jan 2014 13:01:13 -0000
X-Groupsio-MsgNum: 49261
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2/5bycvrmDh4d1IB"
Content-Disposition: inline

--2/5bycvrmDh4d1IB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 21, 2014 at 12:01:21PM +0100, Koen Kooi wrote:
> From: Koen Kooi <koen@dominion.thruhere.net>
>=20
> Apps testing for systemd config get confused when both /usr/lib/systemd a=
nd /lib/systemd exist. This fixes (among other things) dracut systemd detec=
tions.
>=20
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  meta/recipes-core/systemd/systemd_208.bb | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/meta/recipes-core/systemd/systemd_208.bb b/meta/recipes-core=
/systemd/systemd_208.bb
> index 6590235..710624c 100644
> --- a/meta/recipes-core/systemd/systemd_208.bb
> +++ b/meta/recipes-core/systemd/systemd_208.bb
> @@ -113,6 +113,12 @@ do_install() {
> =20
>          # Delete journal README, as log can be symlinked inside volatile.
>          rm -f ${D}/${localstatedir}/log/README
> +
> +	# fix up libdir confusion
> +	if [ -d ${D}${libdir}/systemd ] ; then
> +		cp -a ${D}${libdir}/systemd/* ${D}${systemd_unitdir}
> +		rm -rf ${D}${libdir}/systemd
> +	fi

It's not your fault, but the indentation looks inconsistent with rest of
do_install()

>  }
> =20
>  do_install_ptest () {
> --=20
> 1.8.4.2
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--2/5bycvrmDh4d1IB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLeb5YACgkQN1Ujt2V2gByc6wCfaEEmO61EU6iguZf/qSBuIGGe
ZG8AnjrLTge3Ozh38HCZJ4oS0dbLNltc
=gyEk
-----END PGP SIGNATURE-----

--2/5bycvrmDh4d1IB--
