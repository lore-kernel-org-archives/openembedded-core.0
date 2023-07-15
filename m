Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02A6FEB64DC
	for <webhook@archiver.kernel.org>; Sat, 15 Jul 2023 13:00:23 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.11532.1689426022238617823
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jul 2023 06:00:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=PVklEBX9;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-4fba8f2197bso4790679e87.3
        for <openembedded-core@lists.openembedded.org>; Sat, 15 Jul 2023 06:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689426020; x=1692018020;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ICR3ZPcSIDk9WvIBTBmG+Qx7WvnYKc5bv4YRdNgWv60=;
        b=PVklEBX9h1xD/TLf8OMxF4a27WPqYXgd0iHN6ZFJIZNFxcQcaKmYfa8YhyrZoxv/1/
         4BMQ95e0wZ2tnrVFdlEahHemPRo9FxmnZ+Pfjiu3kEUYOufDbXiRtIbKzkDph9Qtk9+A
         rib1bzqgVvPOyldOnxoOGt4mgdgNvTPCgm6W2FTxUWZ+CSAu43o/22tpvH50ZG5c008P
         MtCBwQ3eO1cJPGII3aCZ8fLKj8vhrcdcAxrUlwA5Ylo9L/L32SrIDliqH1wKvT6MkY9Q
         7OJsZuSydNgbdVg8e9/K4zjjxeOeVijDNk4ZPnSMPUoImodSH0OJtosbqsmIhAldsqq5
         CERA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689426020; x=1692018020;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ICR3ZPcSIDk9WvIBTBmG+Qx7WvnYKc5bv4YRdNgWv60=;
        b=SNFlY8AzyM4u4/K7O6hA3G/6B6ZtbiSuUEK3BRpICPn1fBilXNeOseTvOwVjQM2rX8
         GwcXHjBSP6Urhz+WIG6COcrnu9hPBycabsnGJcVhNu2BiyHZKIdPad+kJzludvXT+bOl
         wG3PHA5e4VOoRuqoLYAT97CsxPqwHD0L3J5qs+Nrj62xHvdJ6BIUi6FU0UY91FWHWTb4
         ifx5ixsYNX2QaC3B2OHN8ghui1PinQhThYAZu5WL8apSmvVrw18aBVv3hEqvNcnZaVbW
         uvvbDdZH1uaLj7QzeDs6rj7RcbhI2THe7HYBHMsRTcPQA4A5YR+ODGbP4s3ojS+2xiDC
         dDCg==
X-Gm-Message-State: ABy/qLYBH4IbiLEkwE9yc1Wx2z9jP/BVX3MRP3SOOOne7sp7dlT3s1eu
	Qx6KLDzwD2mpScU35HFJejOlubWcjkikSSR1mWM=
X-Google-Smtp-Source: APBJJlFwSly0g/bMzV6zOfH6J8DXU0aFngQ1KYfi6wbQp2d3WK4lD5UhO1T689INtoqDpmr0jLNgyiYqs7UO3j/XMS8=
X-Received: by 2002:a05:6512:2813:b0:4fc:4f3e:9cbf with SMTP id
 cf19-20020a056512281300b004fc4f3e9cbfmr6754744lfb.50.1689426020094; Sat, 15
 Jul 2023 06:00:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230714161823.20685-1-festevam@gmail.com> <CANNYZj-8RV6tz_7kEH6uz=yZeyd=bPts6AoBqTd5DL3rGGu+yg@mail.gmail.com>
 <20230714213719.GX2066889@bill-the-cat> <CANNYZj8-vQbGEO3yMgRbk2j2L-XOc2EeG6=2w2GhFwUuZqD=mw@mail.gmail.com>
 <c851b7c8-892a-f592-56f1-a69bfa06c193@denx.de>
In-Reply-To: <c851b7c8-892a-f592-56f1-a69bfa06c193@denx.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 15 Jul 2023 16:00:08 +0300
Message-ID: <CANNYZj9o5B7y2yFYtHfwhv=KYk74+ZWqC-kuysP2qRY6ifhMeQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] u-boot: Switch to nobranch=1
To: Marek Vasut <marex@denx.de>
Cc: Fabio Estevam <festevam@gmail.com>, Fabio Estevam <festevam@denx.de>, Tom Rini <trini@konsulko.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000cd57790600862562"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jul 2023 13:00:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184311

--000000000000cd57790600862562
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

If you don=E2=80=99t list which branch a commit is on, it may be not in a b=
ranch at
all and not intended for downstream consumption, or on a private or
personal branch which is also not intended for private consumption.
Requiring to name the branch guards us from either possibility, and means I
do not have to go and check that manually or trust you blindly.

Alex

On Sat 15. Jul 2023 at 14.14, Marek Vasut <marex@denx.de> wrote:

> On 7/15/23 06:56, Alexander Kanavin wrote:
> > Then we=E2=80=99ll consider options, such as moving variable bits out o=
f .inc or
> > introducing a variable that strips last number from PV. I would want to
> > avoid recipes fetching from dangling branch-less commits in core. The
> > commit being on a branch is a QA check by the fetcher.
>
> What difference does it make whether the commit is in a branch or not ,
> as long as it is referenced ?
>

--000000000000cd57790600862562
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">If you don=E2=80=99t list which branch a commit is on, it=
 may be not in a branch at all and not intended for downstream consumption,=
 or on a private or personal branch which is also not intended for private =
consumption. Requiring to name the branch guards us from either possibility=
, and means I do not have to go and check that manually or trust you blindl=
y.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat 15. J=
ul 2023 at 14.14, Marek Vasut &lt;<a href=3D"mailto:marex@denx.de">marex@de=
nx.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;paddin=
g-left:1ex;border-left-color:rgb(204,204,204)">On 7/15/23 06:56, Alexander =
Kanavin wrote:<br>
&gt; Then we=E2=80=99ll consider options, such as moving variable bits out =
of .inc or<br>
&gt; introducing a variable that strips last number from PV. I would want t=
o<br>
&gt; avoid recipes fetching from dangling branch-less commits in core. The<=
br>
&gt; commit being on a branch is a QA check by the fetcher.<br>
<br>
What difference does it make whether the commit is in a branch or not , <br=
>
as long as it is referenced ?<br>
</blockquote></div></div>

--000000000000cd57790600862562--

