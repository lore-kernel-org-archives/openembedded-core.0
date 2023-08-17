Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63964C3DA65
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 17:42:37 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.278.1692294155690151476
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Aug 2023 10:42:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=iRdMC852;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2B123E0002;
	Thu, 17 Aug 2023 17:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692294153;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5jl/6MHXAhYwbOJDlgrAEgrUjKTzP/C3QP700Ykx2WU=;
	b=iRdMC852GTwrXZ84LE/SSqzEhFggfvmgamluXIYRGD9gYZ43odf97vgeVyDXP2xIsNq0Az
	HfYupnVQ3TdETFvtdJj1JuH7Hm5TmMOfkZX0raNGB0/9IO6amVIGoAx1ia/C2oUSwdCnpG
	szcykErdAhG8Uxhi4XutCwMqVI68XYGInIgj/TRWgJpKdo6+6cq5Aa7++o3tar2Jkh168m
	eDvoT+pgYnUq8mknXr3r1zQiM2Gv2xLe4XOsUinagKStNUdDfDVdiCXzwXeXxmbxwXrjPA
	5q+CyQ/r9eE8oxyi5uckjSyDvf4AfVY8xQj/kZmJY9iADPAfvCA0V9J9euMu/g==
Date: Thu, 17 Aug 2023 19:42:32 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: alexandru.t.moise@gmail.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] riscv: Add asm-offsets.s to target for
 on-target module compilation
Message-ID: <202308171742325738f7f9@mail.local>
References: <20230811223240.195105-1-alexandru.t.moise@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230811223240.195105-1-alexandru.t.moise@gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 17:42:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186331

Hello,

This causes the following warning:

WARNING: kernel-devsrc-1.0-r0 do_package_qa: QA Issue: File /lib/modules/6.4.9-yocto-standard/build/arch/arm64/kernel/asm-offsets.s in package kernel-devsrc contains reference to TMPDIR [buildpaths]

https://autobuilder.yoctoproject.org/typhoon/#/builders/42/builds/7602/steps/13/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/131/builds/2993/steps/13/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/97/builds/6982/steps/16/logs/stdio

On 12/08/2023 00:32:40+0200, alexandru.t.moise@gmail.com wrote:
> From: Alexandru Moise <alexandru.t.moise@gmail.com>
> 
> I wanted to build kernel modules on my riscv target,
> 
> cd /usr/src/kernel/
> 
> make scripts prepare
> <...>
>   CC      scripts/mod/devicetable-offsets.s
>   UPD     scripts/mod/devicetable-offsets.h
>   HOSTCC  scripts/mod/file2alias.o
>   HOSTCC  scripts/mod/sumversion.o
>   HOSTLD  scripts/mod/modpost
>   CC      kernel/bounds.s
> /bin/sh: line 1: arch/riscv/kernel/asm-offsets.s: No such file or directory
> make[1]: *** [Kbuild:37: include/generated/asm-offsets.h] Error 1
> make: *** [Makefile:1219: prepare0] Error 2
> 
> The patch just adds the asm-offsets.s file for riscv targets.
> 
> With this the prepare target succeeds:
> 
> make scripts prepare
> <...>
>   CC      kernel/bounds.s
>   CALL    scripts/checksyscalls.sh
>   CALL    scripts/atomic/check-atomics.sh
>   LDS     arch/riscv/kernel/vdso/vdso.lds
>   AS      arch/riscv/kernel/vdso/rt_sigreturn.o
>   CC      arch/riscv/kernel/vdso/vgettimeofday.o
>   AS      arch/riscv/kernel/vdso/getcpu.o
>   AS      arch/riscv/kernel/vdso/flush_icache.o
>   AS      arch/riscv/kernel/vdso/note.o
>   VDSOLD  arch/riscv/kernel/vdso/vdso.so.dbg
>   VDSOSYM include/generated/vdso-offsets.h
> root@visionfive2:/usr/src/kernel
> 
> Signed-off-by: Alexandru Moise <alexandru.t.moise@gmail.com>
> ---
>  meta/recipes-kernel/linux/kernel-devsrc.bb | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
> index 6764598d48..ec14ccf6f2 100644
> --- a/meta/recipes-kernel/linux/kernel-devsrc.bb
> +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
> @@ -115,6 +115,9 @@ do_install() {
>              if [ -e arch/${ARCH}/kernel/vdso/vdso.lds ]; then
>  	        cp -a --parents arch/${ARCH}/kernel/vdso/vdso.lds $kerneldir/build/
>              fi
> +            if [ -e arch/${ARCH}/kernel/asm-offsets.s ]; then
> +	        cp -a --parents arch/${ARCH}/kernel/asm-offsets.s $kerneldir/build/
> +            fi
>  	fi
>  	if [ "${ARCH}" = "powerpc" ]; then
>  	    cp -a --parents arch/powerpc/kernel/vdso32/vdso32.lds $kerneldir/build 2>/dev/null || :
> -- 
> 2.41.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#185852): https://lists.openembedded.org/g/openembedded-core/message/185852
> Mute This Topic: https://lists.openembedded.org/mt/100693249/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

