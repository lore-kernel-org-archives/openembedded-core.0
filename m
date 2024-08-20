Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5AB4C531DC
	for <webhook@archiver.kernel.org>; Tue, 20 Aug 2024 17:22:47 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.445.1724174551247801565
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Aug 2024 10:22:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Nb6ewq4a;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5332f488c6eso5361921e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 10:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724174549; x=1724779349; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=slPL75HOlXAtOk8q9GUlXm4FcF3ZcQ1LD7b5xIUr3kI=;
        b=Nb6ewq4aDH8+8MTsOR3EVIEJz911MFsvUliCd4TjlE1SlPXjrM4wDfSxfQnw0RXMEP
         zLA8X3PJq2G6CWZ5zGLJ4ysINHgM72qvJ2NcYMIaNmYKeqREaRhV9OvxjYuov8iVn4LW
         4bbpCKIq/sAAFxjea+0csGBXB+SQBx/YmZu22SaKVhmN4yuI3vNKodbuk3obz1NgS1o/
         FlT4EMQn/KVmpATkzP3rwtIRtX5e3mFm2MNaBIgweJR+JAGBp/lryfqyb7iBGh+zNGoS
         6TXNdwgsUP452Co/K/EwUFjyGiSeThZestn0Xu9vJfx7nLz1r1+6obeCiqwNKmW6n+l9
         wUfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724174549; x=1724779349;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=slPL75HOlXAtOk8q9GUlXm4FcF3ZcQ1LD7b5xIUr3kI=;
        b=BkEPYUVN6b73IQE71j3le2IUs1ruMcSKXtDpeVfbv6pfU05PjB9V5TFFveQlgS558Q
         5OMoKvS8wiR1onLItbjHFEVUFXn5262kmpnJ+qVnNyrS+YrEm8J9bxHjTYl8IX2YELSz
         C2c6/U7XCBLb/fWls/aWqeVNUjPQxvo1RKqefVDTZ7KLoD6krceCzhrZge3S9PjPMRWT
         eoknB9ywSmwFlb8IV7n/w1fMy2Ai9xC98X18d2nuvKK2U0i5SF4tRe4fd3tDjqr3Gwvn
         /86uIaD+pYxEeawbZ2nAiM/dW/biCcMY3FNMBqfPwt1XId+spfiKobM9O2BtQfJ6GwNR
         C+XA==
X-Forwarded-Encrypted: i=1; AJvYcCV452MIUJ8hC/JA0loXR89qeYQP54rutdPMhc1jothQmz4xqM15f/EdNaOLxNqSZotyktZH5Pf6we/7oQSIspHfow==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwXEU0TU48K7ZWdVxp3Ga7AB09D+JubZBuHpskB0S7aTu4nhp6m
	1RKoYeKIVV/0ur9QYeyrE+tY9Nt8ilyOt4lMGpFEPxeS+02AmvgI40ohzQZPCLsWsBe67oXSLij
	v0MgLWLdwhSfLh0AMffcfm4djvjecwwx0
X-Google-Smtp-Source: AGHT+IEmpZveWYUFULY+hF0VtA9+ZtZQpMEZMOyYWnG+Dat/jzj8f6jFSU2I4ULJkJECGT4WO4QZ3i7PywkVizrP9us=
X-Received: by 2002:a05:6512:1193:b0:533:4620:ebec with SMTP id
 2adb3069b0e04-5334620eda4mr1070917e87.3.1724174548730; Tue, 20 Aug 2024
 10:22:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240815140736.3189704-1-tgamblin@baylibre.com>
 <2024082016241749789ab3@mail.local> <4a465e4d-9cb5-462c-929b-1107e5e227c0@baylibre.com>
In-Reply-To: <4a465e4d-9cb5-462c-929b-1107e5e227c0@baylibre.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 20 Aug 2024 19:22:16 +0200
Message-ID: <CANNYZj-dzwKF6--8nr8pTJvi2LF93jjBQUDfzDEMcd3kJbhuCw@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2] piglit: upgrade 22eaf6a91c -> c11c9374c1
To: tgamblin@baylibre.com
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 17:22:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203561

On Tue, 20 Aug 2024 at 19:18, Trevor Gamblin via
lists.openembedded.org <tgamblin=baylibre.com@lists.openembedded.org>
wrote:
>
>
> On 2024-08-20 12:24 p.m., Alexandre Belloni wrote:
>
> Unfortunately, this doesn't build on the AB:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/9383/steps/11/logs/stdio
>
> Seems to be because of this line in the config:
>
> DISTRO_FEATURES:remove = 'x11'
>
> I see that consolekit has REQUIRED_DISTRO_FEATURES = "x11" in the recipe. Is this the right approach then for piglit?

Only if the X11 support is unconditional. You first need to look at
the failure log that says:

|   Could NOT find X11 (missing: X11_X11_INCLUDE_PATH X11_X11_LIB)

And then check piglit source code and its cmake configuration files to
see where that particular check is performed and whether it's wrapped
into a condition that we can tweak via cmake subject to x11 in
DISTRO_FEATURES.

Alex

