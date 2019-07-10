Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id CB5847ED65
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2019 08:54:11 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id a15so1366977wmj.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2019 01:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=761VTmesBU7snkzRh4LBJ+8RfymbyHYmrSUiJIg4mmA=;
	b=EyiqJflqbGr7GPSPFmP948d1o+VuNq/fZ/jk6Zp0Z25+jNgAEytXrbu8EcMeBXA80a
	HIGvvZ8WD/OEuO7ow4Iy0cCRUfp+phkLjCNsvP5ojNia1b/v9BeBRROryZk/f7/Kqj9n
	mflSV7Y0cLDxqUtaNYW6JhdIADC0bGz2+p/gQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=761VTmesBU7snkzRh4LBJ+8RfymbyHYmrSUiJIg4mmA=;
	b=g0oYsJwEmmzdxoAOaHM9uX3mRr4Ws35CPT8h4VecxoOe/foyPa/CCD18LPQrg/Z0Ex
	a19H2K8xPVc6eh/6euRb7+7P1Dwe6vV9MyuzIHprMmRUFQTip7PtLUUqxO36H4bOiDLO
	dFk0v91D+5cyjjLHRlt9jrO7g1Nw6y78cT3ZS8VsaQq9cQVrn+VZVEruXfAf0qzDWLfY
	X1YSUB6M7puhiCvOFkF2NaptpIViHwftgLY7/7hdoSkr7dmD6kR5SL9aTFhGHbyKxHWD
	pnpuzmbA3Zf6QR3wtg+PQ7kXd+9uxpHK5OSkDc/cEFbSjHsCo5ZLTsMEo/ET42OF4e3O
	Bl6w==
X-Gm-Message-State: APjAAAUuTppu0o7v4a4DrH8Z2+pBJmkZgLE6Dxy+SLEOh7XEnvMwf8Ho
	IuezPeuBJAxSZgceMvAwPiDYwzxzs5o=
X-Google-Smtp-Source: APXvYqwhTTUwWLOswDTe8vpJKFNVr/L3SFFBzdtep6p94ja04O+WINkIijMv9i9F0bWjpokA3atLPA==
X-Received: by 2002:a1c:5f87:: with SMTP id t129mr4383043wmb.150.1562748852471;
	Wed, 10 Jul 2019 01:54:12 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id x6sm1683048wrt.63.2019.07.10.01.54.11
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 10 Jul 2019 01:54:11 -0700 (PDT)
Message-ID: <e0c10927a3092d4a09178a4398e140ca13a9c39a.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Lukasz Majewski <lukma@denx.de>, Marek Vasut <marex@denx.de>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 10 Jul 2019 09:54:10 +0100
In-Reply-To: <20190709142028.16845-1-lukma@denx.de>
References: <20190709142028.16845-1-lukma@denx.de>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH] u-boot: Provide tasks to generate default U-Boot environment(s) images
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
X-List-Received-Date: Wed, 10 Jul 2019 08:54:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-07-09 at 16:20 +0200, Lukasz Majewski wrote:
> This change provides tasks to generate default U-Boot environment images
> from built U-Boot (via. get_default_envs.sh script).
> 
> Those images then can be used to generate wic images (with e.g. eMMC layout).
> With such approach the end user doesn't see the "CRC environment" error
> after the first boot.
> 
> Moreover, those are built per MACHINE (as u-boot itself is) so then could
> be used in SWUpdate scenarios with single tar'ed archive with multiple
> MACHINE specific *.swu images.
> 
> It is also possible to adjust the *_ENVS_* variables in machine specific
> conf file.
> 
> Test:
> Newest master-next for poky repo - SHA1: eb5b0a0b5e53a6e55a09e66489d3f24d0c6232ee
> MACHINE = "beaglebone-yocto" in local.conf
> bitbake virtual/bootloader
> 
> 
> As a result following links are available in deploy directory:
> u-boot-env.img{_r}.
> 
> Signed-off-by: Lukasz Majewski <lukma@denx.de>
> ---
>  meta/recipes-bsp/u-boot/u-boot.inc | 41 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 
> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
> index 9a754fd09b..e0ccf1ce1f 100644
> --- a/meta/recipes-bsp/u-boot/u-boot.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> @@ -331,3 +331,44 @@ do_deploy () {
>  }
>  
>  addtask deploy before do_build after do_compile
> +
> +# Extract default envs from build U-Boot
> +DEFAULT_UBOOT_ENVS_FILE ?= "u-boot-env"
> +DEFAULT_ENVS ?= "${DEFAULT_UBOOT_ENVS_FILE}.txt"
> +UBOOT_ENVS_DEFAULT ?= "${DEFAULT_UBOOT_ENVS_FILE}-${MACHINE}-${PV}-${PR}.img"
> +UBOOT_ENVS_SIZE ?= "65536"
> +
> +# Generate default environment
> +do_gen_default_envs[doc] = "Generate image with default U-Boot environment(s)"
> +do_gen_default_envs () {
> +    ${B}/source/scripts/get_default_envs.sh ${B} > ${B}/${DEFAULT_ENVS}
> +
> +    # Generate env image
> +    ${B}/tools/mkenvimage -s ${UBOOT_ENVS_SIZE} -o ${B}/${UBOOT_ENVS_DEFAULT} ${B}/${DEFAULT_ENVS}
> +
> +    # Generate redundant env image
> +    ${B}/tools/mkenvimage -r -s ${UBOOT_ENVS_SIZE} -o ${B}/${UBOOT_ENVS_DEFAULT}_r ${B}/${DEFAULT_ENVS}
> +
> +    rm ${B}/${DEFAULT_ENVS}
> +}
> +
> +addtask gen_default_envs before do_deploy after do_compile
> +
> +# Deploy default environment
> +do_deploy_default_envs[doc] = "Copy images with default U-Boot environment to deployment directory"
> +do_deploy_default_envs () {
> +
> +     install -d ${DEPLOYDIR}
> +
> +     install ${B}/${UBOOT_ENVS_DEFAULT} ${DEPLOYDIR}/${UBOOT_ENVS_DEFAULT}
> +     install ${B}/${UBOOT_ENVS_DEFAULT}_r ${DEPLOYDIR}/${UBOOT_ENVS_DEFAULT}_r
> +
> +     cd ${DEPLOYDIR}
> +     ln -sf ${UBOOT_ENVS_DEFAULT} ${DEFAULT_UBOOT_ENVS_FILE}.img
> +     ln -sf ${UBOOT_ENVS_DEFAULT}_r ${DEFAULT_UBOOT_ENVS_FILE}.img_r
> +
> +     rm ${B}/${UBOOT_ENVS_DEFAULT}
> +     rm ${B}/${UBOOT_ENVS_DEFAULT}_r
> +}
> +
> +addtask deploy_default_envs before do_deploy after do_gen_default_envs

I'm not sure this second function/task is right.

DEPLOYDIR is really "owned" by the do_deploy function. As such, if you
rerun the deploy task, it should be recreated with the right content.

By default I appreciate that deploy.bbclass doesn't wipe out the
directory but it probably should to make it clear what the expectations
are here.

I don't think it would cause a real problem right now, until files
changed names or something in one of these tasks, then you'd end up
with files you didn't expect since nothing ever cleans this directory.

Is there a reason we can't make this part of do_deploy and clean the
directory at the start of do_deploy?

Cheers,

Richard





