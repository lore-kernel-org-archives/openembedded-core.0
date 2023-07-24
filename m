Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76AC5C001DE
	for <webhook@archiver.kernel.org>; Mon, 24 Jul 2023 08:36:50 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web10.43297.1690187807111988398
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jul 2023 01:36:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=C9Vj64h0;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2b6fdaf6eefso58310691fa.0
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Jul 2023 01:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690187804; x=1690792604;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=H75c2mKxd2+RtntOyx0O2+1EH2mX9diqO14evm05EhE=;
        b=C9Vj64h0j00vHUHRZiIGk0/baGHVo/ydvaV9V06lHnkXrnex8ll0DnThwcirKAp3lo
         sqrnDFvU8ubRcrfYjZsjAzNz0GL/i37eeFydcygmRch0aaE7ix/rGvCmwwq5KAMmHCh2
         1iuamQq5TbIMKvzvlOoGKHDgTA4cks2yodhHewNmXb06TyLQwsMSpY+AqDAXXrOOTZS3
         xj9my77bNzPWgTY4RvTJKas5I4oQ6hlljv+XIZwy9xc0u7U0CE/QZNoIo49XcyusqK/N
         tM1DosKnCJannCCFvfGnncDTuWKcPm0noHBjLrhmJvnNsncopLwy1fjJ2pB4kMmA8aB8
         nvVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690187804; x=1690792604;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H75c2mKxd2+RtntOyx0O2+1EH2mX9diqO14evm05EhE=;
        b=lExC9Bc7RDQHPcQ1o7xAdeju40izc2PJFB8sggPgVedCIC5mJE9kiDXLnJr5BPvfjK
         h+vrQAUR/KTbazbZY5EqSdLpZ3x9lvlRCL3ZhLtOk+3vYP9CA/SgliKrI4/U1xiokf8l
         luG93hbjoIGfHPHnBBP8vjbvsueXE3DFLjOhd5gG6jkJZASGCKE8j0BPsXmNw+/H/24R
         GECS3XBk0r2T5lE9wB+f3hUhzf6rJSx+1QmGnVnMHqwRFdsyUBa09F6a/WRUzcNgXJfg
         XCdhjCNNm3iycwifBf+7kfMYYv61Nyyy6RqGiH1tMtqK6M/c4tV8Jrl5Mo+OBv4FiZuK
         Gy9g==
X-Gm-Message-State: ABy/qLbjyK3wZQHxZp68PMS07yZVQBLVKf7oyVKRMudr9o1dtZt1jZ2I
	2X2mD0+sIZkLH5nq/SqTkOn0otjESHPayFYKxhA=
X-Google-Smtp-Source: APBJJlEEn8XjTOctVnDZSgcJ0acnqvzuaz8ySPdIZcWloO0odECzyH+h0+7iTMKX1o/z70Q/OUL0TwVd0hiapKrJRv8=
X-Received: by 2002:a2e:b168:0:b0:2b7:7b9:4767 with SMTP id
 a8-20020a2eb168000000b002b707b94767mr6108374ljm.41.1690187799449; Mon, 24 Jul
 2023 01:36:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230721142543.246415-1-jstephan@baylibre.com>
 <CANNYZj8tCEDM51XrCgfUfMu0ExJqJEwQ7=vU+4e7vrRqdpsKCg@mail.gmail.com> <b7qoln53fio3pwdngj2god5iy7lemvh46pys43lfewimdyfgam@d2vfmfbti4q6>
In-Reply-To: <b7qoln53fio3pwdngj2god5iy7lemvh46pys43lfewimdyfgam@d2vfmfbti4q6>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 24 Jul 2023 10:36:28 +0200
Message-ID: <CANNYZj_4GRz3j20Mc5wow2fpgHyhoTRsuwnYyHe6yiwnQM-vvA@mail.gmail.com>
Subject: Re: [OE-core] [RFC v2 0/2] Add bblock helper script
To: Julien Stephan <jstephan@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jul 2023 08:36:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184780

On Mon, 24 Jul 2023 at 10:25, Julien Stephan <jstephan@baylibre.com> wrote:
> > Thanks for working on this. Should we think about how this could be tested?
> Do you mean we should consider addind self test for bblock? or you want
> to discuss about acceptance criteria for bblock?

Hello,
I mean mostly about what should be tested. How can we verify that the
script does what it's supposed to, in an automated way, so it won't
silently break as new changes to bitbake/oe-core are added? What
should such a test contain?
The specific form of tests (whether it's selftest, or maybe a part of
SDK testing, or something else) is secondary.

Alex

