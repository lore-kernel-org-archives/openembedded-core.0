Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DED2C48BF6
	for <webhook@archiver.kernel.org>; Thu, 29 Feb 2024 13:27:03 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web11.24578.1709213215215930676
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Feb 2024 05:26:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N0ZMHZ+d;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-5dc20645871so578430a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Feb 2024 05:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709213214; x=1709818014; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=532QvEs2yFrBKGLJzp1tC4c4ID2iVNcDsxnjApgOqRQ=;
        b=N0ZMHZ+dOF0LYYN/KrI+V8ObY43moSa0Wh81xyN/i0TUMaBO7wmEIT5u0iUjCurwae
         CwwVoegvceoLOUVtqoqzSHGba5tvQmGEzSLGmbBmQ1TE/Kex6Ehs+OwLO9iR6IH/WrI1
         FzJ+b8mppkUhK/ABVGvUAqcajHJ4xvhAbx1ep10oHn5hUicQthcrw8if92We36aOxoXg
         PqDW7WPAhdGNt53EtUOeY9wbXiW5nuaUFNd/kiSN4aUyviGf7Iceph2iSpTn8tSYnYby
         H6biWQ3eulIf/sFNrY/Uma4M3h2Zaii/GXu/MINYmRbAwx+Bb4ZrkCJxiMrUAIGciJRT
         xWTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709213214; x=1709818014;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=532QvEs2yFrBKGLJzp1tC4c4ID2iVNcDsxnjApgOqRQ=;
        b=EIu1bkhJ7CAQTnK23C3bhDInlR0mEWz8X4Iiv1frX0WcdRu8wW8SVcOc3l30yiAyvA
         URJdX9FJzp0s1Fao0p5bwLpEqJkn90w6yish2G2xMhPCdYHdSfByMYcADvv6lFCLw98E
         22R7j3gmbIFYTFiSOO7PXU2BUH/wtJy8VhRKV0TGocr1nppJ1HmeYXCmsHKkRbAFsEm4
         md65lt/9ukGHdBfZVqDWa5VTth8YX5bFuLBnUSCbY3EJWNUHvZgrpSmaUQ01h2G1r3RS
         wbyYvKqMMJ+C+SzOB3lGm1bbLpXzCyg+b+HCspqSPCuDmWDc2Mnw3wTFwDGKPVnoLeH7
         OJwg==
X-Gm-Message-State: AOJu0Yzn3yPTcetut6xZAr5XCiETkRLZGZEIYw5v3bmydkfDjY6lFrHM
	AUajNyyiFy07Pgp1SgdS0c41i+miplr04NeR+gKdwKy5fiqeNeV2pJPOCucba/P9veMk0/G6sJi
	moBH+0bUXBKyDXz33+u/TKUvnkpE=
X-Google-Smtp-Source: AGHT+IHcaKjWMUesn5lFV98p9vu/bvPS0A0Ql0c7GzUiw4vTEKV8d7WJe2/f0m4JElaFuCtHR9ELZIwwSx0Yu8mdovk=
X-Received: by 2002:a17:903:2442:b0:1db:b96f:4a50 with SMTP id
 l2-20020a170903244200b001dbb96f4a50mr2695527pls.14.1709213214410; Thu, 29 Feb
 2024 05:26:54 -0800 (PST)
MIME-Version: 1.0
References: <20240229104940.928214-1-ross.burton@arm.com>
In-Reply-To: <20240229104940.928214-1-ross.burton@arm.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 29 Feb 2024 08:26:42 -0500
Message-ID: <CADkTA4MvOHv=Aa85g-jzcT84jKRW4g1ZCK6O5QX-Te06L7_m-A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] linux-yocto: update yocto-kernel-cache to fix
 CONFIG_DEBUG_CREDENTIALS warnings
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Feb 2024 13:27:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196435

On Thu, Feb 29, 2024 at 5:49=E2=80=AFAM Ross Burton <ross.burton@arm.com> w=
rote:
>
> From: Ross Burton <ross.burton@arm.com>
>
> Incorporate the fix for upstream removing CONFIG_DEBUG_CREDENTIALS in
> the stable branch.

Please don't merge this, it makes handling my local patch queue more diffic=
ult
to handle.

I have more kernel changes staged and this will come out with that series.

Bruce

>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto_6.6.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-=
kernel/linux/linux-yocto_6.6.bb
> index 2d218692e28..beb26281215 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
> @@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?=3D "e064a7d658a30b027b999183e2=
1cd37305caff2a"
>  SRCREV_machine:qemux86-64 ?=3D "e064a7d658a30b027b999183e21cd37305caff2a=
"
>  SRCREV_machine:qemumips64 ?=3D "52456b6cb3393c1848da3ccdae37727c31896f1c=
"
>  SRCREV_machine ?=3D "e064a7d658a30b027b999183e21cd37305caff2a"
> -SRCREV_meta ?=3D "c97276cdc9d89cceef61184e296e5c837a265ed1"
> +SRCREV_meta ?=3D "229dc6171461800d7b4ab16f9c8b35a47a48897f"
>
>  # set your preferred provider of linux-yocto to 'linux-yocto-upstream', =
and you'll
>  # get the <version>/base branch, which is pure upstream -stable, and the=
 same
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196428): https://lists.openembedded.org/g/openembedde=
d-core/message/196428
> Mute This Topic: https://lists.openembedded.org/mt/104640975/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [br=
uce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

