Return-Path: <dvhart@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 620AA61017
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2013 17:11:12 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 20 Sep 2013 10:08:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,945,1371106800"; d="scan'208";a="406528060"
Received: from unknown (HELO [10.255.15.50]) ([10.255.15.50])
	by orsmga002.jf.intel.com with ESMTP; 20 Sep 2013 10:11:09 -0700
Message-ID: <1379697069.23351.110.camel@dvhart-mobl4.amr.corp.intel.com>
From: Darren Hart <dvhart@linux.intel.com>
To: Jason Wessel <jason.wessel@windriver.com>
Date: Fri, 20 Sep 2013 10:11:09 -0700
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
X-List-Received-Date: Fri, 20 Sep 2013 17:11:14 -0000
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
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

So with these now upstream, I'm hitting the following after removing
NO_ISO="1" from the MinnowBoard machine config. Is anything missing?
Have you validated this is working for you after the merge?

ERROR: Function failed: build_iso (log file is located
at /build/yocto/master/minnow_20130223110941/build/tmp/work/minnow-poky-linux/core-image-sato/1.0-r0/temp/log.do_bootimg.26036)                                                                      ERROR: Logfile of failure stored in: /build/yocto/master/minnow_20130223110941/build/tmp/work/minnow-poky-linux/core-image-sato/1.0-r0/temp/log.do_bootimg.26036        Log data follows:                                                                   | DEBUG: Executing python function do_bootimg
| DEBUG: Executing python function build_grub_cfg
| DEBUG: Python function build_grub_cfg finished
| DEBUG: Executing shell function build_hddimg
| mkdosfs 2.11 (12 Mar 2005)
| DEBUG: Shell function build_hddimg finished
| DEBUG: Executing shell function build_iso
| NOTE: EFI-only ISO images are untested, please provide feedback.
|   4.89% done, estimate finish Fri Sep 20 09:36:57 2013
|   9.76% done, estimate finish Fri Sep 20 09:36:57 2013
|  14.65% done, estimate finish Fri Sep 20 09:36:57 2013
|  19.52% done, estimate finish Fri Sep 20 09:36:57 2013
|  24.40% done, estimate finish Fri Sep 20 09:36:57 2013
|  29.27% done, estimate finish Fri Sep 20 09:36:57 2013
|  34.16% done, estimate finish Fri Sep 20 09:36:57 2013
|  39.03% done, estimate finish Fri Sep 20 09:36:57 2013
|  43.92% done, estimate finish Fri Sep 20 09:36:57 2013
|  48.79% done, estimate finish Fri Sep 20 09:36:57 2013
|  53.67% done, estimate finish Fri Sep 20 09:36:57 2013
|  58.55% done, estimate finish Fri Sep 20 09:36:57 2013
|  63.43% done, estimate finish Fri Sep 20 09:36:57 2013
|  68.30% done, estimate finish Fri Sep 20 09:36:57 2013
|  73.19% done, estimate finish Fri Sep 20 09:36:57 2013
|  78.06% done, estimate finish Fri Sep 20 09:36:57 2013
|  82.95% done, estimate finish Fri Sep 20 09:36:57 2013
|  87.82% done, estimate finish Fri Sep 20 09:36:57 2013
|  92.70% done, estimate finish Fri Sep 20 09:36:57 2013
|  97.57% done, estimate finish Fri Sep 20 09:36:57 2013
| Total translation table size: 0
| Total rockridge attributes bytes: 1095
| Total directory bytes: 4096
| Path table size(bytes): 34
| Max brk space used 0
| 102490 extents written (200 MB)
|
isohybrid: /build/yocto/master/minnow_20130223110941/build/tmp/deploy/images/minnow/core-image-sato-minnow-20130920155947.iso: could not find boot record
|
WARNING: /build/yocto/master/minnow_20130223110941/build/tmp/work/minnow-poky-linux/core-image-sato/1.0-r0/temp/run.build_iso.26036:1 exit 1 from
|
isohybrid /build/yocto/master/minnow_20130223110941/build/tmp/deploy/images/minnow/core-image-sato-minnow-20130920155947.iso
| DEBUG: Python function do_bootimg finished
| ERROR: Function failed: build_iso (log file is located
at /build/yocto/master/minnow_20130223110941/build/tmp/work/minnow-poky-linux/core-image-sato/1.0-r0/temp/log.do_bootimg.26036)
ERROR: Task 8
(/build/yocto/master/minnow_20130223110941/poky/meta/recipes-sato/images/core-image-sato.bb, do_bootimg) failed with exit code '1'



-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel



