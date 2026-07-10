Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC97BC43458
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 14:00:30 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13289.1783692027182468662
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 07:00:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=V99axRwT;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: jpewhacker@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-80a1fb0c683so12189067b3.1
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 07:00:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783692026; cv=none;
        d=google.com; s=arc-20260327;
        b=fHmrcKudLXDeo56nFH0LduBHJJRcsSEWulomvWfuoxpgW0VnaaqCu9Vh9wckbdtauF
         IzprIZCtCCVaJpybgIzjxAfS8xgvkbZqCfLGG++Ds/ibpSo4/bdDNT2QSjXbQkHX/1P+
         Szn2Vkh1188Mjq8j1gGh32vqLkjLJ4UI7IF2+dwvgrjskhB7Up6ZoEbUQ8sh60c6UL+C
         ViMQHpsts1bxHQPeV6RpdTI2rVkdslMm4ylC/MAMHeYFN9yqcNSUR9l+Ddf9cQC12EBP
         pcNyn3BOsuD7mDX/9zpAo7838AtWT2GEFRneGSwSrc6VhWt+QAifHCcPvLJ8bpqRuILz
         5u4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MFhn6MwRuWSB1WA5lho0OFuu4zJPIaRcv62rsDE70Eo=;
        fh=TbrRlanDGzV5YmOkARCYYpF+h+h5rdWCpgSXBz0dqPs=;
        b=SdB9YsMAQPWNbqc9FDGyURFNH8nkc8piShoaeNJ7aHGAwXKD18SsF9nXG+12J3p1MZ
         CX0nRn24HRAfIR5w61o6OUX0iMCUXw2yxu9iSYq+FR3K/yrsKdbKdtR01p9uWVSGGVkl
         Cxc/zn3Fsh54mCQQrHoFXM0Mll1JqQ5HDgn0uld+gdQrFXrtpRMXHQrl7Tx7h5Nj90Yu
         czM9a/usY5jlDnzgRsncxPP3tATKIxOU+DpJYxVA2Zd3PUs1PKPQ2PQZp+ULzvAaDnPf
         H0Jhz5sIkeDZU95nGkErnnLlraFzeIpOyVfND25KMwEBXsMO0ctx7FrZV7/M2jL62CD0
         OQ5Q==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783692026; x=1784296826; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MFhn6MwRuWSB1WA5lho0OFuu4zJPIaRcv62rsDE70Eo=;
        b=V99axRwTWQ1d3xelB++gUkFxXL7JuagMq82IUbaA6bSxq/TSQi0UM93ph2HjVULW46
         HnTltm74aVfnBQxAxzFSKwRQbPlOwXNVNUoWCmVm8Ohh6rW77ahGHVA/tEAiWbptV3LK
         rbmZdCScyn2uVe9ptQM8H9Dg/ONq6BdcjHzOXkHCtAWkt0jvhT4mjd588KoRTc6kGwhI
         04yiqFyE8jn42uiZJimO8F158NQK2mTSdRpmTlCIGUTcsQbFDwqwVUyYlcTfkY80fvAS
         574+kBDmCUD5l2rSsP38pEP5cy4UjP8MrGGOqMaMAU47xCcyN7wvsJeMwVOkHToONTN/
         bkqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783692026; x=1784296826;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MFhn6MwRuWSB1WA5lho0OFuu4zJPIaRcv62rsDE70Eo=;
        b=BvDQ/hvkQiV/B07S2x6eTvICSQrR0e3Np7eqHqR7/nhWwHbRemrOOK3RnPb+phAlbp
         BKuBUPRiYHLQ1ukv5jYLhvf6vOWv93jVc0z/xKdJeXQ/YzD3H4IcsdKO/Df4+F503/yD
         s8xpJJcKw65JfOsMVWMHUQet20qmOLwsqc6JOKTfue+ysGFnhbFQPMcmhBXy2UKGROgf
         iBKPawknuadR8Es2PglMaIw6gL5tGjFFvI5RxgbuacwX/EeRJlQ9ST/sT1nUsJKN1duM
         1NQuxH/c9NV90MGQj5B4q3eVDznjU/QCr6/QZBqD5ntWSrg2VVGMqeXcqDjxEZSlGlCr
         3DQA==
X-Forwarded-Encrypted: i=1; AHgh+RqdE3fvaRbyZi6F9aWni5GjV1nO199lGOz99duIlcS28zpYT8Ng0nTCNjnf1eSjaRM8IiM7Lr0ZB2TTGN6aIrropg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwE494lR53n8uJI6N0nSXt9SCVyfSKDteCseqzvZqhD0wXHJ8QL
	GG9GKgqnm88Knzdb7b4TgLTVpu88e2iyZljDaXRUGLuXoZmbHmZBrolm0ask6huTPhbaMakbrgv
	1pXO4OoYmjq3LqfaGicLxcq3F3rx+vdY=
X-Gm-Gg: AfdE7clwopWOi0BzYoK090JY6XYv4o/CpItGGhvaSFP/7rRHxZEzbFtnZBPW1AbXsTS
	zr87xoq+wos5yqZTaUB2pRMFXIMPgyYNnEfCNmvune+Qr56QMzKvnWVR9RKSjQR73a8b9U3zI40
	63x+ixWp5fT0B1kCqadQ7Awa/SVH7D+wfypxj8CtEpQU3cyZKo2PSaoif+cu0llYivUsUha/ylc
	tsXby2I154JUGIlJOusGLJZv/kwx5c79ruYFKmisWzPk7n2Y+bVSVXVtwtwWN67lBzgwXxk//yq
	J39fu3nUbWYWXPZNMZot
X-Received: by 2002:a05:690c:6d08:b0:80c:2365:8750 with SMTP id
 00721157ae682-81dbeb67374mr91792107b3.18.1783692021457; Fri, 10 Jul 2026
 07:00:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260706135009.1818867-1-ross.burton@arm.com> <DJT6HQ4N7EGR.2UDG8J0QL9AL4@bootlin.com>
 <CANNYZj-NtN6DeXpLYxA=XfPNJ3Edhb8f-OQ3_-3CxBmwsXmXXQ@mail.gmail.com>
In-Reply-To: <CANNYZj-NtN6DeXpLYxA=XfPNJ3Edhb8f-OQ3_-3CxBmwsXmXXQ@mail.gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Fri, 10 Jul 2026 08:00:09 -0600
X-Gm-Features: AUfX_my8jg-O1xq3dhAV_lyzLt2JA7PmU1HGu03sta8xE23etpn0ourrJU01yQ4
Message-ID: <CAJdd5GZTKbi2mSTBwpxghOj3V2s1j4GN6HqNr_mJ-JyYmcLGBw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] nasm: upgrade 3.01 -> 3.02
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: mathieu.dubois-briand@bootlin.com, ross.burton@arm.com, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000005405f0065642298d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 14:00:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240655

--0000000000005405f0065642298d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 10, 2026 at 5:01=E2=80=AFAM Alexander Kanavin <alex.kanavin@gma=
il.com>
wrote:

> On Wed, 8 Jul 2026 at 14:12, Mathieu Dubois-Briand via
> lists.openembedded.org
> <mathieu.dubois-briand=3Dbootlin.com@lists.openembedded.org> wrote:
> > > Drop the backported C23 patch, and replace the debug-prefix-map patch=
es
> > > with backports that are now merged upstream (thanks Joshua Watt).
>
> > Sorry but it looks like this upgrade is breaking the reproducibility
> > test for ffmpeg:
> >
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/4343
> >
> https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20260707-b241bpr=
y/
> >
> > It looks like libav built code differs. Can you have a look at this?
>
> Seems like backported debug-prefix-map patch doesn't fully work?
> Joshua, can you take a look please? Is the backport not done
> correctly, or is something missing in the original master patch?
>

The upstream solution still needs some work. I'll try to get some time next
week to look at it


>
> Thanks,
> Alex
>

--0000000000005405f0065642298d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jul 10,=
 2026 at 5:01=E2=80=AFAM Alexander Kanavin &lt;<a href=3D"mailto:alex.kanav=
in@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">On Wed, 8 Jul 2026 at 14:12, Mathieu Du=
bois-Briand via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a><br>
&lt;mathieu.dubois-briand=3D<a href=3D"mailto:bootlin.com@lists.openembedde=
d.org" target=3D"_blank">bootlin.com@lists.openembedded.org</a>&gt; wrote:<=
br>
&gt; &gt; Drop the backported C23 patch, and replace the debug-prefix-map p=
atches<br>
&gt; &gt; with backports that are now merged upstream (thanks Joshua Watt).=
<br>
<br>
&gt; Sorry but it looks like this upgrade is breaking the reproducibility<b=
r>
&gt; test for ffmpeg:<br>
&gt;<br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/37=
/builds/4343" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoct=
oproject.org/valkyrie/#/builders/37/builds/4343</a><br>
&gt; <a href=3D"https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20=
260707-b241bpry/" rel=3D"noreferrer" target=3D"_blank">https://valkyrie.yoc=
to.io/pub/repro-fail/oe-reproducible-20260707-b241bpry/</a><br>
&gt;<br>
&gt; It looks like libav built code differs. Can you have a look at this?<b=
r>
<br>
Seems like backported debug-prefix-map patch doesn&#39;t fully work?<br>
Joshua, can you take a look please? Is the backport not done<br>
correctly, or is something missing in the original master patch?<br></block=
quote><div><br></div><div>The upstream solution still needs some work. I&#3=
9;ll try to get some time next week to look at it</div><div>=C2=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Thanks,<br>
Alex<br>
</blockquote></div></div>

--0000000000005405f0065642298d--

