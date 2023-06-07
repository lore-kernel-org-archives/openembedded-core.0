Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22A5FC7EE25
	for <webhook@archiver.kernel.org>; Wed,  7 Jun 2023 20:54:03 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.196.1686171233152185292
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jun 2023 13:53:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=etLXn0ZD;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: alexandre.belloni@bootlin.com)
X-GND-Sasl: alexandre.belloni@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686171230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9vsf6ASqXauTXZkun7+sCUe7qFzfNC88tyCXB32sm7M=;
	b=etLXn0ZDRUWIPRlt51RojB9/U8DqhInAaj2QlZ+/pXwN37CSueeLGRTKIhyllgKgX89tnU
	/sGPRCZwY7rl1j+AVjPwtDa13YlJ8gHKC+1ix6/e3H/ORGJ6N63kA/udR1VCCGKsDH+cFX
	IwxKIEzUPN4qUmtYhmxOoPrldj/5g6saErotlbeIFJTooqUdDv4xdacUYbclznMReqL8fW
	BXixjirJadyM2xHYNtB9QLUFlnZChojwVMtDz+0/apj0OXeioTFPy2RhahjeFf4FbQqR50
	GgaYhzk3Gl2lQiEwvzMnpea1pvNqm55rv2vnKVNzDoVy7kK8lxe3lpnD42hIOw==
X-GND-Sasl: alexandre.belloni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 55E43E0006;
	Wed,  7 Jun 2023 20:53:48 +0000 (UTC)
Date: Wed, 7 Jun 2023 22:53:47 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: "Yu, Mingli" <mingli.yu@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v4] qemu: Split the qemu package
Message-ID: <20230607205347759a5df5@mail.local>
References: <6e5c91bd39f886a6e72be22999e7e5902916b623.camel@linuxfoundation.org>
 <20230607090813.2808227-1-mingli.yu@eng.windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230607090813.2808227-1-mingli.yu@eng.windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jun 2023 20:54:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182479

Hello,

I believe this causes:

https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/7143/steps/12/logs/stdio

ERROR: lib32-qemu-8.0.0-r0 do_package_qa: QA Issue: /usr/bin/qemu-mips contained in package lib32-qemu-user-mips requires /bin/bash, but no providers found in RDEPENDS:lib32-qemu-user-mips? [file-rdeps]
ERROR: lib32-qemu-8.0.0-r0 do_package_qa: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/x86-pokymllib32-linux/lib32-qemu/8.0.0-r0/temp/log.do_package_qa.38833
NOTE: recipe lib32-qemu-8.0.0-r0: task do_package_qa: Failed
ERROR: Task (virtual:multilib:lib32:/home/pokybuild/yocto-worker/qemux86-world/build/meta/recipes-devtools/qemu/qemu_8.0.0.bb:do_package_qa) failed with exit code '1'
N

On 07/06/2023 17:08:13+0800, Yu, Mingli wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
> 
> Currently all files as below packaged into one package such as
> qemu-7.2.0-*.rpm. After the qemu package installed on the target,
> it will take up about 464M which includes not only the one matches
> the arch of the target but aslo all available built qemu targets
> which set by QEMU_TARGETS.
> 
>  # ls tmp-glibc/work/core2-64-wrs-linux/qemu/7.2.0-r0/image/usr/bin/
>  qemu-aarch64  qemu-img          qemu-mips64el   qemu-ppc64
>  qemu-sh4    qemu-system-loongarch64  qemu-system-ppc      qemu-system-x86_64
>  qemu-arm      qemu-io           qemu-mipsel     qemu-ppc64le
>  qemu-storage-daemon  qemu-system-mips         qemu-system-ppc64
>  qemu-x86_64 qemu-edid     qemu-loongarch64  qemu-mips.real
>  qemu-pr-helper  qemu-system-aarch64  qemu-system-mips64
>  qemu-system-riscv32 qemu-ga       qemu-mips         qemu-nbd
>  qemu-riscv32    qemu-system-arm      qemu-system-mips64el
>  qemu-system-riscv64 qemu-i386     qemu-mips64       qemu-ppc
>  qemu-riscv64    qemu-system-i386     qemu-system-mipsel qemu-system-sh4
> 
> Split the qemu package into qemu-7.2.0-*.rpm, qemu-system-*.rpm,
> qemu-user-*.rpm and etc. And let user can only choose the corresponding
> qemu arch package they want to install should ease the concerns who
> cares much about the size in embedded device as it decreases the qemu rpm
> (qemu-7.2.0*.rpm) size from about 65M to about 19M and the size of the
> extracted qemu RPM decreased from about 464M to about 248M.
> 
> For the users who want to install all arch packages, they can install
> qemu-system-all and qemu-user-all to meet their need.
> 
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  meta/recipes-devtools/qemu/qemu.inc | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
> index a87dee5c99..108dd0947a 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -230,6 +230,25 @@ INSANE_SKIP:${PN} = "arch"
>  
>  FILES:${PN} += "${datadir}/icons"
>  
> +# For user who want to install all arch packages
> +PACKAGES =+ "${PN}-system-all ${PN}-user-all"
> +
> +ALLOW_EMPTY:${PN}-system-all = "1"
> +ALLOW_EMPTY:${PN}-user-all = "1"
> +
> +python populate_packages:prepend() {
> +    archdir = d.expand('${bindir}/')
> +    syspackages = do_split_packages(d, archdir, r'^qemu-system-(.*)$', '${PN}-system-%s', 'QEMU full system emulation binaries(%s)' , prepend=True)
> +    if syspackages:
> +        d.setVar('RDEPENDS:' + d.getVar('PN') + '-system-all', ' '.join(syspackages))
> +
> +    userpackages = do_split_packages(d, archdir, r'^qemu-((?!system|edid|ga|img|io|nbd|pr-helper|storage-daemon).*)$', '${PN}-user-%s', 'QEMU full user emulation binaries(%s)' , prepend=True)
> +    if "qemu-user-mips" in ' '.join(userpackages):
> +        d.appendVar('RDEPENDS:qemu-user-mips', ' '+ 'bash')
> +    if userpackages:
> +        d.setVar('RDEPENDS:' + d.getVar('PN') + '-user-all', ' '.join(userpackages))
> +}
> +
>  # Put the guest agent in a separate package
>  PACKAGES =+ "${PN}-guest-agent"
>  SUMMARY:${PN}-guest-agent = "QEMU guest agent"
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#182464): https://lists.openembedded.org/g/openembedded-core/message/182464
> Mute This Topic: https://lists.openembedded.org/mt/99380658/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

