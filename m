Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id A9BB37ED5C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 14:01:41 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id g7so1445276wrx.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 07:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=HPi1debWi6aYnXJHwAHevGMbv83RnQeHhcgFsTnHKTA=;
	b=hAYTNMr/uuvK01DzWtK3wnjfAvGz+mCk/05LRCCTjT3dBVXSjWHSg8CWDRcgGP2XeO
	7kNhJCxInK9/bCc70hbDR5UZPNtSyWsKGm+Nc2uU64BXqPbS/440B3ExaRUNJdZ4yIhz
	FaTcsP3ulOB0axW/KycKJsvIF+6Hh0scCv+DY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=HPi1debWi6aYnXJHwAHevGMbv83RnQeHhcgFsTnHKTA=;
	b=n1TrUDgBadscFoFdo2z5RD6X26IMs2qcq30pMkvdTdmXq0j5cgeGV9tuHe6M0Efy8W
	2njsm5enIhSWNCj1gQlwUa/BRtLgNHKYrFZNUs0YZGbO/S0zBYgSayZJgK+g5kxd3TAL
	tLwVrCncCsKrGp2HVM9CDNHkOcS/57+02g5dD3zLNmvy7o3wRgJ1HzQ7Pyo683ODlGaT
	ddriGc2iRGIAUjsvxarg5Pn/J8QJ4VfQCJKugiYda2037AmvSO3wctt88GB8pSqXvnGr
	HBKESqv9uU7D4R3LbOaeEMPZ7sm38yfOkpl4VzVDNEUqQ2vdONjawfLytgB0mKPH7F1p
	mkxA==
X-Gm-Message-State: APjAAAXV5qM9mhfV5a3vrdeUjFSKS3B0PDZbEnamC0REcUNmo0XHV+SX
	3HTB833BGFPUvOAnkZ4AgeWK7/ti/3sWJg==
X-Google-Smtp-Source: APXvYqx5V0VPUcWnpVZVBUQhWQeYf9x0MbJW4FajnNx5pbXV9XQyUl0KIYZojxUEvc53almYYEfAlg==
X-Received: by 2002:a5d:4b0e:: with SMTP id v14mr5054020wrq.24.1567000902411; 
	Wed, 28 Aug 2019 07:01:42 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id p9sm3011926wru.61.2019.08.28.07.01.41
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 28 Aug 2019 07:01:41 -0700 (PDT)
Message-ID: <e90a6dec179ce0b8d20b6181b724df5ff6351da4.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Daniel Klauer <daniel.klauer@gin.de>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 28 Aug 2019 15:01:40 +0100
In-Reply-To: <20190828114131.10340-1-daniel.klauer@gin.de>
References: <20190828114131.10340-1-daniel.klauer@gin.de>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] uboot-sign: Refactor do_deploy prefunc to do_deploy_prepend
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
X-List-Received-Date: Wed, 28 Aug 2019 14:01:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-08-28 at 13:41 +0200, Daniel Klauer wrote:
> bitbake removes cleandirs once per prefunc and then again for the actual
> task.

That commit message isn't correct.

It removes cleandirs for the prefunc at the start of the prefunc and
cleandirs for the main function at the start of that main function.

The code is in lib/bb/build.py:

            for func in (prefuncs or '').split():
                exec_func(func, localdata)
            exec_func(task, localdata)
            for func in (postfuncs or '').split():
                exec_func(func, localdata)

with the cleandirs happening in exec_func() for each function.

This does mean the cleandirs happens after the prefunc is called but
not as described above.

>  By moving the concat_dtb step here from prefunc to main task we can
> add
>     do_deploy[cleandirs] = "${DEPLOYDIR}"
> to deploy.bbclass without losing the files produced by concat_dtb.

I think you also need to state here that this is only expected to be
run for the uboot recipe and not the kernel.

The patch itself is probably ok but I'd ask the commit message be
corrected please.

Cheers,

Richard

> It looks like using do_deploy(_append) was the original goal anyways.
> 
> I tested this with poky, putting the following in local.conf:
>   UBOOT_SIGN_ENABLE = "1"
>   KERNEL_CLASSES = " kernel-fitimage "
>   KERNEL_IMAGETYPE = "fitImage"
> and then doing
>   bitbake core-image-minimal
>   bitbake u-boot
> It builds successfully, the kernel and uboot recipes' temp/run.do_deploy
> scripts look good (kernel's do_deploy is not broken, and uboot's do_deploy
> still calls concat_dtb).
> 
> Signed-off-by: Daniel Klauer <daniel.klauer@gin.de>
> ---
>  meta/classes/uboot-sign.bbclass | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/classes/uboot-sign.bbclass b/meta/classes/uboot-sign.bbclass
> index 982ed46d01..713196df41 100644
> --- a/meta/classes/uboot-sign.bbclass
> +++ b/meta/classes/uboot-sign.bbclass
> @@ -117,15 +117,16 @@ do_install_append() {
>  	fi
>  }
>  
> +do_deploy_prepend_pn-${UBOOT_PN}() {
> +	if [ "${UBOOT_SIGN_ENABLE}" = "1" -a -n "${UBOOT_DTB_BINARY}" ]; then
> +		concat_dtb
> +	fi
> +}
> +
>  python () {
>      if d.getVar('UBOOT_SIGN_ENABLE') == '1' and d.getVar('PN') == d.getVar('UBOOT_PN') and d.getVar('UBOOT_DTB_BINARY'):
>          kernel_pn = d.getVar('PREFERRED_PROVIDER_virtual/kernel')
>  
>          # Make "bitbake u-boot -cdeploy" deploys the signed u-boot.dtb
>          d.appendVarFlag('do_deploy', 'depends', ' %s:do_deploy' % kernel_pn)
> -
> -        # kernerl's do_deploy is a litle special, so we can't use
> -        # do_deploy_append, otherwise it would override
> -        # kernel_do_deploy.
> -        d.appendVarFlag('do_deploy', 'prefuncs', ' concat_dtb')
>  




