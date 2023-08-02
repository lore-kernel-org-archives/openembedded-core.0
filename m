Return-Path: <luca.boccassi@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FE5AC00528
	for <webhook@archiver.kernel.org>; Wed,  2 Aug 2023 08:12:17 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web11.9492.1690963933916672029
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Aug 2023 01:12:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=duUqAVM2;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: luca.boccassi@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-5862a6ae535so32952787b3.0
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 01:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690963933; x=1691568733;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=B1P+pViOyCHVx/u1UzHiQQZ+cHXjVV13a80r5w6qpCk=;
        b=duUqAVM2d2+fExMFwY5YqehYagl4VMzeRvUCVmdyaqbOh/0OLMBhHN6aJXDG3InpDv
         xRkHaeqA/Z2HZ9pPmGVQuzNsmuSOsjxFrcMQtjG0fZ5dWAdZl05e1gFgl3RYCPpAi/rY
         uAsJh2cQdjabvGVAvZ6YOWYGqCWEaSOCrFc60q/3zLsQOcWO9LFmq3zC28A9bRWWTzA0
         gl/wZHSDCkd0PpdM0rEJH9iEp8FjjdGwsEtOc79skjQvOuwP37pFvCiiIoo1GaA2fpYA
         JbYLLuOH+ZTqApgRVs9sVHkJ7xBcI79oSUnXUt6FxQlBwesPt1mxg0cTGwf/BCIi2Id3
         8xlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690963933; x=1691568733;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B1P+pViOyCHVx/u1UzHiQQZ+cHXjVV13a80r5w6qpCk=;
        b=aQGcMztHP1eds+91AMvk60qqux7yuVj+RR0kQbI6ca/X8p66qXrjB/ogM2djMJFRKC
         4K5+owQFMgzcR4YVQArYYvty1ONEq2XdH4oSUmamv0jdba3G68loGPOrlfm4KP7matzQ
         7pCB+jJgr7Mx5nwJ3b5rInlh+v8oawmWoCm2ZlIKdFwjTqbdp8HdvkYYvQlleJACVRoP
         gwkPZHMILKt+G57cg/WMRU9Vf8vDntHTGbhkPRj0OMnvUAInmN3kG336yAusKlEwamAq
         rHL+ooIw9u6mzkId/nxd6xOJHsrV29VjsRyKGze9nQkjje31iPjYjodBCtp7FYN3CKK+
         wB7Q==
X-Gm-Message-State: ABy/qLZGX4gqZNjA5OqPNVXCDXeCl3byk9O/EttKZt91SaLz5q+FIaQ4
	hRoGjS45HizjB3mSKoi0cUROuildxkuuy4Du0mI=
X-Google-Smtp-Source: APBJJlENfofnjStOt+5IWo0ceYy9jHaI2ilRMvbi2hfUx+Yer8DeXuVwD1p0LcIvMzqXA1U+Fiha9RXZY1KMQIyRcro=
X-Received: by 2002:a81:8414:0:b0:56d:2038:c254 with SMTP id
 u20-20020a818414000000b0056d2038c254mr14192828ywf.44.1690963933052; Wed, 02
 Aug 2023 01:12:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230728204418.4044524-1-luca.boccassi@gmail.com>
 <20230731112736.1238510-1-luca.boccassi@gmail.com> <20230731164010faa31974@mail.local>
 <CAMw=ZnR3L05DSaBGSijuA5-vNXPkriCjdbi02LJsUFmVo-FbHA@mail.gmail.com>
 <202307311713165bd45fd1@mail.local> <CAMw=ZnTCOt1aq-iQLRsgjv5sJL_GYXWW3dNup300B1dbNYnLZw@mail.gmail.com>
 <1777043202ABE7FB.4565@lists.openembedded.org> <CANNYZj_9PaJtAhi1XTMzO8oY9GgxUh6hO+00f0Ph2MUndzBVbA@mail.gmail.com>
 <CAMw=ZnR9S1oHjjPUyOHnDakPOM-6JkyHbnTTR2hDjqv65qfB1w@mail.gmail.com>
In-Reply-To: <CAMw=ZnR9S1oHjjPUyOHnDakPOM-6JkyHbnTTR2hDjqv65qfB1w@mail.gmail.com>
From: Luca Boccassi <luca.boccassi@gmail.com>
Date: Wed, 2 Aug 2023 09:12:01 +0100
Message-ID: <CAMw=ZnQymjXr1qazSz8ZHX=+fUzj_fJJpbku_+7vUv-8rCYN_g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4] systemd: update to v254
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 08:12:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185381

On Mon, 31 Jul 2023 at 19:00, Luca Boccassi <luca.boccassi@gmail.com> wrote:
>
> On Mon, 31 Jul 2023 at 18:37, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> >
> > A better option: fix the libpam recipe to say:
> >
> > ANY_OF_DISTRO_FEATURES = "pam systemd"
> > instead of  current
> > REQUIRED_DISTRO_FEATURES = "pam"
> >
> >
> > This should avoid having to fix the tests.
>
> Thanks for the suggestion, applied in v6.

Hi, did v6 help with those test runs? Thanks

