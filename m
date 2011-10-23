Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RHt1Y-0003xs-UF
	for openembedded-core@lists.openembedded.org;
	Sun, 23 Oct 2011 10:03:16 +0200
Received: by bkat8 with SMTP id t8so6984748bka.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Oct 2011 00:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=YGjStWHSAr9ORV5N6QwWZJmD2DMbqcPTubN3l7nYR0Y=;
	b=byx60u30D0BUJYnDroCUrMgq5IAkpk2FYCjNYas4LSXH+qPRtq6cQinaKrMiOxsNb6
	vWDUxx71o+cEw9z3sp3qZnEDt5bTzKRkwFQ4s27M5R5s0t7C9pAFofHcpkn6hITGORbW
	A3SsJh4XwJYDKjz4NAQPSptiwUsuJymFoj9ZA=
Received: by 10.223.91.68 with SMTP id l4mr16865561fam.16.1319356641418;
	Sun, 23 Oct 2011 00:57:21 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id o16sm34219469fag.21.2011.10.23.00.57.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 23 Oct 2011 00:57:20 -0700 (PDT)
Date: Sun, 23 Oct 2011 09:57:15 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111023075715.GD3497@jama.jama.net>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: bitbake eating more than 6GB ram while parsing recipes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 23 Oct 2011 08:03:17 -0000
X-Groupsio-MsgNum: 11458
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+KJYzRxRHjYqLGl5"
Content-Disposition: inline

--+KJYzRxRHjYqLGl5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

I know this was reported a while ago and I had this issue for few days
with 4 GB RAM on my workstation it was hard to do anything when bitbake
was parsing and today I've "resolved" it by removing cache.

first I've tried to remove
#PARALLEL_MAKE=3D"-j3"
#BB_NUMBER_THREADS =3D "2"
=66rom my local.conf and it didn't help I still had 6 bitbake processes
4 eating ~ 1GB ad 2 with ~ 512MB. So I've removed tmp/cache except
bb_persist_data.sqlite3:

OE om-gta02@shr ~/shr-core $ du -hs tmp/cache/*
35M     tmp/cache/bb_codeparser.dat
0       tmp/cache/bb_codeparser.dat.lock.13293
0       tmp/cache/bb_codeparser.dat.lock.13294
0       tmp/cache/bb_codeparser.dat.lock.13295
0       tmp/cache/bb_codeparser.dat.lock.15708
0       tmp/cache/bb_codeparser.dat.lock.16878
0       tmp/cache/bb_codeparser.dat.lock.16879
0       tmp/cache/bb_codeparser.dat.lock.16880
0       tmp/cache/bb_codeparser.dat.lock.25605
68K     tmp/cache/bb_persist_data.sqlite3
87M     tmp/cache/default-eglibc
OE om-gta02@shr ~/shr-core $ rm -rf tmp/cache/bb_codeparser.dat*

OE om-gta02@shr ~/shr-core $ du -hs tmp/cache/default-eglibc/*
13M     tmp/cache/default-eglibc/nokia900
13M     tmp/cache/default-eglibc/om-gta02
13M     tmp/cache/default-eglibc/palmpre
13M     tmp/cache/default-eglibc/qemuarm
13M     tmp/cache/default-eglibc/qemux86
13M     tmp/cache/default-eglibc/qemux86-64
13M     tmp/cache/default-eglibc/spitz
OE om-gta02@shr ~/shr-core $ rm -rf tmp/cache/default-eglibc/

and now it's sane again and memory used is < 2GB.

Regards,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--+KJYzRxRHjYqLGl5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6jyNoACgkQN1Ujt2V2gBy8DACfREci63uP1q0RdCMZLT19Rc78
2/cAn3ygDCZTHwQ97Ibm0MRQS2e6P2vZ
=xtNx
-----END PGP SIGNATURE-----

--+KJYzRxRHjYqLGl5--
