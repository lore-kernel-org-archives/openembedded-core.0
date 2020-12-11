Received: from mail-ua1-f65.google.com (mail-ua1-f65.google.com [209.85.222.65])
 by mx.groups.io with SMTP id smtpd.web08.13606.1607720141111372867
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Dec 2020 12:55:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=quj6Mhlo;
 spf=pass (domain: gmail.com, ip: 209.85.222.65, mailfrom: armccurdy@gmail.com)
Received: by mail-ua1-f65.google.com with SMTP id f29so3293079uab.0
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Dec 2020 12:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oEtI/LeEMzsP8M7P7+gYqKlilIQmMniPO0Ywsb5i0So=;
        b=quj6Mhlo0vIWI74PQDX3ogkuohZldZv/njQQRWxQQtG+YkJ/TjkW9PYGAjYrU4lvO+
         YcbgHbGHQwBrqQreaxZtcAA+R3L1UNAf0L0nmBCIi1CO/JA/A7ol9ITZ5bnUGAmR1akj
         /Y8ZoUvrBxmR6scaCfpG5Qtveo15EiLw4DiyegH4qUEmwe7SJ5nXBoJ8pKtK0YVq1c5C
         oFqpPdgrS/RPbJ5XfuBY7sg2QQnZKN+SZm/RnQmi6ZiyLovMH7pCgfU2oWPp0mIGCRDB
         7wZHfQrzBNsbhk/VdosXQUcsmqgiSjA6ol2RwKovSijbGeeGprIgfOAXvbQSzucwk90P
         FoxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oEtI/LeEMzsP8M7P7+gYqKlilIQmMniPO0Ywsb5i0So=;
        b=MugQrQHO3CnJPhPHMaPFmBk1DoXq7mNjbKF3WFpDh7LT3WP2Q7RdBRgV76Fc7Egk5V
         0pw8ReL8cT6i8jw5vU14PJgVNWBQkrcdKPouUdnt3q58cDripPhLL9dnWa6rwFJKCFXV
         IRNhUlLf7h31kVLxil71USM59JJb/dAPFxDWdocOkmnAVDQ/l/CNAbmgisB7EXHRZaTU
         6yrTtsUdLjV43sTMPr7j7dK7bxRaeQD4wouSro/2RlvirDKRr9sZLemBwSvKEWzpFK4y
         GLvDLN025WB6gpvSufnvkAX6tUlx625MOalPRJmDCHmoxwqnfc0isVndPXIMo6uA0eNp
         G5og==
X-Gm-Message-State: AOAM5323108SHduNzNokDm9dnLRgBPye+pJBeYJzJAq8bVORVf8qixmb
	AXwt+/St4OezDrbmHPvU8W9I4Fe2GvHfs2EbbtI=
X-Google-Smtp-Source: ABdhPJyTlrbyO/O61di+V1vFTy3eBelZrphvysqyiFruulHsbXFpP2i5nbgRVNkKtCDDDiCk179N0Uht2K0/UtBGICU=
X-Received: by 2002:a9f:2786:: with SMTP id b6mr14226757uab.81.1607720140098;
 Fri, 11 Dec 2020 12:55:40 -0800 (PST)
MIME-Version: 1.0
References: <20201210125312.3302065-1-luca.boccassi@gmail.com> <20201210125312.3302065-5-luca.boccassi@gmail.com>
In-Reply-To: <20201210125312.3302065-5-luca.boccassi@gmail.com>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Fri, 11 Dec 2020 12:55:28 -0800
Message-ID: <CAJ86T=XA_L6FfJoN1dcVzU2L7D6jJKeu+bUc2Jg4DrcKADiwmw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 5/5] systemd: add RRECOMMENDS for weak dependencies, if enabled
To: Luca Bocassi <luca.boccassi@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 10, 2020 at 4:53 AM Luca Bocassi <luca.boccassi@gmail.com> wrote:
>
> From: Luca Boccassi <luca.boccassi@microsoft.com>
>
> Some libraries are now dlopen'ed and skipped at runtime if
> not available. Add them to the RRECOMMENDS list, to allow
> users to exclude them for smaller images even if generally
> enabled at build time.

This seems to imply that these options have some basic level of
functionality even when the corresponding shared library isn't found
at runtime. Is that right?

If there's no functionality at all without the corresponding shared
library then these should just be regular dependencies (and users who
need smaller images should disable via the PACKAGECONFIG rather than
leaving the PACKAGECONFIG enabled but then excluding the shared
library).

Note also that PACKAGECONFIG gives a way to express recommended
dependencies (the 5th argument).

  https://www.yoctoproject.org/docs/latest/ref-manual/ref-manual.html#var-PACKAGECONFIG

> Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> ---
>  meta/recipes-core/systemd/systemd_247.1.bb | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/meta/recipes-core/systemd/systemd_247.1.bb b/meta/recipes-core/systemd/systemd_247.1.bb
> index f20e86d94b..951bffa23f 100644
> --- a/meta/recipes-core/systemd/systemd_247.1.bb
> +++ b/meta/recipes-core/systemd/systemd_247.1.bb
> @@ -603,6 +603,13 @@ RRECOMMENDS_${PN} += "systemd-extra-utils \
>                        systemd-conf \
>  "
>
> +# Weak dlopen-style dependencies: if explicitly requested via PACKAGECONFIG, recommend them
> +RRECOMMENDS_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'qrencode', 'qrencode', '', d)} \
> +                      ${@bb.utils.contains('PACKAGECONFIG', 'libidn', 'libidn', '', d)} \
> +                      ${@bb.utils.contains('PACKAGECONFIG', 'libidn2', 'libidn2', '', d)} \
> +                      ${@bb.utils.contains('PACKAGECONFIG', 'cryptsetup', 'cryptsetup', '', d)} \
> +"
> +
>  INSANE_SKIP_${PN} += "dev-so libdir"
>  INSANE_SKIP_${PN}-dbg += "libdir"
>  INSANE_SKIP_${PN}-doc += " libdir"
> --
> 2.29.2
>
>
> 
>
