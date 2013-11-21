Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f180.google.com (mail-ea0-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id 97BDB6CEDB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 12:53:56 +0000 (UTC)
Received: by mail-ea0-f180.google.com with SMTP id f15so2819100eak.39
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 04:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ajxhUgxQVym80mh0XIzdpMyOOzINJduGbNu7lOqOv1U=;
	b=sPv/T3b8e2d2QYozbwn5ZHMmX6KyFhW9975j2qpABcSldT7RtkxmrmVXIPlIjeN1Pt
	oFHcH9r129mZ8UW8XEn6j8MVSdNwjnveSePiKqqVYlEFpRf7XGWYLjMTmIGoXTQKuhqj
	dqjxtIY8O4cwYww0OmYKdo/7QN2lUFXZ2tmRpDoEQzSzfFDcNqUe9DiVu8HaFOm1WzVz
	eL7PyCbTw+kFY+7ILuVWwTVB5IIu/KbeOaZfD0QWZwgWgaoXXnkQEaxU9JWviYKNJVXF
	km5fCqjxM+2A7QlUe9Wt487Rc81frZ4cRfdmVJrEPZfZN5rarXIxeZwn2cGJVANCbkX/
	iRmA==
X-Received: by 10.14.102.66 with SMTP id c42mr2460077eeg.47.1385038435583;
	Thu, 21 Nov 2013 04:53:55 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id h48sm13747246eev.3.2013.11.21.04.53.54
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Nov 2013 04:53:54 -0800 (PST)
Date: Thu, 21 Nov 2013 13:53:59 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Ulf Samuelsson <ulf@emagii.com>
Message-ID: <20131121125359.GY3708@jama>
References: <528D2429.7040705@emagii.com> <1384982956.16887.94.camel@ted>
	<528D3B01.8060700@emagii.com> <20131121001922.GW3708@jama>
	<528DB2FC.90205@emagii.com>
MIME-Version: 1.0
In-Reply-To: <528DB2FC.90205@emagii.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Improving Build Speed
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
X-List-Received-Date: Thu, 21 Nov 2013 12:53:57 -0000
X-Groupsio-MsgNum: 47417
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="72btQdUC6twB1rwh"
Content-Disposition: inline

--72btQdUC6twB1rwh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 21, 2013 at 08:15:08AM +0100, Ulf Samuelsson wrote:
> 2013-11-21 01:19, Martin Jansa skrev:
> > On Wed, Nov 20, 2013 at 11:43:13PM +0100, Ulf Samuelsson wrote:
> >> 2013-11-20 22:29, Richard Purdie skrev:
> >> Another idea:
> >>
> >> I suspect that there is a lot of unpacking and patching of recipes
> >> for the target when the native stuff is built.
> >> Does it make sense to have multiple threads reading the disk, for
> >> the target recipes during the native build or will we just lose out
> >> due to seek time?
> >>
> >> Having multiple threads accessing the disk, might force the disk to sp=
end
> >> most of its time seeking.
> >> Found an application which measures seek time performance,
> >> and my WD Black will do 83 seeks per second, and my SAS disk will do
> >> twice that.
> >> The RAID of two SAS disks will provide close to SSD throughput (380 MB=
/s)
> >> but seek time is no better than a single SAS disk.
> >>
> >> Since there is "empty time" at the end of the native build, does it ma=
ke
> >> sense
> >> to minimize unpack/patch of target stuff when we reach that point, and
> >> then we let loose?
> > In my benchmarks increasing PARALLEL_MAKE till number of cores was
> > significantly improving build time, but BB_NUMBER_THREADS had minimal
> > influence somewhere above 6 or 8 (tested on various systems, even only =
4 was
> > optimum on my older RAID-0 and 2 on single disk).
> > Of course it was quite different for clean build without sstate
> > prepopulated and build where most of the stuff was reused from sstate.
> >
> > see http://wiki.webos-ports.org/wiki/OE_benchmark
>=20
> How many cores do you have in your build machine?

The one used in OE_benchmark has 8, my local builder also 8, I got the
same results on machines with 32 and 48 cores.

My experience (which can be different than what you see), is
that PARALLEL_MAKE scales well with number of cores, but
BB_NUMBER_THREADS is more or less limited by I/O performance, so even
when the machine has 48 cores, it doesn't say anything about running 48
do_populate or do_package tasks at the same time causing avalanche of
seeks.

The other extreme is when all 48 BB threads are in do_compile and you
can get 48x48 gcc processes which again doesn't work well on machine
with 48 cores.

with
PARALLEL_MAKE     =3D "-j32"
BB_NUMBER_THREADS =3D    "6"
and very big image build, I see all cores well used most of the time.

> I started a build, and after 20 minutes it had completed 1500 tasks using:
>=20
> PARALLEL_MAKE     =3D "-j24"
> BB_NUMBER_THREADS =3D   "6"
>=20
> The I decided to kill it.
>=20
> When I did
> PARALLEL_MAKE     =3D "-j12"
> BB_NUMBER_THREADS =3D   "24"
>=20
> It completed 2000 tasks in less than half the time.

You should have finish whole image, you can get 2000 tasks sooner (tasks
like fetch/unpack/patch) but then you're still waiting for the rest,
with smaller BB_NUMBER_THREADS it seems to spread tasks more evenly
(doing more fetch/unpack/patch tasks later when CPUs are busy compiling
something, which is good for I/O).

> This does not use tmpfs though.
> Do you have any comparision between tmpfs builds and RAID builds?

I've sent it to ML few months ago, cannot find it now.

> I currently do not use INHERIT +=3D "rm_work"
> since I want to be able to do changes on some packages.
> Is there a way to defined rm_work on a package basis?
> Then the majority of the packages can be removed.
>=20
> I use 75 GB without "rm_work"

Understood, in my scenario I want to build world as soon as possible,
keep sstate, record issues and forget about BUILDDIR.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--72btQdUC6twB1rwh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlKOAmcACgkQN1Ujt2V2gBwVMwCgh8kovPcpZS6UThqtiC1GCFQ2
218AoK/yURBSg3w6TYqaaAN/gyWuWfov
=Gc0L
-----END PGP SIGNATURE-----

--72btQdUC6twB1rwh--
