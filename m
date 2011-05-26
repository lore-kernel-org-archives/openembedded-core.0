Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QPegv-0002cs-SG
	for openembedded-core@lists.openembedded.org;
	Thu, 26 May 2011 19:49:50 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 26 May 2011 10:46:28 -0700
X-ExtLoop1: 1
Received: from doubt.jf.intel.com (HELO [10.24.80.114]) ([10.24.80.114])
	by orsmga002.jf.intel.com with ESMTP; 26 May 2011 10:46:28 -0700
Message-ID: <4DDE9206.7020007@linux.intel.com>
Date: Thu, 26 May 2011 10:46:46 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1306385875.git.dvhart@linux.intel.com>	<c83bebea4e1c4dd15422ad2cb75eab977cea4a59.1306385875.git.dvhart@linux.intel.com>	<1306407015.2525.311.camel@phil-desktop>	<1306420679.27470.186.camel@rex>
	<1306426688.2525.377.camel@phil-desktop>
In-Reply-To: <1306426688.2525.377.camel@phil-desktop>
Subject: Re: [pull-oe-uboot 1/2] u-boot: remove UBOOT_MACHINE and COMPATIBLE_MACHINES
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
X-List-Received-Date: Thu, 26 May 2011 17:49:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 05/26/2011 09:18 AM, Phil Blundell wrote:
> On Thu, 2011-05-26 at 15:37 +0100, Richard Purdie wrote:
>> u-boot in OE-Core would need something like COMPATIBLE_MACHINE = ""
>> which makes this harder.
> 
> Yes, true.  I don't think that's a major problem, though, you just need
> a regex that won't match anything.  Something like:
> 
> COMPATIBLE_MACHINE = "(?!^)"
> 
> would probably do what you want, though it does have the admitted
> downside of looking rather like line noise.  
> 
> If this is going to be a common problem then it might be worth hacking
> base.bbclass about a bit to provide a more convenient way to do it.  The
> UBOOT_MACHINE thing is fine as a solution for u-boot since that variable
> needs to exist anyway, but I wouldn't have been keen on introducing it
> just to control the recipe acceptability.
> 
>> Its usually seem to work out easier to just do:
>>
>> COMPATIBLE_MACHINE_mymachine = "mymachine"
>>
>> which avoids several potential issues.
> 
> Yeah, that would work fine too: you could even save a bit of typing by
> just using "" as the rvalue since an empty C_M will (somewhat
> counterintuitively) permit everything.

Really?... <looks into base.bbclass and data_smart.py> Huh, you are
correct. I wouldn't have expected that.

>  I got the impression from
> Darren's original phraseology of "resorting to machine-specific
> overrides" that he didn't like it much, though.

Right, it just starts to look rather ugly in the recipe, especially for
BSPs supporting more than just a couple of machines. I also think that
having to use machine overrides is an indicator that the mechanism is
not working for the purpose it was designed for.

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


