Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 476016BB90
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 20:03:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r7RK3vGs016910
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 27 Aug 2013 13:03:57 -0700 (PDT)
Received: from [128.224.146.67] (128.224.146.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Tue, 27 Aug 2013 13:03:57 -0700
Message-ID: <521D0622.6090802@windriver.com>
Date: Tue, 27 Aug 2013 16:03:46 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Elvis Dowson <elvis.dowson@gmail.com>
References: <20130825104341.a5c5c4a29245e5c988b774ab8f895ac5.305c945aa2.wbe@email15.secureserver.net>
	<835D4942-DCEA-4634-9822-24ADDCAD8DF7@gmail.com>
	<092BF80A-B02A-4506-840E-2EEEE48CE298@gmail.com>
	<4AC41A5E-073D-4973-82BD-F94A8B168F34@gmail.com>
	<521AA95A.8000803@windriver.com>
	<7DBFB4EE-4727-422F-8815-D801827A37C9@gmail.com>
	<521AD896.3000503@windriver.com>
	<6324D287-2CA2-4A88-AFF4-58CABE82B2CC@gmail.com>
	<521BA7CB.7070206@windriver.com>
	<2D33FB6A-9F7F-4E8E-8B1A-CED1D571A82C@gmail.com>
In-Reply-To: <2D33FB6A-9F7F-4E8E-8B1A-CED1D571A82C@gmail.com>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: QEMU with ARM Cortex A9 with hard float configuration - Kernel panic
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
X-List-Received-Date: Tue, 27 Aug 2013 20:03:59 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 13-08-26 03:35 PM, Elvis Dowson wrote:
> Hi Bruce,
>
> On Aug 26, 2013, at 11:08 PM, Bruce Ashfield
> <bruce.ashfield@windriver.com <mailto:bruce.ashfield@windriver.com>> wrote:
>
>> Are you interested in something from scratch, versus something that
>> isn't already partially in the tree (like qemuarma9) ?
>>
>> We've got a few docs and tutorials, but I can also help step you through
>> the process to assist the existing material.
>
> I'd like to adapt the existing linux-yocto standard/base branch, and
> build up on existing qemuarma9 support. I've included detailed patch
> fragments below, so that you can replicate the current state of my work
> at your end.

Not ignoring this, I've just been tied up with 3.10 kernel work. I'll
get back to this shortly.

Cheers,

Bruce

>
> I've performed the following steps till date, but unfortunately get a
> qemu ram / rom out of memory address error after doing all this. Must be
> because of an incorrectly mapped KMACHINE. The vexpress device doesn't
> support PCI, IDE or SCSI, only microsd card or ram devices, so the boot
> method should use an initrd file, for the root filesystem, as described
> here.
>
> https://wiki.linaro.org/PeterMaydell/QemuVersatileExpress
>
> *_Step 01.00: Clone linux-yocto-3.8 locally, create local meta branch,
> create local standard/qemuarma9 branch, tracking the master branch._*
>
> Make the following modification to the qemuarma9-standard.scc file.
>
>  From 8e9b465f242941b70d7b61045c073e82700fcd91 Mon Sep 17 00:00:00 2001
> From: Elvis Dowson <elvis.dowson@gmail.com <mailto:elvis.dowson@gmail.com>>
> Date: Mon, 26 Aug 2013 22:18:24 +0400
> Subject: [PATCH] qemuarma9: Update branch to qemuarma9.
>
> Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com
> <mailto:elvis.dowson@gmail.com>>
> ---
>   meta/cfg/kernel-cache/bsp/qemuarma9/qemuarma9-standard.scc |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/cfg/kernel-cache/bsp/qemuarma9/qemuarma9-standard.scc
> b/meta/cfg/kernel-cache/bsp/qemuarma9/qemuarma9-standard.scc
> index c71fe1c..729125d 100644
> --- a/meta/cfg/kernel-cache/bsp/qemuarma9/qemuarma9-standard.scc
> +++ b/meta/cfg/kernel-cache/bsp/qemuarma9/qemuarma9-standard.scc
> @@ -3,7 +3,7 @@ define KTYPE standard
>   define KARCH arm
>
>   include ktypes/standard/standard.scc
> -branch arm-versatile-926ejs
> +branch qemuarma9
>
>   include qemuarma9.scc
>
> --
> 1.7.10.4
>
>
> *_Step 02.00: Create a new qemuarma9.conf machine definition._*
>
> There is a dts file in arch/arm/boot/dts called vexpress-v2p-ca9.dts.
>
> Q01: I guess the KMACHINE_qemuarma9 should be set to "vex press" ?
> instead of qemuarma9 below?
>
> #@TYPE: Machine
> #@NAME: qemuarma9
> #@DESCRIPTION: Machine configuration for QEMU ARM Cortex A9.
>
> # Specify the default tune.
> DEFAULTTUNE = "armv7a-neon"
>
> require conf/machine/include/qemu.inc
> require conf/machine/include/tune-cortexa9.inc
>
> # Specify the preferred kernel recipe version.
> PREFERRED_VERSION_linux-yocto ?= "3.8%"
>
> # Specify the machine name used by the kernel.
> KMACHINE_qemuarma9 = "qemuarma9" # Error?!!
>
> # Specify the kernel image type.
> KERNEL_IMAGETYPE = "uImage"
>
> MACHINE_DEVICETREE := "qemuarma9.dts"
>
> # Specify the serial console parameters.
> SERIAL_CONSOLE = "115200 ttyAMA0"
>
>
> *_Step 03.00: Patch the oe-core sources._*
>
> *Step 03.01: *Patch scripts/runqemu
>
> @@ -37,10 +37,11 @@ usage() {
>       echo "  qemuparams=\"xyz\" - specify custom parameters to QEMU"
>       echo "  bootparams=\"xyz\" - specify custom kernel parameters
> during boot"
>       echo ""
>       echo "Examples:"
>       echo "  $MYNAME qemuarm"
> +    echo "  $MYNAME qemuarma9 ramfs"
>       echo "  $MYNAME qemux86-64 core-image-sato ext3"
>       echo "  $MYNAME path/to/bzImage-qemux86.bin path/to/nfsrootdir/
> serial"
>       echo "  $MYNAME qemux86 ramfs"
>       echo "  $MYNAME qemux86 iso"
>       echo "  $MYNAME qemux86 qemuparams=\"-m 256\""
> @@ -105,11 +106,11 @@ process_filename() {
>   # bit more complex, but offers a great user experience.
>   KVM_ENABLED="no"
>   while true; do
>       arg=${1}
>       case "$arg" in
> -        "qemux86" | "qemux86-64" | "qemuarm" | "qemumips" |
> "qemumipsel" | \
> +        "qemux86" | "qemux86-64" | "qemuarm" | "qemuarma9" |"qemumips"
> | "qemumipsel" | \
>           "qemumips64" | "qemush4"  | "qemuppc" | "qemumicroblaze" |
> "qemuzynq")
>               [ -z "$MACHINE" ] && MACHINE=$arg || \
>                   error "conflicting MACHINE types [$MACHINE] and [$arg]"
>               ;;
>           "ext2" | "ext3" | "ext4" | "jffs2" | "nfs" | "btrfs")
> @@ -222,17 +223,17 @@ if [ "$FSTYPE" = "nfs" -a -z "$ROOTFS" ]; then
>       error "NFS booting without an explicit ROOTFS path is not yet
> supported"
>   fi
>   if [ -z "$MACHINE" ]; then
>       if [ "x$FSTYPE" = "xvmdk" ]; then
> -        MACHINE=`basename $VM | sed
> 's/.*\(qemux86-64\|qemux86\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/\1/'`
> +        MACHINE=`basename $VM | sed
> 's/.*\(qemux86-64\|qemux86\|qemuarm\|qemuarma9\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/\1/'`
>           if [ -z "$MACHINE" ]; then
>               error "Unable to set MACHINE from vmdk filename [$VM]"
>           fi
>           echo "Set MACHINE to [$MACHINE] based on vmdk [$VM]"
>       else
> -        MACHINE=`basename $KERNEL | sed
> 's/.*\(qemux86-64\|qemux86\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/\1/'`
> +        MACHINE=`basename $KERNEL | sed
> 's/.*\(qemux86-64\|qemux86\|qemuarm\|qemuarma9\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/\1/'`
>           if [ -z "$MACHINE" ]; then
>               error "Unable to set MACHINE from kernel filename [$KERNEL]"
>           fi
>           echo "Set MACHINE to [$MACHINE] based on kernel [$KERNEL]"
>       fi
> @@ -292,10 +293,13 @@ QEMUX86_64_DEFAULT_KERNEL=bzImage-qemux86-64.bin
>   QEMUX86_64_DEFAULT_FSTYPE=ext3
>   QEMUARM_DEFAULT_KERNEL=zImage-qemuarm.bin
>   QEMUARM_DEFAULT_FSTYPE=ext3
> +QEMUARMA9_DEFAULT_KERNEL=uImage
> +QEMUARMA9_DEFAULT_FSTYPE=cpio.gz
> +
>   QEMUMIPS_DEFAULT_KERNEL=vmlinux-qemumips.bin
>   QEMUMIPS_DEFAULT_FSTYPE=ext3
>   QEMUMIPSEL_DEFAULT_KERNEL=vmlinux-qemumipsel.bin
>   QEMUMIPSEL_DEFAULT_FSTYPE=ext3
>
>
> *Step 03.02: *Patch runqemu-internal.
>
> @@ -48,10 +48,13 @@ else
>               mem_size=128
>               ;;
>           "qemuarm")
>               mem_size=128
>               ;;
> +        "qemuarma9")
> +            mem_size=128
> +            ;;
>           "qemumicroblaze")
>               mem_size=64
>               ;;
>           "qemumips"|"qemumips64")
>               mem_size=128
> @@ -265,10 +268,11 @@ else
>           fi
>   fi
>   case "$MACHINE" in
>       "qemuarm") ;;
> +    "qemuarma9") ;;
>       "qemumicroblaze") ;;
>       "qemumips") ;;
>       "qemumipsel") ;;
>       "qemumips64") ;;
>       "qemush4") ;;
> @@ -348,10 +352,39 @@ if [ "$MACHINE" = "qemuarm" -o "$MACHINE" =
> "qemuarmv6" -o "$MACHINE" = "qemuarm
>           QEMUOPTIONS="$QEMUOPTIONS -cpu arm1136"
>       fi
>       if [ "$MACHINE" = "qemuarmv7" ]; then
>           QEMUOPTIONS="$QEMUOPTIONS -cpu cortex-a8"
>       fi
> +    if [ "$MACHINE" = "qemuarma9" ]; then
> +        MACHINE_SUBTYPE=vexpress-a9
> +        QEMUOPTIONS="$QEMUOPTIONS -cpu cortex-a9"
> +    fi
> +fi
> +
> +if [ "$MACHINE" = "qemuarma9" ]; then
> +    QEMU=qemu-system-arm
> +    MACHINE_SUBTYPE=vexpress-a9
> +    QEMUOPTIONS="$QEMUOPTIONS -cpu cortex-a9"
> +    export QEMU_AUDIO_DRV="none"
> +    QEMU_UI_OPTIONS="-show-cursor -usb"
> +    # QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS -force-pointer"
> +    #QEMU_SYSTEM_OPTIONS="-M $MACHINE_SUBTYPE -serial null -serial
> mon:stdio -dtb $KERNEL-$MACHINE.dtb"
> +    if [ "${FSTYPE:0:3}" = "ext" -o "${FSTYPE:0:4}" = "cpio" ]; then
> +        KERNCMDLINE="earlyprintk root=/dev/mmcblk0p2 rw
> console=ttyAMA0,115200 console=tty $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY
> highres=off -dtb $KERNEL-$MACHINE.dtb"
> +        QEMUOPTIONS="-M ${MACHINE_SUBTYPE} -initrd $ROOTFS -no-reboot
> $QEMU_UI_OPTIONS"
> +        #QEMUOPTIONS="$QEMU_NETWORK_CMD -M ${MACHINE_SUBTYPE} -hda
> $ROOTFS -no-reboot $QEMU_UI_OPTIONS"
> +    fi
> +
> +    if [ "$FSTYPE" = "nfs" ]; then
> +        if [ "$NFS_SERVER" = "192.168.7.1" -a ! -d "$NFS_DIR" ]; then
> +            echo "Error: NFS mount point $ROOTFS doesn't exist"
> +            cleanup
> +            return 1
> +        fi
> +        KERNCMDLINE="root=/dev/nfs
> nfsroot=$NFS_SERVER:$NFS_DIR,$UNFS_OPTS rw $KERNEL_NETWORK_CMD
> mem=$QEMU_MEMORY"
> +        QEMUOPTIONS="$QEMU_NETWORK_CMD -M ${MACHINE_SUBTYPE}
> --no-reboot $QEMU_UI_OPTIONS"
> +    fi
>   fi
>   if [ "$MACHINE" = "qemux86" ]; then
>       QEMU=qemu-system-i386
>       QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS -vga vmware"
> @@ -520,11 +553,11 @@ if [ "$MACHINE" = "qemuzynq" ]; then
>       fi
>   fi
>   if [ "x$RAMFS" = "xtrue" ]; then
>       QEMUOPTIONS="-initrd $ROOTFS -nographic"
> -    KERNCMDLINE="root=/dev/ram0 debugshell"
> +    KERNCMDLINE="earlyprintk root=/dev/mmcblk0p2 debugshell"
>   fi
>   if [ "x$ISOFS" = "xtrue" ]; then
>       QEMUOPTIONS="$QEMU_NETWORK_CMD -cdrom $ROOTFS $QEMU_UI_OPTIONS"
>   fi
>
> Best regards,
>
> Elvis Dowson
>
>


