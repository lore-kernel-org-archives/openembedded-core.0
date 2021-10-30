Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C8F6C433EF
	for <webhook@archiver.kernel.org>; Sat, 30 Oct 2021 14:35:09 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web11.19247.1635604503353359387
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Oct 2021 07:35:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GGC8Twpz;
 spf=pass (domain: gmail.com, ip: 209.85.160.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id h14so11079554qtb.3
        for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Oct 2021 07:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kz+VEXt6FsJOriybplA8TNuT0vXJ9HK4C++ddEmuVSc=;
        b=GGC8Twpzb4y4FvF4H6BEiTaWQuBVCD19aQ+Z6yj7iZFODEJbkHoWqFnIFn3Jm7NXbS
         Cy/yF6jGhPqKkNADkVtMBsr8h0bs72uELiIPgm4nchB9+JRljzhBJQp9jYqI/VR75Y0X
         AY+fAw3CFe+FK+DrV+LsrnbK+7oov6McCecggwa2wW7cMtz6aCUCmsR6Bv8/sBY/y0i8
         S+Bm/Jbxe9oAI52L9lcoOeBwhX5Qdweaj1hUk2ETLlqrgnftai/5rws3BUcOVvvh2Lfr
         +fNNItz0twigrlFk8Z01oZH3IraqPCHVUMr89RxkcJo1z1hSqgmqxrh5NFY5ZLNMB9Au
         sKYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kz+VEXt6FsJOriybplA8TNuT0vXJ9HK4C++ddEmuVSc=;
        b=KaKsc+SRwQRQ7c1WdEFRFVpf+fPLbF6G8pLMmZkmV1sTCdEPcSlJkACpEVrVb7bcIr
         dBS2ug+eqM06F7rsH3I/0yU/OczhCOHFV8JQJeH8iCKjwxEUks+U9e0/fhZSQIlXwTBK
         opHgs17L7JJeBTsQILrq+mG1/kblE4+aQQVt5jtWsnTURZOhrLvk4rfWzAQ856G8pKvW
         fjvA7pEAtcqzGyCytMahgF73GjSfBH6ddT8Bi6noLmTrGiCkRr+oowKnFO7j3MVKb2Wc
         VUFzbPkPGKNmLSvnzd+ra7y3lSIv6ur7yXZnWhYbO1AHy4LGafLTZkYYc/JQVFTchgqw
         rHJQ==
X-Gm-Message-State: AOAM5317vmzB+MN0pp96l940bF6V/EKW+6bEP0S0Rf6r29hwIUFIollr
	FpSgG1YAitZKmIc9euulojsXpnfVj7u6KhbgjyQ=
X-Google-Smtp-Source: 
 ABdhPJy6TdJc3jJSa/dDox9RV+IIxe7G0NYADR2H/BMX87MzMApPOu1dyJwgw+9oGuIWbvwz7/Jx10V3u23O99xL7uM=
X-Received: by 2002:a05:622a:1788:: with SMTP id
 s8mr19080872qtk.116.1635604502126;
 Sat, 30 Oct 2021 07:35:02 -0700 (PDT)
MIME-Version: 1.0
References: <20211029171022.1279107-1-raj.khem@gmail.com>
 <20211029171022.1279107-3-raj.khem@gmail.com>
 <d4ceae27aca5b21cb70bed22c34596ceae369527.camel@linuxfoundation.org>
In-Reply-To: 
 <d4ceae27aca5b21cb70bed22c34596ceae369527.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 30 Oct 2021 07:34:36 -0700
Message-ID: 
 <CAMKF1sqD98++7Gzw5RKVp80tcW4kMx0kKJ=_0MLy1dQW_Y3_GA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 3/3] libsolv: Enable correct qsort_r on musl
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Oct 2021 14:35:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157645

On Sat, Oct 30, 2021 at 3:10 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2021-10-29 at 10:10 -0700, Khem Raj wrote:
> > Newer musl now has this function implemented and signatures are same as
> > glibc, current codepaths forces it on BSD path which is wrong for musl
> > and results in random segfaults in apps using libsolv e.g. opkg
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> > v2: Rebased on master-next
> >
> >  ...s-Conside-musl-when-wrapping-qsort_r.patch | 34 +++++++++++++++++++
> >  .../libsolv/libsolv_0.7.20.bb                 |  1 +
> >  2 files changed, 35 insertions(+)
> >  create mode 100644 meta/recipes-extended/libsolv/libsolv/0001-utils-Conside-musl-when-wrapping-qsort_r.patch
> >
> > diff --git a/meta/recipes-extended/libsolv/libsolv/0001-utils-Conside-musl-when-wrapping-qsort_r.patch b/meta/recipes-extended/libsolv/libsolv/0001-utils-Conside-musl-when-wrapping-qsort_r.patch
> > new file mode 100644
> > index 0000000000..6f0dea2e9c
> > --- /dev/null
> > +++ b/meta/recipes-extended/libsolv/libsolv/0001-utils-Conside-musl-when-wrapping-qsort_r.patch
> > @@ -0,0 +1,34 @@
> > +From 06321f1a2aa89b8e028946e793344657eaad0165 Mon Sep 17 00:00:00 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Thu, 28 Oct 2021 22:28:45 -0700
> > +Subject: [PATCH] utils: Conside musl when wrapping qsort_r
> > +
> > +musl now has implemented qsort_r, the signature however matches glibc
> > +and not BSD, current check makes it such that it falls into BSD case
> > +when building for musl, which clearly is wrong, therefore instead of
> > +just checking for glibc check for linux to decide which qsort_r
> > +signature to use. This covers both glibc and musl
> > +
> > +Upstream-Status: Pending
>
> Can we submit this upstream?
>
> It is a bit unfortunate that it looks like you can't build with old and new musl
> at the same time :(

Yes I plan to, but I have realized that replacing glibc only check
with linux check is
a bit too greedy where it will include other linux platforms like
android and additionally
ignore some like kfreebsd. So need to confirm that even though it does
not bother
OE it might bother upstream.

interesting that it does not work with older musl since I expect the
second part of check to
trigger, so I wonder why configure defines HAVE_QSORT_R or HAVE___QSORT_R
when they are absent in older musl.

>
> Cheers,
>
> Richard
>

