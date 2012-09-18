Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1TDrLQ-0007K9-LC
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Sep 2012 08:31:41 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 17 Sep 2012 23:18:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,441,1344236400"; d="scan'208";a="146198525"
Received: from irsmsx101.ger.corp.intel.com ([163.33.3.153])
	by AZSMGA002.ch.intel.com with ESMTP; 17 Sep 2012 23:18:58 -0700
Received: from irsmsx102.ger.corp.intel.com ([169.254.2.34]) by
	IRSMSX101.ger.corp.intel.com ([169.254.1.35]) with mapi id
	14.01.0355.002; Tue, 18 Sep 2012 07:18:57 +0100
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: Saul Wold <sgw@linux.intel.com>
Thread-Topic: [OE-core] [PATCH] qemux86: Support for KVM, paravirt and
	virtio added
Thread-Index: AQHNlMsidcpK/dgmLkeIgVbhtYwI/5ePLWQAgABydsA=
Date: Tue, 18 Sep 2012 06:18:56 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB16196076@IRSMSX102.ger.corp.intel.com>
References: <1347882817-3118-1-git-send-email-cristian.iorga@intel.com>
	<5057BF14.9000603@linux.intel.com>
In-Reply-To: <5057BF14.9000603@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.182]
MIME-Version: 1.0
Cc: 'Patches and discussions about the oe-core layer'
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
X-List-Received-Date: Tue, 18 Sep 2012 06:31:41 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Saul,

Thanks.

Good question. :-)
I think it's a definitely yes.
Although I need to check :-)
However, in the case of x86-64, there will be a small limitation.
The guest OS can be used only on a x86-64 machine (and I am guessing, also =
with a 64 bits enabled OS).

Regards,
Cristian


-----Original Message-----
From: Saul Wold [mailto:sgw@linux.intel.com]=20
Sent: Tuesday, September 18, 2012 3:24 AM
To: Iorga, Cristian
Cc: 'Patches and discussions about the oe-core layer'
Subject: Re: [OE-core] [PATCH] qemux86: Support for KVM, paravirt and virti=
o added

On 09/17/2012 04:53 AM, Cristian Iorga wrote:
> KVM, paravirtualization and virtio drivers are now activated in=20
> runqemu using the kvm option flag for qemux86.
> Host CPU features are also exported to guest OS (Yocto Linux).
> Usage example: runqemu qemux86 core-image-x11 kvm
>
> Implements [YOCTO #2550].
>
> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> ---
>   meta/recipes-kernel/linux/linux-yocto_3.4.bb |    1 +
>   scripts/runqemu                              |   16 +++++++++++++++-
>   scripts/runqemu-internal                     |   14 +++++++++++---
>   3 files changed, 27 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb=20
> b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
> index 7c082e7..32ae02b 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
> @@ -27,4 +27,5 @@ KERNEL_REVISION_CHECKING=3D""
>   KERNEL_FEATURES_append =3D " features/netfilter"
>   KERNEL_FEATURES_append_qemux86=3D" cfg/sound"
>   KERNEL_FEATURES_append_qemux86-64=3D" cfg/sound"
> +KERNEL_FEATURES_append_qemux86=3D" cfg/paravirt_kvm"

Good patch, with one question.

Can the be a valid KERNEL_FEATURE for x86-64 also? Any reason not to?

Sau!


>   KERNEL_FEATURES_append =3D " ${@bb.utils.contains("TUNE_FEATURES", "mx3=
2", " cfg/x32", "" ,d)}"
> diff --git a/scripts/runqemu b/scripts/runqemu index e843946..167e157=20
> 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -208,6 +208,7 @@ if [ -z "$MACHINE" ]; then
>   fi
>
>   YOCTO_KVM_WIKI=3D"https://wiki.yoctoproject.org/wiki/How_to_enable_KVM_=
for_Poky_qemu"
> +YOCTO_PARAVIRT_KVM_WIKI=3D"https://wiki.yoctoproject.org/wiki/Running_an=
_x86_Yocto_Linux_image_under_QEMU_KVM"
>   # Detect KVM configuration
>   if [ "x$KVM_ENABLED" =3D "xyes" ]; then
>       if [ -z "$KVM_CAPABLE" ]; then
> @@ -226,14 +227,27 @@ if [ "x$KVM_ENABLED" =3D "xyes" ]; then
>           echo "$YOCTO_KVM_WIKI";
>           exit 1;
>       fi
> +    if [ ! -e /dev/vhost-net ]; then
> +        echo "Missing virtio net device. Have you inserted vhost-net mod=
ule?"
> +        echo "For further help see"
> +        echo "$YOCTO_PARAVIRT_KVM_WIKI";
> +        exit 1;
> +    fi
>       if 9<>/dev/kvm ; then
> -        SCRIPT_QEMU_OPT=3D"$SCRIPT_QEMU_OPT -enable-kvm"
> +        SCRIPT_QEMU_OPT=3D"$SCRIPT_QEMU_OPT -enable-kvm -cpu host"
> +        KVM_ACTIVE=3D"yes"
>       else
>           echo "You have no rights on /dev/kvm."
>           echo "Please change the ownership of this file as described at"
>           echo "$YOCTO_KVM_WIKI";
>           exit 1;
>       fi
> +    if [ ! -w /dev/vhost-net -a -r /dev/vhost-net ]; then
> +        echo "You have no rights on /dev/vhost-net."
> +        echo "Please change the ownership of this file as described at"
> +        echo "$YOCTO_PARAVIRT_KVM_WIKI";
> +        exit 1;
> +    fi
>   fi
>
>   machine2=3D`echo $MACHINE | tr 'a-z' 'A-Z' | sed 's/-/_/'` diff --git=20
> a/scripts/runqemu-internal b/scripts/runqemu-internal index=20
> a9b1c44..f2c8d83 100755
> --- a/scripts/runqemu-internal
> +++ b/scripts/runqemu-internal
> @@ -221,7 +221,15 @@ n2=3D$(($n1 + 1))
>
>   KERNEL_NETWORK_CMD=3D"ip=3D192.168.7.$n2::192.168.7.$n1:255.255.255.0"
>   QEMU_TAP_CMD=3D"-net tap,vlan=3D0,ifname=3D$TAP,script=3Dno,downscript=
=3Dno"
> -QEMU_NETWORK_CMD=3D"-net nic,vlan=3D0 $QEMU_TAP_CMD"
> +if [ "$KVM_ACTIVE" =3D "yes" ]; then
> +    QEMU_NETWORK_CMD=3D"-net nic,model=3Dvirtio $QEMU_TAP_CMD,vhost=3Don=
"
> +    DROOT=3D"/dev/vda"
> +    ROOTFS_OPTIONS=3D"-drive file=3D$ROOTFS,if=3Dvirtio"
> +else
> +    QEMU_NETWORK_CMD=3D"-net nic,vlan=3D0 $QEMU_TAP_CMD"
> +    DROOT=3D"/dev/hda"
> +    ROOTFS_OPTIONS=3D"-hda $ROOTFS"
> +fi
>   KERNCMDLINE=3D"mem=3D$QEMU_MEMORY"
>   QEMU_UI_OPTIONS=3D"-show-cursor -usb -usbdevice wacom-tablet"
>
> @@ -321,8 +329,8 @@ if [ "$MACHINE" =3D "qemux86" ]; then
>       QEMU=3Dqemu-system-i386
>       QEMU_UI_OPTIONS=3D"$QEMU_UI_OPTIONS -vga vmware"
>       if [ "$FSTYPE" =3D "ext2" -o "$FSTYPE" =3D "ext3" -o "$FSTYPE" =3D =
"btrfs" ]; then
> -        KERNCMDLINE=3D"vga=3D0 root=3D/dev/hda rw mem=3D$QEMU_MEMORY $KE=
RNEL_NETWORK_CMD"
> -        QEMUOPTIONS=3D"$QEMU_NETWORK_CMD -hda $ROOTFS $QEMU_UI_OPTIONS"
> +        KERNCMDLINE=3D"vga=3D0 root=3D$DROOT rw mem=3D$QEMU_MEMORY $KERN=
EL_NETWORK_CMD"
> +        QEMUOPTIONS=3D"$QEMU_NETWORK_CMD $ROOTFS_OPTIONS $QEMU_UI_OPTION=
S"
>       fi
>       if [ "$FSTYPE" =3D "nfs" ]; then
>           if [ "$NFS_SERVER" =3D "192.168.7.1" -a ! -d "$NFS_DIR" ];=20
> then
>


