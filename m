Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web12.291.1608576471456092165
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Dec 2020 10:47:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=bFp8Hk/4;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.49, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f49.google.com with SMTP id b9so14917391ejy.0
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Dec 2020 10:47:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=W+/0iK0tasF9tAmIL+ezeA8kBIPJkTmNpNWAZtBggxU=;
        b=bFp8Hk/4cRqGve5CApD32KosUup2kHFtNw8qKcBGzUQ1+Fd6cyDi9oNqcaJSnkfa5Y
         Jsa6VKkmjuYFEBsynKI8IgB8HjzhD9TdL1i12aRxcvejVseTwS3XbMeyastuL92s9AVh
         XZkKoHYwXc08TIQXd7lIzS4Qm7Ub4j+BKiIhE4hfA8/4sHgfXA8Im+OSykOGSuS7E8rO
         0aB51sB2ayjdJ7piqVIrnz77Eg01fvwsOwnD/hoEKcRcGC2AYkOwKio80GYhvG+WFxww
         BNjWtR8jY6MWbeO7IBNZSHj4Gc8wunTJ0fnd4fCqMnKRFpo1QNdGQshUrScB+/IR9FLC
         rFpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W+/0iK0tasF9tAmIL+ezeA8kBIPJkTmNpNWAZtBggxU=;
        b=OrqNA9GTShnB+GTxHiQDYXv6TO0VSexwhC2XSa6wU3NC72gwLHxsNOJbKaNMwRL+fo
         KW3YQBXTOGUe2MrEadXloBV4GqHFzO8NHBrkmPbnV0VfRbzNzShP+19EgkOvcFUDnYW0
         vP/z6gO9dew6dJoPI5YK1uxPXyEXsN0a/FV1VTJYqTck7pcmbP5J5dnzySQnTfFnPjGa
         44JLNuDKqH4b/KJBpHKL8lFt7RaZixZ8FjdD/6TBVb1YlN3KK0tITv38+X14AidwK/DU
         K2rP10DMg+v58wpAkruijFHpWNqkDtVbJCXoDvYseGW3A78EDlfWmIUofHoh8Xd8tJfq
         QdvA==
X-Gm-Message-State: AOAM53172FxSuU34ylhpQ4PBDEr/t2BbdtZzx/HmW18nTh/nBGtkwC/1
	4qHBXAPNvz379Cls+30KaXopLC8OR13b/g1pDMqkdA==
X-Google-Smtp-Source: ABdhPJw53c7uZOrYrZIB6UpDhLCFk06I8yH3vQ4WH/xqOxr5JZzCpzjQVhnIu8v4ewgVIpU1JnnD48JIV7cFbRrtBBU=
X-Received: by 2002:a17:906:fa8b:: with SMTP id lt11mr16740202ejb.94.1608576469952;
 Mon, 21 Dec 2020 10:47:49 -0800 (PST)
MIME-Version: 1.0
References: <20201221173201.15771-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20201221173201.15771-1-richard.purdie@linuxfoundation.org>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Mon, 21 Dec 2020 08:47:38 -1000
Message-ID: <CAOSpxdYU_zEctoCrjx1mQKkhEQ70h5tNj1p1Eco5PBA4ONBmiw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] groff: Fix reproducibility issue
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 21, 2020 at 7:32 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> groff chooses a default papersize depending on the value from /etc/papersize
> and failing that, the search domain in /etc/resolv.conf based on the comment
> in configure:
>
> """
> If the top-level domain is two letters and it's not 'us' or 'ca'
> then they probably use A4 paper.
> """
>
> Oddly, my system sets to "a4" in /etc/papersize which means it defaults to
> "letter" since its != "A4".
>
> These defaults ripple through to cause the output of man-db to change depending
> on which default value was selected.

Nice catch!  I just ran into the man-db reproducibility error this
morning while testing dunfell world reproducibility.  Now I can remove
man-db from the exclusion list :-)

Steve

> To resolve this, set a default of "A4" since that covers the larger population
> of the two default values.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-extended/groff/groff_1.22.4.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-extended/groff/groff_1.22.4.bb b/meta/recipes-extended/groff/groff_1.22.4.bb
> index e3984783496..0867452ce7b 100644
> --- a/meta/recipes-extended/groff/groff_1.22.4.bb
> +++ b/meta/recipes-extended/groff/groff_1.22.4.bb
> @@ -28,7 +28,7 @@ MULTILIB_SCRIPTS = "${PN}:${bindir}/gpinyin ${PN}:${bindir}/groffer ${PN}:${bind
>  EXTRA_OECONF = "--without-x --without-doc"
>  PARALLEL_MAKE = ""
>
> -CACHED_CONFIGUREVARS += "ac_cv_path_PERL='/usr/bin/env perl' ac_cv_path_BASH_PROG='no'"
> +CACHED_CONFIGUREVARS += "ac_cv_path_PERL='/usr/bin/env perl' ac_cv_path_BASH_PROG='no' PAGE=A4"
>
>  do_install_append() {
>         # Some distros have both /bin/perl and /usr/bin/perl, but we set perl location
> --
> 2.27.0
>
>
> 
>
