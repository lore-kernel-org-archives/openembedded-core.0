Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C047CC61D85
	for <webhook@archiver.kernel.org>; Thu, 23 Nov 2023 08:12:35 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web11.86901.1700727150982298708
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Nov 2023 00:12:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FAttxa1f;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2c875207626so6917991fa.1
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Nov 2023 00:12:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700727149; x=1701331949; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=00iDwY+cpMFooaYxt9QqW1VX/LAQFEkGrE55JwvJt+c=;
        b=FAttxa1fPMu2ql09GVDpZ7IST28grUaOytWsXvdEZgr7+Kdx/2GRtl2A3OWu6qSV+C
         /CLKj+0Q2DgWLgZW4wpkQNOs42SRILXYY4eDmbiy/CJ1HoaUx4u5pMBVh1Pbn2tGKw64
         VKNTfPQ/26cKF9O8P/P4yqLzYfJof7c77ZnhC+Mk01bcv0/66fuSWQNx0ayG7NWayOts
         WFPSdd7GthAWdt/3VgeMzjqNNiCgySlozTpDXt0lTq1NvfGEJkWG6vkf9YYsYAqJaoCU
         7tKBgwEMsTaiVYfScnvgMr1w74eGlwOk8V8PsUMxejijqb/zeZCVC0iNnNsS5kzYjCZX
         NrTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700727149; x=1701331949;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=00iDwY+cpMFooaYxt9QqW1VX/LAQFEkGrE55JwvJt+c=;
        b=jvddkQ+ebMKspE3V/6AN+E7O033ESAldGq+C3P2nUHKYjG3V+6gKAEZ712tFYe65tH
         haastNcPzFgaOPgEJ4PaHoNaCTE7KY91fRH0eGn0w5pFZx5VibB5QqCdpRNZ4Y/g/jul
         KT6yNkMDkahEHYhxN2cdbBwSxmILKT5XNCtSkexhjrQwKOlJo4cHHVVgSZ+jkQXFOjNo
         x4Yb1IFVbVJj9OBsSWxUw9Pu7V/HdMjSF2QUUk3whK1sbkLGWSGo3jbUf0HjNWhNZrQS
         p/VgIso7mMuTVKto9Hnjf9G+4LLbNITqo2WeWbg9GHn1CzPOvBhMyjzq98vEpD9UXR86
         hC3w==
X-Gm-Message-State: AOJu0Yy/3qFPKCgRLp0ejuq7Tk/od+J/MjNqkVlgPikzBYpaVB8JYfNf
	TBYP2qRwPpPKgAiLAFf+WKRzAIQBZAtEsqSoMFk=
X-Google-Smtp-Source: AGHT+IGpNWRUW1LqMQDBwxUbEVif3ukEzBIhQyfcFzauh5GSwBy9KtKs319uma8hTLrp0hk7J3DJYHLdHDi6hnb/tAE=
X-Received: by 2002:a05:651c:1424:b0:2c2:8f22:d9c2 with SMTP id
 u36-20020a05651c142400b002c28f22d9c2mr3527087lje.22.1700727148614; Thu, 23
 Nov 2023 00:12:28 -0800 (PST)
MIME-Version: 1.0
References: <20231122110818.932618-1-jstephan@baylibre.com>
In-Reply-To: <20231122110818.932618-1-jstephan@baylibre.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 23 Nov 2023 09:12:17 +0100
Message-ID: <CANNYZj9HZu+h3rcVGDRpVnemeoXCMvd1zcZh-tyN_JMCk9oP=w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/6] devtool: add support of submodules
To: Julien Stephan <jstephan@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Nov 2023 08:12:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191138

Thanks for working on this. I'm a little worried about the central
patch as it's large and changes things all over the place, but if
oe-selftest passes, there's no reason to not merge it. If AUH breaks,
we'll deal with it :)

Alex

On Wed, 22 Nov 2023 at 12:08, Julien Stephan <jstephan@baylibre.com> wrote:
>
> This series adds the support of git submodules, so we can use devtool
> modify with gitsm recipes to create modify and export patches using
> devtool finish.
>
> This series also adds support of git submodules defined inside SRC_URI
> (i.e extracting a secondary git tree inside S)
>
> My dev branch is available here : [1].
>
> It passed full recipetool/devtool oeselftest locally
>
> Cheers
> Julien
>
> [1]: https://git.yoctoproject.org/poky-contrib/log/?h=jstephan/devtool-submodule-fix
>
>
> Julien Stephan (6):
>   devtool: fix update-recipe dry-run mode
>   devtool: finish/update-recipe: restrict mode srcrev to recipes fetched
>     from SCM
>   devtool: tag all submodules
>   devtool: add support for git submodules
>   oeqa/selftest/devtool: add test for git submodules
>   lib/oe/recipeutils.py: remove trailing white-spaces
>
>  meta/classes/devtool-source.bbclass     |   3 +
>  meta/lib/oe/patch.py                    |  64 +++---
>  meta/lib/oe/recipeutils.py              |  29 ++-
>  meta/lib/oeqa/selftest/cases/devtool.py |  47 ++++
>  scripts/lib/devtool/__init__.py         |  24 ++
>  scripts/lib/devtool/standard.py         | 284 +++++++++++++++---------
>  scripts/lib/devtool/upgrade.py          |  51 +++--
>  scripts/lib/recipetool/append.py        |   4 +-
>  8 files changed, 333 insertions(+), 173 deletions(-)
>
> --
> 2.42.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191061): https://lists.openembedded.org/g/openembedded-core/message/191061
> Mute This Topic: https://lists.openembedded.org/mt/102746727/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

