Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1CB9C04A6A
	for <webhook@archiver.kernel.org>; Wed,  9 Aug 2023 16:04:07 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.web10.92107.1691597038970396164
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Aug 2023 09:03:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=I7mruYWn;
 spf=pass (domain: gmail.com, ip: 209.85.160.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-1bbafe6fd8fso5184612fac.3
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Aug 2023 09:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691597038; x=1692201838;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kZ21z9PG1aXSuGNgKyLDohd1ugAN/FROtTRFGDW7C7Q=;
        b=I7mruYWnMNYxuDfH7Ys49WiFXn2Zj4nQ9Q8qPJrGawV9jxjeH2IpxCTe1RBJx6tiii
         cBbFLugeARTrCYTHAltOpX7rL7gO4FBnUfXo0/T1Tzw/pZJSybFXT4vmS5MybE/B8FsC
         JC+ogC04BrWlIi7IsUI+AzZ94u311LPg9oS+s7Xan3q/0yuOXbrj4UfIVZgAZS0kuuQ5
         vsxgABaRbDEY7NTVkZzLmdnAlFTcA/g4L9vBosFyeQygUPOOK/uphkvBab8K38gR44/Z
         kWAVkpIab0z9mmAMmTd5bImK2vaNL6CdPY6jgkFThwWxY3uF/ttf/QPzj8hl5D0xWZj+
         TuHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691597038; x=1692201838;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kZ21z9PG1aXSuGNgKyLDohd1ugAN/FROtTRFGDW7C7Q=;
        b=MNsne6OlmOuU3IxcWpXCRi1j6rLCNDI6oQt44zIvro1ngZhwuwDKZbeIVG2i02TDCh
         1/JYcocbewBlPiCPiVTe/McDviPZkOXVrMrEsmAOlE3TRVNsUVf0raZs+LW0f8pF8oqe
         8kNRPwTOI5wqPefI+lS3htg1ZWHcDUkkV8WCxG3qt8ry4cTNThvFtjz1cZ7qbs6mAhul
         23UODposUwgXzvDsuOqK9/DI2tt2sUTfp10Nvrd8xQ37Z9kHT6y3Owv5xpylYZhAxcDT
         wg6ScL16crcIaBgH3j6klQVY13MiwF3Kj2pNjKiiNmC67mGzmvrf88hyRZuR5CFYYGsf
         wygQ==
X-Gm-Message-State: AOJu0Yw/hiy3/XD9FjoGs2qCq5Z0CIQ0Jv/g0+gxCi/9UtwCc761tgWp
	eLQX3/3ivfWLNUCqsOf/Yy0mj38qcBriJkxO2eA=
X-Google-Smtp-Source: AGHT+IF5OhRQI+txHc9Q0aFj495ch8vn5HHLxg4Zk6EHBG9HDMiW0w8jankEAvCvk6in26f6C7gBJsVX4jrWlpgm/oM=
X-Received: by 2002:a05:6870:d204:b0:1b7:2879:a0e with SMTP id
 g4-20020a056870d20400b001b728790a0emr3822752oac.12.1691597038115; Wed, 09 Aug
 2023 09:03:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230808160828.3045524-1-jose.quaresma@foundries.io>
 <CAMKF1sr4azY=E9XUz4946qWByrMFHbVM-jCACFtgF93_ry4DpQ@mail.gmail.com>
 <CANPvuRny9BbNDpGtz6y2omz2fzsezKHij_pff_bMNRZsW_iyTg@mail.gmail.com>
 <CAMKF1so0DFL3CZqtPKzi1QBV2cQ=6FD=J=TsaFS8ME8KXyPsYg@mail.gmail.com>
 <CANNYZj-DtpOfOye1kOvwCcxzLuAJ6gc3FyE__VMStLiNirrViA@mail.gmail.com> <99E1E475-401D-4C4E-8857-FE94A07FC349@arm.com>
In-Reply-To: <99E1E475-401D-4C4E-8857-FE94A07FC349@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 9 Aug 2023 09:03:31 -0700
Message-ID: <CAMKF1srsrPTzqzvWL0DtCUKCd285kv737cBUDXdjE3JDMezxRg@mail.gmail.com>
Subject: Re: [OE-core][PATCH 1/2] systemd-boot: enable verbose compilation
To: Ross Burton <Ross.Burton@arm.com>
Cc: Jose Quaresma <quaresma.jose@gmail.com>, Alexander Kanavin <alex.kanavin@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Aug 2023 16:04:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185713

On Wed, Aug 9, 2023 at 7:49=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> wr=
ote:
>
> On 9 Aug 2023, at 07:47, Alexander Kanavin via lists.openembedded.org <al=
ex.kanavin=3Dgmail.com@lists.openembedded.org> wrote:
> >> Ideally we only want the verbosity when something goes wrong and meson=
 ninja etc are good at that with their defaults perhaps that -v should be t=
urned off by default as well
> >
> > Absolutely not. As someone who spends a lot of time fixing build and
> > runtime failures across all of oe-core I beg to differ. I want
> > verbosity all the time, everywhere. I also do not want to spend a
> > second figuring out how to switch it on (it's different everywhere
> > too), or to run another build just to get the verbose logs out of it.
>
> Agreed with Alex.
>
> Unless Ninja is clever enough to emit the full log for _every_ build step=
 that was involved in the failure, I definitely always want verbose logs.

I found Ninja defaults are good for debugging build failures, I deal
with this on large projects like chromium and clang often, Most of the
time I want to get to the error quickly
and have command to reproduce the one compile failure or other steps
and they are emitted in full while succeeding steps are curtailed and
most of the time that is what
one needs to solve build issues. verbose logs for such large projects
are huge, need space and time to generate them, I understand the view
of people who fix
build issues on daily bases, Most of the time builds succeed so its
important to keep that also in consideration. Perhaps it could be a
global option which could be
default verbose and opted-out if build modes chose to do so.

>
> For what it=E2=80=99s worth this made me look at the recipe to see why it=
 has to define do_compile, and I ended up extending meson.bbclass making th=
is patch redundant.

Thats good.

>
> Ross

