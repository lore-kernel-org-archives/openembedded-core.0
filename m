Return-Path: <andre.draszik@gmail.com>
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by mail.openembedded.org (Postfix) with ESMTP id 920D060103
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Mar 2018 16:59:18 +0000 (UTC)
Received: by mail-io0-f195.google.com with SMTP id f1so12291643iob.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Mar 2018 09:59:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=gMT4O/+fM+Qbt5ZqyxtVyPGf0+6Z5mHNRPdSj/gKACQ=;
	b=XhPeIR0KAgT3mtJyErTpe1m47XEf+R5vbQVb4/WSdi5di9OY/Y/T9L0kQFNyK33obx
	yQkgYQ46BrUTtyViAeTwinzUX7sSS7xQMw94CRPIn5ohORbN2MMSKJ3sbQLzjKpmS+hT
	sSt7JMDG0wX7orBSUEbfmAPPd6wbtQuve8G6ZlD/C05QC4jMIkmn8isNPCoNwbrqYHZQ
	5xw7f/DdjJlPo6lQ2A7QsvhKi2iz1r37Yme3CotWN3k/nFiindgscgyZCBJ5lOp482r+
	baQMyFsxrgx20b2OArJZtvGq1/x7a3Elij4ADAkU+1HYabx0ULZ7A45FOXRiPYRNV3/R
	nlRw==
X-Gm-Message-State: AElRT7Fjznuitxj2Fehs/i3FiGNz7l7sJIsaRE2ily2fufP1w0o0zA0x
	EdrUFz7vcOuPpRr3ixR0MTIIcPLM
X-Google-Smtp-Source: AG47ELs9pLLRzcP5CjWfCM7zYuJwm+hbLVFpOPPCYwEqsaokqk+0D7MArUwYjeNSs/OxdKhQvqNeSg==
X-Received: by 10.107.81.6 with SMTP id f6mr5353515iob.196.1520873959010;
	Mon, 12 Mar 2018 09:59:19 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id w37sm5447087ioi.1.2018.03.12.09.59.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 12 Mar 2018 09:59:16 -0700 (PDT)
Message-ID: <1520873954.3748.6.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Mar 2018 16:59:14 +0000
In-Reply-To: <1520865187-13798-1-git-send-email-okonopli@cisco.com>
References: <1520865187-13798-1-git-send-email-okonopli@cisco.com>
X-Mailer: Evolution 3.26.5-1 
Mime-Version: 1.0
Subject: Re: [PATCH] core-image-minimal-initramfs: prepare initramfs for NFS boot
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
X-List-Received-Date: Mon, 12 Mar 2018 16:59:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi.

It'd be nice if this was part of initramfs-framework instead.

In particular some devices need a bit more than ifconfig & route, e.g.
configuration of SoC internal Ethernet switches.

As it is, this patch is not very generic, whereas if it was integrated with
the initramfs-framework, another module could take care of the driver /
hardware specifics, and this module would just do the actual mounting of the
ROOTFS.

The remaining bits, like mount --move of /proc are also already part of
initramfs-framework.

That way, this new addition would be useful on a wide range of devices.


Cheers,
Andre'

On Mon, 2018-03-12 at 16:33 +0200, Oleksii Konoplitskyi wrote:
> It helps to boot device by mounting rootfs via NFS when network
> drivers are built as modules.
> We include modules in core-image-minimal-initramfs image
> and start kernel with specifying custom rdinit in cmdline:
>    rdinit=/init-nfs.sh
> 
> NFS and IP parameters should be passed to kernel as usual.
> For example:
>    ip=192.168.0.11::192.168.0.1:255.255.255.0:linux:eth0:off
>    nfsroot=192.168.0.10:/exported_nfs,nfsvers=3,tcp
>    root=/dev/nfs rw loglevel=7 rdinit=/init-nfs.sh
> 
> To use this initramfs, one could put the following
> to conf/local.conf:
>    INITRAMFS_LOAD_KERNEL_MODULES = "kernel-module-igb"
>    INITRAMFS_IMAGE_BUNDLE = "1"
>    INITRAMFS_IMAGE = "core-image-minimal-initramfs"
> 
> INITRAMFS_LOAD_KERNEL_MODULES is a space-separated list of
> modules that will be added to initramfs.
> 
> Signed-off-by: Andrii Bordunov <aborduno@cisco.com>
> Signed-off-by: Oleksii Konoplitskyi <okonopli@cisco.com>
> ---
>  .../images/core-image-minimal-initramfs.bb         |   2 +-
>  meta/recipes-core/initrdscripts/files/init-nfs.sh  | 108
> +++++++++++++++++++++
>  .../initrdscripts/initramfs-nfs-boot_1.0.bb        |  14 +++
>  3 files changed, 123 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-core/initrdscripts/files/init-nfs.sh
>  create mode 100644 meta/recipes-core/initrdscripts/initramfs-nfs-
> boot_1.0.bb
> 
> diff --git a/meta/recipes-core/images/core-image-minimal-initramfs.bb
> b/meta/recipes-core/images/core-image-minimal-initramfs.bb
> index c446e87..bf794bf 100644
> --- a/meta/recipes-core/images/core-image-minimal-initramfs.bb
> +++ b/meta/recipes-core/images/core-image-minimal-initramfs.bb
> @@ -3,7 +3,7 @@ DESCRIPTION = "Small image capable of booting a device.
> The kernel includes \
>  the Minimal RAM-based Initial Root Filesystem (initramfs), which finds
> the \
>  first 'init' program more efficiently."
>  
> -PACKAGE_INSTALL = "initramfs-live-boot initramfs-live-install initramfs-
> live-install-efi ${VIRTUAL-RUNTIME_base-utils} udev base-passwd
> ${ROOTFS_BOOTSTRAP_INSTALL}"
> +PACKAGE_INSTALL = "initramfs-live-boot initramfs-live-install initramfs-
> live-install-efi ${VIRTUAL-RUNTIME_base-utils} udev base-passwd
> ${ROOTFS_BOOTSTRAP_INSTALL} initramfs-nfs-boot"
>  
>  # Do not pollute the initrd image with rootfs features
>  IMAGE_FEATURES = ""
> diff --git a/meta/recipes-core/initrdscripts/files/init-nfs.sh
> b/meta/recipes-core/initrdscripts/files/init-nfs.sh
> new file mode 100644
> index 0000000..31a55ec
> --- /dev/null
> +++ b/meta/recipes-core/initrdscripts/files/init-nfs.sh
> @@ -0,0 +1,108 @@
> +#!/bin/sh
> +
> +CONSOLE="/dev/console"
> +PATH=/sbin:/bin:/usr/sbin:/usr/bin
> +ROOT_MOUNT="/rootfs"
> +
> +fatal()
> +{
> +	echo $1 >$CONSOLE
> +	echo >$CONSOLE
> +	exec sh
> +}
> +
> +net_up()
> +{
> +	[ "$(ifconfig $PARAM_IFNAME | awk '/inet addr/{print
> substr($2,6)}')" = "$PARAM_IP" ] && return
> +	#load all ethernet drivers if network interface is not configured
> +	MODULES="$(find /lib/modules/*/kernel/drivers/net/ethernet -name
> \*.ko | sed -e 's,^.*/,,' -e 's,\.ko$,,')"
> +	[ -z "$MODULES" ] && fatal "Ethernet drivers list is emty.
> Nothing to load."
> +	modprobe -a $MODULES
> +
> +	ifconfig $PARAM_IFNAME $PARAM_IP netmask $PARAM_NETMASK ||
> +		fatal "Failed to configure ethernet interface"
> +	route add default gw $PARAM_GW ||
> +		fatal "Failed to set default gateway"
> +}
> +
> +
> +#TODO: IPv6 is not supported yet
> +mount_nfs()
> +{
> +	mkdir $ROOT_MOUNT
> +	for i in $(seq 1 10)
> +	do
> +		mount -t nfs "$PARAM_NFSROOT_PATH" -o
> nolock,"$PARAM_NFSROOT_OPTS" $ROOT_MOUNT && return
> +		sleep 1
> +	done
> +	fatal "Could not mount rootfs via nfs"
> +}
> +
> +
> +early_setup()
> +{
> +	mkdir -p /proc
> +	mkdir -p /sys
> +	mount -t proc proc /proc
> +	mount -t sysfs sysfs /sys
> +	mount -t devtmpfs none /dev
> +
> +	mkdir -p /run
> +	mkdir -p /var/run
> +}
> +
> +
> +#TODO: IPv6 is not supported yet
> +read_args()
> +{
> +	[ -z "$CMDLINE" ] && CMDLINE=$(cat /proc/cmdline)
> +	for arg in $CMDLINE; do
> +		optarg=$(expr "x$arg" : 'x[^=]*=\(.*\)'$)
> +		case $arg in
> +		ip=*)
> +			PARAM_IFNAME=$(echo "$optarg" | cut -d: -f6)
> +			PARAM_IP_ALL=$(echo "$optarg" | grep -Eo '([0-
> 9]{1,3}\.){3}[0-9]{1,3}')
> +			PARAM_IP=$(echo "$PARAM_IP_ALL" | sed -n 1p)
> +			PARAM_GW=$(echo "$PARAM_IP_ALL" | sed -n 2p)
> +			PARAM_NETMASK=$(echo "$PARAM_IP_ALL" | sed -n 3p)
> +			;;
> +		nfsroot=*)
> +			PARAM_NFSROOT_PATH=$(echo "$optarg" | cut -d,
> -f1)
> +			PARAM_NFSROOT_OPTS=$(echo "$optarg" | cut -d,
> -f2-)
> +			;;
> +		debugshell)
> +			DEBUGSHELL=1
> +			;;
> +		esac
> +	done
> +}
> +
> +boot_nfs()
> +{
> +	touch $ROOT_MOUNT/bin || fatal "Rootfs is not writeable"
> +
> +	mount -n --move /proc ${ROOT_MOUNT}/proc
> +	mount -n --move /sys ${ROOT_MOUNT}/sys
> +	mount -n --move /dev ${ROOT_MOUNT}/dev
> +
> +	cd $ROOT_MOUNT
> +
> +	# busybox switch_root supports -c option
> +	exec switch_root -c /dev/console $ROOT_MOUNT /sbin/init $CMDLINE
> ||
> +		fatal "Couldn't switch_root, dropping to shell"
> +}
> +
> +early_setup
> +
> +read_args
> +
> +if [ -n "$DEBUGSHELL" ]; then
> +	exec sh
> +fi
> +
> +net_up
> +
> +mount_nfs
> +
> +boot_nfs
> +
> diff --git a/meta/recipes-core/initrdscripts/initramfs-nfs-boot_1.0.bb
> b/meta/recipes-core/initrdscripts/initramfs-nfs-boot_1.0.bb
> new file mode 100644
> index 0000000..ca4f191
> --- /dev/null
> +++ b/meta/recipes-core/initrdscripts/initramfs-nfs-boot_1.0.bb
> @@ -0,0 +1,14 @@
> +SUMMARY = "Live image init script"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM =
> "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> +RDEPENDS_${PN} = "${@['', d.getVar('INITRAMFS_LOAD_KERNEL_MODULES',
> True)][d.getVar('INITRAMFS_LOAD_KERNEL_MODULES', True) is not None]}"
> +SRC_URI = "file://init-nfs.sh"
> +
> +S = "${WORKDIR}"
> +
> +do_install() {
> +        install -m 0755 ${WORKDIR}/init-nfs.sh ${D}/init-nfs.sh
> +}
> +
> +FILES_${PN} += " /init-nfs.sh "
> +
> -- 
> 2.7.4
> 

