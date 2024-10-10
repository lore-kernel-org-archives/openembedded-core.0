Return-Path: <ricardo@foundries.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1B19CF11FE
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 15:22:20 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.46324.1728573734660562486
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 08:22:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries.io header.s=google header.b=VMmdqwqg;
 spf=pass (domain: foundries.io, ip: 209.85.208.179, mailfrom: ricardo@foundries.io)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2fac63abf63so11062591fa.1
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 08:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google; t=1728573733; x=1729178533; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j3bWI3R/HhPN7YuO9AMl01069X3un60cIoY1gwymzhc=;
        b=VMmdqwqgJt65vcOIcHsnXwaDn/CdyAeIshxgN3LTz/umQiO1vsANOachuEgEGEbEPn
         fRp7kD+BMulcd6xAhAXiu9L0wxYOyAi8tq8hpwO5hD41SwF3t7cTvSTNaNWqXulTTw+n
         Dc0QTbEaDpZTT2q6fRGP1KLacntqJ69lBs/L69szyVPGDwc7NJuf4YyWw6agL+1HYw9N
         4U6+goR5NvXi7ExGa5wcKFMnZpmJS5HN1MaZEHMyB+9PXtDxv4yvAjwJbNzfNajBBzix
         uXLN5YOCv87lyEdWAiKIOiscE0Ei/eu6BnDRpec9rFDPH3gIaB9di5UGu8kiXyrOQLjT
         niEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728573733; x=1729178533;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j3bWI3R/HhPN7YuO9AMl01069X3un60cIoY1gwymzhc=;
        b=n36/IBaArrFuZyPCNfR37LMzYgVtE+U3lL8ezd7XSy6CKyYB1d0LXql4zUMPLlmaQP
         UR8dNU7+j+8biePErAcLC0bU6FdpPnW2BZzZIFnibjQtSTo2HLxwG/nDkiT1Grx3nmsW
         NtZ/k53yVX/ohTO5HzzqYdYyQ2iW7sxBCaBv0kN5NZhcgj34fQUGVZbUIEDuKx6KENTJ
         EDII0Lk/yDFSb9oPZu91LgI7ZXfOLbmcSFRrrtk5Noxf0jSlP6+Djjl17JnYGHnQvHVO
         8emV6OhoKlPIqqSnvbplMQaR7N3B8inbjOtcVd5Y8lbP7yBw1hbbmIZIMtNUDTWu6jdI
         VTCQ==
X-Gm-Message-State: AOJu0YxgSn5jis9CMii/5Bp0gMfBNhF9mE3l5bu5YcW7DGx+i9FuC/fr
	hm8qbSJkLnZFYrABJak+bLathPT8ND95gwTAqS8qPzTiiitXQqh5SUSfYxoiU+ZGHvGiatTfgfK
	5xWNZklLWySy7RtS3CTg4NyWGRAqzIpIpHkU7
X-Google-Smtp-Source: AGHT+IFn44IhYOwqKB99CvKC0PTx1/pJpjFbW4DjnbAhHyOTnXOX+t9AL4bM00IfeuxrAWgZbZ89Is1tpvVCGPQqVTw=
X-Received: by 2002:a05:651c:547:b0:2fa:e4ae:3342 with SMTP id
 38308e7fff4ca-2fb1872be3cmr45878081fa.12.1728573732637; Thu, 10 Oct 2024
 08:22:12 -0700 (PDT)
MIME-Version: 1.0
References: <20241009112634.402123-1-mikko.rapeli@linaro.org>
 <20241009112634.402123-2-mikko.rapeli@linaro.org> <CAAaKDhFczX1CosfjUj-vBOjcHyBt77XGZks+LAKJSr2SamXHNw@mail.gmail.com>
 <ZweZMcmlcxBHo5JB@nuoska>
In-Reply-To: <ZweZMcmlcxBHo5JB@nuoska>
From: Ricardo Salveti <ricardo@foundries.io>
Date: Thu, 10 Oct 2024 12:21:36 -0300
Message-ID: <CAAaKDhGM=nVat2=PgAfGNOwKKyfrRvrLJKniz4Gaf8SfAbQshA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v6 1/8] uki.bbclass: add class for building
 Unified Kernel Images (UKI)
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-core@lists.openembedded.org, 
	Michelle Lin <michelle.linto91@gmail.com>, Erik Schilling <erik.schilling@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 15:22:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205407

On Thu, Oct 10, 2024 at 6:07=E2=80=AFAM Mikko Rapeli <mikko.rapeli@linaro.o=
rg> wrote:
>
> Hi,
>
> On Wed, Oct 09, 2024 at 04:53:58PM -0300, Ricardo Salveti wrote:
> > Wouldn't it be better if this was a kernel class instead, similar to
> > how it is done with fitimage (via kernel-fitimage.bbclass)?
> >
> > I see a lot of similarities here, and it is confusing that one is done
> > as a kernel class and the other is added by including in the image
> > recipe instead.
>
> Interesting idea. I'll have a look. Maybe this could be an improvement
> on top of the uki.bbclass.

Yes, the current patch set seems to be quite functional and we can
work based on it.

> UKI combines kernel, initramfs image etc
> so the implementation can be an image class, kernel class or some
> magic post processing (e.g. wic) but needs to be generated using
> systemd tooling. Thus I think image class it is for now. I agree
> that setting this up is not nice. Need to configure initrd, kernel
> command line, kernel, systemd-boot etc and all the config switches
> are independent. At least the selftests will contain a fully
> working example so users can replicate that in their builds.

Right, for fitimage we have a similar build dependency chain, and why
I was wondering if it could be also made available via a kernel-class.

Thanks,
--=20
Ricardo Salveti

