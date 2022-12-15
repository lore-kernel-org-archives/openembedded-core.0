Return-Path: <alejandro@enedino.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ED4EC4167B
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 18:12:13 +0000 (UTC)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
 by mx.groups.io with SMTP id smtpd.web11.141727.1671127924053142329
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 10:12:04 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.166.53, mailfrom: aehs29@gmail.com)
Received: by mail-io1-f53.google.com with SMTP id z144so37809iof.3
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 10:12:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s878cZ3c7NuXHE+uNxR7M03ashyIZERl+f/uKqqh+K0=;
        b=gPEh1O+J3n24d/3GG2nyTSfRRg3Gg8pqTlH/59wLlDvPFi4AzVZgAOh3C6Mds3+F8H
         GleIQTgYmeVUdlj8tCbK80Z6xWiCGDAaMEoG+m14AkhrWIIR9ikUAY79wybst/g8F4hJ
         7hcMWNtR+Bp6zT8YuqKY7rfv6pXMKJ0uxHbaPeoPI4Op6cQwVfqywrq36ZBKj+bBmALz
         Oqb7KaaSKKcOMS9Bnw52+UqjKd3M1bn7WIrQsbHRvvc6oQl7xPvcfunTA+Tzbb4INlCy
         PWDnOVTcjgQT0uh7T9tLvz2gsTNdZKlddKqg8a6LYS6LqaffpNA8L6pnwvhSW+0K4oAg
         Rlyw==
X-Gm-Message-State: ANoB5pk1FCM/1q59L7mAi091ZYIoM3teJSdPAmknGiwfhmB/hy2phYF8
	NIXcT2h+SOeevU632yrGkg277vA4wR6eIw==
X-Google-Smtp-Source: AA0mqf7pjSDhKACVek4CwEMOGpp3gXN1ig4qP/Ct7zGyvL1RkisNCDiFKY28H5q4oGcoo1i/YD9iHg==
X-Received: by 2002:a05:6602:2255:b0:6e2:c5e0:4c68 with SMTP id o21-20020a056602225500b006e2c5e04c68mr16956994ioo.13.1671127923090;
        Thu, 15 Dec 2022 10:12:03 -0800 (PST)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com. [209.85.166.171])
        by smtp.gmail.com with ESMTPSA id d8-20020a0566022d4800b006e00556dc9esm1341022iow.16.2022.12.15.10.12.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Dec 2022 10:12:02 -0800 (PST)
Received: by mail-il1-f171.google.com with SMTP id o13so33679ilc.7
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 10:12:02 -0800 (PST)
X-Received: by 2002:a05:6e02:1d84:b0:302:ce48:40ee with SMTP id
 h4-20020a056e021d8400b00302ce4840eemr34176336ila.157.1671127922637; Thu, 15
 Dec 2022 10:12:02 -0800 (PST)
MIME-Version: 1.0
References: <20221215073224.3061128-1-alejandro@enedino.org>
 <CANNYZj9qbT+fGQ=18hjLkzR4D=eyr1amX2qxpwM5u_XQTqLo3g@mail.gmail.com>
 <CAHMutrae2sCtGqa-aXVYz1_kDkCtnY2qjKLhGunA-U3-ZxthnA@mail.gmail.com>
 <CAO5Uq5S2reaaVJe7hZwL2okWjKBbVhU_=g6bMjguQ7T9UNC-Vw@mail.gmail.com>
 <CAHMutrZnL2e4_7AuPkacEb-Rgyw0cb7eaErjWRuXZYXu_fUZgw@mail.gmail.com>
 <1731096B411C6A99.9432@lists.openembedded.org> <CANNYZj9BmxffYxhd1gWy6dUBcsjHi6kXgswC=4LVXUnePSOo1w@mail.gmail.com>
In-Reply-To: <CANNYZj9BmxffYxhd1gWy6dUBcsjHi6kXgswC=4LVXUnePSOo1w@mail.gmail.com>
From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Date: Thu, 15 Dec 2022 11:11:51 -0700
X-Gmail-Original-Message-ID: <CAHMutrZhNPdLoiFTfOVvHiqqeYwSOyPB3v2qmmy7BUoraj=GZg@mail.gmail.com>
Message-ID: <CAHMutrZhNPdLoiFTfOVvHiqqeYwSOyPB3v2qmmy7BUoraj=GZg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] rust: Enable building rust from stable,
 beta and nightly channels
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Alex Kiernan <alex.kiernan@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000034067205efe1ca74"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 18:12:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174589

--00000000000034067205efe1ca74
Content-Type: text/plain; charset="UTF-8"

On Thu, 15 Dec 2022 at 11:03, Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> On Thu, 15 Dec 2022 at 19:01, Alexander Kanavin via
> lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
> wrote:
> > Ok, I think what we should do first is to actually drop the version
> > from all of the .bb file names, and set it once, inside some .inc, and
> > probably next to SRC_URI and tarball checksum. Then this should allow
> > a convenient scheme for including and overriding things.
> >
> > rust_1.65.0.bb - > rust.bb, and so on.
>
> Oh, and upstream version checks must be kept functional. It needs to
> both correctly report a newer version, and match the recipe version
> with upstream if it is already the latest.
>
> Alex
>

How should I test that upstream checks are still functional?

--00000000000034067205efe1ca74
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:arial,sans-serif;font-size:small"><br></div></div><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr"><span class=3D"gmail_defau=
lt" style=3D"font-family:arial,sans-serif;font-size:small"></span>On Thu, 1=
5 Dec 2022 at 11:03, Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@g=
mail.com">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Thu, 15 Dec 2022 at 19:01, Alexander Ka=
navin via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> &lt;alex.kanavin=3D<a href=3D"mailto:gmail.c=
om@lists.openembedded.org" target=3D"_blank">gmail.com@lists.openembedded.o=
rg</a>&gt;<br>
wrote:<br>
&gt; Ok, I think what we should do first is to actually drop the version<br=
>
&gt; from all of the .bb file names, and set it once, inside some .inc, and=
<br>
&gt; probably next to SRC_URI and tarball checksum. Then this should allow<=
br>
&gt; a convenient scheme for including and overriding things.<br>
&gt;<br>
&gt; <a href=3D"http://rust_1.65.0.bb" rel=3D"noreferrer" target=3D"_blank"=
>rust_1.65.0.bb</a> - &gt; <a href=3D"http://rust.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">rust.bb</a>, and so on.<br>
<br>
Oh, and upstream version checks must be kept functional. It needs to<br>
both correctly report a newer version, and match the recipe version<br>
with upstream if it is already the latest.<br>
<br>
Alex<br></blockquote><div><br></div><div class=3D"gmail_default" style=3D"f=
ont-family:arial,sans-serif;font-size:small">How should I test that upstrea=
m checks are still functional?</div><div class=3D"gmail_default" style=3D"f=
ont-family:arial,sans-serif"><br></div><br class=3D"gmail-Apple-interchange=
-newline"><div class=3D"gmail_default" style=3D"font-family:arial,sans-seri=
f;font-size:small"></div></div></div>

--00000000000034067205efe1ca74--

