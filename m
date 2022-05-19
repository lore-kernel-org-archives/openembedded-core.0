Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8215FC433F5
	for <webhook@archiver.kernel.org>; Thu, 19 May 2022 20:00:17 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web11.365.1652990407901209198
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 May 2022 13:00:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OTdI4lOP;
 spf=pass (domain: gmail.com, ip: 209.85.208.177,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id e4so6912134ljb.13
        for <openembedded-core@lists.openembedded.org>;
 Thu, 19 May 2022 13:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+zrKoYDttfkkpwtsBMN714I5Y26mHKYqouhTSgwvZmU=;
        b=OTdI4lOPZ0A0G1U17qh4iGqofsqm+VNr5CVD8PmtxUtEJfBdEGxJH9FwIqJV5DdRO6
         3leHEAqGRlD0rPrzB9fDORjhLIUbVvvLFOXD22OkWhLCl+T8au4TyJXUDmRWlQh/fVOe
         K81YgXtGoHs/zQo1ul+ypGVGQp2DwpPpZP37L2W9GAAhqH4shFhkyodnDmqmXR265gqY
         d8oLsw3sZmNOG8kUbgIoB4wORbsNYlc2WK9Wy7ALVDnIidVEqrrvpKU4aoUQFzpVUR3k
         dj0kuebgNni7C76WFQpxje3mKBG9Psv35f3aUDKziQ036nYmP49AW9JVMndgN494pHE/
         TEbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+zrKoYDttfkkpwtsBMN714I5Y26mHKYqouhTSgwvZmU=;
        b=WaF/jPQNL9JWu8kAEuRxm0GM/jzE8oY7vau+CLH5x1gkcluotK7ERVOIdlaCSIZxDe
         R68yqReTzZcnQjhzvSMHBr3yrFLgKuNsx2OA/rkLXAwtaMs2G7pV+2Ji2b0zq7NgwK+U
         9f9xrp0kRzJXCutS4jHUcOzO4kQTHk3oRZQjcz2tJz+e8355TGD/SFAhQ8YtKfxg/7Q6
         3x5ehXuskEIFy023Ysdhxh9wc13EX4s9bnq4x8V+1O6I5ssXTnG2doB4lxf3vgptP2eR
         GaKCEA9cgq7Ttbi9i3b2jHeeZkxJ2zJuSeMAPwDoPvev6DyNUxOCv2GPMTJva8uSFdKq
         vzYg==
X-Gm-Message-State: AOAM531MTQhRMfWVkyEG4SQqPFTL16KKmOpKK6vJvmMovRlQewbBPGCl
	aupXG1ntiT2k9aZKmQf3QTkSoZ0ryESpkqoSvVo=
X-Google-Smtp-Source: 
 ABdhPJx3jHUstv+OkS9N69DB6y9q6niD5xHAjRPU6phZIBNGV+bcq0Vi1Pt3E8jCtbFMCbJrb3LfIIKfK+O5ht6VXuU=
X-Received: by 2002:a2e:9410:0:b0:253:c996:59fd with SMTP id
 i16-20020a2e9410000000b00253c99659fdmr3611335ljh.41.1652990404901; Thu, 19
 May 2022 13:00:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220519064312.391164-1-f_l_k@t-online.de>
 <20220519184315.1e91b017@melee>
 <CANNYZj8xWvRMVGjo1qaV0Gah0U9a42SqyFf=C9bZ64DTh8qZuQ@mail.gmail.com>
 <d9dedcbf-0e79-2333-91d1-7938f4fb3865@t-online.de>
In-Reply-To: <d9dedcbf-0e79-2333-91d1-7938f4fb3865@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 19 May 2022 21:59:53 +0200
Message-ID: 
 <CANNYZj8eCxa+4xn_F=h608DjJsSep+gxv3CMqMvSwWWGgpZBXw@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][RFC PATCH 1/2] libdecor: initial add recipe
To: Markus Volk <f_l_k@t-online.de>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 May 2022 20:00:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165910

If it is in core, there should be something in core that consumes and
makes use of it, and preferably automated tests for it. Is this the
case? Shall weston enable it by default then?

Alex

On Thu, 19 May 2022 at 21:43, Markus Volk <f_l_k@t-online.de> wrote:
>
> It doesn't need to be in core, but i would call having window decoration a core component
> because otherwise things will just not work as expected for weston/gnome-shell. I could also
> send that recipe to meta-oe if you prefer or just store it in meta-wayland since its wayland related stuff but
> if you aim to support libsdl in a proper way this recipe should be around somewhere i think.
> Personally i prefer sway. It has server side decoration and there is no need for libdecor.
>
> Markus
>
>  Am 19.05.22 um 18:46 schrieb Alexander Kanavin:
>
> Also, does this need to be in core (as opposed to meta-oe)? Why?
>
> Alex
>
> On Thu, 19 May 2022 at 18:43, Luca Ceresoli via lists.openembedded.org
> <luca.ceresoli=bootlin.com@lists.openembedded.org> wrote:
>
> Hi Markus,
>
> Il giorno Thu, 19 May 2022 08:43:11 +0200
> "Markus Volk" <f_l_k@t-online.de> ha scritto:
>
> libdecor is a client-side decoration library for Wayland clients. It
> is used by libsdl2 for window decoration and is required to provide
> decoration for shells that use client-side decoration such as
> gnome-shell or weston.
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
>
> I'm afraid we're having an issue with this patch as well:
>
> AssertionError:
> The following recipes do not have a maintainer assigned to them. Please
> add an entry to meta/conf/distro/include/maintainers.inc file. libdecor
> (/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/recipes-graphics/libdecor/libdecor_0.1.0.bb)
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/3547/steps/14/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/3604/steps/15/logs/stdio
>
> And also this warning:
>
> WARNING: Nothing RPROVIDES 'nativesdk-libdecor' (but
> virtual:nativesdk:/home/pokybuild/yocto-worker/build-appliance/build/meta/recipes-graphics/libdecor/libdecor_0.1.0.bb
> RDEPENDS on or otherwise requires it) No eligible RPROVIDERs exist for
> 'nativesdk-libdecor' NOTE: Runtime target 'nativesdk-libdecor' is
> unbuildable, removing... Missing or unbuildable dependency chain was:
> ['nativesdk-libdecor'] WARNING: Nothing RPROVIDES
> 'nativesdk-libdecor-dev' (but
> virtual:nativesdk:/home/pokybuild/yocto-worker/build-appliance/build/meta/recipes-graphics/libdecor/libdecor_0.1.0.bb
> RDEPENDS on or otherwise requires it) No eligible RPROVIDERs exist for
> 'nativesdk-libdecor-dev' NOTE: Runtime target 'nativesdk-libdecor-dev'
> is unbuildable, removing... Missing or unbuildable dependency chain
> was: ['nativesdk-libdecor-dev']
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/23/builds/5543/steps/12/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/97/builds/4571/steps/12/logs/stdio
>
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#165903): https://lists.openembedded.org/g/openembedded-core/message/165903
> Mute This Topic: https://lists.openembedded.org/mt/91203655/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

