Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF157C64EC4
	for <webhook@archiver.kernel.org>; Wed,  8 Mar 2023 08:44:09 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.2519.1678265045065927282
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Mar 2023 00:44:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Q8eKvzKK;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id d36so17200567lfv.8
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 00:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678265043;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yMzRxeyabZIkoyvAK+5SGql0Oxhq5rY8nvsUzjeKBPw=;
        b=Q8eKvzKKinUw+7UAybg4pygqdzxkDjFoNcDOTntPjbVXBg+hkYGa0C3KQW2/I02Bf9
         xrfk6aVDg+aWQp0gnggioM0JnIUTThN0pppbObCTSVrec4PryTSkolZRxxIXmoB/T6zD
         jDwgiGgsMRtaNLzUH2Lqu3Pr3eSRyqCiZuRaDXViToXGAjvx8yK4fZQBvesX0XbaTUFT
         YTuzaVk49rb50ctw8J02V2pE7mP/1Lkvr7r3culyqLHQxMp84yDXWCQeB4mvB3bZI0sN
         6LosY1/hPLKwaklSzQQjsyeRNDHsqDHAh54oygS7vYa+6ma6bOih7OQufKem97WaE4+8
         TwrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678265043;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yMzRxeyabZIkoyvAK+5SGql0Oxhq5rY8nvsUzjeKBPw=;
        b=KZSf55pRZuom//58416qFO/n4HUhYvyK6tDctBJSAcEgpaHY3McvfpTLg4DOrejdbF
         18O+xgSLC/ALZWTvuLkklj2GZyIx/ILeL4Chz4BFRZSEhCIGTh7hFHFVFmS+lOkBie9q
         1SO4UVzRZbeh7PZ8SVUAS4s3UCjguO6v5O5miAM33iqqAzRGbAn1XzHgQXdARG5hWD3F
         6kFSrRg22AUAQvInLUjx0DVT6qMxNYsSm9y9ylZRWvmAIHQEd0sjluZXIUaXN8FIeH7F
         e7PH5+Oysp7YyXF2whbHqTaLSzWEGhcm+zc616mJXLe2ohIpoHhxRSNea0osh+Rw3eat
         iw1w==
X-Gm-Message-State: AO0yUKWHajKIAe1Pzs7II8c3S8wIcNsMOVQb1GeSEPlGD96DhSguYHzh
	SsJNVYU6zZ9AHMfQiOOjcxWRkerdia9kjaD0iO0=
X-Google-Smtp-Source: AK7set9RihfHUfZIMxsRRS/GUxBe0rlT/2yR/lmPt4IQRZdMIIUAreV+G53NaRdDp3xTneZUlsDhUw2IU61nLIaTaGw=
X-Received: by 2002:ac2:44d1:0:b0:4db:1999:67a3 with SMTP id
 d17-20020ac244d1000000b004db199967a3mr5251992lfm.13.1678265043207; Wed, 08
 Mar 2023 00:44:03 -0800 (PST)
MIME-Version: 1.0
References: <1678239619-21210-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1678239619-21210-1-git-send-email-wangmy@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 8 Mar 2023 09:43:51 +0100
Message-ID: <CANNYZj8ke6cTdbiKNnZ9jywzxE59BpVYpajCzkJA0J0fvs8JHg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V2 1/5] dhcpcd: Fix install conflict when enable multilib.
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 08:44:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178156

But what is the use case for installing two sets of documentation? Is
it really something that needs to be fixed, or can you simply install
just one of the two packages?

Alex

On Wed, 8 Mar 2023 at 02:40, wangmy <wangmy@fujitsu.com> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Error: Transaction test error:
>    file /usr/share/man/man8/dhcpcd.8 conflicts between attempted installs of dhcpcd-doc-9.4.1-r0.cortexa57 and lib32-dhcpcd-doc-9.4.1-r0.armv7ahf_neon
>
> The differences between the two files are as follows:
> @@ -821,7 +821,7 @@
>  If you always use the same options, put them here.
>  .It Pa /usr/libexec/dhcpcd-run-hooks
>  Bourne shell script that is run to configure or de-configure an interface.
> -.It Pa /usr/lib64/dhcpcd/dev
> +.It Pa /usr/lib/dhcpcd/dev
>  Linux
>  .Pa /dev
>  management modules.
>
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.1.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.1.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.1.bb
> index 39e689d2f6..03dbf31b35 100644
> --- a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.1.bb
> +++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.1.bb
> @@ -62,3 +62,6 @@ do_install:append () {
>  }
>
>  FILES:${PN}-dbg += "${libdir}/dhcpcd/dev/.debug"
> +
> +inherit multilib_script
> +MULTILIB_SCRIPTS = "${PN}-doc:${datadir}/man/man8/dhcpcd.8"
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#178147): https://lists.openembedded.org/g/openembedded-core/message/178147
> Mute This Topic: https://lists.openembedded.org/mt/97464365/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

