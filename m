Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f42.google.com (mail-ee0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id 3998C6D2C7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 11:40:00 +0000 (UTC)
Received: by mail-ee0-f42.google.com with SMTP id e52so2458140eek.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 03:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=fBhmDuex8dZQARdLn5wTJlXr4JMzDc0LI7R0zzR632A=;
	b=nY3gDVF7rTnTyIQ1x0icp2swMZKbLa1mNuGE+zAZ2cPJddCBp1Tpg3uSdF3BStgoZp
	bKAJ7Hr3JlWN9FNttqR7cYnCq2V3P1Hs8geyNID8LhtufTiHEGC8HBnav/w64A8q8ygj
	fDGKReTAJro1u4yq4V7TUESKk5IRPMa4igph1xm8IzoO5ZVbDJIxGaTRmbMX4/OW4FIC
	9Et2taoEhdY90ZLuyGy4+kayFLlx0hfPYpyl9Foi4MxTb3Asbs5bkcC09Uvl3JF1GyG7
	t3yXMEaFSgMT1nWtiZFQCv/cbwELKEqfbH919Mp9FRjeyI4znXdbPs0N/PVa9L8E4oDX
	3esQ==
X-Received: by 10.14.42.6 with SMTP id i6mr2084997eeb.65.1384774801276;
	Mon, 18 Nov 2013 03:40:01 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id h8sm36966359eew.16.2013.11.18.03.40.00
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Nov 2013 03:40:00 -0800 (PST)
Date: Mon, 18 Nov 2013 12:40:00 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Message-ID: <20131118114000.GB3727@jama>
References: <CANyK_8c67C4NL7mNf3LTDwurtfpeU+S5ts4+O2t+HiDv84YgaQ@mail.gmail.com>
	<52898177.5000303@windriver.com>
MIME-Version: 1.0
In-Reply-To: <52898177.5000303@windriver.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: opkg dependencies and update-alternatives
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
X-List-Received-Date: Mon, 18 Nov 2013 11:40:01 -0000
X-Groupsio-MsgNum: 47193
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lCAWRPmW1mITcIfM"
Content-Disposition: inline

--lCAWRPmW1mITcIfM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 18, 2013 at 10:54:47AM +0800, ChenQi wrote:
> On 11/18/2013 02:57 AM, Paul Barker wrote:
> > Hi all,
> >
> > I've been trying to add PACKAGECONFIG options to opkg and have ran
> > into a dependency loop whilst building with certain options. Enabling
> > curl support within opkg requires a dependency on curl. curl in turn
> > depends on ncurses (via a few intermediate dependencies) and ncurses
> > uses update-alternatives causing a dependency on
> > virtual/update-alternatives.
> > PREFERRED_PROVIDER_virtual/update-alternatives is set to "opkg" in
> > meta/conf/distro/include/default-providers.inc and so we have a
> > dependency loop if curl is enabled via the new PACKAGECONFIG options
> > for opkg.
> >
> > I can cause the same dependency loop by setting
> > PREFERRED_PROVIDER_virtual/update-alternatives to "dpkg" as dpkg
> > directly depends on ncurses (which uses update-alternatives). So if
> > someone wanted to use the more powerful update-alternatives from dpkg
> > on a target system it doesn't look like that is currently possible.
> >
> > This places quite a constraint on whichever recipe PROVIDES
> > update-alternatives. Going forward I'm hoping to use libarchive within
> > opkg and libarchive depends on bzip2 by default which uses
> > update-alternatives, which would cause the same problem.
> >
> > Does anyone have any clever solutions to this? Perhaps we could split
> > update-alternatives off into its own recipe which should be dependent
> > on very little, allowing opkg a little more freedom in its
> > dependencies.
> >
> > Thanks,
> >
>=20
> I opened a bug some time ago for this update-alternative problem.
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D4836
>=20
> It would be really helpful if you could add some input in the comments=20
> of that bug.

FWIW: current u-a implementation provided by opkg is in OE-classic and
was in older poky/oe-core provided also in standalone recipe
update-alternatives-cworth

http://git.openembedded.org/openembedded/tree/recipes/update-alternatives/u=
pdate-alternatives-cworth_0.99.154.bb

commit 44b538eedab7c255051fa3375f9f2439cd2db3dd
Author: Marcin Juszkiewicz <hrw@openedhand.com>
Date:   Wed Mar 19 15:36:01 2008 +0000

    update-alternatives-cworth: dropped as they are now generated with opkg=
 recipe

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--lCAWRPmW1mITcIfM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlKJ/JAACgkQN1Ujt2V2gBys2gCgg+e15XRc5lbp65LkcTPtSIAc
UioAoKCE46Opxi+6n8C6M8TuwvrTqRG4
=xNXN
-----END PGP SIGNATURE-----

--lCAWRPmW1mITcIfM--
