Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C9FCC369AB
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 18:21:05 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.web11.1201.1745518860221772627
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 11:21:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=awqzgg78;
 spf=pass (domain: gmail.com, ip: 209.85.167.177, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3f7f7b70aebso849934b6e.2
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 11:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745518859; x=1746123659; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wc9khTDBlh8iZHMP+WphLM+lDtrLJh/WtpfRLezTtSw=;
        b=awqzgg78MJHEyTNj+2M57JnoIXVDXnuZZkDCZ7urV347SSSSjVpsjtzh+0KHRJ+cFO
         UyK1Aug76pQtV0ehrlyW8CgK5PMYrocrAdYNtRtWwpJl+/FnkTLyPhHXmMpk3+/wLPkQ
         mQmUI1LjlMM4hOV1dKLBMJsxxEXkcMAKA4FMkF5YCjFV69Jx+t98jLwlB5eW9+dc+0z3
         E/qmYWPJtivS4UHLga3yM4381uAVgC0e1vD0DY33Md8hAlpm1MtpolbljUoddl6zhGsA
         cuSrcUi2FCybQdWnX2w0E3oma6XnttIFS6QGYheXea3gWpJv9pnaUXGbevF/jhc5VLWg
         grcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745518859; x=1746123659;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wc9khTDBlh8iZHMP+WphLM+lDtrLJh/WtpfRLezTtSw=;
        b=L19jhnz9b6L44wlcBGkkeLWccw+BtDq2hoRyTKtaXBsX++IjkNEDa0qW+mJnyQ74Az
         Xs4t/KAF+Z96GX46BneVlEZDYDXDVvuuBiAKQAKcI6K7ZqeozTJf0xhw86MgM6Cr1Vna
         ddhp8w3HErpcsaC/ZDlCBYnBM3Emz7I9ob+xVgoj09yHtWtE1EEdu6L6tQF6YZ5XCA0I
         lVj79io+nrGW0cKxKtNG6trVhLAYSpEoXTx+jB4XkoLs/MbXB+Q+FbLwk6pvgR47OnHf
         MGvElJIP6383Yv++Ip7LZYZWdrtuY0sFW87XpGIxZJGcpmERFucPL9DjOBVOEwL6toBO
         wWsg==
X-Gm-Message-State: AOJu0YwYAXkA2OlopLWPvBTh6TzZtonzfJKJ5V1IFIHzK6+ysOlowxwK
	pO5noxQK37fc7/63MyTOOuyXlO3GeVMCZyGS7qSU67GVmBnGQm0pcXjqUPoAID243G6fQ4T/QBS
	D4PjISS1dm88mAmLZbgJj966oDBA9KvKr
X-Gm-Gg: ASbGncvH40id6xTTBEBj7cyerFuNSTk/MscuYF4GkpMGRPJcumpeUgvYpL1jBjFDESf
	G/FhRNm5YGvEnGD9oAhJ7xBKnO9lgjCiwiefMz1fI7JCJiq0uYZoiXqDHmj4Q9JorQ0o7ke8r70
	UIRHDSYVQai1BXM5VPhKwVKQ==
X-Google-Smtp-Source: AGHT+IGtSvfdpgSqihVVTcXbhYZXP/gA7Jz9MkMkiBGDl45WvSuXZQjkF8Fndb4KSFzWky3FDluqqVBFV82gwYi9FAQ=
X-Received: by 2002:a05:6808:22a5:b0:401:bcaa:c52f with SMTP id
 5614622812f47-401f1247072mr266723b6e.38.1745518859433; Thu, 24 Apr 2025
 11:20:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250424-clang-merge-v1-0-5a492a8461aa@gmail.com>
 <20250424-clang-merge-v1-6-5a492a8461aa@gmail.com> <djut26lxh77qtd3j6jxue554mwewwsutmcgqbaalsfg3jmymzr@kk6t675ae2ke>
In-Reply-To: <djut26lxh77qtd3j6jxue554mwewwsutmcgqbaalsfg3jmymzr@kk6t675ae2ke>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 24 Apr 2025 11:20:33 -0700
X-Gm-Features: ATxdqUFPkz3Xk6Das5DcQcpUTEZ_swXtm4z4fE6xx8IOrYeLRHtPMu4HyudNSkc
Message-ID: <CAMKF1srOa5ER-RfQr4DHvWdRii04adX9ceU9jfg7gbp7O0bcTA@mail.gmail.com>
Subject: Re: [PATCH 06/11] clang: remove LLVM_LDFLAGS from llvm-config
 --ldflags output
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 18:21:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215399

On Thu, Apr 24, 2025 at 2:10=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Thu, Apr 24, 2025 at 12:20:40AM -0700, Khem Raj wrote:
> > From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >
> > On OE builds the LLVM_LDFLAGS gets a lot of extra flags which may
> > depend on exact build dir and as such be inappropriate to binaries
> > shared through sstate-cache. It is not possible to override this
> > behaviour in llvm-config since crossscripts are not being used for
> > native builds. Ignore LLVM_LDFLAGS for native builds.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  ...g-remove-LLVM_LDFLAGS-from-ldflags-output.patch | 32 ++++++++++++++=
++++++++
> >  meta/recipes-devtools/clang/common.inc             |  1 +
> >  2 files changed, 33 insertions(+)
>
> This defintely doesn't need to come separately from patch 04
>

squashed

> --
> With best wishes
> Dmitry

