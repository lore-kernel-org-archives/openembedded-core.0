Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web12.3629.1628018399872763523
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Aug 2021 12:20:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Bnlo+b/w;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: armccurdy@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id p38so450847lfa.0
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Aug 2021 12:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=SMNhaYkQn0BO69csag0U0WHC4Msoj+zMf4Aj2bYfHPY=;
        b=Bnlo+b/wU0hpCjcYymXnngxOh+KN3hhWElUfuOskEk/gap4OBpxZ2BeyrWt3wf0arn
         e8nuZplF0Y0meCaAMJnrCg/U1cbHv7i059ymbLDXtkTu4g20jBg9+4DHL34gF+ov9nYI
         aeWvj1uYKgn2DNoYLDerx45qY7c4iAlncsNC68w4BPQmFnzeZEq2siMOkcJpLFCK9x2o
         eSpWibEGrMGqRPuVNA+PYcdHBNd+m7SEDzsFgwBRNEWIOaMvbu9F1EKfWxTeJhLxoR9h
         jWRNUIex6FD613LG1TqDSqcamRlAwLAnEh8C1pQQ/7QU4vu31uSL1mF1/GBJ4jV0GLvh
         /GKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=SMNhaYkQn0BO69csag0U0WHC4Msoj+zMf4Aj2bYfHPY=;
        b=P2r6nScQOItEAkcz2TBAO3K2GEd4J1ZlfbSlDZONtu/2olnjdhq2wOfBT2SSPgFZeu
         5sjIHr5SeCD7HoGGJm2RzUxVBzcyjn+lKvy3zm3T07qYfjXxcdfeMmk1AhVw9wmFGCW6
         JuUWKdHEgp18lr4bPOzdCDunyu1Ht1G19M/RmAdU1X6kAHFf+H8Wq9A1dF1ckovhyQcG
         iEZw7KHOvR9ZFfL2RlMufajmy9yX2CUsc51o3oL1PkN/9mvwfJv68w1X8gG4Ee4CvGBp
         B3DtQBSSkQZ/B52sBVdV5l0CrTpOHam25WiC4IxF8U84giJ7NQhHanOF9m76V2WSj9cg
         Lk4Q==
X-Gm-Message-State: AOAM533I8r7FO0ZyKvu1jOe70VE6UWFCowGKlVGmhcUo7CaLEU0zL2eZ
	g0cyzClqqyJ165h/h+kG2X0+HbP92UYTt9+QbHo=
X-Google-Smtp-Source: ABdhPJwd4FzF75cuOCoDqIlnoyybvO3oVUkpiAZzZscghcXfQ5Uh8KixmprTJFMUj4QGxa8HWKXcCiedgcSphDLRa48=
X-Received: by 2002:a19:c717:: with SMTP id x23mr9269438lff.230.1628018398022;
 Tue, 03 Aug 2021 12:19:58 -0700 (PDT)
MIME-Version: 1.0
References: <1696468844291952.7588@lists.openembedded.org> <20210803190435.332065-1-Martin.Jansa@gmail.com>
In-Reply-To: <20210803190435.332065-1-Martin.Jansa@gmail.com>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Tue, 3 Aug 2021 12:19:46 -0700
Message-ID: <CAJ86T=Ut+dDkAnFUNJec=4b9v0BbSz_u+3PVkmXmGpxuOxXLeA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] systemd-boot: use ld.bfd as efi-ld when gold is being used by default with ld-is-gold
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>, 
	Alexander Kanavin <alex.kanavin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 3, 2021 at 12:04 PM Martin Jansa <Martin.Jansa@gmail.com> wrote=
:
>
> * since the upgrade to 249.1 in:
>   https://git.openembedded.org/openembedded-core/commit/?id=3D323ec445dfe=
22860cd450c303db5ed8fcb4e791c
>   the builds with ld-is-gold are failing with:
>
>   [17/21] Generating linuxx64.elf.stub with a custom command
>   FAILED: src/boot/efi/linuxx64.elf.stub
>   /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd-boot/249.1-r=
0/recipe-sysroot-native/usr/bin/x86_64-oe-linux/x86_64-oe-linux-ld -o src/b=
oot/efi/linuxx64.elf.stub -T /OE/build/oe-core/tmp-glibc/work/core2-64-oe-l=
inux/systemd-boot/249.1-r0/recipe-sysroot/usr/lib/elf_x86_64_efi.lds -share=
d -Bsymbolic -nostdlib -znocombreloc --build-id=3Dsha1 -L /OE/build/oe-core=
/tmp-glibc/work/core2-64-oe-linux/systemd-boot/249.1-r0/recipe-sysroot/usr/=
lib /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd-boot/249.1-r=
0/recipe-sysroot/usr/lib/crt0-efi-x86_64.o src/boot/efi/string-util-fundame=
ntal.c.o src/boot/efi/disk.c.o src/boot/efi/graphics.c.o src/boot/efi/measu=
re.c.o src/boot/efi/pe.c.o src/boot/efi/secure-boot.c.o src/boot/efi/util.c=
.o src/boot/efi/linux.c.o src/boot/efi/splash.c.o src/boot/efi/stub.c.o -le=
fi -lgnuefi /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd-boot=
/249.1-r0/recipe-sysroot/usr/lib/../lib/x86_64-oe-linux/11.2.0/libgcc.a
>   /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd-boot/249.1-r=
0/recipe-sysroot-native/usr/bin/x86_64-oe-linux/x86_64-oe-linux-ld: interna=
l error in segment_precedes, at ../../gold/layout.cc:3721
>   [18/21] Generating boot.c.o with a custom command
>   ninja: build stopped: subcommand failed.
>   WARNING: exit code 1 from a shell command.
>
>   as reported in:
>   https://lists.openembedded.org/g/openembedded-core/message/154246
>
>   work around this by using ld.bfd when ld-is-gold is in DISTRO_FEATURES
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-core/systemd/systemd-boot_249.1.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/systemd/systemd-boot_249.1.bb b/meta/recip=
es-core/systemd/systemd-boot_249.1.bb
> index d767b5bf8d..18f4fe55ce 100644
> --- a/meta/recipes-core/systemd/systemd-boot_249.1.bb
> +++ b/meta/recipes-core/systemd/systemd-boot_249.1.bb
> @@ -19,11 +19,13 @@ objcopy =3D ${@meson_array('OBJCOPY', d)}
>  EOF
>  }
>
> +EFI_LD =3D "${@d.getVar('LD').split()[0]}"
> +
>  EXTRA_OEMESON +=3D "-Defi=3Dtrue \
>                    -Dgnu-efi=3Dtrue \
>                    -Defi-includedir=3D${STAGING_INCDIR}/efi \
>                    -Defi-libdir=3D${STAGING_LIBDIR} \
> -                  -Defi-ld=3D${@ d.getVar('LD').split()[0]} \
> +                  -Defi-ld=3D${@bb.utils.contains('DISTRO_FEATURES', 'ld=
-is-gold', 'ld.bfd', '${EFI_LD}', d)} \

Could this just be set to ld.bfd in all cases?
