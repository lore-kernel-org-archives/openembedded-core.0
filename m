Return-Path: <nathan@nathanrossi.com>
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
	[209.85.161.193])
	by mail.openembedded.org (Postfix) with ESMTP id AF03560620
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 14:57:52 +0000 (UTC)
Received: by mail-yw0-f193.google.com with SMTP id i22so10831041ywc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 07:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=w4I91qhn5oKzO3v3oxHqpyVs0q2qt/KewhIWmhgUT/A=;
	b=dGJz1s7Dc+06j1anL2pgNlPUnD5s0PiWUjuhX2QsKVFrhrKTuUuYMauv1MjkzoyPEr
	uF2iXtWY/azoBc86nzDT9LQCnmAgLIyOpwFZKJRN0midwmT8zP7l/5kGNXd+eFzaTRiG
	uI4oVXmcJg6x6LEW9EGU1n+7HobC1aWg08jCU6I+wr81121BHnb//Ba53SP9/jMptg+O
	MeXUMZotfHsM+sDI7Ir/KrgsisloiGADvlxqzSYT/Ljveuj2lfnAQQUVdiyBPHIg9i2T
	O28DMZl5EaXMmSUP8JDn7g7Hs5fxwEsRye1DYntqDk9MXroDCmR8z/ZQT0tUoCKuq2d/
	QqIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=w4I91qhn5oKzO3v3oxHqpyVs0q2qt/KewhIWmhgUT/A=;
	b=YX5jAhHiQMq9QZcrwGIKN51EX+1dm/TR4eoNCazvCjrEp9qjxgnKC54i68IgWgqspV
	NBEeZBRIs1Ckfyv2fWTOe/uF4CzlUprXC86PD/oWwrWsKo09BbsKwkt20SX31cKtIpjp
	zboj7GQfAsbel34CyPUy4XDu8KdiABEelgtIYcjMEg95y3jzFISXuOrFOgkyYTAuvGkr
	Mfhx7v4iX1DlDHLreM17KTLJOq/RgmJCzJ8Vs7yZ9V/uuR70R/4/2C7W8HDXgR2nrlQB
	E4g60XLJaeTXMw2/kmC7YwWwsGOJ6jivjcTXgppMyi855QPYnD6yikB0ftNJiUpPnWgA
	VYVA==
X-Gm-Message-State: AOPr4FUAKOyrripzEtGO7HyLSHqkd8e4/UkBJK8tv5qCUerAtHxTnPgW+YVvZF4Tu/gXggWikKUYt7nlGML7eA==
MIME-Version: 1.0
X-Received: by 10.37.2.88 with SMTP id 85mr6951966ybc.66.1463669872777; Thu,
	19 May 2016 07:57:52 -0700 (PDT)
Received: by 10.129.128.193 with HTTP; Thu, 19 May 2016 07:57:52 -0700 (PDT)
In-Reply-To: <cover.1462867278.git.liezhi.yang@windriver.com>
References: <cover.1462867278.git.liezhi.yang@windriver.com>
Date: Fri, 20 May 2016 00:57:52 +1000
Message-ID: <CA+aJhH1hOeD=oj7guxX8_Wm9gU6OS6W=r32WJFgGuLzAjTcw2g@mail.gmail.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH 0/8] [WIP] runqemu/runqemu-internal: refactor it
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
X-List-Received-Date: Thu, 19 May 2016 14:57:55 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, May 10, 2016 at 6:13 PM, Robert Yang <liezhi.yang@windriver.com> wrote:
> Hello,
>
> This is still WIP, I send this out to make sure that I won't walk on
> wrong way too far. Please feel free to give any comments.

Hi Robert,

This is great! So I went ahead and tested out converting the
qemumicroblaze and qemuzynq machines to work with these changes, as
well as some additional machines. Here is a meta-xilinx branch
(https://github.com/nathanrossi/meta-xilinx/tree/nrossi/runqemu-rfc)
with these changes for anyone who is curious.

Everything seems to work well, I was able to boot all the meta-xilinx
QEMU machines. Although there were a couple of things that I noticed
when getting these machines going:

QEMU_DTB, should probably be named QEMU_DTB_OPTIONS or alternatively
can just be included as part of QEMU_OPTIONS from within the bitbake
environment. But it would be nice to be able to just define the name
of the DTB and the runqemu scripts do the finding (like for kernel and
rootfs).

The "-s" and the "-n" runqemu options add "console=ttyS0" to the
kernel options regardless of target. For qemuzynq you might have
noticed the sed expression that overrides it previously
(http://git.openembedded.org/openembedded-core/tree/scripts/runqemu-internal#n494).
It is probably worth pulling in serial kernel options from a bitbake
variable.

Regards,
Nathan

>
> TODO:
> * Update the one which uses runqemu, such as oeqa
> * Boot EFI image
> * Boot multilib image such as lib32-foo
> * Change the vars name such as QEMU_SYSTEM_OPTIONS and
>   QEMU_SECOND_SERIAL_OPT
> * More testing
>
>
> === Taken from patch 8/8's commit message:
> * Why refactor
>   The old runqemu had hardcoded machine knowledge, which limited its
>   usage, for example, qemu-system-foo can boot the target, but runqemu
>   can't, and we need edit runqemu/runqemu-internal a lot to support boot
>   it.
>
> * Brief introduction on implemention
>   The basic thought is that, machine/bsp developer knows clearly on
>   whether qemu can boot the target or not (QEMU_BOOT_SUPPORTED = "1" or
>   "0"), and how to boot it, so we leave these settings in the machine's
>   configuration.
>   - qemu-boot.bbclass will write machine's info to
>     ${DEPLOY_DIR_IMAGE}/qemu-boot, and runqemu will invoke it.
>   - We need use "runqemu -m <machine>" rather than "runqemu <machine>"
>     since the scripts knows nothing about machine any more, and the
>     similar to other old options, this is good for future's extension.
>   - I have updated all the machine's configuration except qemush4, since
>     I can't find this machine anywhere.
>   - Several machines such as genericx86 and genericx86-64 can be boot by
>     new runqemu without any changes.
>   - Added help info for supported options such as slirp and audio.
>
> * Usage
> Usage: runqemu <options>
>     -m <machine>, specify machine
>     -k <kernel>, specify kernel
>     -r <rootfs>, specify disk image, rootfs or nfs dir
>     -t <fstype>, specify fstypes, supported types:
>                  ext[234], jffs2, btrfs, cpio.gz(ramfs), cpio, hddimg,
>                  hdddirect, vmdk, wic, qcow2, vdi
>     -n, nographic, disables video console
>     -K, enable KVM when running x86 and x86-64 (VT-capable CPU required)
>     -V, enables KVM with VHOST support when running x86 and x86-64 (VT-capable CPU required)
>     -v, publicvnc - enable a VNC server open to all hosts
>     -u, slirp mode, use user mode networking (no root privilege is required)
>     -a, support audio
>     -s, enable a serial console on /dev/ttyS0
>     -q <qemuparams> - specify custom parameters to QEMU
>     -b <bootparams> - specify custom kernel parameters during boot
>     -p <portnum>, tcp serial port number
>     -B <biosdir>, bios directory
>     -F <biosfilename>, bios filename.
>
>     Examples:
>       runqemu -m qemuarm -n
>       runqemu -m qemuarm -t ext4
>       runqemu -m qemux86-64 -r core-image-sato -t ext4
>       runqemu -m qemux86 -r path/to/nfsrootdir/
>       runqemu -r path/to/deploy/dir/image/file.vmdk
>       runqemu -m qemumips -q "-m 256"
>       runqemu -m qemuppc -b "psplash=false"
>
> // Robert
>
> The following changes since commit ece101be5158beee709cdfbb85ecdbdc8d9fb864:
>
>   test-empty-image: Fix LIC_FILES_CHKSUM typo (2016-05-06 10:47:59 +0100)
>
> are available in the git repository at:
>
>   git://git.openembedded.org/openembedded-core-contrib rbt/runqemu
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/runqemu
>
> Robert Yang (8):
>   qemu-boot.bbclass: add it for runqemu
>   qemu.inc: set QEMU_BOOT_SUPPORTED to 1
>   qemuarm.conf: set vars for runqemu
>   arch-arm64.inc: set vars for runqemu
>   arch-x86.inc: set vars for runqemu
>   arch-mips.inc: set vars for runqemu
>   arch-powerpc.inc: set vars for runqemu
>   runqemu/runqemu-internal: refactor it
>
>  meta/classes/image.bbclass                         |   3 +
>  meta/classes/qemu-boot.bbclass                     |  39 ++
>  meta/conf/bitbake.conf                             |   3 +
>  meta/conf/machine/include/arm/arch-arm64.inc       |   7 +
>  meta/conf/machine/include/arm/arch-armv6.inc       |   2 +
>  meta/conf/machine/include/mips/arch-mips.inc       |   5 +
>  meta/conf/machine/include/powerpc/arch-powerpc.inc |   5 +
>  meta/conf/machine/include/qemu.inc                 |   2 +
>  meta/conf/machine/include/tune-cortexa8.inc        |   2 +
>  meta/conf/machine/include/x86/arch-x86.inc         |   6 +
>  meta/conf/machine/qemuarm.conf                     |   3 +
>  scripts/runqemu                                    | 603 +++++++-----------
>  scripts/runqemu-internal                           | 678 +++++++--------------
>  13 files changed, 505 insertions(+), 853 deletions(-)
>  create mode 100644 meta/classes/qemu-boot.bbclass
>
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

