Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86022C4332F
	for <webhook@archiver.kernel.org>; Thu, 13 Oct 2022 14:01:23 +0000 (UTC)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
 by mx.groups.io with SMTP id smtpd.web09.7920.1665669674182213806
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Oct 2022 07:01:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ELI3r0CO;
 spf=pass (domain: gmail.com, ip: 209.85.210.47, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f47.google.com with SMTP id e53-20020a9d01b8000000b006619152f3cdso87246ote.0
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Oct 2022 07:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lShgFwgduS4tuFYAm0DOnXOD1N9FLJA24iEdT3JhVJk=;
        b=ELI3r0CO2rQahCHJMNh5j2taymIjCN1T+yVZyv18e08mxscGjxW30KiH4oKL6ifByP
         t6zvzskJLZhUTWa163T6jl7k/jLJth43BXnKLGDWZivP5t93+9KFnaRGCrmHKCndFB9Z
         oE1C24ApwwN7RO86syyfaURJBD4BkMDlbXHBaJxfOn8vr5riSTdoZgoyqbsLHW2aKnEO
         P+7ymFaSjbIJupDGa9H9ShwWi6CjCwe1tVDpDxjf/5F7PCbbDgeoc+Sx71xbF5NqSETP
         JEUddK03xEmyySm0fbVaqakXrFx4zaf83p/qxQuh0RqThXLLzsfkoQmwYvikLfScTmh5
         WaOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lShgFwgduS4tuFYAm0DOnXOD1N9FLJA24iEdT3JhVJk=;
        b=bZHtOEPlGY5Y9ah4mZeuAWlG3ePTstdanyxoP3mIPS8Q8KDOyD/9PXE5IMFIDx5dJJ
         S7ce7ikgWU+5yCqUT0i4OLqo9gJGwG5qCdUH+N7BdiZe6FaOoku83gkW7rvNz5xbtI9F
         hh9P03UNIXo9dEAJFrer7DEgLyI6M9De5yBpDJ7OSxEKMbg25abcU9rDC/w+9Q/1CiXe
         9cbLXVwEn0TLe4BRg2FdNWGTlw2UUtz1DY6vl17Ri3pWr7Ww3qtWfCvZfBXNMv3p3cnz
         Fk+YuysnHtlW/lEEy2/Uuf7yojBA6W4skyv2QONtBxVnmjRNhjW95ilRoQxEtEUuBNCd
         1M5Q==
X-Gm-Message-State: ACrzQf3aESP+ZuN2bIWsqNdoavHUhIOK0Zm/JyvyFShO4Cfhp1VhIo74
	N+4mMjWhgxUqPNTIR+LCjzysAQhWXRk9eGwaEZI=
X-Google-Smtp-Source: AMsMyM786s1npoVg//hMLAFthmf9nLGCtKiz6O9PMEMVON0S1IXW6UGs+fEzTAjP9zGmVybGGDpmYNM6O1m5xeAE524=
X-Received: by 2002:a9d:61d6:0:b0:661:c1ad:848f with SMTP id
 h22-20020a9d61d6000000b00661c1ad848fmr56505otk.111.1665669671976; Thu, 13 Oct
 2022 07:01:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAApg2=TmNEnu+KQTz9iJ72LaduRoHQh_YwevzJgpROj5C8qJew@mail.gmail.com>
 <Y0fFumcfL7RGRxvL@mail.local> <CAApg2=S0J4iqqPNVuYd6Dw8D6x5wM_0e6f6iq2bCeL0x+fH=7A@mail.gmail.com>
 <CANNYZj8nm3BGTUXN+j8gWGGhvWTKscVM_1Q+tBvdJyqFQVne2g@mail.gmail.com> <CAApg2=SaWifk0RtRmAEKj-e=WHLbvq3bdXFG6=oLfXw_SCnRAA@mail.gmail.com>
In-Reply-To: <CAApg2=SaWifk0RtRmAEKj-e=WHLbvq3bdXFG6=oLfXw_SCnRAA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Oct 2022 07:01:01 -0700
Message-ID: <CAMKF1sqa9F0wSOq0aX-NQxVCCMBD5ABCZG2WiiUApn-EQmY20w@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone] core-image-weston doesn't build
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000001c824505eaeaf1e4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Oct 2022 14:01:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171704

--0000000000001c824505eaeaf1e4
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 13, 2022 at 2:59 AM Marta Rybczynska <rybczynska@gmail.com>
wrote:

> $ bitbake weston
> Loading cache: 100%
>
> |###################################################################################################################################|
> Time: 0:00:00
> Loaded 1640 entries from dependency cache.
> ERROR: Nothing PROVIDES 'weston'
> weston was skipped: missing required distro features 'wayland opengl'
> (not in DISTRO_FEATURES)
>
> Summary: There was 1 ERROR message, returning a non-zero exit code.
>
> I can add distro-features et al, just wondering if this image is
> expected to build by default with oe-core?


With poky yes but with vanilla oe-core it needs to enable OpenGL by default
for nodistro

>
>
> Regards,
> Marta
>
> On Thu, Oct 13, 2022 at 10:15 AM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > What happens when you run 'bitbake weston'?
> >
> > Alex
> >
> > On Thu, 13 Oct 2022 at 10:10, Marta Rybczynska <rybczynska@gmail.com>
> wrote:
> > >
> > >
> > >
> > > On Thu, 13 Oct 2022, 17:00 Alexandre Belloni, <
> alexandre.belloni@bootlin.com> wrote:
> > >>
> > >> On 13/10/2022 09:52:44+0200, Marta Rybczynska wrote:
> > >> > Hello all,
> > >> > I'm trying to build the core-image-weston in kirkstone to look into
> > >> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=14926
> > >> >
> > >> > It turns out that the image does not build (oe-core
> > >> > e728d0965d6fda8ac54e065ca7bf7eb9da9a8170 with bitbake
> > >> > 6603c3e39f1cf746669ec6c9f0be8c6e6ece426e). I'm getting:
> > >> >
> > >> > $ bitbake core-image-weston
> > >> > Loading cache: 100%
> > >> >
> |###################################################################################################################################|
> > >> > Time: 0:00:00
> > >> > Loaded 1640 entries from dependency cache.
> > >> > NOTE: Resolving any missing task queue dependencies
> > >> > ERROR: Nothing RPROVIDES 'weston-xwayland' (but
> > >> > /oe-standalone/oe-core/meta/recipes-graphics/images/
> core-image-weston.bb
> > >> > RDEPENDS on
> > >> > or otherwise requires it)
> > >> > NOTE: Runtime target 'weston-xwayland' is unbuildable, removing...
> > >> > Missing or unbuildable dependency chain was: ['weston-xwayland']
> > >> > ERROR: Required build target 'core-image-weston' has no buildable
> providers.
> > >> > Missing or unbuildable dependency chain was: ['core-image-weston',
> > >> > 'weston-xwayland']
> > >> >
> > >> > Summary: There were 2 ERROR messages, returning a non-zero exit
> code.
> > >> >
> > >> > I can't find this one in bugzilla. Is it a known issue?
> > >> >
> > >>
> > >> Did you remove x11 from your DISTRO_FEATURES?
> > >
> > >
> > > No. This is a fresh clone. The only changes I have are in local.conf:
> DL_DIR and parallel build options. That's why I'm surprised.
> > >
> > > Regards
> > > Marta
> > >
> > >
> > >
> > >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171696):
> https://lists.openembedded.org/g/openembedded-core/message/171696
> Mute This Topic: https://lists.openembedded.org/mt/94299411/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000001c824505eaeaf1e4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Oct 13, 2022 at 2:59 AM Marta Rybczynska &lt;<a hre=
f=3D"mailto:rybczynska@gmail.com">rybczynska@gmail.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-col=
or:rgb(204,204,204)">$ bitbake weston<br>
Loading cache: 100%<br>
|##########################################################################=
#########################################################|<br>
Time: 0:00:00<br>
Loaded 1640 entries from dependency cache.<br>
ERROR: Nothing PROVIDES &#39;weston&#39;<br>
weston was skipped: missing required distro features &#39;wayland opengl&#3=
9;<br>
(not in DISTRO_FEATURES)<br>
<br>
Summary: There was 1 ERROR message, returning a non-zero exit code.<br>
<br>
I can add distro-features et al, just wondering if this image is<br>
expected to build by default with oe-core?</blockquote><div dir=3D"auto"><b=
r></div><div dir=3D"auto">With poky yes but with vanilla oe-core it needs t=
o enable OpenGL by default for nodistro=C2=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-le=
ft-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)" dir=3D"=
auto"><br>
<br>
Regards,<br>
Marta<br>
<br>
On Thu, Oct 13, 2022 at 10:15 AM Alexander Kanavin<br>
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavi=
n@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; What happens when you run &#39;bitbake weston&#39;?<br>
&gt;<br>
&gt; Alex<br>
&gt;<br>
&gt; On Thu, 13 Oct 2022 at 10:10, Marta Rybczynska &lt;<a href=3D"mailto:r=
ybczynska@gmail.com" target=3D"_blank">rybczynska@gmail.com</a>&gt; wrote:<=
br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; On Thu, 13 Oct 2022, 17:00 Alexandre Belloni, &lt;<a href=3D"mail=
to:alexandre.belloni@bootlin.com" target=3D"_blank">alexandre.belloni@bootl=
in.com</a>&gt; wrote:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; On 13/10/2022 09:52:44+0200, Marta Rybczynska wrote:<br>
&gt; &gt;&gt; &gt; Hello all,<br>
&gt; &gt;&gt; &gt; I&#39;m trying to build the core-image-weston in kirksto=
ne to look into<br>
&gt; &gt;&gt; &gt; <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cg=
i?id=3D14926" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctopr=
oject.org/show_bug.cgi?id=3D14926</a><br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; It turns out that the image does not build (oe-core<br>
&gt; &gt;&gt; &gt; e728d0965d6fda8ac54e065ca7bf7eb9da9a8170 with bitbake<br=
>
&gt; &gt;&gt; &gt; 6603c3e39f1cf746669ec6c9f0be8c6e6ece426e). I&#39;m getti=
ng:<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; $ bitbake core-image-weston<br>
&gt; &gt;&gt; &gt; Loading cache: 100%<br>
&gt; &gt;&gt; &gt; |#######################################################=
###########################################################################=
#|<br>
&gt; &gt;&gt; &gt; Time: 0:00:00<br>
&gt; &gt;&gt; &gt; Loaded 1640 entries from dependency cache.<br>
&gt; &gt;&gt; &gt; NOTE: Resolving any missing task queue dependencies<br>
&gt; &gt;&gt; &gt; ERROR: Nothing RPROVIDES &#39;weston-xwayland&#39; (but<=
br>
&gt; &gt;&gt; &gt; /oe-standalone/oe-core/meta/recipes-graphics/images/<a h=
ref=3D"http://core-image-weston.bb" rel=3D"noreferrer" target=3D"_blank">co=
re-image-weston.bb</a><br>
&gt; &gt;&gt; &gt; RDEPENDS on<br>
&gt; &gt;&gt; &gt; or otherwise requires it)<br>
&gt; &gt;&gt; &gt; NOTE: Runtime target &#39;weston-xwayland&#39; is unbuil=
dable, removing...<br>
&gt; &gt;&gt; &gt; Missing or unbuildable dependency chain was: [&#39;westo=
n-xwayland&#39;]<br>
&gt; &gt;&gt; &gt; ERROR: Required build target &#39;core-image-weston&#39;=
 has no buildable providers.<br>
&gt; &gt;&gt; &gt; Missing or unbuildable dependency chain was: [&#39;core-=
image-weston&#39;,<br>
&gt; &gt;&gt; &gt; &#39;weston-xwayland&#39;]<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; Summary: There were 2 ERROR messages, returning a non-ze=
ro exit code.<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; I can&#39;t find this one in bugzilla. Is it a known iss=
ue?<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Did you remove x11 from your DISTRO_FEATURES?<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; No. This is a fresh clone. The only changes I have are in local.c=
onf: DL_DIR and parallel build options. That&#39;s why I&#39;m surprised.<b=
r>
&gt; &gt;<br>
&gt; &gt; Regards<br>
&gt; &gt; Marta<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; <br>
&gt; &gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#171696): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/171696" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/171696</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/94299411/1997=
914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/94299411/1997914</a><br>
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

--0000000000001c824505eaeaf1e4--

