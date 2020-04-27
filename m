Received: from mail-io1-f67.google.com (mail-io1-f67.google.com [209.85.166.67])
 by mx.groups.io with SMTP id smtpd.web12.58.1588008914365736960
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2020 10:35:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=d3YBwW8Z;
 spf=pass (domain: gmail.com, ip: 209.85.166.67, mailfrom: samuli.piippo@gmail.com)
Received: by mail-io1-f67.google.com with SMTP id 19so19717572ioz.10
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2020 10:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qzF9Xr0CTyH1xBLVF74w1wGeJMWRhpMsW7NKBTpUkkQ=;
        b=d3YBwW8Z3V5ZmOMNhlnA24PGwR7x0K9UdE7h3d5xmvgaDp/ZZZZixhdm9dKxIzt4ba
         rbRQ0ViSKY/vZPCoyCRxYayrVLHimvAE3LDxjPMjQjjylhTCT2ZbqYG5w31dBbZPC/hv
         3jsyE8CtDKfGJ/zCl5GEqgTy8nv4pVf7pbZ0xfEk01gurbmKoUfQZwrxGNZRMsomnEYg
         LGCvBXsBnCWRPy8rYYj9cTVhuCB5aOYsCPhTziu8eV70+rPU3SplGWUFhOg+lymx7lDf
         qWCT9mvDoBouADoWIQRD2W6GDZaTXY+kHApiy8MYJsMrOvRraUHg3bIrXaM9ZwfcWY8t
         aVfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qzF9Xr0CTyH1xBLVF74w1wGeJMWRhpMsW7NKBTpUkkQ=;
        b=seuhP9nufxVcp3j0J16GILVzxsuj0/aqoT2nB9j9TxjMoyniwwkU4qe+jfUAvlIT/j
         casUjw/ONCbhY44pM44Tv5uOwVFodYyWvw9gtCwpS16X2x0G+JckLsS2beksUnEoW9Vv
         /MXQOpQApa4+cgQQwew62QvBd+i2x9KwSN8Aa22RJtyaP08PnYrcA7O690KNlS6t0fv7
         jw/kZDRfespoi6itR4H1D5udnujTKwJQhnqZj+B6cjLe5XrBE6hvVtJFE4sAeAR+HFo2
         EXpvD97zzemIo/UrraDdDw2ehGfRGEh6pqiExWpb0/7wiJI2pbvMdhJfPSn9iLvb+VUV
         ry+w==
X-Gm-Message-State: AGi0Pua6IglB6yMcgjV4TAqYNh8Nky2Ft+Jn6SZE7Av08wZFU1R9ynMu
	zeHDMhhK5wyx/1lumTvGEqGRerD9NueWyHRZmSg=
X-Google-Smtp-Source: APiQypIKH7nudwLYXqZCfZQLCcFVOk9UGhgxyWxSAGsL+numRVjeQzqAZErpaq91+Yt7e/MudV1p2uV4UgDTKW0dosg=
X-Received: by 2002:a02:a004:: with SMTP id a4mr21149709jah.18.1588008913638;
 Mon, 27 Apr 2020 10:35:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200427131328.12044-1-samuli.piippo@qt.io> <ef0f940014c41b2cd66e4e74c85fea6389f66fe1.camel@linuxfoundation.org>
In-Reply-To: <ef0f940014c41b2cd66e4e74c85fea6389f66fe1.camel@linuxfoundation.org>
From: "Samuli Piippo" <samuli.piippo@gmail.com>
Date: Mon, 27 Apr 2020 20:35:02 +0300
Message-ID: <CABXoSoX--qaiLGJM0MJ2Uo=jZDd+Srav+-xaXb60PqtyVOm=Uw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gcc: make sure mingw builds use mingw32-w64 configs
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Samuli Piippo <samuli.piippo@qt.io>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 27 Apr 2020 at 17:51, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2020-04-27 at 16:13 +0300, Samuli Piippo wrote:
> > meta-mingw is using Mingw-w64 but the host triplet does not match
> > the expected pattern. config/os/mingw32-w64 enables more features
> > that were not working with mingw32.
> >
> > Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
> > ---
> >  meta/recipes-devtools/gcc/gcc-9.3.inc         |  1 +
> >  ...nfig-os-mingw32-w64-for-mingw-builds.patch | 36 +++++++++++++++++++
> >  2 files changed, 37 insertions(+)
> >  create mode 100644 meta/recipes-devtools/gcc/gcc-9.3/0040-Always-use-config-os-mingw32-w64-for-mingw-builds.patch
> >
> > diff --git a/meta/recipes-devtools/gcc/gcc-9.3.inc b/meta/recipes-devtools/gcc/gcc-9.3.inc
> > index b0411078d3..4c8275bf2a 100644
> > --- a/meta/recipes-devtools/gcc/gcc-9.3.inc
> > +++ b/meta/recipes-devtools/gcc/gcc-9.3.inc
> > @@ -67,6 +67,7 @@ SRC_URI = "\
> >             file://0037-CVE-2019-14250-Check-zero-value-in-simple_object_elf.patch \
> >             file://0038-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch \
> >             file://0039-process_alt_operands-Don-t-match-user-defined-regs-o.patch \
> > +           file://0040-Always-use-config-os-mingw32-w64-for-mingw-builds.patch \
> >  "
> >  S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
> >  SRC_URI[sha256sum] = "71e197867611f6054aa1119b13a0c0abac12834765fe2d81f35ac57f84f742d1"
> > diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0040-Always-use-config-os-mingw32-w64-for-mingw-builds.patch b/meta/recipes-devtools/gcc/gcc-9.3/0040-Always-use-config-os-mingw32-w64-for-mingw-builds.patch
> > new file mode 100644
> > index 0000000000..5a167f252c
> > --- /dev/null
> > +++ b/meta/recipes-devtools/gcc/gcc-9.3/0040-Always-use-config-os-mingw32-w64-for-mingw-builds.patch
> > @@ -0,0 +1,36 @@
> > +From 052f7e5db0d793155015530b639c4e42d37eb7eb Mon Sep 17 00:00:00 2001
> > +From: Samuli Piippo <samuli.piippo@qt.io>
> > +Date: Fri, 23 Aug 2019 10:10:43 +0300
> > +Subject: [PATCH] Always use config/os/mingw32-w64 for mingw builds
> > +
> > +Make sure we use the w64 version of the configs, since that's what
> > +meta-mingw is using.
> > +
> > +Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
> > +---
> > + libstdc++-v3/configure.host | 12 ++----------
> > + 1 file changed, 2 insertions(+), 10 deletions(-)
> > +
> > +diff --git a/libstdc++-v3/configure.host b/libstdc++-v3/configure.host
> > +index 155a3cdea..adbda8784 100644
> > +--- a/libstdc++-v3/configure.host
> > ++++ b/libstdc++-v3/configure.host
> > +@@ -277,16 +277,8 @@ case "${host_os}" in
> > +     os_include_dir="os/hpux"
> > +     ;;
> > +   mingw32*)
> > +-    case "$host" in
> > +-      *-w64-*)
> > +-        os_include_dir="os/mingw32-w64"
> > +-        error_constants_dir="os/mingw32-w64"
> > +-        ;;
> > +-      *)
> > +-        os_include_dir="os/mingw32"
> > +-        error_constants_dir="os/mingw32"
> > +-        ;;
> > +-    esac
> > ++    os_include_dir="os/mingw32-w64"
> > ++    error_constants_dir="os/mingw32-w64"
> > +     OPT_LDFLAGS="${OPT_LDFLAGS} \$(lt_host_flags)"
>
> It might make things a bit more obvious and upstreamable to just change
>       *-w64-*)
> to
>       *-w64*)
> if I understand correct?

With meta-mingw, the host triplet is actually either
i686-pokysdk-mingw32 or x86_64-pokysdk-mingw32, depending on bitness
in the SDKMACHINE value.
