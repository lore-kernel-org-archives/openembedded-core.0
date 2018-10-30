Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2F31160197
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Oct 2018 07:01:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9U6x34M004065
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 30 Oct 2018 00:00:47 -0700
Received: from [128.224.162.232] (128.224.162.232) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Mon, 29 Oct 2018 23:59:27 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
References: <0c2d7e77034c3b860d55073e4743b9af7be92b0a.camel@linuxfoundation.org>
	<1540866169-70689-1-git-send-email-hongxu.jia@windriver.com>
Message-ID: <fe05a571-b3db-1577-ca28-523ca85d940f@windriver.com>
Date: Tue, 30 Oct 2018 14:59:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <1540866169-70689-1-git-send-email-hongxu.jia@windriver.com>
Subject: Re: [PATCH V2] machine/qemu*: fix kernel finish crng init more and more slowly
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
X-List-Received-Date: Tue, 30 Oct 2018 07:01:13 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Previously I do the test on qemumips, qemuarm, qemuarm64
and missed qemux86/qemux86-64 which caused the defect.

After applied the V2 fix, I do  runqemu boot test each 4 times on the 
following qemu

The qemux86
[    2.536936] random: crng init done
[    2.795946] random: crng init done
[    3.020137] random: crng init done
[    2.505998] random: crng init done

The qemux86-64
[    5.883281] random: crng init done
[    2.913999] random: crng init done
[    3.745269] random: crng init done
[    2.577969] random: crng init done

The qemuppc:
[    2.153825] random: crng init done
[    1.486999] random: crng init done
[    1.759905] random: crng init done
[    1.638786] random: crng init done

The qemumips64
[    3.460441] random: crng init done
[    4.837740] random: crng init done
[    4.870131] random: crng init done
[    3.990618] random: crng init done

//Hongxu

On 2018/10/30 上午10:22, Hongxu Jia wrote:
> Just adding `-device virtio-rng-pci' to the QEMU invocation will
> add the device with a default host backend. As of QEMU 1.3+,
> the default backend is to use the host's /dev/random as a
> source of entropy. [1]
>
> When the entropy pool is empty, reads from /dev/random will
> block until additional environmental noise is gathered. [2]
>
> For Yocto, if call runqemu frequently, it will consume lots
> of host's /dev/random, and kernel finish crng init in guest get
> more and more slowly.
>
> Here are 4 times runqemu boot test:
>
> [    3.464432] random: crng init done
> [   20.874030] random: crng init done
> [   23.583589] random: crng init done
> [   23.858945] random: crng init done
>
> Modify entropy source to /dev/urandom device on the host which
> returns random bytes using a pseudorandom number generator seeded
> from the entropy pool. Reads from this device do not block and
> kernel finish crng init in guest will not delay.
>
> Of course, the side effect is obviously, we lost the quality of
> randomness, but the modification is only on runqemu script
> rather than real embedded device, and it benefits oeqa efficiency
> in which many cases call runqemu especially multiple oeqa builds
> on one host.
>
> After apply the fix:
>
> [    3.364670] random: crng init done
> [    4.619061] random: crng init done
> [    3.403897] random: crng init done
> [    3.450717] random: crng init done
>
> [1] https://wiki.qemu.org/Features/VirtIORNG
> [2] http://man7.org/linux/man-pages/man4/random.4.html
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   meta/conf/machine/include/qemuboot-mips.inc | 3 ++-
>   meta/conf/machine/include/qemuboot-x86.inc  | 3 ++-
>   meta/conf/machine/qemuarm.conf              | 3 ++-
>   meta/conf/machine/qemuarm64.conf            | 4 +++-
>   meta/conf/machine/qemuppc.conf              | 3 ++-
>   5 files changed, 11 insertions(+), 5 deletions(-)
>
> diff --git a/meta/conf/machine/include/qemuboot-mips.inc b/meta/conf/machine/include/qemuboot-mips.inc
> index 7d9fa52..75bb988 100644
> --- a/meta/conf/machine/include/qemuboot-mips.inc
> +++ b/meta/conf/machine/include/qemuboot-mips.inc
> @@ -3,6 +3,7 @@ IMAGE_CLASSES += "qemuboot"
>   QB_MEM = "-m 256"
>   QB_MACHINE = "-machine malta"
>   QB_KERNEL_CMDLINE_APPEND = "console=ttyS0 console=tty"
> +QB_OPT_APPEND = "-vga cirrus -show-cursor -usb -device usb-tablet"
>   # Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
> -QB_OPT_APPEND = "-vga cirrus -show-cursor -usb -device usb-tablet -device virtio-rng-pci"
> +QB_OPT_APPEND += "-object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0"
>   QB_SYSTEM_NAME = "qemu-system-${TUNE_ARCH}"
> diff --git a/meta/conf/machine/include/qemuboot-x86.inc b/meta/conf/machine/include/qemuboot-x86.inc
> index 1456bf7..5fdbe4d 100644
> --- a/meta/conf/machine/include/qemuboot-x86.inc
> +++ b/meta/conf/machine/include/qemuboot-x86.inc
> @@ -11,7 +11,8 @@ QB_CPU_KVM_x86-64 = "-cpu core2duo"
>   QB_AUDIO_DRV = "alsa"
>   QB_AUDIO_OPT = "-soundhw ac97,es1370"
>   QB_KERNEL_CMDLINE_APPEND = "vga=0 uvesafb.mode_option=${UVESA_MODE} oprofile.timer=1 uvesafb.task_timeout=-1"
> +QB_OPT_APPEND = "-vga vmware -show-cursor -usb -device usb-tablet"
>   # Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
> -QB_OPT_APPEND = "-vga vmware -show-cursor -usb -device usb-tablet -device virtio-rng-pci"
> +QB_OPT_APPEND += "-object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0"
>   
>   UVESA_MODE ?= "640x480-32"
> diff --git a/meta/conf/machine/qemuarm.conf b/meta/conf/machine/qemuarm.conf
> index d2f2c85..a544312 100644
> --- a/meta/conf/machine/qemuarm.conf
> +++ b/meta/conf/machine/qemuarm.conf
> @@ -14,7 +14,8 @@ SERIAL_CONSOLES ?= "115200;ttyAMA0 115200;ttyAMA1"
>   QB_SYSTEM_NAME = "qemu-system-arm"
>   QB_MACHINE = "-machine versatilepb"
>   QB_KERNEL_CMDLINE_APPEND = "console=ttyAMA0,115200 console=tty"
> +QB_OPT_APPEND = "-show-cursor -usb -device usb-tablet"
>   # Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
> -QB_OPT_APPEND = "-show-cursor -usb -device usb-tablet -device virtio-rng-pci"
> +QB_OPT_APPEND += "-object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0"
>   PREFERRED_VERSION_linux-yocto ??= "4.18%"
>   QB_DTB = "${@oe.utils.version_less_or_equal('PREFERRED_VERSION_linux-yocto', '4.7', '', 'zImage-versatile-pb.dtb', d)}"
> diff --git a/meta/conf/machine/qemuarm64.conf b/meta/conf/machine/qemuarm64.conf
> index 242889a..34fcd2a 100644
> --- a/meta/conf/machine/qemuarm64.conf
> +++ b/meta/conf/machine/qemuarm64.conf
> @@ -16,7 +16,9 @@ QB_MACHINE = "-machine virt"
>   QB_CPU = "-cpu cortex-a57"
>   QB_KERNEL_CMDLINE_APPEND = "console=ttyAMA0,38400"
>   # Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
> -QB_OPT_APPEND = "-show-cursor -device virtio-rng-pci -monitor null"
> +QB_OPT_APPEND = "-show-cursor -monitor null"
> +# Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
> +QB_OPT_APPEND += "-object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0"
>   QB_TAP_OPT = "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no"
>   QB_NETWORK_DEVICE = "-device virtio-net-device,netdev=net0,mac=@MAC@"
>   QB_ROOTFS_OPT = "-drive id=disk0,file=@ROOTFS@,if=none,format=raw -device virtio-blk-device,drive=disk0"
> diff --git a/meta/conf/machine/qemuppc.conf b/meta/conf/machine/qemuppc.conf
> index 537b2f6..743d261 100644
> --- a/meta/conf/machine/qemuppc.conf
> +++ b/meta/conf/machine/qemuppc.conf
> @@ -16,6 +16,7 @@ QB_SYSTEM_NAME = "qemu-system-ppc"
>   QB_MACHINE = "-machine mac99"
>   QB_CPU = "-cpu G4"
>   QB_KERNEL_CMDLINE_APPEND = "console=tty console=ttyS0"
> +QB_OPT_APPEND = "-show-cursor -usb -device usb-tablet"
>   # Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
> -QB_OPT_APPEND = "-show-cursor -usb -device usb-tablet -device virtio-rng-pci"
> +QB_OPT_APPEND += "-object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0"
>   QB_TAP_OPT = "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no"



