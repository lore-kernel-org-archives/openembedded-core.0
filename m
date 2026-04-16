Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 251A5F8E497
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 23:56:55 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30231.1776383807526689166
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2026 16:56:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=E6VYUDmV;
 spf=pass (domain: smile.fr, ip: 209.85.128.66, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso572435e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 16:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776383806; x=1776988606; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NPtQwp43cAFHwoHWsO4U1lamb1V342nslKB5F6j5w04=;
        b=E6VYUDmVf2aFdhNMV7Esarkt5WqKhDVHFOdh4fbE9ojahRXM3zSXYEpucJ0I3RKMP8
         FLOWKuw6zUhu/MNdIhJDmxNQbq7aSocw0Mga85vWZZOkJgfKBIp/LHzO9ojWu454JiLG
         bdc2pW8p/UHadGn4rEUmdsDR8dP2EDIXvPDT0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776383806; x=1776988606;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NPtQwp43cAFHwoHWsO4U1lamb1V342nslKB5F6j5w04=;
        b=bug8Kk2lkJ2t9qoAOewR0zUEZkqw/xi91auU8+/2Rr0YhRcEW6DzpaYM8ZDJmxDrm5
         FXAT2HAjw/72qyzFE7+X7FBg00tL0iCXgCuxfqVS42FCt8pBJKFokbrZoUcxpM8FRudn
         tqd5DxaNB9hJUg2iRVSkeMfW5eCKfZo+XoS2jT65wFCE97xe4An3gInx5T8nYzR5k4nZ
         O7gA99INXrbWrQY2xSdvmkplTFh5fnUsnnab5X+tog8wwENcaNn7AhFhXI4D3mZRhIbw
         vR4wIypTZba/Ijqo6tM6ZtaEQ8wPYwtVvRhQTVfc5Q7QANnviS2GTxVYQplz0BBljSfe
         ub0g==
X-Forwarded-Encrypted: i=1; AFNElJ/cQLRUh9WfrqaS35+fB2ImI8Ixf+m34Isi2rdaCMAIlJI9AwsVrx3YkpqN1ZFqpz72ubkfihHLnV5oKxOsrDcUGA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwTeZ6X5MOdks3Fn1x+Wf1zqVsahMjfO3qybypG2wzltLyQEYs6
	nkPZu6NsV4svycA0A9fA0TGxBQ7lQ1j9YdbFPn0Grm9Fz4klGOeSGi2dgJKyCv2Fbr0=
X-Gm-Gg: AeBDievMLP6tv2RK6qCn1MrpFxGN7rP+1jEWzYDSjMAiickrzeSr+s4sNFb/twE6S28
	K4lQ6gSfP3cxqw6suViMQyxhhLyYpgBWt6wrlJKNwSLb9z4V/o7QPrfLKnboWtZZf75PgxBSsg3
	H904zbGhzO1Fl3BGYKob0CE6DPvgyu0EZDRzsfsvhAzwVc3/LoGgxXoTz5myMu6sEMNaavOCsSR
	erAfMjg8aIRV6z0ji0oieRV8QuYN+c9UnjhdRhTMqUQZZ8+kMITwQ6nplgaq/rWNDVqgSqWjAIe
	XXtxrXTfFZ3C2GrJaFJU+AgHQEjytkZb+GTRPcmEIcwD3F6qnbAMOXnkI8Yq2+6d+AUtpA76qT5
	jqUqa61t8+j/SUgXtfTOmCxyZ235hhQ4KAX/1V2xtDh9+hTsjVf1k8Ts7JxItXqp0Ixhw1uaR5Z
	meX76YMAeBDAApyeH90S8dFXQIonOQ1UHfUjMalfi/PTHR3o0h43ygYuB80eAN5sGmmabTYQ9H8
	Adx/mA09nBAODmcotlZiGYgpJuFpfK1gjyL
X-Received: by 2002:a05:600c:c096:b0:488:af14:f1de with SMTP id 5b1f17b1804b1-488fb73b27dmr6386605e9.4.1776383804719;
        Thu, 16 Apr 2026 16:56:44 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc0f8193sm396985e9.1.2026.04.16.16.56.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 16:56:44 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Apr 2026 01:56:44 +0200
Message-Id: <DHUZI5QSPK97.31K106SQF017P@smile.fr>
Subject: Re: [OE-core][whinlatter v2 00/51] Patch review
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Yoann Congal" <yoann.congal@smile.fr>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <cover.1776377993.git.yoann.congal@smile.fr>
In-Reply-To: <cover.1776377993.git.yoann.congal@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 23:56:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235481

On Fri Apr 17, 2026 at 12:29 AM CEST, Yoann Congal wrote:
> Please review this set of changes for whinlatter and have comments back b=
y
> end of day Sunday, April 19. I plan to do the release build on Monday.
>
> This is a relatively "big" series compared to the usual: In addition to
> the usual CVE fixes, there are:
> - "git://" protocol patches
> - Ubunutu 26.04 support patches (Host glibc 2.43 and GCC 16)
>
> Please note: This will be the last review cycle for whinlatter.
> If you expect a patch to get merged and it is not in this series ping
> me as soon as possible.
>
> v1->v2:
> * Added "binutils: Upgrade to 2.45.1 release"
> * Added ptest-runner upgrade to 2.5.1 to fix AB-INT bug #16163
>
> Passed a-full on autobuilder:
> * v1: https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/=
3670
> * With the binutils upgrades: A failing ptest due to #16163:
>   https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/367=
4
> * This v2 (with #16163 fixes):
>   https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/367=
6
>   (Still running when I send this)
I cancelled this build: it found a real regression in python 3.13 tested un=
der
ptest-runner >=3D2.5.0.

I'm testing a patch:
* https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/3677
* https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dstable=
/whinlatter-nut&id=3D4fbdd0fc15fe23f469454a063d1c966876a71426

>
> The following changes since commit e8a3acb03d4c466cd08e358953df15746cb5aa=
ca:
>
>   vim: Fix CVE-2026-26269 (2026-04-02 00:08:06 +0200)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/openembedded-core-contrib stable/whinlatte=
r-nut
>   https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dstable/=
whinlatter-nut
>
> for you to fetch changes up to e0de7f715cc1db6c3c5a86fd7105fb0614c26bf3:
>
>   ptest-runner: Upgrade 2.5.0 -> 2.5.1 (2026-04-17 00:06:42 +0200)
>
> ----------------------------------------------------------------
>
> Adarsh Jagadish Kamini (1):
>   binutils: mark CVE-2025-69650 and CVE-2025-69651 as disputed
>
> Alexander Kanavin (2):
>   selftest/minidebuginfo: extract files from tar archive using tarfile
>     module
>   selftest/gdbserver: replace shutil.unpack_archive with tarfile extract
>
> Ankur Tyagi (1):
>   barebox/barebox-tools: upgrade 2025.09.0 -> 2025.09.3
>
> Deepak Rathore (5):
>   binutils: Fix CVE-2025-69648
>   binutils: Fix CVE-2025-69644 CVE-2025-69647
>   binutils: Fix CVE-2025-69649
>   binutils: Fix CVE-2025-69652
>   nfs-utils: Fix CVE-2025-12801
>
> Hemanth Kumar M D (3):
>   libxcrypt: avoid discarded-qualifiers build failure with glibc 2.43
>   glibc: stable 2.42 branch updates
>   binutils: Upgrade to 2.45.1 release
>
> Hitendra Prajapati (3):
>   vim: Fix CVE-2026-33412
>   vim: Fix CVE-2026-28418
>   vim: Fix CVE-2026-28419
>
> Khem Raj (3):
>   virglrenderer: Fix build with glibc 2.43+
>   libxcrypt: Fix build wrt C23 support
>   libxcrypt: Use configure knob to disable warnings as errors
>
> Martin Jansa (8):
>   gcc: backport a fix for building with gcc-16
>   dtc: backport fix for build with glibc-2.43
>   m4: backport 3 gnulib changes to fix build with glibc-2.43 on host
>   gettext: backport gnulib changes to fix build with glibc-2.43 on host
>   util-linux: backport fix to build with glibc-2.43 on host
>   systemd: backport fix to build with glibc-2.43 on host
>   spirv-tools: backport a fix for building with gcc-16
>   ovmf: backport a fix for build with gcc-16
>
> Michael Halstead (1):
>   yocto-uninative: Update to 5.1 for glibc 2.43
>
> Peter Marko (4):
>   libarchive: upgrade 3.8.5 -> 3.8.6
>   openssl: upgrade 3.5.5 -> 3.5.6
>   go: upgrade 1.25.8 -> 1.25.9
>   libpng: upgrade 1.6.55 -> 1.6.56
>
> Richard Purdie (5):
>   pseudo: Add fix for glibc 2.43
>   recipetool: Recognise https://git. as git urls
>   selftest/scripts: Update old git protocol references
>   archiver: Don't try to preserve all attributes when copying files
>   ptest-runner: Upgrade 2.5.0 -> 2.5.1
>
> Sunil Dora (1):
>   license.py: Drop visit_Str from SeenVisitor in selftest
>
> Trevor Gamblin (1):
>   report-error.bbclass: replace 'codecs.open()' with 'open()'
>
> Vijay Anusuri (2):
>   sqlite3: Fix CVE-2025-70873
>   python3: upgrade 3.13.11 -> 3.13.12
>
> Yoann Congal (10):
>   oeqa/selftest/devtool: add vulkan feature check for test needing it
>   oeqa/selftest: add wayland feature check for tests needing it
>   oeqa/sdk: Default to https git protocol for YP/OE repos
>   scripts: Default to https git protocol for YP/OE repos
>   oeqa/selftest/git-submodule-test: Default to https git protocol for
>     YP/OE repos
>   meta/files/layers.example.json: switch to https clone URIs
>   build-appliance-image: switch SRC_URI to https protocol
>   scripts/install-buildtools: Update to 5.3.3
>   ptest-runner: Upgrade 2.4.5.1 -> 2.5.0
>   ptest-runner: Use git tag in SRC_URI
>
> Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi (1):
>   binutils: Fix build with GLIBC 2.43 on the host
>
>  .../devtool/devtool-upgrade-test2_git.bb      |    2 +-
>  .../devtool-upgrade-test2_git.bb.upgraded     |    2 +-
>  .../devtool/devtool-upgrade-test5_git.bb      |    4 +-
>  .../devtool-upgrade-test5_git.bb.upgraded     |    4 +-
>  .../git-submodule-test/git-submodule-test.bb  |    4 +-
>  meta/classes/archiver.bbclass                 |    2 +-
>  meta/classes/report-error.bbclass             |    8 +-
>  meta/conf/distro/include/yocto-uninative.inc  |   10 +-
>  meta/files/layers.example.json                |    4 +-
>  meta/lib/oeqa/buildtools-docs/cases/build.py  |    2 +-
>  meta/lib/oeqa/selftest/cases/archiver.py      |    4 +-
>  meta/lib/oeqa/selftest/cases/devtool.py       |    8 +-
>  meta/lib/oeqa/selftest/cases/externalsrc.py   |    2 +-
>  meta/lib/oeqa/selftest/cases/gdbserver.py     |    4 +-
>  .../oeqa/selftest/cases/gitarchivetests.py    |    2 +-
>  .../oeqa/selftest/cases/incompatible_lic.py   |    2 +
>  meta/lib/oeqa/selftest/cases/minidebuginfo.py |    7 +-
>  meta/lib/oeqa/selftest/cases/oelib/license.py |    4 +-
>  meta/lib/oeqa/selftest/cases/sstatetests.py   |    4 +-
>  .../cases/yoctotestresultsquerytests.py       |    2 +-
>  meta/recipes-bsp/barebox/barebox-common.inc   |    4 +-
>  .../CVE-2025-12801-dependent_p1.patch         |   81 +
>  .../CVE-2025-12801-dependent_p2.patch         |  181 ++
>  .../CVE-2025-12801-dependent_p3.patch         |  465 +++++
>  .../nfs-utils/nfs-utils/CVE-2025-12801.patch  |  254 +++
>  .../nfs-utils/nfs-utils_2.8.4.bb              |    4 +
>  ...sysroot-and-debug-prefix-map-from-co.patch |    2 +-
>  .../{openssl_3.5.5.bb =3D> openssl_3.5.6.bb}    |    2 +-
>  ...23-qualifier-generic-fns-like-strchr.patch |  626 ++++++
>  meta/recipes-core/gettext/gettext_0.26.bb     |    1 +
>  meta/recipes-core/glibc/glibc-version.inc     |    2 +-
>  meta/recipes-core/glibc/glibc_2.42.bb         |    2 +-
>  .../images/build-appliance-image_15.0.0.bb    |    6 +-
>  ...24d6e87aeae631bc0a7bb1ba983cf8def4de.patch |   29 +
>  meta/recipes-core/libxcrypt/libxcrypt.inc     |    6 +-
>  ...Tools-StringFuncs-fix-gcc-16-warning.patch |   42 +
>  ...aseTools-EfiRom-fix-compiler-warning.patch |   44 +
>  meta/recipes-core/ovmf/ovmf_git.bb            |    2 +
>  meta/recipes-core/systemd/systemd.inc         |    4 +-
>  ...ilter-out-EFSBADCRC-and-EFSCORRUPTED.patch |   34 +
>  meta/recipes-core/util-linux/util-linux.inc   |    1 +
>  ...x-bsearch-macro-usage-with-glibc-C23.patch |   40 +
>  .../binutils/binutils-2.45.inc                |   13 +-
>  ...tect-against-standard-library-macros.patch |   34 +
>  ...-system-directories-when-cross-linki.patch |   38 +-
>  .../binutils/0008-Use-libtool-2.4.patch       | 1827 ++++++++---------
>  .../CVE-2025-69644_CVE-2025-69647.patch       |   85 +
>  .../binutils/binutils/CVE-2025-69648.patch    |  189 ++
>  .../binutils/binutils/CVE-2025-69649.patch    |   41 +
>  .../binutils/binutils/CVE-2025-69652.patch    |   40 +
>  meta/recipes-devtools/gcc/gcc-15.2.inc        |    1 +
>  ...dy-Make-it-buildable-by-C-11-to-C-26.patch |  257 +++
>  .../go/{go-1.25.8.inc =3D> go-1.25.9.inc}       |    2 +-
>  ...e_1.25.8.bb =3D> go-binary-native_1.25.9.bb} |    6 +-
>  ..._1.25.8.bb =3D> go-cross-canadian_1.25.9.bb} |    0
>  ...{go-cross_1.25.8.bb =3D> go-cross_1.25.9.bb} |    0
>  ...osssdk_1.25.8.bb =3D> go-crosssdk_1.25.9.bb} |    0
>  ...runtime_1.25.8.bb =3D> go-runtime_1.25.9.bb} |    0
>  ...ent-based-hash-generation-less-pedan.patch |    8 +-
>  ...d-go-make-GOROOT-precious-by-default.patch |    2 +-
>  .../go/{go_1.25.8.bb =3D> go_1.25.9.bb}         |    0
>  meta/recipes-devtools/m4/m4-1.4.20.inc        |    3 +
>  ...-Fix-some-g-Wsystem-headers-warnings.patch |  135 ++
>  ...pilation-error-on-macOS-with-fortify.patch |  126 ++
>  ...23-qualifier-generic-fns-like-strchr.patch |  194 ++
>  meta/recipes-devtools/pseudo/pseudo_git.bb    |    2 +-
>  ...{python3_3.13.11.bb =3D> python3_3.13.12.bb} |    2 +-
>  ...ibarchive_3.8.5.bb =3D> libarchive_3.8.6.bb} |    2 +-
>  ...sue-with-gcc-16-replaeces-PR-6542-65.patch |   50 +
>  .../spir/spirv-tools_1.4.328.1.bb             |    3 +-
>  ...once_flag-ONCE_FLAG_INIT-when-presen.patch |   55 +
>  .../virglrenderer/virglrenderer_1.1.1.bb      |    1 +
>  .../0001-Fix-discarded-const-qualifiers.patch |   83 +
>  meta/recipes-kernel/dtc/dtc_1.7.2.bb          |    1 +
>  .../{libpng_1.6.55.bb =3D> libpng_1.6.56.bb}    |    2 +-
>  ...unner_2.4.5.1.bb =3D> ptest-runner_2.5.1.bb} |    5 +-
>  .../sqlite/files/CVE-2025-70873.patch         |   33 +
>  meta/recipes-support/sqlite/sqlite3_3.48.0.bb |    1 +
>  .../vim/files/CVE-2026-28418.patch            |   78 +
>  .../vim/files/CVE-2026-28419.patch            |   86 +
>  .../vim/files/CVE-2026-33412.patch            |   61 +
>  meta/recipes-support/vim/vim.inc              |    3 +
>  scripts/combo-layer.conf.example              |    4 +-
>  scripts/contrib/patchtest.sh                  |    4 +-
>  scripts/install-buildtools                    |    4 +-
>  scripts/lib/recipetool/create.py              |    2 +-
>  scripts/yocto_testresults_query.py            |    2 +-
>  87 files changed, 4290 insertions(+), 1108 deletions(-)
>  create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-202=
5-12801-dependent_p1.patch
>  create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-202=
5-12801-dependent_p2.patch
>  create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-202=
5-12801-dependent_p3.patch
>  create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-202=
5-12801.patch
>  rename meta/recipes-connectivity/openssl/{openssl_3.5.5.bb =3D> openssl_=
3.5.6.bb} (99%)
>  create mode 100644 meta/recipes-core/gettext/gettext/0001-Port-to-C23-qu=
alifier-generic-fns-like-strchr.patch
>  create mode 100644 meta/recipes-core/libxcrypt/files/174c24d6e87aeae631b=
c0a7bb1ba983cf8def4de.patch
>  create mode 100644 meta/recipes-core/ovmf/ovmf/0006-BaseTools-StringFunc=
s-fix-gcc-16-warning.patch
>  create mode 100644 meta/recipes-core/ovmf/ovmf/0007-BaseTools-EfiRom-fix=
-compiler-warning.patch
>  create mode 100644 meta/recipes-core/systemd/systemd/0001-errno-list-fil=
ter-out-EFSBADCRC-and-EFSCORRUPTED.patch
>  create mode 100644 meta/recipes-core/util-linux/util-linux/0001-lsfd-fix=
-bsearch-macro-usage-with-glibc-C23.patch
>  create mode 100644 meta/recipes-devtools/binutils/binutils/0001-gprofng-=
protect-against-standard-library-macros.patch
>  create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-6964=
4_CVE-2025-69647.patch
>  create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-6964=
8.patch
>  create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-6964=
9.patch
>  create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-6965=
2.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc/0028-libcody-Make-it-bu=
ildable-by-C-11-to-C-26.patch
>  rename meta/recipes-devtools/go/{go-1.25.8.inc =3D> go-1.25.9.inc} (91%)
>  rename meta/recipes-devtools/go/{go-binary-native_1.25.8.bb =3D> go-bina=
ry-native_1.25.9.bb} (79%)
>  rename meta/recipes-devtools/go/{go-cross-canadian_1.25.8.bb =3D> go-cro=
ss-canadian_1.25.9.bb} (100%)
>  rename meta/recipes-devtools/go/{go-cross_1.25.8.bb =3D> go-cross_1.25.9=
.bb} (100%)
>  rename meta/recipes-devtools/go/{go-crosssdk_1.25.8.bb =3D> go-crosssdk_=
1.25.9.bb} (100%)
>  rename meta/recipes-devtools/go/{go-runtime_1.25.8.bb =3D> go-runtime_1.=
25.9.bb} (100%)
>  rename meta/recipes-devtools/go/{go_1.25.8.bb =3D> go_1.25.9.bb} (100%)
>  create mode 100644 meta/recipes-devtools/m4/m4/0001-string-h-wchar-h-Fix=
-some-g-Wsystem-headers-warnings.patch
>  create mode 100644 meta/recipes-devtools/m4/m4/0002-string-h-Fix-compila=
tion-error-on-macOS-with-fortify.patch
>  create mode 100644 meta/recipes-devtools/m4/m4/0003-Port-to-C23-qualifie=
r-generic-fns-like-strchr.patch
>  rename meta/recipes-devtools/python/{python3_3.13.11.bb =3D> python3_3.1=
3.12.bb} (99%)
>  rename meta/recipes-extended/libarchive/{libarchive_3.8.5.bb =3D> libarc=
hive_3.8.6.bb} (96%)
>  create mode 100644 meta/recipes-graphics/spir/spirv-tools/0001-opt-Fix-b=
uild-issue-with-gcc-16-replaeces-PR-6542-65.patch
>  create mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer/000=
1-c11-use-glibc-s-once_flag-ONCE_FLAG_INIT-when-presen.patch
>  create mode 100644 meta/recipes-kernel/dtc/dtc/0001-Fix-discarded-const-=
qualifiers.patch
>  rename meta/recipes-multimedia/libpng/{libpng_1.6.55.bb =3D> libpng_1.6.=
56.bb} (97%)
>  rename meta/recipes-support/ptest-runner/{ptest-runner_2.4.5.1.bb =3D> p=
test-runner_2.5.1.bb} (93%)
>  create mode 100644 meta/recipes-support/sqlite/files/CVE-2025-70873.patc=
h
>  create mode 100644 meta/recipes-support/vim/files/CVE-2026-28418.patch
>  create mode 100644 meta/recipes-support/vim/files/CVE-2026-28419.patch
>  create mode 100644 meta/recipes-support/vim/files/CVE-2026-33412.patch


--=20
Yoann Congal
Smile ECS


