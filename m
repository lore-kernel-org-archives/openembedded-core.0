Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 538F4D767FB
	for <webhook@archiver.kernel.org>; Thu, 31 Oct 2024 20:28:50 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.22569.1730406526170561188
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Oct 2024 13:28:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CvvBUmSh;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-539fe02c386so2197115e87.0
        for <openembedded-core@lists.openembedded.org>; Thu, 31 Oct 2024 13:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730406524; x=1731011324; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CpjZllTEIMsTUUShjs+QLp4AClDTYkRf+9W4A2nw080=;
        b=CvvBUmShKVRT9NVWVX3Z/wRQpHchUl5z/o2caYH7JwT0/jqrmcQHxOtkW78wHRhq1S
         J9q/YgJ+dnCrnyZVlPyVKES380/Zp7l5jwanUkVLUxzjNqG1Y+70qG6ffcCSRPcepER1
         DxFFBPhn3w3Jn8+XipHdyvtyEE3n7kCd3+i12MUOl64entHyNcWoeL1WOsn1gmZSBEi7
         77nQKgESDJMMh4R3OHDLxlP9vGh6Q5nRE2SE8xIjERBjERXO9XgTPCL8xQ0TWWOzWyXI
         lr+JTJRXcwpRI3wjXFaVuN0/EbSL8eyVeRZZgMs50kib/uwO88pbocyPOicPadIBdU3X
         HqAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730406524; x=1731011324;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CpjZllTEIMsTUUShjs+QLp4AClDTYkRf+9W4A2nw080=;
        b=tqK6EylbL3IRVSVeqny4YfYHUd8MEZ+EG8vgBKQHHRQlo3t0cxZKeyGhAlUJHpiCbE
         t11b4qpxn05QD4jUUhmHbZh6WIDQbUoQt9ewyzqIm6OuM7FU5sYiq4hu4h1QrYeOKdjK
         t2brMrUiKobR1+TnkM4zgq6S8cKH9fgZFxP7oSTeU+uHIPcj/1M+vpmRvQ511+MFqKXG
         Ce/5/+9bfui7aHH7LWjENQZhh0QAard4O4Bq4jzzThtpISQV9wD8pN1M0wzlFgSMlrd2
         hEnYdeQ2OsXgdmL6ZgOx5L9adyAZVVJkmRUmgodh329wA9DmOXOPqRA38pcT2upWL9XA
         vJSA==
X-Gm-Message-State: AOJu0YwKNIak6G1QE/J8mSXFfJOvGUGcyShBC9uWbs99TbHGO2zpUm60
	T4WURkO6bSQ+P/q/rzFdkaopUJDdYrD9J6pdHDXQrxLm5RXgiy1cNM/y1nkOqQ7FoTB7KYe7bX1
	Uic0+JdNQqEkUPVWttU82L2VimTYVaQ==
X-Google-Smtp-Source: AGHT+IFQ8DNxqGSqcW9qDOWT0+xkommVOL8NYKojjW60ZEGtSg8zFwROyJqv1udA58U+BC9pGGRzfwoRAYBK+Mg0JQs=
X-Received: by 2002:a05:6512:2253:b0:539:eb97:61d7 with SMTP id
 2adb3069b0e04-53d65d91d13mr401281e87.4.1730406523823; Thu, 31 Oct 2024
 13:28:43 -0700 (PDT)
MIME-Version: 1.0
References: <20241030050745.3702603-1-hongxu.jia@windriver.com> <20241030050745.3702603-2-hongxu.jia@windriver.com>
In-Reply-To: <20241030050745.3702603-2-hongxu.jia@windriver.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 31 Oct 2024 14:28:30 -0600
Message-ID: <CAJdd5GZ222rxBe9=VkiXuJw8mdqZ6zCYi3XS8noCNM8taF7POg@mail.gmail.com>
Subject: Re: [oe-core][PATCH 1/6] meta/lib/oe/sbom30.py: correct python list comprehension
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Oct 2024 20:28:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206589

LGTM

Reviewed-by: Joshua Watt <JPEWhacker@gmail.com>

On Tue, Oct 29, 2024 at 11:07=E2=80=AFPM Hongxu Jia <hongxu.jia@windriver.c=
om> wrote:
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

