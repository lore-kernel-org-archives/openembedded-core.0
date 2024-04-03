Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 423C2CD128A
	for <webhook@archiver.kernel.org>; Wed,  3 Apr 2024 12:21:17 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web10.9657.1712146873537901084
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Apr 2024 05:21:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nQQwVn2B;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2d29aad15a5so72735001fa.3
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Apr 2024 05:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712146871; x=1712751671; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AAVW9BwCXd/ItNs9IqWFh1SoKytPF+l0D11+5UxBFPE=;
        b=nQQwVn2BNRJ/Re20VxYlHauwcU2FByZwrfJZMmEqlG6PU7J8+kEh85WcXsxRf0mJwg
         4yRGRtnSKcIwAs/yICTqwsLG533li0cOXbbRQPLqjNQsPAh7gdPX90UbbKUrv1MQIEoI
         mjBsUTsJIMAwvAQrkmP4N4GUaqAjL18nhHub+5jbWo98eJTZIQruGras9w1R8dXvdndI
         vgwr4YlWMO0LkT4SrjSbzaekiqDnmQy2/QxrkhIncEh4dH54NlyAA4UUlBHzbRiN9sp2
         8eEggR6nu3UHn+80yBAIcoZ3Vrp8Fcf1NgCFVA17cRl2EuNGpT3bJLN+jFICt5XQy3UD
         asfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712146871; x=1712751671;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AAVW9BwCXd/ItNs9IqWFh1SoKytPF+l0D11+5UxBFPE=;
        b=XgPSlpjg9dY85QarC3kMqftSPwoo3yPCa5uH3ui38IZ5zpRRTCpSePLwRRrWqXgYHk
         cVZa5vaMd998+vdJ1XeDnDhS1r2b8S1mOo2mzmqNX91goBJOpYzx1dUpKqgqBs7O35K+
         V93Lr40jVQla3Hpit8M0ozMdUtyeXhyf4q76qO660GIZO45y7W59xQnQRZwri/v84zIr
         bkuw6WP73oCKi/O6QQm93rb57TAgo0t/Pt9hEiW8sBIzF1f/zOmtn0HR5GYd6wkFau4b
         6vOuzrnqEL374TulMfjxHfD1GoHk4NBXsYg4qpB3wE6CxXGm+hEmXbYOLt3THqkYf5GJ
         YGeQ==
X-Forwarded-Encrypted: i=1; AJvYcCXP8GX4mT3xd+SzY9AnfiMHDdXnO560pHqfhMqzbIPXCZLO02fPC4BxIIFGoIEgrN/CWbhM9KyG07mU0LJiAF21gh/BJA/Nur8yFx/N7x7tvd2SDptRBfOV
X-Gm-Message-State: AOJu0YxTRm0V6CugkCTEvEjLWLJdZB6EiVcbT42GRv4N43Sj3Tg97gwM
	NDROfL80MIZSjK4ZcWWGwE57cgeYv/Cv8hYlOyZpJde997FqW1x0JeNGlx6jIFs5Q9rG0VMrfVB
	aiXEPcWpwJT50UKToUzT/HyxlFyM=
X-Google-Smtp-Source: AGHT+IEHODTHuttqHAaOeRe1x7L+YySklEBokt98xn69Q1855cvH2kXFwz0fxS0D9x+t2+mEFhyU9jH0FMYYVyO7c48=
X-Received: by 2002:a2e:b88f:0:b0:2d7:1830:d5f9 with SMTP id
 r15-20020a2eb88f000000b002d71830d5f9mr12443018ljp.31.1712146871144; Wed, 03
 Apr 2024 05:21:11 -0700 (PDT)
MIME-Version: 1.0
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Wed, 3 Apr 2024 12:20:59 +0000
Message-ID: <CAO5Uq5Q4f4Q+3yR6JZcxhXOP_mpmyzJ0yYtO5SO1_6ZOwdHEzw@mail.gmail.com>
Subject: Debugging rust oe-selftest failures
To: "Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>, 
	Randy MacLeod <randy.macleod@windriver.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Apr 2024 12:21:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197915

Hi Sundeep (or anyone else with insight on this!)

How do you go about debugging rust oe-selftest failures? I've bumped
everything up to 1.77 (https://github.com/akiernan/poky) but
oe-selftest fails for reasons that aren't immediately obvious to me...

https://gist.github.com/akiernan/6cc6131c1ec3af866098a9318679cf1b

Any clues?

-- 
Alex Kiernan

