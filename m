Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63A8CC44520
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 15:18:22 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11464.1784560698537473607
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 08:18:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=W4SFHUaj;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-81ecf499af9so69251787b3.1
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 08:18:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784560697; cv=none;
        d=google.com; s=arc-20260327;
        b=dET7pKnLMxNesYxM8E7Rdep/EYcZQH8RAqvTFc0FsuL1OK0A0Ir4qG7g1AwCpFT/tJ
         5y4n4L6Po2qZD1c26SL9bGqiPjfDCO4xoQ8/FMwW5PkcxlchoDzWL7/Cv1mG1Uq4Pp5J
         gdBkxBXOBDz5F2NDJ+zO9m468AaJRlNugoCNSBbNG8x3/DIzQzd1elVQxmHdmC1sOmm0
         rAQDV8VjbGxajLJ+n5a9Hq5N8+PK3wIHwhbphQIaHoJGBv+d508kAqEP97eLPCTOkT23
         +js67wt8XSbQgJ5j+ZFdQ9LjNWKplAqcjovqoPCMCBU1VJyfMsOWbrdPk4Tbuu3qZnpA
         MiLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yotGQe8sBkZMjRr1+xH0et0Te9w4jikuEIiBt49U/Ug=;
        fh=QEHLwtqS71Z2YUr9+lozElpw6h8TYix4W/jHxWTlj80=;
        b=WYbXjzkfeiPTomRcX8wbsKS9y+uOeh6VoBMWKPyhurSQa2T/Csiz9Fh0hc1I4UAyyq
         w7eOdQNsMC07OY8Hmm4P4LL4Gr7xA1YpqrZbau1NidrDGOWhX7YsCRNJyglGl+y34105
         XUMNNf7VAJ51Fr0GYNgyq+IEqWZT6kkQ7FASZO5cWw1GVQwsBmbhPidOa4KT6pOwmRP1
         7bynsd0rH2Dm2nejiUw5w6FdunNHwYwS3Aaax7uYau4sGJkGKVC8dM2fLcOF8i82CHyk
         Cacz/k88zE3GSG1z/qRHco6l3m15YWYTPpvRy3Qpn9YbTIbaA9SZXa5+ld1RTcj67Pl3
         3KoA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784560697; x=1785165497; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yotGQe8sBkZMjRr1+xH0et0Te9w4jikuEIiBt49U/Ug=;
        b=W4SFHUajsdIDjbQN8w1W2jzq88rVPQgNNsXcdvGRGDtqBab1TZrqkDZT++47p8ACAp
         vAGupdC3t/Ku0/QE8p2x6qf5qcMfkA2zcavBpUHuODxtnt6JgxolcP4Bj0K8a0x2ZXfq
         6R4TQtydlMFr2zp9mHnEHbS0sBM/6kdZneGz1XoKAc3pGON9pLv9tD9mWRFqRV37IIFD
         ZEbohuGV7WEkK/Vs4e2rygriAsqRWPuN4Eye8duLt4nt3LhZwD5j3jzjgQvAzJMp1+43
         1cTOXBy7UPxtmcVNMLGa1WZVHEPuYwA/aODvQKhPzVPaw1VNqaaPOlH0FoiCfR3UukHa
         JlcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784560697; x=1785165497;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yotGQe8sBkZMjRr1+xH0et0Te9w4jikuEIiBt49U/Ug=;
        b=JSY2qKPNfY/85qUvpWpVX56jcUpzPpHxSj9jcFJxequ116goi6AHY1yCdgACefubQ2
         HzutN3aRS0axv3dxTl9lnsEQ4xXwILPR8l6fG7uCMO75v2bIZP27+n/MwWRFZmeiPlf0
         9uIZVK/vZL8IdvIs8Ctpnlo3U4JjHyKc6vFIA2VZl9fFKHaIFHLmFEsVe9W9NLyfBGn8
         herxBqP6MWnw0uUjBMHISqYbZqToDK6tcbniEYaLqSgXVlEttZInohB3Sz7VdKReZ33w
         5zE/B8eHt1MD1d0bHIg4dsysv/8eGYyBCEPzuGp61W83zU7l1qxQYxdKXeakV1GIn3n1
         Avyg==
X-Gm-Message-State: AOJu0YyoariTHPvVXTNXBzUt4Xm/cALMpW59n8bxFcZGrGtvA1ZLIQoh
	FvWOYg+ws3p6HjcOQqx/I7jtom7kBEUvqs5+w3FhwSHKquqSctvayNKqgW3+R7fKgGesSUfFBxN
	gxx4zgpHI6UT1nZPKgIiZ8yHiLfGHGgQs/w==
X-Gm-Gg: AR+sD13rdKs6LPFHLo5M4NfcM9a08i6KsRuXRmEoNd8RPaheVq/kTFyNY0Kc8nBNE8h
	eTNjaamU9ibpF8ZwV093siVaIqMQ50ZjK3/8CVCSWfmTJ9pWIw00d6144CBQLYPH6IckKqnHQQM
	Ds0BEv2dfJHS+IHOhalSuZcTkCj2NKblF3JmCviWdYLacvPBD6j0oNaiEyCafmnNztC0hNJ6BiR
	JWzqMqkkJFU0kpGJpvG2f9yxZkSkW+GasFFwjDzIT3BERiL+/8xm6gTx4jFsFytQ7fqfLSSEKu9
	3eZ3YY69xu0KZRAnNT0mYONCkKfjwNJm4wOtF+TMl0yQ+Kh5Ul0v3PAaljs7bgZG/GiflY4GUKJ
	Dnz/aF4cpthPWlk+goJFpcXopGxmRstn6BJInQ0XqmLJ94yVHzYpXB23+v5vtNM/YTSd1JA==
X-Received: by 2002:a05:690c:c4d2:b0:81e:8985:e14 with SMTP id
 00721157ae682-81ef26de9camr43603747b3.69.1784560697362; Mon, 20 Jul 2026
 08:18:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260715140507.2329605-1-ross.burton@arm.com> <20260715140507.2329605-3-ross.burton@arm.com>
 <CAMKF1sqTS3TAN7Xmsb=enK45PZeazgrCd8zPr95_GSUzs4LqeA@mail.gmail.com> <A4197DA1-6F0E-4267-BFAB-235AE2728B9F@arm.com>
In-Reply-To: <A4197DA1-6F0E-4267-BFAB-235AE2728B9F@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 20 Jul 2026 08:18:05 -0700
X-Gm-Features: AUfX_mxONxyeQaS3l7t5p1GXMv96b8mTF3ta_2p4NxcPjQSMCrssOo016JKtGbU
Message-ID: <CAMKF1sraBgBmbCpkpARTZK8y62F_uC2+ydM2aLsmBvO2JGFu_A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 03/12] libpsl: use libidn2 instead of ICU
To: Ross Burton <Ross.Burton@arm.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000724f2f06570c6a1b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 15:18:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241410

--000000000000724f2f06570c6a1b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 20, 2026, 2:12=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> wro=
te:

> On 18 Jul 2026, at 17:08, Khem Raj <raj.khem@gmail.com> wrote:
> > libidn2 default was switched to build non-GPL3 images conveniently by
> > switching to use ICU, where ICU is used by  embedded systems more
> commonly
> > than libidn2.
>
> Luckily the library is dual-licensed which should help this.  Only the
> -bin package is v3-only.
>
> Yes that certainly helps and maybe its fine to use libidn2 as default.
> However there are valid use cases in real products of using ICU since ICU
> is used system wide as well by many other applications in those systems a=
nd
> ICU data can be regenerated to contain just the data you need default
> kitchen sink of 30MB is not real usecase.


>  Switch back to libidn2 to respect upstream's opinion, and because ICU is
> > a monolithic dependency: this switch causes a minimal image containg
> > libpsl to shrink by ~30MB.
> >
> > Which production image are you building ?
>
> Production images are obviously hard to compare, so I was comparing
> minimal.  Basically ICU is large, libidn2 is likely already present (gnut=
ls
> and curl use it by default), so if you=E2=80=99re not otherwise using ICU=
 that=E2=80=99s a
> big saving.
>
> Ross
>
>

--000000000000724f2f06570c6a1b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 20, 2026, 2:12=E2=80=
=AFAM Ross Burton &lt;<a href=3D"mailto:Ross.Burton@arm.com">Ross.Burton@ar=
m.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">On 18 Jul 2026, at 17:08, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmai=
l.com" target=3D"_blank" rel=3D"noreferrer">raj.khem@gmail.com</a>&gt; wrot=
e:<br>
&gt; libidn2 default was switched to build non-GPL3 images conveniently by<=
br>
&gt; switching to use ICU, where ICU is used by=C2=A0 embedded systems more=
 commonly<br>
&gt; than libidn2.<br>
<br>
Luckily the library is dual-licensed which should help this.=C2=A0 Only the=
 -bin package is v3-only.<br>
<br>Yes that certainly helps and maybe its fine to use libidn2 as default. =
However there are valid use cases in real products of using ICU since ICU i=
s used system wide as well by many other applications in those systems and =
ICU data can be regenerated to contain just the data you need default kitch=
en sink of 30MB is not real usecase.</blockquote></div></div><div dir=3D"au=
to"><br></div><div dir=3D"auto"></div><div dir=3D"auto"><div class=3D"gmail=
_quote gmail_quote_container"><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
&gt;=C2=A0 Switch back to libidn2 to respect upstream&#39;s opinion, and be=
cause ICU is<br>
&gt; a monolithic dependency: this switch causes a minimal image containg<b=
r>
&gt; libpsl to shrink by ~30MB.<br>
&gt; <br>
&gt; Which production image are you building ?<br>
<br>
Production images are obviously hard to compare, so I was comparing minimal=
.=C2=A0 Basically ICU is large, libidn2 is likely already present (gnutls a=
nd curl use it by default), so if you=E2=80=99re not otherwise using ICU th=
at=E2=80=99s a big saving.<br>
<br>
Ross<br>
<br>
</blockquote></div></div></div>

--000000000000724f2f06570c6a1b--

