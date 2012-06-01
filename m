Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SaPMU-0005za-Ti
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jun 2012 12:45:42 +0200
Received: by eekd49 with SMTP id d49so815572eek.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jun 2012 03:35:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=sDqUVZ2XrjB8P4ksMy810hWObZBhv191fKMBCN5mk7k=;
	b=lhNtPNRasxb8SDJzb6Ck3g1zM+5YUUODZpBriKEDLdnS6SicimPjOuzz7Nok5jRk6D
	iOIEtSB9btmWavvjaDjxxVYr3nlVWXozHS8mHXQfc1BVtLvJn8r9hfkpdz6wzIFrCdQJ
	KlpRrzSSez7rk1gt0R4tB8NVbcKyCELCkup3R1skGrgi/Y2nd7+PkCau+LHEzxzN1ZyN
	Sj5EZupWd40sJCXei4+Czkk4iOzQr+zBrx9m0rQw4/P3TOGGfCG9oOS63vE2c2UoBumt
	iwXbQN0B+VeAmd4+rfbRWnOwSJZvg6Nsh6jTp5pm6WNo5SmX+ju9lk00npyc4DmEZ8fA
	eiyw==
Received: by 10.14.22.16 with SMTP id s16mr1193836ees.184.1338546921936;
	Fri, 01 Jun 2012 03:35:21 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id v46sm5405731eef.11.2012.06.01.03.35.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 01 Jun 2012 03:35:20 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1338544960.20169.267.camel@ted>
Date: Fri, 1 Jun 2012 12:35:19 +0200
Message-Id: <F47EBC71-EC1C-4E13-ABCD-82E8E364E187@dominion.thruhere.net>
References: <cover.1338434706.git.liezhi.yang@windriver.com>
	<87ca0cf2285b018489bde046b0aa7e17a767c70a.1338434706.git.liezhi.yang@windriver.com>
	<D16CA58F-8D7A-4910-ACCA-84E01CEE6510@dominion.thruhere.net>
	<1338538650.20169.261.camel@ted>
	<D2B2A161-3B9C-49F3-B124-DE6CC9B1FFE0@dominion.thruhere.net>
	<1338544960.20169.267.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQkj4w/WbKitSSOxGcSXI8Kejlay4EiaaHefXf1E/rcXAhFjMu/QfIN/bZ3zkS7udwixZYqL
Subject: Re: [PATCH 1/1] opkg 0.1.8: respect to the arch when choose the alternatives
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
X-List-Received-Date: Fri, 01 Jun 2012 10:45:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 1 jun. 2012, om 12:02 heeft Richard Purdie het volgende geschreven:

> On Fri, 2012-06-01 at 11:04 +0200, Koen Kooi wrote:
>> Op 1 jun. 2012, om 10:17 heeft Richard Purdie het volgende =
geschreven:
>>=20
>>> On Thu, 2012-05-31 at 17:01 +0200, Koen Kooi wrote:
>>>> Op 31 mei 2012, om 16:13 heeft Robert Yang het volgende geschreven:
>>>>=20
>>>>> There is a bug if we:
>>>>> 1) bitbake core-image-sato-sdk MACHINE=3Dqemux86
>>>>> 2) bitbake core-image-sato with MACHINE=3Dcrownbay
>>>>>=20
>>>>> Then several pkgs in deploy/ipk/i586 would be installed to =
crownbay's
>>>>> image even if there is one in deploy/ipk/core2 and we have set the
>>>>> core2's priority higher than i586, when the version in =
deploy/ipk/i586 is
>>>>> higher. This doesn't work for us, for example, what the crownbay =
need is
>>>>> xserver-xorg-1.9.3, but it installs xserver-xorg-1.11.2.
>>>>=20
>>>> And this is working exactly as intended. Don't break opkg because =
your
>>>> hardware driver situation sucks.
>>>>=20
>>>> So: NAK on this patch.
>>>=20
>>> I think we do have a problem here. For example, the system is =
ignoring a
>>> PREFERRED_VERSION directive here
>>=20
>> A PREFERRED_VERSION set in a machine.conf, which is the wrong place.
>=20
> Its strongly not recommended. You can do it and if things are setup
> correctly, we do support machine specific alterations however...
>=20
>> Let's change the above build sequence to this:
>>=20
>> 1) MACHINE=3Dqemux86 bitbake xserver-xorg
>> 2) MACHINE=3Dothercore2machine bitbake xserver-xorg
>> 3) MACHINE=3Dcrownbay bitbake xserver-xorg
>>=20
>> Oh look, I get 1.11.2 on crownbay regardless of this patch.
>=20
> I've been assuming this xserver is marked as machine specific. If its
> not, that is a bug and we can fix that.

the X server not machine specific and that is NOT a bug. The recipe for =
the DDX only works with a specific X version. The real problem here is =
that xf86-video-something (again, not machine specific, think pci cards) =
has a strict requirement on the x server version. This is now purely a =
DISTRO problem. A few possible solutions are:

1) Lock X to 1.9.3 for all compatible x86 archs in your DISTRO
2) Lock X to 1.11.2 for all compatible x86 archs in your DISTRO, live =
with the crownbay breakage
3) Only use a package manager with no notion of compatible archs (dpkg) =
or with strong version pinning (rpm)
4) Be really careful with the build sequence and structure your feed =
configs to not have compatible archs in their feed URIs
5) remove 'x11' from DISTRO_FEATURES

This is a point where you cannot make everybody happy. But as you say =
below, let's decouple the above problem from the arch vs version =
discussion.

>>> by building one thing and then
>>> installing another. We're also inconsistent between the dpkg/rpm and
>>> opkg backends. There is therefore definitely some kind of user
>>> experience issue at stake here since this behaviour is not obvious,
>>> expected or particularly correct.
>>>=20
>>> The fact the example is hardware related is not particularly =
relevant,
>>> its the bigger picture I worry about
>>=20
>> I also worry about the bigger picture, especially about what Martin
>> said about this breaking feeds.
>=20
> As far as I understood Martin's comments, this actually helps avoid =
some
> of the issues he's been experiencing with feeds?

No, it allows you to add a package-of-death. Example:

broken-app_1.0_machine.ipk is in the feeds, being machine specific
broken-apps author fixes the machine specific bits properly
broken-app_2.0_i586.ipk hits the feeds and is not picked up.

> Martin has a problem where machines are ending up with unoptimised
> versions of code on them and it would be good to fix opkg behaviour to
> do what people expect...

Yes, feed updates are not atomic, but this patch breaks moving packages =
between archs like the broken-app example above. In angstrom a machine =
doesn't see feeds with compatible archs at runtime, e.g. beagleboard =
sees beagleboard, armv7a and noarch URIs. This reduces these kind of =
problems to images built with OE. I must note that this setup for feed =
URIs was done out of bandwidth, storage and ram concerns (good old =
ipkg), not to avoid Martins problems :)

regards,

Koen=


