Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1Qw6IQ-0002kl-1c
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Aug 2011 07:46:38 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 23 Aug 2011 22:41:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="41254000"
Received: from unknown (HELO envy.home) ([10.255.14.37])
	by orsmga002.jf.intel.com with ESMTP; 23 Aug 2011 22:41:50 -0700
Message-ID: <4E548F16.9070900@linux.intel.com>
Date: Tue, 23 Aug 2011 22:41:42 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110707 Thunderbird/5.0
MIME-Version: 1.0
To: Kumar Gala <galak@kernel.crashing.org>
References: <A09A21A1-D31F-4D21-92BD-6F521FD3012C@kernel.crashing.org>
In-Reply-To: <A09A21A1-D31F-4D21-92BD-6F521FD3012C@kernel.crashing.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: u-boot.inc issue with -Os
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
X-List-Received-Date: Wed, 24 Aug 2011 05:46:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 08/23/2011 10:05 PM, Kumar Gala wrote:
> Darren,
> 
> in meta/recipes-bsp/uboot/u-boot.inc:
> 
> # GCC 4.5.1 builds unusable binaries using -Os, remove it from
> OPTFLAGS EXTRA_OEMAKE = "CROSS_COMPILE=${TARGET_PREFIX} OPTFLAGS=''"
> 
> Was this for all u-boot builds, regardless of architecture, or just
> ppc.  Was the build failing or resulting binaries?

My sources differ from yours. We used to drop -Os for all arches, but it caused
issues for powerpc, so we replaced -Os with -O2 there. With the patch below, we
then used -O2 everywhere, regardless of architecture.

According to my sources:

# GCC 4.5.1 builds unusable binaries using -Os, remove it from OPTFLAGS          
EXTRA_OEMAKE = "CROSS_COMPILE=${TARGET_PREFIX} OPTFLAGS='-O2'"                  

And according to 'git show 6b76ceed1423480e18844e20fc81f05298bfdd6d':
commit 6b76ceed1423480e18844e20fc81f05298bfdd6d
Author: Darren Hart <dvhart@linux.intel.com>
Date:   Wed Feb 9 13:26:46 2011 -0800

    uboot: build with -O2 on all architectures
    
    The -Os option was disabled due to a bug in gcc building bad binaries for ARM
    in an earlier commit:
    
    f2dc7fadd8c6b180c3f985873261216d53f47f0d
    
    This caused problems for powerpc which was resolved by replacing -Os with
    -O2 for that architecture:
    
    d0eb6794d964aa5ac938533a222c39bef09fd945
    
    Using -O2 also works for ARM, so there is no need to condition using -O2 on
    powerpc. Remove the condition and use -O2 on all architectures.
    
    Signed-off-by: Darren Hart <dvhart@linux.intel.com>
    CC: Ilya Yanok <yanok@emcraft.com>
    CC: Richard Purdie <richard.purdie@linuxfoundation.org>

Thanks,

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


