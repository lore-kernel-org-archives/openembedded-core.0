Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEA9FCD128A
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 01:50:08 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web11.28913.1711936202042796644
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Mar 2024 18:50:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=FDe4KqNz;
 spf=pass (domain: mvista.com, ip: 209.85.208.177, mailfrom: vanusuri@mvista.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2d094bc2244so39445101fa.1
        for <openembedded-core@lists.openembedded.org>; Sun, 31 Mar 2024 18:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1711936200; x=1712541000; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sGDfCvPAd2Dgn+tenqpm/Ym1hUK7fY2SZ3dSeoj0Ia8=;
        b=FDe4KqNzYRLREIzP1Ni7z6YarP3g2e6SATbDr4zKF5oRGZdcHxxOulM2okFuo3GY3O
         7beDouhKyx8+hK6wxrrB30KdeDHzEx5jpK9KE1htFmAZKS/RO2Gu0c9YK3YRUr71239B
         71mQBbe8aaF1VLNWu4KneoEiOX+6TjkVkeyzA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711936200; x=1712541000;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sGDfCvPAd2Dgn+tenqpm/Ym1hUK7fY2SZ3dSeoj0Ia8=;
        b=F//Q6cxaUUcIpJsaJ9hYMrshUwOPo9zRwAnoDoKaXLVoj5wN3kCiINFvsA4x6DRzZs
         XtsKVPe06QtGGy5dGJxa530v9F2uZjwDy6vvEm9GHefUJNenCYAODsz5cmfL09J6d2wz
         LFdwmO6IsbN0uKcymaP+/KWc9KSi43pyiSDJPzgyQgxTKBxbIMSMfRUi7jjnXjPwOi+u
         Z6QibXJWPP3ktaw45Zg9JhPauRocOd14rYVcjFlUFu8Bz2ZwVkVftFn149da85uV38Zl
         qCiHeCx6w7hWdzx4//EP7Fb7s2TjQghQa6rPAFRmlxMRN3oRdr6McUYVniyueJm4W33i
         Bq/A==
X-Forwarded-Encrypted: i=1; AJvYcCXY7dbl7dBzckoGpm0yXoGWb6XoPupldogWJlLZ/n16wgS9AXAJJwd0P62xgEOABproMnY4XKhq5jdo3ax3EApCcwijduSK3vT/sFRmgFMS6QpXvvk50Umc
X-Gm-Message-State: AOJu0YysQTmY6p/2vc7myP4AqpXxYQ0nu9fLrT5azeXbm/pKR5iXoSlL
	yYt79J1p2AWYUU1qS2SrAKixq+5XDhZKeJ4J6eDWxEM5AMnsGsZmJxAo2fCaXWTG3n/3PVa1G3t
	kP1Te+043fH/46vpMSxlaWIgZoC0KEv5jgQBpng==
X-Google-Smtp-Source: AGHT+IGe74RmvvhF7QqHcGvrjSfmx5lxvSyKY0Ht9Oj/CNTxpJl5jsHU3wmXh0++qqNRtCbgM9XFbCZo/M5UhcsoRZ4=
X-Received: by 2002:a2e:920c:0:b0:2d6:87e2:e11e with SMTP id
 k12-20020a2e920c000000b002d687e2e11emr4546189ljg.8.1711936199798; Sun, 31 Mar
 2024 18:49:59 -0700 (PDT)
MIME-Version: 1.0
References: <17C137F27040B581.32709@lists.openembedded.org>
 <CANQUz1_hPjw4kCpAG90Xc2O61p2EQgzWQH_DZ_DA2jq=UWpuOg@mail.gmail.com> <CAK6=ix7ifFeR+RXdR1mAzLQHoZL8ze84=QBn3-n8NWN3hDtHwQ@mail.gmail.com>
In-Reply-To: <CAK6=ix7ifFeR+RXdR1mAzLQHoZL8ze84=QBn3-n8NWN3hDtHwQ@mail.gmail.com>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Mon, 1 Apr 2024 07:19:48 +0530
Message-ID: <CANQUz19hBO63Edk+4wMCXF2RTF-UARs5LVa0Ud7oGZjD03SmOA@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] util-linux: Fix for CVE-2024-28085
To: Randy MacLeod <rwmacleod@gmail.com>
Cc: Steve Sakoman <steve@sakoman.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000114a010614ff35f5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 01:50:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197670

--000000000000114a010614ff35f5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sure Randy.

Issue introduced last year in util-linux v2.39.

The offending commits are:

* https://github.com/util-linux/util-linux/commit/8a7b8456d1dc0e7c
   ("write: correctly handle wide characters")
* https://github.com/util-linux/util-linux/commit/aa13246a1bf1be9e
   ("wall: use fputs_careful()")

I have added offending commits as dependency patches. As vulnerable
code is not present, it's not affected. So, I want it to be ignored.

Thanks & Regards,
Vijay


On Sun, Mar 31, 2024 at 5:54=E2=80=AFAM Randy MacLeod <rwmacleod@gmail.com>=
 wrote:

>
>
> On Fri, Mar 29, 2024, 11:52 Vijay Anusuri via lists.openembedded.org
> <vanusuri=3Dmvista.com@lists.openembedded.org> wrote:
>
>> Hi Steve,
>>
>> Please ignore this patch.
>>
>> Thanks & Regards,
>> Vijay
>>
>
>
> Hi Vijay,
>
> I expect that's fine with Steve but in the future, it would be good if,
> when you ask for a patch to be ignored, you briefly explain why you'd lik=
e
> it to be ignored.
>
> Randy
>
>
>

--000000000000114a010614ff35f5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Sure Randy.<br><br><pre class=3D"gmail-bz_comment_text" id=
=3D"gmail-comment_text_3"><span style=3D"font-family:arial,sans-serif">Issu=
e introduced last year in util-linux v2.39.

The offending commits are:

* <a href=3D"https://github.com/util-linux/util-linux/commit/8a7b8456d1dc0e=
7c">https://github.com/util-linux/util-linux/commit/8a7b8456d1dc0e7c</a>
   (&quot;write: correctly handle wide characters&quot;)
* <a href=3D"https://github.com/util-linux/util-linux/commit/aa13246a1bf1be=
9e">https://github.com/util-linux/util-linux/commit/aa13246a1bf1be9e</a>
   (&quot;wall: use fputs_careful()&quot;)<br><br></span></pre><pre class=
=3D"gmail-bz_comment_text" id=3D"gmail-comment_text_3"><span style=3D"font-=
family:arial,sans-serif">I have added offending commits as dependency patch=
es. As vulnerable code is not present, it&#39;s not affected. So, I want it=
 to be ignored.<br><br></span></pre><pre class=3D"gmail-bz_comment_text" id=
=3D"gmail-comment_text_3"><span style=3D"font-family:arial,sans-serif">Than=
ks &amp; Regards,<br>Vijay</span><br></pre></div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Mar 31, 2024 at 5:54=E2=
=80=AFAM Randy MacLeod &lt;<a href=3D"mailto:rwmacleod@gmail.com">rwmacleod=
@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 29, 2024, 11:52 Vijay Anusuri v=
ia <a href=3D"http://lists.openembedded.org" target=3D"_blank">lists.openem=
bedded.org</a> &lt;vanusuri=3D<a href=3D"mailto:mvista.com@lists.openembedd=
ed.org" target=3D"_blank">mvista.com@lists.openembedded.org</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"=
><div>Hi Steve,</div><div><br></div><div>Please ignore this patch.</div><di=
v><br></div><div>Thanks &amp; Regards,</div><div>Vijay<br></div></div></blo=
ckquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div=
><div dir=3D"auto">Hi Vijay,=C2=A0</div><div dir=3D"auto"><br></div><div di=
r=3D"auto">I expect that&#39;s fine with Steve but in the future, it would =
be good if, when you ask for a patch to be ignored, you briefly explain why=
 you&#39;d like it to be ignored.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Randy</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></di=
v></div>
</blockquote></div>

--000000000000114a010614ff35f5--

