Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5343C3DA7A
	for <webhook@archiver.kernel.org>; Fri,  6 Jan 2023 17:09:21 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.19454.1673024954431445530
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jan 2023 09:09:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ArFngYDV;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id s22so2077634ljp.5
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Jan 2023 09:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wrOL77uxH5rbIVjxqe/iQkRZGRmZCQdoD3+ez1XDhIc=;
        b=ArFngYDVo8yPur+GRcTLM9lOgxQlOOW95cJcnZar7ZBzA2zkTq8yLyZ0upLO3OWRty
         bhQD6MALKkpE0fif7jARue27WLbef/4LsltQulpTSS9Qyk/P8A9vuPO9ag5LGe6chfm0
         cTJgaF/YH9mR/5uLqyTD4yX5IqYUdb48GZDz4ByiFyCHtNUWMvWw/wmFnxFN7WRKgQa+
         SXc2azbNCM6ImsibTSTMQFlHqLqA7KrjarLt58fOArOBFeauwOpBsHd/pCDsgz5tTWSH
         lg6hcIG9ijCCioFAEBGT/uNH0u2BZ4YkRlmX0u68CINiTEbBb0RkhBDqwaJlVnGMOuya
         2Row==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wrOL77uxH5rbIVjxqe/iQkRZGRmZCQdoD3+ez1XDhIc=;
        b=OkiKO2SzoW+98caNoBtK7KNA8av2dL5bDoXYIK7UzOM4rZgFJ65IoheAgqgyBus+4l
         S6IVNsFbLKkAxmlaub43TPHacEAmeAjb4fHET8qYRmRuYMeFs4UoEE6PDqpjqEls+JDi
         7qYc15SxjAy+4jbsbTuWebDBzw18u7YSe6QdO9+noDpwtwn9gXYYZZPwXrpMperMg6Yc
         ij8Ek1Ycru1wVdwEydlKeY9EjXGPKI2rtKB/DnuoI5k+n3hrgEnkF6RXy+6LOROTspdS
         AG/xBnt0Ap59lA3tWjBUkCHqvI7oo2pLbA8SSmfjE56Z7yQD6TnOh4QUGPJI603spzcx
         RkSA==
X-Gm-Message-State: AFqh2krEAyV+tR+FUeifz63bKn6GIhHtQT0mzH7trfe/hWo6Rb8+pe/E
	KVoqvcXGD4KelSYwNco7lzGDY8sMaCvYwViyvQI=
X-Google-Smtp-Source: AMrXdXt6vGl0hxJutbpP8TWNhEvnN5XqcEAbaqE2KZNWTMJ+9sdAwBXhqZLd2Rq4kl78NH/0JRKh5Y4utfbjQFf9MFk=
X-Received: by 2002:a2e:b4a5:0:b0:282:5f2d:62dc with SMTP id
 q5-20020a2eb4a5000000b002825f2d62dcmr95745ljm.217.1673024952637; Fri, 06 Jan
 2023 09:09:12 -0800 (PST)
MIME-Version: 1.0
References: <20230106161621.1288055-1-ross.burton@arm.com>
In-Reply-To: <20230106161621.1288055-1-ross.burton@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 6 Jan 2023 18:09:01 +0100
Message-ID: <CANNYZj8dcuCD8qoVBxbbgAKD_ROvHQezVD-kRghObFXMnto=kg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] elfutils: disable deprecation errors in all
 builds, not just native
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org, nd@arm.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jan 2023 17:09:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175602

But how did this make it through all the builds? Something doesn't compute here.

Alex

On Fri, 6 Jan 2023 at 17:16, Ross Burton <ross.burton@arm.com> wrote:
>
> The curl-related deprecation errors affect all builds not just native,
> so set CFLAGS instead of BUILD_CFLAGS.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-devtools/elfutils/elfutils_0.188.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/elfutils/elfutils_0.188.bb b/meta/recipes-devtools/elfutils/elfutils_0.188.bb
> index c94e36071cd..084908a38c0 100644
> --- a/meta/recipes-devtools/elfutils/elfutils_0.188.bb
> +++ b/meta/recipes-devtools/elfutils/elfutils_0.188.bb
> @@ -34,7 +34,7 @@ EXTRA_OECONF = "--program-prefix=eu-"
>
>  BUILD_CFLAGS += "-Wno-error=stringop-overflow"
>  # compatibility with curl 7.87; can be removed when elfutils upstream fixes the deprecation fails
> -BUILD_CFLAGS += "-Wno-error=deprecated-declarations"
> +CFLAGS:append = " -Wno-error=deprecated-declarations"
>
>  DEPENDS_BZIP2 = "bzip2-replacement-native"
>  DEPENDS_BZIP2:class-target = "bzip2"
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#175598): https://lists.openembedded.org/g/openembedded-core/message/175598
> Mute This Topic: https://lists.openembedded.org/mt/96096249/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

