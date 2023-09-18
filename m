Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54CD3CD37B0
	for <webhook@archiver.kernel.org>; Mon, 18 Sep 2023 17:10:17 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.57597.1695057010276459897
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Sep 2023 10:10:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DfoNbxWA;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-404573e6c8fso48052485e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Sep 2023 10:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695057009; x=1695661809; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rxwL8cHgF8rIHMFWtn/PN234r2uCuXTb7f9Ncu/7ZiQ=;
        b=DfoNbxWAUyfnoMawVR+qFOY6qM8PIDTAhnK4hQRuS0IwIab2QYqLOWe//pEjJziMXP
         SZiIGev8OI6DL1I3Sd7W28tl3PMiskQfTHHyghtro98NE/l76NanlNwtwgOklwpocv33
         yxhk7qHY1xrfv1NLSJgO9YTK8irGlCWOOSDmO/fx2GLmqZRvoDe5/ArUw8OgVEnyx3Nz
         UoMQf5gJPoc2NERRiwH5zeKs7qXUWWwbf/7UD8ylpTiaWPT2L0Uusn7O9Qw2w3tu2mrs
         MT50RA0lf69JwzkyUkb97iPaoihq40JMvhwfCo4zH/hpXyRLDj/B8ctHqMhZPQBaI079
         qIzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695057009; x=1695661809;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rxwL8cHgF8rIHMFWtn/PN234r2uCuXTb7f9Ncu/7ZiQ=;
        b=mz1r1IP4bujI4fsA+4hjl1AllDZRS0iZ5/KtkuKtwVsuha776wtXIk/hGlhCd/RMwz
         64+Q7DgetF/u+e+cB2kjQurq5Dlt6yBNXz85q5b+cFKThEHdQu0UrOHtwBkHlnQ05s5S
         CIilvfiBMwGmFk3yJateISUUKciJm+2rMHGYNwi/AwGDJhJGKfrRPakxV7ixkX8N3OAQ
         6dIRWS4pKa2ps8qRbUkLph+m9yyCfOSp7V69y7oTpRgD/4a0unnUQ25f0Yb4APAkR+r/
         iJj0f6Pg+nmSx1RMJW7JxfjCkaZPDWyXtZ75Rlxqe2KSvDZxlbImk8euMlxhDkKtAuQF
         oMjw==
X-Gm-Message-State: AOJu0YyyjzvGRFJsGkrCIjboTfQialxHskluSrm1/SDol3nCvUQfJWcm
	tNcJw/ROy83KVKqeKPlqxnWEnYC+tkScaJZvvts=
X-Google-Smtp-Source: AGHT+IEoDMbgmMPktQajyAI8nfLRmSxDCIvrC1RQVVW+ADl8EwxIkSjnLZ0fqqVVOic2EA/sQFVIAeianXr/f0QhEL8=
X-Received: by 2002:a5d:59c1:0:b0:31f:ffe7:9a64 with SMTP id
 v1-20020a5d59c1000000b0031fffe79a64mr6971104wry.52.1695057008419; Mon, 18 Sep
 2023 10:10:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230915204234.3547739-1-martin.jansa@gmail.com>
 <CAOSpxda40yQJrJCXhS-rtQ9T89auc52zwibD6qjCWYKSLZfB5g@mail.gmail.com>
 <DC0F0107-7850-4099-A201-6F6C1DB5D0CB@arm.com> <CAOSpxdYY8WWTknuN8Dayi8Q1fF1Q_=gJ67E7W3gJDEbx_eNG3g@mail.gmail.com>
In-Reply-To: <CAOSpxdYY8WWTknuN8Dayi8Q1fF1Q_=gJ67E7W3gJDEbx_eNG3g@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 18 Sep 2023 19:09:56 +0200
Message-ID: <CA+chaQeQ5F1HWdrS76XMS3NmTxgOcMUTWzHqrh5wZ3176qKb5A@mail.gmail.com>
Subject: Re: [OE-core] [mickledore][PATCH] gcc: backport a fix for ICE caused
 by CVE-2023-4039.patch
To: Steve Sakoman <steve@sakoman.com>
Cc: Ross Burton <Ross.Burton@arm.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000dc6faa0605a5364e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Sep 2023 17:10:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187838

--000000000000dc6faa0605a5364e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I've intentionally sent it only for mickledore as the gcc version in
kirkstone and dunfell isn't affected by this (at least my reproducer isn't)=
.

On Mon, Sep 18, 2023 at 6:42=E2=80=AFPM Steve Sakoman <steve@sakoman.com> w=
rote:

> On Mon, Sep 18, 2023 at 6:08=E2=80=AFAM Ross Burton <Ross.Burton@arm.com>=
 wrote:
> >
> > On 18 Sep 2023, at 16:48, Steve Sakoman <steve@sakoman.com> wrote:
> > >
> > > The CVE-2023-4039.patch was also submitted for kirkstone and dunfell.
> > > Should I attempt to cherry-pick this fix for those branches too?
> >
> > The bug says that the patch only applies cleaning to GCC 12/13, I=E2=80=
=99m
> seeking clarification as to whether that means it=E2=80=99s not relevant =
for older
> branches or whether a proper backport will be needed.
>
> I did a quick experiment with kirkstone and there were two issues with
> cherry-picking:
>
> 1. The test suite hunk failed since the test file doesn't exist in gcc 11
> 2. The first hunk fails to apply since the file name being modified in
> gcc 11 is a .c, apparently it was changed to .cc in later releases.
> You took this into account in the CVE patch file
>
> Removing the testsuite hunk and hacking the filename allowed the first
> hunk to apply (but with fuzz errors).
>
> So I'd say we definitely need a proper backport if the issue is
> relevant for older branches.
>
> I'll pull CVE-2023-4039.patch from kirkstone and dunfell until we have
> clarification.
>
> Thanks!
>
> Steve
>

--000000000000dc6faa0605a5364e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;ve intentionally sent it only for mickledore as the =
gcc version in kirkstone and dunfell isn&#39;t affected by this (at least m=
y reproducer isn&#39;t).</div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Sep 18, 2023 at 6:42=E2=80=AFPM Steve Sakom=
an &lt;<a href=3D"mailto:steve@sakoman.com">steve@sakoman.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon, Sep 18=
, 2023 at 6:08=E2=80=AFAM Ross Burton &lt;<a href=3D"mailto:Ross.Burton@arm=
.com" target=3D"_blank">Ross.Burton@arm.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On 18 Sep 2023, at 16:48, Steve Sakoman &lt;<a href=3D"mailto:steve@sa=
koman.com" target=3D"_blank">steve@sakoman.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; The CVE-2023-4039.patch was also submitted for kirkstone and dunf=
ell.<br>
&gt; &gt; Should I attempt to cherry-pick this fix for those branches too?<=
br>
&gt;<br>
&gt; The bug says that the patch only applies cleaning to GCC 12/13, I=E2=
=80=99m seeking clarification as to whether that means it=E2=80=99s not rel=
evant for older branches or whether a proper backport will be needed.<br>
<br>
I did a quick experiment with kirkstone and there were two issues with<br>
cherry-picking:<br>
<br>
1. The test suite hunk failed since the test file doesn&#39;t exist in gcc =
11<br>
2. The first hunk fails to apply since the file name being modified in<br>
gcc 11 is a .c, apparently it was changed to .cc in later releases.<br>
You took this into account in the CVE patch file<br>
<br>
Removing the testsuite hunk and hacking the filename allowed the first<br>
hunk to apply (but with fuzz errors).<br>
<br>
So I&#39;d say we definitely need a proper backport if the issue is<br>
relevant for older branches.<br>
<br>
I&#39;ll pull CVE-2023-4039.patch from kirkstone and dunfell until we have<=
br>
clarification.<br>
<br>
Thanks!<br>
<br>
Steve<br>
</blockquote></div>

--000000000000dc6faa0605a5364e--

