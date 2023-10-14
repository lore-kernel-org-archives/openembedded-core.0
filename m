Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6039BCDB465
	for <webhook@archiver.kernel.org>; Sat, 14 Oct 2023 14:30:59 +0000 (UTC)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
 by mx.groups.io with SMTP id smtpd.web10.65149.1697293851734836848
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Oct 2023 07:30:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Sp6Mhj3x;
 spf=pass (domain: gmail.com, ip: 209.85.166.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-7a2a3fb0713so112498239f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Oct 2023 07:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697293851; x=1697898651; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tOUGWhPGlzTJOsSZmVEgoAyf+sNbBGwuGcRFQtaPocs=;
        b=Sp6Mhj3x1SgOvvKwFHF5cp4SwalX5Wq+LoVzADmP/qWqSdUCKZcJObMf9yo3Vh0fM3
         8mg+mdkNO+MLUY4pH1qx78ZShSuL2vdvuJYu1dMPsjpPM447jZPr9M1idoXu/PyxS93I
         ED1qZG/2PM5+g58N91eGziGWzaSmq+m1kXVS+mHeyFVSBuvKfowDz4hg04hONdjEQn6e
         KPFCNAHt1v0Wrh+X70NTNNJidBUy3SZAz140DHUadRvmMIlhOtsiv22s0K09rzg4GG3p
         v6RkcR4diC27AykZIiJeOfYso46hgkBnnkjDKL7acIth76lLGYFS1z5qhGkor/6x5CqF
         hn3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697293851; x=1697898651;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tOUGWhPGlzTJOsSZmVEgoAyf+sNbBGwuGcRFQtaPocs=;
        b=aAjTLMMvRWI4zzpC3vx09YR3iNCtJTd2wi5LIywmE5+9C/S85sJWrxA5R/q5U5aGdu
         U8qZHFF4GJlGd9Baavgie7S/7NU/c1yk9n6HWJTXD6PSvN+JpzAa7Uw86QLiOM3GXkbH
         ioVXGBS9Pc1cB9hhtXA51g3nSiAuzTCaQVTc3tQuJ8vn8wrrWM9ZcuP6AHrnjc3o1Kc5
         d+GftMHpNfdbZEbKVrTVInTWp3a8igmtZ0BQHmUaV8SZ1BKiiTZXM1ESdRB7YY6v41eI
         g+WIG2umyQiS70zKfxYuLKsirEbAt2A//hwJaXqV2NDoRJdu9yd/9hNV1eEk0WBTjJTS
         gJjg==
X-Gm-Message-State: AOJu0Yxlj4rw7ERLAUq518ZoNNkPU0RjNh0FXn3nIFwyFky7v3F2c+xs
	teCClye8193fOurufaJ/DE7QLpxiipNy/hVBE4E=
X-Google-Smtp-Source: AGHT+IGNjcGV7c+8SfSeEz+R7EqStk9erclZpxmWYU7WhvmE1ly7HKYJOqTVZJYBdk9S9RYO2sFCahzlBsAEVw+FD/c=
X-Received: by 2002:a5d:9654:0:b0:77a:e86a:c24b with SMTP id
 d20-20020a5d9654000000b0077ae86ac24bmr31097225ios.6.1697293850805; Sat, 14
 Oct 2023 07:30:50 -0700 (PDT)
MIME-Version: 1.0
References: <20231014141442.6352-1-olivierdautricourt@gmail.com>
In-Reply-To: <20231014141442.6352-1-olivierdautricourt@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sat, 14 Oct 2023 10:30:48 -0400
Message-ID: <CADkTA4O7Lo2rvK1hao7f532RAD1WZgWjHr_1dzCB14Psr9VN3w@mail.gmail.com>
Subject: Re: [RFC PATCH] kernel.bbclass: make scripts_gdb when
 CONFIG_GDB_SCRIPTS=y and target is available
To: Olivier Dautricourt <olivierdautricourt@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Oct 2023 14:30:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189116

On Sat, Oct 14, 2023 at 10:14=E2=80=AFAM Olivier Dautricourt
<olivierdautricourt@gmail.com> wrote:
>
> Since Commit 67274c083438340ad16c ("scripts/gdb: delay generation of gdb
> constants.py") in kernel source tree (>=3DV5.1), scripts_gdb target needs
> explicit run to build scripts/gdb. (vmlinux-gdb.py script is used by gdb =
for
> linux kernel integration).
>
> As this step was previously not needed, this suggest newer kernels builds
> do not bundle it anymore, this change provides the same functionalities
> for kernels >=3DV5.1 .

It also suggests that very few people use the integration :)

>
> Signed-off-by: Olivier Dautricourt <olivierdautricourt@gmail.com>
> ---
>  meta/classes-recipe/kernel.bbclass | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/ker=
nel.bbclass
> index 2ec9ea2091..5206b4f2a7 100644
> --- a/meta/classes-recipe/kernel.bbclass
> +++ b/meta/classes-recipe/kernel.bbclass
> @@ -394,6 +394,9 @@ kernel_do_compile() {
>         for typeformake in ${KERNEL_IMAGETYPE_FOR_MAKE} ; do
>                 oe_runmake ${PARALLEL_MAKE} ${typeformake} ${KERNEL_EXTRA=
_ARGS} $use_alternate_initrd
>         done
> +       if (grep -q -i -e '^CONFIG_GDB_SCRIPTS=3Dy$' .config && grep -q -=
e "^PHONY +=3D.*scripts_gdb" "${S}/Makefile"); then
> +               oe_runmake ${PARALLEL_MAKE} scripts_gdb
> +       fi

We really try to avoid using any explicit checks for CONFIG_* in the kernel
classes or using them to coordinate functionality. While I don't think that=
 this
is a significant issue here (since what is being built is small and it
is isolated),
it is something that could be coordinated via a distro feature as the main
"on off" switch. We already have some debug distro features, and I could se=
e
this being something that could trigger when they are enabled (and for
kernel-yocto derived kernels, it could also ensure that gdb functionality i=
s
enabled via a fragment).

I'd also suggest that this could be placed into a separate task like we do
for modules. Again, the build here is small, but it is something outside of=
 the
core kernel build which is the purpose of do_compile in the kernel classes.
As a task, it also would be easy enough for other users to override if it c=
auses
them issues.

Cheers,

Bruce

>  }
>
>  kernel_do_transform_kernel() {
> --
> 2.42.0
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

