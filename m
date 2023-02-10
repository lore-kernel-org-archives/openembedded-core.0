Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B6B2C05027
	for <webhook@archiver.kernel.org>; Fri, 10 Feb 2023 07:44:24 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web10.9133.1676015056390426339
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Feb 2023 23:44:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XTZnHHeF;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id a13so3539120ljq.6
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 23:44:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dPfNV3SxACttZDw+O2uCdMear8JY0FdESSa22JkSCks=;
        b=XTZnHHeFJ3Qyw4hzvyzSKpDJmGk2ln7+SBbiQhBwMZPIRayo7m/pZVSM6X84DYxGBu
         dvDsuu6KmgAPTon6FGInr/2lr7vMVuJcc786Mq1BOxj7XoYLICP12vaudpj/Ns4mV9KR
         5/fheQkjB6XTiH7cxDV1sMmqWUKgOKtJD6LWA1M4PVDPTIKt8moU999LuGK+wUFMeKO9
         RBGAAHNNd9UmhgjZEZX32YHj9G+1O4kq6z3L38vQBWSw9f4dWEw1IGqv/kJWNA6+hTBz
         4BlRd/JjjqJ2WwQFfxt8npj/b8omV2xfIc8AtCHTBz8u4HeEMPaMgRnnzchTsqq/L3vs
         jryw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dPfNV3SxACttZDw+O2uCdMear8JY0FdESSa22JkSCks=;
        b=blBCRR3GkIQ/JWxYFdrp3l/ZcTUELCHsL/quada4+tdzpMgfcVCcNnQ+M4Q9J0Ec+g
         u1nv1eo52hpTiRwLelivH8YVWcIhF4/gegowkI7RI0v/p3Xml4+Yl1ZkA2SvQml8UISK
         9dHUQbgKa3OBGx/dGVrorMcNi8B9OSayi1PX8loFkkYJi6TU71W+163b3M+cyV01OruR
         a8yuWENcKgK9mWjMgixG7Zy4bP+X4Tpd6b8JsHr+iVmX6YgP9c0BbAanEzeNhya5pY/S
         W7eXEnQ9nvM6xZHGPuqxWFu2kPeNa762JC6m94rWz2gWS2klFpFR386ntcJzkB4RO63i
         DhEQ==
X-Gm-Message-State: AO0yUKXQ/zgqheNsqroTMeyuPmjeM3pm1bBBEItlX6RQVZS1ZEsxOFdc
	fo0VZsbc+vUjekwqy50hQs4HkDJLJyUTgkZu7JE=
X-Google-Smtp-Source: AK7set98vG1FJ2rUEnYZDJ9Yy9aR9fYKLSCwRQqcZhGAiveGtXYgUiWHJB2nk5mnBi6VjO6LuM0f1hW5QHDDdNTDh2M=
X-Received: by 2002:a2e:9f41:0:b0:293:319e:6800 with SMTP id
 v1-20020a2e9f41000000b00293319e6800mr932749ljk.115.1676015054343; Thu, 09 Feb
 2023 23:44:14 -0800 (PST)
MIME-Version: 1.0
References: <1676014485-3128-1-git-send-email-leimaohui@fujitsu.com>
In-Reply-To: <1676014485-3128-1-git-send-email-leimaohui@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 10 Feb 2023 08:44:02 +0100
Message-ID: <CANNYZj9LYjUbmyRy8q52H-7RgEx_tr4Uz0BRUSUBMVmHRzhS0w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] nghttp2: Fix do_rootfs error as following:
To: leimaohui <leimaohui@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Feb 2023 07:44:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176984

If neither client nor server packages contain any files, then what is
installed? Is there some other useful package than nghttp2 package
pulls in, or does it itself contain something useful?

Alex

On Fri, 10 Feb 2023 at 08:35, leimaohui <leimaohui@fujitsu.com> wrote:
>
> Problem: conflicting requests
>   - nothing provides nghttp2-client >= 1.51.0 needed by nghttp2-1.51.0-r0.core2_64
>   - nothing provides nghttp2-server >= 1.51.0 needed by nghttp2-1.51.0-r0.core2_64
>
> Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
> ---
>  meta/recipes-support/nghttp2/nghttp2_1.51.0.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-support/nghttp2/nghttp2_1.51.0.bb b/meta/recipes-support/nghttp2/nghttp2_1.51.0.bb
> index 8ddb851f71..72a4372214 100644
> --- a/meta/recipes-support/nghttp2/nghttp2_1.51.0.bb
> +++ b/meta/recipes-support/nghttp2/nghttp2_1.51.0.bb
> @@ -24,6 +24,8 @@ RDEPENDS:${PN}:class-native = ""
>  RDEPENDS:${PN}-proxy = "openssl python3-core python3-io python3-shell"
>
>  ALLOW_EMPTY:${PN} = "1"
> +ALLOW_EMPTY:${PN}-server = "1"
> +ALLOW_EMPTY:${PN}-client = "1"
>  FILES:${PN} = ""
>  FILES:lib${BPN} = "${libdir}/*${SOLIBS}"
>  FILES:${PN}-client = "${bindir}/h2load ${bindir}/nghttp"
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#176983): https://lists.openembedded.org/g/openembedded-core/message/176983
> Mute This Topic: https://lists.openembedded.org/mt/96872036/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

