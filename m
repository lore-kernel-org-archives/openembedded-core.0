Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1B7DCD5BAC
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 16:14:17 +0000 (UTC)
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40513.1779380054506237964
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2026 09:14:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=aEp75YCm;
 spf=pass (domain: gmail.com, ip: 74.125.224.50, mailfrom: jan.vermaete@gmail.com)
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-65c7a459105so6765516d50.0
        for <openembedded-core@lists.openembedded.org>; Thu, 21 May 2026 09:14:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779380053; cv=none;
        d=google.com; s=arc-20240605;
        b=ZcHtECSVqs+rWlqmapi6Ve6HhQ7T94UD8sMLc4SwntcsQiXyuAryuNI6PhRdaOSvNZ
         3756tIcsH+vo+aQaH8W5U925KQ0Ub/bhfmKCg047S6WbG60Xh9E7CQPx+BxtYs5RtLU0
         axTLPu9SuOdyxngn/A0bMs13SG6yxV6psFh0iq34LtKdpKbUJGYaCGrTXsds4/YvrvgM
         km6AXRAsoQv5XbGhvbUt/pJQ8IDzMiprYYlIYDI7BqST6ZN13BE0+xvRyE9gebYfy3fB
         F6S5efZAPeu5KwXBJ6+KM2yebKBevy74HdJcuQu/Vi/ZkP0bK3460o2/3pmYMpWEtV0+
         bxbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IxG1xiHEiaL2iuGKxSIL8zacZ1KEZ/0Aj0XkdI2pPRo=;
        fh=cxITWKslWzStRj8Wa4PTcomULOmX5N4GTJm+RBmbqi4=;
        b=Ws+2Zlm+VJEM5wLUrsWg0qc5TcwkdQtmP85JJESJiT4usHfQt/P7owMvei6S7VbXPe
         WRElDUNtwls85kNnOmhIpzvwi8SonOBjZvtzSvVW1C/NypgnDyixfO8r90hHShQZukWR
         pG/GdeOFIqHI06SLEkDalVSWfNLRulZmxyNx650oH00AVFDZBNd/xxjwA87KBFdS9jFz
         PKkly9IfyaPIeeBTQAXMut37L6Ak+VXkXOVycRzbb8s7c+l7JkaTi9y2prP9bEgh6rd1
         a6FLFHD0cEcPKNJk3ij3Rf4Bn79jFEEFd+QL4nILqMwO6UPvJ6hWvXrG7HCRZFu/KRG5
         VCVw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779380053; x=1779984853; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IxG1xiHEiaL2iuGKxSIL8zacZ1KEZ/0Aj0XkdI2pPRo=;
        b=aEp75YCmEi0io0Ryn8IYio2TDhiM4D+l5H2LmuUu//gafr/VsRawx8DNtiRNlNQfel
         ZUuSyndUDaNCiG+rARal/lf6Kezz3AkyDiYgik17F4CMmfZsCaCpwDPTXCRF70kvWlF2
         Z06s5tvbABy3w8rjCKbpYT/KB9wLOilv9uXirFPqD+RuBe+KtihHDOjVmwzCEwYcnwMf
         WgEpMuwcTmP/ixuy5fQOXM3CJrNvj1ap0CsFCb36XJA842jpUUnR5OTYxdW2RzWo8pK6
         k38l/TWqhiW3DOIPoOo+UsCdowRkYz39OUAvEBt0qeyZK0C1AfhOYwqMTfsShhy9eik1
         N9HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779380053; x=1779984853;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IxG1xiHEiaL2iuGKxSIL8zacZ1KEZ/0Aj0XkdI2pPRo=;
        b=lplSqSBVZh+8IQTBz0tQj0p7bcQR+joMm+xxlZnYJ2dPbwCbxsAC3rY1QUDFDsDW8t
         GsLZfscUrMKTOl9qVuaEdL9PGZmlUQVWiigOOVi0iWuWvB5httiI9e0hzWqt6mg0Xxfn
         8gyEcdNXFcB2LH+rFqQEkL9BCMGRHUJoLaPUbQJgkoHUvu9sCEqXAb74+fgZ+6t9pVgC
         YKStmmJRQ0shP2Yb+V2pSSMkQdqOyxcMtkVs8jNwI9pxwaLhtCN7qlWijb48ecdmFOrU
         r02k+BqYiG6YcNrJu5KSpO7fy0yGHBqg060sBQP+rrImPWfwfg3tjSClEFnPf5UAi4Cs
         X/mw==
X-Gm-Message-State: AOJu0YysT/k+LJb0hOk3Y/3e1MIoRhzKF7Q1Ekj1/ZUIocAuC2bWPW2c
	I15sc2JO5rRz+yHlbCl/VCbjeT5OK/HnIEGhGEjKsVw+/6TbX7Ge5l6/BQ94HRZs/5IKNT9CkrA
	N+Wx6eNjzzXGeSQ7QUkDfPlMQW8issJA=
X-Gm-Gg: Acq92OGMef5KuEW9omR8/nWLChkI1cB90niR93neytuYWgq9arg+m1ANwcuxA4IVEiJ
	31JnNonyk3B6fPyVqU7dW3GyZbag+Y5Ikr+3XGQ8Bbvr4nT47wrv1Jrxf1ACrgh7EbVTyOyj+96
	C06Tsj2Zwg/p/QoibOgSUd27FJNY07z51SdOsMX6otvpXu9sQABEN1KQwGuKnVmAs76RZPxrCKP
	PP2XMo8sIVwKQCVwwm1m4D5aIn9SFrNmzSZpKRwlacTDeiqzwGV7nqXQ+kaIaCW8hJBoMdBlL/O
	cop+08Xnc34rMVx7NiR6kPg8BRx02I5fQrzdKHZ19wTRy7D5Jsvk9XA//cxoV/AVG2wZkqE=
X-Received: by 2002:a05:690e:118d:b0:65d:7eb2:cac9 with SMTP id
 956f58d0204a3-65eacd4eb80mr2751445d50.15.1779380053343; Thu, 21 May 2026
 09:14:13 -0700 (PDT)
MIME-Version: 1.0
References: <CABF_=ygrm+zsyehypM_iRpdfdnH8DSTCMK-Dtt=OQsy3aFtYPw@mail.gmail.com>
 <faa3919e8145fdb9f49b9e360d6aca83abae43dd.camel@linuxfoundation.org>
In-Reply-To: <faa3919e8145fdb9f49b9e360d6aca83abae43dd.camel@linuxfoundation.org>
From: jan vermaete <jan.vermaete@gmail.com>
Date: Thu, 21 May 2026 18:14:02 +0200
X-Gm-Features: AVHnY4KWrSt_wGrpdGSqY4fFNt7gJGihWI818iKZH4zLuX-PrpHS_utFWWhjSZY
Message-ID: <CABF_=yiXuU84OyLo9O3Dd+yQiae2HW2=N+ZSMcHKE-wkep6s9g@mail.gmail.com>
Subject: Re: [OE-core] adding WXwindows-exception-3.1 license?
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Joshua Watt <JPEWhacker@gmail.com>, Rob Woolley <rob.woolleywr@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000000219065256340b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 May 2026 16:14:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237518

--000000000000000219065256340b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Should I make a ticket for this in Bugzilla?

Br


Jan Vermaete
=E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Hamel

On Sat, 16 May 2026 at 09:01, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2026-05-15 at 19:12 +0200, Jan Vermaete via
> lists.openembedded.org wrote:
> > The WXwindows-exception-3.1 license is a valid SPDX license [1].
> > And used in the `openscenegraph` recipe of meta-ros [2].
> > Generating the spdx (do_create_spdx) is now failing for this recipe.
> >
> > Could this license be added to the `spdx-licenses.json` file?
> >
> >
> > [1]: https://spdx.org/licenses/WxWindows-exception-3.1.html
> > [2]: https://layers.openembedded.org/layerindex/recipe/438736/
>
> That file is generated from the the scripts/update-sdpx-licenses.py
> update script. I did just run an update so we can pull in recent
> changes however that license isn't among them.
>
> I therefore checked and it is because it is a license exception, not a
> full license.
>
> Copying Joshua, I'm not sure how we want to handle the exceptions.
>
> Cheers,
>
> Richard
>

--000000000000000219065256340b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Should I make a ticket for this in Bugzilla?</div><div di=
r=3D"auto"><br></div><div dir=3D"auto">Br</div><div><br clear=3D"all"><br c=
lear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=
=3D"gmail_signature">Jan Vermaete<br>=E2=80=9CSuccess is a self-correcting =
phenomenom.=E2=80=9D -- Gary Hamel</div></div></div><div><br><div class=3D"=
gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Sat, 16 May 2026 at 09:01, Richard Purdie &lt;<a href=3D"mailto:richard.pu=
rdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Fri, 2026-05=
-15 at 19:12 +0200, Jan Vermaete via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> wrote:<br>
&gt; The WXwindows-exception-3.1 license is a valid SPDX license [1].<br>
&gt; And used in the `openscenegraph` recipe of meta-ros [2].<br>
&gt; Generating the spdx (do_create_spdx) is now failing for this recipe.<b=
r>
&gt; <br>
&gt; Could this license be added to the `spdx-licenses.json` file?<br>
&gt; <br>
&gt; <br>
&gt; [1]: <a href=3D"https://spdx.org/licenses/WxWindows-exception-3.1.html=
" rel=3D"noreferrer" target=3D"_blank">https://spdx.org/licenses/WxWindows-=
exception-3.1.html</a><br>
&gt; [2]: <a href=3D"https://layers.openembedded.org/layerindex/recipe/4387=
36/" rel=3D"noreferrer" target=3D"_blank">https://layers.openembedded.org/l=
ayerindex/recipe/438736/</a><br>
<br>
That file is generated from the the scripts/update-sdpx-licenses.py<br>
update script. I did just run an update so we can pull in recent<br>
changes however that license isn&#39;t among them.<br>
<br>
I therefore checked and it is because it is a license exception, not a<br>
full license.<br>
<br>
Copying Joshua, I&#39;m not sure how we want to handle the exceptions.<br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div></div>

--000000000000000219065256340b--

