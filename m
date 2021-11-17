Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09B54C433EF
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 19:43:49 +0000 (UTC)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com
 [209.85.222.53])
 by mx.groups.io with SMTP id smtpd.web08.806.1637178228182582474
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 11:43:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=b6/VKCtx;
 spf=pass (domain: gmail.com, ip: 209.85.222.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f53.google.com with SMTP id az37so8350060uab.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 11:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=F5mPICEpkrW6Zf0R2c1JFYDrUWFndjYEK6EvNUhhXsw=;
        b=b6/VKCtxt3jSTqv6jbD7EJdV1FW3dehr3j22EWD88/q5P+P82wbVQExX3X06TgagFF
         4VRUYn23hxXQzoWLUioY0zvI6Wf3A5y5BlV5/wODQaRpXKjyByf22OXyTfY58Si3Tqyz
         4qWnoeW6VhKcFCr+uzArsiPcCA9LFou1RTh5ZZ6qRmaSBgopA1RfMGdAcRJIL27UAn6l
         JvWxjyha5pWA3BjIPFcRsHsoWoVB20drIW8Bvte0ofAH4TPT6IwCYjUWAGGtB/qMv6XD
         BavbGLZip+zfCSscuo9ME8vvTbbPKzudastt3nGrAbd975OwkAy26pR2IyJ0aJGnTDNQ
         j4Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=F5mPICEpkrW6Zf0R2c1JFYDrUWFndjYEK6EvNUhhXsw=;
        b=4EV+9Nw2V8IqNfSRH33u94+ZuDbR7qPqPlFMY+TilYMeZrGgA8ijkO8SYdRMykymfx
         DI0Rmbq4k+7TRswU2YJpM17dKkmsNwH8m9IrvRAFaMQH8Wnt2TgHiblm6O/xiGkoAk0y
         49UKEBn+OdlIIkMvxH1HpTUNqv2iYsFQdKEuQwHNUJs8pzjHYEoLgKtKhL2w2VIafauw
         0ywCyiyIP3d6Nlsx1iqYZbidedFQuamHfwdqk+zCa4sswb7YPU99aA12ub2Ui5/vI/MW
         YJj6bU4dQ7gfX9RrBAIkT8TKmpvGVJthU8fPGRGmPieax/wlZC6/nJE+1pIxLS3972bw
         2IIA==
X-Gm-Message-State: AOAM53056JmYaJM8nBH5HVEF6ilmdKAuC/FxGk3KquFTSmCg92MOOSD1
	g4KuC70GO7JU39FFCDOLRLw4Gn0/RVuY33/A+Zw=
X-Google-Smtp-Source: 
 ABdhPJw1dGkYFHWNcLiTtp9P9NW8Y6pLD3bAWQrNmGR1jKHUJ1izPiJBAnGb/9Y45mIBh0vuR6LCmMYifR0a54XYLf0=
X-Received: by 2002:ab0:1e04:: with SMTP id m4mr27723514uak.100.1637178227348;
 Wed, 17 Nov 2021 11:43:47 -0800 (PST)
MIME-Version: 1.0
References: <20211117153525.257146-1-alex@linutronix.de>
 <20211117153525.257146-22-alex@linutronix.de>
 <CAMKF1sq-59kYn0WpPKzNB331BLSrDKweCk2+S3AhSsZ2Eb1WVQ@mail.gmail.com>
 <CANNYZj8JDt_F+v3TxUuXHV9S-EPR9=9mYdNxd1Pg2Hwe4esLiA@mail.gmail.com>
 <YZVT+eDIX8zbnOHA@wildebeest.org>
 <CAMKF1sr0YP=BjUcdu4PD9soSGK+8uXf2uO+YQ-D2PLHb-ixJ3g@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sr0YP=BjUcdu4PD9soSGK+8uXf2uO+YQ-D2PLHb-ixJ3g@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 17 Nov 2021 20:43:35 +0100
Message-ID: 
 <CANNYZj_nK8BWxqHBdUnb3P6qO32qtOqGScDykeYyao5Ezar-PQ@mail.gmail.com>
Subject: Re: [PATCH 22/36] elfutils: update 0.185 -> 0.186
To: Khem Raj <raj.khem@gmail.com>
Cc: Mark Wielaard <mark@klomp.org>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>,
 Hongxu Jia <hongxu.jia@windriver.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="000000000000acd63505d101428e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Nov 2021 19:43:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158457

--000000000000acd63505d101428e
Content-Type: text/plain; charset="UTF-8"

Another problem is that who will run those tests with musl regularly and
ensure they won't regress again? We don't do it, upstream doesn't do it, so
then why spend time fixing them?

Alex

On Wed, 17 Nov 2021 at 20:18, Khem Raj <raj.khem@gmail.com> wrote:

> On Wed, Nov 17, 2021 at 11:11 AM Mark Wielaard <mark@klomp.org> wrote:
> >
> > Hi,
> >
> > I hack on elfutils upstream.
> >
> > On Wed, Nov 17, 2021 at 06:32:40PM +0100, Alexander Kanavin wrote:
> > > On Wed, 17 Nov 2021 at 18:15, Khem Raj <raj.khem@gmail.com> wrote:
> > > > > Rework support for error() on non-glibc targets:
> > > > > upstream now provides its own implementation, so we can drop
> > > > > the patch that adds ours; said implementation isn't
> > > > > build-tested with tests, so ptest has to be disabled on musl.
> > > >
> > > > Overall this is an improvement so I am good with this patch.
> > > > if upstream implementation does not pass ptests
> > > > perhaps worth reporting upstream.
> > >
> > > I would if upstream would be interested in tests with anything except
> > > glibc, but I'm fairly sure they're not. The tests don't even build with
> > > musl without invasive patching.
> >
> > If you don't report issues we won't know there are any.  elfutils
> > upstream is certainly focussed on glibc. And some of the musl
> > developers are pretty hostile and agresssive, which certainly isn't
> > appreciated. But we do appreciate bug reports and patches to support
> > alternative libc implementations where they make sense and help
> > others.
>
> Thanks Mark, good point about creating bug reports at least.
>
> >
> > Cheers,
> >
> > Mark
> >
>

--000000000000acd63505d101428e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Another problem is that who will run those tests with=
 musl regularly and ensure they won&#39;t regress again? We don&#39;t do it=
, upstream doesn&#39;t do it, so then why spend time fixing them?</div><div=
><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, 17 Nov 2021 at 20:18, Khem Raj &lt;<a=
 href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, Nov 17, 2021 =
at 11:11 AM Mark Wielaard &lt;<a href=3D"mailto:mark@klomp.org" target=3D"_=
blank">mark@klomp.org</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi,<br>
&gt;<br>
&gt; I hack on elfutils upstream.<br>
&gt;<br>
&gt; On Wed, Nov 17, 2021 at 06:32:40PM +0100, Alexander Kanavin wrote:<br>
&gt; &gt; On Wed, 17 Nov 2021 at 18:15, Khem Raj &lt;<a href=3D"mailto:raj.=
khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt; Rework support for error() on non-glibc targets:<br>
&gt; &gt; &gt; &gt; upstream now provides its own implementation, so we can=
 drop<br>
&gt; &gt; &gt; &gt; the patch that adds ours; said implementation isn&#39;t=
<br>
&gt; &gt; &gt; &gt; build-tested with tests, so ptest has to be disabled on=
 musl.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Overall this is an improvement so I am good with this patch.=
<br>
&gt; &gt; &gt; if upstream implementation does not pass ptests<br>
&gt; &gt; &gt; perhaps worth reporting upstream.<br>
&gt; &gt;<br>
&gt; &gt; I would if upstream would be interested in tests with anything ex=
cept<br>
&gt; &gt; glibc, but I&#39;m fairly sure they&#39;re not. The tests don&#39=
;t even build with<br>
&gt; &gt; musl without invasive patching.<br>
&gt;<br>
&gt; If you don&#39;t report issues we won&#39;t know there are any.=C2=A0 =
elfutils<br>
&gt; upstream is certainly focussed on glibc. And some of the musl<br>
&gt; developers are pretty hostile and agresssive, which certainly isn&#39;=
t<br>
&gt; appreciated. But we do appreciate bug reports and patches to support<b=
r>
&gt; alternative libc implementations where they make sense and help<br>
&gt; others.<br>
<br>
Thanks Mark, good point about creating bug reports at least.<br>
<br>
&gt;<br>
&gt; Cheers,<br>
&gt;<br>
&gt; Mark<br>
&gt;<br>
</blockquote></div>

--000000000000acd63505d101428e--

