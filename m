Return-Path: <nathan@nathanrossi.com>
Received: from mail-yb0-f194.google.com (mail-yb0-f194.google.com
	[209.85.213.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5BA817836C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Jul 2017 11:24:12 +0000 (UTC)
Received: by mail-yb0-f194.google.com with SMTP id z37so2752576ybh.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Jul 2017 04:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=uaeJ5B+RzMOUx+R/P2rLLrigsz6AbDsfrqJUAm66ZZ0=;
	b=ZOKc6ms5C/GXIyQabSEYR1GFg9brshbKcUUlN7r50VFWtsIhB6ZIEOWQHBbwlk7a36
	ApsSBFmA6Pfk38kRrxrB8wmjodzX4Qo5aZE25d4IpurmvTvFNRJvpL6X30CoGKhp/djJ
	tequqDd92d93puOUcNX47MZQd3WNlje+ws8OhN8uJm1AsIpajZjYNFXsX8xiXVxaiHxS
	VJ/N6r3cNZNou1HbQjrgXuR+wmY3TeDE9SErZdVPQfuz8zJH5DvGO2dnJ/6x4tKe09Y6
	/Io/yilEwaUlQXj0Rh3L57iIRh7C7IC4TvyzuXwsYEypuu3DJhw1CKdRTNhemYRPoHnO
	DsdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=uaeJ5B+RzMOUx+R/P2rLLrigsz6AbDsfrqJUAm66ZZ0=;
	b=gHKgW7lKI8tPqtNjKFzp4Q+IrX2DQfg06vI+nOHBMHmvoeP6jnNZci+Kb0OXiYRoYD
	MUCaeB244DfzHPlD/FXxGSb5c/Q6RM2L4lEV+ZhcUXGaREpv6VN1DMWR6DdMgxpeY0Ak
	am+x/JXC1/QPS87Cn1EVpgf1mhGx3XdStJ2XYbl5tVdIDPDl3UwhiIxe5c8FgXA+wrDK
	QqOEmk2A2y6WbGK/Sbr4XRX0Dj4gr3zqG9tLdjqmt5MVR0giMVtAnbt5SAdA0l4kweDr
	qrUhT1iZbBTcg4u1MjxKe/Wx8r5RmPO/yQj+cPPSrmrDrcQ1jWl7nYa0WbYhh/iX9Csa
	N+QQ==
X-Gm-Message-State: AIVw110SmchO12xOjnYFKrwwCa8LBze3uT0q7nGHMPQxoFvHRy/5sfxB
	1p5yO0GGPCmFuNR06aEZgw4D+MyjPYQF
X-Received: by 10.37.234.66 with SMTP id o2mr10676983ybe.13.1500809053470;
	Sun, 23 Jul 2017 04:24:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.21.5 with HTTP; Sun, 23 Jul 2017 04:24:13 -0700 (PDT)
In-Reply-To: <1500804679-8604-1-git-send-email-liu.ming50@gmail.com>
References: <1500804679-8604-1-git-send-email-liu.ming50@gmail.com>
From: Nathan Rossi <nathan@nathanrossi.com>
Date: Sun, 23 Jul 2017 21:24:13 +1000
Message-ID: <CA+aJhH0NRHfeoPG6jwhCqO8idETerLMYoFayQRb8BbYJR_PL9w@mail.gmail.com>
To: liu.ming50@gmail.com
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kernel-uimage: DEPENDS on u-boot-mkimage-native conditionally
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
X-List-Received-Date: Sun, 23 Jul 2017 11:24:12 -0000
Content-Type: text/plain; charset="UTF-8"

On 23 July 2017 at 20:11,  <liu.ming50@gmail.com> wrote:
> From: Ming Liu <peter.x.liu@external.atlascopco.com>
>
> do_uboot_mkimage would not run if KEEPUIMAGE not equal to 'yes', so it
> does not have to DEPENDS on u-boot-mkimage-native in that case.

This change breaks KEEPUIMAGE == yes. Where the kernel built uImage
make target needs u-boot-mkimage-native. This is a common use case.

|   UIMAGE  arch/arm/boot/uImage
| "mkimage" command not found - U-Boot images will not be built
| arch/arm/boot/Makefile:79: recipe for target 'arch/arm/boot/uImage' failed
| make[3]: *** [arch/arm/boot/uImage] Error 1
| arch/arm/Makefile:329: recipe for target 'uImage' failed
| make[2]: *** [uImage] Error 2

Regards,
Nathan

>
> Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
> ---
>  meta/classes/kernel-uimage.bbclass | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/meta/classes/kernel-uimage.bbclass b/meta/classes/kernel-uimage.bbclass
> index 7c026ab..94344d9 100644
> --- a/meta/classes/kernel-uimage.bbclass
> +++ b/meta/classes/kernel-uimage.bbclass
> @@ -2,16 +2,16 @@ inherit kernel-uboot
>
>  python __anonymous () {
>      if "uImage" in (d.getVar('KERNEL_IMAGETYPES') or "").split():
> -        depends = d.getVar("DEPENDS")
> -        depends = "%s u-boot-mkimage-native" % depends
> -        d.setVar("DEPENDS", depends)
> -
>          # Override KERNEL_IMAGETYPE_FOR_MAKE variable, which is internal
>          # to kernel.bbclass . We override the variable here, since we need
>          # to build uImage using the kernel build system if and only if
>          # KEEPUIMAGE == yes. Otherwise, we pack compressed vmlinux into
>          # the uImage .
>          if d.getVar("KEEPUIMAGE") != 'yes':
> +            depends = d.getVar("DEPENDS")
> +            depends = "%s u-boot-mkimage-native" % depends
> +            d.setVar("DEPENDS", depends)
> +
>              typeformake = d.getVar("KERNEL_IMAGETYPE_FOR_MAKE") or ""
>              if "uImage" in typeformake.split():
>                  d.setVar('KERNEL_IMAGETYPE_FOR_MAKE', typeformake.replace('uImage', 'vmlinux'))
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

