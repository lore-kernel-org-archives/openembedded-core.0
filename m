Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QWnBF-00010b-Gc
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Jun 2011 12:18:37 +0200
Received: by wye20 with SMTP id 20so195216wye.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2011 03:15:11 -0700 (PDT)
Received: by 10.216.230.105 with SMTP id i83mr1925532weq.43.1308132911073;
	Wed, 15 Jun 2011 03:15:11 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id l5sm161141weq.9.2011.06.15.03.15.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 15 Jun 2011 03:15:10 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1308132426.15712.387.camel@rex>
Date: Wed, 15 Jun 2011 12:15:08 +0200
Message-Id: <9B8FDB01-CFAA-497E-BD0E-93D421E6C4F8@dominion.thruhere.net>
References: <1308086002-16398-1-git-send-email-raj.khem@gmail.com>
	<1308086688.15712.362.camel@rex>
	<CFF0ECE5-F738-4233-8214-9E57A6616C5B@dominion.thruhere.net>
	<1308132426.15712.387.camel@rex>
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
X-List-Received-Date: Wed, 15 Jun 2011 10:18:37 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 15 jun 2011, om 12:07 heeft Richard Purdie het volgende geschreven:

> On Tue, 2011-06-14 at 23:32 +0200, Koen Kooi wrote:
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
not
>> touch BASE_PACKAGE_ARCH and FEED_ARCH?
>=20
> Because then FEED_ARCH and BASE_PACKAGE_ARCH contain machine specific
> data, and the sstate packages become machine specific. When we're =
trying
> to create architecture independent packages, this isn't desirable and
> people complained about too much of the system rebuilding...
>=20
> There is an underlying problem of why BASE_PACKAGE_ARCH and/or =
FEED_ARCH
> is being used but it did seem like one way to fix several of the
> problems people were seeing (not realising it would leak into =
OVERRIDES
> too).
>=20
>>> I'd suggest that various machines should start adding things like =
armv7a
>>> to ${MACHINEOVERRIDES} which has a much more clearly defined scope =
and
>>> that FEED_ARCH should quietly die ;-).
>>=20
>> And that's what I've start calling a 'yocto' type of solution.
>=20
> Was it really necessary to add that? ;-)
>=20
> I'm tempted to write some definitions of my own but I'll refrain.
>=20
>> That just doesn't scale since it relies on fixing all the machines
>> out there instead of levering the knowledge provided by OE already.
>> I'd appreciate a solution is better thought out.
>=20
> Well, I was trying to provide some hints as to how we might be able to
> improve this situation, not write the whole roadmap. =46rom what I
> remember and the quick discussion we had offlist there are two things
> FEED_ARCH tries to do:
>=20
> a) Provide an addition to overrides that represents the
> optimisation/tune profile being used (like armv7a).
>=20
> b) Provide some info in BASE_PACKAGE_ARCH so that when PACKAGE_ARCH is
> overwritten, you can still find out what it would have been set to.
>=20
> For a), we could update the common include files for the omap/armv7a
> platforms and append to MACHINEOVERRIDES there with the appropriate
> entries

It's not omap specific, you really need have access to the arch in =
overrides for *all* platforms. I'm using armv7a is an example since =
angstrom does TARGET_FPU_armv7a =3D "hard", but it also does that for =
various powerpc architectures.

And any change like this would need to get propagated to all the machine =
layers out there as well, unlike .dev where everything was in one place.=


