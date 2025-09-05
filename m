Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BD2ACA1013
	for <webhook@archiver.kernel.org>; Fri,  5 Sep 2025 10:31:26 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web10.18252.1757068276733581441
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Sep 2025 03:31:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VJ6IKG/x;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-720f0dd2809so10548286d6.3
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 03:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757068276; x=1757673076; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CDwIzGJlxLdr/pDDSm/M9etCVuU8Fw9rt/9SqZ5VfGI=;
        b=VJ6IKG/xab1L6l9n6DuAxU8qKrlzjU7SWN9WlTpC9mM4BkeNF8OunGrftzvTGine0j
         ksZdq0Cl1m+ByufDZulSPlP0qeg1kOChDzR0Z+FFIkKsxYRZM8uz5Pbdxeo5NWl/zc9l
         rUBglh8dpnQCSRNo9Om7irTrkMvAESa03Gl6kwWsj4MOOdcuhAfgigHrBAUv+SBnV+ji
         HEn/ryxIhRRdPVVXkRF0GaFuBmmQlZ00z1DrBrWw3iSpwZhrJERnkGioPp5+Ns30hbR0
         IjlIwwTRbg8RpnFv3UndU8ZsdyNpO4M27UGq9+WItxXBfEgjuPOA/16YiGKRQLL7WFoz
         zt2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757068276; x=1757673076;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CDwIzGJlxLdr/pDDSm/M9etCVuU8Fw9rt/9SqZ5VfGI=;
        b=YAXnEGfozlChuz3prcjW1ATZAmrxIyfDcpZBNEFE+MJgHJrvPZ8fdCyk5GhzK/PGLK
         fO1HQoTOS597lI/bymVUIZWOzfWUdbM7EEPEDiAbvCdAinVJaQr/iNKsDtMyvZg9H+yz
         Q3hINF2LNCAoV2SpcXMFr/Estc6DyCSwqjCinLlLgtnFRUq/XsUR0DoDBKDYoysVJTcL
         DJvOxHvae3pan1CKAdVVGM9e0pp16mPsgg7jXEjOB3fr2i9kxGc7zvnFFod5oC3ArhC3
         a2YTx2MciuYzx+/k6ETdymrZkXYu5X0vYNMl5mySVRfGC7xd1/xO4dxlm7pKatLFAgkE
         qz6g==
X-Gm-Message-State: AOJu0YxSVCyyJSfzYDc2mE3GmgoA8Bsld/UZgErm3DMYzTwANnjN1Ki+
	jhvOhu3rMJcwo4xPY6aO/cVf55zxJjS1bJIEgezsTr40isaQKd6r5FWzBcNNwO8AUoeTmtzNqYd
	NPFLACrzXx1gEtJtW7iQssjHDLupNsXF6VA==
X-Gm-Gg: ASbGncuQ8jO11oAuxLcEM8GDmZaxTchrVQRVPCUQ2pEQmhW7L3ZAGD8h8GEqjIoY0aE
	LB56NEHE6CTZ67NOvgDnq637+esuLjcDTjs3Gogf/lamrkpvKmym59mq+wjPp/Ok2UFwfnoLRy3
	yO7OTag9gzE0rSn2MybZT3rHngJIIkICYpSTUv5VO49aAZ2ihXP0godoTfbb5tavCjHXsAxr0hy
	0tkG7wc6argz1pBy3V6TY66VakGmTSdLBPzUu89aRRy7veugfDLJQAVBixLUAbiDi0g7qhdSlki
	OxXupWK2wgfqhFAdKNZEm/KyxYQ4sba5C+zhPhZldsuA6cQkUqo=
X-Google-Smtp-Source: AGHT+IHgVUVBzrWj+l42m1EJM8v8mRgEmgxTZNgwt2T+y5hqWg62qOIlXc1nVq4eJEezZ4m5YXJfbpZxLfQGee20WMU=
X-Received: by 2002:a05:6214:769:b0:72c:cc04:c3b3 with SMTP id
 6a1803df08f44-72ccc04c482mr16871626d6.0.1757068275510; Fri, 05 Sep 2025
 03:31:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250903081113.3182850-1-haixiao.yan.cn@windriver.com>
 <CANNYZj9Qr7uy-bZGGEt23MWXHkX-fU3TYQc3WYoX3KEtTC9NtA@mail.gmail.com>
 <108f0edd-3a59-4b2f-86a0-7afc439c884f@windriver.com> <CANNYZj_z3UwqgYqmvUYBG+c2iANjib9=6CZYapi1zCjycN_4cA@mail.gmail.com>
 <e038f529-1c06-408a-8d28-b2ec6bc6d17f@windriver.com>
In-Reply-To: <e038f529-1c06-408a-8d28-b2ec6bc6d17f@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 5 Sep 2025 12:31:04 +0200
X-Gm-Features: Ac12FXxBtDnibwPotkaSFybujYa29o1gStrPxSSbIeb2reRtVH3HqF7GBR_5Z7Y
Message-ID: <CANNYZj-5sNQq04T5fBj92TSUDdcLT3+_u+uvDveO1g-ZJNL+wQ@mail.gmail.com>
Subject: Re: [oe-core][PATCH 1/1] environment.d-openssl.sh: fix unbound
 variable with 'set -u'
To: "Yan, Haixiao (CN)" <haixiao.yan.cn@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 10:31:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222981

On Fri, 5 Sept 2025 at 07:12, Yan, Haixiao (CN)
<haixiao.yan.cn@windriver.com> wrote:
> > Please describe how, and why you use set -u.
> 1.Generate the SDK =E2=80=94 bitbake -c  populate_sdk imageRecipeName
> 2.Install the SDK using the .sh script
> 3.Open a fresh bash shell - IMPORTANT
> 4.set -eu
> 5.source the SDK
>
> It was working properly before the commit
> https://git.openembedded.org/openembedded-core/commit/meta?id=3D8a7ec52e9=
b35654bee48cd948c6c34c63db3e265.

Thanks. But why set -eu is used to begin with?

Alex

