Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (unknown [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 290F96FA51
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 May 2014 14:24:05 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 27 May 2014 07:24:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,919,1392192000"; d="scan'208";a="545519656"
Received: from unknown (HELO [10.255.12.174]) ([10.255.12.174])
	by fmsmga002.fm.intel.com with ESMTP; 27 May 2014 07:24:06 -0700
Message-ID: <5384A006.8080908@linux.intel.com>
Date: Tue, 27 May 2014 07:24:06 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Stefan Stanacar <sstncr@gmail.com>, 
	Corneliu Stoicescu <corneliux.stoicescu@intel.com>
References: <1401184227-1138-1-git-send-email-corneliux.stoicescu@intel.com>
	<CANr+NRtXiKzXK2aBS6e1vrt-HNRMYqQ5StH-neSsFLZQAbLPtQ@mail.gmail.com>
In-Reply-To: <CANr+NRtXiKzXK2aBS6e1vrt-HNRMYqQ5StH-neSsFLZQAbLPtQ@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] oeqa/controllers/beaglebonetarget.py: fix conditions for files copied to /boot
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
X-List-Received-Date: Tue, 27 May 2014 14:24:12 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/27/2014 04:14 AM, Stefan Stanacar wrote:
> On Tue, May 27, 2014 at 12:50 PM, Corneliu Stoicescu
> <corneliux.stoicescu@intel.com> wrote:
>
>> ---
>>   meta-yocto-bsp/lib/oeqa/controllers/beaglebonetarget.py | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>
> As this patch is for meta-yocto-bsp this should be sent to
> poky@yoctoproject.org list...
>
>> diff --git a/meta-yocto-bsp/lib/oeqa/controllers/beaglebonetarget.py b/meta-yocto-bsp/lib/oeqa/controllers/beaglebonetarget.py
>> index 53f454b..af56bda 100644
>> --- a/meta-yocto-bsp/lib/oeqa/controllers/beaglebonetarget.py
>> +++ b/meta-yocto-bsp/lib/oeqa/controllers/beaglebonetarget.py
>> @@ -41,12 +41,12 @@ class BeagleBoneTarget(MasterImageHardwareTarget):
>>                   'mount -L testrootfs /mnt/testrootfs',
>>                   'rm -rf /mnt/testrootfs/*',
>>                   'tar xzvf ~/test-rootfs.tar.gz -C /mnt/testrootfs',
>> -                '[ ! -e /mnt/testrootfs/boot/uImage ] && cp ~/test-kernel /mnt/testrootfs/boot/uImage',
>> +                'if [ ! -e /mnt/testrootfs/boot/uImage ]; then cp ~/test-kernel /mnt/testrootfs/boot/uImage; fi',
>
> How about reversing the check: [ -e /mnt/testrootfs/boot/uImage] || cp
> ~/test-kernel /mnt/testrootfs/boot/uImage
> That would work in both cases, if it exists it won't copy the kernel
> and returns 0, if it doesn't it will copy and returns the result of
> cp.
>
>>                   ]
>>
>>           for _, dtbfn in self.dtbs:
>>               # Kernel and dtb files may not be in the image, so copy them if not
>> -            self.deploy_cmds.append('[ ! -e /mnt/testrootfs/boot/{0} ] && cp ~/{0} /mnt/testrootfs/boot/'.format(dtbfn))
>> +            self.deploy_cmds.append('if [ ! -e /mnt/testrootfs/boot/{0} ]; then cp ~/{0} /mnt/testrootfs/boot/'.format(dtbfn) + '; fi')
>>
>
> Same here.
>

I agree with Stephan here along with Anders comments and this should 
really be on poky@ list, so a v3 to the poky@yoctoproject would be best.

Thanks
	Sau!

>
> Cheers,
> Stefan
>
>>           if not self.serialcontrol_cmd:
>>               bb.fatal("This TEST_TARGET needs a TEST_SERIALCONTROL_CMD defined in local.conf.")
>> --
>> 1.8.3.2
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

