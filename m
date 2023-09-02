Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F990CA0FF6
	for <webhook@archiver.kernel.org>; Sat,  2 Sep 2023 09:49:43 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.5395.1693648181125096386
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Sep 2023 02:49:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KmSktphC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-31adc5c899fso2509471f8f.2
        for <openembedded-core@lists.openembedded.org>; Sat, 02 Sep 2023 02:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1693648179; x=1694252979; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MzIVybWwgUDGsKWpBvWubE+RI4VLO9dSu6uiwaOS9bM=;
        b=KmSktphCKjkRXCobqhtuMXHCEx9ksp8GFmKOAZocD1PsD8bkP4Fh98u9fixA1ZnjfG
         zP7pOMYKsGxVvmsWL6LS5paOXsqzwBo4dyHM5vpHNUhlZNSBWc1QQc/cpK7aWWYtRzcf
         NBI8eFFkx9YWpaZab916xezW941owSIFd4enQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693648179; x=1694252979;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MzIVybWwgUDGsKWpBvWubE+RI4VLO9dSu6uiwaOS9bM=;
        b=iHWWTdLioe6ne9oRs4BaHj/E2pEm/XDJp9GnW1Jn74SCHJiewdNKDaBmn4BcO5AdPm
         q7mEU7ELJTrCrKjrYYIUYOsAB5706+oGNUZfBpRb5eDYdPndzTe0wGi6Gc99+jf/SKro
         VIsJC44T3exH/4E1/UcF2TYwIhyWfL9nGy5dEvmjGV4jpQw6jQ3zuAAc6Lt2hX3C9FMm
         vJ4iCnPNeWI+JcE+/3u2AeAm7IcLU6xfDL8iFeq+YFmcTkphj2XW81GmUSGsLKZ2Z5dD
         jLUOsdmqjMEGbrs8uEaUFWX+wqj/EJqN+LQKWiuW7HDakUdnYxaHN10oeLt0xOgyXhAd
         oL5A==
X-Gm-Message-State: AOJu0YzhQlDfUyMcTqDPsWVKQ+Oj9+2fBK0XgPo1MLwdkHTMQZYeZnYL
	W84hL6krcPBOPpweu2F8ePAzVQ==
X-Google-Smtp-Source: AGHT+IEw3FCYgXxfrVUXdHyhDT5QQyDe741nRls2tWIz1H9W5RG3GmoxfRj2Mb5XztLBww8CQZmPPQ==
X-Received: by 2002:a5d:50cf:0:b0:317:6e08:ed35 with SMTP id f15-20020a5d50cf000000b003176e08ed35mr3598503wrt.1.1693648179369;
        Sat, 02 Sep 2023 02:49:39 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:bb30:48fe:2031:d024? ([2001:8b0:aba:5f3c:bb30:48fe:2031:d024])
        by smtp.gmail.com with ESMTPSA id x3-20020adff643000000b003188358e08esm7897258wrp.42.2023.09.02.02.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Sep 2023 02:49:38 -0700 (PDT)
Message-ID: <9983d99e808e55c85aa8265d1c2e348ba260f33f.camel@linuxfoundation.org>
Subject: Re: [OE-core] rust: why is it built in do_install()
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>, Alexander Kanavin
	 <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Sat, 02 Sep 2023 10:49:37 +0100
In-Reply-To: <lypm31exp8.fsf@ensc-pc.intern.sigma-chemnitz.de>
References: <lyjzt9g8e8.fsf@ensc-pc.intern.sigma-chemnitz.de>
	 <5c1df1490ce569e7644d33b33b2a44cd42dfc270.camel@linuxfoundation.org>
	 <CANNYZj8jxOoj0sta7rp5EZdBqR=HX6hs45e6Co5znRzBLkyrRQ@mail.gmail.com>
	 <lypm31exp8.fsf@ensc-pc.intern.sigma-chemnitz.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Sep 2023 09:49:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187026

On Sat, 2023-09-02 at 11:22 +0200, Enrico Scholz wrote:
> Alexander Kanavin <alex.kanavin@gmail.com> writes:
>=20
> > Any changes would have to fulfil this:
> >=20
> > 1. Rust's installation procedure should run under pseudo, e.g. in
> > do_install.
>=20
> The current recipe does *not* run installation under pseudo
>=20
> > rust_do_install:class-target() {
> >     export PSEUDO_UNLOAD=3D1
> >     rust_runx install
>=20
> Only class-native runs under pseudo (or is pseudo automatically disabled
> for this class?).

pseudo is disabled for native.

Cheers,

Richard

