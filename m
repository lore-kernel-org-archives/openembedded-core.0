Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QFT9F-0004SY-AO
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Apr 2011 17:28:59 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 28 Apr 2011 08:26:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,281,1301900400"; d="scan'208";a="427167510"
Received: from unknown (HELO [10.255.13.11]) ([10.255.13.11])
	by azsmga001.ch.intel.com with ESMTP; 28 Apr 2011 08:26:20 -0700
Message-ID: <4DB98714.4030201@linux.intel.com>
Date: Thu, 28 Apr 2011 08:26:12 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <73DFD7AC-9837-4C27-BB34-2B2AC7D1DD8B@dominion.thruhere.net>
	<4DB5AB17.2060806@linux.intel.com>
	<D13D255E-BAA6-4F92-94CB-CF0706779365@dominion.thruhere.net>
In-Reply-To: <D13D255E-BAA6-4F92-94CB-CF0706779365@dominion.thruhere.net>
Cc: Bruce Ashfield <Bruce.Ashfield@windriver.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] don't run make clean on kernel_do_install
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
X-List-Received-Date: Thu, 28 Apr 2011 15:28:59 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 04/28/2011 01:30 AM, Koen Kooi wrote:
> 
> Op 25 apr 2011, om 19:10 heeft Darren Hart het volgende geschreven:
> 
>> Hi Koen,
>>
>> On 04/23/2011 07:47 AM, Koen Kooi wrote:
>>> Hi,
>>>
>>> Over the holidays I was trying to build some externel kernel modules
>>> and they failed to build because linux/bounds.h wasn't in sysroots.
>>>
>>
>>
>> According the the linux Makefile:
>>
>> ###
>> # Cleaning is done on three levels.
>> # make clean     Delete most generated files
>> #                Leave enough to build external modules
>>
>> The kernel Makefile should not be deleting it.
>>
>> And indeed:
>> https://bugzilla.kernel.org/show_bug.cgi?id=11475
>>
>> This was addressed by the following in 2.6.27:
>> 7d3cc8b6d899e53222c22a78d98bb53a695f7962
>> Don't clean bounds.h and asm-offsets.h
>>
>> Later, bounds.h moved as well in 2.6.33:
>> 01fc0ac198eabcbf460e1ed058860a935b6c2c9a
>> kbuild: move bounds.h to include/generated
>>
>>
>> Which kernel version are you attempting to build?
>>
>> We shouldn't add code to address a bug in a specific kernel version in a
>> kernel base class. That belongs in the specific recipe. I suggest trying
>> to add the 7d3cc8b6d899e53222c22a78d98bb53a695f7962 patch to your kernel
>> recipe and see if that resolves the issue for you without resorting to
>> recreating the clean process in the base class.
> 
> I went with this option: http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/meta-texasinstruments/commit/?id=7bcba149f05cc9c5d8ce956ee40e2c6849601470
> 

Works around the problem, but does so in the appropriate place. I would
like to understand if this is something that is likely to bite others,
or if there is something peculiar about this particular kernel. If it
crops up again, we'll need to dig in further.

--
Darren

> regards,
> 
> Koen

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


