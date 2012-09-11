Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TBU0x-00036I-2U
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 19:12:43 +0200
Received: by eaad12 with SMTP id d12so352692eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2012 10:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=zY7VLC3jaiwcyQJCErftpxHcWHgjo6Ijo58f63V1ewc=;
	b=XuNA/t/9dvzmwxKQgKzORChx5aw/vOoU1GW029Kb+3dcpmvYqkUEOr97LcqfNYS73l
	h/5083WMmO9d9VrNkMQBl1N3eWIp8e3Fe38XiAwEOTjAG61orbsWsSCPIP9TDTjAJTEn
	kd1e5E/4LvvEX/gXhnqNcxyBov0doEbV9Kobs//WObZyin24wOS5l/FpWW6YaM38GL9j
	lgYi2MFPQ4OvTMnUUXcaL1Y6tFKbDQGUbxgbHjIG9NbvRN3HVVHVmer8SS8gYhUwAGZt
	cnvUIG912pl0kH/BmQLT7Ubz0ZAPE9l3KCpAsTNT9+/to47OtL71Seis0IJCCy6C9DIX
	LiDA==
Received: by 10.204.148.82 with SMTP id o18mr5018719bkv.41.1347382405862;
	Tue, 11 Sep 2012 09:53:25 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n17sm10228878bks.6.2012.09.11.09.53.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 11 Sep 2012 09:53:22 -0700 (PDT)
Date: Tue, 11 Sep 2012 18:53:23 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Phil Blundell <philb@gnu.org>
Message-ID: <20120911165323.GJ14077@jama.jama.net>
References: <20120911130155.GC14077@jama.jama.net>
	<1347381972.29443.15.camel@x121e.pbcl.net>
MIME-Version: 1.0
In-Reply-To: <1347381972.29443.15.camel@x121e.pbcl.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: qemuarm: should it really have TUNE_ARCH armv5te?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Sep 2012 17:12:43 -0000
X-Groupsio-MsgNum: 29074
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="enLffk0M6cffIOOh"
Content-Disposition: inline

--enLffk0M6cffIOOh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 11, 2012 at 05:46:12PM +0100, Phil Blundell wrote:
> On Tue, 2012-09-11 at 15:01 +0200, Martin Jansa wrote:
> > Shouldn't spitz produce something like armv5te-xscale and qemuarm armv5=
te-arm926ejs?
>=20
> That's a DISTRO policy decision really.
>=20
> "armv5te", in common with most of the PACKAGE_ARCHes, represents an ISA.
> That is, it is guaranteed to only contain instructions which are
> supported by all v5TE cores (which includes both ARM926EJ-S and XScale).
> It obviously follows from this that packages with PACKAGE_ARCH=3Darmv5te
> are suitable for running on both qemuarm and xscale MACHINEs.
>=20
> Note that a binary that was built with -mtune=3Darm926ej-s is still an
> ARMv5TE binary and will run just fine on xscale.  It won't run quite as
> fast as one that was built -mtune=3Dxscale, though the performance
> difference is not so great as to be completely crippling.  With current
> gcc, the reverse is true as well: a binary built -mtune=3Dxscale is also
> still ARMv5TE and will run just fine on ARM926EJ-S, and in fact the
> performance penalty is less this way around.
>=20
> Now, if your DISTRO feels that the performance difference is important
> enough to be worth distinguishing the packages, you can certainly
> arrange for those two tunings to get separate PACKAGE_ARCHes and
> maintain parallel feeds.  But in the general case it's not totally
> obvious that this would be worthwhile, and I'm not sure it is a very
> useful thing to do by default.

But that is default now, that's why I've started this thread.

It uses PACKAGE_ARCH=3Darmv5te while using -mtune. Causing different
sstate checksums and rebuilds when you switch e.g. qemuarm and spitz.

If we drop DEFAULTTUNE from tune-xscale and tune-arm926ejs then
PACKAGE_ARCH=3Darmv5te would be the same and the same feed will be built
only once.

And if DISTO feels that the performance difference is important then
something like OPTDEFAULTTUNE could be added:
http://lists.linuxtogo.org/pipermail/openembedded-core/2012-September/02945=
5.html

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--enLffk0M6cffIOOh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBPbIMACgkQN1Ujt2V2gBy4gwCfUn3Igj1Ih55vP9sP8fbJmAKA
4MwAn3Hq6vwVDP/0hN8OVQxtEPOr8boK
=WSv5
-----END PGP SIGNATURE-----

--enLffk0M6cffIOOh--
