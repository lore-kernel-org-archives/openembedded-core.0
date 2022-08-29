Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B178ECAAD4
	for <webhook@archiver.kernel.org>; Mon, 29 Aug 2022 09:59:25 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web12.68721.1661767160075219120
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Aug 2022 02:59:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=efWltXaP;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230,
 mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 9A08F24000A;
	Mon, 29 Aug 2022 09:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1661767158;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Nn4xZ2SZTE9U6ZPtJkMLHWsrrStJARq2+nGicuywkgE=;
	b=efWltXaP41Vk9GJA0FjcOqjJWXlGQDebR1VJdSeqes6ycoFodPmUXMegZ9PY36XPcLRiju
	/+c2krEae58kH0s3s4CJT9Fd51Krl47s72GIBjiMMxl8CEUyOiUOnCPQrlBO3W+8X2CAMW
	AN2j6+KGJ6ib303D8mU88EmG1q8jIMOdojwGiAEJu1i8qX3V0KK1gfQ4ykqhifIBJ9+fgk
	HYoJEL2lQuDY7GXAo8P73uteeHZT0KBfCac5q7zXWYzmsnH/DFYWnKLo4Ed/yK3BOCAhSx
	zGmt7HBC76GbNO+u2Z9aueF+cd4SffBl/MF1GaDZSm6gi6Gl2XqMIkhD0AfE+w==
Date: Mon, 29 Aug 2022 11:59:17 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Paulo Neves <ptsneves@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 1/2] ntirpc: Add ntirpc recipe
Message-ID: <YwyN9XRs+CcHEF02@mail.local>
References: <20220827174633.2772165-1-ptsneves@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220827174633.2772165-1-ptsneves@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Aug 2022 09:59:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170009

Hello,

This fails on musl:

https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/5771/steps/11/logs/stdio

On 27/08/2022 19:46:32+0200, Paulo Neves wrote:
> ntirpc is an actively maintained rpc implementation. We cannot completely
> remove libtirpc due to arising circular dependencies. libtirpc and ntirpc
> are not mutually exclusive.
> 
> Signed-off-by: Paulo Neves <ptsneves@gmail.com>
> ---
>  meta/recipes-extended/ntirpc/ntirpc_4.0.bb    | 30 +++++++++++++++++++
>  meta/recipes-extended/quota/quota_4.06.bb     |  2 +-
>  .../recipes-extended/rpcbind/rpcbind_1.2.6.bb |  2 +-
>  .../watchdog/watchdog_5.16.bb                 |  2 +-
>  .../xorg-xserver/xserver-xorg.inc             |  2 +-
>  .../recipes-support/liburcu/liburcu_0.13.1.bb |  1 +
>  6 files changed, 35 insertions(+), 4 deletions(-)
>  create mode 100644 meta/recipes-extended/ntirpc/ntirpc_4.0.bb
> 
> diff --git a/meta/recipes-extended/ntirpc/ntirpc_4.0.bb b/meta/recipes-extended/ntirpc/ntirpc_4.0.bb
> new file mode 100644
> index 0000000000..edebcb8ca9
> --- /dev/null
> +++ b/meta/recipes-extended/ntirpc/ntirpc_4.0.bb
> @@ -0,0 +1,30 @@
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=f835cce8852481e4b2bbbdd23b5e47f3"
> +
> +SRC_URI = "https://download.nfs-ganesha.org/4/${PV}/ntirpc-${PV}.tar.gz"
> +SRC_URI[md5sum] = "17b0baada54936dcde80eba27bb6d88d"
> +SRC_URI[sha256sum] = "6a7921cd48d02077b394a02be42bf4f9b4678d4ebfd86a7ae4385bbcdce55462"
> +
> +DEPENDS = "liburcu libnsl2"
> +
> +inherit cmake pkgconfig
> +
> +PACKAGECONFIG[gss] = "-DUSE_GSS=true,-DUSE_GSS=false,krb5"
> +PACKAGECONFIG[rdma] = "-DUSE_RPC_RDMA=true,-DUSE_RPC_RDMA=false,rdma-core"
> +PACKAGECONFIG[winbind] = "-D_MSPAC_SUPPORT=true,-D_MSPAC_SUPPORT=false,samba"
> +PACKAGECONFIG[profile] = "-DUSE_PROFILE=true,-DUSE_PROFILE=false,gperftools"
> +PACKAGECONFIG[lttng] = "-DUSE_LTTNG=true,-DUSE_LTTNG=false,lttng-ust lttng-tools"
> +
> +# Sort out the brain-dead cmake file
> +# (https://github.com/nfs-ganesha/ntirpc/issues/150)
> +do_install:append() {
> +    if [ "${prefix}/lib64" != "${libdir}" -a -d ${D}${prefix}/lib64 ]; then
> +        mv ${D}${prefix}/lib64 ${D}${libdir}
> +    fi
> +}
> +
> +BBCLASSEXTEND = "native nativesdk"
> +EXTRA_OECMAKE:armv5 += '-DSYSTEM_LIBRARIES="-latomic"'
> +EXTRA_OECMAKE:riscv32 += '-DSYSTEM_LIBRARIES="-latomic"'
> +EXTRA_OECMAKE:riscv64 += '-DSYSTEM_LIBRARIES="-latomic"'
> +EXTRA_OECMAKE:powerpc += '-DSYSTEM_LIBRARIES="-latomic"'
> diff --git a/meta/recipes-extended/quota/quota_4.06.bb b/meta/recipes-extended/quota/quota_4.06.bb
> index 0535d14c20..304477d72b 100644
> --- a/meta/recipes-extended/quota/quota_4.06.bb
> +++ b/meta/recipes-extended/quota/quota_4.06.bb
> @@ -30,6 +30,6 @@ PACKAGECONFIG ??= "tcp-wrappers rpc bsd"
>  PACKAGECONFIG:libc-musl = "tcp-wrappers rpc"
>  
>  PACKAGECONFIG[tcp-wrappers] = "--enable-libwrap,--disable-libwrap,tcp-wrappers"
> -PACKAGECONFIG[rpc] = "--enable-rpc,--disable-rpc,libtirpc"
> +PACKAGECONFIG[rpc] = "--enable-rpc,--disable-rpc,ntirpc"
>  PACKAGECONFIG[bsd] = "--enable-bsd_behaviour=yes,--enable-bsd_behaviour=no,"
>  PACKAGECONFIG[ldapmail] = "--enable-ldapmail,--disable-ldapmail,openldap"
> diff --git a/meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb b/meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb
> index dd89726afc..e30a23909c 100644
> --- a/meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb
> +++ b/meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb
> @@ -4,7 +4,7 @@ DESCRIPTION = "The rpcbind utility is a server that converts RPC \
>  SECTION = "console/network"
>  HOMEPAGE = "http://sourceforge.net/projects/rpcbind/"
>  BUGTRACKER = "http://sourceforge.net/tracker/?group_id=201237&atid=976751"
> -DEPENDS = "libtirpc quota"
> +DEPENDS = "ntirpc quota"
>  
>  LICENSE = "BSD-3-Clause"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=b46486e4c4a416602693a711bb5bfa39 \
> diff --git a/meta/recipes-extended/watchdog/watchdog_5.16.bb b/meta/recipes-extended/watchdog/watchdog_5.16.bb
> index 26fcc10487..5f5fd4dc87 100644
> --- a/meta/recipes-extended/watchdog/watchdog_5.16.bb
> +++ b/meta/recipes-extended/watchdog/watchdog_5.16.bb
> @@ -28,7 +28,7 @@ UPSTREAM_CHECK_REGEX = "/watchdog/(?P<pver>(\d+[\.\-_]*)+)/"
>  
>  inherit autotools update-rc.d systemd pkgconfig
>  
> -DEPENDS += "libtirpc"
> +DEPENDS += "ntirpc"
>  CFLAGS += "-I${STAGING_INCDIR}/tirpc"
>  LDFLAGS += "-ltirpc"
>  
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> index 057a1ba6ad..2085f742d6 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> @@ -36,7 +36,7 @@ inherit meson pkgconfig
>  inherit features_check
>  REQUIRED_DISTRO_FEATURES = "x11"
>  
> -LIB_DEPS = "pixman libxfont2 xtrans libxau libxext libxdmcp libdrm libxkbfile libpciaccess libxcvt libtirpc"
> +LIB_DEPS = "pixman libxfont2 xtrans libxau libxext libxdmcp libdrm libxkbfile libpciaccess libxcvt ntirpc"
>  DEPENDS = "xorgproto ${LIB_DEPS} font-util"
>  
>  # Split out some modules and extensions from the main package
> diff --git a/meta/recipes-support/liburcu/liburcu_0.13.1.bb b/meta/recipes-support/liburcu/liburcu_0.13.1.bb
> index 66763349d2..d7e831e803 100644
> --- a/meta/recipes-support/liburcu/liburcu_0.13.1.bb
> +++ b/meta/recipes-support/liburcu/liburcu_0.13.1.bb
> @@ -22,3 +22,4 @@ CPPFLAGS:append:riscv64  = " -pthread -D_REENTRANT"
>  do_install:append() {
>      oe_multilib_header urcu/config.h
>  }
> +BBCLASSEXTEND = "native nativesdk"
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#169934): https://lists.openembedded.org/g/openembedded-core/message/169934
> Mute This Topic: https://lists.openembedded.org/mt/93293557/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

