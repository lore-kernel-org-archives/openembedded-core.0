Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF8C7C77B61
	for <webhook@archiver.kernel.org>; Fri, 28 Apr 2023 03:20:35 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
 by mx.groups.io with SMTP id smtpd.web10.11226.1682652033550312284
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Apr 2023 20:20:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=eKRBYNev;
 spf=pass (domain: gmail.com, ip: 209.85.160.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-18ef8e9ab4fso1914000fac.3
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Apr 2023 20:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682652033; x=1685244033;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BZcAjWj3lqovy6rhu7ojoGutCUpjyTmHKI0ILOCOeL0=;
        b=eKRBYNeviD2H03eelfK6scQIAdfQbLZU/kC47okvcj1Kfn8wo/wr2quWHQljSC5Thl
         s/7zc8tOQ3jBmbWpMR24Uw/n2EX/3+cqaq8tRPkR6PI6Uh4nkDvC5e5F58PF4YS5fJtw
         DawuCWLiNwFQDAC5EfyaD39ZPIrF+V4gXhLBdpWwmzTRPZMTWeemik1eBBj/7UKzkWlD
         Smp8Ys7kKEAjSkP/g7sI7YL/xa83QaFYYFLWppDFd6LTwSiSy0HPw6v+n0LVqpxmzbhy
         QCuuBdl0SituH/cSfX7fSJx0ELBbxiRimU2jMqlZOHQNf3WQc6r2JkCHIiGhaifW8oCg
         uYyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682652033; x=1685244033;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BZcAjWj3lqovy6rhu7ojoGutCUpjyTmHKI0ILOCOeL0=;
        b=YXhogUFxys4N1PAX1vKM2z+p+ta6tuT/Yb6oXah8ySJ/M+2DXyLWX89W78Vdl89UsW
         1FWRJAK1KnrLaK9HlWjwiyP9WL50terCVKo9JifydQ9W5vOgjZFqQwPK1t7bRRJLKfaQ
         mJMpjUnSeaqTRHFRRNHHXyu3Ep9r7wFn7YCEtnIYDjEhm1Kp+UdnY3bkqsKhYpAHVkwJ
         e+wmbtknOEtWcP790RTPfYvZn12dDJK+xpVT5MYi4MnLarVCwfy6JE5BiaQJvJuxHeG0
         9JPp8cGmWD2xkVKII3EsY/JlU0Fn9AaZ22oGQ+8VB+3mQCYvWdyN5LEE21EdSpBO44+6
         BW7g==
X-Gm-Message-State: AC+VfDz1FJXjhaTjxPG1mB+njQ7fYr8gXkJXW9l/IZe37Lo26jjKXgU4
	CQxMfq5/oXIHhP75uYc2+JZ47p6xBIRfnjLNpu4=
X-Google-Smtp-Source: ACHHUZ4PhjH6A/SuWgZ6L+6fweQlWECKzwST49p3wI4tWyYrdzVmdzHwxbdCtiXPsnMEgwKgPt31R6Nvo6RDlN1J3IA=
X-Received: by 2002:a05:6808:ab9:b0:38c:4c09:562b with SMTP id
 r25-20020a0568080ab900b0038c4c09562bmr1751556oij.13.1682652032527; Thu, 27
 Apr 2023 20:20:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230426095036.2632847-1-alex@linutronix.de> <20230426095036.2632847-11-alex@linutronix.de>
In-Reply-To: <20230426095036.2632847-11-alex@linutronix.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 27 Apr 2023 20:20:06 -0700
Message-ID: <CAMKF1sqY5MDSWV9WDbeFa=O4fA8a7-SzST8ji_jGZEd2GHoQAg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 11/11] insane.bbclass: enable 32 bit time API
 check on affected architectures
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Apr 2023 03:20:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180503

I see this error triggering for meta-openembedded builds

qemuarm - https://errors.yoctoproject.org/Errors/Build/163136/

On Wed, Apr 26, 2023 at 2:50=E2=80=AFAM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/classes-global/insane.bbclass | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/ins=
ane.bbclass
> index 8788f58fc5b..38126d89a58 100644
> --- a/meta/classes-global/insane.bbclass
> +++ b/meta/classes-global/insane.bbclass
> @@ -44,7 +44,7 @@ ERROR_QA ?=3D "dev-so debug-deps dev-deps debug-files a=
rch pkgconfig la \
>              already-stripped installed-vs-shipped ldflags compile-host-p=
ath \
>              install-host-path pn-overrides unknown-configure-option \
>              useless-rpaths rpaths staticdev empty-dirs \
> -            patch-fuzz patch-status-core\
> +            patch-fuzz patch-status-core 32bit-time \
>              "
>  # Add usrmerge QA check based on distro feature
>  ERROR_QA:append =3D "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge',=
 ' usrmerge', '', d)}"
> @@ -512,6 +512,11 @@ def check_32bit_symbols(path, packagename, d, elf, m=
essages):
>      """
>      Check that ELF files do not use any 32 bit time APIs from glibc.
>      """
> +    thirtytwo_bit_time_archs =3D set(('arm','armeb','mipsarcho32','power=
pc','x86'))
> +    overrides =3D set(d.getVar('OVERRIDES').split(':'))
> +    if not(thirtytwo_bit_time_archs & overrides):
> +        return
> +
>      import re
>      # This list is manually constructed by searching the image folder of=
 the
>      # glibc recipe for __USE_TIME_BITS64.  There is no good way to do th=
is
> --
> 2.30.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#180429): https://lists.openembedded.org/g/openembedde=
d-core/message/180429
> Mute This Topic: https://lists.openembedded.org/mt/98511413/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

