Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F02C5C43334
	for <webhook@archiver.kernel.org>; Fri, 15 Jul 2022 16:36:14 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.1348.1657902967783604827
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 09:36:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FMFZ19b9;
 spf=pass (domain: gmail.com, ip: 209.85.167.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id t1so8671812lft.8
        for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 09:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sGm2WR29ddG+7Jo4ggQmijlFTCqufkM4rtewZpPw5oU=;
        b=FMFZ19b9d9E6+fXo9DNRWx/jGD51ZNwCLHe+zOmthlrGcg0K/HZ9/zeDSwidq5Yo69
         RhGUL05FZEDw7oyOfTz0qmZthEfAcVcjWxt5rJkHpPJ/dba1w2N0uzNLXkY90/f9lVPw
         zczjZluUqHV8pVCQZshnLw4osiLFpYvasWX48FzaNZH76iDeWDlV12YJ7TkY94KcR29w
         LEAhRGfy3eYIYeVVO99FSICmwL7QuFmPSPh5UZKzgvOhvkb3e+CxrOCjoSxNr9hc+m+f
         SElej36RYlKJlRnle91z8Y8jiBPKrcV3YPernur5vlHsbf4Or+D5SGR6XwUUcX5Njt5N
         kY/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sGm2WR29ddG+7Jo4ggQmijlFTCqufkM4rtewZpPw5oU=;
        b=0Zdlq3DVJql4G/qEVqwChnIseG2kPWaEp7ChfxJp9VHIwAGzVG5P9TvvDRfxziksoh
         d9GQ/0GRroqzAcGbJKfz4LBsWY+Ypujm0tWUbKI1WNruA40zjl2BNsncmoy0bHn5zbfs
         RGUS3/LIAGeutTmbNEipUVhgfXjuSRUi9wuOPnC1jfBjFGRleNNjQLBnyIKvy0E4UZpO
         Y9GGgXAFyUne6wdYymH6ZCbAShAF1BzdGB6JGR7/EGiv0IK85kXshDEKY+03gPGoR1mE
         X8YXQeGcx7wZDuoqw2Uk/02IRQ1oyV6b5vEGBGaihPxJDZn/EQjO6nG6XpjpS+SLRxKs
         YTBg==
X-Gm-Message-State: AJIora+/OPwodKsAcDDnyV2QdjvwgNifvdg6JZd4ujDCe3zyoxK5JaC1
	jW/7vTc5hqEnP/pMDBcBMhgL858YAj1f3JsGJMM=
X-Google-Smtp-Source: 
 AGRyM1sZ/97lHZclA0TuBwRJW8/hcWBDesOcKK9XE1bgi8bMcmeeeNhSL5Umj+gTMspNlc+oGcXefhEZ40zILcx+8oo=
X-Received: by 2002:a05:6512:3996:b0:489:d526:93e5 with SMTP id
 j22-20020a056512399600b00489d52693e5mr8504917lfu.534.1657902966020; Fri, 15
 Jul 2022 09:36:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220706182329.3085564-1-alex@linutronix.de>
 <6ee630104deb0e90d99c9ecb0ce2dcad7212a4f0.camel@linuxfoundation.org>
 <CANNYZj9Xdk7+-miNQiKi7CBHpGk7X29oF8Miv2Sd2QbBbj6sTQ@mail.gmail.com>
 <0ba86b61ac08c9f8350aaaa622d0d59a740f5f40.camel@linuxfoundation.org>
In-Reply-To: 
 <0ba86b61ac08c9f8350aaaa622d0d59a740f5f40.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 15 Jul 2022 18:35:54 +0200
Message-ID: 
 <CANNYZj_ORdbrpssSTcA9ji_Or3cxAL7970mY9wQgBChuPMh7KQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] scripts/oe-setup-builddir: copy
 site.conf.sample out of template directories (if it exists)
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Jul 2022 16:36:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168126

On Fri, 15 Jul 2022 at 18:24, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> In that sense, it was something a user would provide, not something
> that would be provisioned by automated scripting. If there are settings
> to be provisioned by a layer, we have local.conf for that? Why do we
> need another file too?

Right, I'm ok with organizational proxies and servers going into
local.conf. Then site.conf.sample and local.conf.extended.sample
should be promoted in the banner when setting up from the meta-poky
template.

Alex

