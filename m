Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5C8DCCFA13
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 20:31:46 +0000 (UTC)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.161.1777581101869699991
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2026 13:31:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=fHqGwYz2;
 spf=pass (domain: gmail.com, ip: 209.85.161.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-694891f8f62so792005eaf.2
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 13:31:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777581101; cv=none;
        d=google.com; s=arc-20240605;
        b=b1GdSus4v13rOkT8Nurgn9g3uAzA1Uz27kqV6iyISS/0rI3bu/EYTxRgn/dc0XZWGU
         kMcbjkKe0/Olj1XIdgTJo/FPQvg9Ic0A7bFdNxPevuyVFsMPhHewIf5hvAB+wNpJLbM7
         b5Gf23jG7f3+mJxpoMBb5J29Fejiul1TgmBSdqMgxId4wIqzzesv/RGUdi63tS9Qo8RQ
         5I3koC9QvBKNHCww3J9jjI6UvgpUqUX0cvSLyh31hs71YW+tqXbHgrIbQkw4z4SjKD0O
         mu3E++hXDp8l+/m/Co2iiMvGXUSqDZ+MTu4xoCCBKVWq8ZoPcAPjbnarYjTBkAonf/AI
         r+DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=APbuJ32Ee5lIiSRUbjBsjvXFh+eCSuarVpZZNglxsrA=;
        fh=UxP1HceJM0T1LJz3AZ4pRYR3KesS3Uwc4ek1/I2Z9pE=;
        b=LN7hmxY7rlVQLnTQryUkAC00fl8fkFNnnY2LJOiPTREuC3Kg/ZAdRvEb0kbcyiMD6T
         pAQA2SGqQKC8K85SckIX6NgOZxH2++bTd5IOY54bjSbB+9HosidIO9xRpDdRYIUzrjdH
         /lT6hqbjoTsHK2dK/4E64XdntGSQoTirj+gNjvoRvQA61kQhUmgDKNbqRf/EhImg+rEd
         WxkXaTnnbbUTHD40gW6H/pq92BmOzp+xjkd4VDBYxth+fF1XoI9fqe/7JhDAM5f8gmfj
         v1T4044hsVUu/xXuncbfDRgrcOvFD2yx55j/guXI9XDiBTfOno6obLIk22YIioXB/N7u
         7iZA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777581101; x=1778185901; darn=lists.openembedded.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=APbuJ32Ee5lIiSRUbjBsjvXFh+eCSuarVpZZNglxsrA=;
        b=fHqGwYz2zD9JNmDS2IHK/QSpvsbWhdKtxxifVM5xLqHmw4QJV+TtxZr6rjnTRxPqz6
         85PJTjEzxnV2w9LpQX8JT1s746FhHNSIKcDVXnTfTXsH1qfAruOYlnhWRdLsZ31ZXkcr
         pCyVY6IWeb3Cc/q1OHXF9X2GEXaIgUrWSiIYywv/cTFkfHiBcjNl3CY/VaCR6qY05Q7c
         WoXQxTdRpHgfuDPaaf9dV3XQWKozv1yvhEgR1qv7p0D5fCS2RqI7Grc/qHfS0Ce45oBX
         j+4Jm3PmNYm4wGV6mrkde7iDvU18hXp7I5HNOIgw+1VtX35jaZ0Pw5TQEDAy5QBhWybU
         LK0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777581101; x=1778185901;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=APbuJ32Ee5lIiSRUbjBsjvXFh+eCSuarVpZZNglxsrA=;
        b=JtJipAmewGVFC+ReS0XKsElfWVeTKp23oOZwmk2lUy2/J8aNp6UAk9T11VgBBjfyiK
         1vu8kN1aUEbAO1JxG+4YKLu93GKrhE2eyaKUBW0H7xaXsNqF4OUK2sGY1PpZLXah8KQF
         s7YYNOOqwzH8MsakKTx35YNy7h/A8Q93VtQSfWAxAuTUzpIjmkp+ajVl3FBx8HHLiCtx
         tItOR4NWMXMfzriQYfm0G/Qk5R5aoWNAqS+S7sK224e4mKyhyoVyRO7mVBKmoLKyGaiV
         WNDa72p0+Z5xvPOE3S6C6vSA+i9m1VyazC6txstJCu0VijZwn40+DECLV26kD5G2az6b
         zarg==
X-Gm-Message-State: AOJu0Yy9/uc/YDn6J5uvAp5+oYjNUl/3YJA6VjtyRRDDcUQzxScXWlY3
	wrrEuGzcWxypiO2Mc6lPSnjwkNDHWWXRF92lVCtB9FilzOmEtlVQef9rEJo3l3GKq6ohlEgNAgC
	pUrpcuqLIXtPraNiT+EJapnKB2TRDKfaEPCGXXvI=
X-Gm-Gg: AeBDiesuWJob4CcjLDSwjMVaTinMO3KECIHRROFmrA2FL4ui3EWy31zamuwprWa3+ah
	B2z+/xB4OIHZfNbcwr3qKvV+wJ2yq2DO/anUevXOPahVW4kOhVTc4mC3K5FehJLeFBH/JW4lApx
	V/ji0yOW7AgqjQbdUY84ZBeaBlM6ajP0tpKfoijUqni8mXYJLlV9i25dUcey05LMQj2FFlSKRhk
	M+emJunla0yEkkQHukCZol5Kfqlj2HLGz6SaXi7qiaXNJIDrnWv5sl9sxPfAravPMwzq/zAuQqq
	tD9BW55vPTN1SYH6WnjH
X-Received: by 2002:a05:6820:2903:b0:67c:1b19:cd8a with SMTP id
 006d021491bc7-6967aa79c5amr2537258eaf.60.1777581100387; Thu, 30 Apr 2026
 13:31:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260329005804.525216-1-ankur.tyagi85@gmail.com>
In-Reply-To: <20260329005804.525216-1-ankur.tyagi85@gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Fri, 1 May 2026 08:31:29 +1200
X-Gm-Features: AVHnY4I8YUo2EfBXcq6zvwOY3z-WbtIJfLVIYyXEnL5RBUTl8XrpmGdULuXzJrI
Message-ID: <CADySD0FdwRz0h9nyrTnjHoLn1RB3Akmw9oXQd_ka_RFKs+1T9g@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2] vte: upgrade 0.82.2 -> 0.84.0
To: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 20:31:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236186

Hi Mathieu,

Is there anything else holding this one?

cheers
Ankur


On Sun, Mar 29, 2026 at 1:58=E2=80=AFPM <ankur.tyagi85@gmail.com> wrote:
>
> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>
> Drop patch which is now merged in simdutf[1] v7.7.1 used by vte[2]
>
> Added patch 0001-Add-a-C-API-897.patch as suggested[3] to resolve arm64
> build error
>
> [1] https://github.com/simdutf/simdutf/commit/c6f8e887ef51bb80dd978180042=
b9b9f4f46800f
> [2] https://gitlab.gnome.org/GNOME/vte/-/blob/0.84.0/subprojects/simdutf.=
wrap?ref_type=3Dtags
> [3] https://github.com/simdutf/simdutf/issues/951#issuecomment-4148745312
>
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  .../vte/vte/0001-Add-a-C-API-897.patch        | 1308 +++++++++++++++++
>  ...rt-reproducibility-for-debug-sources.patch |   48 -
>  .../vte/{vte_0.82.2.bb =3D> vte_0.84.0.bb}      |    6 +-
>  3 files changed, 1312 insertions(+), 50 deletions(-)
>  create mode 100644 meta/recipes-support/vte/vte/0001-Add-a-C-API-897.pat=
ch
>  delete mode 100644 meta/recipes-support/vte/vte/0001-support-reproducibi=
lity-for-debug-sources.patch
>  rename meta/recipes-support/vte/{vte_0.82.2.bb =3D> vte_0.84.0.bb} (93%)
>
> diff --git a/meta/recipes-support/vte/vte/0001-Add-a-C-API-897.patch b/me=
ta/recipes-support/vte/vte/0001-Add-a-C-API-897.patch
> new file mode 100644
> index 0000000000..21dde640ee
> --- /dev/null
> +++ b/meta/recipes-support/vte/vte/0001-Add-a-C-API-897.patch
> @@ -0,0 +1,1308 @@
> +From 9f07589bec31402c36a480a48fa4e29b19d3ea50 Mon Sep 17 00:00:00 2001
> +From: Daniel Lemire <daniel@lemire.me>
> +Date: Tue, 6 Jan 2026 10:56:04 -0500
> +Subject: [PATCH] Add a C API (#897)
> +
> +* Add a C API
> +
> +* lint.
> +
> +* workaround
> +
> +* tweaks
> +
> +* fixing the paths
> +
> +* lint
> +
> +* lint
> +
> +* Update README.md
> +
> +Co-authored-by: Copilot <175728472+Copilot@users.noreply.github.com>
> +
> +* Update singleheader/amalgamate.py
> +
> +Co-authored-by: Copilot <175728472+Copilot@users.noreply.github.com>
> +
> +* hack to make the amalgamation work.
> +
> +* added new test in pure C
> +
> +* add c file extension to clang format
> +
> +* clang format the c files
> +
> +* return platform independent exit status
> +
> +* ci: set c23 in latest standard job
> +
> +* ci: set c standard to 11
> +
> +* Update rvv-256-gcc-14.yml
> +
> +* marking the C implementation as experimental. fixing amalgamate.py bug=
.
> +
> +* simplifiying
> +
> +* correction.
> +
> +* ci: fix two remaining riscv jobs
> +
> +* ci: add amalgamation demo
> +
> +this is to prove that the amalgamation as
> +described in the README works both for
> +C++ and C.
> +
> +* ci: TEMPORARY try clang 20 riscv job
> +
> +* fixup! ci: fix two remaining riscv jobs
> +
> +* Revert "ci: TEMPORARY try clang 20 riscv job"
> +
> +This reverts commit 032c633d6f642cde227922d992b7eca1afccf6f4.
> +
> +* removing bad extern c
> +
> +---------
> +
> +Co-authored-by: Copilot <175728472+Copilot@users.noreply.github.com>
> +Co-authored-by: Paul Dreik <github@pauldreik.se>
> +
> +Upstream-Status: Backport [https://github.com/simdutf/simdutf/commit/254=
2805947b0592c3bf65b7ca778b0406fe0b6ee]
> +
> +Dropped changes to github workflow and test during the backport
> +Signed-off-by: Ankur Tyagi <ankur.tyagi@navicogroup.com>
> +---
> + .github/workflows/rvv-1024-clang-18.yml |  29 --
> + .github/workflows/rvv-128-clang-17.yml  |  29 --
> + .github/workflows/rvv-256-gcc-14.yml    |  29 --
> + CMakeLists.txt                          |   9 +-
> + include/simdutf_c.h                     | 337 ++++++++++++++
> + scripts/clang_format.sh                 |   2 +-
> + singleheader/README.md                  |  12 +
> + singleheader/amalgamate.py              |  12 +-
> + singleheader/amalgamation_demo.c        |  59 +++
> + src/simdutf.cpp                         |   1 +
> + src/simdutf/arm64/implementation.h      |   2 +-
> + src/simdutf_c.cpp                       | 577 ++++++++++++++++++++++++
> + 12 files changed, 1005 insertions(+), 93 deletions(-)
> + delete mode 100644 .github/workflows/rvv-1024-clang-18.yml
> + delete mode 100644 .github/workflows/rvv-128-clang-17.yml
> + delete mode 100644 .github/workflows/rvv-256-gcc-14.yml
> + create mode 100644 include/simdutf_c.h
> + create mode 100644 singleheader/amalgamation_demo.c
> + create mode 100644 src/simdutf_c.cpp
> +
> +diff --git a/.github/workflows/rvv-1024-clang-18.yml b/.github/workflows=
/rvv-1024-clang-18.yml
> +deleted file mode 100644
> +index 25ef5f09..00000000
> +--- a/.github/workflows/rvv-1024-clang-18.yml
> ++++ /dev/null
> +@@ -1,29 +0,0 @@
> +-name: Ubuntu rvv VLEN=3D1024 (clang 18)
> +-
> +-on:
> +-  push:
> +-    branches:
> +-      - master
> +-  pull_request:
> +-    branches:
> +-      - master
> +-
> +-jobs:
> +-  build:
> +-    runs-on: ubuntu-24.04
> +-    steps:
> +-    - uses: actions/checkout@v4
> +-    - name: Install packages
> +-      run: |
> +-        sudo apt-get update -q -y
> +-        sudo apt-get install -y cmake make g++-riscv64-linux-gnu qemu-u=
ser-static clang-18
> +-    - name: Build
> +-      run: |
> +-        CXX=3Dclang++-18 CXXFLAGS=3D"--target=3Driscv64-linux-gnu -marc=
h=3Drv64gcv_zvbb" \
> +-        cmake --toolchain=3Dcmake/toolchains-ci/riscv64-linux-gnu.cmake=
 -DCMAKE_BUILD_TYPE=3DRelease -B build -DSIMDUTF_FAST_TESTS=3DOn
> +-        cmake --build build/ -j$(nproc)
> +-    - name: Test VLEN=3D1024
> +-      run: |
> +-        export QEMU_LD_PREFIX=3D"/usr/riscv64-linux-gnu"
> +-        export QEMU_CPU=3D"rv64,v=3Don,zvbb=3Don,vlen=3D1024,rvv_ta_all=
_1s=3Don,rvv_ma_all_1s=3Don"
> +-        ctest --timeout 1800 --output-on-failure --test-dir build -j $(=
nproc)
> +diff --git a/.github/workflows/rvv-128-clang-17.yml b/.github/workflows/=
rvv-128-clang-17.yml
> +deleted file mode 100644
> +index d0c09022..00000000
> +--- a/.github/workflows/rvv-128-clang-17.yml
> ++++ /dev/null
> +@@ -1,29 +0,0 @@
> +-name: Ubuntu rvv VLEN=3D128 (clang 17)
> +-
> +-on:
> +-  push:
> +-    branches:
> +-      - master
> +-  pull_request:
> +-    branches:
> +-      - master
> +-
> +-jobs:
> +-  build:
> +-    runs-on: ubuntu-24.04
> +-    steps:
> +-    - uses: actions/checkout@v4
> +-    - name: Install packages
> +-      run: |
> +-        sudo apt-get update -q -y
> +-        sudo apt-get install -y cmake make g++-riscv64-linux-gnu qemu-u=
ser-static clang-17
> +-    - name: Build
> +-      run: |
> +-        CXX=3Dclang++-17 CXXFLAGS=3D"--target=3Driscv64-linux-gnu -marc=
h=3Drv64gcv" \
> +-        cmake --toolchain=3Dcmake/toolchains-ci/riscv64-linux-gnu.cmake=
 -DCMAKE_BUILD_TYPE=3DRelease -B build -DSIMDUTF_FAST_TESTS=3DOn
> +-        cmake --build build/ -j$(nproc)
> +-    - name: Test VLEN=3D128
> +-      run: |
> +-        export QEMU_LD_PREFIX=3D"/usr/riscv64-linux-gnu"
> +-        export QEMU_CPU=3D"rv64,v=3Don,vlen=3D128,rvv_ta_all_1s=3Don,rv=
v_ma_all_1s=3Don"
> +-        ctest --timeout 1800 --output-on-failure --test-dir build -j $(=
nproc)
> +diff --git a/.github/workflows/rvv-256-gcc-14.yml b/.github/workflows/rv=
v-256-gcc-14.yml
> +deleted file mode 100644
> +index 6b6fc9ff..00000000
> +--- a/.github/workflows/rvv-256-gcc-14.yml
> ++++ /dev/null
> +@@ -1,29 +0,0 @@
> +-name: Ubuntu rvv VLEN=3D256 (gcc 14)
> +-
> +-on:
> +-  push:
> +-    branches:
> +-      - master
> +-  pull_request:
> +-    branches:
> +-      - master
> +-
> +-jobs:
> +-  build:
> +-    runs-on: ubuntu-24.04
> +-    steps:
> +-    - uses: actions/checkout@v4
> +-    - name: Install packages
> +-      run: |
> +-        sudo apt-get update -q -y
> +-        sudo apt-get install -y cmake make g++-14-riscv64-linux-gnu qem=
u-user-static
> +-    - name: Build
> +-      run: |
> +-        CXX=3Driscv64-linux-gnu-g++-14 CXXFLAGS=3D-march=3Drv64gcv \
> +-        cmake --toolchain=3Dcmake/toolchains-ci/riscv64-linux-gnu.cmake=
 -DCMAKE_BUILD_TYPE=3DRelease -B build -DSIMDUTF_FAST_TESTS=3DOn
> +-        cmake --build build/ -j$(nproc)
> +-    - name: Test VLEN=3D256
> +-      run: |
> +-        export QEMU_LD_PREFIX=3D"/usr/riscv64-linux-gnu"
> +-        export QEMU_CPU=3D"rv64,v=3Don,zvbb=3Don,vlen=3D256,rvv_ta_all_=
1s=3Don,rvv_ma_all_1s=3Don"
> +-        ctest --timeout 1800 --output-on-failure --test-dir build -j $(=
nproc)
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index fb97fb24..ba8b6907 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -2,7 +2,7 @@ cmake_minimum_required(VERSION 3.15)
> +
> + project(simdutf
> +   DESCRIPTION "Fast Unicode validation, transcoding and processing"
> +-  LANGUAGES CXX
> ++  LANGUAGES C CXX
> +   VERSION 7.7.1
> + )
> +
> +@@ -105,6 +105,13 @@ install(
> +     COMPONENT simdutf_Development
> + )
> +
> ++
> ++install(
> ++    FILES include/simdutf_c.h
> ++    DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}"
> ++    COMPONENT simdutf_Development
> ++)
> ++
> + install(
> +     DIRECTORY include/simdutf
> +     DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}"
> +diff --git a/include/simdutf_c.h b/include/simdutf_c.h
> +new file mode 100644
> +index 00000000..c520fb52
> +--- /dev/null
> ++++ b/include/simdutf_c.h
> +@@ -0,0 +1,337 @@
> ++/***
> ++ * simdutf_c.h.h - C API for simdutf
> ++ * This is currently experimental.
> ++ * We are committed to keeping the C API, but there might be mistakes i=
n our
> ++ * implementation. Please report any issues you find.
> ++ */
> ++
> ++#ifndef SIMDUTF_C_H
> ++#define SIMDUTF_C_H
> ++
> ++#include <stddef.h>
> ++#include <stdbool.h>
> ++#include <stdint.h>
> ++
> ++#ifdef __has_include
> ++  #if __has_include(<uchar.h>)
> ++    #include <uchar.h>
> ++  #else // __has_include(<uchar.h>)
> ++    #define char16_t uint16_t
> ++    #define char32_t uint32_t
> ++  #endif // __has_include(<uchar.h>)
> ++#else    // __has_include(<uchar.h>)
> ++  #define char16_t uint16_t
> ++  #define char32_t uint32_t
> ++#endif // __has_include
> ++
> ++#ifdef __cplusplus
> ++extern "C" {
> ++#endif
> ++
> ++/* C-friendly subset of simdutf errors */
> ++typedef enum simdutf_error_code {
> ++  SIMDUTF_ERROR_SUCCESS =3D 0,
> ++  SIMDUTF_ERROR_HEADER_BITS,
> ++  SIMDUTF_ERROR_TOO_SHORT,
> ++  SIMDUTF_ERROR_TOO_LONG,
> ++  SIMDUTF_ERROR_OVERLONG,
> ++  SIMDUTF_ERROR_TOO_LARGE,
> ++  SIMDUTF_ERROR_SURROGATE,
> ++  SIMDUTF_ERROR_INVALID_BASE64_CHARACTER,
> ++  SIMDUTF_ERROR_BASE64_INPUT_REMAINDER,
> ++  SIMDUTF_ERROR_BASE64_EXTRA_BITS,
> ++  SIMDUTF_ERROR_OUTPUT_BUFFER_TOO_SMALL,
> ++  SIMDUTF_ERROR_OTHER
> ++} simdutf_error_code;
> ++
> ++typedef struct simdutf_result {
> ++  simdutf_error_code error;
> ++  size_t count; /* position of error or number of code units validated =
*/
> ++} simdutf_result;
> ++
> ++typedef enum simdutf_encoding_type {
> ++  SIMDUTF_ENCODING_UNSPECIFIED =3D 0,
> ++  SIMDUTF_ENCODING_UTF8 =3D 1,
> ++  SIMDUTF_ENCODING_UTF16_LE =3D 2,
> ++  SIMDUTF_ENCODING_UTF16_BE =3D 4,
> ++  SIMDUTF_ENCODING_UTF32_LE =3D 8,
> ++  SIMDUTF_ENCODING_UTF32_BE =3D 16
> ++} simdutf_encoding_type;
> ++
> ++/* Validate UTF-8: returns true iff input is valid UTF-8 */
> ++bool simdutf_validate_utf8(const char *buf, size_t len);
> ++
> ++/* Validate UTF-8 with detailed result */
> ++simdutf_result simdutf_validate_utf8_with_errors(const char *buf, size_=
t len);
> ++
> ++/* Encoding detection */
> ++simdutf_encoding_type simdutf_autodetect_encoding(const char *input,
> ++                                                  size_t length);
> ++int simdutf_detect_encodings(const char *input, size_t length);
> ++
> ++/* ASCII validation */
> ++bool simdutf_validate_ascii(const char *buf, size_t len);
> ++simdutf_result simdutf_validate_ascii_with_errors(const char *buf, size=
_t len);
> ++
> ++/* UTF-16 ASCII checks */
> ++bool simdutf_validate_utf16_as_ascii(const char16_t *buf, size_t len);
> ++bool simdutf_validate_utf16be_as_ascii(const char16_t *buf, size_t len)=
;
> ++bool simdutf_validate_utf16le_as_ascii(const char16_t *buf, size_t len)=
;
> ++
> ++/* UTF-16/UTF-8/UTF-32 validation (native/endian-specific) */
> ++bool simdutf_validate_utf16(const char16_t *buf, size_t len);
> ++bool simdutf_validate_utf16le(const char16_t *buf, size_t len);
> ++bool simdutf_validate_utf16be(const char16_t *buf, size_t len);
> ++simdutf_result simdutf_validate_utf16_with_errors(const char16_t *buf,
> ++                                                  size_t len);
> ++simdutf_result simdutf_validate_utf16le_with_errors(const char16_t *buf=
,
> ++                                                    size_t len);
> ++simdutf_result simdutf_validate_utf16be_with_errors(const char16_t *buf=
,
> ++                                                    size_t len);
> ++
> ++bool simdutf_validate_utf32(const char32_t *buf, size_t len);
> ++simdutf_result simdutf_validate_utf32_with_errors(const char32_t *buf,
> ++                                                  size_t len);
> ++
> ++/* to_well_formed UTF-16 helpers */
> ++void simdutf_to_well_formed_utf16le(const char16_t *input, size_t len,
> ++                                    char16_t *output);
> ++void simdutf_to_well_formed_utf16be(const char16_t *input, size_t len,
> ++                                    char16_t *output);
> ++void simdutf_to_well_formed_utf16(const char16_t *input, size_t len,
> ++                                  char16_t *output);
> ++
> ++/* Counting */
> ++size_t simdutf_count_utf16(const char16_t *input, size_t length);
> ++size_t simdutf_count_utf16le(const char16_t *input, size_t length);
> ++size_t simdutf_count_utf16be(const char16_t *input, size_t length);
> ++size_t simdutf_count_utf8(const char *input, size_t length);
> ++
> ++/* Length estimators */
> ++size_t simdutf_utf8_length_from_latin1(const char *input, size_t length=
);
> ++size_t simdutf_latin1_length_from_utf8(const char *input, size_t length=
);
> ++size_t simdutf_latin1_length_from_utf16(size_t length);
> ++size_t simdutf_latin1_length_from_utf32(size_t length);
> ++size_t simdutf_utf16_length_from_utf8(const char *input, size_t length)=
;
> ++size_t simdutf_utf32_length_from_utf8(const char *input, size_t length)=
;
> ++size_t simdutf_utf8_length_from_utf16(const char16_t *input, size_t len=
gth);
> ++simdutf_result
> ++simdutf_utf8_length_from_utf16_with_replacement(const char16_t *input,
> ++                                                size_t length);
> ++size_t simdutf_utf8_length_from_utf16le(const char16_t *input, size_t l=
ength);
> ++size_t simdutf_utf8_length_from_utf16be(const char16_t *input, size_t l=
ength);
> ++simdutf_result
> ++simdutf_utf8_length_from_utf16le_with_replacement(const char16_t *input=
,
> ++                                                  size_t length);
> ++simdutf_result
> ++simdutf_utf8_length_from_utf16be_with_replacement(const char16_t *input=
,
> ++                                                  size_t length);
> ++
> ++/* Conversions: latin1 <-> utf8, utf8 <-> utf16/utf32, utf16 <-> utf8, =
etc. */
> ++size_t simdutf_convert_latin1_to_utf8(const char *input, size_t length,
> ++                                      char *output);
> ++size_t simdutf_convert_latin1_to_utf16le(const char *input, size_t leng=
th,
> ++                                         char16_t *output);
> ++size_t simdutf_convert_latin1_to_utf16be(const char *input, size_t leng=
th,
> ++                                         char16_t *output);
> ++size_t simdutf_convert_latin1_to_utf32(const char *input, size_t length=
,
> ++                                       char32_t *output);
> ++
> ++size_t simdutf_convert_utf8_to_latin1(const char *input, size_t length,
> ++                                      char *output);
> ++size_t simdutf_convert_utf8_to_utf16le(const char *input, size_t length=
,
> ++                                       char16_t *output);
> ++size_t simdutf_convert_utf8_to_utf16be(const char *input, size_t length=
,
> ++                                       char16_t *output);
> ++size_t simdutf_convert_utf8_to_utf16(const char *input, size_t length,
> ++                                     char16_t *output);
> ++
> ++size_t simdutf_convert_utf8_to_utf32(const char *input, size_t length,
> ++                                     char32_t *output);
> ++simdutf_result simdutf_convert_utf8_to_latin1_with_errors(const char *i=
nput,
> ++                                                          size_t length=
,
> ++                                                          char *output)=
;
> ++simdutf_result simdutf_convert_utf8_to_utf16_with_errors(const char *in=
put,
> ++                                                         size_t length,
> ++                                                         char16_t *outp=
ut);
> ++simdutf_result simdutf_convert_utf8_to_utf16le_with_errors(const char *=
input,
> ++                                                           size_t lengt=
h,
> ++                                                           char16_t *ou=
tput);
> ++simdutf_result simdutf_convert_utf8_to_utf16be_with_errors(const char *=
input,
> ++                                                           size_t lengt=
h,
> ++                                                           char16_t *ou=
tput);
> ++simdutf_result simdutf_convert_utf8_to_utf32_with_errors(const char *in=
put,
> ++                                                         size_t length,
> ++                                                         char32_t *outp=
ut);
> ++
> ++/* Conversions assuming valid input */
> ++size_t simdutf_convert_valid_utf8_to_latin1(const char *input, size_t l=
ength,
> ++                                            char *output);
> ++size_t simdutf_convert_valid_utf8_to_utf16le(const char *input, size_t =
length,
> ++                                             char16_t *output);
> ++size_t simdutf_convert_valid_utf8_to_utf16be(const char *input, size_t =
length,
> ++                                             char16_t *output);
> ++size_t simdutf_convert_valid_utf8_to_utf32(const char *input, size_t le=
ngth,
> ++                                           char32_t *output);
> ++
> ++/* UTF-16 -> UTF-8 and related conversions */
> ++size_t simdutf_convert_utf16_to_utf8(const char16_t *input, size_t leng=
th,
> ++                                     char *output);
> ++size_t simdutf_convert_utf16le_to_utf8(const char16_t *input, size_t le=
ngth,
> ++                                       char *output);
> ++size_t simdutf_convert_utf16be_to_utf8(const char16_t *input, size_t le=
ngth,
> ++                                       char *output);
> ++size_t simdutf_convert_utf16_to_utf8_safe(const char16_t *input, size_t=
 length,
> ++                                          char *output, size_t utf8_len=
);
> ++size_t simdutf_convert_utf16_to_latin1(const char16_t *input, size_t le=
ngth,
> ++                                       char *output);
> ++size_t simdutf_convert_utf16le_to_latin1(const char16_t *input, size_t =
length,
> ++                                         char *output);
> ++size_t simdutf_convert_utf16be_to_latin1(const char16_t *input, size_t =
length,
> ++                                         char *output);
> ++simdutf_result
> ++simdutf_convert_utf16_to_latin1_with_errors(const char16_t *input,
> ++                                            size_t length, char *output=
);
> ++simdutf_result
> ++simdutf_convert_utf16le_to_latin1_with_errors(const char16_t *input,
> ++                                              size_t length, char *outp=
ut);
> ++simdutf_result
> ++simdutf_convert_utf16be_to_latin1_with_errors(const char16_t *input,
> ++                                              size_t length, char *outp=
ut);
> ++
> ++simdutf_result simdutf_convert_utf16_to_utf8_with_errors(const char16_t=
 *input,
> ++                                                         size_t length,
> ++                                                         char *output);
> ++simdutf_result
> ++simdutf_convert_utf16le_to_utf8_with_errors(const char16_t *input,
> ++                                            size_t length, char *output=
);
> ++simdutf_result
> ++simdutf_convert_utf16be_to_utf8_with_errors(const char16_t *input,
> ++                                            size_t length, char *output=
);
> ++
> ++size_t simdutf_convert_valid_utf16_to_utf8(const char16_t *input, size_=
t length,
> ++                                           char *output);
> ++size_t simdutf_convert_valid_utf16_to_latin1(const char16_t *input,
> ++                                             size_t length, char *outpu=
t);
> ++size_t simdutf_convert_valid_utf16le_to_latin1(const char16_t *input,
> ++                                               size_t length, char *out=
put);
> ++size_t simdutf_convert_valid_utf16be_to_latin1(const char16_t *input,
> ++                                               size_t length, char *out=
put);
> ++
> ++size_t simdutf_convert_valid_utf16le_to_utf8(const char16_t *input,
> ++                                             size_t length, char *outpu=
t);
> ++size_t simdutf_convert_valid_utf16be_to_utf8(const char16_t *input,
> ++                                             size_t length, char *outpu=
t);
> ++
> ++/* UTF-16 <-> UTF-32 conversions */
> ++size_t simdutf_convert_utf16_to_utf32(const char16_t *input, size_t len=
gth,
> ++                                      char32_t *output);
> ++size_t simdutf_convert_utf16le_to_utf32(const char16_t *input, size_t l=
ength,
> ++                                        char32_t *output);
> ++size_t simdutf_convert_utf16be_to_utf32(const char16_t *input, size_t l=
ength,
> ++                                        char32_t *output);
> ++simdutf_result simdutf_convert_utf16_to_utf32_with_errors(const char16_=
t *input,
> ++                                                          size_t length=
,
> ++                                                          char32_t *out=
put);
> ++simdutf_result
> ++simdutf_convert_utf16le_to_utf32_with_errors(const char16_t *input,
> ++                                             size_t length, char32_t *o=
utput);
> ++simdutf_result
> ++simdutf_convert_utf16be_to_utf32_with_errors(const char16_t *input,
> ++                                             size_t length, char32_t *o=
utput);
> ++
> ++/* Valid UTF-16 conversions */
> ++size_t simdutf_convert_valid_utf16_to_utf32(const char16_t *input,
> ++                                            size_t length, char32_t *ou=
tput);
> ++size_t simdutf_convert_valid_utf16le_to_utf32(const char16_t *input,
> ++                                              size_t length, char32_t *=
output);
> ++size_t simdutf_convert_valid_utf16be_to_utf32(const char16_t *input,
> ++                                              size_t length, char32_t *=
output);
> ++
> ++/* UTF-32 -> ... conversions */
> ++size_t simdutf_convert_utf32_to_utf8(const char32_t *input, size_t leng=
th,
> ++                                     char *output);
> ++simdutf_result simdutf_convert_utf32_to_utf8_with_errors(const char32_t=
 *input,
> ++                                                         size_t length,
> ++                                                         char *output);
> ++size_t simdutf_convert_valid_utf32_to_utf8(const char32_t *input, size_=
t length,
> ++                                           char *output);
> ++
> ++size_t simdutf_convert_utf32_to_utf16(const char32_t *input, size_t len=
gth,
> ++                                      char16_t *output);
> ++size_t simdutf_convert_utf32_to_utf16le(const char32_t *input, size_t l=
ength,
> ++                                        char16_t *output);
> ++size_t simdutf_convert_utf32_to_utf16be(const char32_t *input, size_t l=
ength,
> ++                                        char16_t *output);
> ++simdutf_result
> ++simdutf_convert_utf32_to_latin1_with_errors(const char32_t *input,
> ++                                            size_t length, char *output=
);
> ++
> ++/* --- Find helpers --- */
> ++const char *simdutf_find(const char *start, const char *end, char chara=
cter);
> ++const char16_t *simdutf_find_utf16(const char16_t *start, const char16_=
t *end,
> ++                                   char16_t character);
> ++
> ++/* --- Base64 enums and helpers --- */
> ++typedef enum simdutf_base64_options {
> ++  SIMDUTF_BASE64_DEFAULT =3D 0,
> ++  SIMDUTF_BASE64_URL =3D 1,
> ++  SIMDUTF_BASE64_DEFAULT_NO_PADDING =3D 2,
> ++  SIMDUTF_BASE64_URL_WITH_PADDING =3D 3,
> ++  SIMDUTF_BASE64_DEFAULT_ACCEPT_GARBAGE =3D 4,
> ++  SIMDUTF_BASE64_URL_ACCEPT_GARBAGE =3D 5,
> ++  SIMDUTF_BASE64_DEFAULT_OR_URL =3D 8,
> ++  SIMDUTF_BASE64_DEFAULT_OR_URL_ACCEPT_GARBAGE =3D 12
> ++} simdutf_base64_options;
> ++
> ++typedef enum simdutf_last_chunk_handling_options {
> ++  SIMDUTF_LAST_CHUNK_LOOSE =3D 0,
> ++  SIMDUTF_LAST_CHUNK_STRICT =3D 1,
> ++  SIMDUTF_LAST_CHUNK_STOP_BEFORE_PARTIAL =3D 2,
> ++  SIMDUTF_LAST_CHUNK_ONLY_FULL_CHUNKS =3D 3
> ++} simdutf_last_chunk_handling_options;
> ++
> ++/* maximal binary length estimators */
> ++size_t simdutf_maximal_binary_length_from_base64(const char *input,
> ++                                                 size_t length);
> ++size_t simdutf_maximal_binary_length_from_base64_utf16(const char16_t *=
input,
> ++                                                       size_t length);
> ++
> ++/* base64 decoding/encoding */
> ++simdutf_result simdutf_base64_to_binary(
> ++    const char *input, size_t length, char *output,
> ++    simdutf_base64_options options,
> ++    simdutf_last_chunk_handling_options last_chunk_options);
> ++simdutf_result simdutf_base64_to_binary_utf16(
> ++    const char16_t *input, size_t length, char *output,
> ++    simdutf_base64_options options,
> ++    simdutf_last_chunk_handling_options last_chunk_options);
> ++
> ++size_t simdutf_base64_length_from_binary(size_t length,
> ++                                         simdutf_base64_options options=
);
> ++size_t simdutf_base64_length_from_binary_with_lines(
> ++    size_t length, simdutf_base64_options options, size_t line_length);
> ++
> ++size_t simdutf_binary_to_base64(const char *input, size_t length, char =
*output,
> ++                                simdutf_base64_options options);
> ++size_t simdutf_binary_to_base64_with_lines(const char *input, size_t le=
ngth,
> ++                                           char *output, size_t line_le=
ngth,
> ++                                           simdutf_base64_options optio=
ns);
> ++
> ++/* safe decoding that provides an in/out outlen parameter */
> ++simdutf_result simdutf_base64_to_binary_safe(
> ++    const char *input, size_t length, char *output, size_t *outlen,
> ++    simdutf_base64_options options,
> ++    simdutf_last_chunk_handling_options last_chunk_options,
> ++    bool decode_up_to_bad_char);
> ++simdutf_result simdutf_base64_to_binary_safe_utf16(
> ++    const char16_t *input, size_t length, char *output, size_t *outlen,
> ++    simdutf_base64_options options,
> ++    simdutf_last_chunk_handling_options last_chunk_options,
> ++    bool decode_up_to_bad_char);
> ++
> ++#ifdef __cplusplus
> ++} /* extern "C" */
> ++#endif
> ++
> ++#endif /* SIMDUTF_C_H */
> +diff --git a/scripts/clang_format.sh b/scripts/clang_format.sh
> +index 3501707c..d6bfd298 100755
> +--- a/scripts/clang_format.sh
> ++++ b/scripts/clang_format.sh
> +@@ -31,5 +31,5 @@ gitroot=3D"$(git rev-parse --show-toplevel)"
> + cd "$gitroot"
> +
> + git ls-files -z | \
> +-    grep -z -E '(\.cpp|\.h)$' |\
> ++    grep -z -E '(\.c|\.cpp|\.h)$' |\
> +     xargs --null -P $(nproc) -n1 $cf -i
> +diff --git a/singleheader/README.md b/singleheader/README.md
> +index e3fab60a..693fe835 100644
> +--- a/singleheader/README.md
> ++++ b/singleheader/README.md
> +@@ -4,4 +4,16 @@ While in the singleheader directory under a linux or ma=
cOS system with an instal
> +
> + ```
> + c++ -o amalgamation_demo amalgamation_demo.cpp -std=3Dc++17 && ./amalga=
mation_demo
> ++```
> ++
> ++
> ++### C Demo
> ++
> ++You may also build a C executable.
> ++
> ++```
> ++c++ -c simdutf.cpp
> ++cc -c ./amalgamation_demo.c
> ++c++ amalgamation_demo.o simdutf.o -o cdemo
> ++./cdemo
> + ```
> +\ No newline at end of file
> +diff --git a/singleheader/amalgamate.py b/singleheader/amalgamate.py
> +index 75e0d78c..0b8991d5 100755
> +--- a/singleheader/amalgamate.py
> ++++ b/singleheader/amalgamate.py
> +@@ -282,9 +282,15 @@ def create_files():
> +         for cpp in ALLCFILES:
> +             doinclude(cpp, f"ERROR {cpp} not found")
> +
> +-    # copy the README and DEMOCPP
> ++    # copy the README, DEMO and C API header
> ++    print(f"Copying additional files to {outdir}")
> ++    # C API header
> ++    c_header_path =3D os.path.join(PROJECTPATH, "include", "simdutf_c.h=
")
> ++    print(f"Creating {outdir}/simdutf_c.h")
> ++    shutil.copy2(c_header_path, outdir)
> +     if SCRIPTPATH !=3D outdir:
> +-        for name in ["amalgamation_demo.cpp", "README.md"]:
> ++        for name in ["amalgamation_demo.cpp", "README.md", "amalgamatio=
n_demo.c"]:
> ++            print(f"Processing {name}")
> +             path =3D os.path.join(SCRIPTPATH, name)
> +             print(f"Creating {outdir}/{name}")
> +             shutil.copy2(path, outdir)
> +@@ -297,7 +303,7 @@ def create_zip():
> +     path =3D os.path.join(outdir, context.zipname)
> +     print(f"Creating {path}")
> +     with zipfile.ZipFile(path, 'w') as zf:
> +-        for name in ["simdutf.cpp", "simdutf.h", "amalgamation_demo.cpp=
", "README.md"]:
> ++        for name in ["simdutf.cpp", "simdutf.h", "amalgamation_demo.cpp=
", "README.md", "simdutf_c.h", "amalgamation_demo.c"]:
> +             source =3D os.path.join(outdir, name)
> +             zf.write(source, name)
> +
> +diff --git a/singleheader/amalgamation_demo.c b/singleheader/amalgamatio=
n_demo.c
> +new file mode 100644
> +index 00000000..51710ef4
> +--- /dev/null
> ++++ b/singleheader/amalgamation_demo.c
> +@@ -0,0 +1,59 @@
> ++#include <stdio.h>
> ++#include <stdlib.h>
> ++#include <string.h>
> ++
> ++#include "simdutf_c.h"
> ++
> ++int main(void) {
> ++  printf("SIMDUTF C API demo\n");
> ++  const char *source =3D "1234";
> ++  /* validate UTF-8 */
> ++  if (!simdutf_validate_utf8(source, 4)) {
> ++    puts("invalid UTF-8");
> ++    return EXIT_FAILURE;
> ++  }
> ++  puts("valid UTF-8");
> ++
> ++  /* Convert UTF-8 -> UTF-16LE */
> ++  size_t expected_utf16 =3D simdutf_utf16_length_from_utf8(source, 4);
> ++  char16_t *utf16_output =3D
> ++      (char16_t *)malloc(expected_utf16 * sizeof(char16_t));
> ++  if (!utf16_output)
> ++    return EXIT_FAILURE;
> ++  size_t utf16words =3D simdutf_convert_utf8_to_utf16le(source, 4, utf1=
6_output);
> ++  printf("wrote %zu UTF-16LE words.\n", utf16words);
> ++
> ++  if (!simdutf_validate_utf16le(utf16_output, utf16words)) {
> ++    puts("invalid UTF-16LE");
> ++    free(utf16_output);
> ++    return EXIT_FAILURE;
> ++  }
> ++  puts("valid UTF-16LE");
> ++
> ++  /* Convert back UTF-16LE -> UTF-8 */
> ++  size_t expected_utf8 =3D
> ++      simdutf_utf8_length_from_utf16le(utf16_output, utf16words);
> ++  char *utf8_output =3D (char *)malloc(expected_utf8 + 1);
> ++  if (!utf8_output) {
> ++    free(utf16_output);
> ++    return EXIT_FAILURE;
> ++  }
> ++  size_t utf8words =3D
> ++      simdutf_convert_utf16le_to_utf8(utf16_output, utf16words, utf8_ou=
tput);
> ++  utf8_output[utf8words] =3D '\0';
> ++  printf("wrote %zu UTF-8 words.\n", utf8words);
> ++  puts(utf8_output);
> ++
> ++  if (strcmp(utf8_output, source) !=3D 0) {
> ++    puts("bad conversion");
> ++    free(utf16_output);
> ++    free(utf8_output);
> ++    return EXIT_FAILURE;
> ++  } else {
> ++    puts("perfect round trip");
> ++  }
> ++
> ++  free(utf16_output);
> ++  free(utf8_output);
> ++  return EXIT_SUCCESS;
> ++}
> +diff --git a/src/simdutf.cpp b/src/simdutf.cpp
> +index 49925dc9..52e4ae00 100644
> +--- a/src/simdutf.cpp
> ++++ b/src/simdutf.cpp
> +@@ -153,4 +153,5 @@ SIMDUTF_DISABLE_UNDESIRED_WARNINGS
> +   #include "lasx/implementation.cpp"
> + #endif
> +
> ++#include "simdutf_c.cpp"
> + SIMDUTF_POP_DISABLE_WARNINGS
> +diff --git a/src/simdutf/arm64/implementation.h b/src/simdutf/arm64/impl=
ementation.h
> +index ae91895b..61c29634 100644
> +--- a/src/simdutf/arm64/implementation.h
> ++++ b/src/simdutf/arm64/implementation.h
> +@@ -284,8 +284,8 @@ public:
> +                    char character) const noexcept;
> +   const char16_t *find(const char16_t *start, const char16_t *end,
> +                        char16_t character) const noexcept;
> +-};
> + #endif // SIMDUTF_FEATURE_BASE64
> ++};
> +
> + } // namespace arm64
> + } // namespace simdutf
> +diff --git a/src/simdutf_c.cpp b/src/simdutf_c.cpp
> +new file mode 100644
> +index 00000000..629a96ca
> +--- /dev/null
> ++++ b/src/simdutf_c.cpp
> +@@ -0,0 +1,577 @@
> ++#include "simdutf_c.h"
> ++#include "simdutf/implementation.h"
> ++
> ++static simdutf_result to_c_result(const simdutf::result &r) {
> ++  simdutf_result out;
> ++  out.error =3D static_cast<simdutf_error_code>(r.error);
> ++  out.count =3D r.count;
> ++  return out;
> ++}
> ++
> ++/* The C wrapper depends on the library features. Only expose the C API
> ++   when all relevant feature is enabled. This helps the
> ++   single-header generator to omit the C wrapper when features are
> ++   disabled. */
> ++// clang-format off
> ++#if SIMDUTF_FEATURE_UTF8 && SIMDUTF_FEATURE_UTF16 && SIMDUTF_FEATURE_UT=
F32 && SIMDUTF_FEATURE_LATIN1 && SIMDUTF_FEATURE_ASCII && SIMDUTF_FEATURE_B=
ASE64 && SIMDUTF_FEATURE_DETECT_ENCODING
> ++// clang-format on
> ++extern "C" {
> ++
> ++bool simdutf_validate_utf8(const char *buf, size_t len) {
> ++  return simdutf::validate_utf8(buf, len);
> ++}
> ++
> ++simdutf_result simdutf_validate_utf8_with_errors(const char *buf, size_=
t len) {
> ++  return to_c_result(simdutf::validate_utf8_with_errors(buf, len));
> ++}
> ++
> ++simdutf_encoding_type simdutf_autodetect_encoding(const char *input,
> ++                                                  size_t length) {
> ++  return static_cast<simdutf_encoding_type>(
> ++      simdutf::autodetect_encoding(input, length));
> ++}
> ++
> ++int simdutf_detect_encodings(const char *input, size_t length) {
> ++  return simdutf::detect_encodings(input, length);
> ++}
> ++
> ++bool simdutf_validate_ascii(const char *buf, size_t len) {
> ++  return simdutf::validate_ascii(buf, len);
> ++}
> ++simdutf_result simdutf_validate_ascii_with_errors(const char *buf, size=
_t len) {
> ++  return to_c_result(simdutf::validate_ascii_with_errors(buf, len));
> ++}
> ++
> ++bool simdutf_validate_utf16_as_ascii(const char16_t *buf, size_t len) {
> ++  return simdutf::validate_utf16_as_ascii(
> ++      reinterpret_cast<const char16_t *>(buf), len);
> ++}
> ++bool simdutf_validate_utf16be_as_ascii(const char16_t *buf, size_t len)=
 {
> ++  return simdutf::validate_utf16be_as_ascii(
> ++      reinterpret_cast<const char16_t *>(buf), len);
> ++}
> ++bool simdutf_validate_utf16le_as_ascii(const char16_t *buf, size_t len)=
 {
> ++  return simdutf::validate_utf16le_as_ascii(
> ++      reinterpret_cast<const char16_t *>(buf), len);
> ++}
> ++
> ++bool simdutf_validate_utf16(const char16_t *buf, size_t len) {
> ++  return simdutf::validate_utf16(reinterpret_cast<const char16_t *>(buf=
), len);
> ++}
> ++bool simdutf_validate_utf16le(const char16_t *buf, size_t len) {
> ++  return simdutf::validate_utf16le(reinterpret_cast<const char16_t *>(b=
uf),
> ++                                   len);
> ++}
> ++bool simdutf_validate_utf16be(const char16_t *buf, size_t len) {
> ++  return simdutf::validate_utf16be(reinterpret_cast<const char16_t *>(b=
uf),
> ++                                   len);
> ++}
> ++simdutf_result simdutf_validate_utf16_with_errors(const char16_t *buf,
> ++                                                  size_t len) {
> ++  return to_c_result(simdutf::validate_utf16_with_errors(
> ++      reinterpret_cast<const char16_t *>(buf), len));
> ++}
> ++simdutf_result simdutf_validate_utf16le_with_errors(const char16_t *buf=
,
> ++                                                    size_t len) {
> ++  return to_c_result(simdutf::validate_utf16le_with_errors(
> ++      reinterpret_cast<const char16_t *>(buf), len));
> ++}
> ++simdutf_result simdutf_validate_utf16be_with_errors(const char16_t *buf=
,
> ++                                                    size_t len) {
> ++  return to_c_result(simdutf::validate_utf16be_with_errors(
> ++      reinterpret_cast<const char16_t *>(buf), len));
> ++}
> ++
> ++bool simdutf_validate_utf32(const char32_t *buf, size_t len) {
> ++  return simdutf::validate_utf32(reinterpret_cast<const char32_t *>(buf=
), len);
> ++}
> ++simdutf_result simdutf_validate_utf32_with_errors(const char32_t *buf,
> ++                                                  size_t len) {
> ++  return to_c_result(simdutf::validate_utf32_with_errors(
> ++      reinterpret_cast<const char32_t *>(buf), len));
> ++}
> ++
> ++void simdutf_to_well_formed_utf16le(const char16_t *input, size_t len,
> ++                                    char16_t *output) {
> ++  simdutf::to_well_formed_utf16le(reinterpret_cast<const char16_t *>(in=
put),
> ++                                  len, reinterpret_cast<char16_t *>(out=
put));
> ++}
> ++void simdutf_to_well_formed_utf16be(const char16_t *input, size_t len,
> ++                                    char16_t *output) {
> ++  simdutf::to_well_formed_utf16be(reinterpret_cast<const char16_t *>(in=
put),
> ++                                  len, reinterpret_cast<char16_t *>(out=
put));
> ++}
> ++void simdutf_to_well_formed_utf16(const char16_t *input, size_t len,
> ++                                  char16_t *output) {
> ++  simdutf::to_well_formed_utf16(reinterpret_cast<const char16_t *>(inpu=
t), len,
> ++                                reinterpret_cast<char16_t *>(output));
> ++}
> ++
> ++size_t simdutf_count_utf16(const char16_t *input, size_t length) {
> ++  return simdutf::count_utf16(reinterpret_cast<const char16_t *>(input)=
,
> ++                              length);
> ++}
> ++size_t simdutf_count_utf16le(const char16_t *input, size_t length) {
> ++  return simdutf::count_utf16le(reinterpret_cast<const char16_t *>(inpu=
t),
> ++                                length);
> ++}
> ++size_t simdutf_count_utf16be(const char16_t *input, size_t length) {
> ++  return simdutf::count_utf16be(reinterpret_cast<const char16_t *>(inpu=
t),
> ++                                length);
> ++}
> ++size_t simdutf_count_utf8(const char *input, size_t length) {
> ++  return simdutf::count_utf8(input, length);
> ++}
> ++
> ++size_t simdutf_utf8_length_from_latin1(const char *input, size_t length=
) {
> ++  return simdutf::utf8_length_from_latin1(input, length);
> ++}
> ++size_t simdutf_latin1_length_from_utf8(const char *input, size_t length=
) {
> ++  return simdutf::latin1_length_from_utf8(input, length);
> ++}
> ++size_t simdutf_latin1_length_from_utf16(size_t length) {
> ++  return simdutf::latin1_length_from_utf16(length);
> ++}
> ++size_t simdutf_latin1_length_from_utf32(size_t length) {
> ++  return simdutf::latin1_length_from_utf32(length);
> ++}
> ++size_t simdutf_utf16_length_from_utf8(const char *input, size_t length)=
 {
> ++  return simdutf::utf16_length_from_utf8(input, length);
> ++}
> ++size_t simdutf_utf32_length_from_utf8(const char *input, size_t length)=
 {
> ++  return simdutf::utf32_length_from_utf8(input, length);
> ++}
> ++size_t simdutf_utf8_length_from_utf16(const char16_t *input, size_t len=
gth) {
> ++  return simdutf::utf8_length_from_utf16(
> ++      reinterpret_cast<const char16_t *>(input), length);
> ++}
> ++simdutf_result
> ++simdutf_utf8_length_from_utf16_with_replacement(const char16_t *input,
> ++                                                size_t length) {
> ++  return to_c_result(simdutf::utf8_length_from_utf16_with_replacement(
> ++      reinterpret_cast<const char16_t *>(input), length));
> ++}
> ++size_t simdutf_utf8_length_from_utf16le(const char16_t *input, size_t l=
ength) {
> ++  return simdutf::utf8_length_from_utf16le(
> ++      reinterpret_cast<const char16_t *>(input), length);
> ++}
> ++size_t simdutf_utf8_length_from_utf16be(const char16_t *input, size_t l=
ength) {
> ++  return simdutf::utf8_length_from_utf16be(
> ++      reinterpret_cast<const char16_t *>(input), length);
> ++}
> ++simdutf_result
> ++simdutf_utf8_length_from_utf16le_with_replacement(const char16_t *input=
,
> ++                                                  size_t length) {
> ++  return to_c_result(simdutf::utf8_length_from_utf16le_with_replacement=
(
> ++      reinterpret_cast<const char16_t *>(input), length));
> ++}
> ++simdutf_result
> ++simdutf_utf8_length_from_utf16be_with_replacement(const char16_t *input=
,
> ++                                                  size_t length) {
> ++  return to_c_result(simdutf::utf8_length_from_utf16be_with_replacement=
(
> ++      reinterpret_cast<const char16_t *>(input), length));
> ++}
> ++
> ++/* Conversions: latin1 <-> utf8, utf8 <-> utf16/utf32, utf16 <-> utf8, =
etc. */
> ++size_t simdutf_convert_latin1_to_utf8(const char *input, size_t length,
> ++                                      char *output) {
> ++  return simdutf::convert_latin1_to_utf8(input, length, output);
> ++}
> ++size_t simdutf_convert_latin1_to_utf16le(const char *input, size_t leng=
th,
> ++                                         char16_t *output) {
> ++  return simdutf::convert_latin1_to_utf16le(
> ++      input, length, reinterpret_cast<char16_t *>(output));
> ++}
> ++size_t simdutf_convert_latin1_to_utf16be(const char *input, size_t leng=
th,
> ++                                         char16_t *output) {
> ++  return simdutf::convert_latin1_to_utf16be(
> ++      input, length, reinterpret_cast<char16_t *>(output));
> ++}
> ++size_t simdutf_convert_latin1_to_utf32(const char *input, size_t length=
,
> ++                                       char32_t *output) {
> ++  return simdutf::convert_latin1_to_utf32(input, length,
> ++                                          reinterpret_cast<char32_t *>(=
output));
> ++}
> ++
> ++size_t simdutf_convert_utf8_to_latin1(const char *input, size_t length,
> ++                                      char *output) {
> ++  return simdutf::convert_utf8_to_latin1(input, length, output);
> ++}
> ++size_t simdutf_convert_utf8_to_utf16le(const char *input, size_t length=
,
> ++                                       char16_t *output) {
> ++  return simdutf::convert_utf8_to_utf16le(input, length,
> ++                                          reinterpret_cast<char16_t *>(=
output));
> ++}
> ++size_t simdutf_convert_utf8_to_utf16(const char *input, size_t length,
> ++                                     char16_t *output) {
> ++  return simdutf::convert_utf8_to_utf16(input, length,
> ++                                        reinterpret_cast<char16_t *>(ou=
tput));
> ++}
> ++size_t simdutf_convert_utf8_to_utf16be(const char *input, size_t length=
,
> ++                                       char16_t *output) {
> ++  return simdutf::convert_utf8_to_utf16be(input, length,
> ++                                          reinterpret_cast<char16_t *>(=
output));
> ++}
> ++size_t simdutf_convert_utf8_to_utf32(const char *input, size_t length,
> ++                                     char32_t *output) {
> ++  return simdutf::convert_utf8_to_utf32(input, length,
> ++                                        reinterpret_cast<char32_t *>(ou=
tput));
> ++}
> ++simdutf_result simdutf_convert_utf8_to_latin1_with_errors(const char *i=
nput,
> ++                                                          size_t length=
,
> ++                                                          char *output)=
 {
> ++  return to_c_result(
> ++      simdutf::convert_utf8_to_latin1_with_errors(input, length, output=
));
> ++}
> ++simdutf_result simdutf_convert_utf8_to_utf16_with_errors(const char *in=
put,
> ++                                                         size_t length,
> ++                                                         char16_t *outp=
ut) {
> ++  return to_c_result(simdutf::convert_utf8_to_utf16_with_errors(
> ++      input, length, reinterpret_cast<char16_t *>(output)));
> ++}
> ++simdutf_result simdutf_convert_utf8_to_utf16le_with_errors(const char *=
input,
> ++                                                           size_t lengt=
h,
> ++                                                           char16_t *ou=
tput) {
> ++  return to_c_result(simdutf::convert_utf8_to_utf16le_with_errors(
> ++      input, length, reinterpret_cast<char16_t *>(output)));
> ++}
> ++simdutf_result simdutf_convert_utf8_to_utf16be_with_errors(const char *=
input,
> ++                                                           size_t lengt=
h,
> ++                                                           char16_t *ou=
tput) {
> ++  return to_c_result(simdutf::convert_utf8_to_utf16be_with_errors(
> ++      input, length, reinterpret_cast<char16_t *>(output)));
> ++}
> ++simdutf_result simdutf_convert_utf8_to_utf32_with_errors(const char *in=
put,
> ++                                                         size_t length,
> ++                                                         char32_t *outp=
ut) {
> ++  return to_c_result(simdutf::convert_utf8_to_utf32_with_errors(
> ++      input, length, reinterpret_cast<char32_t *>(output)));
> ++}
> ++
> ++/* Conversions assuming valid input */
> ++size_t simdutf_convert_valid_utf8_to_latin1(const char *input, size_t l=
ength,
> ++                                            char *output) {
> ++  return simdutf::convert_valid_utf8_to_latin1(input, length, output);
> ++}
> ++size_t simdutf_convert_valid_utf8_to_utf16le(const char *input, size_t =
length,
> ++                                             char16_t *output) {
> ++  return simdutf::convert_valid_utf8_to_utf16le(
> ++      input, length, reinterpret_cast<char16_t *>(output));
> ++}
> ++size_t simdutf_convert_valid_utf8_to_utf16be(const char *input, size_t =
length,
> ++                                             char16_t *output) {
> ++  return simdutf::convert_valid_utf8_to_utf16be(
> ++      input, length, reinterpret_cast<char16_t *>(output));
> ++}
> ++size_t simdutf_convert_valid_utf8_to_utf32(const char *input, size_t le=
ngth,
> ++                                           char32_t *output) {
> ++  return simdutf::convert_valid_utf8_to_utf32(
> ++      input, length, reinterpret_cast<char32_t *>(output));
> ++}
> ++
> ++/* UTF-16 -> UTF-8 and related conversions */
> ++size_t simdutf_convert_utf16_to_utf8(const char16_t *input, size_t leng=
th,
> ++                                     char *output) {
> ++  return simdutf::convert_utf16_to_utf8(
> ++      reinterpret_cast<const char16_t *>(input), length, output);
> ++}
> ++size_t simdutf_convert_utf16_to_utf8_safe(const char16_t *input, size_t=
 length,
> ++                                          char *output, size_t utf8_len=
) {
> ++  return simdutf::convert_utf16_to_utf8_safe(
> ++      reinterpret_cast<const char16_t *>(input), length, output, utf8_l=
en);
> ++}
> ++size_t simdutf_convert_utf16_to_latin1(const char16_t *input, size_t le=
ngth,
> ++                                       char *output) {
> ++  return simdutf::convert_utf16_to_latin1(
> ++      reinterpret_cast<const char16_t *>(input), length, output);
> ++}
> ++size_t simdutf_convert_utf16le_to_latin1(const char16_t *input, size_t =
length,
> ++                                         char *output) {
> ++  return simdutf::convert_utf16le_to_latin1(
> ++      reinterpret_cast<const char16_t *>(input), length, output);
> ++}
> ++size_t simdutf_convert_utf16be_to_latin1(const char16_t *input, size_t =
length,
> ++                                         char *output) {
> ++  return simdutf::convert_utf16be_to_latin1(
> ++      reinterpret_cast<const char16_t *>(input), length, output);
> ++}
> ++simdutf_result
> ++simdutf_convert_utf16_to_latin1_with_errors(const char16_t *input,
> ++                                            size_t length, char *output=
) {
> ++  return to_c_result(simdutf::convert_utf16_to_latin1_with_errors(
> ++      reinterpret_cast<const char16_t *>(input), length, output));
> ++}
> ++simdutf_result
> ++simdutf_convert_utf16le_to_latin1_with_errors(const char16_t *input,
> ++                                              size_t length, char *outp=
ut) {
> ++  return to_c_result(simdutf::convert_utf16le_to_latin1_with_errors(
> ++      reinterpret_cast<const char16_t *>(input), length, output));
> ++}
> ++simdutf_result
> ++simdutf_convert_utf16be_to_latin1_with_errors(const char16_t *input,
> ++                                              size_t length, char *outp=
ut) {
> ++  return to_c_result(simdutf::convert_utf16be_to_latin1_with_errors(
> ++      reinterpret_cast<const char16_t *>(input), length, output));
> ++}
> ++
> ++simdutf_result simdutf_convert_utf16_to_utf8_with_errors(const char16_t=
 *input,
> ++                                                         size_t length,
> ++                                                         char *output) =
{
> ++  return to_c_result(simdutf::convert_utf16_to_utf8_with_errors(
> ++      reinterpret_cast<const char16_t *>(input), length, output));
> ++}
> ++simdutf_result
> ++simdutf_convert_utf16le_to_utf8_with_errors(const char16_t *input,
> ++                                            size_t length, char *output=
) {
> ++  return to_c_result(simdutf::convert_utf16le_to_utf8_with_errors(
> ++      reinterpret_cast<const char16_t *>(input), length, output));
> ++}
> ++simdutf_result
> ++simdutf_convert_utf16be_to_utf8_with_errors(const char16_t *input,
> ++                                            size_t length, char *output=
) {
> ++  return to_c_result(simdutf::convert_utf16be_to_utf8_with_errors(
> ++      reinterpret_cast<const char16_t *>(input), length, output));
> ++}
> ++
> ++size_t simdutf_convert_utf16le_to_utf8(const char16_t *input, size_t le=
ngth,
> ++                                       char *output) {
> ++  return simdutf::convert_utf16le_to_utf8(
> ++      reinterpret_cast<const char16_t *>(input), length, output);
> ++}
> ++size_t simdutf_convert_utf16be_to_utf8(const char16_t *input, size_t le=
ngth,
> ++                                       char *output) {
> ++  return simdutf::convert_utf16be_to_utf8(
> ++      reinterpret_cast<const char16_t *>(input), length, output);
> ++}
> ++
> ++size_t simdutf_convert_valid_utf16_to_utf8(const char16_t *input, size_=
t length,
> ++                                           char *output) {
> ++  return simdutf::convert_valid_utf16_to_utf8(
> ++      reinterpret_cast<const char16_t *>(input), length, output);
> ++}
> ++size_t simdutf_convert_valid_utf16_to_latin1(const char16_t *input,
> ++                                             size_t length, char *outpu=
t) {
> ++  return simdutf::convert_valid_utf16_to_latin1(
> ++      reinterpret_cast<const char16_t *>(input), length, output);
> ++}
> ++size_t simdutf_convert_valid_utf16le_to_latin1(const char16_t *input,
> ++                                               size_t length, char *out=
put) {
> ++  return simdutf::convert_valid_utf16le_to_latin1(
> ++      reinterpret_cast<const char16_t *>(input), length, output);
> ++}
> ++size_t simdutf_convert_valid_utf16be_to_latin1(const char16_t *input,
> ++                                               size_t length, char *out=
put) {
> ++  return simdutf::convert_valid_utf16be_to_latin1(
> ++      reinterpret_cast<const char16_t *>(input), length, output);
> ++}
> ++
> ++size_t simdutf_convert_valid_utf16le_to_utf8(const char16_t *input,
> ++                                             size_t length, char *outpu=
t) {
> ++  return simdutf::convert_valid_utf16le_to_utf8(
> ++      reinterpret_cast<const char16_t *>(input), length, output);
> ++}
> ++size_t simdutf_convert_valid_utf16be_to_utf8(const char16_t *input,
> ++                                             size_t length, char *outpu=
t) {
> ++  return simdutf::convert_valid_utf16be_to_utf8(
> ++      reinterpret_cast<const char16_t *>(input), length, output);
> ++}
> ++
> ++/* UTF-16 <-> UTF-32 conversions */
> ++size_t simdutf_convert_utf16_to_utf32(const char16_t *input, size_t len=
gth,
> ++                                      char32_t *output) {
> ++  return simdutf::convert_utf16_to_utf32(
> ++      reinterpret_cast<const char16_t *>(input), length,
> ++      reinterpret_cast<char32_t *>(output));
> ++}
> ++size_t simdutf_convert_utf16le_to_utf32(const char16_t *input, size_t l=
ength,
> ++                                        char32_t *output) {
> ++  return simdutf::convert_utf16le_to_utf32(
> ++      reinterpret_cast<const char16_t *>(input), length,
> ++      reinterpret_cast<char32_t *>(output));
> ++}
> ++size_t simdutf_convert_utf16be_to_utf32(const char16_t *input, size_t l=
ength,
> ++                                        char32_t *output) {
> ++  return simdutf::convert_utf16be_to_utf32(
> ++      reinterpret_cast<const char16_t *>(input), length,
> ++      reinterpret_cast<char32_t *>(output));
> ++}
> ++simdutf_result simdutf_convert_utf16_to_utf32_with_errors(const char16_=
t *input,
> ++                                                          size_t length=
,
> ++                                                          char32_t *out=
put) {
> ++  return to_c_result(simdutf::convert_utf16_to_utf32_with_errors(
> ++      reinterpret_cast<const char16_t *>(input), length,
> ++      reinterpret_cast<char32_t *>(output)));
> ++}
> ++simdutf_result
> ++simdutf_convert_utf16le_to_utf32_with_errors(const char16_t *input,
> ++                                             size_t length, char32_t *o=
utput) {
> ++  return to_c_result(simdutf::convert_utf16le_to_utf32_with_errors(
> ++      reinterpret_cast<const char16_t *>(input), length,
> ++      reinterpret_cast<char32_t *>(output)));
> ++}
> ++simdutf_result
> ++simdutf_convert_utf16be_to_utf32_with_errors(const char16_t *input,
> ++                                             size_t length, char32_t *o=
utput) {
> ++  return to_c_result(simdutf::convert_utf16be_to_utf32_with_errors(
> ++      reinterpret_cast<const char16_t *>(input), length,
> ++      reinterpret_cast<char32_t *>(output)));
> ++}
> ++
> ++/* Valid UTF-16 conversions */
> ++size_t simdutf_convert_valid_utf16_to_utf32(const char16_t *input,
> ++                                            size_t length, char32_t *ou=
tput) {
> ++  return simdutf::convert_valid_utf16_to_utf32(
> ++      reinterpret_cast<const char16_t *>(input), length,
> ++      reinterpret_cast<char32_t *>(output));
> ++}
> ++size_t simdutf_convert_valid_utf16le_to_utf32(const char16_t *input,
> ++                                              size_t length, char32_t *=
output) {
> ++  return simdutf::convert_valid_utf16le_to_utf32(
> ++      reinterpret_cast<const char16_t *>(input), length,
> ++      reinterpret_cast<char32_t *>(output));
> ++}
> ++size_t simdutf_convert_valid_utf16be_to_utf32(const char16_t *input,
> ++                                              size_t length, char32_t *=
output) {
> ++  return simdutf::convert_valid_utf16be_to_utf32(
> ++      reinterpret_cast<const char16_t *>(input), length,
> ++      reinterpret_cast<char32_t *>(output));
> ++}
> ++
> ++/* UTF-32 -> ... conversions */
> ++size_t simdutf_convert_utf32_to_utf8(const char32_t *input, size_t leng=
th,
> ++                                     char *output) {
> ++  return simdutf::convert_utf32_to_utf8(
> ++      reinterpret_cast<const char32_t *>(input), length, output);
> ++}
> ++simdutf_result simdutf_convert_utf32_to_utf8_with_errors(const char32_t=
 *input,
> ++                                                         size_t length,
> ++                                                         char *output) =
{
> ++  return to_c_result(simdutf::convert_utf32_to_utf8_with_errors(
> ++      reinterpret_cast<const char32_t *>(input), length, output));
> ++}
> ++size_t simdutf_convert_valid_utf32_to_utf8(const char32_t *input, size_=
t length,
> ++                                           char *output) {
> ++  return simdutf::convert_valid_utf32_to_utf8(
> ++      reinterpret_cast<const char32_t *>(input), length, output);
> ++}
> ++
> ++size_t simdutf_convert_utf32_to_utf16(const char32_t *input, size_t len=
gth,
> ++                                      char16_t *output) {
> ++  return simdutf::convert_utf32_to_utf16(
> ++      reinterpret_cast<const char32_t *>(input), length,
> ++      reinterpret_cast<char16_t *>(output));
> ++}
> ++size_t simdutf_convert_utf32_to_utf16le(const char32_t *input, size_t l=
ength,
> ++                                        char16_t *output) {
> ++  return simdutf::convert_utf32_to_utf16le(
> ++      reinterpret_cast<const char32_t *>(input), length,
> ++      reinterpret_cast<char16_t *>(output));
> ++}
> ++size_t simdutf_convert_utf32_to_utf16be(const char32_t *input, size_t l=
ength,
> ++                                        char16_t *output) {
> ++  return simdutf::convert_utf32_to_utf16be(
> ++      reinterpret_cast<const char32_t *>(input), length,
> ++      reinterpret_cast<char16_t *>(output));
> ++}
> ++simdutf_result
> ++simdutf_convert_utf32_to_latin1_with_errors(const char32_t *input,
> ++                                            size_t length, char *output=
) {
> ++  return to_c_result(simdutf::convert_utf32_to_latin1_with_errors(
> ++      reinterpret_cast<const char32_t *>(input), length, output));
> ++}
> ++
> ++/* --- find helpers --- */
> ++const char *simdutf_find(const char *start, const char *end, char chara=
cter) {
> ++  return simdutf::find(start, end, character);
> ++}
> ++const char16_t *simdutf_find_utf16(const char16_t *start, const char16_=
t *end,
> ++                                   char16_t character) {
> ++  return simdutf::find(start, end, character);
> ++}
> ++
> ++/* --- base64 helpers --- */
> ++size_t simdutf_maximal_binary_length_from_base64(const char *input,
> ++                                                 size_t length) {
> ++  return simdutf::maximal_binary_length_from_base64(input, length);
> ++}
> ++size_t simdutf_maximal_binary_length_from_base64_utf16(const char16_t *=
input,
> ++                                                       size_t length) {
> ++  return simdutf::maximal_binary_length_from_base64(input, length);
> ++}
> ++
> ++simdutf_result simdutf_base64_to_binary(
> ++    const char *input, size_t length, char *output,
> ++    simdutf_base64_options options,
> ++    simdutf_last_chunk_handling_options last_chunk_options) {
> ++  return to_c_result(simdutf::base64_to_binary(
> ++      input, length, output, static_cast<simdutf::base64_options>(optio=
ns),
> ++      static_cast<simdutf::last_chunk_handling_options>(last_chunk_opti=
ons)));
> ++}
> ++simdutf_result simdutf_base64_to_binary_utf16(
> ++    const char16_t *input, size_t length, char *output,
> ++    simdutf_base64_options options,
> ++    simdutf_last_chunk_handling_options last_chunk_options) {
> ++  return to_c_result(simdutf::base64_to_binary(
> ++      input, length, output, static_cast<simdutf::base64_options>(optio=
ns),
> ++      static_cast<simdutf::last_chunk_handling_options>(last_chunk_opti=
ons)));
> ++}
> ++
> ++size_t simdutf_base64_length_from_binary(size_t length,
> ++                                         simdutf_base64_options options=
) {
> ++  return simdutf::base64_length_from_binary(
> ++      length, static_cast<simdutf::base64_options>(options));
> ++}
> ++size_t simdutf_base64_length_from_binary_with_lines(
> ++    size_t length, simdutf_base64_options options, size_t line_length) =
{
> ++  return simdutf::base64_length_from_binary_with_lines(
> ++      length, static_cast<simdutf::base64_options>(options), line_lengt=
h);
> ++}
> ++
> ++size_t simdutf_binary_to_base64(const char *input, size_t length, char =
*output,
> ++                                simdutf_base64_options options) {
> ++  return simdutf::binary_to_base64(
> ++      input, length, output, static_cast<simdutf::base64_options>(optio=
ns));
> ++}
> ++size_t simdutf_binary_to_base64_with_lines(const char *input, size_t le=
ngth,
> ++                                           char *output, size_t line_le=
ngth,
> ++                                           simdutf_base64_options optio=
ns) {
> ++  return simdutf::binary_to_base64_with_lines(
> ++      input, length, output, line_length,
> ++      static_cast<simdutf::base64_options>(options));
> ++}
> ++
> ++simdutf_result simdutf_base64_to_binary_safe(
> ++    const char *input, size_t length, char *output, size_t *outlen,
> ++    simdutf_base64_options options,
> ++    simdutf_last_chunk_handling_options last_chunk_options,
> ++    bool decode_up_to_bad_char) {
> ++  size_t local_out =3D outlen ? *outlen : 0;
> ++  simdutf::result r =3D simdutf::base64_to_binary_safe(
> ++      input, length, output, local_out,
> ++      static_cast<simdutf::base64_options>(options),
> ++      static_cast<simdutf::last_chunk_handling_options>(last_chunk_opti=
ons),
> ++      decode_up_to_bad_char);
> ++  if (outlen)
> ++    *outlen =3D local_out;
> ++  return to_c_result(r);
> ++}
> ++simdutf_result simdutf_base64_to_binary_safe_utf16(
> ++    const char16_t *input, size_t length, char *output, size_t *outlen,
> ++    simdutf_base64_options options,
> ++    simdutf_last_chunk_handling_options last_chunk_options,
> ++    bool decode_up_to_bad_char) {
> ++  size_t local_out =3D outlen ? *outlen : 0;
> ++  simdutf::result r =3D simdutf::base64_to_binary_safe(
> ++      input, length, output, local_out,
> ++      static_cast<simdutf::base64_options>(options),
> ++      static_cast<simdutf::last_chunk_handling_options>(last_chunk_opti=
ons),
> ++      decode_up_to_bad_char);
> ++  if (outlen)
> ++    *outlen =3D local_out;
> ++  return to_c_result(r);
> ++}
> ++
> ++} // extern "C"
> ++// clang-format off
> ++#endif // SIMDUTF_FEATURE_UTF8 && SIMDUTF_FEATURE_UTF16 && SIMDUTF_FEAT=
URE_UTF32 && SIMDUTF_FEATURE_LATIN1 && SIMDUTF_FEATURE_ASCII && SIMDUTF_FEA=
TURE_BASE64 && SIMDUTF_FEATURE_DETECT_ENCODING
> ++// clang-format on
> diff --git a/meta/recipes-support/vte/vte/0001-support-reproducibility-fo=
r-debug-sources.patch b/meta/recipes-support/vte/vte/0001-support-reproduci=
bility-for-debug-sources.patch
> deleted file mode 100644
> index 20e8f71c0e..0000000000
> --- a/meta/recipes-support/vte/vte/0001-support-reproducibility-for-debug=
-sources.patch
> +++ /dev/null
> @@ -1,48 +0,0 @@
> -From 0959004adbe46f88d558d2ce61b496c662c196f5 Mon Sep 17 00:00:00 2001
> -From: Hongxu Jia <hongxu.jia@windriver.com>
> -Date: Mon, 3 Nov 2025 06:13:11 +0000
> -Subject: [PATCH] support reproducibility for debug sources
> -
> -While option --debug-sources is used, the generated source file contains
> -build path comments which caused the build is not reproducible [1]
> -...subprojects/simdutf/simdutf.h...
> - 1 /* auto-generated on 2025-03-17 16:13:41 -0400. Do not edit! */
> - 2 /* begin file include/simdutf.h */
> - 3 // /build-dir/vte-0.82.1/subprojects/simdutf/include/simdutf.h:1
> - 4 #ifndef SIMDUTF_H
> -...subprojects/simdutf/simdutf.h...
> -
> -After apply this commit, use relative path to instead
> -...subprojects/simdutf/simdutf.h...
> - 1 /* auto-generated on 2025-03-17 16:13:41 -0400. Do not edit! */
> - 2 /* begin file include/simdutf.h */
> - 3 // include/simdutf.h:1
> - 4 #ifndef SIMDUTF_H
> -...subprojects/simdutf/simdutf.h...
> -
> -[1] https://reproducible-builds.org/
> -
> -Upstream-Status: Submitted [https://github.com/simdutf/simdutf/pull/848]
> -
> -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ----
> - singleheader/amalgamate.py | 3 ++-
> - 1 file changed, 2 insertions(+), 1 deletion(-)
> -
> -diff --git a/singleheader/amalgamate.py b/singleheader/amalgamate.py
> -index 190b2f6..75e0d78 100755
> ---- a/singleheader/amalgamate.py
> -+++ b/singleheader/amalgamate.py
> -@@ -385,7 +385,8 @@ def filter_features(file):
> -                 current_features =3D None
> -             elif enabled:
> -                 if context.args.debug_sources and not prev_line.endswit=
h('\\'):
> --                    yield f"// {file}:{lineno}"
> -+                    RELFILE =3D os.path.relpath(file, PROJECTPATH)
> -+                    yield f"// {RELFILE}:{lineno}"
> -
> -                 if line or (not line and prev_line):
> -                     yield line
> ---
> -2.48.1
> -
> diff --git a/meta/recipes-support/vte/vte_0.82.2.bb b/meta/recipes-suppor=
t/vte/vte_0.84.0.bb
> similarity index 93%
> rename from meta/recipes-support/vte/vte_0.82.2.bb
> rename to meta/recipes-support/vte/vte_0.84.0.bb
> index d5dced4ce6..4c9d124bdd 100644
> --- a/meta/recipes-support/vte/vte_0.82.2.bb
> +++ b/meta/recipes-support/vte/vte_0.84.0.bb
> @@ -18,16 +18,18 @@ GIDOCGEN_MESON_OPTION =3D "docs"
>  inherit gnomebase gi-docgen features_check upstream-version-is-even gobj=
ect-introspection systemd vala
>
>  SRC_URI +=3D "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.pat=
ch \
> -            file://0001-support-reproducibility-for-debug-sources.patch;=
patchdir=3D./subprojects/simdutf \
> +            file://0001-Add-a-C-API-897.patch;patchdir=3D./subprojects/s=
imdutf \
>  "
>
> -SRC_URI[archive.sha256sum] =3D "e1295aafc4682b3b550f1235dc2679baa0f71570=
d8ed543c001c1283d530be91"
> +SRC_URI[archive.sha256sum] =3D "0414e31583836aeb7878da25f67c515f7e887991=
7ecc37c92e26b83e8d8fc3e3"
>
>  ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
>
>  EXTRA_OEMESON +=3D "${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-Dv=
api=3Dtrue', '-Dvapi=3Dfalse', d)}"
>  EXTRA_OEMESON:append =3D " ${@bb.utils.contains('GI_DATA_ENABLED', 'Fals=
e', '-Ddocs=3Dfalse', '', d)}"
>
> +CXXFLAGS:append =3D " -fpermissive"
> +
>  PACKAGECONFIG ??=3D " \
>         gnutls \
>         ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \

