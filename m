Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75D91C6FD1C
	for <webhook@archiver.kernel.org>; Mon, 13 Mar 2023 22:45:07 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.web11.92.1678747499653886851
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Mar 2023 15:44:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=W0kPlona;
 spf=pass (domain: gmail.com, ip: 209.85.160.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-176261d7f45so15385270fac.11
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 15:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678747499;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ec+7dNFwEMqJe9DGqK83tmb4zfEE68BDRU0fAtxhjmA=;
        b=W0kPlonaCnm8StOhRK1ZwICy3USw7kW0FYqRI1gav02BTnpeH2tAGxoBHxN+U+B7R6
         CjPG8k9rx5R9pXJDXIGwiYY7hkeEDmT4bwy7I1LHpuvHF6GCmUgEJhODXl1DThBdrPHk
         riRWYnh1NMF/DH4upd5HR4h3vQeHxgdCdQQmuyT54FeWimxQAoWoA245YYHP5pN6CFDs
         drYXgfippLBlEu6Hxrorzk8otlvQULIMtXuHVtmLVxaxrWkZEG/ZhylaLSLZNmob/RVx
         KQLZ7zLjwKh9WDSZkoQWC1Me+k53x+ZXiKRO7ccTMSZSVBYr6sSOtu9CUnyvoKbdUQvu
         cw2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678747499;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ec+7dNFwEMqJe9DGqK83tmb4zfEE68BDRU0fAtxhjmA=;
        b=aVE1osBbJma5CgmC2xQ30cX82nQBkkwsopL6F0c1b1Ah3WFEF/xB00EmCnF1GRwPRy
         tUGbity20sZMF5a2A8xcJT5nDxibO0++Lyeq4raeU0YIlDZgXlRuviZOtMjgVFDZ7J++
         tb8ajWp2I7sSqe3t43RS4A5gKn30891n/uqkRHWHkQajcCmpNBHJ6w5jMnjzgIbgIrbv
         hsrHOdhaWufM3Vi9EEyTE7hGdBFcKXSl+zfGuXhp5u37QBaGanPAEi113w3n034eHxgj
         YsmukIKoYdDrZbmUgRIIXTmULCeqpCWuEGXnD8nJ6pKDxtEfWUtLpvqMVQOKJzWgMZ4a
         N7nw==
X-Gm-Message-State: AO0yUKVrjT7gZ/luJtxb1uqt7zbBe9q7pha7Csh+5BSl6OmxSmxGl12h
	NXnVCIHIYFNy5Y8vc2dN9DJoWw1KecLAje4hh2A=
X-Google-Smtp-Source: AK7set+Q+SSrB78sTUft663cRsKptLVaDDp/G6tVfwgBzXTF9doHAlc7bz7IkQSRPlelQXkGqbW/Xwka4gsjoXiUl1Y=
X-Received: by 2002:a05:6870:c90f:b0:177:a5ec:b41 with SMTP id
 hj15-20020a056870c90f00b00177a5ec0b41mr2762757oab.4.1678747498847; Mon, 13
 Mar 2023 15:44:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230312072422.2626859-1-raj.khem@gmail.com> <CANNYZj8fy7m1_fzZKyVCoKTd2-c8dnas-0NYkif89JXf7fPOnw@mail.gmail.com>
 <CAMKF1srA2ks+mvbBM3tWk=6zfcHFHYXnix2SNpCYnXp0rSDwVQ@mail.gmail.com>
 <CANNYZj-5h=u8yF0zzpSbwoJWSzVFEo5AHMeER1qeEin3kVtUUg@mail.gmail.com>
 <CAMKF1sqjE0xeYtzw9az+ysmrzEs6rsH0E_uLkZcrn65X195+Wg@mail.gmail.com>
 <CANNYZj_dSxCUczz0ca+Py3RroXVjhzLxgY-bA56sRRa-ZJ98-g@mail.gmail.com>
 <CAMKF1srRD3_87wCE6isn0HTzWRSpOqVoj4JhVfcZh4ruC4-bMw@mail.gmail.com> <CANNYZj-7tzLohxYWPmAePx=57x3qxtR=PA7n4kn9treAR=jOGg@mail.gmail.com>
In-Reply-To: <CANNYZj-7tzLohxYWPmAePx=57x3qxtR=PA7n4kn9treAR=jOGg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 13 Mar 2023 15:44:32 -0700
Message-ID: <CAMKF1sp2q_4VbdA_G9nEW_Y=dSJf91qVqLGZLfduVkg6_sJ1yw@mail.gmail.com>
Subject: Re: [PATCH] systemd: Fix musl fix patch
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 22:45:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178469

On Mon, Mar 13, 2023 at 12:56=E2=80=AFAM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Mon, 13 Mar 2023 at 01:12, Khem Raj <raj.khem@gmail.com> wrote:
>
> > This is working as intended, unlike glibc, musl provides stddef.h and
> > it wants musl based platforms to use that,
> > OE clang won't do that when the selected libc is glibc.
>
> But this means gcc is not doing the right thing. It does take its own
> stddef.h (rather than one from musl), and this leads to undetected
> breakage like this one and general inconsistency between which set of
> headers is used.

probably, but there maybe some reasons why its not done which I am not awar=
e of.

>
> It's gcc that is the default, AB-tested choice with musl, shouldn't it
> work correctly?
>
> Alex

