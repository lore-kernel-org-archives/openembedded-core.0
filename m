Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65D8FC32792
	for <webhook@archiver.kernel.org>; Wed, 24 Aug 2022 08:22:01 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web12.8572.1661329319011852255
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Aug 2022 01:21:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MJvJCfPZ;
 spf=pass (domain: gmail.com, ip: 209.85.167.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id z6so22960675lfu.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Aug 2022 01:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=VW/EQQeGs8WKYtbRfaSnNS0392K7DqGnROJo9lcFnRY=;
        b=MJvJCfPZUTUg53g3MFRVEjfjp13BGjJD0WPZsEqyGljXBwxc2rrjMvfusrAYqNZ6rj
         WYg8srNxKOIEVuBmUOvvGxsfxZEXKdrE6hEKMkas0891zV30D3c4wwSiwv++2dlvFFs7
         jK/k7UJo7XtJsmtMmEcUT1M1GherBoqmh+Mi2hslnS2bzhXbtLS3p/ggZfkbnecjHBB2
         Xf/W6k/NO5AGySIZyQ8TK3/rqB3wvhrxGm6FZPBesnBnTmpmWMtJMaGdMyM3mMm2o0+Y
         w54j3Mk6iOCBEOHs1YVSKXVdmEvwVlpt68ym6y78q5eytQEKuXRpTZ6rri0V+D56qHDS
         0XUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=VW/EQQeGs8WKYtbRfaSnNS0392K7DqGnROJo9lcFnRY=;
        b=cDaChq5LB1QzvYApqFfwxRPyJUQBjWPZpbyjih+UU1VMqehc1hqaN65IcF0aLStdRi
         NlHvHJDnyvT2IkG18soJQ4sOA/gQYFuPI3KYzkyiI0+myWppG9BWXSDjwrqCqiDr8XCn
         eYbp7172s+PT7k9+URp7wHQTPkek+J+k0WDVj4dPu0k7siHWDuyV7ONQpBRuEuJ6IL8g
         kwVDJjVFwccX6SOOXMdIgKkD2bS3Ra9xoHaYQeD+U/zE8/9D79e53j1OKjKZO4YdHgM/
         +2tJlV34UArZdSsEIF7PLYSHB6CnXlXa62jHV8rd6cg6zaIAedCoMKXLhDTu2hXWHJBW
         fb6w==
X-Gm-Message-State: ACgBeo1wwrA7iJ0hnxXLLPngvttSgqdmG1jHHdFH9v6lNpBhU+UwTw0H
	gwcvycb4vUvVe1wB7wylzA3B8QjUNY7gAB4gOCg=
X-Google-Smtp-Source: 
 AA6agR5EdBNJJ6ILMCRiXfS5QUnMFpscPUa3PeJwCe5oAtS0mrEFD7PAuCZryBdnBQMhcduWmXIWull8ZUrHhcgY0m0=
X-Received: by 2002:a05:6512:2987:b0:492:e469:b327 with SMTP id
 du7-20020a056512298700b00492e469b327mr4590394lfb.534.1661329317079; Wed, 24
 Aug 2022 01:21:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220823235624.2488133-3-andrei@gherzan.com>
 <20220823235624.2488133-6-andrei@gherzan.com>
 <CANNYZj-XzOu-zd1aTn7aQ0DyrsiN8J3mOPuG-4wcJw0DzegRww@mail.gmail.com>
 <c18472e4-db71-491a-8f9c-b82245c47800@www.fastmail.com>
In-Reply-To: <c18472e4-db71-491a-8f9c-b82245c47800@www.fastmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 24 Aug 2022 10:21:45 +0200
Message-ID: 
 <CANNYZj-LRM_fR3zuRQrR4kkhY_TuF5pGPBDePDaLbEWSJaoQQQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 6/6] shadow: Avoid nss warning/error with musl
To: Andrei Gherzan <andrei@gherzan.com>
Cc: openembedded <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Aug 2022 08:22:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169786

The issue is described by you in the commit message? I think this is
good enough for upstream submission as is, as long as you edit out the
yocto specific references.

Alex

On Wed, 24 Aug 2022 at 10:16, Andrei Gherzan <andrei@gherzan.com> wrote:
>
> On Wed, 24 Aug 2022, at 08:36, Alexander Kanavin wrote:
> > I do not think it is inappropriate, as it does highlight an issue
> > which we need to inform upstream about. Can you submit it upstream
> > anyway please?
>
> Just to be sure we have the same understanding, could you detail the issue you are seeing?
>
> Andrei

