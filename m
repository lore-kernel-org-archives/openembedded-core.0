Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f47.google.com (mail-ee0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id 93AA76B0C5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 11:26:13 +0000 (UTC)
Received: by mail-ee0-f47.google.com with SMTP id d49so167840eek.34
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 04:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=5gKm7AcOEi8HerJawMCC3XcoK5Ey2C3pJdubrRLIqYg=;
	b=GYM3w+JZn3gGLFp+0VfB5hHzkghHnx5bVVPm/K8v0GPQ998Bd+a/OA7G6N5ooOy1AR
	UieluB5HzzJq4gkjtLMmQOsR7xhx+X3Jl/pUCQ+zWEAYll0BJzKhloJmlKeAuYti03fo
	cTXwpPe4Xcai4eV+nL1EgfkPUR12eGEd00u4RXFVtz3NXrf1UiQtYDXAGB//Q2V63kVT
	DliKmYD4ZmA762FJXClweSyFjilldZx3BpWSB1/JD+Z1xOhX533Tp83ybOmQv9O1pJIp
	ggAfvM8ZbpTOB37ktCbpVIFA1gdROYvXn9Lk7+afW6F11LfwyABzlLtVixb3gyFMGPvZ
	GJgg==
X-Received: by 10.14.37.4 with SMTP id x4mr3926077eea.16.1377775573591;
	Thu, 29 Aug 2013 04:26:13 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	i1sm45261045eeg.0.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 04:26:13 -0700 (PDT)
Date: Thu, 29 Aug 2013 13:27:25 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Message-ID: <20130829112725.GN3544@jama>
References: <alpine.DEB.2.02.1308290628130.4283@oneiric>
	<20130829104913.GM3544@jama>
	<alpine.DEB.2.02.1308290657140.5063@oneiric>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.02.1308290657140.5063@oneiric>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: appears to be inconsistency re: base-files between oe-core and meta-angstrom
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
X-List-Received-Date: Thu, 29 Aug 2013 11:26:15 -0000
X-Groupsio-MsgNum: 44237
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5Tc+o1dszy8XVyXI"
Content-Disposition: inline

--5Tc+o1dszy8XVyXI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 29, 2013 at 07:00:45AM -0400, Robert P. J. Day wrote:
> On Thu, 29 Aug 2013, Martin Jansa wrote:
>=20
> > On Thu, Aug 29, 2013 at 06:29:17AM -0400, Robert P. J. Day wrote:
> > >
> > >   trying to build a "hardware-bringup-image" defined in angstrom layer
> > > and running into:
> > >
> > > ERROR: QA Issue: Fixup Perms: Unable to correct directory link, targe=
t already exists: /var/log -> /var/volatile/log
> > > ERROR: QA Issue: Fixup Perms: Unable to correct directory link, targe=
t already exists: /var/run -> /run
> > > ERROR: QA Issue: Fixup Perms: Unable to correct directory link, targe=
t already exists: /var/tmp -> /var/volatile/tmp
> > >
> > > this would *appear* to be because oe-core defines, in
> > > base-files_3.0.14.bb:
> > >
> > > volatiles =3D "log tmp"
> > > ... snip ...
> > >         for d in ${volatiles}; do
> > >                 ln -sf volatile/$d ${D}${localstatedir}/$d
> > >         done
> > >         ln -snf ../run ${D}${localstatedir}/run
> > >         ln -snf ../run/lock ${D}${localstatedir}/lock
> > >
> > > which seems to want to create /var/{run,log,tmp} as symlinks, but over
> > > in meta-angstrom, we have base-files_3.0.14.bbappend which seems to
> > > want to create them as actual directories instead:
> >
> > Expectations from base-files .bbappend and FILESYSTEM_PERMS_TABLES need
> > to be consistent, is it possible that you're using .bbappend from
> > angstrom and not FILESYSTEM_PERMS_TABLES set by angstrom config?
> >
> > conf/distro/include/angstrom-core-tweaks.inc:FILESYSTEM_PERMS_TABLES =
=3D "fs-perms-angstrom.txt"
>=20
>   ah, i suspect that's what's happening. so what's the correct way to
> set up this OE build? i'm trying to build the angstrom
> "hardware-bringup-image" using a current oe-core, and my bblayers.conf
> file looks like:
>=20
> BBLAYERS ?=3D " \
>   /home/rpjday/oe/dist/layers/oe-core/meta \
>   /home/rpjday/oe/dist/layers/meta-openembedded/meta-oe \
>   /home/rpjday/oe/dist/layers/meta-angstrom \
>   /home/rpjday/oe/dist/layers/meta-ti \
>   "

What's your DISTRO value? distroless oe-core?

FWIW I had similar problem with meta-shr (distro layer) in distroless
world builds, in the end I've splitted meta-shr and meta-shr-distro.

https://github.com/shr-distribution/meta-smartphone/commit/a3e2b26f8bf13a47=
c63419623959e6dbe5bc1c15

>=20
> what should i have done differently?
>=20
> rday
>=20
> --=20
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>=20
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--5Tc+o1dszy8XVyXI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlIfMB0ACgkQN1Ujt2V2gBw4hgCeJuPyzXiQbBzV1lNsfeKe+ZXv
UTcAoJgXD2ISg5hVulGEE3X6zVY/yHRq
=V/VC
-----END PGP SIGNATURE-----

--5Tc+o1dszy8XVyXI--
