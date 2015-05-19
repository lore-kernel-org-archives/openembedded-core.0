Return-Path: <sona.sarmadi@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id EB535600B3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 May 2015 11:47:49 +0000 (UTC)
Received: from SESTOEX04.enea.se ([fe80::bc2d:9299:d6b2:d0b7]) by
	SESTOEX08.enea.se ([fe80::1c3:4003:dc47:23c0%11]) with mapi id
	14.03.0224.002; Tue, 19 May 2015 13:47:46 +0200
From: Sona Sarmadi <sona.sarmadi@enea.com>
To: 'Paul Eggleton' <paul.eggleton@linux.intel.com>, 'Paul Barker'
	<paul@paulbarker.me.uk>, Maxin John <Maxin.John@enea.com>
Thread-Topic: [OE-core] opkg and gpg signed ipk packages
Thread-Index: AQHQiQF1GoctQW/hYkC8XY65YpEcWJ1xw3SQgABfj4CAAdOP8IAHG78AgABqdyCAB70BcA==
Date: Tue, 19 May 2015 11:47:45 +0000
Message-ID: <3230301C09DEF9499B442BBE162C5E482599AC00@SESTOEX04.enea.se>
References: <3230301C09DEF9499B442BBE162C5E48258ED362@sestoex09.enea.se>
	<20150508162311.GA20977@bang.betafive.co.uk>
	<3230301C09DEF9499B442BBE162C5E48258F1A57@sestoex09.enea.se>
	<2514335.muUPAEFR2j@peggleto-mobl.ger.corp.intel.com>
	<3230301C09DEF9499B442BBE162C5E48258F21ED@sestoex09.enea.se>
In-Reply-To: <3230301C09DEF9499B442BBE162C5E48258F21ED@sestoex09.enea.se>
Accept-Language: sv-SE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.142.231]
MIME-Version: 1.0
Cc: "'openembedded-core@lists.openembedded.org'"
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
X-List-Received-Date: Tue, 19 May 2015 11:47:51 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


> > I'm guessing you would want something like this in your custom distro
> > config (or local.conf if you must):
> >
> > PACKAGECONFIG_append_pn-opkg =3D " sha256"
> > PACKAGECONFIG_append_pn-opkg-native =3D " sha256"
>

Thanks a lot guys for your help, this is now working :)
There is support for sha256 in opkg but not in the opkg-utils.=20
opkg-utils (opkg.py) just uses md5 as default option. I changed=20
=20
opkg.py:
........
        # compute the MD5.
        if not self.fn:
            self.md5 =3D 'Unknown'
        else:
            f =3D open(self.fn, "rb")
            sum =3D hashlib.md5()=20
to
            sum =3D hashlib.sha256()

and now I get checksum sha256 in the "Packages" file:

SHA256Sum: 6be1fb5b9dab3de5848fd578d515d05adc5c6cd3b0009f8c1b13ab1250cee594

Do you think this patch would be of interest for someone?=20

//Sona

