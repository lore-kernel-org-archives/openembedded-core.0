Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1Rb4r2-0007n0-5j for openembedded-core@lists.openembedded.org;
	Thu, 15 Dec 2011 07:31:44 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1Rb4kI-0003qT-P9 for openembedded-core@lists.openembedded.org;
	Thu, 15 Dec 2011 07:24:46 +0100
Received: from nat-rup.mentorg.com ([139.181.168.34])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2011 07:24:46 +0100
Received: from dbaryshkov by nat-rup.mentorg.com with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2011 07:24:46 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-core@lists.openembedded.org
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Date: Thu, 15 Dec 2011 10:23:14 +0400
Message-ID: <4EE99252.9060308@gmail.com>
References: <1323793193-31090-1-git-send-email-dbaryshkov@gmail.com>
	<1323793193-31090-2-git-send-email-dbaryshkov@gmail.com>
	<CD461DDE-5A9A-4194-9043-A692EB22A9E8@dominion.thruhere.net>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: nat-rup.mentorg.com
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:8.0) Gecko/20111109 Icedove/8.0
In-Reply-To: <CD461DDE-5A9A-4194-9043-A692EB22A9E8@dominion.thruhere.net>
Cc: Koen Kooi <public-koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@lo.gmane.org>
Subject: Re: [PATCH 2/9] kernel.bbclass: move uImage handling to separate task
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
X-List-Received-Date: Thu, 15 Dec 2011 06:31:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/15/2011 01:20 AM, Koen Kooi wrote:
>
> Op 13 dec. 2011, om 16:19 heeft Dmitry Eremin-Solenikov het volgende geschreven:
>
>> As per org.oe.dev and meta-oe's kernel.bbclass move uImage creation to
>> separate task from do_deploy. This way the do_install task can also
>> benefit from generated uImage.
>>
>> The only major feature of oe-core's version (not to recreate uImage
>> if it exists) is retained in this patch
>
> The whole point of the OE uImage handling is that in general we know better than the kernel and can apply fixups if needed (turning on/off compression, etc)

Please check the history of OE-core uImage handling. Initially uImage 
was always recreated (as it's currently done in meta-oe). Then 
(422a017e6 on Oct 29, 2010) OE-core kernel.bbclass was changed to 
default to not to recreate uImage if it was created by kbuild (IIRC it 
was done so, because recreated uImages weren't always booting as they 
required more setup). I don't know which way is correct. Maybe we should 
add a hook that will tell if kernel.bbclass should prefer to recreate 
uImage or to use kernel one. Would you like such variable?

Another point (that I probably failed to emphasize): currently 
do_install and do_deploy will use different uImages. The image in /boot 
on rootfs might be different from uImage really in deploy dir. I would 
assume that this is not the expected way to do things.

>
>> . On the contra, as this version
>> was merged from meta-oe/org.oe.dev, new function has another feature:
>> it permits overriding the u-boot entrypoint via u-boot symbol.
>
> Not if uimage exists, see above

Of course.

>
>>
>> Signed-off-by: Dmitry Eremin-Solenikov<dbaryshkov@gmail.com>
>> ---
>> meta/classes/kernel.bbclass |   40 ++++++++++++++++++++++++----------------
>> 1 files changed, 24 insertions(+), 16 deletions(-)
>>
>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>> index a75c199..db00d2d 100644
>> --- a/meta/classes/kernel.bbclass
>> +++ b/meta/classes/kernel.bbclass
>> @@ -485,6 +485,30 @@ do_sizecheck() {
>>
>> addtask sizecheck before do_install after do_compile
>>
>> +do_uboot_mkimage() {
>> +    if test "x${KERNEL_IMAGETYPE}" = "xuImage" -a \
>> +            ! -e arch/${ARCH}/boot/uImage ; then
>> +        ENTRYPOINT=${UBOOT_ENTRYPOINT}
>> +        if test -n "${UBOOT_ENTRYSYMBOL}"; then
>> +            ENTRYPOINT=`${HOST_PREFIX}nm ${S}/vmlinux | \
>> +                   awk '$3=="${UBOOT_ENTRYSYMBOL}" {print $1}'`
>> +        fi
>> +        if test -e arch/${ARCH}/boot/compressed/vmlinux ; then
>> +            ${OBJCOPY} -O binary -R .note -R .comment -S arch/${ARCH}/boot/compressed/vmlinux linux.bin
>> +            uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C none -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin arch/${ARCH}/boot/uImage
>> +            rm -f linux.bin
>> +        else
>> +            ${OBJCOPY} -O binary -R .note -R .comment -S vmlinux linux.bin
>> +            rm -f linux.bin.gz
>> +            gzip -9 linux.bin
>> +            uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C gzip -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin.gz arch/${ARCH}/boot/uImage
>> +            rm -f linux.bin.gz
>> +        fi
>> +    fi
>> +}
>> +
>> +addtask uboot_mkimage before do_install after do_compile
>> +
>> KERNEL_IMAGE_BASE_NAME ?= "${KERNEL_IMAGETYPE}-${PV}-${PR}-${MACHINE}-${DATETIME}"
>> # Don't include the DATETIME variable in the sstate package signatures
>> KERNEL_IMAGE_BASE_NAME[vardepsexclude] = "DATETIME"
>> @@ -496,22 +520,6 @@ kernel_do_deploy() {
>> 		tar -cvzf ${DEPLOYDIR}/modules-${KERNEL_VERSION}-${PR}-${MACHINE}.tgz -C ${D} lib
>> 	fi
>>
>> -	if test "x${KERNEL_IMAGETYPE}" = "xuImage" ; then
>> -		if test -e arch/${ARCH}/boot/uImage ; then
>> -			cp arch/${ARCH}/boot/uImage ${DEPLOYDIR}/${KERNEL_IMAGE_BASE_NAME}.bin
>> -		elif test -e arch/${ARCH}/boot/compressed/vmlinux ; then
>> -			${OBJCOPY} -O binary -R .note -R .comment -S arch/${ARCH}/boot/compressed/vmlinux linux.bin
>> -			uboot-mkimage -A ${ARCH} -O linux -T kernel -C none -a ${UBOOT_ENTRYPOINT} -e ${UBOOT_ENTRYPOINT} -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin ${DEPLOYDIR}/${KERNEL_IMAGE_BASE_NAME}.bin
>> -			rm -f linux.bin
>> -		else
>> -			${OBJCOPY} -O binary -R .note -R .comment -S vmlinux linux.bin
>> -			rm -f linux.bin.gz
>> -			gzip -9 linux.bin
>> -			uboot-mkimage -A ${ARCH} -O linux -T kernel -C gzip -a ${UBOOT_ENTRYPOINT} -e ${UBOOT_ENTRYPOINT} -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin.gz ${DEPLOYDIR}/${KERNEL_IMAGE_BASE_NAME}.bin
>> -			rm -f linux.bin.gz
>> -		fi
>> -	fi
>> -
>> 	cd ${DEPLOYDIR}
>> 	rm -f ${KERNEL_IMAGE_SYMLINK_NAME}.bin
>> 	ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin ${KERNEL_IMAGE_SYMLINK_NAME}.bin
>> --
>> 1.7.7.3
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


-- 
With best wishes
Dmitry



