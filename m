Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD4D4C433EF
	for <webhook@archiver.kernel.org>; Fri, 22 Jul 2022 14:55:26 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web08.8616.1658501725064613901
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Jul 2022 07:55:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=d5ts9z2C;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id h18so3602968qvr.12
        for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Jul 2022 07:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TnOskD8k4cJHTAOwO8bz+iy47Bj/V1hxAHumOn87kxc=;
        b=d5ts9z2C4G20jhBApR/SMEOQlmQIHOq1y9+5GIaZBabY04veQ4vNIsQzwtn7bkKdhB
         S05B5dB/MEZVaw/GLiY6OaADew1fe9ZZheIDi1v56HPQpmZPVYeuQFtkONndmwiNYFHn
         OJjG52endL522pKx/qZ0ccw5O2krAAnWSWH5WY9uOnCz5aw5ohKqzp985RJmSRT+sxMS
         Gcm3ID4v5NMu/d6AlNZ43uMmz0Sj1dm4eo879CeVyUQOFNOtuRn+UxklyHCzhkK9Gr5C
         /s8/nUxvBG1yew4yqOGATJ4Jchu+cOyw/JmBa0tyssJKic1Nn9S9elqVAxSBG0RSThKf
         b9Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TnOskD8k4cJHTAOwO8bz+iy47Bj/V1hxAHumOn87kxc=;
        b=P8sd2TR59IkGikIgg7rguRwtdhZoj/urnJJ1s6j/JbiFChUUIOkOfEX38BerWu9oZH
         qP5cVJeLhBNDx1jRrrgBu4yy1G1kHy6sDGkoczC6V33IGRSJmoqs65022ulcB6yogOif
         UcCB6X15aC2JYQyFem1qNy0dmc7rH+KAbIttVBm8ln4JqprLrFYa2+iLPxIy6XjMJwbQ
         SXS3j1tA+5xI/NZ+vKIrRbZnwWltZId/O7DJ2GmUyW7xwwAU3u6F9beb/ChytfCMgZfu
         nD15r9pW8hSQETuG/VdZ7j/zg/TDgYUMwpTzO8YikqQlET6XBeQSKh3rEsVmz8220v0t
         On8A==
X-Gm-Message-State: AJIora8KB3mZwv6PFNteNqienK0xbsFyzgoUtnyfTWy8GttmSznEhZ3U
	zuImxtUBoi/8mAivpuwdL6lWTxaJK7/Y9q8LBvA=
X-Google-Smtp-Source: 
 AGRyM1uBlb+cbbjtTPPkT3e4FBLMSmrvcuF2gRRG2cWizBSw7mDLI0qC/hUYXx3u6IUgrAncwkENUJAZDjDH+39Ub/o=
X-Received: by 2002:ad4:5bea:0:b0:473:301:3859 with SMTP id
 k10-20020ad45bea000000b0047303013859mr452218qvc.16.1658501724121; Fri, 22 Jul
 2022 07:55:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220722111336.2143770-1-ross.burton@arm.com>
In-Reply-To: <20220722111336.2143770-1-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 22 Jul 2022 10:54:57 -0400
Message-ID: 
 <CAMKF1sqpH1MfeVVuY_GDegP8wNnKsXJNEfsaFdU2oxboZhT0Fg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] zstd: do verbose builds
To: Ross Burton <ross.burton@arm.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Jul 2022 14:55:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168413

On Fri, Jul 22, 2022 at 7:13 AM Ross Burton <ross.burton@arm.com> wrote:
>
> Set V=1 so that the compile log is useful when things go wrong.
>

verbose logs do add to build time, usually when build fails the error
parts are good with dumping error and
compiler cmdline, is that not the case here ?

> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-extended/zstd/zstd_1.5.2.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-extended/zstd/zstd_1.5.2.bb b/meta/recipes-extended/zstd/zstd_1.5.2.bb
> index 3887f31ecfa..2a638eb4269 100644
> --- a/meta/recipes-extended/zstd/zstd_1.5.2.bb
> +++ b/meta/recipes-extended/zstd/zstd_1.5.2.bb
> @@ -26,6 +26,8 @@ PACKAGECONFIG[zlib] = "HAVE_ZLIB=1,HAVE_ZLIB=0,zlib"
>  # See programs/README.md for how to use this
>  ZSTD_LEGACY_SUPPORT ??= "4"
>
> +EXTRA_OEMAKE += "V=1"
> +
>  do_compile () {
>      oe_runmake ${PACKAGECONFIG_CONFARGS} ZSTD_LEGACY_SUPPORT=${ZSTD_LEGACY_SUPPORT}
>      oe_runmake ${PACKAGECONFIG_CONFARGS} ZSTD_LEGACY_SUPPORT=${ZSTD_LEGACY_SUPPORT} -C contrib/pzstd
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#168402): https://lists.openembedded.org/g/openembedded-core/message/168402
> Mute This Topic: https://lists.openembedded.org/mt/92545058/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

