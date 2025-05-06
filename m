Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 776FAC3ABBF
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 14:21:45 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web11.77517.1746541296408932339
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 May 2025 07:21:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C0fJhjVz;
 spf=pass (domain: gmail.com, ip: 209.85.167.176, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3feb0db95e6so3719572b6e.1
        for <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 07:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746541295; x=1747146095; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=29fcD3eFiZhysfeA4IABVxTTj9eUduSrWQ6jlGKZkOc=;
        b=C0fJhjVzahJYbZDhLbqW3j3ZLFLlH+ltA8KVzLDwZSzKOd4m0stJrE7VPbrRmk0gKV
         4aAoFbZjUPV4jQmJo6Vm1dLSJ0fGakzmOMha72js3BCj+K3rPDx3xRb6NTqfBfki/ilP
         9b3wVtlJOXYFvrAtpiJEK7BqbcNJXCnqI7QtFUCQ0RLBgih3oD0aaBPGF3rHcKNoQ1sQ
         ePSXs3Gh5ZU1BvIt/HFIiR0/In2MLCueVBZphq8iwm3VDFJ0XYbO81pWGWHOKQFZxUOt
         a3Gtdfbv7wf2gobLO5mSOc8FmBvSx7h9Mgek87t+pqySP5jVY++Mlab+Oq4PGjb/SsMP
         oP4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746541295; x=1747146095;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=29fcD3eFiZhysfeA4IABVxTTj9eUduSrWQ6jlGKZkOc=;
        b=R3r3EsvnWPSabLhuKSVD/Z1MyMeZjKiR8MPMmB1zcgBIplNPGaCyUfSkZjr17/+DgB
         DCXVj1mzzFRpACzVvE7SAVMh5oBr7v9w+IgxJoAZ/ffBH5CyO8uMS0DUH6XWVeEt9UkI
         xX5RS2boFmzbBzqh6Spv8ZKcen7uowb+EtyIu5ESV6s1/XPXIISVtH1Y3bqZs7mEdgpO
         zMmyrro9V0gxPTJWRmS+3d8o+EYLTjBabFJP+MWFlvveNzDQEyUVca0SkGmws14AfOHN
         gRvPB4cNeTbfkKqxkkXqBwzV1MuN68tu87yoWS9mEDG42qtf6oLQtd3Pd7FMevkqiWN9
         KbmA==
X-Gm-Message-State: AOJu0Yxo7RLbuUXXafHIpfuq90YHGNWrZWWBEVnwOtnD2BtU7etZdQcr
	mDsPLNetigw9FwVfYypxPxDQYUNWq6KwgA74DsRON9ZFEiceHzR1eIHYw8uzKhifRAN0ThCWp9s
	TjBy9PEL77Mh8DiIjqV3re+ErbD0=
X-Gm-Gg: ASbGncsPs46JBuPY2/EKc+a/+GPo5+Lo4zjAjTvsb4pzBegX3VadWcPkLVtiXbieWN1
	PlD0pdsNdiVgazktMHlBzDp5N5Hd7Oxn7o8ml2axRV3KUm6n4TWsfndFgdxyBOOGyLYPaVNdr6C
	RZpY+GEzpiKliEWaJutce7pJRh4rmITM+IOv6V
X-Google-Smtp-Source: AGHT+IHyml+yxXibMlwaMN1v1Bd39szbJ2YvQZ3Zjwhkrx0ju+lFYl1kKE2i2mXjsktpSphqO++XyaptLglNDBMe8Hw=
X-Received: by 2002:a05:6808:238a:b0:3fa:52ae:43dd with SMTP id
 5614622812f47-4035a584756mr7961488b6e.19.1746541295564; Tue, 06 May 2025
 07:21:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250506141013.2600055-1-max.oss.09@gmail.com>
In-Reply-To: <20250506141013.2600055-1-max.oss.09@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 6 May 2025 07:21:09 -0700
X-Gm-Features: ATxdqUH0mMEdXtG4RJnInWQEUGz7lSSfkT2IPV6nLx45avwty_NRtwU5yIR_9BA
Message-ID: <CAMKF1sq_F1iaRfkHyBgZuSC=9VUwHfQ1ZOjrrr9k8exfDaehFA@mail.gmail.com>
Subject: Re: [OE-core][Patch v2 1/1] openssl: aarch64: configure with no-asm
To: max.oss.09@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Max Krummenacher <max.krummenacher@toradex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 14:21:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216052

On Tue, May 6, 2025 at 7:11=E2=80=AFAM Max Krummenacher via
lists.openembedded.org <max.oss.09=3Dgmail.com@lists.openembedded.org>
wrote:
>
> From: Max Krummenacher <max.krummenacher@toradex.com>
>
> openssl has a couple of functionalities which use optimized
> assembler code. With no-asm these are replaced by generic
> C code implementation.
>
> With GCC 15 OE by default uses the new AARCH64 specific GCS feature.
> However the object files produced by the assembler are not marked
> to provide the feature and consequently the produced shared objects
> containing them also not.
> The linker will warn when linking against such shared objects files
> and, with all warnings are errors set linking will fail.
> Without this patch systemd e.g. fails do_compile as it links against
> libcrypto.so from openssl.
>
> To test what features an object file (or .so, .a file) has use
> readelf -ln and check the content of .note.gnu.property, e.g.
> libcrypto-shlib-md5-aarch64.o build from assembler source,
> libcrypto-shlib-md5_one.o build from C source:
>
> $ aarch64-poky-linux-readelf -ln ./crypto/md5/libcrypto-shlib-md5-aarch64=
.o
>
> There are no program headers in this file.
>
> Displaying notes found in: .note.gnu.property
>   Owner                Data size        Description
>   GNU                  0x00000010       NT_GNU_PROPERTY_TYPE_0
>       Properties: AArch64 feature: BTI, PAC
>
> $ aarch64-poky-linux-readelf -ln ./crypto/md5/libcrypto-shlib-md5_one.o
>
> There are no program headers in this file.
>
> Displaying notes found in: .note.gnu.property
>   Owner                Data size        Description
>   GNU                  0x00000010       NT_GNU_PROPERTY_TYPE_0
>       Properties: AArch64 feature: BTI, PAC, GCS

Good find. I was suspecting something like that, what happens if we
use compiler driver to invoke as assembler ?
another way might be to add CFI directives in asm files, maybe just
start and end
foo:
.cfi_startproc
...
 .cfi_endproc


>
> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> ---
>  meta/recipes-connectivity/openssl/openssl_3.5.0.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> For reference also refer to this thread:
> https://lore.kernel.org/all/aBilFkr4HF-MSBd6@toolbox/
>
> diff --git a/meta/recipes-connectivity/openssl/openssl_3.5.0.bb b/meta/re=
cipes-connectivity/openssl/openssl_3.5.0.bb
> index 865e04deb220..d025fc3ff100 100644
> --- a/meta/recipes-connectivity/openssl/openssl_3.5.0.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_3.5.0.bb
> @@ -36,6 +36,8 @@ B =3D "${WORKDIR}/build"
>  do_configure[cleandirs] =3D "${B}"
>
>  EXTRA_OECONF =3D "${@bb.utils.contains('PTEST_ENABLED', '1', '', 'no-tes=
ts', d)}"
> +# aarch64 'as' doesn't mark objects to have the GCS feature, resulting *=
.so then produces linker warnings
> +EXTRA_OECONF:append:aarch64 =3D " no-asm"

Does this disable assembly ? if so there might be a performance
impact, it would be good to find that out.

>
>  #| ./libcrypto.so: undefined reference to `getcontext'
>  #| ./libcrypto.so: undefined reference to `setcontext'
> --
> 2.42.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#216050): https://lists.openembedded.org/g/openembedde=
d-core/message/216050
> Mute This Topic: https://lists.openembedded.org/mt/112649627/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

