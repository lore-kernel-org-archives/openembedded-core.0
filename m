Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBDF6CD3447
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 13:11:19 +0000 (UTC)
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13313.1778245875413042232
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 06:11:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=UJE7cl7K;
 spf=pass (domain: gmail.com, ip: 74.125.224.54, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-65c5361142fso2137258d50.0
        for <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 06:11:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778245874; cv=none;
        d=google.com; s=arc-20240605;
        b=GE3lLbM5gs/ae+WfBIkCQP4XVwRKuZ9+QE0/GPhuDilPJ1F+LRpvTIqCpOUGvfibVz
         EBO1vXsj1Ojx3JGn3djaMI+ZE5xD7Cj2WO/G6KZfyr5bR586hLrKFVlDCTbaQMEnmFbP
         /EukubL4aHdkm69+/uc5BBvFiscKU0PYIDrA/vi8IpqxFgIZ7glwLtKzz77tzPRzUdPq
         P6PW2WFzEZrU0axuhTjAmP56KHsvkXP6kpSzyDo6X0tQpT99Rib2H22a7AWnj0+Rtqc9
         dXa4rmT1+twgH/B6ifito22qiR+Kg1ZvdOC85EwlEy603h+lCKVf7t2GOVaUFVWDTExu
         WK7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MyHAPZ6vXfUiSDdJ5OQtO7KPgvNP8pNX4mku+QOvKGU=;
        fh=4gDdst7jrBGUnACXSpNQq75rSKoUzWeWM32DKV6cGns=;
        b=bwXA766zguHhlNprUOa5GBljbjh+r/VMDQYPIvHyIj2u8o/CoLP/HApvq6LyWB6oE2
         ew0yJdm2/xNpE5xYiEX3lQ87jGayd2d+CvOdPHQK8m0KooJD4NKSoVbIC/ZK23BXc9K9
         4k6N8Y2wRfXrVbi+FEvE+jPIjtTL2hr2TiDcuLBAt+eXCWWgeUqyP3fpho5mGraaror2
         NfH+WfUe7nBK1o+7cNIEOAXkrPGZs2MIHs7BEXTogzhHkkU81b97pFbNXKtvxjC08V7c
         z3rjRZuYROONp3xSzoa8P+AjvYoXVaBRofh5/nKHtg90rPz0Aa9BTCaWjmKkNg7PwqwC
         eGNw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778245874; x=1778850674; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MyHAPZ6vXfUiSDdJ5OQtO7KPgvNP8pNX4mku+QOvKGU=;
        b=UJE7cl7K2it2/5/jXrO4hdMt7IJy97Lcx/lZSqtH/Arr2LsQyTRJ43owujWx+Tn6hr
         9GmTol6wA5NaaielKS7bwyETkYKA7WjFv55sCuAUifMzXQSojnjHy0yJE7gg5YFfIpVt
         EkTjHZZyAK+5t+L/C25bBveXufEVhtToZfP+/XCGbnMVKkUHIgwyJU1P8i5x3V6hAI1U
         TfwQfXlT+s7ZX3vA3PEHcjZ/NsgWjb15lM4XnePzY+DZpcn9Ox+EIW6wHm4nCP1gSGEL
         FvtIGSIH18p6+Iji+K4i6dFvB+Rdy0JyECAD/sQE5LYH82XVNkcbMm+NrSiUpVZx1+j7
         aXCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778245874; x=1778850674;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MyHAPZ6vXfUiSDdJ5OQtO7KPgvNP8pNX4mku+QOvKGU=;
        b=KO4lhYpCTk3TlKEfkFYkKrz0UydizXcEJY4q3IMz5MkkueV6Oluaf7h5aVlhwy72dL
         9ho6UwmBe71tqKCDh+x/HhMA9jSp1AG//grtNailS1CD5TYJONDTItGur4Wyf2eMpM6a
         XOOM/W2akpknfAvKz0JpIITqS8xNtGGBB1O+wAPT1mp3Xid2IC2fBY1Pql7Gqo1rZzaj
         JKwBKoZ//JrfWFMRxnNNdjjQSHOfWGcWKIGE1unPjctYsq56ahtxtcueh2mC8R8kAmhb
         tByIA3HLD8BXSZQVETA3Yt3x7Md6c+89iT8c2K0zqNenBWw3WuiPLPjoXALl3s+whXJJ
         4TNg==
X-Forwarded-Encrypted: i=1; AFNElJ9tApazt2skcokXiLOJyY3ASqQVaxscpNX9Use9BvRTCxfaPdsxPMWyky/TFU7XRQwySSAilCY/BwNEMoHACIDF/g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxXC9OpYM8GJ5KLAgFBte6ct9JgrDebdjQe5I24Jy9Eo3nI4S7Q
	pSFsvOjIFDVL3qpDCleeQHx3nSFhSZCnRfWFk1FY4VVv6BH9ayzZTGJRyrD6Ns72D5xlqov+2vb
	MWviNNKUSsVzOKQQwncs3RAQIbLw8vXs=
X-Gm-Gg: Acq92OGcXiEIptJGxhmP9YwfWddVGyfSgM1Jc8BHFrYwy4c8YFPe9lObxTJvKG+/U9P
	XgWAB14KW+MBnCMbfBcaMH3V/ZEBya0bCecwTcrywgkhhQFSbIGiWhzrdMoRCVZc0BhNROU3kHt
	TUD6tbimslgKa9TFKfhP3yKnjTUqY6IUQqFjEZ7cwaysbHBR8ClGXHR79CzpCv/0KKleZTb4LBo
	AHFvHi9iOkDa0IJMkFvflF9e/cfBL4QVwNnD8NZ5BPkwOL1BMejBomJoHZa5z0wjkbVhjvDtwsi
	/8cC6bJcJ2RZpt0and9k8pGxSepX+oBA20EXM+umt7fulRw24BOMk/wnXcXLiO1onB6vM2BvlfU
	yCkNFH3yNzpyzw1hcs3fnOKFySR+Rn9C5kCJGcHQPEsupQ3kex1a7on2ZV1fS7o2wWZtSdLxum9
	Uf2ysONw==
X-Received: by 2002:a05:690e:44cd:b0:65c:6ffb:303d with SMTP id
 956f58d0204a3-65c79a078c4mr9095886d50.62.1778245874376; Fri, 08 May 2026
 06:11:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260504-glibc-fix-stackprot-v1-1-fbfd0f22ddd2@sonos.com> <CANNYZj8zc+Q4wzg8BOiY4GSNz+dZ5Byq7mjQSdO2zPuKB5XY4A@mail.gmail.com>
In-Reply-To: <CANNYZj8zc+Q4wzg8BOiY4GSNz+dZ5Byq7mjQSdO2zPuKB5XY4A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 8 May 2026 18:41:02 +0530
X-Gm-Features: AVHnY4KCKz0edKYXpG8u6UHhGXGKsGALCd1AJjc3wc93BiDzyIorwv-V30EDCxw
Message-ID: <CAMKF1sqGRZhTBxmJ_i=qiCoXqrZN-L8Xz8+i=2ev2CmbH_rQmg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] glibc: Fix recipe bug that disabled stack protector
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: ivan.nestlerode@sonos.com, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000aa634306514e21a9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 13:11:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236710

--000000000000aa634306514e21a9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

In olden days we had to solve bootstrap issues and there were chicken egg
issues between glibc and gcc which we do not have today. I think this patch
is fine. Please apply

On Thu, May 7, 2026, 3:37=E2=80=AFPM Alexander Kanavin via lists.openembedd=
ed.org
<alex.kanavin=3Dgmail.com@lists.openembedded.org> wrote:

> The patch is fine, but there was interest on the patch review in
> finding out where and why these lines were introduced. The earliest
> commit is this one:
>
> https://git.openembedded.org/openembedded-core/commit/?h=3Dmaster-next&id=
=3Dbddc141e7cec18744902787ab53c21bf28e71f78
>
> Alex
>
> On Mon, 4 May 2026 at 23:28, Ivan Nestlerode via
> lists.openembedded.org
> <ivan.nestlerode=3Dsonos.com@lists.openembedded.org> wrote:
> >
> > From: Ivan Nestlerode <ivan.nestlerode@sonos.com>
> >
> > Fixes [YOCTO #16265]
> >
> > The glibc recipe is supposed to be building with
> > --enable-stack-protector=3Dstrong, but some CACHED_CONFIGVARS values ar=
e
> > actually breaking this, causing glibc to be built with no stack
> > protector at all.
> >
> > Remove these CACHED_CONFIGVARS values so that stack protector support i=
s
> > detected properly in do_configure and then enabled properly during
> > do_compile.
> >
> > Full details are here:
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16265
> >
> > Signed-off-by: Ivan Nestlerode <ivan.nestlerode@sonos.com>
> > ---
> > The glibc recipe is supposed to be building with
> > --enable-stack-protector=3Dstrong, but some CACHED_CONFIGVARS values
> > are actually breaking this, causing glibc to be built with no stack
> > protector at all.
> >
> > Full details are here:
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16265
> > ---
> >  meta/recipes-core/glibc/glibc.inc | 3 ---
> >  1 file changed, 3 deletions(-)
> >
> > diff --git a/meta/recipes-core/glibc/glibc.inc
> b/meta/recipes-core/glibc/glibc.inc
> > index 30d93bca77..dae087d53f 100644
> > --- a/meta/recipes-core/glibc/glibc.inc
> > +++ b/meta/recipes-core/glibc/glibc.inc
> > @@ -21,9 +21,6 @@ CACHED_CONFIGUREVARS +=3D " \
> >    libc_cv_slibdir=3D${base_libdir} \
> >    libc_cv_rootsbindir=3D${base_sbindir} \
> >    libc_cv_localedir=3D${localedir} \
> > -  libc_cv_ssp_strong=3Dno \
> > -  libc_cv_ssp_all=3Dno \
> > -  libc_cv_ssp=3Dno \
> >    libc_cv_include_x86_isa_level=3Dno \
> >  "
> >
> >
> > ---
> > base-commit: 9ca41405e6bca276468a3b6f67eaa328b8016485
> > change-id: 20260504-glibc-fix-stackprot-47134ada0b7f
> >
> > Best regards,
> > --
> > Ivan Nestlerode <ivan.nestlerode@sonos.com>
> >
> >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#236571):
> https://lists.openembedded.org/g/openembedded-core/message/236571
> Mute This Topic: https://lists.openembedded.org/mt/119151502/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000aa634306514e21a9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>In olden days we had to solve bootstrap issues and t=
here were chicken egg issues between glibc and gcc which we do not have tod=
ay. I think this patch is fine. Please apply=C2=A0<br><br><div class=3D"gma=
il_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Th=
u, May 7, 2026, 3:37=E2=80=AFPM Alexander Kanavin via <a href=3D"http://lis=
ts.openembedded.org">lists.openembedded.org</a> &lt;alex.kanavin=3D<a href=
=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.o=
rg</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">The patch is fine, but there was interest on the patch review in<br>
finding out where and why these lines were introduced. The earliest<br>
commit is this one:<br>
<a href=3D"https://git.openembedded.org/openembedded-core/commit/?h=3Dmaste=
r-next&amp;id=3Dbddc141e7cec18744902787ab53c21bf28e71f78" rel=3D"noreferrer=
 noreferrer" target=3D"_blank">https://git.openembedded.org/openembedded-co=
re/commit/?h=3Dmaster-next&amp;id=3Dbddc141e7cec18744902787ab53c21bf28e71f7=
8</a><br><br>
Alex<br><br>
On Mon, 4 May 2026 at 23:28, Ivan Nestlerode via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">lists.openembedded.org</a><br>
&lt;ivan.nestlerode=3D<a href=3D"mailto:sonos.com@lists.openembedded.org" t=
arget=3D"_blank" rel=3D"noreferrer">sonos.com@lists.openembedded.org</a>&gt=
; wrote:<br>
&gt;<br>
&gt; From: Ivan Nestlerode &lt;<a href=3D"mailto:ivan.nestlerode@sonos.com"=
 target=3D"_blank" rel=3D"noreferrer">ivan.nestlerode@sonos.com</a>&gt;<br>
&gt;<br>
&gt; Fixes [YOCTO #16265]<br>
&gt;<br>
&gt; The glibc recipe is supposed to be building with<br>
&gt; --enable-stack-protector=3Dstrong, but some CACHED_CONFIGVARS values a=
re<br>
&gt; actually breaking this, causing glibc to be built with no stack<br>
&gt; protector at all.<br>
&gt;<br>
&gt; Remove these CACHED_CONFIGVARS values so that stack protector support =
is<br>
&gt; detected properly in do_configure and then enabled properly during<br>
&gt; do_compile.<br>
&gt;<br>
&gt; Full details are here:<br>
&gt; <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16265" =
rel=3D"noreferrer noreferrer" target=3D"_blank">https://bugzilla.yoctoproje=
ct.org/show_bug.cgi?id=3D16265</a><br>
&gt;<br>
&gt; Signed-off-by: Ivan Nestlerode &lt;<a href=3D"mailto:ivan.nestlerode@s=
onos.com" target=3D"_blank" rel=3D"noreferrer">ivan.nestlerode@sonos.com</a=
>&gt;<br>
&gt; ---<br>
&gt; The glibc recipe is supposed to be building with<br>
&gt; --enable-stack-protector=3Dstrong, but some CACHED_CONFIGVARS values<b=
r>
&gt; are actually breaking this, causing glibc to be built with no stack<br=
>
&gt; protector at all.<br>
&gt;<br>
&gt; Full details are here:<br>
&gt; <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16265" =
rel=3D"noreferrer noreferrer" target=3D"_blank">https://bugzilla.yoctoproje=
ct.org/show_bug.cgi?id=3D16265</a><br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-core/glibc/glibc.inc | 3 ---<br>
&gt;=C2=A0 1 file changed, 3 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/gli=
bc/glibc.inc<br>
&gt; index 30d93bca77..dae087d53f 100644<br>
&gt; --- a/meta/recipes-core/glibc/glibc.inc<br>
&gt; +++ b/meta/recipes-core/glibc/glibc.inc<br>
&gt; @@ -21,9 +21,6 @@ CACHED_CONFIGUREVARS +=3D &quot; \<br>
&gt;=C2=A0 =C2=A0 libc_cv_slibdir=3D${base_libdir} \<br>
&gt;=C2=A0 =C2=A0 libc_cv_rootsbindir=3D${base_sbindir} \<br>
&gt;=C2=A0 =C2=A0 libc_cv_localedir=3D${localedir} \<br>
&gt; -=C2=A0 libc_cv_ssp_strong=3Dno \<br>
&gt; -=C2=A0 libc_cv_ssp_all=3Dno \<br>
&gt; -=C2=A0 libc_cv_ssp=3Dno \<br>
&gt;=C2=A0 =C2=A0 libc_cv_include_x86_isa_level=3Dno \<br>
&gt;=C2=A0 &quot;<br>
&gt;<br>
&gt;<br>
&gt; ---<br>
&gt; base-commit: 9ca41405e6bca276468a3b6f67eaa328b8016485<br>
&gt; change-id: 20260504-glibc-fix-stackprot-47134ada0b7f<br>
&gt;<br>
&gt; Best regards,<br>
&gt; --<br>
&gt; Ivan Nestlerode &lt;<a href=3D"mailto:ivan.nestlerode@sonos.com" targe=
t=3D"_blank" rel=3D"noreferrer">ivan.nestlerode@sonos.com</a>&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#236571): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/236571" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://lists.openembedded.org/g/openembedded-core/message/236571</a><=
br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119151502/199=
7914" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/mt/119151502/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lists.op=
enembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.=
com" target=3D"_blank" rel=3D"noreferrer">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div></div>

--000000000000aa634306514e21a9--

