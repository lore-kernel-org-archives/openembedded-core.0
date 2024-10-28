Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFE58D3E2BD
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 19:45:54 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.2054.1730144747094847917
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Oct 2024 12:45:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cUlgT+OZ;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-539e4b7409fso4528237e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Oct 2024 12:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730144745; x=1730749545; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ABH8dVt5es8ylTbe+KoLIflgYJ5wiWfQu4CLHm72xic=;
        b=cUlgT+OZEnNUEnF8VHhwEtBxka/NH6hGj2gsNwMaK80yZ9q/KlXBe4hf9k9KJdUs1/
         GXOeL0B71Wz0jzhm40qN8aOscQQVwG5rlDfOZD0U9awFuQZOr4Xp4DvZpva053WkpVCJ
         BiT/z60Fl6IYx/+VPmI5QxFGrJpkdrvN1bw0JQCzT/6UHZJa2mfoELNc8zCoNc3X9YJx
         JeHsHOA33dpPDsjkrEX5IRU7Ggz0d2xjOl2kYQqEnp3AgZylsTLNGF6xUFo6Vu5l5Q7w
         zyX8sFu+/17gOosgAX8WwR4t8PiX3K8IZuRwoZeFIzwiu2uj1WfXlpLRj7cNuaTwSn+i
         GJHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730144745; x=1730749545;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ABH8dVt5es8ylTbe+KoLIflgYJ5wiWfQu4CLHm72xic=;
        b=iHy9QGZcBDE+CgBGyKYanGMmk7ET0Ikfymhch3RpWLdHZDMwcGBrHRcRy0QdfxLyZ4
         7v00iRqkU2XbIsSGYfV3Lxb5Pah8SLCU7o7xgHdvOE09nxoikwVgYyUnaDCh2aTxwkQN
         ebDJogRFcGc+BjkoTkD9zS6Lp7f0GYqBTSTbWNSnaagkmLNWWUmFWon0q6xrXsb8thNJ
         4Xg1irGUURsczwh1W4AOBBVAoB8EZCiRJOAPPKl4Ugm3MZsuw8tQevBAXHyuZuYNnDeL
         M4wBeRMhWSClP4AMcGh3ops5fP81elbLp7bp83H/+nck+9xXQ8fs+soR6kWXRobaaSCl
         mViw==
X-Gm-Message-State: AOJu0Yzrk5btFNwDkZDhlDOsyWsi5QgDqZz5NPU+sVXF8OJxLkbdyOiR
	/MXXHxubmn2TmRAcBtKYSxogL0Ja8UbYkZkbBWrTmrEnrv9hk7USDIbQkPxSh8Yir6lU6Tefs0o
	YnHBN+2lQmA6ivFzaapEahlzgv/4=
X-Google-Smtp-Source: AGHT+IGmLV73ipht49Y2zQfF7Eyqavb6O1dMyABE6LI5mEDlNpWOdgl+fOiu3kylAr9wxAk/JGiALDN9okCZOe453A0=
X-Received: by 2002:a05:6512:3991:b0:539:a2e0:4e94 with SMTP id
 2adb3069b0e04-53b4744afb6mr192747e87.30.1730144744709; Mon, 28 Oct 2024
 12:45:44 -0700 (PDT)
MIME-Version: 1.0
References: <20241026032519.1968518-1-hongxu.jia@windriver.com> <20241026032519.1968518-2-hongxu.jia@windriver.com>
In-Reply-To: <20241026032519.1968518-2-hongxu.jia@windriver.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Mon, 28 Oct 2024 13:45:32 -0600
Message-ID: <CAJdd5Gay16NWTfxPLyAzVuTx02=hNeAY--JkPAXk_iHA=5bxKQ@mail.gmail.com>
Subject: Re: [oe-core][PATCH 1/6] meta/lib/oe/sbom30.py: correct python list comprehension
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Oct 2024 19:45:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206457

On Fri, Oct 25, 2024 at 9:25=E2=80=AFPM Hongxu Jia <hongxu.jia@windriver.co=
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
> After apply this commit, as expected
> >>> license_text =3D []
> >>> for k in sorted(license_text_map.keys()):
> ...     license_text.append((k, license_text_map[k]))
> ...
> >>> license_text
> [('LicenseRef-FSF-Unlimited', 'http://spdx.org/spdxdocs/gettext-minimal-n=
ative-1fa0d5cb-2bb8-5631-9fab-cd219801733f/8d31e22acc4a8979f24dc24042692fb5=
48fc8fc8d85d775ddac406abb122ceea/license-text/FSF-Unlimited')]
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/lib/oe/sbom30.py | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py
> index 27ab5e45ac..73a957a20c 100644
> --- a/meta/lib/oe/sbom30.py
> +++ b/meta/lib/oe/sbom30.py
> @@ -577,9 +577,9 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
>              re.sub(r"[^a-zA-Z0-9_-]", "_", license_expression),
>          ]
>
> -        license_text =3D (
> -            (k, license_text_map[k]) for k in sorted(license_text_map.ke=
ys())
> -        )

Probably just change the () to [] to make it a list instead of a
generator expression (I probably was trying to make it a tuple, but
forgot that it would be a generator instead; it doesn't need to be a
tuple).

> +        license_text =3D []
> +        for k in sorted(license_text_map.keys()):
> +            license_text.append((k, license_text_map[k]))
>
>          if not license_text:
>              lic =3D self.find_filter(
> --
> 2.25.1
>

