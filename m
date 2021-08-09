Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web12.24868.1628523920755152830
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Aug 2021 08:45:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=qXqBMdoS;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.54, mailfrom: steve@sakoman.com)
Received: by mail-wm1-f54.google.com with SMTP id k5-20020a05600c1c85b02902e699a4d20cso322869wms.2
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Aug 2021 08:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=J2kcPiDpt8wMeApBUbAil7adgejzpXvd0wpX+TylMb0=;
        b=qXqBMdoSaQyQmcJiY2QA9FKudRMrLKdByMlrFrp6DvNdIedaBWifLA4KZoZMPa8iCO
         NdwtNi6WlV9xP90RB3zRRYpnxNONCKgrgFWXbJGA+DSQtbf5yfQ2ESXY9hVLEh3fdhAd
         UAoRNxvM1cPfy/N8rmeuM7MyUSIC2gTl66jvCiO67hXwcKnSKE7XCKrdhHNfBB6L+MiR
         SgAbAAlko4PiN9smFsmMsjQizosV13Zxk2xcdm7eBT0IUfZabXPjb9OMJYBX38xtIvM5
         f+APvUJtfRsdPQHYobHmcrQu3ehBXbNQ+jvL/rOQwdGpS0MOcYmAQAAgYuXIfMZlCSyF
         fdeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=J2kcPiDpt8wMeApBUbAil7adgejzpXvd0wpX+TylMb0=;
        b=Z/9pA2v5SIIVwPbA+bzVS1LYYX2IHa/zBgu4ZeBKsESfegX3q8e+sY1xAH+L28LfD7
         ArgSJ5kXBf23VFFUQDSsMkDNv1ebW1G+UGZJur8H/P3HYuqGrz4plV1XfsXGWOtC3qyb
         mCzEfhfFKnldvML8bHKkT7CqLrX5MEOLqQG9QUASbK93bm/GEqciTZk6XRV5wKb0Io1b
         A7lyEPkE9yAJrQp41q8NPxAxlPpOWmXN7L3jFMlK33z0HGT4G+92cazmy1SB05nytg/n
         Vbmg5cexL1UtH0iW2LWv7QWSsm/7FicSezkW3VC7P5TqKPrDcA1aaEOYr/A7gmEQ2QI6
         IE8A==
X-Gm-Message-State: AOAM530g+6Iz6ql/4JI+Yb9S9RkgfH3gz1nzHn5NfcI0GKxDwnThLeop
	vVuxyWCjMeNmuoLjhjdnF0lrzSP9MCZqv1kniv9WjQ==
X-Google-Smtp-Source: ABdhPJyn/IO43yS7MXK7TiWT5qZ4fav2HRhjpWkrcNT4AX6xhFz2Cf5vpmkaTNAjXkhJajTcG2W7QsOUVZdHw73UnpY=
X-Received: by 2002:a7b:c416:: with SMTP id k22mr34725752wmi.177.1628523919046;
 Mon, 09 Aug 2021 08:45:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210803051138.30790-1-qiang.zhang@windriver.com>
In-Reply-To: <20210803051138.30790-1-qiang.zhang@windriver.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Mon, 9 Aug 2021 05:45:07 -1000
Message-ID: <CAOSpxdb36MhtYw0d742yYVwmvB796vedfxXsTgX4EmMff3b8KQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3: use monotonic clock for condvar if possible
To: "Zhang, Qiang" <qiang.zhang@windriver.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 2, 2021 at 6:41 PM Zhang, Qiang <qiang.zhang@windriver.com> wrote:
>
> From: Zqiang <qiang.zhang@windriver.com>
>
> The timeout for threading.Lock, threading.Condition, etc, is not using
> a monotonic clock, it is affected if the system time (realtime clock)
> is set.
>
> This patch will make condvar use monotonic clock.
> Refence: https://bugs.python.org/issue41710

Should this be backported to the 3.8.10 and 3.8.11 recipes in dunfell?

Steve

> Signed-off-by: Zqiang <qiang.zhang@windriver.com>
> ---
>  meta/recipes-devtools/python/python3_3.9.5.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-devtools/python/python3_3.9.5.bb b/meta/recipes-devtools/python/python3_3.9.5.bb
> index 82177f4a18..f3f0237c78 100644
> --- a/meta/recipes-devtools/python/python3_3.9.5.bb
> +++ b/meta/recipes-devtools/python/python3_3.9.5.bb
> @@ -73,6 +73,9 @@ DEPENDS = "bzip2-replacement-native libffi bzip2 openssl sqlite3 zlib virtual/li
>  DEPENDS_append_class-target = " python3-native"
>  DEPENDS_append_class-nativesdk = " python3-native"
>
> +# force to use the mutex+cond implementation
> +CFLAGS += "-DHAVE_BROKEN_POSIX_SEMAPHORES"
> +
>  EXTRA_OECONF = " --without-ensurepip --enable-shared --with-platlibdir=${baselib}"
>  EXTRA_OECONF_append_class-native = " --bindir=${bindir}/${PN}"
>
> --
> 2.17.1
>
>
> 
>
