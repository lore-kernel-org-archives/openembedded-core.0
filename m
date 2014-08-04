Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f182.google.com (mail-we0-f182.google.com
	[74.125.82.182])
	by mail.openembedded.org (Postfix) with ESMTP id 7AA1562252
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Aug 2014 19:41:31 +0000 (UTC)
Received: by mail-we0-f182.google.com with SMTP id k48so8187299wev.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Aug 2014 12:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=hpPxwlz+5bS+HYiMlgPrHWI1xNjYzgeXioaH1JqLhAA=;
	b=BpflNTg5q8j93tXNDYLHDt7woM0ti4LY3Ntr476oRp4CKQ8nMR7IpyBtY5Kpzxynr8
	iKRcmNYJA575V70PMmgyiIwRB2TjMKYhNWtfLuj9n3WzVFfcXNRs2SYSOhBSGfT799+f
	puJiY6pl35H2DMLo9EXQ52cn+zjxnV0++GBHoiBFf13BOH0pFBBBHHo/zekGxSo+FUXz
	auIiBhp6DdP3C6TSGlaSPua1QUPOZkD8ZHY3ytBtuNtURs00WgLQgZPOSe94GeWuZbE/
	47JiXPc/MblJYYM5MZKbuefR3FGHFolqHnhGOgariEv6TjYTe+80clZ6jII9uj1HXfg+
	b7UQ==
X-Received: by 10.194.123.129 with SMTP id ma1mr35508476wjb.80.1407181291743; 
	Mon, 04 Aug 2014 12:41:31 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id je3sm29082wic.11.2014.08.04.12.41.30
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Aug 2014 12:41:30 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 4 Aug 2014 21:41:59 +0200
To: Ben Shelton <ben.shelton@ni.com>
Message-ID: <20140804194159.GE2465@jama>
References: <cover.1407177403.git.ben.shelton@ni.com>
	<b56115f746af1b91da18dc418f8f647345f942fe.1407177403.git.ben.shelton@ni.com>
MIME-Version: 1.0
In-Reply-To: <b56115f746af1b91da18dc418f8f647345f942fe.1407177403.git.ben.shelton@ni.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 19/20] udev: Disable keymap support on machines lacking keyboard support
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
X-List-Received-Date: Mon, 04 Aug 2014 19:41:33 -0000
X-Groupsio-MsgNum: 55954
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UnaWdueM1EBWVRzC"
Content-Disposition: inline

--UnaWdueM1EBWVRzC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 04, 2014 at 01:41:11PM -0500, Ben Shelton wrote:
> From: Richard Tollerton <rich.tollerton@ni.com>
>=20
> /lib/udev/keymaps/ is 244k. On headless machines, this is wasted space.
>=20
> Natinst-Rally-ID: TA44427
> Acked-by: Gratian Crisan <gratian.crisan@ni.com>
> Natinst-ReviewBoard-ID: 58621
> Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
> ---
>  meta/recipes-core/udev/udev.inc | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/recipes-core/udev/udev.inc b/meta/recipes-core/udev/ude=
v.inc
> index 8394064..2d2150c 100644
> --- a/meta/recipes-core/udev/udev.inc
> +++ b/meta/recipes-core/udev/udev.inc
> @@ -51,6 +51,7 @@ EXTRA_OECONF =3D "--disable-introspection \
>                  --with-rootlibdir=3D${base_libdir} \
>                  --with-rootprefix=3D \
>                  --without-systemdsystemunitdir \
> +                ${@base_contains('MACHINE_FEATURES', 'keyboard', '', '--=
disable-keymap', d)} \

udev isn't MACHINE_ARCH, so you cannot use MACHINE_FEATURES there.

But you can add PACKAGECONFIG and let DISTRO decide if all supported
MACHINEs are headless, it can disable it.

>                 "
> =20
>  PACKAGES =3D+ "udev-cache"
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

--UnaWdueM1EBWVRzC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPf4gcACgkQN1Ujt2V2gBxCAACeNHYRE/R9s3NqVBwyzopSLg3A
c5EAn0KmKO8rQWFtRoODWNZ9Fc9uYbEa
=j+ae
-----END PGP SIGNATURE-----

--UnaWdueM1EBWVRzC--
