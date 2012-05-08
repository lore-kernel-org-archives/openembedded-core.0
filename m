Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1SRmNT-0007IC-DR
	for openembedded-core@lists.openembedded.org;
	Tue, 08 May 2012 17:31:03 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 08 May 2012 08:21:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="163457186"
Received: from unknown (HELO envy.home) ([10.255.13.12])
	by fmsmga002.fm.intel.com with ESMTP; 08 May 2012 08:21:10 -0700
Message-ID: <4FA939C8.3040403@linux.intel.com>
Date: Tue, 08 May 2012 08:20:40 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120424 Thunderbird/12.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1335693807-17609-1-git-send-email-wd@denx.de>
	<1336052928-30764-1-git-send-email-wd@denx.de>
	<D777AF9B-4859-43C3-946D-EF5172E0806B@dominion.thruhere.net>
	<1336055317.30113.124.camel@ted>
In-Reply-To: <1336055317.30113.124.camel@ted>
X-Enigmail-Version: 1.4.1
Subject: Re: [PATCH] Add KERNEL_EXTRA_ARGS parameter
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
X-List-Received-Date: Tue, 08 May 2012 15:31:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 05/03/2012 07:28 AM, Richard Purdie wrote:
> On Thu, 2012-05-03 at 16:02 +0200, Koen Kooi wrote:
>> Op 3 mei 2012, om 15:48 heeft Wolfgang Denk het volgende geschreven:
>>
>>> With recent kernel versions, some ARM configurations need may fail to
>>> build with errors like this:
>>>
>>> 	multiple load addresses: 0x80008000 0x80008000
>>> 	This is incompatible with uImages
>>> 	Specify LOADADDR on the commandline to build an uImage
>>>
>>> We cannot pass this information in EXTRA_OEMAKE, as
>>> "meta/classes/kernel.bbclass" explicitly ignores all EXTRA_OEMAKE
>>> settings.  So add KERNEL_EXTRA_ARGS parameter so affected boards
>>> can add for example
>>>
>>> 	KERNEL_EXTRA_ARGS = "LOADADDR=0x80008000"
>>
>> Isn't KERNEL_EXTRA_OEMAKE clearer in this case? I see kernel args
>> being what ends up in /proc/cmdline.
> 
> In many ways I wish we could use EXTRA_OEMAKE and try and keep the API
> simpler. Looking at the code, I think it actually can work even with the
> existing code in some circumstances.
> 
> Whilst kernel.bbclass does zero out the contents, it does this simply to
> get rid of the default value (the -e MAKEARGS= bit).
> 
> The following recipe will therefore work:
> 
> """
> <some recipe code>
> 
> inherit kernel
> 
> EXTRA_OEMAKE += 'LOADADDR=0x80008000'
> """
> 
> but the problem is likely this can't be set from machine.conf.
> 
> I was wondering about changing the system so that in bitbake.conf we
> set:
> 
> OEMAKEDEFAULT = "-e MAKEFLAGS="
> EXTRA_OEMAKE = "${OEMAKEDEFAULT}"
> 
> and then kernel.bbclass can zero out OEMAKEDEFAULT. The trouble is you
> want to set:
> 
> EXTRA_OEMAKE_append_xxxx = " LOADADDR=0x80008000"
> 
> and I'm not coming up with a good value of xxxx other than
> pn-linux-xxxx :/. We could consider an extra override for the kernel
> case I guess.
> 
> I would prefer not to add mode global variables unless we can possibly
> help it...

I like the idea of reusing EXTRA_OEMAKE. Unfortunately, by the time we
have to add _append_pn-linux-yocto it seems like the benefit is lost and
I prefer Koen's KERNEL_EXTRA_OEMAKE suggestion.

--
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


