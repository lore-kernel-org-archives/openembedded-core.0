Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5685ECD13CF
	for <webhook@archiver.kernel.org>; Mon,  2 Sep 2024 14:31:12 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web10.317.1725287467528619900
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Sep 2024 07:31:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VmKC/FdB;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2f3e071eb64so60774391fa.1
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 07:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725287465; x=1725892265; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8L3vbGn4i+n21mlAnglgkB+lvzuSWg8RkuzmAUWYNm0=;
        b=VmKC/FdB0kzOJPkalnq4NpblQ4WRuFECuGDmpmETNnnHHz/oEuoE8XbYltpUef/1lf
         ZslwD2jZdmWTTdUKKXXB6Bf/0nZ0aUPOf1V9Vc8bZYCVuk5uYNba/+ipgi1vMNBok7v3
         hy66qGC9qIpqcxtxe0AVTe3ksUZrPuRCdNDKG9niWNb1fzWBs+54R0oyKU5hkNQnuwlj
         UWidHBxxi1jSyIOxOdgrg51gmVpwdzmGyMmURHWNiQud5xlGRBqN6DwdMvachqtEIztc
         EkhHuZYAoKqfdNSE346AcEf2ZZ2y+yj+UsM09B4ywd+SxScVXuZLyBlcQ5r1jY2uPn99
         Vt1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725287465; x=1725892265;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8L3vbGn4i+n21mlAnglgkB+lvzuSWg8RkuzmAUWYNm0=;
        b=ufyxZwyaBdAq33AO0WGahOPDj6WnC9UOHv6BDT5JnX11y3GCFy4Wmsy2thaTWnxu/E
         AA7V+TdYPdA2DrgfMuL9BnfRfNzzkWPZ2cQDXBxm/aTGAKBnpUvXOmREYMEKQfMaXlnx
         OpMpDFAib02RLP+WJIFMX/fi4Z50b/Gdsm3CyBE2F4O8rM4/yOkIn9kSKh63cT4Hgiti
         FaR3la19DOcmu5735lSXWSXklZgHAvfbMrhOZReBItZ1bU8pM4RTg1TpqiPEBz2SkKBp
         NLOLC5AcwYTgfiQOUmUN65ser5htq+sKZsz3dr0HI2JNV3CzhTpAnuBgE12Ydhhw+eGN
         6z/g==
X-Gm-Message-State: AOJu0Yy8gDe/jQYw4t4EtXImnCo4fREaK6z1P/fnd8aJQ7YcDLdCveAD
	HOURHIJ1dt3XVzd0xYrYTT58YjS+t6ZNwPdyEwfINMY9HclM1Eo8cv4840paBGwLdFogFYkggf5
	qvOhohkzK/bCn9CZha4Jr1NwGrow=
X-Google-Smtp-Source: AGHT+IFzVYmdkGn/5BkHSclOYGMqxf4cEp3E0D9Teo8+84RSJabpUOmaeEfI+tNOxhYYbhg29jfBxzQ5UlCAtGCNLJ8=
X-Received: by 2002:a05:6512:159d:b0:52f:cd03:a84a with SMTP id
 2adb3069b0e04-53546bde0f1mr8697449e87.39.1725287464720; Mon, 02 Sep 2024
 07:31:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240902105825.40177-1-mikko.rapeli@linaro.org>
 <20240902105825.40177-3-mikko.rapeli@linaro.org> <CANNYZj-cgTaKagNxx2mxTkPsp4U-JNNGrruUDUSPbn_cFz6+nw@mail.gmail.com>
 <ZtWgPF0JN4uyjU1u@nuoska> <CANNYZj9ke4yEQh0hAxk4fUazaEzQMP7JUKv6LYRv16CTwXpqFQ@mail.gmail.com>
 <ZtWuxNNd9KNxT4T3@nuoska> <CANNYZj-uXEDm2CuqtorwdZNABaZNPm4UtOFZvw4wMXdjhh+0ig@mail.gmail.com>
 <17F16FAE8869E0F4.11433@lists.openembedded.org> <ZtXIY7nwRpNJSVmx@nuoska>
In-Reply-To: <ZtXIY7nwRpNJSVmx@nuoska>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 2 Sep 2024 16:30:53 +0200
Message-ID: <CANNYZj8rA+unjecEiofA3Ht94Y2mqBygLnBP-rWEeZPfEEq+Kw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] uki.bbclass: add class for building Unified
 Kernel Images (UKI)
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-core@lists.openembedded.org, 
	Michelle Lin <michelle.linto91@gmail.com>, Erik Schilling <erik.schilling@linaro.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 14:31:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204107

On Mon, 2 Sept 2024 at 16:15, Mikko Rapeli <mikko.rapeli@linaro.org> wrote:

> So, this is a wic image format specific re-implementation of systemd ukify.py script.
> Calling not systemd ukify.py but objcopy directly. No control over kernel command
> line, but could possible be added with simple patch. I don't see how to hook uki
> signing into the mix with custom keys. Maybe a post processing step to the .wic
> image build.
>
> Since this version is merged I presume ukify.bbclass will be rejected.

Not rejected per se; I would suggest that the existing wic
implementation is rewritten to use the class (and hopefully becomes
radically simpler and shorter)!

It's fine to not be entirely backwards compatible; this is master, and
we can break things.

Alex

