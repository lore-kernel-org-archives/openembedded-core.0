Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8527CC001B0
	for <webhook@archiver.kernel.org>; Mon, 14 Aug 2023 02:36:10 +0000 (UTC)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
 by mx.groups.io with SMTP id smtpd.web10.99603.1691980564447443483
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Aug 2023 19:36:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=m7qGE667;
 spf=pass (domain: gmail.com, ip: 209.85.166.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-77a62a84855so145572839f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 19:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691980563; x=1692585363;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gh43QbazChge3H+JeTg8PPruny1UcmYXNwkqns2QArA=;
        b=m7qGE667/d2N2ABCwxHRp507B2UlpGaYvxdOLhJA9zvSecjXy1TK9LJ4WCrWATbkTN
         2CC4MZTCYE/mD6Mh2Rp16LVjMpmYn9mZuv3WoGRX2T+b9yqGE3mYt2VeNpJkOp5PTJ2I
         fKbrM24OmWUThgdWv4gl6T0ycc6Xz8n5XoE73RxEcY13bzysSlFp8CYauAUOQwv3s2tO
         1CQsNJoiSomVmPLNM7ODnhOSwocqrykt+ymUZMTURlRedmv9hlapRV6b92TwIjKQLrA7
         S5n2rhLcJjU0a10flTSdE85zznjOvesKPmKmZoNgany5iWw22XWHP4ZX17NyAP1nHjn9
         btew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691980563; x=1692585363;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gh43QbazChge3H+JeTg8PPruny1UcmYXNwkqns2QArA=;
        b=PgTj3OhGaHN0qtLkLmScngbnEbNcmCvUKiBRAk766ik72m/83EnJwBmHNL0Ls46UxS
         YL/65y3NmigWGiz+fJ6y2P5foZYKqKcXDUAB1BIcHMRTrrS/P8U+uD3skZgtfOXvWtLL
         asxnDOw2gyi5HEL3o5DlWgEiimTF/5CLiu0bP4Qt9/zsFc+K0kfr6HCDFiJu8HBiA0mi
         TZnO/1d66Su/AFmgDbM3TzczsxQX8YndtJlqf3vzL23rsjMv0FesOMckBe1hSB/N5V6n
         4jmC5qPK6QgxyKquaMQAI62MhM1JhRGfTGp7r0qO1BzVr+4H8EEsCTRjfoWk5xLQYPiX
         V3xA==
X-Gm-Message-State: AOJu0YzlcNbCaR86W8Rqd32lODqu8eHoFc/Rn/t0Xw4rKZKMXU3TF9+X
	xzbsGcIv1xlrx54dOs+376qu9HRoWqu2JY6IJQk=
X-Google-Smtp-Source: AGHT+IFFq34D44rf12WgRblR4j38ce+obSgZ3IikxSYKVeWdOhFynZw/7P5sUSgQNwP4VbwCU/Gt8pPzU+mvvnDMAFI=
X-Received: by 2002:a6b:db15:0:b0:77e:3d2f:d1f4 with SMTP id
 t21-20020a6bdb15000000b0077e3d2fd1f4mr10832068ioc.15.1691980563542; Sun, 13
 Aug 2023 19:36:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230814022550.357118-1-raj.khem@gmail.com>
In-Reply-To: <20230814022550.357118-1-raj.khem@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 13 Aug 2023 22:35:52 -0400
Message-ID: <CADkTA4PDUcJJ=jOiTnHQe0xk-TOUAzRE4G-qTLd4dLdbfbLpGA@mail.gmail.com>
Subject: Re: [PATCH] kernel.bbclass: Use KERNEL_STRIP instead of STRIP
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Aug 2023 02:36:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185915

On Sun, Aug 13, 2023 at 10:25=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrot=
e:
>
> Kernel uses its own variables KERNEL_* instead of general toolchain env
> variables, therefore use KERNEL_STRIP here explicitly, Problems happen
> when using llvm-strip as default STRIP in distro settings, since kernel
> defaults to using gcc, system does not stage llvm/clang toolchain into
> kernel's staging sysroot and this function ends up with
>
> FileNotFoundError: [Errno 2] No such file or directory: 'riscv64-yoe-linu=
x-llvm-strip'

Makes sense to me.

Bruce

>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  meta/classes-recipe/kernel.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/ker=
nel.bbclass
> index bb5995b4954..acb43bd4d57 100644
> --- a/meta/classes-recipe/kernel.bbclass
> +++ b/meta/classes-recipe/kernel.bbclass
> @@ -760,7 +760,7 @@ addtask kernel_link_images after do_compile before do=
_strip
>  python do_strip() {
>      import shutil
>
> -    strip =3D d.getVar('STRIP')
> +    strip =3D d.getVar('KERNEL_STRIP')
>      extra_sections =3D d.getVar('KERNEL_IMAGE_STRIP_EXTRA_SECTIONS')
>      kernel_image =3D d.getVar('B') + "/" + d.getVar('KERNEL_OUTPUT_DIR')=
 + "/vmlinux"
>
> --
> 2.41.0
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

