Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A671C61D85
	for <webhook@archiver.kernel.org>; Thu, 23 Nov 2023 10:36:06 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.88391.1700735756077957525
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Nov 2023 02:35:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=XDRoFTQr;
 spf=pass (domain: baylibre.com, ip: 209.85.218.41, mailfrom: jstephan@baylibre.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-991c786369cso93107666b.1
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Nov 2023 02:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1700735754; x=1701340554; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cE5pwWVe2AmNrBAxHdu5JYUOjZtKp/rShHr43vUYBNs=;
        b=XDRoFTQrY2e7sDkB1Y07ebIlGwFYis5zrZSrGn18u7Zmn7gzKSmL0vBk80uGHIjjsQ
         eiS1+J01oQN4vI/H+skaTfnDsP7u48BeQoKZo+CRHYYP5x3AdWf4qQ9JNiEVybxKcH5K
         0mpTv31pR08heqnMQOIIr1X25U6yjm9xcHAA5hxLxbCLFdRPi2IWI/msNC7v5CDv4Sdn
         se6NMnnYUo1o/cFRoUd9/rmDIkF8EkCQVwpEGiSZSlzBvKwQVotX+W0pqbCwv5yrIpaa
         ROS7xJ/lJFoMPzql5s9Xa53Hp/RIICtEqUduJ8JzJPCOIEcB5bO2QAzG6dzrfRnL+WQ9
         hlWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700735754; x=1701340554;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cE5pwWVe2AmNrBAxHdu5JYUOjZtKp/rShHr43vUYBNs=;
        b=TsJOED18VqTPjQsIiVe6mCFloiBvvyu+ISl2tWeHh/IsftZo0icXX4S6TxXsYOmYmY
         ox9pdxs6vZo0cwuaqJdos6eiXZDkovbvioFZADGfDOhO+pdCg4LCeXsrjXCigz8eYNlk
         03FeZhmYmFmaEUYoVoy4rZqjdKN+CjkSM4bs6EOF0D/MkJ9cyx9g+dmtDhQ1TCefGOl0
         0fEUzrmjjWM+69RsWZpv99gff6nNQs9S8aX6rhUbMTs9LGbDFWdsnuoWAv5M9f70By25
         cknGjo6CA4zPfI45eiiYqvq+ueYv1CzsqisiURmmvpk4SOafxG3BBn3ezcN/kRbDQ21D
         2DEw==
X-Gm-Message-State: AOJu0Yxl/NxW2YOSPlasFcmq0i8fuHTAvDtdIrK+SMEmEMWA5qGroH0j
	+GQSnN5SJ0CmVDzulb5bQNBELfZbIFGbOEG7ejTrAQ==
X-Google-Smtp-Source: AGHT+IG0ymY5BNgj1gQ3BhS344Hj8XyE4r89x7GUx7nfvYuzO9sKbwIvQ071zog7itJ+t+55AYvtW6fiFeGK9wO07NA=
X-Received: by 2002:a17:906:8a:b0:a00:163f:4b98 with SMTP id
 10-20020a170906008a00b00a00163f4b98mr3138706ejc.44.1700735753877; Thu, 23 Nov
 2023 02:35:53 -0800 (PST)
MIME-Version: 1.0
References: <20231122110818.932618-1-jstephan@baylibre.com> <CANNYZj9HZu+h3rcVGDRpVnemeoXCMvd1zcZh-tyN_JMCk9oP=w@mail.gmail.com>
In-Reply-To: <CANNYZj9HZu+h3rcVGDRpVnemeoXCMvd1zcZh-tyN_JMCk9oP=w@mail.gmail.com>
From: Julien Stephan <jstephan@baylibre.com>
Date: Thu, 23 Nov 2023 11:35:39 +0100
Message-ID: <CAEHHSvZNYUu6-f5p2eZu2ChU10QcH8AeTYGoPabY6S=mAM-VXw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/6] devtool: add support of submodules
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Nov 2023 10:36:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191140

Le jeu. 23 nov. 2023 =C3=A0 09:12, Alexander Kanavin
<alex.kanavin@gmail.com> a =C3=A9crit :
>
> Thanks for working on this. I'm a little worried about the central
> patch as it's large and changes things all over the place, but if
> oe-selftest passes, there's no reason to not merge it. If AUH breaks,
> we'll deal with it :)
>

Hi Alex,

yes I do agree.. but I was not able to split it, because I didn't want
to introduce "non working" commits in the middle of the series :/

Let me know if some rework is needed!

Cheers
Julien

> Alex
>
> On Wed, 22 Nov 2023 at 12:08, Julien Stephan <jstephan@baylibre.com> wrot=
e:
> >
> > This series adds the support of git submodules, so we can use devtool
> > modify with gitsm recipes to create modify and export patches using
> > devtool finish.
> >
> > This series also adds support of git submodules defined inside SRC_URI
> > (i.e extracting a secondary git tree inside S)
> >
> > My dev branch is available here : [1].
> >
> > It passed full recipetool/devtool oeselftest locally
> >
> > Cheers
> > Julien
> >
> > [1]: https://git.yoctoproject.org/poky-contrib/log/?h=3Djstephan/devtoo=
l-submodule-fix
> >
> >
> > Julien Stephan (6):
> >   devtool: fix update-recipe dry-run mode
> >   devtool: finish/update-recipe: restrict mode srcrev to recipes fetche=
d
> >     from SCM
> >   devtool: tag all submodules
> >   devtool: add support for git submodules
> >   oeqa/selftest/devtool: add test for git submodules
> >   lib/oe/recipeutils.py: remove trailing white-spaces
> >
> >  meta/classes/devtool-source.bbclass     |   3 +
> >  meta/lib/oe/patch.py                    |  64 +++---
> >  meta/lib/oe/recipeutils.py              |  29 ++-
> >  meta/lib/oeqa/selftest/cases/devtool.py |  47 ++++
> >  scripts/lib/devtool/__init__.py         |  24 ++
> >  scripts/lib/devtool/standard.py         | 284 +++++++++++++++---------
> >  scripts/lib/devtool/upgrade.py          |  51 +++--
> >  scripts/lib/recipetool/append.py        |   4 +-
> >  8 files changed, 333 insertions(+), 173 deletions(-)
> >
> > --
> > 2.42.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#191061): https://lists.openembedded.org/g/openembed=
ded-core/message/191061
> > Mute This Topic: https://lists.openembedded.org/mt/102746727/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

