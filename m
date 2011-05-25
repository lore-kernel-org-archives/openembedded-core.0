Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QPJIc-0001gi-LX
	for openembedded-core@lists.openembedded.org;
	Wed, 25 May 2011 20:59:18 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 25 May 2011 11:56:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,268,1304319600"; 
   d="scan'208";a="1634608"
Received: from unknown (HELO [10.255.12.181]) ([10.255.12.181])
	by azsmga001.ch.intel.com with ESMTP; 25 May 2011 11:56:14 -0700
Message-ID: <4DDD50D3.4090202@linux.intel.com>
Date: Wed, 25 May 2011 11:56:19 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4DDBDE9D.5000709@linux.intel.com>	<20110524172330.GC18086@sakrah.homelinux.org>	<6D7346D0-2F4B-44EC-A04B-2F443B33E544@dominion.thruhere.net>	<1306260430.2491.2.camel@elmorro>
	<1306333690.2491.82.camel@elmorro>
	<1306334330.2525.236.camel@phil-desktop>
In-Reply-To: <1306334330.2525.236.camel@phil-desktop>
Subject: Re: adding meta-intel layers breaks parsing, was Re: Updating u-boot for oe-core or meta-yocto
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
X-List-Received-Date: Wed, 25 May 2011 18:59:19 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 05/25/2011 07:38 AM, Phil Blundell wrote:
> On Wed, 2011-05-25 at 09:28 -0500, Tom Zanussi wrote:
>> I just finished building all of the above successfully using the latest
>> (as of yesterday) poky/master and meta-intel/master.
>>
>> Not sure why you're seeing parsing errors, none here...
> 
> The way meta-intel is using FILESEXTRAPATHS does look a bit dubious to
> me.  Your kernel .bbappend files seem to be doing:
> 
> FILESEXTRAPATHS := "${FILESEXTRAPATHS}:${THISDIR}/${PN}"
> 
> which seems wrong for two reasons: firstly it will lose if
> FILESEXTRAPATHS wasn't previously set (in which case you'll get a
> circular reference within the value, since bitbake won't expand that
> part of the rvalue during the assignment);

So the reason I had made this change was to allow for multiple layers to
aggregate their bbappends. As it was previously, the meta-intel layer
prevented other layers from working by clobbering the FILESEXTRAPATHS
rather than appending to it.

> and secondly, as far as I can
> tell from looking at utils.bbclass, FILESEXTRAPATHS isn't actually
> supposed to be colon separated in the first place.

Doh. My original patch was space separated and someone suggested colons
and I didn't see a build failure in my testing so I left it. Bad testing
methodology apparently.

If it is indeed space separated then I should be able to remedy both
issues by simply using the append operator and not self-referencing.
Correct?

> 
> (Also, as a tangential matter, this FILESEXTRAPATHS setting isn't going
> to be producing any useful effect since none of the meta-intel layers
> actually have any files in their recipes-kernel/linux directory.)

We do want it in place so these can be easily added for development
purposes, even though the ultimate goal would be to include such changes
in the kernel source repository.

> 
> p.
> 
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


