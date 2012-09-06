Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1T9a5z-0000ag-2o
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Sep 2012 13:18:03 +0200
Received: by weyr6 with SMTP id r6so1133710wey.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2012 04:05:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=XT++9tS7OUOR9T/EdDmZ3uDr8PUWzOjvrFneI5W1h/c=;
	b=b5cbG9SCVCRnzvXfrTDux7CqsonRoK21zEeFPY06LxoS3o4TiiAx+KdQC91iEPjsBb
	DsEUjPdyC4DATm9cLjxXhcFK+//TNuMaJlme99N/wMrWC2Zie3klAmp61vf391h9rw7U
	0OJA9V0Ki+3kYyBXwAhJ6/fBB4hLp6R8+hNvhs8NVI6Lgwiw0VG0T1X9bMPFiHlziDvO
	w06I3ya2pEwWmgVmSHedr/pyv6LBXfZHOQBzgyx+HhJZYmV8rjk2O3fuX+tD5aeevqWg
	QqelmiTakmxVaxRy7LSsyhb9NKlELLBHkTRKJWGyyK4KNOG7SSsl4FAhhJtVqaKSdEu9
	aqjg==
Received: by 10.180.84.169 with SMTP id a9mr4121719wiz.8.1346929538812;
	Thu, 06 Sep 2012 04:05:38 -0700 (PDT)
Received: from [172.20.0.10] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id fp3sm3607709wib.7.2012.09.06.04.05.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Sep 2012 04:05:37 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1486\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1346879977.21985.88.camel@ted>
Date: Thu, 6 Sep 2012 13:05:45 +0200
Message-Id: <F14829DE-6688-48C1-B69D-1A1A66AD9251@dominion.thruhere.net>
References: <cover.1346837268.git.liezhi.yang@windriver.com>
	<a30f2ce625990ccfb3e1e06794b353dc1f1257cb.1346837268.git.liezhi.yang@windriver.com>
	<32CDFC5F-610C-45E8-A239-A3387A8839FB@dominion.thruhere.net>
	<1346845447.21985.50.camel@ted>
	<E182019A-4B42-4F70-BA82-EDC685EDFA9A@dominion.thruhere.net>
	<1346879977.21985.88.camel@ted>
To: "openembedded-core@lists.openembedded.org layer"
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1486)
X-Gm-Message-State: ALoCoQmbjnC7UoTLnZkZLvne0BkBHxllKge6XjG2YdQ6B8FUDTd/TATQl79udKxM21PzTvXIqme1
Subject: Re: [RFC PATCH 2/2] package_ipk.bbclass: use "--force-arch" when install package
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Sep 2012 11:18:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 5 sep. 2012, om 23:19 heeft Richard Purdie =
<richard.purdie@linuxfoundation.org> het volgende geschreven:

> On Wed, 2012-09-05 at 15:24 +0200, Koen Kooi wrote:
>> Op 5 sep. 2012, om 13:44 heeft Richard Purdie =
<richard.purdie@linuxfoundation.org> het volgende geschreven:
>>=20
>>> On Wed, 2012-09-05 at 12:05 +0200, Koen Kooi wrote:
>>>> Op 5 sep. 2012, om 11:31 heeft Robert Yang =
<liezhi.yang@windriver.com> het volgende geschreven:
>>>>=20
>>>>> This is for fixing the problem:
>>>>> 1) bitbake core-image-sato-sdk with MACHINE=3Dqemux86
>>>>> 2) bitbake core-image-sato with with MACHINE=3Dcrownbay
>>>>>=20
>>>>> The qemux86's PACKAGE_ARCH is i586, the crownbay's is core2, but =
several
>>>>> i586 packages will be installed into crownbay's rootfs though =
there are
>>>>> core2 packages. For example, there are:
>>>>>=20
>>>>> xserver-xorg_1.11.2-r4_i586.ipk
>>>>> xserver-xorg_1.9.3-r1_core2.ipk
>>>>>=20
>>>>> The crownbay.conf says:
>>>>> PREFERRED_VERSION_xserver-xorg ?=3D "1.9.3"
>>>>>=20
>>>>> What the crownbay's image needs is =
xserver-xorg_1.9.3-r1_core2.ipk, but
>>>>> the xserver-xorg_1.11.2-r4_i586.ipk will be installed, this is
>>>>> incorrect.
>>>>=20
>>>> It is the correct behaviour, though.
>>>=20
>>> No, it isn't. You told bitbake to build some specific versions, it =
did
>>> that, then put something else in the rootfs. Without mentioning any =
of
>>> this to the user.
>>=20
>> You forget that, you, as the user, instructed bitbake to build the
>> other version when switching machine. Should bitbake refuse to build
>> the packages in this scenario?
>=20
> That would be better than silently doing something non-deterministic.
>=20
> The bit I hate about this is the fact that sometimes a build would
> result in one thing, sometimes another. It should always error out =
with
> an invalid configuration rather than do that.
>=20
>> That would make more sense than trying to clean up the mess in the
>> package_ipk bbclass. If you have online feeds the problem will
>> reappear anyway.
>=20
> I care more about builds being deterministic than online feeds.

Thanks for going on the record for that.

> Sorry ;-).
>=20
>>> So the current behaviour is totally broken and it needs to do one =
of:
>>>=20
>>> a) Put the things the user asked for in the rootfs
>>> b) Tell the user its not going to
>>> c) Error out and ask the user to fix the problem
>>>=20
>>> Builds are meant to be deterministic and this clearly isn't as what =
you
>>> get out depends on the order of what you build.
>>=20
>> How do we know what the user expects? The user already did something
>> that isn't right by building compatible arch packages with different
>> versions. And this is deterministic, the user instructed bitbake to
>> build a more recent, but compatible version, which will end up in the
>> rootfs. If would be non-deterministic if opkg would decide at random
>> what to install.
>=20
> Having a different image depending on whether I build MACHINE A or B
> first is not what the user expects and is not deterministic in my =
world
> or I suspect in most user's. We can go and ask some if you really =
think
> we need to?
>=20
>> So, fix this problem at the root and make bitbake error out if your
>> build breaks PREFERRED_VERSION.
>=20
> How do we detect this? I want deterministic builds so I need the error
> to appear regardless of whether I build A or B first (just like I =
expect
> a consistent image).
>=20
> I also do want to support these situations where we need special
> versions. I appreciate its ugly but we have several significant users
> with this problem and pretending it doesn't exist doesn't work, much =
as
> I wish we could.
>=20
> What I really need here is help with coming up with some working
> solution. Putting our heads in the sand and arguing whether its even a
> problem isn't going to go anywhere :(.

Where have I argued that it's not a problem? I've said time and time =
again that PREFERRED_VERSION problems are for the DISTRO to solve. You =
are arguing that we should band-aid it somewhere in a class where it =
would break package feeds. So my counter proposal for broken DISTROs was =
to have bitbake completely prevent the user from building such a =
conflicting version.

The low-tech solution would be to document that you can't build this =
combination of machines in the same TMPDIR. Wiping TMDIR between =
machines changes should be quite cheap with sstate-cache nowadays, no?=


