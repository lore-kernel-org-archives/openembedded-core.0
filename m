Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web11.4513.1619738672550944870
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Apr 2021 16:24:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lLwJQRdl;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id v23so16973454qkj.13
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Apr 2021 16:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FHrQ+F99CIHDEM/hq3JhPW702ZNGypcCO0Ui0UmRYwc=;
        b=lLwJQRdlWLohfqwofT0SEYJgwvOluh9mp6RtXiLzcZKwuff3Q2p3F6OYWYM55EGvZN
         VfSt0S5lX7Bnetre6CN1jzkXUYno3/Y2gjuorzfc3lKX64m4m7o/jsgbbcbyhlRYaKh5
         M2fASU4oXiej3WYxasSMuvA4CE30viwkPwsOBv1iKoyCI4ReVzjy/umcOG02e7m833FA
         vYvDPj3XaomiRB+9wA1sHPCUXAXIJwafJAw47jH6e5XY0DiM3vbUhFy+kfidB3xcW8ID
         WHmMaX/kGQKmiIqsUI2qhLUvY3o68qGFuCML4LjFOPIzG1u9nshg1D0At5FAfk7quAba
         9LyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FHrQ+F99CIHDEM/hq3JhPW702ZNGypcCO0Ui0UmRYwc=;
        b=e1E9vvKCip7C+XaEm2nv+I8GavDHczCK7Q53Jou504gVu5zfBrxjZiOjhv2cjPf/Dt
         VJSmT81jWNWl/wthFeWwbuoSUQ/NseNTDzqeW2QKeuyqmVtbVb2w2OSxqLSJfQO+5swD
         UGLMvkrptuMyReMBPGCxIcjYrvUSQzp1fa+z4hZp+yq64iqpKPf1D3bp2OKk5YrZBo0C
         6sPee5RxTIzrfz3b30FGHuYOjVaq3/mfEsjavdMr3AjrmtWCy+RsENlg84g/R1ph9UF9
         +ntJHFn4vx9XT20gZ9NZhriVQiOglzGEVmcEbzg2L6e/rWPED85mCX1z7ZiXji0kXXrB
         s2Vw==
X-Gm-Message-State: AOAM532dQrtjYPPJCWAHYU/Kla+T+MfvP7Dx6kuZ6y/N1bf1IZP14UxA
	VXjI43Vaumvh9/WA7Nd1YYsmWEFamxWCCuHVoOc=
X-Google-Smtp-Source: ABdhPJyLNKRPOMjbVoJHz8Bq7KtwyLMYZi7pXG6HeW9N6ynvhGpOnGQhfYCqWHBHw6XFwK3EQ/9d4vgg+ul/o3Cs1qc=
X-Received: by 2002:a37:9607:: with SMTP id y7mr2313153qkd.25.1619738671451;
 Thu, 29 Apr 2021 16:24:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210420182838.958151-1-raj.khem@gmail.com> <20210420182838.958151-2-raj.khem@gmail.com>
 <YIs5x0X89EfRXduW@piout.net>
In-Reply-To: <YIs5x0X89EfRXduW@piout.net>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 29 Apr 2021 16:24:05 -0700
Message-ID: <CAMKF1sr4MCyKV-YfEA7FwSwQXbJq7hHMOGuqYokYPgMX+WkQEw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] go: Use dl.google.com for SRC_URI
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Michael Halstead <mhalstead@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Adding Miachel as well.

this seems to be running
buildoptions.SourceMirroring.test_yocto_source_mirror selftest, which
AFAICT should force downloads from yp mirror only
when I check the YP mirror then this tarball exists there

http://downloads.yoctoproject.org/mirror/sources/go1.16.3.src.tar.gz

but problem is that its 0 sized.

Secondly I also see a bad checksum file there

http://downloads.yoctoproject.org/mirror/sources/go1.16.3.src.tar.gz_bad-checksum_b298d29de9236ca47a023e382313bcc2d2eed31dfa706b60a04103ce83a71a25

I am seeing that there are lot of *_bad-checksum_* files in YP src
mirror http://downloads.yoctoproject.org/mirror/sources/

Michael,

Can we delete these *_bad-checksum_* files as well as zero-sized
tarballs please?

On Thu, Apr 29, 2021 at 3:57 PM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Hello,
>
> On 20/04/2021 11:28:38-0700, Khem Raj wrote:
> > golang.org/dl is resolving to this anyway
> >
>
> Unfortunately, this is still an issue on the autobuilders:
>
> ERROR: go-cross-core2-32-1.16.3-r0 do_fetch: The URL: 'https://dl.google.com/go/go1.16.3.src.tar.gz;name=main' is not trusted and cannot be used
> ERROR: go-cross-core2-32-1.16.3-r0 do_fetch: Fetcher failure for URL: 'https://dl.google.com/go/go1.16.3.src.tar.gz;name=main'. Unable to fetch URL from any source.
> ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/a-quick/build/build-st/tmp/work/x86_64-linux/go-cross-core2-32/1.16.3-r0/temp/log.do_fetch.525
> ERROR: go-runtime-1.16.3-r0 do_fetch: The URL: 'https://dl.google.com/go/go1.16.3.src.tar.gz;name=main' is not trusted and cannot be used
> ERROR: go-runtime-1.16.3-r0 do_fetch: Fetcher failure for URL: 'https://dl.google.com/go/go1.16.3.src.tar.gz;name=main'. Unable to fetch URL from any source.
> ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/a-quick/build/build-st/tmp/work/core2-32-poky-linux/go-runtime/1.16.3-r0/temp/log.do_fetch.544
>
> This is fairly reproducible:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/85/builds/1404/steps/23/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/85/builds/1403/steps/23/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/85/builds/1402/steps/23/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/85/builds/1401/steps/23/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2076/steps/23/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2074/steps/23/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2070/steps/23/logs/stdio
>
>
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-devtools/go/go-common.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-devtools/go/go-common.inc b/meta/recipes-devtools/go/go-common.inc
> > index 39a681a712..c368b95b69 100644
> > --- a/meta/recipes-devtools/go/go-common.inc
> > +++ b/meta/recipes-devtools/go/go-common.inc
> > @@ -14,7 +14,7 @@ LICENSE = "BSD-3-Clause"
> >
> >  inherit goarch
> >
> > -SRC_URI = "https://golang.org/dl/go${PV}.src.tar.gz;name=main"
> > +SRC_URI = "https://dl.google.com/go/go${PV}.src.tar.gz;name=main"
> >  S = "${WORKDIR}/go"
> >  B = "${S}"
> >  UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.src\.tar"
> > --
> > 2.31.1
> >
>
> >
> > 
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
