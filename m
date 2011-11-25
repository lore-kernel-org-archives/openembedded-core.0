Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RTwcv-0001Yd-HZ
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Nov 2011 15:19:41 +0100
Received: by faat2 with SMTP id t2so3551505faa.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Nov 2011 06:13:03 -0800 (PST)
Received: by 10.152.111.1 with SMTP id ie1mr7822337lab.7.1322230382840;
	Fri, 25 Nov 2011 06:13:02 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id px20sm3764979lab.2.2011.11.25.06.13.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 25 Nov 2011 06:13:01 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1322229145.10928.70.camel@ted>
Date: Fri, 25 Nov 2011 15:12:57 +0100
Message-Id: <5BABEA4D-0778-4CA4-A951-3D447D470029@dominion.thruhere.net>
References: <1812495.zPKFoIJV0g@helios>
	<B216D4A1-D3C8-4C0A-835C-A7509C350CDB@dominion.thruhere.net>
	<1322229145.10928.70.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
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
X-List-Received-Date: Fri, 25 Nov 2011 14:19:41 -0000
X-Groupsio-MsgNum: 12952
Content-Type: multipart/signed;
	boundary="Apple-Mail=_C4FBD60A-2D12-4315-8F80-BC0B660E305D";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_C4FBD60A-2D12-4315-8F80-BC0B660E305D
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 25 nov. 2011, om 14:52 heeft Richard Purdie het volgende geschreven:

> On Fri, 2011-11-25 at 14:17 +0100, Koen Kooi wrote:
>> Op 25 nov. 2011, om 12:44 heeft Paul Eggleton het volgende =
geschreven:
>>> Hi Koen / Beth / all,
>>>=20
>>> Following on from my work extending packagehistory (which is still =
under=20
>>> review), I'm looking at tracking history of the content of images so =
we can=20
>>> get warnings about regressions. Thanks to Koen we've had this =
capability via=20
>>> testlab.bbclass in OE for some time now, and from there into =
meta-oe, but what=20
>>> I'd like to do now is bring this into OE-core and extend it so that =
it=20
>>> supports rpm (or even better, all of the package backends we =
support.) This=20
>>> could involve abstracting the package backend functionality out into=20=

>>> rootfs_*.bbclass.
>>>=20
>>> It also looks like testlab.bbclass in meta-oe has some license =
dumping=20
>>> functionality. Beth, does that mesh with what you've been working on =
/=20
>>> preparing for Yocto 1.2?
>>>=20
>>> Thoughts?
>>=20
>> Don't forget its integration into remote git: =
http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/testlab/?h=3Dyocto=20=

>> I must admit that it completely sucks when you have >1 builder, but =
that is fixable. There are a number of other things we need to store =
somewhere (e.g. package history, PR config, etc), so coming up with a =
plan to store all that in a single repo would be good.
>>=20
>> The are a few issues with its current output:
>>=20
>> * License info uses the filename instead of the package name =
(f'oo_1.2.3_arch.ipk' vs 'foo') which leads to too much changes with =
small version bumps
>> * Dependencies are not sorted intelligently, so sometimes you get =
diffs which don't contain any actual change, just ordering junk,
>> * It only reports oe-core rev, not layer revisions, config and =
shortlog. Ideally it would output something like:
>>=20
>> meta: angstrom-staging:b3ffd40a4a1eacab90dac26df8a4a047486f3b96 =
pulseaudio: update to 1.1, delete 0.9.x
>> meta-oe: master:7019fbb50796fedcedef6ff92981a7f26659a251 mplayer: fix =
build with -Wl,-as-needed=20
>> meta-efl:
>> meta-gnome:
>> meta-xfce:
>> meta-angstrom master:bc72e71ccf7e79cdc8246e0ae0dbe62d11355263 =
angstrom-2010-preferred-versions.inc : Stop pinning python-cairo
>>=20
>> Taking this a step further: it's output should be able to get passed =
into layer tooling (combo-layer to yocto people, setup-scripts for =
angstrom people) to reproduce builds.
>=20
> So the real question is one of the approach. We have several options =
and
> its related to how compatible we want/need to be.
>=20
> Do we import testlab from meta-oe as is, then add patches (multiple
> package backend support and so on)? How compatible do we need to be? =
I'm
> conscious its something being actively used.

In this specific case I don't care about backwards compatibility.

> Do we enhance packagehistory reusing code from testlab as appropriate?
>=20
> Do we start something new as a hybrid of the two? (shouldn't be needed
> as I'm prepared to say packagehistory can radically change as needed, =
I
> don't care about compatibility there).
>=20
> At the end of this I want to have one great "history" tracking =
mechanism
> for finding regressions covering testlab's functionality, package
> history and more.
>=20
> Just to be clear I don't want to reinvent the wheel :).

For this history tracking both 'testlab' and 'packagehistory' are =
misnomers, so we can just start a new class that reuses ideas and code =
if needed.

Hopefully testlab can then fullfill its original goal: fully automated =
on-target testing. That should be doable with OE-core since that only =
has qemu machines :)

regards,

Koen=

--Apple-Mail=_C4FBD60A-2D12-4315-8F80-BC0B660E305D
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7PomwACgkQMkyGM64RGpHG8wCfaSNtaV9IVeeyMs/2BSbkccoV
NXgAn21I7yr80jNLzeLBqtEaGP/EVWmX
=E53n
-----END PGP SIGNATURE-----

--Apple-Mail=_C4FBD60A-2D12-4315-8F80-BC0B660E305D--
