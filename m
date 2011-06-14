Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QWbSx-00045p-KI
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Jun 2011 23:48:07 +0200
Received: by wwb17 with SMTP id 17so5318661wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2011 14:44:42 -0700 (PDT)
Received: by 10.227.157.134 with SMTP id b6mr7001017wbx.59.1308087881995;
	Tue, 14 Jun 2011 14:44:41 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id o19sm5355986wbh.21.2011.06.14.14.44.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 14 Jun 2011 14:44:41 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <BANLkTi=Kk7J-ZAQuPkC5LNAnxZSAzwtvOg@mail.gmail.com>
Date: Tue, 14 Jun 2011 23:44:38 +0200
Message-Id: <8C2617DC-2693-42A3-810B-C3A516DB7360@dominion.thruhere.net>
References: <1308086002-16398-1-git-send-email-raj.khem@gmail.com>
	<1308086688.15712.362.camel@rex>
	<CFF0ECE5-F738-4233-8214-9E57A6616C5B@dominion.thruhere.net>
	<BANLkTi=Kk7J-ZAQuPkC5LNAnxZSAzwtvOg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH V2] allarch.bbclass: Set FEED_ARCH to original value of BASE_PACKAGE_ARCH and then set BASE_PACKAGE_ARCH to 'all'
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
X-List-Received-Date: Tue, 14 Jun 2011 21:48:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 14 jun 2011, om 23:40 heeft Khem Raj het volgende geschreven:

> On Tue, Jun 14, 2011 at 2:32 PM, Koen Kooi =
<koen@dominion.thruhere.net> wrote:
>>=20
>> Op 14 jun 2011, om 23:24 heeft Richard Purdie het volgende =
geschreven:
>>=20
>>> On Tue, 2011-06-14 at 14:13 -0700, Khem Raj wrote:
>>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>> ---
>>>> meta/classes/allarch.bbclass |    5 +++--
>>>> 1 files changed, 3 insertions(+), 2 deletions(-)
>>>>=20
>>>> diff --git a/meta/classes/allarch.bbclass =
b/meta/classes/allarch.bbclass
>>>> index e3ac392..b9ba28b 100644
>>>> --- a/meta/classes/allarch.bbclass
>>>> +++ b/meta/classes/allarch.bbclass
>>>> @@ -2,9 +2,10 @@
>>>> # This class is used for architecture independent recipes/data =
files (usally scripts)
>>>> #
>>>>=20
>>>> +# We need to pour the value of BASE_PACKAGE_ARCH into FEED_ARCH
>>>> +# before we reset it
>>>> +FEED_ARCH :=3D ${BASE_PACKAGE_ARCH}
>>>> BASE_PACKAGE_ARCH =3D "all"
>>>> -PACKAGE_ARCH =3D "all"
>>>> -
>>>> # No need for virtual/libc or a cross compiler
>>>> INHIBIT_DEFAULT_DEPS =3D "1"
>>>=20
>>> This is a *really* bad idea. An "all" package should have no need to =
set
>>> architecture specific values into FEED_ARCH.
>>>=20
>>> Just for those not following IRC, the problem is Angstrom adds =
FEED_ARCH
>>> to OVERRIDES. Adding "all" to overrides turns out to do nasty things =
to
>>> classes like rm_work with "_all" in the function names.
>>=20
>> So why don't we just set PACKAGE_ARCH =3D all in allarch.bbclass and =
not touch BASE_PACKAGE_ARCH and FEED_ARCH?
>>=20
>=20
> because there are some machines conf files which use BASE_PACKAGE_ARCH =
e.g.
> tune-xscale.inc
>=20
> BASE_PACKAGE_ARCH =3D "${@['armv5teb',
> 'armv5te'][bb.data.getVar('SITEINFO_ENDIANESS', d, 1) =3D=3D 'le']}"
>=20
> PACKAGE_EXTRA_ARCHS =3D "${@['armeb armv4b armv4tb armv5teb', 'arm =
armv4
> armv4t armv5te'][bb.data.getVar('SITEINFO_ENDIANESS', d, 1) =3D=3D =
'le']}"
>=20
> and this does not get evaluated properly then

But that wouldn't matter in the scope of allarch, though?=


