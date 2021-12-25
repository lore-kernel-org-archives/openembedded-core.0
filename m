Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA547C433F5
	for <webhook@archiver.kernel.org>; Sat, 25 Dec 2021 19:41:43 +0000 (UTC)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com
 [209.85.221.177])
 by mx.groups.io with SMTP id smtpd.web09.10155.1640461303014686503
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Dec 2021 11:41:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lUtgsSbk;
 spf=pass (domain: gmail.com, ip: 209.85.221.177,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f177.google.com with SMTP id m200so6449292vka.6
        for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Dec 2021 11:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LPythzHc274sBJVzHbwt1pMm7i98AFK7XzSJyUJI0jI=;
        b=lUtgsSbkdDgxoriARAYbsXr14yDx+1ns5dgxq2yOqLOx0+8n/AEksCuTyJ6macB/gF
         eGUJH+4XFsZCXRaztoKGufoDbscMGxHfaQsAzkzO3MQFfAI3+ypFqt+kdH6bg5IFE9cT
         Y/QKFUevtLuWLOtEsmJuBmZcIUyEEOmnyT7dfKx+CnjcL0X2CZMS+dKNMDj/97hjkGTd
         8wtLFlRWko/S2wekz2h1xk3hOW7BXCH6JqJ/ELKK7F7Wk1YNu2SnHtvws5/cgvyzhniR
         LgDMEtFmXt7VymRosv4DAgf/BplOYKo+RT3GjvdKopgGHHqsIpTLQKdWRk31iITXjbdx
         XFCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LPythzHc274sBJVzHbwt1pMm7i98AFK7XzSJyUJI0jI=;
        b=MP+JbpMw1EmC7x2Fi5eivcOtlryr7tT9IKDobWlHM+fzeTvVjpzYftypz+y7tAh4a3
         9rVoHKlct+S33NPn9n1ZJ5hSJXsgY6PcMnxun8W4xfunzn3Ir6q5MhYZok9IcP1uTL2y
         CFkJeV+0uE+OdtRv0kPvhMNn43JASIjAA9ebRlKezBvS4StXzXw00HKxIWalyA3YRtoh
         wu8uKAx0jmnmuVbf7rhOxGJLlNNTG1kQsaPM4d0iIh1oQvjPF0xyzDj0IVaQXGWRgD8q
         BQM776QnVaVBWR8wHSeUApYMx9+xHaCCB/A/oG3EU+ir9CNdMc8UMquRiULH/p58TLW1
         yI2w==
X-Gm-Message-State: AOAM531LH7JVcQzcLZuNMyMepkAWMZuYFtUosrbi/VuNXbexEs1+8mnV
	FCWeu+/dGSRGZTW4il7+ADE9LoMW+M0r0Ch29s0=
X-Google-Smtp-Source: 
 ABdhPJyzs3I6FVEFln9Dq4jFiieC53oPYKL8fPsDqT5we7fAL1KU7NJwM4ZPNXGYIfq4eRbr/AC8r9IJltR1qiVMYus=
X-Received: by 2002:ac5:cfc4:: with SMTP id m4mr3257291vkf.30.1640461302186;
 Sat, 25 Dec 2021 11:41:42 -0800 (PST)
MIME-Version: 1.0
References: <20211222232035.1036830-1-richard.purdie@linuxfoundation.org>
 <CAMKF1sotV_QuheVfSyCBndQiKr_suBEnzDuWfExf=LgfT0yRww@mail.gmail.com>
 <3cf5e25c0e49befed250ec01f58a6ed086e4b65c.camel@linuxfoundation.org>
 <AM9PR09MB46425B8EEB7D75744A976E6EA87F9@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <12b2ffb4-5758-e80f-9515-a8d4ac078c9d@herbrechtsmeier.net>
In-Reply-To: <12b2ffb4-5758-e80f-9515-a8d4ac078c9d@herbrechtsmeier.net>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 25 Dec 2021 20:41:30 +0100
Message-ID: 
 <CANNYZj-XR2XzOwnfPTN74mG1QiWcbE96+-iAb-VL7fYta9YA_w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] base/patch: Disable network for
 unpack/patch/configure/compile/install
To: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
Cc: Konrad Weihmann <kweihmann@outlook.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
 Khem Raj <raj.khem@gmail.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000002f46c105d3fda98a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Dec 2021 19:41:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160007

--0000000000002f46c105d3fda98a
Content-Type: text/plain; charset="UTF-8"

On Sat, 25 Dec 2021 at 20:32, Stefan Herbrechtsmeier <
stefan@herbrechtsmeier.net> wrote:

> > I'm not sure how to deal with that, so there aren't that many options
> here.
>
> This is a common problem for all language specific package managers
> (python / pip, Node.js / npm, Rust / Carge, go) and we need a common
> solution.
>

I tend to think that the best (and the hardest) option is to improve these
tools so that they're usable inside do_fetch (e.g. fulfil the
caching/reproducibility criteria for a bitbake fetcher), and the needed
changes are acceptable to upstreams.

Alex

--0000000000002f46c105d3fda98a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Sat, 25 Dec 2021 at 20:32, Stefan Herbrechtsmeier &lt;<a href=3D"=
mailto:stefan@herbrechtsmeier.net">stefan@herbrechtsmeier.net</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">&gt; I&#39;m n=
ot sure how to deal with that, so there aren&#39;t that many options here.<=
br>
<br>
This is a common problem for all language specific package managers <br>
(python / pip, Node.js / npm, Rust / Carge, go) and we need a common <br>
solution.<br></blockquote><div><br></div><div>I tend to think that the best=
 (and the hardest) option is to improve these tools so that they&#39;re usa=
ble inside do_fetch (e.g. fulfil the caching/reproducibility criteria for a=
 bitbake fetcher), and the needed changes are acceptable to upstreams.</div=
><div><br></div><div>Alex</div><br></div></div>

--0000000000002f46c105d3fda98a--

