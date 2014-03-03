Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f49.google.com (mail-ee0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id AE5B66F585
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Mar 2014 11:52:41 +0000 (UTC)
Received: by mail-ee0-f49.google.com with SMTP id c41so37272eek.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Mar 2014 03:52:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=0WOH2g9wzk3qjiIJD33cjWO8k4GENMUkZB6S4GRtxzA=;
	b=eD9rzdGiZh5B/KCNaVa7lAo3txi6vGP7M4JJBsvWNwtF3aVFB8fc3ebb/rFFVkUyqw
	nyJiFWwwFP2PKWwyiFRr2AOAMhHGtJD9FNODhwTixO+GACrnX6vFX/UezvkwGJ1f6MrW
	ihHFRM3qkHe5r7hVfzimWq/iIr5NmfkKfrTy5vIjYHr1LJaN9b8KfW+KlkKp4MYFXygD
	Bh4KqWjwYU10UIjV2c4S33MDX6pyTh/pSPSwSIdX32AihU0d0LTwwdKdNY6sNHlprVq+
	kEupk0TaVbojdi2xIIjHcv0QJlSs5ROF1vAj5iyCwwGOkvFPfzfK3RWCmQCQ39suXd5P
	8GDw==
X-Received: by 10.14.176.195 with SMTP id b43mr5263058eem.99.1393847561603;
	Mon, 03 Mar 2014 03:52:41 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	a2sm49133081eem.18.2014.03.03.03.52.38 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Mar 2014 03:52:40 -0800 (PST)
Date: Mon, 3 Mar 2014 12:52:38 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20140303115238.GP26981@jama>
References: <1393781961.22581.7.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1393781961.22581.7.camel@ted>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH RFC] bitbake.conf/base.bbclass: Drop PRINC support
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
X-List-Received-Date: Mon, 03 Mar 2014 11:52:44 -0000
X-Groupsio-MsgNum: 50784
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Y4E6tNLPdzD/Rx2+"
Content-Disposition: inline

--Y4E6tNLPdzD/Rx2+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 02, 2014 at 05:39:21PM +0000, Richard Purdie wrote:
> PRINC is no longer needed since we have the PR service instead
> which people should be using. Drop the PRINC code.

Many layers are still using it and there wasn't enough of PV bumps to
remove them :(.

> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index 3e9051c..3cbf2cb 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -455,18 +455,6 @@ python () {
>          else:
>              appendVar('EXTRA_OECONF', extraconf)
> =20
> -    # If PRINC is set, try and increase the PR value by the amount speci=
fied
> -    princ =3D d.getVar('PRINC', True)
> -    if princ and princ !=3D "0":
> -        pr =3D d.getVar('PR', True)
> -        pr_prefix =3D re.search("\D+",pr)
> -        prval =3D re.search("\d+",pr)
> -        if pr_prefix is None or prval is None:
> -            bb.error("Unable to analyse format of PR variable: %s" % pr)
> -        nval =3D int(prval.group(0)) + int(princ)
> -        pr =3D pr_prefix.group(0) + str(nval) + pr[prval.end():]
> -        d.setVar('PR', pr)
> -
>      pn =3D d.getVar('PN', True)
>      license =3D d.getVar('LICENSE', True)
>      if license =3D=3D "INVALID":
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 4879aa2..a4a7107 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -188,7 +188,6 @@ ASSUME_PROVIDED =3D "\
>  PN =3D "${@bb.parse.BBHandler.vars_from_file(d.getVar('FILE'),d)[0] or '=
defaultpkgname'}"
>  PV =3D "${@bb.parse.BBHandler.vars_from_file(d.getVar('FILE'),d)[1] or '=
1.0'}"
>  PR =3D "${@bb.parse.BBHandler.vars_from_file(d.getVar('FILE'),d)[2] or '=
r0'}"
> -PRINC ?=3D "0"
>  PF =3D "${PN}-${EXTENDPE}${PV}-${PR}"
>  EXTENDPE =3D "${@['','${PE\x7d_'][int(d.getVar('PE',1) or 0) > 0]}"
>  P =3D "${PN}-${PV}"
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Y4E6tNLPdzD/Rx2+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMUbQYACgkQN1Ujt2V2gByTeACgtpn8jW0vAEZVgbzpztcwB9k6
0TYAoI+P0AqYMiv6VSj5ydqsnSxa5uvR
=zPRw
-----END PGP SIGNATURE-----

--Y4E6tNLPdzD/Rx2+--
