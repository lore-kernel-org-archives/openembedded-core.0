Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <liming.wang@windriver.com>) id 1RnSSt-0007aI-F8
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jan 2012 11:09:59 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q0IA2I4C010078
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 18 Jan 2012 02:02:18 -0800 (PST)
Received: from [128.224.162.232] (128.224.162.232) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 18 Jan 2012 02:02:17 -0800
Message-ID: <4F169899.905@windriver.com>
Date: Wed, 18 Jan 2012 18:02:01 +0800
From: Liming Wang <liming.wang@windriver.com>
User-Agent: Mozilla/5.0 (Windows NT 5.1; rv:8.0) Gecko/20111105 Thunderbird/8.0
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <cover.1326786989.git.sgw@linux.intel.com>
	<4fed8429bc31211a979aaa496d2af8c574b1140a.1326786989.git.sgw@linux.intel.com>
	<CAMKF1sp_bM8w=q9SO=ezssH9t-rZedZDMD06oByUHX06wVnomQ@mail.gmail.com>
	<CADkTA4NEH+hMJnB1w+UK8ShZEQ+J1uCJw831F6f==YrZDzC+bA@mail.gmail.com>
In-Reply-To: <CADkTA4NEH+hMJnB1w+UK8ShZEQ+J1uCJw831F6f==YrZDzC+bA@mail.gmail.com>
X-Originating-IP: [128.224.162.232]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [CONSOLIDATED PULL 18/62] qemuppc: replace emulation of qemuppc from prep to mac99
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
X-List-Received-Date: Wed, 18 Jan 2012 10:09:59 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 2012-1-18 8:52, Bruce Ashfield wrote:
> On Tue, Jan 17, 2012 at 5:20 PM, Khem Raj<raj.khem@gmail.com>  wrote:
>> On Tue, Jan 17, 2012 at 12:32 AM, Saul Wold<sgw@linux.intel.com>  wrote:
>>> From: Liming Wang<liming.wang@windriver.com>
>>>
>>> With this new emulation, existing qemuppc functionality is maintained
>>> and other functionality such as framebuffer + sato and NFS boot are
>>> added.
>>>
>> We currently tune for 603e when we choose qemuppc machine is that still valid
>> core for G4 cpu ? I think from gcc point of view it should now use -m7400
>> so may be add another tune-file to oe-core
> That was the plan, to fix the tuning of this and the other PPC reference boards
> at the same time. Liming and I had discussed this before, and we wanted to get
> this into the tree, and tweak it there.
>
> Liming: we can open a bug to track the update of the tuning .. just so we don't
> forget.
OK,  Bug 1914 - modify the tune files of ppc targets is opened.

Liming Wang
>
> Cheers,
>
> Bruce
>
>>> Signed-off-by: Liming Wang<liming.wang@windriver.com>
>>> Signed-off-by: Bruce Ashfield<bruce.ashfield@windriver.com>
>>> ---
>>>   meta/conf/machine/qemuppc.conf                  |    2 +-
>>>   meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb |    2 +-
>>>   meta/recipes-kernel/linux/linux-yocto_3.0.bb    |    2 +-
>>>   scripts/runqemu                                 |    7 +------
>>>   scripts/runqemu-internal                        |   16 ++++++++--------
>>>   5 files changed, 12 insertions(+), 17 deletions(-)
>>>
>>> diff --git a/meta/conf/machine/qemuppc.conf b/meta/conf/machine/qemuppc.conf
>>> index bcc408f..48eecb7 100644
>>> --- a/meta/conf/machine/qemuppc.conf
>>> +++ b/meta/conf/machine/qemuppc.conf
>>> @@ -5,7 +5,7 @@
>>>   require conf/machine/include/qemu.inc
>>>   require conf/machine/include/tune-ppc603e.inc
>>>
>>> -KERNEL_IMAGETYPE = "zImage"
>>> +KERNEL_IMAGETYPE = "vmlinux"
>>>
>>>   SERIAL_CONSOLE = "115200 ttyS0"
>>>
>>> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
>>> index c8983c4..c6bf446 100644
>>> --- a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
>>> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
>>> @@ -16,7 +16,7 @@ LINUX_KERNEL_TYPE = "preempt-rt"
>>>
>>>   SRCREV_machine ?= "bcf4107c7f22d10952618a2ad146e6149d240cd2"
>>>   SRCREV_machine_qemuppc ?= "1e5511ea2cb5f150ffce86071035a81c0499494b"
>>> -SRCREV_meta ?= "6ae3d992cf546184010e87a0349810198f1d167c"
>>> +SRCREV_meta ?= "73dafd44ea875df654129b32b2877f342d5573e4"
>>>
>>>   PR = "r1"
>>>   PV = "${LINUX_VERSION}+git${SRCPV}"
>>> diff --git a/meta/recipes-kernel/linux/linux-yocto_3.0.bb b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
>>> index 921c258..e624b48 100644
>>> --- a/meta/recipes-kernel/linux/linux-yocto_3.0.bb
>>> +++ b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
>>> @@ -18,7 +18,7 @@ SRCREV_machine_qemuppc ?= "10e808d1c304b14cf42903fd637f239766b78476"
>>>   SRCREV_machine_qemux86 ?= "e04f9f8e564c60b1ce907d64074c18730f8dab4e"
>>>   SRCREV_machine_qemux86-64 ?= "53c2fa060d34e9a0b59e19398aeebbe73f24d89b"
>>>   SRCREV_machine ?= "fe80c1e343bf8f038328a612cef7f821d7ec8dbf"
>>> -SRCREV_meta ?= "6ae3d992cf546184010e87a0349810198f1d167c"
>>> +SRCREV_meta ?= "73dafd44ea875df654129b32b2877f342d5573e4"
>>>
>>>   PR = "r2"
>>>   PV = "${LINUX_VERSION}+git${SRCPV}"
>>> diff --git a/scripts/runqemu b/scripts/runqemu
>>> index bed6a29..ac5facf 100755
>>> --- a/scripts/runqemu
>>> +++ b/scripts/runqemu
>>> @@ -262,7 +262,7 @@ QEMUARM_DEFAULT_FSTYPE=ext3
>>>   QEMUMIPS_DEFAULT_KERNEL=vmlinux-qemumips.bin
>>>   QEMUMIPS_DEFAULT_FSTYPE=ext3
>>>
>>> -QEMUPPC_DEFAULT_KERNEL=zImage-qemuppc.bin
>>> +QEMUPPC_DEFAULT_KERNEL=vmlinux-qemuppc.bin
>>>   QEMUPPC_DEFAULT_FSTYPE=ext3
>>>
>>>   AKITA_DEFAULT_KERNEL=zImage-akita.bin
>>> @@ -365,11 +365,6 @@ if [ -z "$FSTYPE" ]; then
>>>      fi
>>>   fi
>>>
>>> -if [ "$FSTYPE" = "nfs" -a "$MACHINE" = "qemuppc" ]; then
>>> -    echo "Error: usermode NFS boot is not available for qemuppc."
>>> -    exit 1
>>> -fi
>>> -
>>>   # FSTYPE is now set for all cases
>>>
>>>   # Handle cases where a ROOTFS type is given instead of a filename, e.g.
>>> diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
>>> index 2968ed9..c55619b 100755
>>> --- a/scripts/runqemu-internal
>>> +++ b/scripts/runqemu-internal
>>> @@ -389,13 +389,13 @@ fi
>>>
>>>   if [ "$MACHINE" = "qemuppc" ]; then
>>>      QEMU=qemu-system-ppc
>>> -    MACHINE_SUBTYPE=prep
>>> -    CPU_SUBTYPE=603e
>>> -    BIOS=powerpc_rom.bin
>>> -    QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS -nographic"
>>> +    MACHINE_SUBTYPE=mac99
>>> +    CPU_SUBTYPE=G4
>>> +    QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS"
>>> +    QEMU_NETWORK_CMD="-net nic,model=pcnet $QEMU_TAP_CMD"
>>>      if [ "$FSTYPE" = "ext3" -o "$FSTYPE" = "btrfs" ]; then
>>> -        KERNCMDLINE="root=/dev/hda rw console=ttyS0 3 $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
>>> -        QEMUOPTIONS="$QEMU_NETWORK_CMD -cpu $CPU_SUBTYPE -M $MACHINE_SUBTYPE -bios $BIOS -hda $ROOTFS -no-reboot $QEMU_UI_OPTIONS"
>>> +        KERNCMDLINE="root=/dev/hda rw console=ttyS0 $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
>>> +        QEMUOPTIONS="$QEMU_NETWORK_CMD -cpu $CPU_SUBTYPE -M $MACHINE_SUBTYPE -hda $ROOTFS -no-reboot $QEMU_UI_OPTIONS"
>>>      fi
>>>      if [ "$FSTYPE" = "nfs" ]; then
>>>          if [ "$NFS_SERVER" = "192.168.7.1" -a ! -d "$NFS_DIR" ]; then
>>> @@ -403,8 +403,8 @@ if [ "$MACHINE" = "qemuppc" ]; then
>>>              cleanup
>>>              return
>>>          fi
>>> -        KERNCMDLINE="root=/dev/nfs console=ttyS0 3 nfsroot=$NFS_SERVER:$NFS_DIR,$UNFS_OPTS rw $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
>>> -        QEMUOPTIONS="$QEMU_NETWORK_CMD -cpu $CPU_SUBTYPE -M $MACHINE_SUBTYPE -bios $BIOS -no-reboot $QEMU_UI_OPTIONS"
>>> +        KERNCMDLINE="root=/dev/nfs console=ttyS0 nfsroot=$NFS_SERVER:$NFS_DIR,$UNFS_OPTS rw $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
>>> +        QEMUOPTIONS="$QEMU_NETWORK_CMD -cpu $CPU_SUBTYPE -M $MACHINE_SUBTYPE -no-reboot $QEMU_UI_OPTIONS"
>>>      fi
>>>   fi
>>>
>>> --
>>> 1.7.6.5
>>>
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>



