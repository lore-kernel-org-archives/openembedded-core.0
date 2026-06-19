Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E0EFCD98F8
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 08:51:54 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38664.1781859105823981304
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2026 01:51:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=NjI4YMHs;
 spf=pass (domain: mvista.com, ip: 209.85.218.52, mailfrom: vanusuri@mvista.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c074142cf6dso285696166b.0
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 01:51:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781859104; cv=none;
        d=google.com; s=arc-20240605;
        b=NvlBy/KTjcxnU0mvVPz1vclNlbIqQsMrL6ANsXEjnBopPnmRsRb9tQ8SX1zRDiv6JH
         4/5Q65FT9XPDIRwObpg6h/oafiuyNbYMQwkjgiwsd8t+81nUBgEwzwHgIvDueMNkqW2H
         isM/VZGxdBT1/EuSzdJ2vFSml5eXjoZFTgvQjTVOQA3NTPmEdaZjhLeHC30rcVIc9bKv
         RE3GC/YPSGx6Kdecw4dflsTDzTlZ/e7FpL7ZWLFGfZnA6cVxqFaGr3zY5H0u8qCjIt1u
         H3IGDkZkM2P/fZCIq7AFQ1vF9NPQy8RUh0TkkM7QbVXfyMw25iNCZW3qreHFqvUdCzs1
         T5pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2RieK+8s4/+bynSaPJvQk/qEUbP1LuWHACL6O6x5wPE=;
        fh=1QS5+cAey2qgjVKXSpjX4hfxq1c0Nbzjadd4RREErUc=;
        b=DylV+5il5Qm5inVinPv8Ta6JIkB+10uB5CEsUBoFXyY1rYyL0cgOagQ1Q38EHqALm0
         h1hGF6vVm6PkrvOjf1nr1n48/X5z+LQvwPm/dCS2Mx44paJjkS3kifgzkF91gqbRE90N
         skgi5vi/q9m2atAbxcr2EOE22K5aBc6TykwyIBv8jAjs4+tl9nL448ueyxqK+bMs+L8v
         hGK7OHKglBrp4Vdf600NxKWn/tVCciNXdb2opKxuRpiINWmF0KEK3RYq31+s6vN8n73b
         5HYiSZ0Ig3dJm8Zm6sVSu+iFSpDKBjTrpp37+nu+l0SPGCMz3eWqKKs3nieqxm6nbPAL
         +Sag==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1781859104; x=1782463904; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2RieK+8s4/+bynSaPJvQk/qEUbP1LuWHACL6O6x5wPE=;
        b=NjI4YMHsDSCZdShVNeLISKlc7EwokDA0qvdQk2sM3q7S+fOtbHmLd9k0LFnztOA1H3
         rKVenLHNaMBF7dSg7ha2R19PoIAS2nssGWcazT8sLSrqLXxByYBnzSEcUYYoxCbNpY+x
         csulSnjgtHDyjRlHI/eAbzANzkmIxkrBXSxr0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781859104; x=1782463904;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2RieK+8s4/+bynSaPJvQk/qEUbP1LuWHACL6O6x5wPE=;
        b=Zx95RSzo+1Cjw37+WnzNSPqxFuyiIN+4UVbl6FtY5cHAiSzsnc+6Jmv9Gs7GGTpeCw
         a8NRy/agzrcgs3lLYrcFvjIjDZY/DEoWsMeoG+QgYEy3LGXqGZDp6q+j+Uo1SjevmWOo
         b+IWdmZAECgdL0jMFKsygFBE0LoUaFIR+7q27X60Gq8UMz+SNvgV1GYfsgH82RDtTyTu
         uSCiu8Tlc1xqXdD62PZK8FxydhO3dUi4QfC9g4PPTn2ARcrvy5QsGf2JDYTT7Knj7MKG
         Cy8WYZraDWtSBxnIfgxz7MMYKAaQiZY1BTISHu0/UGiK3oMFcWKJNLS5gxt57B4y3M/C
         bUUQ==
X-Gm-Message-State: AOJu0Yz+x04iAaKWRWSh2JbNcjdYpMVBJ8LBwoY9TleI7oL5Wx74jZgx
	pLfJI3zk9uPqQ7rEmY+643h8o0lHv8GK6UiuXwvYitoLoLOzDK0aSnNHRovAh/3DPPRlQpyBeXj
	cJG4MjIVzH6/mfOPXyV1HZHM7Ic8MkYx7grgtTuHlCQ==
X-Gm-Gg: AfdE7ckoKtieaX48nGx6STuLO3U6p2AOa3a0VTMZ5fAcm5LLNsLZv/NlX7bDX6H1o9G
	CknGvBbuJqikbYl0wYZ+3tIp36/1cqzNgnLewbNNz6nx5GcX7SMpJ3mUpR833QaWMM0B6/97VID
	cwyv64/LBJ8CDgUzrV8DHRt1qrvD1N5+TE2uKwjn3A8e48VBY6CTjSAhcfTt4jirJVqjQCWpc5W
	tlikJLBcL1hAitRHgrzUAbn11H/+5MalcXS9q8Neg1RiYTbzs6MOpc36+pyxYHewSUDdw8vPHrU
	xVpCXL8S9T6XSCDAYzXHbjHoaYmy2QI=
X-Received: by 2002:a17:907:db15:b0:bf2:cd2b:dc47 with SMTP id
 a640c23a62f3a-c09b9680588mr114436966b.21.1781859102735; Fri, 19 Jun 2026
 01:51:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260618070328.650509-1-vanusuri@mvista.com> <20260618070328.650509-2-vanusuri@mvista.com>
 <DJCV1YSQQZEZ.2A0D7446B7SLQ@smile.fr>
In-Reply-To: <DJCV1YSQQZEZ.2A0D7446B7SLQ@smile.fr>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Fri, 19 Jun 2026 14:21:30 +0530
X-Gm-Features: AVVi8CcxYu6xA2CB1dETrtuo0y1gMtgZINMJeY1ZPKds7LrPHXSHD-bFacx59YE
Message-ID: <CANQUz1_g5aVAWkP5U1f=fEBz-4v9B8FM1nPv=Ua6=77PSHCu1A@mail.gmail.com>
Subject: Re: [OE-core][wrynose][patch 2/5] scripts: Fix typo in
 pull-spdx-licenses script name
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Antonin Godard <antonin.godard@bootlin.com>
Content-Type: multipart/alternative; boundary="000000000000dbd3b606549766bf"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 08:51:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239151

--000000000000dbd3b606549766bf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,

The reason for the backport is that we are upgrading xwayland to 24.1.11 on
the stable branch. As part of that upgrade, the license was changed to
include X11-no-permit-persons by commit
91ecfdcc1da3fdfee670244c90da0ab4eb296453.

Without commit e0f53fa1d09bd175766b3fa1582794ea008f4e1c, which adds
X11-no-permit-persons to the common license set, the build fails during
license validation/compliance checks when building xwayland 24.1.11.

Therefore, this backport is not intended as a standalone cleanup. It is
required to support the xwayland upgrade and ensure the associated license
metadata is correctly recognized by the build system.

Thanks & Regards,
Vijay

On Fri, Jun 19, 2026 at 1:21=E2=80=AFPM Yoann Congal <yoann.congal@smile.fr=
> wrote:

> On Thu Jun 18, 2026 at 9:03 AM CEST, Vijay Anusuri via
> lists.openembedded.org wrote:
> > From: Richard Purdie <richard.purdie@linuxfoundation.org>
> >
> > Fix the typo in the script name since I can't unsee it now!
> >
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > (cherry picked from commit 2776008404eebb58bb24e02140ed18760492752b)
> > Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > ---
>
> Hello,
>
> That kind of cleanup is not generally suitable for stable branches. Is
> there a particular reason to backport this?
>
> Thanks!
>
> >  scripts/{pull-sdpx-licenses.py =3D> pull-spdx-licenses.py} | 0
> >  1 file changed, 0 insertions(+), 0 deletions(-)
> >  rename scripts/{pull-sdpx-licenses.py =3D> pull-spdx-licenses.py} (100=
%)
> >
> > diff --git a/scripts/pull-sdpx-licenses.py
> b/scripts/pull-spdx-licenses.py
> > similarity index 100%
> > rename from scripts/pull-sdpx-licenses.py
> > rename to scripts/pull-spdx-licenses.py
>
>
> --
> Yoann Congal
> Smile ECS
>
>

--000000000000dbd3b606549766bf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Hi=C2=A0Yoann,<br><br><p class=3D"gmail-isSelect=
edEnd"><span>The reason for the backport is that we are upgrading xwayland =
to 24.1.11 on the stable branch. As part of that upgrade, the license was c=
hanged to include </span><code dir=3D"ltr"><span>X11-no-permit-persons</spa=
n></code><span> by commit 91ecfdcc1da3fdfee670244c90da0ab4eb296453.</span><=
/p><p class=3D"gmail-isSelectedEnd"><span>Without commit e0f53fa1d09bd17576=
6b3fa1582794ea008f4e1c, which adds </span><code dir=3D"ltr"><span>X11-no-pe=
rmit-persons</span></code><span> to the common license set, the build fails=
 during license validation/compliance checks when building xwayland 24.1.11=
.</span></p><p><span>Therefore, this backport is not intended as a standalo=
ne cleanup. It is required to support the xwayland upgrade and ensure the a=
ssociated license metadata is correctly recognized by the build system.</sp=
an></p><br></div>Thanks &amp;=C2=A0Regards,<br></div>Vijay</div><br><div cl=
ass=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Fri, Jun 19, 2026 at 1:21=E2=80=AFPM Yoann Congal &lt;<a href=3D"ma=
ilto:yoann.congal@smile.fr">yoann.congal@smile.fr</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">On Thu Jun 18, 2026 at 9:0=
3 AM CEST, Vijay Anusuri via <a href=3D"http://lists.openembedded.org" rel=
=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; From: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundat=
ion.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<br>
&gt;<br>
&gt; Fix the typo in the script name since I can&#39;t unsee it now!<br>
&gt;<br>
&gt; Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@lin=
uxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&=
gt;<br>
&gt; Signed-off-by: Antonin Godard &lt;<a href=3D"mailto:antonin.godard@boo=
tlin.com" target=3D"_blank">antonin.godard@bootlin.com</a>&gt;<br>
&gt; Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@lin=
uxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&=
gt;<br>
&gt; (cherry picked from commit 2776008404eebb58bb24e02140ed18760492752b)<b=
r>
&gt; Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com=
" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; ---<br>
<br>
Hello,<br>
<br>
That kind of cleanup is not generally suitable for stable branches. Is<br>
there a particular reason to backport this?<br>
<br>
Thanks!<br>
<br>
&gt;=C2=A0 scripts/{pull-sdpx-licenses.py =3D&gt; pull-spdx-licenses.py} | =
0<br>
&gt;=C2=A0 1 file changed, 0 insertions(+), 0 deletions(-)<br>
&gt;=C2=A0 rename scripts/{pull-sdpx-licenses.py =3D&gt; pull-spdx-licenses=
.py} (100%)<br>
&gt;<br>
&gt; diff --git a/scripts/pull-sdpx-licenses.py b/scripts/pull-spdx-license=
s.py<br>
&gt; similarity index 100%<br>
&gt; rename from scripts/pull-sdpx-licenses.py<br>
&gt; rename to scripts/pull-spdx-licenses.py<br>
<br>
<br>
-- <br>
Yoann Congal<br>
Smile ECS<br>
<br>
</blockquote></div>

--000000000000dbd3b606549766bf--

