Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 116D0C4332F
	for <webhook@archiver.kernel.org>; Fri, 25 Nov 2022 11:49:58 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.45391.1669376996434711768
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Nov 2022 03:49:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cXuDiYdj;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id bp15so6468722lfb.13
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Nov 2022 03:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vXlG8tdrm0D9QG8i1Vg/SwNaHcMlTwer6quBSLYNyoI=;
        b=cXuDiYdjE4elW4sG8d2L1NWu5bzNDjigObdNPmLcleQmkawITcelGJKhZgDVzS1hZv
         B6vNZ0xvOUqcfNlWREKKfzXkdgTysa4eWFbfyl9jY9TM3ZbJtNeOArdZRu0Nu5VFvDGq
         Mue6cyPn1xDdOzwLSYbjwPAaWkeHEZSewoiL2lyCcIA5xkoIvW9oIcznzYS1MatydPFQ
         Jk8pc1ktVHf/lejlLnWAZRKNsk5xTpD/7zR6DLwMuv709c2tT7esWG2s3IaX5iHK8gX2
         awZutpBQHV5n9nInjOt1wzvUxuNFDCeDbBgWc6Mbng/ivZTGgRfB7gkQ08NHiMAvT9Wm
         nhcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vXlG8tdrm0D9QG8i1Vg/SwNaHcMlTwer6quBSLYNyoI=;
        b=om21xA+RDmazun89WeloVpuxfRrc8JpH8n5U59nLZZfFrCAU0nt2c2/OaNMLB5TLwP
         4UWQ2mund2mLiN//4/i6kl7yQLiD8zK/afrLrrxEZcbfoXD/QCkusUj/leSUt7guRcZi
         PDWwedDK7huTW+aOo5bh63Av9W/AmJ99PRA+kRKtosgjUaoo7R7BBvt4Uj61ngkOgdpC
         F+XVtK8ufTvKqz0IBrLEASqVuDJND/hzKGGXTUYAKHc5YSJusmBkfFItQ+xnw8NyMF6/
         Wzw2Ihur/aNybziODbYmKEo1wOW6bZq5bzSCzTUG0+2cunAJSRnPxQA6axOGSD+r5FBb
         /x2Q==
X-Gm-Message-State: ANoB5pkRlTWirmcLMexa3fNp/Gwu1xzVXsN+HXUBkBZvIORXCdBCY14i
	elcWu0JIPnHZ4VB0yM9A1pGgKoWyLRDRgLct/rM=
X-Google-Smtp-Source: AA0mqf42mPd7eyIfA5ZXEfB2V3m2GJaq8ZSNDYX0+RyfeQRyIoNFYg3xeVW0HqVfxQmApVXvDAeWi6nm2WQJXtI1Ius=
X-Received: by 2002:ac2:53a8:0:b0:4b1:5125:2f14 with SMTP id
 j8-20020ac253a8000000b004b151252f14mr6738149lfh.345.1669376994599; Fri, 25
 Nov 2022 03:49:54 -0800 (PST)
MIME-Version: 1.0
References: <20221120133122.2464634-1-alex@linutronix.de> <20221120133122.2464634-5-alex@linutronix.de>
 <fb9b0440c73d2d287b6dce447e652d7b0986c33e.camel@linuxfoundation.org>
 <CANNYZj-HbuCeOiK2yd_01ruShEg17J6yAKH2F4QTEp6hi9O+Pg@mail.gmail.com>
 <ab2f02ff2654669a3c0b26bf741514698966b292.camel@linuxfoundation.org>
 <CANNYZj8DcqqBFjBeLNsvhS-KbpzM1=hCeR=XL=FNwQV7=bBEUQ@mail.gmail.com>
 <860e71c1edb0e530899aa25c00722e7dc04acac6.camel@linuxfoundation.org> <172A8A8569CFF8A4.11309@lists.openembedded.org>
In-Reply-To: <172A8A8569CFF8A4.11309@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 25 Nov 2022 12:49:43 +0100
Message-ID: <CANNYZj9mvcwtmTREF44DVzJJMhpw3gvGYnyWUW2MpDzWKT4xfQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 05/17] unfs: update 0.9.22 -> 0.10.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Nov 2022 11:49:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173765

On Thu, 24 Nov 2022 at 15:08, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
> > Do we need special privileges to be able to run that?
>
> No, you only need to build meta-ide-support as the scripts take nfsd
> executable from sysroot of that (could be improved and available
> directly from qemu's own sysroot).
>
> Then it should simply work if you give the rootfs tarball as parameter
> to runqemu:
> $ runqemu tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.tar.bz2
> nographic kvm

I discovered that there is in fact a selftest for this:
https://git.yoctoproject.org/poky/tree/meta/lib/oeqa/selftest/cases/runqemu.py#n202

So I went ahead and fixed/cleaned up everything, so that no special
hoops are required, and things 'just work' by building an image and
then running runqemu, and the selftest is re-enabled and passes.
Patches are coming.


Alex

