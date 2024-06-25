Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99856C30653
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 09:20:07 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.167238.1719307205300247556
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jun 2024 02:20:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U92nlmTI;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2eaa89464a3so61322821fa.3
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Jun 2024 02:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719307203; x=1719912003; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DbJeJenFso/kh5pHHl7/cKH88Q+Xo5rNwNye0xDbSc4=;
        b=U92nlmTIXvcuIAUVhGfLcBJp7rpKChg46fka2zb9DXRwYRId3GNmHdeNNSh+70F1VJ
         z6y41Gas5IbJpwMxAbfHKQxgU68nm95GRjcP2+dn0tWpFDsEbpAJfFAb/LMj6OFLsG/r
         Xvk3FpyRShAwbhm3sEKUKF1xyPRI0VIq7eEM2kZwefz9tTAxT9oMBo4XtCSwwg/Bjknq
         asRcuvHCUc0aqvryNfuaaWVpTb02ZGuobmtmRC6not0ubwUYbGWXGlTyzyElG7EWr4ce
         xUAJCxdndDJtn/5dwOQHIBA2TrjlrTsFIh0KLoz/jOMne+qMHpGBUKL6tYJRb2oyxdWe
         s+PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719307203; x=1719912003;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DbJeJenFso/kh5pHHl7/cKH88Q+Xo5rNwNye0xDbSc4=;
        b=ABX7NJ9vraZkaWSaElF28SvQqTDYGqMeXfkVehkLtDWYOYf9sUHoark0ZQloTzDCeG
         3CFlWBHLjqscH7h0gsGNYbOMuKNwMdDrkcEkzLY+706WOP3vgwxAjd/wtIV6kmd5ywan
         l6O7ms7bMy5X8P2fJvmgA4dWIVlSF+MDm4+UOHFJ9JKMReW+DRSn9sWewbXjL7+Kc/Zt
         fADa8MfPJwxCElmOtr+wH+qB0/hkV0buuvhzpitVVqERGO+WWsxpdJ2HSE2OVYaqYDZZ
         1SvhTOMxpN60IJlMnXyJ2mi52ycffQRBDZSS+QrqPv2uOD3nVj19U/OrAbS7Yon+bGLj
         pb1g==
X-Gm-Message-State: AOJu0YzZobjiNzFiUMSrf0/zfLfscGLIf0SbxBlGN0yMRhiWx+BcRFtc
	psMa3RQccW7Voi4DoUo44YrWrMtZcFmE7gDpOINe6cqCjCSzW98qEzI8Jsg3OUARxQcAoh0b/qU
	TdCFQb2ld61cAq5JQDutmg8e3818=
X-Google-Smtp-Source: AGHT+IG98g/B5kPvelcC2/YY6mKo4OaxdsRJXJXtF3V5cVbxglL8rRyNctH8TwLU6pHv2d09SvuDhO4gLP93N4y2wUw=
X-Received: by 2002:a2e:9cc8:0:b0:2ec:3fb8:6a91 with SMTP id
 38308e7fff4ca-2ec5797a562mr51489391fa.19.1719307203300; Tue, 25 Jun 2024
 02:20:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240621103414.2842509-1-alex.kanavin@gmail.com>
 <20240621103414.2842509-2-alex.kanavin@gmail.com> <de66e3216fb54cf24171e800ea032770517fab69.camel@linuxfoundation.org>
In-Reply-To: <de66e3216fb54cf24171e800ea032770517fab69.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 25 Jun 2024 11:19:51 +0200
Message-ID: <CANNYZj9hXzes_pH_tH1P4wVUsLOKiQpRnucds-YpVtJDQRTMuA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 02/11] devtool/upgrade: add RECIPE_UPGRADE_FINISH_EXTRA_TASKS
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jun 2024 09:20:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201125

On Mon, 24 Jun 2024 at 22:33, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Whilst I understand the desire, I'm not sure this lives up to way
> devtool works.
>
> By that I mean that devtool upgrade usually does testing of the result
> but with what you implement here, the second recipe is never actually
> tested so things could easily break after devtool finish and you
> wouldn't know without further testing.

Yes. Supplementary .bb renaming only works if those additional recipes
do not add licensing statements, or custom patches (and AUH also won't
test-build them separately). It was something of a low hanging fruit I
wanted to try, as for things like mesa, qemu, cmake and others in the
patchset I sent this does turn reliably failing AUH updates into
working ones (as long as only the renaming is needed).

> Thinking about this a bit more, we should be able to ask bitbake which
> other recipes "share" files since I think the list of included files is
> actually cached by bitbake. Yes, we may need API but in theory this
> means devtool can know which other recipes it needs to upgrade at the
> same time, and when doing so, run them through the same process as
> normal upgrades.
>
> So yes, it will be a bit more work but the end result should be more
> generic and scalable?

I would first try to simply list the additional recipes directly in
the main one:
RECIPE_UPGRADE_ADDITIONAL = "qemu-native qemu-system-native"
and see if devtool can be easily made to iterate over them:

devtool upgrade qemu
 - internally performs upgrade qemu-native qemu-system-native

devtool finish qemu
 - does the same for finish operation.

And since these share includes and patches and other items in SRC_URI,
we need to ensure they don't step on each other. Although there will
be multiple overwriting in 'devtool finish' which is okay as long as
one updated thing is overwritten with the same updated thing.

Alex

