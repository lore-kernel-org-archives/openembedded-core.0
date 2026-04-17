Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47194F8D75C
	for <webhook@archiver.kernel.org>; Fri, 17 Apr 2026 08:20:25 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39856.1776414018331250720
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Apr 2026 01:20:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=k4gd1GCo;
 spf=pass (domain: smile.fr, ip: 209.85.128.67, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-488b8bc6bc9so2544085e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Apr 2026 01:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776414016; x=1777018816; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PEMlAHt2X/1Lr2TD2ZV0AQRO+fNR8eAW33sYro+Pogs=;
        b=k4gd1GCoWTVRAUEQf1tpWN/ZxuEQNuk80E14PaDb4bIlZU6AG5315ML9LpIkAPCyri
         mO0zKxt6c8dF8QZ+ntV9j9m+TP6mKkmVnb3OqCSQ0uAAHXlwyD2IZhUq6oUvhUKi03XH
         cVFpOVyllG0upz+E3enAs/+G6Xve8mh9xEjv4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776414016; x=1777018816;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PEMlAHt2X/1Lr2TD2ZV0AQRO+fNR8eAW33sYro+Pogs=;
        b=qIihLfhrLMatSJ6VvBwiDE8L1EVBv5+urq+YZjkRooV57AD0y2Rkqd2KEEn2G+b/kj
         wQsU6Gf3Pmfboqm1CELGcqQdIIaW/1ftI6Ix1jD4rSABGHnglbjMJS8xXOv/zQrJSESK
         JiWFb7IMXfut8NTaZhbaeagYRctXov+l9hTfDtxByhjgGkZPaJaXzMZirVBHWJjHdlLv
         P09s8Ah+hF0rKFPxx8LPlcLGzOLeKPcw6wTjNJnN+QxnDNTTZ5xdKaCGV4CDQ85pEf8o
         7ZMT/xHjDqBOdPD4cWkRTQ8+JufKcDqtOOfAtUGGHy1B+on8wtCtZPMgVKqcZI5ssPEt
         ScCQ==
X-Forwarded-Encrypted: i=1; AFNElJ/BWAVEnrcR/iLTdgrZj10hZGxCE//9s+CJucebjuAlkXizvTFHT7mbCvNi1nPWg01FeqIrJTPYshemxviyKNbFcQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwRQsXCAdp/o4nffOnkM6RZpz585FLIgSpW597oUFlEeO/7+IfV
	sWdFcUnxpIMjCbwrhzNCG1Uc35+AOr/4YS1RT0JfcQgER3hisPjMpmSi70ON3RS2dIQ=
X-Gm-Gg: AeBDievCi8w+JJwhPOsOBX8U3gMb5OxC+jVchRacSv+PXJXjFeh+s/qiVMDJYaC0viM
	jL3QQMy9oKmHMkNNEy9HJ/8nf66kZkgkIbvQVXZavs4f6uayMDWWHtgQAl/EaeLHM/yD/Dpuv+f
	Hi5DGrq8DjoDhoVdB6/bK37TOI+LDJ/tJ4AjYAtLxCJMGqcIbwzhKBxVSMEh32UWFsblGBZj8jq
	G722EMwxKA0wPGj6kToSGKSEXXD5mNAQawNQT2EVzU9MQUsqdWF7z55gkEeof6xLxomc7D2noCq
	Mj2gRQeWulga9D0v2lkNNQ/b/aTNid2FpKbKrN/+OhQ83SScDCOUWnPtmpbmst5h08HqytsxVYC
	LRWoWbG5PY1JklJ4kfCeee2kmGXDdHNtaB1nC8Oaa6J3sIGfG9RzM5KIkhX4tevIleKKnx8Ifaz
	RG5f5PJlrcARlNguo5B/f6empPjeUpg6C7guLlAxR3fWzvqJvURm4aLCrV5Ua0mXHyS31tW3o8o
	wLhvWE0HoPd09NNKNWN7N7xhQ==
X-Received: by 2002:a05:600c:c089:b0:488:a2ac:a337 with SMTP id 5b1f17b1804b1-488fb77ab26mr15626495e9.21.1776414016211;
        Fri, 17 Apr 2026 01:20:16 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc181c6dsm24743445e9.6.2026.04.17.01.20.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 01:20:15 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Apr 2026 10:20:15 +0200
Message-Id: <DHVA7OKM4Z5B.8F1XG493U352@smile.fr>
Subject: Re: [OE-core][whinlatter v2 00/51] Patch review
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Yoann Congal" <yoann.congal@smile.fr>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <cover.1776377993.git.yoann.congal@smile.fr>
 <DHUZI5QSPK97.31K106SQF017P@smile.fr>
In-Reply-To: <DHUZI5QSPK97.31K106SQF017P@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Apr 2026 08:20:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235486

On Fri Apr 17, 2026 at 1:56 AM CEST, Yoann Congal wrote:
> On Fri Apr 17, 2026 at 12:29 AM CEST, Yoann Congal wrote:
>> Please review this set of changes for whinlatter and have comments back =
by
>> end of day Sunday, April 19. I plan to do the release build on Monday.
>>
>> This is a relatively "big" series compared to the usual: In addition to
>> the usual CVE fixes, there are:
>> - "git://" protocol patches
>> - Ubunutu 26.04 support patches (Host glibc 2.43 and GCC 16)
>>
>> Please note: This will be the last review cycle for whinlatter.
>> If you expect a patch to get merged and it is not in this series ping
>> me as soon as possible.
>>
>> v1->v2:
>> * Added "binutils: Upgrade to 2.45.1 release"
>> * Added ptest-runner upgrade to 2.5.1 to fix AB-INT bug #16163
>>
>> Passed a-full on autobuilder:
>> * v1: https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds=
/3670
>> * With the binutils upgrades: A failing ptest due to #16163:
>>   https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/36=
74
>> * This v2 (with #16163 fixes):
>>   https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/36=
76
>>   (Still running when I send this)
> I cancelled this build: it found a real regression in python 3.13 tested =
under
> ptest-runner >=3D2.5.0.
>
> I'm testing a patch:
> * https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/367=
7
> * https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dstab=
le/whinlatter-nut&id=3D4fbdd0fc15fe23f469454a063d1c966876a71426

I've sent the patch here:
* [whinlatter][PATCH] python3: Fix test under ptest-runner 2.5.1
  https://lore.kernel.org/openembedded-core/20260417075943.1398549-1-yoann.=
congal@smile.fr/T/#u

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/3678
* qemuarm64-ptest failed with #16150 - AB-INT: oe-selftest-armhost: Failed =
to start QEMU (hangs with drm)
  https://autobuilder.yoctoproject.org/valkyrie/?#/builders/61/builds/3503
  * ... but was sucessfully retried as:
    https://autobuilder.yoctoproject.org/valkyrie/?#/builders/61/builds/350=
5

I don't think it's worth resending the whole series for this added
patch. But I can send it as v3 if someone finds that useful.

Regards,

>
>>
>> The following changes since commit e8a3acb03d4c466cd08e358953df15746cb5a=
aca:
>>
>>   vim: Fix CVE-2026-26269 (2026-04-02 00:08:06 +0200)
>>
>> are available in the Git repository at:
>>
>>   https://git.openembedded.org/openembedded-core-contrib stable/whinlatt=
er-nut
>>   https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dstable=
/whinlatter-nut
>>
>> for you to fetch changes up to e0de7f715cc1db6c3c5a86fd7105fb0614c26bf3:
>>
>>   ptest-runner: Upgrade 2.5.0 -> 2.5.1 (2026-04-17 00:06:42 +0200)
>>
>> ----------------------------------------------------------------
>>
>> Adarsh Jagadish Kamini (1):
>>   binutils: mark CVE-2025-69650 and CVE-2025-69651 as disputed
>>
>> Alexander Kanavin (2):
>>   selftest/minidebuginfo: extract files from tar archive using tarfile
>>     module
>>   selftest/gdbserver: replace shutil.unpack_archive with tarfile extract
>>
>> Ankur Tyagi (1):
>>   barebox/barebox-tools: upgrade 2025.09.0 -> 2025.09.3
>>
>> Deepak Rathore (5):
>>   binutils: Fix CVE-2025-69648
>>   binutils: Fix CVE-2025-69644 CVE-2025-69647
>>   binutils: Fix CVE-2025-69649
>>   binutils: Fix CVE-2025-69652
>>   nfs-utils: Fix CVE-2025-12801
>>
>> Hemanth Kumar M D (3):
>>   libxcrypt: avoid discarded-qualifiers build failure with glibc 2.43
>>   glibc: stable 2.42 branch updates
>>   binutils: Upgrade to 2.45.1 release
>>
>> Hitendra Prajapati (3):
>>   vim: Fix CVE-2026-33412
>>   vim: Fix CVE-2026-28418
>>   vim: Fix CVE-2026-28419
>>
>> Khem Raj (3):
>>   virglrenderer: Fix build with glibc 2.43+
>>   libxcrypt: Fix build wrt C23 support
>>   libxcrypt: Use configure knob to disable warnings as errors
>>
>> Martin Jansa (8):
>>   gcc: backport a fix for building with gcc-16
>>   dtc: backport fix for build with glibc-2.43
>>   m4: backport 3 gnulib changes to fix build with glibc-2.43 on host
>>   gettext: backport gnulib changes to fix build with glibc-2.43 on host
>>   util-linux: backport fix to build with glibc-2.43 on host
>>   systemd: backport fix to build with glibc-2.43 on host
>>   spirv-tools: backport a fix for building with gcc-16
>>   ovmf: backport a fix for build with gcc-16
>>
>> Michael Halstead (1):
>>   yocto-uninative: Update to 5.1 for glibc 2.43
>>
>> Peter Marko (4):
>>   libarchive: upgrade 3.8.5 -> 3.8.6
>>   openssl: upgrade 3.5.5 -> 3.5.6
>>   go: upgrade 1.25.8 -> 1.25.9
>>   libpng: upgrade 1.6.55 -> 1.6.56
>>
>> Richard Purdie (5):
>>   pseudo: Add fix for glibc 2.43
>>   recipetool: Recognise https://git. as git urls
>>   selftest/scripts: Update old git protocol references
>>   archiver: Don't try to preserve all attributes when copying files
>>   ptest-runner: Upgrade 2.5.0 -> 2.5.1
>>
>> Sunil Dora (1):
>>   license.py: Drop visit_Str from SeenVisitor in selftest
>>
>> Trevor Gamblin (1):
>>   report-error.bbclass: replace 'codecs.open()' with 'open()'
>>
>> Vijay Anusuri (2):
>>   sqlite3: Fix CVE-2025-70873
>>   python3: upgrade 3.13.11 -> 3.13.12
>>
>> Yoann Congal (10):
>>   oeqa/selftest/devtool: add vulkan feature check for test needing it
>>   oeqa/selftest: add wayland feature check for tests needing it
>>   oeqa/sdk: Default to https git protocol for YP/OE repos
>>   scripts: Default to https git protocol for YP/OE repos
>>   oeqa/selftest/git-submodule-test: Default to https git protocol for
>>     YP/OE repos
>>   meta/files/layers.example.json: switch to https clone URIs
>>   build-appliance-image: switch SRC_URI to https protocol
>>   scripts/install-buildtools: Update to 5.3.3
>>   ptest-runner: Upgrade 2.4.5.1 -> 2.5.0
>>   ptest-runner: Use git tag in SRC_URI
>>
>> Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi (1):
>>   binutils: Fix build with GLIBC 2.43 on the host
>>
>>  .../devtool/devtool-upgrade-test2_git.bb      |    2 +-
>>  .../devtool-upgrade-test2_git.bb.upgraded     |    2 +-
>>  .../devtool/devtool-upgrade-test5_git.bb      |    4 +-
>>  .../devtool-upgrade-test5_git.bb.upgraded     |    4 +-
>>  .../git-submodule-test/git-submodule-test.bb  |    4 +-
>>  meta/classes/archiver.bbclass                 |    2 +-
>>  meta/classes/report-error.bbclass             |    8 +-
>>  meta/conf/distro/include/yocto-uninative.inc  |   10 +-
>>  meta/files/layers.example.json                |    4 +-
>>  meta/lib/oeqa/buildtools-docs/cases/build.py  |    2 +-
>>  meta/lib/oeqa/selftest/cases/archiver.py      |    4 +-
>>  meta/lib/oeqa/selftest/cases/devtool.py       |    8 +-
>>  meta/lib/oeqa/selftest/cases/externalsrc.py   |    2 +-
>>  meta/lib/oeqa/selftest/cases/gdbserver.py     |    4 +-
>>  .../oeqa/selftest/cases/gitarchivetests.py    |    2 +-
>>  .../oeqa/selftest/cases/incompatible_lic.py   |    2 +
>>  meta/lib/oeqa/selftest/cases/minidebuginfo.py |    7 +-
>>  meta/lib/oeqa/selftest/cases/oelib/license.py |    4 +-
>>  meta/lib/oeqa/selftest/cases/sstatetests.py   |    4 +-
>>  .../cases/yoctotestresultsquerytests.py       |    2 +-
>>  meta/recipes-bsp/barebox/barebox-common.inc   |    4 +-
>>  .../CVE-2025-12801-dependent_p1.patch         |   81 +
>>  .../CVE-2025-12801-dependent_p2.patch         |  181 ++
>>  .../CVE-2025-12801-dependent_p3.patch         |  465 +++++
>>  .../nfs-utils/nfs-utils/CVE-2025-12801.patch  |  254 +++
>>  .../nfs-utils/nfs-utils_2.8.4.bb              |    4 +
>>  ...sysroot-and-debug-prefix-map-from-co.patch |    2 +-
>>  .../{openssl_3.5.5.bb =3D> openssl_3.5.6.bb}    |    2 +-
>>  ...23-qualifier-generic-fns-like-strchr.patch |  626 ++++++
>>  meta/recipes-core/gettext/gettext_0.26.bb     |    1 +
>>  meta/recipes-core/glibc/glibc-version.inc     |    2 +-
>>  meta/recipes-core/glibc/glibc_2.42.bb         |    2 +-
>>  .../images/build-appliance-image_15.0.0.bb    |    6 +-
>>  ...24d6e87aeae631bc0a7bb1ba983cf8def4de.patch |   29 +
>>  meta/recipes-core/libxcrypt/libxcrypt.inc     |    6 +-
>>  ...Tools-StringFuncs-fix-gcc-16-warning.patch |   42 +
>>  ...aseTools-EfiRom-fix-compiler-warning.patch |   44 +
>>  meta/recipes-core/ovmf/ovmf_git.bb            |    2 +
>>  meta/recipes-core/systemd/systemd.inc         |    4 +-
>>  ...ilter-out-EFSBADCRC-and-EFSCORRUPTED.patch |   34 +
>>  meta/recipes-core/util-linux/util-linux.inc   |    1 +
>>  ...x-bsearch-macro-usage-with-glibc-C23.patch |   40 +
>>  .../binutils/binutils-2.45.inc                |   13 +-
>>  ...tect-against-standard-library-macros.patch |   34 +
>>  ...-system-directories-when-cross-linki.patch |   38 +-
>>  .../binutils/0008-Use-libtool-2.4.patch       | 1827 ++++++++---------
>>  .../CVE-2025-69644_CVE-2025-69647.patch       |   85 +
>>  .../binutils/binutils/CVE-2025-69648.patch    |  189 ++
>>  .../binutils/binutils/CVE-2025-69649.patch    |   41 +
>>  .../binutils/binutils/CVE-2025-69652.patch    |   40 +
>>  meta/recipes-devtools/gcc/gcc-15.2.inc        |    1 +
>>  ...dy-Make-it-buildable-by-C-11-to-C-26.patch |  257 +++
>>  .../go/{go-1.25.8.inc =3D> go-1.25.9.inc}       |    2 +-
>>  ...e_1.25.8.bb =3D> go-binary-native_1.25.9.bb} |    6 +-
>>  ..._1.25.8.bb =3D> go-cross-canadian_1.25.9.bb} |    0
>>  ...{go-cross_1.25.8.bb =3D> go-cross_1.25.9.bb} |    0
>>  ...osssdk_1.25.8.bb =3D> go-crosssdk_1.25.9.bb} |    0
>>  ...runtime_1.25.8.bb =3D> go-runtime_1.25.9.bb} |    0
>>  ...ent-based-hash-generation-less-pedan.patch |    8 +-
>>  ...d-go-make-GOROOT-precious-by-default.patch |    2 +-
>>  .../go/{go_1.25.8.bb =3D> go_1.25.9.bb}         |    0
>>  meta/recipes-devtools/m4/m4-1.4.20.inc        |    3 +
>>  ...-Fix-some-g-Wsystem-headers-warnings.patch |  135 ++
>>  ...pilation-error-on-macOS-with-fortify.patch |  126 ++
>>  ...23-qualifier-generic-fns-like-strchr.patch |  194 ++
>>  meta/recipes-devtools/pseudo/pseudo_git.bb    |    2 +-
>>  ...{python3_3.13.11.bb =3D> python3_3.13.12.bb} |    2 +-
>>  ...ibarchive_3.8.5.bb =3D> libarchive_3.8.6.bb} |    2 +-
>>  ...sue-with-gcc-16-replaeces-PR-6542-65.patch |   50 +
>>  .../spir/spirv-tools_1.4.328.1.bb             |    3 +-
>>  ...once_flag-ONCE_FLAG_INIT-when-presen.patch |   55 +
>>  .../virglrenderer/virglrenderer_1.1.1.bb      |    1 +
>>  .../0001-Fix-discarded-const-qualifiers.patch |   83 +
>>  meta/recipes-kernel/dtc/dtc_1.7.2.bb          |    1 +
>>  .../{libpng_1.6.55.bb =3D> libpng_1.6.56.bb}    |    2 +-
>>  ...unner_2.4.5.1.bb =3D> ptest-runner_2.5.1.bb} |    5 +-
>>  .../sqlite/files/CVE-2025-70873.patch         |   33 +
>>  meta/recipes-support/sqlite/sqlite3_3.48.0.bb |    1 +
>>  .../vim/files/CVE-2026-28418.patch            |   78 +
>>  .../vim/files/CVE-2026-28419.patch            |   86 +
>>  .../vim/files/CVE-2026-33412.patch            |   61 +
>>  meta/recipes-support/vim/vim.inc              |    3 +
>>  scripts/combo-layer.conf.example              |    4 +-
>>  scripts/contrib/patchtest.sh                  |    4 +-
>>  scripts/install-buildtools                    |    4 +-
>>  scripts/lib/recipetool/create.py              |    2 +-
>>  scripts/yocto_testresults_query.py            |    2 +-
>>  87 files changed, 4290 insertions(+), 1108 deletions(-)
>>  create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-20=
25-12801-dependent_p1.patch
>>  create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-20=
25-12801-dependent_p2.patch
>>  create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-20=
25-12801-dependent_p3.patch
>>  create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-20=
25-12801.patch
>>  rename meta/recipes-connectivity/openssl/{openssl_3.5.5.bb =3D> openssl=
_3.5.6.bb} (99%)
>>  create mode 100644 meta/recipes-core/gettext/gettext/0001-Port-to-C23-q=
ualifier-generic-fns-like-strchr.patch
>>  create mode 100644 meta/recipes-core/libxcrypt/files/174c24d6e87aeae631=
bc0a7bb1ba983cf8def4de.patch
>>  create mode 100644 meta/recipes-core/ovmf/ovmf/0006-BaseTools-StringFun=
cs-fix-gcc-16-warning.patch
>>  create mode 100644 meta/recipes-core/ovmf/ovmf/0007-BaseTools-EfiRom-fi=
x-compiler-warning.patch
>>  create mode 100644 meta/recipes-core/systemd/systemd/0001-errno-list-fi=
lter-out-EFSBADCRC-and-EFSCORRUPTED.patch
>>  create mode 100644 meta/recipes-core/util-linux/util-linux/0001-lsfd-fi=
x-bsearch-macro-usage-with-glibc-C23.patch
>>  create mode 100644 meta/recipes-devtools/binutils/binutils/0001-gprofng=
-protect-against-standard-library-macros.patch
>>  create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-696=
44_CVE-2025-69647.patch
>>  create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-696=
48.patch
>>  create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-696=
49.patch
>>  create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-696=
52.patch
>>  create mode 100644 meta/recipes-devtools/gcc/gcc/0028-libcody-Make-it-b=
uildable-by-C-11-to-C-26.patch
>>  rename meta/recipes-devtools/go/{go-1.25.8.inc =3D> go-1.25.9.inc} (91%=
)
>>  rename meta/recipes-devtools/go/{go-binary-native_1.25.8.bb =3D> go-bin=
ary-native_1.25.9.bb} (79%)
>>  rename meta/recipes-devtools/go/{go-cross-canadian_1.25.8.bb =3D> go-cr=
oss-canadian_1.25.9.bb} (100%)
>>  rename meta/recipes-devtools/go/{go-cross_1.25.8.bb =3D> go-cross_1.25.=
9.bb} (100%)
>>  rename meta/recipes-devtools/go/{go-crosssdk_1.25.8.bb =3D> go-crosssdk=
_1.25.9.bb} (100%)
>>  rename meta/recipes-devtools/go/{go-runtime_1.25.8.bb =3D> go-runtime_1=
.25.9.bb} (100%)
>>  rename meta/recipes-devtools/go/{go_1.25.8.bb =3D> go_1.25.9.bb} (100%)
>>  create mode 100644 meta/recipes-devtools/m4/m4/0001-string-h-wchar-h-Fi=
x-some-g-Wsystem-headers-warnings.patch
>>  create mode 100644 meta/recipes-devtools/m4/m4/0002-string-h-Fix-compil=
ation-error-on-macOS-with-fortify.patch
>>  create mode 100644 meta/recipes-devtools/m4/m4/0003-Port-to-C23-qualifi=
er-generic-fns-like-strchr.patch
>>  rename meta/recipes-devtools/python/{python3_3.13.11.bb =3D> python3_3.=
13.12.bb} (99%)
>>  rename meta/recipes-extended/libarchive/{libarchive_3.8.5.bb =3D> libar=
chive_3.8.6.bb} (96%)
>>  create mode 100644 meta/recipes-graphics/spir/spirv-tools/0001-opt-Fix-=
build-issue-with-gcc-16-replaeces-PR-6542-65.patch
>>  create mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer/00=
01-c11-use-glibc-s-once_flag-ONCE_FLAG_INIT-when-presen.patch
>>  create mode 100644 meta/recipes-kernel/dtc/dtc/0001-Fix-discarded-const=
-qualifiers.patch
>>  rename meta/recipes-multimedia/libpng/{libpng_1.6.55.bb =3D> libpng_1.6=
.56.bb} (97%)
>>  rename meta/recipes-support/ptest-runner/{ptest-runner_2.4.5.1.bb =3D> =
ptest-runner_2.5.1.bb} (93%)
>>  create mode 100644 meta/recipes-support/sqlite/files/CVE-2025-70873.pat=
ch
>>  create mode 100644 meta/recipes-support/vim/files/CVE-2026-28418.patch
>>  create mode 100644 meta/recipes-support/vim/files/CVE-2026-28419.patch
>>  create mode 100644 meta/recipes-support/vim/files/CVE-2026-33412.patch


--=20
Yoann Congal
Smile ECS


