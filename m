Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TU0iT-0008Mz-VB for openembedded-core@lists.openembedded.org;
	Thu, 01 Nov 2012 20:46:14 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qA1JWS9X010865;
	Thu, 1 Nov 2012 19:32:28 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10650-03-2; Thu,  1 Nov 2012 19:32:19 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qA1JW0q3010713
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Thu, 1 Nov 2012 19:32:01 GMT
Message-ID: <1351798319.6502.19.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alex DAMIAN <alexandru.damian@intel.com>
Date: Thu, 01 Nov 2012 19:31:59 +0000
In-Reply-To: <1351780335-12617-1-git-send-email-alexandru.damian@intel.com>
References: <1351780335-12617-1-git-send-email-alexandru.damian@intel.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] initrdscripts: fix udevd path
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
X-List-Received-Date: Thu, 01 Nov 2012 19:46:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-11-01 at 16:32 +0200, Alex DAMIAN wrote:
> From: Ross Burton <ross.burton@intel.com>
> 
> udevd moved location and isn't in $PATH anymore, so use an absolute path to
> start it.
> 
> The control socket path moved too, so mkdir the directory it's in.

This patch looks to do a little more than that...

Cheers,

Richard

> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-core/initrdscripts/files/init-live.sh |   50 +++++++++++++++++---
>  .../initrdscripts/initramfs-framework/udev         |    6 +--
>  .../initrdscripts/initramfs-framework_1.0.bb       |    2 +
>  .../initrdscripts/initramfs-live-boot_1.0.bb       |    2 +-
>  4 files changed, 50 insertions(+), 10 deletions(-)
> 
> diff --git a/meta/recipes-core/initrdscripts/files/init-live.sh b/meta/recipes-core/initrdscripts/files/init-live.sh
> index 5682fd1..fdea892 100644
> --- a/meta/recipes-core/initrdscripts/files/init-live.sh
> +++ b/meta/recipes-core/initrdscripts/files/init-live.sh
> @@ -19,7 +19,8 @@ early_setup() {
>      modprobe isofs 2> /dev/null
>  
>      mkdir -p /run
> -    udevd --daemon
> +    mkdir -p /var/run
> +    /lib/udev/udevd --daemon
>      udevadm trigger --action=add
>  }
>  
> @@ -68,13 +69,49 @@ fatal() {
>  
>  early_setup
>  
> +# wait for the udevd to settle
> +echo "Waiting for udev to settle..."
> +sleep 3
> +
>  [ -z "$CONSOLE" ] && CONSOLE="/dev/console"
>  
>  read_args
>  
> -echo "Waiting for removable media..."
> -while true
> +# boot partiton menu, if one or more bootable partitions exist
> +BOOTMENU=`ls /media/sd*/sbin/init 2>/dev/null | wc -l`
> +if [ $BOOTMENU -gt 0 ]; then
> +	choice=0
> +	while [ $choice -le 0 ]; do
> +		echo "1). boot live ramfs image"
> +		count=2
> +		for i in `ls /media/sd*/sbin/init 2>/dev/null | cut -d "/" -f 3`; do
> +			echo $count"). boot /dev/"$i
> +			choicecmd[$count]=$i
> +			count=$(( count + 1))
> +		done
> +		echo
> +		echo -n "Your choice: "
> +		read choice
> +	done
> +	
> +	if [ $choice -gt 1 ]; then 
> +		#ROOT_MOUNT=/media/${choicecmd[${choice}]}
> +		ROOT_MOUNT=none	#testing
> +		echo "Booting local root ... $ROOT_MOUNT"
> +		if [ -d $ROOT_MOUNT ]; then
> +			boot_live_root
> +		else
> +			fatal "Rootfs partition not mounted"
> +		fi
> +	fi
> +fi	
> +
> +echo -n "Waiting for removable media... "
> +CNT=0
> +while [ $CNT -le 3 ];
>  do
> +  echo -n "$CNT "
> +  CNT=$(( $CNT + 1 ))
>    for i in `ls /media 2>/dev/null`; do
>        if [ -f /media/$i/$ROOT_IMAGE ] ; then
>  		found="yes"
> @@ -82,7 +119,7 @@ do
>  	  elif [ -f /media/$i/isolinux/$ROOT_IMAGE ]; then
>  		found="yes"
>  		ISOLINUX="isolinux"
> -		break	
> +		break
>        fi
>    done
>    if [ "$found" = "yes" ]; then
> @@ -90,13 +127,14 @@ do
>    fi
>    sleep 1
>  done
> +if [ "$found" != "yes" ]; then
> +	fatal "...could not mount removable media, drop to shell"
> +fi
>  
>  case $label in
>      boot)
>  	mkdir $ROOT_MOUNT
>  	mknod /dev/loop0 b 7 0 2>/dev/null
> -
> -	
>  	if [ "$UNIONFS" = "yes" ]; then
>  	    mkdir /rootfs-tmp
>  
> diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/udev b/meta/recipes-core/initrdscripts/initramfs-framework/udev
> index 9ea8aa3..15a1d5b 100644
> --- a/meta/recipes-core/initrdscripts/initramfs-framework/udev
> +++ b/meta/recipes-core/initrdscripts/initramfs-framework/udev
> @@ -3,8 +3,8 @@
>  # Licensed on MIT
>  
>  udev_enabled() {
> -	if [ ! -e /sbin/udevd ]; then
> -		debug "/sbin/udev doesn't exist"
> +	if [ ! -e /lib/udev/udevd ]; then
> +		debug "/lib/udev/udev doesn't exist"
>  		return 1
>  	fi
>  
> @@ -14,7 +14,7 @@ udev_enabled() {
>  udev_run() {
>  	mkdir -p /run
>  
> -	udevd --daemon > /dev/null
> +	/lib/udev/udevd --daemon > /dev/null
>  	udevadm trigger --action=add
>  	udevadm settle
>  
> diff --git a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
> index 58e41d4..45d6592 100644
> --- a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
> +++ b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
> @@ -3,6 +3,8 @@ LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
>  RDEPENDS = "busybox"
>  
> +PR = "r1"
> +
>  inherit allarch
>  
>  SRC_URI = "file://init \
> diff --git a/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb
> index 137a401..55a8600 100644
> --- a/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb
> +++ b/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb
> @@ -5,7 +5,7 @@ RDEPENDS = "udev"
>  DEPENDS = "virtual/kernel"
>  SRC_URI = "file://init-live.sh"
>  
> -PR = "r10"
> +PR = "r11"
>  
>  do_compile() {
>  	#if grep -q "CONFIG_UNION_FS=y" ${STAGING_KERNEL_DIR}/.config; then




