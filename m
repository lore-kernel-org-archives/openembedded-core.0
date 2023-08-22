Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38404EE4996
	for <webhook@archiver.kernel.org>; Tue, 22 Aug 2023 12:31:28 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.6724.1692707483825094015
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Aug 2023 05:31:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=hhcaCcN8;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-4ff91f2d7e2so6275348e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 05:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692707482; x=1693312282;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jynzwKzeWmzG0iDVyFwVZCN1ORCcl+ESvWUkDJ/7rC4=;
        b=hhcaCcN8gcg8hmVl4dJplPO2lS8q55pExr1cRJ/uzIYaS9UuOauQiKLLg/jGnI5E6j
         JWzlf5yC2JF69rqLM3sN+c4qpdGIIKxfM4+fHgKfEGfXta7iJnvuHJAMOoXbUuqwUAL+
         tnJ/FB/pgQROT39tMK6BU1BTkOjXFiVIqsNza+NG7u4kp9+OqBE4zG6pp8A70eh/ElUb
         cjBYX1/jAxrctkP0+7Q1ZN2mw0WCvwnhM/ABbhHygd+XAVHDvpFkR39EPXFxqgBnZm/3
         O7tjr8KMaDDnPFZbBaLKk+owK4QoGScspq+sysy24ihWAp+piyIi3XtULA86Iej6sXa2
         U3tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692707482; x=1693312282;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jynzwKzeWmzG0iDVyFwVZCN1ORCcl+ESvWUkDJ/7rC4=;
        b=WjClc+w9ERGWjswVn33vb81HJ2UvAngRd5HHFHh2yQIemOsGWBd1XvJO5qv/1f3dS+
         ZyN+etiYbBJFPKxA97SjaJ7bGEct9gsZ1V4hVhbOqir2jCCCeHO37cicyHsHYgVA2trQ
         BE0qlo+Atbc1rx9Z2Rdi+hUFo0PfWx//lrulTMR0DDA07/LEK5+2mRoN8sOc5wKtpDJe
         PVI17fYBDMI8cEMwIBzucVV3ZNn6ccXnD1x7zDYsPgCZMHG9AdYd8n0UTegs9g4cmOhA
         bP+MU8l1l0XHK0n59X8mTGD8aMxbbkjVqOA7VuBHkJcxSyB5AlhibGZsw0RerunRnJ/l
         3RDw==
X-Gm-Message-State: AOJu0YyPtsAcnYiHxW+PndNhSIExcmGArhbSCueFqmXb/qKsZcOvM3ex
	6gkTym/b66F3hfsAyrGnCQ82aexTm9p9h8CwaLU=
X-Google-Smtp-Source: AGHT+IFkaQD5xs8oOxpsZ1Xwn4Xg+BRjn8CyvDa6pKNu7g5pME8I2ryZfNkKM0t5Cxu543K+NzY1ngwwZ2yEabRZTi4=
X-Received: by 2002:a05:6512:1192:b0:4fc:265d:fc62 with SMTP id
 g18-20020a056512119200b004fc265dfc62mr9062329lfr.18.1692707481670; Tue, 22
 Aug 2023 05:31:21 -0700 (PDT)
MIME-Version: 1.0
References: <1b3bb1c747644f83156f6269de2c502660c18466.camel@linuxfoundation.org>
 <ZNt45UVb0Ps/kKLM@windriver.com> <15f7e67b-afd7-7504-aa23-41a4c3cb62a1@prevas.dk>
 <ZN7j425iXGBPbS5i@windriver.com> <177DAAB2E4C3384A.4797@lists.openembedded.org>
 <177DAFEBFB5EB0D2.24073@lists.openembedded.org> <d7982e9549e8e8042dfdfdaa4f3173684aa726bb.camel@linuxfoundation.org>
 <ZOSoIXLG7vH/GC1l@nuoska> <16dbcda04582734da0d6cb2e34c914b3320cbf43.camel@linuxfoundation.org>
In-Reply-To: <16dbcda04582734da0d6cb2e34c914b3320cbf43.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 22 Aug 2023 14:31:10 +0200
Message-ID: <CANNYZj9Ymgwxh4md9nJ33NUFjagmC1MNc7XFLKyF0C9MZhcegw@mail.gmail.com>
Subject: Re: [OE-core] Dilemma on changes - merge or not to merge (e.g. 6.4)
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>, Paul Gortmaker <paul.gortmaker@windriver.com>, 
	Rasmus Villemoes <rasmus.villemoes@prevas.dk>, 
	openembedded-core <openembedded-core@lists.openembedded.org>, 
	Bruce Ashfield <bruce.ashfield@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 12:31:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186507

Maybe this is stating the obvious, but please avoid the temptation to
shortcut a bisect, once it's been started. There's been so many times
I guessed wrong what is the offending commit in the remaining set, all
the way to the end. Still having the issue after a revert is one of
the most frustrating things.

Alex

On Tue, 22 Aug 2023 at 14:28, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2023-08-22 at 15:20 +0300, Mikko Rapeli wrote:
> > Hi,
> >
> > On Tue, Aug 22, 2023 at 12:47:04PM +0100, Richard Purdie wrote:
> > > so between 6.1.38 and 6.1.39?
> >
> > Maybe:
> >
> > commit b1cdc56bc177c2e182c204bb08ad4e87bfd67942
> > Author:     Paul E. McKenney <paulmck@kernel.org>
> > AuthorDate: Wed Apr 26 11:11:29 2023 -0700
> > Commit:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > CommitDate: Wed Jul 19 16:21:01 2023 +0200
> >
> >     rcu-tasks: Stop rcu_tasks_invoke_cbs() from using never-onlined CPUs
> >
> > and
> >
> > commit d58f0f0ce6332ffeb406540295cc49732c26fb51
> > Author:     Paul E. McKenney <paulmck@kernel.org>
> > AuthorDate: Thu Apr 27 10:50:47 2023 -0700
> > Commit:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > CommitDate: Wed Jul 19 16:21:01 2023 +0200
> >
> >     rcu: Make rcu_cpu_starting() rely on interrupts being disabled
> >
> > ?
> >
> > master branch seems to have larger set of changes to rcu.
>
> I wondered that but my test says
> deda0761dc6161f03278da4679d96d4727992e91 is "good" which is after
> those.
>
> > Maybe locking debugging options could help to find this on every boot.
>
> Perhaps. I think given where I'm at now I'll just try and bisect it...
>
> > Then wasn't
> >
> > commit 77cc52f1b8d76c995648cb4286e57142cac8ce0a
> > Author:     Wen Yang <wenyang.linux@foxmail.com>
> > AuthorDate: Fri May 5 00:12:53 2023 +0800
> > Commit:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > CommitDate: Wed Jul 19 16:20:59 2023 +0200
> >
> >     tick/rcu: Fix bogus ratelimit condition
> >
> >     [ Upstream commit a7e282c77785c7eabf98836431b1f029481085ad ]
> >
> > causing some issues too?
>
> Yes, but I think this is something different...
>
> Cheers,
>
> Richard
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#186506): https://lists.openembedded.org/g/openembedded-core/message/186506
> Mute This Topic: https://lists.openembedded.org/mt/100733646/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

