Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1TDpXl-0005Af-VC
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Sep 2012 06:36:18 +0200
Received: by lagv3 with SMTP id v3so4360527lag.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2012 21:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=6mVSxV6n8DsK1DBAqAcDT51pnuwmdeS+No/J4w7eg2U=;
	b=Sn/ngYUn4EMS3oztqCUyJhbTTao/kIBAYftGYBszfqrkzvgX+zJMaac/TJbNjT3yKh
	qwqnW0S6mBzXERgWCegYajQ59RUfE5I1tWCh8pJGFmdJcOk9ArGhesl+YbS1NCtyZceX
	EJSHIEJyzj2tTWcz6DRPdvW0Sq7pRcX/1UxnGxR0ZM9sXM0Te0dYfIR5p1kqjaOzeIbe
	ECdMi4nJZ0t8nIrqlekDJcQR0oxitP3hZqwInyqat0ge4wwtt4Qgs7A3kDCpuQ5g3bf5
	JGjs49oHuumW/LaElZRVQz+3tJT8d1RvyiloGOhvMxA2uFp8prdi9ivNAJBAQUecEZDT
	oFdw==
MIME-Version: 1.0
Received: by 10.112.49.202 with SMTP id w10mr4531861lbn.109.1347942218127;
	Mon, 17 Sep 2012 21:23:38 -0700 (PDT)
Received: by 10.114.68.20 with HTTP; Mon, 17 Sep 2012 21:23:38 -0700 (PDT)
In-Reply-To: <5057BF14.9000603@linux.intel.com>
References: <1347882817-3118-1-git-send-email-cristian.iorga@intel.com>
	<5057BF14.9000603@linux.intel.com>
Date: Tue, 18 Sep 2012 00:23:38 -0400
Message-ID: <CADkTA4Pju4n0ewOv=nrpkJnLT8NGerS5efwFxONhsLaFa+EL8Q@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemux86: Support for KVM, paravirt and virtio added
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Sep 2012 04:36:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Sep 17, 2012 at 8:23 PM, Saul Wold <sgw@linux.intel.com> wrote:
> On 09/17/2012 04:53 AM, Cristian Iorga wrote:
>>
>> KVM, paravirtualization and virtio drivers are now activated
>> in runqemu using the kvm option flag for qemux86.
>> Host CPU features are also exported to guest OS (Yocto Linux).
>> Usage example: runqemu qemux86 core-image-x11 kvm
>>
>> Implements [YOCTO #2550].
>>
>> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
>> ---
>>   meta/recipes-kernel/linux/linux-yocto_3.4.bb |    1 +
>>   scripts/runqemu                              |   16 +++++++++++++++-
>>   scripts/runqemu-internal                     |   14 +++++++++++---
>>   3 files changed, 27 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
>> b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
>> index 7c082e7..32ae02b 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
>> +++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
>> @@ -27,4 +27,5 @@ KERNEL_REVISION_CHECKING=""
>>   KERNEL_FEATURES_append = " features/netfilter"
>>   KERNEL_FEATURES_append_qemux86=" cfg/sound"
>>   KERNEL_FEATURES_append_qemux86-64=" cfg/sound"
>> +KERNEL_FEATURES_append_qemux86=" cfg/paravirt_kvm"
>
>
> Good patch, with one question.
>
> Can the be a valid KERNEL_FEATURE for x86-64 also? Any reason not to?

It's also valid for x86_64. I'm going to be travelling for the next
day or so, but
if such a patch is done, I wouldn't object.

Bruce

>
> Sau!
>
>
>
>>   KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32",
>> " cfg/x32", "" ,d)}"
>> diff --git a/scripts/runqemu b/scripts/runqemu
>> index e843946..167e157 100755
>> --- a/scripts/runqemu
>> +++ b/scripts/runqemu
>> @@ -208,6 +208,7 @@ if [ -z "$MACHINE" ]; then
>>   fi
>>
>>
>> YOCTO_KVM_WIKI="https://wiki.yoctoproject.org/wiki/How_to_enable_KVM_for_Poky_qemu"
>>
>> +YOCTO_PARAVIRT_KVM_WIKI="https://wiki.yoctoproject.org/wiki/Running_an_x86_Yocto_Linux_image_under_QEMU_KVM"
>>   # Detect KVM configuration
>>   if [ "x$KVM_ENABLED" = "xyes" ]; then
>>       if [ -z "$KVM_CAPABLE" ]; then
>> @@ -226,14 +227,27 @@ if [ "x$KVM_ENABLED" = "xyes" ]; then
>>           echo "$YOCTO_KVM_WIKI";
>>           exit 1;
>>       fi
>> +    if [ ! -e /dev/vhost-net ]; then
>> +        echo "Missing virtio net device. Have you inserted vhost-net
>> module?"
>> +        echo "For further help see"
>> +        echo "$YOCTO_PARAVIRT_KVM_WIKI";
>> +        exit 1;
>> +    fi
>>       if 9<>/dev/kvm ; then
>> -        SCRIPT_QEMU_OPT="$SCRIPT_QEMU_OPT -enable-kvm"
>> +        SCRIPT_QEMU_OPT="$SCRIPT_QEMU_OPT -enable-kvm -cpu host"
>> +        KVM_ACTIVE="yes"
>>       else
>>           echo "You have no rights on /dev/kvm."
>>           echo "Please change the ownership of this file as described at"
>>           echo "$YOCTO_KVM_WIKI";
>>           exit 1;
>>       fi
>> +    if [ ! -w /dev/vhost-net -a -r /dev/vhost-net ]; then
>> +        echo "You have no rights on /dev/vhost-net."
>> +        echo "Please change the ownership of this file as described at"
>> +        echo "$YOCTO_PARAVIRT_KVM_WIKI";
>> +        exit 1;
>> +    fi
>>   fi
>>
>>   machine2=`echo $MACHINE | tr 'a-z' 'A-Z' | sed 's/-/_/'`
>> diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
>> index a9b1c44..f2c8d83 100755
>> --- a/scripts/runqemu-internal
>> +++ b/scripts/runqemu-internal
>> @@ -221,7 +221,15 @@ n2=$(($n1 + 1))
>>
>>   KERNEL_NETWORK_CMD="ip=192.168.7.$n2::192.168.7.$n1:255.255.255.0"
>>   QEMU_TAP_CMD="-net tap,vlan=0,ifname=$TAP,script=no,downscript=no"
>> -QEMU_NETWORK_CMD="-net nic,vlan=0 $QEMU_TAP_CMD"
>> +if [ "$KVM_ACTIVE" = "yes" ]; then
>> +    QEMU_NETWORK_CMD="-net nic,model=virtio $QEMU_TAP_CMD,vhost=on"
>> +    DROOT="/dev/vda"
>> +    ROOTFS_OPTIONS="-drive file=$ROOTFS,if=virtio"
>> +else
>> +    QEMU_NETWORK_CMD="-net nic,vlan=0 $QEMU_TAP_CMD"
>> +    DROOT="/dev/hda"
>> +    ROOTFS_OPTIONS="-hda $ROOTFS"
>> +fi
>>   KERNCMDLINE="mem=$QEMU_MEMORY"
>>   QEMU_UI_OPTIONS="-show-cursor -usb -usbdevice wacom-tablet"
>>
>> @@ -321,8 +329,8 @@ if [ "$MACHINE" = "qemux86" ]; then
>>       QEMU=qemu-system-i386
>>       QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS -vga vmware"
>>       if [ "$FSTYPE" = "ext2" -o "$FSTYPE" = "ext3" -o "$FSTYPE" = "btrfs"
>> ]; then
>> -        KERNCMDLINE="vga=0 root=/dev/hda rw mem=$QEMU_MEMORY
>> $KERNEL_NETWORK_CMD"
>> -        QEMUOPTIONS="$QEMU_NETWORK_CMD -hda $ROOTFS $QEMU_UI_OPTIONS"
>> +        KERNCMDLINE="vga=0 root=$DROOT rw mem=$QEMU_MEMORY
>> $KERNEL_NETWORK_CMD"
>> +        QEMUOPTIONS="$QEMU_NETWORK_CMD $ROOTFS_OPTIONS $QEMU_UI_OPTIONS"
>>       fi
>>       if [ "$FSTYPE" = "nfs" ]; then
>>           if [ "$NFS_SERVER" = "192.168.7.1" -a ! -d "$NFS_DIR" ]; then
>>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


