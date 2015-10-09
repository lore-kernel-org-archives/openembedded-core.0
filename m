Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 225F97391A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Oct 2015 14:19:29 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so69016214wic.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Oct 2015 07:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ONYwXFctOQG4VBevG0/UH7Pd51QSAT7Od1SNllta/Ys=;
	b=DUqkeDtauIESghdeFGkZH8CmAYf6wgrZuAE0ad77YjNf5MjtOr/iJJ41IG9V1VbdQo
	yj0FAS+OSk+JM5yiemtDOqSE8jzx3WDScrhG5uD6jabsDv0yXR3t/qaiqKPHjkGKVtzT
	C+TJkv117TEYfp6ThVVxs7eAoSe/qmQEoHDyJ+uAc26Adx+X86/6TbdmifS7gLCN1cUg
	ShPAAG8r4Joet/goF8kz0UjcQvZ9+CtRxULq2YJYJpR+feUnKCAmgTjjdPBB/XU9VTfg
	TXU0B8eJ4k34X0CmM+KDTx7Rm6SvYm9a2ahVNueJEPm92N8qEzv2KAWXeRHORA3ADFgu
	O11w==
X-Received: by 10.180.88.164 with SMTP id bh4mr10392027wib.18.1444400369276;
	Fri, 09 Oct 2015 07:19:29 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id o10sm2982103wia.4.2015.10.09.07.19.28
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Oct 2015 07:19:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 9 Oct 2015 16:19:46 +0200
To: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <20151009141946.GA2384@jama>
References: <cover.1444358567.git.liezhi.yang@windriver.com>
	<c1a0f5138542a1f120dd58958d19efb20adbb223.1444358567.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <c1a0f5138542a1f120dd58958d19efb20adbb223.1444358567.git.liezhi.yang@windriver.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/8] bitbake.conf: set CONFFILES by default
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
X-List-Received-Date: Fri, 09 Oct 2015 14:19:30 -0000
X-Groupsio-MsgNum: 72049
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wac7ysb48OaltWcw"
Content-Disposition: inline

--wac7ysb48OaltWcw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 08, 2015 at 07:44:36PM -0700, Robert Yang wrote:
> There are a lot of binary packages have files in /etc/, but only a few
> of them have set CONFFILES, 187 packages are not set in a world build.
> So treat all the files in /etc/ as CONFILES as Debian does
> - Move the file out of /etc/ if it is not a conffile
> - If /etc/foo can't be moved out, and is changed during
>   runtime, then create a symlink /etc/foo -> /var/foo
>=20
> [YOCTO #8436]
>=20
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/conf/bitbake.conf |    1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 9ddd1c0..7a53819 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -269,6 +269,7 @@ PACKAGE_BEFORE_PN ?=3D ""
>  PACKAGES =3D "${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc ${PN}-locale=
 ${PACKAGE_BEFORE_PN} ${PN}"
>  PACKAGES_DYNAMIC =3D "^${PN}-locale-.*"
>  FILES =3D ""
> +CONFFILES =3D "${sysconfdir}/*"

Should this be
CONFFILS_${PN} ?

> =20
>  FILES_${PN} =3D "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*=
${SOLIBS} \
>              ${sysconfdir} ${sharedstatedir} ${localstatedir} \
> --=20
> 1.7.9.5
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--wac7ysb48OaltWcw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYXzQEACgkQN1Ujt2V2gByNfQCfWj/14H768vUyCe1FR5MksBMV
BJwAn0ioRuACIgm5DHRjlJVbHeB2SAS1
=1wmH
-----END PGP SIGNATURE-----

--wac7ysb48OaltWcw--
