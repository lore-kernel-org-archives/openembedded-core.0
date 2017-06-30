Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6D9DE77A2C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jun 2017 20:38:55 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Jun 2017 13:38:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,288,1496127600"; d="scan'208";a="987377291"
Received: from mmagdale-mobl1.amr.corp.intel.com (HELO [10.252.254.211])
	([10.252.254.211])
	by orsmga003.jf.intel.com with ESMTP; 30 Jun 2017 13:38:55 -0700
To: Patrick Ohly <patrick.ohly@intel.com>
References: <20170630175330.33908-1-alejandro.hernandez@linux.intel.com>
	<1498848221.5259.13.camel@intel.com>
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Message-ID: <c36489e7-90fa-ebc5-afac-6a56525e2f35@linux.intel.com>
Date: Fri, 30 Jun 2017 15:38:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.0
MIME-Version: 1.0
In-Reply-To: <1498848221.5259.13.camel@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bootimg-efi.py: Use IMGDEPLOYDIR instead of DEPLOY_DIR_IMAGE for initrd
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
X-List-Received-Date: Fri, 30 Jun 2017 20:38:55 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hey Patrick,


On 06/30/2017 01:43 PM, Patrick Ohly wrote:
> On Fri, 2017-06-30 at 10:53 -0700, Alejandro Hernandez wrote:
>> When using wic to create an image from a certain build, wic is expecting
>> to find initrd at the final destination of our images (DEPLOY_DIR_IMAGE),
>> which is wrong, since the initrd file has not been copied to the final
>> directory yet, so instead of trying to use an initrd file from
>> DEPLOY_DIR_IMAGE we get it from IMGDEPLOYDIR, which is the directory
>> where the resulting images are placed before their final destination,
>> and its where we can find the correct initrd file for our image.
> Can you give an example with some real image and initramfs recipe where
> this works? In other words, provide an example where the old behavior
> fails and the new one works?
Sure, so the problem comes when you add "wic" to IMAGE_FSTYPES (which is 
not default for core-image-minimal nor core-image-minimal-initramfs).
If you do this, do_image_wic will be executed automatically, and if it 
tries to use foo.cpio.gz file as initrd, it will fail to find it on
DEPLOY_DIR_IMAGE (unless a previous build was completed without 
executing do_image_wic) since this file is still on IMGDEPLOYDIR and hasnt
been copied to DEPLOY_DIR_IMAGE yet.

So a real example on real hardware:

if you build:
DISTRO="poky-tiny"
MACHINE="intel-corei7-64"
bitbake core-image-tiny-initramfs

You'll get an error stating that the foo.cpio.gz file cant be found.

I did a build for both core-image-minimal and 
core-image-minimal-initramfs and I dont see how theyre affected, the 
necessary files are
on IMGDEPLOYDIR in both cases as well.

>
> When using core-image-minimal and core-image-minimal-initramfs, then
> both have different IMGDEPLOYDIRs, therefore code in core-image-minimal
> can only find the .cpio.gz in the DEPLOY_DIR_IMAGE. So to me, the
> current approach seems correct.
>


