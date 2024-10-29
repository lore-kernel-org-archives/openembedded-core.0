Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 928B2D3A669
	for <webhook@archiver.kernel.org>; Tue, 29 Oct 2024 14:57:12 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.21819.1730213830115461034
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Oct 2024 07:57:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NRkUinhs;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-539f6e1f756so5828309e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 07:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730213828; x=1730818628; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xZSqq31MSmaKiB3jRHFn0/kdX4EUO9GMhh3eimCnFK4=;
        b=NRkUinhsuRmZ2dwVdh5Vx+mxwLxeSUZbUB+sZMojD+72qlV0nlvAC8Oh4wi9bwDvM9
         mt87SxfUv5aAH7Bh0xlrBYvaqBj6+chkiHRda8GYkY2b8jxRkbcGK99crqtQ9ORjkNTf
         bpeU58RPQW2A1q92EYVX6FzSc6Y+6tPtbaOkUwXOWWJdyi/BPDws7xvUMq7+KBc5FISb
         ewAsXn657NB9XcIgq9vo4SN2JZnRqUq/28tqM35PIb+i2KXHgSUBsJkFbA1R9ciu5AMg
         Y5u4AUkxTOh4ZwlNZv8GaAwImV9Hq9roBugHDFJGsGooSFBd6L25G0R0tGyVTT/Rsdxr
         tesw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730213828; x=1730818628;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xZSqq31MSmaKiB3jRHFn0/kdX4EUO9GMhh3eimCnFK4=;
        b=l9Rig7t+WlyvYi5nr9RWKV4aKCNNodtKqf7CwjQknveOTL7GpO8I0w/iNr5xhKa2Bn
         Lm1Oto+nWKXT5psZF5weB0qHgLivzXj4B2XoxxfQ3jwlVJ9kJkhuFiMBIly5TqLYB40N
         sj+ekPmhGO7+an4TvvDZJ9+EOpMxC8L6oP+ptWnaJ1y4WDTqbQ+XDhk/+M9voYksDlH7
         3xOnd/+jPnS4l+O/alc0z4EHeNjFftI6J2NEAgOXgrUTw6sToZBCCLUvvYpVWT02t1Ar
         1TzBLC+PqkLbVsRlm6bFp0Btk5bjYrHECa/oCSx25gHpzsv4Xr7FnwE+r/PtKPWIoIp2
         5a2w==
X-Gm-Message-State: AOJu0YzPiauwl4vcR7pziyifzzIey4eg5mrgEaBCwR3T5drjf87ovLfe
	7ekopPeLZAGx0GgX6Osh959FesxDxLkjNe2WRqNnpKDm4k2nNpaTFpyue64wBAvG5Mx06PpgJE/
	XWH2+azSlOUp7A0avYqZ3F/zZW5Rjfw==
X-Google-Smtp-Source: AGHT+IEFfp2vHJrA3DZZ/epo2mi9tLExESreSKdMcojaNZrhq6AQSB6lbiDWMNQ9OBlGQDSdYtI1+hcCyUdGXEQ1mxo=
X-Received: by 2002:a05:6512:3d0c:b0:539:f8da:b466 with SMTP id
 2adb3069b0e04-53b348c37cemr5917921e87.11.1730213827963; Tue, 29 Oct 2024
 07:57:07 -0700 (PDT)
MIME-Version: 1.0
References: <20241029091723.2851061-1-hongxu.jia@windriver.com> <20241029091723.2851061-2-hongxu.jia@windriver.com>
In-Reply-To: <20241029091723.2851061-2-hongxu.jia@windriver.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Tue, 29 Oct 2024 08:56:55 -0600
Message-ID: <CAJdd5GZx8QWHoh+VGKnfO_xU3jKOT=PQF=MfvhNBAZCCsw_7NA@mail.gmail.com>
Subject: Re: [oe-core][PATCH V2 1/7] meta/lib/oe/sbom30.py: correct python
 list comprehension
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 14:57:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206503

LGTM, Thanks

Reviewed-by: Joshua Watt <JPEWhacker@gmail.com>

On Tue, Oct 29, 2024 at 3:17=E2=80=AFAM Hongxu Jia <hongxu.jia@windriver.co=
m> wrote:
>
> The python list comprehension is not right for list:
> >>> license_text_map =3D {'LicenseRef-FSF-Unlimited': 'http://spdx.org/sp=
dxdocs/gettext-minimal-native-1fa0d5cb-2bb8-5631-9fab-cd219801733f/8d31e22a=
cc4a8979f24dc24042692fb548fc8fc8d85d775ddac406abb122ceea/license-text/FSF-U=
nlimited'}
> >>> license_text =3D ((k, license_text_map[k]) for k in sorted(license_te=
xt_map.keys()))
> >>> print(license_text)
> <generator object <genexpr> at 0x7f8575173270>
> >>> [(k,v) for k, v in license_text]
> []
>
> Change the () to [] to make it a list instead of a generator expression.
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/lib/oe/sbom30.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py
> index 27ab5e45ac..8db90f30fd 100644
> --- a/meta/lib/oe/sbom30.py
> +++ b/meta/lib/oe/sbom30.py
> @@ -577,9 +577,9 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
>              re.sub(r"[^a-zA-Z0-9_-]", "_", license_expression),
>          ]
>
> -        license_text =3D (
> +        license_text =3D [
>              (k, license_text_map[k]) for k in sorted(license_text_map.ke=
ys())
> -        )
> +        ]
>
>          if not license_text:
>              lic =3D self.find_filter(
> --
> 2.25.1
>

