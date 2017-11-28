Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 8B59660720
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Nov 2017 06:00:13 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Nov 2017 22:00:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,467,1505804400"; d="scan'208";a="1249330743"
Received: from aaroned-mobl.amr.corp.intel.com (HELO [10.252.250.55])
	([10.252.250.55])
	by fmsmga002.fm.intel.com with ESMTP; 27 Nov 2017 22:00:14 -0800
To: wenzong fan <wenzong.fan@windriver.com>,
	openembedded-core@lists.openembedded.org
References: <20170915182244.27986-1-alejandro.hernandez@linux.intel.com>
	<697a752f-f550-55b3-951e-042c8e779d6a@windriver.com>
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Message-ID: <9fb2ff4c-3a9f-4c9f-44ff-c0a78cf619df@linux.intel.com>
Date: Tue, 28 Nov 2017 00:00:13 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <697a752f-f550-55b3-951e-042c8e779d6a@windriver.com>
Subject: Re: [PATCH] core-image-tiny-initramfs: initramfs recipes should not generate an actual image file
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
X-List-Received-Date: Tue, 28 Nov 2017 06:00:14 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hey Wenzong,

If you are using an Intel NUC, there is a recipe in meta-intel which is 
called core-image-tiny (not initramfs), that one is exactly what you are 
asking for, it builds the core-image-tiny-initramfs and then 
automatically creates a WIC image, which would be something similar to 
manually building core-image-tiny-initramfs and then doing:

$ wic create core-image-tiny -e core-image-tiny-initramfs


Hope that helps!


Alejandro



On 11/27/2017 09:29 PM, wenzong fan wrote:
> Hi Alex,
>
> Do you have a case that generating an image with wic + tiny initramfs? 
> If so could you please show me that?
>
> I tried to create an image with below commands directly, I'm not sure 
> if this is a proper test case:
> $ wic create mkefidisk -e core-image-tiny-initramfs
>
> While I booting it with USB + Intel NUC, it hangs at finding rootfs.
>
> Thanks
> Wenzong
>
> On 09/16/2017 02:22 AM, Alejandro Hernandez wrote:
>> core-image-tiny-initramfs was used to generate a wic image, which was 
>> conceptually wrong
>> since initrafms recipes should only generate the boot artifacts that 
>> can later be used
>> by another recipe to generate an image using the tool of their choice.
>>
>> Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
>> ---
>>   meta/recipes-core/images/core-image-tiny-initramfs.bb | 7 +++----
>>   1 file changed, 3 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta/recipes-core/images/core-image-tiny-initramfs.bb 
>> b/meta/recipes-core/images/core-image-tiny-initramfs.bb
>> index 184727ddf7a..a8893d1e53e 100644
>> --- a/meta/recipes-core/images/core-image-tiny-initramfs.bb
>> +++ b/meta/recipes-core/images/core-image-tiny-initramfs.bb
>> @@ -1,10 +1,9 @@
>>   # Simple initramfs image artifact generation for tiny images.
>>   DESCRIPTION = "Tiny image capable of booting a device. The kernel 
>> includes \
>>   the Minimal RAM-based Initial Root Filesystem (initramfs), which 
>> finds the \
>> -first 'init' program more efficiently. core-image-tiny-initramfs 
>> doesn't \
>> +first 'init' program more efficiently. core-image-tiny-initramfs 
>> doesn't \
>>   actually generate an image but rather generates boot and rootfs 
>> artifacts \
>> -into a common location that can subsequently be picked up by 
>> external image \
>> -generation tools such as wic."
>> +that can subsequently be picked up by external image generation 
>> tools such as wic."
>>     PACKAGE_INSTALL = "initramfs-live-boot packagegroup-core-boot 
>> dropbear ${VIRTUAL-RUNTIME_base-utils} udev base-passwd 
>> ${ROOTFS_BOOTSTRAP_INSTALL}"
>>   @@ -17,7 +16,7 @@ IMAGE_LINGUAS = ""
>>   LICENSE = "MIT"
>>     # don't actually generate an image, just the artifacts needed for 
>> one
>> -IMAGE_FSTYPES = "${INITRAMFS_FSTYPES} wic"
>> +IMAGE_FSTYPES = "${INITRAMFS_FSTYPES}"
>>     inherit core-image
>>


