Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51D7DCDB465
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 09:13:39 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.23525.1697706815290254596
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Oct 2023 02:13:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=VLbObkIY;
 spf=pass (domain: linaro.org, ip: 209.85.167.50, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-507c8316abcso2101420e87.1
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 02:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697706813; x=1698311613; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wMiwcFhrWSgDxSo9+qkLHZ77vaj8ys+SmcvhofhJ45I=;
        b=VLbObkIYA+P+QGXoByWjyDfaUElx0FpYGdUBh4kkj2P5t5ME2GqBpC+Nr+XFsc5V9W
         3ijci1Ei/jd1KS7GYiCXcmfU8zdBz4CtNKrfWS4jLpju4N7xh/j9SrwLwieBwP+ongoN
         7jXWT+iNbeO+hKKTObMZo3kKQt1u5UQup/GbLvQLiInw2H/M80vflrezP2BWZL8Lm2bf
         e0a55FLI7DYj7g1YT1DACCb7GwqXnZFMPZUAfx6OFT7hXTcmDJXgpxZcgb/O92YcsbXB
         RTWWk3hy+NgAqwlvgvnKmr0BFN1iYTqARUzEsBuomDFTLs8egnvbMQj4H221qFBUx/cd
         hfvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697706813; x=1698311613;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wMiwcFhrWSgDxSo9+qkLHZ77vaj8ys+SmcvhofhJ45I=;
        b=AxkcZVVkqzzNScl3vzccydTH1Z4iXQ0paqy7OrmfukNrkhmP2mTxI33TJBHBqUW1Qx
         KVdw879sQfkt1HdIAljcLpYJJFBJdN9TZadidrqutGse9Xldj2H20Vu2QHjzmfT0nlhg
         qwDwTT41Ebldljay4IHzor4QZKQw3e/UVSHzm7ycX+gZj7CvV+4ypXHDsNksyK8B5kVp
         a8DwU7BbuEHfIKJAGZARtqqq+ZXNu/tBvasfxKQBKxvs+6r86ZLM7/eIYr8Y+5MhGXsV
         NiIaNj8Da/AO5b9jCmo2VGYgz0XsS9slhC2QbZvFdfVn+2se+jvIHSAxgMIha6lSAGvf
         piWg==
X-Gm-Message-State: AOJu0YyYzvt+TPcsTxA8yDePi5E0b5D2qiZWhGshHXoVBy3Vd/Dp7Pa8
	LVki6GYuFRnlGONW4i9Aothktg==
X-Google-Smtp-Source: AGHT+IGqBqSIzZtjJxdi6gQzpwmPQJ3+lygzhyj6JeL7dO/FQ8yTRdXBVCvbIxab+CdDqssCU8wxUQ==
X-Received: by 2002:a05:6512:52f:b0:507:a8ed:ee0b with SMTP id o15-20020a056512052f00b00507a8edee0bmr1084705lfc.65.1697706812917;
        Thu, 19 Oct 2023 02:13:32 -0700 (PDT)
Received: from nuoska (dsl-olubng11-54f814-94.dhcp.inet.fi. [84.248.20.94])
        by smtp.gmail.com with ESMTPSA id dw7-20020a0565122c8700b005079691360csm1029148lfb.49.2023.10.19.02.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 02:13:32 -0700 (PDT)
Date: Thu, 19 Oct 2023 12:13:30 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] cve-check.bbclass: support embedded SW
 components with different version number
Message-ID: <ZTDzOs9PFGJUmIRG@nuoska>
References: <20231016070106.2772303-1-mikko.rapeli@linaro.org>
 <CAApg2=SGxxCJ1yuXoMD6=ySRsL-Z2=rENw6xxn-dpQZ-Ta+4rA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAApg2=SGxxCJ1yuXoMD6=ySRsL-Z2=rENw6xxn-dpQZ-Ta+4rA@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 09:13:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189437

Hi,

On Thu, Oct 19, 2023 at 10:19:53AM +0200, Marta Rybczynska wrote:
> On Mon, Oct 16, 2023 at 9:01 AM Mikko Rapeli <mikko.rapeli@linaro.org> wrote:
> >
> > Many recipes embed other SW components. The name and version of the
> > embedded SW component differs from the main recipe. To detect CVEs in the
> > embedded SW component, it needs to be added to CVE_PRODUCT list using
> > name of the SW product in CVE database or with "vendor:product" syntax.
> > Then the version of the embedded SW component can be set using
> > CVE_VERSION_product variable.
> >
> > For example in meta-arm, trusted-firmware-a embeds mbed_tls SW component.
> > Thus trusted-firmware-a can add CVE_PRODUCT for it since CVE database
> > uses product name "mbed_tls":
> >
> > CVE_PRODUCT += "mbed_tls"
> >
> > and set the version of mbed_tls:
> >
> > CVE_VERSION_mbed_tls = "2.28.4"
> >
> > (Real patches for both are a bit more complex due to conditional build
> > enabling mbed_tls support and due to mbed_tls version being set in an
> > .inc file.)
> >
> 
> I like the support for embedded software. In this approach, I'm wondering
> how it would work for packages like curl that have multiple CPEs. Would we
> need  to duplicate the list of CPEs?

The current approach of listing multiple CPEs in CVE_PRODUCT still works.
It's just possible to include a different version for an entry in CVE_PRODUCT
via CVE_VERSION_swcomponent variable. It will fall back to PV.
 
> There are layers/recipes where we have a very long list of embedded components,
> meta-zephyr is probably the best example.

Yes, I think this embedding of SW components is very common. I think some of the
LICENSE data does reflect this but not in all cases.

Cheers,

-Mikko

