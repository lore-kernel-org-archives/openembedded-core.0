Return-Path: <prvs=20756b77e=Mikko.Rapeli@bmw.de>
Received: from esa8.bmw.c3s2.iphmx.com (esa8.bmw.c3s2.iphmx.com
	[68.232.139.97])
	by mail.openembedded.org (Postfix) with ESMTP id 16C846C109
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2019 13:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1573133776; x=1604669776;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=CxZ3WgwJUKtV1Qjwm6aQ/l9126icNkfO7RZPi1a/ZpQ=;
	b=G+cetoekVn/MwgkC2b6HpZXviq/shP/9tfNsnb3GXuFNYS3KTHbN5zow
	8Yp4+FFVOOXokWzz3DGleQLMXZNoqTJZPPN/tUMXPTo2HUVH5IHqQJzf0
	sVvfqW3fSyPSq+ZvrvMf+nIca0f6UY6zmbH3SW+pUxm9HQWSF0aXa7D07 k=;
IronPort-SDR: 1eoyFBPka+EkK4mMc+HXhIjUwRAIIoc8rKJbdJaWqc35TlKfhAbCesqkWQ7kj+Wue0CPcJs5Dw
	LsLR1ApQ3XGtC/rNVDc5rPIGaNXI3UGYQLhqth7Ln9Pe6AF8q5z22I4xQ6lHnDapuuXCB0v65E
	aZcglw96/6RpqHwTKHzx0kd3EA/ucaMQ7ncw2PeEOJpo6UEHJxodcx1BB6O+3AtZjoTU349FOq
	iARaulFy4ZuX8UXKKG2JF9ouBuKiAIrGkYPBv0a6MAdqx1kYhP4TNTf8QQBVHY7CFSlz/0OAqJ
	wWE=
Received: from esagw4.bmwgroup.com (HELO esagw4.muc) ([160.46.252.39]) by
	esa8.bmw.c3s2.iphmx.com with ESMTP/TLS; 07 Nov 2019 14:36:12 +0100
Received: from esabb1.muc ([160.50.100.31])  by esagw4.muc with ESMTP/TLS;
	07 Nov 2019 14:36:12 +0100
Received: from smucm10j.bmwgroup.net (HELO smucm10j.europe.bmw.corp)
	([160.48.96.46])
	by esabb1.muc with ESMTP/TLS; 07 Nov 2019 14:36:12 +0100
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10j.europe.bmw.corp
	(160.48.96.46) with Microsoft SMTP Server (TLS;
	Thu, 7 Nov 2019 14:36:11 +0100
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1473.005;
	Thu, 7 Nov 2019 14:36:11 +0100
From: <Mikko.Rapeli@bmw.de>
To: <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH][zeus][master] harfbuzz: split
	libharfbuzz-subset.so to its own binary package
Thread-Index: AQHVlUNSG044/2/lwkWEoh47QG5kM6d/eCOAgAAtNYA=
Date: Thu, 7 Nov 2019 13:36:11 +0000
Message-ID: <20191107133611.GP2398@hiutale>
References: <1573114413-26532-1-git-send-email-mikko.rapeli@bmw.de>
	<5b606c30-cc64-1b36-ea77-17445ec69f54@intel.com>
In-Reply-To: <5b606c30-cc64-1b36-ea77-17445ec69f54@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH][zeus][master] harfbuzz: split libharfbuzz-subset.so to its own binary package
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
X-List-Received-Date: Thu, 07 Nov 2019 13:36:15 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <FED42393369A9B41A7264969AB01E050@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 07, 2019 at 10:54:23AM +0000, Ross Burton wrote:
> On 07/11/2019 08:13, Mikko Rapeli wrote:
> > harfbuzz binary package size increased from 624608 bytes in yocto 2.5 t=
o
> > 1365431 bytes in yocto 3.0. Most of the size increase is in the new
> > libharfbuzz-subset.so* library, which based on the name seems to
> > duplicate parts of the libharfbuzz main library, though it
> > RDEPENDS on harfbuzz which is odd. Split it to its own binary
> > package which will be installed if anyone needs it. Effect to harfbuzz
> > binary package size is:
>=20
>=20
> The subset piece is a library to subset fonts, not a subset of the librar=
y
> itself.
>=20
> https://harfbuzz.github.io/utilities.html#utilities-command-line-hbsubset
>=20
> Can you update the message?

Thanks, v2 coming.

-Mikko=

