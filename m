Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCA0BC433FE
	for <webhook@archiver.kernel.org>; Fri, 14 Jan 2022 09:42:21 +0000 (UTC)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com
 [209.85.221.178])
 by mx.groups.io with SMTP id smtpd.web09.5195.1642153340889463565
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jan 2022 01:42:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gxFD6wOu;
 spf=pass (domain: gmail.com, ip: 209.85.221.178,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f178.google.com with SMTP id h16so5500442vkp.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jan 2022 01:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eulpb38RiEUCXtRBpTkNqIsULRts5oNr6iHTr6lP2TA=;
        b=gxFD6wOuB0x5Ps2yS7le6Wk70jFKgwr6id+C2JmiA8lTGH1LROoBTLpKuBexfQknjP
         35thMDWD7ipcp1O7T34lqcd5h0DYnKBgFnxdUGy52XuceMtck14K049GBhSa1iIJPv9j
         NWDmQSWInhDNylLXmOJC72NFJjTtZPbpWrJ6zvQnNZVfRs4WQTj/hyeJKFqQUweLcnif
         8zuzjB7Nl517h03tx1Zzyq3X0Ozmu2XjznQ0+8eGwqaECSaaTw6mgmyGR03rOAZeXZL4
         qf3MYwA6/p1OQcjSy1VjX7k5gO2I4GE1TzIqvBalMwTmxX0b49F8UdiHEs32EeNRFHQZ
         EkBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eulpb38RiEUCXtRBpTkNqIsULRts5oNr6iHTr6lP2TA=;
        b=5APkT8FTE/xSk5I9O1ikZNiFWBlbb8TpB7gwLbOo/jzrB+7xa8QcnDTcWy9w9V2Rn1
         59k8G4jJqqOXlBIFvNwgqJ0C7CLQ+MISyOSc+vQW0uGY0bQXeGR3qiwJCmgL5tMOcyRq
         WyCoJVi/pOW1eyMwNpH4FaiwI1XDLeS/QE+ezGKVOZ8Jy78XvuUXexP8ACYVSThEMWN6
         V+fziVhVYcUVEcYUrWiiIcbnJ6CI/z9T0jZ3RNcCi+XMHRMJxZyVzr32z6PT1NFPp7Rx
         uLQc2miIJlMDAF80RQeqrlGbtatPZ/FnGk8P7+1bCu6ie6ydqGgHREjp1pRrFQ5hyIYS
         BKVg==
X-Gm-Message-State: AOAM533M1XMo9E/pf27giskUhDEZ8cMNw8iOVWF3vf7lEyOGpH+Q7mwj
	t33K7OXKJ4Nsjyx/8XSCSHIObqZQnnum6rZwggo=
X-Google-Smtp-Source: 
 ABdhPJy2Bb+Gsu0Lwj+azsCM9iQAqTU0kUXHrsOLYe22AQfmcaVCoiyUeAEiRIRQ0WjVbYyG7b/qw3UP1K+uWeUQTN0=
X-Received: by 2002:a1f:b241:: with SMTP id b62mr4038736vkf.1.1642153340075;
 Fri, 14 Jan 2022 01:42:20 -0800 (PST)
MIME-Version: 1.0
References: 
 <CGME20220114011350epcas2p16efb8acbdc4d9edceee83569e10cc359@epcas2p1.samsung.com>
 <000801d808e3$fcea94e0$f6bfbea0$@samsung.com>
 <CAPphmgbonScBvk-DC1Zvv5ydYSDpiRMFGevZ1Pkr9hAcgWrjgA@mail.gmail.com>
 <25c45fe6-b268-6054-0537-d2af1c0335ea@bootlin.com>
In-Reply-To: <25c45fe6-b268-6054-0537-d2af1c0335ea@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 14 Jan 2022 10:42:08 +0100
Message-ID: 
 <CANNYZj_Zc25Ff7Kx6kgO13tvfkdQH_vHQUFezsCyJiBGddPj9Q@mail.gmail.com>
Subject: Re: [yocto] [OE-core] Question of Yocto dunfell LTS period
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: Jate Sujjavanich <jatedev@gmail.com>, chanho61.park@samsung.com,
	OE-core <openembedded-core@lists.openembedded.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
 Steve Sakoman <steve@sakoman.com>,
	Yocto-mailing-list <yocto@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="0000000000008083c705d5879ecc"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jan 2022 09:42:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160561

--0000000000008083c705d5879ecc
Content-Type: text/plain; charset="UTF-8"

Actually, I think this was some kind of missed PR opportunity. Regular
distros, such as RHEL, Debian and everyone else, are constantly trotting
out their support windows as the reason to hand them the job of making
products, so we could counter that better perhaps.

Alex

On Fri, 14 Jan 2022 at 06:28, Michael Opdenacker <
michael.opdenacker@bootlin.com> wrote:

>
> On 1/14/22 2:36 AM, Jate Sujjavanich wrote:
> > I received the answer to this question in IRC on 10/29/2021.
> >
> > 16:06
> > <https://libera.irclog.whitequark.org/yocto/2021-10-29#31083490
> > <jatedev>
> > I saw a wiki edit that said dunfell's LTS period is now through April
> > 2024, but I've seen no announcements. Any truth to this rumor?
> > 16:20
> > <https://libera.irclog.whitequark.org/yocto/2021-10-29#31083555
> > <smurray>
> > jatedev: it was announced on one of the technical calls a few weeks
> > back, so yes AFAIK
> > 16:25
> > <https://libera.irclog.whitequark.org/yocto/2021-10-29#31083577> <RP>
> > jatedev: definitely true. I wish we could sort out the project
> > advocacy side of things :(
> >
> > Let this email serve as a little advocacy.
>
>
> I believe this would also help if the website (releases page) and/or
> official documentation carried such information.
> Thanks for raising this concern!
> Cheers
> Michael.
>
> --
> Michael Opdenacker, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#160557):
> https://lists.openembedded.org/g/openembedded-core/message/160557
> Mute This Topic: https://lists.openembedded.org/mt/88415300/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000008083c705d5879ecc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Actually, I think this was some kind of missed PR opp=
ortunity. Regular distros, such as RHEL, Debian and everyone else, are cons=
tantly trotting out their support windows as the reason to hand them the jo=
b of making products, so we could counter that better perhaps.</div><div><b=
r></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Fri, 14 Jan 2022 at 06:28, Michael Opdenacker=
 &lt;<a href=3D"mailto:michael.opdenacker@bootlin.com">michael.opdenacker@b=
ootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><br>
On 1/14/22 2:36 AM, Jate Sujjavanich wrote:<br>
&gt; I received the answer to this question in IRC on 10/29/2021.<br>
&gt;<br>
&gt; 16:06<br>
&gt; &lt;<a href=3D"https://libera.irclog.whitequark.org/yocto/2021-10-29#3=
1083490" rel=3D"noreferrer" target=3D"_blank">https://libera.irclog.whitequ=
ark.org/yocto/2021-10-29#31083490</a>&gt;=C2=A0&lt;jatedev&gt;<br>
&gt; I saw a wiki edit that said dunfell&#39;s LTS period is now through Ap=
ril<br>
&gt; 2024, but I&#39;ve seen no announcements. Any truth to this rumor?=C2=
=A0<br>
&gt; 16:20<br>
&gt; &lt;<a href=3D"https://libera.irclog.whitequark.org/yocto/2021-10-29#3=
1083555" rel=3D"noreferrer" target=3D"_blank">https://libera.irclog.whitequ=
ark.org/yocto/2021-10-29#31083555</a>&gt;=C2=A0&lt;smurray&gt;<br>
&gt; jatedev: it was announced on one of the technical calls a few weeks<br=
>
&gt; back, so yes AFAIK=C2=A0<br>
&gt; 16:25<br>
&gt; &lt;<a href=3D"https://libera.irclog.whitequark.org/yocto/2021-10-29#3=
1083577" rel=3D"noreferrer" target=3D"_blank">https://libera.irclog.whitequ=
ark.org/yocto/2021-10-29#31083577</a>&gt;=C2=A0&lt;RP&gt;<br>
&gt; jatedev: definitely true. I wish we could sort out the project<br>
&gt; advocacy side of things :(=C2=A0<br>
&gt;<br>
&gt; Let this email serve as a little advocacy.<br>
<br>
<br>
I believe this would also help if the website (releases page) and/or<br>
official documentation carried such information.<br>
Thanks for raising this concern!<br>
Cheers<br>
Michael.<br>
<br>
-- <br>
Michael Opdenacker, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#160557): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/160557" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/160557</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/88415300/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/88415300/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000008083c705d5879ecc--

