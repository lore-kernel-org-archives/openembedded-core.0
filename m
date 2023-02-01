Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29E44C38142
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 09:11:21 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.19010.1675242670676298231
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 01:11:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ToPzB1D2;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id v17so22368014lfd.7
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 01:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DVqR+3HDReb0OUPx7fGoPBAwWe5TY1hWXT5ACN/OxLM=;
        b=ToPzB1D2xuZBbwRxSM0gEKQ3Ewf8BhWPAT8szdepv/sEkQYNCm/VCf09E5GSg98sRw
         4QFarlpo3AHcu0AyXgd74mwb0Njvgx4EAKn9xHCGV8e+XD1WNaKxqlLge7yjdnRSbItm
         r6pE0NW1Xlm96l2mn8KpYIe+Uh/FkiQ0mlvD53R4LYJoM6xsXy9uen4xm6f48FOPusvK
         kG5/zvsCgdR5c7JwJ9oTyPD1uO3lblTfZR16CYKXnvadZXrB2dNOUf7NA7/orp4xomUa
         glEhqkByH7xMkNKYfeaa0eDnykx7uVpsCNHfRimE+rzHJ1vIDBf1PAn3fxtW+RS5UDaR
         VHBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DVqR+3HDReb0OUPx7fGoPBAwWe5TY1hWXT5ACN/OxLM=;
        b=M9859jzrBRK0AwPVbNGB6q6Tzija/o+mJgxO0Hul9KqH4LxZdivQyjwkCIwXBZGB3q
         djv49SXOhSsdQUl8KaHOErBexa+yYMVD+XwXNuDUXQ6MJwIB1nfspH29rY1D1XesSd53
         Lzpd1+7AFfJGoRF/ygZfV81LknsGG/h/+skFr7GfMgGl34BPbaMs9EQVTtevlgGE/1wz
         MzT9unZoRP9nTw3TK3aCeMLgo+Ql40uXDNW6umIPw9OcCpYp9yq0ptKbPnyGnkxMOL4j
         NoYONOmEY15DcuQcR/gnoujelZvlw9HX/2QmwYhWay3AeIo3veYvpVHbCvIaPt17wJnb
         SmNA==
X-Gm-Message-State: AO0yUKU7KHdiiEPHN+pTPqyrfAlvXqYE949TkdxRz7eW5x3aBdqmGDIz
	NldntjMedz4ffWfIOuuMdU+3GVpfkxoj9faRGDs=
X-Google-Smtp-Source: AK7set/Iy8Sc9CfRkyOShn04WU6gmleKLeTml2KCj/ytaSEaCXOQMYued+K6/atOU8c/ITUKfNBNA1/Sccy4flsqIrw=
X-Received: by 2002:ac2:43d0:0:b0:4d2:e530:d53c with SMTP id
 u16-20020ac243d0000000b004d2e530d53cmr233698lfl.8.1675242668271; Wed, 01 Feb
 2023 01:11:08 -0800 (PST)
MIME-Version: 1.0
References: <CANNYZj-CYSqWju0RbpDkDnpZ18k3qit8r2czQ1e3JoWLx2=1hw@mail.gmail.com>
 <20230126080308.auqnqs4t2rzrynog@serber-ng.hemma> <CANNYZj-htG+xS+fTiE8esuJ8B9DonHm5G+VfMxM7zOVTN6R-Tw@mail.gmail.com>
 <20230126120741.ukigfn7yshbaon6s@serber-ng.hemma> <CANNYZj8NY9RVd0wTxV97eiUvn8-vxGduVDEi_WSZuHMKi5R8=Q@mail.gmail.com>
 <20230130082527.jgp4m7uareflgbdv@serber-ng.hemma> <CANNYZj_=pLpH0+SVZE2DezpuPVkj2VjyteLKFYV_LuJYCPKZZw@mail.gmail.com>
 <20230130084934.rzncscvy3mmol4xc@serber-ng.hemma> <CANNYZj_HXLnhbv_97AcE050JY_QMnEsL-xSyo_MEUBte6qQQbA@mail.gmail.com>
 <20230130093253.gpiq3nozb2jodvrx@serber-ng.hemma> <20230131175829.xhe5jhicl77j4ole@serber-ng.hemma>
In-Reply-To: <20230131175829.xhe5jhicl77j4ole@serber-ng.hemma>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 1 Feb 2023 10:10:56 +0100
Message-ID: <CANNYZj93nkp01UVuVLLCXbyxEu1KZf3hV=Hr34Xsb-+ZyUhjxw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gnutls: add initial ptest support
To: Ravineet Singh <ravineet.a.singh@est.tech>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 09:11:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176527

On Tue, 31 Jan 2023 at 18:58, Ravineet Singh <ravineet.a.singh@est.tech> wrote:
> So, tried to add missing files via autotools-brokensep (not recommendded), but still some tests will not
> be possible to run since they are expected to be run via wrapper shell scripts. These are the test:
>  - system-override-curves-allowlist"
>  - system-override-hash"
>  - system-override-sig"
>  - system-override-sig-tls"
>  - system-prio-file"
> Giving up at this stage, don't really see a good way forward.
>
> I will post initial patch updated with comments you had before, in case someone else wants to look at it.
> I do understand that you may not want to integrate the patch.

The patch is fine, I only wanted to find out if additional tests can
be added with reasonable effort. If you say that the effort is not
reasonable compared to the outcome, then I trust that, and don't have
any objections to the existing patch going in. Just try to document
your findings (via comments in code or commit message) so that someone
can use them as a starting point later on.

Alex

