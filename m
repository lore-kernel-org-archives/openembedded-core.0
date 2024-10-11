Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12FB5CFD2E4
	for <webhook@archiver.kernel.org>; Fri, 11 Oct 2024 08:31:39 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.6788.1728635490175390920
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Oct 2024 01:31:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20230601.gappssmtp.com header.s=20230601 header.b=XKrGQnU8;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.167.46, mailfrom: brgl@bgdev.pl)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5398e58ceebso1652650e87.0
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Oct 2024 01:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728635488; x=1729240288; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vz6Mo8jVEGLN1eZ2tcWaFaAvcf0eTg5yx/RXlpSqSvc=;
        b=XKrGQnU8c9zZBt2h11bYYYiE5Vn+OmX9gdjwRnPfFENxZ5+nbAp0RIWO+7wLTLiG9B
         TZBzpz6pATA+Rfo9ABaDt3NUGxTthH5uWDkwuma/ClFzSaOppeXEDucuGGSyRMAhdqLp
         XltEO2bBOqD4zhIw7RPHJyTTlrSL8er5jBHxbtasPBBCVb9iXjrWcVn6UFpv7FXPdMGE
         nwW2QDkszH69UOwKOBFhFMuN/VpXjkaDbug+1++XqohZbRiWMEasip/Y4JR50/M2yv2H
         +vxJBG4eWcM7L+6XTtoA9hg5FXyDAqgnrwT30o6PurccS43OsPwwNtNDBp06YKNqr31h
         ZhfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728635488; x=1729240288;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vz6Mo8jVEGLN1eZ2tcWaFaAvcf0eTg5yx/RXlpSqSvc=;
        b=QsIGn+DGHZSYIsUtQ9g3oACD7/QbIsgoAujGQ/16qm53Th8keqbGx6ElvJVFssLuax
         3zFR8wviRmaV9JwJO0WWcTxVCkiJdMjxuw4jxjZhut1b7Yon8uYsUPa7UjTH8Z6pj/Tt
         nlCYBTiI5rq8iqa05MIZ/hIBT//LbatuBdslEocEY4Uh3/zOPrmLW1/YY3sldcy8MGkY
         oSGBDj0+LMm55aiuZ1pxoaTW6ruEKPY9YmF5AjaIWlEu2TsoePS8fnz8mfvBTXfZS4J9
         RWos34gGlt6/ncuParcjGmeYvclo19HdaO9TzcElHmt6THRxC3gvXgo1Ql0eWB4l5Y4a
         u2HQ==
X-Gm-Message-State: AOJu0YyEMJBHjjnSYdThaX8xZXtHVKxyQ+OrcmAfsPl1kbT1hVuL5r/D
	VoOCvTfzJYYWinEef295Ag+h9JbpwAhD4B16vTj8vjULLZHThdHsRsA01kTvhejKC7YpvV6wFYX
	IPuHUhH1euEVCj+HoccqEvnqyZv1XxhxH5JR8/A==
X-Google-Smtp-Source: AGHT+IEJS71aQQoDk1uJYxpZzTN3/pMJlh0lBnL4/7QNgBR5l4m0rniWz2kMw10CsXzYYUQgiFk/Qg8eLBtpHXlA8Gs=
X-Received: by 2002:a05:6512:2256:b0:539:a353:276b with SMTP id
 2adb3069b0e04-539c98ab848mr1892698e87.23.1728635487972; Fri, 11 Oct 2024
 01:31:27 -0700 (PDT)
MIME-Version: 1.0
References: <20241011070204.7276-1-brgl@bgdev.pl> <CANNYZj_72dfGm5kOCy43wnAiH1i30GmU8MVrS-txvHbJ8hWh6w@mail.gmail.com>
In-Reply-To: <CANNYZj_72dfGm5kOCy43wnAiH1i30GmU8MVrS-txvHbJ8hWh6w@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 11 Oct 2024 10:31:17 +0200
Message-ID: <CAMRc=Mc-Pj1r8EcTabg+ew-kGMax4i4fb=SH87BUPXsbfCQo6A@mail.gmail.com>
Subject: Re: [OE-core][RESEND PATCH] python3-pip: add missing RDEPENDS
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>, 
	Bruce Ashfield <bruce.ashfield@gmail.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Oct 2024 08:31:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205664

On Fri, Oct 11, 2024 at 10:20=E2=80=AFAM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Fri, 11 Oct 2024 at 09:02, Bartosz Golaszewski via
> lists.openembedded.org <brgl=3Dbgdev.pl@lists.openembedded.org> wrote:
> >
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > pip3 package is missing the runtime dependency on tomllib. Add
> > python3-modules to the recipe's RDEPENDS.
>
> If only tomllib is needed, why do we need to pull in the full set of
> modules? Please add only the specific missing dependencies.
>

Eek, I looked at the manifest a bit too fast, I missed the separate
tomllib package. I will resend it.

Bart

