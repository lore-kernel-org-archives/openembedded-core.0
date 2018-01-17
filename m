Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 965E8786E8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 10:20:23 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id x4so21068842wmc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 02:20:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Nall9EO8Az5swxr47lykF8RNcROWMlB3FjHCDOFsUZo=;
	b=hFQBzQ48hl6YiM7JJH2jUekpi1tpYFBTgxntAbL/4Tb6yO5UYt3PQw4suNizboXkln
	uX0eUt4RT8zagcuiuN9DUxGIyTl68HdQksYZOubqKPeBQvakt4CQlg2oEgIeQGnYCCDV
	y0V3sJ+QhQ3RpVXbsmzNcprCe/zuD1owq6ksElEA4na38lpITmdmyoiErEqn5VxCeI5n
	l/u1Wkp2YIFsC7e0bI1IRKpmoMGtM94gYxxc4rSYX79atTDR/NgdL8q2Oe9NaKjhWynw
	7kaG4jvsINq8i3OWoVrAZJMSeuF6uGftlf8ivQRoE6BIiRYAFkpPq90V0w+0423E8yWz
	R4mg==
X-Gm-Message-State: AKwxyte80WHvG6rmTh/HSuIUUo40gCQf9YLSpLkezxmzlSxAI0ODpwMt
	wjAU3nurWSScL2Z+z9uM2yTr0RsZ
X-Google-Smtp-Source: ACJfBotumgZqGD47spAQLY5Elm784Ei3Hj44xU9fj4IUZxvRvfyOxTFsZ9wsjg7ZLZqaEtDBPdk5VA==
X-Received: by 10.80.220.206 with SMTP id v14mr1688634edk.196.1516184424245;
	Wed, 17 Jan 2018 02:20:24 -0800 (PST)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id t5sm2610274edj.64.2018.01.17.02.20.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 17 Jan 2018 02:20:23 -0800 (PST)
Message-ID: <1516184422.28972.79.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Jan 2018 10:20:22 +0000
In-Reply-To: <20180117092307.22703-1-thomas.perrot@tupi.fr>
References: <20180117092307.22703-1-thomas.perrot@tupi.fr>
X-Mailer: Evolution 3.26.2-1 
Mime-Version: 1.0
Subject: Re: [PATCH] uboot-sign: avoid a circular dependency with the task to assemble a fitimage
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
X-List-Received-Date: Wed, 17 Jan 2018 10:20:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,

On Wed, 2018-01-17 at 10:23 +0100, Thomas Perrot wrote:
> Between do_concat_dtb and do_assemble_fitimage when UBOOT_SIGN_ENABLE is
> active:

I have the same question as previously - have you actually tried
UBOOT_SIGN_ENABLE without your patch on master or rocko? I am using it
without any problems or extra patches.

So if you're still seeing problems, can you please clarify how to reproduce
this?

> 
> Dependency loop #1 found:
>   do_concat_dtb (dependent Tasks ['linux-
> yocto_4.10.bb:do_assemble_fitimage'])
>   do_install (dependent Tasks ['pseudo_1.8.2.bb:do_populate_sysroot', 'u-
> boot_2017.01.bb:do_compile', 'u-boot_2017.01.bb:do_concat_dtb'])
>   do_deploy (dependent Tasks ['u-boot_2017.01.bb:do_deploy_dtb', 'u-
> boot_2017.01.bb:do_install'])
>   do_assemble_fitimage (dependent Tasks ['linux-yocto_4.10.bb:do_compile', 
> 'u-boot_2017.01.bb:do_deploy'])

As mentioned previously, exactly this dependency loop was fixed in commit   
7da4c0a56eb2 in oe-core (commit d434e8086ae9 in poky). How are you still
triggering the dependency loop?


> 
> Signed-off-by: Thomas Perrot <thomas.perrot@sigfox.com>
> ---
>  meta/classes/uboot-sign.bbclass | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/classes/uboot-sign.bbclass b/meta/classes/uboot-
> sign.bbclass
> index 8ee904e7df..f36f9dfda1 100644
> --- a/meta/classes/uboot-sign.bbclass
> +++ b/meta/classes/uboot-sign.bbclass
> @@ -74,7 +74,7 @@ do_concat_dtb () {
>  			cd ${DEPLOYDIR}
>  			cat ${UBOOT_NODTB_IMAGE} ${UBOOT_DTB_IMAGE} | tee
> ${B}/${UBOOT_BINARY} > ${UBOOT_IMAGE}
>  		else
> -			bbwarn "Failure while adding public key to u-boot 
> binary. Verified boot won't be available."
> +			bbfatal "Failure while adding public key to u-
> boot binary. Verified boot won't be available."

- this change is not mentioned in the commit message
- this is a good change, but it should be a separate commit, as it's
  independent of any dependency loop fixes

>  		fi
>  	fi
>  }
> @@ -82,7 +82,6 @@ do_concat_dtb () {
>  python () {
>  	uboot_pn = d.getVar('PREFERRED_PROVIDER_u-boot') or 'u-boot'
>  	if d.getVar('UBOOT_SIGN_ENABLE') == '1' and d.getVar('PN') ==
> uboot_pn:
> -		kernel_pn = d.getVar('PREFERRED_PROVIDER_virtual/kernel')
>  
>  		# u-boot.dtb and u-boot-nodtb.bin are deployed _before_
> do_deploy
>  		# Thus, do_deploy_setscene will also populate them in
> DEPLOY_IMAGE_DIR
> @@ -91,5 +90,5 @@ python () {
>  		# do_concat_dtb is scheduled _before_ do_install as it
> overwrite the
>  		# u-boot.bin in both DEPLOYDIR and DEPLOY_IMAGE_DIR.
>  		bb.build.addtask('do_concat_dtb', 'do_install', None, d)
> -		d.appendVarFlag('do_concat_dtb', 'depends', '
> %s:do_assemble_fitimage' % kernel_pn)
> +		d.appendVarFlag('do_concat_dtb', 'depends', '
> %s:do_deploy_dtb' % uboot_pn)

Please also update the documentation on top of the file.


Cheers,
Andre'


