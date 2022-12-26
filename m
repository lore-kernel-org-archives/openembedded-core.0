Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98C57C4167B
	for <webhook@archiver.kernel.org>; Mon, 26 Dec 2022 09:59:39 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.133068.1672048774327553432
 for <Openembedded-core@lists.openembedded.org>;
 Mon, 26 Dec 2022 01:59:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MC9rvfdM;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id p1-20020a05600c1d8100b003d8c9b191e0so7264005wms.4
        for <Openembedded-core@lists.openembedded.org>; Mon, 26 Dec 2022 01:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=k4sOQHH/AdodwC1GPmlbnc8qftDEfyI9LnTU3RpM4U0=;
        b=MC9rvfdM8nufzFyfsTejYT3mk/i8iz855TcUEL2DaeandP0T/mnZi2HGglbOP+zv9t
         q57t/emspdF51T2ZqfGfBSsjzJnxfe5WvCIsNbpXzUudmvneoU3livH7LAjhY1K7rEBD
         NDXFm8Djdw9GQIC81Gd7Et8urn96ZQhOVx7DJu87PWc6BSNa/4S3/sH0Rn2IWyu7bQT9
         cOcNVe/ApBILG/TL4e6RyTzILCVJ1KWo+fp2ociRFyxgy8gjdxGcfQBKZWoZiyxC1+a2
         Yfno5GUnfK8f2B6A0R29BhsRmrDvFkVj04IhKJyfbuj5rwQJAICUSbLgCZidz6arc8tH
         HfKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k4sOQHH/AdodwC1GPmlbnc8qftDEfyI9LnTU3RpM4U0=;
        b=nqp40eq4uBpC4myiaShxhnhjeRvazqGhWdCO1AwaAj6E1qSSXmUhPZb4GgTMv9Cqas
         A2hyw1kiGQEPk/YD+89m/vNk6M1RU4Nmtyuv6I3vY3TYJpxPuiq7gnalzfq66VOGqcWJ
         eaIO4HxJ6MjgoFhUAGnsYH29ieIzpIDIFhQLYK4NN3GVZhEfJlIraL/40UIYf2SxgjDr
         SWpH38P8a7TsboKDf2PcUakywZcNysflpmHcYfXvqs9Fp9UOp2qkL2nUQaRpukb9lzQL
         eIEHmfi4kdJooq4KdZJ8HEa9JuI6KaI+wHUKytg7glPUMyQe6gcTweGj0vvuzbpI0Ve7
         WfgA==
X-Gm-Message-State: AFqh2kqDaNc/nqslFJ5p0FFFRsea09T0Mv+AkZ2yWTbTZpkQMt75FOrn
	DcFg5eMmmD9QHwLLC5lqp5OkQJazzRC0es3xbWY=
X-Google-Smtp-Source: AMrXdXsVQjksHOsNwGy/VgBZuDtui9qeqjknwVdeWgHFuhRKubvGlZKVcDNiSLXyIbwygGgJaLAVI6hlCcIQPZPscxk=
X-Received: by 2002:a05:600c:3b04:b0:3d0:50c4:432c with SMTP id
 m4-20020a05600c3b0400b003d050c4432cmr914313wms.67.1672048772465; Mon, 26 Dec
 2022 01:59:32 -0800 (PST)
MIME-Version: 1.0
References: <20221222150246.91423-1-uvv.mail@gmail.com> <0c9483d89d86eae9a84362935108f0e915b31dda.camel@linuxfoundation.org>
 <CADkTA4NnDKC0LybGM5w_otZVpAPy3Gk8+0UR1s1_tn7NVUC0Sg@mail.gmail.com>
 <5910a96e-28a2-4af6-2dc9-bc21e8bee9fb@gmail.com> <CA+chaQebMbjndYC_vqjFohnNBzuov8X0p2F4a0AvMcjEFnqjyA@mail.gmail.com>
 <3d6e9c54-6d00-9400-d8ef-25109e95b775@gmail.com>
In-Reply-To: <3d6e9c54-6d00-9400-d8ef-25109e95b775@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 26 Dec 2022 10:59:21 +0100
Message-ID: <CA+chaQc=BWsEPXNp1gN4SzUeZ+0AEh2ori=Se36vVpuk8b3kYw@mail.gmail.com>
Subject: Re: [OE-core] [langdale][kirkstone][PATCH] go-mod.bbclass: Allow
 network in do_compile
To: Vyacheslav Yurkov <uvv.mail@gmail.com>
Cc: lukas.funke@weidmueller.com, stefan.herbrechtsmeier@weidmueller.com, 
	wonsang.ryu@lge.co, =?UTF-8?B?66+86rK97KeB?= <dp.min@lge.com>, 
	Bruce Ashfield <bruce.ashfield@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000021493e05f0b831d7"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Dec 2022 09:59:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175018

--00000000000021493e05f0b831d7
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 26, 2022 at 10:38 AM Vyacheslav Yurkov <uvv.mail@gmail.com>
wrote:

> Martin, I did see that patch series, but I was not sure about its state,
> therefore I didn't try it. If I understood correctly, that partially solves
> the issue, but the proper solution should involve the fetcher, that's why
> it's not yet merged to master. Am I missing something?
>

That's not my understanding.

The proposed changes for recipetool had some cosmetic and functional review
comments and it doesn't work correctly for every possible go dependency
(e.g. the 3 issues I've mentioned from telegram recipe), but it's very good
starting point and we should be able to get it merged in master (and then
everybody can more easily contribute fixes for the corner cases where it
might not work well yet).

Even missing documentation IMHO shouldn't block merging it at this point,
because there is a clear need this (as there are already 3 partial
implementations to fix this issue, neither 100% complete and nothing merged
in master - the recipetool changes are IMHO the best of 3 as it integrates
with devtool as well and seems to be most complete).

go fetcher in bitbake is another possibility for future, but generating the
long deps in SRC_URI is much better solution then enabling network in every
go-mod recipe.

Please try recipetool changes on your go-mod recipes and provide feedback.

Regards,

--00000000000021493e05f0b831d7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, Dec 26, 2022 at 10:38 AM Vyachesl=
av Yurkov &lt;<a href=3D"mailto:uvv.mail@gmail.com">uvv.mail@gmail.com</a>&=
gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
 =20
   =20
 =20
  <div>
    <div>Martin, I did see that patch series,
      but I was not sure about its state, therefore I didn&#39;t try it. If
      I understood correctly, that partially solves the issue, but the
      proper solution should involve the fetcher, that&#39;s why it&#39;s n=
ot
      yet merged to master. Am I missing something?<br></div></div></blockq=
uote><div><br></div><div>That&#39;s not my understanding.</div><div><br></d=
iv><div>The proposed changes for recipetool had some cosmetic and functiona=
l review comments and it doesn&#39;t work correctly for every possible go d=
ependency (e.g. the 3 issues I&#39;ve mentioned from telegram recipe), but =
it&#39;s very good starting point and we should be able to get it merged in=
 master (and then everybody can more easily contribute fixes for the corner=
 cases where it might not work well yet).</div><div><br></div><div>Even mis=
sing documentation IMHO shouldn&#39;t block merging it at this point, becau=
se there is a clear need this (as there are already 3 partial implementatio=
ns to fix this issue, neither 100% complete and nothing merged in master - =
the recipetool changes are IMHO the best of 3 as it integrates with devtool=
 as well and seems to be most complete).</div><div><br></div><div>go fetche=
r in bitbake is another possibility for future, but generating the long dep=
s in SRC_URI is much better solution then enabling network in every go-mod =
recipe.</div><div><br></div><div>Please try recipetool changes on your go-m=
od recipes and provide feedback.</div><div><br></div><div>Regards,</div></d=
iv></div>

--00000000000021493e05f0b831d7--

