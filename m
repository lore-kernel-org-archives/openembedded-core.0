Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.2804.1616819128669156031
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Mar 2021 21:25:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B505740C2A;
	Sat, 27 Mar 2021 04:25:27 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bGYU_QdeJPBH; Sat, 27 Mar 2021 04:25:27 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8119F40A28;
	Sat, 27 Mar 2021 04:25:24 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id D1CDC174568; Sat, 27 Mar 2021 00:25:23 -0400 (EDT)
Date: Sat, 27 Mar 2021 00:25:23 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Nishanth Menon <nm@ti.com>, openembedded-core@lists.openembedded.org,
	praneeth@ti.com
Subject: Re: [PATCH] make-mod-scripts: Provide the correct objcopy to kernel make
Message-ID: <20210327042523.GY18041@denix.org>
References: <20210326011304.25640-1-nm@ti.com>
MIME-Version: 1.0
In-Reply-To: <20210326011304.25640-1-nm@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi, Bruce,

Would you mind taking a look at this? Have you seen any issues building latest 
kernel 5.12-rc for aarch64 and seeing host objcopy being used instead of cross 
compile one? Please let us know. Thanks!

-- 
Denys


On Thu, Mar 25, 2021 at 08:13:04PM -0500, Nishanth Menon wrote:
> When cross-compiling with v5.12-rc3, prepare fails[1] build of vdso at
> the objcopy stage since it seems to be using the local host's objcopy
> rather than the cross-compile version we want it to use.
> 
> This can be trivially reproduced in a localbuild of the kernel
> following the build parameters provided in the process[2]
> 
> Lets fix this by passing OBJCOPY over to the kernel.
> 
> [1] https://pastebin.ubuntu.com/p/pNcQtb93wr/
> [2] https://pastebin.ubuntu.com/p/vZGqgh9Sq5/
> Signed-off-by: Nishanth Menon <nm@ti.com>
> ---
> 
> NOTE:
> 1. This is a different problem and is not resolved with
> https://lists.openembedded.org/g/openembedded-core/message/149943
> 
> 2. Though reproduced during a dunfell build, this should probably
> apply else where as well.
> 
> 3. I have'nt been able to cleanly bisect things, but my best guess was
> that this might be a consequence of kernel fixup exposing this.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=a5b8ca97fbf8300a5e21c393df25ce6f521e7939
> 
>  meta/classes/kernel-arch.bbclass                             | 3 +++
>  meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb | 2 +-
>  2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/kernel-arch.bbclass b/meta/classes/kernel-arch.bbclass
> index 07ec242e63bb..3d25fc7ac531 100644
> --- a/meta/classes/kernel-arch.bbclass
> +++ b/meta/classes/kernel-arch.bbclass
> @@ -60,9 +60,12 @@ TARGET_LD_KERNEL_ARCH ?= ""
>  HOST_LD_KERNEL_ARCH ?= "${TARGET_LD_KERNEL_ARCH}"
>  TARGET_AR_KERNEL_ARCH ?= ""
>  HOST_AR_KERNEL_ARCH ?= "${TARGET_AR_KERNEL_ARCH}"
> +TARGET_OBJCOPY_KERNEL_ARCH ?= ""
> +HOST_OBJCOPY_KERNEL_ARCH ?= "${TARGET_OBJCOPY_KERNEL_ARCH}"
>  
>  KERNEL_CC = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_KERNEL_ARCH} -fuse-ld=bfd ${DEBUG_PREFIX_MAP} -fdebug-prefix-map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH}"
>  KERNEL_LD = "${CCACHE}${HOST_PREFIX}ld.bfd ${HOST_LD_KERNEL_ARCH}"
>  KERNEL_AR = "${CCACHE}${HOST_PREFIX}ar ${HOST_AR_KERNEL_ARCH}"
> +KERNEL_OBJCOPY = "${CCACHE}${HOST_PREFIX}objcopy ${HOST_OBJCOPY_KERNEL_ARCH}"
>  TOOLCHAIN = "gcc"
>  
> diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> index 87b7d240f51a..2d73e8093c2e 100644
> --- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> +++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> @@ -25,7 +25,7 @@ EXTRA_OEMAKE = " HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="
>  do_configure() {
>  	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
>  	for t in prepare scripts_basic scripts; do
> -		oe_runmake CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" \
> +		oe_runmake CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" OBJCOPY="${KERNEL_OBJCOPY}"\
>  		-C ${STAGING_KERNEL_DIR} O=${STAGING_KERNEL_BUILDDIR} $t
>  	done
>  }
> -- 
> 2.31.0
> 
