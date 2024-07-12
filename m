Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BABB6C2BD09
	for <webhook@archiver.kernel.org>; Fri, 12 Jul 2024 11:13:31 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web11.5346.1720782809280841562
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jul 2024 04:13:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=F8sfplN9;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2ee910d6a9dso20924291fa.1
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jul 2024 04:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720782807; x=1721387607; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7lM7vTFbZDkdHtMi/2ApGsP71irMsk6nlg2fZy4V1DI=;
        b=F8sfplN9w7ZynSKhW7RBvDv50PcfeI7Yv4H9jbFWeQygwQ17HUrM5Wn/E029WI53h6
         sZXTe21X2BJaku1xxKDTHcTepid3oHVR0XNCwqotLhsRX02/M9E7IsLBx7kEmtPTEAQc
         Q55fTZGOa7BIpb5VTVD9ZXpS5r7jNlVNVD7tZgeABfw8R+vD/ageoydrZTnQ108YWpGC
         HQ7e3uXWZ/aedodA1rVeqTafLiLEeJkF5OXkLvvR7D+mycHfsFs8CYd13MY8h4guKj7w
         T/6uJW8ubAvvG6RyMdrAhluBCaS1yniz+/rrrH5Ya3UqCaU+7GYBe55WRWtE+XCt7wPv
         0GEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720782807; x=1721387607;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7lM7vTFbZDkdHtMi/2ApGsP71irMsk6nlg2fZy4V1DI=;
        b=FRKvR9BRQF8SyxpI+uKPMwDb4RpA6txCkZB15na5ok7k147Jt56pE+WpA1/l4XhxWG
         dQlYomy1spGWOdFFaEbojOBQ73T5b1lRJjF6GJVLzM4ob/Et3Gbi7RgT1I/Jevtkhm37
         2dAIsQkR/WA8MGN+tXDarbh21C2gCXVx43cKcGEfocdWwVdUpdvKJbwto+7jYYkFlMFQ
         YD22oxpdrxvG/evYWbJsNdgAb6Qh4uOEoSy4VvSfIsjpXPFbjiSNBVphR8OWKTGPYfZf
         t/ufpjKkEiuefKU5bQtmHmKMga6Ycx82ZTZ6xE0jH5csYH9Mk/tYTnQEsI+hCdbS9hsZ
         xfkg==
X-Gm-Message-State: AOJu0YwsAV9ZQ4+NCG+MWHYUtgdRSZOzwv4wwwRAHsO5WeeVM3EazsCh
	CrgFFnVCS+u86jyjcPLsHJ6MW+li4NNYin4SPTD+E/PMyLgolxlSfq1RDoNi2VXfpu3rRqszqaW
	tiXOxxe+or7Sftu2R2UYApDIpYIU=
X-Google-Smtp-Source: AGHT+IHsXh7GEiZQMKQJHJoaRqrpnLuSEMpPvzLtJnOQ+2rY4nRHyVZCE1g1Vt6u4nqeI1b54vc5RWPEW4eCo3pb56s=
X-Received: by 2002:a2e:b059:0:b0:2ec:53fb:39cb with SMTP id
 38308e7fff4ca-2eeb30ba0edmr73897581fa.6.1720782807159; Fri, 12 Jul 2024
 04:13:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240712111130.2221496-1-ohnatiuk@cisco.com>
In-Reply-To: <20240712111130.2221496-1-ohnatiuk@cisco.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 12 Jul 2024 13:13:15 +0200
Message-ID: <CANNYZj8K3sBWqV24miv3fYopPARwzKPZ=VV3n6vSwi+ATRxztQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] icu: remove host references in nativesdk to fix reproducibility
To: ohnatiuk@cisco.com
Cc: openembedded-core@lists.openembedded.org, 
	Oleksiy Obitotskyy <oobitots@cisco.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jul 2024 11:13:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201821

You need to put this into a function, and call it from various places,
instead of just copy-pasting code.

Alex

On Fri, 12 Jul 2024 at 13:11, Oleksandr Hnatiuk via
lists.openembedded.org <ohnatiuk=cisco.com@lists.openembedded.org>
wrote:
>
> Fix is only done for target. Copy same code for nativesdk.
>
> Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
> Signed-off-by: Oleksandr Hnatiuk <ohnatiuk@cisco.com>
> ---
>  meta/recipes-support/icu/icu_75-1.bb | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/meta/recipes-support/icu/icu_75-1.bb b/meta/recipes-support/icu/icu_75-1.bb
> index 27fe392e4d4e..4b7023fd06e1 100644
> --- a/meta/recipes-support/icu/icu_75-1.bb
> +++ b/meta/recipes-support/icu/icu_75-1.bb
> @@ -39,6 +39,15 @@ do_compile:prepend:class-target () {
>             -i ${B}/tools/toolutil/Makefile
>  }
>
> +do_compile:prepend:class-nativesdk () {
> +       # Make sure certain build host references do not end up being compiled
> +       # in the image. This only affects libicutu and icu-dbg
> +       sed  \
> +           -e 's,DU_BUILD=,DU_BUILD_unused=,g' \
> +           -e '/^CPPFLAGS.*/ s,--sysroot=${STAGING_DIR_TARGET},,g' \
> +           -i ${B}/tools/toolutil/Makefile
> +}
> +
>  PREPROCESS_RELOCATE_DIRS = "${datadir}/${BPN}/${PV}"
>  do_install:append:class-native() {
>         mkdir -p ${D}/${STAGING_ICU_DIR_NATIVE}/config
> @@ -66,6 +75,16 @@ do_install:append:class-target() {
>             ${D}/${libdir}/${BPN}/${@icu_install_folder(d)}/pkgdata.inc
>  }
>
> +do_install:append:class-nativesdk() {
> +       # Remove build host references...
> +       sed -i  \
> +           -e 's,--sysroot=${STAGING_DIR_TARGET},,g' \
> +           -e 's|${DEBUG_PREFIX_MAP}||g' \
> +           -e 's:${HOSTTOOLS_DIR}/::g' \
> +           ${D}/${libdir}/${BPN}/${@icu_install_folder(d)}/Makefile.inc \
> +           ${D}/${libdir}/${BPN}/${@icu_install_folder(d)}/pkgdata.inc
> +}
> +
>  PACKAGES =+ "libicudata libicuuc libicui18n libicutu libicuio"
>
>  FILES:${PN}-dev += "${libdir}/${BPN}/"
> --
> 2.35.6
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#201820): https://lists.openembedded.org/g/openembedded-core/message/201820
> Mute This Topic: https://lists.openembedded.org/mt/107179994/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

