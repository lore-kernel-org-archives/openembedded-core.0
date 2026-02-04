Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C201E9539B
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 13:07:47 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19938.1770210459517768704
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Feb 2026 05:07:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=pI9Q9YfN;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4359249bbacso582649f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 05:07:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770210458; cv=none;
        d=google.com; s=arc-20240605;
        b=cjJFyorzeRnE+F+oYdVdbq9KqcKX/imjIpqwyqfUajgXJhyKvJ6lwhaxQsxjyEV7Jo
         vukonFXyLyejvHRnsoGT35yrX9sJu1X3jz9oz5OrNh14J6DgoOoqT/U+SdGsufbzpNgV
         JPRHVn+pIHdQ+Gx1bFTmnsH2SrK6N5VXFEVpjVJPmBnZEnx6EtXgz1HG0sw7NlmaO9Wf
         v0FLNmKo2+qrcEaKtDmO6Hb9Qv659ANH8TZzsRxfSLfsXw6j1f6czH0NK0pTQCphtlNk
         hcXhl0YGeYs5CXyzZO/tvLtd6nqPOexrjf8G9nlRBjpEhW00wtvu5aw5kn2Mn3PqWP48
         urLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=K2XZFw9DlKVglDIxsHBbOHOlaSeIanIdrMEUth6kV3o=;
        fh=ssoOTwmNPYsbuRlJa3/NELXolZi2VL/fa7rSvjwfc0Y=;
        b=AJHEvq8EtRKrHxzPp0wYsM8aNLFcZ/LF30izSYq1iEwUiU1tKoDTUw/hHzgwKBug9/
         BQTIgweIPegcXsEvZN3B8OtFuLByrt3pP4JSqM+bf8yHLG4DLsWB99JA4eBuF69M3i4S
         4L45lmOJUPut4r6593xeLnKNvGANQ9VX1/bTTJW8DK8nJxNrM586eOPD0ejphezNXtpP
         oEuRaLMSnKGwR4xkOHCfDN1nK691y47e6OHD1GdsDXDNt3OGqDTvLv/M8b4L0XrYRP0Z
         bRz06qdbB8j1JoowY2HT7MPgTool/fPBCB25Nj6ltcjAjF4dw4xrub3ps72bkWnxK/jO
         0xUw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770210458; x=1770815258; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K2XZFw9DlKVglDIxsHBbOHOlaSeIanIdrMEUth6kV3o=;
        b=pI9Q9YfNdAxmsxzMsxHEuebGEGWr1zDXmZIrQ4we745nyq8PY0Ze2Gwgutz/ZBlYqL
         DLvUVI4f1YoSznqqWkK0i2vaSi2lY7ywWyvfwKxghxNQ5FCDKsDJEN7pvqTrli2ZZfgZ
         JFjc3uNqNqN3NxUkHQPBhc+oCq+55r6mdSgxY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770210458; x=1770815258;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K2XZFw9DlKVglDIxsHBbOHOlaSeIanIdrMEUth6kV3o=;
        b=u2E5z/vLofo7wq+TZQr5oXmczSz6wkW2XfAiO/iPG05JQMn0FRTtek71cyRM+3V2gq
         7/2axuLzSMULdMgV02gXuqMDx6rYb+uPPnP4QQs4SfkFiK/f5kd+8lMMWZZjEg0XIyPp
         15gNTJooNT4VpjSVC5+M/tUGZdrrG2fo8zf8m5GBNYD/IasdNUOm067NLPF3F9Jp5K8h
         JpE1/24BvQfa1eDOWNY8lo6JsARzCZinCCKiKOLcFE7D73jymMlHXrZi0evmEH0Ke9Tw
         GZAfEjlEl+iLfNWhZChdlBx7gdJbkKWLh2wx+pu8JVhPgBJnF1VABeWSwMeOWG+ocm2r
         fGTA==
X-Forwarded-Encrypted: i=1; AJvYcCX3YAWC74ZIw11zvIpkISjQ1yvXq/3BjMihJm9T7w7u23GIE9IpwtoIRE0wL1/UJTxiD7o3i3kBHn4WtNivIE9kzQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx8gxkgImkXauZ75krg7Ob0lH5VdY9knrxmOgmrM0QbeNDWPtAB
	P4H1pTKcU7FvVBoqRNuyOAZXDm9g0VEdt9grK32NLZPLkvDvRa9q6pUAzHjuXwKefmcnaYbYRqF
	cp7D5Anwh8dHfW8lCuBgvvqnebbVrbij6WzNYeBwNIg==
X-Gm-Gg: AZuq6aJ5qHlcyqyYEVQV8XRg+/15Z8Lh6rikRjnVssSax6GDcXwXcaMaRRVzgphWVAy
	GIRxdGlrUZffLckoXpcTaWAScU9gLpZ1viA1jpzY7bFuFLIKFiLD8gIFmlT4tzRFN7a26DYTj2i
	UjV2JU9PKiNotFola3LVnOH6CfI7Xes9OPDFxL0XwMa4FAjLMYNY2JBQToIW0oiXVNKZ3O02r6D
	AdWmg3+BwiC+hgH/GD2Vuo34iOR2OyAujsNv80234zlDQeTRbkKHzL+gQJ0uz9nKxlISLZgEp+v
	dDr+4psC8YUpMtVaEHr6AXIqJPnS
X-Received: by 2002:a05:6000:288a:b0:435:92c6:d556 with SMTP id
 ffacd0b85a97d-43617c84202mr4476805f8f.16.1770210457680; Wed, 04 Feb 2026
 05:07:37 -0800 (PST)
MIME-Version: 1.0
References: <20260129163910.2612040-1-Harish.Sadineni@windriver.com>
 <20260129163910.2612040-8-Harish.Sadineni@windriver.com> <8a9cf281b36ede03135fb042e260d22785ed4f38.camel@pbarker.dev>
 <DG66GUA3GH4D.31PC9MVWLCK32@smile.fr> <1cd94533d438ad4e689da8636bae06859778ef29.camel@linuxfoundation.org>
In-Reply-To: <1cd94533d438ad4e689da8636bae06859778ef29.camel@linuxfoundation.org>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Wed, 4 Feb 2026 14:07:11 +0100
X-Gm-Features: AZwV_Qi8OQUUjMwQEiMOf6P3w4LZ2cggki9q1Of0wxSxcBOpa1k35NcA0YoEZJE
Message-ID: <CAMSfU+4dKa6adoEtKSWp7Q-ZhT9L4ohtbruSZZPeb1_SxkpHEA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v5 07/15] kernel-yocto.bbclass: Disable ccache
 when rust-kernel is enabled
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Paul Barker <paul@pbarker.dev>, Harish.Sadineni@windriver.com, 
	openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com, 
	Sundeep.Kokkonda@windriver.com, alistair.francis@wdc.com, 
	bruce.ashfield@gmail.com, elmehdi.younes@smile.fr
Content-Type: multipart/alternative; boundary="0000000000008217a70649ff3d66"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 13:07:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230520

--0000000000008217a70649ff3d66
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 4 f=C3=A9vr. 2026 =C3=A0 13:34, Richard Purdie <
richard.purdie@linuxfoundation.org> a =C3=A9crit :

> On Wed, 2026-02-04 at 13:31 +0100, Yoann Congal wrote:
> > On Wed Feb 4, 2026 at 1:05 PM CET, Paul Barker wrote:
> > > On Thu, 2026-01-29 at 08:39 -0800, Sadineni, Harish via
> > > lists.openembedded.org wrote:
> > > > From: Yoann Congal <yoann.congal@smile.fr>
> > > >
> > > > Currently, a ccache enabled build fails with:
> > > >   |   HOSTRUSTC scripts/generate_rust_target
> > > >   |   HOSTCC  scripts/kallsyms
> > > >   |   HOSTCC  scripts/sorttable
> > > >   |   HOSTCC  scripts/asn1_compiler
> > > >   |   TOUCH   include/generated/gcc-plugins.h
> > > >   |   DESCEND objtool
> > > >   | error: multiple input filenames provided (first two filenames
> are gcc and
> > > >
> .../tmp/work-shared/qemux86-64/kernel-source/scripts/generate_rust_target=
.rs)
> > > >
> > > > when using ccache, value of "HOSTCC=3Dcache gcc" when this value is
> passing
> > > > to rustc, It is thinking gcc is a input file. when ccache is not
> used "HOSTCC=3Dgcc" is passed.
> > > >
> > > > Disable ccache for kernel build if rust-kernel is enabled to
> workaround
> > > > this.
> > > >
> > > > Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
> > > > Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> > > > Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> > >
> > > This patch is good, but we should try to get the issue resolved
> upstream
> > > if we can so that ccache can be used.
> > >
> > > Has this been reported upstream yet? Could you also open a bug in our
> > > bugzilla to track this?
> >
> > Hello,
> >
> > For context, a lengthy discussion happened on this patch here:
> >
> https://lore.kernel.org/openembedded-core/CA+TGqK9Yd2WWKrhMkhofF-8N0cESCS=
efWD2DXr4sBO9fDQXyrg@mail.gmail.com/t/#u
> >
> > And, sadly, we lack resources at the moment on our side to follow-up on
> this :-/
>
> Putting some links alongside this to more details would probably at
> least help a bit, particularly if ccache upstream documents it is
> imcompatible with rust...
>

Ok, I'll send a more documented patch to Harish for him to integrate in his
next iteration.


> Cheers,
>
> Richard
>
>

--=20
Yoann Congal
Smile ECS

--0000000000008217a70649ff3d66
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mer. 4 =
f=C3=A9vr. 2026 =C3=A0=C2=A013:34, Richard Purdie &lt;<a href=3D"mailto:ric=
hard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt;=
 a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">On Wed, 2026-02-04 at 13:31 +0100, Yoann Congal wrote:<br>
&gt; On Wed Feb 4, 2026 at 1:05 PM CET, Paul Barker wrote:<br>
&gt; &gt; On Thu, 2026-01-29 at 08:39 -0800, Sadineni, Harish via<br>
&gt; &gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" targ=
et=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; &gt; &gt; From: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.=
fr" target=3D"_blank">yoann.congal@smile.fr</a>&gt;<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Currently, a ccache enabled build fails with:<br>
&gt; &gt; &gt; =C2=A0 |=C2=A0=C2=A0 HOSTRUSTC scripts/generate_rust_target<=
br>
&gt; &gt; &gt; =C2=A0 |=C2=A0=C2=A0 HOSTCC=C2=A0 scripts/kallsyms<br>
&gt; &gt; &gt; =C2=A0 |=C2=A0=C2=A0 HOSTCC=C2=A0 scripts/sorttable<br>
&gt; &gt; &gt; =C2=A0 |=C2=A0=C2=A0 HOSTCC=C2=A0 scripts/asn1_compiler<br>
&gt; &gt; &gt; =C2=A0 |=C2=A0=C2=A0 TOUCH=C2=A0=C2=A0 include/generated/gcc=
-plugins.h<br>
&gt; &gt; &gt; =C2=A0 |=C2=A0=C2=A0 DESCEND objtool<br>
&gt; &gt; &gt; =C2=A0 | error: multiple input filenames provided (first two=
 filenames are gcc and<br>
&gt; &gt; &gt; .../tmp/work-shared/qemux86-64/kernel-source/scripts/generat=
e_rust_target.rs)<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; when using ccache, value of &quot;HOSTCC=3Dcache gcc&quot; w=
hen this value is passing<br>
&gt; &gt; &gt; to rustc, It is thinking gcc is a input file. when ccache is=
 not used &quot;HOSTCC=3Dgcc&quot; is passed.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Disable ccache for kernel build if rust-kernel is enabled to=
 workaround<br>
&gt; &gt; &gt; this.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Signed-off-by: El Mehdi YOUNES &lt;<a href=3D"mailto:elmehdi=
.younes@smile.fr" target=3D"_blank">elmehdi.younes@smile.fr</a>&gt;<br>
&gt; &gt; &gt; Signed-off-by: Yoann Congal &lt;<a href=3D"mailto:yoann.cong=
al@smile.fr" target=3D"_blank">yoann.congal@smile.fr</a>&gt;<br>
&gt; &gt; &gt; Signed-off-by: Harish Sadineni &lt;<a href=3D"mailto:Harish.=
Sadineni@windriver.com" target=3D"_blank">Harish.Sadineni@windriver.com</a>=
&gt;<br>
&gt; &gt; <br>
&gt; &gt; This patch is good, but we should try to get the issue resolved u=
pstream<br>
&gt; &gt; if we can so that ccache can be used.<br>
&gt; &gt; <br>
&gt; &gt; Has this been reported upstream yet? Could you also open a bug in=
 our<br>
&gt; &gt; bugzilla to track this?<br>
&gt; <br>
&gt; Hello,<br>
&gt; <br>
&gt; For context, a lengthy discussion happened on this patch here:<br>
&gt; <a href=3D"https://lore.kernel.org/openembedded-core/CA+TGqK9Yd2WWKrhM=
khofF-8N0cESCSefWD2DXr4sBO9fDQXyrg@mail.gmail.com/t/#u" rel=3D"noreferrer" =
target=3D"_blank">https://lore.kernel.org/openembedded-core/CA+TGqK9Yd2WWKr=
hMkhofF-8N0cESCSefWD2DXr4sBO9fDQXyrg@mail.gmail.com/t/#u</a><br>
&gt; <br>
&gt; And, sadly, we lack resources at the moment on our side to follow-up o=
n this :-/<br>
<br>
Putting some links alongside this to more details would probably at<br>
least help a bit, particularly if ccache upstream documents it is<br>
imcompatible with rust...<br></blockquote><div><br></div><div>Ok, I&#39;ll =
send a more documented patch to Harish for him to integrate in his next ite=
ration.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--0000000000008217a70649ff3d66--

