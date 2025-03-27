Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81065C3600B
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 14:55:20 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web10.51974.1743087304932415671
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Mar 2025 07:55:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=QeEAnVXo;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.173, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6f74b78df93so13074847b3.0
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 07:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1743087304; x=1743692104; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2b1jPT0vI+KLPNbH7RuwP2/L1P5vHhkvtfBNLwmp4EM=;
        b=QeEAnVXoypQYUPM6EKZSCHMFu4DEN94fhqpRgCe+nbVCe8IA9rqgLLkIlOD3SnQlIr
         CMIhDlfBAhxFlSTVfygMp2y2UD2qjGtcXnW2kS2/idU9QYSxL5Hb63Ee+A2K9jwmnFWT
         YmQpYxfRaWwdIWX2cAoOyucdUWnbhlopzrZrLamm8iYsq5mGVCayfsla0XqT5emW36yb
         4x2LONx9rm9c/Xq6zuxaOBcusUFqabWc6LG2Qxg1VbyoaQipYATld+5kyWYqGYFs/Oo0
         hQi2MyFhR2IEVgu+OC33yaSCkSnizsRwg1z3EYZEaN+Ou1vtrg7IZgDnDF++r5fTAe5i
         xNGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743087304; x=1743692104;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2b1jPT0vI+KLPNbH7RuwP2/L1P5vHhkvtfBNLwmp4EM=;
        b=lyLce3bctaQGc7L+oATexxF77MT8a8R/kENmR8EOb3Tx1/m8cchUWaCZEAKfsnLnpf
         2ItU56vxo8MUL4yBe5L5/r3eJ259y7tg3+cxFjCsBeXSn+ywrxpGufhWFVQtYpYLRQ4X
         ZgWkOa0bV9w5O+pTsYUif50KCPsp2h2rrGOq2OqkhjshMFI4fSEakGhHqM+ofBdvNwMa
         wqLJA/vRIesy5IX/HfWrtVtzfC+nyIn7bdstQT+ggTBvVbeHtraxBxboCSH/wxFJyNz3
         GWwOvIjv+/K0DOIXnmBWKHCJ6jNiI90b0piflIZFFwt2MgqAOPAywsxSRmRmiDK5zOrK
         u5AQ==
X-Gm-Message-State: AOJu0YyFZrbK63WBG9+vvT4vURKKMAEyim9wggu0n0gag24haPq0jBH3
	zNEdsH9DCqUPV7OSUgTAiphIia3fm6oWUXIyGi17JZ72+PKmfZzZ7QYOJVORuIJl6Src1zneqKx
	XL6Og0w2YhLTpOpzZsFumPsTAxcr55H4FYxiQoQ==
X-Gm-Gg: ASbGnctNSTeHiKaURkGVbdoBPfH+vDZSrhHPrySAsGm8WkPYgzqG0jqem4IwECnmJrW
	m2JdyQomvEoihLwEzddmP3RA59qDyIqo8TyZ3rwyo/Lg4Ce+5SKXZ+CNkLaNgHybDCAI0DqiUML
	YksaPMm8TXsQZeG4AtNJmH64WElsdZAy8aCk1X4/+4tyA+k1X34tamzXXc
X-Google-Smtp-Source: AGHT+IGRUzt4D9wpL+h4GUkufQm/UyJ/PRRdFJ35aeDMefb2nZFZaByMU/O0/5rCV0aBhrpS8HvyzHQWPSyBYpDAERA=
X-Received: by 2002:a05:690c:62c9:b0:6fe:c007:3b20 with SMTP id
 00721157ae682-70224f87d39mr54914057b3.2.1743087303932; Thu, 27 Mar 2025
 07:55:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250326202817.64437-1-hiagofranco@gmail.com>
In-Reply-To: <20250326202817.64437-1-hiagofranco@gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 27 Mar 2025 07:54:53 -0700
X-Gm-Features: AQ5f1JpRQoSqbKdQX92bfM3-6I4vv3ICUPyphCbI-HehlioQCAfthOfuxQVD7eM
Message-ID: <CAOSpxdZR3JA-h_4ujbOzDK2YaX=9pBztTp-O3R111JE6DYK77Q@mail.gmail.com>
Subject: Re: [styhead][PATCH v2 00/31] linux-firmware: upgrade 20240909 -> 20250311
To: Hiago De Franco <hiagofranco@gmail.com>
Cc: openembedded-core@lists.openembedded.org, quentin.schulz@cherry.de, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Hiago De Franco <hiago.franco@toradex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 14:55:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213760

On Wed, Mar 26, 2025 at 1:29=E2=80=AFPM Hiago De Franco <hiagofranco@gmail.=
com> wrote:
>
> From: Hiago De Franco <hiago.franco@toradex.com>
>
> Update the linux-firmware recipe to the most recent upstream tag.
>
> This is basically a backport of the commits from master into styhead,
> related to the linux-firmware recipe.

Sorry I missed seeing this yesterday.

The final release of styhead is now in QA, there are no further
releases planned.

If this changes for any reason I will consider this series.

The project weekly status report publishes the complete schedule of
releases for all branches.

Steve

>
> Commit 30ea609d3357 ("meta/meta-selftest: Fix variable assignment
> whitespace") changes a lot of files (linux-firmware included), but they
> are all related to missing whitespaces to improve redability, this is
> the reason I have decided to cherry-pick this commit as well.
>
> v2:
>   - As requested, I converted the v1 patch into backports from oe-core ma=
ster.
> v1:
>   - https://lore.kernel.org/openembedded-core/20250325215115.10430-1-hiag=
ofranco@gmail.com/
>
> Alex Kiernan (1):
>   linux-firmware: Add RTL8723DS blobs into ${PN}-rtl8723
>
> Dmitry Baryshkov (16):
>   linux-firmware: add battmgr.jsn to ${PN}-qcom-qcm6490-audio
>   linux-firmware: split qcm6490 ZAP shader to separate package
>   linux-firmware: split sa8775p ZAP shader to separate package
>   linux-firmware: make ${PN}-qcom-adreno-a663 depend on -a660
>   linux-firmware: package IPA firmware for Qualcomm QCM6490 platforms
>   linux-firmware: RPROVIDE qcs6490 firmware packages by qcm6490 ones
>   linux-firmware: upgrade 20241017 -> 20241110
>   linux-firmware: package Qualcomm X1 Elite audio DSP firmware
>   linux-firmware: package QCS615 Adreno ZAP shader
>   linux-firmware: upgrade 20241110 -> 20241210
>   linux-firmware: package firmware for Qualcomm AIC100 and QDU100
>   linux-firmware: upgrade 20241210 -> 20250109
>   linux-firmware: split the qca6390 firmware
>   linux-firmware: further split qca61x4 package
>   linux-firmware: fix qca-qca61x4-usb package contents
>   linux-firmware: make linux-firmware-qcom-qcm6490-wifi provide
>     -qcs6490-
>
> Marc Ferland (5):
>   linux-firmware: split ath10k firmwares in separate packages
>   linux-firmware: split ath11k firmwares in separate packages
>   linux-firmware: split amdgpu firmwares in separate packages
>   linux-firmware: split ath12k firmwares in separate packages
>   linux-firmware: split qca firmwares in separate packages
>
> Richard Purdie (1):
>   meta/meta-selftest: Fix variable assignment whitespace
>
> Vivek Puar (6):
>   linux-firmware: add new fw file to ${PN}-qcom-adreno-a660
>   linux-firmware: Add qcom-qcm6490-{audio,compute} firmware packages
>   linux-firmware: Add qcom-adreno-a663 package
>   linux-firmware: upgrade 20250109 -> 20250211
>   linux-firmware: upgrade 20250211 -> 20250311
>   linux-firmware: update qca-qca61x4-usb package contents
>
> Zoltan Boszormenyi (1):
>   linux-firmware: Fix packaging of some subpackages
>
> Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi (1):
>   linux-firmware: Upgrade to 20241017 and allow compressing firmware
>
>  .../sysdig/sysdig-selftest_0.28.0.bb          |   2 +-
>  .../bbclasses/systemd-and-sysvinit.bb         |   2 +-
>  .../recipes-test/bbclasses/systemd-only.bb    |   2 +-
>  .../recipes-test/gitrepotest/gitrepotest.bb   |   2 +-
>  .../selftest-users/acreategroup.bb            |   2 +-
>  .../selftest-users/bcreategroup.bb            |   2 +-
>  .../selftest-users/ccreategroup.bb            |   2 +-
>  .../selftest-users/dcreategroup.bb            |   2 +-
>  meta/classes-global/base.bbclass              |   2 +-
>  meta/classes-recipe/autotools.bbclass         |   2 +-
>  meta/classes-recipe/cargo.bbclass             |   2 +-
>  meta/classes-recipe/go.bbclass                |   4 +-
>  meta/classes-recipe/gtk-icon-cache.bbclass    |   2 +-
>  meta/classes-recipe/kernel.bbclass            |   2 +-
>  meta/classes-recipe/python3native.bbclass     |   6 +-
>  meta/classes-recipe/python_pyo3.bbclass       |  12 +-
>  meta/classes-recipe/rust.bbclass              |   8 +-
>  meta/classes-recipe/setuptools3.bbclass       |   2 +-
>  .../classes-recipe/setuptools3_legacy.bbclass |   2 +-
>  meta/conf/documentation.conf                  |   2 +-
>  meta/recipes-bsp/u-boot/u-boot-tools.inc      |   2 +-
>  meta/recipes-connectivity/connman/connman.inc |   4 +-
>  .../inetutils/inetutils_2.5.bb                |   2 +-
>  meta/recipes-core/coreutils/coreutils_9.5.bb  |   2 +-
>  meta/recipes-core/glibc/glibc-package.inc     |   2 +-
>  .../glibc/glibc-y2038-tests_2.40.bb           |   2 +-
>  meta/recipes-core/meta/meta-environment.bb    |   2 +-
>  meta/recipes-core/musl/musl_git.bb            |   2 +-
>  meta/recipes-core/newlib/newlib.inc           |   2 +-
>  meta/recipes-core/os-release/os-release.bb    |   2 +-
>  meta/recipes-core/ovmf/ovmf-shell-image.bb    |   2 +-
>  meta/recipes-core/ovmf/ovmf_git.bb            |   6 +-
>  .../packagegroup-rust-cross-canadian.bb       |   2 +-
>  meta/recipes-core/picolibc/picolibc.inc       |   2 +-
>  .../binutils/binutils-2.43.1.inc              |   2 +-
>  meta/recipes-devtools/cmake/cmake_3.30.2.bb   |   2 +-
>  .../nativesdk-icecc-toolchain_0.1.bb          |   2 +-
>  .../libtool/libtool-2.5.2.inc                 |   2 +-
>  .../perl/libxml-parser-perl_2.47.bb           |   2 +-
>  .../python/python3-attrs_24.2.0.bb            |   2 +-
>  .../python/python3-pygobject_3.48.2.bb        |   2 +-
>  .../recipes-devtools/python/python3_3.12.9.bb |   2 +-
>  meta/recipes-devtools/rust/rust_1.79.0.bb     |   2 +-
>  .../asciidoc/asciidoc_10.2.1.bb               |   2 +-
>  .../baremetal-helloworld_git.bb               |   2 +-
>  .../go-examples/go-helloworld_0.1.bb          |   2 +-
>  meta/recipes-extended/gzip/gzip.inc           |   4 +-
>  .../logrotate/logrotate_3.22.0.bb             |   2 +-
>  .../perl/libxml-namespacesupport-perl_1.12.bb |   2 +-
>  meta/recipes-extended/shadow/shadow.inc       |   2 +-
>  meta/recipes-extended/timezone/timezone.inc   |   2 +-
>  .../libadwaita/libadwaita_1.5.3.bb            |   2 +-
>  meta/recipes-graphics/mesa/mesa.inc           |  26 +-
>  .../xorg-lib/xcb-util-errors_1.0.1.bb         |   2 +-
>  .../xorg-proto/xorgproto_2024.1.bb            |   2 +-
>  .../cryptodev/cryptodev-module_1.14.bb        |   2 +-
>  .../cryptodev/cryptodev-tests_1.14.bb         |   2 +-
>  ...20240909.bb =3D> linux-firmware_20250311.bb} | 869 +++++++++++++-----
>  meta/recipes-kernel/linux/kernel-devsrc.bb    |   2 +-
>  meta/recipes-kernel/linux/linux-yocto-dev.bb  |   6 +-
>  .../linux/linux-yocto-rt_6.10.bb              |   6 +-
>  .../linux/linux-yocto-rt_6.6.bb               |   6 +-
>  meta/recipes-kernel/linux/linux-yocto.inc     |   4 +-
>  meta/recipes-kernel/linux/linux-yocto_6.10.bb |  12 +-
>  meta/recipes-kernel/linux/linux-yocto_6.6.bb  |  12 +-
>  .../lttng/lttng-modules_2.13.14.bb            |   2 +-
>  .../make-mod-scripts/make-mod-scripts_1.0.bb  |   2 +-
>  meta/recipes-kernel/perf/perf.bb              |   2 +-
>  .../gstreamer/gstreamer1.0-meta-base.bb       |   4 +-
>  meta/recipes-sato/l3afpad/l3afpad_git.bb      |   2 +-
>  meta/recipes-support/apr/apr_1.7.5.bb         |   2 +-
>  meta/recipes-support/gnutls/gnutls_3.8.6.bb   |   2 +-
>  meta/recipes-support/gpgme/gpgme_1.23.2.bb    |   2 +-
>  meta/recipes-support/vte/vte_0.76.3.bb        |   4 +-
>  74 files changed, 783 insertions(+), 324 deletions(-)
>  rename meta/recipes-kernel/linux-firmware/{linux-firmware_20240909.bb =
=3D> linux-firmware_20250311.bb} (66%)
>
> --
> 2.39.5
>

