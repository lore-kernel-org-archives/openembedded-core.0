Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A2BFFC97F4
	for <webhook@archiver.kernel.org>; Sun, 29 Mar 2026 21:37:45 +0000 (UTC)
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37608.1774820261376014994
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Mar 2026 14:37:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=WKZzjLSg;
 spf=pass (domain: gmail.com, ip: 74.125.224.44, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-6501c4857b2so521020d50.3
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 14:37:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774820260; cv=none;
        d=google.com; s=arc-20240605;
        b=NXisF9qmjjWWaB1LY27rHx10PvjW84tFYv3Gp6bjoDZOYsv88nCkiwP6SrIICwFCzt
         a55OfymcQfu9EYVrObspElLBdT+Z6agua5P0bXG/rmZhIT/zN3jOjZ4XeO1QgdWvLnO3
         CF9pxbxoikYjPPM2Tbz1f1DalinL0jyTooFxwlBkDO6Rt6EsqRsZ7RQ2hJopM7c54owf
         cJNKEubhJxnpRwnvg2jZfkcUDMQ3AodJ6kgOidDJ9pUHdTlmuiBZajT95jf9z9dVqVqG
         hQ6n2VV6/wgiWH0gTYZ35DvlhckFUrK04leVl7jgy16SA8ee63eMRndby5t0i3/oFpBK
         B1dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9MfSL9pxWKVlbqmMcZwJ1vnwSQDQBNaaFfqfwf77+Ac=;
        fh=0Y9R6RW+TujUVknCHvzDWbkNmZo6Mmw6K3L/DV8ds+8=;
        b=BwMaefuengA/HEL6xg4HhMloPJIr5di5Y2t4QnKRlulN1tG2qZNqQSlM4dnArPPxSG
         cFwTBS8S6C7sQXm0XRhBmXIx0TEpRVl1wt9FmPmo+ztNwn1t68eE0FyGaatxdYo81wIA
         KeoJqP9tZB9ICvR7T2C3h9hOZr6GHQt4IxhsGRwEWmMxskyKAvzZBKZCALEB+FLgY0di
         LBb20U5X0WJwaiHHUlPRtYVVsp76CTbKzlrfb6LXx0RLlZCvcowhwKnEC0bIsoC074tM
         vYP/ZTRrm447WgaqJJd4uor6cPZY1DcUjFnpZcLR+n33EpNmmn4+1rqevpL4LQOI+m7q
         5cag==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774820260; x=1775425060; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9MfSL9pxWKVlbqmMcZwJ1vnwSQDQBNaaFfqfwf77+Ac=;
        b=WKZzjLSgIhPX4j0p9f9cMWZTGDq9Dj2LSX70skBTA9jGKCJm1oBl3CYrzTmF1XpkHU
         w79vQkfda4tfZzwba5/g3rsQ5WNizvW2d0ZV1g6+0vs+PSXm/5BXDUljIrGIc8X/Wizp
         XdtXs8c7ULIUCRMjuse0qgOwaqE0VFz0hikyAaT6rpVW75sBu/Bf+9iGMJcSn0y1HIGC
         x5otQS2oUnEZGdhJi4POHLIhmG4fgwExpE7GgbRLE9653JAHG4dJrZU9yqyQqBW2nECz
         UqLaTzwwIQKejQiwfbAuNoVSKVuIiRLSa/oqnqOWQWTwB+jAsZ6LxGh+GSga/GX4yp/S
         aAYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774820260; x=1775425060;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9MfSL9pxWKVlbqmMcZwJ1vnwSQDQBNaaFfqfwf77+Ac=;
        b=ZbaCk2t22NLcLv/hJUv3/vQwvRoghyia3LPn9yXCapzBPwpiJZKkUiEPcnNf+UScuH
         tvV47SJHQA3mnpoYGkvRUjzXrqHNRG/lm77WttKHGqlawJ4JJLu3Yg6wc7HWDirO4L5R
         iFiYrxzysrzRFQ2Pj0psflqYLma2/oEeNN9LwpZbscde8pEN+sHktiF/0fqdxeP6CXsR
         L+ayAbDVqBtN7RhmvjJy5heG1mOdVTlaB7lFwnm5NozFfafJserHhDpS31JTgDO6Dgwg
         A5Ywbb6xQuRteqE6/gpSQK90Gm6fGPQkfZdb4/xa1ROHipMtKgWbwW6BKBFfwhLSQWqv
         XSPg==
X-Gm-Message-State: AOJu0YwzrKOB+4dCxpt87kckTunyMMYx2eHB3QffoMxTdiMDbsmA+HJr
	7Ea4rbiNrbW0ASdbwmrLRWe/1GtGfzZzs8jF+6aHyrNsUoRr7/cKGYEbzgZKXSLhpfTxK551s1V
	5yEnnEyzt+DUu1LVvMa+1kmpWd1EcvNQ=
X-Gm-Gg: ATEYQzzgsVcwKbOYDlFhVEMdcIQIKwt0TusV896UqLV2hoTtvJImTpndHSlVbFuB3RC
	QUxTcBQypHfnieiEFCmrtXMd+GxO5TjxP0ooVF6S8KErBMq8FLvWv03C5jt5W8PPzXm21VeH2L5
	fmk5v5aRsRGlwRm8ZojS2TWokHhmWeQFidmB/WCkV82leOQkDevYlESDp/w7H6zkHO1OIbLC2pQ
	cgdxc8fFQ2tPOoDVTHcZAqtgUQPb7VK+99JehdgiJQvJBTVkrvGiNhaJYOo5qRXEGj7JKiw3tHg
	etgT/WrWS2DAZJUPQukKHMHn7hDw3LNFNUOGE0bRDVnEWjvmWLJaCZAkzMaX0ssWUk8ZGlB3Qd2
	OqRh2MnYe1sYw1wlBwoD2pvlk
X-Received: by 2002:a05:690e:b8b:b0:64f:fce5:c575 with SMTP id
 956f58d0204a3-64ffce5c8f9mr9953037d50.35.1774820260423; Sun, 29 Mar 2026
 14:37:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260326151641.3974221-1-khem.raj@oss.qualcomm.com>
 <DHDI32YKJSSP.MH33L7GOJJ1Q@bootlin.com> <CAMKF1soKLkhMZNSHTzrTcX8qSQYgFz20NgAzjN-ResCgG=Dg1g@mail.gmail.com>
 <CAMKF1sorE-KOXvC+n4RtcdU8S6nzcGiE1knTg==8+d3fX0SxSw@mail.gmail.com> <DHFGNKZCOKBA.37T7RS6DYRX8K@bootlin.com>
In-Reply-To: <DHFGNKZCOKBA.37T7RS6DYRX8K@bootlin.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 29 Mar 2026 14:37:13 -0700
X-Gm-Features: AQROBzAjJ76ssP_yuuW1WSK0GXsnqtHvpf06lt5Lzkola16bHVbUCMbmjPLJc3Y
Message-ID: <CAMKF1so=Wrt=0WXBjvoTVku=BOdy1Ki+5g_KA9_TXwSWPru2MA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 1/7] clang/llvm: Upgrade to 22.x major release
To: mathieu.dubois-briand@bootlin.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000029ad9d064e308bcb"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 21:37:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234156

--00000000000029ad9d064e308bcb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 29, 2026 at 11:00=E2=80=AFAM Mathieu Dubois-Briand via
lists.openembedded.org <mathieu.dubois-briand=3D
bootlin.com@lists.openembedded.org> wrote:

> On Sat Mar 28, 2026 at 3:39 AM CET, Khem Raj wrote:
> > Hi Mathieu
> >
> > I have pushed another change to address install-but-unpackaged QA warni=
ng
> > since the last fix. Please pick up the branch again if you have done it
> > after my last message.
> >
> > qemux86-world is green with this change see
> >
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/builds/3494
> >
>
> Sorry, I believe I was not quick enough to pick your commits and your
> branch moved. Accordimg to your build, it should be commit
> 52bd0b095528fb211ff9c2e8911d65509917a2fe, right?
>
> Can you push it in a named branch?
>

https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dkraj/clang-=
22
is still current with the patches. Richard has picked them into master-next
as well.


>
> Also, I can take it for testing, but I feel like you still need to post
> the patches here before they are merged.
>
> Thanks,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#234155):
> https://lists.openembedded.org/g/openembedded-core/message/234155
> Mute This Topic: https://lists.openembedded.org/mt/118520123/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000029ad9d064e308bcb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Mar 29,=
 2026 at 11:00=E2=80=AFAM Mathieu Dubois-Briand via <a href=3D"http://lists=
.openembedded.org">lists.openembedded.org</a> &lt;mathieu.dubois-briand=3D<=
a href=3D"mailto:bootlin.com@lists.openembedded.org">bootlin.com@lists.open=
embedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">On Sat Mar 28, 2026 at 3:39 AM CET, Khem Raj wrote:<br>
&gt; Hi Mathieu<br>
&gt;<br>
&gt; I have pushed another change to address install-but-unpackaged QA warn=
ing<br>
&gt; since the last fix. Please pick up the branch again if you have done i=
t<br>
&gt; after my last message.<br>
&gt;<br>
&gt; qemux86-world is green with this change see<br>
&gt;<br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/59=
/builds/3494" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoct=
oproject.org/valkyrie/#/builders/59/builds/3494</a><br>
&gt;<br>
<br>
Sorry, I believe I was not quick enough to pick your commits and your<br>
branch moved. Accordimg to your build, it should be commit<br>
52bd0b095528fb211ff9c2e8911d65509917a2fe, right?<br>
<br>
Can you push it in a named branch?<br></blockquote><div><br></div><div><a h=
ref=3D"https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dkraj=
/clang-22">https://git.openembedded.org/openembedded-core-contrib/log/?h=3D=
kraj/clang-22</a><br></div><div>is still current with the patches. Richard =
has picked them into master-next as well.</div><div>=C2=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
<br>
Also, I can take it for testing, but I feel like you still need to post<br>
the patches here before they are merged.<br>
<br>
Thanks,<br>
Mathieu<br>
<br>
-- <br>
Mathieu Dubois-Briand, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#234155): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/234155" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/234155</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118520123/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118520123/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000029ad9d064e308bcb--

