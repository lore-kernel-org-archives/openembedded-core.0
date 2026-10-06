Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB19DCA5FED
	for <webhook@archiver.kernel.org>; Tue,  6 Oct 2026 18:03:50 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1490.1791309827304157583
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2026 11:03:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7942E40C85;
	Tue,  6 Oct 2026 18:03:46 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ieZiIUtDwUPY; Tue,  6 Oct 2026 18:03:46 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2E21B407E5;
	Tue,  6 Oct 2026 18:03:43 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id BDC0017EEEC; Tue,  6 Oct 2026 14:03:42 -0400 (EDT)
Date: Tue, 6 Oct 2026 14:03:42 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: joerg.vehlow@emlix.com,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Ryan Eatmon <reatmon@ti.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] tclibc-baremetal.inc: fix gcc-cross
 EXTRA_OECONF
Message-ID: <20261006180342.GM4190@denix.org>
References: <20260929072452.2187140-1-joerg.vehlow@emlix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929072452.2187140-1-joerg.vehlow@emlix.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 18:03:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247316

On Tue, Sep 29, 2026 at 09:24:52AM +0200, Joerg Vehlow via lists.openembedded.org wrote:
> Using EXTRA_OECONF:pn-gcc-cross-${TARGET_ARCH}:append created a new override
> for EXTRA_OECONF, which led to almost all EXTRA_OECONF switches to be ignored.
> Furthermore, setting --without-headers here is not required,
> because it is set in gcc-cross.inc.

I fully realize this change has good intentions, but it actually breaks 
baremetal. We've been trying to debug this for the past couple of days.

While we run our baremetal in a multiconfig, you don't need that to reproduce 
the breakage only with OE-Core by adding these 2 lines to local.conf:

TCLIBC = "baremetal"
MACHINE = "qemuarm"

$ bitbake libgcc

| checking whether we are using the GNU C compiler... yes
| checking whether arm-oe-eabi-gcc  -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 -no-pie -fno-PIE --sysroot=/OE/core-master/build/tmp/work/cortexa15t2hf-neon-oe-eabi/libgcc/16.2.0/recipe-sysroot accepts -g... yes
| checking for arm-oe-eabi-gcc  -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 -no-pie -fno-PIE --sysroot=/OE/core-master/build/tmp/work/cortexa15t2hf-neon-oe-eabi/libgcc/16.2.0/recipe-sysroot option to accept ISO C89... unsupported
| checking how to run the C preprocessor... arm-oe-eabi-gcc -E --sysroot=/OE/core-master/build/tmp/work/cortexa15t2hf-neon-oe-eabi/libgcc/16.2.0/recipe-sysroot  -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 -no-pie -fno-PIE
| configure: error: in `/OE/core-master/build/tmp/work/cortexa15t2hf-neon-oe-eabi/libgcc/16.2.0/gcc-16.2.0/build.arm-oe-eabi.arm-oe-eabi/libgcc':
| configure: error: C preprocessor "arm-oe-eabi-gcc -E --sysroot=/OE/core-master/build/tmp/work/cortexa15t2hf-neon-oe-eabi/libgcc/16.2.0/recipe-sysroot  -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 -no-pie -fno-PIE" fails sanity check
| See `config.log' for more details

Reverting this single commit restores the working behavior.

I don't see anything suspicious in the config.log yet, but I'll keep digging.

Here's EXTRA_OECONF for gcc-cross-arm before and after the change:

EXTRA_OECONF=" \
--without-headers \
--disable-static \
--disable-nls \
--enable-initfini-array \
--without-headers \
"

EXTRA_OECONF=" \
--enable-clocale=generic \
--with-gnu-ld \
--enable-shared \
--enable-languages=c,c++ \
--disable-multilib \
--enable-default-pie \
--enable-c99 \
--enable-long-long \
--enable-symvers=gnu \
--enable-libstdcxx-pch \
--program-prefix=arm-oe-eabi- \
--without-local-prefix \
--disable-install-libiberty \
--disable-libssp \
--enable-libitm \
--enable-lto \
--disable-bootstrap \
--with-system-zlib \
--with-linker-hash-style=sysv \
--enable-linker-build-id \
--with-ppl=no \
--with-cloog=no \
--enable-checking=release \
--enable-cheaders=c_global \
--without-isl \
--with-gxx-include-dir=/not/exist/usr/include/c++/16.2.0 \
--with-gxx-libcxx-include-dir=/not/exist/usr/include/c++/v1 \
--with-sysroot=/not/exist \
--with-build-sysroot=/OE/core-master/build/tmp/work/x86_64-linux/gcc-cross-arm/16.2.0/recipe-sysroot \
--enable-poison-system-directories=error \
--with-system-zlib \
--disable-static \
--disable-nls \
--enable-initfini-array \
--without-headers \
"



> Signed-off-by: Joerg Vehlow <joerg.vehlow@emlix.com>
> ---
>  meta/conf/distro/include/tclibc-baremetal.inc | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/meta/conf/distro/include/tclibc-baremetal.inc b/meta/conf/distro/include/tclibc-baremetal.inc
> index abea5a7162..6043cb6654 100644
> --- a/meta/conf/distro/include/tclibc-baremetal.inc
> +++ b/meta/conf/distro/include/tclibc-baremetal.inc
> @@ -18,7 +18,6 @@ USE_NLS ?= "no"
>  IMAGE_LINGUAS = ""
>  LIBC_DEPENDENCIES = ""
>  
> -EXTRA_OECONF:pn-gcc-cross-${TARGET_ARCH}:append = " --without-headers"
>  DEPENDS:remove:pn-meta-toolchain = "virtual/libc virtual/compilerlibs"
>  
>  # certain compiler libs cannot be used without libc, avoid the dependence on compilerlibs

