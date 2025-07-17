Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B04FEC83F34
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 16:41:25 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web10.76.1752770478133734598
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Jul 2025 09:41:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e1arhm3k;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-70e5d953c0bso12630207b3.1
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 09:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752770477; x=1753375277; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bmYnBYJvTp8X3lvEW5j6pRhOPVzG+WIFuRi5D1gezB8=;
        b=e1arhm3kgeupxVCWaa7NdUClVHYCH8CTBgKSOtA8BNL7hrlNURfOc7/XIoBiYDcac5
         0F4hhHpA0U+dS5EUzHt1/Nlx9xizqSaITi4VsorZ7yPSL9qVHnjwOA4xeXh54obKNQ13
         zgD8cAOujsVsYisXxMH00CTByjd3Z4TM0xeaCjcMQKihBlbOPs5U34/RrfoQUHHf0vwX
         cXGQSkYVFjsQCgINg8Uirihd2jQ1UYcm/cB21GTtVOsmmZCq2xI/B2juISrSqZLm7Byf
         jer59tQK/2UjxdDMJ/mToLpat54iH1CDyxWsjjkpLT9FZcKSKDGRjAaZLRD58fk9rpTj
         aq3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752770477; x=1753375277;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bmYnBYJvTp8X3lvEW5j6pRhOPVzG+WIFuRi5D1gezB8=;
        b=Ach5XSeYD9iRi1lIi/cSBG0A5Nle1Ds7Hkqjawo8PxVkDNWESUxI7w8A3EMA0Acj67
         vQHtCCG/9xIejh0kTVREclIRvAKzpAMhLwl3lpAG3bexSNNOYszAlAwvLycppSYucD1v
         rNc/InwO49w+jy0Ge9H23wfSUqQ9Jb96mUrE/gk3und652LJ2jBFMWDK8YLngAuvwe2M
         e2J5KmpC6GDBqnRHISE1HgfWutHO7mU0covh6bJuVeqiLd25cdatLVT1R2oQMwqgzwGX
         Yr59z79ADPknNfLall+uMr6F/tlZ7AMPCHjDD5WwS6LpkLq+bkAgaA+IqBUJ1ImOr4Op
         g6wA==
X-Gm-Message-State: AOJu0Yx3soZny8vJ/kNj2puEYjA2OkzhdOjMzjfyeyJdw1go3BfL6QtU
	a8JMvQoYolWdA8wwzBC0fXC0N7TmMrQQZAdE3dfqZijW/FLN8Qhq76USK3LFKZflAtUMifiSDUU
	ksm25H7ryqn/WKBG//19O79zsN5fW8w0=
X-Gm-Gg: ASbGncsw+dbzRvnX41XDe87x+TVVJ8WlNcoOMGkVaZNHsi2oKJTW4MWrpx4t40f69rD
	oCo6PCPn2tJvQBCYGjzbtpNNz5PTu1fP3yj0gwNNhLdRCu11Lhz0tx1kCTeqyi1YoM07Mb+rgmH
	X4+aqBXJEYbgy/7SetFaFdt/aqyVM4pCRIvBA4jq4PU8UW2J4pAyuvdPkzs1LxGBfy+QBCo6RsM
	IBzXg==
X-Google-Smtp-Source: AGHT+IH5TrGF1l50ABMwPc7ihAK4L1l38+xcW8oo74mgtCNbORffylpSKQGmC5iww5nUPiylUE3+b2wHPpDgDxKUdFY=
X-Received: by 2002:a05:690c:31e:b0:714:5eb:b589 with SMTP id
 00721157ae682-71835196b23mr120918527b3.35.1752770476917; Thu, 17 Jul 2025
 09:41:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250717085837.227414-1-Deepesh.Varatharajan@windriver.com>
In-Reply-To: <20250717085837.227414-1-Deepesh.Varatharajan@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 17 Jul 2025 09:40:50 -0700
X-Gm-Features: Ac12FXwAvcT6Nmv_4_OdGc3yQeWGaWqMb0EbNSKEWKtjiAB9jDId7oLK9M3BPAg
Message-ID: <CAMKF1spmKJ_OwsJLYkJJqA3a6MrkHsKCZeVNQUZg1Bx2hueBSw@mail.gmail.com>
Subject: Re: [OE-core] [walnascar][PATCH] glibc: stable 2.41 branch updates
To: deepesh.varatharajan@windriver.com
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 16:41:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220549

LGTM

On Thu, Jul 17, 2025 at 1:59=E2=80=AFAM Varatharajan, Deepesh via
lists.openembedded.org
<deepesh.varatharajan=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>
>     $ git log --oneline 0c76c951620f9e12df2a89b2c684878b55bb6795..6e489c1=
7f827317bcf8544efefa65f13b5a079dc
>     6e489c17f8 Fix error reporting (false negatives) in SGID tests
>     11e634ccf3 support: Pick group in support_capture_subprogram_self_sgi=
d if UID =3D=3D 0
>     61e461ed0c sparc: Fix sparc32 Fix argument passing to __libc_start_ma=
in (BZ 32981)
>
>     Testing Results:
>                Before     After   Diff
>     pass         5807      5813    +6
>     xpass        4         4        0
>     UNSUPPORTED  164       161     -3
>     FAIL         280       257    -23
>     XFAIL        16        16       0
>
> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> ---
>  meta/recipes-core/glibc/glibc-version.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-cor=
e/glibc/glibc-version.inc
> index 2d31131e03..a2cfd0f308 100644
> --- a/meta/recipes-core/glibc/glibc-version.inc
> +++ b/meta/recipes-core/glibc/glibc-version.inc
> @@ -1,6 +1,6 @@
>  SRCBRANCH ?=3D "release/2.41/master"
>  PV =3D "2.41+git"
> -SRCREV_glibc ?=3D "0c76c951620f9e12df2a89b2c684878b55bb6795"
> +SRCREV_glibc ?=3D "6e489c17f827317bcf8544efefa65f13b5a079dc"
>  SRCREV_localedef ?=3D "fab74f31b3811df543e24b6de47efdf45b538abc"
>
>  GLIBC_GIT_URI ?=3D "git://sourceware.org/git/glibc.git;protocol=3Dhttps"
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#220522): https://lists.openembedded.org/g/openembedde=
d-core/message/220522
> Mute This Topic: https://lists.openembedded.org/mt/114200019/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

