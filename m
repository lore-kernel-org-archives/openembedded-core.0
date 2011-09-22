Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1R6q3U-0001PB-N5
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Sep 2011 22:39:36 +0200
Received: by fxi1 with SMTP id 1so3166625fxi.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2011 13:34:14 -0700 (PDT)
Received: by 10.223.102.21 with SMTP id e21mr1882416fao.90.1316723653872;
	Thu, 22 Sep 2011 13:34:13 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id l8sm8600324fai.16.2011.09.22.13.34.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Sep 2011 13:34:11 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4E7B9A47.1080402@linux.intel.com>
Date: Thu, 22 Sep 2011 22:34:06 +0200
Message-Id: <AD754E2A-9B9B-424A-97D8-E382E2B0680F@dominion.thruhere.net>
References: <cover.1316717234.git.dvhart@linux.intel.com>
	<4b97e6b25906806eef1131e851abc9526d81d0db.1316717234.git.dvhart@linux.intel.com>
	<1316721518.28323.1.camel@ted> <4E7B9A47.1080402@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Cc: Josh Lock <joshua.lock@intel.com>
Subject: Re: [PATCH 1/1] shared-mime-info: add libxml-parser-perl to DEPENDS
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
X-List-Received-Date: Thu, 22 Sep 2011 20:39:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 22 sep. 2011, om 22:27 heeft Darren Hart het volgende geschreven:

>=20
>=20
> On 09/22/2011 12:58 PM, Richard Purdie wrote:
>> On Thu, 2011-09-22 at 11:49 -0700, Darren Hart wrote:
>>> Fixes [YOCTO #1514]
>>>=20
>>> Building core-image-minimal on qemuppc (and likely others) can fail =
in
>>> the shared-mime-info configure step with the following error:
>>>=20
>>> checking for XML::Parser... configure: error: XML::Parser perl =
module is
>>> required for intltool
>>>=20
>>> Adding libxml-parser-perl to DEPENDS allows share-mime-info-native =
to build
>>> successfully.
>>>=20
>>> Testing: build tested the native version on qemuppc. I run into tool =
chain
>>> build failures before I can get to building the target version.
>>>=20
>>> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
>>> CC: Joshua Lock <josh@linux.intel.com>
>>> ---
>>> .../shared-mime-info/shared-mime-info.inc          |    4 ++--
>>> 1 files changed, 2 insertions(+), 2 deletions(-)
>>>=20
>>> diff --git =
a/meta/recipes-support/shared-mime-info/shared-mime-info.inc =
b/meta/recipes-support/shared-mime-info/shared-mime-info.inc
>>> index 64eef9d..e206305 100644
>>> --- a/meta/recipes-support/shared-mime-info/shared-mime-info.inc
>>> +++ b/meta/recipes-support/shared-mime-info/shared-mime-info.inc
>>> @@ -5,8 +5,8 @@ SECTION =3D "base"
>>> LICENSE =3D "GPLv2+"
>>> LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D0636e73ff0215e8d672dc4c32c317bb3"
>>>=20
>>> -DEPENDS =3D "libxml2 intltool-native glib-2.0 =
shared-mime-info-native"
>>> -DEPENDS_virtclass-native =3D "libxml2-native intltool-native =
glib-2.0-native"
>>> +DEPENDS =3D "libxml2 intltool-native glib-2.0 =
shared-mime-info-native libxml-parser-perl"
>>> +DEPENDS_virtclass-native =3D "libxml2-native intltool-native =
glib-2.0-native libxml-parser-perl-native"
>>>=20
>>> SRC_URI =3D =
"http://freedesktop.org/~hadess/shared-mime-info-${PV}.tar.bz2"
>>=20
>>=20
>> There must be some underlying problem here. intltool-native should
>> depend on libxml-parser-perl-native so it should already be built. We
>> need to fix the underlying issue, not the symptom :/
>=20
> So intltool.inc:
>=20
> DEPENDS =3D "libxml-parser-perl-native"
> #RDEPENDS_${PN} =3D "libxml-parser-perl"
> RRECOMMENDS_${PN} =3D "perl-modules"
> RRECOMMENDS_${PN}_virtclass-native =3D ""
>=20
> Shouldn't this instead look like:
>=20
> DEPENDS =3D "libxml-parser-perl"
> DEPENDS_virtclass-native =3D "libxml-parser-perl-native"

It needs -native for both, sadly=


