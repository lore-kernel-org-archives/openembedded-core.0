Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 1728E71633
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 13:33:06 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 28 Aug 2015 06:33:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,424,1437462000"; d="scan'208";a="792739036"
Received: from lsandov1-mobl-linux.zpn.intel.com (HELO [10.219.5.168])
	([10.219.5.168])
	by orsmga002.jf.intel.com with ESMTP; 28 Aug 2015 06:33:05 -0700
Message-ID: <55E06356.8000607@linux.intel.com>
Date: Fri, 28 Aug 2015 08:34:14 -0500
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: Patrick Ohly <patrick.ohly@intel.com>, 
	"Stoppa, Igor" <igor.stoppa@intel.com>,
	matt.fleming@intel.com, ricardo.neri@intel.com
References: <cover.1436903712.git.leonardo.sandoval.gonzalez@linux.intel.com>	
	<16f26bbb5fa39e399b185cd26fe9205c2e0cc5d4.1436903712.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<1440746955.3006.73.camel@intel.com>
In-Reply-To: <1440746955.3006.73.camel@intel.com>
Cc: leonardo.sandoval.gonzalez@intel.com,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V3 3/3] runqemu: Define OECORE_MACHINE_SYSROOT on setup_sysroot
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
X-List-Received-Date: Fri, 28 Aug 2015 13:33:08 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Patrick,

I do not have much time for a V4 set of patches, but now with all your 
input I can rework V3 patches on 2.1. Copying Matt and Ricardo, they 
helped me when porting these patches into poky. They may have other 
comments.



On 08/28/2015 02:29 AM, Patrick Ohly wrote:
> On Tue, 2015-07-14 at 20:07 +0000,
> leonardo.sandoval.gonzalez@linux.intel.com wrote:
>> From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
>>
>> At least the OVFM (UEFI Firmware for Qemu and KVM) recipe stores the BIOS
>> under $OE_TMPDIR/sysroots/$MACHINE, now defined as OECORE_MACHINE_SYSROOT.
>> The latter is used when searching BIOS, VGA BIOS and keymaps. As a example,
>> to boot a OVFM BIOS, one can run the following command:
>>
>> $ runqemu qemux86-64 core-image-minimal \
>>      biosdir=usr/share/ovmf  \
>>      biosfilename=bios.bin \
>>      nographic
>>
>> Note the bios* parameters: these two are needed to specify the subfolder
>> (parent folder is OECORE_MACHINE_SYSROOT) and BIOS filename (without it,
>> it picks a BIOS named bios-256k.bin).
>
> While researching the nvram support question I came across the ovmf
> whitepaper [1] showing how to use OVMF via "-drive
> if=pflash,format=raw,file=fedora.flash" (where fedora.flash is a per-vm
> copy of OVMF.fd = bios.bin in the sysroot).
>
> I kept wondering why you were using "-bios bios.bin" instead of the
> -drive method, and how that would affect nvram support. Then I found a
> pretty clear statement by Laszlo Ersek, one of the OVMF co-maintainers,
> saying [2] that -bios and the nvram support possible with it (storing in
> an NvRam file in the EFI boot partition) are a kludge that should not be
> used anymore.
>
> So in other words, this particular patch needs further work. Perhaps add
> an "ovmf" keyword (selecting the bios.bin as pflash drive), file name
> handling (treat anything ending in .bin or .fd as pflash, supporting
> more than one) and a OVMF env variable with a corresponding colon
> separated list of pflash files?
>
> I also wonder about the "bios.bin" name and the ".bin" suffix. I think
> it would be better to stick with the upstream convention and just
> install the file in the sysroot as OVMF.fd. This simplifies the file
> name handling such that only .fd is special.
>
> Note that the upstream discussion was about per-vm nvram storage. I
> think in the context of runqemu it is okay to have a single file per
> build configuration, because effectively we are creating a single
> machine with one OS image. What's less nice is that the sysroot will get
> modified when using bios.bin as pflash drive. Resetting the nvram needs
> to be done with "bitbake -c clean ovmf && bitbake ovmf". Both is not
> obvious.
>
> Perhaps if runqemu picks up the file automatically from the sysroot (the
> "ovmf" keyword usage), it should make a copy in tmp (on first run) and
> then use that copy instead?
>
> [1] http://www.linux-kvm.org/downloads/lersek/ovmf-whitepaper-c770f8c.txt
> [2] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=764918#47
>

