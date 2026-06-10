Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6571CD8CB9
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 06:17:15 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14063.1781072231034570824
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jun 2026 23:17:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=IXyKZDEc;
 spf=pass (domain: linaro.org, ip: 209.85.208.178, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-39676ff4674so58519691fa.0
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2026 23:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781072229; x=1781677029; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4cNXjpqgiy0srckuH7fl1X/3mKR5cGNJ/ThUWm0jqms=;
        b=IXyKZDEciKxSVPS1OoDJySSejlo1t2xHPKgmyQrvghPeq4JtoexdcyDnr42feVQce1
         ZrsgFq9dC+GRZl1jXVHEINjh1u1wOTaz8RTCxktcf4S/n7HdcASOXW2RorNuYztKgMzz
         Uue3lCKUGH3VwO76H7u2hGS0GnP3u46IR9OA606xikLESLPYnBYdvBWro7zQ1NMQ6EZk
         O8H8yKZH1wJbpvlsKPEM3ySPyjpoKfNxGAVGicN+YOZdXBsEIuL6brfSDIQ/x21qGyQE
         U44B09LP6LyOcTSFhUfdjA7AcTcFZgeLQG+eDzPYLxPwDoeHavE5ao2koxmND1Qci6ov
         6vtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781072229; x=1781677029;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4cNXjpqgiy0srckuH7fl1X/3mKR5cGNJ/ThUWm0jqms=;
        b=Pm+hfy4ZAy4QaOk+h+DSBHIxM+VPgirFyTSQIQ4U9+zrsNoKcxdNoQbsNiWDIUBCtW
         qMwgzD+EAf+IJ+k1RXIsTwlJQcyVd3KONC3O7sV1ZrFWCZOYeBlwVQU+eQFggZD92P41
         oWTI8O2DJBqLS4MKcLRXJ556Kkd0Ws4M5LEjXmbL83a1KIMtkonKy1N8XvikpILdWK0i
         ydrCfdst0EywzYxPONL7HBbV5f79gR51TcKpw4yUl6JgtJXIef6Q+o4mNowZNKUuX6S4
         F9ulldzE1w7T4vbfVzYhRCdvAoO2y+KfuSc84opuFG70kOWzxuADUxogb/48GZJkpTm5
         1gJg==
X-Gm-Message-State: AOJu0Yz3nd6RAfFBPB02yruJRbCBRl99gqpKXTdEcQctT4ZEAFft5lk6
	FAbGJlbozXd+1dijMGTiiVcw1xSvBEmiRxHCjgGhdKNKRDdLIwHEtMb2SvRO435RhQw=
X-Gm-Gg: Acq92OESiLT8c4d917t2e0aqf0RepxOGOT05F100k1ZI/FRNMbi+21erWTdx1qS2SKG
	YZglrI8Snr58QCa/cvAVem4AXX8J+qU8kqrjMmIZU8ApWD0adFJQw1KxhJernf5droJIG+Vmjrd
	9wAa7BiPtbKicm6HimjHZ3CQ8O8qZyNh6lTIaDLll8p5kD4KE4C7JwwDv8cicmA8dd+Ceh6KpFY
	DRmUNePYyKNDf9JeLqVOuDsbsFo+BOcYSfTRDUDARVeH9Sb483TQhix2R9lELp+D0AsjYQhanJt
	Lh4p/HsZTszDQhASwBjnGJ9ML+f02EtJX2ksTN+GJfFxmg0rrumIHK9KEHj3i5zBLPpW55rvL9Z
	Dt4ObISEZVhqyOkW+DezmVmnGB4WPqR85ybv81cAYjF4AjsUzduma1atGGlqeWV1ACTwRUzMU+R
	Q3tJqjB6WWsIXY3761/G/PcMyIe2Ork2ugVJ0Uz/KiclagLE0/btD0bzYG4IkVAA==
X-Received: by 2002:a2e:a989:0:b0:396:7b20:1a77 with SMTP id 38308e7fff4ca-396d09fc5f7mr67201561fa.22.1781072229081;
        Tue, 09 Jun 2026 23:17:09 -0700 (PDT)
Received: from nuoska (78-27-71-225.bb.dnainternet.fi. [78.27.71.225])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2d5ea9sm58516451fa.32.2026.06.09.23.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 23:17:08 -0700 (PDT)
Date: Wed, 10 Jun 2026 09:17:07 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: JPEWhacker@gmail.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH 4/5] Add SPDX deploy tasks
Message-ID: <aikBYy4AyBjN3akL@nuoska>
References: <20260609222331.1293007-1-JPEWhacker@gmail.com>
 <20260609222331.1293007-5-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609222331.1293007-5-JPEWhacker@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 06:17:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238314

Hi,

On Tue, Jun 09, 2026 at 04:15:55PM -0600, Joshua Watt via lists.openembedded.org wrote:
> Adds SPDX deploy tasks to many recipes to record their output when
> consumed in an SBoM
> 
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/classes-recipe/barebox.bbclass             | 3 ++-
>  meta/classes-recipe/devicetree.bbclass          | 3 ++-
>  meta/classes-recipe/kernel-fit-image.bbclass    | 3 ++-
>  meta/classes-recipe/kernel.bbclass              | 3 ++-
>  meta/recipes-bsp/grub/grub-efi_2.14.bb          | 3 ++-
>  meta/recipes-bsp/opensbi/opensbi_1.8.1.bb       | 3 ++-
>  meta/recipes-bsp/u-boot/u-boot.inc              | 3 ++-
>  meta/recipes-core/systemd/systemd-boot_259.5.bb | 4 ++--
>  8 files changed, 16 insertions(+), 9 deletions(-)
> 
> diff --git a/meta/classes-recipe/barebox.bbclass b/meta/classes-recipe/barebox.bbclass
> index 73615999aa..0be611cf65 100644
> --- a/meta/classes-recipe/barebox.bbclass
> +++ b/meta/classes-recipe/barebox.bbclass
> @@ -157,6 +157,7 @@ barebox_do_deploy () {
>                  done
>          fi
>  }
> -addtask deploy after do_compile
> +addtask deploy after do_compile do_create_spdx
> +SPDX_DEPLOY_TASKS += "do_deploy"
>  
>  EXPORT_FUNCTIONS do_configure do_compile do_install do_deploy
> diff --git a/meta/classes-recipe/devicetree.bbclass b/meta/classes-recipe/devicetree.bbclass
> index ce9d008aac..a313507251 100644
> --- a/meta/classes-recipe/devicetree.bbclass
> +++ b/meta/classes-recipe/devicetree.bbclass
> @@ -163,7 +163,8 @@ devicetree_do_deploy() {
>          install -Dm 0644 "${B}/$dtb_file" "${DEPLOYDIR}/devicetree/$dtb_file"
>      done
>  }
> -addtask deploy before do_build after do_install
> +addtask deploy before do_build after do_install do_create_spdx
> +SPDX_DEPLOY_TASKS += "do_deploy"

Could deploy.bbclass do this by default? There are plenty of similar changes needed in
BSP etc layers which already use deploy.bbclass.

Cheers,

-Mikko

>  EXPORT_FUNCTIONS do_compile do_install do_deploy
>  
> diff --git a/meta/classes-recipe/kernel-fit-image.bbclass b/meta/classes-recipe/kernel-fit-image.bbclass
> index ae8f3c6688..becbc280ce 100644
> --- a/meta/classes-recipe/kernel-fit-image.bbclass
> +++ b/meta/classes-recipe/kernel-fit-image.bbclass
> @@ -240,4 +240,5 @@ do_deploy() {
>          fi
>      fi
>  }
> -addtask deploy after do_compile before do_build
> +addtask deploy after do_compile do_create_spdx before do_build
> +SPDX_DEPLOY_TASKS += "do_deploy"
> diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
> index 50cef17f69..5dc606048b 100644
> --- a/meta/classes-recipe/kernel.bbclass
> +++ b/meta/classes-recipe/kernel.bbclass
> @@ -841,7 +841,8 @@ kernel_do_deploy() {
>  # ensure we get the right values for both
>  do_deploy[prefuncs] += "read_subpackage_metadata"
>  
> -addtask deploy after do_install do_populate_sysroot do_packagedata
> +addtask deploy after do_install do_populate_sysroot do_packagedata do_create_spdx
> +SPDX_DEPLOY_TASKS += "do_deploy"
>  
>  EXPORT_FUNCTIONS do_deploy
>  
> diff --git a/meta/recipes-bsp/grub/grub-efi_2.14.bb b/meta/recipes-bsp/grub/grub-efi_2.14.bb
> index 6354b43989..db187ac373 100644
> --- a/meta/recipes-bsp/grub/grub-efi_2.14.bb
> +++ b/meta/recipes-bsp/grub/grub-efi_2.14.bb
> @@ -96,7 +96,8 @@ do_deploy() {
>  	install -m 644 ${B}/${GRUB_IMAGE_PREFIX}${GRUB_IMAGE} ${DEPLOYDIR}
>  }
>  
> -addtask deploy after do_install before do_build
> +addtask deploy after do_install do_create_spdx before do_build
> +SPDX_DEPLOY_TASKS += "do_deploy"
>  
>  FILES:${PN} = "${libdir}/grub/${GRUB_TARGET}-efi \
>                 ${datadir}/grub \
> diff --git a/meta/recipes-bsp/opensbi/opensbi_1.8.1.bb b/meta/recipes-bsp/opensbi/opensbi_1.8.1.bb
> index 0a9652c283..377a06fb78 100644
> --- a/meta/recipes-bsp/opensbi/opensbi_1.8.1.bb
> +++ b/meta/recipes-bsp/opensbi/opensbi_1.8.1.bb
> @@ -44,7 +44,8 @@ do_deploy () {
>  	install -m 755 ${D}/share/opensbi/*/${RISCV_SBI_PLAT}/firmware/fw_dynamic.* ${DEPLOYDIR}/
>  }
>  
> -addtask deploy before do_build after do_install
> +addtask deploy before do_build after do_install do_create_spdx
> +SPDX_DEPLOY_TASKS += "do_deploy"
>  
>  FILES:${PN} += "/share/opensbi/*/${RISCV_SBI_PLAT}/firmware/fw_jump.*"
>  FILES:${PN} += "/share/opensbi/*/${RISCV_SBI_PLAT}/firmware/fw_payload.*"
> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
> index a75948dfc3..1c3c9858df 100644
> --- a/meta/recipes-bsp/u-boot/u-boot.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> @@ -470,4 +470,5 @@ uboot_deploy_spl () {
>      ln -sf ${SPL_IMAGE} ${DEPLOYDIR}/${SPL_SYMLINK}
>  }
>  
> -addtask deploy before do_build after do_compile
> +addtask deploy before do_build after do_compile do_create_spdx
> +SPDX_DEPLOY_TASKS += "do_deploy"
> diff --git a/meta/recipes-core/systemd/systemd-boot_259.5.bb b/meta/recipes-core/systemd/systemd-boot_259.5.bb
> index c6c443f929..e2c579db97 100644
> --- a/meta/recipes-core/systemd/systemd-boot_259.5.bb
> +++ b/meta/recipes-core/systemd/systemd-boot_259.5.bb
> @@ -71,5 +71,5 @@ do_deploy () {
>  	install ${B}/src/boot/addon*.efi.stub ${DEPLOYDIR}
>  }
>  
> -addtask deploy before do_build after do_compile
> -
> +addtask deploy before do_build after do_compile do_create_spdx
> +SPDX_DEPLOY_TASKS += "do_deploy"
> -- 
> 2.54.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#238307): https://lists.openembedded.org/g/openembedded-core/message/238307
> Mute This Topic: https://lists.openembedded.org/mt/119731707/7159507
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mikko.rapeli@linaro.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


