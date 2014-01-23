Return-Path: <valentin.popa@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 567936B05F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 10:12:12 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 23 Jan 2014 02:08:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,705,1384329600"; d="scan'208";a="471218266"
Received: from vpopa-desktop.rb.intel.com (HELO [10.237.105.47])
	([10.237.105.47])
	by orsmga002.jf.intel.com with ESMTP; 23 Jan 2014 02:12:09 -0800
Message-ID: <52E0EB0B.1090201@intel.com>
Date: Thu, 23 Jan 2014 12:12:27 +0200
From: Valentin Popa <valentin.popa@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1387461777-25101-1-git-send-email-valentin.popa@intel.com>
	<CAJTo0LYyvpbqXDLXH6vGjG+K+w-ZNi4Lu0UAvXFxnb6Emx=D5A@mail.gmail.com>
In-Reply-To: <CAJTo0LYyvpbqXDLXH6vGjG+K+w-ZNi4Lu0UAvXFxnb6Emx=D5A@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] runqemu: Allow user to set -vga option with qemuparams
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
X-List-Received-Date: Thu, 23 Jan 2014 10:12:12 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/22/2014 05:46 PM, Burton, Ross wrote:
> Just noticed that this was merged but doesn't add anything to the
> usage() function in runqemu - can you quickly add something?
>
> Ross
>
> On 19 December 2013 14:02, Valentin Popa <valentin.popa@intel.com> wrote:
>> At the moment, the user cannot to set -vga other then vmware
>> (because "vmware" is set by default); and the first argument
>> in qemuparams has higher precedence.
>>
>> Signed-off-by: Valentin Popa <valentin.popa@intel.com>
>> ---
>>   scripts/runqemu          |  1 +
>>   scripts/runqemu-internal | 12 ++++++++++--
>>   2 files changed, 11 insertions(+), 2 deletions(-)
>>
>> diff --git a/scripts/runqemu b/scripts/runqemu
>> index 9c0a03b..dcb2931 100755
>> --- a/scripts/runqemu
>> +++ b/scripts/runqemu
>> @@ -156,6 +156,7 @@ while true; do
>>               # to use simplified options instead
>>               serial_option=`expr "$SCRIPT_QEMU_EXTRA_OPT" : '.*\(-serial\)'`
>>               kvm_option=`expr "$SCRIPT_QEMU_EXTRA_OPT" : '.*\(-enable-kvm\)'`
>> +            vga_option=`expr "$SCRIPT_QEMU_EXTRA_OPT" : '.*\(-vga\)'`
>>               [ ! -z "$serial_option" -o ! -z "$kvm_option" ] && \
>>                   echo "Please use simplified serial or kvm options instead"
>>               ;;
>> diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
>> index 74b0c35..284b88c 100755
>> --- a/scripts/runqemu-internal
>> +++ b/scripts/runqemu-internal
>> @@ -357,7 +357,11 @@ fi
>>
>>   if [ "$MACHINE" = "qemux86" ]; then
>>       QEMU=qemu-system-i386
>> -    QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS -vga vmware"
>> +    if [ ! -z "$vga_option" ]; then
>> +        QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS"
>> +    else
>> +        QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS -vga vmware"
>> +    fi
>>       if [ "${FSTYPE:0:3}" = "ext" -o "$FSTYPE" = "btrfs" ]; then
>>           KERNCMDLINE="vga=0 uvesafb.mode_option=640x480-32 root=$DROOT rw mem=$QEMU_MEMORY $KERNEL_NETWORK_CMD"
>>           QEMUOPTIONS="$QEMU_NETWORK_CMD $ROOTFS_OPTIONS $QEMU_UI_OPTIONS"
>> @@ -381,7 +385,11 @@ fi
>>
>>   if [ "$MACHINE" = "qemux86-64" ]; then
>>       QEMU=qemu-system-x86_64
>> -    QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS -vga vmware"
>> +    if [ ! -z "$vga_option" ]; then
>> +        QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS"
>> +    else
>> +        QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS -vga vmware"
>> +    fi
>>       if [ "${FSTYPE:0:3}" = "ext" -o "$FSTYPE" = "btrfs" ]; then
>>           KERNCMDLINE="vga=0 uvesafb.mode_option=640x480-32 root=$DROOT rw mem=$QEMU_MEMORY $KERNEL_NETWORK_CMD"
>>           QEMUOPTIONS="$QEMU_NETWORK_CMD $ROOTFS_OPTIONS $QEMU_UI_OPTIONS"
>> --
>> 1.8.3.2
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
That patch doesn't add -vga as a simplified options, it just do what
"qemuparams=\"xyz\" - specify custom parameters to QEMU" in usage() 
says. So, it's a fix.
The problem was that you couldn't set a custom -vga for qemux86 and 
qemux86_64 because the default value (vmware) had a higher precedence in 
the command line. For qemumips* the behavior remains, but - I think -  
this is because nothing else but cirrus works with it. If you know 
something about this just let me know; maybe this has to be fixed also.

