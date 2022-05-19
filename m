Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB416C4332F
	for <webhook@archiver.kernel.org>; Thu, 19 May 2022 15:15:19 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web10.8889.1652973316044364343
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 May 2022 08:15:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DZ86uIYp;
 spf=pass (domain: gmail.com, ip: 209.85.208.173,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id b32so6643990ljf.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 19 May 2022 08:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1RsI3B9rQyc3ldhGZvwc0Aw9XLCZsrDpHUnd/G/PRRE=;
        b=DZ86uIYpmLwB3lnLvhFaCRsJmwzDda+08soUlZaTupINE+8PZh18cyMeau47PiOX74
         BpBy8T20kICA4+fEQGevrl2gO6keRYr2Hl47Gxn8D+H1dQRJlD/49zu9o7rUQ4uH2EEm
         W3TbaiNGhvdbJ0qYaK3NRDqcL3CvlGzxAK1ywdugD/V3ItYLYY9/YgQlTJcA2PF+FnkG
         hG921W3UvlPRjDtgGdn12zwyUkvwWT9kW6lOfglbq+Egb6IuPAWSZo7wmFMof3L9pKTj
         CiaJk93FCJuagvu0cm8b9ncgEtlO/dan7i+5bEalY9IVgnIBZmcv7qKhEfk5DvrBbPHS
         NydQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1RsI3B9rQyc3ldhGZvwc0Aw9XLCZsrDpHUnd/G/PRRE=;
        b=1+WF0syfj8bomA3iKhV071oT4HCfsJZKHFlC6dWonAJ7B5hSQhNbQAp5Teq3IHPxKv
         2PmLTODJXn8RKFy1MWlJydWo3+0nwpApT18qfn5fus/xQ2q3jZ7FDbp0BZSFZWWV2y1m
         Q0C+luBWK6uh+9gLNiJ88vbsHl0hzpEzXCKk9lZMozuXRM/SPpjdR6foIqO6l/rpeuFc
         HyoaTARRmD6cndjhSWL4Z7KiMHE1zjLwnbOrJiwDNU6aEnUGE92YYbdjYg/fAQbBOgmM
         uQmUsuSDX3Htkk+5a/oMQlZs1DcoX5ajJsFleAfPZXCp2RSYr6wIHxZZi8R2gJp5sA5z
         KjWQ==
X-Gm-Message-State: AOAM531cQVSO0+WAPHWq8n5SS8kgnRslmwizQZ4XawBmAQJINPt510Gq
	YBnzBjNlSI+4GKPONNPo53juxUWmxltS2oCPMOs=
X-Google-Smtp-Source: 
 ABdhPJxjld7TXGRGlPKNkuAF6cPgIlWRz6krdlr0OCCkhhxI3oTG4UraoZrGLDAN3a/Vn7puLKU2SFOuxDltwJA0rlI=
X-Received: by 2002:a2e:7a05:0:b0:253:cdc8:d9b7 with SMTP id
 v5-20020a2e7a05000000b00253cdc8d9b7mr3056625ljc.56.1652973314247; Thu, 19 May
 2022 08:15:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220519064312.391164-1-f_l_k@t-online.de>
 <20220519064312.391164-2-f_l_k@t-online.de>
 <20220519161829.2d10631c@melee>
 <95b9ccd4-b136-7e29-17c1-3291fa5c5cc5@t-online.de>
In-Reply-To: <95b9ccd4-b136-7e29-17c1-3291fa5c5cc5@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 19 May 2022 17:15:01 +0200
Message-ID: 
 <CANNYZj_TtUcRb3SrAj0nUStc_U3RddiqLb5Cv0SdUEZqdmV=Lg@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][RFC PATCH 2/2] libsdl2: rework and cleanup
To: Markus Volk <f_l_k@t-online.de>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 May 2022 15:15:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165901

You probably need to make libusb support subject to PACKAGECONFIG as
well, as libsdl2 does seem to build ok without it?

Alex

On Thu, 19 May 2022 at 16:30, Markus Volk <f_l_k@t-online.de> wrote:
>
> Hello Luca,
> thats probably an issue because libusb-compat is not in oe-core but meta-oe
> What would be the preferred way to fix it ?
> +DEPENDS = "libusb1" ?
>
> Am 19.05.22 um 16:18 schrieb Luca Ceresoli:
>
> Hello Marius,
>
> Il giorno Thu, 19 May 2022 08:43:12 +0200
> "Markus Volk" <f_l_k@t-online.de> ha scritto:
>
> - add libusb dependency because libsdl2 is looking for it
> - remove xvm and xinerama since support has been dropped in sdl code
> - allow native build for libxkbcommon and xkeyboard-config to allow
>   alignment of native/target build
> - align native and target build
> - add PACKAGECONFIG options for pipewire and libdecor
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb | 17
> ++++++++--------- .../xorg-lib/libxkbcommon_1.4.0.bb              |
> 2 ++ .../xorg-lib/xkeyboard-config_2.35.1.bb         |  2 ++
>  3 files changed, 12 insertions(+), 9 deletions(-)
>
> diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb
> b/meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb index
> 7678319770..a6550c3175 100644 ---
> a/meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb +++
> b/meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb @@ -21,6 +21,8 @@
> LIC_FILES_CHKSUM:append = " ${@bb.utils.contains('PACKAGECONFIG',
> 'arm-neon', 'f PROVIDES = "virtual/libsdl2"
>
> +DEPENDS = "libusb"
>
> This patch is causing errors on the autobuilders due to this line:
>
> stdio: ERROR: Nothing PROVIDES 'libusb' (but
> /home/pokybuild/yocto-worker/beaglebone/build/meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb
> DEPENDS on or otherwise requires it). Close matches:
>
> Here are a few logs:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/5269/steps/11/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/5269/steps/12/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/5269/steps/14/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/20/builds/5590/steps/12/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/5243/steps/12/logs/stdio
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#165892): https://lists.openembedded.org/g/openembedded-core/message/165892
> Mute This Topic: https://lists.openembedded.org/mt/91203656/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

