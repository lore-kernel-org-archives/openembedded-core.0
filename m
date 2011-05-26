Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QPhgQ-0007xV-5V
	for openembedded-core@lists.openembedded.org;
	Thu, 26 May 2011 23:01:30 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 26 May 2011 13:58:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,276,1304319600"; 
   d="scan'208";a="8318729"
Received: from doubt.jf.intel.com (HELO [10.24.80.114]) ([10.24.80.114])
	by fmsmga002.fm.intel.com with ESMTP; 26 May 2011 13:58:25 -0700
Message-ID: <4DDEBF04.4080106@linux.intel.com>
Date: Thu, 26 May 2011 13:58:44 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1306218459.git.sgw@linux.intel.com>	<9100a5deb0603809b55dcff6704ba3c0c8480ba5.1306218459.git.sgw@linux.intel.com>	<1306433071.1777.8.camel@vorpal.jf.intel.com>
	<4DDE9A66.6070900@intel.com>
In-Reply-To: <4DDE9A66.6070900@intel.com>
Cc: Saul Wold <saul.wold@intel.com>
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
X-List-Received-Date: Thu, 26 May 2011 21:01:31 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 05/26/2011 11:22 AM, Saul Wold wrote:
> On 05/26/2011 11:04 AM, Joshua Lock wrote:
>> On Mon, 2011-05-23 at 23:38 -0700, Saul Wold wrote:
>>> [YOCTO #886]
>>>
>>> This address 2 needs after the IMAGE_ROOTFS_SIZE is cleaned up, by
>>> removing some of the _ext2/3 overrides it allows for a cleaner override
>>> using IMAGE_ROOTFS_SIZE to create a large rootfs, or by setting the
>>> IMAGE_ROOTFS_EXTRA_SPACE, will allow for extra space allocated in Kilobytes
>>> above the base size (determined by du of the rootfs * IMAGE_OVERHEAD_FACTOR,
>>> default of 1.3).
>>>
>>> Signed-off-by: Saul Wold<sgw@linux.intel.com>
>>> ---
>>>   meta/classes/image_types.bbclass |    2 +-
>>>   meta/conf/bitbake.conf           |    4 ++++
>>>   2 files changed, 5 insertions(+), 1 deletions(-)
>>>
>>> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
>>> index 69f859e..601a5fb 100644
>>> --- a/meta/classes/image_types.bbclass
>>> +++ b/meta/classes/image_types.bbclass
>>> @@ -13,7 +13,7 @@ def get_imagecmds(d):
>>>
>>>   runimagecmd () {
>>>   	# Image generation code for image type ${type}
>>> -	ROOTFS_SIZE=`du -ks ${IMAGE_ROOTFS}|awk '{size = $1 * ${IMAGE_OVERHEAD_FACTOR}; print (size>  ${IMAGE_ROOTFS_SIZE} ? size : ${IMAGE_ROOTFS_SIZE}) }'`
>>> +	ROOTFS_SIZE=`du -ks ${IMAGE_ROOTFS}|awk '{size = $1 * ${IMAGE_OVERHEAD_FACTOR} + ${IMAGE_ROOTFS_EXTRA_SPACE}; print (size>  ${IMAGE_ROOTFS_SIZE} ? size : ${IMAGE_ROOTFS_SIZE}) }'`
>>>   	${cmd}
>>>   	cd ${DEPLOY_DIR_IMAGE}/
>>>   	rm -f ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.${type}
>>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>>> index a0af672..fa3618c 100644
>>> --- a/meta/conf/bitbake.conf
>>> +++ b/meta/conf/bitbake.conf
>>> @@ -350,6 +350,10 @@ IMAGE_LINK_NAME = "${IMAGE_BASENAME}-${MACHINE}"
>>>   # This option allows for a precentage overage of the actaul image size rather than a

contextual fix while you're at it:
s/precentage/percentage/
s/actaul/actual/

>>>   # fixed extra space
>>>   IMAGE_OVERHEAD_FACTOR ?= 1.3
>>> +# This option allow for adding addition space in K above and beyond what the
>>> +# IMAGE_OVERHEAD_FACTOR might add. To set a fixed size then overrideing IMAGE_ROOTFS_SIZE
>>> +# with the max size one wants should do the trick
>>> +IMAGE_OVERHEAD_EXTRA_SPACE = "0"
>>
>> This appears to be a different variable to the IMAGE_ROOTFS_EXTRA_SPACE
>> used in the command above? Also, you've done a hard assignment here.
>> Shouldn't it be a soft (?=) assignment?
>>
> Yes, I fixed the OVERHEAD vs ROOTFS already, noticed that during post 
> RFC testing.  I did not see the soft (?=) problem, but agree it needs to 
> be fixed.
> 

Hrm, I didn't realize there were two variables. If
IMAGE_ROOTFS_EXTRA_SPACE is used to ensure the user has some space for
their data, what then is the idea driving IMAGE_OVERHEAD_FACTOR?


-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


