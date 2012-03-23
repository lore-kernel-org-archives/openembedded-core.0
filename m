Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1SB4tu-0003f7-2r
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 14:51:30 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q2NDgTPW006937
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 23 Mar 2012 06:42:30 -0700 (PDT)
Received: from [128.224.146.67] (128.224.146.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Fri, 23 Mar 2012 06:42:30 -0700
Message-ID: <4F6C7DC1.2030508@windriver.com>
Date: Fri, 23 Mar 2012 09:42:25 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111124 Thunderbird/8.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <2207E1AD-E06F-40D6-9FD7-1452805A4CF3@dominion.thruhere.net>
	<1332427771.9740.240.camel@ted>
	<7F144BE0-BBF4-4EE0-9A1E-A6842C846E00@dominion.thruhere.net>
	<4F6B48F2.8000107@windriver.com> <1332506121.9740.404.camel@ted>
In-Reply-To: <1332506121.9740.404.camel@ted>
Cc: Koen Kooi <koen@dominion.thruhere.net>, Patches,
	oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: Syscall backporting and linux-libc-headers
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
X-List-Received-Date: Fri, 23 Mar 2012 13:51:30 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 12-03-23 08:35 AM, Richard Purdie wrote:
> On Thu, 2012-03-22 at 11:44 -0400, Bruce Ashfield wrote:
>> On 12-03-22 11:12 AM, Koen Kooi wrote:
>>>
>>> Op 22 mrt. 2012, om 15:49 heeft Richard Purdie het volgende geschreven:
>>>
>>>> On Thu, 2012-03-22 at 13:22 +0100, Koen Kooi wrote:
>>>>> In my never ending quest to get consolekit/polkit/etc working properly
>>>>> I've found that CONFIG_AUDITSYSCALL is really usefull (it's usefull in
>>>>> other contexts as well, but that's outside the oe-core set of
>>>>> recipes). It has the following problem:
>>>>>
>>>>> config AUDITSYSCALL
>>>>>          bool "Enable system-call auditing support"
>>>>>          depends on AUDIT&&   (X86 || PPC || S390 || IA64 || UML ||
>>>>> SPARC64 || SUPERH)
>>>>>
>>>>> No MIPS or ARM support. There recently was a pull request from Al Viro
>>>>> to get at least ARM support into mainline, but I'm not sure what
>>>>> happened to that. Anyway, I backported the ARM patch to 3.0 and 3.2,
>>>>> but to make it usefull I'd need to patch linux-libc-headers and bump
>>>>> PR on virtual/libc.
>>>>>
>>>>> What's the OE-core position on backporting syscalls to
>>>>> linux-libc-headers?
>>>>
>>>> Why can't we just increase the linux-libc-headers version?
>>
>> Sorry for the slow reply, I missed the original and was wrapped
>> up in some debugging.
>>
>>>
>>> In this case that would be perfectly fine. And bump PR in virtual/libc of course :)
>>
>> I was just about to do this. Just a day or so ago, I noticed that
>> the version had lagged (again) and needed to be bumped. I'm all
>> for this as well, as long as there's a graceful fallback of ENOSYS
>> there's no real harm to older kernels.
>>
>> Richard: an to you on this one .. is it too late to do this for
>> the various stabilization points ?
>
> I'm a bit jittery on this. If I have the patch today and it doesn't
> break anything it might make it in..

I've made the changes here and am watching some builds churn away,
so far so good.

But I realized that this won't solve the issue that prompted Koen's
original email. The audit syscall for ARM. When it does merge, we'll
be able to bump past the version that contains it, and then make it
universally available in the right version of the libc-headers
package.

Bumping to 3.2 won't get us there, so if we'd rather not do this
right now. I'm ok going with the 3.1 headers that we've been using
all along.

I can still send the patch later today and leave the decision up
to you, but thought I should make another comment.

Cheers,

Bruce



>
>>>> Presumably
>>>> someone running a kernel without the patches won't see any issue, the
>>>> syscall just won't be present and software will fall back?
>>>
>>> Exactly
>>
>> +1 (I read this after typing my response).
>>
>>>
>>>> I think the big concern would be deviating from mainline as its not so
>>>> much a backport as a divergence at this point (and this is why we can't
>>>> just upgrade)?
>>>
>>> Speaking of divergence, what is the point of having linux-libc-headers-yocto_git.bb ?
>>
>> Very little. It was originally used to export exactly the headers
>> as were present in the yocto kernel tree, but Richard and I since
>> agreed that tgz based libc-headers where faster and good enough.
>>
>> We can move it to the yocto layers for use by anyone that really needs
>> this 1:1 mapping of kernel tree to headers in the system.
>>
>> And a second: .. is it too late to do this for stabilization points ?
>
> No, I'll take that one since its a removal on something that is unused.
>
> Cheers,
>
> Richard
>



