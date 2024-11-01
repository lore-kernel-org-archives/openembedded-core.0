Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3090CE6F08C
	for <webhook@archiver.kernel.org>; Fri,  1 Nov 2024 21:16:35 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.5051.1730495787807077213
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Nov 2024 14:16:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Rmqng5rX;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: dbaryshkov@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a9a6acac4c3so396196766b.0
        for <openembedded-core@lists.openembedded.org>; Fri, 01 Nov 2024 14:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730495786; x=1731100586; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8mLCn/m9/tfHQNjQ7CZv/wxi+Ly6gIogZb+0VbDfNzA=;
        b=Rmqng5rXRjxWpd5UpvvYT6iXsnI+NMr9mA/fwMssZhjOf1iCJx+u7TPkudPZOz+5JI
         lFX6tLOhwBxRbKmaG4TfKt3OAQCsZkQahs4fiqs9HoOe49J2Cp92T4X5CR4zv09sEshR
         LQksqPIl9U+51jtiGnpJOZ4z2P21p2MmRxnl40j/n9rhI2DpxPdPsmp/jeBeWIOzFA5t
         QUYwUUIooiuqXtJCYs3190PpgZGdbBx8AW1jG1uM3uwziAUjrqPlYSGKOtwTdjKX9ceq
         eD2aZWbB8ujuegnjc+EZ65aHETQpsy9//yYdDekZIrl4dcCqQBHWZVXezHcjLe0Nn5SW
         At+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730495786; x=1731100586;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8mLCn/m9/tfHQNjQ7CZv/wxi+Ly6gIogZb+0VbDfNzA=;
        b=Arl3Z3FkeR5pvcflelNCFdIIqGidXKe+9rd3hnEv8iBPdNrIMJW/nf8NB6otMOc//z
         II3h5rLXmM+rJOKwglNPbXFxg4H/Rau17nKlVuPQwq0XeYYHOPVmyxkIzQKhcCTt6u+C
         isd9cZ4b7CzJ4N2IJ3h9ZOaIcNlLzyGX8RTVE7RjjbhKX42Ln7Vb+88CeNCYj2il8U6l
         4KeH9YM1PjC9hfwwiG8pFIsWgxxF6FV8zkoqxCXzjthFo6w5yqerVBLOBXigDVE6A6ou
         jiU/H5/GBWFySb4s5n9dJBKMu/rUPilCZWxUfjsOcOgStEpkqCciKtHUni2/Pty/KAUg
         Cx7g==
X-Gm-Message-State: AOJu0YxRwIlMezd0BFn8ppkt0qsJNiUmQ2BLo93fxkWVCAR6jOLbrX9N
	So/L40t/BZ9HRjmM59pJW2Eg0w9IEQ8rRBpLlZ6kjjO87628kHPmUlaMuFg2EuQnWPKapCKtslw
	d+C/qNemxEGsNYxNUBIjdYolFytk=
X-Google-Smtp-Source: AGHT+IGO1Br0vJvfz8SVxh13SvKRUj77O48mvv6FUPtPdwz4JbcUiLIrCVlLgr3kKY/lnASzyN1wvNYTtHgjVbLREMc=
X-Received: by 2002:a17:907:8694:b0:a99:43e5:ac37 with SMTP id
 a640c23a62f3a-a9de5ecc0c8mr2201999566b.15.1730495785827; Fri, 01 Nov 2024
 14:16:25 -0700 (PDT)
MIME-Version: 1.0
References: <20241022172111.539206-1-quic_vpuar@quicinc.com>
In-Reply-To: <20241022172111.539206-1-quic_vpuar@quicinc.com>
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Date: Fri, 1 Nov 2024 23:16:14 +0200
Message-ID: <CALT56yN9ySnEHEAXkGDmBOEFO3k2g9eA_J_4L9_bmFjJ8uss5Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] linux-firmware: add new fw file to ${PN}-qcom-adreno-a660
To: quic_vpuar@quicinc.com, nicolas.dechesne@oss.qualcomm.com, 
	rsalveti@quicinc.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Nov 2024 21:16:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206634

On Tue, 22 Oct 2024 at 20:21, Vivek Puar via lists.openembedded.org
<quic_vpuar=quicinc.com@lists.openembedded.org> wrote:
>
> Extend the linux-firmware-qcom-adreno-a660 package
> with gpu firmware file for qcom QCM6490 variant

Could you please explain one thing: why can't you look around and copy
the existing approach? MBN files are platform-dependent, so they
should not go to the platform-independent qcom-adreno-aNNN packages.
That's how all the rest of the platforms are handled, but for some
reason you don't copy that design.

Nico, Ricardo, could you please make sure that future linux-firmware
recipe changes from the Qualcomm side get dmitry.baryshkov@linaro.org
in CC list? I usually don't follow the mailing list closely, so I
missed this.  I'll send a series to fix the issues with QCM6490 /
QCS6490  but I'd really like to be able to prevent such invalid or
half-baked solutions from hitting the repository in the future.

>
> Signed-off-by: Vivek Puar <quic_vpuar@quicinc.com>
> ---
>  meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb
> index f40723cbca..d18e7414db 100644
> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb
> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb
> @@ -1482,7 +1482,7 @@ FILES:${PN}-qcom-adreno-a4xx = "${nonarch_base_libdir}/firmware/qcom/a4*_*.fw*"
>  FILES:${PN}-qcom-adreno-a530 = "${nonarch_base_libdir}/firmware/qcom/a530*.fw*"
>  FILES:${PN}-qcom-adreno-a630 = "${nonarch_base_libdir}/firmware/qcom/a630*.*"
>  FILES:${PN}-qcom-adreno-a650 = "${nonarch_base_libdir}/firmware/qcom/a650*.*"
> -FILES:${PN}-qcom-adreno-a660 = "${nonarch_base_libdir}/firmware/qcom/a660*.*"
> +FILES:${PN}-qcom-adreno-a660 = "${nonarch_base_libdir}/firmware/qcom/a660*.* ${nonarch_base_libdir}/firmware/qcom/qcm6490/a660_zap.mbn*"
>  FILES:${PN}-qcom-adreno-a702 = "${nonarch_base_libdir}/firmware/qcom/a702*.*"
>  FILES:${PN}-qcom-adreno-g750 = "${nonarch_base_libdir}/firmware/qcom/gen70500_*.*"
>  FILES:${PN}-qcom-apq8016-modem = "${nonarch_base_libdir}/firmware/qcom/apq8016/mba.mbn* ${nonarch_base_libdir}/firmware/qcom/apq8016/modem.mbn*"
> --
> 2.34.1

-- 
With best wishes
Dmitry

