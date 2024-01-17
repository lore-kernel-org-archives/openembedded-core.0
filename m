Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50B6CC47258
	for <webhook@archiver.kernel.org>; Wed, 17 Jan 2024 17:51:31 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web10.10033.1705513887664002762
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jan 2024 09:51:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hlCRhm+L;
 spf=pass (domain: gmail.com, ip: 209.85.210.43, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-6ddeb015ec6so6121444a34.0
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 09:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705513887; x=1706118687; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ftRCmF5rWkaCtFjYuUMpJW9EgB1fSLfU9hV8jP9ISUs=;
        b=hlCRhm+LW0gX/rxa1Xfsb1Bb4rXlsRvb6DmabcYkKMlQNWizb1GVXBt9Jk+eTx7M1U
         w974dvh2hZFjYbt6UhIaZwIhavsxwYjlve9rD9bwT9aZ0bVxt1OBQGlcZPoF5v9CqvnB
         j44AmTpCuC1Q9IXMIEK1k0+AEiWwv7yUGE8Ehx2CINIi28OMeochnG575NB9pW570+Wj
         oFfwCM6OkdAh5MJjGvM/ToGds/9LkLjwhDLcSjRKEPH2X7Bfn/ekyeM+aQozWDXgITyr
         H1PbxxvZNrc+Oeyj03X9osT1gqL6nGihlIQ1pEqoqE+c1NpIADiWdB2W216wUQ6kNi0f
         f/+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705513887; x=1706118687;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ftRCmF5rWkaCtFjYuUMpJW9EgB1fSLfU9hV8jP9ISUs=;
        b=VWVBDqr8gazopv1cN1P6/XMkJObSyHXqovNqaKbTTPeDLtaQijD59lX8Dx336XE9Kz
         upoHC+E+h61Ai8Y9ZCik4rO4EgJmudqPJxy7Mxmk++A7TIlSUEc1y3BCk93//Mb8c9iW
         TpZDD07gegOpcD/wf279JnPzikdLjAteH/mAq4KBINHCbZBjaYXnk7gEXACAz5NW0rVd
         H07mZ/h/q4GOEswL7hOTOmKJ8ZFqfowhZoHp/TCrTwQSmZY5r9x8K2ApsiCuWCC1KdsS
         Vv1HXtZktgWzRAYtCmE9ocsOdGCOaL7d9fYUXuT3GORC8LnMuEDEpRLIJtJzzGpq7HOD
         ZD/g==
X-Gm-Message-State: AOJu0Yz3ZzYoJ3FczeOLZMtA3jIuQOqm2H8iyg+yunjdKXMjLqkbSzVF
	IBLw/1daBsiSw5FtJK6LQZQ01Mh1VX5YiynG3Tw=
X-Google-Smtp-Source: AGHT+IGTSygIeawxr2eNXPnml/fWrio/2qEMXStQgI+smwdBi31SBPasC73WY6b8eknNkbKwgupoLp3KdWuClZRTF7Y=
X-Received: by 2002:a05:6870:d393:b0:210:95d2:3e1d with SMTP id
 k19-20020a056870d39300b0021095d23e1dmr1973093oag.40.1705513886793; Wed, 17
 Jan 2024 09:51:26 -0800 (PST)
MIME-Version: 1.0
References: <20240117150720.3585669-1-ross.burton@arm.com>
In-Reply-To: <20240117150720.3585669-1-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 17 Jan 2024 09:51:00 -0800
Message-ID: <CAMKF1srk7GauhcSYZgda-RnFni4A2eLdZo7s_GwJZ3Wv9PXQKg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/4] musl: doesn't support riscv32
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 17:51:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193942

On Wed, Jan 17, 2024 at 7:07=E2=80=AFAM Ross Burton <ross.burton@arm.com> w=
rote:
>
> From: Ross Burton <ross.burton@arm.com>
>
> musl doesn't support riscv32, so set COMPATIBLE_HOST appropriately.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-core/musl/musl.inc | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-core/musl/musl.inc b/meta/recipes-core/musl/mus=
l.inc
> index 66468e92ff0..6ca52b186a5 100644
> --- a/meta/recipes-core/musl/musl.inc
> +++ b/meta/recipes-core/musl/musl.inc
> @@ -25,6 +25,9 @@ MIPS_INSTRUCTION_SET =3D "mips"
>  ARM_INSTRUCTION_SET:armv5 =3D "arm"
>  ARM_INSTRUCTION_SET:armv4 =3D "arm"
>
> +# 1.2.4 doesn't support riscv32
> +COMPATIBLE_HOST:riscv32 =3D "null"

there is a port in meta-riscv for RV32 which is WIP for upstreaming.
I think it is better to direct folks to use meta-riscv until then

> +
>  # Enable out of tree build
>  B =3D "${WORKDIR}/build"
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#193919): https://lists.openembedded.org/g/openembedde=
d-core/message/193919
> Mute This Topic: https://lists.openembedded.org/mt/103787497/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

