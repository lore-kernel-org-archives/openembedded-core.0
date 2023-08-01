Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 633DDEB64DD
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 09:56:09 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.9024.1690883762625157672
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 02:56:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=CIuxoBpx;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-4fe07f0636bso8844576e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 02:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690883760; x=1691488560;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AopS89FGXEoa6Cc7H5yRZF2z0gcCy8CQvGgRQHNN1jU=;
        b=CIuxoBpx6gdVFSHHF2NpoLn/nS+Tdx4mcQe19y947jP5FvlkDMBs5YKNZa1XOAwGqh
         1x0RTP5jUPfYn2tOznE3l5uByjEAwRhT09+HcoNuiJtBJNqUl8zHIYSifeR9e8N30WUm
         yCMBDeFoKmAXj5SwkGTaBZO/XEsq+q5h4v6iWyUmlMWH8NbSJsIxN9DrpGxacl0bZrSz
         DXJ666bn7hGXJLg3Xfi0gxtSi64x4/SXUjHHnLfM8KQa9d4rpBtLOjSSyosiURjHq6kY
         zOY+DiewcHnI7z+/YYUVmMRyDXyXwkWfxfck31M2nN3JDWiERaPieX4H26gkJ58lw2Ba
         yE6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690883760; x=1691488560;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AopS89FGXEoa6Cc7H5yRZF2z0gcCy8CQvGgRQHNN1jU=;
        b=YvNaLbeaw0l9IqauLVmtt1B1ULuTxW5xuUOvvOg1tnlD0OjwhUOnaKyWUTvCK3Q8jU
         JOVgSrrwgd7kCwMFFtr3WnpuEiSYPWhgLBmRpev1owz3gmWprfIIUzaNngzjG9vy6I6L
         B9dWL4y/+3OA1BKUsa9v3C6HYMhfFAEcSigl7QE9K26vEdurt8to0XT5KggVJ5a9IizZ
         wCxA71yfnBqo3jcRgrHLXZTXSeYYTVVuYZ1d3NrLfiev0JyURQnZJIndfpBai66CJSJ+
         tPbtjBTCRTP8i3wmmyUuDy1+BpWunjstrvMMVZJ9/1tuVXwMpUB4yDi86nIlPlQr5VkZ
         Vqiw==
X-Gm-Message-State: ABy/qLa8OJ+TrtSETcl7eO+wjHlejU6Hs7t0/232WzpNcdMO8g6IES7J
	IPgkgQpcFbd311pjymSNi3Tkwkroz85HiTe/zXA=
X-Google-Smtp-Source: APBJJlGqdUBqycjmGEaGjMbLJE1ieNxVPLwlXKUTWwmnCghplRv4NPl1BoG21+y2J5d00QZVfrzSM2kqrRGJxAdMQMo=
X-Received: by 2002:a2e:9457:0:b0:2b9:ea87:7448 with SMTP id
 o23-20020a2e9457000000b002b9ea877448mr1950872ljh.49.1690883760338; Tue, 01
 Aug 2023 02:56:00 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1690795930.git.frederic.martinsons@gmail.com>
 <7a3e6d5250d6d0cc526dbede582815007a3b3e56.1690795930.git.frederic.martinsons@gmail.com>
 <205e20dd658f80e5215b6330f387cb4f95c30d4f.camel@linuxfoundation.org>
 <CA+cAkeoSMuuZoY+u7bAXq=9CAtrjyQew5MwCLMXRo7O9KRH4PQ@mail.gmail.com>
 <8ee20428cdc9a71f33bed57893ed6683f05e620b.camel@linuxfoundation.org>
 <CA+cAkepixZXe=6SP8eKwkg7+h3p0CcK+s8s3Uyg0vYmACtH=xA@mail.gmail.com>
 <1f72dc4842eaadc8fa49eef29f2f0af4179131c9.camel@linuxfoundation.org> <CANNYZj96-co4wRxY=N3KS4bEsFr_v=yJphOC0ZBO92TerGtmug@mail.gmail.com>
In-Reply-To: <CANNYZj96-co4wRxY=N3KS4bEsFr_v=yJphOC0ZBO92TerGtmug@mail.gmail.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Tue, 1 Aug 2023 11:55:49 +0200
Message-ID: <CA+cAkepSOxNovN+iuRx8_=9Ut=bLXBb8YHbHG5SJJedGfGmeBg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] cargo.bbclass: Offer a way to use --offline
 instead of --frozen
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com
Content-Type: multipart/alternative; boundary="000000000000e43e3a0601d98d6c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 09:56:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185227

--000000000000e43e3a0601d98d6c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

zariant rust recipe is tested for devtool cases there
<https://git.openembedded.org/openembedded-core/tree/meta/lib/oeqa/selftest=
/cases/devtool.py#n891>

The test case mentioned earlier seems to verify that we can run rust test
code, do we want to keep testing
that rust binary can run ? If so, how to keep testing this while removing
rust-hello-world recipes ?

maybe we can add a simple "println!("Hello world") " in this file
<https://git.openembedded.org/openembedded-core/tree/meta/lib/oeqa/files/te=
st.rs>
,
compile it like it is already done and run it
to check its output ?

What do you think?


On Tue, 1 Aug 2023 at 11:41, Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> I have no special feelings about rust-hello-world; if all places where
> it's currently used can be reworked to use real world components,
> that's totally fine.
>
> Alex
>
> On Tue, 1 Aug 2023 at 11:38, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Tue, 2023-08-01 at 11:20 +0200, Fr=C3=A9d=C3=A9ric Martinsons wrote:
> > > Ok but this raises other questions then, this recipe is part of
> > > packagegroup-core-tools-tesapps
> >
> > Just drop that.
> >
> > > and is part of a test case So what to do with those ? Suppress them
> > > too or adapt them with another recipe (zvariant ?)
> >
> > I think the other test cases supersede this one so that can be dropped
> > too?
> >
> > Cheers,
> >
> > Richard
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#185222):
> https://lists.openembedded.org/g/openembedded-core/message/185222
> > Mute This Topic: https://lists.openembedded.org/mt/100458217/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--000000000000e43e3a0601d98d6c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">zariant rust recipe is tested for devtool cases=C2=A0<a hr=
ef=3D"https://git.openembedded.org/openembedded-core/tree/meta/lib/oeqa/sel=
ftest/cases/devtool.py#n891">there</a><div><br></div><div>The test case men=
tioned=C2=A0earlier seems to verify=C2=A0that we can run rust test code, do=
 we want to keep testing</div><div>that rust binary can run ? If so, how to=
 keep testing this while removing rust-hello-world recipes ?</div><div><br>=
</div><div>maybe we can add a simple &quot;println!(&quot;Hello world&quot;=
) &quot; in=C2=A0<a href=3D"https://git.openembedded.org/openembedded-core/=
tree/meta/lib/oeqa/files/test.rs">this file</a>=C2=A0, compile it like it i=
s already done and run it</div><div>to check its output ?</div><div><br></d=
iv><div>What do you think?</div><div><br></div></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 1 Aug 2023 at 11:41,=
 Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanav=
in@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">I have no special feelings about rust-hello-world; if all place=
s where<br>
it&#39;s currently used can be reworked to use real world components,<br>
that&#39;s totally fine.<br>
<br>
Alex<br>
<br>
On Tue, 1 Aug 2023 at 11:38, Richard Purdie<br>
&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank"=
>richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt;<br>
&gt; On Tue, 2023-08-01 at 11:20 +0200, Fr=C3=A9d=C3=A9ric Martinsons wrote=
:<br>
&gt; &gt; Ok but this raises other questions then, this recipe is part of<b=
r>
&gt; &gt; packagegroup-core-tools-tesapps<br>
&gt;<br>
&gt; Just drop that.<br>
&gt;<br>
&gt; &gt; and is part of a test case So what to do with those ? Suppress th=
em<br>
&gt; &gt; too or adapt them with another recipe (zvariant ?)<br>
&gt;<br>
&gt; I think the other test cases supersede this one so that can be dropped=
<br>
&gt; too?<br>
&gt;<br>
&gt; Cheers,<br>
&gt;<br>
&gt; Richard<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#185222): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/185222" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/185222</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10045821=
7/1686489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/100458217/1686489</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.co=
m" target=3D"_blank">alex.kanavin@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div>

--000000000000e43e3a0601d98d6c--

