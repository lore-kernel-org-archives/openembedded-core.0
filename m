Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3770C54E71
	for <webhook@archiver.kernel.org>; Fri, 22 Mar 2024 18:35:54 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web11.3143.1711132552037682057
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Mar 2024 11:35:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mP0VIlZB;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-22222357d76so869965fac.2
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Mar 2024 11:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711132551; x=1711737351; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hJZFL3W80ff9zawhS4cn+urqklOBpGNv2yhFxQ3QoDE=;
        b=mP0VIlZBriKAcgyN3v0kztRXB5xEq8FjgdbfawXvD/GJX08TEYimqNXdTiIvv0Urzi
         0sg5Cjbev97P0q4shgOzEFBj5iTx6w5ADXnKmbrgKhez3G8AFN2tBpnq+khXC3hIiBQN
         0NIjrlyrSi8jXHYKCJHxYbZ74qHSSGnrJGXbHgaVLzMaL7d2P2eCjeDDJkFuTZcCMoOH
         yTplz5+zQvqYnVaX2++Oroe+womicEOND3aZ+OkhsrgeE330mpqeYmj+FhBI30iumDXs
         QKjG1qeyWmwbUPXje5Q3S1VifK5PUVkz30GTtHO9OcrL0P5g1xuRLDpcqDpQHbsUcwds
         a7QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711132551; x=1711737351;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hJZFL3W80ff9zawhS4cn+urqklOBpGNv2yhFxQ3QoDE=;
        b=nhpLVrctmbX+p1KY+m0OaZOThDBKZeSpOIDEJO5u2u9OcWK1XKGREzL40RbtwUkRaz
         e2nvg/GlmdzlFh86Zcv+9gZ5IT4Y/yMIzw5qoAqrYQAD1+rqBALolte1RqLzVGfxD+4F
         EY3y2dfktyjRWTTZSY4WmVgbmU3RmYlznRPcimRj4qZpycyCK1sI4RF//e9Kn0hFHCF2
         AqXhH/nIf0TFk6ed5aDCU2Dctg1sfA0ItPtWoonLBokKGU43E7hMmUTANLOhhWbOzNr6
         qPQJEngXH6/oA3PNtKHNIncp+Wvlc2KNIh/77FseucRxyWMhFp17lbVwYEMc7RJBGgbo
         7MwQ==
X-Gm-Message-State: AOJu0Yy9qT2Ud2AAQfbxx6wMAQkNrjCGjR+I7G21XuWcBh8+EBNYc/xZ
	VqF2URIHzb4cunUp3DiKIPj5f0WsZ5L8ZN5WHMgmbadW7LD0qxgI6SYDcvTS7GRem1LSwdExXf7
	7+LJAtZRdsmryxe9xinEx1QPSnrk=
X-Google-Smtp-Source: AGHT+IEsSDk8Q+4agrQ+4XC5cSFrMLy0BbRJQ6jirNVy8Cq4sBmO3kqgQCAShuOF3SUtU7lgHUOHnkXbSdx7c8Texaw=
X-Received: by 2002:a05:6870:a40b:b0:229:f73c:1db7 with SMTP id
 m11-20020a056870a40b00b00229f73c1db7mr607569oal.31.1711132550936; Fri, 22 Mar
 2024 11:35:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240322100845.1394931-1-Harish.Sadineni@windriver.com>
In-Reply-To: <20240322100845.1394931-1-Harish.Sadineni@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 22 Mar 2024 11:35:24 -0700
Message-ID: <CAMKF1spG_fO8QiMudHQhYCKrKbidVat=A0zzhWVkQ3WE=zq_-Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] binutils: gprofng - change use of bignum to use
 of bignint
To: Harish.Sadineni@windriver.com
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com, 
	Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Mar 2024 18:35:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197448

lgtm

On Fri, Mar 22, 2024 at 3:09=E2=80=AFAM Sadineni, Harish via
lists.openembedded.org
<Harish.Sadineni=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>
> In SDK, The "x86_64-pokysdk-linux-gp-display-html" fails with below error=
 while genearting profiling html reports from test experiment file (eg., te=
st.1.er)
> Error: Undefined subroutine &bigint::hex called at .../sysroots/x86_64-po=
kysdk-linux/usr/bin/x86_64-pokysdk-linux-gp-display-html line 4059, <MAP_XM=
L> line 1.
>
> Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-gdb.g=
it;a=3Dcommit;h=3D3243d790ee32aa8eda69226d81b1e79dbd1dcd87]
>
> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> ---
>  .../recipes-devtools/binutils/binutils-2.42.inc |  1 +
>  ...gprofng-change-use-of-bignum-to-bigint.patch | 17 +++++++++++++++++
>  2 files changed, 18 insertions(+)
>  create mode 100644 meta/recipes-devtools/binutils/binutils/0015-gprofng-=
change-use-of-bignum-to-bigint.patch
>
> diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/reci=
pes-devtools/binutils/binutils-2.42.inc
> index 5fcb4292b3..3b6f47d4ce 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.42.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
> @@ -35,5 +35,6 @@ SRC_URI =3D "\
>       file://0012-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.pa=
tch \
>       file://0013-Define-alignof-using-_Alignof-when-using-C11-or-newe.pa=
tch \
>       file://0014-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.pa=
tch \
> +     file://0015-gprofng-change-use-of-bignum-to-bigint.patch \
>  "
>  S  =3D "${WORKDIR}/git"
> diff --git a/meta/recipes-devtools/binutils/binutils/0015-gprofng-change-=
use-of-bignum-to-bigint.patch b/meta/recipes-devtools/binutils/binutils/001=
5-gprofng-change-use-of-bignum-to-bigint.patch
> new file mode 100644
> index 0000000000..0d3d289eba
> --- /dev/null
> +++ b/meta/recipes-devtools/binutils/binutils/0015-gprofng-change-use-of-=
bignum-to-bigint.patch
> @@ -0,0 +1,17 @@
> +Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-gdb.=
git;a=3Dcommit;h=3D3243d790ee32aa8eda69226d81b1e79dbd1dcd87]
> +
> +Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> +
> +diff --git a/gprofng/gp-display-html/gp-display-html.in b/gprofng/gp-dis=
play-html/gp-display-html.in
> +index 6f37ca282e7..306c99a0ec3 100644
> +--- a/gprofng/gp-display-html/gp-display-html.in
> ++++ b/gprofng/gp-display-html/gp-display-html.in
> +@@ -25,7 +25,7 @@ use warnings;
> + # Disable before release
> + # use Perl::Critic;
> +
> +-use bignum;
> ++use bigint;
> + use List::Util qw (max);
> + use Cwd qw (abs_path cwd);
> + use File::Basename;
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#197438): https://lists.openembedded.org/g/openembedde=
d-core/message/197438
> Mute This Topic: https://lists.openembedded.org/mt/105082419/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

