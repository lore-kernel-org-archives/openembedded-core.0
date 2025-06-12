Return-Path: <anibal@limonsoftware.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDB6EC71136
	for <webhook@archiver.kernel.org>; Thu, 12 Jun 2025 15:21:25 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
 by mx.groups.io with SMTP id smtpd.web11.16044.1749741683931443009
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jun 2025 08:21:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@limonsoftware-com.20230601.gappssmtp.com header.s=20230601 header.b=WOOwSf5j;
 spf=pass (domain: limonsoftware.com, ip: 209.85.219.173, mailfrom: anibal@limonsoftware.com)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e733a6ff491so1059941276.2
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 08:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=limonsoftware-com.20230601.gappssmtp.com; s=20230601; t=1749741683; x=1750346483; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ICGzCHNjVh9ak8X9z58/XQmak9oU+9Vshhaf8gFOAT0=;
        b=WOOwSf5j/Pc97OtiCb5mExjMHpDRxNJbKoD6bURTfAwK4XhVUXZBMaNXpyDk4EJ9om
         i6rZ6c/vxb5VH79bBvqtpcFssWwaKF+SkBzM+vjCHw+W9VWP9M3cTLkONp1CbznUS+0W
         L2yvuKvLtBGF6HNeZfbDHq48PIlsH6aagQZhV1j66u85cnjPXbGU5+3KUyTauScwngeA
         55myuPcDqBk/f+jRXNdqiwy4lZ7PaoI+45AbJx3/z3CmoLOKxKcCpG7kOQrz/ewnnhlT
         g8r7akT6P8MzLytk1s3CIgldKh0IU34zRPSmqSqYOz4YfrIMuvAFicUc3e4saGtO1DcC
         MSTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749741683; x=1750346483;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ICGzCHNjVh9ak8X9z58/XQmak9oU+9Vshhaf8gFOAT0=;
        b=CuKkeM/1D8b4BlU/5BZT3A4eTmbdXYmi6fj7YvPLIKAc4Nt98RCpAMgMnzxZQmWQGG
         FI2RWD6TPSnRjziKKgMXNjIF+WqTNRAcovgsUZLfl7uXHMTtcfG6Ogx/ZLRSDVqK8SN6
         prB5z+QogdN3ME8DCOP2OgAHiaqCj7qGjJBlnhwIut5jJXU1zMhmO8O5doGmP4H+u/S7
         F3k8gu2JjRMAttgGjCuvSEA1iW4lPThoxb3Qws1iWYAZq/AhOOTNMm6AMor6moFCI0YI
         pARUO9cJHw13VJ8WeCCmRMSTRQuWwLCBgZJzQYok+6YKM3T7b99cX0hl1647TMG6vi06
         T5Vw==
X-Gm-Message-State: AOJu0Ywewvzkx10RW6YwCZ6q96/mw8l6Uw9MFiJD7NIbOUh98IFmGk95
	93ZqQFuUF5qHpJB5t0tGujF/NFNL3Qc3EjgRnO4OYLuDLmKZ80ySiRdGBc6bvwS11EtvHz/xD0C
	wGkFzUA/qUfrLivNNL4Vl90h9zQ9Hi+G7TFXt0RfLbw==
X-Gm-Gg: ASbGncvSVoivJ0uiZ12TvKyAenECDNI1/avXTZ5ACMtFUihQVgjD7/ETDP2ok0QK4mR
	rVCeiDu1BPYd+CNwrJ3nQS67iZlIsMocy+gwH8oi38wb6DoniOZ5Zj/m1DuRzDIZyo8BPu2GDCl
	cdu0wP31idkWfuwOE5OYq4hv1CSuM05UE1VHOd6edZEme66Q==
X-Google-Smtp-Source: AGHT+IHOspq3hTlIyVO9j6B+ExlAb9/S/hhTTZHpdGVqadzwjnwOCGC31zejN+bbIOHYt7DeF7/DMWeTIW8fvhpgZko=
X-Received: by 2002:a05:690c:4d41:b0:70e:2c7f:2ed4 with SMTP id
 00721157ae682-7114eb5dd99mr61997017b3.0.1749741683085; Thu, 12 Jun 2025
 08:21:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250611153319.54778-1-anibal@limonsoftware.com>
 <20250611153319.54778-3-anibal@limonsoftware.com> <CAOU5ZMs1DZM-3-h=_5-9m7nqFuU7i4VwH6ZcbzAwD2uByNt3=w@mail.gmail.com>
 <BB304894-22E7-438B-A97A-C689712E1473@arm.com>
In-Reply-To: <BB304894-22E7-438B-A97A-C689712E1473@arm.com>
From: Anibal Limon <anibal@limonsoftware.com>
Date: Thu, 12 Jun 2025 09:21:12 -0600
X-Gm-Features: AX0GCFtcT0Be62LZFA4y-cbRxSuUnzzJxiwxzVGMw47jd7lGD0BUFMgG8L0EAAw
Message-ID: <CAOU5ZMvJMc8HvB-dD43nJsixHEi4iQWWRuKEwu9u-tUd4K_KeA@mail.gmail.com>
Subject: Re: [PATCH 3/3] wic: plugins source bootimage/isoimage rename to have
 valid indentifier
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	"bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000078242f0637617b53"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 15:21:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218529

--00000000000078242f0637617b53
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025 at 9:02=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> w=
rote:

> On 12 Jun 2025, at 00:36, Anibal Limon <anibal@limonsoftware.com> wrote:
> > This patch is the previous one, only sent to note is part of the series
> and can
> > be integrated later after layers fix plugin filenames.
>
> We don=E2=80=99t need to make everyone change their wic files though:
>
> 1) change wic to warn if the plugins have invalid filenames
> 2) rename plugins to be valid
> 3) when parsing wic files, transform the plugin name  with s/-/_.  This
> means we don=E2=80=99t need to alter any existing wic files.
>
> You have 1 and 2 already. 3 is a quick .replace() call.


Yeah ack, we do not need 3 at this stage only give time to fix later.

Cheers,
Anibal

>
>
> Cheers,
> Ross

--00000000000078242f0637617b53
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 12,=
 2025 at 9:02=E2=80=AFAM Ross Burton &lt;<a href=3D"mailto:Ross.Burton@arm.=
com">Ross.Burton@arm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">On 12 Jun 2025, at 00:36, Anibal Limon &lt;<a href=
=3D"mailto:anibal@limonsoftware.com" target=3D"_blank">anibal@limonsoftware=
.com</a>&gt; wrote:<br>
&gt; This patch is the previous one, only sent to note is part of the serie=
s and can<br>
&gt; be integrated later after layers fix plugin filenames.<br>
<br>
We don=E2=80=99t need to make everyone change their wic files though:<br>
<br>
1) change wic to warn if the plugins have invalid filenames<br>
2) rename plugins to be valid<br>
3) when parsing wic files, transform the plugin name=C2=A0 with s/-/_.=C2=
=A0 This means we don=E2=80=99t need to alter any existing wic files.<br>
<br>
You have 1 and 2 already. 3 is a quick .replace() call.=C2=A0</blockquote><=
div><br></div><div>Yeah ack, we do not need 3 at this stage only give time =
to fix later.</div><div><br></div><div>Cheers,</div><div>Anibal=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"> <br>
<br>
Cheers,<br>
Ross</blockquote></div></div>

--00000000000078242f0637617b53--

