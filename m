Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57CE7C7EE23
	for <webhook@archiver.kernel.org>; Wed,  7 Jun 2023 09:01:16 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web10.3911.1686128466599836745
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jun 2023 02:01:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=ZPiGYW/x;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2b1b30445cfso64587781fa.1
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Jun 2023 02:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686128465; x=1688720465;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Otu+Hxc0zji78EokgpGS4rvQQqbE9i3OTm6B/qgEIHM=;
        b=ZPiGYW/xcs1wNERqSTgL6q3TfDzXHd4ZFPBfXGjYuch3hPuBJc87BA8nKrPoRro/wJ
         ZMHr1aqCmwchSUCT9itxlcbDyG+lpQgwQK+mEZKwNt+mww2hn6CtsVaui7M54yb7uZuc
         epd+ZwUO4jvOF08ShtangZrxBJh58NBosASqEHSsUTs0Z98nP2/0z49yK8TjAnAqeaiH
         fymPBYT+H/HWru74nna49yCFfOIB7Bfh9r9ETbZURY0kAecRoxLnLJli1WprNCIKcPao
         4QVMjTX0AlhMSO3PmR6qY4zAq5EvoqoVUnU1k/yD1WOFZ8i81th4mI0P3pTdrHIsgGYT
         N4Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686128465; x=1688720465;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Otu+Hxc0zji78EokgpGS4rvQQqbE9i3OTm6B/qgEIHM=;
        b=UROtq6aP+X5m3409Vg14/c5x2HnbRz89GLTOHuwEftDqlVa64eSuv1yf74L/a1a/JZ
         554o/ZyZ0blIjvB8bnAZzhEqpDX7ljy2uM0Iba3NmaYROB1El2TfYwt7Yar3fzblj4r3
         UOYJIJy0vBdCtpaEbERRwY0R8p0L4psTPU4RBI/Vh0SAn9lsEyOkqj+s0xw71MCqyubT
         Ej2Tq//mYlmJxLkvH8LbNyrauvuWelxREJuBwnCiBB3BhIMzRPkVSgzeH/hNzkjggrIe
         qvcTFOA6X6oiN7v9PwzU4Z8XO1bXdic5wWXx9AzcWXUjkDQnUsQj2/hmAKxMYrWp2swJ
         PyDQ==
X-Gm-Message-State: AC+VfDzjtUwi1IAzHJZCTzGrVbNZ6Narc5GQmm/sL6tjUzX3pM+seC4o
	yMdNrZBfGzC9wQ+Vkl0Ggxn1XDFsxRcAYr3VI3A=
X-Google-Smtp-Source: ACHHUZ6bKw+xO2Bhla+AQ7vx8Wk+jL8nniGnObVgXoVifJR/e4fSDay+JbE3AgzoroxgdbY42xzmtWIrtoNB7IxgXqg=
X-Received: by 2002:a2e:894b:0:b0:2b1:ee25:973f with SMTP id
 b11-20020a2e894b000000b002b1ee25973fmr2119644ljk.39.1686128464475; Wed, 07
 Jun 2023 02:01:04 -0700 (PDT)
MIME-Version: 1.0
References: <76fc64335d45702735bf1c168cf67f6af5e2d47c.camel@linuxfoundation.org>
 <27537.1686038488234786413@lists.openembedded.org>
In-Reply-To: <27537.1686038488234786413@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 7 Jun 2023 11:00:52 +0200
Message-ID: <CANNYZj90-O4sMHQkMCCj8rOhf90i8h+faNQ9LWqzWUS7puBDHw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] fixup! fix: reproducible builds for initramfs
 and UKI img
To: Frieder Paape <frieder@konvera.io>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jun 2023 09:01:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182463

It's better to resend the whole patchset as v2.

Alex

On Tue, 6 Jun 2023 at 10:01, Frieder Paape <frieder@konvera.io> wrote:
>
> The failure happens because `touch` doesn't create a file if called with the no-dereference option `-h`.
> Removing `-h` from affected touch command.
>
> Signed-off-by: Frieder Paape <frieder@konvera.io>
> ---
>  meta/classes-recipe/image_types.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes-recipe/image_types.bbclass b/meta/classes-recipe/image_types.bbclass
> index f73b4d965e..023eb87537 100644
> --- a/meta/classes-recipe/image_types.bbclass
> +++ b/meta/classes-recipe/image_types.bbclass
> @@ -150,7 +150,7 @@ IMAGE_CMD:cpio () {
>                  ln -sf /sbin/init ${WORKDIR}/cpio_append/init
>                                  touch -h -r ${IMAGE_ROOTFS}/sbin/init ${WORKDIR}/cpio_append/init
>              else
> -                                touch -h -r ${IMAGE_ROOTFS} ${WORKDIR}/cpio_append/init
> +                                touch -r ${IMAGE_ROOTFS} ${WORKDIR}/cpio_append/init
>              fi
>              (cd  ${WORKDIR}/cpio_append && echo ./init | cpio --reproducible -oA -H newc -F ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cpio)
>          fi
> --
> 2.39.2 (Apple Git-143)
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#182416): https://lists.openembedded.org/g/openembedded-core/message/182416
> Mute This Topic: https://lists.openembedded.org/mt/99359051/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

