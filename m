Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 447A3C47DD9
	for <webhook@archiver.kernel.org>; Wed, 27 Mar 2024 15:55:08 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web11.41555.1711554903685415489
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Mar 2024 08:55:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=0hEyt8Rf;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.176, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-611248b4805so52557767b3.0
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Mar 2024 08:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1711554903; x=1712159703; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=glF1GgVJz1RkmdK3uO0Hhf1kzCEzNE+YeJx5y8VQ5BE=;
        b=0hEyt8RfOPXfizgj8qk17PXd/+0zKGLy/eIiyI1AOCk61yxPHxDy6fxoteIFc9DJa0
         bkpOISWrsZ33wO0wWnLVSlbrvTnoquLkQe8c+Hp2kPQx5YVhNP3+prdYvHoj+3ya8Tlb
         ocaySgI/ZLd8unrH64xypn+/FOCAAaGFMuFrluC5ICIwwt5sfxobyRaEhyppPDSp+nF5
         4pZlQXYfIBJK8SMnz3swDB21Wlu0xSZ65YIDpiZjbqDVc3Bs3GxRSIPzquoqm4IjGXHA
         Un4SK61vcYwIzLiCSYUQH5KNFngwcTqzGqWTH1qzASl+1JSwgol5/smLfAWI+f15xSmo
         /6Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711554903; x=1712159703;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=glF1GgVJz1RkmdK3uO0Hhf1kzCEzNE+YeJx5y8VQ5BE=;
        b=BsvDAUq1PUE//cVlFpYHjAG0c1Wzh6qoEPcqXSgsoLNtAH06hxvody2YRYQSvkikzZ
         7E5qJPDg6gQgOqppGUogm3NR6QtSRRfwH13F9Ze+HaPbMxaqH1abkqglmFaVcxnrQK/O
         +cdSgRkljnrNtHYk6lglm2cEb9Q+G7HNWqN7ydeYOcfy8VVgui/iUsGjUZpzMTuWBeyD
         77ioiznihZXrthTh3mDjJm9NCJYLvGJ9dNpyz/OE3FrLuZtMsu9JdUaV0ZFtUGxQ5GfK
         ZpUn+kMoUJMb3kJmNJyVnVq5CaEz337mqPEtMflZxUJ3/JlShUpKT906KJAUZ3JJNGwA
         oX6g==
X-Gm-Message-State: AOJu0YwC4ZVUVewZxN0yhFVMBv02YueXrwGCZk6d6FGcNCM5hMn3mfRG
	u1qSPPym8h1MtIKUoKnyIDs+H25/YyeWNrrnSK8nauwZw+dh22DkzX0NSp8pKLrD6bXX9R5ZfhK
	8AWvzWAlzElLsCghfPoLPyOsA9uM5WjhOgwOAmRSyPOPE9A9mhhU=
X-Google-Smtp-Source: AGHT+IFPYEdc/xDbETom37IQ7u89+K+EuUz5Ym8CZ+F3psqGcd39dBcESuY/Yb/rioZyfnss3EuVucrrEFigHllgu50=
X-Received: by 2002:a0d:fd85:0:b0:611:1ff8:ac75 with SMTP id
 n127-20020a0dfd85000000b006111ff8ac75mr72333ywf.10.1711554902750; Wed, 27 Mar
 2024 08:55:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240327072236.2221619-1-mingli.yu@windriver.com>
In-Reply-To: <20240327072236.2221619-1-mingli.yu@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 27 Mar 2024 05:54:51 -1000
Message-ID: <CAOSpxdZd7HHmQ-1WUgU5CQYyQLqkVOZ1gwrmUcf90XV6cE+wyA@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH 1/2] python3-unittest-automake-output:
 add new recipe for ptest integration
To: "Yu, Mingli" <mingli.yu@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Mar 2024 15:55:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197563

Sorry, it is outside of stable branch policy to add features so I
can't take this patch series.

Steve

On Tue, Mar 26, 2024 at 9:22=E2=80=AFPM Yu, Mingli <mingli.yu@eng.windriver=
.com> wrote:
>
> From: Ross Burton <ross.burton@arm.com>
>
> This package contains modules for both unittest and pytest that alter
> the output to look like automake's 'make check' output, for better
> integration with ptest.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 961e4f3fc786715fc136fa446686972a4a95a3d5)
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  meta/conf/distro/include/maintainers.inc            |  1 +
>  .../python/python3-unittest-automake-output_0.1.bb  | 13 +++++++++++++
>  2 files changed, 14 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3-unittest-automak=
e-output_0.1.bb
>
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
> index bfc14951fe..09c1599915 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -684,6 +684,7 @@ RECIPE_MAINTAINER:pn-python3-toml =3D "Tim Orling <ti=
m.orling@konsulko.com>"
>  RECIPE_MAINTAINER:pn-python3-tomli =3D "Tim Orling <tim.orling@konsulko.=
com>"
>  RECIPE_MAINTAINER:pn-python3-typing-extensions =3D "Tim Orling <tim.orli=
ng@konsulko.com>"
>  RECIPE_MAINTAINER:pn-python3-typogrify =3D "Alexander Kanavin <alex.kana=
vin@gmail.com>"
> +RECIPE_MAINTAINER:pn-python3-unittest-automake-output =3D "Ross Burton <=
ross.burton@arm.com>"
>  RECIPE_MAINTAINER:pn-python3-urllib3 =3D "Tim Orling <tim.orling@konsulk=
o.com>"
>  RECIPE_MAINTAINER:pn-python3-vcversioner =3D "Bruce Ashfield <bruce.ashf=
ield@gmail.com>"
>  RECIPE_MAINTAINER:pn-python3-wcwidth =3D "Tim Orling <tim.orling@konsulk=
o.com>"
> diff --git a/meta/recipes-devtools/python/python3-unittest-automake-outpu=
t_0.1.bb b/meta/recipes-devtools/python/python3-unittest-automake-output_0.=
1.bb
> new file mode 100644
> index 0000000000..ba58c18df0
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.b=
b
> @@ -0,0 +1,13 @@
> +SUMMARY =3D "Modules to make unittest and pytest look like Automake outp=
ut, for ptest"
> +HOMEPAGE =3D "https://gitlab.com/rossburton/python-unittest-automake-out=
put"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Df6f16008d9fb7349f06609329f1ab=
93b"
> +
> +SRC_URI =3D "git://gitlab.com/rossburton/python-unittest-automake-output=
;protocol=3Dhttps;branch=3Dmain"
> +SRCREV =3D "06537edb18f3641c70bce25256f6ecf5f5164ead"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit python_flit_core
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#197548): https://lists.openembedded.org/g/openembedde=
d-core/message/197548
> Mute This Topic: https://lists.openembedded.org/mt/105173226/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

