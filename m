Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1FE7C4332F
	for <webhook@archiver.kernel.org>; Wed, 14 Dec 2022 16:08:55 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.108440.1671034133898999218
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Dec 2022 08:08:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=Ti1qXsJl;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.42, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f42.google.com with SMTP id fc4so45604137ejc.12
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Dec 2022 08:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xyK1RLOExPYDsy8GhHthg65lVnQoCawL/DmwogWqkIA=;
        b=Ti1qXsJlkj/J1pSGGkEYlZmiwEF88b5+7999N47S3WmPGR8qMcKl47NXgJUrRlE4Pl
         w7Q7q0TpD18QcmQFkOoQlqa3nZMb/ZuUC61yjhqJa/cjMMVd5YewmFeplr1et2RqU3H6
         RSEpF/SmlPV5SIqYp44EYC+E8qw0Q3p4aAuXH0ZoVV/Bm3Q8UL370YaipzX5dl4jm+0h
         JbP/VlxJlOUOEUXhNNpQ6c5HrJNkJpFc/CXrDCSUR3IvAEwKdVU0jpvtShsI02M2LNzF
         ucgbAk0fulDMycEyqoUgsdTxG4Fcy9RRBxXwV8QGMX1NSM2/gyE2bBQBlXHG2MDKVxT5
         PogQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xyK1RLOExPYDsy8GhHthg65lVnQoCawL/DmwogWqkIA=;
        b=0wGiqIr2TOm5kzciaiEWiLSKsjWkXhLSvwgsjZn6TrhXdqH6SqkYCE8aQTbCxfSj8S
         j0YKI02YYrzOYYJwHMYEHyN7lpqnHxzUkdec2mxB5dYNmFd5gFeU0JJ9DH2hd+zAKGhb
         3DKP6K4MML5zJgm8XmmySqnUHYYpkj6I/NO8U/S0sKwcFjx7HX9gRh+01OpIVXm7ifvW
         7iiTb+HIfgRsasrIKgFVIi5HlMCj437j9nMU4ssKt/8bKfEZlFuvvWMbE7w4L3yoHVlc
         VLekLxLxCQWaf+/Fhi8TePcsW/HRcnQolj+U72OVVyDMryXgaWuphjqyqkVZnJd5lAa/
         bJiQ==
X-Gm-Message-State: ANoB5plVAFg1sj3PDnk4L1xX6OpZn23OvI1J9A0EIlKs2R52HcoOap2V
	8zZKkV7xWKSw5Wvf6lvYEbvF4bmThCSyMF0vCG6EoA==
X-Google-Smtp-Source: AA0mqf6giubGIXnnTr/qpGi/D6cQFbS7IH4D7feXnl0M87FXzoDizVJiZqGdOFLssNVjO3vGjtGa/a1demwkRtVb2/Y=
X-Received: by 2002:a17:906:fa98:b0:7c0:a8ff:3380 with SMTP id
 lt24-20020a170906fa9800b007c0a8ff3380mr28934862ejb.92.1671034131893; Wed, 14
 Dec 2022 08:08:51 -0800 (PST)
MIME-Version: 1.0
References: <20221214142854.2300854-1-rybczynska@gmail.com>
In-Reply-To: <20221214142854.2300854-1-rybczynska@gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 14 Dec 2022 06:08:41 -1000
Message-ID: <CAOSpxdYBQpVbgUHCNmpjVGnNYCwF-A4bhidQHtXOAN56gHSoZQ@mail.gmail.com>
Subject: Re: [kirkstone][OE-core][PATCH] efibootmgr: update compilation with musl
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Marta Rybczynska <marta.rybczynska@linaro.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Dec 2022 16:08:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174557

On Wed, Dec 14, 2022 at 4:29 AM Marta Rybczynska <rybczynska@gmail.com> wrote:
>
> Since the commit 005b6aba89eaf1b79fdd7565dd028fdd9bbfcc7d
> (efivar: add musl libc compatibility) efibootmgr compiles with
> musl too. Update the variable to take that into account.
>
> Signed-off-by: Marta Rybczynska <marta.rybczynska@linaro.org>
> ---
>  meta/recipes-bsp/efibootmgr/efibootmgr_17.bb | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/meta/recipes-bsp/efibootmgr/efibootmgr_17.bb b/meta/recipes-bsp/efibootmgr/efibootmgr_17.bb
> index 11d8b9061d..be6571b3fa 100644
> --- a/meta/recipes-bsp/efibootmgr/efibootmgr_17.bb
> +++ b/meta/recipes-bsp/efibootmgr/efibootmgr_17.bb
> @@ -34,6 +34,4 @@ do_install () {
>  }
>
>  CLEANBROKEN = "1"
> -# https://github.com/rhboot/efivar/issues/202
> -COMPATIBLE_HOST:libc-musl = 'null'

I see that master also has the above -- should it also be removed in
master?  If so, resubmit for master and I will backport to kirkstone.

Thanks!

Steve

> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#174555): https://lists.openembedded.org/g/openembedded-core/message/174555
> Mute This Topic: https://lists.openembedded.org/mt/95667399/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

