Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA62CC04A94
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 11:34:09 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.10422.1690889641161573383
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 04:34:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=YjmRtAoT;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2b9b904bb04so86570781fa.1
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 04:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690889639; x=1691494439;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZvxXBJMKC99Q9VyGTfFoRU54wAqXQ4JBvUZHxTVDBCc=;
        b=YjmRtAoTRc923RC/+88iI9o0qcMHgHVGMKTNtZeVKRO3gB0oXUklPGgJyit8EmsfCJ
         W5mJAutw3AMrn4UrvBs2KOGdrffqiHCUz6OvwwkHBkEXo2IPGcOEOXEEk0hFqpOswQRt
         S4Q3Q1UBKHF4PrB7dDyZFEQjoSjlkBDoF8/zBGC6mAvZZYuoT3plk70kQcpl77cxj+6B
         WO2STjgNudqWZuO8HR+GOVgxh/OqdPHnNStaRjZ7i9DV4ppcGU4Pun+kY3eXCljVzezg
         ydSV4ytmdsqMTq1DfQtwg3UzU2rVk2YtGEarRMUqOooUIayTzpDODs+Pc/s8eIQbaLU1
         kMwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690889639; x=1691494439;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZvxXBJMKC99Q9VyGTfFoRU54wAqXQ4JBvUZHxTVDBCc=;
        b=CtDqZE1i0c7yDAv/viKKsWBeAsBFTUMo+YVz5Bu40frEHDKYlkMA1WRuLytdLqtTU7
         HPs9hT0K4z2+JZFjHohq6DND4t0I66WABTE6wSpbu5t5qY6RiYu9cjx9EV6RKXgiUuOr
         3yQU2cQ7IZv728tMSR6ujcxvzihc2tzFfxeYQVzhNhiKwdGEO6gsuqkze0uY4BUJr8bA
         RkG/hpGXQz8VaZ9bqnzIFu2ITnQzZmgNIWES2ALJ4GV6yJP8fhDGDACdMZSHQD77LpV4
         u66x6VavpRQLc4DHlSkDtvYhcCpX/QKWhvui3wn7peNel5xvfCfGa9jhkL/qCq3y9QmA
         47nw==
X-Gm-Message-State: ABy/qLa7wG7uIRhL5GzX0XYQ+DVgvrqt11zA/GFJnxq5KiXOpVxbC3lJ
	5ofNZuCd0SxG2k7zGxOzDe98YyRAVxK83eGGNS4=
X-Google-Smtp-Source: APBJJlGYHwLxPu8oFuu6G4mz+3gzRUXCQmv1R4194hlRY4dEqnWC4n8+o1k3FsKGkYXDq6CKoSQDsKCQybCpgz3vUa4=
X-Received: by 2002:a2e:8455:0:b0:2b9:cd3d:4136 with SMTP id
 u21-20020a2e8455000000b002b9cd3d4136mr2029684ljh.2.1690889638784; Tue, 01 Aug
 2023 04:33:58 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1690795930.git.frederic.martinsons@gmail.com>
 <7a3e6d5250d6d0cc526dbede582815007a3b3e56.1690795930.git.frederic.martinsons@gmail.com>
 <205e20dd658f80e5215b6330f387cb4f95c30d4f.camel@linuxfoundation.org>
 <CA+cAkeoSMuuZoY+u7bAXq=9CAtrjyQew5MwCLMXRo7O9KRH4PQ@mail.gmail.com>
 <8ee20428cdc9a71f33bed57893ed6683f05e620b.camel@linuxfoundation.org>
 <CA+cAkepixZXe=6SP8eKwkg7+h3p0CcK+s8s3Uyg0vYmACtH=xA@mail.gmail.com>
 <1f72dc4842eaadc8fa49eef29f2f0af4179131c9.camel@linuxfoundation.org>
 <CANNYZj96-co4wRxY=N3KS4bEsFr_v=yJphOC0ZBO92TerGtmug@mail.gmail.com>
 <CA+cAkepSOxNovN+iuRx8_=9Ut=bLXBb8YHbHG5SJJedGfGmeBg@mail.gmail.com>
 <d036b9e08737619b03af2e6b27bc99e9abcee377.camel@linuxfoundation.org> <CAO5Uq5T=HcAVWaU0RQzqXg0vhQ=ybkOWgHg5GuXWvQEqwt+uqg@mail.gmail.com>
In-Reply-To: <CAO5Uq5T=HcAVWaU0RQzqXg0vhQ=ybkOWgHg5GuXWvQEqwt+uqg@mail.gmail.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Tue, 1 Aug 2023 13:33:47 +0200
Message-ID: <CA+cAkeoCbc487_zKJspcG5_mhUyKk_ZGtd517Qoq1KkKmREsBg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] cargo.bbclass: Offer a way to use --offline
 instead of --frozen
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core <openembedded-core@lists.openembedded.org>, 
	Randy MacLeod <Randy.MacLeod@windriver.com>
Content-Type: multipart/alternative; boundary="0000000000004631820601daec07"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 11:34:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185239

--0000000000004631820601daec07
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ok, thanks you all for the answers. I'll then add a new patch to make this
cleansing and drop the patch I made to use --offline instead of --frozen
(no more needed)

Le mar. 1 ao=C3=BBt 2023, 12:04, Alex Kiernan <alex.kiernan@gmail.com> a =
=C3=A9crit :

> On Tue, Aug 1, 2023 at 11:01=E2=80=AFAM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Tue, 2023-08-01 at 11:55 +0200, Fr=C3=A9d=C3=A9ric Martinsons wrote:
> > > zariant rust recipe is tested for devtool cases there
> > >
> > > The test case mentioned earlier seems to verify that we can run rust
> > > test code, do we want to keep testing
> > > that rust binary can run ? If so, how to keep testing this while
> > > removing rust-hello-world recipes ?
> > >
> > > maybe we can add a simple "println!("Hello world") " in this file ,
> > > compile it like it is already done and run it
> > > to check its output ?
> > >
> > > What do you think?
> >
> > Doesn't test_rust_compile already also run the rust code it compiled?
> >
>
> Yes and checks the exit code - really not sure I see any additional
> value in turning it into another "Hello World". I'm fairly sure the
> cargo test gets you another "Hello World" test (but again only checks
> the return value). I think the rust-hello-world test is covered in
> other ways now.
>
>
> --
> Alex Kiernan
>

--0000000000004631820601daec07
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Ok, thanks you all for the answers. I&#39;ll then add a n=
ew patch to make this cleansing and drop the patch I made to use --offline =
instead of --frozen (no more needed)=C2=A0</div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">Le mar. 1 ao=C3=BBt 2023, 12:04, =
Alex Kiernan &lt;<a href=3D"mailto:alex.kiernan@gmail.com">alex.kiernan@gma=
il.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
On Tue, Aug 1, 2023 at 11:01=E2=80=AFAM Richard Purdie<br>
&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank"=
 rel=3D"noreferrer">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt;<br>
&gt; On Tue, 2023-08-01 at 11:55 +0200, Fr=C3=A9d=C3=A9ric Martinsons wrote=
:<br>
&gt; &gt; zariant rust recipe is tested for devtool cases there<br>
&gt; &gt;<br>
&gt; &gt; The test case mentioned earlier seems to verify that we can run r=
ust<br>
&gt; &gt; test code, do we want to keep testing<br>
&gt; &gt; that rust binary can run ? If so, how to keep testing this while<=
br>
&gt; &gt; removing rust-hello-world recipes ?<br>
&gt; &gt;<br>
&gt; &gt; maybe we can add a simple &quot;println!(&quot;Hello world&quot;)=
 &quot; in this file ,<br>
&gt; &gt; compile it like it is already done and run it<br>
&gt; &gt; to check its output ?<br>
&gt; &gt;<br>
&gt; &gt; What do you think?<br>
&gt;<br>
&gt; Doesn&#39;t test_rust_compile already also run the rust code it compil=
ed?<br>
&gt;<br>
<br>
Yes and checks the exit code - really not sure I see any additional<br>
value in turning it into another &quot;Hello World&quot;. I&#39;m fairly su=
re the<br>
cargo test gets you another &quot;Hello World&quot; test (but again only ch=
ecks<br>
the return value). I think the rust-hello-world test is covered in<br>
other ways now.<br>
<br>
<br>
-- <br>
Alex Kiernan<br>
</blockquote></div>

--0000000000004631820601daec07--

