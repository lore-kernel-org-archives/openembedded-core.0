Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 8E35B601F5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Dec 2014 21:47:57 +0000 (UTC)
Received: by mail-wi0-f173.google.com with SMTP id r20so36252735wiv.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Dec 2014 13:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=/+fsoh5YaZMwsTkA+UOMUpwEVL0oJT/d4ds0WuTJ/4A=;
	b=kcGYWUNsbj2w8mTcbaieglak3Ap/Y463TvXp7PRmKOdyzvv4fBivHJOZGwD3CM44lm
	P4xQvNa0vjQqSVNr/pKJNMGgvSaWMRvkmJxMmA6c/ET/dGUDAVUXleZIiyg/+9JfVoHs
	ymoSMEI43zMFFkhwoSnonGbABoaNUbw7qMQDCLXnW8XhUzW7FSwZed0OiHB6ReD9c3VL
	d3Q/Bolb61eJCCbZlG6F6U9khO5lew7UsDg00cSHQtst7K9p1jm5+8e33nB4Holbd/z+
	nWHRTUX9VioW+XTlEfqa2vPDTi2nIk6l0G3xHjZTj6oJtsWOVQPCbU7IiT76580mpzB5
	Uwjg==
X-Received: by 10.180.205.163 with SMTP id lh3mr320134wic.63.1417729677433;
	Thu, 04 Dec 2014 13:47:57 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ry19sm42228763wjb.3.2014.12.04.13.47.56 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Dec 2014 13:47:56 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 4 Dec 2014 22:48:00 +0100
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20141204214800.GF2453@jama>
References: <1417087023-29423-1-git-send-email-gshastri@juniper.net>
	<969F26A8BAB325438E7EB80D3C3134FB2F3C5556@IRSMSX105.ger.corp.intel.com>
	<1417722559.15614.58.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1417722559.15614.58.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"gmshastri@gmail.com" <gmshastri@gmail.com>
Subject: Re: [PATCH] When building with systemd based image, udev-hwdb postinstall script will fail because of not passing	correct CPU option. So fix it by passing correct QEMU_OPTIONS.
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
X-List-Received-Date: Thu, 04 Dec 2014 21:48:02 -0000
X-Groupsio-MsgNum: 60194
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/Zw+/jwnNHcBRYYu"
Content-Disposition: inline

--/Zw+/jwnNHcBRYYu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 04, 2014 at 07:49:19PM +0000, Richard Purdie wrote:
> I have a suspicion the whole QEMU_OPTIONS thing got totally broken by Mar=
tin's commit:
>=20
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=3D7efad8a1b56df6ee07=
c12ad360c0493d7b1d6d23
>=20
> since the things being appended are not overrides, they're PACKAGE_ARCH
> values. My change below may give us a way out of the current set of
> problems.
>=20
> From 8a8b35a02244cf04b6fb368bf1cb4c1edda8d7a6 Mon Sep 17 00:00:00 2001
> From: Richard Purdie <richard.purdie@linuxfoundation.org>
> Date: Thu, 4 Dec 2014 19:41:27 +0000
> Subject: qemu/libc-package: Fix qemu option handling
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-packag=
e.bbclass
> index c1bc399..eb76ff9 100644
> --- a/meta/classes/libc-package.bbclass
> +++ b/meta/classes/libc-package.bbclass
> @@ -298,9 +298,7 @@ python package_do_split_gconvs () {
>                  --inputfile=3D%s/i18n/locales/%s --charmap=3D%s %s" \
>                  % (treedir, datadir, locale, encoding, name)
> =20
> -            qemu_options =3D d.getVar("QEMU_OPTIONS_%s" % d.getVar('PACK=
AGE_ARCH', True), True)
> -            if not qemu_options:
> -                qemu_options =3D d.getVar('QEMU_OPTIONS', True)
> +            qemu_options =3D d.getVar('QEMU_OPTIONS', True)
> =20
>              cmd =3D "PSEUDO_RELOADED=3DYES PATH=3D\"%s\" I18NPATH=3D\"%s=
\" %s -L %s \
>                  -E LD_LIBRARY_PATH=3D%s %s %s/bin/localedef %s" % \
> diff --git a/meta/classes/qemu.bbclass b/meta/classes/qemu.bbclass
> index b2cf85d..1c5736f 100644
> --- a/meta/classes/qemu.bbclass
> +++ b/meta/classes/qemu.bbclass
> @@ -29,20 +29,20 @@ def qemu_run_binary(data, rootfs_path, binary):
> =20
>      libdir =3D rootfs_path + data.getVar("libdir", False)
>      base_libdir =3D rootfs_path + data.getVar("base_libdir", False)
> -    oldest_kernel =3D data.getVar("OLDEST_KERNEL", True)
> +    qemu_options =3D data.getVar("QEMU_OPTIONS", True)
> =20
> -    return "PSEUDO_UNLOAD=3D1 " + qemu_binary + " -r " + oldest_kernel +=
 " -L " + rootfs_path\
> +    return "PSEUDO_UNLOAD=3D1 " + qemu_binary + " " + qemu_options + " -=
L " + rootfs_path\
>              + " -E LD_LIBRARY_PATH=3D" + libdir + ":" + base_libdir + " =
"\
>              + rootfs_path + binary
> =20
> -QEMU_OPTIONS =3D "-r ${OLDEST_KERNEL}"
> -QEMU_OPTIONS_append_iwmmxt    =3D " -cpu pxa270-c5"
> -QEMU_OPTIONS_append_armv6     =3D " -cpu arm1136"
> -QEMU_OPTIONS_append_armv7a    =3D " -cpu cortex-a8"
> -QEMU_OPTIONS_append_e500v2    =3D " -cpu e500v2"
> -QEMU_OPTIONS_append_e500mc    =3D " -cpu e500mc"
> -QEMU_OPTIONS_append_e5500     =3D " -cpu e5500"
> -QEMU_OPTIONS_append_e5500-64b =3D " -cpu e5500"
> -QEMU_OPTIONS_append_e6500     =3D " -cpu e6500"
> -QEMU_OPTIONS_append_e6500-64b =3D " -cpu e6500"
> -QEMU_OPTIONS_append_ppc7400   =3D " -cpu 7400"
> +QEMU_OPTIONS =3D "-r ${OLDEST_KERNEL} ${@d.getVar("QEMU_EXTRAOPTIONS_%s"=
 % d.getVar('PACKAGE_ARCH', True), True) or ""}"
> +QEMU_EXTRAOPTIONS_iwmmxt    =3D " -cpu pxa270-c5"
> +QEMU_EXTRAOPTIONS_armv6     =3D " -cpu arm1136"
> +QEMU_EXTRAOPTIONS_armv7a    =3D " -cpu cortex-a8"
> +QEMU_EXTRAOPTIONS_e500v2    =3D " -cpu e500v2"
> +QEMU_EXTRAOPTIONS_e500mc    =3D " -cpu e500mc"
> +QEMU_EXTRAOPTIONS_e5500     =3D " -cpu e5500"
> +QEMU_EXTRAOPTIONS_e5500-64b =3D " -cpu e5500"
> +QEMU_EXTRAOPTIONS_e6500     =3D " -cpu e6500"
> +QEMU_EXTRAOPTIONS_e6500-64b =3D " -cpu e6500"
> +QEMU_EXTRAOPTIONS_ppc7400   =3D " -cpu 7400"

Thanks for fixing that. Would it make sense to add comment saying that
nobody is expected to use "QEMU_EXTRAOPTIONS" directly and that they
aren't overrides (so that nobody makes the same mistake as I did).

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--/Zw+/jwnNHcBRYYu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSA1pAACgkQN1Ujt2V2gByp8wCcDLS8Ebg7FCyj+1VIFfF7rpso
k6gAoJjHvyOJ6F7RrB4bzs9WIf890siY
=VjHi
-----END PGP SIGNATURE-----

--/Zw+/jwnNHcBRYYu--
