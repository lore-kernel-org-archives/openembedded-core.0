Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EBFDC0032E
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 02:08:13 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web11.61601.1698286084373446019
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Oct 2023 19:08:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CdOVnx33;
 spf=pass (domain: gmail.com, ip: 209.85.167.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3add37de892so216058b6e.1
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Oct 2023 19:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698286083; x=1698890883; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=baaxueBmAKN2JciovcfZ7u+7NhKz4cGV4TxxoRcwHvU=;
        b=CdOVnx33AGPo692EoA2KW9Upm473YleNy6q9U9fAdRIFbOqnayuLyXBegLj3m5hK5o
         JoY1tCew2ImbC06Lo35YuJ45jNVDwzgtmftmb9AbolrRTq3VhIl4D1hOBCzUH+U8w8R/
         XImPPYHzyA7VIqfJSjcj/aRmp/kZ3xwYKYWtZ1vatEfSW1o0hAMynrgcDi5QIueQKrgY
         nkNd8r8gritevJnz0Gh1xiRuw7Dj+xkv853Dg3HZCp+hVDLgrhVZ8hL+9tpXCYTiWxFu
         MWlT2DpkRgbk/cSOlLmTmWt84dAfEQQE5p3hf3sa3NDUouX43e35o+eClJhbCvyqvVDb
         ZI9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698286083; x=1698890883;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=baaxueBmAKN2JciovcfZ7u+7NhKz4cGV4TxxoRcwHvU=;
        b=JrJ+uDgLcvq2fpHkYVOKTIDOKX9EKGY0ddEfaHkSfNNnekogdacooUKjDkUoT+upOL
         AfwtJWaxQZIGJ4MBeYjIZgP/WxLN1FGmJbwMrxlJ21loRNYykqWmbzqA+usbOD1sehLH
         DFtTRNOA8XdLE7SXUoSQd7rRJqm8jXO23iSIPqeW1WCgZr8mZv+YJpscaskI+M8mlp2X
         YZOlGAnPgyYjFL1Okw2Xy5vu6PNc0LFTCeL2njPoLcITWhbguQ806JQtym7qaez8B6n9
         Ga4ujCI57+ylcsESitIJUbGnKERm6Id1erB1cxHFuxVjndKeSsQfdZyF9F7kit3WF8bo
         2WXg==
X-Gm-Message-State: AOJu0Yzi1X4aKat0wd7nQ1gnU8jHZwvLp4QF6Sc2TDBDphhg/zc4xCRG
	0/lDq+P/9cOo9KUxcXUPLwSuimvoXYghPKTSMkc=
X-Google-Smtp-Source: AGHT+IEuNgM0LLWWlzMpKdpw2Q4P77v9sSs2G25bsDShN4FrUJ/CaiatTyU03yH8d6YSVVbfXw9EMZirY+8FeoLqvGk=
X-Received: by 2002:a05:6808:199:b0:3b2:dfa0:aea3 with SMTP id
 w25-20020a056808019900b003b2dfa0aea3mr15292171oic.3.1698286083548; Wed, 25
 Oct 2023 19:08:03 -0700 (PDT)
MIME-Version: 1.0
References: <20231025223710.93502-1-wak@google.com>
In-Reply-To: <20231025223710.93502-1-wak@google.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 25 Oct 2023 22:07:52 -0400
Message-ID: <CADkTA4OucgUogtX6tQ21oD6i1qQ+6qq1uJQG3S8NsChATTr3Ww@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel: Commit without running hooks
To: wak@google.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Oct 2023 02:08:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189695

On Wed, Oct 25, 2023 at 6:37=E2=80=AFPM William A. Kennington III via
lists.openembedded.org <wak=3Dgoogle.com@lists.openembedded.org> wrote:
>
> The hooks are pulled from the impure environment and are often broken in
> our environments. There is no reason to add extra metadata or verify the
> commit message as its arbitrary to turn the tarball into a git repo.

But what about the other uses of git ? If the hooks are broken during
the creation step, other uses of git should also be broken.

We've had the ability to check the git config for quite some time, we
could take it further an inhibit the use of the host config if we are
worried about breakage like this.

Bruce

>
> Signed-off-by: William A. Kennington III <wak@google.com>
> ---
>  meta/classes-recipe/kernel-yocto.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-reci=
pe/kernel-yocto.bbclass
> index 4ac977b122..cb9cd26b09 100644
> --- a/meta/classes-recipe/kernel-yocto.bbclass
> +++ b/meta/classes-recipe/kernel-yocto.bbclass
> @@ -408,7 +408,7 @@ do_kernel_checkout() {
>                 git init
>                 check_git_config
>                 git add .
> -               git commit -q -m "baseline commit: creating repo for ${PN=
}-${PV}"
> +               git commit -q -n -m "baseline commit: creating repo for $=
{PN}-${PV}"
>                 git clean -d -f
>         fi
>
> --
> 2.42.0.820.g83a721a137-goog
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#189694): https://lists.openembedded.org/g/openembedde=
d-core/message/189694
> Mute This Topic: https://lists.openembedded.org/mt/102189231/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [br=
uce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

