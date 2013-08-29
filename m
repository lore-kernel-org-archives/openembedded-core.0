Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f47.google.com (mail-ee0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id 7F9906BAAB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 11:48:39 +0000 (UTC)
Received: by mail-ee0-f47.google.com with SMTP id d49so180963eek.34
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 04:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=iN3wuBydtrL4n3hC2OJNLN4NifqBSiXao1V7tWbGHq4=;
	b=asisKfLAe3F5115wpvjWAsui0KBpum81M6dVuHEHdBkSE8Hc6Cg2YLmPEnsgpQdzYE
	sySyVuLtzFPUOP/PT/SoKXM0a4L8Dv/qtly79+9MNfvbCXDNy6g8xMsRCifJ3/K07jLL
	MYHSuby7Z15cIN/oLtcwJ6eL9suSChF7w3OW3Ho0R+KV9uGn15fD/9K8bkuiqPfUdFWv
	ph5c1JiEwrCc/GuyZdA6eIPV/y00I8LojNKyR/W/qwykpGtFsh54LMdgd3NhvBIg87s5
	bkdt4LV6OThyybafvT3oTX6f/ba5tO0WoJWK/jq1Osm1hqP5vdfAW47YYl3sr4kFQOaP
	wuhw==
X-Received: by 10.14.176.8 with SMTP id a8mr4029138eem.12.1377776919601;
	Thu, 29 Aug 2013 04:48:39 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	h52sm45419170eez.3.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 04:48:39 -0700 (PDT)
Date: Thu, 29 Aug 2013 13:49:52 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Message-ID: <20130829114952.GO3544@jama>
References: <alpine.DEB.2.02.1308290628130.4283@oneiric>
	<20130829104913.GM3544@jama>
	<alpine.DEB.2.02.1308290657140.5063@oneiric>
	<20130829112725.GN3544@jama>
	<alpine.DEB.2.02.1308290733210.5515@oneiric>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.02.1308290733210.5515@oneiric>
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
X-List-Received-Date: Thu, 29 Aug 2013 11:48:41 -0000
X-Groupsio-MsgNum: 44240
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FTZ6+qRtsnuZwWZA"
Content-Disposition: inline

--FTZ6+qRtsnuZwWZA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 29, 2013 at 07:37:17AM -0400, Robert P. J. Day wrote:
> On Thu, 29 Aug 2013, Martin Jansa wrote:
>=20
> > On Thu, Aug 29, 2013 at 07:00:45AM -0400, Robert P. J. Day wrote:
> > > On Thu, 29 Aug 2013, Martin Jansa wrote:
> > >
> > > > On Thu, Aug 29, 2013 at 06:29:17AM -0400, Robert P. J. Day wrote:
> > > > >
> > > > >   trying to build a "hardware-bringup-image" defined in angstrom =
layer
> > > > > and running into:
> > > > >
> > > > > ERROR: QA Issue: Fixup Perms: Unable to correct directory link, t=
arget already exists: /var/log -> /var/volatile/log
> > > > > ERROR: QA Issue: Fixup Perms: Unable to correct directory link, t=
arget already exists: /var/run -> /run
> > > > > ERROR: QA Issue: Fixup Perms: Unable to correct directory link, t=
arget already exists: /var/tmp -> /var/volatile/tmp
> > > > >
> > > > > this would *appear* to be because oe-core defines, in
> > > > > base-files_3.0.14.bb:
> > > > >
> > > > > volatiles =3D "log tmp"
> > > > > ... snip ...
> > > > >         for d in ${volatiles}; do
> > > > >                 ln -sf volatile/$d ${D}${localstatedir}/$d
> > > > >         done
> > > > >         ln -snf ../run ${D}${localstatedir}/run
> > > > >         ln -snf ../run/lock ${D}${localstatedir}/lock
> > > > >
> > > > > which seems to want to create /var/{run,log,tmp} as symlinks, but=
 over
> > > > > in meta-angstrom, we have base-files_3.0.14.bbappend which seems =
to
> > > > > want to create them as actual directories instead:
> > > >
> > > > Expectations from base-files .bbappend and FILESYSTEM_PERMS_TABLES =
need
> > > > to be consistent, is it possible that you're using .bbappend from
> > > > angstrom and not FILESYSTEM_PERMS_TABLES set by angstrom config?
> > > >
> > > > conf/distro/include/angstrom-core-tweaks.inc:FILESYSTEM_PERMS_TABLE=
S =3D "fs-perms-angstrom.txt"
> > >
> > >   ah, i suspect that's what's happening. so what's the correct way to
> > > set up this OE build? i'm trying to build the angstrom
> > > "hardware-bringup-image" using a current oe-core, and my bblayers.conf
> > > file looks like:
> > >
> > > BBLAYERS ?=3D " \
> > >   /home/rpjday/oe/dist/layers/oe-core/meta \
> > >   /home/rpjday/oe/dist/layers/meta-openembedded/meta-oe \
> > >   /home/rpjday/oe/dist/layers/meta-angstrom \
> > >   /home/rpjday/oe/dist/layers/meta-ti \
> > >   "
> >
> > What's your DISTRO value? distroless oe-core?
>=20
>   distroless. i realize i *could* set a value for DISTRO, but it would
> seem that i shouldn't have to in order to avoid a build error.
>=20
>   in any event, you clearly see exactly what's causing the error --
> that the base-files bbappend file from meta-angstrom is clashing with
> the base-files recipe from oe-core. if you want me to try anything
> different, i have lots of time today to test. if you want me to select
> a DISTRO, i can certainly do that.

You can add that line from angstrom-core-tweaks into your local.conf,
but it depends on distro maintainer if he wants to support different
DISTROs in distro layer.

In other words, everything in distro layer can usually assume correct
distro configuration, when you're using some recipes from distro layer
with your own distro or distroless config then you're on your own
unsupported combination.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--FTZ6+qRtsnuZwWZA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlIfNWAACgkQN1Ujt2V2gByfoQCfXq2VWcuqjJVbpWH6lgwLSr/S
RTQAn3MGtGl3nKa7ikV90NXMf8dkXNT9
=5/Pz
-----END PGP SIGNATURE-----

--FTZ6+qRtsnuZwWZA--
