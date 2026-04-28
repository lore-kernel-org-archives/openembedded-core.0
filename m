Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19773FF886F
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 06:57:08 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7249.1777359427094620111
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2026 23:57:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=jDO++hi3;
 spf=pass (domain: linaro.org, ip: 209.85.167.45, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a746f9c092so347581e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 23:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777359425; x=1777964225; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/tm1WvVWW1KEgolfWGhPzn7N9v3LpxPk9XuvHrGDSww=;
        b=jDO++hi3wZiMsiBiZWoIk2Oa/9Mw1bm9UN+U1mqdJp7T/H428mlcW/42TdE7Okyxfu
         iDsge5mvewp1n/+hZqD6ymXQdUXhP0ZiOUUuRZKu/5uZJFk67ibxcxoJxpnekFA2y9tW
         bC27lEFgM3Cxeoy7yOozIvx8844u8aFZkDyF59QIxQH9JhqK1GxuAw6hpq1zTPxqiMT3
         GTbH+sKv/j7sba6JJJd20wqQvSSiQCAKPBOj/npZFeQauQBnFQ2uAYiJpLN/duzLRvVN
         rwBzRaELcoFvcq25+1lfyHcfVxnrn0l4/AsbxbN/v2Ghpk5yiX/fY0awCWNNJWK1EIes
         7cRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777359425; x=1777964225;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/tm1WvVWW1KEgolfWGhPzn7N9v3LpxPk9XuvHrGDSww=;
        b=OqDbTtwSZxQJWvlJoaSkdqA1naWRRAFR0nuVyPgXkrQsneg9mftnDZGihf5bnffVdH
         el8LOr1q8aJjHyvA3ldUGr6ipInZEPYhcL2eg9+LLd7mVdxpOBoUDzGoK4p9t77iscch
         mb8qytv3QvKPP3QBE/vC0Uay5IZ4vBlMG2PBIHBbVE6jSsPqPHAjWBjPshL0AvfWAQdj
         3bs8ZpzUwkBnVhFiqTEnIGpf+tK3CklJgZRoGsSvdLt3+AUoG9y0VPpczedjOdUXDvh2
         LaGGYGoWBhFYvVsFpLZLjdMWQs7Y3SiBePM/gu7Lzi4+GBTeY3dXGTqOuzFXh7sITlKA
         uY4w==
X-Gm-Message-State: AOJu0YxXMGEJxYQ0TrYFzZUck1VF4vKI8dNZ6pf+oJynyRpP4Zc/CahL
	pwyy70wBlwC8UaH91/KJjo8TKs4p+4QSQy81mzRHAZURrDIKz5vKGWVyQy3NEliYO+o=
X-Gm-Gg: AeBDiet+BArXIehou2aOKvJneipNNFX3NmYlqSMeVicC9JGxPKpQT6+P4xb0WI26mc8
	QeqsdxTIc1i/TBy6CogqtzlTcTNDUe1AnvK7Ua0PNHiNQS0otqdEFV5eR7oEH15ch0IFnEyiGtZ
	rLDJLySQHq8B7G2VWHK0YHLPMHhUpgHZJZsFRGj8v4AeCSEmuma6tLJGsN5yBgbAJxbr6l8rAYO
	gB5gCe5kuqLruTCKIosMT641Vx1MPxH58kG3ym8QlV8TsjcFl5872BzLaGfvpqFa5Lku2X2C2zV
	UjZbiKzhl/ZHADyPFmGyNtjqOpehB/z/FFRpQ88mfmvCkIBs39yylrFjEAESlzA1qBCuACkzmSo
	BvR719R9935o3PlQIeGU3mH5X+RU1HiCKrxGK9mm84ecj16Ut+OUK0o+1dtAiIiM5ouuxOU81VR
	dQd3zzNa4IM3g+PGR0CMqPaBrKGPm6WJRvjfOGrKB4DTFhfCmZHXTnn9yrJVmGEw==
X-Received: by 2002:a05:6512:3090:b0:5a4:505:f63c with SMTP id 2adb3069b0e04-5a746666d0emr615076e87.11.1777359424861;
        Mon, 27 Apr 2026 23:57:04 -0700 (PDT)
Received: from nuoska (78-27-71-225.bb.dnainternet.fi. [78.27.71.225])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a74640af3asm376546e87.74.2026.04.27.23.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 23:57:04 -0700 (PDT)
Date: Tue, 28 Apr 2026 09:57:02 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [scarthgap][PATCH 2/2] ghostscript: fix build with gcc-15 on host
Message-ID: <afBaPjcuxdcaXR-0@nuoska>
References: <20260428064329.1591381-1-mikko.rapeli@linaro.org>
 <20260428064329.1591381-2-mikko.rapeli@linaro.org>
 <CA+chaQfN=O1YD0C03ZL-gKLzG+B7sHXzJ4Sx-eLfY5Q3CyEOGg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+chaQfN=O1YD0C03ZL-gKLzG+B7sHXzJ4Sx-eLfY5Q3CyEOGg@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2026 06:57:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236040

Hi,

On Tue, Apr 28, 2026 at 08:52:37AM +0200, Martin Jansa wrote:
> On Tue, Apr 28, 2026 at 8:46 AM Mikko Rapeli <mikko.rapeli@linaro.org> wrote:
> >
> > From: Martin Jansa <martin.jansa@gmail.com>
> >
> > (From OE-Core rev: 02e282f6417274a93c6f01978bf33e2d171297b0)
> >
> > Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > ---
> >  ...Fix-compatibility-with-C23-compilers.patch | 67 +++++++++++++++++++
> >  .../ghostscript/ghostscript_10.05.1.bb        |  4 +-
> >  2 files changed, 68 insertions(+), 3 deletions(-)
> >  create mode 100644 meta/recipes-extended/ghostscript/ghostscript/0001-Bug-708160-Fix-compatibility-with-C23-compilers.patch
> ...
> > diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb b/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb
> > index 57a1098521..8f132d55c6 100644
> > --- a/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb
> > +++ b/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb
> > @@ -25,9 +25,7 @@ def gs_verdir(v):
> >  SRC_URI = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs${@gs_verdir("${PV}")}/${BPN}-${PV}.tar.gz \
> >             file://ghostscript-9.16-Werror-return-type.patch \
> >             file://avoid-host-contamination.patch \
> > -           file://CVE-2025-59798.patch \
> > -           file://CVE-2025-59799.patch \
> > -           file://CVE-2025-59800.patch \
> > +           file://0001-Bug-708160-Fix-compatibility-with-C23-compilers.patch \
> >             "
> 
> This part doesn't look right, did you remove CVE patches by accident
> when resolving conflict?

Thanks! Completely wrong conflict resolution. Need more coffee...

Cheers,

-Mikko

