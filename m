Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF341C369D5
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 23:34:02 +0000 (UTC)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
 by mx.groups.io with SMTP id smtpd.web10.64817.1745883238118806993
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Apr 2025 16:33:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ngAmD05W;
 spf=pass (domain: gmail.com, ip: 209.85.161.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-606440d92eeso2843237eaf.2
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 16:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745883237; x=1746488037; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9eaPnyzCJCzpM+WbXs0x/zr8bC+BGZ/AMa1i1xYahcg=;
        b=ngAmD05WuAxNz1sOv9VfPzpXbbbS0wA6KjkHbNrUzVrfz9M5rtskwg05hb8U0wMBPs
         VP2sTdHhnLAarFcbWwu22BKYFRiTNGfY4ELZleSF0ZEjqVXP6SXQEB4mhDS502bsyDbq
         qAfxhx/y2MH9WfDx6QYHiXSabRmsNP0DorFkvVksRerkacwv5C4YxpVc6YlnfFleHtVf
         zbsbafzVJWvvJo0z124NS4hG+K4ioUwOPPJH18yUIpPQSbxRPIpkEtmlgLzYgFVLSFRK
         riBmd4+4N8qacHm5wDtEaExFqlopcc2tJ7ZNpbCyycp0INlOKgOWA9mMuo+QvuV/Bibt
         ssmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745883237; x=1746488037;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9eaPnyzCJCzpM+WbXs0x/zr8bC+BGZ/AMa1i1xYahcg=;
        b=IVKpMeOtTUec5dJ9KalLTvd+D5M159gCyG54BFDXotUgrULJQqTcuzoSuUL7WFFmr4
         in4e+G7IIAVGgrpezJpdGjxM0gIj0IGeyU1FL73V/VnPJzcHuxkGC8+AvQTNCFTCh53R
         s7GzF5Z/+zK2RW57gqBjALetA4HiTkuUeVAZAjvaIDqB+8nXyIOymj/V3FMnCjn8/xUP
         h9UxCKwv2d5lQxPlBQakffehFIWP8aNOQPV6fl0qyTWj/Twlfep+Nk5jysGdq2GCuYsG
         PsPvDKWm8wbGmODtj/Gl+ZZP70W4HyzCjuT4x/JRP5F+UvHv294SCucIlScWcta5FvdX
         IreA==
X-Gm-Message-State: AOJu0YwdW7O2Itsxpn3rPBRy4LuRWpFIuFDul0gMv5Jf9lkL85/PtB9w
	HCMHu0KwbmCu6PnQpnvHLp16OWePbehbombGCQ5i/CvhxGbrKbuC1HCKY6G3ME8uSIUYKT09LN9
	MGdY/0DOTikbbKJFZUuG2jglYKiHBST7wkwc=
X-Gm-Gg: ASbGnctiZcbdXQ1QEfhO8UXb3Vufoqie+bT+JoUe5H5mmAE4cQxph+omUD0FF1VSxJZ
	IvoHc5x4N2tpg5xAmLDtDXj8H3s/9EIuDyIgQsk5BEjrmcTaEGIL3fzix0+QDyQXDtemiIrOzMc
	llUGVrO49tPwRThN3jcoUS
X-Google-Smtp-Source: AGHT+IH7WBgNeiU/PhtHITzCWTCM/KggUD55cIDEKi0eBy4owossyFAOXVsnnL5obn9DnrqPLc17R/JZq9K4j1cOdco=
X-Received: by 2002:a4a:ee0c:0:b0:600:1dca:de9b with SMTP id
 006d021491bc7-60683e6d4d5mr964376eaf.4.1745883237181; Mon, 28 Apr 2025
 16:33:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250426-clang-merge-v4-0-42d205904261@gmail.com>
 <20250426-clang-merge-v4-8-42d205904261@gmail.com> <tims4g3kpjke7bfqfbvx2sfc5y2avhiyixn2sm7cgvwmwt7lid@3il6kjlvkpcd>
 <CAMKF1sq=x6caiTm_ixio56zVsg_rjLR9189vKHkQKzF7hD6HDQ@mail.gmail.com>
 <CAO9ioeWvPcSRt0kRNiPpnZQU+QDfMc9kbDZ_+PgzpLuzQJSbqQ@mail.gmail.com>
 <CAMKF1spY4-3SHT85oRU30SeLzYQA7kSvKczP6-OsHjwn7LNfZw@mail.gmail.com> <CAO9ioeXR2JRBLMw_r-yqB4gU4=DHe-6SYLxfEP-M+Y=14-QyOg@mail.gmail.com>
In-Reply-To: <CAO9ioeXR2JRBLMw_r-yqB4gU4=DHe-6SYLxfEP-M+Y=14-QyOg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Apr 2025 16:33:30 -0700
X-Gm-Features: ATxdqUFPmaPYptxByEzJSpDg8Y9PhvxtvA4Fdh0Kuzw4bgGlYSss4ZN0mxMfcwQ
Message-ID: <CAMKF1sqPLaSX7wBXReQYniW9fJm1mQY26pQwH4uzgjsYWH874Q@mail.gmail.com>
Subject: Re: [PATCH v4 08/10] mesa: Pass needed clang flags via BINDGEN_EXTRA_CLANG_ARGS
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 23:34:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215646

On Mon, Apr 28, 2025 at 4:03=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Mon, 28 Apr 2025 at 20:10, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Mon, Apr 28, 2025 at 7:56=E2=80=AFAM Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > >
> > > On Mon, 28 Apr 2025 at 17:51, Khem Raj <raj.khem@gmail.com> wrote:
> > > >
> > > > On Mon, Apr 28, 2025 at 4:03=E2=80=AFAM Dmitry Baryshkov
> > > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > > >
> > > > > On Sat, Apr 26, 2025 at 08:16:47PM -0700, Khem Raj wrote:
> > > > > > This is needed for clang to find the c++ headers when invoked v=
ia
> > > > > > bindgen
> > > > > >
> > > > > > Fixes
> > > > > > | /mnt/b/yoe/master/sources/poky/build/tmp/work/cortexa57-poky-=
linux/mesa/25.0.2/recipe-sysroot/usr/include/llvm/ADT/DenseMapInfo.h:17:10:=
 fatal error: 'cassert' file not found
> > > > > > | Unable to generate bindings: clang diagnosed error: /mnt/b/yo=
e/master/sources/poky/build/tmp/work/cortexa57-poky-linux/mesa/25.0.2/recip=
e-sysroot/usr/include/llvm/ADT/DenseMapInfo.h:17:10: fatal error: 'cassert'=
 file not found
> > > > > > |
> > > > > >
> > > > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > > > Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > > > > ---
> > > > > >  meta/recipes-graphics/mesa/mesa.inc | 4 ++++
> > > > > >  1 file changed, 4 insertions(+)
> > > > >
> > > > > This way we have two sets of bindgen/clang args: one added by
> > > > > meson.bbclass, one specific for mesa which you patch up here. Ple=
ase
> > > > > pick up the attached patch instead, it makes sure that there is o=
nly one
> > > > > place to specify bindgen args for Clang and documents the reason =
for SDK
> > > > > packages requiring special handling.
> > > >
> > > > This is breaking mesa-native recipe. Why is bindgen invocation spec=
ial
> > > > for meson? we have other recipes in
> > > > e.g. meta-openembedded which pass this variable from recipes and ha=
ve
> > > > finer control over
> > > > recipe types that way
> > >
> > > mesa-native worked for me, what is your build configuration?
> >
> > I have this
> > PACKAGECONFIG:append:pn-mesa =3D " opencl libclc gallium-llvm "
> > PACKAGECONFIG:append:pn-mesa-native =3D " opencl libclc gallium-llvm "
> > PACKAGECONFIG:append:pn-nativesdk-mesa =3D " opencl libclc gallium-llvm=
 "
> >
> > and I am building for qemuarm64 on x86_64 host and sdkhost.
>
> Yes, this is my config too. I was building poky + these entries.
> Anything distro-specific? Maybe a clang toolchain?

No, I am using vanilla poky too. here is my local.conf
http://0x0.st/8W4V.conf



>
> >
> > >
> > > Putting necessary arguments to meson cross file was a recommendation
> > > from Mesa developers. I think we should follow it instead of patching
> > > environment variable in recipes.
> >
> > Is this recommendation from meson too ? I think no, so we will be
> > carry this locally moreover, meson
> > is uses to build more packages than mesa and adding mesa
> > recommendation for generic meson
> > might not be ideal.
>
> I'd say, it is a meson recommendation - they added an entry to the
> cross file instead of making everybody use environment variable.
>
>
> --
> With best wishes
> Dmitry

