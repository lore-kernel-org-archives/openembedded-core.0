Return-Path: <california.l.sullivan@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 8FBE37888E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Feb 2018 03:03:37 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Feb 2018 19:03:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,403,1515484800"; d="scan'208";a="178631273"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga004.jf.intel.com with ESMTP; 27 Feb 2018 19:03:38 -0800
From: Cal Sullivan <california.l.sullivan@intel.com>
To: Anuj Mittal <anuj.mittal@intel.com>,
	openembedded-core@lists.openembedded.org
References: <20180226201216.33204-1-california.l.sullivan@intel.com>
	<20180226201216.33204-17-california.l.sullivan@intel.com>
	<1bfa8420-2882-3284-4994-1e7ece6e957f@intel.com>
	<aa6641df-8612-7d06-6441-fdd85c7e09a8@intel.com>
Message-ID: <942f0ff8-dfea-eba9-8222-54f6e18456b7@intel.com>
Date: Tue, 27 Feb 2018 19:03:38 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <aa6641df-8612-7d06-6441-fdd85c7e09a8@intel.com>
Subject: Re: [PATCH 16/16] init-install.sh: support multiple kernels and don't assume vmlinuz
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
X-List-Received-Date: Wed, 28 Feb 2018 03:03:37 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

I wasn't able to get to this today for my v2. If this makes it in before 
feature freeze I will open a bug and fix it before m4.

Thanks,
Cal

On 02/27/2018 01:15 PM, Cal Sullivan wrote:
>
>
> On 02/27/2018 01:46 AM, Anuj Mittal wrote:
>> Hi Cal,
>>
>> On 02/27/2018 04:12 AM, California Sullivan wrote:
>>> Since kernels will not necessarily be installed as vmlinuz anymore,
>>> don't assume that's its name for either the bootloader config or the
>>> copy of the kernel.
>>>
>>> Also, allow installing multiple kernels by searching for common kernel
>>> names.
>>>
>>> Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
>>> ---
>>>   .../initrdscripts/files/init-install.sh            | 37 
>>> ++++++++++++++++++++--
>>>   1 file changed, 34 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/meta/recipes-core/initrdscripts/files/init-install.sh 
>>> b/meta/recipes-core/initrdscripts/files/init-install.sh
>>> index dade059c8f1..713a83092bf 100644
>>> --- a/meta/recipes-core/initrdscripts/files/init-install.sh
>>> +++ b/meta/recipes-core/initrdscripts/files/init-install.sh
>>> @@ -256,9 +256,34 @@ fi
>>>   umount /tgt_root
>>>   umount /src_root
>>>   +echo "Looking for kernels to use as boot target.."
>>> +# Find kernel to boot to
>>> +# Give user options if multiple are found
>>> +kernels="$(find /run/media/$1/ -type f  \
>>> +           -name bzImage* -o -name zImage* \
>>> +           -o -name vmlinux* -o -name vmlinuz* \
>>> +           -o -name fitImage* \
>>> +           | sed s:.*/::)"
>>> +if [ -n "$(echo $kernels)" ]; then
>>> +    # only one kernel entry if no space
>>> +    if [ -z "$(echo $kernels | grep " ")" ]; then
>>> +        kernel=$kernels
>>> +        echo "$kernel will be used as the boot target"
>>> +    else
>>> +        echo "Which kernel do we want to boot by default? The 
>>> following kernels were found:"
>>> +        echo $kernels
>>> +        read answer
>>> +        kernel=$answer
>>> +    fi
>>> +else
>>> +    echo "No kernels found, exiting..."
>>> +    exit 1
>>> +fi
>>> +
>> We probably shouldn't be exiting this script at this point since we've
>> already made the partitions and copied everything except the kernel.
>>
>> Since this script is invoked for installation after booting up, I guess
>> that at this point we will have at least one kernel that we can install?
> You're right. Instead of bailing out, we should print a message that 
> no kernels were found and take user input instead. We can also use 
> this input to attempt a copy of the kernel to install, since if it 
> wasn't found here it wouldn't be found below, either. I'll make these 
> changes in a v2.
>
>>
>>>   # Handling of the target boot partition
>>>   mount $bootfs /boot
>>>   echo "Preparing boot partition..."
>>> +
>>>   if [ -f /etc/grub.d/00_header -a $grub_version -ne 0 ] ; then
>>>       echo "Preparing custom grub2 menu..."
>>>       root_part_uuid=$(blkid -o value -s PARTUUID ${rootfs})
>>> @@ -268,7 +293,7 @@ if [ -f /etc/grub.d/00_header -a $grub_version 
>>> -ne 0 ] ; then
>>>       cat >$GRUBCFG <<_EOF
>>>   menuentry "Linux" {
>>>       search --no-floppy --fs-uuid $boot_uuid --set root
>>> -    linux /vmlinuz root=PARTUUID=$root_part_uuid $rootwait rw $5 $3 
>>> $4 quiet
>>> +    linux /$kernel root=PARTUUID=$root_part_uuid $rootwait rw $5 $3 
>>> $4 quiet
>>>   }
>>>   _EOF
>>>       chmod 0444 $GRUBCFG
>>> @@ -282,10 +307,16 @@ if [ $grub_version -eq 0 ] ; then
>>>       echo "timeout 30" >> /boot/grub/menu.lst
>>>       echo "title Live Boot/Install-Image" >> /boot/grub/menu.lst
>>>       echo "root  (hd0,0)" >> /boot/grub/menu.lst
>>> -    echo "kernel /vmlinuz root=$rootfs rw $3 $4 quiet" >> 
>>> /boot/grub/menu.lst
>>> +    echo "kernel /$kernel root=$rootfs rw $3 $4 quiet" >> 
>>> /boot/grub/menu.lst
>>>   fi
>>>   -cp /run/media/$1/vmlinuz /boot/
>>> +# Copy kernel artifacts. To add more artifacts just add to types
>>> +# For now just support kernel types already being used by something 
>>> in OE-core
>>> +for types in bzImage zImage vmlinux vmlinuz fitImage; do
>>> +    for kernel in `find /run/media/$1/ -name $types*`; do
>>> +        cp $kernel /boot
>>> +    done
>>> +done
>> Since the boot partition is still 20MB, there's a chance that this might
>> fail if there are enough kernels?
>>
>> Perhaps the kernel selection logic should move to the top with user
>> choice and partition sizes be calculated accordingly?
> Indeed. Good catch.
>
> ---
> Cal
>
>>
>> Thanks,
>> Anuj
>


