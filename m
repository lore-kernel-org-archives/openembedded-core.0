Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98A61C61DA4
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 13:57:14 +0000 (UTC)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
 by mx.groups.io with SMTP id smtpd.web11.7331.1676383025554801962
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Feb 2023 05:57:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bGkmT9GJ;
 spf=pass (domain: gmail.com, ip: 209.85.166.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f44.google.com with SMTP id o1so5834995ioo.10
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 05:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=17G6nRllbq5f9vqKaRS3fALUQhJcG03BF6JH7RrXSOA=;
        b=bGkmT9GJK7yojpTA6Hc8auxxU0FpCMDCM8PbsaAUZc+OlHWLplRZiXhqx9htIzf09j
         xcUpL5dnAhaTQ7sTB5LGNqz+qKmDKWXk3m3TAdPm1hkpW4Q1Ejk5zsUJelWgESh1PW7W
         ObDPirrShVBKZ79ZMehwf554ZHQpARytfQSWZ1UxnwohL2Qmt0eVVJHSak03C3WtwsZS
         V7q/FziyzgUFhezAF15xFj6VqZL407MuSAhLrJDvkeBhWc6njTFvZ46YqYJtnkAVdppo
         YM0JI/ZN8a0qopVM4QH19i++Xn0HehES8kN8Ulq+CTBR34w3DyjLjxMPZzbuT3/nr54t
         aWTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=17G6nRllbq5f9vqKaRS3fALUQhJcG03BF6JH7RrXSOA=;
        b=FNrG7K2meAStHcJUI7AzCe/8/Ied8lwfsr525Jk2XpYGcj0bNua73x7IxZf7txIMFK
         lEsLor1PdXYDLBGQPHs59lx3xq0Jaho2eKWk4u799EtOFXm6FmHv+LjdO7duk4KfcTTG
         Gy3tOj72VXx66Lf3tNS0+aGuS8sufvWjfvoQke67utHHqoP1uZP29uMLZWitwtVV0CdI
         nhYMK0ezQJVt9KF863w5wMsWJOGAHsHUYe1q/Ytez9vakMZz6njr3LCSQQgoN3t5BBRF
         5KG5tqGVTO6cbXttgGWwFGzBLdnfjFr/cUyoNqdE48codRihC/dcBpSALpsr8T3z1w4H
         5yxg==
X-Gm-Message-State: AO0yUKWIIslzbkbGBJzG2U+phjgS2CejEyYQdjbaFrrhhtVTxqWu9olv
	7LnsY82TExLyZNWv9MU9PXT5l8fHdsW5jYo5aj8lQFSnHug=
X-Google-Smtp-Source: AK7set8MQY/8daZGPn0L7t2c4UJ0FnnWFuuYf7XTbGIcUqJhgo275MCWwZ7CmM9wJT1OMYmkx/SydaCeMWd7MQMqX2k=
X-Received: by 2002:a02:9401:0:b0:3a7:e46f:1016 with SMTP id
 a1-20020a029401000000b003a7e46f1016mr439793jai.0.1676383024726; Tue, 14 Feb
 2023 05:57:04 -0800 (PST)
MIME-Version: 1.0
References: <20230214102646.3390984-1-u.oelmann@pengutronix.de>
In-Reply-To: <20230214102646.3390984-1-u.oelmann@pengutronix.de>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 14 Feb 2023 08:57:29 -0500
Message-ID: <CADkTA4PM7ARZ_qyFE3YvThCoTPo9Pbad2MxbchoZsFXEU979tg@mail.gmail.com>
Subject: Re: [PATCH] kernel-yocto: fix kernel-meta data detection
To: =?UTF-8?Q?Ulrich_=C3=96lmann?= <u.oelmann@pengutronix.de>
Cc: OpenEmbedded Core Developers <openembedded-core@lists.openembedded.org>, yocto@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 13:57:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177148

Indeed.

Clearly not something anyone is using very often. Good catch on that typo!

Bruce

On Tue, Feb 14, 2023 at 5:26 AM Ulrich =C3=96lmann <u.oelmann@pengutronix.d=
e> wrote:
>
> Fixes: 7ef7af5c03ba ("kernel-yocto: restore kernel-meta data detection fo=
r SRC_URI elements")
> Signed-off-by: Ulrich =C3=96lmann <u.oelmann@pengutronix.de>
> ---
>  meta/classes-recipe/kernel-yocto.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-reci=
pe/kernel-yocto.bbclass
> index 1a6695ba7e35..7de99cff5642 100644
> --- a/meta/classes-recipe/kernel-yocto.bbclass
> +++ b/meta/classes-recipe/kernel-yocto.bbclass
> @@ -212,7 +212,7 @@ do_kernel_metadata() {
>         # SRC_URI. If they were supplied, we convert them into include di=
rectives
>         # for the update part of the process
>         for f in ${feat_dirs}; do
> -               if [ -d "${WORKDIR}/$f/meta" ]; then
> +               if [ -d "${WORKDIR}/$f/kernel-meta" ]; then
>                         includes=3D"$includes -I${WORKDIR}/$f/kernel-meta=
"
>                 elif [ -d "${WORKDIR}/../oe-local-files/$f" ]; then
>                         includes=3D"$includes -I${WORKDIR}/../oe-local-fi=
les/$f"
> --
> 2.30.2
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

