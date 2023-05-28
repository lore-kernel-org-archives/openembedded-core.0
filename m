Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A64F2C7EE23
	for <webhook@archiver.kernel.org>; Sun, 28 May 2023 13:40:07 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.28981.1685281200960705318
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 May 2023 06:40:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=mOs2tcJ2;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2af20198f20so24335721fa.0
        for <openembedded-core@lists.openembedded.org>; Sun, 28 May 2023 06:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685281199; x=1687873199;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kR0gOWeoC37ghWHgrljDvwxpGYd/Th7s40s/DLcv5Jw=;
        b=mOs2tcJ2iXFrHWHlBcbbCkSv1oMTkzA4vCUGyfXW34iRlUYt/426Dgh2z1F9wiYLEG
         TGGynblY/G4MMJixQ8kisqtnPYQ9FXwD1SatNEYFZWwK2Ln3s69d/reN5BKMOoHNyk5H
         /RNTSnKEqWaf/8PyYuAYMfHx2BfjSD5r/YhQzD0EtY4Y8JOwBpOXUg6MYy5e9r/vJQ3G
         U7jPdl5AJ4XMbBNE9nAsLgdSlc4ZCzMv+tzbzdUm+wNDRFGqFOQD4b+qeB8+qWkDY+lG
         imrQLI5+sCwWk+vB5XAIWrruC0I9DpEBc7Z5buTnGeHmDhw0g/4C3Ppqa1RrStSf0t+4
         vSew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685281199; x=1687873199;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kR0gOWeoC37ghWHgrljDvwxpGYd/Th7s40s/DLcv5Jw=;
        b=V0ShnfdfafiL7Vep5wmi7GlktTt/663dLVdziSPp6tMwcgaP754sBiwwg+CXwePBdq
         A7Js7yEE8XZPR5B370kPg2zPipvwfqNjdwuCEnd/NoZyFmHjntvoOgt6QWPuo4T/pzfX
         ntYcD7eyvGJkLT5iVBsoLgPA88eemW34FHk53QZXSJ6K92XPsTSyQPX0l13DN4XMRGbs
         ndrEVvFy6RkjdOjTd9Z7jXCgqnyu4SDWjXcSmxy6xCz6QFElGRvsLCASre7Wa+tjH11+
         Nq1hJHkFQmIGZ9u+iy7VmwRwgSwL4B6g6qFpgrtv04mPQYygPFDX+tT12hxOi4FtbCz0
         1OBg==
X-Gm-Message-State: AC+VfDyH68Mh9D3V/fT3WxXQ44syBR87/Yme/H+M9M8Vbs4YQ+BGEAkq
	7xZ1jY8Pw1fGTMPOB7H8l7AgF1KCZo62Ah5PBR0=
X-Google-Smtp-Source: ACHHUZ6XQjZggpKNwybjViO0iJTsyflDusPioC2xC2hS3bc67+Za4RQMxf6G4R0XAVbCgbI2wUCnwgjcgdUBZIoh7Lo=
X-Received: by 2002:a2e:3808:0:b0:2ad:aa42:8c0b with SMTP id
 f8-20020a2e3808000000b002adaa428c0bmr2829924lja.35.1685281199035; Sun, 28 May
 2023 06:39:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230527133252.284132-1-f_l_k@t-online.de> <20230527133252.284132-2-f_l_k@t-online.de>
In-Reply-To: <20230527133252.284132-2-f_l_k@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 28 May 2023 15:39:47 +0200
Message-ID: <CANNYZj8Mx-o8=L7N_hrC71c-4urBgXJx1gM1nERUjQL-87Kmyw@mail.gmail.com>
Subject: Re: [oe-core][PATCH 2/4] python3: add libxcrypt-native dependency
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 May 2023 13:40:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181824

Can you please show how it looks like? We do have a test for host
contamination via headers, so I'd like to see what happens exactly and
where the test isn't catching it.

Same for patches 3/4, 4/4.

Alex

On Sat, 27 May 2023 at 15:33, Markus Volk <f_l_k@t-online.de> wrote:
>
> crypt.h is otherwise taken from the host machine
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta/recipes-devtools/python/python3_3.11.2.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/python/python3_3.11.2.bb b/meta/recipes-devtools/python/python3_3.11.2.bb
> index 421a305e22..1ca4ad35be 100644
> --- a/meta/recipes-devtools/python/python3_3.11.2.bb
> +++ b/meta/recipes-devtools/python/python3_3.11.2.bb
> @@ -72,7 +72,7 @@ ALTERNATIVE_LINK_NAME[python3-config] = "${bindir}/python${PYTHON_MAJMIN}-config
>  ALTERNATIVE_TARGET[python3-config] = "${bindir}/python${PYTHON_MAJMIN}-config-${MULTILIB_SUFFIX}"
>
>
> -DEPENDS = "bzip2-replacement-native expat libffi bzip2 openssl sqlite3 zlib virtual/libintl xz virtual/crypt util-linux-libuuid libtirpc libnsl2 autoconf-archive-native ncurses"
> +DEPENDS = "bzip2-replacement-native expat libffi bzip2 openssl sqlite3 zlib virtual/libintl xz virtual/crypt util-linux-libuuid libtirpc libnsl2 autoconf-archive-native ncurses libxcrypt-native"
>  DEPENDS:append:class-target = " python3-native"
>  DEPENDS:append:class-nativesdk = " python3-native"
>
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#181806): https://lists.openembedded.org/g/openembedded-core/message/181806
> Mute This Topic: https://lists.openembedded.org/mt/99167320/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

