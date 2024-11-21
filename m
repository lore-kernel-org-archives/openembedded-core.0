Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C583D78786
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 16:13:59 +0000 (UTC)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.web11.2234.1732205638108229421
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Nov 2024 08:13:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dbNEBTXR;
 spf=pass (domain: gmail.com, ip: 209.85.210.50, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7181a8af549so557085a34.2
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 08:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732205637; x=1732810437; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VkJNNFrwbXY3tetvv3MedFYJA4GrndoBTUgjXnxqIKM=;
        b=dbNEBTXRpVWzYF71f2xNQpMoxFQFANnhtdkt4D12++2w+tRx0Zm5MRxq07+vfVFzs9
         Nb1kNTykIFYD0ecsnBFllsB5T4y6sqTAbsTuSNP4PW76IJs3tOveFpgiQlL/f2rA+KTP
         7HLnmN8gWJcJSIQCw8ilWi2V+BGvyTi8wVXFRUCWfp6SFaD/Q4c6NEtkXK/oYXKkMSgY
         j2UAtk0XNAke6eruZabIL9OKo2ONU1vZtUEPk/ISbJddLqRATuGZSA89t/qgyn8TUf1j
         hczGISIrWgDKVDU4YocVtOvpefiKCHvXKtAzb9mmg5ZL3b8T8Dj4Nf7ZkpUC+Ij6gVHe
         FKQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732205637; x=1732810437;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VkJNNFrwbXY3tetvv3MedFYJA4GrndoBTUgjXnxqIKM=;
        b=MFXuzOKLvZEpPis9X261tN65Weh8TF9bjpCkRatD+C1Yskpmf8CsfB1zPU6B7LSjlc
         lQ51H8N1zTG/KXex+tBDpVta0rCbRNhP014llUPIDJyw52ygU6HaB2zl2Kdr4ViUI3cF
         aMHdz3+dU1KdSZ8TRhpOwlIlePje5/AdmUUY8Bb5c2IjDojXgnKzV3jhR1xC803zAV7I
         X8QJnpE3DKe+yAid3CtQ2jkiFkL0J2iza+axxL/u/pi4NEnbbO6OUQrRwBiqf8w+07Xr
         zw33JTopZBwip6Ra4csXhDgSFfrqWsBYvDPf3rp1E2XuXmkoDXwROjA5WN5rDahtyoyk
         5BIg==
X-Gm-Message-State: AOJu0Yz2AcR4mcwZW4k0a3R9xotQNVccltUJSkJkqjr3rmu4aX4mnJQH
	viHs9lwcOcF39WVjPwb8IcyLJ+ShgdaqRYypHGOGkB2T8bR98Z7c4ed2j+Jso8R0R2Rrx2ACiT5
	ev/1hMIqCqaps6o9yQ+aEORcnmy8=
X-Gm-Gg: ASbGncsxsxSKr4tuq6U7itQwS03+qE/G4qJhjMMiw8GC3lKwIAAYB8okfZsXMQ8obB/
	jnOwPV8H88EusEhgkgRN+2sDZS/7Ef2mIOhcCOkGmA0fzUuL5KTvVOUtTc8Y4nUIz
X-Google-Smtp-Source: AGHT+IGlGlZKxbxoclhWbffXvB/1yjA4kF60+dfzmZeR3g3n1pNj06WJuvwNI5m3uN6AJYZ6u+HBO9s19XtrzONwtgg=
X-Received: by 2002:a05:6830:e07:b0:718:194d:8b1 with SMTP id
 46e09a7af769-71ab319ab37mr5835823a34.23.1732205637258; Thu, 21 Nov 2024
 08:13:57 -0800 (PST)
MIME-Version: 1.0
References: <20241121153859.2133751-1-tgamblin@baylibre.com> <20241121153859.2133751-2-tgamblin@baylibre.com>
In-Reply-To: <20241121153859.2133751-2-tgamblin@baylibre.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 21 Nov 2024 08:13:31 -0800
Message-ID: <CAMKF1so2AvyYYFNVr6uV7FdTPHvu0yyLOBJTxjQN3=oMPT137g@mail.gmail.com>
Subject: Re: [OE-core][PATCH 2/2] python3-numpy: upgrade 1.26.4 -> 2.1.3
To: tgamblin@baylibre.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 16:13:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207544

On Thu, Nov 21, 2024 at 7:39=E2=80=AFAM Trevor Gamblin via
lists.openembedded.org <tgamblin=3Dbaylibre.com@lists.openembedded.org>
wrote:
>
> - This release contains numerous API changes and bug fixes.
>   Changelog: https://github.com/numpy/numpy/releases
>
> - Notably, the build backend has switched to mesonpy since 1.26.4.
>
> - Patch 0001-numpy-core-Define-RISCV-32-support.patch had to be updated
>   to change the paths for the target files. It has now been merged
>   upstream, but isn't included in any release yet. PR for reference:
>
>   https://github.com/numpy/numpy/pull/17780
>
> - Builds OK and seems to be compatible with current piglit and pandas
>   (meta-python), which was not the case for the previous upgrade attempt
>   to numpy 2.0.1.
>
> - For numpy, add 'pkgconfig' to inherit to avoid errors like this at
>   do_compile:
>
>   | Found Pkg-config: NO
>   | Run-time dependency python found: YES 3.12
>   | Has header "Python.h" with dependency python: NO
>   |
>   | ../numpy-2.0.0/meson.build:44:2: ERROR: Problem encountered: Cannot c=
ompile `Python.h`. Perhaps you need to install python-dev|python-devel
>   |
>   | A full log can be found at /home/tgamblin/workspace/yocto/poky/build/=
tmp/work/core2-64-poky-linux/python3-numpy/2.0.0/build/meson-logs/meson-log=
.txt
>
> - Mmodify the FILES:${PN}-staticdev line to fix a QA issue.
>
> - This is now reproducible as of oe-core commit: 917df5ed022f
>
> License-Update: Change copyright year to 2024
>
> buildall-qemu log:
>
> BUILDALL-QEMU LOG FOR python3-numpy
> START TIME: 2024-11-20_14:02:08
> HOSTNAME: megalith
> HOST OS: Debian GNU/Linux 12 (bookworm)
> HOST KERNEL: 6.1.0-27-amd64
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> BUILD RESULTS:
> [glibc]
> FAIL: qemuloongarch64
> PASS: qemuriscv32
> PASS: qemuarmv5
> PASS: qemuppc
> PASS: qemumips64
> PASS: qemuriscv64
> PASS: qemuarm64
> PASS: qemuarm
> PASS: qemux86-64
> PASS: qemuppc64
> PASS: qemux86
> PASS: qemumips
> [musl]
> FAIL: qemuloongarch64
> FAIL: qemuriscv32
> PASS: qemuarmv5
> PASS: qemuppc
> PASS: qemumips64
> PASS: qemuriscv64
> PASS: qemuarm64
> PASS: qemuarm
> PASS: qemux86-64
> PASS: qemuppc64
> PASS: qemux86
> PASS: qemumips
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> PASSED: 21
> FAILED: 3

Testing on such a comprehensive matrix is amazing, thanks for doing
it. Can you share more details on qemuriscv32/musl failures ?

>
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---
>  ...1-numpy-core-Define-RISCV-32-support.patch | 52 +++++++++++--------
>  ...numpy_1.26.4.bb =3D> python3-numpy_2.1.3.bb} | 26 ++++++----
>  2 files changed, 46 insertions(+), 32 deletions(-)
>  rename meta/recipes-devtools/python/{python3-numpy_1.26.4.bb =3D> python=
3-numpy_2.1.3.bb} (68%)
>
> diff --git a/meta/recipes-devtools/python/python3-numpy/0001-numpy-core-D=
efine-RISCV-32-support.patch b/meta/recipes-devtools/python/python3-numpy/0=
001-numpy-core-Define-RISCV-32-support.patch
> index 676bdbb3afd..6da9047ec57 100644
> --- a/meta/recipes-devtools/python/python3-numpy/0001-numpy-core-Define-R=
ISCV-32-support.patch
> +++ b/meta/recipes-devtools/python/python3-numpy/0001-numpy-core-Define-R=
ISCV-32-support.patch
> @@ -1,42 +1,50 @@
> -From eb6d6579150bf4684603ce377c51e90ad3bb8109 Mon Sep 17 00:00:00 2001
> +From 0e2b652a0eff85798584116c905a2d6ad8f25d5f Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Sun, 15 Nov 2020 15:32:39 -0800
>  Subject: [PATCH] numpy/core: Define RISCV-32 support
>
>  Helps compile on riscv32
>
> -Upstream-Status: Submitted [https://github.com/numpy/numpy/pull/17780]
> +Upstream-Status: Backport
> +(https://github.com/numpy/numpy/pull/17780/commits/0e2b652a0eff857985841=
16c905a2d6ad8f25d5f)
> +
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  ---
> - numpy/core/include/numpy/npy_cpu.h    | 3 +++
> - numpy/core/include/numpy/npy_endian.h | 1 +
> - 2 files changed, 4 insertions(+)
> + numpy/_core/include/numpy/npy_cpu.h    | 9 +++++++--
> + numpy/_core/include/numpy/npy_endian.h | 1 +
> + 2 files changed, 8 insertions(+), 2 deletions(-)
>
> -diff --git a/numpy/core/include/numpy/npy_cpu.h b/numpy/core/include/num=
py/npy_cpu.h
> -index 78d229e..04be511 100644
> ---- a/numpy/core/include/numpy/npy_cpu.h
> -+++ b/numpy/core/include/numpy/npy_cpu.h
> -@@ -19,6 +19,7 @@
> +diff --git a/numpy/_core/include/numpy/npy_cpu.h b/numpy/_core/include/n=
umpy/npy_cpu.h
> +index a19f8e6bbd..15f9f12931 100644
> +--- a/numpy/_core/include/numpy/npy_cpu.h
> ++++ b/numpy/_core/include/numpy/npy_cpu.h
> +@@ -18,6 +18,7 @@
> +  *              NPY_CPU_ARCEL
>    *              NPY_CPU_ARCEB
>    *              NPY_CPU_RISCV64
> -  *              NPY_CPU_LOONGARCH
>  + *              NPY_CPU_RISCV32
> +  *              NPY_CPU_LOONGARCH
>    *              NPY_CPU_WASM
>    */
> - #ifndef NUMPY_CORE_INCLUDE_NUMPY_NPY_CPU_H_
> -@@ -104,6 +105,8 @@
> +@@ -102,8 +103,12 @@
> +     #define NPY_CPU_ARCEL
> + #elif defined(__arc__) && defined(__BIG_ENDIAN__)
>       #define NPY_CPU_ARCEB
> - #elif defined(__riscv) && defined(__riscv_xlen) && __riscv_xlen =3D=3D =
64
> -     #define NPY_CPU_RISCV64
> -+#elif defined(__riscv) && defined(__riscv_xlen) && __riscv_xlen =3D=3D =
32
> -+    #define NPY_CPU_RISCV32
> +-#elif defined(__riscv) && defined(__riscv_xlen) && __riscv_xlen =3D=3D =
64
> +-    #define NPY_CPU_RISCV64
> ++#elif defined(__riscv)
> ++    #if __riscv_xlen =3D=3D 64
> ++      #define NPY_CPU_RISCV64
> ++    #elif __riscv_xlen =3D=3D 32
> ++      #define NPY_CPU_RISCV32
> ++    #endif
>   #elif defined(__loongarch__)
>       #define NPY_CPU_LOONGARCH
>   #elif defined(__EMSCRIPTEN__)
> -diff --git a/numpy/core/include/numpy/npy_endian.h b/numpy/core/include/=
numpy/npy_endian.h
> -index 5e58a7f..0926212 100644
> ---- a/numpy/core/include/numpy/npy_endian.h
> -+++ b/numpy/core/include/numpy/npy_endian.h
> +diff --git a/numpy/_core/include/numpy/npy_endian.h b/numpy/_core/includ=
e/numpy/npy_endian.h
> +index 5e58a7f52c..09262120bf 100644
> +--- a/numpy/_core/include/numpy/npy_endian.h
> ++++ b/numpy/_core/include/numpy/npy_endian.h
>  @@ -49,6 +49,7 @@
>               || defined(NPY_CPU_PPC64LE)       \
>               || defined(NPY_CPU_ARCEL)         \
> @@ -46,5 +54,5 @@ index 5e58a7f..0926212 100644
>               || defined(NPY_CPU_WASM)
>           #define NPY_BYTE_ORDER NPY_LITTLE_ENDIAN
>  --
> -2.20.1
> +2.39.5
>
> diff --git a/meta/recipes-devtools/python/python3-numpy_1.26.4.bb b/meta/=
recipes-devtools/python/python3-numpy_2.1.3.bb
> similarity index 68%
> rename from meta/recipes-devtools/python/python3-numpy_1.26.4.bb
> rename to meta/recipes-devtools/python/python3-numpy_2.1.3.bb
> index fa78b07f48b..da75dff1e04 100644
> --- a/meta/recipes-devtools/python/python3-numpy_1.26.4.bb
> +++ b/meta/recipes-devtools/python/python3-numpy_2.1.3.bb
> @@ -3,7 +3,7 @@ HOMEPAGE =3D "https://numpy.org/"
>  DESCRIPTION =3D "NumPy is the fundamental package needed for scientific =
computing with Python."
>  SECTION =3D "devel/python"
>  LICENSE =3D "BSD-3-Clause & BSD-2-Clause & PSF-2.0 & Apache-2.0 & MIT"
> -LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Da752eb20459cf74a9d84ee482=
5e8317c"
> +LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D1de863c37a83e71b1e97b64d0=
36ea78b"
>
>  SRCNAME =3D "numpy"
>
> @@ -13,22 +13,31 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/${SRC=
NAME}-${PV}.tar.gz \
>             file://fix_reproducibility.patch \
>             file://run-ptest \
>             "
> -SRC_URI[sha256sum] =3D "2a02aba9ed12e4ac4eb3ea9421c420301a0c6460d9830d74=
a9df87efa4912010"
> +SRC_URI[sha256sum] =3D "aa08e04e08aaf974d4458def539dece0d28146d866a39da5=
639596f4921fd761"
>
>  GITHUB_BASE_URI =3D "https://github.com/numpy/numpy/releases"
>  UPSTREAM_CHECK_REGEX =3D "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
>
> -inherit ptest setuptools3 github-releases cython
> +inherit ptest python_mesonpy github-releases cython
>
>  S =3D "${WORKDIR}/numpy-${PV}"
>
> -CLEANBROKEN =3D "1"
> +# Remove references to buildpaths from numpy's __config__.py
> +do_install:append() {
> +    sed -i \
> +        -e 's|${S}=3D||g' \
> +        -e 's|${B}=3D||g' \
> +        -e 's|${RECIPE_SYSROOT_NATIVE}=3D||g' \
> +        -e 's|${RECIPE_SYSROOT_NATIVE}||g' \
> +        -e 's|${RECIPE_SYSROOT}=3D||g' \
> +        -e 's|${RECIPE_SYSROOT}||g' ${D}${PYTHON_SITEPACKAGES_DIR}/numpy=
/__config__.py
>
> -do_compile:prepend() {
> -    export NPY_DISABLE_SVML=3D1
> +    nativepython3 -mcompileall -s ${D} ${D}${PYTHON_SITEPACKAGES_DIR}/nu=
mpy/__config__.py
>  }
>
> -FILES:${PN}-staticdev +=3D "${PYTHON_SITEPACKAGES_DIR}/numpy/core/lib/*.=
a ${PYTHON_SITEPACKAGES_DIR}/numpy/random/lib/*.a"
> +FILES:${PN}-staticdev +=3D "${PYTHON_SITEPACKAGES_DIR}/numpy/_core/lib/*=
.a \
> +                          ${PYTHON_SITEPACKAGES_DIR}/numpy/random/lib/*.=
a \
> +"
>
>  # install what is needed for numpy.test()
>  RDEPENDS:${PN} =3D "python3-unittest \
> @@ -59,7 +68,4 @@ RDEPENDS:${PN}-ptest +=3D "python3-pytest \
>                           ldd \
>  "
>
> -# Upstream has a pyproject.toml but as of 1.26.4 it's marked as experime=
ntal
> -INSANE_SKIP =3D "pep517-backend"
> -
>  BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.39.5
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#207543): https://lists.openembedded.org/g/openembedde=
d-core/message/207543
> Mute This Topic: https://lists.openembedded.org/mt/109705562/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

