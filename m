Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.29.1621359049681033533
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 May 2021 10:30:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VfRZ7H33;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: armccurdy@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id m11so15268348lfg.3
        for <openembedded-core@lists.openembedded.org>; Tue, 18 May 2021 10:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ea0RkAzxYYh6n8xeTVEMjFxdX67tPOQiuENTxVBFq4w=;
        b=VfRZ7H33zPcaGRV+s14KEkMym+o3h1h2HaLEyalbHl2ZQbdPBFnQbJwoBeeZYFIADN
         3ZLH7RQB1Yk2MlzegSfd92aNYn8aKduP+1DItSQuXz2PcK66iIP/p2epkqa4S4xkPkmG
         /w16oMSk7PnVt8P/9PssvuCBDFVBZBh+actdDtpG1q7BUeT+HeD0bWCqlbgsq2LrLB5u
         vtFbPpWLF8UXicGJff1LSRw3i8JfRH+unUq06TWDDbEt5+VYRsslpisiuBw+I9R5lzFS
         pIDuWfcDkNPPhpUdO8eo0eq+3X7chxQyD+LiiHYzL/J4vFhABhpPdu/WmWf60w8L2tSM
         lBEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ea0RkAzxYYh6n8xeTVEMjFxdX67tPOQiuENTxVBFq4w=;
        b=FbBw2hmY8psoZixFr9oO0OCAPbTcS3V4x3U7LkfRtXdj3VPL9imXedc1noAncnHuim
         502WRxNIk0AisLzUT0pj95bwty71E432IjL8qx3zDE12SUPh/BMj0oXHGIuxpkOgSFTU
         NL7SYS2QX2jgJ5dfbpz8nop1PL/HJ4PRtvDRjmG0mDUa0Fv3SKDCH/qvymc2JS/uYXMx
         rNjL5ya0CXck6MxWp3EE46BklaT7zxjTt3v3ZX7QT01vAtGIMAWR68ab7scVO24Zo/0f
         v7lOF9MzfaGHB5M5EcRK1t1/XeCqi1nnbiXTddTeEZjpUXjDtjh7Oqq/B6E/hd2+MCud
         +eAA==
X-Gm-Message-State: AOAM533p/gOjIdlz0Yc9aFn15bHSvVQ2LVh5ZV/5zrJeLKqBxX/83GaF
	LQ4Bi4DuH6tjQqk9smCW2NdsYBp+HCRCawS5sC0=
X-Google-Smtp-Source: ABdhPJyVjxcH/JgpDHvqi7Ewc+8L0cpHtPrXeSaLGqgmGLgu7FGtwmE2px7cc7kQooRz5aO+RjKdqI9nQfiMTaHEM3M=
X-Received: by 2002:ac2:528d:: with SMTP id q13mr5175777lfm.73.1621359047831;
 Tue, 18 May 2021 10:30:47 -0700 (PDT)
MIME-Version: 1.0
References: <6d91cd1-9948-23e-1d73-e3eb2b73adbc@crashcourse.ca>
In-Reply-To: <6d91cd1-9948-23e-1d73-e3eb2b73adbc@crashcourse.ca>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Tue, 18 May 2021 10:30:36 -0700
Message-ID: <CAJ86T=X0PPWp=rwiOsvJFuNoiBRxFS-of1jXxxfT6DD21E8AMw@mail.gmail.com>
Subject: Re: [OE-core] how to create debugfs while ruthlessly stripping image contents?
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, May 18, 2021 at 10:00 AM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>   muh colleague just presented me with the following ... until
> recently, build was properly producing bootable image while
> simultaneously creating companion debugfs. so far, so good.
>
>   then enough packages were added so that image didn't fit in target
> eMMC, so decision was made to strip bins and libs in ${D} image/
> directory via sneaking the following into do_install_append():
>
>   ${STRIP} -p --strip-unneeded ${D}${bindir}/*
>   ${STRIP} -p --strip-unneeded ${D}${libdir}/*

Did that actually help with the image size?

> as soon as this kicked in, the complaint was that numerous objects
> were now missing from the debugfs, and i *suspect* (working to
> confirm) that, having stripped all those binaries and libraries before
> the packaging step kicks in, a lot of stuff that would have ended up
> in the debugfs is now bypassed since it lacks the appropriate
> debugging info anymore.

Yes, if you remove debug symbols before packaging then they won't be
available to put in the -dbg packages.

>   i'm looking at the various variables to see what would support:
>
>   1) stripping image-bound bins and libs, while
>   2) retaining debugging info to build debugfs

Isn't that what happens by default?

> a stack overflow page suggests something like:
>
>   INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
>   INHIBIT_PACKAGE_STRIP = "1"
>   DEBUG_BUILD = "1"
>   EXTRA_IMAGE_FEATURES_append = " dbg-pkgs"

This came up on the list a few months ago. Enabling every possible
option somehow related to debug as advised by stack overflow probably
isn't the best approach. You need to decide if you want to have
unstripped binaries in the image (in which case there's no need to
install separate -dbg packages in the image too), if you want stripped
binaries and -dbg packages in the image (in which case there's no
point trying to disable splitting of debug symbols during packaging)
or if you want debug symbols in a separate image / tar file (in which
case you don't need to change packaging or the contents of the main
image at all).
