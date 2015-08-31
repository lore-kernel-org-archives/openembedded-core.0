Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 442C274197;
	Mon, 31 Aug 2015 18:41:08 +0000 (UTC)
Received: by wibq14 with SMTP id q14so9118112wib.0;
	Mon, 31 Aug 2015 11:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=v9KrL3rIW/8T5QkN4wUt8gf37Zp9vLUeCW0N4SeMTZY=;
	b=JIxhd0nxrH70/i7W5ge3tHRJxxta6w/Sqf9f0An9Rdu87AI4UHA4hK7h4ZAmj/91TR
	yZ06i0MobCExQyMg/ONm+1drQfwjj+w9MvOpI8DKW2UG6rojBAu156QC9rs340tNe8Wj
	PDYSDXz8BxXd6O3DWAqdnqBcvmXSSAXEl5pzTihwfexDU3rwUFZ9N4tVP9sjPJHdo6sf
	EModrWyHngnU9QroHo/jjsE9c5IvRR2WHpx1eR9NdUKliw1bQ1ZDPP2PO+9LF0iO2kqL
	zNKWBfheN54wFScFjRKtwn1km/KJqlkShyG38QiwJmGMzyDqoI2oVfj0SFZkK9p9xCKx
	ymWA==
X-Received: by 10.180.84.65 with SMTP id w1mr12855wiy.62.1441046468286;
	Mon, 31 Aug 2015 11:41:08 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	xs1sm23430459wjc.7.2015.08.31.11.41.07
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 31 Aug 2015 11:41:07 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 31 Aug 2015 20:41:13 +0200
To: openembedded-core@lists.openembedded.org,
	Christopher Larson <chris_larson@mentor.com>
Message-ID: <20150831184113.GF2465@jama>
References: <20150830114819.3628250369@opal.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20150830114819.3628250369@opal.openembedded.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Christopher Larson : update-rc.d.bbclass: explicitly dep on initscripts
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
X-List-Received-Date: Mon, 31 Aug 2015 18:41:11 -0000
X-Groupsio-MsgNum: 70370
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qp4W5+cUSnZs0RIF"
Content-Disposition: inline

--qp4W5+cUSnZs0RIF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 30, 2015 at 11:48:19AM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 833302761df924bb503cc2ad04ecae1023381f8f
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D833302761df924bb503cc2ad04ecae1023381f8f
>=20
> Author: Christopher Larson <chris_larson@mentor.com>
> Date:   Mon Aug 24 15:18:34 2015 -0700
>=20
> update-rc.d.bbclass: explicitly dep on initscripts
>=20
> update-rc.d doesn't just want an initscripts package, it wants
> initscripts-functions. In the case where VIRTUAL-RUNTIME_initscripts is s=
et to
> nothing, update-rc.d still needs initscripts-functions to satisfy its run=
time
> dependencies. Further, we shouldn't be using a *runtime* virtual in a *bu=
ild
> time* variable. This should resolve image creation failures with
> configurations without sysv initscripts when a recipe inherits update-rc.=
d and
> doesn't inherit systemd.
>=20
> (From OE-Core rev: e6642ae0849e5ac3174c643a7693af25d829d6d1)

Unfortunately this means that I cannot PNBLACKLIST initscripts recipe in
DISTRO which provides own initscripts implementation (which also
provides initscripts-functions).

What's even worse is that I'll have to overlay whole bbclass to get rid
of this dependency :/

Regards,

>=20
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> ---
>=20
>  meta/classes/update-rc.d.bbclass | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.=
bbclass
> index 6a08315..2a0a74a 100644
> --- a/meta/classes/update-rc.d.bbclass
> +++ b/meta/classes/update-rc.d.bbclass
> @@ -1,8 +1,6 @@
>  UPDATERCPN ?=3D "${PN}"
> =20
> -DEPENDS_append_class-target =3D " update-rc.d-native update-rc.d"
> -VIRTUAL-RUNTIME_initscripts ?=3D "initscripts"
> -DEPENDS_append_class-target =3D " ${VIRTUAL-RUNTIME_initscripts}"
> +DEPENDS_append_class-target =3D " update-rc.d-native update-rc.d initscr=
ipts"
>  UPDATERCD =3D "update-rc.d"
>  UPDATERCD_class-cross =3D ""
>  UPDATERCD_class-native =3D ""
>=20
> --=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--qp4W5+cUSnZs0RIF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXkn8kACgkQN1Ujt2V2gByXjQCgpatvLcckj1mFOyN6ycXdaZD6
5goAnj7NFOevcw+NVrKkAnkLR8lW5mcC
=o59u
-----END PGP SIGNATURE-----

--qp4W5+cUSnZs0RIF--
