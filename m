Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14110C433F5
	for <webhook@archiver.kernel.org>; Fri, 30 Sep 2022 17:09:31 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.web10.167.1664557760659193160
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Sep 2022 10:09:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mCJ1UVyQ;
 spf=pass (domain: gmail.com, ip: 209.85.167.177,
 mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f177.google.com with SMTP id j188so5391189oih.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Sep 2022 10:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=l3h3hcbjZbfyyLhfQFlG5Ikuh5xotLin7fz3g6waVaE=;
        b=mCJ1UVyQiiVDiStQA5AWLht4QUthliQSVyvCb3/k0MkRHO/m690GMcx21ty26ftusC
         +SDQ4y5pId4+f56cGCury49nCYMezkENLh42rrZ7+cnNWIlDBfWxrs97tXt6SYJX4aai
         STFFJZGyNCsyOvYbIvZfIHrof5HvS8xA7jDGsp9Tj+ic52ZwivypnQUc6U5ggmxx78YB
         8otsQvusmDabE2mgf1r0MmUoZK12ls10P9g4KcENQ/cmPGzu3BUxDIgJmEhczQjRw1vX
         Mm/nYLtidFf1KVy/N5VIQDvX9btlSm+Z0C7sQJk9vRIRD4khmBTT3RkawRYtKGuNV3Nn
         BXog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=l3h3hcbjZbfyyLhfQFlG5Ikuh5xotLin7fz3g6waVaE=;
        b=x52PhUWBFLzD8bAShNGX5B4AiG3IFxIdeC4MYrJEJ+HuriJs5DV8c5L0GAXTey9uZV
         ioIn58E/up5Djy3ljr4+pHRwvMKvGZAhP6uWuKfN5MwNZpYENtS7boOhoP6QuCBgi2d0
         oetsC5u9d4XTx6kEXbxYmnABc3fnr9jCk19GgaIGulcRbGI1evJwU8UPr85dBfC2SCl6
         o31JcttM/uGnKP1AyjNnKGLKLcGcJAY09n1Ld6NKCa++MZSMhjWqQoW7lvH05fNwrb4R
         DliGuyYtNbBIMwPg+2KBnYklV1oT3xyRDRz8H7uruLRQYvMsea1H9mGPEYEVWDMfpNic
         47PQ==
X-Gm-Message-State: ACrzQf3fwxIQFkJTVgkiVAxo371cNv+EhdZt7FY079uQG35TmfUcif/C
	bVInD1pzEHKMK/iJFwxF7SVnUW1anM3yqwd/t1KTBDXHTT8=
X-Google-Smtp-Source: 
 AMsMyM6QX5dfoYkllNfjv0c8GGfxI24uk01oJej4oV1YkA5x3FIHduWSnitEeGJG/ROkjZmPfJL+eFs/M0TJ+C8/+tI=
X-Received: by 2002:a05:6808:1988:b0:34f:de19:411c with SMTP id
 bj8-20020a056808198800b0034fde19411cmr9524827oib.262.1664557759976; Fri, 30
 Sep 2022 10:09:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220930041614.2704304-1-raj.khem@gmail.com>
 <C9A0CBAD-5373-4F4C-BB73-0AD10A2DF000@arm.com>
 <042F0314-BF16-49A5-AD68-81DFD17739E6@arm.com>
 <CAMKF1srZEorOx-hPiD1zZx1DMiJdZbHgknub04hfyfRFzEhNcg@mail.gmail.com>
 <EA0EFA99-9A83-4699-9D0D-AD5279C58B81@arm.com>
 <CAMKF1sqwQcT-vpk5Ycydd8BCk3OCmPP-zCKZ-MwRr0G+XPHHNA@mail.gmail.com>
 <01558808-3100-4CFA-98DB-244F487435D4@arm.com>
In-Reply-To: <01558808-3100-4CFA-98DB-244F487435D4@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 30 Sep 2022 10:08:54 -0700
Message-ID: 
 <CAMKF1sp=ujH14XbTybycQkJWaL93OMfm0dS6FvM_XR+K71EQaw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] openssl: Add missing perl module runtime
 dependencies for ptests
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Sep 2022 17:09:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171230

On Fri, Sep 30, 2022 at 10:01 AM Ross Burton <Ross.Burton@arm.com> wrote:
>
>
> > On 30 Sep 2022, at 17:42, Khem Raj <raj.khem@gmail.com> wrote:
> > > Good point I will check in think it worked fine with glibc but not wi=
th musl based images I see that Perl-modules is fully empty in packages-spl=
it area so soMething does not add up
> >
> > It will be empty as it=E2=80=99s a metapackage, but it should have lots=
 of rrecommends.
> >
> > Right that was the point the folder should not have been empty it shoul=
d have had those rdepends control files
>
>
> My perl-modules pkgdata built with musl:
>
> RRECOMMENDS:perl-modules: perl-module-cpan perl-module-unicore perl-modul=
e-b perl-module-compress-raw-bzip2 perl-module-compress-raw-zlib perl-modul=
e-cwd perl-module-data-dumper perl-module-devel-peek perl-module-digest-md5=
 perl-module-digest-sha perl-module-encode-byte perl-module-encode-cn [=E2=
=80=A6]
>
> Can you retest?  Unless you=E2=80=99re running in a no-recommends build I=
 can=E2=80=99t see how this can be.
>
> Arguably, perl-modules should depends on the packages, otherwise it total=
ly breaks in no-recommends environments.  If you install perl-modules you w=
ant the entire library, not just a fraction of it.

are you building with opkg ?

>
> Ross

