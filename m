Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SbTnO-0007Gc-D4
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Jun 2012 11:41:54 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q549VS25022361
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Jun 2012 02:31:28 -0700 (PDT)
Received: from [128.224.163.142] (128.224.163.142) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 4 Jun 2012 02:31:28 -0700
Message-ID: <4FCC806E.5070606@windriver.com>
Date: Mon, 4 Jun 2012 17:31:26 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1338434706.git.liezhi.yang@windriver.com>
	<87ca0cf2285b018489bde046b0aa7e17a767c70a.1338434706.git.liezhi.yang@windriver.com>
	<D16CA58F-8D7A-4910-ACCA-84E01CEE6510@dominion.thruhere.net>
	<1338538650.20169.261.camel@ted>
	<D2B2A161-3B9C-49F3-B124-DE6CC9B1FFE0@dominion.thruhere.net>
	<1338544960.20169.267.camel@ted>
	<F47EBC71-EC1C-4E13-ABCD-82E8E364E187@dominion.thruhere.net>
In-Reply-To: <F47EBC71-EC1C-4E13-ABCD-82E8E364E187@dominion.thruhere.net>
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
X-List-Received-Date: Mon, 04 Jun 2012 09:41:54 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 06/01/2012 06:35 PM, Koen Kooi wrote:
>
> Op 1 jun. 2012, om 12:02 heeft Richard Purdie het volgende geschreven:
>
>> On Fri, 2012-06-01 at 11:04 +0200, Koen Kooi wrote:
>>> Op 1 jun. 2012, om 10:17 heeft Richard Purdie het volgende geschreven:
>>>
>>>> On Thu, 2012-05-31 at 17:01 +0200, Koen Kooi wrote:
>>>>> Op 31 mei 2012, om 16:13 heeft Robert Yang het volgende geschreven:
>>>>>
>>>>>> There is a bug if we:
>>>>>> 1) bitbake core-image-sato-sdk MACHINE=qemux86
>>>>>> 2) bitbake core-image-sato with MACHINE=crownbay
>>>>>>
>>>>>> Then several pkgs in deploy/ipk/i586 would be installed to crownbay's
>>>>>> image even if there is one in deploy/ipk/core2 and we have set the
>>>>>> core2's priority higher than i586, when the version in deploy/ipk/i586 is
>>>>>> higher. This doesn't work for us, for example, what the crownbay need is
>>>>>> xserver-xorg-1.9.3, but it installs xserver-xorg-1.11.2.
>>>>>
>>>>> And this is working exactly as intended. Don't break opkg because your
>>>>> hardware driver situation sucks.
>>>>>
>>>>> So: NAK on this patch.
>>>>
>>>> I think we do have a problem here. For example, the system is ignoring a
>>>> PREFERRED_VERSION directive here
>>>
>>> A PREFERRED_VERSION set in a machine.conf, which is the wrong place.
>>
>> Its strongly not recommended. You can do it and if things are setup
>> correctly, we do support machine specific alterations however...
>>
>>> Let's change the above build sequence to this:
>>>
>>> 1) MACHINE=qemux86 bitbake xserver-xorg
>>> 2) MACHINE=othercore2machine bitbake xserver-xorg
>>> 3) MACHINE=crownbay bitbake xserver-xorg
>>>
>>> Oh look, I get 1.11.2 on crownbay regardless of this patch.
>>
>> I've been assuming this xserver is marked as machine specific. If its
>> not, that is a bug and we can fix that.
>
> the X server not machine specific and that is NOT a bug. The recipe for the DDX only works with a specific X version. The real problem here is that xf86-video-something (again, not machine specific, think pci cards) has a strict requirement on the x server version. This is now purely a DISTRO problem. A few possible solutions are:
>
> 1) Lock X to 1.9.3 for all compatible x86 archs in your DISTRO
> 2) Lock X to 1.11.2 for all compatible x86 archs in your DISTRO, live with the crownbay breakage
> 3) Only use a package manager with no notion of compatible archs (dpkg) or with strong version pinning (rpm)
> 4) Be really careful with the build sequence and structure your feed configs to not have compatible archs in their feed URIs
> 5) remove 'x11' from DISTRO_FEATURES
>
> This is a point where you cannot make everybody happy. But as you say below, let's decouple the above problem from the arch vs version discussion.
>
>>>> by building one thing and then
>>>> installing another. We're also inconsistent between the dpkg/rpm and
>>>> opkg backends. There is therefore definitely some kind of user
>>>> experience issue at stake here since this behaviour is not obvious,
>>>> expected or particularly correct.
>>>>
>>>> The fact the example is hardware related is not particularly relevant,
>>>> its the bigger picture I worry about
>>>
>>> I also worry about the bigger picture, especially about what Martin
>>> said about this breaking feeds.
>>
>> As far as I understood Martin's comments, this actually helps avoid some
>> of the issues he's been experiencing with feeds?
>
> No, it allows you to add a package-of-death. Example:
>
> broken-app_1.0_machine.ipk is in the feeds, being machine specific
> broken-apps author fixes the machine specific bits properly
> broken-app_2.0_i586.ipk hits the feeds and is not picked up.

I think that the broken-app_2.0_i586.ipk came unexpectedly,
there was a broken-app_1.0_machine.ipk (maybe also broken-app_1.0_i586.ipk,
but it didn't matter), if it has been fixed to version 2.0, then there should
be also a broken-app_2.0_machine.ipk (and it would be picked up).

// Robert

>
>> Martin has a problem where machines are ending up with unoptimised
>> versions of code on them and it would be good to fix opkg behaviour to
>> do what people expect...
>
> Yes, feed updates are not atomic, but this patch breaks moving packages between archs like the broken-app example above. In angstrom a machine doesn't see feeds with compatible archs at runtime, e.g. beagleboard sees beagleboard, armv7a and noarch URIs. This reduces these kind of problems to images built with OE. I must note that this setup for feed URIs was done out of bandwidth, storage and ram concerns (good old ipkg), not to avoid Martins problems :)
>
> regards,
>
> Koen
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>


