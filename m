Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QZSqE-0003po-No
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 21:11:58 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 22 Jun 2011 12:08:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,407,1304319600"; d="scan'208";a="21560817"
Received: from unknown (HELO [10.255.13.180]) ([10.255.13.180])
	by fmsmga001.fm.intel.com with ESMTP; 22 Jun 2011 12:08:14 -0700
Message-ID: <4E023D9F.5090301@linux.intel.com>
Date: Wed, 22 Jun 2011 12:08:15 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <1308757294-21106-1-git-send-email-koen@dominion.thruhere.net>
	<4E0230BC.6020404@linux.intel.com>
	<2A97F42D-8473-43D1-AD28-A409829DC53D@dominion.thruhere.net>
In-Reply-To: <2A97F42D-8473-43D1-AD28-A409829DC53D@dominion.thruhere.net>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kernel.bbclass: restore kernel-abiversion file
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
X-List-Received-Date: Wed, 22 Jun 2011 19:11:59 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 06/22/2011 11:18 AM, Koen Kooi wrote:
> 
> Op 22 jun 2011, om 20:13 heeft Darren Hart het volgende geschreven:
> 
>>
>>
>> On 06/22/2011 08:41 AM, Koen Kooi wrote:
>>> This fixes external module recipes that need $KERNEL_VERSION. It got removed by
>>>
>>>    commit a9d41062e24a6b99661b3a5256f369b557433607
>>>    Author: Darren Hart <dvhart@linux.intel.com>
>>>    Date:   Tue Mar 8 17:09:10 2011 -0800
>>>
>>>        kernel/bbclass: rework kernel and module classes to allow for building out-of-tree modules
>>>
>>> seemingly as an oversight.

It was indeed unintentional. There is enough history with this mechanism
that a change here should be intentional and not an oversight as you
pointed out.

>>>
>>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>

Acked-by: Darren Hart <dvhart@linux.intel.com>

>>> ---
>>> meta/classes/kernel.bbclass |    6 ++++++
>>> 1 files changed, 6 insertions(+), 0 deletions(-)
>>>
>>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>>> index 1bb69f5..8f9f108 100644
>>> --- a/meta/classes/kernel.bbclass
>>> +++ b/meta/classes/kernel.bbclass
>>> @@ -123,6 +123,12 @@ kernel_do_install() {
>>> 	install -d $kerneldir
>>>
>>> 	#
>>> +	# Store the kernel version in sysroots for module-base.bbclass
>>> +	#
>>> +
>>> +	echo "${KERNEL_VERSION}" > $kerneldir/kernel-abiversion
>>
>> From everything I can see this is an openembedded construct - which
>> external modules need this? An example recipe I can review?
>>
>> I'd like to understand this better as I don't like the idea of depending
>> on an arbitrary file that isn't part of the kernel build system to build
>> modules.
>>
>> It seems to me that these modules should be able to DEPEND on something
>> provided by the kernel recipes, rather than checking the contents of a
>> file stuck in the build tree.
> 
> It's used in the stock module.bbclass thru module-base.bbclass:
> 
> https://github.com/openembedded/oe-core/blob/master/meta/classes/module-base.bbclass
> 
> An example of a recipe that's using it:
> 
> http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/meta-texasinstruments/tree/recipes-bsp/powervr-drivers/omap3-sgx-modules_1.6.16.3977.bb
> 
> For various reasons the makefile can't be trusted or patched, so we can't use KBuild to get the version for us.
> 
> regards,
> 
> Koen
> 

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


