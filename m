Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8006EE784AF
	for <webhook@archiver.kernel.org>; Mon,  9 Oct 2023 22:20:03 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.77033.1696890000766051555
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Oct 2023 15:20:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=2nYe0lBi;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.48, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-533f193fc8dso8778887a12.2
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Oct 2023 15:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696889999; x=1697494799; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Tv7pDQL1tW0Pqc4mgawyfUBkvWWd58haG6Uy46H/M3M=;
        b=2nYe0lBi07xQx0tN/ujNnMn5YaDk6hIkjObAgAgBFyg9ifTMdw0+HLQ/yc8GPgiVck
         W0a5y3BOXoQV6etncJJzX3kO7RVTdIqhEWtpGravxrbW3ec1W4lkLsY7lSxPXX6MWp7G
         WE8BGdhjTEugRPIIBtir2zUbbzl/ETxiwg5OE78D5M55I0inyveJ4tHmJbgWzw+3XDb6
         J5O3S/etUWBoGLOBQ5r5StRu0msSViVvc0Mt5ltJaLQe0hbdNRddv5w3SM9k7V/aygKh
         jxUCzDZxP1hFdTyG95Ye6xKydTE64FI/cE2mhQiFTFS0WeHH2uPD7gDLuYk7liShwgdD
         h6aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696889999; x=1697494799;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tv7pDQL1tW0Pqc4mgawyfUBkvWWd58haG6Uy46H/M3M=;
        b=BV/4cUCy3X6LV5fmkpu1PPQO4aSBkpnudSJvbif3J/wPO9WgFZVv7Tcv4tQ5K4avWM
         dYP+dZqJfgjO4ssPEH/ZF65y7sn3iGeNXP1LA2cG+QNv5afHdkPIcQ2K9IHRUm6f4Hjk
         Ur+SB3Hn8a1zPkHCHWg+H9iCUZ1pgvhJhNlCTGqixG/+nX2QJt1QE6su6GtYDL8lM95p
         q0aIRBdMvoTFrXr2oDDoza7LyXijeJe9oLWfEqg7RgtItxLSKfAEV1Y06Aj9JgFaIWIW
         1r2oceml6s+eWBI4EkO57FVrtHKIulYkzyI31uadaE03f7psCi+XwP1mtMe+RL1+NoIw
         7cGQ==
X-Gm-Message-State: AOJu0YyrejBzPnuToqFSxmc+NeShhjPXpjVC6lb3XTZQcrmdFozhvB5J
	LL/S5e492ry/QN/V9r1/L9Yj5KdUFHo+fmpgyh9r0Q==
X-Google-Smtp-Source: AGHT+IFauMwCP2iNHgjCw323eex9B+QfeA7Z1fGJuO7wolt805oCxyWm1GIvUkFKncLWqzSitPPi0vDPmm6DfCvgzvs=
X-Received: by 2002:a17:906:3103:b0:9ad:eb9c:dd00 with SMTP id
 3-20020a170906310300b009adeb9cdd00mr13406387ejx.12.1696889998928; Mon, 09 Oct
 2023 15:19:58 -0700 (PDT)
MIME-Version: 1.0
References: <20231009191935.202467-1-marex@denx.de> <CAOSpxdY8FfeUh-6Nj8AmyTVbRkN6_vX7eJrpFhtq2ZHt-seYYg@mail.gmail.com>
 <486a89a9-4fee-49b9-aa90-a4c396af3a50@denx.de>
In-Reply-To: <486a89a9-4fee-49b9-aa90-a4c396af3a50@denx.de>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 9 Oct 2023 12:19:49 -1000
Message-ID: <CAOSpxdaVEaQMh6zyCZnWexuK4xNEMBs2357Q2nrpVhRi_++_zA@mail.gmail.com>
Subject: Re: [dunfell][PATCH v2] gawk: Backport CVE-2023-4156 fix
To: Marek Vasut <marex@denx.de>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000009c020806074ffdbf"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Oct 2023 22:20:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188870

--0000000000009c020806074ffdbf
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 9, 2023, 11:37 AM Marek Vasut <marex@denx.de> wrote:

> On 10/9/23 23:15, Steve Sakoman wrote:
> > Sorry I didn't catch this earlier, but I stopped reviewing after
> > noticing the Signed-off-by omission.
>
> What Signed-off-by omission ?
>

Sorry, I meant the Upstream-Status omission in the first version of this
patch!

It's been a long Monday :-(

Steve

>
> > There was already a patch submitted for this CVE:
> >
> > https://lists.openembedded.org/g/openembedded-core/message/188624
>
> OK
>

--0000000000009c020806074ffdbf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Mon, Oct 9, 2023, 11:37 AM Marek Vasut &lt;<a href=
=3D"mailto:marex@denx.de">marex@denx.de</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex">On 10/9/23 23:15, Steve Sakoman wrote:<br>
&gt; Sorry I didn&#39;t catch this earlier, but I stopped reviewing after<b=
r>
&gt; noticing the Signed-off-by omission.<br>
<br>
What Signed-off-by omission ?<br></blockquote></div></div><div dir=3D"auto"=
><br></div><div dir=3D"auto">Sorry, I meant the Upstream-Status omission in=
 the first version of this patch!</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">It&#39;s been a long Monday :-(</div><div dir=3D"auto"><br></div>=
<div dir=3D"auto">Steve</div><div dir=3D"auto"><div class=3D"gmail_quote"><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">
<br>
&gt; There was already a patch submitted for this CVE:<br>
&gt; <br>
&gt; <a href=3D"https://lists.openembedded.org/g/openembedded-core/message/=
188624" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.opene=
mbedded.org/g/openembedded-core/message/188624</a><br>
<br>
OK<br>
</blockquote></div></div></div>

--0000000000009c020806074ffdbf--

