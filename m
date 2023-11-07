Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC591C4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 09:11:42 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.6333.1699348298837709804
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Nov 2023 01:11:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YdR4MOfD;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: max.oss.09@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-32dff08bbdbso3675570f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Nov 2023 01:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699348297; x=1699953097; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LJ6uzzcBDi3aPyHMg9U8z3O8uTi/dPnteeyiSKiOvZ0=;
        b=YdR4MOfDBKoUkpEpxmwpl2dg9bWBoziXeRYyR/4t1M+e0fJu3rP4GRnFz1rmKx1yap
         INbzMIrf+O/BNTx81v6mHyvUNRk00KX+DwJx4R6UU0hq+1kma5lwIHQEzW9LePoICsev
         z8abNPcK7glw/+V03tEYt+LnlmpNw3sCpon/Lx//9g4m0jkt0+28PxALHROv85KP8pxS
         aBcdIw/4QGU87erNjS1PXYic5WIPDrQLRQhn4v22FyEZG9xi2hIsgEjwffPcWsj5RMfB
         HBVp7AO2RtHO67ejG+oOHn/hyWqg2Ar1dlVUyCoR47iEa9PhvVpOlC4JF6JxfsFni2lq
         RzBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699348297; x=1699953097;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LJ6uzzcBDi3aPyHMg9U8z3O8uTi/dPnteeyiSKiOvZ0=;
        b=t3D7LJMIvq4qEdspwg2M28nfqOfMe4vJUIpQIatkGKCkkIA7MWKgpcUrOez98/fHT5
         LALkz6v/AfdnkQDFBp6AV9BggcpjmJLY/W0+tfQq28nl7XpPTXC38CFgWph1gmrupIFq
         eKoE6L+qwTm1Lg5U+v9qBlV8v6dFOnit5P2QKWlpB/AQQIcbcvYWe4nBIbcDrfkhGXaG
         hYlgeKxy2FQM5Qbl7GI3V5x7WB0OfAwZfCvUNbRV2LgJa5K8iuqlTBoedXFiL1AlW9yo
         TIlSUs43zi3NR9u0aHPlNmSL++XrYS6+q2Ln5DTlaDKu22reHMb08XfvPeQog+cGZ+06
         GYNg==
X-Gm-Message-State: AOJu0Yzo+YAL9Bns6A1BlER6RUXl+2YV2cVkv1wdIYkfdKXmk5b2tGec
	GuqNMAppAf1NVGO5zkd8ZtFl1M3HyghCV67aUxI=
X-Google-Smtp-Source: AGHT+IF5kaGPIfyDJbCqMFZS49FlwVHegN786LL0qbLz5XUdFAKkr2gCBvfLmUrV6KRT5SKmg/sWzwVGMH+PBtiQJ7w=
X-Received: by 2002:a05:6000:4b:b0:319:67ac:4191 with SMTP id
 k11-20020a056000004b00b0031967ac4191mr24191910wrx.37.1699348297085; Tue, 07
 Nov 2023 01:11:37 -0800 (PST)
MIME-Version: 1.0
References: <1779A92D7850E120.10230@lists.openembedded.org>
In-Reply-To: <1779A92D7850E120.10230@lists.openembedded.org>
From: Max Krummenacher <max.oss.09@gmail.com>
Date: Tue, 7 Nov 2023 10:11:26 +0100
Message-ID: <CAEHkU3UwMLQ1mB7=m4C7SbLBeC7cUr_8MCFc-DW=_DeGWLZq4Q@mail.gmail.com>
Subject: Re: [oe][OE-core][Patch] classes/create-spdx-2.2: allow absolute
 paths in NO_GENERIC_LICENSE
To: max.oss.09@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Max Krummenacher <max.krummenacher@toradex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Nov 2023 09:11:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190257

On Wed, Aug 9, 2023 at 10:19=E2=80=AFAM Max Krummenacher via
lists.openembedded.org <max.oss.09=3Dgmail.com@lists.openembedded.org>
wrote:
>
> From: Max Krummenacher <max.krummenacher@toradex.com>
>
> The current implementation expects the license file in NO_GENERIC_LICENSE
> specified as being relative to ${S}.
> Assuming that there are two source locations this gets confusing to
> specify, e.g. ${WORKDIR}/other_tree/file looks more natural than
> ${S}/../other_tree/file.
>
> Check if the filename specified is not absolute and only then assume
> it is relative to ${S}.
>
> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> ---
>  meta/classes/create-spdx-2.2.bbclass | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-s=
pdx-2.2.bbclass
> index 844b674f6f..42d4ef54b0 100644
> --- a/meta/classes/create-spdx-2.2.bbclass
> +++ b/meta/classes/create-spdx-2.2.bbclass
> @@ -134,7 +134,8 @@ def convert_license_to_spdx(lic, document, d, existin=
g=3D{}):
>                  # If it's not SPDX or PD, then NO_GENERIC_LICENSE must b=
e set
>                  filename =3D d.getVarFlag('NO_GENERIC_LICENSE', name)
>                  if filename:
> -                    filename =3D d.expand("${S}/" + filename)
> +                    if not Path(filename).is_absolute():
> +                        filename =3D d.expand("${S}/" + filename)
>                      with open(filename, errors=3D"replace") as f:
>                          extracted_info.extractedText =3D f.read()
>                  else:
> --
> 2.35.3
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#185690): https://lists.openembedded.org/g/openembedde=
d-core/message/185690
> Mute This Topic: https://lists.openembedded.org/mt/100639089/3617484
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ma=
x.oss.09@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

Gentle ping.

