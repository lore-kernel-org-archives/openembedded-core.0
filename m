Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f178.google.com (mail-ea0-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id C758360ED9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2013 10:23:35 +0000 (UTC)
Received: by mail-ea0-f178.google.com with SMTP id a15so5243825eae.37
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2013 03:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=lEBBmD47YuDdagumzfEc/IBdllAM9D/b0FjCmZ0P1k8=;
	b=aFEDI8CRgAoJsPVDnGg14/CZqgcHNRzklP0rUyfNhupxOS2mN7ecsNh1WO2S+8ZohU
	dDkZ5aw3QVl3bxnX4l9p+3Zp5w9cCtz48OnF+uh70uWlM0sSs+SLqHDB3sxHnlvF0xEi
	bwNlRZ1PspRvr30SPjzTpg0Luc7+m2iIlQ7Co5t/eLHo8A+UAgLR7o0tYlAapaW17U64
	+p/N7Y5m3Y2FcdMJR+Vr4jCNVjkZxE5sU0AeL1MreQlsk1jJMv2eMh5LXDK9XLmdgi6Z
	r5osPeeA/1Ai1UJ+YZ0YmDVTY15A1MB/L9SsRG3pcKdpBLLpqFs6ib80VjxjQs99/m1u
	2aeQ==
X-Received: by 10.15.75.73 with SMTP id k49mr9764411eey.36.1378981416727;
	Thu, 12 Sep 2013 03:23:36 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	z12sm4586562eev.6.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 12 Sep 2013 03:23:35 -0700 (PDT)
Date: Thu, 12 Sep 2013 12:25:03 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Qi.Chen@windriver.com
Message-ID: <20130912102503.GY11500@jama>
References: <cover.1378978986.git.Qi.Chen@windriver.com>
	<4802511117bc648d9cd10d8262645069d9db1317.1378978986.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
In-Reply-To: <4802511117bc648d9cd10d8262645069d9db1317.1378978986.git.Qi.Chen@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] update-rc.d.bbclass: change RRECOMMENDS to RDEPENDS
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
X-List-Received-Date: Thu, 12 Sep 2013 10:23:36 -0000
X-Groupsio-MsgNum: 44876
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SBKwXYz1xY/kcGv0"
Content-Disposition: inline

--SBKwXYz1xY/kcGv0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 12, 2013 at 05:43:55PM +0800, Qi.Chen@windriver.com wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>=20
> If a package inherits update-rc.d.bbclass, it actually needs it to
> update the symlinks under /etc/rc?.d/ directories. This is a runtime
> dependency. For example, if we try to upgrade the dropbear on target,
> its postinst process will need the update-rc.d utility available,
> otherwise, the upgrade process will fail.
>=20
> Besides, if we only recommend update-rc.d, the do_rootfs process will
> fail once NO_RRECOMMENDATIONS is enabled. Because in OE, we try to do
> the postinsts at rootfs time.

IIRC it was changed to allow systemd images to be built completely
without update-rc.d (with BAD_RECOMMENDATIONS +=3D "update-rc.d") and it's
IMHO still valid use-case as update-rc.d is inherited even when systemd
is used.

>=20
> This patch fixes this problem by changing the RRECOMMENDS to RDEPENDS
> to let the packages actually rdepend on update-rc.d.
>=20
> [YOCTO #5169]
>=20
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/classes/update-rc.d.bbclass |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.=
bbclass
> index 5588569..3dee13a 100644
> --- a/meta/classes/update-rc.d.bbclass
> +++ b/meta/classes/update-rc.d.bbclass
> @@ -6,7 +6,7 @@ UPDATERCD_virtclass-cross =3D ""
>  UPDATERCD_class-native =3D ""
>  UPDATERCD_class-nativesdk =3D ""
> =20
> -RRECOMMENDS_${UPDATERCPN}_append =3D " ${UPDATERCD}"
> +RDEPENDS_${UPDATERCPN}_append =3D " ${UPDATERCD}"
> =20
>  INITSCRIPT_PARAMS ?=3D "defaults"
> =20
> --=20
> 1.7.9.5
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--SBKwXYz1xY/kcGv0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlIxln8ACgkQN1Ujt2V2gBwqRACeJiZCwODsFRqNOnohGWBdHuqE
AQ0AoLn+mw6dSHRE9bfbY1cBxPK76f9j
=3iG9
-----END PGP SIGNATURE-----

--SBKwXYz1xY/kcGv0--
