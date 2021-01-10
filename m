Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web10.25995.1610321103697317283
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Jan 2021 15:25:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=eBOlXcgl;
 spf=pass (domain: linaro.org, ip: 209.85.210.52, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-ot1-f52.google.com with SMTP id x13so15289605oto.8
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Jan 2021 15:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=8yGbhGal+XJw54VGY3lCQz19BhO9YGT9chK+qULHy4c=;
        b=eBOlXcgletYaggoOs4Za/TVbRmQ+vtWHTe99u29bjTIwuwzNATMsYdFdMFMFHaYbpx
         vWCAUayh66HhPVgOGoCDALZLf2k1AbdJQ+zVquza6XjeS47WXdvZlgwLE7LY4HgZiaic
         gV+x65GXBlzbEz17VCCnknuvK4sj/4Q5n0isoFvZFt4LwByKn/IZxebO0pPSxT7/lVJR
         bRVhibeB9l1QolRBURoCZwsHZ+j+0UPgRdwsTJL/vf6s660rzK3f4wXyk5x/azmGgMyg
         TAOTOlpvJHS+48lTditJbUn1L2M52oYjvjJAaD6K/LsQcy4olIARPlQEugag8hIKi7/U
         OOrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=8yGbhGal+XJw54VGY3lCQz19BhO9YGT9chK+qULHy4c=;
        b=SfH2iokSuhNObI+IfI4gz0RGx4ynAm7i1hlPitQ7Id7d00fggadt94VQAD7PTUIeRI
         yZKbFWJrpkflNCucGpobw+d3g5sdjp4Gcl5jufLSln1UmnCBqzHQC/T0u0fVvZDvvyYi
         Pg+Cn/bTIxT644n24rWwRzyCOGa7GTKIr9/c9hf7uIOPy+4BJ33nWK/QY+iN8hAzd6pb
         oSTax88MMAvMDFBZYLUnbqjgpONnVjPo9wcbeP7T96P7yKqvsnt9Cgwb/m5fZdyduYbi
         wBpGv/IiYdXGFxWw3yTc4ZJbKzQwdJ0vzjS0BbIUjPCz1H+rqcdjMrRN4RfGaCCnGN8B
         zGeQ==
X-Gm-Message-State: AOAM533t1nRVhSmHqLndvNRRKDRmaRSUWaT7ObhvB84pJGNHfrXdvpJ2
	IFOTejhYeH82F4tsxA0oWaonjWpq/Di3Y9WeYkscUrd7FA1NoQ==
X-Google-Smtp-Source: ABdhPJyqvUvsdQ4GqCTGg3LkwA3vcpTK2T83SnImclEFvnkcRfb7CqzOf6Zb+HXnc7Mi2oSkFqpIXZOTRD2j6sMXjjo=
X-Received: by 2002:a9d:7411:: with SMTP id n17mr9135828otk.262.1610321102635;
 Sun, 10 Jan 2021 15:25:02 -0800 (PST)
MIME-Version: 1.0
References: <20201227234844.2572356-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20201227234844.2572356-1-dmitry.baryshkov@linaro.org>
From: "Dmitry Baryshkov" <dbaryshkov@gmail.com>
Date: Mon, 11 Jan 2021 02:24:51 +0300
Message-ID: <CAA8EJpqLeNYFs1qwEkj_L9D3e_zVVZ3M48LjpELyd0PNdmqotQ@mail.gmail.com>
Subject: Re: [PATCH] rxvt-unicode: use RPROVIDES instead of just PROVIDES
To: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"

Hello,

On Mon, 28 Dec 2020 at 02:48, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Change rxvt-unicode from using PROVIDES to RPROVIDES for
> x-terminal-emulator, since the package provides x-terminal-emulator
> functionality at runtime rather than at build time.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

I'd like to ping for this patch. Is there something wrong with it?
Having "virtual/x-terminal-emulator" in PROVIDES is the wrong idea in
my opinion.
Other recipes can require virtual/x-terminal-emulator in runtime,
rather than at the build time.

> ---
>  meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc b/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
> index b064a63caa66..6ebd3afcb939 100644
> --- a/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
> +++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
> @@ -14,7 +14,7 @@ SRC_URI = "http://dist.schmorp.de/rxvt-unicode/Attic/rxvt-unicode-${PV}.tar.bz2
>
>  inherit autotools pkgconfig update-alternatives
>
> -PROVIDES = "virtual/x-terminal-emulator"
> +RPROVIDES_${PN} = "virtual/x-terminal-emulator"
>  ALTERNATIVE_${PN} = "x-terminal-emulator"
>  ALTERNATIVE_TARGET[x-terminal-emulator] = "${bindir}/rxvt"
>
> --
> 2.29.2
>


-- 
With best wishes
Dmitry
