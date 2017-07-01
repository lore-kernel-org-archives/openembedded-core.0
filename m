Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 12C4871D9C
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Jul 2017 21:48:42 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Jul 2017 14:48:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,294,1496127600"; d="scan'208";a="987690956"
Received: from mmagdale-mobl1.amr.corp.intel.com (HELO [10.252.254.211])
	([10.252.254.211])
	by orsmga003.jf.intel.com with ESMTP; 01 Jul 2017 14:48:42 -0700
To: Patrick Ohly <patrick.ohly@intel.com>
References: <20170630175330.33908-1-alejandro.hernandez@linux.intel.com>
	<1498848221.5259.13.camel@intel.com>
	<c36489e7-90fa-ebc5-afac-6a56525e2f35@linux.intel.com>
	<1498921790.5259.34.camel@intel.com>
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Message-ID: <6aef97ed-8284-039a-c780-c5b01ee8fe1a@linux.intel.com>
Date: Sat, 1 Jul 2017 16:48:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.0
MIME-Version: 1.0
In-Reply-To: <1498921790.5259.34.camel@intel.com>
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
X-List-Received-Date: Sat, 01 Jul 2017 21:48:43 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 07/01/2017 10:09 AM, Patrick Ohly wrote:
> On Fri, 2017-06-30 at 15:38 -0500, Alejandro Hernandez wrote:
>> Hey Patrick,
>>
>>
>> On 06/30/2017 01:43 PM, Patrick Ohly wrote:
>>> On Fri, 2017-06-30 at 10:53 -0700, Alejandro Hernandez wrote:
>>>> When using wic to create an image from a certain build, wic is expecting
>>>> to find initrd at the final destination of our images (DEPLOY_DIR_IMAGE),
>>>> which is wrong, since the initrd file has not been copied to the final
>>>> directory yet, so instead of trying to use an initrd file from
>>>> DEPLOY_DIR_IMAGE we get it from IMGDEPLOYDIR, which is the directory
>>>> where the resulting images are placed before their final destination,
>>>> and its where we can find the correct initrd file for our image.
>>> Can you give an example with some real image and initramfs recipe where
>>> this works? In other words, provide an example where the old behavior
>>> fails and the new one works?
>> Sure, so the problem comes when you add "wic" to IMAGE_FSTYPES (which is
>> not default for core-image-minimal nor core-image-minimal-initramfs).
>> If you do this, do_image_wic will be executed automatically, and if it
>> tries to use foo.cpio.gz file as initrd, it will fail to find it on
>> DEPLOY_DIR_IMAGE (unless a previous build was completed without
>> executing do_image_wic) since this file is still on IMGDEPLOYDIR and hasnt
>> been copied to DEPLOY_DIR_IMAGE yet.
>>
>> So a real example on real hardware:
>>
>> if you build:
>> DISTRO="poky-tiny"
>> MACHINE="intel-corei7-64"
>> bitbake core-image-tiny-initramfs
>>
>> You'll get an error stating that the foo.cpio.gz file cant be found.
> Just for completeness, foo.cpio.gz =
> core-image-tiny-initramfs-intel-corei7-64.cpio.gz, which is the
> initramfs image produced by the recipe itself.
Correct
>
> Is it really intended that do_image_wic runs for
> core-image-tiny-initramfs? How and where is the output of
> core-image-tiny-initramfs used?
Yes, do_image_wic is intended to run automatically, hence why wic was 
added to IMAGE_FSTYPES
I'm not sure I understand what you mean by the second question, but the 
output is just as in any other image
a .wic file, cpio.gz file, kernel, etc., where? at the DEPLOY_DIR_IMAGE 
directory, again just like in any other image
>
>  From the DESCRIPTION:
>
>          core-image-tiny-initramfs doesn't actually generate an image but
>          rather generates boot and rootfs artifacts into a common
>          location that can subsequently be picked up by external image
>          generation tools such as wic.
This is the old description, when it was though that we would have a common
artifacts directory, which never happened due to some changes in wic 
last year
after which it was decided that core-image-tiny-initramfs would generate 
the artifacts
AND a wic image.
>
> If core-image-tiny-initramfs is meant to produce an initramfs, similar
> to core-image-minimal-initramfs, then it shouldn't use "wic" in its
> IMAGE_FSTYPES. Currently "wic" is listed:
>
> # don't actually generate an image, just the artifacts needed for one
> IMAGE_FSTYPES = "${INITRAMFS_FSTYPES} wic"
Again, old description, wic should be there.
>
> Does the recipe still work as intended without your patch when you
> remove wic here?
The answer would be yes and no; "yes" it does generate the boot 
artifacts if wic isnt listed,
but since wic should be in IMAGE_FSTYPES, then "no", because it fails to 
generate an image, which
is what the recipe intends to do.
>
>> I did a build for both core-image-minimal and
>> core-image-minimal-initramfs and I dont see how theyre affected, the
>> necessary files are
>> on IMGDEPLOYDIR in both cases as well.
> Are you sure that core-image-minimal copies an initrd in bootimg-efi.py?
> It checks source_params, but systemd-bootdisk.wks does not specify an
> initrd in its sourceparams:
>
> part /boot --source bootimg-efi --sourceparams="loader=systemd-boot"
> --ondisk sda --label msdos --active --align 1024
Exactly, they dont specify an initrd so for starters they dont need to 
copy an initrd if its not specified
>
> That's different for the systemd-bootdisk-tiny64.wks that is used for
> core-image-tiny-initramfs, which has:
>
> part /boot --source bootimg-efi
> --sourceparams="loader=systemd-boot,initrd=core-image-tiny-initramfs-intel-corei7-64.cpio.gz" --ondisk sda --label msdos --active --align 1024
>
> I still think your patch breaks images which use the initrd parameter to
> reference an initrd produced by some other recipe.
I see your point, if an initrd is produced by some other recipe it'd be 
somewhere else, but at the same time, what if an initrd is produced by 
the image recipe itself?, like in this case
>


