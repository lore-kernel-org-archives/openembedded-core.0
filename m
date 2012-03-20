Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1SA4Uq-000282-D3
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Mar 2012 20:13:28 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 20 Mar 2012 12:04:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="79693850"
Received: from unknown (HELO envy.home) ([10.255.15.194])
	by AZSMGA002.ch.intel.com with ESMTP; 20 Mar 2012 12:04:34 -0700
Message-ID: <4F68D497.9040704@linux.intel.com>
Date: Tue, 20 Mar 2012 12:03:51 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120209 Thunderbird/10.0.1
MIME-Version: 1.0
To: Denys Dmytriyenko <denis@denix.org>
References: <1332202974-27977-1-git-send-email-denis@denix.org>
	<4F689BD8.4040201@linux.intel.com>
	<20120320152846.GA22965@denix.org>
	<4F68A33A.7060604@linux.intel.com>
	<20120320160928.GB22965@denix.org>
	<4F68CEDA.2060101@linux.intel.com>
	<20120320185937.GC22965@denix.org>
In-Reply-To: <20120320185937.GC22965@denix.org>
X-Enigmail-Version: 1.4
Cc: Denys Dmytriyenko <denys@ti.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] rt-tests: fix dependency on eglibc, clean LDFLAGS passing
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
X-List-Received-Date: Tue, 20 Mar 2012 19:13:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 03/20/2012 11:59 AM, Denys Dmytriyenko wrote:
> On Tue, Mar 20, 2012 at 11:39:22AM -0700, Darren Hart wrote:
>> On 03/20/2012 09:09 AM, Denys Dmytriyenko wrote:
>>> On Tue, Mar 20, 2012 at 08:33:14AM -0700, Darren Hart wrote:
>>>>
>>>>
>>>> On 03/20/2012 08:28 AM, Denys Dmytriyenko wrote:
>>>>> On Tue, Mar 20, 2012 at 08:01:44AM -0700, Darren Hart wrote:
>>>>>>
>>>>>>
>>>>>> On 03/19/2012 05:22 PM, Denys Dmytriyenko wrote:
>>>>>>> From: Denys Dmytriyenko <denys@ti.com>
>>>>>>>
>>>>>>> Replace dependency on eglibc with virtual/libc
>>>>>>> Pass LDFLAGS to TARGET_CC_ARCH, instead of CFLAGS as Makefile overrides it
>>>>>>>
>>>>>>> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>>>>>>
>>>>>> Thanks Denys,
>>>>>>
>>>>>> Looking through the rt-tests sources I don't see TARGET_CC_ARCH
>>>>>> anywhere. Have you confirmed that changes made there make their way into
>>>>>> the actual build?
>>>>>
>>>>> Darren,
>>>>>
>>>>> TARGET_CC_ARCH is not an rt-tests specific variable, it's used in OE. 
>>>>> Although, TARGET_LDFLAGS might be more appropriate for this purpose, 
>>>>> historically TARGET_CC_ARCH was heavily used to pass distro LDFLAGS to the 
>>>>> app's build process - grepping it would show many such cases in OE-Core and 
>>>>> especially in meta-oe...
>>>>
>>>> OK, thanks for the context. Will you be resubmitting with TARGET_LDFLAGS?
>>>
>>> Nope, my bad, it's actually the other way around. From bitbake.conf:
>>>
>>> export LDFLAGS = "${TARGET_LDFLAGS}"
>>>
>>> So, appending to TARGET_CC_ARCH is the simplest way to pass flags, as that's 
>>> embedded into $CC
>>>
>>> Another option would have been to call make with -e flag to let environment 
>>> variables override the ones in the Makefile, but that's less controlled...
>>>
>>
>> How about the follow patch against rt-tests? Clark W. said he's fine taking a
>> patch that allows such an override. Does this meet your needs?
> 
> It does look good. Especially if it gets upstreamed! :)
> 
> If those default CFLAGS should always be there, then you can do something 
> like:
> 
> CFLAGS ?=
> CFLAGS += -D_GNU_SOURCE -Wall -Wno-nonnull -Isrc/include
> 
> But that would mean there's no way to override those from outside, only add to 
> them...
> 
> Thanks for taking time to upstream the fix. I'll need to re-submit my patch to 
> only do the eglibc -> virtual/libc change.
> 

Great,

I'll submit to rt-users now then. We should be able to pull the patch
into oe-core as well.

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


