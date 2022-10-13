Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 467F8C433FE
	for <webhook@archiver.kernel.org>; Thu, 13 Oct 2022 10:02:52 +0000 (UTC)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
 by mx.groups.io with SMTP id smtpd.web09.5788.1665655364284091936
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Oct 2022 03:02:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=D5pptQpK;
 spf=pass (domain: gmail.com, ip: 209.85.166.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-io1-f54.google.com with SMTP id b79so748542iof.5
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Oct 2022 03:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oD+SJgvMxead7KHSAUMzqVFuSQEz1VBW36j1x+nhWaI=;
        b=D5pptQpKq+knDQjcrix9CxPUPa9Lznc/zK7VK8fPMuKabfKquZ45eHdP84GyLJ/6wm
         MeFOG/OPLoDzEhdGvAcz1UAHlDcr0cqjplyt2zRRKIW/SCug3veiMVNc4XNUT0gdACfN
         H+WtNtoPZ0Hw/0RcYjyS6EFf73cOAzrRf/TG4LyWKqo0e8520G78j6114z6AyRrvumyr
         XR4qk5MocjF480O40PaXY/htstblrE4qxCE2D08XXz/OzkMsKg4fRKQKZbPbMmEBCB1b
         +t4VKUnIbxtXtWimmjDmy3ri5Es2OSlDA9kimgB4d9mkFG+SNsaiy5/kzdZU1j4bUP6A
         e+AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oD+SJgvMxead7KHSAUMzqVFuSQEz1VBW36j1x+nhWaI=;
        b=pyCchfMHdIK8Mn27M8agxJV+CMuopgIjdcXRcVn6QTUmwSNDGCKdG4knq1cX40gNWM
         idMYYmo7GR88RXVfu7rL0HL2jHRIzgdOLqVl47kFlAfVZnycdwUl6c9lXt2LwjBsFjUD
         1uNbi6/V8ui20aHS3nOCgsD1x518vq4db6x0Jg1XFHZDkhGdzvvTTKzXyPiqJGtIsSWY
         /7P9didSNx4nU6TO4PgtImmExrJsFh7Y0ea0OT0dlMtR4OQ/RdlZlsIoEo3d5nUBhD6l
         bUbMr+vwm3iDEki8mYktunzvLakd+rfmlQgm5KTthNNSYETzC2+CgWGtOqXFEcK39CC+
         dv4w==
X-Gm-Message-State: ACrzQf2IYbtBlfyAPL84h0JOvdQCGZzht4/xvXVuGCLDYOBCQmXB11gE
	8StbuotMRHXYjK/LiegwG27y6lybnSJ19SwSNhM=
X-Google-Smtp-Source: AMsMyM55JpJod5/bW/qlv864J9jzXA2IbGPxAsonzukdzdOFi1s4SxevTeNUv4GBtN90QoKDCWuO9clhpqQgAIC5Uxw=
X-Received: by 2002:a05:6602:341c:b0:6bc:1c3d:836e with SMTP id
 n28-20020a056602341c00b006bc1c3d836emr9747728ioz.24.1665655363706; Thu, 13
 Oct 2022 03:02:43 -0700 (PDT)
MIME-Version: 1.0
References: <CAApg2=TmNEnu+KQTz9iJ72LaduRoHQh_YwevzJgpROj5C8qJew@mail.gmail.com>
 <Y0fFumcfL7RGRxvL@mail.local> <CAApg2=S0J4iqqPNVuYd6Dw8D6x5wM_0e6f6iq2bCeL0x+fH=7A@mail.gmail.com>
 <CANNYZj8nm3BGTUXN+j8gWGGhvWTKscVM_1Q+tBvdJyqFQVne2g@mail.gmail.com> <CAApg2=SaWifk0RtRmAEKj-e=WHLbvq3bdXFG6=oLfXw_SCnRAA@mail.gmail.com>
In-Reply-To: <CAApg2=SaWifk0RtRmAEKj-e=WHLbvq3bdXFG6=oLfXw_SCnRAA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 13 Oct 2022 12:02:32 +0200
Message-ID: <CANNYZj8J-s8PH_P6zSDKvpAvjOizBM2fogLBReq4mX7d3ZWYAA@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone] core-image-weston doesn't build
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000045a4bc05eae79cbb"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Oct 2022 10:02:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171697

--00000000000045a4bc05eae79cbb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I guess it=E2=80=99s not. I=E2=80=99ve been pushing to enable these in oe-c=
ore but we=E2=80=99re
not there yet. You get them enabled by default in poky.

Alex

On Thu 13. Oct 2022 at 11.59, Marta Rybczynska <rybczynska@gmail.com> wrote=
:

> $ bitbake weston
> Loading cache: 100%
>
> |########################################################################=
###########################################################|
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
> > >> > I'm trying to build the core-image-weston in kirkstone to look int=
o
> > >> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14926
> > >> >
> > >> > It turns out that the image does not build (oe-core
> > >> > e728d0965d6fda8ac54e065ca7bf7eb9da9a8170 with bitbake
> > >> > 6603c3e39f1cf746669ec6c9f0be8c6e6ece426e). I'm getting:
> > >> >
> > >> > $ bitbake core-image-weston
> > >> > Loading cache: 100%
> > >> >
> |########################################################################=
###########################################################|
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
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#171687):
> https://lists.openembedded.org/g/openembedded-core/message/171687
> > > Mute This Topic: https://lists.openembedded.org/mt/94299411/1686489
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub
> [alex.kanavin@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >
>

--00000000000045a4bc05eae79cbb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I guess it=E2=80=99s not. I=E2=80=99ve been pushing to en=
able these in oe-core but we=E2=80=99re not there yet. You get them enabled=
 by default in poky.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Ale=
x</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">On Thu 13. Oct 2022 at 11.59, Marta Rybczynska &lt;<a href=3D"mailto:=
rybczynska@gmail.com">rybczynska@gmail.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-wid=
th:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,2=
04,204)">$ bitbake weston<br>
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
expected to build by default with oe-core?<br>
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
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt; Links: You receive all messages sent to this group.<br>
&gt; &gt; View/Reply Online (#171687): <a href=3D"https://lists.openembedde=
d.org/g/openembedded-core/message/171687" rel=3D"noreferrer" target=3D"_bla=
nk">https://lists.openembedded.org/g/openembedded-core/message/171687</a><b=
r>
&gt; &gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/942=
99411/1686489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembed=
ded.org/mt/94299411/1686489</a><br>
&gt; &gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.op=
enembedded.org" target=3D"_blank">openembedded-core+owner@lists.openembedde=
d.org</a><br>
&gt; &gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembe=
dded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gma=
il.com" target=3D"_blank">alex.kanavin@gmail.com</a>]<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt;<br>
</blockquote></div></div>

--00000000000045a4bc05eae79cbb--

