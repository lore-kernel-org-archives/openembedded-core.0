Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26B3CC433FE
	for <webhook@archiver.kernel.org>; Wed,  5 Oct 2022 06:02:13 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web09.20637.1664949724650968669
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 23:02:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=mbt/xRJv;
 spf=pass (domain: linaro.org, ip: 209.85.167.49,
 mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f49.google.com with SMTP id b2so13182205lfp.6
        for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 23:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=e9Kry82vA9iEjH4jmRmM6drU3jC7YzGAO5OfgDjRtYY=;
        b=mbt/xRJv1RjwONYIW+mRWwAnwDGlWymtq7UIeLrq/xR2Zez4izaXh8yml5EIOz3Vt6
         xj4Dp6avApewcWy7oYeDeWgR1Usu2xdVIhtB/+9N7nQeVotSvYDDkO+UaIITlpuoyjnO
         TBGDT3rBHq5Va/tkcAgqHeve2lH8+ZBdJA0RBsgsG0hfcLl3sZKbSFnNXKP+SZaR9ybK
         73oCcIwInhjYmH08K+CDbqMVtZCOO2sCyrSQsB0Rn2GcFXjZ7NRLHihoB700fDGWV0se
         uSEWWDED9VS7q2B7hJ1fl0tio0P8nWtZ6DszZTdTKarmacrYqHV64sVwoY9zGfIku1Zu
         05iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=e9Kry82vA9iEjH4jmRmM6drU3jC7YzGAO5OfgDjRtYY=;
        b=C+IvnWQlNFlHBgNRNcZe1k73IyrTuvxHjTTGgR18E6JqxTQIpF3psBoVvwn/jR9U3D
         OX0poI44GHO5QbT7Q+nBCVPs5N7M9xbGppuIcsAUo7qB2aUIuTZVNeoal0sjwCkKMl6M
         qCHP7eKBR/RjQpN9L3aSDydfkuJpMwgfM2IVdsUaf/a6uZVgMVZdq8aB8Qo6xodJotl5
         WcV1Ul2sNpSenYaxxA9go/5ze3zbwekscMZxzLpzL9G5UDdl1HXr3AHU1Iouj6OixWju
         YWv6SFwgUUhCHwpfB3YUzgiYLU8j4QaonTJHD22rvwUaKX1yE1XtiuKSD9NRqW2RiX/w
         +LEg==
X-Gm-Message-State: ACrzQf3Ka7Tn7NXrqEZdasKhOTjmoLqVxR1K4xiKkerj5PeWKfLiZtAO
	EN7RlAO17UiIEMR0kKK8AwIh+xawnA3ygQ==
X-Google-Smtp-Source: 
 AMsMyM5dau9I8cZTF5dJ7hrn52DHXOksgtkmMMcFQQvYhjoRrn6dwQ3axNO7etXKipGQG0UzABaiaw==
X-Received: by 2002:ac2:4a6b:0:b0:4a2:46f7:93f1 with SMTP id
 q11-20020ac24a6b000000b004a246f793f1mr4035548lfp.675.1664949722668;
        Tue, 04 Oct 2022 23:02:02 -0700 (PDT)
Received: from nuoska (dsl-olubng11-54f814-94.dhcp.inet.fi. [84.248.20.94])
        by smtp.gmail.com with ESMTPSA id
 f17-20020a056512229100b0049b58c51773sm2212692lfu.193.2022.10.04.23.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 23:02:02 -0700 (PDT)
Date: Wed, 5 Oct 2022 09:02:00 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2 3/5] u-boot: use openssl-native.bbclass
Message-ID: <Yz0d2F1PygnDspnK@nuoska>
References: <20221004152807.987313-1-mikko.rapeli@linaro.org>
 <20221004235719.0e2bd17b@booty>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221004235719.0e2bd17b@booty>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Oct 2022 06:02:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171443

Hi,

On Tue, Oct 04, 2022 at 11:57:19PM +0200, Luca Ceresoli wrote:
> Hello Mikko,
> 
> On Tue,  4 Oct 2022 18:28:07 +0300
> "Mikko Rapeli" <mikko.rapeli@linaro.org> wrote:
> 
> > It sets all environment variables correctly for openssl-native.
> > 
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> 
> I'm taking this patch for testing, however I have a question, see below.
> 
> > ---
> >  meta/recipes-bsp/u-boot/u-boot.inc | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
> > index f022aed732..cd9c578962 100644
> > --- a/meta/recipes-bsp/u-boot/u-boot.inc
> > +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> > @@ -17,7 +17,8 @@ PACKAGECONFIG ??= "openssl"
> >  # u-boot will compile its own tools during the build, with specific
> >  # configurations (aka when CONFIG_FIT_SIGNATURE is enabled) openssl is needed as
> >  # a host build dependency.
> > -PACKAGECONFIG[openssl] = ",,openssl-native"
> > +OPENSSL_INHERIT .= "${@bb.utils.contains('PACKAGECONFIG', 'openssl', 'openssl-native', '', d)}"
> 
> What is the reason to use '.=' and not just '=' here?

Hehe, it was in another example which was using conditional inheritance.

meta/recipes-support/gpgme/gpgme_1.18.0.bb

PYTHON_INHERIT .= "${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3native python3targetconfig', '', d)}"

I guess normal = assignment would work too. If that's preferred I can
send a v3.

Cheers,

-Mikko

