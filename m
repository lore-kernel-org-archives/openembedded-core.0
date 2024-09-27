Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F879CDD1A5
	for <webhook@archiver.kernel.org>; Fri, 27 Sep 2024 12:56:24 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web11.68334.1727441781386081435
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Sep 2024 05:56:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=GedZiMvy;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.173, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6e23aa29408so14909467b3.0
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Sep 2024 05:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1727441780; x=1728046580; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FOxM7H2jTuhDiGnniiyfzYyf5WLi9zrTXpSLaO9iE6U=;
        b=GedZiMvyeDM9c/i03qBZ89NMyYNyLqVAPURpizKISXw7GtH82TZykIM7MV5EO1Gj4l
         oCFgwNZrEsSEMvSoVEKIT4k1KYLvnjJ+2KKBTlxK/DvFZpPjXOyhPd9qgBljl2hHe/Vz
         YcbkRvG4DsQk3mB2oz0Jj5SHnA/VehPJnzcT/MoF6B4Rztkvf8T+eIQ47IE/TJVwFdN0
         i3RQiadJ9FXiBqRH7YrK/rJeMUJOqV16ieKDZiTI1CxGGoV5YzgcDIPukZoedJYHHoJg
         jph0UDpwY/omob+H1ManqIG8qAujAccNmSr4WZPLUM1PSflbKAYmLSpXrbkro+DzVGQl
         teVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727441780; x=1728046580;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FOxM7H2jTuhDiGnniiyfzYyf5WLi9zrTXpSLaO9iE6U=;
        b=i7tthfe3EgmM4+KeZe/NGH4kZ8gj6At2wAJFAs7UDf37yqTyv/fV9/pnwRwTM/sl9g
         P+Q2RVqmKvQARIYeF8Cs64F7QwNaXSRy/znrZTsXDVCpBcai3ePwJepjz7T9T20x9YMh
         j7zfzYfBD+0ujhUEOE7F7BxATftB5GoCE1FvyVgts61HR2tOaLp+IqzPTSDBJZiHO66/
         tvX/k4iV2WZ+5fFarCplbljNi7mXAECOPa4Tw41D5mPfkDATnniS70YnGGWirb11gMwE
         fLbe1NcBXdo7dlGHxZfUBvEpHUF7PhEgvVePT3jY0UC01smK6CCuELvlfWCN0gsXCLzw
         07lQ==
X-Gm-Message-State: AOJu0Yyy2h4SBbe05Qj8e+KbB1k9+AEJUGw0yrxeQC2V9Us0Upp1shaE
	pE9Xok6J70mx7B9NGwcIv0T8W9pZQIKx0rCy19haMUPMlSnrr5OxFHzFKubRx7hyPMh0Ry7yUtx
	/SUfsx8Z88+6ZYF8hOwG/zC4Q/kbZ2BKxSDX3D0GWwJIKPMQU
X-Google-Smtp-Source: AGHT+IEaY5SrLyCCfCte8XcmwSb07Cdy1aGoLiw2HfP8+fXfr0jA5QTFU9Lb2mtYuWuDX+hKvmChYbTyDXlo2EuHDgY=
X-Received: by 2002:a05:690c:7203:b0:664:74cd:5548 with SMTP id
 00721157ae682-6e22ed804ddmr49870407b3.1.1727441780565; Fri, 27 Sep 2024
 05:56:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1sp+X4DJ1WRoBMiCf2OCA8dGqDmf6-Vh1VfYsemTOdfM8w@mail.gmail.com>
 <29158.1727328870312994691@lists.openembedded.org>
In-Reply-To: <29158.1727328870312994691@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 27 Sep 2024 05:56:09 -0700
Message-ID: <CAOSpxdYM8XVLTVWg6jkZrGPmPG1MVfQMH17aASKgHOK+6zLGgQ@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH] glibc: stable 2.35 branch updates
To: Deepthi.Hemraj@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Sep 2024 12:56:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205020

On Wed, Sep 25, 2024 at 10:34=E2=80=AFPM Hemraj, Deepthi via
lists.openembedded.org
<Deepthi.Hemraj=3Dwindriver.com@lists.openembedded.org> wrote:
>
> The test case nptl/tst-thread-affinity-sched is an additional failure and=
 represents a regression

I will add this to my test queue, but we should deal with the
regression before I can merge this.

Steve

>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#204968): https://lists.openembedded.org/g/openembedde=
d-core/message/204968
> Mute This Topic: https://lists.openembedded.org/mt/108647219/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

