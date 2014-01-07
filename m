Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f49.google.com (mail-ee0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id 9D06E6C996
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jan 2014 15:54:31 +0000 (UTC)
Received: by mail-ee0-f49.google.com with SMTP id c41so158548eek.36
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Jan 2014 07:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=bKxhPdI4whGFhlnnH5U5WpURfwWsSYPVk+q9LFZpodQ=;
	b=iNCFv7JJf4FNWNNCimEiuFudah4nF0a1M4oyq27i8JehpAtUgsSK9XK3T1+ZLgYrCr
	+2QziMv8REvy+J8Y3fAiC/5dSPYg1K/v7866fqcPuWZ6EizWKxcLzCrly6fVR+HvSd9z
	NveCqxNsopzZDT0KgPtNicQRcjG1USoZnFcu8OWDNCaKz7gG7LbCnNzdQ2uNgyD6TRAB
	Xmadw62JaxozmWSd3B3octXgG4wNiSFvwOwKl+UZyIgLhdYCPgdFaMbf7MWI0+EdirAQ
	kakku7o70po411fdB6CZJuafeLfa5w4IunSloRjzkGDFlm0PJo6o+KBmW1ERk8Luuewd
	m1EQ==
X-Received: by 10.14.199.1 with SMTP id w1mr94399278een.29.1389110072078;
	Tue, 07 Jan 2014 07:54:32 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id v1sm181150593eef.9.2014.01.07.07.54.28
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 Jan 2014 07:54:30 -0800 (PST)
Date: Tue, 7 Jan 2014 16:54:32 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Message-ID: <20140107155432.GS3709@jama>
References: <1389104317-11042-1-git-send-email-alexandre.belloni@free-electrons.com>
	<20140107143558.GQ3709@jama> <52CC1B45.9010808@free-electrons.com>
MIME-Version: 1.0
In-Reply-To: <52CC1B45.9010808@free-electrons.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: darren.hart@intel.com, Darren Hart <dvhart@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kernel: use oldnoconfig instead of yes '' | make oldconfig
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
X-List-Received-Date: Tue, 07 Jan 2014 15:54:32 -0000
X-Groupsio-MsgNum: 48661
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6axCafNXXMM8qu6Q"
Content-Disposition: inline

--6axCafNXXMM8qu6Q
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 07, 2014 at 04:20:37PM +0100, Alexandre Belloni wrote:
> On 07/01/2014 15:35, Martin Jansa wrote:
> > On Tue, Jan 07, 2014 at 03:18:37PM +0100, Alexandre Belloni wrote:
> >> When using a defconfig, using yes '' | make oldconfig may not result in
> >> the correct configuration being set. For example:
> >=20
> >>  $ grep USB_ETH .config
> >>  CONFIG_USB_ETH=3Dy
> >>  CONFIG_USB_ETH_RNDIS=3Dy
> >>  CONFIG_USB_ETH_EEM=3Dy
> >>  $ make savedefconfig
> >>  scripts/kconfig/conf --savedefconfig=3Ddefconfig Kconfig
> >>  $ cp defconfig .config
> >>  =E2=80=98defconfig=E2=80=99 -> =E2=80=98.config=E2=80=99
> >>  $ yes '' | make oldconfig
> >>  [...]
> >>  #
> >>  # configuration written to .config
> >>  #
> >>  $ grep USB_ETH .config
> >>  CONFIG_USB_ETH=3Dm
> >>  CONFIG_USB_ETH_RNDIS=3Dy
> >>  CONFIG_USB_ETH_EEM=3Dy
> >>
> >> Using make olddefconfig solves that but we'll use oldnoconfig for
> >> backward compatibility with older kernels.
> >=20
> > Looks good, I have few kernel recipes where I had to fixup resulting
> > .config after "make savedefconfig", "yes '' | make oldconfig" combo
> > exactly because of some =3Dy changing to -m.
> >=20
> > 1) Do you know since when oldnoconfig is supported?
> >=20
> > IIRC oldest kernel I've in BSPs is 2.6.24.=20
>=20
> oldnoconfig seems to be present since 2.6.36. olddefconfig is an alias
> that appeared with fb16d8912db5268f29706010ecafff74b971c58d which is
> present since v3.7.
>=20
> Then hat about using:
>=20
> oe_runmake oldnoconfig || yes '' | oe_runmake oldconfig

Looks safer (assuming that oldnoconfig will return error only in cases
where oldnoconfig target doesn't exist in Makefile, otherwise fall-back
to yes '' could be a bit confusing).

In worst case you can add KERNEL_VERSION check or show bb.warn when
oldnoconfig isn't supported.

> > 2) Could you send similar patch for
> > meta-openembedded/meta-oe/recipes-kernel/linux/linux.inc
> > ?
> >=20
>=20
> Sure, will do once we agreed on this patch

Thanks

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--6axCafNXXMM8qu6Q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLMIzgACgkQN1Ujt2V2gBy6OQCfesilpbeDBGJ6Fnp2aGNk2Lio
lqwAoJ9yuH4PAo93BqY+7Ybky4Ycqohb
=Mel1
-----END PGP SIGNATURE-----

--6axCafNXXMM8qu6Q--
