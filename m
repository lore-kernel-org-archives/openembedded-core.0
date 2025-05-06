Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2446FC3ABAC
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 13:19:05 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web11.75976.1746537539686719517
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 May 2025 06:18:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VQuQS9Z0;
 spf=pass (domain: gmail.com, ip: 209.85.167.182, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3f8df49e75fso1285621b6e.1
        for <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 06:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746537539; x=1747142339; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Yh0CBEfRX9Hf5IAbwtP4s7QUdum6m07kAq2TdOfFtk=;
        b=VQuQS9Z0XRCReqJsoSSwXMD4rVybCizBr5EjOD4bXgL5WkaxuMfFY9r9mMYNaiGyIE
         E3+Py2VBoFG0m2JySXymZLo3/Bv7/olXb7iwKkLpReg/2MblDaHDpOM5tJq1waXAE4qH
         eqRkmwu4nDVkdphIU9JMW720ONVg43DBqUlktIilTbx+/rmesLdERimQvjYPZp4v8r63
         yGjv/BF0HujowLtKZGK/kZGB9QFF8Egg5cn0GhUnMXPizhfhi0fJjXd06hTMXnFzGPiz
         8AUbvsHtWrrnyrmM0cIN53TANFp6Q6Sh2BXDCtcCdevLdK15dRDGLKqspT2tk/tmLavm
         fwvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746537539; x=1747142339;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Yh0CBEfRX9Hf5IAbwtP4s7QUdum6m07kAq2TdOfFtk=;
        b=LJjR3L2GxDam+nUynot1SwNMi8PWJhOBVWOLxn5xRBBAW9emYb9puJZCkCs/Lrve7Q
         TuTPp9j5zI9IuZdJGkzR7V6V0DW2A/4iVzdkIHD+e/X4m2bHRLER9joNSmwnYXIYCdUI
         z+zhhah+eUIR8e1O7LgMSLAKdi9oCMctV4kfEvVMXl2aIz01FMTh+U54b1s/wX3B7jR6
         xpyY9Z8tmiGCJ0T4Vl3YTDVIwGT9DD9zxJKPgpmKkN7lZoiUbPQTwaxrP8fCAROSq6yl
         azCDr/Rjm6ev8oysky1fdryYS0Gn+KFmulICyq1u5hi2RngSrTlqZXRM2Hqv+5lxbd5T
         2wGA==
X-Gm-Message-State: AOJu0YzVB1dXekyYAySBBRa6zJCMV8QQu9lDzp60H+bgkcF4LiCIZEmk
	q9k3PWgV8Z4YLP6MpeOSzzWX5I0kI2B2p3h0BPhPmUGE2O3osmdmx4H0N4NShtiUyNcEG/dUA2o
	HpJ1W83YdMATXT7aI/Mqw6WU5T5npVwPm
X-Gm-Gg: ASbGncusA2hBoedGWV5ZtS4JTukGX0KlZQDbpPLMqggZxaNgZd81arXsa3lilk27Xcg
	oLqnW6VZm+YNGp/PlIt8GerhFUhFwJ2K8Du+QcTKZ5E78nZM/Xa2QXE+m10hrTIK4YK/+B9Eh08
	aL0wHZdXgsThqE9ByeM/FO
X-Google-Smtp-Source: AGHT+IF9+0Z1/jA3ySbjmRGrNZu/Bh3So0/InwcrXGDXPVojtLskab9eJx6lruKm5mkOjbVLvp0yd+396cuk4ap7KQs=
X-Received: by 2002:a05:6808:2194:b0:403:529d:fd81 with SMTP id
 5614622812f47-40368cd9d0emr1962896b6e.17.1746537538938; Tue, 06 May 2025
 06:18:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250506022231.1665007-1-raj.khem@gmail.com> <20250506022231.1665007-2-raj.khem@gmail.com>
 <g7nwk6adwdivua2z3wajtg26xthhegja7r4mnrofpf24b7eerm@c24yk56ud4uo>
In-Reply-To: <g7nwk6adwdivua2z3wajtg26xthhegja7r4mnrofpf24b7eerm@c24yk56ud4uo>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 6 May 2025 06:18:33 -0700
X-Gm-Features: ATxdqUGhrG48OkHH5pkRV6rpFuGD3wfCIepm72cejyGoZaM3WfhU4Au73dlczdI
Message-ID: <CAMKF1sp54rbzD+g2fr35037Sf_BUe=6MhT-Kig7Fjp0ZJJcDdA@mail.gmail.com>
Subject: Re: [PATCH 2/2] mesa: Do not use envvar BINDGEN_EXTRA_CLANG_ARGS
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 13:19:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216046

On Tue, May 6, 2025 at 2:55=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Mon, May 05, 2025 at 07:22:31PM -0700, Khem Raj wrote:
> > Its now set in meson bbclass for native, nativesdk and target recipes
> > correctly.
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-graphics/mesa/mesa.inc | 4 ----
> >  1 file changed, 4 deletions(-)
> >
>
> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>
> But I wonder, what made you change your mind?

I read through meson documentation and they do have bindgen support
variables added so
informed myself :)

>
> --
> With best wishes
> Dmitry

