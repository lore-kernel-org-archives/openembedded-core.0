Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 351FA73197
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2016 08:17:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u5N8HCHc013603; Thu, 23 Jun 2016 09:17:19 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id MM3_I2gBXe74; Thu, 23 Jun 2016 09:17:19 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u5N8HFW7013615
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 23 Jun 2016 09:17:16 +0100
Message-ID: <1466669835.3319.205.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 23 Jun 2016 09:17:15 +0100
In-Reply-To: <cover.1462867278.git.liezhi.yang@windriver.com>
References: <cover.1462867278.git.liezhi.yang@windriver.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
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
X-List-Received-Date: Thu, 23 Jun 2016 08:17:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Robert,

On Tue, 2016-05-10 at 01:13 -0700, Robert Yang wrote:
> This is still WIP, I send this out to make sure that I won't walk on
> wrong way too far. Please feel free to give any comments.
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
>   usage, for example, qemu-system-foo can boot the target, but
> runqemu
>   can't, and we need edit runqemu/runqemu-internal a lot to support
> boot
>   it.
> 
> * Brief introduction on implemention
>   The basic thought is that, machine/bsp developer knows clearly on
>   whether qemu can boot the target or not (QEMU_BOOT_SUPPORTED = "1"
> or
>   "0"), and how to boot it, so we leave these settings in the
> machine's
>   configuration.
>   - qemu-boot.bbclass will write machine's info to
>     ${DEPLOY_DIR_IMAGE}/qemu-boot, and runqemu will invoke it.
>   - We need use "runqemu -m <machine>" rather than "runqemu
> <machine>"
>     since the scripts knows nothing about machine any more, and the
>     similar to other old options, this is good for future's
> extension.
>   - I have updated all the machine's configuration except qemush4,
> since
>     I can't find this machine anywhere.
>   - Several machines such as genericx86 and genericx86-64 can be boot
> by
>     new runqemu without any changes.
>   - Added help info for supported options such as slirp and audio.
> 
> * Usage
> Usage: runqemu <options>
>     -m <machine>, specify machine
>     -k <kernel>, specify kernel
>     -r <rootfs>, specify disk image, rootfs or nfs dir
>     -t <fstype>, specify fstypes, supported types:
>                  ext[234], jffs2, btrfs, cpio.gz(ramfs), cpio,
> hddimg,
>                  hdddirect, vmdk, wic, qcow2, vdi
>     -n, nographic, disables video console
>     -K, enable KVM when running x86 and x86-64 (VT-capable CPU
> required)
>     -V, enables KVM with VHOST support when running x86 and x86-64
> (VT-capable CPU required)
>     -v, publicvnc - enable a VNC server open to all hosts
>     -u, slirp mode, use user mode networking (no root privilege is
> required)
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

Sorry about not responding to this before now. My concerns:

a) The commandline structure is changing and I'm not sure I like the
new one or believe its an improvement. This is particularly problematic
from a documentation perspective. Is there a way to preserve the
existing syntax?

b) The question of python verses shell. I'm leaning towards making this
a python script rather than shell at this point. It would mean you'd
need python to run the scripts but we already need that for a variety
of other tools so in general I think I prefer that. We do need to make
sure the new python version supports what the current shell script does
though.

c) I don't think qemu-boot should be added be hardcoded into 
image.bbclass, we need to find a better way to do this.

d) I think we need to document the new API/variables somewhere so that
we don't just have a random ever changing set of variables but some
kind of standard we're trying to encourage.

Cheers,

Richard

