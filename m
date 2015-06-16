Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id C286873772
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jun 2015 07:07:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id B54AF11A8473
Message-ID: <557FCB46.7050006@collabora.co.uk>
Date: Tue, 16 Jun 2015 08:07:50 +0100
From: Joshua Lock <joshua.lock@collabora.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1433825286-925-1-git-send-email-jkrishnanjanappa@mvista.com>
	<CAD3vsf7_24-urKVJjC-L9zsBrpvnD1i1Ag6DqJ8Kb-ip4c+wtA@mail.gmail.com>
In-Reply-To: <CAD3vsf7_24-urKVJjC-L9zsBrpvnD1i1Ag6DqJ8Kb-ip4c+wtA@mail.gmail.com>
Subject: Re: [PATCH][fido] runqemu: add support to boot arm64 qemu target from NFS
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
X-List-Received-Date: Tue, 16 Jun 2015 07:07:58 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 15/06/15 17:56, Jagadeesh Krishnanjanappa wrote:
> Ping.


Is this change intended for fido or master? Usually fixes like this 
would go into master first and then be backported to the stable branch.

Regards,

Joshua

> Regards,
> Jagadeesh
>
> On Tue, Jun 9, 2015 at 10:18 AM, Jagadeesh Krishnanjanappa
> <jkrishnanjanappa@mvista.com <mailto:jkrishnanjanappa@mvista.com>> wrote:
>
>     The other changes include,
>     runqemu - fix MACHINE type being detected as qemuarm when qemuarm64
>     kernel
>                image name is given.
>
>     runqemu-internal - Added console=ttyAMA0,115200 as one of the boot
>     parameters
>                         for qemuarm, in order to print bootlog messages
>     on the
>                         console.
>
>                       - Use "-nographic" option only if "serial" option
>     is not
>                         specified. Otherwise we get below error when
>                         'runqemu <kernel_image> <rootfs_image> serial'
>     is executed,
>
>     (snip)
>     QEMU 2.2.0 monitor - type 'help' for more information
>     (qemu) qemu-system-aarch64: -serial stdio: cannot use stdio by
>     multiple character devices
>     -- CUT --
>
>     qemuarm64 NFS booting has been tested successfully on Ubuntu 14.04 host.
>
>     Signed-off-by: Jagadeesh Krishnanjanappa
>     <jkrishnanjanappa@mvista.com <mailto:jkrishnanjanappa@mvista.com>>
>     ---
>       scripts/runqemu          |  4 ++--
>       scripts/runqemu-internal | 20 +++++++++++++++-----
>       2 files changed, 17 insertions(+), 7 deletions(-)
>
>     diff --git a/scripts/runqemu b/scripts/runqemu
>     index 84ece4d..09c507d 100755
>     --- a/scripts/runqemu
>     +++ b/scripts/runqemu
>     @@ -232,13 +232,13 @@ fi
>
>       if [ -z "$MACHINE" ]; then
>           if [ "x$FSTYPE" = "xvmdk" ]; then
>     -        MACHINE=`basename $VM | sed -n
>     's/.*\(qemux86-64\|qemux86\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/\1/p'`
>     +        MACHINE=`basename $VM | sed -n
>     's/.*\(qemux86-64\|qemux86\|qemuarm64\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/\1/p'`
>               if [ -z "$MACHINE" ]; then
>                   error "Unable to set MACHINE from vmdk filename [$VM]"
>               fi
>               echo "Set MACHINE to [$MACHINE] based on vmdk [$VM]"
>           else
>     -        MACHINE=`basename $KERNEL | sed -n
>     's/.*\(qemux86-64\|qemux86\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/\1/p'`
>     +        MACHINE=`basename $KERNEL | sed -n
>     's/.*\(qemux86-64\|qemux86\|qemuarm64\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/\1/p'`
>               if [ -z "$MACHINE" ]; then
>                   error "Unable to set MACHINE from kernel filename
>     [$KERNEL]"
>               fi
>     diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
>     index 2db5566..e346c64 100755
>     --- a/scripts/runqemu-internal
>     +++ b/scripts/runqemu-internal
>     @@ -275,9 +275,6 @@ else
>
>               KERNCMDLINE="mem=$QEMU_MEMORY"
>               QEMU_UI_OPTIONS="-show-cursor -usb -usbdevice wacom-tablet"
>     -        if [ $MACHINE = 'qemuarm64' ]; then
>     -            QEMU_UI_OPTIONS="-nographic"
>     -        fi
>
>               NFS_INSTANCE=`echo $TAP | sed 's/tap//'`
>               export NFS_INSTANCE
>     @@ -368,7 +365,7 @@ if [ "$MACHINE" = "qemuarm" -o "$MACHINE" =
>     "qemuarmv6" -o "$MACHINE" = "qemuarm
>                   cleanup
>                   return 1
>               fi
>     -        KERNCMDLINE="root=/dev/nfs
>     nfsroot=$NFS_SERVER:$NFS_DIR,$UNFS_OPTS rw $KERNEL_NETWORK_CMD
>     mem=$QEMU_MEMORY"
>     +        KERNCMDLINE="root=/dev/nfs
>     nfsroot=$NFS_SERVER:$NFS_DIR,$UNFS_OPTS rw console=ttyAMA0,115200
>     $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
>               QEMUOPTIONS="$QEMU_NETWORK_CMD -M ${MACHINE_SUBTYPE}
>     --no-reboot $QEMU_UI_OPTIONS"
>           fi
>           if [ "$MACHINE" = "qemuarmv6" ]; then
>     @@ -383,12 +380,25 @@ if [ "$MACHINE" = "qemuarm64" ]; then
>           QEMU=qemu-system-aarch64
>
>           export QEMU_AUDIO_DRV="none"
>     -    QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS"
>     +    if [ "x$SERIALSTDIO" = "x" ] ; then
>     +        QEMU_UI_OPTIONS="-nographic"
>     +    else
>     +        QEMU_UI_OPTIONS=""
>     +    fi
>           if [ "${FSTYPE:0:3}" = "ext" -o "$FSTYPE" = "btrfs" ]; then
>               KERNCMDLINE="root=/dev/vda rw console=ttyAMA0,38400
>     mem=$QEMU_MEMORY highres=off $KERNEL_NETWORK_CMD"
>               # qemu-system-aarch64 only support '-machine virt -cpu
>     cortex-a57' for now
>               QEMUOPTIONS="$QEMU_NETWORK_CMD -machine virt -cpu
>     cortex-a57 $ROOTFS_OPTIONS $QEMU_UI_OPTIONS"
>           fi
>     +    if [ "$FSTYPE" = "nfs" ]; then
>     +        if [ "$NFS_SERVER" = "192.168.7.1" -a ! -d "$NFS_DIR" ]; then
>     +            echo "Error: NFS mount point $ROOTFS doesn't exist"
>     +            cleanup
>     +            return 1
>     +        fi
>     +        KERNCMDLINE="root=/dev/nfs
>     nfsroot=$NFS_SERVER:$NFS_DIR,$UNFS_OPTS rw console=ttyAMA0,38400
>     mem=$QEMU_MEMORY highres=off $KERNEL_NETWORK_CMD"
>     +        QEMUOPTIONS="$QEMU_NETWORK_CMD -machine virt -cpu
>     cortex-a57 $QEMU_UI_OPTIONS"
>     +    fi
>       fi
>
>
>     --
>     1.8.2.3
>
>
>
>


