Return-Path: <schnitzeltony@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 838B5ECAAD5
	for <webhook@archiver.kernel.org>; Sat,  3 Sep 2022 10:12:18 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web08.1679.1662199929889671952
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Sep 2022 03:12:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WLna2Bn8;
 spf=pass (domain: gmail.com, ip: 209.85.216.53,
 mailfrom: schnitzeltony@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id
 z9-20020a17090a468900b001ffff693b27so2904121pjf.2
        for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Sep 2022 03:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=ecxO7anq+AtxRuIXl1Je7XOTaDJ1w56NNQxMidgKFgQ=;
        b=WLna2Bn8w7xKOPcdY7ItzpPJgGE3rkhv9jmJhHnduI2d9K4xkcuszsPNZyEQoh552J
         c5Eb/cdr2ajmC+dZlb9IJuLAB37fkIWYKQSkxctQgleHPQXM7U/Qgk90+bl2SfJjIIyo
         O1715VuIcOebHKGxNDufD1voXinryTIryyKdPcyF7wf0flBJKM4bZoBrnAf64UUPTe06
         vOpYKnXR2za+z1+egzOTa3l7XSbOTtIB4GpUbwq7lO9oZ119YnkRK0O+L9O3RVcFD4qI
         X+OkaA1cL4qTb0v6M+hFlKGu58DvE4xcLu2zS0fpMPpWYKoHuVslXBKW/T0PJ09aixyQ
         lTHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=ecxO7anq+AtxRuIXl1Je7XOTaDJ1w56NNQxMidgKFgQ=;
        b=ARN0YM55kJPquNtZq+WIZVieJCBNYixUrOspNUQnaziay4aAc6WfyV8r+q3PAFzHGg
         CvwwR2Zx7z9TEghcmoyi3w1HEP0mRbxEVMfZSLdgjFdAzlvsxj2rDYOOpX+QFk2as5fi
         xY8g6+T8oQE5oizI7lbHOzO0WlHpfsOR9NyOKfyjeZG4AMeysJdu2F7ERHUJaMt73+3p
         zWI0AU7U3hHmRDC3tbIWCF5A5+ikEZGLXG59QSWnppexTBGw67BkCm5degob9flCiV72
         Tsfnh8iFtAjHWtLByXE7kBtKuCLepwqEouRIYHclX6W03hMsuO7DrM9voKk0ayxJO00a
         JmBg==
X-Gm-Message-State: ACgBeo32aOSRsN0AXc8xvDs+1d7PnFuo86TT61AILDWE8N/hh1YECjOR
	2MZpthmgyH/T50H/dFVNIZRttLncyOkhakjTeqk=
X-Google-Smtp-Source: 
 AA6agR7+HAyma1V+ZpiLJRIj4FpldOdsybrnO9WlepANDVgbixrHPhh6a9bmmfDmUtdrVj1F+HiB5iKCCxPvsIRmOFI=
X-Received: by 2002:a17:90a:868c:b0:1fd:cfe8:5511 with SMTP id
 p12-20020a17090a868c00b001fdcfe85511mr9086014pjn.174.1662199929313; Sat, 03
 Sep 2022 03:12:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220823153730.172962-1-ross.burton@arm.com>
In-Reply-To: <20220823153730.172962-1-ross.burton@arm.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Sat, 3 Sep 2022 12:11:57 +0200
Message-ID: 
 <CALbNGRSb4WGO5Dwb-kz6Xeoc5My5a6n0q=n2hm+sid2ZuwrZmA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libxml2: wrap xmllint to use the correct XML
 catalogues
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org, nd@arm.com,
	Steve Sakoman <steve@sakoman.com>, cordlandwehr@kde.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Sep 2022 10:12:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170268

Hi,

this is a major change on behaviour and causing trouble at least for
KDE's kdoctools. Am no expert but I guess kdoctools uses custom
catalogs. Worked around trouble in meta-qt5-extra (assume meta-kf5
will face same) by preferring bare xmllint [1].
Just a heads up - it is about to land in kirkstone - have no idea what
this patch fixes.

[1] https://github.com/schnitzeltony/meta-qt5-extra/blob/master/recipes-kde/kf5/tier2/kdoctools/files/0002-Prefer-bare-xmllint.patch


Andreas

On Tue, Aug 23, 2022 at 5:37 PM Ross Burton <ross.burton@arm.com> wrote:
>
> Install a wrapper around xmllint in native builds to set
> XML_CATALOG_FILES to the correct location of the XML catalogues, so that
> the callers of this script (like xmlto) don't need to do the same.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-core/libxml/libxml2_2.9.14.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-core/libxml/libxml2_2.9.14.bb b/meta/recipes-core/libxml/libxml2_2.9.14.bb
> index e58298d3b01..d803db86721 100644
> --- a/meta/recipes-core/libxml/libxml2_2.9.14.bb
> +++ b/meta/recipes-core/libxml/libxml2_2.9.14.bb
> @@ -109,6 +109,8 @@ do_install_ptest () {
>  do_install:append:class-native () {
>         # Docs are not needed in the native case
>         rm ${D}${datadir}/gtk-doc -rf
> +
> +       create_wrapper ${D}${bindir}/xmllint XML_CATALOG_FILES=${sysconfdir}/xml/catalog
>  }
>
>  BBCLASSEXTEND = "native nativesdk"
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#169715): https://lists.openembedded.org/g/openembedded-core/message/169715
> Mute This Topic: https://lists.openembedded.org/mt/93206851/3617609
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [schnitzeltony@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

