Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web11.3486.1592856794038705544
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2020 13:13:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nrpBD6aK;
 spf=pass (domain: gmail.com, ip: 209.85.128.66, mailfrom: sakoman@gmail.com)
Received: by mail-wm1-f66.google.com with SMTP id j18so775253wmi.3
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2020 13:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nSB0Tn0JHf40Tzlfd0V+Z8pHB8aikAMRHsFUF5Ju2w0=;
        b=nrpBD6aKzAdXPRZAiAlq3a9nWr/CHzRyxuj5SefV9F3AFdRNjTLdhrVhrseUU66xK/
         6ecE2VLsvelOo2F8YTT/yH08QgzlMBbYfEcirn49i8PFAsQwyZtn4ZstzWLEw2c34R2f
         MVyaJShvJIlKcIhb20c/5h/py8WUfJaKUbILuo+4Te9iV14fw9nSGGEngo9cAh2eKZzs
         WNerGmsPW0w++Ub4Wg+goOcCF4VuK+7bxJu7BMOwZj6E7/FPq9Fzzpq0XhH/y4CDK1Bk
         JWmXA++4rf4l/aiE6zgpugXn0o6UbTbfIi1RlCmX0tOIzhM6rKgklImnE8sBtQFTvzSK
         WR5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nSB0Tn0JHf40Tzlfd0V+Z8pHB8aikAMRHsFUF5Ju2w0=;
        b=C6wijqrN+o8lYGMAnBtuDZuOzKiYHbS8N+Sgip4QsDgvBklVld5hXwJWSiRYqm4DWh
         XvAttdI5CvgutEQyPaw25yoxxLRSdanxCp7uw8D+ynj706CcKAvGT3BqVHvGNIH1n5kF
         h3dz5z2BZgjcuc1EIeO9xumvHFWYRpr6qzevTx1EKQSMEtpWRD+ItF5tc7AngsaqwWns
         gMYK2Jpc6S/24sq2noaNC7Q8oQG+fNE/4kwy8aIRM4aDwiT7wKIj3Pgeu3TRPFp/i6UH
         zH3uahCaFsBoW1mciUs9R5lElv1r1EoZpkzQC18zLPC23lp/etcTnp7MAHSXQvf3NNb8
         mlHw==
X-Gm-Message-State: AOAM531d/tY4UW5qMcEa7dpgDfeAgdruk/ZRfJufbIApjP8rBGtFiETL
	aEGgzfm0H1xR1Lw9bcxPXM1T25avgZdPGNF3VsI=
X-Google-Smtp-Source: ABdhPJxVdNW0oSfr2OJU6B8NSjxB6uaV3BBI8heYz/4QwnuTVnvY1AUT5JyfAmq7ANNTqDDnagNxJvUKVZVzQyP9l2w=
X-Received: by 2002:a7b:c0cc:: with SMTP id s12mr20799795wmh.111.1592856792542;
 Mon, 22 Jun 2020 13:13:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200622200230.54899-1-raj.khem@gmail.com>
In-Reply-To: <20200622200230.54899-1-raj.khem@gmail.com>
From: "Steve Sakoman" <sakoman@gmail.com>
Date: Mon, 22 Jun 2020 10:12:59 -1000
Message-ID: <CAGDS+nk=0yWsYZW3RTbBQXPYVpFE-tCVjWQcgRH2NwNQbiWK4g@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH 1/4] go-mod.bbclass: Add class for `go mod` support
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Otavio Salvador <otavio.salvador@gmail.com>, Otavio Salvador <otavio@ossystems.com.br>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

This set of patches is contained in the series I sent out for review
this morning :-)

Steve

On Mon, Jun 22, 2020 at 10:02 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> From: Otavio Salvador <otavio.salvador@gmail.com>
>
> When using Go Modules, the the current working directory MUST be at or
> below the location of the 'go.mod' file when the go tool is used, and
> there is no way to tell it to look elsewhere.  It will automatically
> look upwards for the file, but not downwards.
>
> To support this use case, we provide the `GO_WORKDIR` variable, which
> defaults to `GO_IMPORT` but allows for easy override.
>
> [YOCTO #13883]
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/go-mod.bbclass | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 meta/classes/go-mod.bbclass
>
> diff --git a/meta/classes/go-mod.bbclass b/meta/classes/go-mod.bbclass
> new file mode 100644
> index 0000000000..5871d02506
> --- /dev/null
> +++ b/meta/classes/go-mod.bbclass
> @@ -0,0 +1,20 @@
> +# Handle Go Modules support
> +#
> +# When using Go Modules, the the current working directory MUST be at or below
> +# the location of the 'go.mod' file when the go tool is used, and there is no
> +# way to tell it to look elsewhere.  It will automatically look upwards for the
> +# file, but not downwards.
> +#
> +# To support this use case, we provide the `GO_WORKDIR` variable, which defaults
> +# to `GO_IMPORT` but allows for easy override.
> +#
> +# Copyright 2020 (C) O.S. Systems Software LTDA.
> +
> +# The '-modcacherw' option ensures we have write access to the cached objects so
> +# we avoid errors during clean task as well as when removing the TMPDIR.
> +export GOBUILDFLAGS ?= "-v ${GO_LDFLAGS} -modcacherw"
> +
> +inherit go
> +
> +GO_WORKDIR ?= "${GO_IMPORT}"
> +do_compile[dirs] += "${B}/src/${GO_WORKDIR}"
> --
> 2.27.0
>
> 
