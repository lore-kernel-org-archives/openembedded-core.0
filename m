Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3534BEB64DD
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 09:20:59 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web10.8684.1690881653714886689
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 02:20:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=U/BVDh/c;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2b962535808so82813311fa.0
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 02:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690881652; x=1691486452;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YIZy8HJIE19hLAPFUnmrSjMXF/s7jxMhcdUpgY+e7xw=;
        b=U/BVDh/cpWBkfZH3bLtf42c+5qQiO/hnnL4Nf0WO9Dm1y0rwKN9T1xum/pQPm512Uz
         dnkT/YqSlMX04wvWTuAZ8YRojkA10qKlzGjPSIKbJ3Bh8iZtAEjb/kCYaJdRrnHbxLlP
         y9aFAdfHXlWbU7ZxsDA+SAn5HiEYkyfJvU7kmOASS3gtbR3m61a6y6zKXHhFQX/Ta+ga
         fNDkdPEu8c3cpg82nyz1P/lPBLZKC57S6qTVH1+zF85uBCktp4pcIQqvS4Rj1fL7yLc9
         kbJewxqpKwv1A2FgrLmj68DB/cCryTuhbZyVtA7Dh8ZEiq6jxIeiXbIr9DrDOIinWVRQ
         vrCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690881652; x=1691486452;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YIZy8HJIE19hLAPFUnmrSjMXF/s7jxMhcdUpgY+e7xw=;
        b=WcmbkPYqrYU6/PxkzXHQmYI8Guhf+U3CHfXF7/rXv5AF2F/ZcDOksb/LZc6RaZ/jI9
         8ZW70jrjADZ9taO/r//OWK/CS5ioBzvV/yY/hIm3Q3Cuv4Qo5AlSwjrWG0YqgCSg8AbX
         X2ogPZKkUe4dfmIZ1jpurEQeacu1/zSHDBxa+1YrLuE/R8jkecFcjrbCfGdEV1O9DqLG
         xF9ormJFKzXMcJ/yW/c89XYrR8UNCjehU2i5U380MOxsLHxL/xWZmkpSyhbOqxEpTfj3
         UeuzSC3ApDVlQ1hyoWJTSnjCiLleb0RHpW7EibDUPsiQy2cQdtKnh9E6fsFugRF8EEc0
         iiDw==
X-Gm-Message-State: ABy/qLYPaqzdLH2sUE4PADQ2STDc0wijdjbzbJDzTe8YQ01zEMlBYESt
	Ujq51dEet41TNAC6J/6i/y1y6eNHp//0oAaPFsk=
X-Google-Smtp-Source: APBJJlGWj0DuWbf5RtisPlOfHFQoS/7BJk+ZHxfKM2/KO5g6NXiCXWPpA/7DzXjHwRl4z4JYUx0HzncTT0zdZyIvYIQ=
X-Received: by 2002:a2e:b301:0:b0:2b9:e7d7:64bd with SMTP id
 o1-20020a2eb301000000b002b9e7d764bdmr1842973lja.47.1690881651662; Tue, 01 Aug
 2023 02:20:51 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1690795930.git.frederic.martinsons@gmail.com>
 <7a3e6d5250d6d0cc526dbede582815007a3b3e56.1690795930.git.frederic.martinsons@gmail.com>
 <205e20dd658f80e5215b6330f387cb4f95c30d4f.camel@linuxfoundation.org>
 <CA+cAkeoSMuuZoY+u7bAXq=9CAtrjyQew5MwCLMXRo7O9KRH4PQ@mail.gmail.com> <8ee20428cdc9a71f33bed57893ed6683f05e620b.camel@linuxfoundation.org>
In-Reply-To: <8ee20428cdc9a71f33bed57893ed6683f05e620b.camel@linuxfoundation.org>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Tue, 1 Aug 2023 11:20:40 +0200
Message-ID: <CA+cAkepixZXe=6SP8eKwkg7+h3p0CcK+s8s3Uyg0vYmACtH=xA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] cargo.bbclass: Offer a way to use --offline
 instead of --frozen
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com
Content-Type: multipart/alternative; boundary="0000000000003462aa0601d910c7"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 09:20:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185221

--0000000000003462aa0601d910c7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ok but this raises other questions then, this recipe is part of
packagegroup-core-tools-tesapps
<https://git.openembedded.org/openembedded-core/tree/meta/recipes-core/pack=
agegroups/packagegroup-core-tools-testapps.bb#n28>
and is part of a test case
<https://git.openembedded.org/openembedded-core/tree/meta/lib/oeqa/runtime/=
cases/rust.py#n52>
So what to do with those ? Suppress them too or adapt them with another
recipe (zvariant ?)

On Tue, 1 Aug 2023 at 11:07, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Tue, 2023-08-01 at 11:00 +0200, Fr=C3=A9d=C3=A9ric Martinsons wrote:
> > Thanks Richard, but I'd prefer to drop this patch if possible.
> > I think the rust-hello-world is no more useful and that we can
> > replace it by a more "real" example like zvariant
> > from meta-selftest.
> >
> > Let's see what others think about this
>
> After some thought, I'm in favour. Lets drop it.
>
> Cheers,
>
> Richard
>

--0000000000003462aa0601d910c7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ok but this raises other questions then, this recipe is pa=
rt of <a href=3D"https://git.openembedded.org/openembedded-core/tree/meta/r=
ecipes-core/packagegroups/packagegroup-core-tools-testapps.bb#n28">packageg=
roup-core-tools-tesapps</a><div>and is part of a=C2=A0<a href=3D"https://gi=
t.openembedded.org/openembedded-core/tree/meta/lib/oeqa/runtime/cases/rust.=
py#n52">test case</a></div><div>So what to do with those ? Suppress them to=
o or adapt them with another recipe (zvariant ?)</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 1 Aug 2023 a=
t 11:07, Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundatio=
n.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">On Tue, 2023-08-01 at 11:00 +0200,=
 Fr=C3=A9d=C3=A9ric Martinsons wrote:<br>
&gt; Thanks Richard, but I&#39;d prefer to drop this patch if possible.<br>
&gt; I think the rust-hello-world is no more useful=C2=A0and that we can<br=
>
&gt; replace it by a more &quot;real&quot; example like zvariant<br>
&gt; from meta-selftest.<br>
&gt; <br>
&gt; Let&#39;s see what others think about this<br>
<br>
After some thought, I&#39;m in favour. Lets drop it.<br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div>

--0000000000003462aa0601d910c7--

