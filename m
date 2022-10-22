Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EDE2C433FE
	for <webhook@archiver.kernel.org>; Sat, 22 Oct 2022 02:58:52 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.3022.1666407529979700491
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Oct 2022 19:58:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CztW8Epl;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id a15so1348643ljb.7
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Oct 2022 19:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XPev8pHlbstST+hc5jrtoV2i7JQsYpB4Bg5WCLqgMzI=;
        b=CztW8Epl49xlKUM/0xf1Dz5ZhYjooZw2Czvd4uKJiyR3mD5J9C/L0RPJXJOtP5M7tb
         fkNGP3P1sD+0rl4qE+yJBhy1Ui7egMu0kVc2ZfbB8V6fDWrnJsq/1Jqcp5Jc43ZL3D7a
         mSofjJMtkb8tK0WU6TFMbwIRXYrsTCaWVnHRviMp+yDpp88rirBDlJ64vD32Lafk+SXo
         Mw9cs4+C5vqV1PQziTko5aomcBT5ckKcGowZ6COEm+9RFeygfiXsHBrAbHng/3bJ8ZuI
         3HcETYOclKi3dWw1wBTarTuqr3PiqpMcO2XiNEfhJ8WPLd11b6XykEi5MaqhW90f5Y16
         FT/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XPev8pHlbstST+hc5jrtoV2i7JQsYpB4Bg5WCLqgMzI=;
        b=3i5wMm7X7MXER/9VE//xgj073nSguroggn4/uNg3x02o5K8Nzk9eNj7ThL+wQoGw1B
         SaKu+EWZ2m+rVIGgiLBizMyhnS2AirwDzjd4hvc0RH9JLKVjgnaikFKh3GXECm2pJ+LC
         xO43vp9bfnbBVQnR7p5gdfZYiiBpwdPsCMBRBVaSf578AL9nP5/yTIN9j2v5PdzEHqWH
         rBX8EJ6Yf//AIdngaELZLDOCMfanESclEdvbU3LsMDWjmrFKdBSWp3cokKmY7iSpsabp
         b4WY2lw4fPcXw++kNJFuY0Z0v/drjqPEMPe6M2qbru4VTSoftJM275fxJNes8cIxuVb1
         S5zw==
X-Gm-Message-State: ACrzQf3LvhmNlGeP3pBJTvNdo5s5Keqj8qu9dZTfPrj7ndFE18epqSru
	Bn0fX2rj8WTbf4vXv2G8Hc2DknjSCMxuZHG+4YM=
X-Google-Smtp-Source: AMsMyM5KF9BXYy3+UPTPCNXsP2qHpE7gV3ickUK3FwDpWsdXr4fXdxlPOPBBag1Ab03dFZimCYtc80ksigWKeoSyTJc=
X-Received: by 2002:a2e:7401:0:b0:26e:506:380a with SMTP id
 p1-20020a2e7401000000b0026e0506380amr7762152ljc.222.1666407528026; Fri, 21
 Oct 2022 19:58:48 -0700 (PDT)
MIME-Version: 1.0
References: <20221021200514.1918359-1-raj.khem@gmail.com> <CANNYZj9X45DmDddF=p=4ZVkwAN5q2a8TB3ref27_rj1YiRFhYQ@mail.gmail.com>
 <CAMKF1spDPVJXLmWdz=FiG19AAgUcThRfee8JOdBXiS=EYpwW2A@mail.gmail.com>
In-Reply-To: <CAMKF1spDPVJXLmWdz=FiG19AAgUcThRfee8JOdBXiS=EYpwW2A@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 22 Oct 2022 04:58:36 +0200
Message-ID: <CANNYZj8saTph1iKeu+SeQzaEVjHQNxw3Z-TsY8JXNs3FugF2WA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] rust: Disable 64bit atomics on crossbeam on riscv32
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000c2584a05eb96bcca"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Oct 2022 02:58:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172057

--000000000000c2584a05eb96bcca
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri 21. Oct 2022 at 23.49, Khem Raj <raj.khem@gmail.com> wrote:

> On Fri, Oct 21, 2022 at 2:01 PM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > On Fri, 21 Oct 2022 at 22:05, Khem Raj <raj.khem@gmail.com> wrote:
> > > Update the arch part of tuple to consider OE's names
> > > for riscv32
> >
> > > +--- a/vendor/crossbeam-utils-0.8.8/no_atomic.rs
> > > ++++ b/vendor/crossbeam-utils-0.8.8/no_atomic.rs
> > > +@@ -49,6 +49,8 @@ const NO_ATOMIC_64: &[&str] =3D &[
> > > +     "powerpc-wrs-vxworks-spe",
> > > +     "riscv32gc-unknown-linux-gnu",
> > > +     "riscv32gc-unknown-linux-musl",
> > > ++    "riscv32-unknown-linux-gnu",
> > > ++    "riscv32-unknown-linux-musl",
> > > +     "riscv32i-unknown-none-elf",
> > > +     "riscv32im-unknown-none-elf",
> > > +     "riscv32imac-unknown-none-elf",
> >
> > No. Updating this patch with every rust upgrade is already a pain in
> > the ass due to rust checksumming, it needs to be upstreamed in some
> > form rather sooner than later, and you just made it worse. Please
> > let's do a proper arch re-mapping.
>
> we should apply the v1 of patch and move on.


No again. Riscv32 is already listed so it=E2=80=99s on you to use existing =
mapping
to use those entries, and not add new ones.

Alex

--000000000000c2584a05eb96bcca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><br></div><div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Fri 21. Oct 2022 at 23.49, Khem Raj &lt;<a hr=
ef=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:=
rgb(204,204,204)" dir=3D"auto">On Fri, Oct 21, 2022 at 2:01 PM Alexander Ka=
navin<br>
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavi=
n@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Fri, 21 Oct 2022 at 22:05, Khem Raj &lt;<a href=3D"mailto:raj.khem@=
gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt; &gt; Update the arch part of tuple to consider OE&#39;s names<br>
&gt; &gt; for riscv32<br>
&gt;<br>
&gt; &gt; +--- a/vendor/crossbeam-utils-0.8.8/<a href=3D"http://no_atomic.r=
s" rel=3D"noreferrer" target=3D"_blank">no_atomic.rs</a><br>
&gt; &gt; ++++ b/vendor/crossbeam-utils-0.8.8/<a href=3D"http://no_atomic.r=
s" rel=3D"noreferrer" target=3D"_blank">no_atomic.rs</a><br>
&gt; &gt; +@@ -49,6 +49,8 @@ const NO_ATOMIC_64: &amp;[&amp;str] =3D &amp;[=
<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0&quot;powerpc-wrs-vxworks-spe&quot;,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0&quot;riscv32gc-unknown-linux-gnu&quot;,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0&quot;riscv32gc-unknown-linux-musl&quot;,<br=
>
&gt; &gt; ++=C2=A0 =C2=A0 &quot;riscv32-unknown-linux-gnu&quot;,<br>
&gt; &gt; ++=C2=A0 =C2=A0 &quot;riscv32-unknown-linux-musl&quot;,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0&quot;riscv32i-unknown-none-elf&quot;,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0&quot;riscv32im-unknown-none-elf&quot;,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0&quot;riscv32imac-unknown-none-elf&quot;,<br=
>
&gt;<br>
&gt; No. Updating this patch with every rust upgrade is already a pain in<b=
r>
&gt; the ass due to rust checksumming, it needs to be upstreamed in some<br=
>
&gt; form rather sooner than later, and you just made it worse. Please<br>
&gt; let&#39;s do a proper arch re-mapping.<br>
<br>
we should apply the v1 of patch and move on.</blockquote><div dir=3D"auto">=
<br></div><div dir=3D"auto">No again. Riscv32 is already listed so it=E2=80=
=99s on you to use existing mapping to use those entries, and not add new o=
nes.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Alex</div></div></d=
iv>

--000000000000c2584a05eb96bcca--

