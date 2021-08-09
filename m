Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web09.21693.1628510003733471144
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Aug 2021 04:53:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=Rys5CR/z;
 spf=pass (domain: burtonini.com, ip: 209.85.221.54, mailfrom: ross@burtonini.com)
Received: by mail-wr1-f54.google.com with SMTP id n12so10979800wrr.2
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Aug 2021 04:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sNpFj/9d+2u9wwHH2XPoOGxd+CbbR2ii0K73klvyfAQ=;
        b=Rys5CR/z6ewZer4wXanjVqFKM6qY33FOF3b6HYN6k9UP4+zhWs6CVLGC6hEpESyJ+7
         iwKcU2Dl71ITMn095PTjoiiBYV3o8LtszjDDeiJQgUf5KUlEo6T34xv7ZmHSYV1Cn1jD
         +4M7oTlkhFuD9zDMlQnPuixzCsm4Ls2QB93uNfITGvTRMjGvXlLo3OF4kfeThQojRGM6
         t35scnlmOfpwm8F/bwta1aWDgRAXuACh2zdmCFtAbspHZaZh6GWDRILTC4X6HOZ/nPh2
         pMAHcqwurx0JbiGbvOyZFDvvGA5FxbCmrpSfW3Nf6qG4d7NY9Qj8t2CAKfJcAi3qyA0I
         qaoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sNpFj/9d+2u9wwHH2XPoOGxd+CbbR2ii0K73klvyfAQ=;
        b=iHipSn31Cr0i0i3Rb6SYpHoBLrH3iMBlPPwTw1tf2Aucpeci3iUrla3i7Bto6afeWV
         Tspltbzi+tjnPGNpXO5Vvrxje9f6o6AmrSFIqpidsEmdVSKyOAz/pKrAZJnYAkTt9+sG
         IO52GAoirybvXCsA/HWK2i/scK7ZWTPQOT8jpo4847+bywIEsliBx9s3PIRuVglodTNG
         uu9g3oQGyR29kZkbaemlyg5PMytSQk1WDUGdsI/ObKbgwh8EfMk5N0kTcGW0K6MFn17H
         JNS7n15E5HHBbC9jB+c5x6XQIXKhqF5BThzGC/q+23Ijs08qUxYX+/JOQ527+omQHv1A
         uj2A==
X-Gm-Message-State: AOAM532shNTHqOiuhJT8QIwrZNOdjQRAPuuxFzPppjFCyhwd6/oLlDEX
	ZC9wy8C2NdnIIkcDq/bn6gGOhiUPtnKppAl9J/ZlIg==
X-Google-Smtp-Source: ABdhPJzu96W7n0gKB1SLJPkjggPJ7O/d3sl3/TooGY1iJ6Rnr8mhrO8locnR1+7k+cbEbqAJNEzxwRJPZg+i5qPSTQY=
X-Received: by 2002:a05:6000:9:: with SMTP id h9mr10785185wrx.396.1628510002018;
 Mon, 09 Aug 2021 04:53:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210721135458.427938-1-ross.burton@arm.com> <54d3039017ea1c3931551bb2ed22f23e14640b32.camel@linuxfoundation.org>
In-Reply-To: <54d3039017ea1c3931551bb2ed22f23e14640b32.camel@linuxfoundation.org>
From: "Ross Burton" <ross@burtonini.com>
Date: Mon, 9 Aug 2021 12:53:11 +0100
Message-ID: <CAAnfSTtRvVYeD2+BdRWv5LLxnJgCOZhXxAgnB5vKJX7aD35=tA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] buildtools-tarball: add testsdk task
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Yeah not sure how that happened!

V2 incoming :)

On Thu, 22 Jul 2021 at 07:50, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2021-07-21 at 14:54 +0100, Ross Burton wrote:
> > Add a testsdk task, which is essentially the same as testsdk.bbclass but
> > the test case directory is changed.  This lets us exercise the
> > buildtools tarballs at build time.
> >
> > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > ---
> >  meta/recipes-core/meta/buildtools-tarball.bb | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >
> > diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
> > index b5dae176bf..67a6d81ddd 100644
> > --- a/meta/recipes-core/meta/buildtools-tarball.bb
> > +++ b/meta/recipes-core/meta/buildtools-tarball.bb
> > @@ -99,3 +99,14 @@ TOOLCHAIN_NEED_CONFIGSITE_CACHE = ""
> >
> >
> >  # The recipe doesn't need any default deps
> >  INHIBIT_DEFAULT_DEPS = "1"
> > +
> > +python do_testsdk() {
> > +    import oeqa.sdk.testsdk
> > +    testsdk = oeqa.sdk.testsdk.TestSDK()
> > +    os.path.join(os.path.abspath(os.path.dirname(oeqa.sdk.testsdk.__file__)), "buildtools-cases")
> > +    testsdk.context_executor_class.default_cases = "/home/ross/Yocto/poky/meta/lib/oeqa/sdk/buildtools-cases"
>
> This looks like a good idea, I'm happy to see it but I think the line above may
> need a small tweak! :)
>
> Cheers,
>
> Richard
>
