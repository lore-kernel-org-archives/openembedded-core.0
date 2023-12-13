Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C337CC4332F
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 20:58:32 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web11.276.1702501107651900652
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Dec 2023 12:58:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cbmRA9Rw;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-20292b5ca69so3436208fac.1
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 12:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702501107; x=1703105907; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K3+wC9Ey7QHU2aBlamD/zg+1jgTR+GAw/et6xzPR3+E=;
        b=cbmRA9Rwbqhd18lobGE8P2P5Qg0QPnM6NYB1TDC4t8s6c7YltSpTifSRcTjmI6+XGF
         JrTswO2NmuwO60B8XyUYIS3MCwTjuIfqme+HXbr1DnjqIBhnt1uk4l95BcIH+NQjpoFR
         T9mi+jMkzFXmdNA9bMKKFZymTnAy1A0J2iRXTYi+ZGueh/bvpdDGifQkK5F/dFEb5OWm
         Iy5ikUYV/hMpqYgpeXKXd9Mt/aH4y18EAE5LQF1AdvlRUcAsxn3IE+K7jz0Hv0rjzw0V
         YHOgrzc5Kc2qxMwzwxjjOFSOV3eCySLpSt1cWcHbFx+zm5k+oqCoY4JrSPEf+ryqWOJO
         vEwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702501107; x=1703105907;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K3+wC9Ey7QHU2aBlamD/zg+1jgTR+GAw/et6xzPR3+E=;
        b=LcDTJnpJIT97KtPAfGm1SQMt/Zqjfyl2yR/EbJVCZ9ywPUKiO1GqvqVIdTcOBVWzDm
         p54WMzUU5f/JlRnj96bJx9l7u9v5KqvmC3DHZqcM7xhLdxu/0FOPcvU5zlDGSxpcqWN1
         VqseRzdf5ULCMsnYSZ6+miIPebIIejuiu4YBmIDUslHXg+g6qCYB516ZPH/XkNUm4G5U
         HDcS0kuYEcKs5TJ4Q+HvdNp4XTcC7UCJg5r/+PjOznw6a1TyjJ2wtGA8ipnFkXBaYsgd
         9MyOA+v2J1Ajttjjm/lqqOlwZlqtlGJ1eWhYiFr2k7x7nD+eqQki5GoJV6nF/BiW+5ft
         ZcNA==
X-Gm-Message-State: AOJu0Yy9v5/bLWsc+T7yo1mYoUIFXw+CXWUbYWUezIAbT7wTTWsg/h5u
	Gpa0AoA9/0yf+QClE8pmiLonlphB8QXOQe92fHA=
X-Google-Smtp-Source: AGHT+IGQW+3pKKvW1pkpwDcwwiW6XulSUAFPKMhRa5VxvNrO6KTwnlgt7Dxl17s+94h802HnubOnwtxT5ApwgFeWNWw=
X-Received: by 2002:a05:6870:392c:b0:203:13ec:ab01 with SMTP id
 b44-20020a056870392c00b0020313ecab01mr2914678oap.86.1702501106837; Wed, 13
 Dec 2023 12:58:26 -0800 (PST)
MIME-Version: 1.0
References: <20231213104755.3895396-1-ross.burton@arm.com>
In-Reply-To: <20231213104755.3895396-1-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 13 Dec 2023 12:58:01 -0800
Message-ID: <CAMKF1spmQz3DWpeDotCzMf05Ax0Drskad8ahoCyc7gX-CzWBXA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] openssl: mark assembler sections as call
 targets for PAC/BTI support on aarch64
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 20:58:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192323

On Wed, Dec 13, 2023 at 2:48=E2=80=AFAM Ross Burton <ross.burton@arm.com> w=
rote:
>
> From: Ross Burton <ross.burton@arm.com>
>
> The assembler sections in OpenSSL were not marked as valid call targets,
> so branch protection could not be enabled for libcrypto.so.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  .../openssl/openssl/aarch64-bti.patch         | 35 +++++++++++++++++++
>  .../openssl/openssl_3.2.0.bb                  |  1 +
>  2 files changed, 36 insertions(+)
>  create mode 100644 meta/recipes-connectivity/openssl/openssl/aarch64-bti=
.patch
>
> diff --git a/meta/recipes-connectivity/openssl/openssl/aarch64-bti.patch =
b/meta/recipes-connectivity/openssl/openssl/aarch64-bti.patch
> new file mode 100644
> index 00000000000..2a16debb76e
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssl/openssl/aarch64-bti.patch
> @@ -0,0 +1,35 @@
> +From ad347c9ff0fd93bdd2fa2085611c65b88e94829f Mon Sep 17 00:00:00 2001
> +From: "fangming.fang" <fangming.fang@arm.com>
> +Date: Thu, 7 Dec 2023 06:17:51 +0000
> +Subject: [PATCH] Enable BTI feature for md5 on aarch64
> +
> +Fixes: #22959
> +
> +Reviewed-by: Tom Cosgrove <tom.cosgrove@arm.com>
> +Reviewed-by: Tomas Mraz <tomas@openssl.org>
> +(Merged from https://github.com/openssl/openssl/pull/22971)
> +
> +Upstream-Status: Backport
> +Signed-off-by: Ross Burton <ross.burton@arm.com>
> +---
> + crypto/md5/asm/md5-aarch64.pl | 3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff --git a/crypto/md5/asm/md5-aarch64.pl b/crypto/md5/asm/md5-aarch64.=
pl
> +index 3200a0fa9bff0..5a8608069691d 100755
> +--- a/crypto/md5/asm/md5-aarch64.pl
> ++++ b/crypto/md5/asm/md5-aarch64.pl
> +@@ -28,10 +28,13 @@
> + *STDOUT=3D*OUT;
> +
> + $code .=3D <<EOF;
> ++#include "arm_arch.h"
> ++
> + .text
> + .globl  ossl_md5_block_asm_data_order
> + .type   ossl_md5_block_asm_data_order,\@function
> + ossl_md5_block_asm_data_order:
> ++        AARCH64_VALID_CALL_TARGET
> +         // Save all callee-saved registers
> +         stp     x19,x20,[sp,#-80]!
> +         stp     x21,x22,[sp,#16]
> diff --git a/meta/recipes-connectivity/openssl/openssl_3.2.0.bb b/meta/re=
cipes-connectivity/openssl/openssl_3.2.0.bb
> index ab0562bd730..1c97d853f11 100644
> --- a/meta/recipes-connectivity/openssl/openssl_3.2.0.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_3.2.0.bb
> @@ -12,6 +12,7 @@ SRC_URI =3D "http://www.openssl.org/source/openssl-${PV=
}.tar.gz \
>             file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from=
-co.patch \
>             file://0001-Configure-do-not-tweak-mips-cflags.patch \
>             file://0001-Added-handshake-history-reporting-when-test-fails=
.patch \
> +                  file://aarch64-bti.patch \

it looks funnily indented :)

>             "
>
>  SRC_URI:append:class-nativesdk =3D " \
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192280): https://lists.openembedded.org/g/openembedde=
d-core/message/192280
> Mute This Topic: https://lists.openembedded.org/mt/103147125/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

