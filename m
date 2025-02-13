Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C240C0219D
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 10:00:00 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.7626.1739440792002549465
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Feb 2025 01:59:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=nQR5pJ7X;
 spf=pass (domain: linaro.org, ip: 209.85.167.45, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54504a6955aso492315e87.2
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 01:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739440790; x=1740045590; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iFyhnmGaK9gMn6EryG9xa9Px7MhFo5ywXr6RzfdTKOA=;
        b=nQR5pJ7Xs4cnZUfRnLjazwWbSNo0BBwje4wFsJE98tGC9mYDTr4P791AHSu4v6ifno
         R71kN4Oi7XQDSqaXDHC4OCnSPZxTAvD0lsLWKSjupsUdg9J8+iDbdiIm2Q7c/k0o4Qoq
         E/moc1YmezyedAUcZIZmHPEArq1ROO3TWTeZJsB9xOfcTJHiKxXGkI4cvQGZ1+GIm+cE
         D5nvk4vYJZwxG3k7qvnl7yQ4FfUgUmEAsB7nWE/fH2ex6UOWsaHXR3sLIw2GnTEtmwRP
         HCAIjH9sGp9xXY1elSaTCOFVR95KiT1RTERO8eBQQ0L9RzCR+SwiymNlkgt5I00sh03N
         kwFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739440790; x=1740045590;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iFyhnmGaK9gMn6EryG9xa9Px7MhFo5ywXr6RzfdTKOA=;
        b=ONY2yZpGVMSgDmTunFqnP1QBQBSm9qDy7eE1gVXpc6VWN7/0alYOj8wvJdOWMvOmyU
         KSWhxF4znBvUe5Wh9ZEZUrcCCyQsFwxjy97id6EIWOq8QAOgBaSWwE64NDh3qXl3M/Lw
         wOHVny9JH8gTN34nNlkcbYLYDaRQ0AkmveF1f0nV8+8XAtDY0QqZ4V94R/h73n0zsz5v
         C9ar54IyP1eCWGTc1InwzDFV/6hBlx4Opwp5tnjhpcEMvVkRzZaug+hH240MBZBsrmHm
         06VDWyPi5F2LeSKIdmShmSo20owBJS7gVnZqRSVkAv+CsAPQuM2VkXjqgyNWst3lJDwg
         nCbw==
X-Gm-Message-State: AOJu0YyAXbD5nM8Nb2QEzWuNWZ7mhHD/wwFSGDLWvErTbzvgRH9wZ3V1
	PS+n2iAbwD6H3jTQBsMtjYEw3S2bwEjdcRq6Xzn4bTlgmexdEVrv5/mW241cM0c+EsBjsa8wU8V
	4Mmw=
X-Gm-Gg: ASbGncsN7OVqdrGbSW1IIl/tt8/Ww1ztpGhgpvGYQRH2L5+nT1YeGNeknactR7NZWGA
	sKzgwKsrow3jioU1WfIkckiJhIFwu9Gdde2OvzTYt4nL62iMjHsje6l6QVL69zqmC5Vki85W5U5
	AL5d34kFmAJTZ/xFgkEqWgeFPFyDzHO8UrjwbdhAdRcaC5ObUtEI+zf+LzMJaPUGGwuLWa5W4Rn
	e73CK1hoowQ2cc6Mhi9ydXYhvsLXTuaFz9ItVPZdfdK81QqNKkK0IQ4F+LXulwsIDSxzwq0tEiq
	n43EovQwxfWjpbgekLb9jw0lqXBuh/WrtbpXdtxpMGpMIv/WpsMVQ2NmecUzKGrkh0OPjcM=
X-Google-Smtp-Source: AGHT+IHACaf9GqfRYL8Nk8FvFnxvkuSyWDbE5QEy4URPJgSk2Yt6cWmMtCIjb/lGL3t41FtlsbeLGA==
X-Received: by 2002:a05:6512:3995:b0:545:842:fd32 with SMTP id 2adb3069b0e04-5451dd92bb7mr873366e87.19.1739440790077;
        Thu, 13 Feb 2025 01:59:50 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5451f10cb33sm125255e87.170.2025.02.13.01.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 01:59:48 -0800 (PST)
Date: Thu, 13 Feb 2025 11:59:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vivek Puar <quic_vpuar@quicinc.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3] linux-firmware: upgrade 20250109 -> 20250211
Message-ID: <brzznd6fgfndbawy75ylrpzbqwpuc5rg24v4xyc3fbdcrkiuzz@vx3ovob66wxn>
References: <20250213064618.1907931-1-quic_vpuar@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213064618.1907931-1-quic_vpuar@quicinc.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 10:00:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211315

On Thu, Feb 13, 2025 at 12:16:18PM +0530, Vivek Puar wrote:
> Add DSP firmware for Qualcomm SA8775P / QCS9100
> platforms to ${PN}-qcom-sa8775p-{audio, compute, generalpurpose}
> packages, and updating it with correct license information.
> 
> Add QCA6698AQ package ${PN}-ath11k-qca6698aq
> to ath11k firmware.
> 
> Add bluetooth WCN3950 package ${PN}-qca-wcn3950,
> bluetooth QCA6698 package ${PN}-qca-qca6698
> to qca firmware.
> 
> Add two more WCN3950 1.3 NVM files to
> ${PN}-qca-wcn3950 package.
> 
> Add device specific ath11k firmware to QCM6490
> boards in ${PN}-qcom-qcm6490-wifi package.
> 
> Add Firmware files for Lenovo T14s G6 Qualcomm platform
> to ${PN}-qcom-x1e80100-lenovo-t14s-g6-{adreno, audio, compute}
> packages.
> 
> License-Update: additional files
> 
> Signed-off-by: Vivek Puar <quic_vpuar@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  ...20250109.bb => linux-firmware_20250211.bb} | 68 +++++++++++++++++--
>  1 file changed, 63 insertions(+), 5 deletions(-)
>  rename meta/recipes-kernel/linux-firmware/{linux-firmware_20250109.bb => linux-firmware_20250211.bb} (96%)
> 
> @@ -1861,6 +1904,10 @@ FILES:${PN}-qcom-sm8550-audio-tplg = "${nonarch_base_libdir}/firmware/qcom/sm855
>  FILES:${PN}-qcom-sm8650-audio-tplg = "${nonarch_base_libdir}/firmware/qcom/sm8650/*tplg.bin*"
>  FILES:${PN}-qcom-x1e80100-adreno = "${nonarch_base_libdir}/firmware/qcom/x1e80100/gen70500_zap.mbn*"
>  FILES:${PN}-qcom-x1e80100-audio = "${nonarch_base_libdir}/firmware/qcom/x1e80100/adsp*.* ${nonarch_base_libdir}/firmware/qcom/x1e80100/battmgr.jsn"
> +FILES:${PN}-qcom-x1e80100-lenovo-t14s-g6-compat = "${nonarch_base_libdir}/firmware/qcom/21N1"

Nit: this is unused and not required for T14. The rest LGTM.

> +FILES:${PN}-qcom-x1e80100-lenovo-t14s-g6-adreno = "${nonarch_base_libdir}/firmware/qcom/x1e80100/LENOVO/21N1/qcdxkmsuc8380.mbn*"
> +FILES:${PN}-qcom-x1e80100-lenovo-t14s-g6-audio = "${nonarch_base_libdir}/firmware/qcom/x1e80100/LENOVO/21N1/*adsp*.* ${nonarch_base_libdir}/firmware/qcom/x1e80100/LENOVO/21N1/battmgr.jsn*"
> +FILES:${PN}-qcom-x1e80100-lenovo-t14s-g6-compute = "${nonarch_base_libdir}/firmware/qcom/x1e80100/LENOVO/21N1/*cdsp*.*"
>  
>  RDEPENDS:${PN}-qcom-aic100 = "${PN}-qcom-license"
>  RDEPENDS:${PN}-qcom-qdu100 = "${PN}-qcom-license"

-- 
With best wishes
Dmitry

