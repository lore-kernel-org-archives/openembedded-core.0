Return-Path: <rob.woolleywr@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D25F3C5B572
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 00:23:21 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3411.1786666997056293758
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2026 17:23:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=dF+cPuVw;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: rob.woolleywr@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-836c4474028so5726457b3.0
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 17:23:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786666996; cv=none;
        d=google.com; s=arc-20260327;
        b=CGOeYur4NQqY3n2iYmHZSbjyJ3oG3LxiDfrC9FZdOAXm11oTwPAgNLPNajhx5r59nY
         ITcQl3kMH+j0p08pIBKCEE2YOvZdOZYfplG3Jwx1JajrhQSRWU/rxJbKJGcAVNlGIjD/
         4N6Td3M23vIhLv+PRzAlL16zg0bL/j6IYL1z+rjZYh+7uA+ZEnz8yIg7DPKDV7LAnEui
         Eu1dKiRTc0s3Kg+JfaHIuxR3YNy9iTZKKGPdC+0rPn/gvq8UhEpUv+fDLnzQbiq96jJ/
         q1bLcEGgLksA+9a7TJXiPdNGUr2t2yNM/2tkhwwL5gp5zRVjOgU7wrXtbM6XPe2qUsut
         b2LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FiPOqmQxsBI1Gjj2m45CVTBUr2XS/IL0gRNldyfJTwo=;
        fh=2VK/DfhyPOYLm7oW7MkwnUxu/G5dZSSV/TrDHElsSuo=;
        b=kBCMsbLBwYCvPFaf8vNacVlEEL7P60M+bbxYKtiwdhzgKslyOrYz+ILt4N8dM8x2+1
         IQruGhmezASHuzODjfuCYA42QpMFHsAtE0uITRMEhWzFdyY5kmEn2RuwU+IU61RLGBm8
         dxjte/yU0cXFjD9FGqFkwm4inJyE0S4J7Jjpm2RaHXulqeR5moloeXxMb3csgu4DSTAV
         jWmiA9NonZPr2cnaVFB3XgYzb6IgdAGG/VaMxQ2nZkEbiD+40puz0fzs4MTUfXCtJxU+
         vLgZSOIQzGiHb9AmOePs0dFcg0Amhj4+X8Wekerq7FGQED1WeB4LGExZnlN5aHPPn6Wp
         oHLw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786666996; x=1787271796; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FiPOqmQxsBI1Gjj2m45CVTBUr2XS/IL0gRNldyfJTwo=;
        b=dF+cPuVwNtvSISvFKubdaQEmCadjzRe3DICj//CiYLLIIzcwuPoDtLPqa0KiJ7dyat
         4OWzVec+Ql8Jz25kp3ffrC9gxqaSVP2quuhcsOLeG05nMsVqvlqmjeJDiAfThZNm47af
         H8u6aGJBtsPdKoSf2AtQoJb5L10s+K2Wue0rJA57lios1bcK1eV2lI/2vtJMv7rvVJNv
         UjuU/xJMWVLGzWJyDXHfe770ZjhBS5v0DWsHzoLHx6RUlP97Jq4zfsip2iD0bFvKIfyg
         xIKbKV3SaeLBtqibZyQAaAvyq2Z/+dHoyVxJF/diX82GJxC9mcLlfMqUrUKe4Q2ojZ52
         E5aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786666996; x=1787271796;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FiPOqmQxsBI1Gjj2m45CVTBUr2XS/IL0gRNldyfJTwo=;
        b=XJVQi7roGnL7A1MFkTy09BxaDkGZ7tkTBK1JMoH4+kKDBPFiXWPHT4G3GjOYoje7Cb
         YER8PoPt7ny2RokoPfypySnWJlgcKOXiqVcFBh6zf0iiZgXThbtQ8hd7CHbsHP7wstDQ
         iPWLBAjj6ZxMmz1Hzwgz67ES3BME3g1mxtqXC+5M0TXqdfSARA4ygu+qupFZZFYG6xqY
         u9sOk2Sxi5tb1tWhoHyZAYN8uxE3S2i6IIWH2NaD9J9w7dla374u3HjCWy2T4WHE8pi0
         NG1gTWp2L38hVJfQlUfqK1FQMx/JBVZ0j30jcvW0SE55lg52pxNUs9sOeIQTYI4PWh3u
         ucGg==
X-Gm-Message-State: AOJu0Yw84xmcQjwq9X/V7OnwqT4it2nwGeu70JFZCgIg5P66ocQvwqSV
	r0+1ssCFTrk+ule2WN2vjpIadhm+rABgxKmdRb6ovA/33eHmxAI1AcPkZjWpSK9qtzMjmVmIKHL
	tr3MlOOI5wMzJlMG7xoYSth7ShOpXFkU=
X-Gm-Gg: AR+sD1157TYLazfy4U1zKlx3oOJpjmXOGovLNLg7bvxlPknqSj5wKO+ZjFhHp2tT5WJ
	PWMnXpJqi0aIo6sqypX94vQ/1jp/LioKLnZeRXtezLGCHpZ7k6vmX7Q7QqNPttlfZON4wzCiDQM
	PFk/8wIaETTN4uLeyUcguiDwanWW/d1pAzQajcAtVtfjld6k1411qF6Ox7m9hfw4a36i3a6uKR8
	BYSPe4t2p2+Lai7uE7NxJ9Os6RI0YmHPmB8XZY2vvgI8vBalS5GgKZ2LEZT8REGSiQberONAX2o
	UfC7K/etcrQLEvaVVQQlQDBNA/e4e4Cb+ihWEkAV9tSQs9QPIaZM39slLQE26YH7Vfet1N1j6WH
	40Q==
X-Received: by 2002:a05:690c:a782:b0:81e:29d9:791f with SMTP id
 00721157ae682-837147fb6f7mr6361357b3.34.1786666995991; Thu, 13 Aug 2026
 17:23:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260812-fix-boost-v2-0-cbcb65f5e186@windriver.com>
 <20260812-fix-boost-v2-2-cbcb65f5e186@windriver.com> <CANNYZj_P9HgDR037FQcABPGMJvjNRMN9XZV1KCeHLjBKcy6VoQ@mail.gmail.com>
In-Reply-To: <CANNYZj_P9HgDR037FQcABPGMJvjNRMN9XZV1KCeHLjBKcy6VoQ@mail.gmail.com>
From: Rob Woolley <rob.woolleywr@gmail.com>
Date: Thu, 13 Aug 2026 20:23:04 -0400
X-Gm-Features: AUfX_mygNVOgM78Jfn7TxZpIkG_kp8ptMtON88Y0vC2IcodNemiTdomA0cxLPvE
Message-ID: <CAGAhMBy9quOTS6Tg1bgC413UqkXcGG89rJRTHmD-mmH2VDqQhw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 2/3] boost-build-native: Add
 python-numpy-include feature
To: alex.kanavin@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000a0c9530658f6d3aa"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 00:23:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243391

--000000000000a0c9530658f6d3aa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

Thanks for taking a look at this.  I have submitted the patch here (
https://github.com/bfgroup/b2/pull/611 ) and will revise the
Upstream-Status in the next series.

Do you have any technical concerns with the changes?

Regards,
Rob



On Thu, Aug 13, 2026 at 6:46=E2=80=AFAM Alexander Kanavin via lists.openemb=
edded.org
<alex.kanavin=3Dgmail.com@lists.openembedded.org> wrote:

> On Wed, 12 Aug 2026 at 22:34, Rob Woolley <rob.woolley@windriver.com>
> wrote:
> > +Upstream-Status: Pending
>
> Please do not use Pending without a reason for it. This should be
> submitted upstream first.
>
> Alex
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#243343):
> https://lists.openembedded.org/g/openembedded-core/message/243343
> Mute This Topic: https://lists.openembedded.org/mt/120724337/556952
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> rob.woolleywr@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000a0c9530658f6d3aa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Alex,<div><br></div><div>Thanks for taking a look at th=
is.=C2=A0 I have submitted the patch here (=C2=A0<a href=3D"https://github.=
com/bfgroup/b2/pull/611">https://github.com/bfgroup/b2/pull/611</a> ) and w=
ill revise the Upstream-Status in the next series.</div><div><br></div><div=
>Do you have any technical concerns with the changes?<br><br>Regards,</div>=
<div>Rob<br><br><br></div></div><br><div class=3D"gmail_quote gmail_quote_c=
ontainer"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 13, 2026 at 6:4=
6=E2=80=AFAM Alexander Kanavin via <a href=3D"http://lists.openembedded.org=
">lists.openembedded.org</a> &lt;alex.kanavin=3D<a href=3D"mailto:gmail.com=
@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, 12 Aug 202=
6 at 22:34, Rob Woolley &lt;<a href=3D"mailto:rob.woolley@windriver.com" ta=
rget=3D"_blank">rob.woolley@windriver.com</a>&gt; wrote:<br>
&gt; +Upstream-Status: Pending<br>
<br>
Please do not use Pending without a reason for it. This should be<br>
submitted upstream first.<br>
<br>
Alex<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#243343): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/243343" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/243343</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120724337/556=
952" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/120724337/556952</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:rob.woolleywr@gmail.com" t=
arget=3D"_blank">rob.woolleywr@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000a0c9530658f6d3aa--

