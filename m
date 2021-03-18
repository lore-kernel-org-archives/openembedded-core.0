Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web09.6132.1616055069463488604
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Mar 2021 01:11:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=PMq2eGQi;
 spf=pass (domain: burtonini.com, ip: 209.85.221.49, mailfrom: ross@burtonini.com)
Received: by mail-wr1-f49.google.com with SMTP id v11so4484544wro.7
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Mar 2021 01:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3slgKz4omIApxMscVUrTS7Adu/dt9bhIsDT8jSRR42c=;
        b=PMq2eGQiLJCsFla3nyNmmSHYV2b0TN/zxqH47Lbw47mGTS6KBviF8WvQCRJPgoU33O
         22FTZEs3ldfaMwhf84+OZtROJkqkBXzSq+obntaoFcUeGHTEw9sx7X5yL6XwgxhNQ14B
         LlncT6sRAQrhZjCt353gQ3E5XJMeI+LTIcbjcaslapr4kWvTAkG3jE86vLJgNy6Dm5cd
         eOSNBCgGm+iwk32Qa6BWJQA3hnJIdXkQBzibhlmHdKEcVyfeN72n9x5nmjr9GtC1hj3J
         RHytjuwO3AOAiHqeqUyP+bSoQrGLsMEJ4hZZ5FT45MsWzGR44DidpigU6RKANr2Oa0Tq
         3uZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3slgKz4omIApxMscVUrTS7Adu/dt9bhIsDT8jSRR42c=;
        b=hkjwmN7+42tFMHmBswo3v6oTpXjgmlJ15CDv0RGVEv2B5a7Ez4NyeZctmhPGKjOp0C
         /XAVTX58Y0RgLu0IzvRs1QYt8wv1iioyZvV01a9HR+ICBlR0XU+yMfy4LC13g2fTi2XQ
         MibaGK6y0yib1GnXtebAiIXczEmVCTpeonpZH/OynpwD3eKIFABhMFLsxuoLRhmZcuuf
         ExRt3ohFVf26BHoT+PvoGn00zUBTOTIWyG6B2fslXuwFpOdk2+BXVh1cOXLZBrdrb8Uv
         CBlraSwSaLyhwyUYcU6uTqakp1Po42+yj1rTD7ERRrccWR4QP4G78/NGRn704jSsHBLi
         1AUw==
X-Gm-Message-State: AOAM5331QYINvnjAT8A1ksIcegSDrfp9mxw2C5lf4tETaI0A46a0AdID
	7irareCTrrK6zu7lvFjqFhy02rG+TMhBVavUdT8lEg==
X-Google-Smtp-Source: ABdhPJyNzW4iH0c4ZHuxGjpJbFNSxiCOPTf3o6IPQ1I/vHbsP+zt1wIXvNnpH0dRgHWwzjMwgZMQ0JJc+l+xKphFiBw=
X-Received: by 2002:adf:ee4f:: with SMTP id w15mr8305814wro.199.1616055067870;
 Thu, 18 Mar 2021 01:11:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210318025605.48080-1-mingli.yu@windriver.com>
In-Reply-To: <20210318025605.48080-1-mingli.yu@windriver.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Thu, 18 Mar 2021 08:10:57 +0000
Message-ID: <CAAnfSTszgCE9EYacSs8en5FeTEebJFCAX=Z7YB85eNqTTJUbnA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] autotools: don't wipe elfutils macros
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

That's not an acceptable solution, as Khem says.  If the recipe is
using gettext properly then the gettext support in autotools and
friends should work fine.

Ross

On Thu, 18 Mar 2021 at 02:56, Yu, Mingli <mingli.yu@windriver.com> wrote:
>
> From: Mingli Yu <mingli.yu@windriver.com>
>
> The below m4 macros files shipped with recipe will be removed if the
> recipe use AM_GNU_GETTEXT.
> gettext.m4
> iconv.m4
> lib-ld.m4
> lib-link.m4
> lib-prefix.m4
> nls.m4 po.m4
> progtest.m4
>
> After elfutils upgrades to 0.183, it begins to use AM_GNU_GETTEXT as the
> commit (dd52d2ab Modernize gettext infrastructure) included, so the above
> m4 macros files such as iconv.m4 is removed and it's bad as we need to
> patch against iconv.m4 shippped with elfutils.
>
> So we skip elfutils to not let the elfutils m4 macros removed and also
> fix below issue:
>  $ bitbake elfutils -cconfigure && bitbake elfutils -cpatch
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  meta/classes/autotools.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
> index 9dc8ebdaa7..4b462c5aba 100644
> --- a/meta/classes/autotools.bbclass
> +++ b/meta/classes/autotools.bbclass
> @@ -203,7 +203,7 @@ autotools_do_configure() {
>                                 bbnote Executing glib-gettextize --force --copy
>                                 echo "no" | glib-gettextize --force --copy
>                         fi
> -               elif [ "${BPN}" != "gettext" ] && grep -q "^[[:space:]]*AM_GNU_GETTEXT" $CONFIGURE_AC; then
> +               elif [ "${BPN}" != "gettext" -a "${BPN}" != "elfutils" ] && grep -q "^[[:space:]]*AM_GNU_GETTEXT" $CONFIGURE_AC; then
>                         # We'd call gettextize here if it wasn't so broken...
>                         cp ${STAGING_DATADIR_NATIVE}/gettext/config.rpath ${AUTOTOOLS_AUXDIR}/
>                         if [ -d ${S}/po/ ]; then
> --
> 2.17.1
>
>
> 
>
