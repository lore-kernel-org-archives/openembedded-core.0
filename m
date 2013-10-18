Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D5BEA6CC79
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Oct 2013 02:34:19 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9I2YLYv025995
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 17 Oct 2013 19:34:21 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 17 Oct 2013 19:34:21 -0700
Message-ID: <52609E2B.3000607@windriver.com>
Date: Fri, 18 Oct 2013 10:34:19 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1379488759.git.hongxu.jia@windriver.com>
	<3972d66ce581c06b12d537cddd57df794b8f841b.1379488759.git.hongxu.jia@windriver.com>
	<525ED2C7.7080107@linux.intel.com>
In-Reply-To: <525ED2C7.7080107@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] kernel-grub.bbclass: a method to install/update for bzImage
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
X-List-Received-Date: Fri, 18 Oct 2013 02:34:20 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/17/2013 01:54 AM, Saul Wold wrote:
> On 09/18/2013 12:26 AM, Hongxu Jia wrote:
>> While installing a rpm to update kernel on a deployed target, it will 
>> update
>> the boot area and the boot menu with the kernel as the priority but 
>> allow
>> you to fall back to the original kernel as well.
>>
> Will this work for deb or ipk?
>

Yes, I have done the test on target for deb and ipk, both of them worked.

//Hongxu

> Sau!
>
>> - In kernel-image's preinstall scriptlet, it backs up original kernel 
>> to avoid
>>    probable confliction with the new one.
>> - In kernel-image's postinstall scriptlet, it modify grub's config 
>> file to
>>    updates the new kernel as the boot priority.
>>
>> [YOCTO #4104]
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
>>   meta/classes/kernel-grub.bbclass | 79 
>> ++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 79 insertions(+)
>>   create mode 100644 meta/classes/kernel-grub.bbclass
>>
>> diff --git a/meta/classes/kernel-grub.bbclass 
>> b/meta/classes/kernel-grub.bbclass
>> new file mode 100644
>> index 0000000..21fcabe
>> --- /dev/null
>> +++ b/meta/classes/kernel-grub.bbclass
>> @@ -0,0 +1,79 @@
>> +#
>> +# While installing a rpm to update kernel on a deployed target, it 
>> will update
>> +# the boot area and the boot menu with the kernel as the priority 
>> but allow
>> +# you to fall back to the original kernel as well.
>> +#
>> +# - In kernel-image's preinstall scriptlet, it backs up original 
>> kernel to avoid
>> +#   probable confliction with the new one.
>> +#
>> +# - In kernel-image's postinstall scriptlet, it modify grub's config 
>> file to
>> +#   updates the new kernel as the boot priority.
>> +#
>> +
>> +pkg_preinst_kernel-image_append () {
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
>> +pkg_postinst_kernel-image_prepend () {
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
>> +}
>> +
>>


