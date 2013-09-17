Return-Path: <dvhart@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4B4166C894
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2013 22:33:37 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 17 Sep 2013 15:33:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,926,1371106800"; d="scan'208";a="379732307"
Received: from dvhart-mobl4.jf.intel.com (HELO [10.7.201.59]) ([10.7.201.59])
	by orsmga001.jf.intel.com with ESMTP; 17 Sep 2013 15:33:36 -0700
Message-ID: <1379457214.4438.70.camel@dvhart-mobl4.amr.corp.intel.com>
From: Darren Hart <dvhart@linux.intel.com>
To: Jason Wessel <jason.wessel@windriver.com>
Date: Tue, 17 Sep 2013 15:33:34 -0700
In-Reply-To: <1379424738-16798-1-git-send-email-jason.wessel@windriver.com>
References: <1379424738-16798-1-git-send-email-jason.wessel@windriver.com>
Organization: Intel
X-Mailer: Evolution 3.8.5 (3.8.5-2.fc19) 
Mime-Version: 1.0
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: [v3 PATCH 0/9] Improved EFI boot support
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
X-List-Received-Date: Tue, 17 Sep 2013 22:33:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-09-17 at 08:32 -0500, Jason Wessel wrote:
> V3
> - Add comment about isolinux.bin required in EFI only case
> - Fix typo of PCIBIOS -> PCBIOS
> - Change COMPRESSISO ?= "" -> COMPRESSISO ?= "0" for the default
> - Add comment to EFI/ISO syslinux.bbclass to clarify workaround
>   with EFI only case and hybrid boot
> - Add patch to fix syslinux serial and menu problems
> - Add patch to fix boot-directdisk.bbclass
> * Two new patches are 7 & 8, the zisofs patch moved from 7 -> 9
> 

It looks good to me, but I would like to see Saul and Martin review the
direct disk modifications.

Reviewed-by: Darren Hart <dvhart@linux.intel.com>

--
Darren

> 
> V2
> - Added reference to YOCTO #1913 for per Darren
> - Remove PR number from cdrtools uprev
> - Added Saul's change to cdrtools to get rid of STAGE_TEMP
> - made the builtin grub cfg file copied from a SRC_URI
> - upreved syslinux to 6.01
> - Use the new isohybrid command from syslinux which can now
>   generate EFI enabled ISO's which can boot directly when
>   dd'ed to a USB or HDD device.
> - Dropped any references to efi or pcbios in the qemu* configs
> - Added the zisofs patch to the end of the series instead
>   of depending on it, in case it is dropped later.
> - git -format-patch -M20% is your friend for seeing the
>   delta on recipe upgrades :-)
> 
> YAY, with the new version of syslinux it is now possible to
> build a single live ISO image which can boot in legacy mode
> or EFI on optical media or USB devices.
> 
> We still have to create 2 ISO's one for 32bit EFI systems and one for
> 64bit EFI systems but this is also true of all other Linux
> distributions today as well.
> 
> Jason.
> 
> ---
> 
> The goal of this patch set is to put the EFI ISO boot method on par
> with the ISO PCBIOS boot method.  This also allows for the creation of
> a single ISO image which can boot in "legacy boot" mode or EFI boot
> mode.
> 
> In order to make this possible the cdrtools needed an update to the
> very latest and this brings in an license change.  Given that change
> it was not entirely clear to me if we needed to leave the older
> package around.  I opted to remove the older package recipe since
> there was no clean way to fail in the case you wanted to build EFI
> boot media.
> 
> The bbnote that was previously in the bootimg.bbclass about EFI only
> media being untested was a bit of an understatement, as the images
> would not even build without errors due to the call to isohybrid.  I
> removed any such warnings because that path has been fully vetted now.
> 
> Cheers,
> Jason.
> 
> 
> ----------------------------------------------------------------

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel



