Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9705771A32
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2016 06:22:01 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uAT6M2cp025302
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 28 Nov 2016 22:22:02 -0800 (PST)
Received: from [128.224.162.183] (128.224.162.183) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 28 Nov 2016 22:22:00 -0800
To: Randy Witt <randy.e.witt@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <1480363884-6789-1-git-send-email-randy.e.witt@linux.intel.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <f4759de9-823a-bfcd-9305-e14438347631@windriver.com>
Date: Tue, 29 Nov 2016 14:21:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1480363884-6789-1-git-send-email-randy.e.witt@linux.intel.com>
Subject: Re: [PATCH] qemu*.conf: Add slirp support for all qemu machines
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
X-List-Received-Date: Tue, 29 Nov 2016 06:22:01 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 11/29/2016 04:11 AM, Randy Witt wrote:
> This patch also moves the "-net user" part out of the config and
> into runqemu. This is done because the "-net user" portion isn't
> machine specific, and it contains what ports to forward.
>
> [ YOCTO #7887 ]
>
> Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
> ---
>  meta/conf/machine/include/qemuboot-mips.inc | 1 +
>  meta/conf/machine/include/qemuboot-x86.inc  | 2 +-
>  meta/conf/machine/qemuarm.conf              | 1 +
>  meta/conf/machine/qemuarm64.conf            | 2 +-
>  meta/conf/machine/qemuppc.conf              | 1 +
>  scripts/runqemu                             | 7 ++++++-
>  6 files changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/meta/conf/machine/include/qemuboot-mips.inc b/meta/conf/machine/include/qemuboot-mips.inc
> index 0c60cf2..c85dc86 100644
> --- a/meta/conf/machine/include/qemuboot-mips.inc
> +++ b/meta/conf/machine/include/qemuboot-mips.inc
> @@ -6,3 +6,4 @@ QB_KERNEL_CMDLINE_APPEND = "console=ttyS0 console=tty"
>  # Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
>  QB_OPT_APPEND = "-vga cirrus -show-cursor -usb -usbdevice tablet -device virtio-rng-pci"
>  QB_SYSTEM_NAME = "qemu-system-${TUNE_ARCH}"
> +QB_SLIRP_OPT = "-device virtio-net-pci,netdev=net0"
> diff --git a/meta/conf/machine/include/qemuboot-x86.inc b/meta/conf/machine/include/qemuboot-x86.inc
> index 0870294..cc31dab 100644
> --- a/meta/conf/machine/include/qemuboot-x86.inc
> +++ b/meta/conf/machine/include/qemuboot-x86.inc
> @@ -13,4 +13,4 @@ QB_AUDIO_OPT = "-soundhw ac97,es1370"
>  QB_KERNEL_CMDLINE_APPEND = "vga=0 uvesafb.mode_option=640x480-32 oprofile.timer=1 uvesafb.task_timeout=-1"
>  # Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
>  QB_OPT_APPEND = "-vga vmware -show-cursor -usb -usbdevice tablet -device virtio-rng-pci"
> -QB_SLIRP_OPT = "-net nic,model=e1000 -net user,hostfwd=tcp::2222-:22"
> +QB_SLIRP_OPT = "-device virtio-net-pci,netdev=net0"
> diff --git a/meta/conf/machine/qemuarm.conf b/meta/conf/machine/qemuarm.conf
> index 17402ef..974657b 100644
> --- a/meta/conf/machine/qemuarm.conf
> +++ b/meta/conf/machine/qemuarm.conf
> @@ -18,3 +18,4 @@ QB_KERNEL_CMDLINE_APPEND = "console=ttyAMA0,115200 console=tty"
>  QB_OPT_APPEND = "-show-cursor -usb -usbdevice tablet -device virtio-rng-pci"
>  PREFERRED_VERSION_linux-yocto ??= "4.8%"
>  QB_DTB = "${@base_version_less_or_equal('PREFERRED_VERSION_linux-yocto', '4.7', '', 'zImage-versatile-pb.dtb', d)}"
> +QB_SLIRP_OPT = "-device virtio-net-pci,netdev=net0"
> diff --git a/meta/conf/machine/qemuarm64.conf b/meta/conf/machine/qemuarm64.conf
> index df2010c..ebd360e 100644
> --- a/meta/conf/machine/qemuarm64.conf
> +++ b/meta/conf/machine/qemuarm64.conf
> @@ -18,7 +18,7 @@ QB_KERNEL_CMDLINE_APPEND = "console=ttyAMA0,38400"
>  # Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
>  QB_OPT_APPEND = "-show-cursor -device virtio-rng-pci -monitor null"
>  QB_TAP_OPT = "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no -device virtio-net-device,netdev=net0,mac=@MAC@"
> -QB_SLIRP_OPT = "-netdev user,id=net0 -device virtio-net-device,netdev=net0"
> +QB_SLIRP_OPT = "-device virtio-net-device,netdev=net0"
>  QB_ROOTFS_OPT = "-drive id=disk0,file=@ROOTFS@,if=none,format=raw -device virtio-blk-device,drive=disk0"
>  QB_SERIAL_OPT = "-device virtio-serial-device -chardev null,id=virtcon -device virtconsole,chardev=virtcon"
>  QB_TCPSERIAL_OPT = " -device virtio-serial-device -chardev socket,id=virtcon,port=@PORT@,host=127.0.0.1 -device virtconsole,chardev=virtcon"
> diff --git a/meta/conf/machine/qemuppc.conf b/meta/conf/machine/qemuppc.conf
> index 8703c20..4711751 100644
> --- a/meta/conf/machine/qemuppc.conf
> +++ b/meta/conf/machine/qemuppc.conf
> @@ -19,3 +19,4 @@ QB_KERNEL_CMDLINE_APPEND = "console=tty console=ttyS0"
>  # Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
>  QB_OPT_APPEND = "-show-cursor -usb -usbdevice tablet -device virtio-rng-pci"
>  QB_TAP_OPT = "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no -device virtio-net-pci,netdev=net0,mac=@MAC@"
> +QB_SLIRP_OPT = "-device virtio-net-pci,netdev=net0"
> diff --git a/scripts/runqemu b/scripts/runqemu
> index af25423..faab522 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -730,7 +730,12 @@ class BaseConfig(object):
>          if self.fstype == 'nfs':
>              self.setup_nfs()
>          self.kernel_cmdline_script += ' ip=dhcp'
> -        self.set('NETWORK_CMD', self.get('QB_SLIRP_OPT'))
> +        network_cmd = self.get('QB_SLIRP_OPT')
> +
> +        # The network device created in qemuboot.conf is expected to be
> +        # id=net0
> +        network_cmd += ' -netdev user,id=net0,hostfwd=tcp::2222-:22'

Hi Randy,

This doesn't work when more than one qemu is running since the port
will be conflicted. And since all of the QB_SLIRP_OPT are the same,
so I'd like to set it as a default value in runqemu, just like
what we do for QB_TAP_OPT. And if we break them into two parts:

"-device virtio-net-device,netdev=net0" and
"-netdev user,id=net0,hostfwd=tcp::2222-:22"

Then there is no way for user to override the second part, and we can't
call the first part as a "QB_SLIRP_OPT" since it is only part of them,
so I won't break them into 2, and if the user defines QB_SLIRP_OPT
in there bsp conf file, then it will be replaced totally.

I will send a new patch for fixing this, and will add you in the CC list.

// Robert


> +        self.set('NETWORK_CMD', network_cmd)
>
>      def setup_tap(self):
>          """Setup tap"""
>

