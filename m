Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DA09E77188
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 14:50:02 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web10.20798.1736347798031986487
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jan 2025 06:49:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e5XQmwGg;
 spf=pass (domain: gmail.com, ip: 209.85.210.44, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-71e157a79c8so3259875a34.2
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 06:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736347797; x=1736952597; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GQWP4ivCPMrBumCzDc/hjQuyj2jXKg2iV/Bi/EOtAGk=;
        b=e5XQmwGg/LE7EP8nQ1oinWb1AlkThOu+TP4q6Ocgjv5uQYg647uvwuiO59kLR1VllF
         PxSxL5QqhQC8iqEKJks1gDrlfPBpDiaYiiVs1wcbAnewTVqclhrVquzNPGALMWqcSJvE
         jevkAP7UFEeDEe2kWGuYO99+RWAiPjmaKcXOFusv8El9as5isGZ95STMdK2ydgFT4SLW
         gph3B7RcoDzOjMgHtwyGT0jPU87s9K3bS02vyXMV9uHS0SYIDC5xyBXo5Whiz92wxgEg
         E/OGyZUgsN4k7vaOSjzuGCIBOVQiEHbu+tLmTbxbBog/yZ7a+7D2u+r3OZdre08fVhYa
         y2uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736347797; x=1736952597;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GQWP4ivCPMrBumCzDc/hjQuyj2jXKg2iV/Bi/EOtAGk=;
        b=UVuKwwmBFJwF4JR+lAVzGm8mYs2QrwN33OjSOrleVhgHBMB85hZcZU0PwZ0dnnAs4j
         /f/LCJVg5cqYuJGdHc6tOAYlTemT/ZHzYARy8PrlD3dgZdhCqMyeERP+jnKLj/XADv/j
         snjrrOAiqCma2o+wahikTJPmy/jGgLULYadUdGsqKIuvsUnaNFomGY3mRS502YcDAhwv
         +8jIGh4lsFD3GLqP4bttj329ZP0ReI7MQGzRaLq7X8sB0HO7uYgcXX94GymXU7ifPNSx
         zO0zDzN5ODhWqHXV/JlQh4rbg7eEoaoD8Rn3QAeiwD88n9SGDfS8QEQIIz5MGvGnvC3y
         J7YA==
X-Gm-Message-State: AOJu0YzYZyXIx1rLGJLiaPAiVflwtCRVHpIES6oTPeyV1WxrGZCsB3u2
	6DOTpb2jtdW1oc9ddf1Y/zsAeuoWh1ulEkgaPKZ3eVgv6Dg7zTNGTb+s8EFxrUtQGufRgQ93wVL
	0CRoTfX+JgHjqsC4Z+m5Y1A2DT34=
X-Gm-Gg: ASbGncu9hdS91EXHJo8+a9w5y2iB550ap8NcokWiA0dZkMyvlo2dhiCm6Ow8TMozIjq
	GovEnat6nOumAcxV/n/JdGOyCe68jJKPtiUUz6771JCJ6Vh+DQjjbz4fXYY5cF4+pVq+B5vc=
X-Google-Smtp-Source: AGHT+IE3LfonbWoc3xjk0WRaW7UOvEL7VNb9nrV/mUy+JG4ml7zeZv3w6iPraAWGsikyj1PCHhM+zUixHPCGCqiFE8M=
X-Received: by 2002:a05:6870:9f11:b0:297:c04:9191 with SMTP id
 586e51a60fabf-2aa06647043mr1498783fac.3.1736347797041; Wed, 08 Jan 2025
 06:49:57 -0800 (PST)
MIME-Version: 1.0
References: <20250108033627.2889555-1-raj.khem@gmail.com> <a1862f6aa78a3b74025451f3d5872cdd2859200f.camel@linuxfoundation.org>
In-Reply-To: <a1862f6aa78a3b74025451f3d5872cdd2859200f.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 8 Jan 2025 06:49:46 -0800
X-Gm-Features: AbW1kvbrGi0rIrX1sLNyxSHKPO61XpNQ6HV73457B6nCYtFRMQZztAALHKBzRjM
Message-ID: <CAMKF1so+dvpPme0B77vVEO_x5cLsAaU_7rt5ogwK-PLqxpO0Fg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] glibc: Revert clang float128 patch
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000a63a5f062b32f916"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 14:50:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209562

--000000000000a63a5f062b32f916
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 8, 2025 at 5:23=E2=80=AFAM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Tue, 2025-01-07 at 19:36 -0800, Khem Raj via lists.openembedded.org
> wrote:
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  ...e-__HAVE_FLOAT128-for-Clang-and-use-.patch | 87 +++++++++++++++++++
> >  meta/recipes-core/glibc/glibc_2.41.bb         |  1 +
> >  2 files changed, 88 insertions(+)
> >  create mode 100644
> meta/recipes-core/glibc/glibc/0001-Revert-x86-Define-__HAVE_FLOAT128-for-=
Clang-and-use-.patch
> >
> > diff --git
> a/meta/recipes-core/glibc/glibc/0001-Revert-x86-Define-__HAVE_FLOAT128-fo=
r-Clang-and-use-.patch
> b/meta/recipes-core/glibc/glibc/0001-Revert-x86-Define-__HAVE_FLOAT128-fo=
r-Clang-and-use-.patch
> > new file mode 100644
> > index 00000000000..88823cb95bc
> > --- /dev/null
> > +++
> b/meta/recipes-core/glibc/glibc/0001-Revert-x86-Define-__HAVE_FLOAT128-fo=
r-Clang-and-use-.patch
> > @@ -0,0 +1,87 @@
> > +From b662179d7c679e423b8595e0509253688544a4fd Mon Sep 17 00:00:00 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Thu, 26 Dec 2024 18:59:26 -0800
> > +Subject: [PATCH] Revert "x86: Define __HAVE_FLOAT128 for Clang and use
> > + __builtin_*f128 code path"
> > +
> > +This reverts commit d773aff467840f5ed305e40c180466e90bd88183.
> > +
> > +Upstream-Status: Pending
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + sysdeps/x86/bits/floatn.h | 24 ++++++++----------------
> > + 1 file changed, 8 insertions(+), 16 deletions(-)
> > +
>
> Why?
>
> Neither the commit message or the patch header have any information
> about why we need to do this...


I sent it by mistake local workaround for fixing mpfr with glibc 2.41

>
>
> Cheers,
>
> Richard
>

--000000000000a63a5f062b32f916
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote gmail_quote_container"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 8, 2025 at 5:23=E2=80=AFAM =
Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">ri=
chard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;bo=
rder-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">=
On Tue, 2025-01-07 at 19:36 -0800, Khem Raj via <a href=3D"http://lists.ope=
nembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org<=
/a> wrote:<br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0...e-__HAVE_FLOAT128-for-Clang-and-use-.patch | 87 +++++++++++++=
++++++<br>
&gt; =C2=A0meta/recipes-core/glibc/<a href=3D"http://glibc_2.41.bb" rel=3D"=
noreferrer" target=3D"_blank">glibc_2.41.bb</a>=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +<br>
&gt; =C2=A02 files changed, 88 insertions(+)<br>
&gt; =C2=A0create mode 100644 meta/recipes-core/glibc/glibc/0001-Revert-x86=
-Define-__HAVE_FLOAT128-for-Clang-and-use-.patch<br>
&gt; <br>
&gt; diff --git a/meta/recipes-core/glibc/glibc/0001-Revert-x86-Define-__HA=
VE_FLOAT128-for-Clang-and-use-.patch b/meta/recipes-core/glibc/glibc/0001-R=
evert-x86-Define-__HAVE_FLOAT128-for-Clang-and-use-.patch<br>
&gt; new file mode 100644<br>
&gt; index 00000000000..88823cb95bc<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-core/glibc/glibc/0001-Revert-x86-Define-__HAVE_FLOA=
T128-for-Clang-and-use-.patch<br>
&gt; @@ -0,0 +1,87 @@<br>
&gt; +From b662179d7c679e423b8595e0509253688544a4fd Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt;<br>
&gt; +Date: Thu, 26 Dec 2024 18:59:26 -0800<br>
&gt; +Subject: [PATCH] Revert &quot;x86: Define __HAVE_FLOAT128 for Clang a=
nd use<br>
&gt; + __builtin_*f128 code path&quot;<br>
&gt; +<br>
&gt; +This reverts commit d773aff467840f5ed305e40c180466e90bd88183.<br>
&gt; +<br>
&gt; +Upstream-Status: Pending<br>
&gt; +Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; +---<br>
&gt; + sysdeps/x86/bits/floatn.h | 24 ++++++++----------------<br>
&gt; + 1 file changed, 8 insertions(+), 16 deletions(-)<br>
&gt; +<br>
<br>
Why?<br>
<br>
Neither the commit message or the patch header have any information<br>
about why we need to do this...</blockquote><div dir=3D"auto"><br></div><di=
v dir=3D"auto">I sent it by mistake local workaround for fixing mpfr with g=
libc 2.41=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1e=
x;border-left-color:rgb(204,204,204)" dir=3D"auto"><br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div></div>

--000000000000a63a5f062b32f916--

