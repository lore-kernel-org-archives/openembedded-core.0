Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7D42C4332F
	for <webhook@archiver.kernel.org>; Thu,  9 Nov 2023 14:18:45 +0000 (UTC)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
 by mx.groups.io with SMTP id smtpd.web10.122172.1699539525011715163
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Nov 2023 06:18:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=doeUTFkp;
 spf=pass (domain: gmail.com, ip: 209.85.166.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-35930447ae9so3501455ab.2
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Nov 2023 06:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699539524; x=1700144324; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RTpvqDzuG6LfarOAmuH8Ldnn6R/5H1Jxqx43Ibbu6WM=;
        b=doeUTFkp9IyNffyBAS3rWAdohOUwFfOd/al3S6WlYGFhyoXXy87l6aCMrCCtM58sqL
         OO3yPUwwZMoZ0awp+pj3c2nF/RL/5nGAaGKPzwIvibJD6pYbUYkDJRP3yRZSXp1Z8ogV
         1gaLPNs2iOJMcjTSO1mTcllUrlV2dbkQj6YVKHAF8E15TrTsGgGLy01RzthnSaZHROhT
         DJRSx3QFOjwd5d0qSSq+ul7FPssY/S/taKrx48sHOZ0c4BZKMWkK609uGIij5bDqvqZZ
         2/x8B6t7HpmB6E+PDNdNpYwuqLPa0TTCi5aXxX3a/f9N/YoYJlpXSorU2bzwVNYtYkyf
         5SZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699539524; x=1700144324;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RTpvqDzuG6LfarOAmuH8Ldnn6R/5H1Jxqx43Ibbu6WM=;
        b=FTy9LkdhVN+tzS4sm+ahx94/U46i1TWSwQ2ktDai07wuL/4Ln7ZxFWORGArcvkoOYv
         tkZ2WRcZSgZB4CCK6yBGscCjxDUeTSoAtnbF1jBrd5SncX2eDG0AfrISQM2fhgkF8g6U
         Cds06PYd3ZGVhh/oarQyQ7EwcJqhdxqbDGFy3MDeGGxjmCsC0iw+5L2vVF6honEYdbei
         cM0IGCCYZGKV2hgPcH0HQBSh+/OD15jdc58azP3E1Gf05StwV5mJlPVIkDP0Y8Hf8vRZ
         5qhSivH3hjwt+oFLA2YyHkx5Z+TpR36n5ju/zfGqiG5l6lh7m1ePZVaDSVOB4vF+n/eq
         M4rQ==
X-Gm-Message-State: AOJu0Yz8F75EQsJFCx71mmYrO/yvZ0IfWB2WNz6PzA+Dtyk/GL53dDcJ
	3dFlND08r0fKDpf3C6l9VA807x7TXWrI4biBei0=
X-Google-Smtp-Source: AGHT+IEATaeEm5+NssBo5mhU6Ysu1du49/Odr08OJvRCALbk86srkUV1YgzqtzqgT2H90GwAQLj5jZTX4pPC9wr0d1k=
X-Received: by 2002:a05:6e02:b2b:b0:350:f352:4853 with SMTP id
 e11-20020a056e020b2b00b00350f3524853mr6576150ilu.25.1699539524162; Thu, 09
 Nov 2023 06:18:44 -0800 (PST)
MIME-Version: 1.0
References: <20231109123611.146694-1-peter.marko@siemens.com>
In-Reply-To: <20231109123611.146694-1-peter.marko@siemens.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 9 Nov 2023 09:18:33 -0500
Message-ID: <CADkTA4N6EBjEXN4ttCp_DuBMw8MfYqwCcRNuRgRzZujjQoK1DA@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] goarch: Move Go architecture mapping
 to a library
To: Peter Marko <peter.marko@siemens.com>
Cc: openembedded-core@lists.openembedded.org, 
	Joshua Watt <JPEWhacker@gmail.com>, Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Nov 2023 14:18:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190386

On Thu, Nov 9, 2023 at 7:37=E2=80=AFAM Peter Marko <peter.marko@siemens.com=
> wrote:
>
> From: Peter Marko <peter.marko@siemens.com>
>
> Other spaces uses the Go architecture definitions as their own (for
> example, container arches are defined to be Go arches). To make it
> easier for other places to use this mapping, move the code that does the
> translation of OpenEmbedded arches to Go arches to a library.
>
> (From oe-core rev: 3e86f72fc2e1cc2e5ea4b4499722d736941167ce)
>
> This commit together with meta-virtualization commit
> 115f6367f37095415f289fb6981cda9608ac72ff
> broke meta-virtualization master used with
> meta-lts-mixins kirkstone/go which is our primary
> usecase for having kirkstone/go mixin layer
>

I was trying to figure out the best way to address this issue
just yesterday.

If the patch is accepted for backport, then that's definitely
another solution.

Otherwise, I'll have to carry the meta-virt patch that I did
in nanbield on master until such a time as any branches
that will reasonably work with meta-virt master have the
go_arch library change.

Alternatively, I suppose we could trap the error and use
a fallback, etc, but I won't get complicated yet :)

Bruce

> Manually crafted since cherry-pick had too many conflicts:
> * different path to classes
> * additional architecture loongarch64
> * different way how to import library
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> Cc: Joshua Watt <JPEWhacker@gmail.com>
> Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
> Cc: Jose Quaresma <jose.quaresma@foundries.io>
> ---
>  meta/classes/base.bbclass   |  2 +-
>  meta/classes/goarch.bbclass | 27 +++------------------------
>  meta/lib/oe/go.py           | 32 ++++++++++++++++++++++++++++++++
>  3 files changed, 36 insertions(+), 25 deletions(-)
>  create mode 100644 meta/lib/oe/go.py
>
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index b15c5839b6..ee26ee5597 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -12,7 +12,7 @@ inherit logging
>
>  OE_EXTRA_IMPORTS ?=3D ""
>
> -OE_IMPORTS +=3D "os sys time oe.path oe.utils oe.types oe.package oe.pac=
kagegroup oe.sstatesig oe.lsb oe.cachedpath oe.license oe.qa oe.reproducibl=
e oe.rust ${OE_EXTRA_IMPORTS}"
> +OE_IMPORTS +=3D "os sys time oe.path oe.utils oe.types oe.package oe.pac=
kagegroup oe.sstatesig oe.lsb oe.cachedpath oe.license oe.qa oe.reproducibl=
e oe.rust oe.go ${OE_EXTRA_IMPORTS}"
>  OE_IMPORTS[type] =3D "list"
>
>  PACKAGECONFIG_CONFARGS ??=3D ""
> diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
> index 92fec16b82..394c0c5d84 100644
> --- a/meta/classes/goarch.bbclass
> +++ b/meta/classes/goarch.bbclass
> @@ -61,31 +61,10 @@ SECURITY_NOPIE_CFLAGS ??=3D ""
>  CCACHE_DISABLE ?=3D "1"
>
>  def go_map_arch(a, d):
> -    import re
> -    if re.match('i.86', a):
> -        return '386'
> -    elif a =3D=3D 'x86_64':
> -        return 'amd64'
> -    elif re.match('arm.*', a):
> -        return 'arm'
> -    elif re.match('aarch64.*', a):
> -        return 'arm64'
> -    elif re.match('mips64el.*', a):
> -        return 'mips64le'
> -    elif re.match('mips64.*', a):
> -        return 'mips64'
> -    elif a =3D=3D 'mips':
> -        return 'mips'
> -    elif a =3D=3D 'mipsel':
> -        return 'mipsle'
> -    elif re.match('p(pc|owerpc)(64le)', a):
> -        return 'ppc64le'
> -    elif re.match('p(pc|owerpc)(64)', a):
> -        return 'ppc64'
> -    elif a =3D=3D 'riscv64':
> -        return 'riscv64'
> -    else:
> +    arch =3D oe.go.map_arch(a)
> +    if not arch:
>          raise bb.parse.SkipRecipe("Unsupported CPU architecture: %s" % a=
)
> +    return arch
>
>  def go_map_arm(a, d):
>      if a.startswith("arm"):
> diff --git a/meta/lib/oe/go.py b/meta/lib/oe/go.py
> new file mode 100644
> index 0000000000..9996057f12
> --- /dev/null
> +++ b/meta/lib/oe/go.py
> @@ -0,0 +1,32 @@
> +#
> +# Copyright OpenEmbedded Contributors
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +
> +import re
> +
> +def map_arch(a):
> +    if re.match('i.86', a):
> +        return '386'
> +    elif a =3D=3D 'x86_64':
> +        return 'amd64'
> +    elif re.match('arm.*', a):
> +        return 'arm'
> +    elif re.match('aarch64.*', a):
> +        return 'arm64'
> +    elif re.match('mips64el.*', a):
> +        return 'mips64le'
> +    elif re.match('mips64.*', a):
> +        return 'mips64'
> +    elif a =3D=3D 'mips':
> +        return 'mips'
> +    elif a =3D=3D 'mipsel':
> +        return 'mipsle'
> +    elif re.match('p(pc|owerpc)(64le)', a):
> +        return 'ppc64le'
> +    elif re.match('p(pc|owerpc)(64)', a):
> +        return 'ppc64'
> +    elif a =3D=3D 'riscv64':
> +        return 'riscv64'
> +    return ''
> --
> 2.30.2
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

