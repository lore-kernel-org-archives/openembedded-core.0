Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3DD376F57D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Mar 2014 08:39:19 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 03 Mar 2014 00:39:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,576,1389772800"; d="scan'208";a="484702075"
Received: from lpalcu-linux.rb.intel.com (HELO lpalcu-linux) ([10.237.105.45])
	by fmsmga001.fm.intel.com with ESMTP; 03 Mar 2014 00:38:47 -0800
Date: Mon, 3 Mar 2014 10:38:46 +0200
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: Stefan Agner <stefan@agner.ch>
Message-ID: <20140303083846.GA3698@lpalcu-linux>
References: <9362603aca1b9e36631265991dc556a5@agner.ch>
MIME-Version: 1.0
In-Reply-To: <9362603aca1b9e36631265991dc556a5@agner.ch>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: relocate_sdk.py: Possible bug, /lib64/ld-linux-x86-64.so.2 not relocated
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Mar 2014 08:39:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Stefan,

On Sat, Mar 01, 2014 at 03:28:09PM +0100, Stefan Agner wrote:
> Hi,
> 
> Using top of dylan branch, I generated a SDK using bitbake
> meta-toolchain. I'm running Arch Linux, but I also see similar issues on
> Ubuntu 12.04.4 LTS:
> 
> Some binaries segfault when running them. I discovered, that the dynamic
> linker of the host is used:
> $ ldd
> /usr/local/oecore-x86_64/sysroots/x86_64-angstromsdk-linux/usr/bin/armv7ahf-vfp-neon-angstrom-linux-gnueabi/arm-angstrom-linux-gnueabi-gcc
> linux-vdso.so.1 (0x00007fffc8f11000)
> libc.so.6 =>
> /usr/local/oecore-x86_64/sysroots/x86_64-angstromsdk-linux/usr/bin/armv7ahf-vfp-neon-angstrom-linux-gnueabi/../../../lib/libc.so.6
> (0x00007f4d85eb1000)
> /lib64/ld-linux-x86-64.so.2 (0x00007f4d8625f000)
> 
> When forcing the dynamic linker of the SDK, the binary works:
> $
> /usr/local/oecore-x86_64/sysroots/x86_64-angstromsdk-linux/lib/ld-linux-x86-64.so.2
> /usr/local/oecore-x86_64/sysroots/x86_64-angstromsdk-linux/usr/bin/armv7ahf-vfp-neon-angstrom-linux-gnueabi/arm-angstrom-linux-gnueabi-gcc
> arm-angstrom-linux-gnueabi-gcc: fatal error: no input files
> compilation terminated.
> 
> Digging around I found this commit by Jason:
> 3752a9c6d772b39bbe04d62ef4d3527b4c7198c1
> relocate_sdk.py: Fix corruption of sdk binaries
> 
> It changes the behavior and don't relocates stuff which start with
> /lib64.
This is the correct behavior. We shouldn't relocate binaries that use
host's dynamic loader.

> When I install the SDK with -S (copy the relocate scripts), and
> remove the condition around line 95, the binaries work as expected. 
Can you please run the installer script with "-R" so it doesn't perform
any relocation on binaries, and then:

readelf -p ".interp" /usr/local/oecore-x86_64/sysroots/x86_64-angstromsdk-linux/usr/bin/armv7ahf-vfp-neon-angstrom-linux-gnueabi/arm-angstrom-linux-gnueabi-gcc

It looks like the default dynamic loader path of the toolchain binaries
start with /lib* or /usr/lib* which is not quite right... It should be:
${SDKPATH}/sysroots/${SDK_SYS}.

laurentiu

