Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 125066E6B1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2016 08:14:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u4A8E7f2025945
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2016 01:14:07 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 10 May 2016 01:14:06 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 May 2016 01:13:58 -0700
Message-ID: <cover.1462867278.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [RFC PATCH 0/8] [WIP] runqemu/runqemu-internal: refactor it
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
X-List-Received-Date: Tue, 10 May 2016 08:14:08 -0000
Content-Type: text/plain

Hello,

This is still WIP, I send this out to make sure that I won't walk on
wrong way too far. Please feel free to give any comments.

TODO:
* Update the one which uses runqemu, such as oeqa
* Boot EFI image
* Boot multilib image such as lib32-foo
* Change the vars name such as QEMU_SYSTEM_OPTIONS and
  QEMU_SECOND_SERIAL_OPT
* More testing


=== Taken from patch 8/8's commit message:
* Why refactor
  The old runqemu had hardcoded machine knowledge, which limited its
  usage, for example, qemu-system-foo can boot the target, but runqemu
  can't, and we need edit runqemu/runqemu-internal a lot to support boot
  it.

* Brief introduction on implemention
  The basic thought is that, machine/bsp developer knows clearly on
  whether qemu can boot the target or not (QEMU_BOOT_SUPPORTED = "1" or
  "0"), and how to boot it, so we leave these settings in the machine's
  configuration.
  - qemu-boot.bbclass will write machine's info to
    ${DEPLOY_DIR_IMAGE}/qemu-boot, and runqemu will invoke it.
  - We need use "runqemu -m <machine>" rather than "runqemu <machine>"
    since the scripts knows nothing about machine any more, and the
    similar to other old options, this is good for future's extension.
  - I have updated all the machine's configuration except qemush4, since
    I can't find this machine anywhere.
  - Several machines such as genericx86 and genericx86-64 can be boot by
    new runqemu without any changes.
  - Added help info for supported options such as slirp and audio.

* Usage
Usage: runqemu <options>
    -m <machine>, specify machine
    -k <kernel>, specify kernel
    -r <rootfs>, specify disk image, rootfs or nfs dir
    -t <fstype>, specify fstypes, supported types:
                 ext[234], jffs2, btrfs, cpio.gz(ramfs), cpio, hddimg,
                 hdddirect, vmdk, wic, qcow2, vdi
    -n, nographic, disables video console
    -K, enable KVM when running x86 and x86-64 (VT-capable CPU required)
    -V, enables KVM with VHOST support when running x86 and x86-64 (VT-capable CPU required)
    -v, publicvnc - enable a VNC server open to all hosts
    -u, slirp mode, use user mode networking (no root privilege is required)
    -a, support audio
    -s, enable a serial console on /dev/ttyS0
    -q <qemuparams> - specify custom parameters to QEMU
    -b <bootparams> - specify custom kernel parameters during boot
    -p <portnum>, tcp serial port number
    -B <biosdir>, bios directory
    -F <biosfilename>, bios filename.

    Examples:
      runqemu -m qemuarm -n
      runqemu -m qemuarm -t ext4
      runqemu -m qemux86-64 -r core-image-sato -t ext4
      runqemu -m qemux86 -r path/to/nfsrootdir/
      runqemu -r path/to/deploy/dir/image/file.vmdk
      runqemu -m qemumips -q "-m 256"
      runqemu -m qemuppc -b "psplash=false"

// Robert

The following changes since commit ece101be5158beee709cdfbb85ecdbdc8d9fb864:

  test-empty-image: Fix LIC_FILES_CHKSUM typo (2016-05-06 10:47:59 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/runqemu
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/runqemu

Robert Yang (8):
  qemu-boot.bbclass: add it for runqemu
  qemu.inc: set QEMU_BOOT_SUPPORTED to 1
  qemuarm.conf: set vars for runqemu
  arch-arm64.inc: set vars for runqemu
  arch-x86.inc: set vars for runqemu
  arch-mips.inc: set vars for runqemu
  arch-powerpc.inc: set vars for runqemu
  runqemu/runqemu-internal: refactor it

 meta/classes/image.bbclass                         |   3 +
 meta/classes/qemu-boot.bbclass                     |  39 ++
 meta/conf/bitbake.conf                             |   3 +
 meta/conf/machine/include/arm/arch-arm64.inc       |   7 +
 meta/conf/machine/include/arm/arch-armv6.inc       |   2 +
 meta/conf/machine/include/mips/arch-mips.inc       |   5 +
 meta/conf/machine/include/powerpc/arch-powerpc.inc |   5 +
 meta/conf/machine/include/qemu.inc                 |   2 +
 meta/conf/machine/include/tune-cortexa8.inc        |   2 +
 meta/conf/machine/include/x86/arch-x86.inc         |   6 +
 meta/conf/machine/qemuarm.conf                     |   3 +
 scripts/runqemu                                    | 603 +++++++-----------
 scripts/runqemu-internal                           | 678 +++++++--------------
 13 files changed, 505 insertions(+), 853 deletions(-)
 create mode 100644 meta/classes/qemu-boot.bbclass

-- 
2.7.4


