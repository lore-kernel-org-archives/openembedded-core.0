Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2DBEC4345F
	for <webhook@archiver.kernel.org>; Fri, 19 Apr 2024 21:25:32 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web11.5100.1713561926959533066
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Apr 2024 14:25:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JXaTNvSd;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-618769020bcso27729157b3.3
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Apr 2024 14:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713561926; x=1714166726; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jkFPoYoWCVISo/PSkZrqae/30w5SV5ztE/BwY34GiRU=;
        b=JXaTNvSdNXfgQZIClaHAPuBHQHpTrRhgQDWIQFbDFr/xAVvFrLNo7wPIWd3M8Mnvvm
         Sgn5DTnbanNQ1IqHk6ERInDMGKk0XHoIDVsumvcCL4kzV4vwvL6gDWBux+gFKKU7nyn+
         V0Srzj/IIAW4qCVaG2ep6CGaJKR4Mv2RK98Mou6jgb8l44uK0M2BOjZxFYRKlGR2RREl
         ULuJDe0TjB1mSpTSjdBWAmLIX44igQcrpJfVUq+UJvdL/XQDy+teRDY4vmPRlGwXmbO6
         W2BxEmO0FEWYxLaCSmd02GzdQhPBMqkMXUgQuqmUrtEQQdV3g9g1HDDBh2D+RzxUSQzE
         jnSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713561926; x=1714166726;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jkFPoYoWCVISo/PSkZrqae/30w5SV5ztE/BwY34GiRU=;
        b=woPzgHkbDyJ3NWx1XeDiFvz7iuXXaJldrl17uHNTX37B9y6fzoOJn8GBowjb8Sws7s
         y/0HZy1Byi0s7r5sfFMoZr3UzCEh+95uCMAV6PogI4zJoHM3BcYnQvXOZu1ioK/cM8J6
         FVKpEAjzV5oHt92IRIEQ65D61eMcHzI2ljdftqh+9HndqBIVRc4rzdDC9lWKpn+z0mjb
         nzbH1C/HKzlVFQwqfPmoLp/sM1fY1bzpGzhN8D3I+1+dMD8rHHTi9r94cvsW02o24YnS
         WzgzmNZneDWX1/1DPMFeEL+ZT13fWCGhg0EhEmfI9bFYCc+Hij5xYqSKPkbJ5m8yDwZ1
         TeLg==
X-Forwarded-Encrypted: i=1; AJvYcCVUBKLkRsPy4M/3VqAYhH4PZ3m+4Td+VfOUMNyWCSRE+bgEQskXzWjWetcilOrbyVrLUYIo01iszFBkboFiWyCAeeXGDaP2jVRbOoBlbTMrbvu7Ie7E0NXu
X-Gm-Message-State: AOJu0Yz7ie/KMBZXYRvk0P7AfN/f6mlGDk8cQQICu8uVXVdZ1OUe06Lr
	KrV5b3oPscJOd9wI8Tujf2CYbJGW27u7AtMWqY1wXjZk7AKEavTLSwTCL/uzUhzFzf8DigSylWI
	3+t65x7ucZA85wdhTvOvWgnwhbuI=
X-Google-Smtp-Source: AGHT+IHIQOSsOFAxjor87odRvmWL7C8Ig2I/8ldKrYUoQP0Hz6rIl2CdYSBEShNbiq3xWDp841GS3dv1xUXjyrGLcmU=
X-Received: by 2002:a05:690c:6401:b0:61a:f59a:c1b5 with SMTP id
 hr1-20020a05690c640100b0061af59ac1b5mr3316361ywb.23.1713561926025; Fri, 19
 Apr 2024 14:25:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240419203140.461439-1-rasmus.villemoes@prevas.dk>
 <CANNYZj_5AkKa_dJVmjzvnng_7SFrdDr70T_wDN=bcA2WfMX+Bw@mail.gmail.com> <3bcf8a46-6452-488b-85cb-c6938e1066a8@prevas.dk>
In-Reply-To: <3bcf8a46-6452-488b-85cb-c6938e1066a8@prevas.dk>
From: Tim Orling <ticotimo@gmail.com>
Date: Fri, 19 Apr 2024 14:25:14 -0700
Message-ID: <CANx9H-B4-tEGjC_y0GiFrAeR24Z2PjocVX-=6CRbGBQ+rXytgg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] bmaptool: add PROVIDES bmap-tools for compatibility
To: rasmus.villemoes@prevas.dk
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, Otavio Salvador <otavio@ossystems.com.br>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, Tom Hochstein <tom.hochstein@nxp.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000e6c94b061679b90d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Apr 2024 21:25:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198566

--000000000000e6c94b061679b90d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 19, 2024 at 2:16=E2=80=AFPM Rasmus Villemoes via lists.openembe=
dded.org
<rasmus.villemoes=3Dprevas.dk@lists.openembedded.org> wrote:

> On 19/04/2024 23.00, Alexander Kanavin wrote:
> > This was already proposed, and rejected.
> > https://lists.openembedded.org/g/openembedded-core/topic/104753355
> >
> > You need to fix the metadata that refers to the old name.
>
> So, how can a layer then be compatible with both nanbield and scarthgap?
> Could this perhaps be applied just to the scarthgap branch, but not maste=
r?


Ask yourself why you are choosing one branch to be compatible with multiple
releases? And then have your push scripts push to a =E2=80=9Cnanbield=E2=80=
=9D branch and a
=E2=80=9Cscarthgap=E2=80=9D branch. This means the Layer Index will also au=
tomatically know
about your compatibility. This means any traditional Yocto project user
will have zero questions about which of your branches to choose.

Multiple LAYERSERIES_COMPAT is not really intent. It=E2=80=99s also often n=
ot
accurate (layers with addpylib are not actually compatible with dunfell).

Branches are cheap. Use them as intended.


>
> Rasmus
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#198565):
> https://lists.openembedded.org/g/openembedded-core/message/198565
> Mute This Topic: https://lists.openembedded.org/mt/105625834/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000e6c94b061679b90d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Apr 19, 2024 at 2:16=E2=80=AFPM Rasmus Villemoes vi=
a <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;=
rasmus.villemoes=3D<a href=3D"mailto:prevas.dk@lists.openembedded.org">prev=
as.dk@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-=
left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">On 19=
/04/2024 23.00, Alexander Kanavin wrote:<br>
&gt; This was already proposed, and rejected.<br>
&gt; <a href=3D"https://lists.openembedded.org/g/openembedded-core/topic/10=
4753355" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.or=
g/g/openembedded-core/topic/104753355</a><br>
&gt; <br>
&gt; You need to fix the metadata that refers to the old name.<br>
<br>
So, how can a layer then be compatible with both nanbield and scarthgap?<br=
>
Could this perhaps be applied just to the scarthgap branch, but not master?=
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Ask yourself why=
 you are choosing one branch to be compatible with multiple releases? And t=
hen have your push scripts push to a =E2=80=9Cnanbield=E2=80=9D branch and =
a =E2=80=9Cscarthgap=E2=80=9D branch. This means the Layer Index will also =
automatically know about your compatibility. This means any traditional Yoc=
to project user will have zero questions about which of your branches to ch=
oose.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Multiple LAYERSERI=
ES_COMPAT is not really intent. It=E2=80=99s also often not accurate (layer=
s with addpylib are not actually compatible with dunfell).</div><div dir=3D=
"auto"><br></div><div dir=3D"auto">Branches are cheap. Use them as intended=
.</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;=
padding-left:1ex;border-left-color:rgb(204,204,204)" dir=3D"auto"><br>
<br>
Rasmus<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#198565): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/198565" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/198565</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/105625834/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/105625834/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000e6c94b061679b90d--

