Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 346B4C36002
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 01:42:07 +0000 (UTC)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
 by mx.groups.io with SMTP id smtpd.web10.56655.1742866920713067799
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Mar 2025 18:42:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SIu6qLtq;
 spf=pass (domain: gmail.com, ip: 209.85.161.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-60208b7a6d6so1475824eaf.1
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 18:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742866920; x=1743471720; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KGU5/Sc7v9ajevUjE29jXnoJvqrdFWt0+Oa4ntRmlH8=;
        b=SIu6qLtqbLZY+avrvWQc02t8ZG8/ofUcvESW6QNjZ6i2Y4JSoG5ARtck5jtF8oPFkh
         a3QYZOdX7CQD3S+9hy9oLmABu9F9PJ3DcvRfdApd6JLsbFiaHBzDNv6yslxxrLXfLD0I
         342e9iupT4efrLIuLxksAwVrON5W7xhFoawoG9Y5w7lr7EIBCafdRfqq5Jhv2mVDtdka
         KaBjQhAwTAx0znKrkrBVb9MN89yGw50UY7brNj3KEpwmFYKh+wppG5T89YIaJXM0IEG3
         RuvFp+PcdvV+E53E/8OjPgiXn6nQQOAgV8tLPCrfLNbxKOS9FJz9QGdAiJYiuMPMkjbQ
         /VHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742866920; x=1743471720;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KGU5/Sc7v9ajevUjE29jXnoJvqrdFWt0+Oa4ntRmlH8=;
        b=iZtjyToXucAhECrjSRCPheZC6AaTk9aUxQnhstbHOqUSkHmNxbJ19bEp//qT3owL8g
         LUU5ATbmXkq6dmDdqzX7QIImTpEb8d28wKc85ni6l+ic3AqgoNBJDbfHD6B/wUSDzT51
         A+SERZN5/pgCRxSyG4MWxBZm6+VBKhyoqEKAJCuaECA4ak9nhRbgAxrSiglmK66UUALa
         07cDoeIRJQtIvOsrl35T23AYIG2O8Jv0blPEnD0btJe8KVrMDMeqhaMhhzUaEFDuNiY0
         SGjqMwtsqIxyWM9qsTpocPwral27QoDO2fYPmCAKtXN8M/GfaAbd29OS4Vw1nUojVxPW
         sNiQ==
X-Gm-Message-State: AOJu0YwU+KxBP1sq2dT5tszCZJyY7kLxvqR0KMvkLw14Ob918qgbm/H1
	Nm+/66V5mDDf21TEUvJGrxGD2D70Gd3FcHu1bCqALffp3hY4onjhJV5QGgtgMhbrWuRiD8pctbW
	K4FLRPnB7trcZTIgZ+hTDiZUyOFs=
X-Gm-Gg: ASbGncvl3W9m/v6u3ucxUDc9D0DhjzzD1+GGf9fnlsHB6RD+RgwkvLj336j29OzH5Nc
	VhwLJDiSw1alCWzW5YNajNjx5zNyep9imywrrWm1mFqz6XL88InNGPu1JUBIDYEkS5PP9Dvp/5D
	u3uYAqr9YPCOu00/mY+Lhg4hhf7w==
X-Google-Smtp-Source: AGHT+IHbXRJuG5tSxTBhDxni8pOYAQc8YrHNhEfm3d4mGM5ntCHkHakIEt/b4QlTKRiUGj/4yr21GE7FT7B4jUE1iVc=
X-Received: by 2002:a05:6820:2303:b0:601:a9e0:6336 with SMTP id
 006d021491bc7-60234603c13mr7070458eaf.5.1742866919705; Mon, 24 Mar 2025
 18:41:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250324-b4-musl-gcc15-v1-0-ca68c03c5b01@gmail.com>
 <20250324-b4-musl-gcc15-v1-21-ca68c03c5b01@gmail.com> <dc2ad3405aaa9383b657dff6dbb731074575da91.camel@linuxfoundation.org>
In-Reply-To: <dc2ad3405aaa9383b657dff6dbb731074575da91.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 24 Mar 2025 18:41:33 -0700
X-Gm-Features: AQ5f1JrTuA5Y-FWY3nFQtKLoCmC-Agyp-ujCnLE8BFoz5glApf0bWlmsBnM1B9A
Message-ID: <CAMKF1spx0w-mHDsS6r0J13Eo-=gs4DY3q8q6Rxc6BGhk9owh_Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 21/21] vulkan-samples: Fix build with GCC-15
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Mar 2025 01:42:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213586

On Mon, Mar 24, 2025 at 3:24=E2=80=AFPM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2025-03-24 at 09:33 -0700, Khem Raj via lists.openembedded.org wr=
ote:
> > Include cstdint for uint32_t definition
> > Update to tip if trunk as it helps with GCC-15 fixes
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  ...-SpvBuilder.h-add-missing-cstdint-include.patch | 28 ++++++++++++++=
++++++++
> >  .../0001-framework-Include-stdint.h.patch          | 26 ++++++++++++++=
++++++
> >  meta/recipes-graphics/vulkan/vulkan-samples_git.bb |  6 ++++-
> >  3 files changed, 59 insertions(+), 1 deletion(-)
>
> This seems to break one of the oe-selftests:
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/1166/s=
teps/14/logs/stdio
>
> oe-selftest -r devtool.DevtoolUpdateTests.test_devtool_git_submodules

Looking at the test, it adds a patch to a submodule and expect
patchdir=3D based patches if any other
submodule is patched otherwise reports the files and test fails. I
think test is testing a subset of cases
but I have sent a v2 which should hopefully make things better for self tes=
ts.

>
> Cheers,
>
> Richard

