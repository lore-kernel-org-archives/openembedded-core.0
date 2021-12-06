Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93DA6C433EF
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 17:03:23 +0000 (UTC)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com
 [209.85.222.48])
 by mx.groups.io with SMTP id smtpd.web09.54238.1638810202028906271
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 09:03:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Pi4NCDx/;
 spf=pass (domain: gmail.com, ip: 209.85.222.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f48.google.com with SMTP id r15so20977406uao.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 09:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Q0g45GI/9qkB/Ar6JlVhd9uuA8i0P9OEpDRBvSm2tx4=;
        b=Pi4NCDx/DZYgxYwUV5kSFLvec7S4Jzf9jePOpKl+HMGbhopMdR4npFDETGJDRB5elg
         +18gC9LaTskxn0VK1Nhv3oOciXEl4hfdOiyd7z1xkzhkjwulaxGpeN8liMX5GXnF8YsB
         OSNhKDvaLJoB3jeD+WyVH2p3MWhV93F/cDyBiCjnBr7U8qx2fjLqYWIOcL4I+Z6yjba2
         /N1lSOLA1wNRfP7CRYmpnj0UTPZaeYyN4HJ1GhHvcA2JgYB0BSWJAbhgLCw9Ho+32inh
         8mwE+RQAH/VON2N/O/0AazOdRacMds1reJS86MluTm041yRKJCM/As3/oUHginQVY/08
         AO7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Q0g45GI/9qkB/Ar6JlVhd9uuA8i0P9OEpDRBvSm2tx4=;
        b=Ov/rVlP2oxWg91roaooI+GUJKm8WiY8ZkGT//H70jUsqjjIlj0k0/WEo4JWGCFufu4
         ag1HmwCDjR3Rs5S1zUF78uC/Cd2GAavrb34kOgiYpAfNOW5g8C+m+VQ5JIjwcjmQH1Da
         kTbdj3hewFcrW9FU9ssCd4O5ZvbCY3FpOoPEcOQfDv4xncLW9eJcfyVEK9deGgT0ENt5
         t5Fip9dRiWwwwIqhB/3hiZ/E2mLu42rsf4T/49AohO6r/hVOd73+91ebG9WahqCYML7h
         K9je2+E6+qUrmx7f8jD4BGyexk5srWC2ONlMOmlQLCIAJk89IoWxFWr7kmmKDEoV06eO
         YsHQ==
X-Gm-Message-State: AOAM53079PUjOvkJd+tCt6NJ/WjW7X2Fj3pr1otvz1u4CvKVv3rOcbya
	nHbPWNcIGzCaWLD5VPmqumc1btTYukfelS6Jg4U=
X-Google-Smtp-Source: 
 ABdhPJx5foGD3JLX6LmGAZqKn8hJ+AJWssVetuk9xOVVofFXIaEUPES50BacvguXN7m9QSqK9+tZTS/3Es2gFglwLFU=
X-Received: by 2002:a05:6102:38d4:: with SMTP id
 k20mr37122558vst.42.1638810200883;
 Mon, 06 Dec 2021 09:03:20 -0800 (PST)
MIME-Version: 1.0
References: <20211204071323.2480163-1-alex@linutronix.de>
 <20211204071323.2480163-26-alex@linutronix.de>
 <CAAnfSTu4iCqOneHeDgTKvG5ao+rOnxV5EWXN6pfFaRVRhPv_3w@mail.gmail.com>
 <CANNYZj95RL+FwZSpSSVurmypf1wXWDzkjV18Ee4zrDxs03F7mw@mail.gmail.com>
 <CAAnfSTurVLUFAPSVtoD1hvvqOdKWduAiD0Qgc6L38Fh8A_YdTg@mail.gmail.com>
 <16BE34F09726DD19.18170@lists.openembedded.org>
 <CANNYZj-B7LY5egzLTb8h4ApXVe_d0XdUJQjM8tfH+Q6KSfiOCw@mail.gmail.com>
 <0bc6a9322d9ec2fd38047e2223b337596306c098.camel@linuxfoundation.org>
 <AM9PR09MB4642A5C1D094F44DEEAE3020A86D9@AM9PR09MB4642.eurprd09.prod.outlook.com>
In-Reply-To: 
 <AM9PR09MB4642A5C1D094F44DEEAE3020A86D9@AM9PR09MB4642.eurprd09.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 6 Dec 2021 18:03:09 +0100
Message-ID: 
 <CANNYZj8Rqbb+cMD3EFH9tKAT3ACQ+wNDN+L_vFpi723V6J=08w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 26/26] serf: mark patches as inappropriate for
 upstream submission
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Ross Burton <ross@burtonini.com>,
	OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: multipart/alternative; boundary="000000000000e0c61705d27d3ba9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Dec 2021 17:03:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159260

--000000000000e0c61705d27d3ba9
Content-Type: text/plain; charset="UTF-8"

Thanks - since there's already documented nomenclature for this situation,
I tweaked the patch to simply use that.

Alex

On Mon, 6 Dec 2021 at 17:47, Konrad Weihmann <kweihmann@outlook.com> wrote:

> To quote the documentation:
>
>    Inappropriate [reason]
>    - The patch is not appropriate for upstream, include a brief reason
> on the
>      same line enclosed with []
>      reason can be:
>         ...
>        no upstream (the upstream is no longer available -- dead project)
>
> so I think this is already covered, but I think we need to enforce the
> usage of machine readable reasoning within the square brackets.
>
> And if we need a more fine grained classification here, I would suggest
> to add a new item at Inappropriate
>
> On 06.12.21 17:41, Richard Purdie wrote:
> > On Mon, 2021-12-06 at 16:50 +0100, Alexander Kanavin wrote:
> >> I mean, if you insisit, we can add Upstream-Status: Defunct, but I do
> not
> >> think keeping patches in Pending state when there is no upstream is
> right
> >> either.
> >
> > Maybe we should add an Upstream-Inactive status?
> >
> > Cheers,
> >
> > Richard
> >
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#159256):
> https://lists.openembedded.org/g/openembedded-core/message/159256
> > Mute This Topic: https://lists.openembedded.org/mt/87494788/3647476
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> kweihmann@outlook.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>

--000000000000e0c61705d27d3ba9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks - since there&#39;s already documented nomencl=
ature for this situation, I tweaked the patch to simply use that.<br></div>=
<div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Mon, 6 Dec 2021 at 17:47, Konrad Weihm=
ann &lt;<a href=3D"mailto:kweihmann@outlook.com">kweihmann@outlook.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">To qu=
ote the documentation:<br>
<br>
=C2=A0 =C2=A0Inappropriate [reason]<br>
=C2=A0 =C2=A0- The patch is not appropriate for upstream, include a brief r=
eason <br>
on the<br>
=C2=A0 =C2=A0 =C2=A0same line enclosed with []<br>
=C2=A0 =C2=A0 =C2=A0reason can be:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ...<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0no upstream (the upstream is no longer available=
 -- dead project)<br>
<br>
so I think this is already covered, but I think we need to enforce the <br>
usage of machine readable reasoning within the square brackets.<br>
<br>
And if we need a more fine grained classification here, I would suggest <br=
>
to add a new item at Inappropriate<br>
<br>
On 06.12.21 17:41, Richard Purdie wrote:<br>
&gt; On Mon, 2021-12-06 at 16:50 +0100, Alexander Kanavin wrote:<br>
&gt;&gt; I mean, if you insisit, we can add Upstream-Status: Defunct, but I=
 do not<br>
&gt;&gt; think keeping patches in Pending state when there is no upstream i=
s right<br>
&gt;&gt; either.<br>
&gt; <br>
&gt; Maybe we should add an Upstream-Inactive status?<br>
&gt; <br>
&gt; Cheers,<br>
&gt; <br>
&gt; Richard<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#159256): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/159256" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/159256</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/87494788=
/3647476" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/87494788/3647476</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:kweihmann@outlook.com=
" target=3D"_blank">kweihmann@outlook.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
</blockquote></div>

--000000000000e0c61705d27d3ba9--

