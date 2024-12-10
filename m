Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AFAFE7717F
	for <webhook@archiver.kernel.org>; Tue, 10 Dec 2024 12:35:29 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.9340.1733834127752465707
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Dec 2024 04:35:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L5oSBM5e;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: rybczynska@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2ef8c012913so2119959a91.3
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 04:35:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733834127; x=1734438927; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AAbxcA+jg2Qz0YizAJye5AMG4hEP9Lr5WLyLdqwCYPE=;
        b=L5oSBM5eQcBIXnzTclBZN7XQlK+heQdbouLOAkJSWsOhgDKStVuvwLAU5QKUjwP/lB
         lQnmAbLkJwLLywGKlA0PaT8AIZbtqRH+tkAkvrpfq8FnEyAeZ2ECyxP3ziKoAfn0SQo+
         vwynx71ikKuO0oFg5QbUneDzWA6met5AefTzUI6JYri6Rw84BSEkl/qRIyeTiV9iy/ai
         GQuDwtquzi+kjlQBflWZbzMo9zEEFrt6KiJ8Fhqra3XLxN0I3xUHB4SMrXmawm5uKaHa
         WxMp5Xf058A5qpt5bQ0pBf3cA/2GHFfb1mq3yp2KIauPAAgOa3ABD/00k5+BQPmdyZf7
         YWcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733834127; x=1734438927;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AAbxcA+jg2Qz0YizAJye5AMG4hEP9Lr5WLyLdqwCYPE=;
        b=ZLr2WayuX23AKfrG5ezWExKjIfg1m5BEmTmuo69pHr+mJXLlPCY6U9Ae0sAEmGpYW0
         EBc0g7NGTfxGM7Gyj0sKQmC3e+rzWYskQGJKCMPFpfMwzXtNkceMQV2T5+JffUs5CriC
         fqciM2474kSMZDYKpQ3yTDWpIniHy+sUiLqMD6CK/iPquKrVTroQqF4ltQPMUTEW8Xqy
         bMIUsQQaX5McWw3+zWJzTNV2KLqynkLVklVKwDtWoYHLMRD+VSLgxLRPFJcwh72twoLe
         K7uVXMXGYa2JS8o6Fj5Dg7H1k2Ygu/BmD+uh1sQ2hZ9YJkxpJGasO8Ez1JwjDxFEza/1
         jKWQ==
X-Gm-Message-State: AOJu0YzZfj0FCtJPF7EaZ5pTv1blXsyshrcYcYNV7Q6U2CDvcwNZj/n0
	P5lrwSOlB7noRbL5b5MToq90lB0vu98oeNk1zzZP2Y8VkrLHuMK4HL41vwm4F2AydMiGjchEWP2
	Tf+w3CRstogv0f4E0A8qAgrgbCP4=
X-Gm-Gg: ASbGncvJ7ZVLabQ0q7tsCc7gq242LLPZV9zmkYSumD7WUBbblHaL5M3GJGkAzc2iSDA
	8/gdPzMKWYfkoOe+TwCov4Qb+IM3eGqW84lWWhw==
X-Google-Smtp-Source: AGHT+IF86G6Il+rRAVa7G0UJQrpc0A7xOGRiMx9Z0M/LBECFdJUe9ICC5tbgFKVSZkPJ2dm0U62v66JKs/5QASxlgXo=
X-Received: by 2002:a17:90b:2b47:b0:2ee:b2fe:eeeb with SMTP id
 98e67ed59e1d1-2ef6a6c2694mr20589232a91.22.1733834127141; Tue, 10 Dec 2024
 04:35:27 -0800 (PST)
MIME-Version: 1.0
References: <20241210114839.1579228-1-marta.rybczynska@ygreky.com>
 <20241210114839.1579228-4-marta.rybczynska@ygreky.com> <AS1PR10MB5697826BEDC05432727D5678FD3D2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB5697826BEDC05432727D5678FD3D2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Tue, 10 Dec 2024 13:35:15 +0100
Message-ID: <CAApg2=SqKjVDGJ=idTRS0QbqX2=WA0u+A_b1j=HG_TztNEh+gw@mail.gmail.com>
Subject: Re: [OE-core] [RFC 3/3] cve-check: revert to old NVD feed
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Marta Rybczynska <marta.rybczynska@ygreky.com>
Content-Type: multipart/alternative; boundary="0000000000003f75710628e9b7d2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 12:35:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208531

--0000000000003f75710628e9b7d2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 10, 2024 at 1:33=E2=80=AFPM Marko, Peter <Peter.Marko@siemens.c=
om>
wrote:

> This should probably be made configurable so we can switch to a source
> which is reliable/available/up-to-date at time of build.
>
> Maybe something like
> CVE_CHECK_DB_FETCHER ?=3D "cve-update-db-native2"
> CVE_CHECK_DB_FILENAME ?=3D "${@'nvdcve_2-2.db' if
> d.getVar('CVE_CHECK_DB_FETCHER') =3D=3D 'cve-update-nvd2-native' else
> 'nvdcve_1-3.db'}"
> do_cve_check[depends] =3D "${CVE_CHECK_DB_FETCHER}:do_unpack"
>
>
You're right here. There will be an additional variable in the next version
of the patch adding yet another source, so that you can choose from three
of them.

Kind regards,
Marta

--0000000000003f75710628e9b7d2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Dec 10,=
 2024 at 1:33=E2=80=AFPM Marko, Peter &lt;<a href=3D"mailto:Peter.Marko@sie=
mens.com">Peter.Marko@siemens.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">This should probably be made configurable =
so we can switch to a source which is reliable/available/up-to-date at time=
 of build.<br>
<br>
Maybe something like<br>
CVE_CHECK_DB_FETCHER ?=3D &quot;cve-update-db-native2&quot;<br>
CVE_CHECK_DB_FILENAME ?=3D &quot;${@&#39;nvdcve_2-2.db&#39; if d.getVar(&#3=
9;CVE_CHECK_DB_FETCHER&#39;) =3D=3D &#39;cve-update-nvd2-native&#39; else &=
#39;nvdcve_1-3.db&#39;}&quot;<br>
do_cve_check[depends] =3D &quot;${CVE_CHECK_DB_FETCHER}:do_unpack&quot;<br>
<br></blockquote><div><br></div><div>You&#39;re right here. There will be a=
n additional variable in the next version of the patch adding yet another s=
ource, so that you can choose from three of them.</div><div><br></div><div>=
Kind regards,</div><div>Marta <br></div></div></div>

--0000000000003f75710628e9b7d2--

