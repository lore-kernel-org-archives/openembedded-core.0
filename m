Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QPhx0-0008Na-5f
	for openembedded-core@lists.openembedded.org;
	Thu, 26 May 2011 23:18:39 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 26 May 2011 14:15:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,276,1304319600"; 
   d="scan'208";a="5546148"
Received: from unknown (HELO [10.255.12.104]) ([10.255.12.104])
	by orsmga001.jf.intel.com with ESMTP; 26 May 2011 14:15:32 -0700
Message-ID: <4DDEC2F4.1000500@linux.intel.com>
Date: Thu, 26 May 2011 14:15:32 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Joshua Lock <josh@linux.intel.com>
References: <cover.1306218459.git.sgw@linux.intel.com>			<53e096ed690901bafdc3087b1591db60d16c6d0b.1306218459.git.sgw@linux.intel.com>			<1306433070.1777.7.camel@vorpal.jf.intel.com>			<4DDE9BC8.8000008@linux.intel.com>		
	<1306439668.1777.10.camel@vorpal.jf.intel.com>		
	<4DDEBE38.8090203@linux.intel.com>	
	<1306443683.5911.1.camel@vorpal.jf.intel.com>	
	<4DDEC006.30701@linux.intel.com>
	<1306444434.5911.4.camel@vorpal.jf.intel.com>
In-Reply-To: <1306444434.5911.4.camel@vorpal.jf.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC 1/2] IMAGE_ROOTFS_SIZE Cleanup
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
X-List-Received-Date: Thu, 26 May 2011 21:18:39 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/26/2011 02:13 PM, Joshua Lock wrote:
> On Thu, 2011-05-26 at 14:03 -0700, Darren Hart wrote:
>>
>> On 05/26/2011 02:01 PM, Joshua Lock wrote:
>>> On Thu, 2011-05-26 at 13:55 -0700, Darren Hart wrote:
>>>>
>>>> On 05/26/2011 12:54 PM, Joshua Lock wrote:
>>>>> On Thu, 2011-05-26 at 11:28 -0700, Saul Wold wrote:
>>>>>> On 05/26/2011 11:04 AM, Joshua Lock wrote:
>>>>>>> On Mon, 2011-05-23 at 23:38 -0700, Saul Wold wrote:
>>>>>>>> This basic cleanup removes the _ext2/3 overrides from places they
>>>>>>>> no longer belong since they did not allow further overrides. In doing
>>>>>>>> this the core-image-minimal* recipes can now set a reasonably small
>>>>>>>> rootfs so that it's a realistic size for minimal.
>>>>>>>
>>>>>>> Awesome. Thanks for tackling this!
>>>>>>>
>>>>>>> Few questions below.
>>>>>>>
>>>>>>>>
>>>>>>>> The new default for minimal is 8M and will be adujsted upward by the
>>>>>>>> IMAGE_OVERHEAD_FACTOR (of 1.2).
>>>>>>>>
>>>>>>>> This fixes the ROOTFS_SIZE usage in the IMAGE_CMD_<fstype>   code
>>>>>>>>
>>>>>>>> Signed-off-by: Saul Wold<sgw@linux.intel.com>
>>>>>>>> ---
>>>>>>>>    meta/classes/image_types.bbclass                   |    7 +++++--
>>>>>>>>    meta/conf/distro/include/default-distrovars.inc    |    2 --
>>>>>>>>    meta/conf/machine/include/qemu.inc                 |    2 --
>>>>>>>>    .../images/core-image-minimal-initramfs.bb         |    2 ++
>>>>>>>>    meta/recipes-core/images/core-image-minimal.bb     |    2 ++
>>>>>>>>    5 files changed, 9 insertions(+), 6 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
>>>>>>>> index ec0cafd..69f859e 100644
>>>>>>>> --- a/meta/classes/image_types.bbclass
>>>>>>>> +++ b/meta/classes/image_types.bbclass
>>>>>>>> @@ -21,22 +21,25 @@ runimagecmd () {
>>>>>>>>    }
>>>>>>>>
>>>>>>>>    IMAGE_CMD_jffs2 = "mkfs.jffs2 --root=${IMAGE_ROOTFS} --faketime --output=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 ${EXTRA_IMAGECMD}"
>>>>>>>> +
>>>>>>>>    IMAGE_CMD_cramfs = "mkcramfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cramfs ${EXTRA_IMAGECMD}"
>>>>>>>> +
>>>>>>>>    IMAGE_CMD_ext2 = "genext2fs -b $ROOTFS_SIZE -d ${IMAGE_ROOTFS} ${EXTRA_IMAGECMD} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext2"
>>>>>>>>    IMAGE_CMD_ext2.gz () {
>>>>>>>>    	rm -rf ${DEPLOY_DIR_IMAGE}/tmp.gz&&   mkdir ${DEPLOY_DIR_IMAGE}/tmp.gz
>>>>>>>> -	genext2fs -b ${IMAGE_ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${EXTRA_IMAGECMD} ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext2
>>>>>>>> +	genext2fs -b $ROOTFS_SIZE -d ${IMAGE_ROOTFS} ${EXTRA_IMAGECMD} ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext2
>>>>>>>>    	gzip -f -9 ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext2
>>>>>>>>    	mv ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext2.gz ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext2.gz
>>>>>>>>    	rmdir ${DEPLOY_DIR_IMAGE}/tmp.gz
>>>>>>>>    }
>>>>>>>> +
>>>>>>>>    IMAGE_CMD_ext3 () {
>>>>>>>>    	genext2fs -b $ROOTFS_SIZE -d ${IMAGE_ROOTFS} ${EXTRA_IMAGECMD} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3
>>>>>>>>    	tune2fs -j ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3
>>>>>>>>    }
>>>>>>>>    IMAGE_CMD_ext3.gz () {
>>>>>>>>    	rm -rf ${DEPLOY_DIR_IMAGE}/tmp.gz&&   mkdir ${DEPLOY_DIR_IMAGE}/tmp.gz
>>>>>>>> -	genext2fs -b ${IMAGE_ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${EXTRA_IMAGECMD} ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext3
>>>>>>>> +	genext2fs -b $ROOTFS_SIZE -d ${IMAGE_ROOTFS} ${EXTRA_IMAGECMD} ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext3
>>>>>>>>    	tune2fs -j ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext3
>>>>>>>>    	gzip -f -9 ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext3
>>>>>>>>    	mv ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext3.gz ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3.gz
>>>>>>>> diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
>>>>>>>> index 1aa45c8..4b68a0a 100644
>>>>>>>> --- a/meta/conf/distro/include/default-distrovars.inc
>>>>>>>> +++ b/meta/conf/distro/include/default-distrovars.inc
>>>>>>>> @@ -1,7 +1,5 @@
>>>>>>>>    QA_LOGFILE = "${TMPDIR}/qa.log"
>>>>>>>>
>>>>>>>> -IMAGE_ROOTFS_SIZE_ext2 ?= "131072"
>>>>>>>> -
>>>>>>>>    OEINCLUDELOGS ?= "yes"
>>>>>>>>    KERNEL_CONSOLE ?= "ttyS0"
>>>>>>>>
>>>>>>>> diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/include/qemu.inc
>>>>>>>> index 4122a88..9ef242f 100644
>>>>>>>> --- a/meta/conf/machine/include/qemu.inc
>>>>>>>> +++ b/meta/conf/machine/include/qemu.inc
>>>>>>>> @@ -6,8 +6,6 @@ MACHINE_FEATURES = "kernel26 apm alsa pcmcia bluetooth irda usbgadget screen"
>>>>>>>>    IMAGE_FSTYPES ?= "tar.bz2 ext3"
>>>>>>>>
>>>>>>>>    ROOT_FLASH_SIZE = "280"
>>>>>>>> -IMAGE_ROOTFS_SIZE_ext2 ?= "280000"
>>>>>>>> -IMAGE_ROOTFS_SIZE_ext3 ?= "280000"
>>>>>>>>
>>>>>>>>    # Don't include kernels in standard images
>>>>>>>>    RDEPENDS_kernel-base = ""
>>>>>>>> diff --git a/meta/recipes-core/images/core-image-minimal-initramfs.bb b/meta/recipes-core/images/core-image-minimal-initramfs.bb
>>>>>>>> index 21aaa6c..3246d5c 100644
>>>>>>>> --- a/meta/recipes-core/images/core-image-minimal-initramfs.bb
>>>>>>>> +++ b/meta/recipes-core/images/core-image-minimal-initramfs.bb
>>>>>>>> @@ -8,3 +8,5 @@ IMAGE_LINGUAS = ""
>>>>>>>>    LICENSE = "MIT"
>>>>>>>>
>>>>>>>>    inherit core-image
>>>>>>>> +
>>>>>>>> +IMAGE_ROOTFS_SIZE = "8192"
>>>>>>>
>>>>>>> I'm not really sure about this, an initramfs that's the same size as a
>>>>>>> more fully featured rootfs?
>>>>>>>
>>>>>> That may be, then we need to increase the size slightly, but this will
>>>>>> trigger the correct behavior of actual size * IMAGE_OVERHEAD_FACTOR,
>>>>>> rather than the 64M which would be the default, this was to ensure it
>>>>>> could get smaller.  I don't have a current initramfs size, I will build
>>>>>> and verify.
>>>>>>
>>>>>>
>>>>>>>> diff --git a/meta/recipes-core/images/core-image-minimal.bb b/meta/recipes-core/images/core-image-minimal.bb
>>>>>>>> index aa00e67..743e121 100644
>>>>>>>> --- a/meta/recipes-core/images/core-image-minimal.bb
>>>>>>>> +++ b/meta/recipes-core/images/core-image-minimal.bb
>>>>>>>> @@ -9,5 +9,7 @@ LICENSE = "MIT"
>>>>>>>>
>>>>>>>>    inherit core-image
>>>>>>>>
>>>>>>>> +IMAGE_ROOTFS_SIZE = "8192"
>>>>>>>> +
>>>>>>>
>>>>>>> In your cover letter you stated that the minimal image is currently
>>>>>>> 9.9M, which means we *need* the overhead to contain the entire image
>>>>>>> contents. Correct? That seems a little unwise.
>>>>>>>
>>>>>> Right, that's currently, we want to see the image get smaller even, so
>>>>>> the 8M is an appropriate setting.  Currently the actual ext3 image is
>>>>>> 13M with 10M of contents.
>>>>>>
>>>>>> So are you suggested that the 8M size is unwise or the overhead, not
>>>>>> sure I am catching your meaning here.
>>>>>
>>>>> I'm just nervous about relying on the overhead, what if someone sets it
>>>>> lower and then the image doesn't fit?
>>>>>
>>>>> Having the goal of a smaller minimal image is good but in my opinion we
>>>>> should adjust the rootfs size when the image is smaller, not before.
>>>>
>>>> Every argument I've heard in favor of the IMAGE_OVERHEAD was centered
>>>> around ensuring there is enough space for the user to actually use the
>>>> system after it was installed and booted. Using this single metric to
>>>> try and both make up for oversized images and provide space for user
>>>> data seems like to cause maintenance issues going forward.
>>>>
>>>> While our goal should be to reduce the image size, the default image
>>>> size in the recipes should default to the largest of the images built
>>>> for the supported machines. The overhead should be used strictly for
>>>> user data.
>>>>
>>>
>>> So it turns out that if IMAGE_ROOTFS is smaller than the contents the
>>> size of the contents is used. Once this if test has been performed the
>>> overhead factor is applied.
>>
>> Ah Good!
>>
>>>
>>> I found this to be a tad confusing (hence all the back and forth here)
>>> so have filed a documentation bug about it:
>>> http://bugzilla.pokylinux.org/show_bug.cgi?id=1110
>>>
>>> Maybe we can have some comments in the code near where those variables
>>> are set too?
>>>
>>
>> Yeah, this wasn't clear to me either. And my question in 2/2 still
>> stands - what is the goal of the overhead factor?
>>
>
> My understanding is that it's for system overhead such as postinstalls
> whereas ROOTFS_IMAGE_EXTRA_SPACE is for user and data space that you
> want above the standard image size.
>
Correct

> So if you want to ensure all of your images have 2GB space for data
> you'd set the ROOTFS_IMAGE_EXTRA_SPACE to 2GB.
>
That's one way, another is if you want all your images to be 2G 
including the core contents set ROOTFS_IMAGE_SIZE to 2G and the images 
will all be 2G (remember to set in K, since we don't parse the M or G).

Sau!


> Cheers,
> Joshua


