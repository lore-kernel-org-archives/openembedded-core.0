Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1SylrV-0006Vl-5y
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Aug 2012 17:38:25 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q77FQaOO002278
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 7 Aug 2012 08:26:36 -0700 (PDT)
Received: from [128.224.146.67] (128.224.146.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Tue, 7 Aug 2012 08:26:36 -0700
Message-ID: <502133A9.1080707@windriver.com>
Date: Tue, 7 Aug 2012 11:26:33 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1344008589-3660-1-git-send-email-liang.li@windriver.com>
	<1344348160.9756.255.camel@ted> <50212122.50109@windriver.com>
	<1344349336.9756.259.camel@ted> <50212648.8030204@windriver.com>
	<1344350670.9756.269.camel@ted>
In-Reply-To: <1344350670.9756.269.camel@ted>
Cc: darren.hart@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] perf: pass STAGING_INCDIR(sysroot) to perf
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
X-List-Received-Date: Tue, 07 Aug 2012 15:38:25 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 12-08-07 10:44 AM, Richard Purdie wrote:
> On Tue, 2012-08-07 at 10:29 -0400, Bruce Ashfield wrote:
>> On 12-08-07 10:22 AM, Richard Purdie wrote:
>>> On Tue, 2012-08-07 at 10:07 -0400, Bruce Ashfield wrote:
>>>> On 12-08-07 10:02 AM, Richard Purdie wrote:
>>>>> On Fri, 2012-08-03 at 23:43 +0800, Liang Li wrote:
>>>>>> Via EXTRA_CFLAGS, we can pass the sysroot include directory to perf to
>>>>>> provide slang.h rather than hardcoded host dir in perf's Makefile.
>>>>>>
>>>>>> Pass WERROR=0 to perf's Makefile to avoid warnings being treated
>>>>>> as errors. Warnings are not fatal, and while they will be fixed in the
>>>>>> future, there's no need for them to break the build.
>>>>>
>>>>> No mention of the additional slang dependency is made here?
>>>>>
>>>>>> Signed-off-by: Liang Li<liang.li@windriver.com>
>>>>>> ---
>>>>>>     meta/recipes-kernel/perf/perf_3.4.bb | 3 +++
>>>>>>     1 file changed, 3 insertions(+)
>>>>>>
>>>>>> diff --git a/meta/recipes-kernel/perf/perf_3.4.bb b/meta/recipes-kernel/perf/perf_3.4.bb
>>>>>> index 505c7b8..537e926 100644
>>>>>> --- a/meta/recipes-kernel/perf/perf_3.4.bb
>>>>>> +++ b/meta/recipes-kernel/perf/perf_3.4.bb
>>>>>> @@ -24,6 +24,7 @@ DEPENDS = "virtual/kernel \
>>>>>>                ${MLPREFIX}binutils \
>>>>>>                ${TUI_DEPENDS} \
>>>>>>                ${SCRIPTING_DEPENDS} \
>>>>>> +           slang \
>>>>>>               "
>>>>>>
>>>>>>     SCRIPTING_RDEPENDS = "${@perf_feature_enabled('perf-scripting', 'perl perl-modules python', '',d)}"
>>>>>> @@ -63,6 +64,8 @@ EXTRA_OEMAKE = \
>>>>>>     		AR="${AR}" \
>>>>>>     		prefix=/usr \
>>>>>>     		NO_GTK2=1 ${TUI_DEFINES} NO_DWARF=1 ${SCRIPTING_DEFINES} \
>>>>>> +		WERROR=0 \
>>>>>> +		EXTRA_CFLAGS=-I${STAGING_INCDIR} \
>>>>>>     		'
>>>>>
>>>>> This is is not acceptable since the include directory /usr/include/slang
>>>>> is still being looked at and this just "hides" the error. STAGING_INCDIR
>>>>> is on the compilers default search path anyway.
>>>>
>>>> But this makes it first, which is what we were going for. For
>>>> an external toolchain, this also might not be true.
>>>
>>> You have an external toolchain which does not search the sysroot
>>> usr/include directory? Really? ;-)
>>
>> I do. Trust me on this. I'm not talking about Wind River, I'm
>> not talking about oe-core or yocto here.
>
> Well, for such a toolchain, you need to pass STAGING_INCDIR into the
> CFLAGS anyway and are likely doing so at a different higher level. I
> don't see how this patch changes anything.

I wasn't clear, I'm building the tree (and tools) standalone using
both a hand generated cross toolchain and the native toolchain. Neither
uses a sysroot, so if I merged that patch into the tree, then they
wouldn't find slang and the build breaks.

>
>>> I accept we won't search usr/include/slang but we don't install slang in
>>> that directory anyway so its irrelevant and that isn't the path you're
>>> adding.
>>>
>>>>> So this patch is wrong in several different ways :(
>>>>>
>>>>> I've merged a temporary fix until we get this resolved properly.
>>>>
>>>> I think this is a point of view thing, since from here, this is a
>>>> better temporary fix than commenting out the path in the perf
>>>> Makefile, which will break standalone tree cases if I merge the patch
>>>> into the tree, and I don't want to go to a milestone freeze with
>>>> an out of tree patch.
>>>
>>> I doubt it will actually break anything.
>>
>> It will, and does if I merge the patch to the kernel tree where
>> it belongs. That is my point.
>
> Can you please explain how it breaks? Previously all you've said it "it
> might break". Now you say it does break but not how.
>
> As I've explained, I can't see how it would do that as we should never
> be looking in /usr/include/slang/.
>
> I'm going to guess that this isn't an external toolchain problem and is
> if you build the kernel standalone against your native system with no
> cross compilation involved? Its likely a fedora system rather than
> ubuntu/debian derived?
>
> It would be nice to not have to guess at what the problem is though...

Sorry about that, 400 unread email have me moving quickly this morning
and not taking enough time to put all the detail into what I am
writing. I added that above. And yes, it is some older RHEL/Suse boxes
and other ones that are derived from non debian systems that give me
pain.

>
>>>> So I'd ask again that we reconsider this patch, since what's in tree
>>>> has issues with other use cases.
>>>
>>> No, I'm flatly refusing it, sorry.
>>
>> That's your prerogative, but I dislike the kernel patch that you
>> did with the same flatness.
>>
>> I'm not trying to raise a fuss here, but you have to see the
>> other point of view on this and acknowledge that the existing change
>> is just as unpalatable to me, as the recipe space one is to you.
>
> Well, I'm trying to illustrate how and why its a bad idea, you were just
> talking about hypothetical issues with no details. If it does break
> something, fine but at least please give some indication of what/how/why
> and then we can discuss it.
>
>> In the end, I don't really care, but I just don't like the optics
>> of an unsigned, out of tree patch, that I'm not going to merge
>> to the kernel, and one that will have to sit where it is for M3.
>
> We had the autobuilder showing read for 5 days with radio silence and
> admittedly some confusion over a patch status. What am I meant to do
> given I'd really like to take the vacation I have planned this week?

Sorry, I thought when Liang sent the patch the issue was resolved :(
We at least did. That's how it goes sometimes.

>
> Anyhow, lets see if we can resolve this. Can you answer my previous
> question about whether changing this to -I=/usr/include/slang would
> work?

It should, but there's a distinct lack of precedent for sysroot style
include paths in the kernel tools (behind the times), but in the end,
if it fixes the oe-core case, and doesn't break standalone builds
(the toolchain just has to no error on the syntax), it should be fine.

I've already asked that a full kernel fix be generated, but I don't think
it will make the deadline for your vacation, or M3, so merging a sysroot
based include is probably the reasonable middle ground that I'll end
on.

Cheers,

Bruce

>
> Cheers,
>
> Richard
>
>
>
>



