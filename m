Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (unknown [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id D1DB065D1A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 May 2014 17:47:50 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 23 May 2014 10:47:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,895,1392192000"; d="scan'208";a="436155243"
Received: from unknown (HELO [10.255.12.174]) ([10.255.12.174])
	by azsmga001.ch.intel.com with ESMTP; 23 May 2014 10:47:51 -0700
Message-ID: <537F89C6.6060707@linux.intel.com>
Date: Fri, 23 May 2014 10:47:50 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Robert Yang <liezhi.yang@windriver.com>, 
	Darren Hart <dvhart@linux.intel.com>,
	rongqing.li@windriver.com, openembedded-core@lists.openembedded.org
References: <1400554188-19458-1-git-send-email-rongqing.li@windriver.com>	<537CE5CB.8030402@linux.intel.com>
	<537D5BCE.60202@windriver.com>
In-Reply-To: <537D5BCE.60202@windriver.com>
Subject: Re: [PATCH 1/2] initramfs-live-install: avoid using grub.d/40_custom
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
X-List-Received-Date: Fri, 23 May 2014 17:47:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/21/2014 07:07 PM, Robert Yang wrote:
>
> On 05/22/2014 01:43 AM, Darren Hart wrote:
>> On 5/19/14, 19:49, rongqing.li@windriver.com wrote:
>>> From: Robert Yang <liezhi.yang@windriver.com>
>>
>> Hi Robert,
>>
>> Just to clarify - there is no Patch 2/2 right?
>
> Hi Darren,
>
> Thanks, there is [PATCH 2/2] grub-2.00: remove our 40_custom:
>
> http://lists.openembedded.org/pipermail/openembedded-core/2014-May/092736.html
>

There is a small issue still, the 40_custom is still mentioned in both 
grub_git.bb and initrdscripts/files/init-install-testfs.sh

Sau!

>
> I'm a little busy recently, so Roy helped me forward porting this patch,
> please see my comments below.
>
>>
>>> We have this in recipes-bsp/grub/grub/40_custom:
>>>
>>> [snip]
>>> menuentry "Linux" {
>>>      set root=(hd0,1)
>>>      linux /vmlinuz root=__ROOTFS__ rw __CONSOLE__ __VIDEO_MODE__
>>> __VGA_MODE__
>>> quiet
>>> }
>>> [snip]
>>>
>>> These lines are only for initrdscripts/files/init-install.sh, the side
>>> effect is that it would make the target's grub-mkconfig doesn't work
>>> well since the 40_custom will be installed to /etc/grub.d/40_custom, the
>>> grub-mkconfig will run the 40_custom, and there will always be a
>>> 'menuentry "Linux"' menu in grub.cfg no matter it is valid or not, we
>>> can do this in init-install.sh rather than grub to fix the problem,
>>> which is also much simpler.
>>>
>>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>>> ---
>>>   meta/recipes-core/initrdscripts/files/init-install.sh |   15
>>> +++++++--------
>>>   1 file changed, 7 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/meta/recipes-core/initrdscripts/files/init-install.sh
>>> b/meta/recipes-core/initrdscripts/files/init-install.sh
>>> index 8e433d5..0ede928 100644
>>> --- a/meta/recipes-core/initrdscripts/files/init-install.sh
>>> +++ b/meta/recipes-core/initrdscripts/files/init-install.sh
>>> @@ -168,17 +168,16 @@ umount /src_root
>>>   # Handling of the target boot partition
>>>   mount $bootfs /boot
>>>   echo "Preparing boot partition..."
>>> -if [ -f /etc/grub.d/40_custom ] ; then
>>> +if [ -f /etc/grub.d/00_header ] ; then
>>>       echo "Preparing custom grub2 menu..."
>>>       GRUBCFG="/boot/grub/grub.cfg"
>>>       mkdir -p $(dirname $GRUBCFG)
>>> -    cp /etc/grub.d/40_custom $GRUBCFG
>>> -    sed -i "s@__ROOTFS__@$rootfs $rootwait@g" $GRUBCFG
>>> -    sed -i "s/__VIDEO_MODE__/$3/g" $GRUBCFG
>>> -    sed -i "s/__VGA_MODE__/$4/g" $GRUBCFG
>>> -    sed -i "s/__CONSOLE__/$5/g" $GRUBCFG
>>> -    sed -i "/#/d" $GRUBCFG
>>> -    sed -i "/exec tail/d" $GRUBCFG
>>> +    cat >$GRUBCFG <<_EOF
>>> +menuentry "Linux" {
>>> +    set root=(hd0,1)
>>> +    linux /vmlinuz root=$rootfs $rootwait rw $5 $3 $4 quiet
>>> +}
>>> +_EOF
>>
>> OK, seems like a reasonable incremental change. What becomes of the
>> 40_custom
>> file itself? Should that be removed from the grub recipe as well?
>
> I'm afraid that the grub's 40_custom should be kept as other distro does:
>
> === begin ===
> #!/bin/sh
> exec tail -n +3 $0
> # This file provides an easy way to add custom menu entries.  Simply
> type the
> # menu entries you want to add after this comment.  Be careful not to
> change
> # the 'exec tail' line above.
> === end ===
>
> The problem is that recipes-bsp/grub/grub/40_custom has added unneeded
> lines.
>
>>
>> Does the BSP variable "APPEND" get incorporated here anywhere? It's
>> looking like
>> it isn't - or maybe I'm missing it?
>
> Sorry, what do you mean about this, please ?
>
> // Robert
>
>>
>> Thanks,
>>

