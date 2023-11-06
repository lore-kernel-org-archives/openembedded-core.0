Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25630C4332F
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 20:40:53 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.66481.1699303244409187249
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Nov 2023 12:40:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TS1TTtOh;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: max.oss.09@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-50970c2115eso1984495e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 12:40:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699303242; x=1699908042; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aq/5pqW0/MTsAFm61vlLFa1sw1UDg17CUBn4ZOlkhzw=;
        b=TS1TTtOhFY5zRFKnuYpKeVRifB8EPITwNbq0v4kecdRD9bXSNVxWyc65uXFQBH2qT5
         DJmn+aniJ1ZJWrwxlSEiLj15sFisD5PJL6+x/yAZcqMr6ReZqAOuNObZi9MEzFc0k7Y/
         w3vFN5kLaOFqsIReBPPn4RfHOyNtiuOcnET9lfvtk7kP1sCcThAf2LlKeStptgQFh5CH
         3IALw8Jn+kmx9RJkfbTt9RD+shem1hwqs8z481eSlShF64p57WTUv+eEnrmw8H633W8e
         o6oOWr9QiL7DVoILke/U4JKpDr8lvHN6+osqGj9TVHzfwinWuoQ/MNcVapt6uWcXAv/F
         +oMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699303242; x=1699908042;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aq/5pqW0/MTsAFm61vlLFa1sw1UDg17CUBn4ZOlkhzw=;
        b=pXRlCIertW0XFnkldv3EMEKjPT4n/EgKwGSEBVZyZLyOm+efE9rxb5RERn0pFciB/L
         awvtqjelgtrGhOkEwyy5J30ZVmhXJsN59VekCdlgYQJGkAUS81pUUFX9WJUQPHs2fhhE
         bGaplGNVh7m2NMGrICdwT0FPZY1ouRlo0vvRm8QemHtLXI7B1cFwupdkS9QdeXsCDvvn
         wPGzfF+dkP2xY1wfrJnzdqkl4v6QTGp/YWPMSzXZFWQwQNxeNlTxDtOjCQe5ljGpJwta
         lPzUpTZJWkRN0WXrYVdZV3RVvC8OKtRQv3Vgtm+X7Bb6LKLWtvQI2S227ZIEmGNDRDFV
         I3Yg==
X-Gm-Message-State: AOJu0YzvNAYEwDVblbDu7HvZCb4eZ2g1HlYT7fIvitbQtu9n3j9EsD+J
	ZQqrGxQMQGjDpgpN5oK0so4uL2l+qWnOHlrZi0U=
X-Google-Smtp-Source: AGHT+IHulKKIO1w2WSoC9eBmwpGcL8RIAXUt7kJLEXjN1kHLm2+bvQqnBJeuA8AKqMJPYW0SCZmwk5oKG52QFLDRa28=
X-Received: by 2002:ac2:4546:0:b0:507:9fe7:f321 with SMTP id
 j6-20020ac24546000000b005079fe7f321mr22643423lfm.54.1699303242067; Mon, 06
 Nov 2023 12:40:42 -0800 (PST)
MIME-Version: 1.0
References: <20231106195219.3851918-1-max.oss.09@gmail.com> <CADkTA4PCD=g7fdu96K-yV=jrfGyP65yfhW1ByZR-kjNU=C4WQQ@mail.gmail.com>
In-Reply-To: <CADkTA4PCD=g7fdu96K-yV=jrfGyP65yfhW1ByZR-kjNU=C4WQQ@mail.gmail.com>
From: Max Krummenacher <max.oss.09@gmail.com>
Date: Mon, 6 Nov 2023 21:40:31 +0100
Message-ID: <CAEHkU3XnQxE09di9HruWJoxprFddpX3KcW+2CMGZnWzD+uZvaA@mail.gmail.com>
Subject: Re: [PATCH] perf: fix build with latest kernel
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Max Krummenacher <max.krummenacher@toradex.com>, mikko.rapeli@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 20:40:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190248

On Mon, Nov 6, 2023 at 9:04=E2=80=AFPM Bruce Ashfield <bruce.ashfield@gmail=
.com> wrote:
>
> On Mon, Nov 6, 2023 at 2:53=E2=80=AFPM Max Krummenacher <max.oss.09@gmail=
.com> wrote:
> >
> > From: Max Krummenacher <max.krummenacher@toradex.com>
> >
> > Kernel 6.7-rc1 commit 02e85f74668e ("tools: arm64: Add a Makefile for
> > generating sysreg-defs.h") uses files from arch/arm64/tools/,
> > gen-sysreg.awk and sysreg.
> > Without the files the build of perf fails independent of the used
> > architecture (confirmed with armv7 and qemux86_64).
> >
> > As arch/arm64/tools/ has been added with 5.13 allow perf to build
> > even it that directory does not exist.
> >
> > Add arch/arm64/tools/ to PERF_SRC.
> >
> > Fixes:
> > | make[3]: *** No rule to make target '.../qemux86_64-tdx-linux/perf/1.=
0/perf-1.0/arch/arm64/tools/gen-sysreg.awk', needed by '.../qemux86_64-tdx-=
linux/perf/1.0/perf-1.0/tools/arch/arm64/include/generated/asm/sysreg-defs.=
h'.  Stop.
> > | make[2]: *** [Makefile.perf:456: arm64-sysreg-defs] Error 2
> >
> > Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> > ---
> >  meta/recipes-kernel/perf/perf.bb | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > Hi all
> >
> > I see some other options:
> > - drop perf support for kernels<5.13 and simply add to PERF_SRC
> > - drop the bb.fatal in favour of continue and simply add to PERF_SRC
> >
> > Any comments?
>
> I just ran into this myself while updating linux-yocto-dev
>
> What you have is better than either of those options, but different
> from what I was working on.
>
> perf already uses KERNEL_VERSION, so I was adding some KERNEL_VERSION
> specific sources and only copying them when they match.
>
> I'm concerned that skipping or always allowing files to not exist will
> lead us to more subtle errors with invalid/incorrect kernel source trees.
>
> Another idea I had is to just skip if sources don't exist (like we do in
> devsrc), but bb.warn so the user is aware.

I can change the commit to:
- just add to PERF_SRC
- change the bb.fatal to bb.warn with the existing error string
- add a 'continue' after the bb.warn

Does that sound like a plan?

Max
>
> Bruce
>
> >
> > Thanks.
> > Max
> >
> >
> > diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/per=
f/perf.bb
> > index 675acfaf26..dae9320169 100644
> > --- a/meta/recipes-kernel/perf/perf.bb
> > +++ b/meta/recipes-kernel/perf/perf.bb
> > @@ -117,6 +117,7 @@ EXTRA_OEMAKE +=3D "\
> >  # honour a JOBS variable.
> >  EXTRA_OEMAKE:append:task-configure =3D " JOBS=3D1"
> >
> > +PERF_SRC_OPTIONAL ?=3D "arch/arm64/tools"
> >  PERF_SRC ?=3D "Makefile \
> >               tools/arch \
> >               tools/build \
> > @@ -127,6 +128,7 @@ PERF_SRC ?=3D "Makefile \
> >               tools/scripts \
> >               scripts/ \
> >               arch/${ARCH}/Makefile \
> > +             ${PERF_SRC_OPTIONAL} \
> >  "
> >
> >  PERF_EXTRA_LDFLAGS =3D ""
> > @@ -162,6 +164,7 @@ do_install() {
> >
> >  do_configure[prefuncs] +=3D "copy_perf_source_from_kernel"
> >  python copy_perf_source_from_kernel() {
> > +    sources_opt =3D (d.getVar("PERF_SRC_OPTIONAL") or "").split()
> >      sources =3D (d.getVar("PERF_SRC") or "").split()
> >      src_dir =3D d.getVar("STAGING_KERNEL_DIR")
> >      dest_dir =3D d.getVar("S")
> > @@ -171,6 +174,8 @@ python copy_perf_source_from_kernel() {
> >          src =3D oe.path.join(src_dir, s)
> >          dest =3D oe.path.join(dest_dir, s)
> >          if not os.path.exists(src):
> > +            if s in sources_opt:
> > +                continue
> >              bb.fatal("Path does not exist: %s. Maybe PERF_SRC does not=
 match the kernel version." % src)
> >          if os.path.isdir(src):
> >              oe.path.copyhardlinktree(src, dest)
> > --
> > 2.35.3
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II

