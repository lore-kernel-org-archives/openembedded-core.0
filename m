Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f194.google.com (mail-ua0-f194.google.com
	[209.85.217.194])
	by mail.openembedded.org (Postfix) with ESMTP id 28C046007A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 01:33:30 +0000 (UTC)
Received: by mail-ua0-f194.google.com with SMTP id u68so767747uau.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2016 18:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=H7ICmhy+1q6KOtEcADhAHgdIln+d3ZYtL3C0pLTCFy4=;
	b=V1Dbu36PPyzRQ8hah+d6VoEkQWbx2G2RT1F2FSFe5fqbickZY9Wfn+6fj3aieBLAwt
	7ci6p+rNNv1q8sd6Q1L0fpQIV3ouBdzn+jhjPCsvsoxg93I1LpQSdYls1VlS1LHwiB2a
	yPN2Qfnc0pQOqXsuy7cUewXJglFNRF9hB+/NN58vTwAzJYPPh/lKSvdWH81vAcBd3bsH
	WnjyyW0PTOH3BLCtEhAQzMMp7NEq+1efrCEVQExFjwgj66ZGnceQ92Xe12fqJO+Ywc3t
	nW5aWT88l5ukMPXSIJcYlT7UZoMCSbbOVvHCpmz7VwMU2Vn7xSqKk3lrimT1+XXL4HlI
	62QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=H7ICmhy+1q6KOtEcADhAHgdIln+d3ZYtL3C0pLTCFy4=;
	b=kf/cewPDjbi6sG5ZPezclACamQQLzDlJ06RPzoT6o26NN4TUYE52N4eLK9wlZl8UPE
	yeH8KW1VrNqHppmLYlu20x52XrUrM0P2LflEWAmnHw9wiiIEZFlhJ2jlLmG2PxnIYmb0
	7fgIbr6fwUPlNPi+gbTijeMSZi0Df79cZmkLV8X7Wa7ByIGbMWJJcAcGqeAk/ERGE8b4
	Y4aFfK+m0jZbXaNqD+QBvO2pgiuAyQeC7dpjB++f/wHQDdGFdAPQMQNo2ByvUv7M6lUz
	MuqpgRcSPfg5mkExAsW6wn/lFLgQZYZSd/E2rhYWv9Ga6IaAWXDz+Q727zyi8XkrebPo
	ulag==
X-Gm-Message-State: AA6/9Rn+ojYsmWL5H4rh61S0tQUgE5M9YMAq4h8NG7swqwOpGVKklNaqP5daT5f8Iqd3gwJmKYGSa65P3FAOaQ==
X-Received: by 10.176.3.215 with SMTP id 81mr2405208uau.148.1474594412382;
	Thu, 22 Sep 2016 18:33:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.80.33 with HTTP; Thu, 22 Sep 2016 18:33:02 -0700 (PDT)
In-Reply-To: <20160922135301.21195-1-nathan@nathanrossi.com>
References: <20160922135301.21195-1-nathan@nathanrossi.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 22 Sep 2016 18:33:02 -0700
Message-ID: <CAMKF1srSXApUd5fatR7ySGjaF2qJKg4n2=qq4KBaB1jA61z37g@mail.gmail.com>
To: Nathan Rossi <nathan@nathanrossi.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] runqemu: Move virtio RNG to machine configuration
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
X-List-Received-Date: Fri, 23 Sep 2016 01:33:33 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Sep 22, 2016 at 6:53 AM, Nathan Rossi <nathan@nathanrossi.com> wrote:
> Not all QEMU machines (outside of those available in OE-Core) are
> capable of using the virtio-rng-pci device due to various machine models
> not having a pci/virtio bus. This makes it such that the use of the
> '-device virtio-rng-pci' flag to QEMU is machine specific.
>
> This patch removes the general addition of the flag to all runqemu
> targets and adds the flag into the QB_OPT_APPEND for all the qemu*
> machines in OE-Core that support its use (which is all of them).
>
> Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
> ---
>  meta/conf/machine/include/qemuboot-mips.inc | 2 +-
>  meta/conf/machine/include/qemuboot-x86.inc  | 2 +-
>  meta/conf/machine/qemuarm.conf              | 2 +-
>  meta/conf/machine/qemuarm64.conf            | 2 +-
>  meta/conf/machine/qemuppc.conf              | 2 +-
>  scripts/runqemu                             | 3 ---
>  6 files changed, 5 insertions(+), 8 deletions(-)
>
> diff --git a/meta/conf/machine/include/qemuboot-mips.inc b/meta/conf/machine/include/qemuboot-mips.inc
> index 0f04b81443..01f8f8bb3b 100644
> --- a/meta/conf/machine/include/qemuboot-mips.inc
> +++ b/meta/conf/machine/include/qemuboot-mips.inc
> @@ -3,5 +3,5 @@ IMAGE_CLASSES += "qemuboot"
>  QB_MEM = "-m 256"
>  QB_MACHINE = "-machine malta"
>  QB_KERNEL_CMDLINE_APPEND = "console=ttyS0 console=tty"
> -QB_OPT_APPEND = "-vga cirrus -show-cursor -usb -usbdevice tablet"
> +QB_OPT_APPEND = "-vga cirrus -show-cursor -usb -usbdevice tablet -device virtio-rng-pci"
>  QB_SYSTEM_NAME = "qemu-system-${TUNE_ARCH}"
> diff --git a/meta/conf/machine/include/qemuboot-x86.inc b/meta/conf/machine/include/qemuboot-x86.inc
> index 221cc95052..20e90716db 100644
> --- a/meta/conf/machine/include/qemuboot-x86.inc
> +++ b/meta/conf/machine/include/qemuboot-x86.inc
> @@ -11,4 +11,4 @@ QB_CPU_KVM_x86-64 = "-cpu kvm64"
>  QB_AUDIO_DRV = "alsa"
>  QB_AUDIO_OPT = "-soundhw ac97,es1370"
>  QB_KERNEL_CMDLINE_APPEND = "vga=0 uvesafb.mode_option=640x480-32 oprofile.timer=1 uvesafb.task_timeout=-1"
> -QB_OPT_APPEND = "-vga vmware -show-cursor -usb -usbdevice tablet"
> +QB_OPT_APPEND = "-vga vmware -show-cursor -usb -usbdevice tablet -device virtio-rng-pci"
> diff --git a/meta/conf/machine/qemuarm.conf b/meta/conf/machine/qemuarm.conf
> index 4c5891ab7c..ff1ab7d48f 100644
> --- a/meta/conf/machine/qemuarm.conf
> +++ b/meta/conf/machine/qemuarm.conf
> @@ -14,6 +14,6 @@ SERIAL_CONSOLES = "115200;ttyAMA0 115200;ttyAMA1"
>  QB_SYSTEM_NAME = "qemu-system-arm"
>  QB_MACHINE = "-machine versatilepb"
>  QB_KERNEL_CMDLINE_APPEND = "console=ttyAMA0,115200 console=tty"
> -QB_OPT_APPEND = "-show-cursor -usb -usbdevice tablet"
> +QB_OPT_APPEND = "-show-cursor -usb -usbdevice tablet -device virtio-rng-pci"
>  PREFERRED_VERSION_linux-yocto ??= "4.8%"
>  QB_DTB = "${@base_version_less_or_equal('PREFERRED_VERSION_linux-yocto', '4.7', '', 'zImage-versatile-pb.dtb', d)}"
> diff --git a/meta/conf/machine/qemuarm64.conf b/meta/conf/machine/qemuarm64.conf
> index da59c338e4..a0920fe0e4 100644
> --- a/meta/conf/machine/qemuarm64.conf
> +++ b/meta/conf/machine/qemuarm64.conf
> @@ -15,7 +15,7 @@ QB_MEM = "-m 512"
>  QB_MACHINE = "-machine virt"
>  QB_CPU = "-cpu cortex-a57"
>  QB_KERNEL_CMDLINE_APPEND = "console=ttyAMA0,38400"
> -QB_OPT_APPEND = "-show-cursor"
> +QB_OPT_APPEND = "-show-cursor -device virtio-rng-pci"
>  QB_TAP_OPT = "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no -device virtio-net-device,netdev=net0,mac=@MAC@"
>  QB_SLIRP_OPT = "-netdev user,id=net0 -device virtio-net-device,netdev=net0"
>  QB_ROOTFS_OPT = "-drive id=disk0,file=@ROOTFS@,if=none,format=raw -device virtio-blk-device,drive=disk0"
> diff --git a/meta/conf/machine/qemuppc.conf b/meta/conf/machine/qemuppc.conf
> index e54c3dd18f..3ae33088ea 100644
> --- a/meta/conf/machine/qemuppc.conf
> +++ b/meta/conf/machine/qemuppc.conf
> @@ -16,5 +16,5 @@ QB_SYSTEM_NAME = "qemu-system-ppc"
>  QB_MACHINE = "-machine mac99"
>  QB_CPU = "-cpu G4"
>  QB_KERNEL_CMDLINE_APPEND = "console=tty console=ttyS0"
> -QB_OPT_APPEND = "-show-cursor -usb -usbdevice tablet"
> +QB_OPT_APPEND = "-show-cursor -usb -usbdevice tablet -device virtio-rng-pci"
>  QB_TAP_OPT = "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no -device virtio-net-pci,netdev=net0,mac=@MAC@"
> diff --git a/scripts/runqemu b/scripts/runqemu
> index 658f7c8abd..2ed6f9a26e 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -900,9 +900,6 @@ class BaseConfig(object):
>
>          self.qemu_opt = "%s %s %s %s %s" % (qemu_bin, self.get('NETWORK_CMD'), self.qemu_opt_script, self.get('ROOTFS_OPTIONS'), self.get('QB_OPT_APPEND'))
>
> -        # Enable virtio RNG else we can run out of entropy in guests
> -        self.qemu_opt += " -device virtio-rng-pci"
> -

I think this comment should be carried along too.

>          if self.snapshot:
>              self.qemu_opt += " -snapshot"
>
> --
> 2.9.3
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

