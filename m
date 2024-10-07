Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 276FBCFB440
	for <webhook@archiver.kernel.org>; Mon,  7 Oct 2024 11:57:33 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web11.51191.1728302250675327763
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Oct 2024 04:57:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=knQSEKZi;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2fabe5c8c26so38140841fa.2
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Oct 2024 04:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728302249; x=1728907049; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gAPGVIUVh9dn2ig7pcRXVRYNyLMOvbwxQYG94BskJFw=;
        b=knQSEKZi9wMqOIQyOjcM5tva3ncaWPig7El7WWxgy8rGUDR8Om4+bPwbmMnTKzO3Zv
         vb8YmkOoljzrolyDeRzPUxvdQVgDLuLzT7cEjAbB0Du33OAnGPqpb+GS8W8kzlJYfwXx
         pZSjtOIq2gRFk3iF2NsENg30RhzxKctz/LeGe/o4vXv3sFz0TluYmhBwqeEejkg5fEOL
         9P0QBhlhr57KXSkY0M6bwBKzfyT2eqrO/HZAqVRgFgHCyRLtJ+iRPNH8xJ0u+/2LFAfu
         7oyAbsnzt67os+cEWPO1aQjD9dXBJZIgf6mpT/b0aKWY/rtaovy8X1/c4Pp4wCCEvRDz
         fMNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728302249; x=1728907049;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gAPGVIUVh9dn2ig7pcRXVRYNyLMOvbwxQYG94BskJFw=;
        b=CRgFHL5r7fqiMKSaoUaJ6E2T/mkkIFpRpcJiGpFpD/L050+jekDeCepcH4tPQtyeVk
         3SnAq6LGQRGJqH+801n6Z6Y1m2yDFqZGQ+GxgkHrKiUpoBjDG+nPm06W0GflmB2FJ6yL
         eiTxU9UaqtL6/y5S0yluznK++tXfYL1vwR2Gbcwviakrol0NKA3cTAgahjGb5z7+c03T
         Pkv+Iz2ihzHI8VZ0GppqFvow8fR3Pg9ob9G/bj4e/bV/cO1Q6MMoANFtRuQZrb93Q9C5
         6OirMkkdRQWvyjEyS5Whe4j8ByRfIjoJz/LPIej/OFmJHRrRBOm3kvqaw75M0GajLA8Z
         Dzig==
X-Gm-Message-State: AOJu0YzNqkDFKUGNI/UwuYEh0bA2UDmuRv2gcaZBb5OLyUpHNM7pkOHn
	MxmFQuTykaTsQbbsLcbI3V6Cx22Eb9+WHowZ0CzhP5EhXinCCB72j8NQs80QuCiAedx+mvIWmPl
	BinCZqt0WUGBzu2c/hOR7GEbcJh8=
X-Google-Smtp-Source: AGHT+IHJD0dYLgzRoTVHA4uT2we8H09UvEyZvKuArQEEuVhz9CH9WTfu8nD1aWGtbI6MrJ9AtT6NSxvbilPEOODWVh0=
X-Received: by 2002:a2e:b162:0:b0:2f7:6653:8046 with SMTP id
 38308e7fff4ca-2faf3c50c27mr43840091fa.25.1728302248529; Mon, 07 Oct 2024
 04:57:28 -0700 (PDT)
MIME-Version: 1.0
References: <20241005004451.79575-1-yumx@amazon.com>
In-Reply-To: <20241005004451.79575-1-yumx@amazon.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 7 Oct 2024 13:57:17 +0200
Message-ID: <CANNYZj_Z87h02RJuzXVTgpb0eLsJRapWQo4sXySp45uL0B+dkw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] sstate: remove corrupted artifacts from local mirror
To: yumx@amazon.com
Cc: openembedded-core@lists.openembedded.org, 
	Przemyslaw Sobon <psobon@amazon.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Oct 2024 11:57:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205261

I don't think I can agree with this. This means stability regressions
in one's network infrastructure will go unnoticed and unfixed, and
goes contrary to some people wishing to know immediately when
'corrupted sstate' occurs, and fix it there and then. Similar patches
have been rejected in the past.

Please fix your infra.

Alex

On Sat, 5 Oct 2024 at 02:44, Yu, Max via lists.openembedded.org
<yumx=amazon.com@lists.openembedded.org> wrote:
>
> We observe sstate cache corruptions sometimes which cause rebuilds. That is not
> a fatal error as the package has to be rebuilt and updated artifact needs to be
> pushed to remote sstate cache mirror. Currently, Yocto does not handle
> corruptions properly, where the corrupted artifact is not deleted or
> renamed. Later, after the package is built the same corrupted artifact is pushed
> to remote mirror and the same procedure is circled again and again.
>
> This change verifies the outcome of the unpacking action and renames the
> artifact if a fatal error occurred ("tar" tool returns error 2). In such case we
> rename the artifact what causes that a proper one is created and uploaded
> overwriting the exisiting one - the corrupted one - in the remote mirror. That
> way we break the loop of uploading corrupted file again and again.
>
> Suggested-by: Przemyslaw Sobon <psobon@amazon.com>
> Signed-off-by: Max Yu <yumx@amazon.com>
> ---
>  meta/classes-global/sstate.bbclass | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
> index 11bb892a42..5a7ce35341 100644
> --- a/meta/classes-global/sstate.bbclass
> +++ b/meta/classes-global/sstate.bbclass
> @@ -937,7 +937,12 @@ sstate_unpack_package () {
>                 ZSTD="pzstd -p ${ZSTD_THREADS}"
>         fi
>
> -       tar -I "$ZSTD" -xvpf ${SSTATE_PKG}
> +       if ! tar -I "$ZSTD" -xvpf ${SSTATE_PKG}; then
> +               echo "Fatal error extracting sstate cache artifacts, file might be corrupted or truncated, renaming"
> +               mv ${SSTATE_PKG} ${SSTATE_PKG}.unpack_error
> +               exit 2
> +       fi
> +
>         # update .siginfo atime on local/NFS mirror if it is a symbolic link
>         [ ! -h ${SSTATE_PKG}.siginfo ] || [ ! -e ${SSTATE_PKG}.siginfo ] || touch -a ${SSTATE_PKG}.siginfo 2>/dev/null || true
>         # update each symbolic link instead of any referenced file
> --
> 2.40.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#205237): https://lists.openembedded.org/g/openembedded-core/message/205237
> Mute This Topic: https://lists.openembedded.org/mt/108828269/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

