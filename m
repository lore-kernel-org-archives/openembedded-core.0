Return-Path: <okonopli@cisco.com>
Received: from aer-iport-4.cisco.com (aer-iport-4.cisco.com [173.38.203.54])
	by mail.openembedded.org (Postfix) with ESMTP id 44B7D77040
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2018 15:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=4153; q=dns/txt; s=iport;
	t=1529077352; x=1530286952;
	h=subject:to:references:from:message-id:date:mime-version:
	in-reply-to:content-transfer-encoding;
	bh=PRXMDQlWJyy82PJYzgigqOR+/0lPuWsDnX4xy8rhIhc=;
	b=eh0ZcmALi0hJxpDhYVhSk/eifZKznap3jpYE/Sxsg7Q+6bwO8W1bioA7
	GA/GGtFqwMT7eT8aQ3j/OjtS4hwt8DeQLxFG1p9TE5ekRKd4PreDh/Ccy
	1c30IOYJeIVzdRCR9Y5E+TjruRrBIamiqUcbhW8trE+CBq5AeYj1Q8FlL o=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0CYAQAP3iNb/xbLJq1bGQEBAQEBAQE?=
	=?us-ascii?q?BAQEBAQcBAQEBAYQqbRIog3mIY41JCCGWZwsjhEkCgnM3FQECAQEBAQEBAm0?=
	=?us-ascii?q?cDIUpAQUjFVELGAICJgICVwYBDAYCAQGDHgKBcg0PqU2CHIRbg2yBaBR3iRU?=
	=?us-ascii?q?/gTMMglyEX4MXglUCjRuLcwmFeYkCBoE/hACCRYU0h26CH4cNAgQLAhMBgVc?=
	=?us-ascii?q?igVJwFYJ+CYsIhUE8MJBZAQE?=
X-IronPort-AV: E=Sophos;i="5.51,227,1526342400"; 
   d="scan'208";a="4513034"
Received: from aer-iport-nat.cisco.com (HELO aer-core-2.cisco.com)
	([173.38.203.22])
	by aer-iport-4.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Jun 2018 15:42:30 +0000
Received: from [10.61.212.71] ([10.61.212.71]) (authenticated bits=0)
	by aer-core-2.cisco.com (8.14.5/8.14.5) with ESMTP id w5FFgFAN028701
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO);
	Fri, 15 Jun 2018 15:42:29 GMT
To: openembedded-core@lists.openembedded.org, xe-linux-external@cisco.com,
	=?UTF-8?Q?Andr=c3=a9_Draszik?= <git@andred.net>
References: <1527256608-28290-1-git-send-email-okonopli@cisco.com>
From: Oleksii Konoplitskyi <okonopli@cisco.com>
Message-ID: <fcec90e3-d792-856d-5549-272d5102aeac@cisco.com>
Date: Fri, 15 Jun 2018 18:42:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <1527256608-28290-1-git-send-email-okonopli@cisco.com>
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Authenticated-User: okonopli
Subject: Re: [PATCH] initramfs-framework: add nfsrootfs module
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
X-List-Received-Date: Fri, 15 Jun 2018 15:42:30 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Andre,


Could you, please, check if all the features that we discussed in 
https://patchwork.openembedded.org/patch/149212/ are implemented in this 
patch?


Best regards,

Oleksii


On 25.05.18 16:56, Oleksii Konoplitskyi wrote:
> nfsrootfs module mounts rootfs via nfs parsing "nfsroot" and "ip" cmdline options.
>
> Signed-off-by: Oleksii Konoplitskyi <okonopli@cisco.com>
> ---
>   .../initrdscripts/initramfs-framework/nfsrootfs    | 48 ++++++++++++++++++++++
>   .../initrdscripts/initramfs-framework_1.0.bb       |  7 ++++
>   2 files changed, 55 insertions(+)
>   create mode 100644 meta/recipes-core/initrdscripts/initramfs-framework/nfsrootfs
>
> diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/nfsrootfs b/meta/recipes-core/initrdscripts/initramfs-framework/nfsrootfs
> new file mode 100644
> index 0000000..e67ee4c
> --- /dev/null
> +++ b/meta/recipes-core/initrdscripts/initramfs-framework/nfsrootfs
> @@ -0,0 +1,48 @@
> +#!/bin/sh
> +
> +nfsrootfs_enabled() {
> +	if [ ${bootparam_root} != "/dev/nfs" ] || [ -z ${bootparam_nfsroot} ]; then
> +		return 1
> +	fi
> +	return 0
> +}
> +
> +nfsrootfs_run() {
> +	local nfs_opts
> +	local location
> +	local flags
> +	local server_ip
> +
> +	nfs_opts=""
> +	if [ "${bootparam_nfsroot#*,}" != "${bootparam_nfsroot}" ]; then
> +		nfs_opts="-o ${bootparam_nfsroot#*,}"
> +	fi
> +
> +	location="${bootparam_nfsroot%%,*}"
> +	if [ "${location#*:}" = "${location}" ]; then
> +		# server-ip not given. Get server ip from ip option
> +		server_ip=""
> +		if [ "${bootparam_ip#*:}" != "${bootparam_ip}" ]; then
> +			server_ip=$(echo "$bootparam_ip" | cut -d: -f2)
> +		fi
> +
> +		if [ -z "$server_ip" ]; then
> +			fatal "Server IP is not set. Update ip or nfsroot options."
> +		fi
> +		location=${server_ip}:${location}
> +	fi
> +
> +	flags="-o nolock"
> +	if [ -n "$bootparam_ro" ] && ! echo "$bootparam_rootflags" | grep -w -q "ro"; then
> +		if [  -n "$bootparam_rootflags" ]; then
> +			bootparam_rootflags="$bootparam_rootflags,"
> +		fi
> +		bootparam_rootflags="${bootparam_rootflags}ro"
> +	fi
> +	if [ -n "$bootparam_rootflags" ]; then
> +		flags="$flags -o $bootparam_rootflags"
> +	fi
> +
> +	mount -t nfs ${flags} ${nfs_opts} ${location} ${ROOTFS_DIR}
> +}
> +
> diff --git a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
> index 75d965f..6337b99 100644
> --- a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
> +++ b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
> @@ -9,6 +9,7 @@ inherit allarch
>   
>   SRC_URI = "file://init \
>              file://exec \
> +           file://nfsrootfs \
>              file://rootfs \
>              file://finish \
>              file://mdev \
> @@ -24,6 +25,7 @@ do_install() {
>   
>       # base
>       install -m 0755 ${WORKDIR}/init ${D}/init
> +    install -m 0755 ${WORKDIR}/nfsrootfs ${D}/init.d/85-nfsrootfs
>       install -m 0755 ${WORKDIR}/rootfs ${D}/init.d/90-rootfs
>       install -m 0755 ${WORKDIR}/finish ${D}/init.d/99-finish
>   
> @@ -53,6 +55,7 @@ PACKAGES = "${PN}-base \
>               initramfs-module-mdev \
>               initramfs-module-udev \
>               initramfs-module-e2fs \
> +            initramfs-module-nfsrootfs \
>               initramfs-module-rootfs \
>               initramfs-module-debug \
>              "
> @@ -83,6 +86,10 @@ SUMMARY_initramfs-module-e2fs = "initramfs support for ext4/ext3/ext2 filesystem
>   RDEPENDS_initramfs-module-e2fs = "${PN}-base"
>   FILES_initramfs-module-e2fs = "/init.d/10-e2fs"
>   
> +SUMMARY_initramfs-module-nfsrootfs = "initramfs support for locating and mounting the root partition via nfs"
> +RDEPENDS_initramfs-module-nfsrootfs = "${PN}-base"
> +FILES_initramfs-module-nfsrootfs = "/init.d/85-nfsrootfs"
> +
>   SUMMARY_initramfs-module-rootfs = "initramfs support for locating and mounting the root partition"
>   RDEPENDS_initramfs-module-rootfs = "${PN}-base"
>   FILES_initramfs-module-rootfs = "/init.d/90-rootfs"


