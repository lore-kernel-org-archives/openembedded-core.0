Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78AA2C38A2D
	for <webhook@archiver.kernel.org>; Fri, 21 Oct 2022 21:59:50 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web09.580.1666389586285050989
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Oct 2022 14:59:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=K3pcrXkS;
 spf=pass (domain: gmail.com, ip: 209.85.167.171, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f171.google.com with SMTP id j188so4748074oih.4
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Oct 2022 14:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=205wdo1cLNEfJ7SfLQs+XCh9mNY1M5TfeabmPaOAPWM=;
        b=K3pcrXkSbKKP8oNJaGQtId1mAliJdcWNGTT5BaQepRMlVcJOELgX//+I6xpvr854PA
         xcHCcnZanVnjVkP8FBr6TvD+c7vhzONyXx2a2yjfligFgH1aOkZOGdq6D8a5A6ZwI43C
         Tn6LB+evb7YVw1VQyXMxDVAcmJCLtQJqDffvtJUiLo2WsYix/a/SdAYg+ED77UvfuU6b
         PbmOJqG31q9BUeSYd3li0QgS/FKFwqv5jtrhdsoofjcQVxf9KGkL5XJQyOyr983FtX6f
         obP8tNj3Gw5P8UTSQPHU3oSuDV7LjiJc7BJr0lFd09rzFNfl5/8XOlcZsaJpWHoupM42
         yJyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=205wdo1cLNEfJ7SfLQs+XCh9mNY1M5TfeabmPaOAPWM=;
        b=D4OLV1t+nNYQFoyzzD14Rpn5hIavLj13E+ULGNVSVpxnfZqjacctvaNbh+t+ShWqJT
         SWRBn4+PttCu154OJSCWKZmck0oOouHrpLa7/r0GjqF5KD6EM3n+RNobRbs362H93RYi
         JCPxTBthPeagTpRdsuDJ/THz59IbVLdDMqTRmQ1HoI4hYl9lw5EjztfK8c5htt93Ov/S
         pDV3XVM8VbYDQ7kAUo6dsY1PoKMGswsD1gDkDP89Hjk1TRvd5EhDgag+NlprWOhOTB15
         BBmAO78641vO/53wp3i8U5qG19h9SrK83nFdBH6KFMZirtD/BQbxv4kHXOOVWvKfRLRF
         doUw==
X-Gm-Message-State: ACrzQf1VhMFFNYBr2UhNY+kdiA4VRY+9ME3mpivT6GxDqDej4V4d1A1z
	x5yaXUEKWEs4CcGh4outNsNcu3ELqHMFLDu9S0KJ3mvp
X-Google-Smtp-Source: AMsMyM6YEj+5KFqvkHVh3BpUK9ukETvdGhRp3q1DQVKV8HPnKUZW9jeF5nQ3Ecra5m/9XWP/qnKa4mHuZPUn8otMlGQ=
X-Received: by 2002:a05:6870:b00b:b0:127:2d3d:3c16 with SMTP id
 y11-20020a056870b00b00b001272d3d3c16mr29774030oae.262.1666389575049; Fri, 21
 Oct 2022 14:59:35 -0700 (PDT)
MIME-Version: 1.0
References: <20221018230820.2385167-1-raj.khem@gmail.com> <CANNYZj-r7G4y3ma8NkrgmKm-vgoXjvMEWYAUh=bOE0z80DrxkA@mail.gmail.com>
 <CAMKF1srnBDVj5ig2ZF_fX+-UZ5jtp0U89uG8qE5cuW1SjX0AfQ@mail.gmail.com> <E6C978BA-94B2-43D9-9275-29EC0323CDC1@arm.com>
In-Reply-To: <E6C978BA-94B2-43D9-9275-29EC0323CDC1@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 21 Oct 2022 14:59:09 -0700
Message-ID: <CAMKF1spdf9qEhCUyS4yGb=k5+rVFHbPXuj9Q5wRC=o0hUb9LyQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] mesa: Add native patch via a variable
To: Ross Burton <Ross.Burton@arm.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, Kai Kang <kai.kang@windriver.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Oct 2022 21:59:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172047

On Wed, Oct 19, 2022 at 8:29 AM Ross Burton <Ross.Burton@arm.com> wrote:
>
> On 19 Oct 2022, at 07:34, Khem Raj via lists.openembedded.org <raj.khem=
=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > On Tue, Oct 18, 2022 at 10:42 PM Alexander Kanavin
> > <alex.kanavin@gmail.com> wrote:
> >>
> >> Can you show examples where this is needed? Custom variable does not s=
eem a good idea. I also worry that it=E2=80=99ll break automated updates (i=
t=E2=80=99s bad enough with mesa-gl, this might make it worse).
> >
> > https://github.com/ndechesne/meta-qcom/blob/master/recipes-graphics/mes=
a/mesa_git.bb
>
> That is, well, horrible.
>
> *If* we=E2=80=99re going to expose a mesa.inc that people outside of core=
 can use to package up their own random Mesa SHA then mesa.inc should just =
be the packaging logic.

Right, and it will be an improvement for end users, since it helps in
deploying the mesa forks easy, We should be cognizant of the fact that
people are
doing their own distributions since that is what OE makes it easy and
is its USP.  Making it too rigid a policy also results in harder
forks.

>
> However, I don=E2=80=99t understand something about the patch.
>
> Why do we only need to apply it on native builds?  It=E2=80=99s a backpor=
t from upstream, so should be the fix.  If it breaks when applied to target=
 builds, is there a bug upstream for that?
>

This is to provide a crutch to compile it with ubuntu 18.04 gcc.

> Ross

