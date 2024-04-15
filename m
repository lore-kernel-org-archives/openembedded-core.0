Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7A44C4345F
	for <webhook@archiver.kernel.org>; Mon, 15 Apr 2024 12:52:17 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web10.20118.1713185530535130429
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 05:52:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Rkawd24F;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.175, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6181237230dso36146727b3.2
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Apr 2024 05:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1713185529; x=1713790329; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vGCjova0+41gW3HhtXdcsE8jaVHGPTWeXemaepzOE4U=;
        b=Rkawd24FISQJeRJ7/TL3Ia5CeLBBtsb0JowSOYEd2LGWRZS1qb6Cmcum9uo/DqQbvY
         FKoeziYYZH0HhH0BDwGETYJ6CwYLzRzfb8JcSbl257HoofgVh59GAvTatGlL1PGi2XSe
         ZiMg51Yveq62E0VrSLAxT6lsAOGkLTIRksvBRjmLu53xCp4iyklKgtxzhPnW1RYbr/Zu
         mYq2xtf8Ql810KhjIlWXNKHormyKk9MFikBN/4YeKUQlsnHhJJ3jFFBeAT4pbZLE5Qio
         Kvgn+gXlXv0ozR2lpnEXrLv85w69MpUfRJB+g9YCk8q28Mh3gsvFiT04YvgFrzSqzX6L
         UTig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713185529; x=1713790329;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vGCjova0+41gW3HhtXdcsE8jaVHGPTWeXemaepzOE4U=;
        b=b6tMyTFX1QOWAgzq+oVsy8hyUU76bdPl0uHIAuz+XU1oo+3ncLya39tWtFQ23NQft4
         BjOZ4PUnCExGtuLxEd8Ntzok0kjePjKw4yOVR99TC55M7xLRo/048AWCBXbsCP3OOHNc
         ciXKA+zekclB2LUf3aDqCnCbR2UK5oapo9OQ6UjPgaxxpnRpCjJNrsxN7SYb6J2lE9bl
         numcdynf4Ziq7i9n8m+QfNTxWJkIjEE+U1PGqvTA0k+oAxVuz1TeCW8ew8A6XouSrh1W
         dHKdwfWqKqVPVEtMRyZ8M70hpzrEsO2me28qBliHgLaVmNUgU+iW+iYbgg53QZZf8Ylw
         6zYQ==
X-Gm-Message-State: AOJu0YwW0aRA0z0jUN/wyK0j5YvKL9D2ZyGSMcQS+fIb12gwUbIi4Jwh
	SiqcrvkGhB4+Nfr8Xu8jA2CBVnJcd5Ga/LHokQGq3GQ4yEq1Vqsp4+rIXUaRsWyQnBzm48cZBL0
	tnpsxcrj7/4UGUJinQwSgEoW4wUGdLkcUYlusZw==
X-Google-Smtp-Source: AGHT+IFxzxmuPpGGtgaK/ADz5h7BzoKH2jlCxP24sLeUDiIStc55/RY07/OvRvUQNnlEGSZTe2LrtsqRIiecAwxru2Y=
X-Received: by 2002:a81:ac4c:0:b0:61a:e2dd:42ad with SMTP id
 z12-20020a81ac4c000000b0061ae2dd42admr762794ywj.16.1713185529613; Mon, 15 Apr
 2024 05:52:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240415120101.663323-1-Harish.Sadineni@windriver.com>
In-Reply-To: <20240415120101.663323-1-Harish.Sadineni@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 15 Apr 2024 05:51:58 -0700
Message-ID: <CAOSpxdbhRLmP8FQLWKG3jB-a_XeBetH3OuO5uMb1o2XUSadkXg@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH] rust: set CVE_STATUS for CVE-2024-24576
To: Harish.Sadineni@windriver.com
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com, 
	Sundeep.Kokkonda@windriver.com, Shivaprasad.Moodalappa@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Apr 2024 12:52:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198238

CVE_STATUS is not supported in kirkstone, you should use CVE_CHECK_IGNORE

Steve

On Mon, Apr 15, 2024 at 5:01=E2=80=AFAM Sadineni, Harish via
lists.openembedded.org
<Harish.Sadineni=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>
> CVE-2024-24576 only applies when invoking batch files (with the `bat` and=
 `cmd` extensions) on Windows & No other platform or use is affected.
> More details about CVE is here: https://nvd.nist.gov/vuln/detail/CVE-2024=
-24576
>
> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> ---
>  meta/recipes-devtools/rust/rust-source.inc | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-de=
vtools/rust/rust-source.inc
> index ea70ad786f..b8dcc56482 100644
> --- a/meta/recipes-devtools/rust/rust-source.inc
> +++ b/meta/recipes-devtools/rust/rust-source.inc
> @@ -5,3 +5,5 @@ RUSTSRC =3D "${WORKDIR}/rustc-${PV}-src"
>
>  UPSTREAM_CHECK_URI =3D "https://forge.rust-lang.org/infra/other-installa=
tion-methods.html"
>  UPSTREAM_CHECK_REGEX =3D "rustc-(?P<pver>\d+(\.\d+)+)-src"
> +
> +CVE_STATUS[CVE-2024-24576] =3D "not-applicable-platform: Issue only appl=
ies on Windows"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#198234): https://lists.openembedded.org/g/openembedde=
d-core/message/198234
> Mute This Topic: https://lists.openembedded.org/mt/105534166/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

