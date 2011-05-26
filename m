Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1QPfFX-0003Li-R8
	for openembedded-core@lists.openembedded.org;
	Thu, 26 May 2011 20:25:36 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 26 May 2011 11:22:31 -0700
X-ExtLoop1: 1
Received: from unknown (HELO [10.255.12.104]) ([10.255.12.104])
	by orsmga002.jf.intel.com with ESMTP; 26 May 2011 11:22:30 -0700
Message-ID: <4DDE9A66.6070900@intel.com>
Date: Thu, 26 May 2011 11:22:30 -0700
From: Saul Wold <saul.wold@intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1306218459.git.sgw@linux.intel.com>	<9100a5deb0603809b55dcff6704ba3c0c8480ba5.1306218459.git.sgw@linux.intel.com>
	<1306433071.1777.8.camel@vorpal.jf.intel.com>
In-Reply-To: <1306433071.1777.8.camel@vorpal.jf.intel.com>
Subject: Re: [RFC 2/2] image_types: add IMAGE_ROOTFS_EXTRA_SPACE
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
X-List-Received-Date: Thu, 26 May 2011 18:25:36 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/26/2011 11:04 AM, Joshua Lock wrote:
> On Mon, 2011-05-23 at 23:38 -0700, Saul Wold wrote:
>> [YOCTO #886]
>>
>> This address 2 needs after the IMAGE_ROOTFS_SIZE is cleaned up, by
>> removing some of the _ext2/3 overrides it allows for a cleaner override
>> using IMAGE_ROOTFS_SIZE to create a large rootfs, or by setting the
>> IMAGE_ROOTFS_EXTRA_SPACE, will allow for extra space allocated in Kilobytes
>> above the base size (determined by du of the rootfs * IMAGE_OVERHEAD_FACTOR,
>> default of 1.3).
>>
>> Signed-off-by: Saul Wold<sgw@linux.intel.com>
>> ---
>>   meta/classes/image_types.bbclass |    2 +-
>>   meta/conf/bitbake.conf           |    4 ++++
>>   2 files changed, 5 insertions(+), 1 deletions(-)
>>
>> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
>> index 69f859e..601a5fb 100644
>> --- a/meta/classes/image_types.bbclass
>> +++ b/meta/classes/image_types.bbclass
>> @@ -13,7 +13,7 @@ def get_imagecmds(d):
>>
>>   runimagecmd () {
>>   	# Image generation code for image type ${type}
>> -	ROOTFS_SIZE=`du -ks ${IMAGE_ROOTFS}|awk '{size = $1 * ${IMAGE_OVERHEAD_FACTOR}; print (size>  ${IMAGE_ROOTFS_SIZE} ? size : ${IMAGE_ROOTFS_SIZE}) }'`
>> +	ROOTFS_SIZE=`du -ks ${IMAGE_ROOTFS}|awk '{size = $1 * ${IMAGE_OVERHEAD_FACTOR} + ${IMAGE_ROOTFS_EXTRA_SPACE}; print (size>  ${IMAGE_ROOTFS_SIZE} ? size : ${IMAGE_ROOTFS_SIZE}) }'`
>>   	${cmd}
>>   	cd ${DEPLOY_DIR_IMAGE}/
>>   	rm -f ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.${type}
>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>> index a0af672..fa3618c 100644
>> --- a/meta/conf/bitbake.conf
>> +++ b/meta/conf/bitbake.conf
>> @@ -350,6 +350,10 @@ IMAGE_LINK_NAME = "${IMAGE_BASENAME}-${MACHINE}"
>>   # This option allows for a precentage overage of the actaul image size rather than a
>>   # fixed extra space
>>   IMAGE_OVERHEAD_FACTOR ?= 1.3
>> +# This option allow for adding addition space in K above and beyond what the
>> +# IMAGE_OVERHEAD_FACTOR might add. To set a fixed size then overrideing IMAGE_ROOTFS_SIZE
>> +# with the max size one wants should do the trick
>> +IMAGE_OVERHEAD_EXTRA_SPACE = "0"
>
> This appears to be a different variable to the IMAGE_ROOTFS_EXTRA_SPACE
> used in the command above? Also, you've done a hard assignment here.
> Shouldn't it be a soft (?=) assignment?
>
Yes, I fixed the OVERHEAD vs ROOTFS already, noticed that during post 
RFC testing.  I did not see the soft (?=) problem, but agree it needs to 
be fixed.

Sau!

> Cheers,
> Joshua



