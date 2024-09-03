Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68E66CA101E
	for <webhook@archiver.kernel.org>; Tue,  3 Sep 2024 06:04:07 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web11.16963.1725343438961798908
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Sep 2024 23:03:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=c4B+9DFp;
 spf=pass (domain: linaro.org, ip: 209.85.208.174, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2f409c87b07so61544071fa.0
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 23:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725343437; x=1725948237; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=stlX60b/PH1MJGClcTPCAxk3pcOwQA1OJoCkC+t1uSI=;
        b=c4B+9DFp0AMLLoj9aSULICC6ujhIbNmFlfOABvJwdnTZRR7hFLKz6k1eDb/aLS1PSj
         ExJuMwVMnY6x4+finGahQPUpugmYLjvxlvR8KBTDrsdasviIPiWBNEL82wiKasQQ/lvL
         vy4D9yCqnFomaG6lbGgmBjd99O9lziJnPlM1Nr4EodHSTcgd4B1K/fiazA9Hz9q/FgQe
         UwqSMwheqUHPZunrZs8sAGQJd9rDS8TYTt6Igahg/XRntNuVhQnrcigaF81UVrLBuuf/
         /RsfaDfews4WB+D9hMMD+rnrHGJiChFdLM/USUiNawW+dOH0abNDhRncxf3LOR/3mcAC
         5Jrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725343437; x=1725948237;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=stlX60b/PH1MJGClcTPCAxk3pcOwQA1OJoCkC+t1uSI=;
        b=LV9KFfJR4xv0V1vxLz8xg0Ddv1lnlWOIXKHSMSkCEIHfjgd8Q85OzuDB7gS54nPom4
         tJtWG9e/kTb+wpbO5xUtMCVxWVlrhD6/EJzsBxXxoK3ZkGTDsXY2AfBA0fkGnewq4H9O
         sJiwZAgdWUQEMjPI/O9wVYSUSw4r5FkWygN90hEb/EmsvTjE/oQUDT7MmqytWsOEb0mQ
         TlamH+l98QSzCtzzisqUkvFFBENNw/+HakluVfI/bMyVG19FnAORcShrJqkEyF6ER+QT
         ctLvV0GVKChJGQZ2wtaC8nQC+UropZPm/6aSpClBxXJPM77lsMmVuZN2QNbWmzBhLn2b
         Kmfw==
X-Gm-Message-State: AOJu0Yym0fc2vxNNfIL1PghU1Ema3VIY6zxtCLHeMw1myBRh3dkhfRxN
	ENs41F4AV4E3bBzYzr7j436dc2FAh8HoI9MoS8dGIq9Rih7Ckny7V18c024ya8k=
X-Google-Smtp-Source: AGHT+IGhVVkB6rqO2+Px3TJvFtopkCcF7iZGtP7ok3wvTiHVQ6PIxK9sfVSenqLirfNV0fLh04Tqvg==
X-Received: by 2002:a05:6512:3e09:b0:52c:99c9:bef6 with SMTP id 2adb3069b0e04-53546af3e69mr7070016e87.7.1725343435901;
        Mon, 02 Sep 2024 23:03:55 -0700 (PDT)
Received: from nuoska (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-535407ac702sm1902076e87.89.2024.09.02.23.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 23:03:55 -0700 (PDT)
Date: Tue, 3 Sep 2024 09:03:53 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: alexander.sverdlin@siemens.com
Cc: openembedded-core@lists.openembedded.org,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: Re: [OE-core] [PATCH v3] kernel-fitimage: make signing failure fatal
Message-ID: <ZtamyY45LZ_6pYw1@nuoska>
References: <20240902161307.1222507-1-alexander.sverdlin@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240902161307.1222507-1-alexander.sverdlin@siemens.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Sep 2024 06:04:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204120

Hi,

On Mon, Sep 02, 2024 at 06:13:06PM +0200, A. Sverdlin via lists.openembedded.org wrote:
> From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> 
> mkimage doesn't fail if it is not able to sign FIT nodes.
> This may lead to unbootable images in secure boot configurations.
> Make signing failures fatal by parsing the mkimage output.
> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> ---
> Changes in v3:
> - bbfatag_log -> bberror + bbfatal_log with relevant mkimage output snippets
> Changes in v2:
> - bbfatal -> bbfatal_log
> 
>  meta/classes-recipe/kernel-fitimage.bbclass | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes-recipe/kernel-fitimage.bbclass b/meta/classes-recipe/kernel-fitimage.bbclass
> index 67c98adb232..ccf848e643f 100644
> --- a/meta/classes-recipe/kernel-fitimage.bbclass
> +++ b/meta/classes-recipe/kernel-fitimage.bbclass
> @@ -753,11 +753,16 @@ fitimage_assemble() {
>  	# Step 8: Sign the image
>  	#
>  	if [ "x${UBOOT_SIGN_ENABLE}" = "x1" ] ; then
> -		${UBOOT_MKIMAGE_SIGN} \
> +		output=$(${UBOOT_MKIMAGE_SIGN} \

Will this subshell return errors as before or is "set -e" propagated there?

>  			${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if len('${UBOOT_MKIMAGE_DTCOPTS}') else ''} \
>  			-F -k "${UBOOT_SIGN_KEYDIR}" \
>  			-r ${KERNEL_OUTPUT_DIR}/$2 \
> -			${UBOOT_MKIMAGE_SIGN_ARGS}
> +			${UBOOT_MKIMAGE_SIGN_ARGS})
> +		echo "$output"
> +		if err=$(echo "$output" | grep -C9 -E "Sign value:\s*unavailable"); then
> +			bberror "${UBOOT_MKIMAGE_SIGN} failed to provide signatures for these images:"
> +			bbfatal_log "\n$err"

Is the problem really in mkimage since it does not return errors when signing fails?

Cheers,

-Mikko

