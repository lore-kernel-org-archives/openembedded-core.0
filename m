Received: from 75-148-42-21-colorado.hfc.comcastbusiness.net ([75.148.42.21]
	helo=judge.camp.se-eng.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ray.danks@se-eng.com>) id 1SkhWa-0004F3-4Q
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jun 2012 22:10:40 +0200
Received: from localhost (localhost [127.0.0.1])
	by judge.camp.se-eng.com (Postfix) with ESMTP id C8D131391B1;
	Fri, 29 Jun 2012 13:59:42 -0600 (MDT)
X-Virus-Scanned: amavisd-new at camp.se-eng.com
Received: from judge.camp.se-eng.com ([127.0.0.1])
	by localhost (judge.camp.se-eng.com [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id AKCT1gzNOgdt; Fri, 29 Jun 2012 13:59:41 -0600 (MDT)
Received: from [172.20.202.96] (beast.camp.se-eng.com [172.20.202.96])
	by judge.camp.se-eng.com (Postfix) with ESMTPSA id 3B17C1391B0;
	Fri, 29 Jun 2012 13:59:40 -0600 (MDT)
Message-ID: <4FEE0985.4050502@se-eng.com>
Date: Fri, 29 Jun 2012 14:01:09 -0600
From: Raymond Danks <ray.danks@se-eng.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0) Gecko/20120129 Thunderbird/10.0
MIME-Version: 1.0
To: Darren Hart <dvhart@linux.intel.com>
References: <1340396533-5386-2-git-send-email-ray.danks@se-eng.com>
	<1340984497-32423-1-git-send-email-ray.danks@se-eng.com>
	<4FEDE9B8.8010605@linux.intel.com>
In-Reply-To: <4FEDE9B8.8010605@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2 v2] image_types: Add elf image type
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ray.danks@se-eng.com, Patches and discussions about the oe-core layer
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
X-List-Received-Date: Fri, 29 Jun 2012 20:10:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/29/2012 11:45 AM, Darren Hart wrote:
>
> On 06/29/2012 08:41 AM, Raymond Danks wrote:
>> On x86, an ELF image file may be stored as a coreboot payload.
>> The image file is constructed, using the mkelfimage utility,
>> from a kernel and an initrd.
>>
>> Signed-off-by: Raymond Danks<ray.danks@se-eng.com>
>> ---
>> This was originally submitted to the openembedded project:
>> http://patches.openembedded.org/patch/7689/
>>
>> v2:
>>   Include KERNEL_IMAGETYPE for location of ELF_KERNEL
>>
>>   meta/classes/image_types.bbclass |   18 +++++++++++++++++-
>>   1 files changed, 17 insertions(+), 1 deletions(-)
>>
>> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
>> index 55f122e..12419f4 100644
>> --- a/meta/classes/image_types.bbclass
>> +++ b/meta/classes/image_types.bbclass
>> @@ -7,6 +7,12 @@ def get_imagecmds(d):
>>       ctypes = d.getVar('COMPRESSIONTYPES', True).split()
>>       cimages = {}
>>
>> +    if "elf" in alltypes:
>> +        alltypes.remove("elf")
>> +        if "cpio.gz" not in alltypes:
>> +                alltypes.append("cpio.gz")
>> +        alltypes.append("elf")
>> +
>>       # Filter out all the compressed images from types
>>       for type in alltypes:
>>           basetype = None
>> @@ -173,6 +179,14 @@ IMAGE_CMD_cpio () {
>>   	cd ${IMAGE_ROOTFS}&&  (find . | cpio -o -H newc>${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio)
>>   }
>>
>> +ELF_KERNEL ?= ${STAGING_DIR_HOST}/kernel/${KERNEL_IMAGETYPE}
> This should be ${STAGING_KERNEL_DIR} I believe. I have a patch series
> under review currently which would break the above as it is now in
> /usr/src/kernel-headers
>
> Note that you could also collect this from the DEPLOY_DIR_IMAGE, which
> is probably more appropriate for assembling images
>
> Thanks,
>
Yes.  This appears to work:
ELF_KERNEL ?= ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}

I'm regenerating the patch now.



