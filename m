Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3F82C282D1
	for <webhook@archiver.kernel.org>; Thu,  6 Mar 2025 13:14:02 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.12847.1741266842097305839
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Mar 2025 05:14:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jBkbUfR4;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: festevam@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5497e7bf2e0so749707e87.3
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Mar 2025 05:14:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741266840; x=1741871640; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B3+2wFKnWx2Eit37/+aVNGCEk5zRR9scNaealCXRzaA=;
        b=jBkbUfR4AVrcakfKhjCxzjWy0XwVFmB/Np7ycH6+Xe3fRy1eA1tIThApK7eYFaeVnr
         XekBmbjhlc6RN3NjN0tM8+ot1zpDFhQP+fT12F1Ebn8OBYNnQdnODYmEEiVj5p+YcLTI
         Pw2jUafK8xtP/OLXTCq3EjEDQ8OPePiJHMSIvc6bC1oF8v+sIHfWUYoCb/23I2wWS1Jg
         ROVoEaaSdZTOl7tU3aBPmT9vENd/+8xMmnlwjLITSPJInVLnXTeTYIA//zUsapHpYEVb
         et1Uwxm8bdnTmb4gbbzLsV4GWm8PlHnF1jAGE1OUF5TiwPREqyEjeoHUXt79+psfwBuK
         dFug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741266840; x=1741871640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B3+2wFKnWx2Eit37/+aVNGCEk5zRR9scNaealCXRzaA=;
        b=e5b/1HPr115sFBdyXkGQiLbfunpmYMWwGZ3zZL9xZ/EiuVuIV1ROvb45gSloQE11s4
         yFPqVUl0zLG4j9Y4DNBvA4h2Ojzd/svpGnlEU4XZviDLaWr/GOsdUcUM6xplwKgPB38C
         uFXuqnCV2+SSn32syRrB9Y9oy7KdzMqi4BuCzcMTy8FyzmDNfjqQ/fEoP/poPetMjCLZ
         rDsEM4hWm/HTKfjxV3RuENOmU1y633WRNngzzgVULFDyTMGRR4E0t5mavyriJUSWGA8E
         cvJImqmg1jnTWZBIq9lqODw/PEu2KZmYb3c2rQygBuYRBTU1iAy6ycWiJ9C+iYPB9s9p
         xQ7A==
X-Gm-Message-State: AOJu0Yw5h3Nve1LFLR5e6BmO9D5byOU5Kk10dyvfTTUN6Zb/1SuoiHhY
	TiBjhcQM+fRqDsl4jvJBWClq447ioQPJe9ts2qYM0UWPvdzO0RZc+g62JQkSr4cZscjFIoXbWoL
	uyHCF1PgbFUkVGeei2d4cK76uPOtzcAnO
X-Gm-Gg: ASbGncvGYqamaLLlmCiTUxwjKLYyoLwHv3z6IN80WGKcEFhVqhwYhd0l++2ndFHWkVd
	oK+6z0zqlC78uxZL45rHksW8CfrCqKUaQlV6xoHm7oaK6hPUazxxYIwcJQCmBh+I/vAMy/ISFd9
	hMXXVTwbkRvWzfApg+S5yvnNwbjd9Jfqcbx1gTvAmqr5u5qYX365mH1FQs
X-Google-Smtp-Source: AGHT+IE8TlmeWD3wGy7zaZjXQ6IxDRS55wfco3Tpdoi6VrOmWJ3fJ5tv8eMkKIDMJyJ5U/rX6+iuMWTQ5Pfma5u76dk=
X-Received: by 2002:a05:6512:104f:b0:549:5822:c334 with SMTP id
 2adb3069b0e04-5497d3838f0mr3204938e87.52.1741266840180; Thu, 06 Mar 2025
 05:14:00 -0800 (PST)
MIME-Version: 1.0
References: <20250304131105.1187410-1-festevam@gmail.com> <D897IA2JDVDD.MBR1KBH9YWBE@bootlin.com>
In-Reply-To: <D897IA2JDVDD.MBR1KBH9YWBE@bootlin.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 6 Mar 2025 10:13:48 -0300
X-Gm-Features: AQ5f1Jrd1iQjSlsbmRTVKaPwbx91U3H7_nCqQJeT8np7CxNIrV1qra0o1bKlcrE
Message-ID: <CAOMZO5AO-pa10ar=4EuZAaevAYoOXu=n3Sy6JHRSFNH+3yOiKA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4] mtd-utils: Upgrade to 2.3.0
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, ross.burton@arm.com, 
	raj.khem@gmail.com, Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Mar 2025 13:14:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212389

Hi Antonin,

On Thu, Mar 6, 2025 at 10:10=E2=80=AFAM Antonin Godard
<antonin.godard@bootlin.com> wrote:

> You can make a single SRC_URI assignment here:
>
>   SRC_URI =3D "git://git.infradead.org/mtd-utils.git;branch=3Dmaster \
>              file://0001-ubifs-utils-ubifs.h-Include-fcntl.h.patch \
>              file://0002-ubifs-utils-journal-Include-sys-stat.h.patch \
>              file://0003-ubifs-utils-link-libmissing.a-in-case-execinfo.h=
-isn.patch \
>              file://0004-ubifs-utils-extract_files-Include-linux-limits.h=
.patch \
>              "
>
> It will make parsing a bit faster.

Richard tweaked the SRC_URI line as you suggested:

https://github.com/yoctoproject/poky/commit/768a0f6c7fdd7f788673ecd070a05c8=
d30ac486c

I will do it like this next time.

Thanks

