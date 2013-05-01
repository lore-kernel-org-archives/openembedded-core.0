Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1UXeZo-0001Jl-RP
	for openembedded-core@lists.openembedded.org;
	Wed, 01 May 2013 23:28:40 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 01 May 2013 14:08:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,591,1363158000"; d="scan'208";a="329798741"
Received: from envy2.jf.intel.com (HELO envy2.home) ([10.7.199.54])
	by orsmga002.jf.intel.com with ESMTP; 01 May 2013 14:10:43 -0700
Message-ID: <518184D2.9000308@linux.intel.com>
Date: Wed, 01 May 2013 14:10:42 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130110 Thunderbird/17.0.2
MIME-Version: 1.0
To: Phil Blundell <pb@pbcl.net>
References: <1367244122.14512.124.camel@phil-desktop.brightsign>
	<51816817.7080101@linux.intel.com>
	<1367442335.25055.23.camel@pb-ThinkPad-R50e>
In-Reply-To: <1367442335.25055.23.camel@pb-ThinkPad-R50e>
X-Enigmail-Version: 1.5.1
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel.bbclass: Don't include source files for "other" architectures in the sysroot
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
X-List-Received-Date: Wed, 01 May 2013 21:28:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 05/01/2013 02:05 PM, Phil Blundell wrote:
> On Wed, 2013-05-01 at 12:08 -0700, Darren Hart wrote:
>> You've stated that this successfully removes code on mips, have you also
>> tested that basic module building still works? For example, does
>> hello-mod still build?
> 
> I didn't try hello-mod, but the two (proprietary) out-of-tree modules
> that we routinely build into our own images do still compile and work.
> 
>> Have you confirmed this on any other architectures? I'd like to see a
>> test at least on the core emulated BSPs (or maybe at least 2 of them)
>> before we pull this in as we have spent quite a bit of effort getting
>> modules building to date, I'd hate to break that due to a lack of testing.
> 
> I've tested on arm and mips.  I guess I can set up a build tree for a
> qemu target on some other architecture if you like.


I'd feel more comfortable with a bit more testing as this impacts all
architecture and that sometimes has subtle effects.


>>>  	make -C $kerneldir _mrproper_scripts
>>>  	find $kerneldir -path $kerneldir/lib -prune -o -path $kerneldir/tools -prune -o -path $kerneldir/scripts -prune -o -name "*.[csS]" -exec rm '{}' \;
>>> +	rm -rf $(find $kerneldir/arch -maxdepth 1 -not -path $kerneldir/arch/$ARCH -not -path $kerneldir/arch/Kconfig -not -path $kerneldir/arch/. -not -path $kerneldir/arch)
>>
>> Any particular reason for not using "-exec rm" like the other code
>> removal commands here?
> 
> No, just force of habit.  Using xargs is more performant in general, but
> "find -exec ..." is safer and I guess that's probably what we should do
> here too.

OK, I'll wait for the next version.

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel


