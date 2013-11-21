Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f180.google.com (mail-ea0-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id 949EB6C73E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 00:19:19 +0000 (UTC)
Received: by mail-ea0-f180.google.com with SMTP id f15so2499202eak.39
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 16:19:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=DaPHqwplrPAtVlBW6GqR0chWFzLjoBrDqR8poImZQLU=;
	b=cYB8r9dMcgKwDrtT/94RSvNiq5QqG9g/xwRYBu/57OndQdkmEeuCp698s02txv5oVx
	IbtAVT8kN3h7CAbfGm0QOwdOk6SyRwHR/HVFh1sscwJUzmF0h80HRXFPRar3W96TWKau
	93fzTAeOUXKK/f0+0fKr2PsvtD7sMpAeQJm0wwbAj7EjvR4RW6zG1p2pT+Qy19UMDb24
	ig7Y22uhsC6CzEU3dmKSU3dNuaY0rw9PIUsZcePBaSQqcIJdUJYNCCUPK0IZHdL+ZGpE
	qU5K4MgI/v8ymKsV3w1jJhmpGVSYnZmXVHUhdiDQcrGd4LOm/+ShonueIr7wa/zcW4uy
	mY8g==
X-Received: by 10.14.199.197 with SMTP id x45mr4515764een.8.1384993159094;
	Wed, 20 Nov 2013 16:19:19 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id 8sm64857857eem.15.2013.11.20.16.19.18
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Nov 2013 16:19:18 -0800 (PST)
Date: Thu, 21 Nov 2013 01:19:22 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: ulf@emagii.com
Message-ID: <20131121001922.GW3708@jama>
References: <528D2429.7040705@emagii.com> <1384982956.16887.94.camel@ted>
	<528D3B01.8060700@emagii.com>
MIME-Version: 1.0
In-Reply-To: <528D3B01.8060700@emagii.com>
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
X-List-Received-Date: Thu, 21 Nov 2013 00:19:20 -0000
X-Groupsio-MsgNum: 47366
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1gsfN/+pS0/2Ta7u"
Content-Disposition: inline

--1gsfN/+pS0/2Ta7u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 20, 2013 at 11:43:13PM +0100, Ulf Samuelsson wrote:
> 2013-11-20 22:29, Richard Purdie skrev:
> Another idea:
>=20
> I suspect that there is a lot of unpacking and patching of recipes
> for the target when the native stuff is built.
> Does it make sense to have multiple threads reading the disk, for
> the target recipes during the native build or will we just lose out
> due to seek time?
>=20
> Having multiple threads accessing the disk, might force the disk to spend
> most of its time seeking.
> Found an application which measures seek time performance,
> and my WD Black will do 83 seeks per second, and my SAS disk will do=20
> twice that.
> The RAID of two SAS disks will provide close to SSD throughput (380 MB/s)
> but seek time is no better than a single SAS disk.
>=20
> Since there is "empty time" at the end of the native build, does it make=
=20
> sense
> to minimize unpack/patch of target stuff when we reach that point, and
> then we let loose?

In my benchmarks increasing PARALLEL_MAKE till number of cores was
significantly improving build time, but BB_NUMBER_THREADS had minimal
influence somewhere above 6 or 8 (tested on various systems, even only 4 was
optimum on my older RAID-0 and 2 on single disk).
Of course it was quite different for clean build without sstate
prepopulated and build where most of the stuff was reused from sstate.

see http://wiki.webos-ports.org/wiki/OE_benchmark

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> Now with 48 MB of RAM, (which I might grow to 96 GB, if someone proves th=
at
> this makes it faster), this might be useful to speed things up.
>=20
> Can tmpfs beat the kernel cache system?
>=20
> 1.    Typically, I work on less than 10 recipes, and if I continuosly
>          rebuild those, why not create the build directories as links to=
=20
> a tmpfs file system.
>          Maybe a configuration file with a list of recipes to build on=20
> tmpfs.
>=20
>          During a build from scratch, this is not so useful, but once=20
> most stuff is in place, it might,
>=20
> 2.     If the downloads directory was shadowed in a tmpfs system
>          then there would be less seek time during the build.
>          The downloads tmpfs should be poplulated at boot time,
>          and rsynced with a real disk in the background when new stuff
>          is downloaded from internet.
>=20
> 3.     With 96 GB of RAM, maybe the complete build directory will fit.
>          Would be nice to build everything on tmpfs, and automatically rs=
ync
>          to a real disk when there is nothing else to do...
>=20
> 4.     If not tmpfs is used, then It would still be good to have better=
=20
> control
>          over the build directory.
>          It make sense to me to have the metadata on an SSD, but the
>          build directory should be on my RAID cluster for fast rebuilds.
>          I can set this up manually, but it would be better to be able to
>          specify this in a configuration file.
>=20

See
http://www.mail-archive.com/yocto@yoctoproject.org/msg14879.html

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--1gsfN/+pS0/2Ta7u
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlKNUYoACgkQN1Ujt2V2gBzTvwCgijXft4kPUlBgFb1F1pXX6NPs
LOUAoJAGXOdVvzKz+bHLtAKk+IzKVqZ+
=N+cM
-----END PGP SIGNATURE-----

--1gsfN/+pS0/2Ta7u--
