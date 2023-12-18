Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C78AC35274
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 07:30:23 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.39584.1702884618123299628
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Dec 2023 23:30:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lFzp+Bi6;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40c3fe6c1b5so29611775e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 17 Dec 2023 23:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702884616; x=1703489416; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=azfl7nfI3txmNhh431+EbY2ifufjmLhjdqbDHmYs+eI=;
        b=lFzp+Bi65uhgy/F6OTyDMQG/eKrtRmMggZzf0voEXcmyjn818qjCas72ZHjPFeyNVK
         NbW0xasWV4+n1dndu7ij01qN1cmYdRVdvM9OuEwBTSrYeaEvzKNB02fMsnZ9yW5Oh7gv
         LGEuLIX3jHCcgnCKRVVjmRUjLDvudU4yPa/DHjG620AasfGPwE1ifW8Qq+KfNb9cPxnn
         sZTQTmX26G0RJsLJfBikTGSIiHf8IISqXPTsOkB4OqQmv4an+tvJmY2cPv1a1cFQ0Ii4
         fwXeoMHNTmiu0WZX+tIOHrzxkLLvxQOgGTXfXnjBCx9tbqJsZOwVO/bS7gnz1TjsBUC5
         TY8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702884616; x=1703489416;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=azfl7nfI3txmNhh431+EbY2ifufjmLhjdqbDHmYs+eI=;
        b=rG3amPfr/Pp+flr9ncYVD+W3whUY6CtQAXSCNWpN8DHeH5lWdA0rn98w6AJtkRXwyu
         6WPyHXYCbsc9cJN3XiJW/Qm8Ji+cNa0QAdSUJr9ZxI/cWlwtT9ZF4YLxAQmEPVDw8iNk
         6c6L0IXkfIlvbl9ZeNeDDr+RWXtt1q26xKox53W+AmcFoZ98xU+xDHoVIckPQqO+RNFf
         ftvekUk66VCTgeVjRLGjmL2mj5l7jvemuAiCzSmw2Md19CJeoHm16VQNqmttATHla1q1
         p9BmZdVZV9/1dBLBzODqxm/ZptDb6CEJl0nAk79baadTNH1Qdhl+Q9DsmqaavCuNwFhM
         WXbw==
X-Gm-Message-State: AOJu0YzH7zi6Oh3B9QaFo4uD+FlEITXr4D2It+8JKTQpheVxN6V89meZ
	4niS5xIbwj1lhUkRxH7GVdRvPpgFnePB1yxag3M=
X-Google-Smtp-Source: AGHT+IHBBsSxSKiHm8FhNWEN1GT4SGNQHLFL0odsUY73OEGWxpU40TXfKSSMDwaRQONomBT6uJgMAM5v61q4yztcnSc=
X-Received: by 2002:a05:600c:450e:b0:40c:2b2b:6414 with SMTP id
 t14-20020a05600c450e00b0040c2b2b6414mr7209723wmo.100.1702884616197; Sun, 17
 Dec 2023 23:30:16 -0800 (PST)
MIME-Version: 1.0
References: <20231205063249.3433-1-victor.kamensky7@gmail.com>
 <CA+chaQeUbSV49rXVnbfbQ3f_5z8b2iizZxh1_YVogWWpwL255g@mail.gmail.com>
 <CAHSqoWuSCbwhKKpBCnMxp4TxH4Yi0gyujPYXZpW6FFB-UtDywg@mail.gmail.com>
 <17A0859025DAC108.11381@lists.openembedded.org> <CA+chaQez7yu1qJKjLRKAqT+JRZhfyYr+TnW6Xr7FVj6Rhk06ZA@mail.gmail.com>
 <CAHSqoWufTcSYG1wGDDU-NPPGN+sgOA43fxc6UM94tRRjLtExgg@mail.gmail.com>
In-Reply-To: <CAHSqoWufTcSYG1wGDDU-NPPGN+sgOA43fxc6UM94tRRjLtExgg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 18 Dec 2023 08:30:02 +0100
Message-ID: <CA+chaQeT8OEM4Kx0VDHNhVVvyzOZSd4gEHDeZ3opv4S84ispaQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] systemtap: upgrade 4.9 -> 5.0
To: Victor Kamensky <victor.kamensky7@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000a45bb9060cc3b899"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 07:30:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192607

--000000000000a45bb9060cc3b899
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 18, 2023 at 7:16=E2=80=AFAM Victor Kamensky <victor.kamensky7@g=
mail.com>
wrote:

> On Thu, Dec 14, 2023 at 6:27=E2=80=AFAM Martin Jansa <martin.jansa@gmail.=
com>
> wrote:
> >
> > PACKAGECONFIG:remove:pn-elfutils =3D "debuginfod"
> > PACKAGECONFIG:remove:pn-elfutils =3D "libdebuginfod"
> > PACKAGECONFIG:remove:pn-binutils =3D "debuginfod"
> >
> > in local.conf is the easiest way to reproduce it.
> >
> > The one for binutils isn't strictly needed (but target binutils will
> fail as well when debuginfod is disabled in elfutils and enabled in
> binutils).
>
> Thanks, Martin. I was able to reproduce it with removing debuginfod
> from DISTRO_FEATURES_DEFAULT
>
> Submitted patches to systemtap mailing list:
> https://sourceware.org/pipermail/systemtap/2023q4/027914.html
> https://sourceware.org/pipermail/systemtap/2023q4/027915.html
>
> And to oe-core:
>
> https://lists.openembedded.org/g/openembedded-core/message/192600?p=3D%2C=
%2C%2C20%2C0%2C0%2C0%3A%3Acreated%2C0%2CVictor+Kamensky%2C20%2C2%2C0%2C1032=
38308
>
> https://lists.openembedded.org/g/openembedded-core/message/192601?p=3D%2C=
%2C%2C20%2C0%2C0%2C0%3A%3Acreated%2C0%2CVictor+Kamensky%2C20%2C2%2C0%2C1032=
38309
>
> Appreciate reporting the issue!
>

Thanks for the fixes! They LGTM.

--000000000000a45bb9060cc3b899
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, Dec 18, 2023 at 7:16=E2=80=AFAM V=
ictor Kamensky &lt;<a href=3D"mailto:victor.kamensky7@gmail.com">victor.kam=
ensky7@gmail.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">On Thu, Dec 14, 2023 at 6:27=E2=
=80=AFAM Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" target=
=3D"_blank">martin.jansa@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; PACKAGECONFIG:remove:pn-elfutils =3D &quot;debuginfod&quot;<br>
&gt; PACKAGECONFIG:remove:pn-elfutils =3D &quot;libdebuginfod&quot;<br>
&gt; PACKAGECONFIG:remove:pn-binutils =3D &quot;debuginfod&quot;<br>
&gt;<br>
&gt; in local.conf is the easiest way to reproduce it.<br>
&gt;<br>
&gt; The one for binutils isn&#39;t strictly needed (but target binutils wi=
ll fail as well when debuginfod is disabled in elfutils and enabled in binu=
tils).<br>
<br>
Thanks, Martin. I was able to reproduce it with removing debuginfod<br>
from DISTRO_FEATURES_DEFAULT<br>
<br>
Submitted patches to systemtap mailing list:<br>
<a href=3D"https://sourceware.org/pipermail/systemtap/2023q4/027914.html" r=
el=3D"noreferrer" target=3D"_blank">https://sourceware.org/pipermail/system=
tap/2023q4/027914.html</a><br>
<a href=3D"https://sourceware.org/pipermail/systemtap/2023q4/027915.html" r=
el=3D"noreferrer" target=3D"_blank">https://sourceware.org/pipermail/system=
tap/2023q4/027915.html</a><br>
<br>
And to oe-core:<br>
<a href=3D"https://lists.openembedded.org/g/openembedded-core/message/19260=
0?p=3D%2C%2C%2C20%2C0%2C0%2C0%3A%3Acreated%2C0%2CVictor+Kamensky%2C20%2C2%2=
C0%2C103238308" rel=3D"noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/g/openembedded-core/message/192600?p=3D%2C%2C%2C20%2C0%2C0%2C0%3A%=
3Acreated%2C0%2CVictor+Kamensky%2C20%2C2%2C0%2C103238308</a><br>
<a href=3D"https://lists.openembedded.org/g/openembedded-core/message/19260=
1?p=3D%2C%2C%2C20%2C0%2C0%2C0%3A%3Acreated%2C0%2CVictor+Kamensky%2C20%2C2%2=
C0%2C103238309" rel=3D"noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/g/openembedded-core/message/192601?p=3D%2C%2C%2C20%2C0%2C0%2C0%3A%=
3Acreated%2C0%2CVictor+Kamensky%2C20%2C2%2C0%2C103238309</a><br>
<br>
Appreciate reporting the issue!<br></blockquote><div><br></div><div>Thanks =
for the fixes! They LGTM.</div></div></div>

--000000000000a45bb9060cc3b899--

