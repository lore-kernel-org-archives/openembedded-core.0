Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RU0PR-0006b6-AU
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Nov 2011 19:22:02 +0100
Received: by wwo1 with SMTP id 1so5333682wwo.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Nov 2011 10:15:26 -0800 (PST)
Received: by 10.227.208.81 with SMTP id gb17mr5269186wbb.26.1322244926484;
	Fri, 25 Nov 2011 10:15:26 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id co5sm10974347wib.8.2011.11.25.10.15.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 25 Nov 2011 10:15:25 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Fri, 25 Nov 2011 19:15:21 +0100
In-Reply-To: <1322240018.24330.37.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <27A3051A-BC1D-4937-B936-42760021F584@dominion.thruhere.net>
	<1322240018.24330.37.camel@ted>
Message-Id: <A23FAF45-E1BD-41B6-B8EA-92BC2C74E429@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: opkg-make-index cache failing
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
X-List-Received-Date: Fri, 25 Nov 2011 18:22:02 -0000
X-Groupsio-MsgNum: 12959
Content-Type: multipart/signed;
	boundary="Apple-Mail=_1F557BC2-AA1F-48E5-B5A7-AE17395C6A3F";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_1F557BC2-AA1F-48E5-B5A7-AE17395C6A3F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=iso-8859-1


Op 25 nov. 2011, om 17:53 heeft Richard Purdie het volgende geschreven:

> On Fri, 2011-11-25 at 16:38 +0100, Koen Kooi wrote:
>> In OE-classic the opkg-make-index cache was working pretty well,
>> do_rootfs only spent a few seconds doing opkg-make-index on
>> incremental builds. In the OE-core world the situation is different,
>> opkg-make-index will reindex every package on each do_rootfs run, so
>> after a while building images starts taking *really* long, on my
>> systemd (work/ on ssd, deploy on rotating media) it now takes
>> =B17minutes just do refresh the opkg indices.
>>=20
>> Since I can't blame sstate for this I suspect that pseudo gets in the
>> way of the naive caching logic. Is there a simple way to turn off
>> pseudo when running opkg-make-index?

With a relatively small deploy:

real	6m14.611s
user	2m45.909s
sys	0m43.674s

> You could try:
>=20
> PSEUDO_DISABLED=3D1 opkg-make-index

real	5m25.920s
user	2m41.279s
sys	0m41.681s

> or even
>=20
> PSEUDO_UNLOAD=3D1 opkg-make-index

real	5m5.699s
user	2m37.283s
sys	0m37.508s

Now I need to double check to see if  the patches are really having =
effect on the opkg caching instead of just not having pseudo overhead.

regards,

Koen=

--Apple-Mail=_1F557BC2-AA1F-48E5-B5A7-AE17395C6A3F
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7P2zsACgkQMkyGM64RGpEYSACfW8zpUOVIyxDgxHz+GWIR3qS5
o+EAn3EOt5roY09cKrL9i5F9UszSN0fy
=ccUX
-----END PGP SIGNATURE-----

--Apple-Mail=_1F557BC2-AA1F-48E5-B5A7-AE17395C6A3F--
