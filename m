Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1Ss7rx-00049L-Na
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Jul 2012 09:43:25 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 20 Jul 2012 00:32:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="168820742"
Received: from unknown (HELO envy.home) ([10.255.12.229])
	by orsmga001.jf.intel.com with ESMTP; 20 Jul 2012 00:32:01 -0700
Message-ID: <50090910.9000308@linux.intel.com>
Date: Fri, 20 Jul 2012 00:30:24 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1341940070-27715-1-git-send-email-raj.khem@gmail.com>
	<1341940070-27715-2-git-send-email-raj.khem@gmail.com>
	<1342002640.7934.5.camel@ted>
	<CAMKF1sqkxxrxKU-XO4HezbfsapTDXhz-TZNx_tNGq=rsNgB=wQ@mail.gmail.com>
	<1342018098.11939.16.camel@ted>
In-Reply-To: <1342018098.11939.16.camel@ted>
X-Enigmail-Version: 1.4.3
Subject: Re: [PATCH 2/2] kernel.bbclass: Make tree available for cross building external modules
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
X-List-Received-Date: Fri, 20 Jul 2012 07:43:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 07/11/2012 07:48 AM, Richard Purdie wrote:
> On Wed, 2012-07-11 at 07:25 -0700, Khem Raj wrote:
>> On Wed, Jul 11, 2012 at 3:30 AM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>>> On Tue, 2012-07-10 at 10:07 -0700, Khem Raj wrote:
>>>> We shave too much from kernel sources for making it work
>>>> for on device external kernel module development that cross
>>>> development of external modules wont work from same tree
>>>> anymore. This patch makes a copy of tree which will eventually
>>>> be staged for building external modules
>>>
>>> It sounds from the further discussion that there is more to the patch
>>> than just this. Firstly, a change like this needs a more precise
>>> description.
>>>
>>> Secondly, we're copying around *way* to much data in this approach. I'd
>>> like to suggest an improvement but can't since the description above is
>>> lacking, I can't even understand what the problem is you're trying to
>>> fix.
>>
>> alright. There are tools (especially in scripts/) which are made for
>> buildhost when compiling the kernel irrespective of cross
>> or native. The tools like fixdep, recordmcount etc. which are needed
>> to run when you build kernel itself as well as external
>> modules. Now we do 'make _mproper_scripts' which cleans all those
>> binaries. We do this because we want to ship kernel-dev
>> and packaging binaries for different host wont be allowed in a target
>> package. So we chose to delete them and then on device
>> regenerate them ( ideally I would have preferred to generate them
>> cross candian when making for target)
>>
>> Deleting these tools also renders the cross building of modules
>> useless. Since I want to ship the sources as reference only
>> meaning people may not have write access to the kernel sources they
>> can not run make inside the kernel sources to regenerate
>> those binaries before they start building their external modules.
>>
>>>
>>> So more discussion is needed.
>>>
>>> I have a suspicion that this fix only "happens" to work when SDKMACHINE
>>> == NATIVEMACHINE.
>>>
>>
>> yes, for a full solution we have to generate two versions of
>> kernel-tools 1 for target and 1 for SDKMACHINE
>> however this at least brings back what we had.
> 
> s/full/non-broken/
> 
> This patch adds something that is broken in several different cases and
> kills off performance as an added bonus. I'd like to get this fixed
> properly please rather than perpetuate the problem. We need to either do
> something well and correctly, or not do it at all. We could document
> "make _mproper_scripts" as a requirement for installing the kernel SDK
> in the meantime.
> 
> I think we do need to make a kernel-tools package which correctly
> generates the tools for a given target, be it nativesdk, or the target
> device.

Khem, I take it we still have something left to do here in addition to
the bounds.h patch you sent a short while ago?

If so, this sounds like a big enough effort that a bug is warranted.
Would you consider writing up exactly what you're trying to accomplish
and opening a bug?

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel




