Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A68A9EB64D8
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 16:24:58 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.16145.1687451097334412124
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jun 2023 09:24:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=oAO7Uuue;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-4f64fb05a8aso10166780e87.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 09:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687451095; x=1690043095;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q8o4zC1YGqE6TZQ+xHcD7QTWUb+svquzjIElQu88crA=;
        b=oAO7UuueErSKzIxcsZcAtJkA/VPxfRjL/lXoiEa3jShWaPqHpDvuRUFT8AomhTeE8Q
         A5EtR6OA0DV+OUmPq1AJFWL/ZL+JcCs56jMtmUQDrVBF325PAXpzByyXgWa2BTYZKpzM
         R+ny9BmAeJwNApJFPk1bmOuGqTnXBKMtEK0qPGeN5BvNqpURenZIS9PONmpCFb2oDXEL
         vIr/kfPC/gY6yQiH7AFF6RzMKtkC1tvJ4wEw37+O04nXD07B8PPFWw9qxTvRAffDnbio
         fkIshEvLuLEjy62N07vC5gPa1ETpXaTdjw13GSBT5x+10LAYHaRYhQXc6vo3NQgQ6W4H
         FfLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687451095; x=1690043095;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q8o4zC1YGqE6TZQ+xHcD7QTWUb+svquzjIElQu88crA=;
        b=eh8Pl2S6qZuncMoV69iNmcReDgvYtaUf+qnSMRw1hsBa9dj5E7y8F1f0fqj8FqjdRT
         mHR6QlUTKfZIMifNdjivQMpOiUKb7cKENOewhKWMkIh/mBISRCiygzlVDhXz6VsF2x1a
         vHG/3mRjfExyCuuSBJ5UFcUbymIzuDth/PTtR625NDjPRQH8V0GmKjZdlabvtu8dOsgk
         N1F661CB56RB2kmWoBuzOJTq1LtsUM27UrAtM7/0qm5wRyIA/4oRLPHGej0GW7QGroa8
         seijK975a2s1HVZZ9E9ugpCLg77yl321bITCD+qTwCqVX6pCH8I0dVWyL55qiatKIukR
         WsYQ==
X-Gm-Message-State: AC+VfDzxZkJOUfzuRrqsKcz/AAxFjjEaYGcLtriU2qfGl8a6yeUTVF2m
	MV+O0bVNqmcscjSmXM6e5SneRbd6/72wK9wq/vM=
X-Google-Smtp-Source: ACHHUZ5C4OyHu3xLBSCyJbYD4EBYN7pZprkj16zEZNIlTEhdC/f8GZ22Gg7xWZpuu7+c0v7h8IxqreMwWz+gTmzYjxw=
X-Received: by 2002:ac2:4d8b:0:b0:4f8:6e16:fca2 with SMTP id
 g11-20020ac24d8b000000b004f86e16fca2mr8550131lfe.18.1687451095193; Thu, 22
 Jun 2023 09:24:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230622161749.797820-1-maxime.roussinbelanger@gmail.com> <20230622161749.797820-2-maxime.roussinbelanger@gmail.com>
In-Reply-To: <20230622161749.797820-2-maxime.roussinbelanger@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 22 Jun 2023 18:24:43 +0200
Message-ID: <CANNYZj8KCSygjo9EPUD91oqOzdZhBkYVrJCVthu66bBSoQz8Jg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 2/3] insane: ignore nativesdk-${PN}-src host
 contaminated issue
To: =?UTF-8?Q?Maxime_Roussin=2DB=C3=A9langer?= <maxime.roussinbelanger@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 16:24:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183266

I'm not sure I understand this. The check is to ensure build process
works as it should, specifically to prevent build host ownership
leaking into packages. Yes this information doesn't matter when these
packages are installed, but it matters for correctness of the build.

Alex

On Thu, 22 Jun 2023 at 18:20, Maxime Roussin-B=C3=A9langer
<maxime.roussinbelanger@gmail.com> wrote:
>
> From: Maxime Roussin-Belanger <maxime.roussinbelanger@gmail.com>
>
> nativesdk-${PN}-src will be installed to a different machine and files
> ownership will change at install. Since the ownership will change based
> on how the user will install the sdk there is no point in checking
> ownership
>
> Signed-off-by: Maxime Roussin-Belanger <maxime.roussinbelanger@gmail.com>
> ---
> v2: New commit
>
>  meta/classes-global/insane.bbclass | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/ins=
ane.bbclass
> index a4dbc9a123..82ea834f99 100644
> --- a/meta/classes-global/insane.bbclass
> +++ b/meta/classes-global/insane.bbclass
> @@ -1116,6 +1116,9 @@ def package_qa_check_host_user(path, name, d, elf, =
messages):
>      if path =3D=3D home or path.startswith(home + os.sep):
>          return
>
> +    if name.startswith("nativesdk-") and name.endswith("-src"):
> +        return
> +
>      try:
>          stat =3D os.lstat(path)
>      except OSError as exc:
> --
> 2.36.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#183264): https://lists.openembedded.org/g/openembedde=
d-core/message/183264
> Mute This Topic: https://lists.openembedded.org/mt/99701051/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

