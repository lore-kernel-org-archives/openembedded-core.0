Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C195AC4332F
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 20:04:52 +0000 (UTC)
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
 by mx.groups.io with SMTP id smtpd.web10.65278.1699301090011049595
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Nov 2023 12:04:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Rh1fkA5T;
 spf=pass (domain: gmail.com, ip: 209.85.166.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-35961c61febso13858405ab.1
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 12:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699301089; x=1699905889; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w81yOmmzadphgQC3ZKglGOdpi+sLiTwcs4rBIfCH7p8=;
        b=Rh1fkA5TCYyEulTlEqBG6n4Q7yzbM112CG/fOifr4sb6xBwy9KprHJd/6ZfpvP6izI
         EUkFMGsEnkAWFHeoLznh3nm3kZbLN/NEAydyAjWWJ0zdcCQy6w9ZCjxHul2d4bjpVoTC
         /hdV1ZnlivtjiDAvDNJBnwNTyoCVm2x37Ybv4Y8zKj3rPYDygEZIaXgOHYLnwEzLzQBu
         q8k1/gkeiceeUbe2WuvYuSsA76jxxoQc5J7wFAn5IQzG7nvPnwOQ03bcu67Hwmw7YvJ6
         qPqclSV4yRpsmrHb8vOGCS89TEYazTEGKPy7X3LETzIdg1J0oJtITgBN2nihuBoeBL+x
         cKrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699301089; x=1699905889;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w81yOmmzadphgQC3ZKglGOdpi+sLiTwcs4rBIfCH7p8=;
        b=sevdosFgBHlxGHE3h3TeJmplqLjWRvwDH12uUGY8btQVTNI3K+seqj4Klfz4zJRBgY
         mnGSgK7qDxzn40vezkpWJ3+e4d1lJgV6wHQbw4OWzpHPUSUFijERJmeeFNEOTSbFUWsj
         QFIGZt9fS/qF1xTtUmQLuX06EI8Gw14IAt2W43huHh15tCDDy12Rg1JLOnJI145FqMXS
         d6puGaVQEr1rDk+mYchUvaABAgtT8uVzrm+NKMB2xEXRe84AdJQzdngtTuirp9K0bAMM
         wVeWVh5jHwhGyWc1XBB0ARBHx/XjsgY1AQzHpG5CoZHSE5ubS8/QmfXoiXPBcwxU9Zec
         eJZA==
X-Gm-Message-State: AOJu0Yxp9cod/2mQaF4qXoAFZBycEBS7vEZa+O3VHtPqp/TRbWtCupXd
	aqGAmIonByhwb4XKAvsPNFt7ukNn0L7Di53hsFtKbulVIlubbA==
X-Google-Smtp-Source: AGHT+IFy9efrO0aBvJRJOM5r+IagYo4BI+CFGflD4GtfZIfVCPXx1ixWduFtqxoEfYUyQtNc3SXjlwpQ4eyL6mBJ7r4=
X-Received: by 2002:a05:6602:1504:b0:79d:8708:4d24 with SMTP id
 g4-20020a056602150400b0079d87084d24mr40773785iow.15.1699301089085; Mon, 06
 Nov 2023 12:04:49 -0800 (PST)
MIME-Version: 1.0
References: <20231106195219.3851918-1-max.oss.09@gmail.com>
In-Reply-To: <20231106195219.3851918-1-max.oss.09@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 6 Nov 2023 15:04:37 -0500
Message-ID: <CADkTA4PCD=g7fdu96K-yV=jrfGyP65yfhW1ByZR-kjNU=C4WQQ@mail.gmail.com>
Subject: Re: [PATCH] perf: fix build with latest kernel
To: Max Krummenacher <max.oss.09@gmail.com>
Cc: openembedded-core@lists.openembedded.org, mikko.rapeli@bmw.de, 
	Max Krummenacher <max.krummenacher@toradex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 20:04:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190247

On Mon, Nov 6, 2023 at 2:53=E2=80=AFPM Max Krummenacher <max.oss.09@gmail.c=
om> wrote:
>
> From: Max Krummenacher <max.krummenacher@toradex.com>
>
> Kernel 6.7-rc1 commit 02e85f74668e ("tools: arm64: Add a Makefile for
> generating sysreg-defs.h") uses files from arch/arm64/tools/,
> gen-sysreg.awk and sysreg.
> Without the files the build of perf fails independent of the used
> architecture (confirmed with armv7 and qemux86_64).
>
> As arch/arm64/tools/ has been added with 5.13 allow perf to build
> even it that directory does not exist.
>
> Add arch/arm64/tools/ to PERF_SRC.
>
> Fixes:
> | make[3]: *** No rule to make target '.../qemux86_64-tdx-linux/perf/1.0/=
perf-1.0/arch/arm64/tools/gen-sysreg.awk', needed by '.../qemux86_64-tdx-li=
nux/perf/1.0/perf-1.0/tools/arch/arm64/include/generated/asm/sysreg-defs.h'=
.  Stop.
> | make[2]: *** [Makefile.perf:456: arm64-sysreg-defs] Error 2
>
> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> ---
>  meta/recipes-kernel/perf/perf.bb | 5 +++++
>  1 file changed, 5 insertions(+)
>
> Hi all
>
> I see some other options:
> - drop perf support for kernels<5.13 and simply add to PERF_SRC
> - drop the bb.fatal in favour of continue and simply add to PERF_SRC
>
> Any comments?

I just ran into this myself while updating linux-yocto-dev

What you have is better than either of those options, but different
from what I was working on.

perf already uses KERNEL_VERSION, so I was adding some KERNEL_VERSION
specific sources and only copying them when they match.

I'm concerned that skipping or always allowing files to not exist will
lead us to more subtle errors with invalid/incorrect kernel source trees.

Another idea I had is to just skip if sources don't exist (like we do in
devsrc), but bb.warn so the user is aware.

Bruce

>
> Thanks.
> Max
>
>
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/=
perf.bb
> index 675acfaf26..dae9320169 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -117,6 +117,7 @@ EXTRA_OEMAKE +=3D "\
>  # honour a JOBS variable.
>  EXTRA_OEMAKE:append:task-configure =3D " JOBS=3D1"
>
> +PERF_SRC_OPTIONAL ?=3D "arch/arm64/tools"
>  PERF_SRC ?=3D "Makefile \
>               tools/arch \
>               tools/build \
> @@ -127,6 +128,7 @@ PERF_SRC ?=3D "Makefile \
>               tools/scripts \
>               scripts/ \
>               arch/${ARCH}/Makefile \
> +             ${PERF_SRC_OPTIONAL} \
>  "
>
>  PERF_EXTRA_LDFLAGS =3D ""
> @@ -162,6 +164,7 @@ do_install() {
>
>  do_configure[prefuncs] +=3D "copy_perf_source_from_kernel"
>  python copy_perf_source_from_kernel() {
> +    sources_opt =3D (d.getVar("PERF_SRC_OPTIONAL") or "").split()
>      sources =3D (d.getVar("PERF_SRC") or "").split()
>      src_dir =3D d.getVar("STAGING_KERNEL_DIR")
>      dest_dir =3D d.getVar("S")
> @@ -171,6 +174,8 @@ python copy_perf_source_from_kernel() {
>          src =3D oe.path.join(src_dir, s)
>          dest =3D oe.path.join(dest_dir, s)
>          if not os.path.exists(src):
> +            if s in sources_opt:
> +                continue
>              bb.fatal("Path does not exist: %s. Maybe PERF_SRC does not m=
atch the kernel version." % src)
>          if os.path.isdir(src):
>              oe.path.copyhardlinktree(src, dest)
> --
> 2.35.3
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

