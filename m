Received: from mail-pa0-f42.google.com ([209.85.220.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Txcts-0002EH-HM
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Jan 2013 13:24:57 +0100
Received: by mail-pa0-f42.google.com with SMTP id rl6so4033133pac.15
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jan 2013 04:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=nEzbNhkqN/Sqy+RUQOYe5RUlX8P3KHpX3JUsS5M1VRo=;
	b=bmt7VApiJL2Wr9PiFZKkz7AQ1AcMXKSrRtr+yFlf0XlhdjATiR6zg9uyZg2C65mcTS
	l8z4iyTfNUl8ik1jApiuXjmMOpDRFQ9yfK+8jc1dzdobR3xIEDPz3DhnnH4mQ9P52z+S
	/jnM+ebRwuPr0/9cYQj3g2TSfeviIfgIHAgJtgFWCA3Jp6xFXtLyU5DUKq+Y3skg1VIU
	DyOUFGQHFIx57JQYiTQWF9a219ntc7RMOQxWa45PERfMl5apG2F+Dp3KHt/GgE3SVouN
	3ErdhI0qnSNCsJ/Vb1QsCx6VglGSQCoOkAKkdRTAaXfoPKLFNjIPb3k8M0mNhxNcqBEf
	OlYw==
X-Received: by 10.68.196.133 with SMTP id im5mr39100135pbc.16.1358856533676;
	Tue, 22 Jan 2013 04:08:53 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id
	pl10sm10641362pbc.60.2013.01.22.04.08.50
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 22 Jan 2013 04:08:52 -0800 (PST)
Date: Tue, 22 Jan 2013 13:08:51 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20130122120851.GP29386@jama.palm1.palmone.com>
References: <1358808590.14265.73.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1358808590.14265.73.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] packagedata: Add warnings if multiple recipes try to write the same package
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
X-List-Received-Date: Tue, 22 Jan 2013 12:24:59 -0000
X-Groupsio-MsgNum: 34220
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EkxpYdHiqGHPYbUt"
Content-Disposition: inline

--EkxpYdHiqGHPYbUt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 21, 2013 at 10:49:50PM +0000, Richard Purdie wrote:
> If multiple recipes try and write the same package it resulted in a
> rather confusing traceback and unintuitive error. This patch
> prints a human readable error instead.

bitbake world found 2 more recipes creating the same package:
vim/gvim in meta-oe
gnome-panel3_3.0.2.bb/gnome-panel_2.32.1.b in meta-gnome

But this error is a lot better then that traceback, maybe change commit
message to say fatal errors instead of warnings.

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

Cheers,

>=20
> [YOCTO #3645]
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/classes/packagedata.bbclass b/meta/classes/packagedata.=
bbclass
> index 790d874..120cd64 100644
> --- a/meta/classes/packagedata.bbclass
> +++ b/meta/classes/packagedata.bbclass
> @@ -1,7 +1,8 @@
>  python read_subpackage_metadata () {
>      import oe.packagedata
> =20
> -    data =3D oe.packagedata.read_pkgdata(d.getVar('PN', True), d)
> +    pn =3D d.getVar('PN', True)
> +    data =3D oe.packagedata.read_pkgdata(pn, d)
> =20
>      for key in data.keys():
>          d.setVar(key, data[key])
> @@ -9,5 +10,9 @@ python read_subpackage_metadata () {
>      for pkg in d.getVar('PACKAGES', True).split():
>          sdata =3D oe.packagedata.read_subpkgdata(pkg, d)
>          for key in sdata.keys():
> +            if key =3D=3D "PN":
> +                if sdata[key] !=3D pn:
> +                    bb.fatal("Recipe %s is trying to create package %s w=
hich was already written by recipe %s. This will cause corruption, please r=
esolve this and only provide the package from one recipe or the other or on=
ly build one of the recipes." % (pn, pkg, sdata[key]))
> +                continue
>              d.setVar(key, sdata[key])
>  }
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--EkxpYdHiqGHPYbUt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlD+gVMACgkQN1Ujt2V2gBxqKACfY0HoXHqrKhivm2PZmLOVsdKJ
QGoAn1YENv9kWzWX0DFHc+HNi3CLPqoN
=z0L5
-----END PGP SIGNATURE-----

--EkxpYdHiqGHPYbUt--
