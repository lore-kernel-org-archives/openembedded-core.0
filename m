Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF89AEE642E
	for <webhook@archiver.kernel.org>; Thu, 12 Sep 2024 04:28:39 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.39792.1726115316167520036
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Sep 2024 21:28:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GkOAwqZQ;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: dbaryshkov@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-374c1e5fe79so403592f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Sep 2024 21:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726115314; x=1726720114; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=U5RwYTv7gXAuYIicE6K46N88wtmEnDlTAlTdBjmJVKQ=;
        b=GkOAwqZQdHTeU5jsCeyCQWlvjSGddShbiCf/AveKbQHdkd2WmekuKO3dqwqRGUQSH9
         gTaZsfTO8Q74ABDh3MluWJI/8AlHl01JiDsUybx5P2rEz8la7RK27TgFpL4M3lAxBFS3
         2NEn1k5MvQd+xKk7IDbQHO8WqFDs+vYu1PaRqT+K+h0NQTx7DYSOYIfT3zOL7jGarjrG
         pbQMogk7yg39xc4Bgr5oHQXroGTb007BGGdH5goAJpizsIWRGRUc/HVIXHU30NWyoBmQ
         2kVbYCrzyfB7znBe4VxmDd7sp0sr6cOlNugn+rN1ATyoxJTvYvQMAxJvIbyVboLL8ovi
         G9SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726115314; x=1726720114;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U5RwYTv7gXAuYIicE6K46N88wtmEnDlTAlTdBjmJVKQ=;
        b=pxHPkd3netzFp2ePK/EcUt44FR1AqRWqLG/9pm3MuAMUjnKbLLvYUabOdrYQz6Cnaf
         zUguwBqlHlIJn2TErRlAhrs9ul2fOiS/91VLNgtVv8og7/OPORnU91nuH0ndImzO2AH/
         CRseO6hDcERL7PVTF7hA+PVfrF65tJgifQtO7vyNQ5vZIIAcpnqh7aQYWk+iv/Gkjo1I
         hc/W+RCBB1x14riIEp3HgEYMBmJWFp3gN1FoEDPplWYpwCl37SmScfY/h2Q/5MDBkx+M
         2bQCe50TUJ8kP4Kb6mM+y9cNQDoDK7vNAxHGjA9qOKwMYgj4odPaYuC4yQXJFupuQySN
         TCFg==
X-Gm-Message-State: AOJu0Yw9mA93MYY4lq88zG+2nIWOobGn4IyOr63IBiGXawMHkdgfbX0e
	VBYZQeLpU4rjvbSbyh+nsTLsRGchmwO0OjYUa1x8u9QJOuDF6NCCcteW7Cs13bDWNaLhvC8/2VE
	txOpHy84zP5AgCu8v7P0Nl8KDefU=
X-Google-Smtp-Source: AGHT+IEKczViY01JTBas6Hm4sssj+FSCTLJq9Qp6WHxZdExAt+Cal4UD53duig9m7bAvtq5Gk8Ht6QZ+Ri/NfRNSArg=
X-Received: by 2002:adf:f650:0:b0:368:445e:91cc with SMTP id
 ffacd0b85a97d-378c2d06345mr793165f8f.21.1726115313594; Wed, 11 Sep 2024
 21:28:33 -0700 (PDT)
MIME-Version: 1.0
References: <17F33254029D99AE.31736@lists.openembedded.org>
In-Reply-To: <17F33254029D99AE.31736@lists.openembedded.org>
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Date: Thu, 12 Sep 2024 07:28:22 +0300
Message-ID: <CALT56yPY5mC4NofpCdYE7t-kfDOyzhyX3DiU_WYQ4AT9ugExwQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] linux-firmware: split ath10k package
To: dbaryshkov@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Sep 2024 04:28:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204418

On Sun, 8 Sept 2024 at 09:53, Dmitry Baryshkov via
lists.openembedded.org <dbaryshkov=gmail.com@lists.openembedded.org>
wrote:
>
> A lot of Qualcomm-based devices incorporate WCN3990 WiFi/BT chips. The
> ath10k firmware package provides two small files for such boards, the
> rest of ath10k firmware isn't applicable. Split the WCN3990 firmware
> package to simplify using of the WiFI in the resource-constrained
> environments (e.g. from the initramfs).
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../linux-firmware/linux-firmware_20240811.bb          | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)

Gracious ping for this patch.

>
> diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20240811.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20240811.bb
> index b620a6e24928..033e832cef43 100644
> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_20240811.bb
> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20240811.bb
> @@ -331,7 +331,9 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
>               ${PN}-atheros-license ${PN}-ar5523 ${PN}-ar9170 ${PN}-ath6k ${PN}-ath9k ${PN}-ath3k \
>               ${PN}-carl9170 \
>               ${PN}-qcom-qcm2290-wifi ${PN}-qcom-qrb4210-wifi ${PN}-qcom-sdm845-modem \
> -             ${PN}-ar3k-license ${PN}-ar3k ${PN}-ath10k-license ${PN}-ath10k ${PN}-ath11k ${PN}-ath12k ${PN}-qca \
> +             ${PN}-ar3k-license ${PN}-ar3k \
> +             ${PN}-ath10k-license ${PN}-ath10k-wcn3990 ${PN}-ath10k \
> +             ${PN}-ath11k ${PN}-ath12k ${PN}-qca \
>               \
>               ${PN}-imx-sdma-license ${PN}-imx-sdma-imx6q ${PN}-imx-sdma-imx7d \
>               \
> @@ -487,6 +489,7 @@ LICENSE:${PN}-carl9170 = "GPL-2.0-or-later"
>  LICENSE:${PN}-ar3k = "Firmware-qualcommAthos_ar3k & Firmware-atheros_firmware"
>  LICENSE:${PN}-ar3k-license = "Firmware-qualcommAthos_ar3k"
>  LICENSE:${PN}-ath10k = "Firmware-qualcommAthos_ath10k"
> +LICENSE:${PN}-ath10k-wcn3990 = "Firmware-qualcommAthos_ath10k"
>  LICENSE:${PN}-ath10k-license = "Firmware-qualcommAthos_ath10k"
>  LICENSE:${PN}-qca = "Firmware-qualcommAthos_ath10k"
>
> @@ -499,6 +502,9 @@ FILES:${PN}-ath10k-license = "${nonarch_base_libdir}/firmware/LICENSE.QualcommAt
>  FILES:${PN}-ath10k = " \
>    ${nonarch_base_libdir}/firmware/ath10k \
>  "
> +FILES:${PN}-ath10k-wcn3990 = " \
> +  ${nonarch_base_libdir}/firmware/ath10k/WCN3990 \
> +"
>
>  FILES:${PN}-ath11k = " \
>    ${nonarch_base_libdir}/firmware/ath11k \
> @@ -514,6 +520,8 @@ FILES:${PN}-qca = " \
>
>  RDEPENDS:${PN}-ar3k += "${PN}-ar3k-license ${PN}-atheros-license"
>  RDEPENDS:${PN}-ath10k += "${PN}-ath10k-license"
> +RDEPENDS:${PN}-ath10k += "${PN}-ath10k-wcn3990"
> +RDEPENDS:${PN}-ath10k-wcn3990 += "${PN}-ath10k-license"
>  RDEPENDS:${PN}-ath11k += "${PN}-ath10k-license"
>  RDEPENDS:${PN}-ath12k += "${PN}-ath10k-license"
>  RDEPENDS:${PN}-qca += "${PN}-ath10k-license"
> --
> 2.39.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#204295): https://lists.openembedded.org/g/openembedded-core/message/204295
> Mute This Topic: https://lists.openembedded.org/mt/108333699/3618183
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [dbaryshkov@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
With best wishes
Dmitry

