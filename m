Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E18BC4828D
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 23:27:07 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.8234.1707262020338497280
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Feb 2024 15:27:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J+KZGZQk;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2909a632e40so26003a91.0
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 15:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707262020; x=1707866820; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vglNMiF9A+fK8xhOiZ+gpJ4rgM79Sc9eXfGq5SEugww=;
        b=J+KZGZQkNn6+cbVBmsogzucdLo3G5PBrjXg6hghMZNNQj4rKMPLJVv0wRA8BKHZYB+
         BjVtXhcRJq1NBtdsxGaVX8ua/DBpy+iJNU2LWJA3yFqI/rhuVh2BjlZcKBV/lO6y0ORc
         1jq536e0WZv2czy2XLVhIX3PN2La35hkCCelOcp9yXGSkRrjzdFChIVWWrIWoLljTvru
         6CicQ7lw4/YuAsNxqzUcz7EtnpakeWhEa6zrq1QhKaUGeePeBdv8E/xZW9gq+cqrRIK/
         M5l8/nOgT3AVxxWVV16PRFDoxY3tNX78GnX+eHghoOecDoLH05/HsZuTE52YOSEOwH67
         +yqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707262020; x=1707866820;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vglNMiF9A+fK8xhOiZ+gpJ4rgM79Sc9eXfGq5SEugww=;
        b=ql0JsEwnmIxzzCDqREE2TYKEiTuIBygKn225rvuoVM0WUJr8Gcr/l7BHV+rg8RE0qL
         Yg8nG0ry8YNM6+cRz/r0bGXWDbQxrA8ytFwxeGyDrR3oPkD3KSjkddQM51nrhG+yxXoZ
         hgUTgxV1KvcoPEn+W0H/dGCr7zvWTljaLEe+M2nNka1lR/NUtTsgESYwtjsHlBkV/dj2
         6z6aqRUQRtHyuq/395tK5olaA8lNGG3U0BcQF/vBfHS3Bi/MzLNXxA57c0aKWcBDU+oy
         xGt+1pYfPX1b7Ri+Uoikj5FgHK1kn3kvt5+V1s/4hN+QUft4QwP160a6tCEW6UQCDUQu
         axgg==
X-Gm-Message-State: AOJu0YyP6zp8lM6m32coW7T8k9QOQ5BkftgTGRgn5c1H9M69KK2Rmxxm
	M0yQ9m0oQwzaagPG6DEq735JMwWM7NHrRRzKzly1S0mPoxF3XFqN1AX0btzT56Yj0+O5C0a+sMX
	TKIy/bkUzeJZk+e9+qhTAvRfxbVg=
X-Google-Smtp-Source: AGHT+IEPQtvcHCotKtax7Aor15p3TcPFAV2TonlelqOuSvlCTyB0qVXKv2rXfgaULvKKoHUMcpZqe179FEQzglu7+F0=
X-Received: by 2002:a17:90b:350c:b0:296:c1a:f651 with SMTP id
 ls12-20020a17090b350c00b002960c1af651mr1060566pjb.36.1707262019544; Tue, 06
 Feb 2024 15:26:59 -0800 (PST)
MIME-Version: 1.0
References: <20240206184941.748116-1-raj.khem@gmail.com>
In-Reply-To: <20240206184941.748116-1-raj.khem@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 6 Feb 2024 18:26:51 -0500
Message-ID: <CADkTA4PBvG6GS33KpYpJxeDJjHMLqZo3P6b-VGrR2f408oKGqQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] kernel-devsrc: Add needed fixes for 6.1+
 kernel build on target on RISCV
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 23:27:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195035

On Tue, Feb 6, 2024 at 1:49=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote:
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-kernel/linux/kernel-devsrc.bb | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-ke=
rnel/linux/kernel-devsrc.bb
> index 9c3c09e7144..07a20feb8ef 100644
> --- a/meta/recipes-kernel/linux/kernel-devsrc.bb
> +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
> @@ -224,10 +224,16 @@ do_install() {
>         if [ "${ARCH}" =3D "riscv" ]; then
>              cp -a --parents arch/riscv/kernel/vdso/*gettimeofday.* $kern=
eldir/build/
>              cp -a --parents arch/riscv/kernel/vdso/note.S $kerneldir/bui=
ld/
> +                 # v6.1+
> +                 cp -a --parents arch/riscv/kernel/asm-offsets.c $kernel=
dir/build/
>              if [ -e arch/riscv/kernel/vdso/gen_vdso_offsets.sh ]; then
>                      cp -a --parents arch/riscv/kernel/vdso/gen_vdso_offs=
ets.sh $kerneldir/build/
>              fi
> -           cp -a --parents arch/riscv/kernel/vdso/* $kerneldir/build/ 2>=
/dev/null || :
> +                 cp -a --parents arch/riscv/kernel/vdso/* $kerneldir/bui=
ld/ 2>/dev/null || :

I'm just off a flight and running on very little sleep, but I can't
tell what changed in the line
above here.  Is it whitespace ?

> +            if [ -e arch/riscv/kernel/compat_vdso/gen_compat_vdso_offset=
s.sh ]; then
> +                    cp -a --parents arch/riscv/kernel/compat_vdso/gen_co=
mpat_vdso_offsets.sh $kerneldir/build/
> +            fi

I realize I have a mix of conditionals and ||: in the file, but we've
been doing most of
the new additions without conditionals. Would the
gen_compat_vdso_offsets.sh copy
work in that style ?

i.e.   cp -a --parents
arch/riscv/kernel/compat_vdso/gen_compat_vdso_offsets.sh
$kerneldir/build/2>/dev/null || :

Bruce

> +                 cp -a --parents arch/riscv/kernel/compat_vdso/* $kernel=
dir/build/ 2>/dev/null || :
>         fi
>
>         # include the machine specific headers for ARM variants, if avail=
able.
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#195016): https://lists.openembedded.org/g/openembedde=
d-core/message/195016
> Mute This Topic: https://lists.openembedded.org/mt/104203996/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [br=
uce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

