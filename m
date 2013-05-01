Received: from r-finger.com ([178.79.160.5])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tf+lists.yocto@r-finger.com>) id 1UXeH6-0000EQ-Ma
	for openembedded-core@lists.openembedded.org;
	Wed, 01 May 2013 23:09:19 +0200
Received: from [192.168.0.2] (host86-131-182-26.range86-131.btcentralplus.com
	[86.131.182.26]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by r-finger.com (Postfix) with ESMTPSA id 402349528;
	Wed,  1 May 2013 21:51:26 +0100 (BST)
Message-ID: <5181804D.1010800@r-finger.com>
Date: Wed, 01 May 2013 21:51:25 +0100
From: Tomas Frydrych <tf+lists.yocto@r-finger.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.5) Gecko/20120624 Icedove/10.0.5
MIME-Version: 1.0
To: Darren Hart <dvhart@linux.intel.com>
References: <1367439862-4658-1-git-send-email-tf+lists.yocto@r-finger.com>
	<51817B44.30702@linux.intel.com>
In-Reply-To: <51817B44.30702@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] image_types: fix default location of kernel when generating elf images
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 May 2013 21:09:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/05/13 21:29, Darren Hart wrote:
> 
> 
> On 05/01/2013 01:24 PM, tf+lists.yocto@r-finger.com wrote:
>> From: Tomas Frydrych <tomas@sleepfive.com>
>>
>> The kernel is now located in DEPLOY_DIR_IMAGE rather than sysroot.
>>
>> Signed-off-by: Tomas Frydrych <tomas@sleepfive.com>
>> ---
>>  meta/classes/image_types.bbclass |    2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
>> index 98d31f5..0e1ad3a 100644
>> --- a/meta/classes/image_types.bbclass
>> +++ b/meta/classes/image_types.bbclass
>> @@ -185,7 +185,7 @@ IMAGE_CMD_cpio () {
>>  	cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio)
>>  }
>>  
>> -ELF_KERNEL ?= "${STAGING_DIR_HOST}/kernel/${KERNEL_IMAGETYPE}"
>> +ELF_KERNEL ?= "${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}-${MACHINE}.bin"
> 
> 
> Looks correct, how did this fail before? What was the symptom?

e.g.,

| Cannot open `...../tmp/sysroots/nuc/kernel/bzImage': (null)

Two bugs really, the location has changed, and it was using a kernel
that is not machine-specific. I'll make a patch with better commit
message tomorrow.

Tomas

-- 
http://sleepfive.com


