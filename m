Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18D19CD4F54
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 20:59:27 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22742.1779310756327852124
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2026 13:59:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=gnSAk93C;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-44a14580111so3990137f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 13:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1779310754; x=1779915554; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=voe7TXFLNfslWd/sIPSS0ESCz5HxCbyI0g2L761pZgQ=;
        b=gnSAk93CkTyaRI3c8BsU177PXvbDQ4awPn0G0/Z74QxXDiFpaeZnUE6lteYfvz4Am1
         HZxofaLMIgczWPXw0eEJb10pFyvx4B8tukdXEjeB7nwucEUPl+D+5ML+Ejypl/b8cBcP
         0m42F9pzYYT47N3jcUEyuty2Ejn17+4xnzL44=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779310754; x=1779915554;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=voe7TXFLNfslWd/sIPSS0ESCz5HxCbyI0g2L761pZgQ=;
        b=aV46ViKL3YyVfUZ3d07QIK91GqhV9BGk2IoKuaLuTjlP1WsYQvhaOLQoIhmJuB2mQZ
         cdftCss2JAKu1EPMCyRERmk9TG93zaVwEeNROkEJxEJ6IGcdeiXM7JOomJ8j0v1FEK7r
         UjE2cIGKKcIs+p8l1veRzTPamYUGXSkvJFWxlmGYJr/Gv4TdPjo2B8HTj3Ysc4Tc8ciG
         cxR6g+kxhjEjZ3CEPgdOwumwx5qE7CoupX1ukEaY+UuVA113FBasCTgaLgtWrGE3AMLq
         dwCdS+XcgLuScHUzLLmtustZ8taSpyt7txYYsbXcj7x/+7LX0nBiQQUlZcfM1PQIvjlB
         DSYw==
X-Forwarded-Encrypted: i=1; AFNElJ9zlseuksJqBJnMhDl5Pg6DI16ibxqc1ipYdNuzxl4va+r3L8qKX7WK0gG/t8/Fau2qMLW76emqyRV2Piae+DzSeA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxuz3cOJjiifW/hPdwFavOlyXqs71/D6CHPtQ+0T/QOZHhPMVes
	R4eOUF6kf5xm1WtZTEZ0LBK4GC9INEPaJryYL8SqfVnJ79IiBQjP2UDxezYpv9peaD8=
X-Gm-Gg: Acq92OHN4eSgRV56QJGsivGXm4/+D6WWr+xRRhR1Q4wmTrx0ZpbOvZd+U8k4LYjR6YL
	5G0gGkySkhh06D4EickIsGUOCPVfhdC+LJRBd3FAiOYUvY3lS0FdYwNo+0BXGc7R83+jefv7VHC
	iI9srnNu291wFadD9IPpL/Zi7/OoEVbT5yRNGfpZ8Y2RHNGAoFahRxvsTjMOnjEVL8bb7XTTTIg
	6qCmh6SlIMu8PQw0IdqPZ0Mq/3ZSG0dXAsUXAbyNwfnlJrrRahZ5F8DnPtWsWVJSIp2+QuStdsy
	qaYWqTdxqiWoKpOnSpKc1/0E0CCfrMFf4aS6/sBVUvmfbDxYl0k+sPTMnRgq3BoyxrNb7h1jdTp
	AtQ+6hKnHaHhH1o7VWxkRtxydSKD9LQYg/nt4pq6kdyd1kVwbxKfneGIxm1D5UYpMYM6uXS1Xb3
	Dul+NEweAvqIlmChffuSLs4P10Srhe7jaLvWFKevQUJ19PPcI9YjXqznrGpqmkwDeNmYFdy9rBv
	dztaLKuBOoJ3HY=
X-Received: by 2002:a05:6000:22c5:b0:43d:7d24:b510 with SMTP id ffacd0b85a97d-45e5c5fd8demr42678888f8f.22.1779310754566;
        Wed, 20 May 2026 13:59:14 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45e7c22d8b7sm27687146f8f.6.2026.05.20.13.59.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 13:59:14 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 20 May 2026 22:59:13 +0200
Message-Id: <DINT0RVVGKUL.307JZTH39LFTH@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Yoann Congal" <yoann.congal@smile.fr>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][wrynose v2 00/28] Patch review
X-Mailer: aerc 0.20.0
References: <cover.1779264709.git.yoann.congal@smile.fr>
In-Reply-To: <cover.1779264709.git.yoann.congal@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 20:59:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237468

On Wed May 20, 2026 at 10:20 AM CEST, Yoann Congal wrote:
> Please review this set of changes for wrynose and have comments back by
> end of day Thursday, May 21.
>
> This is the v2 of https://lore.kernel.org/openembedded-core/cover.1779232=
800.git.yoann.congal@smile.fr/T/#t
> v1->v2:
> * Removed "[OE-core][wrynose 11/28] libsdl2: set status for CVE-2026-3544=
4"=20
> * Added "busybox: fix CVE-2026-29004"
>
> A build for this v2 series is running here:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3851
> I've run the added busybox patch through autobuilder in an earlier
> series, so I'm confident that this build will be OK (AB-INT excepted).

Got some AB-INTs but nothing related to this series:
* qemux86 https://autobuilder.yoctoproject.org/valkyrie/#/builders/30/build=
s/3766
  =3D> Bug #16284 =E2=80=93 AB-INT: do_testsdkext failed with no clear reas=
on
  retried as https://autobuilder.yoctoproject.org/valkyrie/#/builders/30/bu=
ilds/3767
* oe-selftest-debian https://autobuilder.yoctoproject.org/valkyrie/#/builde=
rs/35/builds/3884
  & oe-selftest-fedora https://autobuilder.yoctoproject.org/valkyrie/#/buil=
ders/48/builds/3746
  git.yoctoproject.org/git.openembedded.org hung up the HTTP git clone conn=
ection
  retried as:
    https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3885
    https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3747
* qemuriscv64-ptest https://autobuilder.yoctoproject.org/valkyrie/#/builder=
s/56/builds/1616
  =3D> I reported it: #16290 =E2=80=93 AB-INT PTEST RISCV64: procps ptest f=
ailure (pgrep_match_against_full_process_name)
  Retried as https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/bu=
ilds/1617

>
> The following changes since commit 080e184ad9a07b469da7e8b045a93cefd5bf24=
38:
>
>   glibc: Fix recipe bug that disabled stack protector (2026-05-12 16:18:2=
7 +0200)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/openembedded-core-contrib stable/wrynose-n=
ut
>   https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dstable/=
wrynose-nut
>
> for you to fetch changes up to 42adcd87a15f5921f0cc95424efd930876743824:
>
>   pseudo: Upgrade 1.9.6 -> 1.9.7 (2026-05-20 10:03:07 +0200)
>
> ----------------------------------------------------------------
>
> Alexander Kanavin (1):
>   sbom-cve-check: set PV from upstream tags and ensure version checks
>     are correct
>
> Andrew Geissler (1):
>   efivar: Backport patch to fix -march issue for ppc64le
>
> Ankur Tyagi (2):
>   tzdata/tzcode-native: upgrade 2026a -> 2026b
>   wireless-regdb: upgrade 2026.02.04 -> 2026.03.18
>
> Benjamin Robin (Schneider Electric) (3):
>   python3-sbom-cve-check: Update to version 1.3.1
>   sbom-cve-check-update-cvelist-native: Update source revision
>   sbom-cve-check-update-nvd-native: Update source revision
>
> Chen Qi (1):
>   busybox: fix CVE-2026-29004
>
> Daniel McGregor (1):
>   python3-requests: Increase chardet upper limit
>
> Dmitry Sakhonchik (1):
>   shadow-native: Change upstream status of disable_syslog.patch
>
> Jinwang Li (1):
>   bluez5: add patches to fix 8.56 gatt issue
>
> Jo=C3=A3o Marcos Costa (1):
>   default-distrovars.inc: add missing spaces in append overrides
>
> Peter Marko (7):
>   busybox: patch CVE-2024-58251
>   libsoup: set status for CVE-2026-2369
>   tiff: patch CVE-2026-4775
>   libssh2: patch CVE-2026-7598
>   libarchive: set status of CVE-2026-5745
>   libsoup: patch CVE-2026-2708
>   glibc: stable 2.43 branch updates
>
> Quan Sun (1):
>   qemu: fix iotlb_to_section() for different AddressSpace
>
> Richard Purdie (2):
>   utils: Handle unexpanded variables in DISTRO_FEATURES
>   pseudo: Upgrade 1.9.6 -> 1.9.7
>
> Robert P. J. Day (1):
>   features-check.bbclass: add reference to required TUNE_FEATURES
>
> Sam Kent (1):
>   oe-pkgdata-util: fix empty runtime-rprovides directory handling
>
> Thomas Perrot (2):
>   oe-pkgdata-util: fix runtime-rprovides handling in lookup_pkg error
>     path
>   scripts/makefile-getvar: quote MAKEFILE variable
>
> Yoann Congal (2):
>   README: Add wrynose subject-prefix to git-send-email suggestion
>   b4-config: add send-prefixes for wrynose
>
>  .b4-config                                    |   1 +
>  README.OE-Core.md                             |   2 +-
>  meta/classes-recipe/crosssdk.bbclass          |   3 +-
>  meta/classes-recipe/features_check.bbclass    |   2 +-
>  meta/classes-recipe/native.bbclass            |   3 +-
>  meta/classes-recipe/nativesdk.bbclass         |   3 +-
>  .../distro/include/default-distrovars.inc     |   8 +-
>  meta/lib/oe/utils.py                          |   9 +
>  .../0003-fix-march-issue-for-ppc64le.patch    |  45 +++
>  meta/recipes-bsp/efivar/efivar_39.bb          |   1 +
>  meta/recipes-connectivity/bluez5/bluez5.inc   |   1 +
>  ...use-after-free-caused-by-reentrant-c.patch |  59 ++++
>  .../busybox/busybox/CVE-2024-58251.patch      |  51 ++++
>  .../busybox/busybox/CVE-2026-29004-01.patch   |  42 +++
>  .../busybox/busybox/CVE-2026-29004-02.patch   |  47 +++
>  meta/recipes-core/busybox/busybox_1.37.0.bb   |   3 +
>  meta/recipes-core/glibc/glibc-version.inc     |   2 +-
>  meta/recipes-core/glibc/glibc_2.43.bb         |   4 +-
>  meta/recipes-devtools/pseudo/pseudo_git.bb    |   4 +-
>  ...01-Increase-chardet-upper-limit-to-8.patch |  25 ++
>  .../python/python3-requests_2.32.5.bb         |   1 +
>  meta/recipes-devtools/qemu/qemu.inc           |   1 +
>  ...tlb_to_section-for-different-Address.patch | 274 ++++++++++++++++++
>  ...3.0.bb =3D> python3-sbom-cve-check_1.3.1.bb} |   4 +-
>  ...check-update-cvelist-native_2026-05-07.bb} |   4 +-
>  ...ck-update-nvd-native_2026.05.07-000006.bb} |   4 +-
>  .../libarchive/libarchive_3.8.7.bb            |   1 +
>  .../shadow/files/disable_syslog.patch         |   3 +-
>  meta/recipes-extended/timezone/timezone.inc   |   6 +-
>  ....02.04.bb =3D> wireless-regdb_2026.03.18.bb} |   2 +-
>  .../libtiff/tiff/CVE-2026-4775.patch          |  55 ++++
>  meta/recipes-multimedia/libtiff/tiff_4.7.1.bb |   1 +
>  .../libsoup/libsoup/CVE-2026-2708.patch       | 218 ++++++++++++++
>  meta/recipes-support/libsoup/libsoup_3.6.6.bb |   2 +
>  .../libssh2/libssh2/CVE-2026-7598.patch       |  56 ++++
>  .../recipes-support/libssh2/libssh2_1.11.1.bb |   1 +
>  scripts/makefile-getvar                       |   4 +-
>  scripts/oe-pkgdata-util                       |  19 +-
>  38 files changed, 934 insertions(+), 37 deletions(-)
>  create mode 100644 meta/recipes-bsp/efivar/efivar/0003-fix-march-issue-f=
or-ppc64le.patch
>  create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-gatt-cli=
ent-Fix-use-after-free-caused-by-reentrant-c.patch
>  create mode 100644 meta/recipes-core/busybox/busybox/CVE-2024-58251.patc=
h
>  create mode 100644 meta/recipes-core/busybox/busybox/CVE-2026-29004-01.p=
atch
>  create mode 100644 meta/recipes-core/busybox/busybox/CVE-2026-29004-02.p=
atch
>  create mode 100644 meta/recipes-devtools/python/python3-requests/0001-In=
crease-chardet-upper-limit-to-8.patch
>  create mode 100644 meta/recipes-devtools/qemu/qemu/0001-accel-tcg-Fix-io=
tlb_to_section-for-different-Address.patch
>  rename meta/recipes-devtools/sbom-cve-check/{python3-sbom-cve-check_1.3.=
0.bb =3D> python3-sbom-cve-check_1.3.1.bb} (76%)
>  rename meta/recipes-devtools/sbom-cve-check/{sbom-cve-check-update-cveli=
st-native.bb =3D> sbom-cve-check-update-cvelist-native_2026-05-07.bb} (77%)
>  rename meta/recipes-devtools/sbom-cve-check/{sbom-cve-check-update-nvd-n=
ative.bb =3D> sbom-cve-check-update-nvd-native_2026.05.07-000006.bb} (79%)
>  rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2026.02.04.bb =
=3D> wireless-regdb_2026.03.18.bb} (94%)
>  create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2026-4775.pa=
tch
>  create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2026-2708.pa=
tch
>  create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-7598.pa=
tch


--=20
Yoann Congal
Smile ECS


