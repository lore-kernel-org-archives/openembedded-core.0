Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28ABDC021A0
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 11:57:16 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web10.13995.1739361425516975840
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Feb 2025 03:57:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Fdb2/+7b;
 spf=pass (domain: linaro.org, ip: 209.85.208.176, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-308ee953553so33597751fa.0
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 03:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739361423; x=1739966223; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y5WdO8Q9QpTKdRzeH6dvC5bad/Wc0Qph3hivAL8kIcY=;
        b=Fdb2/+7b5rlWJYxsq6mZ7H/Wq0TiEXZtorVs/aqejI1QVo/b0WfBMFocsKJ4pDQyIq
         6c/cOh7CVItFbXd/4tcVIjBVsMuqp5YHGore+GWG0TnvEvpnYAA5JfyvcZUwPISnMF/p
         FAjUKMRmHxOJQlRyQ4NWrjMvVPCvigggkBO5t7eaRccbYW6TqCJld4H8lWOBWrhyaoWv
         I7y1osjIJQ+d1vCM1fx/iAi/LMLoWH7jgVffOC9oLyRCNa33tZHQnAnu3NQpWHZkaTqd
         Vp292vaQr2QsNa0PgATTBm1m8A2+eLGjT6Glx1gSegT7lI6fz98cWbUbsvsRmRsVAYPd
         wRxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739361423; x=1739966223;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y5WdO8Q9QpTKdRzeH6dvC5bad/Wc0Qph3hivAL8kIcY=;
        b=u+6JQF08jm/hBLDf/RqNG8+Xqn1gwfFpStjAODwMSgGjKZDxaZ5voFpjPh/Dh7jzSF
         TFZ3kZAixzUYj7tC+W1oC6NXDs2ccKU8H6GW0NPgsdTDxxmXOnt+GrFo6VtF+ps1NQKt
         n4KdLcQNeIrRJoMwCWr2Ug5Dk/EjLGHQJPQUNUcKd0ARmWPUoWyOvnsh2YM9jXhNcmB8
         6PIWb5B0x/CPKtIc4o1kCs78CaB7SjDxTD49WbtTZw0LvTbsiS5Uk7xWxooX2U4cOM3a
         sqzVP2RzDvBMDEWPedkZOwBD6jqIxelqT8oe5QjVNorzCPUCiPhBwitgHbahlZLf+leP
         MpHw==
X-Forwarded-Encrypted: i=1; AJvYcCVzAkxyH1w/ESiFMMXaMJOAUiT9qjFsWhkkwj0osPc34FEyOb7+Mtpw7hCBTm5OOWq/295LradKDlgtlLDWB+DZMg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyzDuzCdhN1vDDRJNMM9ksC58QrzfWA7vE1Zwz6ILprAYbOzz5a
	4mFtdn3tjPTNhJF2/RQjdEJwkutuadwPAOigHLLAkbIdRmijoQqWVyPIPhzYbGE=
X-Gm-Gg: ASbGncsKkoqYSWShSa5iw/HwB3CwaBqQ3ejSOis6o4uyt3E8lRGxLYaZj1kyVbQAYex
	++nI74ztPRfcD0xZsGPpbPLWQXD8G7LooGKgc0xfSQ36+EP6E8IWmX8jdIQWo0iL6bFB7FssYN2
	dksIeUxY9gmh8ynNQK0vbsU1VCwIuzKxqZNWU/GftS7yY6azYmBUcxX7RRDtko7dXlByFrehjQD
	gX7Xy+ZWh6gprxwvlW22grToSVDu4V9CrA6zeWXo40mty4Q9r/lH+QVw4dYqEIJXavMS3EcHFLp
	qNQOgnalPv15op5pE7QrzRKAV3BoInp/bIuc1LE+GKCYuoaWBCSbvoyi/pqqKhYEgVNpYMc=
X-Google-Smtp-Source: AGHT+IEKtjdpTnJY0pHOkHyY17F5eZfh/pv3Ws0S0izV1A/hKImrV6V7mxad+j8foWrLkSGBifk39Q==
X-Received: by 2002:a05:651c:211f:b0:2ff:a89b:4210 with SMTP id 38308e7fff4ca-3090379d3f6mr8412381fa.8.1739361423444;
        Wed, 12 Feb 2025 03:57:03 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de2baaf7sm19007711fa.81.2025.02.12.03.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 03:57:03 -0800 (PST)
Date: Wed, 12 Feb 2025 13:57:00 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vivek Puar <quic_vpuar@quicinc.com>
Cc: dbaryshkov@gmail.com, openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] linux-firmware: upgrade 20250109 -> 20250211
Message-ID: <mjolgpv57qoavutvrtvplojja7n5xbdavt4ftajsqthmdg6atj@k3skobhh6zua>
References: <20250211185151.995828-1-quic_vpuar@quicinc.com>
 <CAA8EJpr+ffQvF0DaA5YHS43=_goPtheRE8y9mLCDUfgFH9MiZg@mail.gmail.com>
 <a998340b-25e0-4459-a9a7-8e864f6f62c5@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a998340b-25e0-4459-a9a7-8e864f6f62c5@quicinc.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 11:57:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211227

On Wed, Feb 12, 2025 at 12:40:44PM +0530, Vivek Puar wrote:
> 
> On 2/12/2025 2:53 AM, Dmitry Baryshkov via lists.openembedded.org wrote:
> > On Tue, 11 Feb 2025 at 20:52, Vivek Puar<quic_vpuar@quicinc.com> wrote:
> > 
> > > License-Update: additional files
> > Not only "additional files", there is a new Qualcomm licence, which is
> > not caught by this patch, NAK
> > 
> > While taking care of the new Qualcomm licence, please also note new
> > ath*, qca and qcom/ firmware. Please extend corresponding split
> > packages.
> 
> 1) Now as qca firmware for WCN3950 chips comes from the RB1 firmware release
> through Linaro,
> 
> ��� a) so does it mean we will be adding "Firmware-qcom" to
> "*LICENSE:${PN}-qca*"?
> ��� b) or do we need to split� ${PN}-qca into multiple packages?
> ��� c) or the firmware needs to be added as separate package, for example:
> ${PN}-qca-wcn3950, but in this case how to exclude the firmware from
> ${PN}-qca?

If I haven't seen Git's index line in your email, I'd have questioned if
you are working on an older branch or just not up-to-date tip. However
your patch proves that you've seen the commit that was merged yesterday.
And as you've seen it, you could have noticed that Marc Ferland has
already split the qca package (and that change was comitted more than
two weeks ago).

> 2) ath11k depends on "*ath10k-license*", so is there any split or change
> required for the new QCA6698AQ firmware?

ath11k packages are already split. Please follow the established style.

> > > Signed-off-by: Vivek Puar<quic_vpuar@quicinc.com>
> > > Cc: Dmitry Baryshkov<dmitry.baryshkov@linaro.org>
> > > ---
> > >   ...{linux-firmware_20250109.bb => linux-firmware_20250211.bb} | 4 ++--
> > >   1 file changed, 2 insertions(+), 2 deletions(-)
> > >   rename meta/recipes-kernel/linux-firmware/{linux-firmware_20250109.bb => linux-firmware_20250211.bb} (99%)
> > > 
> > > diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20250211.bb
> > > similarity index 99%
> > > rename from meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb
> > > rename to meta/recipes-kernel/linux-firmware/linux-firmware_20250211.bb
> > > index b932300742..6cadf99d47 100644
> > > --- a/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb
> > > +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20250211.bb
> > > @@ -158,7 +158,7 @@ LIC_FILES_CHKSUM ="file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \ "
> > >   # WHENCE checksum is defined separately to ease overriding it if
> > >   # class-devupstream is selected.
> > > -WHENCE_CHKSUM  = "c90a25ccbd027eb8d61b2943ab68447c"
> > > +WHENCE_CHKSUM  = "65c2919e6511a0d348a009ac419375b7"
> > > 
> > >   # These are not common licenses, set NO_GENERIC_LICENSE for them
> > >   # so that the license files will be copied from fetched source
> > > @@ -247,7 +247,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
> > >   # Pin this to the 20220509 release, override this in local.conf
> > >   SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
> > > 
> > > -SRC_URI[sha256sum] = "a12cb38f4793394bf56c6702be29b6e4f09deca0714943bba98a492030651570"
> > > +SRC_URI[sha256sum] = "2de1345897bf839d532c5de0fdb348770ca2a5f4edfb21971582597abb45297d"
> > > 
> > >   inherit allarch
> Regards,
> Vivek
> > 

-- 
With best wishes
Dmitry

