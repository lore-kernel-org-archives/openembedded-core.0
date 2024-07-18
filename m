Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2784AC3DA49
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 10:12:30 +0000 (UTC)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
 by mx.groups.io with SMTP id smtpd.web10.12020.1721297548587853260
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jul 2024 03:12:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GrP4AaAt;
 spf=pass (domain: gmail.com, ip: 209.85.222.48, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-8100f08b5a8so260111241.0
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 03:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721297547; x=1721902347; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nFew3TxDVHN8E0DQDQJEvx4Nq+IH/46F5L5EkC0R3co=;
        b=GrP4AaAtmG3uPF3X8gtmNgK0EucLZkhmUzUPeD9bnOo+jjBIwC/IVWYRWdWw880Fq3
         qe3IvHI12ZmYVg5xwaI1+vXLM5IqpLrN94dGSEqfkS1OzrNzKXuNSoiYL2QrIeV1GXoH
         K50Eec+2lm4+W+N/LlFhjtitP5AnetRum4Dp8jB2y7QA0Zi4dlnfOyFoHajAtBJNxQnR
         mnnrU/f4wbr8r4QUXFoeGvEIMTKxHe2cIgH2DRr+AjJRDDS5MmD5UtDcmCE2rOK4MGkk
         RQ3S30iwlhaJUxoUHy46RPuy6aTEDD+Ky1OC0FR3paLpT4qipOtwamPfSCS1fj+XkXUL
         8ieQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721297547; x=1721902347;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nFew3TxDVHN8E0DQDQJEvx4Nq+IH/46F5L5EkC0R3co=;
        b=Jdy8K9aEbBi+rzlg8DbfvpJGtDZrXck5jd3xfQaf6ydGw4TfASRkLh9nVHrvW0aqVA
         OzMScSQ7hYH45IE8YC5C80H5hiLUoTV04cRq/mbwhGNWwEiAS96Iii8M3IUpfeQRJd19
         ivMiRRpBSPqiMnnRlDaZJ085UAyzXpKZoJBysoendw+znKd7IHQJcU7Nw0cjmnWxDKaj
         bp6qM64hdMtagt69ehVboz1CRHW175KCk4q4v9BcQ1YDPp4uLhSjFBBrLYlUTHp81ha2
         P281D/AICElt9rWfyg1b2map1L1zmOTcBDrGNsOjZghpJnFxBFed3k1l8RSkIAqL1fer
         8YvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLO3IB3+mpm2Vvwli7dxWryLQP8XoQOqRX6tHf4T+f5m62p+rIvHavNrkgx8pN1TEg7c7ZTBbr6DgTm/+O1Ft4bevedD6gzuZGjlapWSr456zSMImkUxNj
X-Gm-Message-State: AOJu0YyG/9sqmStfNkkU6AOPakdwwxMCYst6p0TjYHyD6qea/0r+rJGJ
	Kw+Pl7CgWJxJ5Tc0ZvYG+nchFXv8oDhL11osg4ifBrhqVLoTRHi2ZRmQW5Mfg1zPMITSKfzQp6E
	UsVU10TN++AyV2wGqsogOvz/kT1c=
X-Google-Smtp-Source: AGHT+IFQGrL6JsQwgK8IATry6n8irbl8X4aqrAKa4lAwgpPukGvAzwEmQ+xRZzw9wgApEA67yCiLS9LfO69EFh0tFJ8=
X-Received: by 2002:a05:6102:809e:b0:48f:ba1e:8ce3 with SMTP id
 ada2fe7eead31-4915976d110mr5847736137.4.1721297547423; Thu, 18 Jul 2024
 03:12:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240307200830.221403-1-emil.kronborg@protonmail.com>
 <856288DD-FACC-45EA-8248-C2FD0EC724C6@arm.com> <s3wfvdgfsf3niuxqr4waflxlwjv3mh7qvlylcqg24k4t2uv35v@65c6olmmmpqq>
In-Reply-To: <s3wfvdgfsf3niuxqr4waflxlwjv3mh7qvlylcqg24k4t2uv35v@65c6olmmmpqq>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 18 Jul 2024 11:12:16 +0100
Message-ID: <CANPvuRkMki=YLnKjnFRZ6RVGEtCpKWeCp_S6=JCgve_ch2rn5A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] openssh: enable sshd.service by default
To: emil.kronborg@protonmail.com
Cc: Ross Burton <Ross.Burton@arm.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000ddf72a061d82d013"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 10:12:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202200

--000000000000ddf72a061d82d013
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Emil Kronborg via lists.openembedded.org <emil.kronborg=3D
protonmail.com@lists.openembedded.org> escreveu (segunda, 18/03/2024 =C3=A0=
(s)
18:55):

> On Fri, Mar 15, 2024 at 16:09 +0000, Ross Burton wrote:
> > On 7 Mar 2024, at 20:08, Emil Kronborg via lists.openembedded.org
> <emil.kronborg=3Dprotonmail.com@lists.openembedded.org> wrote:
> > >
> > > Socket activation is prone to DoS (denial of service) because too man=
y
> > > connections will permanently deactivate sshd.socket [1]. Also, since
> > > socket units do not allow setting Restart, accepting new connections
> can
> > > fail due to, for example, OOM (out of memory) [2]. Therefore, it seem=
s
> > > more sensible to use sshd.service by default and let sshd.socket be a=
n
> > > optional choice.
> >
> > Counter-argument: this is why it=E2=80=99s a PACKAGECONFIG, and socket
> activation has the advantage that it makes boots faster.  If DoS is a
> concern, then the distro can switch trivially to service activated.
> >
> > Ross
>
> Those are fair arguments. What do you think about the situation where
> sshd.socket becomes disabled, and you are unable to connect? I can see
> this being a problem for remote boards or boards that are not easily
> accessible. FWIW, socket activation is disabled by default on Arch Linux
> and Fedora. I don't have a box running Debian (or any other distros)
> right now to check those as well.
>

Gentoo also doesn't have the socket activation option installed.
I am in favor of merging this change.

With the new openssh 9.8p1 the systemd service notification doesn't
work with the "-i" so we can't use that also in socket mode.

Jose


>
> --
> Emil Kronborg
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#197312):
> https://lists.openembedded.org/g/openembedded-core/message/197312
> Mute This Topic: https://lists.openembedded.org/mt/104795507/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000ddf72a061d82d013
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Emil Kronborg via <a href=3D"http://l=
ists.openembedded.org">lists.openembedded.org</a> &lt;emil.kronborg=3D<a hr=
ef=3D"mailto:protonmail.com@lists.openembedded.org">protonmail.com@lists.op=
enembedded.org</a>&gt; escreveu (segunda, 18/03/2024 =C3=A0(s) 18:55):<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">On Fri, Mar 15, 2024=
 at 16:09 +0000, Ross Burton wrote:<br>
&gt; On 7 Mar 2024, at 20:08, Emil Kronborg via <a href=3D"http://lists.ope=
nembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org<=
/a> &lt;emil.kronborg=3D<a href=3D"mailto:protonmail.com@lists.openembedded=
.org" target=3D"_blank">protonmail.com@lists.openembedded.org</a>&gt; wrote=
:<br>
&gt; &gt;<br>
&gt; &gt; Socket activation is prone to DoS (denial of service) because too=
 many<br>
&gt; &gt; connections will permanently deactivate sshd.socket [1]. Also, si=
nce<br>
&gt; &gt; socket units do not allow setting Restart, accepting new connecti=
ons can<br>
&gt; &gt; fail due to, for example, OOM (out of memory) [2]. Therefore, it =
seems<br>
&gt; &gt; more sensible to use sshd.service by default and let sshd.socket =
be an<br>
&gt; &gt; optional choice.<br>
&gt; <br>
&gt; Counter-argument: this is why it=E2=80=99s a PACKAGECONFIG, and socket=
 activation has the advantage that it makes boots faster.=C2=A0 If DoS is a=
 concern, then the distro can switch trivially to service activated.<br>
&gt; <br>
&gt; Ross<br>
<br>
Those are fair arguments. What do you think about the situation where<br>
sshd.socket becomes disabled, and you are unable to connect? I can see<br>
this being a problem for remote boards or boards that are not easily<br>
accessible. FWIW, socket activation is disabled by default on Arch Linux<br=
>
and Fedora. I don&#39;t have a box running Debian (or any other distros)<br=
>
right now to check those as well.<br></blockquote><div><br></div><div style=
=3D"color:rgb(0,0,0)">Gentoo also doesn&#39;t have the socket activation op=
tion installed.<br>I am in favor of merging=C2=A0this change.<br><br>With t=
he new openssh 9.8p1 the systemd service notification doesn&#39;t</div><div=
 style=3D"color:rgb(0,0,0)">work with the &quot;-i&quot; so we can&#39;t us=
e that also in socket mode.<br><br></div><div><span style=3D"color:rgb(0,0,=
0)">Jose</span></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
<br>
-- <br>
Emil Kronborg<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#197312): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/197312" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/197312</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/104795507/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/104795507/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--000000000000ddf72a061d82d013--

