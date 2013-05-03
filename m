Received: from r-finger.com ([178.79.160.5])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tf+lists.yocto@r-finger.com>) id 1UYF51-0006nO-LR
	for openembedded-core@lists.openembedded.org;
	Fri, 03 May 2013 14:27:17 +0200
Received: from [192.168.0.2] (host86-137-88-6.range86-137.btcentralplus.com
	[86.137.88.6]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by r-finger.com (Postfix) with ESMTPSA id A7A2E9528;
	Fri,  3 May 2013 13:09:22 +0100 (BST)
Message-ID: <5183A8F1.1080702@r-finger.com>
Date: Fri, 03 May 2013 13:09:21 +0100
From: Tomas Frydrych <tf+lists.yocto@r-finger.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.5) Gecko/20120624 Icedove/10.0.5
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1367439862-4658-1-git-send-email-tf+lists.yocto@r-finger.com>
	<51817B44.30702@linux.intel.com>
	<5181804D.1010800@r-finger.com> <1367581840.5379.153.camel@ted>
In-Reply-To: <1367581840.5379.153.camel@ted>
Cc: Darren Hart <dvhart@linux.intel.com>,
	openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Fri, 03 May 2013 12:27:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/05/13 12:50, Richard Purdie wrote:
> On Wed, 2013-05-01 at 21:51 +0100, Tomas Frydrych wrote:
>> On 01/05/13 21:29, Darren Hart wrote:
>>>
>>>
>>> On 05/01/2013 01:24 PM, tf+lists.yocto@r-finger.com wrote:
>>>> From: Tomas Frydrych <tomas@sleepfive.com>
>>>>
>>>> The kernel is now located in DEPLOY_DIR_IMAGE rather than sysroot.
>>>>
>>>> Signed-off-by: Tomas Frydrych <tomas@sleepfive.com>
>>>> ---
>>>>  meta/classes/image_types.bbclass |    2 +-
>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
>>>> index 98d31f5..0e1ad3a 100644
>>>> --- a/meta/classes/image_types.bbclass
>>>> +++ b/meta/classes/image_types.bbclass
>>>> @@ -185,7 +185,7 @@ IMAGE_CMD_cpio () {
>>>>  	cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio)
>>>>  }
>>>>  
>>>> -ELF_KERNEL ?= "${STAGING_DIR_HOST}/kernel/${KERNEL_IMAGETYPE}"
>>>> +ELF_KERNEL ?= "${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}-${MACHINE}.bin"
>>>
>>>
>>> Looks correct, how did this fail before? What was the symptom?
>>
>> e.g.,
>>
>> | Cannot open `...../tmp/sysroots/nuc/kernel/bzImage': (null)
>>
>> Two bugs really, the location has changed, and it was using a kernel
>> that is not machine-specific. I'll make a patch with better commit
>> message tomorrow.
> 
> Just for reference, STAGING_DIR_HOST is machine specific these days.
> 
> This patch also changes the dependency from do_populate_sysroot (which
> is encapsulated by DEPENDS) to do_deploy (which is not). Did you account
> for that?
> 
> I suspect that fixing the path might be safer than this change...

Right, I see it now, the bzImage is under STAGING_DIR_HOST/usr/src/kernel

I shall make another patch.

Tomas


-- 
http://sleepfive.com


