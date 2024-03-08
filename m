Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93ED8C5475B
	for <webhook@archiver.kernel.org>; Fri,  8 Mar 2024 14:21:47 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web11.22983.1709907698490655466
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Mar 2024 06:21:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Hc0GjZPs;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.178, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-609f1f97864so20082887b3.0
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Mar 2024 06:21:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1709907697; x=1710512497; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KC7giARlutA+3rPAK+OIowDtZMv3jqhzHj6wY+kmEbg=;
        b=Hc0GjZPsZIkJi1u6h+7S03aMFo7wdVGw5BUtgNIoG24HWQxfpJNVqSWQWm4TgTjd4z
         85bW2OsosVScz91K/X4QAOYUqm9Xleo2g1x5zT5hrHpjo5v8P3StGKCWaOm3S0WqcE06
         JYbANPMxFV9Zmc8yCTi2UJ0IWPRXQEfAEaotAV5JpczY9c2d6Ubps5qSKQ7TsCGteI5B
         5UN/WHJLzOOFA4YSGuABtWHqq6JLkhSakbc8mYquQWeXJEtQNGgFeTHpfj7PiQswVn5o
         n0E6jHfY7ygFuRnI7dhl9gRp8PY3qo30UTIkIFsNxWOU9Xef1sE0e6hEnavWQIoGQUDB
         jR9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709907697; x=1710512497;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KC7giARlutA+3rPAK+OIowDtZMv3jqhzHj6wY+kmEbg=;
        b=Z/ckklqeFBAL7TLouWDgbXEBCGHxI1PiLrlQQQ3MJmXX7ob5CwnKG/5l22i+EhPLuv
         7JPWImdEB0bZDqL4xeiriJprbxgwYZLGT6qAo3VePwerhIYEzujV6ohCoem1uVRDnrtm
         /uofcCFYERkMVBFjWznvLP/Tajev45ljTnZ2B6lAFsxY9SUkjtSIHEqe99AC2hCe9RMo
         sSntuyZ9N/r967+A+fyaQOwE55O/Tq648IeUP7I3MIcpSJbWFtd3TzyQ1AgwzQvtVtQO
         9dtxfnPFYy+kOMWXNn9kH6jhwpysR987R96SbhXpNYN+3q/XGB1eMUG9rY4EK0ugHkpm
         D/MA==
X-Forwarded-Encrypted: i=1; AJvYcCWU5UOVPcD2xpMvUeWRE4cWfqYucQ9pusrUz+L/LmZcDa6P3VeWG8EFhGwwWI/hPf/XdeSyCwMx+Z1DcHzXchIFlTHwZiRK+gWo0neqoDirsa9g6YgcdFcp
X-Gm-Message-State: AOJu0YxYw4FshJeNcdS4vjCwz286sGStdzhEG33pk5fO7cR/JvAnwjEm
	7uAF4iOY47IkrPTTnEw8ZSs0BOJQSnyt9DuFDVtldZp8qCMbpNAVyu55tMyyK3pnhW4g76N+4Ca
	GUOo4mQlKlpqkMsLBQE8gZN9cWLnjeo+LSJZgQQ==
X-Google-Smtp-Source: AGHT+IF/ewQcm5PvMcowjad64ICrMl2w3VgE7Gd+tEAbw+w6egvhKAeu8xnEq7qs39EZuV+ea7oEFN++4Plb3MwSUIs=
X-Received: by 2002:a25:20c5:0:b0:dc2:2f4b:c9d8 with SMTP id
 g188-20020a2520c5000000b00dc22f4bc9d8mr17675352ybg.16.1709907697640; Fri, 08
 Mar 2024 06:21:37 -0800 (PST)
MIME-Version: 1.0
References: <20240307193409.987235-1-bruce.ashfield@gmail.com>
 <CAOSpxdaskMSouQhV_FmfS==CnfQ5zikQQ4QwwA3RzqtM6dzrLg@mail.gmail.com>
 <CADkTA4NM7zk6kpWe3BENz2a4Fjqwkx+ECqbu6tvsoktHWC45RA@mail.gmail.com> <ZesUK4JntnaikkPb@pek-khao-d3>
In-Reply-To: <ZesUK4JntnaikkPb@pek-khao-d3>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 8 Mar 2024 04:21:26 -1000
Message-ID: <CAOSpxdbcpwpcwk+e-46FRKaPMip1mD+f4gE8ZP+jfNnef3S-UQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] linux-yocto: for-test-only: fix parted ptest
To: Kevin Hao <haokexin@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Mar 2024 14:21:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196851

On Fri, Mar 8, 2024 at 3:35=E2=80=AFAM Kevin Hao <haokexin@gmail.com> wrote=
:
>
> On Thu, Mar 07, 2024 at 06:13:35PM -0500, Bruce Ashfield wrote:
> > Adding Kevin,
> >
> > I'm not going to be able to debug this more for a week or so.
> >
> > The alternate ways to fix it would be to try that ubuntu patch (fixed
> > for our tree), and / or see what else needs
> > to be cherry picked to -stable to fix util-linux. It is likely just a
> > return code difference to userspace when
> > resizing is being done.
> >
> > Kevin: I'm not sure if Wind River is seeing this, but you might want to=
 look
> > into those ptests and see if they pass on your end.
>
> A silly question, which branch are these three patches supposed to apply =
to?
> I have tried the kirkstone branch, but it seems that they can't apply cle=
anly.
> I also tried to manually apply the two kernel patches to the latest
> linux-yocto/v5.15/standard/base branch, but they also can't be applied cl=
eanly.
> Am I miss something?

No, you haven't missed anything.  Bruce was assuming that kirkstone
contained  patches that he hasn't sent yet. I wasn't able to apply the
second two patches either.

> On the latest linux-yocto/v5.15/standard/base kernel, the parted ptest
> does have three failures. Then I have tried the ubuntu kernel patch [1] w=
hich is
> mentioned in the previous discussion about this issue. This patch can app=
ly to
> the linux-yocto/v5.15/standard/base cleanly and it indeed resolve the par=
ted
> failures, and I also don't find util-linux ptest failure after applying t=
his
> patch. I attached my logs.

Hmmm . . . Bruce said that the ubuntu patch didn't apply for him, so I
haven't tried that.

Do you have a kirkstone patch that I can try on the autobuilder?

Thanks!

Steve

> [1] https://git.launchpad.net/~ubuntu-kernel/ubuntu/+source/linux/+git/ja=
mmy/commit/?h=3Dmaster-next--2024.03.04-1&id=3Dc3032b60ff7b3948325b8f2bd688=
b9a74be3cfb9
>
> Thanks,
> Kevin

