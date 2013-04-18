Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Sergey_Matyukevich@mentor.com>) id 1USoK8-0002D8-2E
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Apr 2013 14:52:30 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1USo37-00055m-3M from Sergey_Matyukevich@mentor.com ;
	Thu, 18 Apr 2013 05:34:49 -0700
Received: from SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Thu, 18 Apr 2013 05:34:48 -0700
Received: from [137.202.140.158] (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server id 14.2.247.3; Thu, 18 Apr 2013 13:34:46 +0100
Message-ID: <516FE866.6050506@mentor.com>
Date: Thu, 18 Apr 2013 16:34:46 +0400
From: Sergey Matyukevich <Sergey_Matyukevich@mentor.com>
Organization: Mentor Graphics
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.16) Gecko/20121216 Iceowl/1.0b1 Icedove/3.0.11
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <1366200612-22469-1-git-send-email-sergey_matyukevich@mentor.com>	<CADkTA4Mrw50x2SXjwpug9QA-VgwpQZrAH6OpbU-F+SB2-G0uPw@mail.gmail.com>	<516EAC25.40109@mentor.com>
	<CADkTA4OtauLj35mvDnO7Z3GAZhVebbCB1bzdyy2f=M+Oj2HCBA@mail.gmail.com>
In-Reply-To: <CADkTA4OtauLj35mvDnO7Z3GAZhVebbCB1bzdyy2f=M+Oj2HCBA@mail.gmail.com>
X-OriginalArrivalTime: 18 Apr 2013 12:34:48.0392 (UTC)
	FILETIME=[1D5B7480:01CE3C31]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] map_kernel_arch: x86 sub-architectures
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
X-List-Received-Date: Thu, 18 Apr 2013 12:52:40 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 04/17/2013 06:24 PM, Bruce Ashfield wrote:
> On Wed, Apr 17, 2013 at 10:05 AM, Sergey Matyukevich
> <Sergey_Matyukevich@mentor.com>  wrote:
>> Hello,
>>
>>
>>>> Suppose we build software for x86 targets on x86 build hosts. There are
>>>> use-cases
>>>> when it is not enough to specify x86 as a kernel architecture. It is
>>>> necessary
>>>
>>>
>>> What are the details of the use cases ? I've never run into this myself,
>>> and
>>> almost no parts of the kernel build infrastructure differentiates between
>>> x86 and x86_64 .. so I'm curious to know what is breaking.
>>
>>
>> So far we observed this problem in two cases:
>> - build systemtap modules for x86_32 target on x86_64 build hosts
>> - build virtualbox-guest modules for x86_32 target on x86_64 build hosts
>
> I'm still interested in drilling down on the details. If the build of
> those modules
> is being influenced by the build host vs the target kernel, that's a form of
> host contamination in my book.
>
> i.e. so with this change you are setting TARGET_ARCH more precisely, but
> that's going to impact the kernel build itself, and the current x86 is exactly
> what other layers and recipes would expect, as does the kernel build.
>
> With the more specific setting, clearly the builds of the modules you mention
> make use of it, is it that they are currently seeing 'x86' and defaulting to
> 64 bit ? I'd expect that they could be patched to look at the staged kernel
> source or the .config to determine something similar, and the change would
> be more isolated. I'm guessing, since as I said, I haven't run into these myself
> and haven't gone to crawl the code yet.
>
> Adding a return value of i386 now is also a interesting, it currently
> isn't returned,
> and doesn't really mean anything useful to the kernel build anymore.
> It's strictly
> compatibility. Why doesn't a return of 'x86' work in any case that you are
> returning i386 ?

Concerning your comments:

- host contamination
It doesn't seem to be a contamination by host settings. In the case of 
systemtap modules, build failed for ARCH=x86, but was ok for ARCH=i386. 
However note, that it was is not systemtap itself, it was a custom 
systemtap probe module built by systemtap tools.

- i386 vs x86
As you noted, i386 does not mean anything really useful anymore from the 
'kernel point of view'. Roughtly speaking, it is an alias for x86_32. 
That is why it should not break any other layers and recipes which 
expect x86. In other words, split i386-x86-x86_64 affects only those who 
are interested in this information.


Sure, all the mentioned issues could be fixed in an isolated way in 
their recipes. Though after I ran into the same type of issue twice, I 
thought it might be reasonable to propagate the fix upstairs, to oe-core.


Thanks,
Sergey


