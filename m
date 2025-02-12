Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12720C02198
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 15:29:48 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web10.17902.1739372587275186924
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Feb 2025 07:03:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jx9Un6WL;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6e45258610bso7854266d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 07:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739372586; x=1739977386; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YKbrnGqoMdhbXZGIC2oNuVRxN2O20hrpwRKMKxUkIAM=;
        b=jx9Un6WLAauonnPMMGfYTA27PE0643fiI4iru6FXw5UH+iSXQX4rj1AT7LA72AJm3o
         PYfBYVOAIS1eljfZ/anveWWlrFskSxaNkx2ywgHtwefzNw0+LOxNopU0FwHAYlUTtM/h
         4zarGUe2V+AmfSKYimOL3feMYv0Qw+GDJIlZ4PPKEiYtptmZboe+rQvefY4/4dD5AkTg
         lc9P+OmAKRU7/NjLdkVDRuHCh7YHqZbOVhF80URcFgh2SJptHhl3E4hbIOXIpXd/jKbm
         51udsGy1XD9gRwMGJSHXtty+5BanMDeCLl9jS0jJuNK07A+4ZeDE/zZJnLoFkmLimR9Z
         7Ibw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739372586; x=1739977386;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YKbrnGqoMdhbXZGIC2oNuVRxN2O20hrpwRKMKxUkIAM=;
        b=gUZ053sPUF6rTADf05u47uOYGlmbmqNeZg/HdrRilP8Zaa4x6SpHiU91XT6FUVOlJq
         HyKslcN5D2xKaI4Shc7dKn8NuVBJrA5nJg1fJOqEueD+rvSYhvTO4K3bHyklJ049yjeL
         BBPLclM5YYSCF2gx/kbeG85dcOst4QPqwuGavMJZM6iLoSbVj4Kllmuo0xP5UeC++JHT
         OR3u3nsk36TThjl3zzh0z03kpCtfq8UnmUBS3We9Ag0+uIK0w5FcUr46TvL7sb+rCyAg
         5mbh4pmioo1yuxeRtV5PetnUE2fPXRrhP4AXIvGZ+Ohtg91489RkxYtsTJeYZRCwaNSG
         2Tag==
X-Gm-Message-State: AOJu0YzcQep6eMlq4bqWshU/TP5OVIU21Bp7PbQ+1qTcLeMQ8KoBfCeS
	KvkepkdSHeIrGWdrCBXkCXfiLWEz5tN6yYO7bVpDAsaIeEKx5g+hUS+CG3M7SCZ3cBULvnZlLCq
	YatQVRQdxAxNyx5cMM271ZCr/C3U=
X-Gm-Gg: ASbGnculP54DMVwsz/EdcJ7bHhNPTMj3WWvKV3I8QJv4VvwcHhPk27RPVunSOBZHuXn
	+Yc/dpnzcP9usAb+6X59LaJ8xc7uMj9Bpjy8mXeDjcNbIKz3rAeKUrKjyMbvflx8y68se3XUmoY
	D0u3p2H1wEnMBtiy5VC2XmymK6tAFjYE0=
X-Google-Smtp-Source: AGHT+IF7mzikoHktbhPBpe8k8zrILIofp8WSPVnJMGfp9aPuHDCBtb3ldKhN65eV+c91QqHq8ESdUBzmY/+dgJ9unRw=
X-Received: by 2002:a05:6214:ca3:b0:6e2:485d:fddd with SMTP id
 6a1803df08f44-6e46f17fb80mr55381126d6.1.1739372586314; Wed, 12 Feb 2025
 07:03:06 -0800 (PST)
MIME-Version: 1.0
References: <PA4PR01MB7568995480429852AF9AF6B782FC2@PA4PR01MB7568.eurprd01.prod.exchangelabs.com>
In-Reply-To: <PA4PR01MB7568995480429852AF9AF6B782FC2@PA4PR01MB7568.eurprd01.prod.exchangelabs.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 12 Feb 2025 16:02:55 +0100
X-Gm-Features: AWEUYZm5qmaoLef9Ua8tcwqWQwCqVvSsEdDbS5WKuoHgTe_qCl0Y0mltoegTpAQ
Message-ID: <CANNYZj8sPym7Q4-OmEPtkjPh8O2qRiNbxOgS-Rnd-5joqkUC7Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] Fixes [YOCTO 15731]
To: sven.kalmbach@loewensteinmedical.com
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 15:29:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211246

Please send the patch using git send-email, rather than copy pasting
it into the message body.

Alex

On Wed, 12 Feb 2025 at 15:53, Sven Kalmbach via lists.openembedded.org
<sven.kalmbach=loewensteinmedical.com@lists.openembedded.org> wrote:
>
> From aa2176cbd1438b72f22129421edd8f7979330a56 Mon Sep 17 00:00:00 2001
> From: Sven Kalmbach <Sven.Kalmbach@loewensteinmedical.com>
> Date: Wed, 5 Feb 2025 16:11:33 +0100
> Subject: [PATCH] Fixes [YOCTO 15731]
>
> Remove incorrectly escaped exit value, which causes error
> handling logic not to run.
>
> Signed-off-by: Sven Kalmbach <Sven.Kalmbach@loewensteinmedical.com>
> ---
>  meta/classes-recipe/cml1.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes-recipe/cml1.bbclass b/meta/classes-recipe/cml1.bbclass
> index 0bf171a668..d18b008aec 100644
> --- a/meta/classes-recipe/cml1.bbclass
> +++ b/meta/classes-recipe/cml1.bbclass
> @@ -58,7 +58,7 @@ python do_menuconfig() {
>      # ensure that environment variables are overwritten with this tasks 'd' values
>      d.appendVar("OE_TERMINAL_EXPORTS", " PKG_CONFIG_DIR PKG_CONFIG_PATH PKG_CONFIG_LIBDIR PKG_CONFIG_SYSROOT_DIR")
>
> -    oe_terminal("sh -c 'make %s; if [ \\$? -ne 0 ]; then echo \"Command failed.\"; printf \"Press any key to continue... \"; read r; fi'" % d.getVar('KCONFIG_CONFIG_COMMAND'),
> +    oe_terminal("sh -c 'make %s; if [ $? -ne 0 ]; then echo \"Command failed.\"; printf \"Press any key to continue... \"; read r; fi'" % d.getVar('KCONFIG_CONFIG_COMMAND'),
>                  d.getVar('PN') + ' Configuration', d)
>
>      try:
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#211245): https://lists.openembedded.org/g/openembedded-core/message/211245
> Mute This Topic: https://lists.openembedded.org/mt/111143606/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

