Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96D5EC3ABBC
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 14:29:55 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.77182.1746541780687810519
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 May 2025 07:29:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=zWPxYmDj;
 spf=pass (domain: linaro.org, ip: 209.85.167.41, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54993c68ba0so7301712e87.2
        for <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 07:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746541779; x=1747146579; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X3mvJY3fDRj3b19i6RFFJCq5uILcKGorj59onvFRvO4=;
        b=zWPxYmDjDTuWgSe5D3jVavdH6ZNwjf/7ZrlgRS9A1MkoY6YnBiftnkIsXFPEwVXzGi
         sX8ZAEn6NxZVDf5f81Cv/WQBq02lNHAbElLzBOzKwt8tjYuAgDbver6O2jMeogc+xqcP
         xCQWP0WFbVXdRG5yITAcjOAI9jITzNgqwZ+EMh6/ferB/77ki32uTPpPuTA57RhnMDff
         oDhEft+BLuBTH04us1MXZODmY/83yUhm27idLsmaMV9++a7/HqX4YsztmwwbeHdr6pxV
         dMO6u5BWj48LJoZs57GI7Echq7faS/7xBVyzrab+TTU6skAj5vIcjKMSPDwkFdgg78Du
         BDzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746541779; x=1747146579;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X3mvJY3fDRj3b19i6RFFJCq5uILcKGorj59onvFRvO4=;
        b=IqnV10PUVAztU1gAX9LgrMyRomk/l5dLQOOIaDuYMFzfn5806m6ezDvQq0HN8toSOs
         DPVnYTNm69HdSIqUaxFc43KZD0yI+zUdLzGPPK7GAF5nY5h/jETSqnvtTSTC8ibbkDap
         X4sojVvmBaKb9ndn5UxhJBOJLuqA9ukL8NfdWvqqQU6Ardkoh+5XizDxX/0p7UBDWjv6
         ypjneOtwor8BvDZIl4I+1c9Zp6l/pYktn6FFrup98rV0WpBA74yMhzOuX28tFd5cP9iY
         QtDHujqQpW7pcxWec2q3Xgdzv0SNLN/uyPouvl1Y/60s6tKwyD4vXQm3UABNOyppPjHz
         zERQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjU/+zWn69V0hOXh/qgq4Kq2Io6xqB1H/JAqHf19k5psgYwNfTiQiwl69SLrwziGPDBa283zS9M3iud+OoR3zNnA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw4indV1mAdb3WfhBs5zIKbt58jxXGYrLU9lshuMT8jGMIovcLx
	ECjDNKMnbkyiMhhTNgdsUs8HgK7zgYmpD3YioaSS7ToVx2/5D+9cRE72foKyq/8=
X-Gm-Gg: ASbGnctcUI1s5po2o3nlNMAksu9NmLA5IBq9HmXqEYFXQ13BDmqWYcU9iDcw79ZfjIy
	DdJNAlo0Q6npwd8oYXzA5a1wTt9Iz4tyub246iTfnJF2sUsy4D2eGD2V8nzGUzaAXxFlzsUbBea
	tfkwt+vGeVVbkxfoca0T5+rQJe0VT1k1XyboGhnzRldHNbCo4wEc4wdZ/mCxnoO+TI3MpMGhAzc
	3INyGh1Fwz5XzUNEFbttXIqd0Yc2ws+xvO++qsXhAJThVn0ihjiyrEJsU1mb1cioP0QLi7x66aP
	YhKX/yvO1FtsW6ZDKC01TePzO7enVxi9KJtzppU/Ol56uMTZaAcnAicqVicdejMYPvHK0abv0Ns
	TgtR6oWzw
X-Google-Smtp-Source: AGHT+IHPqKYwb7bD8AYoepfBKUXgCj/lLOKPtamxePa5RFxQ0+sT4OjBpD+YLrE8jyZGxOoEX3IFJQ==
X-Received: by 2002:a05:6512:3d8e:b0:54e:85bc:d13e with SMTP id 2adb3069b0e04-54eac2430d1mr4709117e87.52.1746541778741;
        Tue, 06 May 2025 07:29:38 -0700 (PDT)
Received: from nuoska (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94f173esm2036366e87.164.2025.05.06.07.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 07:29:38 -0700 (PDT)
Date: Tue, 6 May 2025 17:29:36 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: raj.khem@gmail.com
Cc: max.oss.09@gmail.com, openembedded-core@lists.openembedded.org,
	Max Krummenacher <max.krummenacher@toradex.com>
Subject: Re: [OE-core][Patch v2 1/1] openssl: aarch64: configure with no-asm
Message-ID: <aBoc0JS4ChGaeMUU@nuoska>
References: <20250506141013.2600055-1-max.oss.09@gmail.com>
 <CAMKF1sq_F1iaRfkHyBgZuSC=9VUwHfQ1ZOjrrr9k8exfDaehFA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMKF1sq_F1iaRfkHyBgZuSC=9VUwHfQ1ZOjrrr9k8exfDaehFA@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 14:29:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216054

Hi,

On Tue, May 06, 2025 at 07:21:09AM -0700, Khem Raj via lists.openembedded.org wrote:
> On Tue, May 6, 2025 at 7:11 AM Max Krummenacher via
> lists.openembedded.org <max.oss.09=gmail.com@lists.openembedded.org>
> wrote:
> >
> > From: Max Krummenacher <max.krummenacher@toradex.com>
> >
> > openssl has a couple of functionalities which use optimized
> > assembler code. With no-asm these are replaced by generic
> > C code implementation.
> >
> > With GCC 15 OE by default uses the new AARCH64 specific GCS feature.
> > However the object files produced by the assembler are not marked
> > to provide the feature and consequently the produced shared objects
> > containing them also not.
> > The linker will warn when linking against such shared objects files
> > and, with all warnings are errors set linking will fail.
> > Without this patch systemd e.g. fails do_compile as it links against
> > libcrypto.so from openssl.
> >
> > To test what features an object file (or .so, .a file) has use
> > readelf -ln and check the content of .note.gnu.property, e.g.
> > libcrypto-shlib-md5-aarch64.o build from assembler source,
> > libcrypto-shlib-md5_one.o build from C source:
> >
> > $ aarch64-poky-linux-readelf -ln ./crypto/md5/libcrypto-shlib-md5-aarch64.o
> >
> > There are no program headers in this file.
> >
> > Displaying notes found in: .note.gnu.property
> >   Owner                Data size        Description
> >   GNU                  0x00000010       NT_GNU_PROPERTY_TYPE_0
> >       Properties: AArch64 feature: BTI, PAC
> >
> > $ aarch64-poky-linux-readelf -ln ./crypto/md5/libcrypto-shlib-md5_one.o
> >
> > There are no program headers in this file.
> >
> > Displaying notes found in: .note.gnu.property
> >   Owner                Data size        Description
> >   GNU                  0x00000010       NT_GNU_PROPERTY_TYPE_0
> >       Properties: AArch64 feature: BTI, PAC, GCS
> 
> Good find. I was suspecting something like that, what happens if we
> use compiler driver to invoke as assembler ?
> another way might be to add CFI directives in asm files, maybe just
> start and end
> foo:
> .cfi_startproc
> ...
>  .cfi_endproc

This may be needed in a lot of places...
 
> >
> > Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> > ---
> >  meta/recipes-connectivity/openssl/openssl_3.5.0.bb | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > For reference also refer to this thread:
> > https://lore.kernel.org/all/aBilFkr4HF-MSBd6@toolbox/
> >
> > diff --git a/meta/recipes-connectivity/openssl/openssl_3.5.0.bb b/meta/recipes-connectivity/openssl/openssl_3.5.0.bb
> > index 865e04deb220..d025fc3ff100 100644
> > --- a/meta/recipes-connectivity/openssl/openssl_3.5.0.bb
> > +++ b/meta/recipes-connectivity/openssl/openssl_3.5.0.bb
> > @@ -36,6 +36,8 @@ B = "${WORKDIR}/build"
> >  do_configure[cleandirs] = "${B}"
> >
> >  EXTRA_OECONF = "${@bb.utils.contains('PTEST_ENABLED', '1', '', 'no-tests', d)}"
> > +# aarch64 'as' doesn't mark objects to have the GCS feature, resulting *.so then produces linker warnings
> > +EXTRA_OECONF:append:aarch64 = " no-asm"
> 
> Does this disable assembly ? if so there might be a performance
> impact, it would be good to find that out.

Or security win? What does upstream recommend?

This GCS is now enabled with -mbranch-protection=standard. There may be more places
which need similar fixes/workarounds so getting this working automatically
would be better. Bug report to gcc?

I wonder if GCS should be disabled for now and use "bti" instead?

https://gcc.gnu.org/onlinedocs/gcc-15.1.0/gcc/AArch64-Options.html#index-mbranch-protection

Cheers,

-Mikko

