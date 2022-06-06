Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0DCFC43334
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 15:20:25 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web09.33391.1654528819617020966
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 08:20:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=p9L30F+r;
 spf=pass (domain: gmail.com, ip: 209.85.167.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id a2so17713613lfg.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 08:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qJHAdgd+d6zfM02F/6/B9Bui6adfiBJ2Qesmht1pJn0=;
        b=p9L30F+r1vMJ8nxW5qCU7dmk3RzlzkDET2sP7Q1j8gfitJPQfnAf25T2C+yJbPekew
         +8r9ZOR+TkJxMOFXw8Dso37hb3kk9ePwU3Uutjt7ImFZn5ikUqs6MfJZnwf2B0OlTsTV
         zdGZqIqeNNlG/diCvCOQVXfHG1nRTbDJQTgRRTFbfC+IjmcmPjzA3o43tGX/1h+7ILsM
         zv5zvZjnqwpqQYB0jJ0AuyJ394b+QxqR61J0nJAdklv1iEA4DrBEhKi7m4exztVm9JzU
         u8GmY05x18fSZsI5MT4bEtxtIaliGp+MOT+S2tVEfn7mHhtneo5DnpTu6J2tZD5u0iV5
         T6HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qJHAdgd+d6zfM02F/6/B9Bui6adfiBJ2Qesmht1pJn0=;
        b=uoG5vyRaRTqrQeGy7g7udb3UEdAwtXogtHW30QR/12P/IJWnYmkX7u22E5FRZoh3y6
         KssgZHnEq+dkcjjk3dK2tStlyRHK/K9byh+PWMeVXRkJqBb8JP5TIOP1I76nZ52W+R4+
         PJBDPi/jsqo2kpLRdb3v5q1+JRoCMKF/Squjz1SWNzUILXvcACQUkFs9+79lz3uJPEb5
         UgYLd3uiesrmquYR+LlAX90IYv6v9IsFbQbPrfPeB4fq7CXffGnzbOcQuvrv3IGwJPFX
         abSTRD9YuED4X3yZMDepv1qf1h7lNR5PcFPJEByOn9pW7Hz0Xd1wsbc0OEYzrMkXMXfF
         nzBA==
X-Gm-Message-State: AOAM530QAkJFG/Q/KMlRcz1E1D+rBem4QjBQTE2t5+EVPI5Z58ZAoiaM
	Lt6b3V8cqQfN4vQnFE3IuimVyWWBtjvK0yVg8RE=
X-Google-Smtp-Source: 
 ABdhPJya1z4EAK3qbOJtZTHKP3oCNseOm/K958TWrbpFC54Gw0pHk+4/SNbXJj932G68hST2pFgvP/EEsf8BhQQIRAw=
X-Received: by 2002:ac2:54b9:0:b0:479:a29:c1ec with SMTP id
 w25-20020ac254b9000000b004790a29c1ecmr15246287lfk.358.1654528817671; Mon, 06
 Jun 2022 08:20:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220606132653.60232-1-brgl@bgdev.pl>
 <20220606132653.60232-2-brgl@bgdev.pl>
In-Reply-To: <20220606132653.60232-2-brgl@bgdev.pl>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 6 Jun 2022 17:20:07 +0200
Message-ID: 
 <CANNYZj-O4TPHD2srDFufHoXncg4QMEW0x_J7=D0+oyd9KCTRVQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH 1/4] cargo: don't update git submodules in
 --offline mode
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Khem Raj <raj.khem@gmail.com>,
 OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jun 2022 15:20:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166647

I think you need to get this merged upstream first, seems like neither
party has a complete understanding of what is going on and whether the
patch is correct.

Alex

On Mon, 6 Jun 2022 at 15:27, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> This adds a patch to the cargo recipe that prohibits cargo from trying
> to update git submodules when running in --offline mode.
>
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> ---
>  meta/recipes-devtools/cargo/cargo.inc         |  2 +-
>  ...-t-update-submodules-in-offline-mode.patch | 32 +++++++++++++++++++
>  2 files changed, 33 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-devtools/cargo/cargo/0001-git-don-t-update-submodules-in-offline-mode.patch
>
> diff --git a/meta/recipes-devtools/cargo/cargo.inc b/meta/recipes-devtools/cargo/cargo.inc
> index 607c51fc3d..6ab4e0a5f7 100644
> --- a/meta/recipes-devtools/cargo/cargo.inc
> +++ b/meta/recipes-devtools/cargo/cargo.inc
> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = " \
>      file://LICENSE-THIRD-PARTY;md5=f257ad009884cb88a3a87d6920e7180a \
>  "
>
> -
> +SRC_URI += "file://0001-git-don-t-update-submodules-in-offline-mode.patch"
>  S = "${RUSTSRC}/src/tools/cargo"
>  CARGO_VENDORING_DIRECTORY = "${RUSTSRC}/vendor"
>  EXCLUDE_FROM_WORLD = "1"
> diff --git a/meta/recipes-devtools/cargo/cargo/0001-git-don-t-update-submodules-in-offline-mode.patch b/meta/recipes-devtools/cargo/cargo/0001-git-don-t-update-submodules-in-offline-mode.patch
> new file mode 100644
> index 0000000000..d138c4b911
> --- /dev/null
> +++ b/meta/recipes-devtools/cargo/cargo/0001-git-don-t-update-submodules-in-offline-mode.patch
> @@ -0,0 +1,32 @@
> +From 4768c657905356da417f50d3cbb203c76baf1ab2 Mon Sep 17 00:00:00 2001
> +From: Bartosz Golaszewski <brgl@bgdev.pl>
> +Date: Mon, 6 Jun 2022 12:13:02 +0200
> +Subject: [PATCH] git: don't update submodules in offline mode
> +
> +When we're running in --offline mode, don't try to update git
> +submodules or else we're bail out with a network error if it's actually
> +inaccessible.
> +---
> +Upstream-Status: Submitted [https://github.com/rust-lang/cargo/pull/10730]
> +
> + src/tools/cargo/src/cargo/sources/git/utils.rs | 4 +++-
> + 1 file changed, 3 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/cargo/sources/git/utils.rs b/src/cargo/sources/git/utils.rs
> +index 4eafae1c9..9ed991e36 100644
> +--- a/src/cargo/sources/git/utils.rs
> ++++ b/src/cargo/sources/git/utils.rs
> +@@ -177,7 +177,9 @@ impl GitDatabase {
> +             Some(c) => c,
> +             None => GitCheckout::clone_into(dest, self, rev, cargo_config)?,
> +         };
> +-        checkout.update_submodules(cargo_config)?;
> ++        if !cargo_config.offline() {
> ++            checkout.update_submodules(cargo_config)?;
> ++        }
> +         Ok(checkout)
> +     }
> +
> +--
> +2.34.1
> +
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#166628): https://lists.openembedded.org/g/openembedded-core/message/166628
> Mute This Topic: https://lists.openembedded.org/mt/91576742/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

