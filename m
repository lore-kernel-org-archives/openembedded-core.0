Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC06DC3DA6E
	for <webhook@archiver.kernel.org>; Sun, 31 Dec 2023 14:34:54 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.220903.1704033292437398055
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Dec 2023 06:34:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lZhIB9Uh;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-50e7b9cca2fso5301644e87.3
        for <openembedded-core@lists.openembedded.org>; Sun, 31 Dec 2023 06:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704033290; x=1704638090; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hceppNlj+EZ8f12O56YWP+vODv3s2uGOEYzJebYrCbU=;
        b=lZhIB9UhjIrCRRi1wPBCqOLsjQgPF1VZfT2YP68BMtAVyyX0QTkq4myiZfmTN2U3aE
         N8NMh24cQR4pGO7xeq2PhVJ9tP7uji7tSUohl3EFa1oHQ5zn4DJyTRfJwDobPuQ2Ik+8
         2sT3VkRZfuKiAhC8PZM2XDYOpuakJgBKFUhfzGLIs+/Eb6O0Z9zLIqXTQdY8YXTqZBBK
         vTnxc0cuaHTP+z1OUBIZAnDNj1HKeV9xb0u7bx22gGuuiY/I2s8IZAs04yInwIbN24Tw
         z5e3C8PARbbnguM1ROvnR87QSl/hvhUpfWJKI3gPkoL5a5JtNGJi0t7kFlfQnTnQ8nSB
         fEoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704033290; x=1704638090;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hceppNlj+EZ8f12O56YWP+vODv3s2uGOEYzJebYrCbU=;
        b=GIce052A80krqzoGLAjoQ8c38iCfT4sAs9PnF7wBPDe6LaWLigkj8gOcZ2x3fmz0qz
         Tgz/OIAxZsLT0MbEu8/AnnOPUSfHegqIluBuuqvGmAbSqTqkB2OuWX5WNtAuPGuh6RI+
         e+YtTDjUUTZ2M5IDbbbNzDN1j4Gg6b+38SCivuD7I6xu0cR3bjjY5FpqWFiYi0UrEn7H
         cv54oKGUbgYtYksGjIqB1S2V9A2nVaFNnpIWs/7uuyWmuo6WwCFcn25p/+rm7rUwjHSv
         hzKO6UOeBQ/cCywwWIr989aUylMVW0VSzf1T219PEQO28i03i4YY6q40lVeLP+UJ3NVy
         kD9Q==
X-Gm-Message-State: AOJu0Yyh4I1IbYlxCgcURqHYcWrGFYOvsxM0lAztaQjPJZhyrZ/Ne0Gt
	rhasySRLyZ6z4bAzeV8TaSNYwOPNTPKmIJsMZYY=
X-Google-Smtp-Source: AGHT+IGPtzOHHrC+czHSK1gmYyX/jv3V5yvFUMXwnZUussxHmL0lSrl3S98dVw9ddw6FQRc1VAggWZj4sH4Nk13ksqg=
X-Received: by 2002:a05:6512:b0d:b0:50e:87d2:e2c9 with SMTP id
 w13-20020a0565120b0d00b0050e87d2e2c9mr4801299lfu.92.1704033289968; Sun, 31
 Dec 2023 06:34:49 -0800 (PST)
MIME-Version: 1.0
References: <20231230154953.8135-1-alex.kiernan@gmail.com> <20231230154953.8135-4-alex.kiernan@gmail.com>
 <0b857242f53a4350e85029306d308f570641fca8.camel@linuxfoundation.org>
In-Reply-To: <0b857242f53a4350e85029306d308f570641fca8.camel@linuxfoundation.org>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Sun, 31 Dec 2023 14:34:37 +0000
Message-ID: <CAO5Uq5Q6yAy-=c4R4d_LboRnW1BXCx-oArTkYTHN=hghaTcZ4Q@mail.gmail.com>
Subject: Re: [OE-Core][PATCH 4/4] rust: Upgrade 1.74.1 -> 1.75.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 31 Dec 2023 14:34:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193093

On Sun, Dec 31, 2023 at 2:23=E2=80=AFPM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Sat, 2023-12-30 at 15:49 +0000, Alex Kiernan wrote:
> > Drop backported musl fixes. Set `change-id` rather than `changelog-seen=
`
> > to fix build warning. Add fixes for 85c0ce24cc74 ("remap cargo
> > dependencies to /rust/deps") which otherwise cause build failures:
> >
> > > thread 'main' panicked at src/core/builder.rs:1795:26:
> > > std::fs::read_dir(registry_src) failed with No such file or directory=
 (os error 2)
> >
> > https://blog.rust-lang.org/2023/12/28/Rust-1.75.0.html
> > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
>
> Unfortunately there were rust reproducibility failures too:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/4170/s=
teps/12/logs/stdio
>

Thanks, that's useful.

Not sure why I didn't see that locally as on the face of it, it's
(mostly?) the build path embedded in one of the output files, but
there's a lot more in there that feels concerning too :(

--=20
Alex Kiernan

