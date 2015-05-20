Return-Path: <sona.sarmadi@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id C14D5601E3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 10:44:41 +0000 (UTC)
Received: from SESTOEX04.enea.se ([fe80::bc2d:9299:d6b2:d0b7]) by
	SESTOEX08.enea.se ([fe80::1c3:4003:dc47:23c0%11]) with mapi id
	14.03.0224.002; Wed, 20 May 2015 12:44:40 +0200
From: Sona Sarmadi <sona.sarmadi@enea.com>
To: Mark Hatle <mark.hatle@windriver.com>, 'Otavio Salvador'
	<otavio@ossystems.com.br>, Gary Thomas <gary@mlbassoc.com>
Thread-Topic: [OE-core] opkg and gpg signed ipk packages
Thread-Index: AQHQiQF1GoctQW/hYkC8XY65YpEcWJ1xw3SQgABfj4CAAdOP8IAHG78AgABqdyCAB70BcP//6amAgAAn0ICAAV4y8A==
Date: Wed, 20 May 2015 10:44:39 +0000
Message-ID: <3230301C09DEF9499B442BBE162C5E482599C78F@SESTOEX04.enea.se>
References: <3230301C09DEF9499B442BBE162C5E48258ED362@sestoex09.enea.se>
	<20150508162311.GA20977@bang.betafive.co.uk>
	<3230301C09DEF9499B442BBE162C5E48258F1A57@sestoex09.enea.se>
	<2514335.muUPAEFR2j@peggleto-mobl.ger.corp.intel.com>
	<3230301C09DEF9499B442BBE162C5E48258F21ED@sestoex09.enea.se>
	<3230301C09DEF9499B442BBE162C5E482599AC00@SESTOEX04.enea.se>
	<CAP9ODKoZrbZdx5xuGZASmUL_1X6uoXpu_Hnz4+3RX58AMEn0NQ@mail.gmail.com>
	<555B476B.9040400@windriver.com>
In-Reply-To: <555B476B.9040400@windriver.com>
Accept-Language: sv-SE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.142.231]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: opkg and gpg signed ipk packages
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
X-List-Received-Date: Wed, 20 May 2015 10:44:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> >> Do you think this patch would be of interest for someone?
> >
> > Yes but it would be good to make it choosable at distro level.

Opkg has support for 'sha256' but opkg-utils only supports md5.=20
We could pass the sha256 option to opkg-utils (like other parameters such a=
s Maintainer),=20
and make it configurable. We just need to figure out how to pass this optio=
n to opkg-utils.
=20
Since MD5 is not very secure, wouldn't it be better to use sha256 as defaul=
t?=20
Or is there any specific reason that someone would want MD5 to be kept as t=
he
default (due to e.g. performance, backwards compatibility .. ?). =20
It takes longer time to compute a sha256 checksum compared to md5 but=20
sha256 is more secure & reliable.=20

Any way it would be good to have this optional (sha256 or md5).=20

> I agree.. and RPM(5) has the ability to switch the default checksum from =
MD5
> to others as well.  So a global distro setting would make sense.  (I don'=
t know
> how the deb package manager is configured.)
>=20
> Let me know if we come up with a distribution level switch (or if we just=
 want
> to make the policy be sha256, as it's definitely better then MD5) and I c=
an
> help make the RPM configuration change as well.

I think a configuration at high level would be good to use for all PMS, to =
choose MD5 or sha256.=20

conf/local.conf:
# Package Management configuration
PACKAGE_CLASSES ?=3D "package_ipk"
Or
PACKAGE_CLASSES ?=3D "package_rpm"

PACKAGE_CHECKSUM ?=3D "sha256"   <<< something like this
Or=20
PACKAGE_CHECKSUM ?=3D "md5"

//Sona




