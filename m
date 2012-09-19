Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TEAFQ-0007hi-Bv
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 04:42:44 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 18 Sep 2012 19:29:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,446,1344236400"; d="scan'208";a="194656547"
Received: from unknown (HELO [10.255.13.193]) ([10.255.13.193])
	by orsmga001.jf.intel.com with ESMTP; 18 Sep 2012 19:29:56 -0700
Message-ID: <50592E24.8070701@linux.intel.com>
Date: Tue, 18 Sep 2012 19:29:56 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Cristian Iorga <cristian.iorga@intel.com>
References: <1347973078-12399-1-git-send-email-cristian.iorga@intel.com>
In-Reply-To: <1347973078-12399-1-git-send-email-cristian.iorga@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] qemux86-64: Support for KVM, paravirt and virtio added
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
X-List-Received-Date: Wed, 19 Sep 2012 02:42:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/18/2012 05:57 AM, Cristian Iorga wrote:
>      KVM, paravirtualization and virtio drivers are now activated
>      in runqemu using the kvm option flag for qemux86-64.
>      Host CPU features are also exported to guest OS (Yocto Linux).
>      Usage example: runqemu qemux86-64 core-image-x11 kvm
>
>      Implements [YOCTO #2550].
>
> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> ---
>   meta/recipes-kernel/linux/linux-yocto_3.4.bb |    3 ++-
>   scripts/runqemu-internal                     |    4 ++--
>   2 files changed, 4 insertions(+), 3 deletions(-)
>

This seems to be an incremental change over the last one, and I have 
lost track of which applies against which, can you please resend a 
versioned patch (ie [PATCH v2] ) that is complete.

Thanks
	Sau!

> diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
> index 32ae02b..06dd677 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
> @@ -15,7 +15,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;nocheckou
>
>   LINUX_VERSION ?= "3.4.10"
>
> -PR = "${INC_PR}.1"
> +PR = "${INC_PR}.3"
>   PV = "${LINUX_VERSION}+git${SRCPV}"
>
>   KMETA = "meta"
> @@ -28,4 +28,5 @@ KERNEL_FEATURES_append = " features/netfilter"
>   KERNEL_FEATURES_append_qemux86=" cfg/sound"
>   KERNEL_FEATURES_append_qemux86-64=" cfg/sound"
>   KERNEL_FEATURES_append_qemux86=" cfg/paravirt_kvm"
> +KERNEL_FEATURES_append_qemux86-64=" cfg/paravirt_kvm"
>   KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32", "" ,d)}"
> diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
> index f2c8d83..6e20dd7 100755
> --- a/scripts/runqemu-internal
> +++ b/scripts/runqemu-internal
> @@ -350,8 +350,8 @@ if [ "$MACHINE" = "qemux86-64" ]; then
>       QEMU=qemu-system-x86_64
>       QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS -vga vmware"
>       if [ "$FSTYPE" = "ext3" -o "$FSTYPE" = "btrfs" ]; then
> -        KERNCMDLINE="vga=0 root=/dev/hda rw mem=$QEMU_MEMORY $KERNEL_NETWORK_CMD"
> -        QEMUOPTIONS="$QEMU_NETWORK_CMD -hda $ROOTFS $QEMU_UI_OPTIONS"
> +        KERNCMDLINE="vga=0 root=$DROOT rw mem=$QEMU_MEMORY $KERNEL_NETWORK_CMD"
> +        QEMUOPTIONS="$QEMU_NETWORK_CMD $ROOTFS_OPTIONS $QEMU_UI_OPTIONS"
>       fi
>       if [ "$FSTYPE" = "nfs" ]; then
>           if [ "x$ROOTFS" = "x" ]; then
>


