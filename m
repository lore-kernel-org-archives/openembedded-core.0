Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DEA9C3ABDD
	for <webhook@archiver.kernel.org>; Mon, 19 May 2025 16:50:04 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.140.1747673401692631215
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 May 2025 09:50:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UdeVrxWQ;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: jpewhacker@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3105ef2a06cso44960201fa.2
        for <openembedded-core@lists.openembedded.org>; Mon, 19 May 2025 09:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747673400; x=1748278200; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xip2bkkJW0E4+Cjcjs4plbzC8ZpUMnjvJw97vNVDDBY=;
        b=UdeVrxWQXQoKFf8dm397NBZ1hPzMUZYO0QjVYYcRgVBc9bqNu0uKCxZcKUeCIb3FXH
         W3j1SkRHEDTG3xqoQVhccZLbbaYmPF9M0qHY+7OjO9r1fTDkh0e86EKTo2FK1ZqyWeZH
         mtd3MDOMfy889aP8WlJZnv/QWUcSJ3IukQmkqAhgLxqVoTXKa0EVy5SyTPFjZdRHEIOL
         sQCIpz81X5aMc36b9c1NnZ4TkiaxxtoFOYXIgQ/4Z/AR8ofi84vuV70zdi7myT63sJqo
         efx2uDyfM+HP7S28C2TP1FNmwNMtkbZmR/KifpknoJBsZ01zFsAP6KvJDrFlRpfN0S1u
         MDWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747673400; x=1748278200;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xip2bkkJW0E4+Cjcjs4plbzC8ZpUMnjvJw97vNVDDBY=;
        b=n8hyWrkD6l4Q4aOYEa7wUPM9IhGMY+XMFfArZ2MogSozTWEzgVOZHkXh/MBHjKJ7nC
         zMfBjuJjoJ8ItdEUZjW8Gfdn75mX2KkpJl3Rld5hCcujQinXolS20kqIShBjvffOhpDh
         nVA0ts2O5wmPtKPsBeKTHHIJZCasKt4tnn/a+3q+ZzynnVUSd7X7XWk/wftDcr7eivLR
         GEl42y4KTWaqyLQ3tBPMLugj+E+714Dsj36+GYLvtK+odh61XTXukn4aV5xA5LIQNl9o
         Q1TDXD1qjo9wPfJ+CCex5sUWeACGuLupMqOoQIKuRt1pr0yj+vCRDTL8kV7qq8ILruJu
         7rqw==
X-Gm-Message-State: AOJu0Ywy2Gk5/49Uf6Xfk0BsfXHAFiFD9UVcWPTBdsysqLUt/WSJeYIb
	KXnWhhJ4vakAh6Nw4RzNwiWHjuvKH5v2gelsqpNnmbTY3rf3/+47FxDGBb48WcibYVQP1pKHmIq
	t4godO6lApgest9R1DvglPM6+VTc0fvo=
X-Gm-Gg: ASbGncv0FJnOzGUzWVztt7TZpKxWXfj+umVIV7ei9LmUg2Zai1wOhF286SynQ810Oyc
	q/nGf7wJm6Vh+a8M6BLYARFaFu1WNoRtKuoZCuspwAgNDd6UEABcBjicSoXnEn/nfvkQ8Of97mk
	qs8+fO6v0ftlprifbXRbYsDHVMSsWjyrYhBAK32HncbgXlWPI=
X-Google-Smtp-Source: AGHT+IHlPLenyV7at52jEKjeqJrnajk/HnM+cdeLm6KK0swUKS7IZ76VI3GduAJ7ENRbM0KWnIuH+NlzXzvQVT8lTxY=
X-Received: by 2002:a2e:bcc8:0:b0:30b:9813:b011 with SMTP id
 38308e7fff4ca-328077c90a5mr67956521fa.28.1747673399362; Mon, 19 May 2025
 09:49:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250517212855.349153-1-raj.khem@gmail.com>
In-Reply-To: <20250517212855.349153-1-raj.khem@gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Mon, 19 May 2025 10:49:47 -0600
X-Gm-Features: AX0GCFsWlplWxOYdH88Yz4FDqtbpZCSTbtH_NRbJk7MDxBBbpJVFVQE1bBg_qpk
Message-ID: <CAJdd5GZ4QcX_PgdKCQBPh5--7=4vMjwr4PP2o+X2XzVbyBVntg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rust: Use patchelf in place of chrpath to edit rpaths
To: raj.khem@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 May 2025 16:50:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216862

I don't think patchelf-uninative is available if uninative is not in
use. Probably better to DEPENDS +=3D "patchelf-native" instead

On Sat, May 17, 2025 at 3:29=E2=80=AFPM Khem Raj via lists.openembedded.org
<raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
>
> chrpath has limitations e.g. the original rpath in ELF have to bigger in =
size
> than the one being edited into it by chrpath, some toolchains do not use =
RPATH
> but emit the RUNPATHs into ELF files and chrpath is not able to handle th=
e
> runpaths, this is the case with mips and pp32 build of rust, especially
> when using clang compiler to build them.
>
> patchelf can do more:
>
> Modify RUNPATH entries
> Add RPATH/RUNPATH where none existed
> Set longer paths than the original
> Convert between RPATH and RUNPATH
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/rust/rust_1.85.1.bb | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-devtools/rust/rust_1.85.1.bb b/meta/recipes-dev=
tools/rust/rust_1.85.1.bb
> index dc4f5648552..3b7226ae408 100644
> --- a/meta/recipes-devtools/rust/rust_1.85.1.bb
> +++ b/meta/recipes-devtools/rust/rust_1.85.1.bb
> @@ -207,9 +207,9 @@ rust_runx () {
>          mkdir -p `dirname ${RUST_ALTERNATE_EXE_PATH}`
>          cp ${RUST_ALTERNATE_EXE_PATH_NATIVE} ${RUST_ALTERNATE_EXE_PATH}
>          if [ -e ${STAGING_LIBDIR_NATIVE}/libc++.so.1 ]; then
> -            chrpath -r \$ORIGIN/../../../../../`basename ${STAGING_DIR_N=
ATIVE}`${libdir_native} ${RUST_ALTERNATE_EXE_PATH}
> +            patchelf-uninative --set-rpath \$ORIGIN/../../../../../`base=
name ${STAGING_DIR_NATIVE}`${libdir_native} ${RUST_ALTERNATE_EXE_PATH}
>          else
> -            chrpath -d ${RUST_ALTERNATE_EXE_PATH}
> +            patchelf-uninative --remove-rpath ${RUST_ALTERNATE_EXE_PATH}
>          fi
>      fi
>
> @@ -266,7 +266,7 @@ rust_do_install:class-nativesdk() {
>      install -d ${D}${bindir}
>      for i in cargo-clippy clippy-driver rustfmt; do
>          cp build/${RUST_BUILD_SYS}/stage2-tools/${RUST_HOST_SYS}/release=
/$i ${D}${bindir}
> -        chrpath -r "\$ORIGIN/../lib" ${D}${bindir}/$i
> +        patchelf-uninative --set-rpath "\$ORIGIN/../lib" ${D}${bindir}/$=
i
>      done
>
>      chown root:root ${D}/ -R
> @@ -301,7 +301,7 @@ rust_do_install:class-target() {
>      install -d ${D}${bindir}
>      for i in ${EXTRA_TOOLS}; do
>          cp build/${RUST_BUILD_SYS}/stage2-tools/${RUST_HOST_SYS}/release=
/$i ${D}${bindir}
> -        chrpath -r "\$ORIGIN/../lib" ${D}${bindir}/$i
> +        patchelf-uninative --set-rpath "\$ORIGIN/../lib" ${D}${bindir}/$=
i
>      done
>
>      install -d ${D}${libdir}/rustlib/${RUST_HOST_SYS}
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#216772): https://lists.openembedded.org/g/openembedde=
d-core/message/216772
> Mute This Topic: https://lists.openembedded.org/mt/113168136/3616693
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [JP=
EWhacker@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

