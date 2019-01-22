Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E50BE7BFAD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jan 2019 00:56:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x0M0uPZu004872
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 21 Jan 2019 16:56:25 -0800 (PST)
Received: from [172.25.44.4] (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Mon, 21 Jan 2019 16:56:24 -0800
To: Jon Mason <jdmason@kudzu.us>, <openembedded-core@lists.openembedded.org>
References: <20190118221737.14443-1-jdmason@kudzu.us>
	<20190118221737.14443-2-jdmason@kudzu.us>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <003c3427-a32c-4d5c-18a8-cabde89c8cbd@windriver.com>
Date: Mon, 21 Jan 2019 19:56:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190118221737.14443-2-jdmason@kudzu.us>
X-Originating-IP: [172.25.44.4]
Subject: Re: [PATCH 1/3] qemuarma15: ARM A15 Support
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
X-List-Received-Date: Tue, 22 Jan 2019 00:56:26 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 1/18/19 5:17 PM, Jon Mason wrote:
> Add new QEMU BSP for a Arm Cortex-A15 system.  This uses the QEMU virt
> machine type, which should be faster to emulate.
> 
> Signed-off-by: Jon Mason <jdmason@kudzu.us>
> ---
>   meta/conf/machine/qemuarma15.conf             | 26 +++++++++++++++++++
>   .../linux/linux-yocto-rt_4.19.bb              |  2 +-
>   .../linux/linux-yocto-tiny_4.19.bb            |  2 +-
>   meta/recipes-kernel/linux/linux-yocto_4.19.bb |  2 +-
>   4 files changed, 29 insertions(+), 3 deletions(-)
>   create mode 100644 meta/conf/machine/qemuarma15.conf
> 
> diff --git a/meta/conf/machine/qemuarma15.conf b/meta/conf/machine/qemuarma15.conf
> new file mode 100644
> index 0000000000..f1c2246ebf
> --- /dev/null
> +++ b/meta/conf/machine/qemuarma15.conf
> @@ -0,0 +1,26 @@
> +#@TYPE: Machine
> +#@NAME: generic Arm Cortex-A15 machine
> +#@DESCRIPTION: Machine configuration for running a generic armv7
> +
> +require conf/machine/include/tune-cortexa15.inc
> +require conf/machine/include/qemu.inc
> +
> +KERNEL_IMAGETYPE = "zImage"
> +
> +SERIAL_CONSOLES ?= "115200;ttyAMA0 115200;hvc0"
> +
> +# For runqemu
> +QB_SYSTEM_NAME = "qemu-system-arm"
> +QB_MEM = "-m 512"
> +QB_MACHINE = "-machine virt"
> +QB_CPU = "-cpu cortex-a15 -smp 8"

The other qemu .conf files do not specify smp so we should probably
drop it here too.

Typically it's an option for runqemu:
   $ runqemu foo bar qemuparams="-smp 8"

If you do want to keep if for some reason, 2 or 4 may be better
choices for people with modest build/test machines.

../Randy

> +# We need both ttyAMA0 and hvc0 to allow for this to work in the stdio mode or the normal mode
> +QB_KERNEL_CMDLINE_APPEND = "console=ttyAMA0,115200 console=hvc0,115200"
> +QB_OPT_APPEND = "-show-cursor -device virtio-rng-pci -monitor null"
> +QB_TAP_OPT = "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no"
> +QB_NETWORK_DEVICE = "-device virtio-net-device,netdev=net0,mac=@MAC@"
> +QB_ROOTFS_OPT = "-drive id=disk0,file=@ROOTFS@,if=none,format=raw -device virtio-blk-device,drive=disk0"
> +QB_SERIAL_OPT = "-device virtio-serial-device -chardev vc,id=virtcon -device virtconsole,chardev=virtcon"
> +QB_TCPSERIAL_OPT = " -device virtio-serial-device -chardev socket,id=virtcon,port=@PORT@,host=127.0.0.1 -device virtconsole,chardev=virtcon"
> +
> +PREFERRED_VERSION_linux-yocto ?= "4.19%"
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
> index 4a987d52c0..89b6c8db86 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
> @@ -31,7 +31,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
>   
>   LINUX_KERNEL_TYPE = "preempt-rt"
>   
> -COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm|qemuarm64|qemuppc|qemumips)"
> +COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm|qemuarma15|qemuarm64|qemuppc|qemumips)"
>   
>   KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
>   
> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
> index 8506f7c880..e1ab7017cf 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
> @@ -24,7 +24,7 @@ PV = "${LINUX_VERSION}+git${SRCPV}"
>   SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
>              git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA}"
>   
> -COMPATIBLE_MACHINE = "qemux86|qemux86-64|qemuarm"
> +COMPATIBLE_MACHINE = "qemux86|qemux86-64|qemuarm|qemuarma15"
>   
>   # Functionality flags
>   KERNEL_FEATURES = ""
> diff --git a/meta/recipes-kernel/linux/linux-yocto_4.19.bb b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
> index bd9b6a3543..81fceee98f 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_4.19.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
> @@ -37,7 +37,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
>   
>   KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
>   
> -COMPATIBLE_MACHINE = "qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
> +COMPATIBLE_MACHINE = "qemuarm|qemuarma15|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
>   
>   # Functionality flags
>   KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
> 


-- 
# Randy MacLeod
# Wind River Linux

