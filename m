Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1R6eih-0007OB-P6
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Sep 2011 10:33:23 +0200
Received: by fxi1 with SMTP id 1so2524519fxi.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2011 01:28:04 -0700 (PDT)
Received: by 10.223.31.16 with SMTP id w16mr2602518fac.148.1316680084586;
	Thu, 22 Sep 2011 01:28:04 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id l9sm6771696faa.26.2011.09.22.01.28.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Sep 2011 01:28:03 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1316675047.2029.10.camel@ted>
Date: Thu, 22 Sep 2011 10:28:02 +0200
Message-Id: <CC6D993E-0C5B-4D42-BCB8-2C4C6E62EC77@dominion.thruhere.net>
References: <4E7A3D3A.1030007@balister.org> <4E7A3E4C.6080206@windriver.com>
	<30E0E33D-A811-4023-8977-4CA73C4656E6@dominion.thruhere.net>
	<1316651210.13622.0.camel@ted>
	<A769990C-E69F-4882-B3B5-66048C9B5268@dominion.thruhere.net>
	<1316675047.2029.10.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: Fetch failure for source at kernel.org
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
X-List-Received-Date: Thu, 22 Sep 2011 08:33:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 22 sep. 2011, om 09:03 heeft Richard Purdie het volgende geschreven:

> On Thu, 2011-09-22 at 08:40 +0200, Koen Kooi wrote:
>> Op 22 sep. 2011, om 02:26 heeft Richard Purdie het volgende =
geschreven:
>>=20
>>> On Wed, 2011-09-21 at 21:49 +0200, Koen Kooi wrote:
>>>> Op 21 sep. 2011, om 21:43 heeft Mark Hatle het volgende geschreven:
>>>>=20
>>>>> On 9/21/11 2:38 PM, Philip Balister wrote:
>>>>>> I'm finally trying to get started with oe-core. I'm using a setup=20=

>>>>>> created with the setup-script created by Koen. Everything looks =
ok until=20
>>>>>> it tried to build cpufrequtils. The recipe tries to fetch the =
source=20
>>>>>> from a git repo at kernel.org. Obviously, the fetch fails.
>>>>>>=20
>>>>>> What is odd, in the "good old days" I would expect this config to =
fall=20
>>>>>> back and use the Angstrom source mirror, but apparently this is =
not the=20
>>>>>> case with oe-core.
>>>>>>=20
>>>>>> Is this a bug or a feature? If this is a bug, is there a plan to =
fix it?=20
>>>>>> If it is a feature, how are we supposed to do builds if servers =
go away?=20
>>>>>> What do we do about GPL compliance?
>>>>>=20
>>>>> This is a feature, as people did not want oe-core tied to a given =
mirror.
>>>>=20
>>>> This is the "OE core doesn't generate versioned git tarballs" =
problem
>>>> people keep talking about. I know I can edit each and every recipe =
to
>>>> add ';rebasable=3Dtrue', but I'd like a global solution before the =
GPL
>>>> police starts looking at the angstrom source mirrors.
>>>=20
>>> Is this a versioned tarball problem or just the tarballs not being
>>> generated at all?
>>=20
>> versioned tarball problem, since the source mirror won't overwrite
>> files with the same name, so unversioned ones are both useless and
>> bandwidth wasting.
>=20
> They seem to be working perfectly well for Yocto...
>=20
> They're also not bandwidth wasting

They are, since for the kernel you need to re-upload the 300MB tarball =
to the source mirror for mirroring to work, even if there were no real =
changes but bitbake repacked it. I know that versioned tarballs aren't =
terribly efficient either, but at least they are deterministic.

The angstrom source mirror checks for duplicate filenames to avoid =
introducing checksum changes due to upstream stupidity or corrupted =
downloads.=20

> since the fetcher is efficient and
> will incrementally update something that is incomplete.

Which won't work currently since kernel.org is down.

> Anyhow, this is the first time someone has explained that the mirror
> tarball improvements that were made to bitbake have not done =
everything
> they desire. If you want someone on the Yocto team to look at this I'd
> suggest a bug report or I'll take patches to bitbake (as always).

But you do acknowledge the problem? FWIW, I've been arguing for a global =
method of enabled versioned tarballs since I first started using oe-core =
(called differently back then). I know linux-yocto stretches the fetcher =
to its limits, but I'd like this change for all the recipes using a =
single git tree with a single srcrev.

regards,

Koen=


