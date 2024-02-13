Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B8D1C48260
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 13:55:45 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.11784.1707832541502501720
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Feb 2024 05:55:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IwBdap+F;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-410ed9f8621so14114355e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 05:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1707832540; x=1708437340; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=teq4HYPdMJ2GnmMZG/7kTAc6JZm7r8ZsJtb0Ja/vaYQ=;
        b=IwBdap+FsuMGbkcmb4B9UlJrE1Ye9f8XqxWDXSI08yfHfdl5Ezkg1ewn8jr1hJLy4+
         t/CtqFLkrLu0cG/LirM7mdczDuDDtYYD0Xrdb+O7VhSB7QIc3RACY+r3gxqb5rG3y1Lj
         lggvkp8/HnekvX+02JkuZy/gU2czLQiHplcEY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707832540; x=1708437340;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=teq4HYPdMJ2GnmMZG/7kTAc6JZm7r8ZsJtb0Ja/vaYQ=;
        b=bBDnnuEedzA4uU5iK3kCTUs8nLpqIEYm7gnW6ufFWmPBQ++5tuug3sxCiOxy3zQtjF
         v3DQbIqprxsLKggPk0bkCqMYhL1PJJXC+of3bP4TaysPCtAKptxB9LsML8kONdMSku+B
         Md0cdSl+FlmmoKFCNO7K+3S+qGWDGwewhqkCUsxTydG3cq/UhAy6ydd9US0ZXhPsuf3Q
         5y9krc2woAeorljzQp6wgSBwXwitHUinwU9HcopnCePQNjKWB2Fm/bwJDTvwoVqkDyVo
         jxT5kC+tDaWqyHP9MNosoH/lHGEUAi39RNvsOOb0eVcg7OkEwfttIJa1EDnEsrx2Sb1X
         Yv1w==
X-Forwarded-Encrypted: i=1; AJvYcCX2gDB5He0Gco6vhM8fJPRFynJ4V4O3eibL7oJJP7A3HaReTqAMU1u/UEYkHGwMuDH45FIaKnAYcxEoJtdkwXuaU0PxhlBm0MOqeQ8phb8CiFuSDn5/PZul
X-Gm-Message-State: AOJu0YxNRTsGexxPuRef4NbrxWvaTsoT3+35d042bx7Oaq9D6FgGIKO6
	RHHhdKHowpCqmMStc4rou56Ns2gwQRO1azYGi6osAqL+aGT7WNxIazaahH4pW9o=
X-Google-Smtp-Source: AGHT+IGY35pRR8oRrvu/y7Pw0V3wt00CIXj/aqPwDvmhwv3DvKKKU/X1lKIBvB7letrBWEQ+xjk2qA==
X-Received: by 2002:a05:600c:a385:b0:40e:f9f4:eeb3 with SMTP id hn5-20020a05600ca38500b0040ef9f4eeb3mr8221978wmb.39.1707832539689;
        Tue, 13 Feb 2024 05:55:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUMODbL5lO/+n7WqsMYLHJUxSlmCxhUYtDE/8CM7stj6inuMJ60/s2w0qnexktb++GaauuEJGZ4jX4+AsUELfvJeP0dlhEukeBESc1N2D30dRof821xUdpyzSH453xcxcwbVEhrPdKyoZm3xSgIcYTL8IVb4wrGo9EeND9K8UfkwcLo7LlTdOPZlrAMwqtKpSd3HF7TNybTBAo5hDAbVwLmrThNc+22rfQ4LjKFO2nPuWNudRnYswlydtlrnd1Yzov1OKR+19pa6JSCU78HGoGoIwpXz9kyVw==
Received: from ?IPv6:2001:8b0:aba:5f3c:61a5:11c7:4181:c4a3? ([2001:8b0:aba:5f3c:61a5:11c7:4181:c4a3])
        by smtp.gmail.com with ESMTPSA id 7-20020a05600c248700b0040fddaf9ff4sm11741323wms.40.2024.02.13.05.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 05:55:39 -0800 (PST)
Message-ID: <ef3ebd71476b9cd91006af564e1954eca02914f4.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] gcc: Add riscv64 as a compatible host to
 gcc-sanitizers
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Deepthi.Hemraj@windriver.com, openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Umesh.Kalappa@windriver.com, 
	Naveen.Gowda@windriver.com, Shivaprasad.Moodalappa@windriver.com, 
	Sundeep.Kokkonda@windriver.com
Date: Tue, 13 Feb 2024 13:55:38 +0000
In-Reply-To: <20240212110000.1687187-1-Deepthi.Hemraj@windriver.com>
References: <20240212110000.1687187-1-Deepthi.Hemraj@windriver.com>
Autocrypt: addr=richard.purdie@linuxfoundation.org; prefer-encrypt=mutual; keydata=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
 YNvg==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 13:55:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195400

On Mon, 2024-02-12 at 03:00 -0800, Hemraj, Deepthi via
lists.openembedded.org wrote:
> From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
>=20
> The issue address-sanitizer check failure arises when attempting to run a=
 testcase compiled with AddressSanitizer on RISC-V 64 systems using the SV4=
8 and SV57 virtual address scheme.
> This error occurs due to the lack of support for SV48 and SV57 in ASAN, w=
hich was originally designed for SV39 in Riscv64 architecture.
> This patch disables SV48 and SV57 support in QEMU and modifying the kerne=
l to use SV39 by default.
>=20
> Upstream-Status: Backport [https://github.com/google/sanitizers/issues/17=
07]
> Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
> ---
>  meta/recipes-devtools/gcc/gcc-sanitizers.inc  |  3 ++-
>  meta/recipes-devtools/qemu/qemu.inc           |  1 +
>  ...isable-sv48-sv57-support-for-riscv64.patch | 25 +++++++++++++++++++
>  3 files changed, 28 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-devtools/qemu/qemu/disable-sv48-sv57-sup=
port-for-riscv64.patch
>=20
> diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers.inc b/meta/recipes-=
devtools/gcc/gcc-sanitizers.inc
> index 524ebd4ba4..8c98e9cf8a 100644
> --- a/meta/recipes-devtools/gcc/gcc-sanitizers.inc
> +++ b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
> @@ -73,13 +73,14 @@ RRECOMMENDS:${PN}:append:x86 =3D " liblsan"
>  RRECOMMENDS:${PN}:append:x86-64 =3D " liblsan libtsan"
>  RRECOMMENDS:${PN}:append:powerpc64 =3D " liblsan libtsan"
>  RRECOMMENDS:${PN}:append:aarch64 =3D " liblsan libtsan"
> +RRECOMMENDS:${PN}:append:riscv64 =3D " liblsan libtsan"
> =20
>  do_package_write_ipk[depends] +=3D "virtual/${MLPREFIX}${TARGET_PREFIX}c=
ompilerlibs:do_packagedata"
>  do_package_write_deb[depends] +=3D "virtual/${MLPREFIX}${TARGET_PREFIX}c=
ompilerlibs:do_packagedata"
>  do_package_write_rpm[depends] +=3D "virtual/${MLPREFIX}${TARGET_PREFIX}c=
ompilerlibs:do_packagedata"
> =20
>  # Only x86, powerpc, sparc, s390, arm, aarch64 and loongarch64 are suppo=
rted
> -COMPATIBLE_HOST =3D '(x86_64|i.86|powerpc|sparc|s390|arm|aarch64|loongar=
ch64).*-linux'
> +COMPATIBLE_HOST =3D '(x86_64|i.86|powerpc|sparc|s390|arm|aarch64|loongar=
ch64|riscv64).*-linux'
>  # musl is currently broken entirely
>  COMPATIBLE_HOST:libc-musl =3D 'null'
> =20
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
> index 2a81870151..56c988e7fd 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -36,6 +36,7 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.tar=
.xz \
>             file://fix_segv.patch \
>             file://qemu-guest-agent.init \
>             file://qemu-guest-agent.udev \
> +	   file://disable-sv48-sv57-support-for-riscv64.patch \
>             "
>  UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
> =20
> diff --git a/meta/recipes-devtools/qemu/qemu/disable-sv48-sv57-support-fo=
r-riscv64.patch b/meta/recipes-devtools/qemu/qemu/disable-sv48-sv57-support=
-for-riscv64.patch
> new file mode 100644
> index 0000000000..7f3eab1463
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/disable-sv48-sv57-support-for-riscv=
64.patch
> @@ -0,0 +1,25 @@
> +From: Deepthi Hemraj
> +Date: thur, 18 jan 2024 17:52:45
> +Subject: disable-sv48-sv57-support-for-riscv64=20
> +
> +Disabling  48 & 57 bit virtual memory address in a RISC-V program, while=
 the system's upper address limit resembles that of a 39-bit address space.=
=20
> +This signals a lack of support for the 48 & 57 bit virtual address space=
 on RISC-V; only the SV39 scheme is supported.
> +
> +Upstream-Status: Submitted [https://github.com/google/sanitizers/issues/=
1707]
> +Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
> +

This isn't true, it hasn't been submitted to qemu, it is listed as a
workaround in a different repository.

I think we need to get to the bottom of the issue before we can merge
something. If we do patch qemu (which I'm reluctant to do), the patch
does need to be accurate.

It is unclear what other side effects such a address space restriction
would have and would make us quite different from the architecture as
designed as I understand it.

Cheers,

Richard


