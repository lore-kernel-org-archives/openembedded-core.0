Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SHuRc-0005Is-53 for openembedded-core@lists.openembedded.org;
	Wed, 11 Apr 2012 12:06:32 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3B9vD5v006148
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2012 10:57:13 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05234-06 for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2012 10:57:09 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3B9v32I006142
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2012 10:57:07 +0100
Message-ID: <1334138224.10826.130.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 11 Apr 2012 10:57:04 +0100
In-Reply-To: <5db901b79e5dde24e04a4c6237c377d8a9fdac22.1334107957.git.sgw@linux.intel.com>
References: <cover.1334107957.git.sgw@linux.intel.com>
	<5db901b79e5dde24e04a4c6237c377d8a9fdac22.1334107957.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PULL (for RC3) 2/5] initrdscripts: fix init-live.sh and use unionfs
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
X-List-Received-Date: Wed, 11 Apr 2012 10:06:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-04-10 at 18:33 -0700, Saul Wold wrote:
> From: Yang Shi <yang.shi@windriver.com>
> 
> [YOCTO #1487]
> 
> When booting up with liveCD image, init scripts can't work well on read-only filesystem. Unionfs,
> which is supported in Yocto kernel, allows a filesystem to appear as writeable, but without
> actually allowing writes to change the filesystem.
> 
> Use unionfs to mount rootfs and make root file system can be writen when using liveCD to boot up.
> Set UNION_FS variable depending on kernel config, so that it can work with kernel which doesn't
> have unionfs feature.
> 
> Signed-off-by: Yang Shi <yang.shi@windriver.com>
> ---
>  meta/recipes-core/initrdscripts/files/init-live.sh |   23 ++++++++++++++++---
>  .../initrdscripts/initramfs-live-boot_1.0.bb       |    9 +++++++-
>  2 files changed, 27 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/recipes-core/initrdscripts/files/init-live.sh b/meta/recipes-core/initrdscripts/files/init-live.sh
> index eb5ab5b..737dae4 100644
> --- a/meta/recipes-core/initrdscripts/files/init-live.sh
> +++ b/meta/recipes-core/initrdscripts/files/init-live.sh
> @@ -7,6 +7,7 @@ ROOT_IMAGE="rootfs.img"
>  MOUNT="/bin/mount"
>  UMOUNT="/bin/umount"
>  ISOLINUX=""
> +UNIONFS="no"
>  
>  early_setup() {
>      mkdir /proc
> @@ -89,17 +90,31 @@ case $label in
>  	mkdir $ROOT_MOUNT
>  	mknod /dev/loop0 b 7 0 2>/dev/null
>  
> -	if ! $MOUNT -o rw,loop,noatime,nodiratime /media/$i/$ISOLINUX/$ROOT_IMAGE $ROOT_MOUNT ; then
> -	    fatal "Couldnt mount rootfs image"
> +	
> +	if [ "$UNIONFS" = "yes" ]; then
> +	    mkdir /rootfs-tmp
> +
> +	    if ! $MOUNT -o rw,loop,noatime,nodiratime /media/$i/$ISOLINUX/$ROOT_IMAGE /rootfs-tmp ; then
> +		fatal "Could not mount rootfs image"
> +	    else
> +		mkdir /cow
> +		mount -t tmpfs -o rw,noatime,mode=755 tmpfs /cow
> +		mount -t unionfs -o dirs=/cow:/rootfs-tmp=ro unionfs $ROOT_MOUNT
> +		boot_live_root
> +	    fi
>  	else
> -	    boot_live_root
> +	    if ! $MOUNT -o rw,loop,noatime,nodiratime /media/$i/$ISOLINUX/$ROOT_IMAGE $ROOT_MOUNT ; then
> +		fatal "Could not mount rootfs image"
> +	    else
> +		boot_live_root
> +	    fi
>  	fi
>  	;;
>      install)
>  	if [ -f /media/$i/$ISOLINUX/$ROOT_IMAGE ] ; then
>  	    ./install.sh $i/$ISOLINUX $ROOT_IMAGE $video_mode $vga_mode
>  	else
> -	    fatal "Couldnt find install script"
> +	    fatal "Could not find install script"
>  	fi
>  
>  	# If we're getting here, we failed...
> diff --git a/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb
> index e85a0e1..f7f0c9d 100644
> --- a/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb
> +++ b/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb
> @@ -2,10 +2,17 @@ DESCRIPTION = "A live image init script"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
>  RDEPENDS = "udev"
> +DEPENDS = "virtual/kernel"
>  SRC_URI = "file://init-live.sh"
>  
> -PR = "r7"
> +PR = "r8"
>  
> +do_compile() {
> +	if grep -q "CONFIG_UNION_FS=y" ${STAGING_KERNEL_DIR}/.config; then
> +		sed -i 's/UNIONFS="no"/UNIONFS="yes"/g' ${WORKDIR}/init-live.sh
> +	fi
> +}
> + 
>  do_install() {
>          install -m 0755 ${WORKDIR}/init-live.sh ${D}/init
>  }

Sadly, virtual/kernel is a machine specific dependency so we need to
remove the allarch inherit from the recipe and mark it as machine
specific too.

Cheers,

Richard



