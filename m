Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QPo0O-0005nF-RL
	for openembedded-core@lists.openembedded.org;
	Fri, 27 May 2011 05:46:33 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 26 May 2011 20:43:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,278,1304319600"; 
   d="scan'208";a="2708597"
Received: from unknown (HELO [10.255.12.184]) ([10.255.12.184])
	by azsmga001.ch.intel.com with ESMTP; 26 May 2011 20:43:25 -0700
Message-ID: <4DDF1DDD.30001@linux.intel.com>
Date: Thu, 26 May 2011 20:43:25 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1306444161.git.dvhart@linux.intel.com>	
	<e5f5d48165bcb5dc3ccf160a29e16ca700f85395.1306444161.git.dvhart@linux.intel.com>
	<1306452282.27470.214.camel@rex>
In-Reply-To: <1306452282.27470.214.camel@rex>
Cc: Koen Kooi <koen@dominion.thruhere.net>, Chris Larson <clarson@kergoth.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] u-boot: remove UBOOT_MACHINE and COMPATIBLE_MACHINES
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
X-List-Received-Date: Fri, 27 May 2011 03:46:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 05/26/2011 04:24 PM, Richard Purdie wrote:
> On Thu, 2011-05-26 at 14:12 -0700, Darren Hart wrote:
>> Note: I used bb.note() instead of bb.debug() to ensure the message at least
>>       makes it to the console. From what I could gather, bb.debug() doesn't
>>       go anywhere during recipe parsing.
> 
> Why?
> 

My thinking was that the only time you would legitimately try and build
this package when you can't is during a "world" build, which is likely
an unattended sort of build anyway. The rest of the time you might hit
this error would be when you intended to build u-boot but are missing
the requisite configuration bits in your machine config.

Since the debug lines don't get logged anywhere, and you have to clear
tmp/cache in order to retrigger the SkipPackage event with a new bitbake
command (even with -D), I thought it the most user friendly to ensure
the message made it out somewhere where it wouldn't get lost.

> We exclude about 30 different recipes

I didn't realize it was so many, it's difficult to tell just grepping
for SkipPackage.

> when parsing and would you really
> want to see a usability message from each one when you likely don't care
> about it?

See above for my rationale on when you "care about it".

> 
> A bb.debug is fine and the user can see it if they run with -D to get
> more info.

The user won't see it unless they clear tmp/cache, which isn't very
intuitive (or at least it wasn't to me).

> A bb.note is just irritating.

I can resend with bb.debug() if you feel strongly about it, as
apparently you do. I've answered your "why" question, but I don't feel
strongly about it. If you want to use bb.debug() I can resend as such
(or just repush with that single change).

Thanks,

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


