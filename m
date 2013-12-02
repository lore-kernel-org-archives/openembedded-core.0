Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 31CC26DD28
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Dec 2013 18:28:32 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 02 Dec 2013 10:28:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,812,1378882800"; d="scan'208";a="418101841"
Received: from unknown (HELO [10.255.15.171]) ([10.255.15.171])
	by orsmga001.jf.intel.com with ESMTP; 02 Dec 2013 10:28:25 -0800
Message-ID: <529CD149.8040206@linux.intel.com>
Date: Mon, 02 Dec 2013 10:28:25 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <1385159590-27427-1-git-send-email-sgw@linux.intel.com>
	<CADkTA4OefQPB3r4EjthZoGEnW=4Q1knwm6WgPG7eV9BveVZ21g@mail.gmail.com>
In-Reply-To: <CADkTA4OefQPB3r4EjthZoGEnW=4Q1knwm6WgPG7eV9BveVZ21g@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] runqemu: Extend to support genericx86* machine types
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
X-List-Received-Date: Mon, 02 Dec 2013 18:28:32 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/22/2013 06:00 PM, Bruce Ashfield wrote:
> On Fri, Nov 22, 2013 at 5:33 PM, Saul Wold <sgw@linux.intel.com> wrote:
>> I have done some very basic testing to boot to graphics and run some graphics
>> programs.  The genericx86* currently do not have Sound or NFSD support enabled
>> which qemux86* kernel do.  There might be some other bits needed, I am working
>> to figure that out.
>
> I've had many debates over what you are doing with this commit over the years,
> so I'll ask here.
>
> What exactly do we gain by enabling this directly that qemux86* doesn't already
> give us ? Maintaining machines that boot on hardware AND on simulation leads
> to compromise and sometimes partial insanity (trust me on this, I've
> lived it) ..
> so again, what does booting genericx86 vs qemux86 gain.
>
I believe that this is fairly doable in the x86 space since the compiler 
setup and kernel configurations are almost identical, sound and nfs are 
missing from the generic configuration.

This will also help our CI on the autobuilder since it will drop 2 machines.

> I'd go as far as to suggest that qemux86 be dropped in favour of genericx86 if
> this goes in. Or runqemu be made extensible so the genericx86 enablement
> could stay in a layer where it belongs.
>
I will be sending an RFC to drop qemux86 and qemux86-64 in favor of the 
generic equivalents.

There is also a bug filed to make runqemu more extensible, should be 
coming in later in 1.6.

Sau!

> Cheers,
>
> Bruce
>
>>
>> [YOCTO #5105]
>>
>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>> ---
>>   scripts/runqemu          | 21 +++++++++++++++------
>>   scripts/runqemu-internal | 10 ++++++----
>>   2 files changed, 21 insertions(+), 10 deletions(-)
>>
>> diff --git a/scripts/runqemu b/scripts/runqemu
>> index 619ffb6..1f8199c 100755
>> --- a/scripts/runqemu
>> +++ b/scripts/runqemu
>> @@ -108,6 +108,7 @@ while true; do
>>       arg=${1}
>>       case "$arg" in
>>           "qemux86" | "qemux86-64" | "qemuarm" | "qemumips" | "qemumipsel" | \
>> +        "genericx86" | "genericx86-64" | \
>>           "qemumips64" | "qemush4"  | "qemuppc" | "qemumicroblaze" | "qemuzynq")
>>               [ -z "$MACHINE" ] && MACHINE=$arg || \
>>                   error "conflicting MACHINE types [$MACHINE] and [$arg]"
>> @@ -163,7 +164,8 @@ while true; do
>>               SCRIPT_KERNEL_OPT="$SCRIPT_KERNEL_OPT ${arg##bootparams=}"
>>               ;;
>>           "audio")
>> -            if [ "x$MACHINE" = "xqemux86" -o "x$MACHINE" = "xqemux86-64" ]; then
>> +            if [ "x$MACHINE" = "xqemux86" -o "x$MACHINE" = "xqemux86-64" -o \
>> +                 "x$MACHINE" = "xgenericx86" -o "x$MACHINE" = "xgenericx86-64" ]; then
>>                   echo "Enabling audio in qemu."
>>                   echo "Please install snd_intel8x0 or snd_ens1370 driver in linux guest."
>>                   QEMU_AUDIO_DRV="alsa"
>> @@ -224,13 +226,13 @@ fi
>>
>>   if [ -z "$MACHINE" ]; then
>>       if [ "x$FSTYPE" = "xvmdk" ]; then
>> -        MACHINE=`basename $VM | sed -n 's/.*\(qemux86-64\|qemux86\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/\1/p'`
>> +        MACHINE=`basename $VM | sed -n 's/.*\(qemux86-64\|qemux86\|genericx86-64\|genericx86\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/\1/p'`
>>           if [ -z "$MACHINE" ]; then
>>               error "Unable to set MACHINE from vmdk filename [$VM]"
>>           fi
>>           echo "Set MACHINE to [$MACHINE] based on vmdk [$VM]"
>>       else
>> -        MACHINE=`basename $KERNEL | sed -n 's/.*\(qemux86-64\|qemux86\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/\1/p'`
>> +        MACHINE=`basename $KERNEL | sed -n 's/.*\(qemux86-64\|qemux86\|genericx86-64\|genericx86\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/\1/p'`
>>           if [ -z "$MACHINE" ]; then
>>               error "Unable to set MACHINE from kernel filename [$KERNEL]"
>>           fi
>> @@ -248,7 +250,8 @@ if [ "x$KVM_ENABLED" = "xyes" ]; then
>>           echo "$YOCTO_KVM_WIKI";
>>           exit 1;
>>       fi
>> -    if [ "x$MACHINE" != "xqemux86" -a "x$MACHINE" != "xqemux86-64" ]; then
>> +    if [ "x$MACHINE" != "xqemux86" -a "x$MACHINE" != "xqemux86-64" -o \
>> +         "x$MACHINE" != "xgenericx86" -a "x$MACHINE" != "xgenericx86-64" ]; then
>>           echo "KVM only support x86 & x86-64. Remove kvm from the command-line";
>>           exit 1;
>>       fi
>> @@ -265,9 +268,9 @@ if [ "x$KVM_ENABLED" = "xyes" ]; then
>>           exit 1;
>>       fi
>>       if [ -w /dev/kvm -a -r /dev/kvm ]; then
>> -        if [ "x$MACHINE" = "xqemux86" ]; then
>> +        if [ "x$MACHINE" = "xqemux86" -o "x$MACHINE" = "xgeneric86" ]; then
>>               SCRIPT_QEMU_OPT="$SCRIPT_QEMU_OPT -enable-kvm -cpu kvm32"
>> -        elif [ "x$MACHINE" = "xqemux86-64" ]; then
>> +        elif [ "x$MACHINE" = "xqemux86-64" -o "x$MACHINE" = "xgeneric86-64" ]; then
>>               SCRIPT_QEMU_OPT="$SCRIPT_QEMU_OPT -enable-kvm -cpu kvm64"
>>           fi
>>           KVM_ACTIVE="yes"
>> @@ -292,9 +295,15 @@ machine2=`echo $MACHINE | tr 'a-z' 'A-Z' | sed 's/-/_/'`
>>   QEMUX86_DEFAULT_KERNEL=bzImage-qemux86.bin
>>   QEMUX86_DEFAULT_FSTYPE=ext3
>>
>> +GENERICX86_DEFAULT_KERNEL=bzImage-genericx86.bin
>> +GENERICX86_DEFAULT_FSTYPE=ext3
>> +
>>   QEMUX86_64_DEFAULT_KERNEL=bzImage-qemux86-64.bin
>>   QEMUX86_64_DEFAULT_FSTYPE=ext3
>>
>> +GENERICX86_64_DEFAULT_KERNEL=bzImage-genericx86-64.bin
>> +GENERICX86_64_DEFAULT_FSTYPE=ext3
>> +
>>   QEMUARM_DEFAULT_KERNEL=zImage-qemuarm.bin
>>   QEMUARM_DEFAULT_FSTYPE=ext3
>>
>> diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
>> index 74b0c35..e7b8a82 100755
>> --- a/scripts/runqemu-internal
>> +++ b/scripts/runqemu-internal
>> @@ -41,10 +41,10 @@ if [ ! -z "$mem_set" ] ; then
>>     mem_size=`echo $mem_set | sed 's/-m[[:space:]] *//'`
>>   else
>>       case "$MACHINE" in
>> -        "qemux86")
>> +        "qemux86"|"genericx86")
>>               mem_size=256
>>               ;;
>> -        "qemux86-64")
>> +        "qemux86-64"|"genericx86-64")
>>               mem_size=256
>>               ;;
>>           "qemuarm")
>> @@ -280,6 +280,8 @@ case "$MACHINE" in
>>       "qemuarmv7") ;;
>>       "qemux86") ;;
>>       "qemux86-64") ;;
>> +    "genericx86") ;;
>> +    "genericx86-64") ;;
>>       "qemuzynq") ;;
>>       "akita") ;;
>>       "spitz") ;;
>> @@ -355,7 +357,7 @@ if [ "$MACHINE" = "qemuarm" -o "$MACHINE" = "qemuarmv6" -o "$MACHINE" = "qemuarm
>>       fi
>>   fi
>>
>> -if [ "$MACHINE" = "qemux86" ]; then
>> +if [ "$MACHINE" = "qemux86" -o "$MACHINE" = "genericx86" ]; then
>>       QEMU=qemu-system-i386
>>       QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS -vga vmware"
>>       if [ "${FSTYPE:0:3}" = "ext" -o "$FSTYPE" = "btrfs" ]; then
>> @@ -379,7 +381,7 @@ if [ "$MACHINE" = "qemux86" ]; then
>>       KERNCMDLINE="$KERNCMDLINE oprofile.timer=1"
>>   fi
>>
>> -if [ "$MACHINE" = "qemux86-64" ]; then
>> +if [ "$MACHINE" = "qemux86-64" -o "$MACHINE" = "genericx86-64" ]; then
>>       QEMU=qemu-system-x86_64
>>       QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS -vga vmware"
>>       if [ "${FSTYPE:0:3}" = "ext" -o "$FSTYPE" = "btrfs" ]; then
>> --
>> 1.8.3.1
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>

