Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 5C6EB6013D;
	Sat, 21 Mar 2015 02:11:10 +0000 (UTC)
Received: by wibdy8 with SMTP id dy8so2448364wib.0;
	Fri, 20 Mar 2015 19:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=na0tNKCjcWtkQ5G1XcZ92LNEEC5ReBUkq6/7RC7xD1w=;
	b=IW01PqGhABxkOEUa9XFmUkq5I2+rJcFsvzRPPxOUMBPCJUgMXeRXQErl9d54ywo8zl
	mIEUCEDD3iUjFpRT9F+8pBhESMiG+XF+qjeu9WsdJaKJa5zABbwZYH45cZwMyIFxjJ0F
	ciEKHKQ80uLw1cTkbQ/C7XQd4c5bJIgZV8gU6+QrrsQtfokqi6FLARKwiCHwlCrAqWeS
	9aDRKfl/UIXSmoQ5JVF72hbX5J+0n5IXzJtMDPc5cqX/+K3GHbn5opoaRmHs5fwSaF7e
	mYVyVvGiupYOIWxDZXpdA2JU1VGHaoYJ9kJq14gZMku6VWz7jFV7wiUkxASDh+miGwLl
	o4oA==
X-Received: by 10.180.74.47 with SMTP id q15mr926803wiv.49.1426903871269;
	Fri, 20 Mar 2015 19:11:11 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	14sm8690228wjv.29.2015.03.20.19.11.10
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 20 Mar 2015 19:11:10 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 21 Mar 2015 03:11:20 +0100
To: openembedded-core@lists.openembedded.org, Jonathan Liu <net147@gmail.com>
Message-ID: <20150321021120.GF4738@jama>
References: <20150316174236.48B8050234@opal.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20150316174236.48B8050234@opal.openembedded.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Jonathan Liu : fontcache.bbclass: prepend to PACKAGEFUNCS instead of appending
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
X-List-Received-Date: Sat, 21 Mar 2015 02:11:13 -0000
X-Groupsio-MsgNum: 63587
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Pql/uPZNXIm1JCle"
Content-Disposition: inline

--Pql/uPZNXIm1JCle
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 16, 2015 at 05:42:36PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: f0e3db4eaacc32423934ce09b91bc619dc5dbd21
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3Df0e3db4eaacc32423934ce09b91bc619dc5dbd21
>=20
> Author: Jonathan Liu <net147@gmail.com>
> Date:   Mon Mar  9 12:13:56 2015 +1100
>=20
> fontcache.bbclass: prepend to PACKAGEFUNCS instead of appending
>=20
> Appending to PACKAGEFUNCS results in the font packages missing the
> postinst/postrm scripts and the fontconfig cache not being generated
> in /var/cache/fontconfig when creating images or installing font
> packages. This is because the package data has already been emitted
> by emit_pkgdata in PACKAGEFUNCS. Prepend to PACKAGEFUNCS to ensure
> add_fontcache_postinsts is executed before emit_pkgdata.

It's not caused by this change, but fixing this issue revealed that
fc-cache doesn't really work here.

Every time the intercept_scripts/update_font_cache executes qemu it gets
"stuck" eating a lot of cpu and memory until it dies. Is anyone alse
seeing this behavior?

WARNING: The postinstall intercept hook 'update_font_cache' failed (exit co=
de: 137)! See log for details!
WARNING: The postinstalls for the following packages will be postponed for =
first boot: liberation-fonts
ERROR: The following packages could not be configured offline and rootfs is=
 read-only: ['liberation-fonts']
ERROR: Function failed: do_rootfs

bitbake  32618 98.8 67.1 11031512 10983420 pts/3 R+ 03:00   4:53
qemu-i386 -r 2.6.32 -L /OE/rootfs -E uD_LIBRARY_PATH=3D/OE/rootfs//usr/lib:=
/OE/rootfs//lib /OE/rootfs/usr/bin/fc-cache --sysroot=3D/OE/rootfs

>=20
> [YOCTO #7410]
>=20
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
>=20
> ---
>=20
>  meta/classes/fontcache.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/fontcache.bbclass b/meta/classes/fontcache.bbcl=
ass
> index ad5892c..dfbdfa1 100644
> --- a/meta/classes/fontcache.bbclass
> +++ b/meta/classes/fontcache.bbclass
> @@ -42,4 +42,4 @@ python add_fontcache_postinsts() {
>          d.setVar('pkg_postrm_%s' % pkg, postrm)
>  }
> =20
> -PACKAGEFUNCS +=3D "add_fontcache_postinsts"
> +PACKAGEFUNCS =3D+ "add_fontcache_postinsts"
>=20
> --=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Pql/uPZNXIm1JCle
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlUM00gACgkQN1Ujt2V2gBxYoQCfcRRLZYak3084lMSWxstwYuH2
axAAoJCz+JoDjqDVVA0/U3+rJU387EmP
=mxp5
-----END PGP SIGNATURE-----

--Pql/uPZNXIm1JCle--
