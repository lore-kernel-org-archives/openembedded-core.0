Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F3FAC761A6
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 13:35:45 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.70552.1680528943194762970
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Apr 2023 06:35:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fD7hblTC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id r11so29363378wrr.12
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Apr 2023 06:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1680528941;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ev64PtOUS1h9KybnYdSJlGXscUFuXXdMzzfkcRjTlpk=;
        b=fD7hblTCUp5vBE0SApqWJk5dGOAqp//fTeU/fcZ5T64GynmIB3I9o1Rn4pSMLKgfgf
         K29IrMMsQqQlPgpKjt3ZtGyi2AS2XLEzZH3qpeOUoG+KhNfxVlQDqB0J3Or1PfsZyWmR
         d3qqOcoHpeRgOcM5YqUyiFSbZaxcf4SFZE8w8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680528941;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ev64PtOUS1h9KybnYdSJlGXscUFuXXdMzzfkcRjTlpk=;
        b=VLGH84VJOjrUMloMOMmvRhcvXdaNfU8dnEA2e3d2nO5c9Yp1oyUUQut0adZIR7T75g
         d3iOIyAw4xgiOblecl+GKjf8tvwA95D8sJ1rAiEaJ7IAwNmyTtIOHgB4wbVKu68wN4/J
         ec6OEECO0Tr/I6NBzUQM7wVdFovkZ1XfumcEmLU6WjHXPHDuIZvjFxrlyXAnZV3xNcKs
         MWsneRtHVgkFZLQA6e3hv5Z1FgHpkXZfSlZn8AlIrtiQOSBTcWb8+O31xSEuuzVLp/4U
         RZqY+OixYksQjILY4IOang8zGnIU7IFOLnPiPxGFzGrK1ZGB1QRa8uVCOvO1Z7u0RSNg
         fohg==
X-Gm-Message-State: AAQBX9f1r1FBkgnyX2dyD8NXTZEM6PzRcPUkUQWbgfHsvkvJ+PGTsqP9
	3lcFeMM17PrxSpL8ZHLFOj6xYw==
X-Google-Smtp-Source: AKy350YRw+dhxp1VmQKLawmIvznsHFIwQxmFjh9vzuomi0UpAyd80L438D1x7aF+/ikppcM+9zespw==
X-Received: by 2002:a05:6000:1a43:b0:2e4:e538:c468 with SMTP id t3-20020a0560001a4300b002e4e538c468mr10123826wry.6.1680528941655;
        Mon, 03 Apr 2023 06:35:41 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7b4:9c72:6a4a:d9b8? ([2001:8b0:aba:5f3c:7b4:9c72:6a4a:d9b8])
        by smtp.gmail.com with ESMTPSA id y6-20020adff6c6000000b002ceac2ccc4asm9781025wrp.23.2023.04.03.06.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 06:35:41 -0700 (PDT)
Message-ID: <d5e1d50d126eadd0530c0513bc0b0f4c062c819b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH V5 6/6] cargo-update-recipe-crates: don't walk
 on the whole dir
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Frederic Martinsons <frederic.martinsons@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>, Alex Kiernan
 <alex.kiernan@gmail.com>,  openembedded-core@lists.openembedded.org
Date: Mon, 03 Apr 2023 14:35:40 +0100
In-Reply-To: <CA+cAkeonKef=fqSLAMh_0+KhbAH96CYUHPh1=AJY6c3J6UhZ0Q@mail.gmail.com>
References: <cover.1680190966.git.frederic.martinsons@gmail.com>
	 <6279ccad3163dca527872a9144d63fb8f07c6f0e.1680190966.git.frederic.martinsons@gmail.com>
	 <CAO5Uq5Sgt7EwB2DN_r2bB9nt7XQ_qi3SNrhbrVvB6Bru-XsjXw@mail.gmail.com>
	 <CA+chaQc24hyg7mTKA+BkeTSPBT3bnuc8K0NcUHVZFS8obXrYew@mail.gmail.com>
	 <CA+cAkerB9D=iztBn_VQDPQyDZUp5rMtfj=CwuU4aeFL=RDERbQ@mail.gmail.com>
	 <CA+cAkeobeK=g_oGJvOsLEMDtcuBVwrFKuyU6gR-z1GmB+Sv2Qg@mail.gmail.com>
	 <17514C0A502D4FD8.27612@lists.openembedded.org>
	 <CA+chaQc5OdQ3esOkDA=JkvuRGp9fZNjfscZFcvoqbimdak1BfQ@mail.gmail.com>
	 <17516A1097F71BFB.12651@lists.openembedded.org>
	 <CA+cAkeonKef=fqSLAMh_0+KhbAH96CYUHPh1=AJY6c3J6UhZ0Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.47.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Apr 2023 13:35:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179633

On Sat, 2023-04-01 at 17:21 +0200, Frederic Martinsons wrote:
> Hello, I just submitted a patch inside the bitbake fetcher to display
> all the missing checksum at once instead of only one.
>=20
> For the moment, I have no better solution, let's see what bitbake
> folks tell us about that.

I'm fine with that FWIW...

Cheers,

Richard

