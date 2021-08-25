Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.16471.1629904247779374758
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Aug 2021 08:10:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=u39jfXMz;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: andrey.z@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id i28so44203373ljm.7
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Aug 2021 08:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UZ2XGByHcwlz1gz/Dcyyzb3G3VwqxSONp8uXHnzUg68=;
        b=u39jfXMzUzT7W+aCP1lx11CqjYRsPI2+C5jZSf0a0Tkc/M26POZ8oIERrE8GKzcXc9
         wnshrsXxYAr3hbcUV0oCMAiStfKN2etlNrSKooTvAA0Oso11LYTIzmfe/ji/oZsn33dC
         +bpj54oTdkSZjCcv1wJVzUKHF4c0OzrQmRofSw3AmjkPgP8csSKRCvnQ2OpzyWwRg+A3
         Q3J47sPNDdfWb8cTu3ggO8V72JfHOldVLSfdxI0OCzvspVlfb+weTY7BbljyeT291ZAF
         I9Ac+pWuKOEAhkS3JNkFEeNlAw85whKGrIyYU+cDloYOkK0rA8RcF1ERsjqB3BRXIPO4
         k3og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UZ2XGByHcwlz1gz/Dcyyzb3G3VwqxSONp8uXHnzUg68=;
        b=NWVXsLrnOPBf9SDEbTr/w0S/xdkyzPqSvM9dXTOP7SEx0Jujia18me/07qWtxjqFS7
         U0S2/LPHIQhpUyhCY5RSvkUWgQ2Wb48ZnV/+Y7arCn748gC2lUTkfq1UL1UNIvfdY1kc
         mHiFgge4vf4wbh0v8/MAoZUs8EeBRAf/cOvZsEN1ffBoJEig0bN8W1yfGVxVvhq+WiWw
         CQTfUvRckAr7Hpsa348sQx371F9yqkFqzrowXuPabq8rhHfC8g0ZhT2ECOfktkltIFqQ
         WuEVZXVbXA7XBagSyT5ZvGc8lV+U5/aGaKjk+/1LEb0GzztyGNFy/xFiwOBOuy3XsbfW
         X1+g==
X-Gm-Message-State: AOAM533E3RuCqXwalWSfGuztJVTyLJMd8QVopy3g+ML/cW6q7AoBPnwI
	8EuIg8iJuMaEDzWB1kbDg/+H2dbluOXolFHzhKw=
X-Google-Smtp-Source: ABdhPJzQ+1CGaxCnrTPC/3GEMK9/BiVDHyJxGvfaX0QrQXe46iXcpOLk6uZqqOw6Xa+oGVKifwdnkc0e/gC4vB4up04=
X-Received: by 2002:a05:651c:a12:: with SMTP id k18mr15900656ljq.90.1629904245848;
 Wed, 25 Aug 2021 08:10:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210825132058.9396-1-pkj@axis.com>
In-Reply-To: <20210825132058.9396-1-pkj@axis.com>
From: "Andrey Zhizhikin" <andrey.z@gmail.com>
Date: Wed, 25 Aug 2021 17:10:18 +0200
Message-ID: <CAHtQpK6vD-_heumTGVJGUtHs2sXw0TJfKKvOLTjK_GEYGiV=FA@mail.gmail.com>
Subject: Re: [OE-core] [PATCHv2] lttng-modules: Make it build when CONFIG_TRACEPOINTS is not enabled again
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hello Peter,

On Wed, Aug 25, 2021 at 3:21 PM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch was updated
> with the 2.13.0 update (commit 5dad15af), but unfortunately it no
> longer did what it was intended to do. There is also
> 0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch, which
> was based on the former patch, but it too does not solve the problem.
>
> Unify the two patches, and actually disable building of the kernel
> module if CONFIG_TRACEPOINTS is not enabled, the way it was intended.
>
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>
> PATCHv2: Unify
> Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch and
> 0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch into
> the latter, and use that both with and without devupstream.

I've tried the patch on my end, but it seems as if it does not resolve
the build issue entirely.

Compile stage is skipped with the message:
"lttng-modules-2.13.0/src/Kbuild:5: The option CONFIG_TRACEPOINTS
needs to be enabled in your kernel configuration"
which is totally fine.

However, the install fails due to the do_install:append in recipe
contains following:
do_install:append() {
        # Delete empty directories to avoid QA failures if no modules were built
        find ${D}/${nonarch_base_libdir} -depth -type d -empty -exec rmdir {} \;
}

Since there was no module produced by do_compile() -
${D}/${nonarch_base_libdir} is non-existent, and find fails.

I was wondering if you've seen the same build failure on your end?

Also, if I explicitly check for folder existence like following:
do_install:append() {
        # Delete empty directories to avoid QA failures if no modules were built
        if [ -d ${D}/${nonarch_base_libdir} ]; then
                find ${D}/${nonarch_base_libdir} -depth -type d -empty
-exec rmdir {} \;
        fi
}

then package is built fine.

Wonder if you would want to apply it in your patch set?

>
>  ...e-missing-CONFIG_TRACEPOINTS-to-warn.patch | 25 +++++++++----
>  ...fail-if-CONFIG_TRACEPOINTS-is-not-en.patch | 37 -------------------
>  .../lttng/lttng-modules_2.13.0.bb             | 10 ++---
>  3 files changed, 21 insertions(+), 51 deletions(-)
>  delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch
>


-- 
Regards,
Andrey.
