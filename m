Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5301EB64DA
	for <webhook@archiver.kernel.org>; Sun, 16 Jul 2023 11:47:54 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.14944.1689508065193142546
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Jul 2023 04:47:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=QPujSSv2;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5C02040004;
	Sun, 16 Jul 2023 11:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689508063;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ir6b6ITFMeYvmRBmkLNBRbz4lM44OYh5Du1sIK8d/+o=;
	b=QPujSSv28g3ZT7a/Q8k6HIZ9/gFbbrE755u3aWzoGerh2jQXOYi1+1+b6ywrCRm7sVSviz
	V+Dcik1T8S3wj+UaaYOHXYM7OGjed28qezpr1qmOyDAVSxbSwE2iMMP0bTlFEhY3QZ9U2i
	tnbIIbCSXtBD/rNxY7dbidlsWYybho6+MVqDk4LY4BOBTx3KhbC9x/RCTKsfTuM68on7Cr
	ZiaRuPZh91J+zpZv41JxblKkqtWQL8qGXJQXUWxnclp/T5u9qqr/XMYroM6Ns4vu9SyGEO
	zex8Mzqy9Avd8yU3HjHRw4OLXOVMrl1tyxlcpIBglC+B043OsnkkCO5JvoDRuA==
Date: Sun, 16 Jul 2023 13:47:41 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: "Yu, Mingli" <mingli.yu@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org, Ross.Burton@arm.com
Subject: Re: [OE-core] [PATCH v3] qemu: Add qemu-common package
Message-ID: <2023071611474165f97b23@mail.local>
References: <E57733DA-39D3-494F-A91D-9AA8306DBDAB@arm.com>
 <20230710103218.3834001-1-mingli.yu@eng.windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230710103218.3834001-1-mingli.yu@eng.windriver.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Jul 2023 11:47:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184413

Hello,

This causes the following meta-mingw error on the AB:

https://autobuilder.yoctoproject.org/typhoon/#/builders/89/builds/7501/steps/12/logs/stdio

This is due to the added native-sdk dependency.

On 10/07/2023 18:32:18+0800, Yu, Mingli wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
> 
> We split the qemu package [1] to add support to make user can install
> one qemu arch emulation rpm to ease the concerns who care much about
> the rpm size in embedded device.
> 
> But for the user who only install the qemu-*.rpm can't do anything
> except they install the qemu emulation rpm like qemu-system-x86-64-*.rpm
> explicitly.
> 
> So add qemu-common package to package all thing into qemu-common when
> not split the package, and package only the basic into qemu-common and
> other arch related to each qemu arch emulation rpm when split the package
> to fix the backward compatibility.
> 
> qenu-*.rpm which is meta package rdepends on qemu-common and the available
> qemu arch emulation rpm like qemu-system-x86-64-*.rpm and etc.
> 
> [1] https://git.openembedded.org/openembedded-core/commit/?id=893846ead7ee54d53e9076150cd655e0c8bca5db
> 
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  meta/recipes-devtools/qemu/qemu.inc      | 23 ++++++++++++-----------
>  meta/recipes-devtools/qemu/qemu_8.0.0.bb |  3 ++-
>  2 files changed, 14 insertions(+), 12 deletions(-)
> 
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
> index a5bdeef66d..94624163d0 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -226,15 +226,18 @@ PACKAGECONFIG[brlapi] = "--enable-brlapi,--disable-brlapi"
>  PACKAGECONFIG[jack] = "--enable-jack,--disable-jack,jack,"
>  PACKAGECONFIG[debuginfo] = "--enable-libdw,--disable-libdw,elfutils"
>  
> -INSANE_SKIP:${PN} = "arch"
> +INSANE_SKIP:${PN}-common = "arch"
>  
>  FILES:${PN} += "${datadir}/icons"
>  
>  # For user who want to install all arch packages
> -PACKAGES =+ "${PN}-system-all ${PN}-user-all"
> +PACKAGES =+ "${PN}-common"
> +RDEPENDS:${PN} += "${PN}-common"
>  
> -ALLOW_EMPTY:${PN}-system-all = "1"
> -ALLOW_EMPTY:${PN}-user-all = "1"
> +ALLOW_EMPTY:${PN} = "1"
> +FILES:${PN} = ""
> +
> +FILES:${PN}-common = "${bindir}/* ${includedir}/* ${libexecdir}/* ${datadir}/* ${localstatedir}"
>  
>  PACKAGES_DYNAMIC += "^${PN}-user-.*  ^${PN}-system-.*"
>  
> @@ -242,15 +245,13 @@ PACKAGESPLITFUNCS =+ "split_qemu_packages"
>  
>  python split_qemu_packages () {
>      archdir = d.expand('${bindir}/')
> -    syspackages = do_split_packages(d, archdir, r'^qemu-system-(.*)$', '${PN}-system-%s', 'QEMU full system emulation binaries(%s)' , prepend=True)
> -    if syspackages:
> -        d.setVar('RDEPENDS:' + d.getVar('PN') + '-system-all', ' '.join(syspackages))
> +    subpackages = do_split_packages(d, archdir, r'^qemu-system-(.*)$', '${PN}-system-%s', 'QEMU full system emulation binaries(%s)' , prepend=True, extra_depends='${PN}-common')
>  
> -    userpackages = do_split_packages(d, archdir, r'^qemu-((?!system|edid|ga|img|io|nbd|pr-helper|storage-daemon).*)$', '${PN}-user-%s', 'QEMU full user emulation binaries(%s)' , prepend=True)
> -    if userpackages:
> -        d.setVar('RDEPENDS:' + d.getVar('PN') + '-user-all', ' '.join(userpackages))
> +    subpackages += do_split_packages(d, archdir, r'^qemu-((?!system|edid|ga|img|io|nbd|pr-helper|storage-daemon).*)$', '${PN}-user-%s', 'QEMU full user emulation binaries(%s)' , prepend=True, extra_depends='${PN}-common')
> +    if subpackages:
> +        d.appendVar('RDEPENDS:' + d.getVar('PN'), ' ' + ' '.join(subpackages))
>      mipspackage = d.getVar('PN') + "-user-mips"
> -    if mipspackage in ' '.join(userpackages):
> +    if mipspackage in ' '.join(subpackages):
>          d.appendVar('RDEPENDS:' + mipspackage, ' ' + d.getVar("MLPREFIX") + 'bash')
>  }
>  
> diff --git a/meta/recipes-devtools/qemu/qemu_8.0.0.bb b/meta/recipes-devtools/qemu/qemu_8.0.0.bb
> index 42e133967e..412c2bc7f0 100644
> --- a/meta/recipes-devtools/qemu/qemu_8.0.0.bb
> +++ b/meta/recipes-devtools/qemu/qemu_8.0.0.bb
> @@ -8,7 +8,8 @@ DEPENDS:append:libc-musl = " libucontext"
>  
>  CFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', '-DEGL_NO_X11=1', d)}"
>  
> -RDEPENDS:${PN}:class-target += "bash"
> +RDEPENDS:${PN}-common:class-target += "bash"
> +RDEPENDS:${PN}-common:class-nativesdk += "bash"
>  
>  EXTRA_OECONF:append:class-target = " --target-list=${@get_qemu_target_list(d)}"
>  EXTRA_OECONF:append:class-target:mipsarcho32 = "${@bb.utils.contains('BBEXTENDCURR', 'multilib', ' --disable-capstone', '', d)}"
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184068): https://lists.openembedded.org/g/openembedded-core/message/184068
> Mute This Topic: https://lists.openembedded.org/mt/100054994/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

