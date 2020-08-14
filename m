Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
 by mx.groups.io with SMTP id smtpd.web10.15105.1597399205089114148
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Aug 2020 03:00:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=YLhXifZM;
 spf=pass (domain: burtonini.com, ip: 209.85.208.196, mailfrom: ross@burtonini.com)
Received: by mail-lj1-f196.google.com with SMTP id g6so9274974ljn.11
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2020 03:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=PFhqmwfk2R3Yi4WaBcb+9hdNZvFWYKPLhSFXfV8uZ9M=;
        b=YLhXifZM/WenfIjdVgHEKY28JfhVBg2xCI2TKFvuazaWG0bQve4Yfto/2ahaVxOSHv
         WKAEpmqotprigxDbzbc6I82ryCi4matB7S1z0gTLrQeR4kfS9wah/Ldtsc78AKErnTAq
         OuUdvk/IWBAjUWkqcmRRRBTPfhv/ZjVWjXVOYG1bupNvlEmG9+EY7+tJb1vUnzZNMcy4
         fFv4kOQGxJAx98TO5DF9xV9ZNxjM+kdqeUAKvfDvjBvQJ/p9UepxuDZ0lbN6OPy3GPnV
         d8SYkD/B/Rvzuj9LWYGtZf/5rawJ0X53pgiecjmCQICbDNub5MLH1NdEerv1j5aqvatB
         9LiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=PFhqmwfk2R3Yi4WaBcb+9hdNZvFWYKPLhSFXfV8uZ9M=;
        b=tjX+ugFHdjqE0HxjmjhO3JiA02XZ+xgRZQwY96mRN1EAXB7UBVCmWtoN/h4/LDfR7e
         LiI9AdyEifjXhZEZO2ZHpAF0Rat0TTmY6iTIBcT9hVmQooDF+3ewTHqwUr//im1euRK2
         ufzkh21PxnXmCae4uAgyvT8SIN1gzAwv5L4Qscu1cg7s7W0hu6Bse0qAjLfJjTpwqDrH
         J4zjQwNCkIlKPb0M8RAlr9w5CTz5WL3arzusnsj5Nl0uIO/bAfH9hBUarsVmD1+jE15T
         NJUbHXup4NoW2AaY6n76SmEjwu5Kflu6UAkdoRbrrIu4wbaQrxPbYR8yKV25yXPkRggU
         xVlg==
X-Gm-Message-State: AOAM532bvgNh3wBVRr9Rpi66dJNpggkyBpjv6sxOjxzuI+3MYeUiLKEN
	tbjtLFbBuzpstP9HBp+IvE8f8U4iwuIVq0kjqA9hdg==
X-Google-Smtp-Source: ABdhPJzhetMm/ZFQWZiESKvUWBlglOJKPC2TjPnCM6h6YPFymhS6HbKLnzP59I3hgOoFQgG2pwWSFlFrigXzSvxkytw=
X-Received: by 2002:a2e:97d3:: with SMTP id m19mr1041037ljj.340.1597399203226;
 Fri, 14 Aug 2020 03:00:03 -0700 (PDT)
MIME-Version: 1.0
References: <1597319535-5254-1-git-send-email-leon@sidebranch.com>
In-Reply-To: <1597319535-5254-1-git-send-email-leon@sidebranch.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Fri, 14 Aug 2020 10:59:52 +0100
Message-ID: <CAAnfSTvrwN-xNPAvtXeyf7RmeU5s2ag6ygS3bST-N-GmCtq0ew@mail.gmail.com>
Subject: Re: [oe-core][zeus][PATCH] cmake-native: Use cmake-provided zstd library; system library might be too old.
To: Leon Woestenberg <leon@sidebranch.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Is this Zeus specific, or should it also be merged into master and dunfell?

Ross

On Thu, 13 Aug 2020 at 12:52, Leon Woestenberg <leon@sidebranch.com> wrote=
:
>
> On Mint 19.2 (based on Ubuntu 18.04.2), if the system library zstd is pr=
esent,
> the compile fails as follows:
>
> <...>/tmp/work/x86_64-linux/cmake-native/3.15.3-r0/cmake-3.15.3/Utilitie=
s/cmlibarchive/libarchive/archive_read_support_filter_zstd.c:59:2:
> error: unknown type name =E2=80=98ZSTD_DStream=E2=80=99
> |   ZSTD_DStream *dstream;
> |   ^
>
> cat ./tmp/work/x86_64-linux/cmake-native/3.15.3-r0/temp/log.do_configure=
 | grep -i ZSTD
> -- Using system-installed ZSTD
> -- Found ZSTD: /usr/lib/x86_64-linux-gnu/libzstd.so
>
> grep -rne ZSTD_DStream /usr/include/zstd.h
> <no output>
>
> The fix in this commit is to use the cmake provided zstd library:
>
>     -DCMAKE_USE_SYSTEM_LIBRARY_ZSTD=3D0 \
>
> so that on supported distributions, we do not depend on the system zstd =
library (version).
>
> Signed-off-by: Leon Woestenberg <leon@sidebranch.com>
> ---
>  meta/recipes-devtools/cmake/cmake-native_3.15.3.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-devtools/cmake/cmake-native_3.15.3.bb b/meta/r=
ecipes-devtools/cmake/cmake-native_3.15.3.bb
> index b2952ee..e0ac3f8 100644
> --- a/meta/recipes-devtools/cmake/cmake-native_3.15.3.bb
> +++ b/meta/recipes-devtools/cmake/cmake-native_3.15.3.bb
> @@ -21,6 +21,7 @@ CMAKE_EXTRACONF =3D "\
>      -DCMAKE_USE_SYSTEM_LIBRARY_LIBARCHIVE=3D0 \
>      -DCMAKE_USE_SYSTEM_LIBRARY_LIBUV=3D0 \
>      -DCMAKE_USE_SYSTEM_LIBRARY_LIBRHASH=3D0 \
> +    -DCMAKE_USE_SYSTEM_LIBRARY_ZSTD=3D0 \
>      -DENABLE_ACL=3D0 -DHAVE_ACL_LIBACL_H=3D0 \
>      -DHAVE_SYS_ACL_H=3D0 \
>  "
> --
> 2.7.4
>
>=20
