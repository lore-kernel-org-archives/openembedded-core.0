Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1QvMEw-0006k3-2v
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Aug 2011 06:35:58 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 21 Aug 2011 21:30:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,261,1312182000"; d="scan'208";a="40948892"
Received: from unknown (HELO [10.255.14.5]) ([10.255.14.5])
	by azsmga001.ch.intel.com with ESMTP; 21 Aug 2011 21:30:08 -0700
From: Tom Zanussi <tom.zanussi@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cda17353980ce57578825767486bcae41bfb3e59.1313700595.git.sgw@linux.intel.com>
References: <cover.1313700595.git.sgw@linux.intel.com>
	<cda17353980ce57578825767486bcae41bfb3e59.1313700595.git.sgw@linux.intel.com>
Date: Sun, 21 Aug 2011 23:30:47 -0500
Message-ID: <1313987447.2394.156.camel@elmorro>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Subject: Re: [CONSOLIDATED PULL 21/32] initrdscripts: fix init-live.sh
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Aug 2011 04:35:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-08-18 at 13:55 -0700, Saul Wold wrote:
> From: Jingdong Lu <jingdong.lu@windriver.com>
> 
> Fix bug: [YOCTO #686]
> Because the variable "ROOT_IMAGE" in init-live.sh is not correct, it fails to
> run when using liveCD. Modify value of "ROOT_IMAGE" to "isolinux/rootfs.img".
> If we want to use liveCD, we also need to add some kernel options related to
> CDROM support when compling kernel.
> 

This causes hddimgs to no longer work. e.g. trying to boot jasperforest,
sugarbay, or fri2 using a -live hddimg, the boot hangs with the
following or something similar:

input: Plus More Enterprise LTD. USB-compliant keyboard as /devices/pci0000:00/0
000:00:1a.0/usb1/1-1/1-1.3/1-1.3:1.0/input/input4
generic-usb 0003:0518:0001.0002: input: USB HID v1.10 Keyboard [Plus More Enterp
rise LTD. USB-compliant keyboard] on usb-0000:00:1a.0-1.3/input0
input: Plus More Enterprise LTD. USB-compliant keyboard as /devices/pci0000:00/0
000:00:1a.0/usb1/1-1/1-1.3/1-1.3:1.1/input/input5
generic-usb 0003:0518:0001.0003: input: USB HID v1.10 Mouse [Plus More Enterpris
e LTD. USB-compliant keyboard] on usb-0000:00:1a.0-1.3/input1
scsi 6:0:0:0: Direct-Access     SMI      USB DISK         1100 PQ: 0 ANSI: 0 CCS
sd 6:0:0:0: Attached scsi generic sg2 type 0
sd 6:0:0:0: [sdb] 3915776 512-byte logical blocks: (2.00 GB/1.86 GiB)
sd 6:0:0:0: [sdb] Write Protect is off
sd 6:0:0:0: [sdb] No Caching mode page present
sd 6:0:0:0: [sdb] Assuming drive cache: write through
sd 6:0:0:0: [sdb] No Caching mode page present
sd 6:0:0:0: [sdb] Assuming drive cache: write through
 sdb:
sd 6:0:0:0: [sdb] No Caching mode page present
sd 6:0:0:0: [sdb] Assuming drive cache: write through
sd 6:0:0:0: [sdb] Attached SCSI removable disk

Reverting commit 30ba9839a2dfcd144c3369644c00e1551b820b33 fixes the problem.

Tom

> Signed-off-by: Jingdong Lu <jingdong.lu@windriver.com>
> ---
>  meta/recipes-core/initrdscripts/files/init-live.sh |    2 +-
>  .../initrdscripts/initramfs-live-boot_1.0.bb       |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-core/initrdscripts/files/init-live.sh b/meta/recipes-core/initrdscripts/files/init-live.sh
> index f3e5145..1cd87e8 100644
> --- a/meta/recipes-core/initrdscripts/files/init-live.sh
> +++ b/meta/recipes-core/initrdscripts/files/init-live.sh
> @@ -1,7 +1,7 @@
>  #!/bin/sh
>  
>  ROOT_MOUNT="/rootfs/"
> -ROOT_IMAGE=rootfs.img
> +ROOT_IMAGE="isolinux/rootfs.img"
>  MOUNT="/bin/mount"
>  UMOUNT="/bin/umount"
>  
> diff --git a/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb
> index 7051cbd..140fb1d 100644
> --- a/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb
> +++ b/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb
> @@ -3,7 +3,7 @@ LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
>  SRC_URI = "file://init-live.sh"
>  
> -PR = "r3"
> +PR = "r4"
>  
>  do_install() {
>          install -m 0755 ${WORKDIR}/init-live.sh ${D}/init




