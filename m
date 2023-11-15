Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F577C48BF9
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 13:45:20 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.13413.1700055916074088872
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 05:45:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ps2Cmvg7;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5079f6efd64so9036439e87.2
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 05:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700055914; x=1700660714; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cKejKXfFFUeqFz91mt2Fd0w0ODCt0QqM9A2DWj1fWrM=;
        b=Ps2Cmvg7Ts2G2StfoZv9dA3+B1RxL6ZNbIMe+qH/umEsLRx6UGXQFdRSglkFvhO6u3
         5xnsaC9kQAjTMhi3gcw+1BLthXVre+ZgaLMp0CJLpvohh9UXMb6yw55wmu8sGG5G7w9E
         MlQw6waicXGXMTabb6fr4NvVAAiWj2ODiGHX9HP2sPilWSHBc00wjmb5W7RX+cp21dp0
         pLxH0riVgqqnX/mHyHuCWo3GNQSq0l391jHLdS0tRpybqf4dRQMsHLHlg28eCLG+NemD
         8Vi7Z6vKKchWRPNH5M8F4GsksL+iGRLQnTEY9z15kH4Y3zW0j4J/oDKDwCK4RZcszThK
         0loQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700055914; x=1700660714;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cKejKXfFFUeqFz91mt2Fd0w0ODCt0QqM9A2DWj1fWrM=;
        b=fkJscmrwSgoaAbOBnzUsnMAdFTavHDqTo6on0z4av9XvQfe7sO0ug3MDB+41o3gfwv
         Vffsn8FxJVcFPxt5fet0dudTycjsdp7h5uPpb/lgoV9QipyUGiBoQy8EfuxDBTZynuqJ
         VZUpU+2nf3xGTsNv6b0voA1w1cQzVWWDFudvQbJEnzROHjNRAE4rDGGwH2n0ko/FARsH
         1hDXfWuRhI9Hsnd71qgS2BWqLeRv/uZ9o6zM2W/77Bb+zrlKZb6S7MCNi9ZI1UWCAixc
         LXpQ/bO4361njM1dwPpSULI4zXYS0wgROUEjEWINPXuwuT0pAH15OCUKwbIOwGzL2ar/
         cfRQ==
X-Gm-Message-State: AOJu0Yzn74i5gwIxsk5XoxK9sFm6SuG5ONJgaoxclJXXKrKoLBmx4atv
	fFTygE8VijMN/62ZM9oF892+VxRhd9wf1BzdtqA=
X-Google-Smtp-Source: AGHT+IGQQnmSR7J4TQasXL+kSzkhRx2dN168u/IE2zJHNTrI4+vwzB3qgEcmTwKv6NZO+Z1tCIXS1KdpfV/9F1NKgEc=
X-Received: by 2002:ac2:4108:0:b0:509:55df:61e0 with SMTP id
 b8-20020ac24108000000b0050955df61e0mr8438588lfi.18.1700055914174; Wed, 15 Nov
 2023 05:45:14 -0800 (PST)
MIME-Version: 1.0
References: <20231114203608.1490318-1-joakim.tjernlund@infinera.com>
 <20231114203608.1490318-3-joakim.tjernlund@infinera.com> <CANNYZj_c1dCdhhuPhnNdQ+9PKQ_FPdbB-b2miypMM9jQuofBcg@mail.gmail.com>
 <4f3483d322d0d4afb65b31ba06b3e0d383b62b6b.camel@infinera.com>
In-Reply-To: <4f3483d322d0d4afb65b31ba06b3e0d383b62b6b.camel@infinera.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 15 Nov 2023 14:45:02 +0100
Message-ID: <CANNYZj9DWffE1qOKO1SpqeMJcfXeaFxOMFFUieivDK-9ooH0yg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/3] shadow: Add PW_SUBDIR
To: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 13:45:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190598

On Wed, 15 Nov 2023 at 14:42, Joakim Tjernlund
<Joakim.Tjernlund@infinera.com> wrote:
> > Pending... what exactly?
>
> Pending merge

If a patch is pending merge, the correct status is 'Submitted' (with a
link). If it's already been merged, the correct status is 'Backport'
(also with a link). 'Pending' is a frowned-upon status used only when
there's a genuine obstacle to upstream submission.

> > In other words, upstream first, please. This is clearly not something
> > that oe-core should not be carrying and maintaining and rebasing.
>
> Upstream merged it, see  https://github.com/shadow-maint/shadow/commit/ee3a79c6952f8ca649c286c7f76639d9d1dedaad

You need to resubmit here with the correct upstream-status then.

Alex

