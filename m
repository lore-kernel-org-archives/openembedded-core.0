Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RTvkv-0007Bj-VI
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Nov 2011 14:23:53 +0100
Received: by faat2 with SMTP id t2so3509440faa.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Nov 2011 05:17:19 -0800 (PST)
Received: by 10.152.105.203 with SMTP id go11mr20333536lab.10.1322227039214;
	Fri, 25 Nov 2011 05:17:19 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id pc8sm22722748lab.8.2011.11.25.05.17.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 25 Nov 2011 05:17:18 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1812495.zPKFoIJV0g@helios>
Date: Fri, 25 Nov 2011 14:17:15 +0100
Message-Id: <B216D4A1-D3C8-4C0A-835C-A7509C350CDB@dominion.thruhere.net>
References: <1812495.zPKFoIJV0g@helios>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1251.1)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Image history (testlab)
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
X-List-Received-Date: Fri, 25 Nov 2011 13:23:54 -0000
X-Groupsio-MsgNum: 12950
Content-Type: multipart/signed;
	boundary="Apple-Mail=_A2C9D072-53CF-4D95-8AEF-C4A1E654D750";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_A2C9D072-53CF-4D95-8AEF-C4A1E654D750
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 25 nov. 2011, om 12:44 heeft Paul Eggleton het volgende geschreven:

> Hi Koen / Beth / all,
>=20
> Following on from my work extending packagehistory (which is still =
under=20
> review), I'm looking at tracking history of the content of images so =
we can=20
> get warnings about regressions. Thanks to Koen we've had this =
capability via=20
> testlab.bbclass in OE for some time now, and from there into meta-oe, =
but what=20
> I'd like to do now is bring this into OE-core and extend it so that it=20=

> supports rpm (or even better, all of the package backends we support.) =
This=20
> could involve abstracting the package backend functionality out into=20=

> rootfs_*.bbclass.
>=20
> It also looks like testlab.bbclass in meta-oe has some license dumping=20=

> functionality. Beth, does that mesh with what you've been working on /=20=

> preparing for Yocto 1.2?
>=20
> Thoughts?

Don't forget its integration into remote git: =
http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/testlab/?h=3Dyocto=20=

I must admit that it completely sucks when you have >1 builder, but that =
is fixable. There are a number of other things we need to store =
somewhere (e.g. package history, PR config, etc), so coming up with a =
plan to store all that in a single repo would be good.

The are a few issues with its current output:

* License info uses the filename instead of the package name =
(f'oo_1.2.3_arch.ipk' vs 'foo') which leads to too much changes with =
small version bumps
* Dependencies are not sorted intelligently, so sometimes you get diffs =
which don't contain any actual change, just ordering junk,
* It only reports oe-core rev, not layer revisions, config and shortlog. =
Ideally it would output something like:

meta: angstrom-staging:b3ffd40a4a1eacab90dac26df8a4a047486f3b96 =
pulseaudio: update to 1.1, delete 0.9.x
meta-oe: master:7019fbb50796fedcedef6ff92981a7f26659a251 mplayer: fix =
build with -Wl,-as-needed=20
meta-efl:
meta-gnome:
meta-xfce:
meta-angstrom master:bc72e71ccf7e79cdc8246e0ae0dbe62d11355263 =
angstrom-2010-preferred-versions.inc : Stop pinning python-cairo

Taking this a step further: it's output should be able to get passed =
into layer tooling (combo-layer to yocto people, setup-scripts for =
angstrom people) to reproduce builds.

regards,

Koen=

--Apple-Mail=_A2C9D072-53CF-4D95-8AEF-C4A1E654D750
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7PlV0ACgkQMkyGM64RGpFN0gCdHkm+kr8wijE3ay4azX6S6jan
I00AnA0UMx8txH1fWIXvQDRXoj2E2aJd
=lQMj
-----END PGP SIGNATURE-----

--Apple-Mail=_A2C9D072-53CF-4D95-8AEF-C4A1E654D750--
