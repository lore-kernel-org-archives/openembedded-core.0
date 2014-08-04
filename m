Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f171.google.com (mail-we0-f171.google.com
	[74.125.82.171])
	by mail.openembedded.org (Postfix) with ESMTP id A185262252
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Aug 2014 19:39:37 +0000 (UTC)
Received: by mail-we0-f171.google.com with SMTP id p10so8298277wes.30
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Aug 2014 12:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=rSM+a6DQ12AfP8ZTdBJc3k96JS+SJWQgAmqADzsOMBg=;
	b=D1zTzfmiGPZTH7qnToxCuOqLINJobD8TQNWkcvsTQ1xooUIca9I4apA3NVmPC+gkQA
	i3L4VGBGlOlKqd3aLA0vwMYGsDgxcG6rbBqijo22gPVp+gAt4BaDiVoM35S13ncvklfe
	LaBb510AsH6RUftj1drn9z0bevujLd/p+1su7QoPuGg0S5Jdw25rMyX4qBIePKe/jDgg
	EAp4wqe0v6A59eFjFTonD7vnOj2e4MLJXDC/0kWvLMYYP8cBUUGH/C2x9ALD/ngs+vx/
	xDp7MXoJ6ORZdhb6llEMK39DiRfs2C1jPu78UKynY/aytOrTy3yNsPxrC+j39VHNr/CE
	TwBQ==
X-Received: by 10.180.183.36 with SMTP id ej4mr32169677wic.77.1407181178046;
	Mon, 04 Aug 2014 12:39:38 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id eh10sm47022wic.0.2014.08.04.12.39.36
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Aug 2014 12:39:37 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 4 Aug 2014 21:40:05 +0200
To: Ben Shelton <ben.shelton@ni.com>
Message-ID: <20140804194005.GD2465@jama>
References: <cover.1407177403.git.ben.shelton@ni.com>
	<9288a31de2b502a43e9d0067ff9c1378133d00a4.1407177403.git.ben.shelton@ni.com>
MIME-Version: 1.0
In-Reply-To: <9288a31de2b502a43e9d0067ff9c1378133d00a4.1407177403.git.ben.shelton@ni.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 20/20] udev: don't halt if devtmpfs can't be mounted
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
X-List-Received-Date: Mon, 04 Aug 2014 19:39:41 -0000
X-Groupsio-MsgNum: 55953
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="F8dlzb82+Fcn6AgP"
Content-Disposition: inline

--F8dlzb82+Fcn6AgP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 04, 2014 at 01:41:12PM -0500, Ben Shelton wrote:
> From: Richard Tollerton <rich.tollerton@ni.com>
>=20
> Halting if udev cannot start is problematic for a couple reasons.
> - Compared to a reboot loop, halting is much more difficult to recover
>   from in remote deployments.
> - If the rootfs has a prepopulated /dev (which happens somewhat often),
>   the system may be able to boot up just fine, or at least fine enough
>   for the administrator to log in and fix things.
>=20
> Instead of halting, just exit, and let the administrator deal with the
> potential reboot loop.
>=20
> Natinst-Rally-ID: TA44427
> Acked-by: Gratian Crisan <gratian.crisan@ni.com>
> Acked-by: Scot Salmon <scot.salmon@ni.com>
> Natinst-ReviewBoard-ID: 58623
> Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
> ---
>  meta/recipes-core/udev/udev/init | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-core/udev/udev/init b/meta/recipes-core/udev/ud=
ev/init
> index 6caf7d5..f6a8391 100644
> --- a/meta/recipes-core/udev/udev/init
> +++ b/meta/recipes-core/udev/udev/init
> @@ -45,8 +45,7 @@ case "$1" in
>      if ! grep -q devtmpfs /proc/filesystems
>      then
>          echo "Missing devtmpfs, which is required for udev to run";
> -        echo "Halting..."
> -        halt
> +	exit 1

Please use spaces for indentation like previous lines.

>      fi
>      # mount the devtmpfs on /dev, if not already done
>      LANG=3DC awk '$2 =3D=3D "/dev" && ($3 =3D=3D "devtmpfs") { exit 1 }'=
 /proc/mounts && {
> --=20
> 2.0.4
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--F8dlzb82+Fcn6AgP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPf4ZUACgkQN1Ujt2V2gBxRdgCfRfabrHbsBQHsKFgx4AkuzRxk
XqUAmgJr7H4TFwWpiHR4Uyh3uCvGxywJ
=zOYP
-----END PGP SIGNATURE-----

--F8dlzb82+Fcn6AgP--
