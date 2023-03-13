Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31E07C6FD19
	for <webhook@archiver.kernel.org>; Mon, 13 Mar 2023 07:56:33 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web11.14688.1678694189290884195
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Mar 2023 00:56:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=olqTSnoo;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id s22so14497348lfi.9
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 00:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678694187;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lzq3mH0igtNXMX04I4fesgrAR6gDQLGvrMHBvWORgCU=;
        b=olqTSnooixMY2sjp9AU8d9s0dKrURBg6P6NscSc5EdwFLlrB0VRwK3uxXQvxE0+Mnu
         kyRJLqWaA7LlJXuBnXMl9EG8AHmQynYpCE90i7IzyG3RLfNjjdG1fwEw51C9Zpzivihx
         zWUbKhoxDx0+dDBWfe90js8DopBZ1ZWcvWozimmvwVU6Aw72FiH3/YwzBGkAGIjmArJ/
         mtAnAWPOKwln+mH3x/9XPjBKNHOwgNpNpDDQ6FJdCA43kWEyiYUM7qyws7EfT9eIAlPR
         dCUWzLlBXsp5wlPVeae2o1dDosQJq+QpbVO/biFYi/GlJr/o+ge5uxRFzgrZcjF9ldJb
         XRLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678694187;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lzq3mH0igtNXMX04I4fesgrAR6gDQLGvrMHBvWORgCU=;
        b=CdQVAJaBUbxdSZA7qqKNoq1FnUqAcddlIDMLU1pZpWwaXCFpcTaW3a9AHllEFs8dxJ
         em4kBWrUGHHc9oiQ8JSMIM2SRIDjzW1f2vJgnAxbsDr9z33N/HJQ2CNYAzg6CVSQdWJB
         Y6SyjuNxkhcB8Ns/Dx8Vu4QWFEf/k8Eav0ckUeVcoGdOT6lJokTu21Af7STnoztDB/LX
         D8TPy0Z1wdJfCJakSEwzmciT/SFmLBrs+fjFi9dOTjMN+x2KWgpdNylhDuys9JHqlq5u
         HX5JqbTrd5Qf96zsS0w7F9QQT/oCxbfQu6Aten+pAgp1pL3STNOlJhb5c3jfFj89udo2
         JipA==
X-Gm-Message-State: AO0yUKVy4WICLqHdUmdAeqlY30JyZw6GP4JtUaP6dIuXDGp+IAfJQSId
	9MMr9TSn1ddRMI6Evfy6GOghKSdr21XUDZIAo8M=
X-Google-Smtp-Source: AK7set+gEQUFy7hKvp76vpMF02dGlHd4oQib/h5z/z5rTbGMCYzM42cRWMq53PUefYgIrYJcFYHiZhXAYNe7yZGiE6k=
X-Received: by 2002:ac2:5313:0:b0:4d8:5810:1ffa with SMTP id
 c19-20020ac25313000000b004d858101ffamr9911899lfh.11.1678694187169; Mon, 13
 Mar 2023 00:56:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230312072422.2626859-1-raj.khem@gmail.com> <CANNYZj8fy7m1_fzZKyVCoKTd2-c8dnas-0NYkif89JXf7fPOnw@mail.gmail.com>
 <CAMKF1srA2ks+mvbBM3tWk=6zfcHFHYXnix2SNpCYnXp0rSDwVQ@mail.gmail.com>
 <CANNYZj-5h=u8yF0zzpSbwoJWSzVFEo5AHMeER1qeEin3kVtUUg@mail.gmail.com>
 <CAMKF1sqjE0xeYtzw9az+ysmrzEs6rsH0E_uLkZcrn65X195+Wg@mail.gmail.com>
 <CANNYZj_dSxCUczz0ca+Py3RroXVjhzLxgY-bA56sRRa-ZJ98-g@mail.gmail.com> <CAMKF1srRD3_87wCE6isn0HTzWRSpOqVoj4JhVfcZh4ruC4-bMw@mail.gmail.com>
In-Reply-To: <CAMKF1srRD3_87wCE6isn0HTzWRSpOqVoj4JhVfcZh4ruC4-bMw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 13 Mar 2023 08:56:15 +0100
Message-ID: <CANNYZj-7tzLohxYWPmAePx=57x3qxtR=PA7n4kn9treAR=jOGg@mail.gmail.com>
Subject: Re: [PATCH] systemd: Fix musl fix patch
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 07:56:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178412

On Mon, 13 Mar 2023 at 01:12, Khem Raj <raj.khem@gmail.com> wrote:

> This is working as intended, unlike glibc, musl provides stddef.h and
> it wants musl based platforms to use that,
> OE clang won't do that when the selected libc is glibc.

But this means gcc is not doing the right thing. It does take its own
stddef.h (rather than one from musl), and this leads to undetected
breakage like this one and general inconsistency between which set of
headers is used.

It's gcc that is the default, AB-tested choice with musl, shouldn't it
work correctly?

Alex

