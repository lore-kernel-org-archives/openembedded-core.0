Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA8D3C3DA41
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 20:03:59 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.4570.1720641835025297083
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jul 2024 13:03:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=jLw6RwZz;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E36A01C0003;
	Wed, 10 Jul 2024 20:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720641833;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X0znG93t665VFMXTBwKvlYK8VZhmhpGT/YiivyckJ2M=;
	b=jLw6RwZz05vIbF4oJtpcb2wNF2s2a+FGvqclXx+2LwXZJl1sqR0GR/4Qs7qWhwzjhdqXX5
	+aMHm0HYz2a+9w7ViNaSBvKfpNThtA7hITEjvpIYdmyPjJy+FWOu2V9PBMVFXmCrmvbsiO
	TMzuk3YigZKcykbxY1l/qKwHPu/u68LhTfrX0tC6+KOF0XvHZK9z8ypTZ53uQN11UwZP/Q
	MmU36/1BO2nK5iFg+WUcYUuEcw2V1XWGu5rqX6QGyDapZ2oLqVR52boXZeWxv2OROEJSlh
	jk5U1QKX3XvO/oRHG02RTn7FQjXv6xbrmJ9BTdA/aLiQfGAZKtFa9BfibriAow==
Date: Wed, 10 Jul 2024 22:03:52 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: joerg.sommer@navimatix.de
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] classes/kernel: Delay module signing until
 after strip
Message-ID: <202407102003520ffdebb9@mail.local>
References: <bc15a9ebae0ad3841ac2be887c288b451426e69b.1720185337.git.joerg.sommer@navimatix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bc15a9ebae0ad3841ac2be887c288b451426e69b.1720185337.git.joerg.sommer@navimatix.de>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 20:03:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201743

I did give this a go on the autobuilders were it broke all the builds:

https://autobuilder.yoctoproject.org/typhoon/#/builders/73/builds/9148/steps/14/logs/stdio

On 05/07/2024 15:19:08+0200, J�rg Sommer via lists.openembedded.org wrote:
> From: J�rg Sommer <joerg.sommer@navimatix.de>
> 
> The current do_package does not strip the kernel modules, if they are
> signed. Hence, the files in a release image stay very big and the debug
> information are not split into the kernel-dbg package.
> 
> The idea of this change is to suppress the signing of the modules on
> `modules_install` and run `modules_sign` after the debug information was
> striped.
> 
> Signed-off-by: J�rg Sommer <joerg.sommer@navimatix.de>
> ---
>  meta/classes-recipe/kernel.bbclass | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> 
> Another idea would be to move the code to split the debug info in package.bbclass to a
> stand-alone tool and inject this in the kernel's modules_install.
> 
> 
> diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
> index 89badd90f1..96e40be085 100644
> --- a/meta/classes-recipe/kernel.bbclass
> +++ b/meta/classes-recipe/kernel.bbclass
> @@ -461,7 +461,8 @@ kernel_do_install() {
>  	#
>  	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
>  	if (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
> -		oe_runmake DEPMOD=echo MODLIB=${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION} INSTALL_FW_PATH=${D}${nonarch_base_libdir}/firmware modules_install
> +		# don't sign now, it's down after extraction of debug information
> +		oe_runmake CONFIG_MODULE_SIG_ALL=n DEPMOD=echo MODLIB=${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION} INSTALL_FW_PATH=${D}${nonarch_base_libdir}/firmware modules_install
>  		rm -f "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
>  		rm -f "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/source"
>  		# Remove empty module directories to prevent QA issues
> @@ -497,6 +498,16 @@ kernel_do_install() {
>  	! [ -e Module.symvers ] || install -m 0644 Module.symvers ${D}/${KERNEL_IMAGEDEST}/Module.symvers-${KERNEL_VERSION}
>  }
>  
> +sign_kernel_modules() {
> +	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
> +	if (grep -q -i -e '^CONFIG_MODULES=y$' ${B}/.config); then
> +		# modinst_pre= prevents the cleaning of the target before signing
> +		oe_runmake -C ${B} modinst_pre= DEPMOD=echo MODLIB=${PKGD}${nonarch_base_libdir}/modules/${KERNEL_VERSION} INSTALL_FW_PATH=${PKGD}${nonarch_base_libdir}/firmware modules_sign
> +	fi
> +}
> +
> +PACKAGEBUILDPKGD += "sign_kernel_modules"
> +
>  # Must be ran no earlier than after do_kernel_checkout or else Makefile won't be in ${S}/Makefile
>  do_kernel_version_sanity_check() {
>  	if [ "x${KERNEL_VERSION_SANITY_SKIP}" = "x1" ]; then
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#201607): https://lists.openembedded.org/g/openembedded-core/message/201607
> Mute This Topic: https://lists.openembedded.org/mt/107053401/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

