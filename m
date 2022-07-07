Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D7B2C43334
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 10:40:14 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.3992.1657190409802182920
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 03:40:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ABBBIxLM;
 spf=pass (domain: gmail.com, ip: 209.85.167.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id t25so30364747lfg.7
        for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 03:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9b0j3F3BmMJQjnCHx/nzbGYISeZWiUbATxa1i2tPLgo=;
        b=ABBBIxLMMNvdUXDDuod5ZTzBtVnPMF/UJMMtvatmpywSeXexmr5O/zpx+znp/jTgKK
         CKtaSbduH6dvZpHVTkuJsGxasv8cNXQ4MGfv2d2NChRs4lP5dgfofR3ZTsyMSDAtGU4r
         Qfq12GaRaL7pVLo/o7KRfv0QzBqben/34w3RK5AjN5wjWkGOaZjaw7VT2oSta2gNR3Zs
         0XuQ40x7Ai6aj8eUKGFdHYcRKNSsOgbLjrIWsa3AOwtkcINzV2MYogWBvsGVbg74dY/u
         vsdhpYJ5KBPnozlyeYhFHj27J4LHpsAvZvo5t5BSCBdZcX9pi3+ZA8foDyyKjLiU12Q8
         dSDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9b0j3F3BmMJQjnCHx/nzbGYISeZWiUbATxa1i2tPLgo=;
        b=V+jmMvAU9cw3/z4cb1IE21PESlv1dNevhLHJZnR0qFxAkhrKY7tCRZngAx1+KyuIO6
         FgJpsO+98wkyGHhk3xR3LdlJxj6/wIpQ+Qv+FIHeL+VgcfZIBOAIgEBBe2R1ZS68Ld06
         4yo8kPxwLaaddA5z/SMIJjZw56lyvWaR+kCueL0s1H3eqPkzvWeWuaHMpLRw5axdE7iS
         CDVG0hQ1RK5I84WniAdbzUkCnW8errT4gnf7b0xcJaBo0qKuS0QfGwCPPEsBS/g3dxHF
         0YyZzONBC57FWQEdJkvkHVMn+ZYiMgySXy5sK5Ld+1d2T79yPN1f0HyTOPlMSY1uBrXU
         gbSw==
X-Gm-Message-State: AJIora+CFKlkX47UnnURjLPQN3sOnulpk/qQ1uzdttixpvrmr1XDoxui
	XXjZ/i6EDL0bZ7kssg3POsinRH/jruN+mVA3kDE=
X-Google-Smtp-Source: 
 AGRyM1uI7wxYcWhHzsJdZrrm1naYRZN0sEbLzPUyVumlMmXBsR3QBLWH0+4WlPOKvGkNNZAJTZbSqYsUtn8O2EmhLjg=
X-Received: by 2002:a05:6512:13a4:b0:479:3b9f:f13c with SMTP id
 p36-20020a05651213a400b004793b9ff13cmr29327479lfa.380.1657190407732; Thu, 07
 Jul 2022 03:40:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220706195311.974830-1-JPEWhacker@gmail.com>
 <CAA2FC7D-8003-431C-B856-B8DE9DCDC202@arm.com>
 <CANNYZj-tF-QYoJ2U-V-PgJJXfAWbRDmELLBziUrq40SzXi5LwQ@mail.gmail.com>
 <639E7961-BBE7-42D1-952E-FFCABEFB2655@arm.com>
In-Reply-To: <639E7961-BBE7-42D1-952E-FFCABEFB2655@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 7 Jul 2022 12:39:56 +0200
Message-ID: 
 <CANNYZj-nwwT2EsrgSS2+X1RQ_RcOuv-iL181PWz0ys2TeYiffA@mail.gmail.com>
Subject: Re: [OE-core][RFC] Layer Setup JSON schema and example
To: Ross Burton <Ross.Burton@arm.com>
Cc: "JPEWhacker@gmail.com" <JPEWhacker@gmail.com>,
	"openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Jul 2022 10:40:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167769

On Thu, 7 Jul 2022 at 12:36, Ross Burton <Ross.Burton@arm.com> wrote:
> > Wait, how is YAML more readable, if JSON is valid YAML?
>
> But YAML is not valid JSON, and YAML is the one which can be readable, unlike JSON.

YAML is also not an included python battery, while JSON is. I'll stick
with JSON for now, if you provide specific examples of how the JSON
that we're defining would look more readable rendered in YAML, that
would be appreciated.

Alex

