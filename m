Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web08.3570.1620851213608601287
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 May 2021 13:26:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pPMtThaN;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: armccurdy@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id p20so7254047ljj.8
        for <openembedded-core@lists.openembedded.org>; Wed, 12 May 2021 13:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bGM7JpMcxp6LpS5FkXo888J7WFgMQngY0/S8iUGXIHY=;
        b=pPMtThaNq+nBu7GCuLyKvuaiipUdHL9iP2MeagKg71KLPO+DOSecCOdHGnhbqCJdyW
         suLlgxUVJI2j9fsx3cJYICvt/f0OxgzX+5vLvU3dAJtSNqqVPhg8A18A5D8CGnkMC+gC
         2H2sfnWXBHV5Nm7yCX+s/4fVuL6LxaC+gVATqnPeUiuz7hkUeURAZS4bdRuxa7IIrG2d
         tggKasz+ZbuauuSOqsheud62iZ1rbmgJY+M6QdjuvxGq4l0HjZY4h7jqmRmj+yff7fWv
         WWz0wAuyyMRYz7iJvl5aLY4YWOeRb2z5KgZ1Lx3SwCz+xslefZ9u2qklES0tXIZ4Hxuw
         smNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bGM7JpMcxp6LpS5FkXo888J7WFgMQngY0/S8iUGXIHY=;
        b=RrLcTUgSsdz7jnfxi7F3JvS20Smc0BBO7U+KLKlhjC32VhjrIBJBQsGvM81HUWdNQe
         IMi1BQRe6/DKU/aYcUHhsCY+AnC7S7lPv11xORLhw/muZ5POqy1Bym3SQBDd1N4NwfCe
         ggUX8XJFwlb6vPi/QKjouZiO+Nb8fCeKFqbMRp/oeraIdzzUi+J7Yz0NyqJALOa1EHzM
         W2PIC9RiT7OJmijqlFl8Zhl4zftM3cB8yHoX++XU7EFBEEGtonBisUQNR/8eSDDt0i3t
         ME/y7xcW70WjzGE8rgtmaTSQbyPQPMqxaTpbhxHXHtTm3W285Il+xYSjjZ8ZdsnTvjKs
         3s2g==
X-Gm-Message-State: AOAM530UObtTjUeO8INqLe+k6Z5wWzbZZVWKOpeZBCe1ZmMxX8qplNyW
	z7Xd1l+2vA2v0R/djtxJJfV1gs1WADhJ1F9GPwg=
X-Google-Smtp-Source: ABdhPJz/0ktIKarIz7tAjrbAlWDCdbRJOtNelyHTmSWSLXDt0cwNNTXzjCiTBdhLgCAkAZHk/MOhDfvqSN2d6m2MtjM=
X-Received: by 2002:a05:651c:1a4:: with SMTP id c4mr30757712ljn.112.1620851211641;
 Wed, 12 May 2021 13:26:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210512192517.2690596-1-raj.khem@gmail.com>
In-Reply-To: <20210512192517.2690596-1-raj.khem@gmail.com>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Wed, 12 May 2021 13:26:40 -0700
Message-ID: <CAJ86T=VTp7AUhJgD3idQsRQmhLpJvNZtHOxRUmkMdkEzEVKG1A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] npth: Link with libpthread
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, May 12, 2021 at 12:25 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> libnpth.so uses pthread_create so ensure its linked in
>
> Fixes
>
> tmp/work/core2-32-yoe-linux/npth/1.6-r0/recipe-sysroot-native/usr/bin/i686-yoe-linux/i686-yoe-linux-ld: ../src/.libs/libnpth.so: undefined reference to `pthread_create'

Seems like something which should be fixed by a patch to the source
code (and submitted upstream).

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-support/npth/npth_1.6.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-support/npth/npth_1.6.bb b/meta/recipes-support/npth/npth_1.6.bb
> index 94a3f00eac..7b3ad0c95d 100644
> --- a/meta/recipes-support/npth/npth_1.6.bb
> +++ b/meta/recipes-support/npth/npth_1.6.bb
> @@ -18,6 +18,8 @@ BINCONFIG = "${bindir}/npth-config"
>
>  inherit autotools binconfig-disabled multilib_header
>
> +LDFLAGS += "-pthread"
> +
>  FILES_${PN} = "${libdir}/libnpth.so.*"
>  FILES_${PN}-dev += "${bindir}/npth-config"
>
> --
> 2.31.1
>
>
> 
>
