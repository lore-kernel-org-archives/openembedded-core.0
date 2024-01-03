Return-Path: <skulkarni@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73B71C47079
	for <webhook@archiver.kernel.org>; Wed,  3 Jan 2024 11:20:24 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.15434.1704280815509064491
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jan 2024 03:20:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=OwTLR0qg;
 spf=pass (domain: mvista.com, ip: 209.85.167.52, mailfrom: skulkarni@mvista.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-50e7c6e3c63so7273247e87.3
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jan 2024 03:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1704280814; x=1704885614; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gwob8N9V5shMBundC0k2f74B3b/xVZYHaJr2phdlmIw=;
        b=OwTLR0qgezlQpkhsHBGdzfGoZIBXK5+U9oafCjuv/NsptzxmWc918gHURYPISplB7E
         SCDub/jkW8bga5P51kkm9Jzyt0AlL3IubULA8nqwi/QUkaa/Tmzrc6igwWfgEYuyPaaP
         t4odNdQNmBS+pl/3kd59brQHs0ienr6/gjPAc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704280814; x=1704885614;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gwob8N9V5shMBundC0k2f74B3b/xVZYHaJr2phdlmIw=;
        b=URc9SKkEPdcElumPAPPZn8peT+g3MxyRlux1uNIiF7whNNSWdPLAfgvVcO6NRZuYyZ
         11NwUaGhC4rUQSaer0l8SNjg2EUlnzlDgCLHMUaIW4FW3izwoh1hkHKJXvnbFJLC604B
         s1vRwh1VVsCttvyAzSFbX2cmyJ48nYMWaHOh/ddHuLYJxV8Yno74LZ9V2zJYQbXeQBZ7
         g9AWCaJoHf/SgUznKrRK33WaJdvXjTvCMS36Arq04SgMKwLfV3wzuWadnJPLFXzwYvQU
         d/DbriP8WXscklBfVgY1uY35ygFnFiYCeCTZvPWz/b+8qVLOFNlPGlZkeNY43hLJqaKw
         ySnw==
X-Gm-Message-State: AOJu0Yw4znExbEpiaUelttZ2vwF8GDrAs+7tLGt6to+yA7Ob2S5Fzdqi
	Y98Po/8pTEt5AYIC+vAHhJ1jeiqhtQcXuv71WKgqIokDCj4FHw==
X-Google-Smtp-Source: AGHT+IHhUgr+YVV0TOo+UHr9jmict1MWzQBUCPKrwEXwwl2mt97CV9uo3NNGN5FGqwBj1tmmmhzaVhRsa8+AdEP47SQ=
X-Received: by 2002:a05:6512:ac7:b0:50e:7f67:b6a3 with SMTP id
 n7-20020a0565120ac700b0050e7f67b6a3mr3656344lfu.214.1704280813428; Wed, 03
 Jan 2024 03:20:13 -0800 (PST)
MIME-Version: 1.0
References: <17A47110AD953EDF.18684@lists.openembedded.org>
 <CAKzga+y7yeFf95cP3qfkDpPTr0QXK+opNpCO0agT5EZu_EtdZA@mail.gmail.com>
 <CAOSpxdbCoxXa90ZskAAnJqHzofR7jN=PJ=f4udJRojDoLqimTQ@mail.gmail.com>
 <CAKzga+xx87rpLbCnAU4yaxfHr9DAOUBGQ75W8yEScxDxaQJ9RQ@mail.gmail.com> <CAOSpxdaW6Ku8d9h_Ce=ixB=UQEK_M+2UA=zFS54OkZL89vy-Jw@mail.gmail.com>
In-Reply-To: <CAOSpxdaW6Ku8d9h_Ce=ixB=UQEK_M+2UA=zFS54OkZL89vy-Jw@mail.gmail.com>
From: Shubham Kulkarni <skulkarni@mvista.com>
Date: Wed, 3 Jan 2024 16:49:57 +0530
Message-ID: <CAKzga+wo+M_RWKDeq98OCeWQH+kBFFSQmv_9-6sThLjgeMkRpg@mail.gmail.com>
Subject: Re: [OE-core][dunfell][PATCH] tzdata: Upgrade to 2023d
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org, 
	Armin Kuster <akuster@mvista.com>, Mahesh Mathapati <mmathapati@mvista.com>, 
	Jeremy Puhlman <jpuhlman@mvista.com>, Sam Kappen <skappen@mvista.com>
Content-Type: multipart/alternative; boundary="0000000000007b80ff060e08cc93"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jan 2024 11:20:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193282

--0000000000007b80ff060e08cc93
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you Steve!

Thanks,
Shubham Kulkarni



On Tue, Jan 2, 2024 at 11:19=E2=80=AFPM Steve Sakoman <steve@sakoman.com> w=
rote:

> On Mon, Jan 1, 2024 at 8:26=E2=80=AFAM Shubham Kulkarni <skulkarni@mvista=
.com>
> wrote:
> >
> > Hi Steve,
> >
> > Thanks for your response. Will it be possible to merge this patch in
> dunfell-nut till Jan 02, if there are no issues with the patch.
>
> Yes, it is now merged in stable/dunfell-nut
>
> Steve
>
> > On Sat, Dec 30, 2023 at 9:03=E2=80=AFPM Steve Sakoman <steve@sakoman.co=
m> wrote:
> >>
> >> On Sat, Dec 30, 2023 at 4:37=E2=80=AFAM Shubham Kulkarni <skulkarni@mv=
ista.com>
> wrote:
> >> >
> >> > Hi Steve,
> >> >
> >> > I have sent this patch to upgrade tzdata to the latest version
> "2023d" for dunfell branch.
> >> > The mailing list link for the same:
> https://lists.openembedded.org/g/openembedded-core/message/192913
> >> >
> >> > Can you please check if this patch can be accepted in the dunfell-nu=
t
> branch of oe-core-contrib.
> >>
> >> I can take it now that it has been merged to the master branch.
> >>
> >> Steve
> >>
> >>
> >> > On Tue, Dec 26, 2023 at 10:44=E2=80=AFPM Shubham Kulkarni via
> lists.openembedded.org <skulkarni=3Dmvista.com@lists.openembedded.org>
> wrote:
> >> >>
> >> >> From: Shubham Kulkarni <skulkarni@mvista.com>
> >> >>
> >> >> Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
> >> >> ---
> >> >>  meta/recipes-extended/timezone/timezone.inc | 6 +++---
> >> >>  1 file changed, 3 insertions(+), 3 deletions(-)
> >> >>
> >> >> diff --git a/meta/recipes-extended/timezone/timezone.inc
> b/meta/recipes-extended/timezone/timezone.inc
> >> >> index 2960bfefe3..75f13cfc94 100644
> >> >> --- a/meta/recipes-extended/timezone/timezone.inc
> >> >> +++ b/meta/recipes-extended/timezone/timezone.inc
> >> >> @@ -6,7 +6,7 @@ SECTION =3D "base"
> >> >>  LICENSE =3D "PD & BSD-3-Clause"
> >> >>  LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3Dc679c9d6b02bc2757b3eaf8f53c43fba"
> >> >>
> >> >> -PV =3D "2023c"
> >> >> +PV =3D "2023d"
> >> >>
> >> >>  SRC_URI =3D"
> http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;nam=
e=3Dtzcode
> \
> >> >>
> http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;nam=
e=3Dtzdata
> \
> >> >> @@ -14,5 +14,5 @@ SRC_URI =3D"
> http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz
> >> >>
> >> >>  UPSTREAM_CHECK_URI =3D "http://www.iana.org/time-zones"
> >> >>
> >> >> -SRC_URI[tzcode.sha256sum] =3D
> "46d17f2bb19ad73290f03a203006152e0fa0d7b11e5b71467c4a823811b214e7"
> >> >> -SRC_URI[tzdata.sha256sum] =3D
> "3f510b5d1b4ae9bb38e485aa302a776b317fb3637bdb6404c4adf7b6cadd965c"
> >> >> +SRC_URI[tzcode.sha256sum] =3D
> "e9a5f9e118886d2de92b62bb05510a28cc6c058d791c93bd6b84d3292c3c161e"
> >> >> +SRC_URI[tzdata.sha256sum] =3D
> "dbca21970b0a8b8c0ceceec1d7b91fa903be0f6eca5ae732b5329672232a08f3"
> >> >> --
> >> >> 2.42.0
> >> >>
> >> >>
> >> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> >> Links: You receive all messages sent to this group.
> >> >> View/Reply Online (#192913):
> https://lists.openembedded.org/g/openembedded-core/message/192913
> >> >> Mute This Topic: https://lists.openembedded.org/mt/103372051/703209=
1
> >> >> Group Owner: openembedded-core+owner@lists.openembedded.org
> >> >> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub [
> skulkarni@mvista.com]
> >> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> >>
>

--0000000000007b80ff060e08cc93
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thank you Steve!<br></div><div><br></div><div>Thanks,=
</div><div>Shubham Kulkarni</div><div><br></div><div><br></div></div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan =
2, 2024 at 11:19=E2=80=AFPM Steve Sakoman &lt;<a href=3D"mailto:steve@sakom=
an.com">steve@sakoman.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">On Mon, Jan 1, 2024 at 8:26=E2=80=AFAM Shubham Kul=
karni &lt;<a href=3D"mailto:skulkarni@mvista.com" target=3D"_blank">skulkar=
ni@mvista.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi Steve,<br>
&gt;<br>
&gt; Thanks for your response. Will it be possible to merge this patch in d=
unfell-nut till Jan 02, if there are no issues with the patch.<br>
<br>
Yes, it is now merged in stable/dunfell-nut<br>
<br>
Steve<br>
<br>
&gt; On Sat, Dec 30, 2023 at 9:03=E2=80=AFPM Steve Sakoman &lt;<a href=3D"m=
ailto:steve@sakoman.com" target=3D"_blank">steve@sakoman.com</a>&gt; wrote:=
<br>
&gt;&gt;<br>
&gt;&gt; On Sat, Dec 30, 2023 at 4:37=E2=80=AFAM Shubham Kulkarni &lt;<a hr=
ef=3D"mailto:skulkarni@mvista.com" target=3D"_blank">skulkarni@mvista.com</=
a>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Hi Steve,<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; I have sent this patch to upgrade tzdata to the latest versio=
n &quot;2023d&quot; for dunfell branch.<br>
&gt;&gt; &gt; The mailing list link for the same: <a href=3D"https://lists.=
openembedded.org/g/openembedded-core/message/192913" rel=3D"noreferrer" tar=
get=3D"_blank">https://lists.openembedded.org/g/openembedded-core/message/1=
92913</a><br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Can you please check if this patch can be accepted in the dun=
fell-nut branch of oe-core-contrib.<br>
&gt;&gt;<br>
&gt;&gt; I can take it now that it has been merged to the master branch.<br=
>
&gt;&gt;<br>
&gt;&gt; Steve<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; &gt; On Tue, Dec 26, 2023 at 10:44=E2=80=AFPM Shubham Kulkarni via=
 <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bl=
ank">lists.openembedded.org</a> &lt;skulkarni=3D<a href=3D"mailto:mvista.co=
m@lists.openembedded.org" target=3D"_blank">mvista.com@lists.openembedded.o=
rg</a>&gt; wrote:<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; From: Shubham Kulkarni &lt;<a href=3D"mailto:skulkarni@mv=
ista.com" target=3D"_blank">skulkarni@mvista.com</a>&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Signed-off-by: Shubham Kulkarni &lt;<a href=3D"mailto:sku=
lkarni@mvista.com" target=3D"_blank">skulkarni@mvista.com</a>&gt;<br>
&gt;&gt; &gt;&gt; ---<br>
&gt;&gt; &gt;&gt;=C2=A0 meta/recipes-extended/timezone/timezone.inc | 6 +++=
---<br>
&gt;&gt; &gt;&gt;=C2=A0 1 file changed, 3 insertions(+), 3 deletions(-)<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; diff --git a/meta/recipes-extended/timezone/timezone.inc =
b/meta/recipes-extended/timezone/timezone.inc<br>
&gt;&gt; &gt;&gt; index 2960bfefe3..75f13cfc94 100644<br>
&gt;&gt; &gt;&gt; --- a/meta/recipes-extended/timezone/timezone.inc<br>
&gt;&gt; &gt;&gt; +++ b/meta/recipes-extended/timezone/timezone.inc<br>
&gt;&gt; &gt;&gt; @@ -6,7 +6,7 @@ SECTION =3D &quot;base&quot;<br>
&gt;&gt; &gt;&gt;=C2=A0 LICENSE =3D &quot;PD &amp; BSD-3-Clause&quot;<br>
&gt;&gt; &gt;&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dc67=
9c9d6b02bc2757b3eaf8f53c43fba&quot;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; -PV =3D &quot;2023c&quot;<br>
&gt;&gt; &gt;&gt; +PV =3D &quot;2023d&quot;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;=C2=A0 SRC_URI =3D&quot; <a href=3D"http://www.iana.org/ti=
me-zones/repository/releases/tzcode$%7BPV%7D.tar.gz;name=3Dtzcode" rel=3D"n=
oreferrer" target=3D"_blank">http://www.iana.org/time-zones/repository/rele=
ases/tzcode${PV}.tar.gz;name=3Dtzcode</a> \<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D=
"http://www.iana.org/time-zones/repository/releases/tzdata$%7BPV%7D.tar.gz;=
name=3Dtzdata" rel=3D"noreferrer" target=3D"_blank">http://www.iana.org/tim=
e-zones/repository/releases/tzdata${PV}.tar.gz;name=3Dtzdata</a> \<br>
&gt;&gt; &gt;&gt; @@ -14,5 +14,5 @@ SRC_URI =3D&quot; <a href=3D"http://www=
.iana.org/time-zones/repository/releases/tzcode$%7BPV%7D.tar.gz" rel=3D"nor=
eferrer" target=3D"_blank">http://www.iana.org/time-zones/repository/releas=
es/tzcode${PV}.tar.gz</a><br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;=C2=A0 UPSTREAM_CHECK_URI =3D &quot;<a href=3D"http://www.=
iana.org/time-zones" rel=3D"noreferrer" target=3D"_blank">http://www.iana.o=
rg/time-zones</a>&quot;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; -SRC_URI[tzcode.sha256sum] =3D &quot;46d17f2bb19ad73290f0=
3a203006152e0fa0d7b11e5b71467c4a823811b214e7&quot;<br>
&gt;&gt; &gt;&gt; -SRC_URI[tzdata.sha256sum] =3D &quot;3f510b5d1b4ae9bb38e4=
85aa302a776b317fb3637bdb6404c4adf7b6cadd965c&quot;<br>
&gt;&gt; &gt;&gt; +SRC_URI[tzcode.sha256sum] =3D &quot;e9a5f9e118886d2de92b=
62bb05510a28cc6c058d791c93bd6b84d3292c3c161e&quot;<br>
&gt;&gt; &gt;&gt; +SRC_URI[tzdata.sha256sum] =3D &quot;dbca21970b0a8b8c0cec=
eec1d7b91fa903be0f6eca5ae732b5329672232a08f3&quot;<br>
&gt;&gt; &gt;&gt; --<br>
&gt;&gt; &gt;&gt; 2.42.0<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; &gt;&gt; Links: You receive all messages sent to this group.<br>
&gt;&gt; &gt;&gt; View/Reply Online (#192913): <a href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/message/192913" rel=3D"noreferrer" target=
=3D"_blank">https://lists.openembedded.org/g/openembedded-core/message/1929=
13</a><br>
&gt;&gt; &gt;&gt; Mute This Topic: <a href=3D"https://lists.openembedded.or=
g/mt/103372051/7032091" rel=3D"noreferrer" target=3D"_blank">https://lists.=
openembedded.org/mt/103372051/7032091</a><br>
&gt;&gt; &gt;&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@=
lists.openembedded.org" target=3D"_blank">openembedded-core+owner@lists.ope=
nembedded.org</a><br>
&gt;&gt; &gt;&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/=
openembedded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists=
.openembedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:skulkarn=
i@mvista.com" target=3D"_blank">skulkarni@mvista.com</a>]<br>
&gt;&gt; &gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; &gt;&gt;<br>
</blockquote></div>

--0000000000007b80ff060e08cc93--

