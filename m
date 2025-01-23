Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CCE0C02182
	for <webhook@archiver.kernel.org>; Thu, 23 Jan 2025 21:18:53 +0000 (UTC)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
 by mx.groups.io with SMTP id smtpd.web11.23167.1737667131261138569
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jan 2025 13:18:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dJKx1v2X;
 spf=pass (domain: gmail.com, ip: 209.85.161.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-5f4ce54feb8so655839eaf.3
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Jan 2025 13:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737667130; x=1738271930; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8SkqnK2/duxImO990JcFgu83fNAVQKlR+olOdTSRSnc=;
        b=dJKx1v2XSfOqEfsjAyDLXu7wdBafn9CvdRK3GSDC3Rn9sYMA40t0rHkvD4OyRHlQ5r
         YL8oe012gjFIaRTZNiYMLWMJUBA45TF1tY+BkGf3eurtHnWogcui9314L6wI7vyCJnCo
         9Cc7me9Q05XGAq7lYKHBQX5Yj3Tj6EPSEZKpu5i08uuyXCLwPVPi6Di19xuoegJfMAdD
         s9kbwiKoHZDkOaoLarInlRXNRqx7ujZSBBnVG3BmR5iyzf81x9106jp953PrI7vh1GMz
         aAm2T5RFkRiDhOgjsQkFt72MByyqGBB0zx54lJw4lW6MRhtTqY5pHJ2i1nfABGi7uDnc
         QVjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737667130; x=1738271930;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8SkqnK2/duxImO990JcFgu83fNAVQKlR+olOdTSRSnc=;
        b=bXltLG+RujgXtS9GdVY/IfeZzKpWaPEfWqUn2SeF41qYPurdGQLpzWmTDqoOXIQWxJ
         v7zwOsd4MdRixeGdxjt1yZtWL/pYfdk3lJ6Mc8P/uqgmf7596oKGqHzsAp8r6ZxR9wos
         PdK76TrvCrFWNy0Iiuq5kIfBAPTKK70LYnYNWqlXP4oNt29OMLXYZfwJ21PNxYpRBujB
         Rl1zQ62MyA7LO4E7QY7xHBWE6ez4S/TlNdRiMjvskQG+l8XPPuK1q/7BSK9Mtc9s+Otm
         UxhoWWA1Mecl0VfZbK32TGETEBwF+Id/DbApW20z6iM7mD1wEVDMfT5bKRpoHAML1W0A
         SUvg==
X-Gm-Message-State: AOJu0Yyo/xOZLa9rKlyjVoEwTk/i3+WIrExgCgAdxX4pTben2DyGaTHv
	vKZYXwLuLJiBN/+wMnjeEFpck0EQBWlCV9zAfQtMpDGaKVB6QmV88hUfeY7zq1ZfVxE4apNaWZG
	03wPlUJXI1F063bmsC/puzsUvCNI=
X-Gm-Gg: ASbGncs3sM+tXXlkAYEmdUemPfpPkaEnkZDKNouPh9lEsn81ac30sZZv8cEtbcf1fFz
	d1SdvUrzDIWDi/FPnB0vUyEG63fCJZ1TZh3BaOIv44lYjD8Fo0fYix7tMRjgt
X-Google-Smtp-Source: AGHT+IGuetBIiiye9yTLMnueAeSlFbF6MyRlknTVZM87Xl9W3E0XJjZgP6kA2j+cruVkouYvW6Pd+iBxFYkYHEyPMQg=
X-Received: by 2002:a05:6871:4103:b0:29d:c5e8:e41f with SMTP id
 586e51a60fabf-2b1c09794e0mr17320160fac.5.1737667130465; Thu, 23 Jan 2025
 13:18:50 -0800 (PST)
MIME-Version: 1.0
References: <20250123201229.182266-1-marex@denx.de>
In-Reply-To: <20250123201229.182266-1-marex@denx.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 23 Jan 2025 13:18:24 -0800
X-Gm-Features: AWEUYZk-BQZzD-v3ueXBxeF_0KSMcJZaZKHHqhMexFvo-Voczpdcv5qpubbXM7A
Message-ID: <CAMKF1sohTGBUO0Lv3YWykjZg-6BB2Fcrd7x=g23iRxHe3TpqSg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] [RFC] bash: Drop /bin/sh from RPROVIDES
To: marex@denx.de
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jan 2025 21:18:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210213

On Thu, Jan 23, 2025 at 12:12=E2=80=AFPM Marek Vasut via
lists.openembedded.org <marex=3Ddenx.de@lists.openembedded.org> wrote:
>
> Remove /bin/sh from bash RPROVIDES as this has a side-effect which
> confuses rpm package manager when also busybox provides /bin/sh and
> base-files depend on /bin/sh . The problem is broken down below.
>
> First, bash depends on base-files and bash pkg_postinst must run
> after base-files was installed, because it requires /etc/shells
> provided by base-files to be in place.
>
> Second, base-files depends on /bin/sh, which is provided by either
> bash or busybox in this case. This is the actual problem here, if
> bash is selected as /bin/sh provider, then there is cyclic dependency
> between bash and base-files, and that confuses dnf which may install
> the packages in the wrong order, bash first and base-files second .
>
> To make this worse, if busybox is also /bin/sh provider, it can and
> does happen that some systems pick busybox as the /bin/sh provider,
> while others pick bash as the /bin/sh provider, and that cyclic
> dependency does not always appear.
>
> Attempt to break this dependency, drop RPROVIDES /bin/sh from bash
> recipe to always force base-files to pick /bin/sh from busybox .
> (I am really unsure about this approach)
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Alexander Kanavin <alex@linutronix.de>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-extended/bash/bash.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/=
bash/bash.inc
> index 634209c9115..6a061b8a612 100644
> --- a/meta/recipes-extended/bash/bash.inc
> +++ b/meta/recipes-extended/bash/bash.inc
> @@ -134,4 +134,4 @@ FILES:${PN}-loadable +=3D "${libdir}/bash/*"
>
>  # Limit the RPROVIDES here to class target so that if usrmerge is enable=
d for nativesdk, it does not
>  # include host system paths in /bin/
> -RPROVIDES:${PN}:append:class-target =3D " ${@bb.utils.contains('DISTRO_F=
EATURES', 'usrmerge', '/bin/sh /bin/bash', '', d)}"
> +RPROVIDES:${PN}:append:class-target =3D " ${@bb.utils.contains('DISTRO_F=
EATURES', 'usrmerge', '/bin/bash', '', d)}"

Does this now mean that system will always need busybox ? some distros
may not want that and simply use
other variants to fill in the shoes. I wonder if shell choice could be
a distro option or image feature which can then
help sort this out ?

> --
> 2.45.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#210212): https://lists.openembedded.org/g/openembedde=
d-core/message/210212
> Mute This Topic: https://lists.openembedded.org/mt/110778651/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

