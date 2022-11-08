Return-Path: <wltu@google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1749BC433FE
	for <webhook@archiver.kernel.org>; Tue,  8 Nov 2022 19:30:24 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web12.1511.1667935820797240216
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Nov 2022 11:30:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20210112 header.b=lKFbTrrW;
 spf=pass (domain: google.com, ip: 209.85.219.43, mailfrom: wltu@google.com)
Received: by mail-qv1-f43.google.com with SMTP id e15so10908086qvo.4
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 11:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3uZPAAUVY2xFhWLyqn51cIUdWTmI65hqKgf7cqcQf2U=;
        b=lKFbTrrWjRibNw+jg0UUkyUwZuG+wHETERjGcYU9ug5L+IZf3bXhpEZwg3RDmBYcua
         GFHCxmYZRbvc349glQUPJdur9+MMsyRH6egJ7QKs9q4rXr59UW0maGgVQyGoDA+RRIF8
         KhxDxdShMtS68zpWTyyE89XTulirwpN5xsrY2LO3TjjNzCigfXsf0lS8hdTETn3Y8RTX
         vz25EDCDC4gZOdw5WF7Jlb2qaeydQ6zW3C90BGDrwaLxgefxGhG3aIpiUKt8uyjyt2xa
         Y6pUjB2kDYodo0hhKmpSDrT700h/hT4OtbgrpKpHJTYIzaK0Iddw/hyaEErJO2U5Vweg
         EJIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3uZPAAUVY2xFhWLyqn51cIUdWTmI65hqKgf7cqcQf2U=;
        b=loc8ixdGcq2TZPGUkxfGHLEXr0MHNwcI7/hdk8cWegyabr4WmnkqNS7pfinI61+c0B
         hagusAVa4vzFHGDjG7BhQQtWHHqLmlPnTBtH8aJWxSIuo0skMMLjapSZ7jh1CwB4n2Dj
         sAOgYUjmp0vLVrsuGSvE+AkVTR2RMERt3ng8wWf/5eWnBjRVNBGswB2E/S5FyDdV+JS0
         g1K99fxEFsHItu799usA/XaOXTBDOs+ls/sDZkYwznBh99U3spGJ8ofKD3GOF2LpM6qn
         FS4/lxf8kF5174zNUKI/yWSO8puCUNdQ5pzh/Ii8kcrv2ktZwtDDXksUH4u5NRzE+T1Q
         MAfA==
X-Gm-Message-State: ACrzQf39luspBaHtzHAL7ManMacSmie3nh392E5nlra6eIHL4IRYfnwV
	iW60TonMJU+TN5EszcI5+7dFpetIASguT5/tKXVmXQ==
X-Google-Smtp-Source: AMsMyM6l9OZNaEftiZl4HFydkAW04bBvbjmZBPDbVM2SpCB+pb8nLyhol6+5T1+iZRn3vTXCmveI4vcRYUeisjVWwOs=
X-Received: by 2002:ad4:5bc1:0:b0:4ad:34b2:d29c with SMTP id
 t1-20020ad45bc1000000b004ad34b2d29cmr51314460qvt.21.1667935819660; Tue, 08
 Nov 2022 11:30:19 -0800 (PST)
MIME-Version: 1.0
References: <IAS2.1666358226748943797.wkAx@lists.openembedded.org>
 <CAHwn2Xni=DChyNRGfrQ=qVgrEK3b=0AhRMx+MAONYcWW9-V_=A@mail.gmail.com>
 <C7082AE8-28B1-4277-BEC3-F7C6C14E7100@arm.com> <CAHwn2Xkgw-fAmy92oLWOUG8=K0-3dVwYXsLKEqR-WtGoHHdc1g@mail.gmail.com>
 <CABC0sH3LFm48+buev6gFFAAoDT2SLqR-r-rndSjx+eU54H5=1w@mail.gmail.com>
 <17210CE2C7C78501.808@lists.openembedded.org> <17211049B04D4148.10479@lists.openembedded.org>
 <172331B40D5EBCA0.9941@lists.openembedded.org> <CAHwn2XmaTHGGUZXn9bC=SBj51zL6eo6rhWPR4SPP_UN0js9-8g@mail.gmail.com>
 <CANNYZj8o_GjiqwADQQp5KM_mnQTi+mw6nVh2E1GWVsfi9o3ZKg@mail.gmail.com>
 <CAHwn2Xmaqn+OAPJ-PH2eYr+w8J1OWkDVMQLgkZ3V7ughLYY9oA@mail.gmail.com>
 <CANNYZj-AEZ0LheXd2ZLfC4Q=V+iq=T-Lvhutwe5_kt_SaHiHZg@mail.gmail.com>
 <CAHwn2Xn+n5ArRRH3u=x+wA+y+AaEyBOZd1JQB45FQH6rme02wg@mail.gmail.com>
 <CABC0sH0DjvXC4Hw7CxM__spomLbN1ntEsV03-CQ=3OgLLDakLg@mail.gmail.com>
 <1725B2503015CF3E.24882@lists.openembedded.org> <CANNYZj_mWfY2aoYOPxwxL32EN8h-HjmKCqZ1BB0XsC4Rd4Cg3g@mail.gmail.com>
In-Reply-To: <CANNYZj_mWfY2aoYOPxwxL32EN8h-HjmKCqZ1BB0XsC4Rd4Cg3g@mail.gmail.com>
From: Willy Tu <wltu@google.com>
Date: Tue, 8 Nov 2022 11:30:08 -0800
Message-ID: <CAHwn2X=ZCLSFAui=NV4e39FKk9azL4oqoNj85UHdgb9EdEaO2g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] openssh: Install internal header/lib files
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Tristan Lelong <tlelong@google.com>, Ross Burton <Ross.Burton@arm.com>, 
	openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000000a5a8e05ecfa921d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 19:30:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172994

--0000000000000a5a8e05ecfa921d
Content-Type: text/plain; charset="UTF-8"

So do you suggest adding bbappend in meta-openembedded where
https://github.com/openembedded/meta-openembedded/pull/597 will live?

I'll check with the maintainer there. And Google/hiba users will maintain
that.

Best,

Willy Tu


On Tue, Nov 8, 2022 at 11:25 AM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> Actually, you don't need to do this in HIBA - a bbappend to openssh will
> do.
>
> Alex
>
> On Tue, 8 Nov 2022 at 20:21, Alexander Kanavin via
> lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
> wrote:
> >
> > I'd rather have this hidden in your recipes, yes. It's clearly a
> > special needs issue, and something you shouldn't ask us to maintain
> > for you (what I mean is that you're not going to rebase the patch when
> > a new openssh version is out, or adjust do_install - this falls on
> > usually me, and my time to do these ever-growing maintenance things is
> > not infinite).
> >
> > Alex
> >
> >
> > On Tue, 8 Nov 2022 at 20:12, Tristan Lelong <tlelong@google.com> wrote:
> > >
> > > To be clear: OpenSSH maintainer will not accept a patch that exposes
> these files in the upstream version, but we got confirmation that they were
> ok if we maintained such a patch in OE (or a custom do_install in the
> recipe).
> > >
> > > If this solution is not acceptable from the OE maintainers point of
> view, the next option is to update the HIBA recipe to fetch OpenSSH sources
> on top of HIBA sources directly in HIBA's workdir, and use these instead of
> the one from sysroot.
> > >
> > > Would this work better for you?
> > >
> > > On Tue, Nov 8, 2022, 18:16 Willy Tu <wltu@google.com> wrote:
> > >>
> > >> I think they are fine with the hack here. oops. Ok, I'll work with
> > >> them to get the fix without this change.
> > >>
> > >> Thanks for the feedback.
> > >>
> > >> Willy Tu
> > >>
> > >>
> > >> On Tue, Nov 8, 2022 at 9:12 AM Alexander Kanavin <
> alex.kanavin@gmail.com> wrote:
> > >> >
> > >> > On Tue, 8 Nov 2022 at 18:08, Willy Tu <wltu@google.com> wrote:
> > >> > >
> > >> > > Thanks Alexander for the feedback,
> > >> > >
> > >> > > We had some discussion internally with one of the OpenSSH
> maintainers
> > >> > > and they are fine with it. I'll try to see if there is a public
> forum
> > >> > > where we can share the discussion.
> > >> >
> > >> > If they are fine with it, then you need to submit a patch to openssh
> > >> > that installs the needed pieces (perhaps subject to a configure
> > >> > switch), get it accepted, and then add a backport to oe-core, in
> that
> > >> > order. No do_install_append hacks please.
> > >> >
> > >> > Alex
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#172992):
> https://lists.openembedded.org/g/openembedded-core/message/172992
> > Mute This Topic: https://lists.openembedded.org/mt/94475279/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>

--0000000000000a5a8e05ecfa921d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">So do you suggest adding bbappend in=C2=A0meta-openembedde=
d where=C2=A0<a href=3D"https://github.com/openembedded/meta-openembedded/p=
ull/597">https://github.com/openembedded/meta-openembedded/pull/597</a>=C2=
=A0will live?<div><br></div><div>I&#39;ll check with the maintainer there. =
And Google/hiba users will maintain that.</div><div><br></div><div>Best,</d=
iv><div><br></div><div>Willy Tu</div></div><br><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 8, 2022 at 11:25 AM Al=
exander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@=
gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Actually, you don&#39;t need to do this in HIBA - a bbappend to =
openssh will do.<br>
<br>
Alex<br>
<br>
On Tue, 8 Nov 2022 at 20:21, Alexander Kanavin via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> &lt;alex.kanavin=3D<a href=3D"mailto:gmail.c=
om@lists.openembedded.org" target=3D"_blank">gmail.com@lists.openembedded.o=
rg</a>&gt;<br>
wrote:<br>
&gt;<br>
&gt; I&#39;d rather have this hidden in your recipes, yes. It&#39;s clearly=
 a<br>
&gt; special needs issue, and something you shouldn&#39;t ask us to maintai=
n<br>
&gt; for you (what I mean is that you&#39;re not going to rebase the patch =
when<br>
&gt; a new openssh version is out, or adjust do_install - this falls on<br>
&gt; usually me, and my time to do these ever-growing maintenance things is=
<br>
&gt; not infinite).<br>
&gt;<br>
&gt; Alex<br>
&gt;<br>
&gt;<br>
&gt; On Tue, 8 Nov 2022 at 20:12, Tristan Lelong &lt;<a href=3D"mailto:tlel=
ong@google.com" target=3D"_blank">tlelong@google.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; To be clear: OpenSSH maintainer will not accept a patch that expo=
ses these files in the upstream version, but we got confirmation that they =
were ok if we maintained such a patch in OE (or a custom do_install in the =
recipe).<br>
&gt; &gt;<br>
&gt; &gt; If this solution is not acceptable from the OE maintainers point =
of view, the next option is to update the HIBA recipe to fetch OpenSSH sour=
ces on top of HIBA sources directly in HIBA&#39;s workdir, and use these in=
stead of the one from sysroot.<br>
&gt; &gt;<br>
&gt; &gt; Would this work better for you?<br>
&gt; &gt;<br>
&gt; &gt; On Tue, Nov 8, 2022, 18:16 Willy Tu &lt;<a href=3D"mailto:wltu@go=
ogle.com" target=3D"_blank">wltu@google.com</a>&gt; wrote:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; I think they are fine with the hack here. oops. Ok, I&#39;ll =
work with<br>
&gt; &gt;&gt; them to get the fix without this change.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Thanks for the feedback.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Willy Tu<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; On Tue, Nov 8, 2022 at 9:12 AM Alexander Kanavin &lt;<a href=
=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com=
</a>&gt; wrote:<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; On Tue, 8 Nov 2022 at 18:08, Willy Tu &lt;<a href=3D"mai=
lto:wltu@google.com" target=3D"_blank">wltu@google.com</a>&gt; wrote:<br>
&gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; Thanks Alexander for the feedback,<br>
&gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; We had some discussion internally with one of the O=
penSSH maintainers<br>
&gt; &gt;&gt; &gt; &gt; and they are fine with it. I&#39;ll try to see if t=
here is a public forum<br>
&gt; &gt;&gt; &gt; &gt; where we can share the discussion.<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; If they are fine with it, then you need to submit a patc=
h to openssh<br>
&gt; &gt;&gt; &gt; that installs the needed pieces (perhaps subject to a co=
nfigure<br>
&gt; &gt;&gt; &gt; switch), get it accepted, and then add a backport to oe-=
core, in that<br>
&gt; &gt;&gt; &gt; order. No do_install_append hacks please.<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; Alex<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#172992): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/172992" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/172992</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/94475279=
/1686489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/94475279/1686489</a><br>
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

--0000000000000a5a8e05ecfa921d--

