Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE8D3C77B7D
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 19:25:10 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.4692.1683314706300482705
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 May 2023 12:25:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Wnh+e0NP;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-4ec8133c59eso2514054e87.0
        for <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 12:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683314704; x=1685906704;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gkqk7LAIXHMUM1ZiVNaPhWP6mpxIdbejarhM+JDJsKQ=;
        b=Wnh+e0NPFgVHqBdODe4+U+R1owm4WN6Dd7fXWLo1hQjDEQpPE0owqmrE4PyAisNV7x
         A6CkJllLgz3kDXXcaD9vdoSFwBbphwxGkyOSJPy84ThUqhX/NWalPA5pwnfIPSBWAhBV
         YQYpS0g2Ov16C9RXU/wEqHqXwb3ffD4x4odwsFwzhBi8MLuJaSQvm17DXfkDnn6q/4v6
         YIiGX9z6pHTjg65u0etEqZdyJJrqcsscdGstoYLbepPom+DnoNTVQqGu5V4f3jHuWXop
         tM3XuT5nF7FmOaNkgqkeyTIBgUYoeKBhlQpShiXfkz5z33zIXWLQU+2G3RolLQYe7RB6
         qRYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683314704; x=1685906704;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gkqk7LAIXHMUM1ZiVNaPhWP6mpxIdbejarhM+JDJsKQ=;
        b=bWO/hutcwomk2iGwJviYYBvc6z8M3J4AsehX/83qmOcoS+F+aIuDbQQbxUGrsjso+p
         hvUL4TeE82p9MHzMTPmXC/mwYupRKZVQr0DmLiwLrq53UGofTVlKJ7Wf5vaBwFojJLuH
         ljEHstLQtG9sds2FwfZKYTOqLViPt12skx/EWTlyOYf2uSK1J23rKItZTA7hV31vcZtO
         eJStfg81pg+LX9gv0rudg/54ahZK74cUzc+Xndt32l4Wu6UbI/qQLSa0XmqhnpCrhRkV
         uns5Wp3RbhysnOVU426ncAQgcv7VEnZPC/AQk5sNY0xSFmim07Q8d/gpiZj+QJGq0D15
         sZAw==
X-Gm-Message-State: AC+VfDw3AhKcaXG6inBDz2X1iDVVWpLn67LHjcgJ1C2Zmf+HNLtg0tyz
	PBAJXeUINF0J4bkU+OS8ulMWStg3QDkTkeGBgCE=
X-Google-Smtp-Source: ACHHUZ7Cgftl/NLtWs+tT0N5I/iwAeNx+8M17t+m6FQPevN1EzhPH/weBPRchL4ThufaFVXjkgRn3vxfnwzmNCdiaTs=
X-Received: by 2002:ac2:44a4:0:b0:4f1:5015:43c4 with SMTP id
 c4-20020ac244a4000000b004f1501543c4mr13786lfm.38.1683314704300; Fri, 05 May
 2023 12:25:04 -0700 (PDT)
MIME-Version: 1.0
References: <CA+cAkeqg4CdA5F73-z1dXLvQHz+2HqiDRQPC9ndTZM89BAmmaA@mail.gmail.com>
 <CANNYZj-q+5jxDxWDp_4B2kD4NVqWA-Fok2wuTUiLzzsO_5iYYw@mail.gmail.com>
 <CA+cAkeqLrwgk4e-Lzk0e_k8AFKCT6nqSY7+JQNZ-fPbarK0ngw@mail.gmail.com> <CANNYZj-KzKuu345y6nqk0r+Xch6z8oh9uGQvtDLK5PMNa-4V5A@mail.gmail.com>
In-Reply-To: <CANNYZj-KzKuu345y6nqk0r+Xch6z8oh9uGQvtDLK5PMNa-4V5A@mail.gmail.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Fri, 5 May 2023 21:24:52 +0200
Message-ID: <CA+cAkepkS5PT1gtsCe5jbHC2e_naR+b-w_vLLqAgLJSbrsMOWg@mail.gmail.com>
Subject: Re: [OE-core] Contributing, how it works?
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000fec10f05faf73e2f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 19:25:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180975

--000000000000fec10f05faf73e2f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 5 May 2023 at 21:05, Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> On Fri, 5 May 2023 at 20:26, Fr=C3=A9d=C3=A9ric Martinsons
> <frederic.martinsons@gmail.com> wrote:
> > That's what I did for unit test of rust recipes and I didn't get much
> comments beside you and khem 15 days ago. And I still don't know if my
> patches are an issue or if nobody had the time to look at them, it's pret=
ty
> frustrating.
>
> They've been merged to master I think? Can you check that by
> fetch/rebase? Yes, there is no separate notice when it happens, and
> it's frustrating to first time contributors, but again, someone needs
> to sit down and write an email bot to do the job.
>

yes, after re-checking, my commits have been merged this morning. I would
like to know more about "write an email bot to do the job" because
having a submission accepted by maintainers and merged is some kind of
"reward" (the only one when we are a fresh submitter to the project).
And having a reward is motivating to contribute more.

> I would like to know about these, I hear a lot in this list about
> autobuilder and it seems close to what I know of continuous integration
> (some build of multiple configuration with the submitted patch and tests
> towards that) but I don't know how to replicate the config of those local=
ly
> on my machine (in case of errors), do you have any links for that?
> >
>
> You probably should to start with reading
> https://docs.yoctoproject.org/test-manual/index.html ?
>
> > Ah great, if you point me to where I can find insights about this
> patchset test framework, I would gladly offer my help to fox the issue.
> From what you are saying, I understand that fixing this will make the
> contribution smoothier.
>
> That you should discuss with Trevor.
>
> Alex
>

--000000000000fec10f05faf73e2f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, 5 May 2023 at 21:05, Alexande=
r Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">On Fri, 5 May 2023 at 20:26, Fr=C3=A9d=C3=A9ric Martinsons<br>
&lt;<a href=3D"mailto:frederic.martinsons@gmail.com" target=3D"_blank">fred=
eric.martinsons@gmail.com</a>&gt; wrote:<br>
&gt; That&#39;s what I did for unit test of rust recipes and I didn&#39;t g=
et much comments beside you and khem 15 days ago. And I still don&#39;t kno=
w if my patches are an issue or if nobody had the time to look at them, it&=
#39;s pretty frustrating.<br>
<br>
They&#39;ve been merged to master I think? Can you check that by<br>
fetch/rebase? Yes, there is no separate notice when it happens, and<br>
it&#39;s frustrating to first time contributors, but again, someone needs<b=
r>
to sit down and write an email bot to do the job.<br></blockquote><div><br>=
</div><div>yes, after re-checking, my commits have been merged this morning=
. I would like to know more about &quot;write an email bot to do the job&qu=
ot; because</div><div>having a submission accepted by maintainers and merge=
d is some kind=C2=A0of &quot;reward&quot; (the only one when we are a fresh=
 submitter to the project).</div><div>And having a reward is motivating to =
contribute more.</div><div><br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
&gt; I would like to know about these, I hear a lot in this list about auto=
builder and it seems close to what I know of continuous integration (some b=
uild of multiple configuration with the submitted patch and tests towards t=
hat) but I don&#39;t know how to replicate the config of those locally on m=
y machine (in case of errors), do you have any links for that?<br>
&gt;<br>
<br>
You probably should to start with reading<br>
<a href=3D"https://docs.yoctoproject.org/test-manual/index.html" rel=3D"nor=
eferrer" target=3D"_blank">https://docs.yoctoproject.org/test-manual/index.=
html</a> ?<br>
<br>
&gt; Ah great, if you point me to where I can find insights about this patc=
hset test framework, I would gladly offer my help to fox the issue. From wh=
at you are saying, I understand that fixing this will make the contribution=
 smoothier.<br>
<br>
That you should discuss with Trevor.<br>
<br>
Alex<br>
</blockquote></div></div>

--000000000000fec10f05faf73e2f--

