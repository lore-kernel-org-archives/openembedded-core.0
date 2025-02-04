Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EC8FC02193
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 17:53:49 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web10.123200.1738691626188442111
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Feb 2025 09:53:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=hWvqGuBZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.169, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6f6cb364c7fso32930797b3.3
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 09:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1738691625; x=1739296425; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2JwTTty9JQ8oADU5HC7spak5bR02fi44zy7qynERRTM=;
        b=hWvqGuBZMEUMNOE99AVgisKE2RitHpTrzoNe+DI+d6TwvMsG2uBW+QdcRfA5e4U4Ed
         ig9ReZMfCmthDCu8TVHfU/RcaYvj/rD/iv1xaaowd9QJw/1AA6sa5rdXiCExKsJ7kp5e
         0VlUf21CnkAz7b5U+SJrW1kv0+/F0Xrw6iP9yFQacn7WtahUsq2/b6ZX3Brcr0CjvjGq
         eKTrxUb/I6Xd8t9BueifWaxSiQKTPfGDn22RUjp7GxfPyXZXJrsjq3crLaTuVIDhjNmx
         26YWL+/EXBel1l+CgEDW7IIkQjqF0lICXrbDmJA7ZeprzN+g4buSnwEbYug3OlrV7ZmI
         khcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738691625; x=1739296425;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2JwTTty9JQ8oADU5HC7spak5bR02fi44zy7qynERRTM=;
        b=JbaEXoMYI4BHXaE4PSaOhucD452CxvQYcTrcY4JEJt+IwXbGyPI1GY71uZrT7Fkjlk
         5ozC9w8zPm6l0i+5O2ZTLRCX4f4mkYlMNFfARI+6YfezaKqaoWCPvtlUwwRLxEOY3iXC
         iXj8AS1PVT/AOWKuCPwgFm8rARxVMfjg+Yuo1K/6eZVYWJG/YgduVLbsC3Dvd+T4R9EI
         ouBqzXqo5c3eMUyb8TKt+ve0lFGt9RsZgkSOHD0aGMGUvVhwJZvr+elBEA168LdgC0DY
         Ccu67EXyUlNcD/RFjxXJyfyJMWqHjbwTV41u0YS1lXioszcqo6D17Cn0xcNdTQSNOB+i
         iXJQ==
X-Gm-Message-State: AOJu0Yw+g0KUoNK8tPRbZ40ernnZZjrdyREzeywj/QCrTw65roBB9kUf
	88dAsma9ODAH+Vqur472Dy6UxddL8hEzOXCsuZ77dorv4CKHv3SuVlBiwVIj6114VoT5lCGROSp
	5VeisxdPuJyTbg4jRIwxflauLlyFhPIP+xbInGQ==
X-Gm-Gg: ASbGncuFEIMxY09C6Qc+h5wF3xP853gc2H36BCvQcTmuRtrKsB/m9Rwg3An6K4HSsHC
	WSO9mMb7puAnXWVlfOG+zoqCjwsjwrxgOGMm0NWhlzYZfrIBJpTF/Oh81WsloUUGQtUbWAC2g
X-Google-Smtp-Source: AGHT+IHOcDVAjF3cN8TDcWNtWMHrYhAo6Wp3tcM5TNxwjW7WZGbFB7gN5P9aw8MrjKr6sNuGV8agX5XcNmBrJYV8qTs=
X-Received: by 2002:a05:690c:2007:b0:6f6:cd43:543c with SMTP id
 00721157ae682-6f7a8427fe0mr166761527b3.34.1738691625320; Tue, 04 Feb 2025
 09:53:45 -0800 (PST)
MIME-Version: 1.0
References: <CAOSpxdYfp_rjUkofvCQk6VFbJj8TkCv-eWjb=V5U5TavT++Pfg@mail.gmail.com>
 <7067.1738686633751194071@lists.openembedded.org>
In-Reply-To: <7067.1738686633751194071@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 4 Feb 2025 09:53:34 -0800
X-Gm-Features: AWEUYZknJfiv7Lr3a--nBVWrqWxgEnfRVhV_MzkBjo44Hdbpfs3gFGdtzDUv6Jg
Message-ID: <CAOSpxdYXfpROfknEGgNGdxmyfekOKgstxgOQZtvMuC015NPQuw@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH] gnupg: upgrade 2.4.4 -> 2.4.5
To: gudni.m.g@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex.kanavin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 17:53:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210817

On Tue, Feb 4, 2025 at 8:30=E2=80=AFAM Gu=C3=B0ni M=C3=A1r Gilbert via
lists.openembedded.org <gudni.m.g=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Hi Steve, It's not clear to me how this error relates to gnupg. It seems =
to be related to rust somehow. gnupg isn't mentioned anywhere in the log.

Understood, but without the patch I get an error free build, and with
the patch I get these errors.

I've tried twice with and without your patch, and the issue is reproducible=
.

I'm open to suggestions, copying Alex since he's more familiar with
building rust than I am!

Steve

>
>
> rust.RustSelfTestSystemEmulated.test_rust: FAILED (499.08s)
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#210811): https://lists.openembedded.org/g/openembedde=
d-core/message/210811
> Mute This Topic: https://lists.openembedded.org/mt/110922127/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

