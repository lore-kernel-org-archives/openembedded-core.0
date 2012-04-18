Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SKZUS-000642-0R
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Apr 2012 20:20:28 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id A68F8315B39D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Apr 2012 20:11:02 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id WCIcmpV70Sdk
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Apr 2012 20:10:51 +0200 (CEST)
Received: from [10.200.6.10] (unknown [82.149.226.166])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 4A0A4315B371
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Apr 2012 20:10:51 +0200 (CEST)
Message-ID: <4F8F03A9.8040908@opendreambox.org>
Date: Wed, 18 Apr 2012 20:10:49 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <4F8C3B19.40400@windriver.com> <4F8EA5CC.6010101@opendreambox.org>
	<1334749226.24091.67.camel@ted> <4F8EA972.1090304@opendreambox.org>
	<20120418115428.GJ3635@jama.jama.net>
	<1334750426.24091.73.camel@ted> <4F8EAEAC.4080605@opendreambox.org>
	<1334753155.24091.84.camel@ted> <4F8ED1BE.8010109@opendreambox.org>
	<4F8EDC02.5040605@windriver.com>
	<20120418154612.GN3635@jama.jama.net>
	<F1EB8D66-C971-4BFF-AECB-62C65E517743@dominion.thruhere.net>
In-Reply-To: <F1EB8D66-C971-4BFF-AECB-62C65E517743@dominion.thruhere.net>
Subject: Re: MIPS vs MIPS32 tunings -- summary and questions
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
X-List-Received-Date: Wed, 18 Apr 2012 18:20:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 18.04.2012 19:01, Koen Kooi wrote:
> 
> Op 18 apr. 2012, om 17:46 heeft Martin Jansa het volgende geschreven:
> 
>> On Wed, Apr 18, 2012 at 10:21:38AM -0500, Mark Hatle wrote:
>>> On 4/18/12 9:37 AM, Andreas Oberritter wrote:
>>>> On 18.04.2012 14:45, Richard Purdie wrote:
>>>>> On Wed, 2012-04-18 at 14:08 +0200, Andreas Oberritter wrote:
>>>>>> On 18.04.2012 14:00, Richard Purdie wrote:
>>>>>>> On Wed, 2012-04-18 at 13:54 +0200, Martin Jansa wrote:
>>>>>>>> I had a lot of those (e.g. because armv7a-vfp-neon was including 20
>>>>>>>> arm*feed.conf variants in /etc/opkg most of them empty - without
>>>>>>>> Packages.gz).
>>>>>>>>
>>>>>>>> So I've added "filter" to distro-feed-configs
>>>>>>>> http://git.shr-project.org/git/?p=meta-smartphone.git;a=commit;h=236aa553bb0f82f741c6edb793e96f421f24f4fa
>>>>>>>> to add only feeds I'm generating (and I also don't want armv5* packages
>>>>>>>> installed on armv7a-vfp-neon target unless user explicitly adds armv5*
>>>>>>>> feed).
>>>>>>>
>>>>>>> This is the better solution. I think we need to get a better default
>>>>>>> feed-config generation mechanism into the core. Distros may still need
>>>>>>> to tweak it but it would be good to share some of the best practises...
>>>>>>
>>>>>> Did you look at the patch? Which default setting of
>>>>>> SUPPORTED_EXTRA_ARCHS do you suggest?
>>>>>
>>>>> I did. I didn't say the above patch was a perfect solution.
>>>>>
>>>>>>  Do you think it's feasible to add
>>>>>> every single downloadable arch to this variable? If a user of my distro
>>>>>> decides to build it for some arm or x86 cpu, should he need to know
>>>>>> which archs to add at this place?
>>>>>
>>>>> This is a place where the build system meets and interfaces with the
>>>>> distro. No one policy in the build system is going to fit every distro's
>>>>> needs, not should we ever aim to so.
>>>>
>>>> At least we should have defaults that actually work for someone. Now we
>>>> don't and considering that distro-feed-configs.bb is the only place
>>>> where PACKAGE_EXTRA_ARCHS is actually used, this would be very easy to
>>>> accomplish. Especially because it worked well by default before Mark
>>>> broke it.
>>>
>>> PACKAGE_EXTRA_ARCHS is also used by Zypper, RPM configuration and other places. 
>>>  In those cases it is a full list of all available (and compatible) package 
>>> architecture types.
>>>
>>> Coming from the RPM world, it seems very odd to me that a set of "extra_archs" 
>>> can not list well, extra compatible archs without causing an error.  I have no 
>>> idea how to reconcile this behavior, without making a package manager 
>>> distro-feed specific solution.  (For RPM we absolutely want the existing behavior.)
>>
>> The problem Andreas is seeing is not fatal AFAIK.. just couple (or a
>> lot) of 404 (Packages files not available) while doing opkg update is
>> not nice for end user. 
>>
>> Downloading many existing Packages files without any Package in it
>> is also suboptimal, but maybe good start.. so we can teach
>> meta/classes/package_ipk.bbclass:package_update_index_ipk() to create
>> Packages files not only for existing
>> ipkgarchs="${ALL_MULTILIB_PACKAGE_ARCHS} ${SDK_PACKAGE_ARCHS}"
>> but for all (replace "if [ -e $pkgdir/ ]; then" with something like 
>> "if [ ! -e $pkgdir/ ]; then mkdir -p $pkgdir; fi")
> 
> That implies you're exposing feeds straight from OE, which is a bad, bad idea.

Can you please elaborate on why this is a bad idea?

Regards,
Andreas


