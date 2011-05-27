Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QPyfa-0000FO-Qu
	for openembedded-core@lists.openembedded.org;
	Fri, 27 May 2011 17:09:47 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 27 May 2011 08:06:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,280,1304319600"; 
   d="scan'208";a="2961872"
Received: from unknown (HELO [10.255.12.184]) ([10.255.12.184])
	by azsmga001.ch.intel.com with ESMTP; 27 May 2011 08:06:40 -0700
Message-ID: <4DDFBE03.9060603@linux.intel.com>
Date: Fri, 27 May 2011 08:06:43 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Phil Blundell <pb@pbcl.net>
References: <cover.1306385875.git.dvhart@linux.intel.com>	
	<c83bebea4e1c4dd15422ad2cb75eab977cea4a59.1306385875.git.dvhart@linux.intel.com>	
	<1306407015.2525.311.camel@phil-desktop>	<1306420679.27470.186.camel@rex>	
	<1306426688.2525.377.camel@phil-desktop>
	<4DDE9206.7020007@linux.intel.com>
	<1306505097.2525.457.camel@phil-desktop>
In-Reply-To: <1306505097.2525.457.camel@phil-desktop>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Fri, 27 May 2011 15:09:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 05/27/2011 07:04 AM, Phil Blundell wrote:
> On Thu, 2011-05-26 at 10:46 -0700, Darren Hart wrote:
>> Right, it just starts to look rather ugly in the recipe, especially for
>> BSPs supporting more than just a couple of machines. I also think that
>> having to use machine overrides is an indicator that the mechanism is
>> not working for the purpose it was designed for.
> 
> Yes, agreed.  But the point I was making in my first mail is that you
> don't actually need to use machine overrides at all; just appending to
> COMPATIBLE_MACHINE will work fine.
> 
> So, to be clear, in the core u-boot.bb you could have:
> 
> # These machines are supported by upstream u-boot
> COMPATIBLE_MACHINE = "(beagleboard$|at91sam9260ek$)"
> 
> and then, in some putative meta-dec overlay, you could have a
> u_boot.bbappend which does:
> 
> # This patch adds PDP-11 support to u-boot
> SRC_URI += "pdp11.patch"
> COMPATIBLE_MACHINE .= "|pdp11$"

Ah good point, and if you have multiple machines:
COMPATIBLE_MACHINE .= "|(pdp11$|pdp11/20$)"

In fact... why are the parens used at all?

I think we would likely get a lot of bug reports on the lists if we used
this approach, using regex's here seems rather non-intuitive to me (and
I'm rather fond of regexes).

> 
> and everything ought to work out just fine.  The only bit that is
> slightly non-obvious is what to do if you don't want the core version of
> u-boot to admit any MACHINEs at all but, as I mentioned to Richard, you
> can achieve that by setting
> 
> COMPATIBLE_MACHINE = "(?!^)"
> 
> or something similar.


All this said, do you have any objection to using UBOOT_MACHINE in the
machine.conf with the anon python check for it in the inc file? I think
you said not, but I want to be sure.

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


