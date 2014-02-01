Return-Path: <dvhart@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 76DC36E9A0
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Feb 2014 16:44:21 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 01 Feb 2014 08:44:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,760,1384329600"; d="scan'208";a="474374088"
Received: from unknown (HELO [10.255.13.88]) ([10.255.13.88])
	by fmsmga002.fm.intel.com with ESMTP; 01 Feb 2014 08:44:21 -0800
Message-ID: <1391273061.2891.10.camel@dvhart-mobl.amr.corp.intel.com>
From: Darren Hart <dvhart@linux.intel.com>
To: Koen Kooi <koen.kooi@linaro.org>
Date: Sat, 01 Feb 2014 08:44:21 -0800
In-Reply-To: <52E1085F.3060607@linaro.org>
References: <52E1085F.3060607@linaro.org>
Organization: Intel
X-Mailer: Evolution 3.10.3 (3.10.3-1.fc20) 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] 'EFI' machine feature
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
X-List-Received-Date: Sat, 01 Feb 2014 16:44:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2014-01-23 at 13:17 +0100, Koen Kooi wrote:
> Hi,
> 

Hi Koen,

> While working on the ARM support for GRUB I noticed that the EFI support 
> in OE-core is a mess. A lot of it is due to GRUB insisting on its 
> byzantine config/install/skynet system and the rest is due to the 
> EFI==x86 assumption.

Some of the horrible not-really-native grub recipe wreakage was recently
improved. But it is still rather arcane, agreed. The x86-ism was just a
relic for that being where support was done first. So yes, all good
stuff to see improved.

> 
> To improve this I'd like to start with adding an 'efi' MACHINE_FEATURE, 
> which will:

There is an efi MACHINE_FEATURE - so you want to extend that one right?

> 
> * Mask non-EFI configs like grub-pc/grub-uboot

We need to be careful here. It is valid to build hybrid images which
support both EFI and legacy PC boot (for example). We do this now with
the EFI and PCBIOS MACHINE_FEATURES - see bootimg.bbclass. So on this
one point, I'd say no, don't mask them. You can make them need to
specify their own MACHINE_FEATURE though.

> * allow PACKAGECONFIG instead of distro/arch/machine overrides in grub2
> * Activate logic in image classes to create a GPT EFI System Partition

I'm not following this - but this isn't my area of expertise. How does
PACKAGECONFIG help us here?

Also, keep in mind that while good for use on the actual device, GPT is
problematic on disk images as the spec requirs the backup table on the
last LBA of the disk, so using a disk image of even a slightly different
size on a physical disk will result in irritating errors on boot. MSDOS
partition tables are better for disk images (unfortunatley).  GPT is
appropriate for tools like wic, however, which do deal with the physical
device.

> 
> Further steps to address EFI support would be:
> 
> * integrate gummiboot into OE-core (meta-intel has an old version)

Yes please. Take that recipe, bump the SRCREVs, and submit it to
oe-core. We've made some improvements to gummiboot recently for cross
compilation and such, it would be nice to see these incorporated.

> * deprecate grub-(not really)native

In favor of what? gummiboot? I'm all in favor of that!

> * create an efi bbclass that does the above ESP dance and knows how to 
> populate it further e.g. grub.cfg and bootloader-spec entries for gummiboot.

The bootimg.bbclass does something along these lines and abstracts the
various calls out to syslinux, grub, grub-efi, etc. Are you looking to
expand this, replace it.... ?

> * postinst magic to update bootloader config on kernel upgrade
> 
> Opinions/Flames/ACPI rants?
> 

Generally speaking, this looks like the right approach.

-- 
Darren Hart
Yocto Project - Linux Kernel
Intel Open Source Technology Center


