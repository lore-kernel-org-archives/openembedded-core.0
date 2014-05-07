Return-Path: <paul.betafive@gmail.com>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id EC4706098B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 May 2014 11:31:15 +0000 (UTC)
Received: by mail-ee0-f53.google.com with SMTP id c13so630807eek.26
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 May 2014 04:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=26tlI+edtyO+zYikSvFqXuQ56OKlNHXxX2qU/lw34dU=;
	b=vsWonHCpmz17r9hrqXu7okXdDXumpUF9quV/n1FJNmh2wjxEBSLfGNQxQHMzeKcJdh
	zpzzh55t08kOVn/88kCVZDobriTTub0nsOVDu7z1g9HI4LMGJuY97sQOz4kh738HCG9q
	uYKXy4lRYHRC+H9Ku9Nrg2Mo1R39lY3ARkdbMFIgq5mMm3eJ46+rAD+HZtolDkY4ID0z
	485YeomS8tbCAXHwbH9DnCRram09lljH2rEMLfzVbPFZzSnFsHc9AYNntz2c9dhycvC+
	iXbXr/gCDRePLxa5h79pB0nPnStUdyxE5Az8X55t0+MMN4+G26+V7+5DMFAZ6fbNWQG0
	w9CQ==
X-Received: by 10.14.126.73 with SMTP id a49mr16996636eei.46.1399462276431;
	Wed, 07 May 2014 04:31:16 -0700 (PDT)
Received: from gmail.com (ygg.betafive.co.uk. [5.9.90.21])
	by mx.google.com with ESMTPSA id a4sm45770365eep.12.2014.05.07.04.31.14
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 May 2014 04:31:15 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
Date: Wed, 7 May 2014 11:31:13 +0000
From: Paul Barker <paul@paulbarker.me.uk>
To: Marco <koansoftware@gmail.com>
Message-ID: <20140507113113.GA26157@gmail.com>
References: <53679D4E.6060202@gmail.com> <20140505152931.GA26865@gmail.com>
	<5369E6C1.2090907@gmail.com>
MIME-Version: 1.0
In-Reply-To: <5369E6C1.2090907@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Upgrade to a package with all its dependency without network
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
X-List-Received-Date: Wed, 07 May 2014 11:31:16 -0000
X-Groupsio-MsgNum: 52925
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AqsLC8rIMeq19msA"
Content-Disposition: inline

--AqsLC8rIMeq19msA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 07, 2014 at 09:54:41AM +0200, Marco wrote:
> Il 05/05/2014 17:29, Paul Barker ha scritto:
> >On Mon, May 05, 2014 at 04:16:46PM +0200, Marco wrote:
> >>Hello,
> >>I need to be able to upgrade to a package with all its dependency chain=
 on a
> >>target system that does not have access to the network.
> >>
> >>I'm trying to understand what may be the best and also the simplest
> >>solution.
> >>Perhaps there is already this functionality in OE/Yocto?
> >>
> >>I thought to implement a new opkg feture so that I can to generate the =
list
> >>of dependencies of a package and then extract the packages from OE/Yocto
> >>using a script or an application.
> >
> >opkg v0.2.x (the latest release series) doesn't really support this beha=
viour
> >very well. The caching logic just doesn't work. For example, I have a bo=
ard
> >connected at the minute with a feed configured so I tried this:
> >
> >     opkg install --download-only ncurses-terminfo
> >     ifdown eth0
> >     opkg install ncurses-terminfo
> >
> >You'd hope that would pick up the package files from the cache but it do=
esn't.
> >So even if you put the files there yourself, you may no have a simple wa=
y to
> >install them.
> >
> >An interim solution I can see is to put all the packages you want in one
> >directory then run 'opkg-make-index' from opkg-utils on that directory s=
o that
> >it is a complete package feed. Then add that as a source in
> >/etc/opkg/base-feeds.conf.
> >
>=20
> Hi Paul,
> thank you for answering.
>=20
> This is exactly the main problem, how to extract all the packages I (or I
> should say the package itself) want, in one directory.
> Would be possible to extend opkg with this feature?
>=20

Yes, a few people have asked for some method of supporting this use-case so=
 we
definitely want to make it work. Now may not be the best time to work on it=
 as
the package download code in opkg master is currently in flux and the curre=
nt
work needs finishing. I'm hoping to finish tidying this up soon and then th=
ere
will be a stable base on which to add this feature.

I'd suggest filing an enhancement request at
https://code.google.com/p/opkg/issues/.

If you'd like to discuss the details of how this could be implemented within
opkg or contribute patches yourself then that's best discussed on the opkg
mailing list at opkg-devel@googlegroups.com.

Cheers,

--=20
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

--AqsLC8rIMeq19msA
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQEcBAEBAgAGBQJTahmBAAoJEBwoJlo7UPQDj0gH/34kwA+rc9B9EaShxZKHgjs3
iTb8lYUztjOvQxOsRvmoMADuw1gWUhd5Jg4r2YTa+lhT3p5HM//+r3KI+Fc7/vBz
5WO2B98KcVyFilhVxTsO8ZIwuJPzsMj87o12iUATehPu2n8AUPXkcvPYY8mMaFSw
OhnAF2R08Z6liwa9CW7Dz4fDNPv/zxrQH8PUaQpbSFIdcOlUMPSZLBxsQq4x5nt5
JO9stHoBpsDIL5FK+c1X2um8fuWTrFiowbZGwUjSuapz5GhtHTiklbFlLoXLpWJC
JWhavNO71Wm+MbaSX97hMqfZQAQOQsO4GU6spfysLtV+UXNNZTYJozRN4IHgc4U=
=7u4N
-----END PGP SIGNATURE-----

--AqsLC8rIMeq19msA--
