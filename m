Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0C95C021A0
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 10:21:00 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.7875.1739442058856759043
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Feb 2025 02:20:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=zoBKGV4X;
 spf=pass (domain: linaro.org, ip: 209.85.167.47, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5450cc1669eso572686e87.3
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 02:20:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739442057; x=1740046857; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ONnSH29pUExhr/0vlIeTh5pQhqjFFP8GLzbU4y0tbAY=;
        b=zoBKGV4XAmxYZcSk4FA4VZiBsbTjjS6YKSDItytSPM2nU/bsic82iynGJkIUgl3BHK
         cCr7sJ2Qu2HS/p1JZQkH+lPIby7qIH3Au2L8kPZIN4MO4KfuYlpiAOPlHBoFuF7XsLKc
         fAkoe4wK0thrVC6tLaGse06zq/ZbRdR/RehUle+8531urUN7ah8w+/WXPpaCZ5u4AIKw
         4ynORwonSiGpF0cW7amilIRZdmlwj70bpY1d5gLaJvp2HNkS8umEyRQqQZ28c2OFDY32
         +pyNOhK/G3nTg2NLIQpv7hm5N2+X9CZEqDbuTEAHnfOoRATnnjn1d1QirU6aXWcQ92R3
         95tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739442057; x=1740046857;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ONnSH29pUExhr/0vlIeTh5pQhqjFFP8GLzbU4y0tbAY=;
        b=t+ys36R+W3znosJJUlHx3gSSc06HzTKEVfa2ylyVL5IMvrpGrEMdZT5lLkiz03ZXO5
         Oy2scL+sU2QRdgIOmlu9UTLM8rrCD31a/huFF9uMJlXNmxzvA96god9PrVhUhKUKc6Tt
         uyC5yTuWwTJIf/kCqo6YaYoweGr0JmkytkYxtWXzxOLI7i2ky491bEZBMjAK4yPZlXw3
         dQIIba0Dt4MNtIY4eBMH5d50UDEzcPUtGuoSW7JrbwHxCzrzJq+DgciaRUzgOL2e22fO
         mw1cXyWBig7NVkRnL4E8xOo5sRFWPZUjTkk1oNdyC16utiRhFYl3OCZ2MZyoeM+FjjXp
         h9BQ==
X-Gm-Message-State: AOJu0YyDKY8a5Baj/JDi7SXoiGf8Jg0WC9TKCiVHe28eG84OpsRdbdpQ
	xsrjda2JcziXZjXqxW0/T4M9/fuSr067gFMj+LGlgIp7eYCLRCYfefuA2sfKs0Y=
X-Gm-Gg: ASbGncsU6L0QLOTn+EwADDDPB87c08jwTX82FI47hjQ03D/6uxq9x1uXQuBRozrwheM
	9Qhhq/kI3xBSCrLhAZZsCTv6N8P9PlvX4W9OiRNcwtkcDldgKeqJJ0qc7c9sflwnv3tcefVyr80
	vtrSCXKLZOpzk7zPJWI5SE2rK5ZyyrCfwwIdCcN0nNglx/DOPpX13y2qpjARoZ2IL0Hdk10KjFz
	9lJipe4t5LBsCvrMJ9+m1xvKnIM83ARks3/LmsS4xKt8zrEFD5er/N5yGAr7X4N7ltvE9XfxCeQ
	219nV3OXTeUHSTjM1Aaj/Zbx61bUg+6DMYCjq3GpxQS4mUAmORtdryswAHYEp5O+nk8ZmOw=
X-Google-Smtp-Source: AGHT+IFHdpFFUT1iErvJmC+cMtstXd+TlU03+9MNRLhuwZ41uxoMC+bkRqPnOImsokedqgp75XuxWw==
X-Received: by 2002:ac2:5f50:0:b0:542:2190:9d99 with SMTP id 2adb3069b0e04-5451dd8c572mr733891e87.6.1739442056699;
        Thu, 13 Feb 2025 02:20:56 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5451f11ec95sm127141e87.233.2025.02.13.02.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 02:20:55 -0800 (PST)
Date: Thu, 13 Feb 2025 12:20:53 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vivek Puar <quic_vpuar@quicinc.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3] linux-firmware: upgrade 20250109 -> 20250211
Message-ID: <ncraxnrtqpnxbv35hnpuggckf7tgzixs3bsdsfpjxavbjkiswb@5yhok7verjni>
References: <20250213064618.1907931-1-quic_vpuar@quicinc.com>
 <brzznd6fgfndbawy75ylrpzbqwpuc5rg24v4xyc3fbdcrkiuzz@vx3ovob66wxn>
 <69ce9ddf-2c14-4857-919c-3ec4b23a0751@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69ce9ddf-2c14-4857-919c-3ec4b23a0751@quicinc.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 10:21:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211319

On Thu, Feb 13, 2025 at 03:38:14PM +0530, Vivek Puar wrote:
> On 2/13/2025 3:29 PM, Dmitry Baryshkov wrote:
> > On Thu, Feb 13, 2025 at 12:16:18PM +0530, Vivek Puar wrote:
> > > Add DSP firmware for Qualcomm SA8775P / QCS9100
> > > platforms to ${PN}-qcom-sa8775p-{audio, compute, generalpurpose}
> > > packages, and updating it with correct license information.
> > > 
> > > Add QCA6698AQ package ${PN}-ath11k-qca6698aq
> > > to ath11k firmware.
> > > 
> > > Add bluetooth WCN3950 package ${PN}-qca-wcn3950,
> > > bluetooth QCA6698 package ${PN}-qca-qca6698
> > > to qca firmware.
> > > 
> > > Add two more WCN3950 1.3 NVM files to
> > > ${PN}-qca-wcn3950 package.
> > > 
> > > Add device specific ath11k firmware to QCM6490
> > > boards in ${PN}-qcom-qcm6490-wifi package.
> > > 
> > > Add Firmware files for Lenovo T14s G6 Qualcomm platform
> > > to ${PN}-qcom-x1e80100-lenovo-t14s-g6-{adreno, audio, compute}
> > > packages.
> > > 
> > > License-Update: additional files
> > > 
> > > Signed-off-by: Vivek Puar <quic_vpuar@quicinc.com>
> > > Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > >   ...20250109.bb => linux-firmware_20250211.bb} | 68 +++++++++++++++++--
> > >   1 file changed, 63 insertions(+), 5 deletions(-)
> > >   rename meta/recipes-kernel/linux-firmware/{linux-firmware_20250109.bb => linux-firmware_20250211.bb} (96%)
> > > 
> > > @@ -1861,6 +1904,10 @@ FILES:${PN}-qcom-sm8550-audio-tplg = "${nonarch_base_libdir}/firmware/qcom/sm855
> > >   FILES:${PN}-qcom-sm8650-audio-tplg = "${nonarch_base_libdir}/firmware/qcom/sm8650/*tplg.bin*"
> > >   FILES:${PN}-qcom-x1e80100-adreno = "${nonarch_base_libdir}/firmware/qcom/x1e80100/gen70500_zap.mbn*"
> > >   FILES:${PN}-qcom-x1e80100-audio = "${nonarch_base_libdir}/firmware/qcom/x1e80100/adsp*.* ${nonarch_base_libdir}/firmware/qcom/x1e80100/battmgr.jsn"
> > > +FILES:${PN}-qcom-x1e80100-lenovo-t14s-g6-compat = "${nonarch_base_libdir}/firmware/qcom/21N1"
> > Nit: this is unused and not required for T14. The rest LGTM.
> Should "FILES:${PN}-qcom-x1e80100-lenovo-t14s-g6-compat" be removed or

Yes. There is nothing to be compatible with.

Nevertheless, this patch is in master-next. Unless RP drops it, I'd
suggest sending a simple fixup on top of it.

> ${PN}-qcom-x1e80100-lenovo-t14s-g6-compat is not required for T14sand only
> keep${PN}-qcom-x1e80100-lenovo-t14s-g6-{adreno, audio, compute} packages?
> > > +FILES:${PN}-qcom-x1e80100-lenovo-t14s-g6-adreno = "${nonarch_base_libdir}/firmware/qcom/x1e80100/LENOVO/21N1/qcdxkmsuc8380.mbn*"
> > > +FILES:${PN}-qcom-x1e80100-lenovo-t14s-g6-audio = "${nonarch_base_libdir}/firmware/qcom/x1e80100/LENOVO/21N1/*adsp*.* ${nonarch_base_libdir}/firmware/qcom/x1e80100/LENOVO/21N1/battmgr.jsn*"
> > > +FILES:${PN}-qcom-x1e80100-lenovo-t14s-g6-compute = "${nonarch_base_libdir}/firmware/qcom/x1e80100/LENOVO/21N1/*cdsp*.*"
> > >   RDEPENDS:${PN}-qcom-aic100 = "${PN}-qcom-license"
> > >   RDEPENDS:${PN}-qcom-qdu100 = "${PN}-qcom-license"
> Regards,
> Vivek
> 

-- 
With best wishes
Dmitry

