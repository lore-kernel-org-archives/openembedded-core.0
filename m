Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id E08A5606D0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jun 2016 08:26:50 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 27 Jun 2016 01:26:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,536,1459839600"; d="scan'208";a="1005790810"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 27 Jun 2016 01:26:51 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.68])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 33E746A4006;
	Mon, 27 Jun 2016 01:26:46 -0700 (PDT)
Date: Mon, 27 Jun 2016 11:26:41 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Fabio Berton <fabio.berton@ossystems.com.br>
Message-ID: <20160627082633.GA21051@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <CAAPZna2Gu=QZ-mFn1FPaq3HfNSbSXhFPafWWY_FQTU+OO6e-1w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAPZna2Gu=QZ-mFn1FPaq3HfNSbSXhFPafWWY_FQTU+OO6e-1w@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: WIC error when using rawcopy
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
X-List-Received-Date: Mon, 27 Jun 2016 08:26:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Fabio,

I'll try to reproduce and fix it. Can you create bug in yocto bugzilla
to better track this?

Regards,
Ed

On Fri, Jun 24, 2016 at 11:07:16AM -0300, Fabio Berton wrote:
> Hi all!
> 
> I'm getting one error when trying to make an image using wic.
> My wks file is:
> 
> 
> part u-boot --source rawcopy --sourceparams="file=u-boot.imx" --ondisk
> mmcblk --no-table --align 1
> part /boot --source bootimg-partition --ondisk mmcblk0 --fstype=vfat
> --label boot --align 8192 --size 25M --extra-space 0
> part / --source rootfs --ondisk mmcblk0 --fstype=ext4 --label system --size
> 512M --align 8192 --extra-space 0
> part / --size 512M --ondisk mmcblk0 --align 8192 --extra-space 0
> 
> bootloader --ptable msdos
> 
> 
> and when building an image I get error:
> 
> Log data follows:
> | DEBUG: Executing python function set_image_size
> | DEBUG: Python function set_image_size finished
> | DEBUG: Executing shell function do_image_wic
> | Error: exec_cmd: dd
> if=/home/user/src/prj/build/tmp/deploy/images/nitrogen6x/core-image-minimal-nitrogen6x-20160624134453/build/u-boot.imx
> of=/home/user/src/prj/build/tmp/deploy/images/nitrogen6x/core-image-minimal-nitrogen6x-20160624134453/build/core-image-201606241045-mmcblk.direct
> bs=512 seek=2 count=942 conv=notrunc returned '1' instead of 0
> | Checking basic build environment...
> | Done.
> |
> | Creating image(s)...
> |
> | WARNING:
> /home/user/src/prj/build/tmp/work/nitrogen6x-prj-linux-gnueabi/core-image-minimal/1.0-r0/temp/run.do_image_wic.31619:1
> exit 1 from 'BUILDDIR="/home/user/src/prj/build" wic create "$wks" --vars
> "/home/user/src/prj/build/tmp/sysroots/nitrogen6x/imgdata/" -e
> "core-image-minimal" -o "$out/"'
> 
> 
> If I remove line:
> part u-boot --source rawcopy --sourceparams="file=u-boot.imx" --ondisk
> mmcblk --no-table --align 1
> 
> image builds fine, so I think the problem it's on rawcopy.
> 
> After I run bitbake and execution fail, I cd to wic build directory
> deploy/images/nitrogen6x/core-image-minimal-nitrogen6x-20160624135131/build
> and u-boot.imx is not in this dir.
> 
> Can you help me on this? I'm using krogoth branch.
> 
> Regards,
> 
> Fabio

> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


-- 
--
Regards,
Ed

