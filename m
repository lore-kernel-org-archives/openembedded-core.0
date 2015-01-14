Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5A54E71634
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jan 2015 03:38:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t0E3bwIF005014
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Tue, 13 Jan 2015 19:37:58 -0800 (PST)
Received: from [128.224.162.226] (128.224.162.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Tue, 13 Jan 2015 19:37:57 -0800
Message-ID: <54B5E495.7020104@windriver.com>
Date: Wed, 14 Jan 2015 11:37:57 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: "Moseley, Drew" <drew_moseley@mentor.com>
References: <1420818765-28571-1-git-send-email-drew_moseley@mentor.com>
	<54B32BD4.3080209@windriver.com>
	<C367E4F3-C2F6-48E5-BEAF-E7D873D458BD@mentor.com>
In-Reply-To: <C367E4F3-C2F6-48E5-BEAF-E7D873D458BD@mentor.com>
X-Originating-IP: [128.224.162.226]
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] init-install.sh: Switch to using static device paths.
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
X-List-Received-Date: Wed, 14 Jan 2015 03:38:12 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 01/13/2015 10:46 PM, Moseley, Drew wrote:
>> On Jan 11, 2015, at 9:05 PM, ChenQi <Qi.Chen@windriver.com> wrote:
>>
>> On 01/09/2015 11:52 PM, Drew Moseley wrote:
>>> Use static device paths for mounting from /dev/disk/<blah> in
>>> case the device ordering changes.
>>>
>>> Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
>>> ---
>>>   meta/recipes-core/initrdscripts/files/init-install.sh | 14 ++++++++++----
>>>   1 file changed, 10 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/meta/recipes-core/initrdscripts/files/init-install.sh b/meta/recipes-core/initrdscripts/files/init-install.sh
>>> index fb537ee..f924418 100644
>>> --- a/meta/recipes-core/initrdscripts/files/init-install.sh
>>> +++ b/meta/recipes-core/initrdscripts/files/init-install.sh
>>> @@ -156,6 +156,12 @@ mkfs.ext3 $rootfs
>>>   echo "Formatting swap partition...($swap)"
>>>   mkswap $swap
>>>   +# Determine the static device paths
>>> +sync; udevadm settle
>>> +bootfs_static="$(udevadm info --query=property --name=$bootfs | grep DEVLINKS= | cut -d= -f2 | cut -d\  -f1)"
>>> +swap_static="$(udevadm info --query=property --name=$swap | grep DEVLINKS= | cut -d= -f2 | cut -d\  -f1)"
>>> +rootfs_uuid="$(udevadm info --query=property --name=$rootfs | grep ID_PART_ENTRY_UUID | cut -d= -f2)"
>>> +
>> Would ID_PART_ENTRY_UUID be always there?
> That's a good question.  In my test systems (two VirtualBox configs and two AMD based PCs) it is always there.  Taking a second look at my developer Ubuntu system it does not seem to have that field so maybe I'm just getting lucky on my test systems.
>
> Anybody have a suggestion for a replacement?

We can use blkid command.

>
>>>   mkdir /tgt_root
>>>   mkdir /src_root
>>>   mkdir -p /boot
>>> @@ -166,8 +172,8 @@ mount -o rw,loop,noatime,nodiratime /run/media/$1/$2 /src_root
>>>   echo "Copying rootfs files..."
>>>   cp -a /src_root/* /tgt_root
>>>   if [ -d /tgt_root/etc/ ] ; then
>>> -    echo "$swap                swap             swap       defaults              0  0" >> /tgt_root/etc/fstab
>>> -    echo "$bootfs              /boot            ext3       defaults              1  2" >> /tgt_root/etc/fstab
>>> +    echo "$swap_static                swap             swap       defaults              0  0" >> /tgt_root/etc/fstab
>>> +    echo "$bootfs_static              /boot            ext3       defaults              1  2" >> /tgt_root/etc/fstab
>>>       # We dont want udev to mount our root device while we're booting...
>>>       if [ -d /tgt_root/etc/udev/ ] ; then
>>>   	echo "/dev/${device}" >> /tgt_root/etc/udev/mount.blacklist
>>> @@ -186,7 +192,7 @@ if [ -f /etc/grub.d/00_header ] ; then
>>>       cat >$GRUBCFG <<_EOF
>>>   menuentry "Linux" {
>>>       set root=(hd0,1)
>>> -    linux /vmlinuz root=$rootfs $rootwait rw $5 $3 $4 quiet
>>> +    linux /vmlinuz root=PARTUUID=$rootfs_uuid $rootwait rw $5 $3 $4 quiet
>> I thought PARTUUID is for GPT only.
>>
> Perhaps so but it does seem to be there on my VirtualBox systems.  My Ubuntu host uses "root=UUID=blah" but that was't working for me at some point.  I'll dig back into it and see what I can find.
>
> Drew
>
>
>
>

root=UUID=xxx has to be resolved by an initramfs because kernel itself 
cannot handle it.

There's a patchset I sent half a year ago trying to solve this problem.
http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/initramfs-uuid
This offers one solution, maybe an ugly one.

Best Regards,
Chen Qi


