Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9B03CAC5B5
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 08:44:13 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.48886.1759135447173938364
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Sep 2025 01:44:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=w6lWzgDk;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3b9edf4cf6cso4173177f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 01:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1759135445; x=1759740245; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1eeb8gFbfxJdhe3OypWGAQRGjgqk1Who06u27O1xv4E=;
        b=w6lWzgDkylIu8y1Y9xth9lVUVMZIaIj5/DkB3ZiryFFufgOEZwzSIk2NyczPHIViBY
         tNBVkb0HEMJMftVk52WXMSma++GC+3dS8ggzaFBzBq01DHOxTcsio44ldfyap8v1iOld
         4AvSSHMRzi6Dv2pKtM4p6TGwuV8ABEidORgHA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759135445; x=1759740245;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1eeb8gFbfxJdhe3OypWGAQRGjgqk1Who06u27O1xv4E=;
        b=eFI/oNbRNYC2Ije1dhtzhuKuQWTQ2g5GJSkdKtsUfw8N6wLfFjRQDYY7xHEO/wFRDe
         xY3G8qU0D98sntqxVT3J5V3y9KmDWv6Zmc59XG1hu4dCYl7cUuwJLXVPMQRinRxw1icq
         Hra/8lizTHIvl1RoDOL83sfrZYs8DceW+gLdV0s30uALFYkYAWZfb9DLOzpp2hfN5Dkv
         tU6Q5Ry0SVQ18hH+vvT2ya7Vdpcpv0jlJrbdZAXDo/qtKGYzApwNn3OwxPoQdfjDjiHj
         /5eWzlVFWOPQFfl7SBl5PWxES8gO8Lb95l3oCrLJhu1FIo6h9moWCrjrM7eQgn8V8aTc
         y9rg==
X-Gm-Message-State: AOJu0YzpUgs/tdYvBvufbWNb3RWudtKxYnbxyzoLLworKhoYjzhNkIJ/
	dyGIxvyGLPRbQHsY2TwCrtymYQ3rFIqrxWXdyP8E4QUDf14uOga0yDYs3UYb7nB/AtS/X2pImSB
	S1Gjh/bqNHgokhnLcoFR4C/kqgjmtGbZ4xxYohznWYQ==
X-Gm-Gg: ASbGncu97F5T7WRlrfclhlYtozB55QYy+SiMvZ+BFVhEJ88lJjCXTCUfAKfFaSsNPlt
	zfGag2Tnr1aNlj1onB5jNfru/C5G2D2g3+5cINhcQ33WYk/mfZtirO7jO50ZvLBXmWUoyf2YB7F
	JZnkVExbe9Z98yZrPHQzmG+KXDwM4SMHeUPsWIekYeGz6uxEPbCFnvteJbD02yokto+NC7aoNbx
	fTNGgVfFMFI0ufRItEN
X-Google-Smtp-Source: AGHT+IHyQB8kXcQe8mnFRHt0R/sjETEhq+nwJXhW0TcJoTTJZhpdaOe9d2akr9gNe5vKuTSwTLQf0RTZsYPcN+fcDGk=
X-Received: by 2002:a05:6000:430d:b0:3ec:d78d:8fe7 with SMTP id
 ffacd0b85a97d-40e4b851049mr14962776f8f.33.1759135445288; Mon, 29 Sep 2025
 01:44:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250929-min-gcc-version-v1-1-c93d7f5a4f49@bootlin.com>
 <CAMSfU+5b1Dd2fohNSgs1pT-9By8cPkv-HLpg3BoO0cveY_78Qg@mail.gmail.com> <DD559WH6JH42.39SI3VILMNKY4@bootlin.com>
In-Reply-To: <DD559WH6JH42.39SI3VILMNKY4@bootlin.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Mon, 29 Sep 2025 10:43:39 +0200
X-Gm-Features: AS18NWDAatG1HhGWEjM0jMXvwq26UzUAEYfvuAr47IUtxgpTsqzKSoV6Of9qOZ8
Message-ID: <CAMSfU+6KD=iLNmqz2KcX47KFXGsn6AVv5HEkWrJbwyiNphYGzA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] sanity: Update minimum gcc version to 10.1
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: multipart/alternative; boundary="0000000000005436c8063feca36e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 08:44:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224128

--0000000000005436c8063feca36e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 29 sept. 2025 =C3=A0 10:34, Antonin Godard <antonin.godard@bootlin.=
com>
a =C3=A9crit :

> On Mon Sep 29, 2025 at 10:25 AM CEST, Yoann Congal via
> lists.openembedded.org wrote:
> [...]
> >> -# Require at least gcc version 8.0
> >> -#
> >> -# This can be fixed on CentOS-7 with devtoolset-6+
> >> -# https://www.softwarecollections.org/en/scls/rhscl/devtoolset-6/
> >> +# Require at least gcc version 10.1
> >>  #
> >>  # A less invasive fix is with scripts/install-buildtools (or with use=
r
> >>  # built buildtools-extended-tarball)
> >>  #
> >>  def check_gcc_version(sanity_data):
> >>      version =3D oe.utils.get_host_gcc_version(sanity_data)
> >> -    if bb.utils.vercmp_string_op(version, "8.0", "<"):
> >> -        return "Your version of gcc is older than 8.0 and will break
> >> builds. Please install a newer version of gcc (you could use the
> project's
> >> buildtools-extended-tarball or use scripts/install-buildtools).\n"
> >> +    if bb.utils.vercmp_string_op(version, "10.1", "<"):
> >> +        return "Your version of gcc is older than 10.1 and will break
> >> builds. Please install a newer version of gcc (you could use the
> project's
> >> buildtools-extended-tarball or use scripts/install-buildtools).\n"
> >>
> >
> > While you are modifying this line could you make the version a single
> > variable instead of repeating it twice? (I know I would forget to updat=
e
> > the one in the message -_-')
>
> Hi Yoann,
>
> This is not limited to this test, I think most of the check_*_version tes=
ts
> could benefit from that improvement. Maybe it's more relevant to have a
> separate
> patch for this improvement, instead of just here?
>

Yes, agreed, do you want me to send it?


>
> Thanks,
> Antonin
>
> --
> Antonin Godard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>

--=20
Yoann Congal
Smile ECS

--0000000000005436c8063feca36e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0lun. 29=
 sept. 2025 =C3=A0=C2=A010:34, Antonin Godard &lt;<a href=3D"mailto:antonin=
.godard@bootlin.com">antonin.godard@bootlin.com</a>&gt; a =C3=A9crit=C2=A0:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon Sep 29, =
2025 at 10:25 AM CEST, Yoann Congal via <a href=3D"http://lists.openembedde=
d.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrot=
e:<br>
[...]<br>
&gt;&gt; -# Require at least gcc version 8.0<br>
&gt;&gt; -#<br>
&gt;&gt; -# This can be fixed on CentOS-7 with devtoolset-6+<br>
&gt;&gt; -# <a href=3D"https://www.softwarecollections.org/en/scls/rhscl/de=
vtoolset-6/" rel=3D"noreferrer" target=3D"_blank">https://www.softwarecolle=
ctions.org/en/scls/rhscl/devtoolset-6/</a><br>
&gt;&gt; +# Require at least gcc version 10.1<br>
&gt;&gt;=C2=A0 #<br>
&gt;&gt;=C2=A0 # A less invasive fix is with scripts/install-buildtools (or=
 with user<br>
&gt;&gt;=C2=A0 # built buildtools-extended-tarball)<br>
&gt;&gt;=C2=A0 #<br>
&gt;&gt;=C2=A0 def check_gcc_version(sanity_data):<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 version =3D oe.utils.get_host_gcc_version(sani=
ty_data)<br>
&gt;&gt; -=C2=A0 =C2=A0 if bb.utils.vercmp_string_op(version, &quot;8.0&quo=
t;, &quot;&lt;&quot;):<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;Your version of gcc is o=
lder than 8.0 and will break<br>
&gt;&gt; builds. Please install a newer version of gcc (you could use the p=
roject&#39;s<br>
&gt;&gt; buildtools-extended-tarball or use scripts/install-buildtools).\n&=
quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 if bb.utils.vercmp_string_op(version, &quot;10.1&qu=
ot;, &quot;&lt;&quot;):<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;Your version of gcc is o=
lder than 10.1 and will break<br>
&gt;&gt; builds. Please install a newer version of gcc (you could use the p=
roject&#39;s<br>
&gt;&gt; buildtools-extended-tarball or use scripts/install-buildtools).\n&=
quot;<br>
&gt;&gt;<br>
&gt;<br>
&gt; While you are modifying this line could you make the version a single<=
br>
&gt; variable instead of repeating it twice? (I know I would forget to upda=
te<br>
&gt; the one in the message -_-&#39;)<br>
<br>
Hi Yoann,<br>
<br>
This is not limited to this test, I think most of the check_*_version tests=
<br>
could benefit from that improvement. Maybe it&#39;s more relevant to have a=
 separate<br>
patch for this improvement, instead of just here?<br></blockquote><div><br>=
</div><div>Yes, agreed, do you want me to send it?</div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Thanks,<br>
Antonin<br>
<br>
-- <br>
Antonin Godard, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--0000000000005436c8063feca36e--

