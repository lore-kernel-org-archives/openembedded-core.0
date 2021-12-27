Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16E17C433F5
	for <webhook@archiver.kernel.org>; Mon, 27 Dec 2021 14:05:30 +0000 (UTC)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com
 [209.85.222.49])
 by mx.groups.io with SMTP id smtpd.web09.26520.1640613929126626533
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Dec 2021 06:05:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Wkk7b37P;
 spf=pass (domain: gmail.com, ip: 209.85.222.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f49.google.com with SMTP id t18so19510965uaj.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Dec 2021 06:05:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d1mx0vvp7488vDYsIYPSHQnR/ReKK9FWm7j1OUbtIvE=;
        b=Wkk7b37PhsOALpcVp/0KuiwvZgzzVeROaacfiOVwE8u3rk/3DPEJYOBN7ZHHWGdXAd
         VjCz4UCCYSRIEIOW9oMms8OWvOYbX+UqnVlE7KubJX0JUCktgEdAQBixymuFt3Kzj6Y9
         /I1iiYY+SHvlgW8XJOPsQ4pBuxrZes+bBJDJn5FSuJHmskQEI7lL3kn6gZTSZf1VCfxh
         b1A7DC8Zg20CoDe+VJPQRVZcho4yr1nGeJRfEfRuqeCKgyONBt/v2QG1vWay5PW2PMEb
         LxlVyKermLqgAHY9cHW3zvXXAhnzLFKwc915fZ/mZp0Vzho++sJj6v8XG+XyYXFtmkUt
         mLfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d1mx0vvp7488vDYsIYPSHQnR/ReKK9FWm7j1OUbtIvE=;
        b=iEnsXvfz0Gy96ktebid1gW9jQNopoyuzWJyth631mLqbHvEypw9S3cnG37h0eAS9n3
         M7k2ziLEH+QOaOiPt9ImesQAswv3VAzZYnq3w9nuN/Z5hx48JwiDc7FK+rmA2REOYH26
         SCyNdZ5rgnZmAHdb8aJoDFJDqzUS0oatEz5VvJ05y/hJq4Y0gNkoeU1fUmknM3EkQRPj
         axyhYlYxUcUpPVXq8ZvUw1YzYCBZRDaPjMc7oI2ulSrYcrno6qhYJjFfmIaKCHvqst+X
         11X5KZw8sdkgxeauNovDdaHRfBwsiEt+V+8guGNrERiLOk8sRaDSZ9+lPmcatbj25vaN
         b19A==
X-Gm-Message-State: AOAM530u1IK174ZtMpB/KVrK95HzKGBQNHJxz8qUutSo8GqglLhpmqpz
	E0o+jP5525q/uuCcsxU1ECrTeWdCI6THT3p2oDA=
X-Google-Smtp-Source: 
 ABdhPJxy0C7W6CmEhP/ELZZFfTAr+hCButfjSELDukrObHojgBr92gh0oErHrEvb13Pc8tUIWFv/aA/8nK8Ia/hGm/0=
X-Received: by 2002:ab0:6f4b:: with SMTP id r11mr487358uat.93.1640613928063;
 Mon, 27 Dec 2021 06:05:28 -0800 (PST)
MIME-Version: 1.0
References: <20211222232035.1036830-1-richard.purdie@linuxfoundation.org>
 <CAMKF1sotV_QuheVfSyCBndQiKr_suBEnzDuWfExf=LgfT0yRww@mail.gmail.com>
 <3cf5e25c0e49befed250ec01f58a6ed086e4b65c.camel@linuxfoundation.org>
 <AM9PR09MB46425B8EEB7D75744A976E6EA87F9@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <12b2ffb4-5758-e80f-9515-a8d4ac078c9d@herbrechtsmeier.net>
 <CANNYZj-XR2XzOwnfPTN74mG1QiWcbE96+-iAb-VL7fYta9YA_w@mail.gmail.com>
 <5f6b7b04-7570-5662-e00d-6a8212b1bcee@herbrechtsmeier.net>
In-Reply-To: <5f6b7b04-7570-5662-e00d-6a8212b1bcee@herbrechtsmeier.net>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 27 Dec 2021 15:05:16 +0100
Message-ID: 
 <CANNYZj-Qr6PfiE+aESmUTREc87FR3sTHnYeiNk-aqEOsnvQJSQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] base/patch: Disable network for
 unpack/patch/configure/compile/install
To: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
Cc: Konrad Weihmann <kweihmann@outlook.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
 Khem Raj <raj.khem@gmail.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000065598405d421323f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Dec 2021 14:05:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160025

--00000000000065598405d421323f
Content-Type: text/plain; charset="UTF-8"

On Mon, 27 Dec 2021 at 14:38, Stefan Herbrechtsmeier <
stefan@herbrechtsmeier.net> wrote:

> > I tend to think that the best (and the hardest) option is to improve
> > these tools so that they're usable inside do_fetch (e.g. fulfil the
> > caching/reproducibility criteria for a bitbake fetcher), and the needed
> > changes are acceptable to upstreams.
>
> Is the fetcher really the problem? In all cases the input and output of
> the package manager fetch task is well defined. In the npm case the
> bitbake npmsw fetcher and my recipetool approach translate this
> configuration into bitbake fetch and unpack commands.
>
> The real problem is the different philosophy between OE and the package
> manager. The package manager doesn't care about duplicate versions,
> maintenance versions, version updates of indirect dependencies, license
> compliance, CVE checks or dead code (examples, documentations, test,
> ...) and if they care every package manager have its own solution.
>

I feel that ship has sailed. The rest of the world has already chosen the
self-contained bundling via custom language-specific package management.
Keeping up with that via custom reimplementations of those tools will be a
never ending maintenance burden; I'd rather directly use the tools that
everyone else does. It's all open source and can be fixed.


> Why C/C++ and Python doesn't fetch all its dependencies inside a single
> recipe and why do we try to replace embedded dependencies? I think we
> have good reasons for it and we shouldn't discard it for other languages.
>

C/C++ is kind of moving that way too. Meson already has support for it; so
far it's optional, but it does exist. The reason you can still do manual
dependency management there is that those environments are from a different
era, and carry a lot of inertia.

Alex

--00000000000065598405d421323f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Mon, 27 Dec 2021 at 14:38, Stefan Herbrechtsmeier &lt;<a href=3D"=
mailto:stefan@herbrechtsmeier.net">stefan@herbrechtsmeier.net</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">&gt; I tend to=
 think that the best (and the hardest) option is to improve <br>
&gt; these tools so that they&#39;re usable inside do_fetch (e.g. fulfil th=
e <br>
&gt; caching/reproducibility criteria for a bitbake fetcher), and the neede=
d <br>
&gt; changes are acceptable to upstreams.<br>
<br>
Is the fetcher really the problem? In all cases the input and output of <br=
>
the package manager fetch task is well defined. In the npm case the <br>
bitbake npmsw fetcher and my recipetool approach translate this <br>
configuration into bitbake fetch and unpack commands.<br>
<br>
The real problem is the different philosophy between OE and the package <br=
>
manager. The package manager doesn&#39;t care about duplicate versions, <br=
>
maintenance versions, version updates of indirect dependencies, license <br=
>
compliance, CVE checks or dead code (examples, documentations, test, <br>
...) and if they care every package manager have its own solution.<br></blo=
ckquote><div><br></div><div>I feel that ship has sailed. The rest of the wo=
rld has already chosen the self-contained bundling via custom language-spec=
ific package management. Keeping up with that via custom reimplementations =
of those tools will be a never ending maintenance burden; I&#39;d rather di=
rectly use the tools that everyone else does. It&#39;s all open source and =
can be fixed.<br></div><div>=C2=A0<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
Why C/C++ and Python doesn&#39;t fetch all its dependencies inside a single=
 <br>
recipe and why do we try to replace embedded dependencies? I think we <br>
have good reasons for it and we shouldn&#39;t discard it for other language=
s.<br></blockquote><div><br></div><div>C/C++ is kind of moving that way too=
. Meson already has support for it; so far it&#39;s optional, but it does e=
xist. The reason you can still do manual dependency management there is tha=
t those environments are from a different era, and carry a lot of inertia.<=
/div><div><br></div><div>Alex<br></div><div>=C2=A0</div><br></div></div>

--00000000000065598405d421323f--

