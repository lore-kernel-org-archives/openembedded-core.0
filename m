Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C1EBC3ABCB
	for <webhook@archiver.kernel.org>; Sun, 11 May 2025 21:00:48 +0000 (UTC)
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 by mx.groups.io with SMTP id smtpd.web10.36324.1746997245909726781
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 May 2025 14:00:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=mx-20241105 header.b=ICh+FFJn;
 spf=pass (domain: denx.de, ip: 89.58.32.78, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1ABC91048C2EC;
	Sun, 11 May 2025 23:00:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1746997243; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=5lT691Fl89Jrg6F13FBara21nysB7jGQoDyWq0yllfk=;
	b=ICh+FFJnDN4ZwsnkX1Zzy6mbnQadDB7HnsooksEA+g0Kg4OUGlG8cpZBrpNxsAGXTiqW5T
	g9fKzKSp4Qjb/zs/7fiJqUz278JOB3EJkyzH9IAmkIWAST6xbMl7PiibXBZn8ZnCDfM/nE
	XzW9utpcfOb8kKS35fLBlYTbk5tSJLePB5jJ07JIqhcDwk8rItN2ITukND+bgiOTZsnP2q
	0lpdC0AnVOs9BbQgGr0Xq91ROOb9p6Uk4Q0GKl0Zn2i0OVmEiQ85/BSXw43zQQm2KI9Bg5
	SqDqYTUE4QUY9Is2fXCW0vahJhsvKZPSN5Vhnlsg14GLFrrEZ4M2hqqxHqrqHg==
Message-ID: <5758b342-8f91-4b36-b2e8-2d06d5964c04@denx.de>
Date: Sun, 11 May 2025 23:00:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] u-boot: ensure keys are generated before assembling
 U-Boot FIT image
To: Rogerio Guerra Borin <rogerio.borin@gmail.com>,
 openembedded-core@lists.openembedded.org
Cc: Rogerio Guerra Borin <rogerio.borin@toradex.com>,
 Sean Anderson <sean.anderson@seco.com>,
 Adrian Freihofer <adrian.freihofer@siemens.com>
References: <20250509213736.3950997-1-rogerio.borin@gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20250509213736.3950997-1-rogerio.borin@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 May 2025 21:00:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216293

On 5/9/25 11:37 PM, Rogerio Guerra Borin wrote:
> From: Rogerio Guerra Borin <rogerio.borin@toradex.com>
> 
> Add the task dependency:
> 
> do_uboot_assemble_fitimage -> virtual/kernel:do_kernel_generate_rsa_keys
> 
> to ensure the kernel FIT image signing keys are available when creating
> the U-Boot DTB. This is done only if the signing of the kernel FIT image
> is enabled (UBOOT_SIGN_ENABLE="1").
> 
> The lack of the dependency causes build errors when executing a build
> with no kernel FIT keys initially present in the keys directory. In such
> cases one would see an output like this in the Bitbake logs:
> 
> Log data follows:
> | DEBUG: Executing shell function do_uboot_assemble_fitimage
> | Couldn't open RSA private key: '/workdir/build/keys/fit/dev.key': No such file or directory
> | Failed to sign 'signature' signature node in 'conf-1' conf node
> | FIT description: Kernel Image image with one or more FDT blobs
> | ...
> 
> This issue was introduced by commit 259bfa86f384 where the dependency
> between U-Boot and the kernel was removed (for good reasons). Before
> that commit the dependency was set via DEPENDS so that, in terms of
> tasks, one had:
> 
> u-boot:do_configure -> virtual/kernel:do_populate_sysroot
> 
> and the chain leading to the key generation was:
> 
> virtual/kernel:do_populate_sysroot -> virtual/kernel:do_install
> virtual/kernel:do_install -> virtual/kernel:do_assemble_fitimage
> virtual/kernel:do_assemble_fitimage -> virtual/kernel:do_kernel_generate_rsa_keys
> 
> With the removal of the first dependency, no more guarantees exist that
> the keys would be present when assembling the U-Boot FIT image. That's
> the situation we are solving with the present commit.
> 
> Fixes: 259bfa86f384 ("u-boot: kernel-fitimage: Fix dependency loop if UBOOT_SIGN_ENABLE and UBOOT_ENV enabled")
> Signed-off-by: Rogerio Guerra Borin <rogerio.borin@toradex.com>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Sean Anderson <sean.anderson@seco.com>
> Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>   meta/classes-recipe/uboot-sign.bbclass | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe/uboot-sign.bbclass
> index 76a81546e34..7744e0c5ab5 100644
> --- a/meta/classes-recipe/uboot-sign.bbclass
> +++ b/meta/classes-recipe/uboot-sign.bbclass
> @@ -113,6 +113,8 @@ python() {
>       sign = d.getVar('UBOOT_SIGN_ENABLE') == '1'
>       if d.getVar('UBOOT_FITIMAGE_ENABLE') == '1' or sign:
>           d.appendVar('DEPENDS', " u-boot-tools-native dtc-native")
> +    if sign:
> +        d.appendVarFlag('do_uboot_assemble_fitimage', 'depends', ' virtual/kernel:do_kernel_generate_rsa_keys')
This should also check for FIT_GENERATE_KEYS=1 before adding the 
dependency, right ?

