Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB1AFC4725D
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 14:10:51 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.74620.1705932648866372610
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jan 2024 06:10:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j09wPQW5;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-336c8ab0b20so3203241f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 06:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705932647; x=1706537447; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dTaWAthDU3WigSQFPGGutLA2sIAaZWp4puOujfTcQZU=;
        b=j09wPQW5f+QTTIBqLduoaMI74wMDFdTtlOaJ0TrIzHcx57i72oAdOapCtZfXMoTqAQ
         bg7J+IqhggIatPYCj9N68H6BHyN2EevSvwKNvc6rsPLEmmGmsIdUdySP5uW3JqXEBfT8
         RQuNeMnsAdde93CrBKNdwDT9wIh6KPEKpon5Vv2lHXTUFHnHMCT4SREKsjHqMUCVCld3
         Ec7aHE/RhUiwfeB0JjYmA1Rty+c+I+nDSimh7dZ72dTCojS4qcHmhQDSlOxq7pBrux1y
         M+YJ/hUg+ZiVz4t508xascshVxlC0Ic77a++Qe573mXZC90wZNWg29S5QqsHJQJDUc4o
         7qzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705932647; x=1706537447;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dTaWAthDU3WigSQFPGGutLA2sIAaZWp4puOujfTcQZU=;
        b=fgvDaf6pbIcX/KiQuQ3znjyQBsfzKYWf7PSMGoBPFEf7Qyy2272fRozSL8eitcVz+X
         RWsldlw38x9dA8IByR7wbh3G6+pJ7ATMcrQa7jUkriovcSqivna4JRh17El0H4ndREIl
         6BREPCQcSK9SFzgzWrPcuNcOAaK1CTBa7yjkrsxMnlKYgihPYkgD88b01xkbzxgoJhmP
         6U/C4gIz21UttDddy8VL+jtdQvIh3kjgQ/dzDv0NE9V45fXQr7MuoTtwtsTrT/MufYtu
         IkikW6U2epD0pLSI3Yyc66RBi0BSjDplq+XQLKd7wBQ14xFLB7akxvT1clHv3h9/lYOJ
         5urw==
X-Gm-Message-State: AOJu0YxUL7YjtPYwO8yKgU6Ug+RauqgNq10w/76Myqalyi952WBeWHRx
	gQ4TKRUCCxXwVKMoxurOnljpMk72Nb2XN9f4/iOWzCMfUcwvsuV5UgHifdePE91ascrtHHdwVEm
	I4ReRRXGqo3w7Cjy1wOx1unEz/9I=
X-Google-Smtp-Source: AGHT+IFEVJgWM9q08ZdAgFM270PCLAp0vkmFCyMv6RzqTQUpavahFpGZInW38sczblRjLFpf7oGRcCDJNRUD0LDQ5+E=
X-Received: by 2002:a5d:540c:0:b0:337:bc85:5468 with SMTP id
 g12-20020a5d540c000000b00337bc855468mr2696799wrv.56.1705932647158; Mon, 22
 Jan 2024 06:10:47 -0800 (PST)
MIME-Version: 1.0
References: <20240122055232.2415989-1-pkj@axis.com> <f1722e2db188a3aec3ccc23fb573eaf2cae47eaa.camel@linuxfoundation.org>
In-Reply-To: <f1722e2db188a3aec3ccc23fb573eaf2cae47eaa.camel@linuxfoundation.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 22 Jan 2024 15:10:34 +0100
Message-ID: <CA+chaQeDWxKJuqv+zP4Xp1Gkt7NhEUb7+wf4dBgES06frP0q9w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] insane.bbclass: Allow the warning about
 virtual/ to be disabled
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000071d743060f896552"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 14:10:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194166

--00000000000071d743060f896552
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 22, 2024 at 3:02=E2=80=AFPM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Mon, 2024-01-22 at 06:52 +0100, Peter Kjellerstedt wrote:
> > Commit f673d3d239799fb1ab50f4aa5d44187666aa0cd7 introduced a warning fo=
r
> > virtual/ being used in RPROVIDES and RDEPENDS. Make it possible to
> > disable the warning by removing "virtual-slash from WARN_QA.
> >
> > Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > ---
> >  meta/classes-global/insane.bbclass | 13 +++++++------
> >  1 file changed, 7 insertions(+), 6 deletions(-)
>
> Whilst I can understand why you might want to make this configurable,
> I'm not sure if is a great idea since people are just going to turn it
> off and continue to ignore it :/.
>

It also allows to add it to ERROR_QA :).

--00000000000071d743060f896552
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, Jan 22, 2024 at 3:02=E2=80=AFPM R=
ichard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">ric=
hard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><div class=3D"gmail=
_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon, 2024-01-2=
2 at 06:52 +0100, Peter Kjellerstedt wrote:<br>
&gt; Commit f673d3d239799fb1ab50f4aa5d44187666aa0cd7 introduced a warning f=
or<br>
&gt; virtual/ being used in RPROVIDES and RDEPENDS. Make it possible to<br>
&gt; disable the warning by removing &quot;virtual-slash from WARN_QA.<br>
&gt; <br>
&gt; Signed-off-by: Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellers=
tedt@axis.com" target=3D"_blank">peter.kjellerstedt@axis.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes-global/insane.bbclass | 13 +++++++------<br>
&gt;=C2=A0 1 file changed, 7 insertions(+), 6 deletions(-)<br>
<br>
Whilst I can understand why you might want to make this configurable,<br>
I&#39;m not sure if is a great idea since people are just going to turn it<=
br>
off and continue to ignore it :/.<br></blockquote><div><br></div><div>It al=
so allows to add it to ERROR_QA :).</div></div></div>

--00000000000071d743060f896552--

