Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1528DE92704
	for <webhook@archiver.kernel.org>; Sat, 27 Dec 2025 14:59:59 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8637.1766847591615600469
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Dec 2025 06:59:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=btmlRwr7;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-29f102b013fso98087555ad.2
        for <openembedded-core@lists.openembedded.org>; Sat, 27 Dec 2025 06:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766847591; x=1767452391; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y4/ir7v+minrccEH3qurefzSAydmY6kVvpC8jQ+gMXI=;
        b=btmlRwr7pk4frObR5VzYyJrQ59l4i3kKs8NxQ2iAoMaauLwfrfoYVrshu3Vfavow5R
         cy/VDk+42vLaKc+JU0GW6O5Qgp3pm1BHOT66brmVGKAQbuqBrTuS4DDUm43Vc+KRCeoK
         Su4OUb40UqLEdKkMxWy5lb663NJ3TlYFQGwUzLY/ZxQdTNd1IXesgIWK9eMEQySpkq2i
         LnhNXxfTiI0ukrNE2H8WD8ZeW/qACbb9QJ6D0CpWi0qVlQYww7TuBQaGJGvxe+Fu1bhS
         6m9lpscm13suCCUM0U1rAEvNaUmEr6jnAUkmxevHT1L7N6u+lBsm/CkWBc43WnZNcRKO
         pqHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766847591; x=1767452391;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y4/ir7v+minrccEH3qurefzSAydmY6kVvpC8jQ+gMXI=;
        b=vfQHpHkBYxn9boV6cTG0T+QWWWmG+od85iZwCdHebzxYdkj8CjgdOcwl/eBFAZo0ph
         JRXqnxCAmOyObzRkCxm9FlHvbtgxR5sktevbH0Aau7nFx53U40cFaSaTiQ44b9yMwLFj
         NRJLeAGvtUwztCoQ3hWlcjhzeFlGCDXXZSBCGwYNHGeRbORJoAXIqj/tbI4x1k7nUY2Y
         GLO13UHVG5YvFUIBcpNTmSolN8sTzcmgMcq100+GjcnGfhDJfGwEFlZWfLMv9PDFj9JT
         Hky7vMuIedq/LFm2l+OSvo+phK8EIA1/JDPLCmUaOoQyHtiQiWdNYEBJliM9QRMWNrSe
         7ueA==
X-Gm-Message-State: AOJu0YwgaOv3LmvDKz09kHM6fov38ptZ859rivBQ/zU7nW/uQtqsA3gt
	MxU9B7oGgzYj1osFmoEHWTqjZAq6eT+iatNvNXl6x7HP2edBEiwnKvm0tgTEn2KQaII6XcdMVxe
	fLmRq0um+UfBAJRUquj0x5REQTwppULc=
X-Gm-Gg: AY/fxX6gsgetk8eZpn/6km37kd30+vrpbL0NutIEUQlyt8484ojusmPvNDYrlKItfQx
	b6dnudL1CbC5iIQ3PZd9ZwvFenBvm5ZNp+QE5mkPAYEn8h3jEfRjfGTLKQ9UkYKypm6e2iys6Pi
	whglb7t7iY9Sd40i8gZBnvMDdSB9WrSt4U8vzalAOhEML/rjekh1WCEk3i7ofwphNtjv3iRULaJ
	n3ESMl5LpoA6cecIAXOH0iJ6EwqdFmqt6xkex+RKOxiHT/Py3HHpphDX9eUzzd0Tzq59is2bXEy
	6e/B
X-Google-Smtp-Source: AGHT+IG+3vM+qFNnZ0dvXC4uXE/pOq9GGDEWjo39o+2mSzx+VvL2/u+GWh2loO462eRZZQzBN1zuLicoSvN8BzTGuXY=
X-Received: by 2002:a05:6a20:3d89:b0:35d:d477:a7f1 with SMTP id
 adf61e73a8af0-376aa4fc810mr23592942637.43.1766847590727; Sat, 27 Dec 2025
 06:59:50 -0800 (PST)
MIME-Version: 1.0
References: <20251227113251.773795-1-Harish.Sadineni@windriver.com>
In-Reply-To: <20251227113251.773795-1-Harish.Sadineni@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sat, 27 Dec 2025 09:59:39 -0500
X-Gm-Features: AQt7F2rDJBRWu4PO9-TE-qZY3csP4TMOWozQYiuRGt3s50QcqCriNWAWvmNbYC8
Message-ID: <CADkTA4MoSUEOqqoY08-8NS9TE1NSkbpJaAoYgSNDP0bE+6DJ9g@mail.gmail.com>
Subject: Re: [PATCH 00/16] Enable rust support for linux kernel
To: Harish.Sadineni@windriver.com
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com, 
	Sundeep.Kokkonda@windriver.com, yoann.congal@smile.fr, 
	elmehdi.younes@smile.fr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Dec 2025 14:59:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228572

On Sat, Dec 27, 2025 at 7:33=E2=80=AFAM <Harish.Sadineni@windriver.com> wro=
te:
>
> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>
> This patch series introduces Rust support into the linux-yocto kernel rec=
ipe
> and related build infrastructure in the Yocto Project. The goal is to ena=
ble
> building the Linux kernel with Rust components and provide support for bu=
ilding
> kernel module which is written in rust and also provide support to build
> rust kernel modules in sdk.
>
> And this series adds test for Linux Rust sample and also added support fo=
r out-of-tree kernel
> module written in Rust as well as associated test.

What are the changes in this version compared to the last ?

I didn't get a chance to look at the previous series in detail, but will lo=
ok
at this one. Knowing what was done in the different iterations is
helpful in guiding what I look at.

Bruce

>
> Summary of patches:
>
> - Patch 01: Extend 'bindgen-cli' to support 'nativesdk', allowing it to b=
e available in the SDK environment.
> - Patch 02: Add required dependencies ('clang-native', 'rust-native', 'bi=
ndgen-cli-native') to the kernel to support Rust binding generation.
> - Patch 03: Install the Rust standard library source ('library/') into `w=
ork-shared` and which will be later copied to
>            linux-yocto recipe-sysroot-native.
> - Patch 04: Added 'rust-kernel' to DISTRO_FEATURES_FILTER_NATIVE and DIST=
RO_FEATURES_FILTER_NATIVESDK, the 'rust-kernel' feature automatically
>            propagates from target DISTRO_FEATURES to native/nativesdk bui=
lds
> - Patch 05: Stage the Rust sources into `recipe-sysroot-native` for kerne=
l build compatibility, making them visible during native builds.
> - Patch 06: Update `kernel-yocto.bbclass` to invoke `make rustavailable` =
during 'do_kernel_configme', ensuring Rust readiness.
> - Patch 07: Add kernel configuration support for Rust (via 'kernel-rust.s=
cc'), enabling the Rust build options in kernel config.
> - Patch 08: Fixed buildpaths errors when rust is enabled for kernel by ap=
pending --remap-path-prefix to RUST_DEBUG_REMAP
> - Patch 09: Disabling ccache when rust-kernel is enabled for linux-yocto.
> - Patch 10: Copy Rust kernel sources into kernel-devsrc build directory w=
hich will be required while running 'make prepare' in sdk.
> - Patch 11: Added oe-selftest case for the Linux Rust sample.
> - patch 12: Copying include/config/auto.conf in STAGING_KERNEL_BUILDDIR
> - patch 13: Export artifacts needed for out-of-tree Rust compilation
> - patch 14: Prepare out-of-tree rust module compilation
> - patch 15: Added rust-out-of-tree-module recipe in meta-skeleton layer
> - patch 16: Added rust-out-of-tree selftest
>
> Patches have been build-tested successfully on:
> - qemuarm64
> - qemux86-64
>
> Benchmark test-result for x86-64:
> +-------------------------------+------------+-----------+-----------+---=
--------+
> | DISTRO_FEATURES               |   real     |   user    |    sys    |  F=
S usage |
> +-------------------------------+------------+-----------+-----------+---=
--------+
> | rust-kernel (enabled)         | 46m1.720s  | 0m28.864s | 0m3.696s  |   =
58 GB   |
> | rust-kernel (disabled)        | 30m1.053s  | 0m20.091s | 0m2.748s  |   =
33 GB   |
> +-------------------------------+------------+-----------+-----------+---=
--------+
>
> The increased in time & fs is due to kernel rust dependencies in
> linux-yocto.
>
>
> Harish Sadineni (9):
>   bindgen-cli: extend BBCLASSEXTEND to include nativesdk
>   linux-yocto: conditionally add clang/rust/bindgen-cli-native to
>     DEPENDS
>   rust: install Rust library sources for 'make rustavailable' support
>   bitbake.conf: Include "rust-kernel" in native/nativesdk feature
>     filters
>   kernel-yocto: stage rustlib sources for linux-yocto 'make
>     rustavailable' support
>   kernel-yocto: add rust support via "make rustavailable" in
>     do_kernel_configme
>   linux-yocto: enable Rust support in kernel configuration
>   kernel-yocto: Fix for buildpaths errors when rust is enabled for
>     kernel
>   kernel-devsrc: copying rust-kernel source to $kerneldir/build
>
> Yoann Congal (7):
>   kernel-yocto.bbclass: Disable ccache when rust-kernel is enabled
>   selftest/cases/runtime_test: Add test for Linux Rust sample
>   kernel.bbclass: Copy include/config/auto.conf in
>     STAGING_KERNEL_BUILDDIR
>   kernel.bbclass: Export artifacts needed for out-of-tree Rust
>     compilation
>   module.bbclass: Prepare out-of-tree rust module compilation
>   meta-skeleton: Add rust-out-of-tree-module recipe
>   runtime_test: Add rust-out-of-tree selftest
>
>  .../rust-out-of-tree-module_git.bb            | 18 ++++++++++
>  meta/classes-recipe/kernel-yocto.bbclass      | 28 +++++++++++++++
>  meta/classes-recipe/kernel.bbclass            | 19 ++++++++++
>  meta/classes-recipe/module.bbclass            |  8 +++++
>  meta/conf/bitbake.conf                        |  4 +--
>  meta/lib/oeqa/selftest/cases/runtime_test.py  | 35 +++++++++++++++++++
>  .../bindgen-cli/bindgen-cli_0.72.1.bb         |  2 +-
>  meta/recipes-devtools/rust/rust_1.91.1.bb     | 17 +++++++++
>  meta/recipes-kernel/linux/kernel-devsrc.bb    |  4 +++
>  meta/recipes-kernel/linux/linux-yocto.inc     |  2 ++
>  meta/recipes-kernel/linux/linux-yocto_6.16.bb |  1 +
>  meta/recipes-kernel/linux/linux-yocto_6.18.bb |  1 +
>  12 files changed, 136 insertions(+), 3 deletions(-)
>  create mode 100644 meta-skeleton/recipes-kernel/rust-out-of-tree-module/=
rust-out-of-tree-module_git.bb
>
> --
> 2.49.0
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

