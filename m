Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0949DCDB479
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 14:31:59 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8677.1782311512021896472
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jun 2026 07:31:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=YCvpXRIj;
 spf=pass (domain: linaro.org, ip: 209.85.215.180, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c89636920a3so472765a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 07:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782311511; x=1782916311; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b6HwdNee5Ri3WqqBcZxJqq4d8lQKJFbbnXzj5GSoi5s=;
        b=YCvpXRIjkszMjnqm6TGsHQOcK3TGBathhNGGmouzj9zHOc63qYoaccIDzS5GH624JT
         eRc6SUu7ZXp1vN5rDjeM+lsrC2YJIwn76BrrDvcjAXxGgT08Ae6Kf8NtG2Tg938593iw
         ChsyYWbxyB8AJOGyNtHI6XAeAn3KkK06KOXKGtqBj3OQyQmSn+lxbdURxdk+Uidei0Aw
         5VjxiM7DD2SZL5uuvhKlD1e4/8rMwxFhqOq1dAaUzWDph9R60MFyTCtyrNwkJk+Ee+cK
         enFtIUC1SBIfZyNJlsyPWNBZAAZWDyS1Cp7jk7FlOhFTzh1vzdfPBEMTRrnTHX8F4h5g
         zROA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782311511; x=1782916311;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b6HwdNee5Ri3WqqBcZxJqq4d8lQKJFbbnXzj5GSoi5s=;
        b=Vj6t5iN+hZXFyNVlTqjsyKYwYezjVa6n7gO6q7kojIx4wb8e5AAGb0sOJqi4ff1ddt
         m4viQmwas4lBLOWoQ/2WpQbTQ0BdDJTH+21a26aG0ZVEB2DQMkOtSJMMQbgH4fl8M2Sb
         7uqrZF8CFlDIX0jTpejIeWFSKqzn6CElOdAp1aP4tC8QvIlMkVYr3kV4uodki6Aw8OUo
         EOZgOq97SZNbYuZVLRGzWzzxmuUf0XfUDjFQTqBNzOXIZKHsMvJ25jdyGy2W8Uxg8ReJ
         XGCnNSMhl80WeY4tdN4gmNiXvUGOgt2OprIHBovZsAQ6k4DjiS04g/fvdqZsf4kW+fdp
         3MNQ==
X-Gm-Message-State: AOJu0Yym2PAnJZfc8SL1dfQ8xaPtQ/NJhYYWOlwFpGpWUq7MwY+f2CtE
	Pp1k/UZKK8DyW73VfvCusBASxU54BMTKbKAmWM5E7dKYOX3eGg2YHNChni6cWw8I9qI=
X-Gm-Gg: AfdE7cmvWsOCa+S2tO8CP+3Y7NXdPzVPRpV53bJM2AvB11QKxp5cVgRhC0WethaRVZa
	9t/ks8jfkloN7FLtpykyArgqQCBOA71zCO2k5gYACJ1W4gxtQJq037XyUbXRvFWal8XLnIY694o
	T1NW/8hbm5W6uAETCe257s6VgsoudhJWC8tTAXCG4tfSLk87iGssuVZJ0KF+SFlMwnRdte6sEcZ
	t6l+X2LhddEon9G/3+Sspq92fGEQ3QFTxp+N0dpY/dXMy7/SXzR7zcyFLcfWWDWRzzsKkcKuTI5
	1gmWT2Hqkv1NjuYOAvp4PYNvch55CNGh29PHG7/5XKVdAPeXdec/Vqqlupu/0aW01T1kmhemUqB
	iChFx02gGhLvzBgSnJqJRqop8UUleEhgWT79ZOwt6Z0zPsthl0BGj0gwsdXmEKkUHHG+qE3R6K5
	7/weJwVHcsCgHdSWM3BChsrWp2gWe70smVB2Hm5Tm8
X-Received: by 2002:a17:902:ce85:b0:2c7:d329:fe4c with SMTP id d9443c01a7336-2c7e1537074mr41324585ad.31.1782311511127;
        Wed, 24 Jun 2026 07:31:51 -0700 (PDT)
Received: from nuoska (78-27-71-225.bb.dnainternet.fi. [78.27.71.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7436f7e0asm158843945ad.30.2026.06.24.07.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 07:31:50 -0700 (PDT)
Date: Wed, 24 Jun 2026 17:31:46 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: JPEWhacker@gmail.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH v3 5/8] Add SPDX deploy tasks to various recipes
Message-ID: <ajvqUhlN4Ge2MzG_@nuoska>
References: <20260618165032.347436-1-JPEWhacker@gmail.com>
 <20260624141706.2164567-1-JPEWhacker@gmail.com>
 <20260624141706.2164567-6-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260624141706.2164567-6-JPEWhacker@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 14:31:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239520

Hi,

On Wed, Jun 24, 2026 at 08:15:22AM -0600, Joshua Watt via lists.openembedded.org wrote:
> Adds SPDX deploy tasks to many recipes to record their output when
> consumed in an SBoM
> 
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/classes-recipe/barebox.bbclass             | 1 +
>  meta/classes-recipe/devicetree.bbclass          | 1 +
>  meta/classes-recipe/kernel-fit-image.bbclass    | 1 +
>  meta/classes-recipe/kernel.bbclass              | 1 +
>  meta/recipes-bsp/grub/grub-efi_2.14.bb          | 1 +
>  meta/recipes-bsp/opensbi/opensbi_1.8.1.bb       | 1 +
>  meta/recipes-bsp/u-boot/u-boot.inc              | 1 +
>  meta/recipes-core/systemd/systemd-boot_259.5.bb | 2 +-
>  8 files changed, 8 insertions(+), 1 deletion(-)

Why not doing this in deploy.bbclass for all users of the class?

Cheers

-Mikko

> diff --git a/meta/classes-recipe/barebox.bbclass b/meta/classes-recipe/barebox.bbclass
> index 2411fb5caa..60437c1ad1 100644
> --- a/meta/classes-recipe/barebox.bbclass
> +++ b/meta/classes-recipe/barebox.bbclass
> @@ -158,5 +158,6 @@ barebox_do_deploy () {
>          fi
>  }
>  addtask deploy after do_compile
> +SPDX_DEPLOY_TASKS += "do_deploy"
>  
>  EXPORT_FUNCTIONS do_configure do_compile do_install do_deploy
> diff --git a/meta/classes-recipe/devicetree.bbclass b/meta/classes-recipe/devicetree.bbclass
> index ce9d008aac..35c2499bdb 100644
> --- a/meta/classes-recipe/devicetree.bbclass
> +++ b/meta/classes-recipe/devicetree.bbclass
> @@ -164,6 +164,7 @@ devicetree_do_deploy() {
>      done
>  }
>  addtask deploy before do_build after do_install
> +SPDX_DEPLOY_TASKS += "do_deploy"
>  
>  EXPORT_FUNCTIONS do_compile do_install do_deploy
>  
> diff --git a/meta/classes-recipe/kernel-fit-image.bbclass b/meta/classes-recipe/kernel-fit-image.bbclass
> index ae8f3c6688..5115482eff 100644
> --- a/meta/classes-recipe/kernel-fit-image.bbclass
> +++ b/meta/classes-recipe/kernel-fit-image.bbclass
> @@ -241,3 +241,4 @@ do_deploy() {
>      fi
>  }
>  addtask deploy after do_compile before do_build
> +SPDX_DEPLOY_TASKS += "do_deploy"
> diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
> index 50cef17f69..8d0cb91688 100644
> --- a/meta/classes-recipe/kernel.bbclass
> +++ b/meta/classes-recipe/kernel.bbclass
> @@ -842,6 +842,7 @@ kernel_do_deploy() {
>  do_deploy[prefuncs] += "read_subpackage_metadata"
>  
>  addtask deploy after do_install do_populate_sysroot do_packagedata
> +SPDX_DEPLOY_TASKS += "do_deploy"
>  
>  EXPORT_FUNCTIONS do_deploy
>  
> diff --git a/meta/recipes-bsp/grub/grub-efi_2.14.bb b/meta/recipes-bsp/grub/grub-efi_2.14.bb
> index 6354b43989..e535d99710 100644
> --- a/meta/recipes-bsp/grub/grub-efi_2.14.bb
> +++ b/meta/recipes-bsp/grub/grub-efi_2.14.bb
> @@ -97,6 +97,7 @@ do_deploy() {
>  }
>  
>  addtask deploy after do_install before do_build
> +SPDX_DEPLOY_TASKS += "do_deploy"
>  
>  FILES:${PN} = "${libdir}/grub/${GRUB_TARGET}-efi \
>                 ${datadir}/grub \
> diff --git a/meta/recipes-bsp/opensbi/opensbi_1.8.1.bb b/meta/recipes-bsp/opensbi/opensbi_1.8.1.bb
> index 0a9652c283..93646a97df 100644
> --- a/meta/recipes-bsp/opensbi/opensbi_1.8.1.bb
> +++ b/meta/recipes-bsp/opensbi/opensbi_1.8.1.bb
> @@ -45,6 +45,7 @@ do_deploy () {
>  }
>  
>  addtask deploy before do_build after do_install
> +SPDX_DEPLOY_TASKS += "do_deploy"
>  
>  FILES:${PN} += "/share/opensbi/*/${RISCV_SBI_PLAT}/firmware/fw_jump.*"
>  FILES:${PN} += "/share/opensbi/*/${RISCV_SBI_PLAT}/firmware/fw_payload.*"
> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
> index a75948dfc3..acc2bf9819 100644
> --- a/meta/recipes-bsp/u-boot/u-boot.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> @@ -471,3 +471,4 @@ uboot_deploy_spl () {
>  }
>  
>  addtask deploy before do_build after do_compile
> +SPDX_DEPLOY_TASKS += "do_deploy"
> diff --git a/meta/recipes-core/systemd/systemd-boot_259.5.bb b/meta/recipes-core/systemd/systemd-boot_259.5.bb
> index c6c443f929..c887835806 100644
> --- a/meta/recipes-core/systemd/systemd-boot_259.5.bb
> +++ b/meta/recipes-core/systemd/systemd-boot_259.5.bb
> @@ -72,4 +72,4 @@ do_deploy () {
>  }
>  
>  addtask deploy before do_build after do_compile
> -
> +SPDX_DEPLOY_TASKS += "do_deploy"
> -- 
> 2.54.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#239514): https://lists.openembedded.org/g/openembedded-core/message/239514
> Mute This Topic: https://lists.openembedded.org/mt/119957548/7159507
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mikko.rapeli@linaro.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


