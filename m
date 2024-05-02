Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF671C4345F
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 13:35:06 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.5487.1714656897057560020
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 May 2024 06:34:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KMabGbLg;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-51ac5923ef6so1674487e87.0
        for <openembedded-core@lists.openembedded.org>; Thu, 02 May 2024 06:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714656895; x=1715261695; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FLLuWlgM/1tBd3RTz5h4U5BO5MWbLH6RzXz+/Xs8Iq8=;
        b=KMabGbLgFpKvOXss/pKGvnlGbmb2zqiyoCqn/MOUD4bgmINPo2jkObiDHyb11FkI0T
         CsfDnpAlF1D+cp2t+q7GzikgoWtabQqf3mu7zV5q+GiuN1lS1Nd0K6wZWDaHkG4aQO4z
         wZS9Sq2/Sl6U2HzALioUGtDqmsY7ooVM/jSlhI06lxnb5N4Fp4+BL/6ZU/s831e8vyti
         pUH7ckMR27wSvHb4gliVo2fjF8SRDzLTQJua7+sh5vhd7hb9HexZqSI/Yckrdc9f+ofo
         8xmvbjn1dAAapbJVX6EXtzcnCgll8YrzbSbkDbF4ISfhDy/BHbMRwGk6YMfjBYBATodh
         wPGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714656895; x=1715261695;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FLLuWlgM/1tBd3RTz5h4U5BO5MWbLH6RzXz+/Xs8Iq8=;
        b=nQrmBmZ7sG/BAyHcwODDKn8r5ZpHuOQgi/9oMCbrLHMM1vhDfU87eiV/s0Cm9mtIhK
         9vwssYY/p2lH77iqGDlZr6JeplXeH4uG7/b5uD79139Z1DMfBbVFLPjERtw1QgYciKIT
         PFES4bZbdqLN6UXDdbPXk6t75vH927FDPXBQtLY+YB75Wd86LBAU+FOVf52BLrVBibYV
         hbhAfDT940U2kdQweD3JSYWgN3RWQ3unw2d7FyjB4Z80rl8O5FCTcwfjn/aIn0is178y
         EbLC89zKwZa7/QXJ4gbnQYGyfRCjLbCjYzZQoOlzOLDsPmrIHWPIFhuQlibu/CanYg22
         /PPw==
X-Forwarded-Encrypted: i=1; AJvYcCXxaG48Nu5MtbkKxi3jx7Hf63X7/ztt0S6QCHaI/zfJ4bCS+LcK10e1XcDwqlTv+7vua7GR/gtu2O+J8n+QUpd4brzip2EGRbmCGLe0TmemN416ifE4R4xS
X-Gm-Message-State: AOJu0YxcT57dizQPHZ1ontuwDfi/CPLyulO0pG82rEtzCLIizfcyYzr4
	dLsiPKUIVKXJoLF8mFtuzqKUOPbAQY2iR6J8wT/PcN9+6h/1Pe2Lo+AURjjEJBbBjXc4uoOaDAJ
	0x47/4v2RQ6Fth9WQVOWuWXyLDXk=
X-Google-Smtp-Source: AGHT+IF9kGAjT9eGUcKngOFs9NBb2PUfEYsBA9ZNRHNCoiy//GkAH7oLiace+DBhtT4snClhYHjtXYSnvPq6B8IxUXY=
X-Received: by 2002:a19:ad01:0:b0:51d:a265:6683 with SMTP id
 t1-20020a19ad01000000b0051da2656683mr838414lfc.15.1714656895090; Thu, 02 May
 2024 06:34:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAMWxwJ0znPDyQAKAwv8PL9GwyCCEpW9+2SDmXsygNyK26_xF-A@mail.gmail.com>
 <CAMWxwJ1aad-ggrC+Bug=RGx1yQcFADOSWiZMDZv8S2AnJ7ntnw@mail.gmail.com>
 <5684983E-FC35-4766-BA02-4D5BCBCB6796@arm.com> <17C993B983870D20.19690@lists.openembedded.org>
 <CAMWxwJ3ok_d17XnVEgSm3H3qeKK+7U3AQ4OuwNFXTo-jWjtHoQ@mail.gmail.com>
 <ZjKzwmSpKmznOedr@heinlein.vulture-banana.ts.net> <CANNYZj8eFxRVx6PE9RuOPS2L0Km+4O=19XC6gDctZ4v3dVH-jw@mail.gmail.com>
 <ZjOMcNhYVh50R0lt@heinlein.vulture-banana.ts.net> <CANNYZj8M-XvZQK8w9czayXczA_3-8LPB-+pbqXSpzd224y5jRQ@mail.gmail.com>
 <ZjOPwKHrUfzjbvWL@heinlein.vulture-banana.ts.net>
In-Reply-To: <ZjOPwKHrUfzjbvWL@heinlein.vulture-banana.ts.net>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 2 May 2024 15:34:43 +0200
Message-ID: <CANNYZj8JxAWmFXu5ckS4_RA8LrFBWzV=kZh=RV8UkGCCb3whCg@mail.gmail.com>
Subject: Re: [OE-core] btrfs-tools-native build python error
To: Patrick Williams <patrick@stwcx.xyz>, Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Lean Sheng Tan <sheng.tan@9elements.com>, Ross Burton <Ross.Burton@arm.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"Hansen, Alexander" <alexander.hansen@9elements.com>, John Chung <John.Chung@arm.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 May 2024 13:35:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198921

On Thu, 2 May 2024 at 15:06, Patrick Williams <patrick@stwcx.xyz> wrote:

> This is almost never correct and there is not a single example of it in
> poky.  There _are_ examples of exactly what I wrote.
>
> If you do `PACKAGECONFIG:class-target:remove` and there is not already
> an explicit `PACKAGECONFIG:class-target` defined, this in effect creates
> a _new_ _empty_ variable `PACKAGECONFIG:class-target`.  This is nearly
> never what you want.  You typically want to take the base contents of
> `PACAKGECONFIG` and remove something from it explicitly for the
> `class-target` class.  What I wrote is exactly how to do that and what
> there are multiple examples of in poky (see tclibc-barmetal.inc,
> no-gplv3.inc, meta-openembedded uim_1.8.8.bb).

Right, I just reproduced this. To me this looks like conditions in
inherit_defer operate on PACKAGECONFIG value that is assembled without
considering class overrides, and that might be a bug.

How to see the issue:
PACKAGECONFIG:remove:class-target:pn-btrfs-tools = "python"

bitbake btrfs-tools-native

You might be able to work around this by avoiding :remove and setting
PACKAGECONFIG directly.

Alex

