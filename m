Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E1B4C4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 13:08:34 +0000 (UTC)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
 by mx.groups.io with SMTP id smtpd.web10.10142.1699362511309463050
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Nov 2023 05:08:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fUjM+IlL;
 spf=pass (domain: gmail.com, ip: 209.85.166.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-7a66ff282baso144847739f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Nov 2023 05:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699362510; x=1699967310; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ol3urGFIlCCls7GJT/c4wQBkQe3HgV9xFYNkJMp8ufM=;
        b=fUjM+IlLdwkVIx3BrkY/tUN/U3/1wIXRB2VHbOXSDeAaIzCXwUFJdobdybG7Wu8U7U
         B3xx0JYkB5XnQbvNUaLn12KkXf5QWzqbVevv1Rawf+yF6LRHAI6QfmYGyxWe6gZa27DL
         UyAM7MrlwC2S0PrldU23GLtG6+yww0AnCuD6JbxdOnCv2CSDgtzqwRqWRtjJhe2FABjE
         E1Vzg83hDgwCbrtNGw5QYRtAO2pIFEO3onALbPuFlhm/rdeM9USfepCO0qenyjcjw2uF
         RFyFkrc/qUnWk9WRQ8gaZde48GCjkPJwKuMupAMuIuIeis1MpVhIRD/10XpckZOzc20z
         Czcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699362510; x=1699967310;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ol3urGFIlCCls7GJT/c4wQBkQe3HgV9xFYNkJMp8ufM=;
        b=XZ9TPBWfT9FkelL1w+Zlq28ZAjEqSoJOVoloNSjM06sQWIRRlEi4NBVgI6HWphxOJH
         Rq/5LlGUlSMArJdd43/Kx0yfcx+FxgRUS8ky/4yzsI8TZtjuoPhqqlB3UBZerw6WQSgt
         pbX1LODR630BfaZn1NdIasEnE1KZeq/lEG3xJ6pfOPxKFV86Mjeyge0cVSWpoU1VrX80
         ncJbKlXwK6YQJH1OOI6PCwPaeafq1Se0OCxV8Ptv173GTOjqDZQ06ssYdlwj4+BRRqku
         48m1L8Woe7VZggMexJdT1CjVfthd7Hfd+ziijvaL0njHDt2efdk5QUFJBwLi7zl4kWG0
         yOAg==
X-Gm-Message-State: AOJu0YyPIn8CVOgMpOvN6pcKlyXgFePQ/f+ainFSYdvSesH9pQK+1p+m
	n07W+QzdlYL/KnrqZQ2Wwf9BSHCiMetmhm5eqbSUlokpjL7yrw==
X-Google-Smtp-Source: AGHT+IEjvFP3+aNLJEflC7PEhGGvuknFLWxtzDPq2LQDhBFJkNYarLk3hCVKP9hCe30Jqn/ZjCBZJJz9bdxsnaX9Zw8=
X-Received: by 2002:a05:6602:3b97:b0:795:d33:861f with SMTP id
 dm23-20020a0566023b9700b007950d33861fmr2026052iob.6.1699362510520; Tue, 07
 Nov 2023 05:08:30 -0800 (PST)
MIME-Version: 1.0
References: <20231107090852.1478021-1-max.oss.09@gmail.com>
In-Reply-To: <20231107090852.1478021-1-max.oss.09@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 7 Nov 2023 08:08:19 -0500
Message-ID: <CADkTA4O3LARD-ZHatkpMCKK14PoUrR6bBuDfwXB4sJdwXGpxSQ@mail.gmail.com>
Subject: Re: [OE-core][Patch v2] perf: fix build with latest kernel
To: Max Krummenacher <max.oss.09@gmail.com>
Cc: openembedded-core@lists.openembedded.org, mikko.rapeli@linaro.org, 
	Max Krummenacher <max.krummenacher@toradex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Nov 2023 13:08:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190283

On Tue, Nov 7, 2023 at 4:09=E2=80=AFAM Max Krummenacher <max.oss.09@gmail.c=
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
>  meta/recipes-kernel/perf/perf.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> Changes in v2:
> - drop distinction between needed and optional files in PERF_SRC
> - allow all file paths in PERF_SRC to not exist, but bb.warn about them

Looks good to me.

Bruce

>
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/=
perf.bb
> index a392166e73..287d3e68f7 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -135,6 +135,7 @@ PERF_SRC ?=3D "Makefile \
>               tools/perf \
>               tools/scripts \
>               scripts/ \
> +             arch/arm64/tools \
>               arch/${ARCH}/Makefile \
>  "
>
> @@ -180,7 +181,8 @@ python copy_perf_source_from_kernel() {
>          src =3D oe.path.join(src_dir, s)
>          dest =3D oe.path.join(dest_dir, s)
>          if not os.path.exists(src):
> -            bb.fatal("Path does not exist: %s. Maybe PERF_SRC does not m=
atch the kernel version." % src)
> +            bb.warn("Path does not exist: %s. Maybe PERF_SRC lists more =
files than what your kernel version provides and needs." % src)
> +            continue
>          if os.path.isdir(src):
>              oe.path.copyhardlinktree(src, dest)
>          else:
> --
> 2.35.3
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

