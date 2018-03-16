Return-Path: <okonopli@cisco.com>
X-Greylist: delayed 577 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 16 Mar 2018 18:30:14 UTC
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
	by mail.openembedded.org (Postfix) with ESMTP id 054C678869
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2018 18:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=8989; q=dns/txt; s=iport;
	t=1521225016; x=1522434616;
	h=subject:to:references:from:message-id:date:mime-version:
	in-reply-to:content-transfer-encoding;
	bh=uTJBioMYsFPfVV15vvuSTONAsRczOcsB8ujfPPiAegc=;
	b=g1UyAh6nGGhYkE+iqTU1xZl47pXnV97aNW0+aXSiMvKdfA2DBrPDv1eu
	7H7YjXnKfTsTRjWthrCIlvHK2M94Zn5fgzM4Rookki+i2vjrR6TLij0MJ
	Q42I/YkGub+Y4Rxj26NFQZkz3ZGvdx3UOWuYviK60XgyF4uujZWVkM23O I=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0CKAgAcCqxa/4kNJK1eGQEBAQEBAQEBA?=
	=?us-ascii?q?QEBAQcBAQEBAYNQZnIog12YFoEcMwspgRaTexSBfgofhHECgzUhNhYBAgEBAQE?=
	=?us-ascii?q?BAQJrKIUmAQUjDwEFUQsYAgIRFQICVwYBDAYCAQGFBw0PsGCCJoRug3KCChR4h?=
	=?us-ascii?q?CWCFIFUgVQoDIJshEEONz+CSYJBIAOHNIR2gS6KUQmGBokhB4gZhROQCQIECwI?=
	=?us-ascii?q?TAYEqJQEwgVJwFTqCQwmCKxsWjgo+NIxvgkkBAQE?=
X-IronPort-AV: E=Sophos;i="5.48,317,1517875200"; d="scan'208";a="85354588"
Received: from alln-core-4.cisco.com ([173.36.13.137])
	by alln-iport-3.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Mar 2018 18:20:38 +0000
Received: from [10.21.65.179] (sjc-vpn3-435.cisco.com [10.21.65.179])
	(authenticated bits=0)
	by alln-core-4.cisco.com (8.14.5/8.14.5) with ESMTP id w2GIKZrw009883
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO);
	Fri, 16 Mar 2018 18:20:37 GMT
To: =?UTF-8?Q?Andr=c3=a9_Draszik?= <git@andred.net>,
	openembedded-core@lists.openembedded.org, xe-linux-external@cisco.com
References: <1520865187-13798-1-git-send-email-okonopli@cisco.com>
	<1520873954.3748.6.camel@andred.net>
From: Oleksii Konoplitskyi <okonopli@cisco.com>
Message-ID: <052b3c4d-084c-9434-e47d-b68c068cd958@cisco.com>
Date: Fri, 16 Mar 2018 20:20:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1520873954.3748.6.camel@andred.net>
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Authenticated-User: okonopli
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
X-List-Received-Date: Fri, 16 Mar 2018 18:30:15 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Andre,

I could build initramfs using initramfs-framework. My device was booted 
successfully.

I created my own recipe to build initramfs image and added one more 
module nfsrootfs to initramfs-framework. Also initramfs-framework*.bb 
was updated.
Module "nfsrootfs" has content:


nfsrootfs_enabled() {
     [ -z ${bootparam_nfsroot+x} ] && return 1
     return 0
}

nfsrootfs_run() {
     MODULES="$(find /lib/modules/*/kernel/drivers/net/ethernet -name 
\*.ko | sed -e 's,^.*/,,' -e 's,\.ko$,,')"
     modprobe -a $MODULES

     ifname=$(echo $bootparam_ip | cut -d ':' -f 6)
     ipaddr=$(echo $bootparam_ip | cut -d ':' -f 1)
     netmask=$(echo $bootparam_ip | cut -d ':' -f 4)
     gateway=$(echo $bootparam_ip | cut -d ':' -f 3)

     ifconfig $ifname $ipaddr netmask $netmask
     route add default gw $gateway

     nfs_mount_point=$(echo $bootparam_nfsroot | cut -d ',' -f 1)
     nfs_mount_params=$(echo $bootparam_nfsroot | cut -d ',' -f 2)

     mount -t nfs ${nfs_mount_point} -o nolock,${nfs_server_params} 
$ROOTFS_DIR
}


This modules does not support ipv6 and dhcp configuration.

Taking into account your recommendations, module should have the next 
content:

nfsrootfs_enabled() {
     [ -z ${bootparam_nfsroot+x} ] && return 1
     return 0
}

nfsrootfs_run() {
     nfs_mount_point=$(echo $bootparam_nfsroot | cut -d ',' -f 1)
     nfs_mount_params=$(echo $bootparam_nfsroot | cut -d ',' -f 2)

     mount -t nfs ${nfs_mount_point} -o nolock,${nfs_server_params} 
$ROOTFS_DIR
}

What module is responsible for network configuration and network driver 
loading?
Should it be separate custom module in initramfs-framework not related 
to upstream?

Best regards,
Oleksii

On 12.03.18 18:59, André Draszik wrote:
> Hi.
>
> It'd be nice if this was part of initramfs-framework instead.
>
> In particular some devices need a bit more than ifconfig & route, e.g.
> configuration of SoC internal Ethernet switches.
>
> As it is, this patch is not very generic, whereas if it was integrated with
> the initramfs-framework, another module could take care of the driver /
> hardware specifics, and this module would just do the actual mounting of the
> ROOTFS.
>
> The remaining bits, like mount --move of /proc are also already part of
> initramfs-framework.
>
> That way, this new addition would be useful on a wide range of devices.
>
>
> Cheers,
> Andre'
>
> On Mon, 2018-03-12 at 16:33 +0200, Oleksii Konoplitskyi wrote:
>> It helps to boot device by mounting rootfs via NFS when network
>> drivers are built as modules.
>> We include modules in core-image-minimal-initramfs image
>> and start kernel with specifying custom rdinit in cmdline:
>>     rdinit=/init-nfs.sh
>>
>> NFS and IP parameters should be passed to kernel as usual.
>> For example:
>>     ip=192.168.0.11::192.168.0.1:255.255.255.0:linux:eth0:off
>>     nfsroot=192.168.0.10:/exported_nfs,nfsvers=3,tcp
>>     root=/dev/nfs rw loglevel=7 rdinit=/init-nfs.sh
>>
>> To use this initramfs, one could put the following
>> to conf/local.conf:
>>     INITRAMFS_LOAD_KERNEL_MODULES = "kernel-module-igb"
>>     INITRAMFS_IMAGE_BUNDLE = "1"
>>     INITRAMFS_IMAGE = "core-image-minimal-initramfs"
>>
>> INITRAMFS_LOAD_KERNEL_MODULES is a space-separated list of
>> modules that will be added to initramfs.
>>
>> Signed-off-by: Andrii Bordunov <aborduno@cisco.com>
>> Signed-off-by: Oleksii Konoplitskyi <okonopli@cisco.com>
>> ---
>>   .../images/core-image-minimal-initramfs.bb         |   2 +-
>>   meta/recipes-core/initrdscripts/files/init-nfs.sh  | 108
>> +++++++++++++++++++++
>>   .../initrdscripts/initramfs-nfs-boot_1.0.bb        |  14 +++
>>   3 files changed, 123 insertions(+), 1 deletion(-)
>>   create mode 100644 meta/recipes-core/initrdscripts/files/init-nfs.sh
>>   create mode 100644 meta/recipes-core/initrdscripts/initramfs-nfs-
>> boot_1.0.bb
>>
>> diff --git a/meta/recipes-core/images/core-image-minimal-initramfs.bb
>> b/meta/recipes-core/images/core-image-minimal-initramfs.bb
>> index c446e87..bf794bf 100644
>> --- a/meta/recipes-core/images/core-image-minimal-initramfs.bb
>> +++ b/meta/recipes-core/images/core-image-minimal-initramfs.bb
>> @@ -3,7 +3,7 @@ DESCRIPTION = "Small image capable of booting a device.
>> The kernel includes \
>>   the Minimal RAM-based Initial Root Filesystem (initramfs), which finds
>> the \
>>   first 'init' program more efficiently."
>>   
>> -PACKAGE_INSTALL = "initramfs-live-boot initramfs-live-install initramfs-
>> live-install-efi ${VIRTUAL-RUNTIME_base-utils} udev base-passwd
>> ${ROOTFS_BOOTSTRAP_INSTALL}"
>> +PACKAGE_INSTALL = "initramfs-live-boot initramfs-live-install initramfs-
>> live-install-efi ${VIRTUAL-RUNTIME_base-utils} udev base-passwd
>> ${ROOTFS_BOOTSTRAP_INSTALL} initramfs-nfs-boot"
>>   
>>   # Do not pollute the initrd image with rootfs features
>>   IMAGE_FEATURES = ""
>> diff --git a/meta/recipes-core/initrdscripts/files/init-nfs.sh
>> b/meta/recipes-core/initrdscripts/files/init-nfs.sh
>> new file mode 100644
>> index 0000000..31a55ec
>> --- /dev/null
>> +++ b/meta/recipes-core/initrdscripts/files/init-nfs.sh
>> @@ -0,0 +1,108 @@
>> +#!/bin/sh
>> +
>> +CONSOLE="/dev/console"
>> +PATH=/sbin:/bin:/usr/sbin:/usr/bin
>> +ROOT_MOUNT="/rootfs"
>> +
>> +fatal()
>> +{
>> +	echo $1 >$CONSOLE
>> +	echo >$CONSOLE
>> +	exec sh
>> +}
>> +
>> +net_up()
>> +{
>> +	[ "$(ifconfig $PARAM_IFNAME | awk '/inet addr/{print
>> substr($2,6)}')" = "$PARAM_IP" ] && return
>> +	#load all ethernet drivers if network interface is not configured
>> +	MODULES="$(find /lib/modules/*/kernel/drivers/net/ethernet -name
>> \*.ko | sed -e 's,^.*/,,' -e 's,\.ko$,,')"
>> +	[ -z "$MODULES" ] && fatal "Ethernet drivers list is emty.
>> Nothing to load."
>> +	modprobe -a $MODULES
>> +
>> +	ifconfig $PARAM_IFNAME $PARAM_IP netmask $PARAM_NETMASK ||
>> +		fatal "Failed to configure ethernet interface"
>> +	route add default gw $PARAM_GW ||
>> +		fatal "Failed to set default gateway"
>> +}
>> +
>> +
>> +#TODO: IPv6 is not supported yet
>> +mount_nfs()
>> +{
>> +	mkdir $ROOT_MOUNT
>> +	for i in $(seq 1 10)
>> +	do
>> +		mount -t nfs "$PARAM_NFSROOT_PATH" -o
>> nolock,"$PARAM_NFSROOT_OPTS" $ROOT_MOUNT && return
>> +		sleep 1
>> +	done
>> +	fatal "Could not mount rootfs via nfs"
>> +}
>> +
>> +
>> +early_setup()
>> +{
>> +	mkdir -p /proc
>> +	mkdir -p /sys
>> +	mount -t proc proc /proc
>> +	mount -t sysfs sysfs /sys
>> +	mount -t devtmpfs none /dev
>> +
>> +	mkdir -p /run
>> +	mkdir -p /var/run
>> +}
>> +
>> +
>> +#TODO: IPv6 is not supported yet
>> +read_args()
>> +{
>> +	[ -z "$CMDLINE" ] && CMDLINE=$(cat /proc/cmdline)
>> +	for arg in $CMDLINE; do
>> +		optarg=$(expr "x$arg" : 'x[^=]*=\(.*\)'$)
>> +		case $arg in
>> +		ip=*)
>> +			PARAM_IFNAME=$(echo "$optarg" | cut -d: -f6)
>> +			PARAM_IP_ALL=$(echo "$optarg" | grep -Eo '([0-
>> 9]{1,3}\.){3}[0-9]{1,3}')
>> +			PARAM_IP=$(echo "$PARAM_IP_ALL" | sed -n 1p)
>> +			PARAM_GW=$(echo "$PARAM_IP_ALL" | sed -n 2p)
>> +			PARAM_NETMASK=$(echo "$PARAM_IP_ALL" | sed -n 3p)
>> +			;;
>> +		nfsroot=*)
>> +			PARAM_NFSROOT_PATH=$(echo "$optarg" | cut -d,
>> -f1)
>> +			PARAM_NFSROOT_OPTS=$(echo "$optarg" | cut -d,
>> -f2-)
>> +			;;
>> +		debugshell)
>> +			DEBUGSHELL=1
>> +			;;
>> +		esac
>> +	done
>> +}
>> +
>> +boot_nfs()
>> +{
>> +	touch $ROOT_MOUNT/bin || fatal "Rootfs is not writeable"
>> +
>> +	mount -n --move /proc ${ROOT_MOUNT}/proc
>> +	mount -n --move /sys ${ROOT_MOUNT}/sys
>> +	mount -n --move /dev ${ROOT_MOUNT}/dev
>> +
>> +	cd $ROOT_MOUNT
>> +
>> +	# busybox switch_root supports -c option
>> +	exec switch_root -c /dev/console $ROOT_MOUNT /sbin/init $CMDLINE
>> ||
>> +		fatal "Couldn't switch_root, dropping to shell"
>> +}
>> +
>> +early_setup
>> +
>> +read_args
>> +
>> +if [ -n "$DEBUGSHELL" ]; then
>> +	exec sh
>> +fi
>> +
>> +net_up
>> +
>> +mount_nfs
>> +
>> +boot_nfs
>> +
>> diff --git a/meta/recipes-core/initrdscripts/initramfs-nfs-boot_1.0.bb
>> b/meta/recipes-core/initrdscripts/initramfs-nfs-boot_1.0.bb
>> new file mode 100644
>> index 0000000..ca4f191
>> --- /dev/null
>> +++ b/meta/recipes-core/initrdscripts/initramfs-nfs-boot_1.0.bb
>> @@ -0,0 +1,14 @@
>> +SUMMARY = "Live image init script"
>> +LICENSE = "MIT"
>> +LIC_FILES_CHKSUM =
>> "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
>> +RDEPENDS_${PN} = "${@['', d.getVar('INITRAMFS_LOAD_KERNEL_MODULES',
>> True)][d.getVar('INITRAMFS_LOAD_KERNEL_MODULES', True) is not None]}"
>> +SRC_URI = "file://init-nfs.sh"
>> +
>> +S = "${WORKDIR}"
>> +
>> +do_install() {
>> +        install -m 0755 ${WORKDIR}/init-nfs.sh ${D}/init-nfs.sh
>> +}
>> +
>> +FILES_${PN} += " /init-nfs.sh "
>> +
>> -- 
>> 2.7.4
>>


