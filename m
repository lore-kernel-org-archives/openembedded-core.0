Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1SB7KQ-0007hA-GR
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 17:27:02 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 23 Mar 2012 09:18:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="124343395"
Received: from unknown (HELO envy.home) ([10.255.15.182])
	by orsmga002.jf.intel.com with ESMTP; 23 Mar 2012 09:18:05 -0700
Message-ID: <4F6CA210.4040501@linux.intel.com>
Date: Fri, 23 Mar 2012 09:17:20 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120209 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <CA+M6bXkMdv_bg9bDOYCS=Ng0sSB+2Yu6xRN4V0tKDV9RCJMy+A@mail.gmail.com>
	<1332458784.9740.371.camel@ted> <20120322235342.GC13495@denix.org>
	<1332465264.9740.380.camel@ted>
	<20120323154826.GC9551@bill-the-cat>
In-Reply-To: <20120323154826.GC9551@bill-the-cat>
X-Enigmail-Version: 1.4
Subject: Re: Consistency and use cases for IMAGE_FSTYPES
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
X-List-Received-Date: Fri, 23 Mar 2012 16:27:02 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 03/23/2012 08:48 AM, Tom Rini wrote:
> On Fri, Mar 23, 2012 at 01:14:24AM +0000, Richard Purdie wrote:
>> On Thu, 2012-03-22 at 19:53 -0400, Denys Dmytriyenko wrote:
>>> On Thu, Mar 22, 2012 at 11:26:24PM +0000, Richard Purdie wrote:
>>>> On Fri, 2012-03-09 at 14:39 -0700, Tom Rini wrote:
>>>>> Hey all,
>>>>>
>>>>> Over in meta-ti I kicked off a discussion
>>>>> (https://lists.yoctoproject.org/pipermail/meta-ti/2012-March/000779.html)
>>>>> about if we should be using '?=' or '+=' with IMAGE_FSTYPES in the
>>>>> machine conf files.  This has been discussed a little bit before
>>>>> (http://thread.gmane.org/gmane.comp.handhelds.openembedded.core/2060/focus=2061).
>>>>>  The problem is we have the following and I believe ultimately
>>>>> conflicting use cases:
>>>>
>>>> I've been under the impression that we decided upon:
>>>>
>>>>> - The machine needs to say 'I need or support the following formats'
>>>>
>>>> so the machine starts and sets:
>>>>
>>>> IMAGE_FSTYPES = "xxxx"
>>>>
>>>>> - The distro needs to say 'I always want format X'
>>>>
>>>> so the distro can do:
>>>>
>>>> IMAGE_FSTYPES += " yyy"
>>>>
>>>>> - The user needs to say 'I know best, give me only format X'
>>>>
>>>> So the user can do:
>>>>
>>>> IMAGE_FSTYPES = "X"
>>>
>>> Since local.conf gets parsed before machine.conf and distro.conf, the user 
>>> needs to do this override:
>>>
>>> IMAGE_FSTYPES_local = "X"
>>>
>>> Otherwise machine.conf will always overwrite it with "xxxx" with its 
>>> unconditional assignment.
>>
>> Right, I'd forgotten that little detail :/.
>>
>> It actually makes me wonder if our include order is the right one but
>> now isn't the time to try changing that.
>>
>> I agree the neatest way to change it is probably something like
>> MACHINE_FSTYPES. I do worry a lot about backwards compatibility though
>> and I'd also point out where we're at in the release cycle (bug fix
>> only).
> 
> Well, one problem that would make this a bugfix is that no one does what
> you say we agreed on today.  oe-core has qemu.inc using ?=, meta-intel
> is using += and meta-ti is mixed (which is what got this started).
> 
> 

Is this causing any nasty failures right now, or is it in the "this is a
confusing mess and it would be nice to get it cleaned up" bucket? If the
latter, I think I'd prefer to wait a bit an clean up the
local.conf/machine.conf IMAGE_FSTYPES clobbering issue.

If this isn't really fixable (for whatever requirements bitbake has on
load/parse order of config files), then Koen's EXTRA_IMAGE_FSTYPES seems
like the most consistent mechanism with other things, like
CORE_IMAGE_EXTRA_INSTALL (OK, maybe IMAGE_EXTRA_FSTYPES ?).

So the default becomes:

IMAGE_FSTYPES ?= ${IMAGE_EXTRA_FSTYPES}

and DISTROs might define that as:

IMAGE_FSTYPES += "yyy"

and users can update local.conf to be:

IMAGE_FSTYPES = "X"

But, doesn't this meant the DISTRO append will still change the
IMAGE_FSTYPES to "X yyy" even though the user intended "only X"?

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


