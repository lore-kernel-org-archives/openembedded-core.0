Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id BB8F465D9B;
	Wed, 30 Jul 2014 09:32:27 +0000 (UTC)
Received: by mail-wi0-f179.google.com with SMTP id f8so1967933wiw.12
	for <multiple recipients>; Wed, 30 Jul 2014 02:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=7nuZBDR4JWf3Oa2HYlF9Q8/XmVBriPcIbr25g1Y/YaI=;
	b=AHAQvVgmHNn/m+RnONrRbtkBl1Vm9rvoKwsTGaWODCId8fmnIdMu6FX6DUb0119YPF
	9iQtg0AmjsGo2t9g+LoMjP5y4RM+HSETjQx3leKJfkkHNMEhl+z+4dKnTTpDmTr7KqAY
	o7o1cuFnOVG/HFd2dqpk/oS8Z8EiGbbOLIxSghlow3rulQ4TZFSbZywANlGy6RVYiyB2
	89FymdtWYjJKJ5cUd0xLT50dkdaT5ZZI3JeAGJACQa/QlKxgY7wVPZZzUMIHTtIDT27V
	XjMjEjafXwfSiGz2nViD50GFXsZKj5JJY7CAiPbGNw6DcpNrT79X85m4uD8TCskCqv0T
	SyFQ==
X-Received: by 10.194.5.103 with SMTP id r7mr4349879wjr.41.1406712747951;
	Wed, 30 Jul 2014 02:32:27 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ko8sm4192867wjc.11.2014.07.30.02.32.21 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Jul 2014 02:32:21 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 30 Jul 2014 11:32:44 +0200
To: openembedded-core@lists.openembedded.org,
	Cristian Iorga <cristian.iorga@intel.com>
Message-ID: <20140730093244.GK16445@jama>
References: <20140703164708.452165036A@opal.openembedded.org>
	<20140718205012.GT2433@jama>
MIME-Version: 1.0
In-Reply-To: <20140718205012.GT2433@jama>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Cristian Iorga : qemu: fix qemu-native pkg-config paths
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
X-List-Received-Date: Wed, 30 Jul 2014 09:32:35 -0000
X-Groupsio-MsgNum: 55753
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EE8jvUPYYQjJtG7J"
Content-Disposition: inline

--EE8jvUPYYQjJtG7J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 18, 2014 at 10:50:12PM +0200, Martin Jansa wrote:
> On Thu, Jul 03, 2014 at 04:47:08PM +0000, git@git.openembedded.org wrote:
> > Module: openembedded-core.git
> > Branch: master
> > Commit: 68a5ed337f8f7ee8e5bf55542ec82d786eb754db
> > URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcomm=
it;h=3D68a5ed337f8f7ee8e5bf55542ec82d786eb754db
> >=20
> > Author: Cristian Iorga <cristian.iorga@intel.com>
> > Date:   Thu Jul  3 15:57:32 2014 +0300
> >=20
> > qemu: fix qemu-native pkg-config paths
> >=20
> > For qemu-native, the pkg-config paths do not
> > include build host paths.
>=20
> This breaks qemu-native builds on hosts without pkg-config.
>=20
> pkg-config isn't in sanity.bbclass's SANITY_REQUIRED_UTILITIES
> and this is first recipe which cannot use pkgconfig-native.
>=20
> Please add test that it exists before forcing recipe to use it.

PING

This is broken for almost a month, please at least revert it until it's
fixed correctly.

> > This is an issue for libsdl for example, where SDL is
> > used by qemu, but for qemu-native libsdl-native is not
> > built, but assumed to be provided by the build host.
> > Because pkg-config do not search for libsdl config files
> > on the build host sysroot, the configure stage of qemu-native
> > will fail because it will not find SDL as being installed.
> > Usually, the isssue is masked by a functional sdl-config that
> > will be interogated instead of pkg-config. However, on Build
> > Appliance, sdl-config is deliberately made non-functional,
> > so the issue manifests itself.
> >=20
> > The fix will create an extended PKG_CONFIG_PATH, which does
> > include the build host sysroot paths for pkg-config.
> >=20
> > Fix for [YOCTO #6495].
> >=20
> > Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> >=20
> > ---
> >=20
> >  meta/recipes-devtools/qemu/qemu.inc | 4 ++++
> >  1 file changed, 4 insertions(+)
> >=20
> > diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtool=
s/qemu/qemu.inc
> > index 076e8ad..611ee61 100644
> > --- a/meta/recipes-devtools/qemu/qemu.inc
> > +++ b/meta/recipes-devtools/qemu/qemu.inc
> > @@ -33,6 +33,10 @@ EXTRA_OECONF_class-nativesdk =3D "--target-list=3D${=
@get_qemu_target_list(d)} --disa
> >  export LIBTOOL=3D"${HOST_SYS}-libtool"
> > =20
> >  do_configure_prepend_class-native() {
> > +	# Append build host pkg-config paths for native target since the host=
 may provide sdl
> > +	BHOST_PKGCONFIG_PATH=3D$(PATH=3D/usr/bin:/bin pkg-config --variable p=
c_path pkg-config)
> > +	export PKG_CONFIG_PATH=3D$PKG_CONFIG_PATH:$BHOST_PKGCONFIG_PATH
> > +
> >  	# Undo the -lX11 added by linker-flags.patch, don't assume that host =
has libX11 installed
> >  	sed -i 's/-lX11//g' Makefile.target
> >  }
> >=20
> > --=20
> > _______________________________________________
> > Openembedded-commits mailing list
> > Openembedded-commits@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--EE8jvUPYYQjJtG7J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPYu7wACgkQN1Ujt2V2gBw0zACcDpmBV7FnFVkmLTs3Q+WCh94f
SEkAnjGvyffCDVJ+2VwHcrgS4rnUlnT5
=8aK2
-----END PGP SIGNATURE-----

--EE8jvUPYYQjJtG7J--
