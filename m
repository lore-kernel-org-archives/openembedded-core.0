Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B381C36010
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 10:13:10 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web11.43158.1744020782317112350
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 03:13:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jtkGt5HI;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6eeb7589db4so43796166d6.1
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 03:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744020781; x=1744625581; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5bclhH5m+R4dlHHmNyW3oFHK1HXLKouSvHfwk/QVgeY=;
        b=jtkGt5HIHKU/IfgMeVTiiLJ/uCxTfCEUFSe90sxwNuFJjxxZJJdzKSTkopEfzQBW0a
         ltm3C2EDUmllc5mzTetaxH4yh6j1tqFnDI0sgsPrmH/hGzpME356LpFel+/oe0H6ji1L
         hZTkHhLixMHaxKURYXwCWMabnGyBv+qTafM+XJsbZXln7n80bq7BROVjOTXz9JncV/bi
         8+W+s3CzBofo0KzqVM94F+N8+yLHnKVin4ILl6Kx5IN5HMgF9bflFpeyIZ37tfKvUeBI
         8T2lUhypfM/WOJgBQJgZdSEH7PaFTcS+XbvZwT1W+aXwUQRv1UTnP6IcmsGDTdKdP1R3
         EKdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744020781; x=1744625581;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5bclhH5m+R4dlHHmNyW3oFHK1HXLKouSvHfwk/QVgeY=;
        b=MNC4PV1UoVxmV6fijAID5xTXQKzYMWagmcZEWU33GDnJxUl5B9aHrH9G+olaBNexNG
         JU9mCfge7hsjuGEhbaNt34+zj7G7wZ3qwYFtyM43nRU474foLhza/Y6Rllpm0a7JlGT2
         q2JToBsVLKYf7a0lLlHG9bMTUKaLtOoF7LgAfMBuiLXjKKoJZWuXSvZUKgIRCLv1+tlB
         mvhkiW/QvG2xVXpx6/0QxMAki762N+lc4axb2tv9zNiS4gWQMA5cNrZJcIUCzqJZkufR
         5J++JXr/9dDitj8ym8IMpXCN9wLvLteaBR0hpWDZWy0hN2blhcZQR9PVQx1/ZDfWCcqE
         Avgg==
X-Gm-Message-State: AOJu0YyTg310EG5e0puUbKJJ6cQSeSHCJ1b6f7QmYHoXB+qM5R4Ogijy
	BfaE2Yujr/+3CGI401f7f7YHhitPu2RSAsDM77Il8eVUqE2mbRbvXE82LkPDNcbC2A0wZQJHYAA
	YAoSsLAnOO0zmH7OaKFHBgrUUrO9QVw==
X-Gm-Gg: ASbGnctaP/zrIkppfBXhn5CwqHf1Aj8/UkBKFoKNIRNfF1ohXQh3vB6WzyFgAn6/H5f
	I2hsFZUzQ40bpgmkX9i6rApxM2Koxfq+WzA6JCvRrnghmRiJff0XwHu4dcQH4Jg/Ai0Q8kvHAYp
	dOAbSXK4hNnGBIsDv3nUEXTtOBI2h8PGgNu0IpifOkDmoElmme3tJTu+AlUzpt
X-Google-Smtp-Source: AGHT+IETAt82mpTz+rsvInIXc+4H+LYwiinMd9Qvo4G6lwmcUniZHM11g2/mxdrZoqqgW8iSTwZhknPA/T++uR7YRmM=
X-Received: by 2002:a05:6214:cc8:b0:6e8:ede1:237 with SMTP id
 6a1803df08f44-6f064b2155emr198992166d6.43.1744020781249; Mon, 07 Apr 2025
 03:13:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250403074552.971291-1-Qi.Chen@windriver.com>
 <CANNYZj9BwZVVt2Mk61KY0S0NLmD8zR-=a2EDnSccKF7xRL6ofA@mail.gmail.com> <61379a9d-d66b-41cb-86f9-56a9208317da@windriver.com>
In-Reply-To: <61379a9d-d66b-41cb-86f9-56a9208317da@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 7 Apr 2025 12:12:49 +0200
X-Gm-Features: ATxdqUFTZ44BYYvlYMqKNH-i1lyYqApENJ9Fv7LF4PWHJEiBasJyf4lqTOYmNdc
Message-ID: <CANNYZj9a0u7ou3AtYANOC+xeXDCQd0nusXAoOm2+aP_BdM_SjQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH] qemu.bbclass: move to classes/ directory so that
 INHERIT can use it
To: ChenQi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 10:13:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214445

On Mon, 7 Apr 2025 at 08:31, ChenQi <Qi.Chen@windriver.com> wrote:
> Moving qemu.bbclass to be under classes/ has the benefit of enabling
> other bbclass that could be used via "INHERIT" to make use of it.

Please be specific. Is this to support the version checker that runs
executables through qemu usermode?

I'd still say 'running a target executable through qemu usermode'
should be a function accessible via meta/lib/oe. Is it possible to
refactor the functions, so that they take things like QEMU_OPTIONS as
function arguments, and not from the datastore?

Alex

