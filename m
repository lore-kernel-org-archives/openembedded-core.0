Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4296109B47B
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 14:43:22 +0000 (UTC)
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21832.1774968197428485495
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2026 07:43:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=NrqJb5jN;
 spf=pass (domain: gmail.com, ip: 74.125.82.49, mailfrom: rybczynska@gmail.com)
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-128e4d0cc48so6890924c88.1
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 07:43:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774968197; cv=none;
        d=google.com; s=arc-20240605;
        b=E05gqZqMT/U4xK4QO1SGdC4vYHRjWnjoIaqEFMvHBT4FIeJrsMIA7Hi47SdS7NBeLp
         bDnR9InLdIjSQrTVUMdg2MPAQc/Hsq8BSXJGYGxl1LNU81RK5haYleKgGkKxiTCV/43/
         MYiNG4mufFjG/m4eIjh0RnHtwM7Dcc9LmB54wxo7oeDyntcFMt6kWdekw1DHDOiMxWPi
         am54M6Fd6yexUPqqq3O4uaROrMB630m+1kc37Ib/9Xy2fBZG6eiqaWVBu7j+EXMM+7u+
         wyoQ9ZIPIHJKC73Clu5GMr5jNtImOIaQJ19IaFhCDME+syJZmhlCZ/QdYutVkwsizS5h
         eK/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=oJzAChlWhVn+mrgJlW/qpLIiiqJY0F9t00sXC/kCrrI=;
        fh=Ab5QchtAs08eZNSFiBl6MfJNprT6k/vVQ8w3IX57Q1U=;
        b=Afcb+JFOAQ11Trc/6/2gTrwfjdk0Bx6mp+pAcNXXuHQiZBuC2Pzbjz99oCIpH4/muK
         iJXTaMu+uTHfhEzlFEUGSMSpXT8QHx1bDt8QJ0bw7+YK6dd8/sKb69cpBV5iKEdZdFNL
         v4zw23U52xC6k9Io8YsSg/ddGltLFGnw1vipPPH37/rWCN+Ttmzu81TWrWBiKtmp0UeK
         Z9+6Vur/sHGycLFt3jCtTSiuj540iz9j87KIaTuF1cYkqnlyShOyEz108r00c8ccofn4
         ot6To0AFMqnAOWBVQPM2r86LLOGbzkqjmvq4akCSaaMJiLNtBZw12j2fDpOg0uQQ/QxA
         OkGA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774968197; x=1775572997; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oJzAChlWhVn+mrgJlW/qpLIiiqJY0F9t00sXC/kCrrI=;
        b=NrqJb5jNLwKG1wd/0eA6/Jfeqccf6o8z1ynfkRbAxIFzzp+z16Z9m/HSpgZLY4e2Mw
         mrcIZxiaqzEgoWXkcnuLzvARNV/9mSo/kgcy5SObXOonw0GVSmdeb3orhcqYB/Ogj7oW
         CqF3L+vxauF/k048kLOfN1M6JQ+vpj2Uvn8HJORidHUx7uaR1rK3nyQrJCL+/PRQZ/it
         BqSvqlEwfsPQNcAx8OQ+9zr0TfnqvAmvW/Ogf2PXFpQa2Cv4PsEpmXZFWRYDKRBnOL08
         oVtJkmtQF8pIWULLuOzdeo6Rn7/gqAkeV6cPNnFGWbWfSOZJLpC/6ziF3rAIHU3AJBmH
         gsNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774968197; x=1775572997;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oJzAChlWhVn+mrgJlW/qpLIiiqJY0F9t00sXC/kCrrI=;
        b=UkY7EJwDEruTzX7AkE1RaEXOC9aKSDnZqQcxVjSEra6bAMndGAeB5KfxqHv5+6lRxi
         oAwj4jSssC0Z9G8bZY+4T3qh5Oe/NP/ShcqV5MpxngQoXQ9/Tr9oLiUPv2y5po19h3/5
         sF/Bxbt/Zlvn+DD6DDU03/Cws0NY/JhHLmvtNrIX5LgtppOcLxQtPa9KAkklEEGKq/Mm
         rgagZHsEN1B7nnK2EczfxAPGgHi0rmPz5qEH5/sSCe4akf9dBukf4Rm87sZw2bblqzxs
         zwuou6iXf/DZO3+fexUt1DRsZPh8FVFBb5Ji3Sd/pdCvf6H4dteyYajcDI/5WrZZqEwe
         7w5w==
X-Gm-Message-State: AOJu0Yy7R15OQU2jBXSKgbnOqi/lFiID7hQEC/9U4D7oDduhrFt8TNQy
	JPr+OeoYSen5ZTsKQcexJgBZYTeUG0u3H8IuR6xwft9N5MsiNghDrye0WN/hSvN1XkKg7PeUIMk
	eabcK3CxlV7hvg2FadfBIr1UzsGRt8sA=
X-Gm-Gg: ATEYQzyNJaWnQSQXi2K5dq6bk8LBEwJJqlkjtivVQ+jPsxdRhhBVqhpwXT8Q3/W8lOf
	Oez4rbAsFvJWykeogOAv2WcEol1Q+b0yK5x1wIkenJyS1Zn3KLP/J0qYx4auFT7pnTtdyQpi337
	t+nEiHnU36fiFO11MwAmjilaph7Zgzv2weqlGt2gjPuJqrdjLehoZqOewobZ72f4PhDpcJs98RW
	8K/6KUQxnL/PmhMnhCCKHbb4hTrXOQXhZNoqQCR1XhBCnBs8JM701wvJx6lYFfZdrwexpafKPdO
	zALuj8mRsKR1H5DIdm2GB8RDZbudS5kunK2fc4Ts
X-Received: by 2002:a05:7022:6281:b0:12a:8ea4:252 with SMTP id
 a92af1059eb24-12ab2838a88mr9480533c88.4.1774968196603; Tue, 31 Mar 2026
 07:43:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260331132430.781647-1-ross.burton@arm.com>
In-Reply-To: <20260331132430.781647-1-ross.burton@arm.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Tue, 31 Mar 2026 16:43:04 +0200
X-Gm-Features: AQROBzBu57LuWvpCVPamjv4HCfcwATAKC71evAWkLUW6OtZu5Y9O-ILu1fsSoEQ
Message-ID: <CAApg2=Rnrr_ZijiZ4cxKvkwmeCOssHXVfNHi2hZAywuhNe+F-Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] classes/vex: remove
To: ross.burton@arm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d8a6b3064e52fc86"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 14:43:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234295

--000000000000d8a6b3064e52fc86
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 31, 2026 at 3:24=E2=80=AFPM Ross Burton via lists.openembedded.=
org
<ross.burton=3Darm.com@lists.openembedded.org> wrote:

> This class existed as a provider of information for external CVE tooling,
> and uses a non-standard format that is OpenEmbedded-specific[1].
>
> However, the SPDX 3 output can contain all of this needed information,
> in a format that is standardised.
>
> I'm unaware of any active users of this class beyond sbom-cve-check,
> which can also read the data from the SPDX if SPDX_INCLUDE_VEX has been
> set.
>
> So that we don't have to maintain this class for the lifetime of the
> Wrynose LTS, delete it.
>
> [1] oe-core 6352ad93a72 ("vex.bbclass: add a new class")
>
>
For the record, I do not agree with this removal. SPDX3 has still not
reached mature usage outside of the LF ecosystem.

Kind regards,
Marta

--000000000000d8a6b3064e52fc86
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 31,=
 2026 at 3:24=E2=80=AFPM Ross Burton via <a href=3D"http://lists.openembedd=
ed.org">lists.openembedded.org</a> &lt;ross.burton=3D<a href=3D"mailto:arm.=
com@lists.openembedded.org">arm.com@lists.openembedded.org</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">This class existe=
d as a provider of information for external CVE tooling,<br>
and uses a non-standard format that is OpenEmbedded-specific[1].<br>
<br>
However, the SPDX 3 output can contain all of this needed information,<br>
in a format that is standardised.<br>
<br>
I&#39;m unaware of any active users of this class beyond sbom-cve-check,<br=
>
which can also read the data from the SPDX if SPDX_INCLUDE_VEX has been<br>
set.<br>
<br>
So that we don&#39;t have to maintain this class for the lifetime of the<br=
>
Wrynose LTS, delete it.<br>
<br>
[1] oe-core 6352ad93a72 (&quot;vex.bbclass: add a new class&quot;)<br><br><=
/blockquote><div><br></div><div>For the record, I do not agree with this re=
moval. SPDX3 has still not reached mature usage outside of the LF ecosystem=
.</div><div><br></div><div>Kind regards,</div><div>Marta</div></div></div>

--000000000000d8a6b3064e52fc86--

