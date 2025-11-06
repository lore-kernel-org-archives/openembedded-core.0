Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C0C0CCFA05
	for <webhook@archiver.kernel.org>; Thu,  6 Nov 2025 21:10:12 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8589.1762463407437887644
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Nov 2025 13:10:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=wlFbUw5B;
 spf=pass (domain: smile.fr, ip: 209.85.167.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-592ff1d80feso69572e87.2
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Nov 2025 13:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1762463405; x=1763068205; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Pu87ohrMsU2HX50u8XgkjIRgvqgSpua9/+GBdOy580o=;
        b=wlFbUw5BpF5tXoQMvHEpiQS/rRoKTt5mIB/QCv1+vEH+vpOXFnQrSp1mga/Tzz9t7N
         fC73sQvCnNcdv9iu8xbUvMzhVw+HxUnMWF2Np8PQojvbDpXf0OQJ4yez0XYGwi1fDDyd
         3vIceGOhP5AWxWvVHuGFY7lvft7cEJzHfLlnc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762463405; x=1763068205;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pu87ohrMsU2HX50u8XgkjIRgvqgSpua9/+GBdOy580o=;
        b=cKj+DhB+FrVX0s2tOGgPLp53h9U2xn0m29y2P5+EwM0o4H4Dn8tTI8z/AYs4wyBOUa
         XBYckYjQCfQZe8QAWfXG+o2TDjZWJ0xu1MhtEu1ATI1vkMudPWKvpXlHf990BYf38bnO
         N95ClfkqPDDTJ1oiH30K7biyqCsZ3ZR3HDWl/Md61jWwHQNnvLbCDIxEEhI/ocDSs6Il
         QiKMUU8AGK5yZizu4DOLRIrgruOX7waVroLlsAa1Z2KiLFAn4B7Miyc0cG6JEs7yGyS7
         PJYxewZAvdnuAItpc8nUA8B1vganoeRMutN2Z9UyWDbA7rd6N27imdOkt4G/mGMmwU7T
         qlmw==
X-Gm-Message-State: AOJu0YxBYUorp5Gr5RmzH3NBbs44IVi8RZtO+HmM+aSg5dl0js0IdBHE
	3ZacRT+q1H6jqmTaDlLcOzK8MKF9yVCZlTKFhPqMqmK8JSV8EZVqNYXAuzqnBykob3o=
X-Gm-Gg: ASbGncul8QS+GVJjOVT/lBlZEX81+vRhrQT1f3BI812ToYSXWxx0rGQCcqfUldWRc0F
	5zEqqzGld8o2SY+LR8uKFJ8twDLi7p22TOMH4v/Irt/gDuLmFb96UIKNRP1FSAGhwqywHJvug8C
	tn6phG3XyjsvxxijqWFKOhAj6nXz2B34qxJZhAm2HoblLFKBpSbFW8Mf0lYZUPk27/gaoHdAlZE
	wrSIagrk7rbEmiH1EzNBRRpsIdjzb4MUEp2y3LF+yDBUfngS6kbaYEC5L9N0nEltEq8mGaC2R7O
	c4IKjYiQ09zL0KzIb6KYysHcgb/JG3e+LGLB1clCuG25DkIuzg4OwbhvxbGHE9QEi1FRVbtdWOL
	7nUKeJ0QlSiMrtAcceEz8dQSetYeRpDe7yvxsbXkWxn8H++ciXU7SjQCNDmgh1yIT1hTo42nOYF
	g/YljNQlTlzJPxekLD3X7VTpZb8KBvsH7K3bn7jg0vkgLXJ0OkW4qFamNIJiLMPbzO
X-Google-Smtp-Source: AGHT+IHPDhPOOTRduGJwLOCCjzRwjvjDTV2jR0BCxaaezyysOXy4W88a9pdtvXbkv4B49jjDDnz+NQ==
X-Received: by 2002:ac2:4e0a:0:b0:55f:701f:933 with SMTP id 2adb3069b0e04-59456b9b738mr169707e87.41.1762463405212;
        Thu, 06 Nov 2025 13:10:05 -0800 (PST)
Received: from smile.fr (2a01cb001331aa00328fd57b7553b0cf.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:328f:d57b:7553:b0cf])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5944a013d09sm987181e87.9.2025.11.06.13.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 13:10:04 -0800 (PST)
Date: Thu, 6 Nov 2025 22:09:58 +0100
From: Yoann Congal <yoann.congal@smile.fr>
To: Harish.Sadineni@windriver.com
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com,
	bruce.ashfield@gmail.com, sundeep.kokkonda@windriver.com,
	elmehdi.younes@smile.fr
Subject: Re: [OE-core] [PATCH RFC v2 7/8] kernel-yocto: Fix for buildpaths
 errors when rust is enabled for kernel
Message-ID: <aQ0Opm310VCku_b6@smile.fr>
References: <20251105130942.833204-1-Harish.Sadineni@windriver.com>
 <20251105130942.833204-8-Harish.Sadineni@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251105130942.833204-8-Harish.Sadineni@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Nov 2025 21:10:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226004

Le Wed, Nov 05, 2025 at 05:09:41AM -0800, Sadineni, Harish via lists.openembedded.org a �crit :
> From: Harish Sadineni <Harish.Sadineni@windriver.com>
> 
> Fixes for buildpaths errors after  enabling rust for linux-kernel
> 
> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> ---
>  meta/classes-recipe/kernel-yocto.bbclass | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe/kernel-yocto.bbclass
> index 7a115bdffd..98cc71e137 100644
> --- a/meta/classes-recipe/kernel-yocto.bbclass
> +++ b/meta/classes-recipe/kernel-yocto.bbclass
> @@ -4,6 +4,8 @@
>  # SPDX-License-Identifier: MIT
>  #
>  
> +INHERIT:append = " ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', ' rust-common', '', d)}"

I think the more usual way to write this is:
inherit_defer ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', 'rust-common', '', d)}

> +
>  # remove tasks that modify the source tree in case externalsrc is inherited
>  SRCTREECOVEREDTASKS += "do_validate_branches do_kernel_configcheck do_kernel_checkout do_fetch do_unpack do_patch"
>  PATCH_GIT_USER_EMAIL ?= "kernel-yocto@oe"
> @@ -27,6 +29,11 @@ KMETA_AUDIT ?= "yes"
>  KMETA_AUDIT_WERROR ?= ""
>  KMETA_CONFIG_FEATURES ?= ""
>  
> +RUST_DEBUG_REMAP = "${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', '--remap-path-prefix=${WORKDIR}=${TARGET_DBGSRC_DIR} \
> +                      --remap-path-prefix=${TMPDIR}/work-shared=${TARGET_DBGSRC_DIR}', '',d)}"
> +KRUSTFLAGS:append = "${RUST_DEBUG_REMAP}"
> +EXTRA_OEMAKE:append = "${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', ' KRUSTFLAGS="${KRUSTFLAGS}"', '',d)}"
> +
>  # returns local (absolute) path names for all valid patches in the
>  # src_uri
>  def find_patches(d,subdir):
> -- 
> 2.49.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#225764): https://lists.openembedded.org/g/openembedded-core/message/225764
> Mute This Topic: https://lists.openembedded.org/mt/116133833/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [yoann.congal@smile.fr]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


