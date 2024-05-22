Return-Path: <alejandro@enedino.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A741C25B78
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 19:15:57 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web11.3281.1716405352027479732
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 May 2024 12:15:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.167.174, mailfrom: aehs29@gmail.com)
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3c9cc681e4fso2695319b6e.0
        for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 12:15:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716405351; x=1717010151;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y3EvBBJd7JHVW67Plg+YzvBzE0f0LzHOrqdo/m9yoZk=;
        b=EVXvfJkZuE/DAPDcgpt13o/LeHzLuBR2YEXjqTjjEL6f6H+iEbtYgSvq8/7LNu9Jme
         s/WLqlpyCx4ZIVTWHlB5ItQVxnTUoBzhapZBt4yN72gcpXX4g8N0h8bCAideafI3uYcJ
         jTHKsL9y0ORKgt1aS54/pz0BEdYWQVWuRgC/tu1twS88ljt70VVLc85l6RqQU3g9R1ru
         PRzqZ+D/eo1V9Qys7O/KeIpiGRAtEjGWK6U6uQOk8e6ubfIXP0ysHhW23ZhyY8gpSxzx
         55h8yc18xrfL/gIhPZRs3PD++OpKm9vWSsSGsaKiFPOjj4rG3liFI5vUp+xZ/u0GwRpf
         yY7A==
X-Gm-Message-State: AOJu0YxEHpATzsCVC/OgA1scTASkb7t+p1S3T2mu6ZyTqWSt97sNX/Nn
	3PmvAZ7EBB9eN2mb5qGT4f0AzVq499/h2n8gfSX9aGeK6j6foKrjaYfU7r5NHFE=
X-Google-Smtp-Source: AGHT+IG0Krp4wmIqPmej7fdWmN6F+dkJXVxiTyTcske2wzpgeHOP7sBnsYtlHLYKBYRnA6qJ8F2XHQ==
X-Received: by 2002:a05:6808:1806:b0:3c8:3490:4a05 with SMTP id 5614622812f47-3cdbb05c409mr4570806b6e.50.1716405350981;
        Wed, 22 May 2024 12:15:50 -0700 (PDT)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com. [209.85.161.54])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3c9a48dfa7bsm3855616b6e.31.2024.05.22.12.15.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 May 2024 12:15:50 -0700 (PDT)
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-5b2cc8c4b8aso3713948eaf.1
        for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 12:15:50 -0700 (PDT)
X-Received: by 2002:a05:6820:160d:b0:5b2:bc0:f38b with SMTP id
 006d021491bc7-5b6a32ec15fmr3920770eaf.5.1716405350257; Wed, 22 May 2024
 12:15:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240519055050.2331637-1-alejandro@enedino.org>
 <20240519055050.2331637-4-alejandro@enedino.org> <C23A42BD-03CC-45C7-9221-196D21A31787@arm.com>
 <CAHMutrYhV8u0xD40C52HXmnRjNv82QzCmYqLmWT=PXj9MjeKzg@mail.gmail.com> <AEDD581A-9F6F-4A5A-B46A-42343F0E2DE1@arm.com>
In-Reply-To: <AEDD581A-9F6F-4A5A-B46A-42343F0E2DE1@arm.com>
From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Date: Wed, 22 May 2024 13:15:37 -0600
X-Gmail-Original-Message-ID: <CAHMutrbsM_2dWPAQ9uUFxuqQkg+78LJEdxfEFTyv0J4P1ADSTQ@mail.gmail.com>
Message-ID: <CAHMutrbsM_2dWPAQ9uUFxuqQkg+78LJEdxfEFTyv0J4P1ADSTQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/4] tclibc-picolibc: Adds a new TCLIBC variant
 to build with picolibc as C library
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000031709206190fc344"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 19:15:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199764

--00000000000031709206190fc344
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 22 May 2024 at 04:30, Ross Burton <Ross.Burton@arm.com> wrote:

> On 21 May 2024, at 19:55, Alejandro Enedino Hernandez Samaniego <
> alejandro@enedino.org> wrote:
> > I did see that comment when I was trying to debug the issue with the
> early compiler tests, however, I couldn't find an easy way to inject
> skip_sanity_check=3Dtrue into the [properties] field in meson.cross and s=
ince
> exe_wrapper was still there I thought I'd just override it.
> >
> > Do you think it'd be better to modify the meson class, add a
> MESON_SANITY_CHECK ?=3D "" thats is written to the cross file all the tim=
e?,
> that way I can just override it on the recipe with
> MESON_SANITY_CHECK=3D"skip_sanity_check=3Dtrue" or something similar?
>
> I believe you can put eg no-checks.cross in SRC_URI that contains just:
>
> [properties]
> skip_sanity_check=3Dtrue
>
> and pass that with =E2=80=94cross-file=3Dno-checks.cross.


> Ross

I wasn't aware this was possible, thanks for the pointers!, sending v3

Cheers,

Alejandro

--00000000000031709206190fc344
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:arial,sans-serif;font-size:small"><br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 22 May 2024 =
at 04:30, Ross Burton &lt;<a href=3D"mailto:Ross.Burton@arm.com">Ross.Burto=
n@arm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On 21 May 2024, at 19:55, Alejandro Enedino Hernandez Samaniego =
&lt;<a href=3D"mailto:alejandro@enedino.org" target=3D"_blank">alejandro@en=
edino.org</a>&gt; wrote:<br>
&gt; I did see that comment when I was trying to debug the issue with the e=
arly compiler tests, however, I couldn&#39;t find an easy way to inject ski=
p_sanity_check=3Dtrue into the [properties] field in meson.cross and since =
exe_wrapper was still there I thought I&#39;d just override it.<br>
&gt; <br>
&gt; Do you think it&#39;d be better to modify the meson class, add a MESON=
_SANITY_CHECK ?=3D &quot;&quot; thats is written to the cross file all the =
time?, that way I can just override it on the recipe with MESON_SANITY_CHEC=
K=3D&quot;skip_sanity_check=3Dtrue&quot; or something similar?<br>
<br>
I believe you can put eg no-checks.cross in SRC_URI that contains just:<br>
<br>
[properties]<br>
skip_sanity_check=3Dtrue<br>
<br>
and pass that with =E2=80=94cross-file=3Dno-checks.cross.=C2=A0</blockquote=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Ross</blockquote><div><div class=3D"gmail_default" style=3D"font-family:ari=
al,sans-serif;font-size:small">I wasn&#39;t aware this was possible, thanks=
 for the pointers!, sending v3</div><div class=3D"gmail_default" style=3D"f=
ont-family:arial,sans-serif;font-size:small"><br></div><div class=3D"gmail_=
default" style=3D"font-family:arial,sans-serif;font-size:small">Cheers,</di=
v><div class=3D"gmail_default" style=3D"font-family:arial,sans-serif;font-s=
ize:small"><br></div><div class=3D"gmail_default" style=3D"font-family:aria=
l,sans-serif;font-size:small">Alejandro</div><br></div><div>=C2=A0</div></d=
iv></div>

--00000000000031709206190fc344--

