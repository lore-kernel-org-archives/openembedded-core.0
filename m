Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.31318.1627311902138822627
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jul 2021 08:05:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=OCaY/JDa;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.46, mailfrom: steve@sakoman.com)
Received: by mail-wm1-f46.google.com with SMTP id m38-20020a05600c3b26b02902161fccabf1so8404847wms.2
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Jul 2021 08:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/yaS4ENser2bs53ExknEzjtv9rvkpabj5OxMLuNREBY=;
        b=OCaY/JDa4kjXk1UJXzFjBlUjmk3klCWA79IFWufsLAAE5tlUaW2cyEE0fQIC/nKGjt
         SjPzhMe9GpYR3SP7cHhi+ecSjqgO8sPJzDPinU9KFEOgRo97M7K5PD9Kxi5kPmUg6khU
         k9rawvFgRTywEOdkMmqweGZxn8tyVbjFJGWkmJVPlgTth3mIQ3f/gYNlKyjFDDj7sXrL
         pU5vYKnKlQJ26Uyw7efvYBf48NE4QoU9ULbdX/+40EdKSj/4x1yUV0vIc1c60DVWStbP
         YPHnedpekpId30fK508m/PRMpgiYfXkBBKwyr/A9dKt8+yR9mMf7b2SIsSyFi4PyQ39K
         gChQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/yaS4ENser2bs53ExknEzjtv9rvkpabj5OxMLuNREBY=;
        b=iz3BIhJ26CrMW2JRbgX+VNg43vh31A9LdsFwgzKvI0f28d+GzV7l4I1yOTIrZOBZH8
         NKwvjaS/6HANRILDyIws3R69Tm1sCsFaWiYmpAszfFcCabZnJhkX9uW+BUmuevotZNf8
         nf+5+j620qUIcfp8h/e10Ekf/VRJJDcTi5f1kwQvPcHkRDaAPdgBBZtgh1v8u/nrhhrS
         DayDpSEkkaxBvzNbO1Fv1tgezr9L65I+kIzpNITr8dAMlXqIgEPyan88APQ+RzJHIiPX
         d/ppRhEnvadPNLDlOF1Rs8N1GgCVPe8v3ARiVp8mFkee87tk7PzbI450EbJUE5ZzZuHC
         O1Aw==
X-Gm-Message-State: AOAM532FvUNtOwqykwKcH6MSI6JJqw83IGaET/EhVhx1LrQ0evKyKJ65
	jQzTPp51KkzbPLhoDRyFsNvhFkGG8f/3y70n9k/qUQ==
X-Google-Smtp-Source: ABdhPJw5Av9gafvPSklaGFGGKUyDkBxdgdMEReWgnR0/YKaqfCRUx3AenUjdvpJjXlOa+UVoHRTE6ldPJIJpDSP6jBk=
X-Received: by 2002:a05:600c:4a12:: with SMTP id c18mr8565455wmp.3.1627311900408;
 Mon, 26 Jul 2021 08:05:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210723214527.2225841-1-fib@cisco.com> <20210723214527.2225841-2-fib@cisco.com>
In-Reply-To: <20210723214527.2225841-2-fib@cisco.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Mon, 26 Jul 2021 05:04:49 -1000
Message-ID: <CAOSpxdYek8qF+oYVSuTGfzP6zq++f711QHJJur9P=xbrFVEWeQ@mail.gmail.com>
Subject: Re: [OE-core][dunfell][PATCH v2 1/3] cmake-native: enabled zstd support
To: fib@cisco.com
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Samuli Piippo <samuli.piippo@gmail.com>, Samuli Piippo <samuli.piippo@qt.io>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 23, 2021 at 11:45 AM Ruslan Babayev (fib) via
lists.openembedded.org <fib=cisco.com@lists.openembedded.org> wrote:
>
> From: Samuli Piippo <samuli.piippo@gmail.com>
>
> CMake depends on having all formats supported and build issues can
> arise when zstd is not available:
> https://gitlab.kitware.com/cmake/cmake/-/issues/21552
>
> Quote from a CMake dev:
> "As far as CMake's design is concerned, we have no optional formats.
> All should be supported. That's why we bundle sufficiently new versions
> of libarchive and libzstd. If a distro builds with an older libarchive
> that doesn't have zstd support, then that is not a proper packaging of CMake."
>
> Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Ruslan Babayev <fib@cisco.com>
> ---
>  meta/recipes-devtools/cmake/cmake-native_3.16.5.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/cmake/cmake-native_3.16.5.bb b/meta/recipes-devtools/cmake/cmake-native_3.16.5.bb
> index b2952ee5f5..6034b654da 100644
> --- a/meta/recipes-devtools/cmake/cmake-native_3.16.5.bb
> +++ b/meta/recipes-devtools/cmake/cmake-native_3.16.5.bb
> @@ -1,7 +1,7 @@
>  require cmake.inc
>  inherit native
>
> -DEPENDS += "bzip2-replacement-native expat-native xz-native zlib-native curl-native ncurses-native"
> +DEPENDS += "bzip2-replacement-native expat-native xz-native zlib-native curl-native ncurses-native zstd-native"

In hardknott/master the zstd recipe has been moved from
meta-openembedded to oe-core.  This is not the case for dunfell, so
this change will result in failures for builds that do not include
meta-openembedded.

So this patch is not suitable for dunfell unless the
community/steering committee decide to also move the recipe in
dunfell.

Steve

>
>  SRC_URI += "file://OEToolchainConfig.cmake \
>              file://environment.d-cmake.sh \
> --
> 2.26.2.Cisco
>
>
> 
>
