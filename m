Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id ACF046D257
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2013 05:39:23 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 30 Oct 2013 22:39:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="427469369"
Received: from unknown (HELO [10.255.15.36]) ([10.255.15.36])
	by orsmga002.jf.intel.com with ESMTP; 30 Oct 2013 22:39:24 -0700
Message-ID: <5271ECFA.3080202@linux.intel.com>
Date: Wed, 30 Oct 2013 22:39:06 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: ChenQi <Qi.Chen@windriver.com>, Khem Raj <raj.khem@gmail.com>
References: <cover.1383098783.git.Qi.Chen@windriver.com>	<8375914656f9a76b45495b0bb7209df9a7fde180.1383098783.git.Qi.Chen@windriver.com>	<CAMKF1sokaQmkE6imxFxYD88UB2woFrFkybRprAkbd3kHhSucjg@mail.gmail.com>
	<5271DF4D.30607@windriver.com>
In-Reply-To: <5271DF4D.30607@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] iproute2: explicitly add 'bash' to its RDEPENDS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 31 Oct 2013 05:39:25 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/30/2013 09:40 PM, ChenQi wrote:
> On 10/31/2013 11:32 AM, Khem Raj wrote:
>> On Tue, Oct 29, 2013 at 7:07 PM,  <Qi.Chen@windriver.com> wrote:
>>> From: Chen Qi <Qi.Chen@windriver.com>
>>>
>>> If we build a minimal image with iproute2 installed, the following
>>> error will appear during rootfs.
>>>
>>> error: Can't install iproute2-3.10.0-r0.0@i586: no package provides
>>> /bin/bash
>>>
>>> The problem is that iproute2 has an implicit dependency on 'bash'.
>>> This dependency is from per-file dependency checking. But as 'bash'
>>> is not explicitly specified in the RDEPENDS in recipe, it's not built.
>>> This leads to the above error.
>> To be a bit more surgical if you could figure out which script is it
>> which is asking for it that will help
>> to determine if we can create a separate package for these scripts which
>> have dependency on bash and then create a RDEPEND for this new package
>> instead.
>
> /sbin/ifcfg and /sbin/rtpr.
>
> Here's a grep result from the package/ directory of iproute2.
> iproute2/3.10.0-r0/package [1] $ grep -R '/bin/bash' ./*
> ./sbin/ifcfg:#! /bin/bash
> ./sbin/rtpr:#! /bin/bash
Can we de-bash these?  Upstream might take a patch for that.

> ./usr/share/doc/iproute2/examples/cbq.init-v0.7.3:#!/bin/bash
> ./usr/share/doc/iproute2/examples/dhcp-client-script:#!/bin/bash

These are example scripts, can we move them to a seperate package 
instead of being part of the core package?
> ./usr/share/doc/iproute2/ip-cref.tex:#! /bin/bash
> ./usr/share/doc/iproute2/ip-cref.tex:#! /bin/bash
>
Same here can we de-bash them or is it more work?

Sau!


> Best Regards,
> Chen Qi
>
>>> Fix this problem by explicitly adding 'bash' to the RDEPENDS.
>>>
>>> [YOCTO #5415]
>>>
>>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>> ---
>>>   meta/recipes-connectivity/iproute2/iproute2.inc |    1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/meta/recipes-connectivity/iproute2/iproute2.inc
>>> b/meta/recipes-connectivity/iproute2/iproute2.inc
>>> index 3db21db..40f6a6c 100644
>>> --- a/meta/recipes-connectivity/iproute2/iproute2.inc
>>> +++ b/meta/recipes-connectivity/iproute2/iproute2.inc
>>> @@ -10,6 +10,7 @@ LIC_FILES_CHKSUM =
>>> "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
>>>
>>> file://ip/ip.c;beginline=3;endline=8;md5=689d691d0410a4b64d3899f8d6e31817"
>>>
>>>
>>>   DEPENDS = "flex-native bison-native iptables"
>>> +RDEPENDS_${PN} = "bash"
>>>
>>>   inherit update-alternatives
>>>
>>> --
>>> 1.7.9.5
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

