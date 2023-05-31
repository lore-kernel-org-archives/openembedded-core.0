Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B78FEC7EE23
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 12:23:23 +0000 (UTC)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
 by mx.groups.io with SMTP id smtpd.web10.12680.1685535802583984948
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 May 2023 05:23:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=ODkrGVb7;
 spf=pass (domain: gmail.com, ip: 209.85.166.47, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-77489b6f68cso370993339f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 05:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685535802; x=1688127802;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bsm3QJ47HOkbDetvAcLHJffegEUFfp9yfsD/D1IU6VA=;
        b=ODkrGVb7fNp4UDUQcWvlJIaS6HqpdcMNxnMOmqA18/ptmutoy8EwOj+cOzrW0Jpo5r
         M70YtGJLAgg3SC4X7zKeymQU1WG0mPDFOxUF49Wwj3qXnoqSDCJkBhHhurkI/7henBWl
         3sgm0SDcGeRcTQYhkdVSjNaiJ8gzd2HJJ9KnGjTQGUmo6sSgd1f1WPnaKTrDkHQ5kZFC
         J9UDlgO4FkF5mfZ3Ms9gnrKPDtpOaIuO72sc/N93aPcD9CaA+vV+bb+4cBHkVCUlm9yA
         Q3GAwvTvECeT7Ve+0K9MRwqk9WvikYVja7Vv5ezbf71adiQtNVTweXA3DdfYgpSm1jfm
         Qo8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685535802; x=1688127802;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bsm3QJ47HOkbDetvAcLHJffegEUFfp9yfsD/D1IU6VA=;
        b=GX1r/lX+pxoIgp9Qo8qY6KVH0eYhZunGb1W/PNnr5LyOuOthSZDYC2R7PsahPeKKhs
         TlwbUT7eMzfukFfs0W1HFq4xs2ASdHBZ48DdhQz6D448kCzmJaLF7yVS29cGX5hgtdGj
         VX+lHA8Tew4FFlCjAbUUxLp5LX/aeo3Be34v13Aacy1tFkhKYGZhuIt6ere8p6QrnL04
         P6bKQ+KxLhZ5wS9goIPF/e5abXv5G6QAFNnThuhCL1xbDGSw7TE8ioKJ8MNvKscizyr7
         tDwJr059oFNspOxhHcLnYQmB/c8IeMOfjNBRT9RDA02zmuA9vya5vb0an6Oa61tN0oK8
         RhPw==
X-Gm-Message-State: AC+VfDyNBSslP1ons+K/GPEseyaM6Zbg/n1xbBx0g0Qsin/Ja1sM7oVG
	1VeaEIuGNTbp7D5B5N8Yf0Gvi2f/NnyZUOl/V0YOHV4ezvw=
X-Google-Smtp-Source: ACHHUZ6838lcm598Bldc1KS/cjSy/s0jC6fT+OiDvFAe27BX1I64zhL6vNX3D0SKxH//iEXn9URxDKOm7bz1k5OqQ8g=
X-Received: by 2002:a05:6602:2297:b0:753:ca30:6bb0 with SMTP id
 d23-20020a056602229700b00753ca306bb0mr4966479iod.4.1685535801730; Wed, 31 May
 2023 05:23:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230531051408.2518859-1-xiangyu.chen@eng.windriver.com>
In-Reply-To: <20230531051408.2518859-1-xiangyu.chen@eng.windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 31 May 2023 08:23:15 -0400
Message-ID: <CADkTA4P0mMXrDowrqi2NryRhJwRyQ9xO9A9P5zWwMG9rMgUf0w@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] perf: fix argument list too long
 during compile
To: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 12:23:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182008

On Wed, May 31, 2023 at 1:14=E2=80=AFAM Xiangyu Chen
<xiangyu.chen@eng.windriver.com> wrote:
>
> From: Xiangyu Chen <xiangyu.chen@windriver.com>
>
> The perf would fail to build when BUILDDIR is longer than 190, The "O =3D=
 ${B}"
> makes it use absolute path which makes the argument list too long, remove
> "O =3D ${B}" will make it use relative path to build will fix the problem=
.
>

Can you elaborate on how the relative path use is happening when an
explicit output directory isn't passed ?

I haven't checked the source, but I'd assume that it will simply build
directly in the source directory if we don't pass O to the build.

Also, is this fixed in a different way in master ?

Bruce

> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> ---
>  meta/recipes-kernel/perf/perf.bb | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/=
perf.bb
> index a4ce3169d3..e213c3632e 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -72,7 +72,6 @@ LDFLAGS=3D"-ldl -lutil"
>  EXTRA_OEMAKE =3D '\
>      V=3D1 \
>      -C ${S}/tools/perf \
> -    O=3D${B} \
>      CROSS_COMPILE=3D${TARGET_PREFIX} \
>      ARCH=3D${ARCH} \
>      CC=3D"${CC}" \
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#181989): https://lists.openembedded.org/g/openembedde=
d-core/message/181989
> Mute This Topic: https://lists.openembedded.org/mt/99236216/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [br=
uce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

