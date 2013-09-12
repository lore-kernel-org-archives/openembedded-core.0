Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1B6D46BEB4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2013 12:03:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r8CC3QwJ013982
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 12 Sep 2013 05:03:26 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Thu, 12 Sep 2013 05:03:26 -0700
Message-ID: <5231AD8C.9030509@windriver.com>
Date: Thu, 12 Sep 2013 20:03:24 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130803 Thunderbird/17.0.8
MIME-Version: 1.0
To: Mike Looijmans <mike.looijmans@topic.nl>
References: <cover.1378977276.git.hongxu.jia@windriver.com>
	<732e1a82d56c4355c0bae26ed5aec0151b5adb1a.1378977276.git.hongxu.jia@windriver.com>
	<52318DAB.9090108@topic.nl>
In-Reply-To: <52318DAB.9090108@topic.nl>
Cc: cxu@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] kernel.bbclass: Need a method to install/update for bzImage
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
X-List-Received-Date: Thu, 12 Sep 2013 12:03:27 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 09/12/2013 05:47 PM, Mike Looijmans wrote:
> This change just assumes that all boot systems are alike. Just 
> applying this patch "as is" will probably break a lot of embedded 
> systems that have totally different ways of upgrading the kernel. Best 
> scenario is that they'll waste time and space running scripts that 
> will have no effect.
>
> It should be possible - and more important: default - to NOT include 
> these scripts, and use them only on targets they apply to. 
> kernel.bbclass is in my opinion not the correct location.
>

Yes, we should add a on-off to decide whether the method should be used 
or not,
and set off by default.

But I could not find a better location to do this, almost all of targets 
in oe-core may
need this, do you have any suggestions?

Thanks,
Hongxu
> Otherwise, should I add my kernel postinstall script that writes the 
> kernel into an MTD block on an embedded target to this class as well? 
> And a NAND version? And SD?
>
> Mike.
>
>
> On 09/12/2013 11:25 AM, Hongxu Jia wrote:
>> While installing a rpm to update kernel on a deployed target, it will 
>> update
>> the boot area and the boot menu with the kernel as the priority but 
>> allow
>> you to fall back to the original kernel as well.
>>
>> - In pre-install script, it backs up original kernel to avoid 
>> confliction with
>>    new one.
>> - In post-install script, it updates the new kernel as the boot 
>> priority.
>>
>> [YOCTO #4104]
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
>>   meta/classes/kernel.bbclass | 65 
>> +++++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 65 insertions(+)
>>
>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>> index e039dfc..f0dd679 100644
>> --- a/meta/classes/kernel.bbclass
>> +++ b/meta/classes/kernel.bbclass
>> @@ -263,7 +263,72 @@ ALLOW_EMPTY_kernel-image = "1"
>>   ALLOW_EMPTY_kernel-modules = "1"
>>   DESCRIPTION_kernel-modules = "Kernel modules meta package"
>>
>> +pkg_preinst_kernel-image () {
>> +    if [ -z "$D" ]; then
>> +        # Parsing confliction
>> +        [ -f /boot/grub/menu.list ] && grubcfg="/boot/grub/menu.list"
>> +        [ -f /boot/grub/grub.cfg ] && grubcfg="/boot/grub/grub.cfg"
>> +        if [ -n "$grubcfg" ]; then
>> +            # Dereference symlink to avoid confliction with new 
>> kernel name.
>> +            if grep -q "/${KERNEL_IMAGETYPE} root=" $grubcfg; then
>> +                kimage=`realpath /boot/${KERNEL_IMAGETYPE}`;
>> +                sed -i "s#${KERNEL_IMAGETYPE} root=#${kimage##*/} 
>> root=#" $grubcfg
>> +            fi
>> +
>> +            # Rename old kernel if it conflicts with new kernel name.
>> +            if grep -q "/${KERNEL_IMAGETYPE}-${KERNEL_VERSION} 
>> root=" $grubcfg; then
>> +                timestamp=`date +%s`
>> + kimage="/boot/${KERNEL_IMAGETYPE}-${KERNEL_VERSION}-$timestamp-back"
>> +                sed -i "s#${KERNEL_IMAGETYPE}-${KERNEL_VERSION} 
>> root=#${kimage##*/} root=#" $grubcfg
>> +                mv /boot/${KERNEL_IMAGETYPE}-${KERNEL_VERSION} $kimage
>> +            fi
>> +        fi
>> +    fi
>> +}
>> +
>>   pkg_postinst_kernel-image () {
>> +    get_new_grub_cfg() {
>> +        title="Update ${KERNEL_IMAGETYPE}-${KERNEL_VERSION}-${PV}"
>> +        if [ -f /boot/grub/grub.cfg ]; then
>> +            rootfs=`grep " *linux [^ ].* root=" /boot/grub/grub.cfg 
>> -m 1 | \
>> +                 sed "s# *linux [^ ].* root=#    linux 
>> /${KERNEL_IMAGETYPE}-${KERNEL_VERSION} root=#"`
>> +
>> +            echo "menuentry \"$title\" {"
>> +            echo "    set root=(hd0,1)"
>> +            echo "$rootfs"
>> +            echo "}"
>> +        elif [ -f /boot/grub/menu.list ] ; then
>> +            rootfs=`grep "kernel [^ ].* root=" /boot/grub/menu.list 
>> -m 1 | \
>> +                 sed "s#kernel [^ ].* root=#kernel 
>> /${KERNEL_IMAGETYPE}-${KERNEL_VERSION} root=#"`
>> +
>> +            echo "default 0"
>> +            echo "timeout 30"
>> +            echo "title $title"
>> +            echo "root  (hd0,0)"
>> +            echo "$rootfs"
>> +        fi
>> +    }
>> +
>> +    get_old_grub_cfg() {
>> +        if [ -f /boot/grub/grub.cfg ]; then
>> +            cat /boot/grub/grub.cfg
>> +        elif [ -f /boot/grub/menu.list ] ; then
>> +            cat /boot/grub/menu.list | sed -e '/^default/d' -e 
>> '/^timeout/d'
>> +        fi
>> +    }
>> +
>> +    if [ -z "$D" ]; then
>> +        [ -f /boot/grub/menu.list ] && grubcfg="/boot/grub/menu.list"
>> +        [ -f /boot/grub/grub.cfg ] && grubcfg="/boot/grub/grub.cfg"
>> +        if [ -n "$grubcfg" ]; then
>> +            grubcfgtmp="$grubcfg.tmp"
>> +            get_new_grub_cfg  > $grubcfgtmp
>> +            get_old_grub_cfg >> $grubcfgtmp
>> +            mv $grubcfgtmp $grubcfg
>> +            echo "Caution! Update kernel may affect kernel-module!"
>> +        fi
>> +    fi
>> +
>>       update-alternatives --install 
>> /${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE} 
>> ${KERNEL_IMAGETYPE}-${KERNEL_VERSION} ${KERNEL_PRIORITY} || true
>>       if [ ! -e "$D/lib/modules/${KERNEL_VERSION}" ]; then
>>           mkdir -p $D/lib/modules/${KERNEL_VERSION}
>>
>
>
>
> Met vriendelijke groet / kind regards,
>
> Mike Looijmans
>
> TOPIC Embedded Systems
> Eindhovenseweg 32-C, NL-5683 KH Best
> Postbus 440, NL-5680 AK Best
> Telefoon: (+31) – (0)499 - 33.69.79
> Telefax: (+31) - (0)499 - 33.69.70
> E-mail: mike.looijmans@topic.nl
> Website: www.topic.nl
>
> Dit e-mail bericht en de eventueel daarbij behorende bijlagen zijn 
> uitsluitend bestemd voor de geadresseerde, zoals die blijkt uit het 
> e-mail bericht en/of de bijlagen. Er kunnen gegevens met betrekking 
> tot een derde instaan. Indien u als niet-geadresseerde dit bericht en 
> de bijlagen ontvangt, terwijl u niet bevoegd of gemachtigd bent om dit 
> bericht namens de geadresseerde te ontvangen, wordt u verzocht de 
> afzender hierover direct te informeren en het e-mail bericht met de 
> bijlagen te vernietigen. Ieder gebruik van de inhoud van het e-mail 
> bericht, waaronder de daarbij behorende bijlagen, door een ander dan 
> de geadresseerde is onrechtmatig jegens ons dan wel de eventueel in 
> het e-mail bericht of de bijlagen voorkomende andere personen. TOPIC 
> Embedded Systems is niet aansprakelijk voor enigerlei schade 
> voortvloeiend uit het gebruik en/of acceptatie van dit e-mail bericht 
> of de daarbij behorende bijlagen.
>
> The contents of this message, as well as any enclosures, are addressed 
> personally to, and thus solely intended for the addressee. They may 
> contain information regarding a third party. A recipient who is 
> neither the addressee, nor empowered to receive this message on behalf 
> of the addressee, is kindly requested to immediately inform the sender 
> of receipt, and to destroy the message and the enclosures. Any use of 
> the contents of this message and/or the enclosures by any other person 
> than the addressee or person who is empowered to receive this message, 
> is illegal towards the sender and/or the aforementioned third party. 
> TOPIC Embedded Systems is not  liable for any damage as a result of 
> the use and/or acceptance of this message and as well as any enclosures.


