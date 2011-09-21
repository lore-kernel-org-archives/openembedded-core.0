Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1R6MeN-0006Dm-6K for openembedded-core@lists.openembedded.org;
	Wed, 21 Sep 2011 15:15:43 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1R6MZE-0005LM-Rk for openembedded-core@lists.openembedded.org;
	Wed, 21 Sep 2011 15:10:24 +0200
Received: from nat-rup.mentorg.com ([139.181.168.34])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2011 15:10:24 +0200
Received: from dbaryshkov by nat-rup.mentorg.com with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2011 15:10:24 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-core@lists.openembedded.org
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Date: Wed, 21 Sep 2011 17:09:30 +0400
Message-ID: <j5cnnj$96h$1@dough.gmane.org>
References: <1316297897-698-1-git-send-email-dbaryshkov@gmail.com>	<1316297897-698-3-git-send-email-dbaryshkov@gmail.com>
	<CAP9ODKpqLWUaGU=QyRNcshtJkjtEUFoLv9nGuU2QGfu7pyWtZA@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: nat-rup.mentorg.com
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.21) Gecko/20110831 Iceowl/1.0b2 Icedove/3.1.13
In-Reply-To: <CAP9ODKpqLWUaGU=QyRNcshtJkjtEUFoLv9nGuU2QGfu7pyWtZA@mail.gmail.com>
Subject: Re: [PATCH 3/5] kernel.bbclass: move uImage handling to separate task
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
X-List-Received-Date: Wed, 21 Sep 2011 13:15:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/18/2011 02:25 AM, Otavio Salvador wrote:
> This was nack'ed but I don't remember why; Richard?

This was nack'ed because that version of the patch didn't check
for existence of uImage built by kernel tree (not present in 
oe-dev/meta-oe, added in oe-core as somebody had problems with 
regenerated uImage). My version of the patch has such check, so it can 
go in probably.

>
> On Sat, Sep 17, 2011 at 19:18, Dmitry Eremin-Solenikov
> <dbaryshkov@gmail.com>  wrote:
>> As per org.oe.dev and meta-oe's kernel.bbclass move uImage creation to
>> separate task from do_deploy. The only major feature of oe-core's
>> version (not to recreate uImage if it exists) is retained in this patch.
>>
>> Signed-off-by: Dmitry Eremin-Solenikov<dbaryshkov@gmail.com>
>> ---
>>   meta/classes/kernel.bbclass |   40 ++++++++++++++++++++++++----------------
>>   1 files changed, 24 insertions(+), 16 deletions(-)
>>
>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>> index b44e3b5..6ff4018 100644
>> --- a/meta/classes/kernel.bbclass
>> +++ b/meta/classes/kernel.bbclass
>> @@ -486,6 +486,30 @@ do_sizecheck() {
>>
>>   addtask sizecheck before do_install after do_compile
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
>>   KERNEL_IMAGE_BASE_NAME ?= "${KERNEL_IMAGETYPE}-${PV}-${PR}-${MACHINE}-${DATETIME}"
>>   # Don't include the DATETIME variable in the sstate package signatures
>>   KERNEL_IMAGE_BASE_NAME[vardepsexclude] = "DATETIME"
>> @@ -497,22 +521,6 @@ kernel_do_deploy() {
>>                 tar -cvzf ${DEPLOYDIR}/modules-${KERNEL_VERSION}-${PR}-${MACHINE}.tgz -C ${D} lib
>>         fi
>>
>> -       if test "x${KERNEL_IMAGETYPE}" = "xuImage" ; then
>> -               if test -e arch/${ARCH}/boot/uImage ; then
>> -                       cp arch/${ARCH}/boot/uImage ${DEPLOYDIR}/${KERNEL_IMAGE_BASE_NAME}.bin
>> -               elif test -e arch/${ARCH}/boot/compressed/vmlinux ; then
>> -                       ${OBJCOPY} -O binary -R .note -R .comment -S arch/${ARCH}/boot/compressed/vmlinux linux.bin
>> -                       uboot-mkimage -A ${ARCH} -O linux -T kernel -C none -a ${UBOOT_ENTRYPOINT} -e ${UBOOT_ENTRYPOINT} -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin ${DEPLOYDIR}/${KERNEL_IMAGE_BASE_NAME}.bin
>> -                       rm -f linux.bin
>> -               else
>> -                       ${OBJCOPY} -O binary -R .note -R .comment -S vmlinux linux.bin
>> -                       rm -f linux.bin.gz
>> -                       gzip -9 linux.bin
>> -                       uboot-mkimage -A ${ARCH} -O linux -T kernel -C gzip -a ${UBOOT_ENTRYPOINT} -e ${UBOOT_ENTRYPOINT} -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin.gz ${DEPLOYDIR}/${KERNEL_IMAGE_BASE_NAME}.bin
>> -                       rm -f linux.bin.gz
>> -               fi
>> -       fi
>> -
>>         cd ${DEPLOYDIR}
>>         rm -f ${KERNEL_IMAGE_SYMLINK_NAME}.bin
>>         ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin ${KERNEL_IMAGE_SYMLINK_NAME}.bin
>> --
>> 1.7.2.5
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>
>
>




