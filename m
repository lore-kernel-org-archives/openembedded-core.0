Return-Path: <erik.schilling@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09AEACDB483
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 10:40:06 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.278226.1697625595615703850
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Oct 2023 03:39:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=bDokCp+g;
 spf=pass (domain: linaro.org, ip: 209.85.167.50, mailfrom: erik.schilling@linaro.org)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-507b18cf2e1so3922798e87.3
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 03:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697625594; x=1698230394; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JnQke9JAHXIkc2UCcvJyf0v3IYyeP78IWJnMGtNWpC4=;
        b=bDokCp+gEFMNSrv5nUSt9tRGLRtn7I+UPxFEj/7k4qGW7YdncmL/u+kEX6PYKyl02O
         XsUkJxGtyBVkXhUBZqTEzBxD4Shr1sb6zaSfpsbBu9TfBZwoz7Vmo2mpyrI4I/8FsTrB
         c6yUG6YCqjv4UQwoqlB0ymtVexzJt+j5GvBgRXDZ/iuCBvhONDfVG3fFD6mNiSnaRiFr
         W4KiGuhReTc6s0rgpVTyEdQBbsYfHwRG0nZXd+Ota35IPRaTQBcISoB0Oj/JbKq8mq6g
         9LRF3XM2WGzo34l3qWPInHKD64SzBxqpVwyLwbeETnCzYunLhCSyodD0Uqw+EcvrYDxZ
         VriQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697625594; x=1698230394;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JnQke9JAHXIkc2UCcvJyf0v3IYyeP78IWJnMGtNWpC4=;
        b=tSsozwIvUNqK8YLo+9vkKqHGE6GJuRCkYnMjaJim00ACzX2UDXD4JZsZa22GRvo/au
         YdJ0osgQMLFVNyuKKSdVqqp69l41bgKkpQUNALOm2/JUB2WMteDcjqsI0l+g4iG+XdLl
         UDXvnAJHkdR1ZagQ1siFTOvcwc0NvP3xjucIW1NW/hX+zvjj2nPrwjoFLh0AXj3h0GIr
         a1zovQvV4eY0NtGo6YKX5s+d2u+OA4P4E2khb4ooHb9Fq0pvPkcK1Yb7gQTQT7TQiiPO
         qBSI6OLY+uAWfingL9jGaPCAKt8r3WGUTLhXrWtRSL5SHWd39Mgq8bOKXR0BlHB/Q+xG
         ZaGQ==
X-Gm-Message-State: AOJu0Yy201POj75gAcenoqxhOG6Qlhzgll+l7RFmdGrK3R/rRos1TnG+
	MrlAphc5g634cWldsMZITvi3Yg==
X-Google-Smtp-Source: AGHT+IEtIZc8t9PnMTX0N4WHy0M26WcYu1ae6BMA+gijKEQ60izOv9SpaAqenirQnj5f9t+0TzsupQ==
X-Received: by 2002:a05:6512:512:b0:503:3644:4a98 with SMTP id o18-20020a056512051200b0050336444a98mr3746167lfb.2.1697625593832;
        Wed, 18 Oct 2023 03:39:53 -0700 (PDT)
Received: from localhost (i5387884E.versanet.de. [83.135.136.78])
        by smtp.gmail.com with ESMTPSA id q13-20020adff78d000000b00326dd5486dcsm1809099wrp.107.2023.10.18.03.39.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Oct 2023 03:39:53 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Oct 2023 12:39:52 +0200
Message-Id: <CWBI1R2970SY.1CXIYB7HAT482@ablu-work>
Cc: "Jose Quaresma" <jose.quaresma@foundries.io>
To: "Jose Quaresma" <quaresma.jose@gmail.com>,
 <openembedded-core@lists.openembedded.org>
From: "Erik Schilling" <erik.schilling@linaro.org>
Subject: Re: [OE-core][PATCH 2/4] systemd: add systemd-crypt package
X-Mailer: aerc 0.15.2
References: <20231017091900.114311-1-jose.quaresma@foundries.io>
 <20231017091900.114311-2-jose.quaresma@foundries.io>
In-Reply-To: <20231017091900.114311-2-jose.quaresma@foundries.io>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 10:40:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189376

On Tue Oct 17, 2023 at 11:18 AM CEST, Jose Quaresma wrote:
> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> ---
>  meta/recipes-core/systemd/systemd_254.4.bb | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

Looks reasonable to me. I can test it, but it will probably take me a
few days until I get to this.

- Erik

>
> diff --git a/meta/recipes-core/systemd/systemd_254.4.bb b/meta/recipes-co=
re/systemd/systemd_254.4.bb
> index d24bf0cb06..2146c130d5 100644
> --- a/meta/recipes-core/systemd/systemd_254.4.bb
> +++ b/meta/recipes-core/systemd/systemd_254.4.bb
> @@ -387,6 +387,7 @@ PACKAGE_BEFORE_PN =3D "\
>      ${PN}-analyze \
>      ${PN}-binfmt \
>      ${PN}-container \
> +    ${PN}-crypt \
>      ${PN}-extra-utils \
>      ${PN}-gui \
>      ${PN}-initramfs \
> @@ -446,6 +447,11 @@ USERADD_PARAM:${PN}-journal-upload =3D "--system -d =
/ -M --shell /sbin/nologin sys
> =20
>  FILES:${PN}-analyze =3D "${bindir}/systemd-analyze"
> =20
> +FILES:${PN}-crypt =3D "${bindir}/systemd-cryptenroll \
> +                     ${nonarch_libdir}/cryptsetup \
> +                    "
> +RRECOMMENDS:${PN} +=3D "${PN}-crypt"
> +
>  FILES:${PN}-initramfs =3D "/init"
>  RDEPENDS:${PN}-initramfs =3D "${PN}"
> =20
> @@ -552,7 +558,6 @@ FILES:${PN}-extra-utils =3D "\
>                          ${bindir}/systemd-run \
>                          ${bindir}/systemd-cat \
>                          ${bindir}/systemd-creds \
> -                        ${bindir}/systemd-cryptenroll \
>                          ${bindir}/systemd-delta \
>                          ${bindir}/systemd-cgls \
>                          ${bindir}/systemd-cgtop \


