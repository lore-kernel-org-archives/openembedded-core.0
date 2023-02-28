Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2DDAC64EC7
	for <webhook@archiver.kernel.org>; Tue, 28 Feb 2023 20:41:32 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.4577.1677616882167661491
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Feb 2023 12:41:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LTC4Wmuf;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: rybczynska@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id f41so14834535lfv.13
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Feb 2023 12:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=b27WpT02LzIeG+gc4l3WxcbiTbjY/Emia2RtxPK6SMI=;
        b=LTC4WmufvBe27SOjNjue0XGFc+pOtoWyOaL6ByVC23CiPGMagtE0S6bgBI9P+PZnSg
         EqKeLuGuWOR43np9xKj4TTPFfjh+R1DAc4NK+wZBUbq3fqxSm4hYgm9XzzGOSpcanz96
         4xwEpo2GydjY+DA1B7W4VWu38tRE/UX/UK0KLX91GnU8S+unTY/x/BA5bVoXc3TY15dM
         mqbr2rICije+9DRNcvG9jeO0F9VWik74sY+X4mfibDS1wWIMLA6b4KNWJNjaQnEpcJsk
         xgCn0etbBze4RoVOSklS2ujAVV2vYPlC2BUB457t0BE6nTMYbTqjpn2aigrfnU4eD500
         Yv4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b27WpT02LzIeG+gc4l3WxcbiTbjY/Emia2RtxPK6SMI=;
        b=0bRFJfQcnv4/tMdbU3zDYAtbWk2reuVqcibga62fsVZwuLYm+9CUkvIMhGmX/AzBPy
         nidFb90+smrmuAu9QmDc1U6ALX8BZGtKue/SaOdGJmPP7yONNAuNF3RGgINtp5L2zVEu
         LOdb04lNKnmOnUtxovvPrmuTgC5PPtqGAwYPIZYa4NtUBNQ/Gf0l4x35l/Kj0fg8QhCA
         3FGicioTT4gOgIf98D3Uvclvt+nP0If4BfIEB9/K4zf2OD/2C4fSzFZo3Ezx0Hm1FX+O
         hVIxcRRmAe0FVH0dGZd+gkQlkKKe3iSBbdsDKf8enrEXsVIo3vh0rHtw1fKEOpRRk3yW
         h8jw==
X-Gm-Message-State: AO0yUKUt+6ajgSLUW6qOxoMbilJ0TnL8//a1eoegraAZTDDgjWoGUuV+
	zk/OMli/lnDRVDd3fnphY+CTkIwDH5QhHCATcro=
X-Google-Smtp-Source: AK7set9FBHd2G4c1FirayXnqoPLfPqca4XuZQSPMGKst6t3fT+qKgU5xtVGW28XcWqDGGyh+daf+bQRyrtjU9Tqx3Rc=
X-Received: by 2002:a19:550b:0:b0:4e0:39f3:5b9b with SMTP id
 n11-20020a19550b000000b004e039f35b9bmr1152964lfe.0.1677616880187; Tue, 28 Feb
 2023 12:41:20 -0800 (PST)
MIME-Version: 1.0
References: <20230227110027.804671-1-geoffrey.giry@smile.fr>
 <CAApg2=RSgsbVjjeepNJg_=rMZqf-n-fQwWtYPVufUgG-D74p2Q@mail.gmail.com>
 <b746ce640228f72ad3cabcc39ae2992305dd4a0e.camel@linuxfoundation.org> <CAGwXbzboSNk=8rAsQDHOnmWhBEtjt2VW0YG3i__2OjkL+3=AOQ@mail.gmail.com>
In-Reply-To: <CAGwXbzboSNk=8rAsQDHOnmWhBEtjt2VW0YG3i__2OjkL+3=AOQ@mail.gmail.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Tue, 28 Feb 2023 21:41:08 +0100
Message-ID: <CAApg2=R0F0nkR+iPY1gE_YJP9QGMBW0JzCkQXfcBY3Dew--rMg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cve-extra-exclusions: ignore inapplicable
 linux-yocto CVEs
To: Geoffrey GIRY <geoffrey.giry@smile.fr>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	Yoann Congal <yoann.congal@smile.fr>
Content-Type: multipart/alternative; boundary="000000000000367f0005f5c89ed0"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Feb 2023 20:41:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177857

--000000000000367f0005f5c89ed0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for the explanation and the work done. Could you contact me off
list so that we confirm what and where was send? 14 days is longer than
I've ever had as a response time from NVD.

Kind regards
Marta

On Tue, 28 Feb 2023, 10:05 Geoffrey GIRY, <geoffrey.giry@smile.fr> wrote:

> Hello Marta, Richard,
>
> We sent to NVD an update for one CVE (CVE-2020-27784) 14 days ago, we
> are still waiting for an answer.
> This is the first time we ever do this, so we did send only the first as =
a
> test.
> When the change is accepted, we will send updates requests for each
> already patched CVE.
>
> Richard, thank you for the details provided.
>
> Regards,
> Geoffrey GIRY
> Research and Development Engineer
> SMILE
>
>
>
> Le lun. 27 f=C3=A9vr. 2023 =C3=A0 23:02, Richard Purdie
> <richard.purdie@linuxfoundation.org> a =C3=A9crit :
> >
> > On Mon, 2023-02-27 at 18:49 +0100, Marta Rybczynska wrote:
> > > Thank you for the work. Have you contacted NVD to update the database
> > > instead? What did they say?
> >
> > Ideally a large portion of these should be sent to NVD but we did talk
> > a little about the on the call last week. We agreed that it will take
> > time and it was better to document this and fix our reporting in the
> > meantime as well as share these useful details more widely. I'd suggest
> > that as things are submitted we could document that, hopefully we'll
> > also be able to remove many of these entries.
> >
> > I'm sure Geoffrey can provide more status but I wanted to update on why
> > this was sent and why I think we should take it.
> >
> > I will drop the kernel filtering so new kernel CVEs then show up in all
> > our metrics going forward.
> >
> > Cheers,
> >
> > Richard
> >
> >
>

--000000000000367f0005f5c89ed0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Thank you for the explanation and the work done. Cou=
ld you contact me off list so that we confirm what and where was send? 14 d=
ays is longer than I&#39;ve ever had as a response time from NVD.</div><div=
 dir=3D"auto"><br></div><div dir=3D"auto">Kind regards=C2=A0</div><div dir=
=3D"auto">Marta<br><br><div class=3D"gmail_quote" dir=3D"auto"><div dir=3D"=
ltr" class=3D"gmail_attr">On Tue, 28 Feb 2023, 10:05 Geoffrey GIRY, &lt;<a =
href=3D"mailto:geoffrey.giry@smile.fr">geoffrey.giry@smile.fr</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">Hello Marta, Richard,<br>
<br>
We sent to NVD an update for one CVE (CVE-2020-27784) 14 days ago, we<br>
are still waiting for an answer.<br>
This is the first time we ever do this, so we did send only the first as a =
test.<br>
When the change is accepted, we will send updates requests for each<br>
already patched CVE.<br>
<br>
Richard, thank you for the details provided.<br>
<br>
Regards,<br>
Geoffrey GIRY<br>
Research and Development Engineer<br>
SMILE<br>
<br>
<br>
<br>
Le lun. 27 f=C3=A9vr. 2023 =C3=A0 23:02, Richard Purdie<br>
&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank"=
 rel=3D"noreferrer">richard.purdie@linuxfoundation.org</a>&gt; a =C3=A9crit=
 :<br>
&gt;<br>
&gt; On Mon, 2023-02-27 at 18:49 +0100, Marta Rybczynska wrote:<br>
&gt; &gt; Thank you for the work. Have you contacted NVD to update the data=
base<br>
&gt; &gt; instead? What did they say?<br>
&gt;<br>
&gt; Ideally a large portion of these should be sent to NVD but we did talk=
<br>
&gt; a little about the on the call last week. We agreed that it will take<=
br>
&gt; time and it was better to document this and fix our reporting in the<b=
r>
&gt; meantime as well as share these useful details more widely. I&#39;d su=
ggest<br>
&gt; that as things are submitted we could document that, hopefully we&#39;=
ll<br>
&gt; also be able to remove many of these entries.<br>
&gt;<br>
&gt; I&#39;m sure Geoffrey can provide more status but I wanted to update o=
n why<br>
&gt; this was sent and why I think we should take it.<br>
&gt;<br>
&gt; I will drop the kernel filtering so new kernel CVEs then show up in al=
l<br>
&gt; our metrics going forward.<br>
&gt;<br>
&gt; Cheers,<br>
&gt;<br>
&gt; Richard<br>
&gt;<br>
&gt;<br>
</blockquote></div></div></div>

--000000000000367f0005f5c89ed0--

