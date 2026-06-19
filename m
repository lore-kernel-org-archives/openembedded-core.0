Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A46ACD4F26
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 12:03:10 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40776.1781870581960994927
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2026 05:03:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=cDGj79a0;
 spf=pass (domain: mvista.com, ip: 209.85.208.43, mailfrom: vanusuri@mvista.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-68bd9fce347so3675256a12.2
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 05:03:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781870580; cv=none;
        d=google.com; s=arc-20240605;
        b=haK85f/frlCGrpDQzhCqDje9pEZyK3Zgx/NQJ5gFEjKMI1gwOMSq7u1/tfgBTFksoq
         CeRskSS/sKknDz896STVayQCTpSQYESTIXykcQk1Dbh+bCX+cAqkJ3tOiIH730d6M/2c
         UTqHKY89NV2V5eewsPGbODwa8TnsfGA4wbQhSYpWF0ynQzV7ULYVPXiI+fGJxEOteeC+
         OW+rBAQRCADVOGV97WxtGzVM1rHnRt/6IlGDnPpb3BBbQrAHRS1UL0h7cNi6bXJlUbNP
         nYIf1mFC1u/ThoxU2oCZzYQcD1mvBw5QoKvFGHbWE2J7Ih+OiM3xw+bD0Pz2mQANcFOX
         ZWTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JMkk+9XrIgkvJRNZp1JW1aFof1YXfMLTSMuM3sjBTQ0=;
        fh=oPvenIe2MqcUANsejD5eLN/XIcBDx+IOit5ifV1vkh0=;
        b=I+gT6LLdyqbK4KjLcP/KlGZvZ8JQb71XXNxQKEC9bRRC8ghllZNmolx0hUVeNP0Zi5
         ts/lceDVXnXs0G5Pi11ONM28/rXgBi+JlOlwMp/lztDTo2Fdien16p5HLSZ0nTvpr8Ef
         Pl+sQO33yksQaaExe8IC/ceAVI/X6I4cb1P/JgY7t0zT7+FBtCkacOX1DiGS3Z7FhuFz
         2Sn9SVzuv3aRt+0duclkFJ2h2hD8+WsRp0cuOeMygnojhAUtykjiTqXfTRnSQtCHUtb+
         SaXMiBBGjG8WKRne+ObKVIqYsAixHVEZDN2q9WtWForqvDwRHCU1zdptXGe5f1gaD4Y2
         Ug9A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1781870580; x=1782475380; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JMkk+9XrIgkvJRNZp1JW1aFof1YXfMLTSMuM3sjBTQ0=;
        b=cDGj79a046OEKzQxTMjXbWtM8smgY4iKbUp1r+yZfdAo1otqx+ERCxb7p39G2/CvXU
         fEFFGbWnDT8wMcOJTBeLmkFl/vBxSvhCi48CHBqlnyYTsdL6K+W8aKXPWD5nDC0UUCl1
         XQqsfC1enW4vfmz0dFerLeBg0vK8vbhRzHOcU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781870580; x=1782475380;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JMkk+9XrIgkvJRNZp1JW1aFof1YXfMLTSMuM3sjBTQ0=;
        b=Xu5URiEa9yMghyZY5Edx7SvymL2+CoqYnyDGjIQUeRqs/sgC6eUN//cgvPE2+EDO8O
         c6PW0RZfLlVPQQY8yYSrwQUy8BERdBDqaPTbDityTJDcgagPxYFLrS3x7nnoE6e4un/S
         oZvTxhBopEah3hTxw1yQilyp++Pqo4bNu/AmF64Ne0FF392uzu+6xtxby6Sc42DpgXqW
         FRbGzQ9dAVMQZvJpQYRLiPxB3sy354M+VdcXV4lvqzKihfd+ThSG16s32czoDh5SDPEl
         aD+jNY7PCCTYGIRSguoYHYla0bW+0zMUuaOiNS/8AIZTAF1sL6mDLs8lbvKqZfbz/Iz5
         sLFA==
X-Gm-Message-State: AOJu0Ywcou8R1e6E+3HXgH1JXSmrADslBebgqTA/3285sQw8tQPyENCb
	flnZRDamCstNyvXA+c9jYnnaRvSA9pGNAvXHVP3DrSfgCx6gYtm4jQrkCAvgg7C+FRVGExjO9VT
	vf1wCgHEj+i8pUylRMD1E8wysRySaKYJDrPHNk395yg==
X-Gm-Gg: AfdE7cnSYxcWvm62qHVUlfy0i4sCk0zdovbqrWp5TtvK1lgp+1sf2QuOtvag9AL/fpY
	SWA10nFKe7Xh9ftaHtvKJcsnhNEV+AgaLiA2El7QmgB7IWr98oHsh9Rf3DArCD5U2WaSQ84rkfw
	x3J+bhTgWwqxRK6IE3cRM5G8LOfid7riBaN4bHUQvNOB9f6jgadhhc4+I+64WudpEZY87b9GIiA
	8qna2tplXgQ2K8ZXdc/CigOnIXpl7i2KeaItuGwEZjlgewAcZsWtWkxZ7UKKwA4vONTbzjMLy7N
	38RD55aT5jWUeQeTyH5C2YFfNpd4zQ==
X-Received: by 2002:a17:907:1c96:b0:bef:1df6:12e4 with SMTP id
 a640c23a62f3a-c097c9c45acmr151595466b.29.1781870578784; Fri, 19 Jun 2026
 05:02:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260618070328.650509-1-vanusuri@mvista.com> <20260618070328.650509-2-vanusuri@mvista.com>
 <DJCV1YSQQZEZ.2A0D7446B7SLQ@smile.fr> <CANQUz1_g5aVAWkP5U1f=fEBz-4v9B8FM1nPv=Ua6=77PSHCu1A@mail.gmail.com>
 <DJCWO0FKMMJQ.257GXC23HD9CC@smile.fr>
In-Reply-To: <DJCWO0FKMMJQ.257GXC23HD9CC@smile.fr>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Fri, 19 Jun 2026 17:32:46 +0530
X-Gm-Features: AVVi8CcMQw0j2AlZPIe6Awxm8XtrZ8PMRwdFsiZjJzB_e7mGb2YcZbFEVI3f15g
Message-ID: <CANQUz1-_F8gUrp9fXHL5jzg1p4TC9emYgLPbwnqHZV2bRtO+LQ@mail.gmail.com>
Subject: Re: [OE-core][wrynose][patch 2/5] scripts: Fix typo in
 pull-spdx-licenses script name
To: Yoann Congal <yoann.congal@smile.fr>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Antonin Godard <antonin.godard@bootlin.com>
Content-Type: multipart/alternative; boundary="000000000000e275d606549a12a8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 12:03:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239168

--000000000000e275d606549a12a8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 19 Jun, 2026, 2:37=E2=80=AFpm Yoann Congal, <yoann.congal@smile.fr>=
 wrote:

> On Fri Jun 19, 2026 at 10:51 AM CEST, Vijay Anusuri wrote:
> > Hi Yoann,
> >
> > The reason for the backport is that we are upgrading xwayland to 24.1.1=
1
> on
> > the stable branch. As part of that upgrade, the license was changed to
> > include X11-no-permit-persons by commit
> > 91ecfdcc1da3fdfee670244c90da0ab4eb296453.
> >
> > Without commit e0f53fa1d09bd175766b3fa1582794ea008f4e1c, which adds
> > X11-no-permit-persons to the common license set, the build fails during
> > license validation/compliance checks when building xwayland 24.1.11.
> >
> > Therefore, this backport is not intended as a standalone cleanup. It is
> > required to support the xwayland upgrade and ensure the associated
> license
> > metadata is correctly recognized by the build system.
>
> Sorry but I don't understand how changing the script name helps with
> what you said above.
> To be clear, I only have doubt about this patch:
> 2/5 "scripts: Fix typo in pull-spdx-licenses script name"
> I took the others in the series to the review series including the
> licence updates that are needed for the xwayland upgrade.
>
> This is a work in progress but you can see what I intend to keep of this
> series at the bottom:
>
> https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dstable/wr=
ynose-nut
>
> Would that work for you?
>

This works for me. 2nd commit is just typo fix.

Thanks for merging.

>
> >
> > Thanks & Regards,
> > Vijay
> >
> > On Fri, Jun 19, 2026 at 1:21=E2=80=AFPM Yoann Congal <yoann.congal@smil=
e.fr>
> wrote:
> >
> >> On Thu Jun 18, 2026 at 9:03 AM CEST, Vijay Anusuri via
> >> lists.openembedded.org wrote:
> >> > From: Richard Purdie <richard.purdie@linuxfoundation.org>
> >> >
> >> > Fix the typo in the script name since I can't unsee it now!
> >> >
> >> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> >> > Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> >> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> >> > (cherry picked from commit 2776008404eebb58bb24e02140ed18760492752b)
> >> > Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> >> > ---
> >>
> >> Hello,
> >>
> >> That kind of cleanup is not generally suitable for stable branches. Is
> >> there a particular reason to backport this?
> >>
> >> Thanks!
> >>
> >> >  scripts/{pull-sdpx-licenses.py =3D> pull-spdx-licenses.py} | 0
> >> >  1 file changed, 0 insertions(+), 0 deletions(-)
> >> >  rename scripts/{pull-sdpx-licenses.py =3D> pull-spdx-licenses.py}
> (100%)
> >> >
> >> > diff --git a/scripts/pull-sdpx-licenses.py
> >> b/scripts/pull-spdx-licenses.py
> >> > similarity index 100%
> >> > rename from scripts/pull-sdpx-licenses.py
> >> > rename to scripts/pull-spdx-licenses.py
> >>
> >>
> >> --
> >> Yoann Congal
> >> Smile ECS
> >>
> >>
>
>
> --
> Yoann Congal
> Smile ECS
>
>

--000000000000e275d606549a12a8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><br><div dir=3D"auto"></div><div class=3D"gmail_quote gma=
il_quote_container" dir=3D"auto"><div dir=3D"ltr" class=3D"gmail_attr">On F=
ri, 19 Jun, 2026, 2:37=E2=80=AFpm Yoann Congal, &lt;<a href=3D"mailto:yoann=
.congal@smile.fr">yoann.congal@smile.fr</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex">On Fri Jun 19, 2026 at 10:51 AM CEST, Vijay Anusuri wro=
te:<br>
&gt; Hi Yoann,<br>
&gt;<br>
&gt; The reason for the backport is that we are upgrading xwayland to 24.1.=
11 on<br>
&gt; the stable branch. As part of that upgrade, the license was changed to=
<br>
&gt; include X11-no-permit-persons by commit<br>
&gt; 91ecfdcc1da3fdfee670244c90da0ab4eb296453.<br>
&gt;<br>
&gt; Without commit e0f53fa1d09bd175766b3fa1582794ea008f4e1c, which adds<br=
>
&gt; X11-no-permit-persons to the common license set, the build fails durin=
g<br>
&gt; license validation/compliance checks when building xwayland 24.1.11.<b=
r>
&gt;<br>
&gt; Therefore, this backport is not intended as a standalone cleanup. It i=
s<br>
&gt; required to support the xwayland upgrade and ensure the associated lic=
ense<br>
&gt; metadata is correctly recognized by the build system.<br>
<br>
Sorry but I don&#39;t understand how changing the script name helps with<br=
>
what you said above.<br>
To be clear, I only have doubt about this patch:<br>
2/5 &quot;scripts: Fix typo in pull-spdx-licenses script name&quot;<br>
I took the others in the series to the review series including the<br>
licence updates that are needed for the xwayland upgrade.<br>
<br>
This is a work in progress but you can see what I intend to keep of this<br=
>
series at the bottom:<br>
<a href=3D"https://git.openembedded.org/openembedded-core-contrib/log/?h=3D=
stable/wrynose-nut" rel=3D"noreferrer noreferrer" target=3D"_blank">https:/=
/git.openembedded.org/openembedded-core-contrib/log/?h=3Dstable/wrynose-nut=
</a><br>
<br>
Would that work for you?<br></blockquote></div><div dir=3D"auto"><br></div>=
<div dir=3D"auto">This works for me. 2nd commit is just typo fix.</div><div=
 dir=3D"auto"><br></div><div dir=3D"auto">Thanks for merging.</div><div cla=
ss=3D"gmail_quote gmail_quote_container" dir=3D"auto"><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">
<br>
&gt;<br>
&gt; Thanks &amp; Regards,<br>
&gt; Vijay<br>
&gt;<br>
&gt; On Fri, Jun 19, 2026 at 1:21=E2=80=AFPM Yoann Congal &lt;<a href=3D"ma=
ilto:yoann.congal@smile.fr" target=3D"_blank" rel=3D"noreferrer">yoann.cong=
al@smile.fr</a>&gt; wrote:<br>
&gt;<br>
&gt;&gt; On Thu Jun 18, 2026 at 9:03 AM CEST, Vijay Anusuri via<br>
&gt;&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer norefe=
rrer" target=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt;&gt; &gt; From: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@lin=
uxfoundation.org" target=3D"_blank" rel=3D"noreferrer">richard.purdie@linux=
foundation.org</a>&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Fix the typo in the script name since I can&#39;t unsee it no=
w!<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.p=
urdie@linuxfoundation.org" target=3D"_blank" rel=3D"noreferrer">richard.pur=
die@linuxfoundation.org</a>&gt;<br>
&gt;&gt; &gt; Signed-off-by: Antonin Godard &lt;<a href=3D"mailto:antonin.g=
odard@bootlin.com" target=3D"_blank" rel=3D"noreferrer">antonin.godard@boot=
lin.com</a>&gt;<br>
&gt;&gt; &gt; Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.p=
urdie@linuxfoundation.org" target=3D"_blank" rel=3D"noreferrer">richard.pur=
die@linuxfoundation.org</a>&gt;<br>
&gt;&gt; &gt; (cherry picked from commit 2776008404eebb58bb24e02140ed187604=
92752b)<br>
&gt;&gt; &gt; Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@m=
vista.com" target=3D"_blank" rel=3D"noreferrer">vanusuri@mvista.com</a>&gt;=
<br>
&gt;&gt; &gt; ---<br>
&gt;&gt;<br>
&gt;&gt; Hello,<br>
&gt;&gt;<br>
&gt;&gt; That kind of cleanup is not generally suitable for stable branches=
. Is<br>
&gt;&gt; there a particular reason to backport this?<br>
&gt;&gt;<br>
&gt;&gt; Thanks!<br>
&gt;&gt;<br>
&gt;&gt; &gt;=C2=A0 scripts/{pull-sdpx-licenses.py =3D&gt; pull-spdx-licens=
es.py} | 0<br>
&gt;&gt; &gt;=C2=A0 1 file changed, 0 insertions(+), 0 deletions(-)<br>
&gt;&gt; &gt;=C2=A0 rename scripts/{pull-sdpx-licenses.py =3D&gt; pull-spdx=
-licenses.py} (100%)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; diff --git a/scripts/pull-sdpx-licenses.py<br>
&gt;&gt; b/scripts/pull-spdx-licenses.py<br>
&gt;&gt; &gt; similarity index 100%<br>
&gt;&gt; &gt; rename from scripts/pull-sdpx-licenses.py<br>
&gt;&gt; &gt; rename to scripts/pull-spdx-licenses.py<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; Yoann Congal<br>
&gt;&gt; Smile ECS<br>
&gt;&gt;<br>
&gt;&gt;<br>
<br>
<br>
-- <br>
Yoann Congal<br>
Smile ECS<br>
<br>
</blockquote></div></div>

--000000000000e275d606549a12a8--

