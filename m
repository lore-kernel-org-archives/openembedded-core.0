Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 998A3C77B73
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 06:19:40 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.7619.1685513977644989827
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 May 2023 23:19:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=PaTWeMhD;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2af30d10d8fso56257311fa.0
        for <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 23:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685513976; x=1688105976;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rEH/1/QNzfyWSW+M3xJ8tXNvA94QDwH7HhbJg8p6ED4=;
        b=PaTWeMhDq60UbVGV9vxNrQ0QDj9N5c32iWw545UBVsRWQtYSku6OEV4PYVlG0pkNJS
         SztQDYFcenDZNNNuHwa54weKkoVjNAKD2Z63KOZ31uIZbNebXMvsTKworyWMlw7xpMnS
         raetm/gpsOziG8rrJVZRCo+lC8MyFX4Vx3x4vzyw7TSD/nARNZVXufbwpsm04JlZ6+1q
         5d7vtZZFE8KmqYuTQqFlPZdDoFN6oPZhV3VYQcq4i86fjHbOIj0uvIDnEIRuA2IzQfZW
         zT7cHoq/TrepoC0M+3bywtUJgUYjGw6LetRa7mT1TMIjYj0trwERLI9rZ5gF4PZLEcFk
         nlfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685513976; x=1688105976;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rEH/1/QNzfyWSW+M3xJ8tXNvA94QDwH7HhbJg8p6ED4=;
        b=JAnB80wEf6fMkBuF0gzUS3CzX1US/yub3JdJXibuPTmR5K4RRU0R3hXa4wZRneHRTl
         wf4+5BhntFw07r/9hsZQYIfZ4p1sUAR2LYEmI13WIFDEJZSmULSjOrwxhpPixfR3ydL5
         Xh1tHVqwS8O/ckP1fM/pDwYLr5QIgbbIdBqGZeCYAtl/zKI/NR1GBfurxhl83EwvQHaz
         VmLXtZXZXqJiRA4tIVqlgvaq9ghZ6X9uMQJ2Gpv4v+AvhOrCwO1pjXJlV7H0I508kRis
         uJ50lKnYPWETCE01CV4o7gSuJaoGHaerJFvOL0GkEwM8BNwohJgKi9ygyiDWutxp3xm0
         rXmw==
X-Gm-Message-State: AC+VfDyZRVrdY154aDQD1NHc4wm+35Ad0tDrXuT5CJN3VvIPldyhuXE8
	FOR9OBSTL8YOrW29tnNyMxWdWYcbIbBlWPC8Zsg=
X-Google-Smtp-Source: ACHHUZ4OTIBM1cDzaCM8SiGp4n7urcLmw/d3SuVXbZgZcoq2e3xGLiTJ0kCbSBNQGD7/EfghvV/PLSVgyAH9c6DFpS4=
X-Received: by 2002:a2e:9810:0:b0:2a7:853e:a43 with SMTP id
 a16-20020a2e9810000000b002a7853e0a43mr1855229ljj.40.1685513975385; Tue, 30
 May 2023 23:19:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230530105125.445622-1-yashinde145@gmail.com>
 <7c9a0a78204958d84c4a3779da7c0f1b0e66dda8.camel@linuxfoundation.org>
 <CA+cAkeoEfQWbQkwYMhAUqQKQXyXcyCYJdoFewWkDKsVW=Mpyeg@mail.gmail.com>
 <c13fb9159ec84ab2bb4710a3e59190db61b54612.camel@linuxfoundation.org>
 <CA+cAkeqPd=5dodJ_mfEv_w-BsvfUCE1JQq1k1oSk+Paegrv3ZQ@mail.gmail.com>
 <d07d99ab-865b-0d1a-1efb-4e8c167415b8@windriver.com> <1cbd8aaaa38757e875876fa903df75321beef321.camel@linuxfoundation.org>
In-Reply-To: <1cbd8aaaa38757e875876fa903df75321beef321.camel@linuxfoundation.org>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Wed, 31 May 2023 08:19:24 +0200
Message-ID: <CA+cAker2LuMR90Vz_iZ2GNAk=NzC0r9oR6o5uxX++VA0VdMy+g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v14] Rust Oe-Selftest implementation
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Randy MacLeod <randy.macleod@windriver.com>, Yash Shinde <yashinde145@gmail.com>, 
	openembedded-core <openembedded-core@lists.openembedded.org>, Umesh.Kallapa@windriver.com, 
	Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com, 
	Shivaprasad.Moodalappa@windriver.com, Yash.Shinde@windriver.com
Content-Type: multipart/alternative; boundary="000000000000c450e005fcf74d2e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 06:19:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181990

--000000000000c450e005fcf74d2e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 30 mai 2023, 23:20, Richard Purdie <
richard.purdie@linuxfoundation.org> a =C3=A9crit :

> On Tue, 2023-05-30 at 14:28 -0400, Randy MacLeod wrote:
> > >
> > > I did put this into a build for testing on the autobuilder. It
> > > hasn't
> > > been running long and I can already see build failures such as:
> > >
> > >
> https://autobuilder.yoctoproject.org/typhoon/#/builders/103/builds/6077
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/720=
0
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/719=
0
> > >
> https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/2923
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/37/builds/720=
0
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/48/builds/721=
7
> > >
> https://autobuilder.yoctoproject.org/typhoon/#/builders/104/builds/6080
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/76/builds/714=
6
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/61/builds/718=
4
> > >
> > > and there will likely be more.
> > >
> > > I'm finding this rather frustrating and am not sure how this was
> > > tested.
> >
> > That's probably my fault. I've been asking Yash to keep pushing and
> > suggesting that I could help him with testing but the bad news is
> > that we (Wind River) have the tail end of a product release cycle
> > happening now.
> >
> > I'd like to help out with this, but it'll have to wait for at least 2
> > months and that puts us close to the end of M3 so we might have to
> > wait for the beginning of the fail development cycle.
> >
> > Let me talk with Yashe and Sundeep and reply with info on what to
> > expect.
>
> Let me try a different request on the public list too. We're clearly
> struggling to get this patch over the line. I have a finite amount of
> time and haven't really been able to dive into this properly, I have
> tried to guide Yash and Sundeep on some of the rust issues as best I
> can but I'm struggling.
>
> Is anyone else able to help out with some of the rust issues? The two
> pressing ones are the ptests (this patch) and the reproducibility
> issue. If anyone is able to help look into these, help is welcome,
> please talk to Randy and I.
>
> Cheers,
>
> Richard
>
>
> Several weeks ago, I gave a shot and spent some time investigating the
reproducibility issue (on zvariant recipe) but I was kind of stuck and I
was taken by other work on my side.
I think I can spent more hours on this during June. But of course, any help
is welcome since I currently have no leads.

--000000000000c450e005fcf74d2e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Le mar. 30 mai 2023, 23:20, Richard Purdie &lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundati=
on.org</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
On Tue, 2023-05-30 at 14:28 -0400, Randy MacLeod wrote:<br>
&gt; &gt; <br>
&gt; &gt; I did put this into a build for testing on the autobuilder. It<br=
>
&gt; &gt; hasn&#39;t<br>
&gt; &gt; been running long and I can already see build failures such as:<b=
r>
&gt; &gt; <br>
&gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builder=
s/103/builds/6077" rel=3D"noreferrer noreferrer" target=3D"_blank">https://=
autobuilder.yoctoproject.org/typhoon/#/builders/103/builds/6077</a><br>
&gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builder=
s/45/builds/7200" rel=3D"noreferrer noreferrer" target=3D"_blank">https://a=
utobuilder.yoctoproject.org/typhoon/#/builders/45/builds/7200</a><br>
&gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builder=
s/40/builds/7190" rel=3D"noreferrer noreferrer" target=3D"_blank">https://a=
utobuilder.yoctoproject.org/typhoon/#/builders/40/builds/7190</a><br>
&gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builder=
s/117/builds/2923" rel=3D"noreferrer noreferrer" target=3D"_blank">https://=
autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/2923</a><br>
&gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builder=
s/37/builds/7200" rel=3D"noreferrer noreferrer" target=3D"_blank">https://a=
utobuilder.yoctoproject.org/typhoon/#/builders/37/builds/7200</a><br>
&gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builder=
s/48/builds/7217" rel=3D"noreferrer noreferrer" target=3D"_blank">https://a=
utobuilder.yoctoproject.org/typhoon/#/builders/48/builds/7217</a><br>
&gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builder=
s/104/builds/6080" rel=3D"noreferrer noreferrer" target=3D"_blank">https://=
autobuilder.yoctoproject.org/typhoon/#/builders/104/builds/6080</a><br>
&gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builder=
s/76/builds/7146" rel=3D"noreferrer noreferrer" target=3D"_blank">https://a=
utobuilder.yoctoproject.org/typhoon/#/builders/76/builds/7146</a><br>
&gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builder=
s/61/builds/7184" rel=3D"noreferrer noreferrer" target=3D"_blank">https://a=
utobuilder.yoctoproject.org/typhoon/#/builders/61/builds/7184</a><br>
&gt; &gt; <br>
&gt; &gt; and there will likely be more.<br>
&gt; &gt; <br>
&gt; &gt; I&#39;m finding this rather frustrating and am not sure how this =
was<br>
&gt; &gt; tested.<br>
&gt; =C2=A0<br>
&gt; That&#39;s probably my fault. I&#39;ve been asking Yash to keep pushin=
g and<br>
&gt; suggesting that I could help him with testing but the bad news is<br>
&gt; that we (Wind River) have the tail end of a product release cycle<br>
&gt; happening now. <br>
&gt; =C2=A0<br>
&gt; I&#39;d like to help out with this, but it&#39;ll have to wait for at =
least 2<br>
&gt; months and=C2=A0that puts us close to the end of M3 so we might have t=
o<br>
&gt; wait for the beginning of the fail development cycle.<br>
&gt; =C2=A0<br>
&gt; Let me talk with Yashe and Sundeep and reply with info on what to<br>
&gt; expect.<br>
<br>
Let me try a different request on the public list too. We&#39;re clearly<br=
>
struggling to get this patch over the line. I have a finite amount of<br>
time and haven&#39;t really been able to dive into this properly, I have<br=
>
tried to guide Yash and Sundeep on some of the rust issues as best I<br>
can but I&#39;m struggling.<br>
<br>
Is anyone else able to help out with some of the rust issues? The two<br>
pressing ones are the ptests (this patch) and the reproducibility<br>
issue. If anyone is able to help look into these, help is welcome,<br>
please talk to Randy and I.<br>
<br>
Cheers,<br>
<br>
Richard<br><br>
</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><br></blockquote></div></div><d=
iv dir=3D"auto">Several weeks ago, I gave a shot and spent some time invest=
igating the reproducibility issue (on zvariant recipe) but I was kind of st=
uck and I was taken by other work on my side.=C2=A0</div><div dir=3D"auto">=
I think I can spent more hours on this during June. But of course, any help=
 is welcome since I currently have no leads.=C2=A0</div><div dir=3D"auto"><=
/div></div>

--000000000000c450e005fcf74d2e--

