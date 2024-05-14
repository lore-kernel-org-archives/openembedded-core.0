Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5868C04FFE
	for <webhook@archiver.kernel.org>; Tue, 14 May 2024 15:43:44 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web11.19318.1715701419952226933
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 May 2024 08:43:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z03qTlqU;
 spf=pass (domain: gmail.com, ip: 209.85.167.174, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3c996526c69so2970997b6e.1
        for <openembedded-core@lists.openembedded.org>; Tue, 14 May 2024 08:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715701419; x=1716306219; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a16qCdkBjYhxFEOwjTuyOai6lMBh5xlPMd5obOgirB4=;
        b=Z03qTlqUbhN+eVHHubMin+1Fd3Ytc5P7+INFlnvyxPs9ROsacTqZUL0LtVoxwKnMhX
         UyILSCcQvivMmNFvUGUGxt0Z57gCdURqJOe9aAYm4GsBDOMQSKunRAcmIb4F2O3qx9FD
         WkSabdtcN6MlBgef6b+ACTor5ydh2cNs6Gv9BytWhPkBkGQGdEXzHh64XY5uH+omaqBg
         I6lIZ5uJ1GVV4G3VeheIN8HMwc+8QlA6Q+075f0bNMgOxjD9veaLrU4/X8t24ONJy0DT
         P+gGkMrZT+r/nXt3uNQUDGE+ZV00iPFU8XCiBEw4Dbk8SbydgUD/Zb4LgeKwQW7BVftB
         DQSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715701419; x=1716306219;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a16qCdkBjYhxFEOwjTuyOai6lMBh5xlPMd5obOgirB4=;
        b=fvdL1Vzvr9C50WmUeqIS9C7BkpHEdRLHShEhHU4PW0m+zU458474OSUxPnHf8JJq/Q
         z6GcYIYBuuQ+1czBm+8PmxuP6ywufD7jwl1S9v+e2xTvEqA+LaY76TOp53oPrugSFmJV
         hNyD74/hic3umYjxDOCZQgkJ5djFyWQUAbiTEM5pVhmMLKOQ3Vypm6OAvwx5CCogXm47
         YVh4igH4pNtQa+6LFs/r5um1yqsBq/XXU2g+BJEWjYVIxnb+TG4mcGHyDACV6Bignojs
         p5YodS2d+WCVQGCg4c0BNqKPy8Xep2SnEEIbv20DAIXD7Redfu+a18gVaTVwRQaMwxqn
         m10g==
X-Forwarded-Encrypted: i=1; AJvYcCVUY1WfBaFdmyIM2+q5HRKuFEutHYfWJwkDvnif2NP5RSxl8HOFc7GfXrer/Z0xOj5UIbjy7CcPG428ME4CV0kWjG1QlJ5bV2Q7oLnGxsPpgM7pwLfJTw81
X-Gm-Message-State: AOJu0YxJeyGfLsNX8tbwW/WS12Vpz1Km2hM3oO1Q+96PD/zdUwJP8Ho4
	mJMNfCAXjWbY3jBp6wDDG+EByqkdQw41tbHlPXdPlYTo9Fndhne108XbA7O44gjqyWlfSkbTZPW
	knqEpeMvM7ziFj55kKvweuyxK+D4=
X-Google-Smtp-Source: AGHT+IEHW6B9mbQWQS57CW3Pl76TguBPhTTdd2dR/7mt2l0OPZFOZK1AEuRCEJ5DX2wxSK1TK7hVIsJhL1M9WkvysrQ=
X-Received: by 2002:a05:6870:d1ca:b0:22e:cbfa:678d with SMTP id
 586e51a60fabf-24172fc5fe4mr15600888fac.57.1715701419008; Tue, 14 May 2024
 08:43:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240507053320.1566814-1-raj.khem@gmail.com> <20240507053320.1566814-7-raj.khem@gmail.com>
 <CANNYZj_w95u_j3XTgAMzHJ3_dYKyBzqL4tj6V3pS=sAXFjyP_g@mail.gmail.com>
 <CAMKF1soraS1+kfj9jkSqOo6LiaZnOOqzj9PimZXssfDu0kuHqw@mail.gmail.com>
 <CANNYZj_dZEQgVtihxZ-PtiBHBB44OqMF7ebLKQTEg7Bt+rrJCw@mail.gmail.com> <bccbb448-10d9-48e8-9b9a-72de5b7d9072@windriver.com>
In-Reply-To: <bccbb448-10d9-48e8-9b9a-72de5b7d9072@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 14 May 2024 08:43:12 -0700
Message-ID: <CAMKF1soLPQ4y85_VYZNbTDU7joD8MX+iLx82c8jJ5cDRXk+sdg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 07/11] kea: Remove -fvisibility-inlines-hidden
 from C++ flags
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: alex.kanavin@gmail.com, openembedded-core@lists.openembedded.org, 
	Martin Jansa <martin.jansa@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 May 2024 15:43:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199261

On Tue, May 14, 2024 at 8:25=E2=80=AFAM Randy MacLeod
<randy.macleod@windriver.com> wrote:
>
> On 2024-05-07 3:56 p.m., Alexander Kanavin via lists.openembedded.org wro=
te:
>
> On Tue, 7 May 2024 at 18:13, Khem Raj <raj.khem@gmail.com> wrote:
>
> Firstly I am inclined towards removing it if we can, since I think it sho=
uld be
> packages to decide to use it, then they can maintain it better from testi=
ng POV,
> However, there is something
> to consider w.r.t. to this option. This does help in optimizing loading D=
SOs
> by reducing the number of PLTs and improves loading time for DSOs which m=
ight
> be quite meaningful for embedded devices that we target. However, we only
> enable hidden visibility only for inlines so it won't be full benefits bu=
t we do
> have better default compatibility.
>
> Since we have had this option for a long time and it still seems
> relevant, I would
> think it would make sense to do some benchmarking on a sizeable C++ progr=
am
> perhaps chromium or webkit, and see the difference in DSOs sizes with
> and without
> this option and also benchmark the loading time of the resulting
> chromium package.
>
> maybe we will find that the gains are not as significant, in that case
> we might drop
> it from defaults.
>
> I digged deeper and this is where I think it originated:
> https://git.openembedded.org/openembedded/commit/?id=3Dddd6d1fd26416a3766=
d754eeda4237a680a65520
>
> Ah the simpler times of oe-classic, when one could bundle four
> unrelated changes into one commit and explain none of them.
>
> Benchmarking I have no time for right now, just wanted to point out
> that adding the flag was never justified in commit log. Can you
> experiment with webkit?
>
>
> I tried to build chromium with and without this flag but ran into build p=
roblems - sigh.
>
> I pulled out the next most-bloated single executable that I could think o=
f: nodejs
>
> The bottom line is that the flag reduces the nodejs executable size  by ~=
6%.
> Actual sizes:
>
> >>> 37333922 - 35245092
> 2088830
>
> so 2 MB out of 37 MB !
>
> Chromium has been updated over the weekend so I'll try that next.
>
> What else would people like to see to assess the utility of this compiler=
 option?
>
Thanks for taking this up.
I think chromium and nodejs are large enough packages to give us a
good idea of its benefits.
We should add a comment to config files where this option is added for
future reference.

>
> ../Randy
>
> Original build:
>
> =E2=9D=AF size ../chromium-poky-m-aab1335523/tmp/work/core2-64-poky-linux=
/nodejs/20.12.2/packages-split/nodejs/usr/bin/node
>    text    data     bss     dec     hex filename
> 35245092         628548  154792 36028432        225c010 ../chromium-poky-=
m-aab1335523/tmp/work/core2-64-poky-linux/nodejs/20.12.2/packages-split/nod=
ejs/usr/bin/node
>
> With this patch:
>
> =E2=9D=AF git diff
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_20.12.2.bb b/meta-oe/=
recipes-devtools/nodejs/nodejs_20.12.2.bb
> index d86c38f2f..50cff533f 100644
> --- a/meta-oe/recipes-devtools/nodejs/nodejs_20.12.2.bb
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_20.12.2.bb
> @@ -42,6 +42,8 @@ S =3D "${WORKDIR}/node-v${PV}"
>
>  CVE_PRODUCT +=3D "node.js"
>
> +CXXFLAGS:remove =3D "-fvisibility-inlines-hidden"
> +
>  # v8 errors out if you have set CCACHE
>  CCACHE =3D ""
>
>
>
> =E2=9D=AF size tmp/work/core2-64-poky-linux/nodejs/20.12.2/packages-split=
/nodejs/usr/bin/node
>    text    data     bss     dec     hex filename
> 37333922         628548  154792 38117262        2459f8e tmp/work/core2-64=
-poky-linux/nodejs/20.12.2/packages-split/nodejs/usr/bin/node
>
> =E2=9D=AF python3
> Python 3.10.12 (main, Nov 20 2023, 15:14:05) [GCC 11.4.0] on linux
> Type "help", "copyright", "credits" or "license" for more information.
> >>> 35245092.0/37333922.0*100.0
> 94.40500786389386
>
>
>
>
> Alex
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#199104): https://lists.openembedded.org/g/openembedde=
d-core/message/199104
> Mute This Topic: https://lists.openembedded.org/mt/105955497/3616765
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
ndy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>
> --
> # Randy MacLeod
> # Wind River Linux

