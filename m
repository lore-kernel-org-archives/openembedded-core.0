Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 132C5C25B74
	for <webhook@archiver.kernel.org>; Sun,  2 Jun 2024 09:40:39 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.55740.1717321232129794642
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Jun 2024 02:40:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GBWuLsOb;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: dbaryshkov@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a690161d3ccso6310366b.2
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Jun 2024 02:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717321230; x=1717926030; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rQiyxuf9V5r4LUpjaoZ7qMw82CFeGkRn0Rp09B71pxs=;
        b=GBWuLsObmxm+sPBK3SlS+nzcTQVJJ/10V/wcPf6N6PmRGEp5pxQqmC8Z8BuDO/G0uM
         i12KtHNv0T2z0krEOhFFoXmxVvo1bEqwSCTvUhjW3G8hUiX6pCYXrkrrkRVm3tPxqzvu
         uPQvolr1GB/ehvLiO6+X0ypvbO6JYPgL1JMUr7T32ywNpSGT/tjF1g1gavzKExGo2wFh
         atMtg/u5Iri1tVT6zAnTcA4II5Xk0hkEfu2OWRUL3TKNoPLdqJXX0G2HMlV1GkPkFQpe
         RnzlRVS8js4XBW30c8AgIcZJSkjqzcdrNoCSCOqQQKE/1THnjEGdyRxoTDnVLgELYJu8
         me5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717321230; x=1717926030;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rQiyxuf9V5r4LUpjaoZ7qMw82CFeGkRn0Rp09B71pxs=;
        b=Oqkj9emQEn/FlCJItjzXBbZ5EM/9mXQS/3/XhSMGHKO9kGLAKcQ1GDt2VaPeROMiCK
         mTeQ6cMRIebP8upksJO+ZV06Es2zgSBNyiFgfkk8yiBZ4AqUIUXcXkpjsXjAwtESgB/y
         RqhPgiGKTWwYOc96MSaE43t9BVUrX+xNPTmH+Q51LDNUPolo8fkaOU87zTXkojOg2EXE
         Yv1/3soFiLpiQTxJUao2ZmmLHHA2j3jTg8RZotg+tDAQnNLcEOvdYPG1TctamIy7WC7h
         LoxWzZur+qK9YOZM8/Sr9CNxVZDoEFKovPrj5TU5JexwsgTPDpSJXFZ0W8Ip4UyGt2uC
         llqg==
X-Gm-Message-State: AOJu0Yz1mowD6uzC7ZHG1/CyMBZ1jMLcvQ65o8EEz6L0OlLzxWfvgk9j
	duMYsxTkMU9axp211GPG2D7n8/hnYlbjZgZX31h68LFhexWzwI8hoR6WGdt9nUm2GhtyAr3OZeR
	5S7H9XjTIratTSV30fCCnCV7izjU=
X-Google-Smtp-Source: AGHT+IEjVvVVydjBo0MY5ZEagJtvj95w3MAjMCcliMOxr/nWvzqhNPZ5a3tfeyMjImonLtG7JU3TTV2F3h1tc3/3kIg=
X-Received: by 2002:a17:906:7d4f:b0:a65:cea9:dd59 with SMTP id
 a640c23a62f3a-a68208f0fa9mr427394566b.33.1717321230259; Sun, 02 Jun 2024
 02:40:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240530164355.3294714-1-dmitry.baryshkov@linaro.org> <CAMKF1so3N92kUUnR9HACZYWw3YBq2P+fT5VPaLH_VMO5va-4zA@mail.gmail.com>
In-Reply-To: <CAMKF1so3N92kUUnR9HACZYWw3YBq2P+fT5VPaLH_VMO5va-4zA@mail.gmail.com>
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Date: Sun, 2 Jun 2024 12:40:19 +0300
Message-ID: <CALT56yMrhX6eOi+aZfMtOLq45GP+MnBpi_nCocLxgPwu1J8g1A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] site/x86_64-linux: add ac_cv_func_fnmatch_works
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Jun 2024 09:40:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200201

On Thu, 30 May 2024 at 20:41, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Thu, May 30, 2024 at 9:44=E2=80=AFAM Dmitry Baryshkov via
> lists.openembedded.org <dbaryshkov=3Dgmail.com@lists.openembedded.org>
> wrote:
> >
> > Other arch-specific caches have ac_cv_func_fnmatch_works. Add it to
> > x86_64 cache too, otherwise cabextract fails to build ([1])
> >
> > [1] https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/3=
893/steps/14/logs/stdio
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  meta/site/x86_64-linux | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/meta/site/x86_64-linux b/meta/site/x86_64-linux
> > index b9ee141fd5c5..ed9c88fa20f7 100644
> > --- a/meta/site/x86_64-linux
> > +++ b/meta/site/x86_64-linux
> > @@ -83,3 +83,6 @@ ac_cv_func__restgpr_14_x=3Dno
> >
> >  # cvs
> >  cvs_cv_func_printf_ptr=3D${cvs_cv_func_printf_ptr=3Dyes}
> > +
> > +# cabextract
> > +ac_cv_func_fnmatch_works=3D${ac_cv_func_fnmatch_works=3Dyes}
>
> I think it will be good to document the underlying reason for this test t=
o
> fail during the autoconf run. It seems to trying fnmatch replacement,
> but then fails to do
> it properly.

Well, there are two issues there:
- testing whether the function is correct isn't going to work for
cross-compilation (including same-arch cross-compile). For this reason
we have ac_cv_func_fnmatch_works in several other site caches.

- cabextract's rpl_fnmatch being broken on glibc-based systems (the
file gets enabled, but then if GLIBC is detected the replacement
function is skipped).

While it might be worth patching the cabextract's fnmatch.c (I'll look
into it), a proper fix is to provide a cached value for the test,
which this patch does.

--=20
With best wishes
Dmitry

