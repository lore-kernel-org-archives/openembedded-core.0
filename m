Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3CCDC74A5B
	for <webhook@archiver.kernel.org>; Wed, 29 Mar 2023 15:08:06 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web10.382.1680102478265210111
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Mar 2023 08:07:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=C+ztbEeV;
 spf=pass (domain: gmail.com, ip: 209.85.167.182, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f182.google.com with SMTP id b19so11796974oib.7
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Mar 2023 08:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680102477;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JsS2gMbkOQ+RelhrUoLMHOznO7AgNFciJ20p/Ki5fNw=;
        b=C+ztbEeV29/hfetlwlQ2D3R9I4MaXrd4dMvQMxFHdkUKbGAWE3QE+qRZsn8RQuN2yj
         2hclALdLVVaHQxDNNGEFN2ozK9t3MzWa+t7Gt0ZN4YmKxx04w/J9pMOwxexJy2/4oXws
         HWyOSL7iPckBu1Hd/bbtUusUvPdH5emUqIHOM8xMlpcB7XLZPJsyU1jbqzHuXcJdN2i6
         fZHwQQTBXHm3Y6BphhiQcYpfMqAWzsRuTlW3CTYd05c5uwFCE2gpll3WMLTHR0UYI2gj
         6HeekesYT4GdUmYFgstxPFuiZU8RlJRnESkhElMdazUXcaBHIncSuMlrSjSnhoXyWyPE
         XCew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680102477;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JsS2gMbkOQ+RelhrUoLMHOznO7AgNFciJ20p/Ki5fNw=;
        b=WyNgsA+bnii+ub+FPfsFeGlnYzkrum8LEaKrS+vBWll3NpKpaGyY2hVvl3K8mbk75x
         g30/NICSePaQk0rJ/6OsLe7yFCH9E5R5ELKRABSM5jrApwaAxKYfbT1Kap7ascVj15RC
         mJ8f9/mX/4sQ6MLMLlk9kD/NpTOFb2JC5LuPqqYyjePmJ3Pp/eb7HsHMgI8U/nrBmD1Z
         eeOg3jI7EDozI5dk9+DKWfuKr83MUYf+3HneUtOMFheZrE2esj3SD3foYrNsGYD2lE54
         Yf1nVxAdC/qyk2iFU9S1f29omgPk/BMq6p5L55LGoD4ISvtpW9wVQ9SCvTp3uI4pxvhB
         8lHA==
X-Gm-Message-State: AO0yUKUyD2BSqkWjd5gxL48jDkutLMFo4iNAhWEpjKRsVsjseE4m9fhM
	cxcnbSAqSggZXESuQEkMWejauTZXvoQn7dtUgt8=
X-Google-Smtp-Source: AK7set/ob5J2GhY0dL1j8LuxRwwFCV/A5P5u/661gZ2ExHjQVtZ0l86CWwXug4dx51wEfHENzCxgiu9xwouV0+UA1LY=
X-Received: by 2002:aca:d7c1:0:b0:387:13ea:721a with SMTP id
 o184-20020acad7c1000000b0038713ea721amr5711771oig.4.1680102477306; Wed, 29
 Mar 2023 08:07:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230328214351.3666478-1-raj.khem@gmail.com> <CANNYZj8zb4PnnhFUpPKsmcWRHJjjv7ATWzi61EU+YuaJrNLGvg@mail.gmail.com>
In-Reply-To: <CANNYZj8zb4PnnhFUpPKsmcWRHJjjv7ATWzi61EU+YuaJrNLGvg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 29 Mar 2023 08:07:31 -0700
Message-ID: <CAMKF1spkAdAHgzRzKwsL_i6_a9NqsnP4Wybsw5=2zkpOmTq8PA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] webkitgtk: Fix build on 32bit platforms without
 64bit atomics
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Mar 2023 15:08:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179284

On Wed, Mar 29, 2023 at 1:38=E2=80=AFAM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Tue, 28 Mar 2023 at 23:43, Khem Raj <raj.khem@gmail.com> wrote:
> > +Subject: [PATCH] ANGLE: Remove static_assert for 64bit atomics
> > +
> > +This will make sure that it can be built on 32bit platforms e.g.
> > +mips32/ppc32
> > +
> > +This partially reverts https://chromium-review.googlesource.com/c/angl=
e/angle/+/4205892
> > +the suggestion to remove the assertion is from the author of the patch
> > +itself
> > +
> > +Upstream-Status: Inappropriate [32-bit specific]
>
> 32-bit specificity is not in itself inappropriate for upstream
> submission, can you please either submit upstream or open a ticket and
> refer to it in the patch?

did you read the message trail on the gerrit review I added to commit ?

>
> Alex

