Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SYCJU-0008Py-VR
	for openembedded-core@lists.openembedded.org;
	Sat, 26 May 2012 10:25:29 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q4Q8FCY1004717
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 26 May 2012 01:15:12 -0700 (PDT)
Received: from [128.224.163.142] (128.224.163.142) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Sat, 26 May 2012 01:15:11 -0700
Message-ID: <4FC0910D.8000007@windriver.com>
Date: Sat, 26 May 2012 16:15:09 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1337933617.git.liezhi.yang@windriver.com>
	<fad645aa59e8cc5634500b35bc607e0b61dc997f.1337933617.git.liezhi.yang@windriver.com>
	<6CC0CB11-A526-457C-AC54-2D7C67E38DE2@dominion.thruhere.net>
	<20120525113057.GD3138@jama.jama.net>
	<4FC04443.1090708@windriver.com>
	<20120526062847.GF3138@jama.jama.net>
In-Reply-To: <20120526062847.GF3138@jama.jama.net>
Cc: Zhenfeng.Zhao@windriver.com,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Sat, 26 May 2012 08:25:29 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 05/26/2012 02:28 PM, Martin Jansa wrote:
> On Sat, May 26, 2012 at 10:47:31AM +0800, Robert Yang wrote:
>>
>>
>> On 05/25/2012 07:30 PM, Martin Jansa wrote:
>>> On Fri, May 25, 2012 at 01:19:55PM +0200, Koen Kooi wrote:
>>>>
>>>> Op 25 mei 2012, om 12:02 heeft Robert Yang het volgende geschreven:
>>>>
>>>>> There is a bug if we:
>>>>> 1) bitbake core-image-sato-sdk MACHINE=qemux86
>>>>> 2) bitbake core-image-sato with MACHINE=crownbay
>>>>>
>>>>> Then several pkgs in deploy/ipk/i586 would be installed to crownbay's
>>>>> image even if there is one in deploy/ipk/core2 and we have set the
>>>>> core2's priority higher than i586, when the version in deploy/ipk/i586 is
>>>>> higher. This doesn't work for us, for example, what the crownbay need is
>>>>> xserver-xorg-1.9.3, but it installs xserver-xorg-1.11.2.
>>>>>
>>>>> This is caused by opkg's selecting mechanism, if there are more than one
>>>>> candidates which have the same pkg name in the candidate list, for
>>>>> example, the same pkg with different versions, then it will use the last
>>>>> one which is the highest version in the list, this doesn't work for us,
>>>>> it should respect to the arch priorities in such a case.
>>>>
>>>> This is a serious break with the current opkg behaviour and I don't think it's an improvement. Needing different versions for non machine specific packages indicates a more serious bug elsewhere.
>>>
>>> It's not the same use-case as those 2 above, but what I don't like on
>>
>> Hi Martin,
>>
>> They are the same cases:-), I think that this patch has also fixed your problem,
>
> No, at least not completely the same.
>
> I would prefer to upgrade foo-1.0-r1_armv4t temporary until

I think it can upgrade foo-1.0-r1_armv4t temporarily, if ipk/armv7a is removed
from the repository, then it would not appear in the opkg.conf, and the armv7a
should be the lowest priority and an unknown arch, and foo-1.0-r1_armv4t will
win, and it would be installed.

I simulated your environment:(with core2 and i586, core2 has a higher version)

1) The foo-1.0_r1.core2 installed

2) Remove the core2 related lines from core-image-sato-1.0-r0/opkg.conf and 
core-image-sato-1.0-r0/rootfs/etc/opkg/arch.conf

3) opkg update && opkg upgrade (foo-1.0_r1.i586 upgraded)

4) Add the core2 related lines back to core-image-sato-1.0-r0/opkg.conf and 
core-image-sato-1.0-r0/rootfs/etc/opkg/arch.conf

5) opkg update && opkg upgrade (foo-1.0_r1.core2 upgraded)

// Robert

> foo-1.0-r1_armv7a gets available in feed and that won't happen with your
> patch AFAIK.
>
> with your patch:
> If you have bar-1.0 which has to be MACHINE_ARCH and in 2.0 bar
> developers find way to detect and use all machine capabilities in
> runtime, recipe maintainer will switch to TUNE_ARCH, then
> foo-1.0_nokia900.ipk won't be ever upgraded to foo-2.0_armv7a.ipk
> and that's bad.
>
> Cheers,
>
>> the foo-1.0_armv7a will be kept now.
>>
>> // Robert
>>
>>> current opkg behaviour is that it doesn't "reinstall" the package with
>>> the same version when it gets available in arch with higher priority.
>>>
>>> e.g. I have armv7a device which has feed urls for armv4t and armv7a
>>> (armv7a of course with higher priority).
>>>
>>> foo-1.0 in both feeds armv4t armv7a
>>>
>>> opkg update&&   opkg install foo ->   foo-1.0_armv7a
>>>
>>> distro builder publish foo-1.0-r1 sofar only in armv4t feed
>>>
>>> opkg update&&   opkg upgrade ->   foo-1.0_armv7a is upgraded to foo-1.0-r1_armv4t)
>>>
>>> distro builder publish foo-1.0-r1 also to armv7a feed
>>>
>>> opkg update&&   opkg upgrade ->   nothing, but "upgrading" to foo-1.0-r1_armv7a) would be better
>>>
>>>
>>> On my distro builder I'm trying to prevent this scenario by rsyncing
>>> feeds only after build for *all* supported machines is completed, but
>>> that's still not really atomic operation. (And later I've also started
>>> to filter feeds which gets available on target image).
>>>
>>> Cheers,
>>>
>>>
>>>
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


