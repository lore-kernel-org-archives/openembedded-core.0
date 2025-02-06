Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A0F4C02194
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 10:53:54 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web11.37876.1738839224305088611
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Feb 2025 02:53:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dccIV2Tp;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6e1b11859a7so5093916d6.1
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 02:53:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738839223; x=1739444023; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5aEXySfE3LPWJW0fVTtF1POKE/8qLgvdrldhZg65CoY=;
        b=dccIV2TpORuJtCSqi437Aaep07DR5cAxK1LNcXL34Iyp6+IUGqCw7hN3/SnfFopBzp
         uCxo+o0GwxRZU522HNASfo0MJ0LMCyaPcOcssLh5lMfzNcu+SAHaWb1trXgMXNs8gEeb
         SRUy5jLl2t2g2lgNZ+c3MWr6rLDSda3le1Aae2jkht1+FB+8swAosjcp6HzIFaeM7Hel
         cf5D+e7Bd4PQ7I16nbctK7JC1rdaxShmxwhLrHaCCIDu96NOcL3/d71HXxZ5J8DlSqmX
         6jPLBEYlPaC6uo4VD8+GG/tqBwDACzIeqzs98IJhtQHJVx9gQT0wugR/SF2vXpzU0MbW
         vIvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738839223; x=1739444023;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5aEXySfE3LPWJW0fVTtF1POKE/8qLgvdrldhZg65CoY=;
        b=nW2PV5ehjnwxVOsl6XxZlovoFBnKAPSUVRwj1iRqs0Oxf7RL+X2XJK8Fxrbr85FGBW
         glSVu31/9GEfkoOZL5009rz0d7yyaZxhXQltsbSykt+XlUn0H1r9qWWWkU2oTG6TCZW+
         Gyu+hYuFdr75zd0VJQB5aGPt6FVM7R2twDB9kRffqQNGTPiqm5VVSbdKj1wgIhtFdZwW
         TkaDZdQrvubV/xfWrHfAbjbB0S4Ld22E5OUbcyOd/bxLqm6awRrgVAlDKREGDeukQ9vP
         dKljKsIFVuUhyjlz5mVy0ingqbc7n2QbMAvHBPjvvDP6HnktOO83TMZQObt738Zb1V+k
         5heQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+fLNrWO+x5kAihaiM7MxsttrPUbh6H6thdRZvP3cXuLAp55ToztwmFG1db7ylSdigxk+LMWVyn3MYmwKmvwAHSw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywjct5Wz3JOe/YP0T+lfd9WFRzR4vnwKLEeKyoC+PDriU1nuqV3
	sLcRBWbx7hohzXE+Cg7aZQtN/UsFxF8ns9oR2Y2csdiwTCwVWt7RiiQ4KhQJsIhN6oN4+DuL79V
	enBwHm6zMU7aBaQzCUMtTgswC0+s=
X-Gm-Gg: ASbGncsqzJ6badiPCr0Y7q1xoPTPYX/N1u0hkaOc+cO1era6UBeDKKBbqPRIRo7FLxP
	pZLAwD8h6XZDba1kqYo7Ot+PtYfOwgdMaXjoQjuNtXfXl09a4hX1UqJpyD9XGOdnlZVorir8GJz
	1jQvKQdWbUUgZrr0jLe+xJq/FbEdwYsd8=
X-Google-Smtp-Source: AGHT+IF5FVaN1fOP2zDSDpOlJr6QaTQP6xr9bO8lsJzvsBSoM4OQjShKNu2WF9E744nyWPt0MqZJsq1BzFIZ7usS4n4=
X-Received: by 2002:a05:6214:53c8:b0:6d8:8f14:2f5f with SMTP id
 6a1803df08f44-6e42fc0229cmr98237086d6.23.1738839223349; Thu, 06 Feb 2025
 02:53:43 -0800 (PST)
MIME-Version: 1.0
References: <20250206055222.3319167-1-zboszor@gmail.com> <D7LA9XGPGG5H.287DBDA93AM2K@bootlin.com>
 <07b393e5-06c0-45c2-8864-9a9251eef30d@gmail.com> <182198F3C56EC291.752@lists.openembedded.org>
In-Reply-To: <182198F3C56EC291.752@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 6 Feb 2025 11:53:32 +0100
X-Gm-Features: AWEUYZnWU9D6_FJmp-BRaR33_hnB87pnICD7A1XCKcBWQmyt_6KiBfR3WqRQM4c
Message-ID: <CANNYZj_BrS8MMwzqrxehg91SFp6OFHEjOyfzcxdZ4wnH2TV7Vg@mail.gmail.com>
Subject: Re: [OE-core][PATCH v8 1/5] rpm-sequoia-crypto-policy: New recipe
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	openembedded-core@lists.openembedded.org, 
	Randy MacLeod <randy.macleod@windriver.com>, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 10:53:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210918

> This would work too. Those aren't trivial dependencies to fulfill, and
> they're unnecessary for us at the same time.

If you're making a patch, don't just patch out the documentation lines
in Makefile. Make it conditional to a variable, so we can set that in
the recipe, and offer the patch upstream.

Alex

