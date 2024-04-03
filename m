Return-Path: <jester@theyoctojester.info>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED61FCD128A
	for <webhook@archiver.kernel.org>; Wed,  3 Apr 2024 15:02:47 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.13496.1712156561143014251
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Apr 2024 08:02:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theyoctojester-info.20230601.gappssmtp.com header.s=20230601 header.b=Wz0DeVrH;
 spf=none, err=permanent DNS error (domain: theyoctojester.info, ip: 209.85.167.53, mailfrom: jester@theyoctojester.info)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-513ccc70a6dso11130914e87.1
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Apr 2024 08:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=theyoctojester-info.20230601.gappssmtp.com; s=20230601; t=1712156559; x=1712761359; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qmMSnfxV7kH/fvVVIpf0RuS4vSmkyaBGd0xOXAcnSvc=;
        b=Wz0DeVrHfrGXZas/BfUWh68MtjkIsDgzkZqdFIoXEfds8boVP2uky4OcZxuUaISWrd
         qFr/JLdh1fEiPEo3Pa47lyN+7oEkjClzFYh8784J0a0AY62R2ToQAR6pY4KavybrDKQk
         eoRn79qGH2MqO99wbO3dPkS2gZkQCrpfsaN6uCcKGLFB0RBmdQw+rhEpe7M8NJoZM5Y/
         UScTuuWpbWG4DYqU8NngJyNI4LrFAtDuOZHMWKsvKrA+/WWLgmyz63WO5RbwUwM+gD7M
         BbHXrPLwv+moH6XsZUZ7rXf3n4/5xb4plSJ6xkHfjHvRQ1qDLxX6oyAId+9Y97X9Ox1+
         TGxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712156559; x=1712761359;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qmMSnfxV7kH/fvVVIpf0RuS4vSmkyaBGd0xOXAcnSvc=;
        b=kt7Uj/qvvfXPb0FsFsJTf9Qe3ah3368g3JZ/U6blMQvqLy7odnPafpvSBezJWpxE3G
         U4v+MbeSQFmYjDQ/6tWXmlRvQhJgIVVCWoLy2i0ZOMYXUX30dyGNLuFtkZhM32UkJcH1
         e73N9xc+AgbJxf6eemJGSoVtrVKO3BiwLBG4nZ1R+Torlv/vXHznn7OUztv6/7w2sbjQ
         VbBLHfwPZrd1HDtGHZTeT69uvZC50m3LwcQvzjPJ0MbZ4nUbM64bCQpO1hMtllcMUtYe
         h8gCYtai7FAdEAUiYVqL+rVaot2R6961ko9S0AXLozlSQgLKs/aBpADVwxPlzmXNfUrl
         dZhA==
X-Forwarded-Encrypted: i=1; AJvYcCWffpwR8WelmEycCq+mAMUZh1e8wnz9i1wNeLKd9c31C1KzoeSkRYUTxE70eQQi610YEAJ5u+UT+jEbBoUeQOk+8W+G30m4K6KY7mhdj/JXrX0q6ULBZW+F
X-Gm-Message-State: AOJu0Yz1NtCO2N15Ru4Z+s9CzPsHOa0E8oydFor/ukEoucbXN+5iR5Tl
	lBfxjyf8MltCu6uj/lttKc7SEPHPtmqAzEJUvKeG/pbSey+J4+I6QD5cFvrQR7fpBvgdxVBPV59
	qJlxzDVnw4C1bc+VdKLxl9lxZjinlBl84XI11lQ==
X-Google-Smtp-Source: AGHT+IHz1SeiaOH+KbQrrLdGkOPbhEASpW11S4w/a71pJStwc3/RVOtTrr3/AtgqmZ2ShBAezRlDWqiqNWhYRJrio4E=
X-Received: by 2002:a05:6512:528:b0:513:d5ec:afb with SMTP id
 o8-20020a056512052800b00513d5ec0afbmr4320102lfc.40.1712156558853; Wed, 03 Apr
 2024 08:02:38 -0700 (PDT)
MIME-Version: 1.0
References: <8363E7C5-B3C0-4B3E-941E-762A400DF87B@arm.com> <1f92e19a-6e2e-43ed-b300-2d4f5cd4815b@bp.renesas.com>
 <997ee82c-be16-4562-b196-1aae40bb9284@bootlin.com>
In-Reply-To: <997ee82c-be16-4562-b196-1aae40bb9284@bootlin.com>
From: Josef Holzmayr <jester@theyoctojester.info>
Date: Wed, 3 Apr 2024 17:02:13 +0200
Message-ID: <CAEt6NwrTGcfjYudKCNnMD=kB4mEqQFd2D0kr1Z3vPJK0KWT0pw@mail.gmail.com>
Subject: Re: [yocto] [Openembedded-architecture] New mailing list for layer patches
To: yocto@lists.yoctoproject.org, michael.opdenacker@bootlin.com
Cc: pbarker.renesas@gmail.com, 
	openembedded-architecture <openembedded-architecture@lists.openembedded.org>, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	Ross Burton <ross.burton@arm.com>
Content-Type: multipart/alternative; boundary="0000000000007daf4b0615328326"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Apr 2024 15:02:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197922

--0000000000007daf4b0615328326
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for that initiative Michael and Paul, this is very helpful for the
greater community!

Greets,
Josef

On Wed, Apr 3, 2024 at 4:59=E2=80=AFPM Michael Opdenacker via lists.yoctopr=
oject.org
<michael.opdenacker=3Dbootlin.com@lists.yoctoproject.org> wrote:

> Hi Paul,
>
> On 4/2/24 at 10:38, Paul Barker wrote:
> > On 28/03/2024 14:36, Ross Burton wrote:
> >> Hi,
> >>
> >> At the moment if a layer doesn=E2=80=99t have enough volume to justify=
 a
> dedicated mailing list for patches (see, for example,
> meta-arm@lists.yoctoproject.org <mailto:meta-arm@lists.yoctoproject.org>)
> then the convention is that the patches can be sent to
> yocto@lists.yoctoproject.org <mailto:yocto@lists.yoctoproject.org>.
> >>
> >> However, that=E2=80=99s also the list that we encourage users of Yocto=
 to use
> for help, so the list has a mix of patches for various layers and people
> asking for help, which isn=E2=80=99t ideal: users who want help don=E2=80=
=99t want to be
> flooded with patches for layers they=E2=80=99re not using, layer maintain=
ers may
> not want to see the requests for help, and people who want the status
> reports have to receive patches and support.
> >>
> >> The Yocto TSC has been discussing this, and as a solution to this we=
=E2=80=99ve
> just created a new mailing list: yocto-patches@lists.yoctoproject.org
> <mailto:yocto-patches@lists.yoctoproject.org>.  This list is specifically
> for Yocto-related projects which don=E2=80=99t have their own mailing lis=
t or other
> patch submission process.   We ask that all layers currently using yocto@
> for patches move to yocto-patches@, so that yocto@ can be used purely for
> discussion and other non-patch related subjects.
> > I think this is a great change, along with the new yocto-status@ list
> it will make things easier to follow :)
> >
> > Do you know if yocto-patches@ will be available via lore.kernel.org?
>
> I've just asked them to index the new lists as well as these important
> ones which are missing too:
> https://lists.yoctoproject.org/g/yocto-announce
> http://lists.openembedded.org/mailman/listinfo/openembedded-architecture
> https://lists.yoctoproject.org/g/automated-testing
> https://lists.yoctoproject.org/g/yocto-security
>
> Cheers
> Michael.
>
> --
> Michael Opdenacker, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> You automatically follow any topics you start or reply to.
> View/Reply Online (#62883):
> https://lists.yoctoproject.org/g/yocto/message/62883
> Mute This Topic: https://lists.yoctoproject.org/mt/105284127/4689568
> Group Owner: yocto+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/yocto/unsub [
> jester@theyoctojester.info]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000007daf4b0615328326
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for that initiative Michael and Paul, this is very =
helpful for the greater community!<div><br></div><div>Greets,</div><div>Jos=
ef</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmai=
l_attr">On Wed, Apr 3, 2024 at 4:59=E2=80=AFPM Michael Opdenacker via <a hr=
ef=3D"http://lists.yoctoproject.org">lists.yoctoproject.org</a> &lt;michael=
.opdenacker=3D<a href=3D"mailto:bootlin.com@lists.yoctoproject.org">bootlin=
.com@lists.yoctoproject.org</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-l=
eft-style:solid;border-left-color:rgb(204,204,204);padding-left:1ex">Hi Pau=
l,<br>
<br>
On 4/2/24 at 10:38, Paul Barker wrote:<br>
&gt; On 28/03/2024 14:36, Ross Burton wrote:<br>
&gt;&gt; Hi,<br>
&gt;&gt;<br>
&gt;&gt; At the moment if a layer doesn=E2=80=99t have enough volume to jus=
tify a dedicated mailing list for patches (see, for example, <a href=3D"mai=
lto:meta-arm@lists.yoctoproject.org" target=3D"_blank">meta-arm@lists.yocto=
project.org</a> &lt;mailto:<a href=3D"mailto:meta-arm@lists.yoctoproject.or=
g" target=3D"_blank">meta-arm@lists.yoctoproject.org</a>&gt;) then the conv=
ention is that the patches can be sent to <a href=3D"mailto:yocto@lists.yoc=
toproject.org" target=3D"_blank">yocto@lists.yoctoproject.org</a> &lt;mailt=
o:<a href=3D"mailto:yocto@lists.yoctoproject.org" target=3D"_blank">yocto@l=
ists.yoctoproject.org</a>&gt;.<br>
&gt;&gt;<br>
&gt;&gt; However, that=E2=80=99s also the list that we encourage users of Y=
octo to use for help, so the list has a mix of patches for various layers a=
nd people asking for help, which isn=E2=80=99t ideal: users who want help d=
on=E2=80=99t want to be flooded with patches for layers they=E2=80=99re not=
 using, layer maintainers may not want to see the requests for help, and pe=
ople who want the status reports have to receive patches and support.<br>
&gt;&gt;<br>
&gt;&gt; The Yocto TSC has been discussing this, and as a solution to this =
we=E2=80=99ve just created a new mailing list: <a href=3D"mailto:yocto-patc=
hes@lists.yoctoproject.org" target=3D"_blank">yocto-patches@lists.yoctoproj=
ect.org</a> &lt;mailto:<a href=3D"mailto:yocto-patches@lists.yoctoproject.o=
rg" target=3D"_blank">yocto-patches@lists.yoctoproject.org</a>&gt;.=C2=A0 T=
his list is specifically for Yocto-related projects which don=E2=80=99t hav=
e their own mailing list or other patch submission process.=C2=A0 =C2=A0We =
ask that all layers currently using yocto@ for patches move to yocto-patche=
s@, so that yocto@ can be used purely for discussion and other non-patch re=
lated subjects.<br>
&gt; I think this is a great change, along with the new yocto-status@ list =
it will make things easier to follow :)<br>
&gt;<br>
&gt; Do you know if yocto-patches@ will be available via <a href=3D"http://=
lore.kernel.org" rel=3D"noreferrer" target=3D"_blank">lore.kernel.org</a>?<=
br>
<br>
I&#39;ve just asked them to index the new lists as well as these important =
<br>
ones which are missing too:<br>
<a href=3D"https://lists.yoctoproject.org/g/yocto-announce" rel=3D"noreferr=
er" target=3D"_blank">https://lists.yoctoproject.org/g/yocto-announce</a><b=
r>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-arch=
itecture" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.or=
g/mailman/listinfo/openembedded-architecture</a><br>
<a href=3D"https://lists.yoctoproject.org/g/automated-testing" rel=3D"noref=
errer" target=3D"_blank">https://lists.yoctoproject.org/g/automated-testing=
</a><br>
<a href=3D"https://lists.yoctoproject.org/g/yocto-security" rel=3D"noreferr=
er" target=3D"_blank">https://lists.yoctoproject.org/g/yocto-security</a><b=
r>
<br>
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
You automatically follow any topics you start or reply to.<br>
View/Reply Online (#62883): <a href=3D"https://lists.yoctoproject.org/g/yoc=
to/message/62883" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctop=
roject.org/g/yocto/message/62883</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/105284127/468=
9568" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/105284127/4689568</a><br>
Group Owner: <a href=3D"mailto:yocto%2Bowner@lists.yoctoproject.org" target=
=3D"_blank">yocto+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/yocto/unsub" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/yocto/un=
sub</a> [<a href=3D"mailto:jester@theyoctojester.info" target=3D"_blank">je=
ster@theyoctojester.info</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000007daf4b0615328326--

