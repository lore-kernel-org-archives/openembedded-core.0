Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDD5CE7717F
	for <webhook@archiver.kernel.org>; Tue, 10 Dec 2024 11:51:08 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.8428.1733831464551225865
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Dec 2024 03:51:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PzyKbPJR;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: rybczynska@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2166651f752so14540605ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 03:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733831464; x=1734436264; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bMrS1kV2lZLd0MjdNrakvLcZTGhfg19V9mea6u/cFfs=;
        b=PzyKbPJREzj9ll/Sp3qrmmfJ41yqrc0UoAlyIiSdAj0a22dn3kDrBP05itXkK7wFy5
         lxC1fVkdN7rgPCYZmsFBwQc/XL1jPbk5fGOVNnkluTGjeoVEILoJedSwlCk/Aw+QPXq7
         vDzYek01pGN33pvrvZMGjaWF5h1ZZ0sS8mpIT38q2eIzKjhp0UP4nkFV6Ma3mAH19WKC
         WljcrYr2VDovNlS7+MLa1uGFEkqNbC47aPwwvV6ViojHqV8kBhQKK57obB1AVuoYC/8V
         0QHkxXyl3PXadEHs3j27Gf+8Vmo5Z6knn4cDJAM8SdT15Wzn0HW9NA4Tjbl4iEOhMm1p
         k/Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733831464; x=1734436264;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bMrS1kV2lZLd0MjdNrakvLcZTGhfg19V9mea6u/cFfs=;
        b=rEGHsmKl2B86p+rkEF40zN0/ymKViVp8/dV2rGwEW8qVM8qhEiXPtlhaAB2jcT05LM
         YVDqFcd4VL/ELE/lsiYPyRrzxOQ+ppZoBCCLRooUjE9qdlTFnHwb1z6pIWENLe1X6Loe
         sTnIOV8Nl2IhXC01WDtGMQSBoLFcLO3D7pUGip0kGI4AK06Z7m0+9xMIUvntHbPd7fFM
         LyQCGRZA2Xu4al4YjoTqloNZGi2fUTh8yzALFdeiSxqP1hwa6uKgN9agr9BSIyqrkaQr
         ROKsJqaBPqfCFz7dh6/5KrEfEf8zPpcZB3FO9BSST/pVmonkgTXklbwsXWHf++vgZ8cE
         prew==
X-Gm-Message-State: AOJu0YzDr3t9j6LWAXVq15Xql2YxprymATVppWFBH/U5r8X4W6PpT98G
	m8BrnooNbEuS4v8rZPATe1JxMpTHFdwBISUBgU9iXuPdSltLsLeAWpTLazm4rw+xHWEoARBxBLV
	qBTbNzgxO2ewkwEtwa8hUwvUGNlqwvqLU
X-Gm-Gg: ASbGncthTRZlGdGLY6QSgj252IEJh70czCyZOQeyc4KEqLDRdWRcyORROvomZriZtVf
	T8Ur8fD05JRRwtsxEDkEhrToUjV0jkK1AiDrcKw==
X-Google-Smtp-Source: AGHT+IHJ6MG3gVEHMUOoHjxrnsdS/d1afIHg1pfpiBBs+uLvMK26+Gpk2GG8WrktlDKhlKt+Edfo+UvafKV1QJ1OA2Y=
X-Received: by 2002:a17:90b:554e:b0:2ee:70cb:a500 with SMTP id
 98e67ed59e1d1-2ef6955fa26mr22634876a91.1.1733831463826; Tue, 10 Dec 2024
 03:51:03 -0800 (PST)
MIME-Version: 1.0
References: <180FCE6B9F7A1D87.24224@lists.openembedded.org>
In-Reply-To: <180FCE6B9F7A1D87.24224@lists.openembedded.org>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Tue, 10 Dec 2024 12:50:52 +0100
Message-ID: <CAApg2=R3JRnuRfe46r9qoSmpUuxXCWb2D2rUBDaXxiUJ8xiuQg@mail.gmail.com>
Subject: Re: [OE-core] [RFC 0/3] cve-check: use the more stable old feed
To: rybczynska@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Marta Rybczynska <marta.rybczynska@ygreky.com>
Content-Type: multipart/alternative; boundary="000000000000807f7d0628e918dd"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 11:51:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208527

--000000000000807f7d0628e918dd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 10, 2024 at 12:49=E2=80=AFPM Marta Rybczynska via lists.openemb=
edded.org
<rybczynska=3Dgmail.com@lists.openembedded.org> wrote:

> This patchset re-enables the old (deprecated) NVD feed for cve-check.
> It also opens the way to use another data source using the same format.
>

Explanation: this allows the switch to
https://github.com/fkie-cad/nvd-json-data-feeds
as a second step.

Regards,
Marta

--000000000000807f7d0628e918dd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Dec 10,=
 2024 at 12:49=E2=80=AFPM Marta Rybczynska via <a href=3D"http://lists.open=
embedded.org">lists.openembedded.org</a> &lt;rybczynska=3D<a href=3D"mailto=
:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">This pat=
chset re-enables the old (deprecated) NVD feed for cve-check.<br>
It also opens the way to use another data source using the same format.<br>=
</blockquote><div><br></div><div>Explanation: this allows the switch to=C2=
=A0<a href=3D"https://github.com/fkie-cad/nvd-json-data-feeds">https://gith=
ub.com/fkie-cad/nvd-json-data-feeds</a></div><div>as a second step.</div><d=
iv><br></div><div>Regards,</div><div>Marta</div></div></div>

--000000000000807f7d0628e918dd--

