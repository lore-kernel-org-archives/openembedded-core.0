Return-Path: <prvs=11390c5c8=Mikko.Rapeli@bmw.de>
Received: from esa9.bmw.c3s2.iphmx.com (esa9.bmw.c3s2.iphmx.com
	[68.232.133.110])
	by mail.openembedded.org (Postfix) with ESMTP id 09FC27F338
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Aug 2019 07:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1564989685; x=1596525685;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=4Y+R1mbGVeu+slPbWWo0gTQgaWjFSXu+aOYkohf+Nck=;
	b=DJzeEPAgHo2fOSPhyI/WlXQh/2dl5q3xe7px63eBzGH83PvwzdNHaqI8
	AAs9J1lccpFSTYDxStcKK0zj3fY5u/PHMky+cLBcxidXNjaYKKfeJZdn7
	p1NSADvNt8WoSPBmgk5WhTbyvh/VIa/3jREiGdekoUcWM72G8KVDC5hDb M=;
IronPort-SDR: 4l8tdicBRDVwJuM3nonU6jWqWtNmMdWlbsRC1DsoHfA3EieY9ycnFJqcvXXEIRAMJpx4PYXkAH
	jwPsujZZ7EKTkJJO6TT35q2I9JMGkzESrGgEQPHkodeQPxtL5qYaFn2CEX5fnVKJ0BL28JxIJR
	seMUpR0Q7WVnYykj92iWNwHZ8D1PMMxhTB/+sczG3SzXtH6+NFclskin/L7SHhNnEcbbipRCZN
	D/SFa3NqcTrO7t2BEnQSx3xtxaq1Pm0/JlAGAryW1Wbf8K88UswPT62lEtszPhdH93Gi3SeUIp
	Nh8=
Received: from esagw3.bmwgroup.com (HELO esagw3.muc) ([160.46.252.35]) by
	esa9.bmw.c3s2.iphmx.com with ESMTP/TLS; 05 Aug 2019 09:21:24 +0200
Received: from esabb2.muc ([160.50.100.34])  by esagw3.muc with ESMTP/TLS;
	05 Aug 2019 09:21:23 +0200
Received: from smucm10j.bmwgroup.net (HELO smucm10j.europe.bmw.corp)
	([160.48.96.46])
	by esabb2.muc with ESMTP/TLS; 05 Aug 2019 09:21:22 +0200
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10j.europe.bmw.corp
	(160.48.96.46) with Microsoft SMTP Server (TLS;
	Mon, 5 Aug 2019 09:21:21 +0200
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1473.005;
	Mon, 5 Aug 2019 09:21:21 +0200
From: <Mikko.Rapeli@bmw.de>
To: <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] Hash Equivalency - What this means for developer
	productivity
Thread-Index: AQHVSU4p3ePxqXq1q0+N7kw4NPUZt6bsCJ+A
Date: Mon, 5 Aug 2019 07:21:21 +0000
Message-ID: <20190805072121.GM3459@hiutale>
References: <a3cde6526f42e115340654402a3e89bed42facd8.camel@linuxfoundation.org>
	<a020143f53511171dc4d407e0d8dde259af3852a.camel@linuxfoundation.org>
In-Reply-To: <a020143f53511171dc4d407e0d8dde259af3852a.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.168.221.35]
MIME-Version: 1.0
Cc: JPEW.hacker@gmail.com, openembedded-core@lists.openembedded.org
Subject: Re: Hash Equivalency - What this means for developer productivity
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
X-List-Received-Date: Mon, 05 Aug 2019 07:21:23 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <85C4C429EA70424FA7E053700966257B@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Aug 02, 2019 at 05:17:21PM +0100, Richard Purdie wrote:
> On Fri, 2019-08-02 at 16:53 +0100, Richard Purdie wrote:
> > With the patches in master-next and this configuration in local.conf:
> >=20
> > BB_HASHSERVE =3D "localhost:0"
> > BB_SIGNATURE_HANDLER =3D "OEEquivHash"
> >=20
> > $ bitbake core-image-sato
> > $ bitbake m4-native -c install -f
> > $ bitbake core-image-sato
> >=20
> > will result in do_populate_sysroot of m4-native running, it will see
> > the output matches the previous build and it will then skip to the
> > rootfs generation pulling all the other pieces from sstate.
> >=20
> > Note that for this to work, m4-native has to have previously built
> > with the hashserv running, otherwise it has nothing to compare its
> > output to.
> >=20
> > I think this should be a "big deal" for many developers, reducing
> > unneeded rebuilds and hence speeding up development.

Awesome, thanks for pushing this!

> I should have mentioned, this code relies on reproducibile builds as
> its comparing the binary output. The more reproducibile builds are, the
> more likely sstate reuse will happen.
>=20
> This is one reason reproducibile builds are important!

What else do users need to enable to get more reproducible builds, or
are poky defaults enough?

Are there some tools available to debug build reproducibility issues e.g.
when task hashes suddenly changed?

Cheers,

-Mikko=

