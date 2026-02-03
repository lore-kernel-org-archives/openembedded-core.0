Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CA9FD172B9
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 10:19:34 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13481.1770113964196319139
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Feb 2026 02:19:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Jhz2rxCD;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42fb6ce71c7so4495569f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 02:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770113962; x=1770718762; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=AREkxs3TeTsBWPOzOlw8wYFsS4MkJQ+HwecCv0lz5Bc=;
        b=Jhz2rxCDnqCEYcIArMQ88beDVlVH9qhONgoUBMqphnfBvT29IpdQovEiK1oMZAv9UW
         YIcLQKlAFgebSNL8ex+pRL9MYAb+0jJIh61KB6laSM3i93ZyDugrLoI0BSknnbrycsKD
         xCDHiZGitfnAK8dfEn4QcvmrD2+eVGEl0kzvg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770113962; x=1770718762;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AREkxs3TeTsBWPOzOlw8wYFsS4MkJQ+HwecCv0lz5Bc=;
        b=paAMiJSID3tuVkvnu0q+YsjFrNuvuYzRSYmvEGlLAJIOcQcePIKzBUq2oaZJX4dsNt
         ryb7iCMt6hztz7dZw5H2gYnhp0IANndgfTXlHlVGA9JtNglffyE6KJiHOurIziJm+x1Z
         /zLOoh1t6C68Obeh5qK4dAxsfiK1MGc5LvYR6Eampg7emJXOj+EJpXzaxaro4EPF/byL
         G+eZoYZQTBGQ7xGOeTTAp/oEHkEEncL3PoiOwyWh71++Zl76FZ7caugg0u7xkvLopaJ9
         uexTcDjv7+xddk4RuWOBc6JJhH0NS9tFYI/Mc9rvkZ3/yts0nu5wMjLpAh8yJu1P9v5b
         KBYQ==
X-Gm-Message-State: AOJu0YzqlpEp81LS+ICk/XzJ2/Ine/bjnhq7XL4ZfUqelU+he9ChklvW
	3jGz9bca+XjS27kHN3uANVySwCChtxazVtHqowCgN7zg+JcUWJEHMpbjmvLANO3UaLLzGb1+fjB
	uwDSOvZs=
X-Gm-Gg: AZuq6aLxZjpoV1LKkitCfHeUfrU7B5VdgCtg5WDXUG3RM0mcnLft010dv+SnvD5fYMy
	yEdL2i3xlEUjyWIt65x12fF+k5HJs+IoCBKd+/8kNKSt3h3iqvBMbwnGLz12MgIQ0Yn9l2ej6EC
	967UcSLrfCcosjJUXshc9JDdPrd3tzvzMagN2P8KbhSZegZDj2Atkd9++/vP/v8j34dXSpgLY0/
	HROT03rDdSernQSVXexMHUPq54PCqrFoUNQmg3VCdDa2GSZRs6cry0oalgKCgjzA0theM7/qOkO
	D0Pcu3C4vvH6ExwzY0eNCvonhfBHUDtZRddiEMbKQmC++ZfK6t58Q34b0aluGs4JVBQ3x1xBr87
	/YWMEwFqRiG+7qAOp5qnVc4vMeBYY4l0QJKy9damC4q4up9UgSTEaVbPTB935SxeZSBexO8jWMF
	5/cJ1NbO+vuaxldH5Evmk4ffK2WUjTbtgwrZhe/H1TKn4DG1VTMHGe+5pHWKt3yPd15mA/+GwWY
	SYq2kBXP3LY+FU=
X-Received: by 2002:a05:6000:2586:b0:435:8aa0:a30c with SMTP id ffacd0b85a97d-435f3aaf87amr20404716f8f.48.1770113961886;
        Tue, 03 Feb 2026 02:19:21 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131ce70sm52293041f8f.27.2026.02.03.02.19.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 02:19:21 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter v2 00/22] Patch review
Date: Tue,  3 Feb 2026 11:16:29 +0100
Message-ID: <cover.1770109549.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 10:19:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230428

Hello,

Since I made some mistakes with the previous patch review request and I
got some reviews and new patches. I send this one updated:
v1->v2:
* Dropped "mesa: fix build error with llvmpipe gallium driver"
* Replaced "expat: patch CVE-2026-24515" by 
  "expat: upgrade 2.7.3 -> 2.7.4"
* Added:
  * libxml2: patch CVE-2026-0992
  * libxml2: add follow-up patch for CVE-2026-0992
  * inetutils: patch CVE-2026-24061

Note that "inetutils: patch CVE-2026-24061" and "libxml2: add follow-up
patch for CVE-2026-0992" have yet to merge on master but I expect that
to happen soon (If that does not, I will exclude those from the merge)

Please review this set of changes for whinlatter and have comments back by
end of day Wednesday, February 4 (shorted than usual but the series has
not changed that much)

Passed a-full on autobuilder with some failures:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3160
* https://autobuilder.yoctoproject.org/valkyrie/?#/builders/8/builds/3155 (qemuarm64-armhost)
  was automatically and successfully retried as
  https://autobuilder.yoctoproject.org/valkyrie/?#/builders/8/builds/3157
* https://autobuilder.yoctoproject.org/valkyrie/#/builders/41/builds/2964 (meta-intel)
  This failure also happens on master, I've pinged the maintainer:
  https://lists.yoctoproject.org/g/yocto/message/66209

The following changes since commit fa31089d48cac2aa11279e932a77f4dbdc02c02d:

  libarchive: upgrade 3.8.4 -> 3.8.5 (2026-01-26 08:44:38 +0000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/whinlatter-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/whinlatter-nut

for you to fetch changes up to fa3bb54d2423728b6421367c1218003a0765dd22:

  inetutils: patch CVE-2026-24061 (2026-02-03 00:09:50 +0100)

Hugo SIMELIERE (1):
  libtasn1: Fix CVE-2025-13151

Jiaying Song (1):
  grub: fix CVE-2025-54770 CVE-2025-61661 CVE-2025-61662 CVE-2025-61663
    CVE-2025-61664

Ken Kurematsu (1):
  libtheora: set CVE_PRODUCT

Khai Dang (1):
  docbook-xml-dtd4: fix the fetching failure

Mark Hatle (1):
  dpkg: Fix ADMINDIR

Mathieu Dubois-Briand (2):
  oeqa/gitarchive: Fix git push URL parameter
  oeqa/gitarchive: Push tag before copying log files

Peter Marko (13):
  go: upgrade 1.25.5 -> 1.25.6
  zlib: ignore CVE-2026-22184
  python3-urllib3: patch CVE-2026-21441
  glibc: stable 2.42 branch updates
  dropbear: patch CVE-2025-14282
  libpng: upgrade 1.6.53 -> 1.6.54
  glib-2.0: patch CVE-2026-0988
  libxml2: patch CVE-2026-0989
  libxml2: patch CVE-2026-0990
  libxml2: patch CVE-2026-0992
  libxml2: add follow-up patch for CVE-2026-0992
  expat: upgrade 2.7.3 -> 2.7.4
  inetutils: patch CVE-2026-24061

Richard Purdie (2):
  scripts/oe-git-archive: Ensure new push parameter is specified
  pseudo: Update to 1.9.3 release

 meta/lib/oe/package_manager/deb/__init__.py   |   4 +
 .../oeqa/selftest/cases/gitarchivetests.py    |   4 +-
 meta/lib/oeqa/utils/gitarchive.py             |   8 +-
 .../grub/files/CVE-2025-54770.patch           |  41 +++
 .../grub/files/CVE-2025-61661.patch           |  40 +++
 .../grub/files/CVE-2025-61662.patch           |  72 ++++
 .../grub/files/CVE-2025-61663_61664.patch     |  64 ++++
 meta/recipes-bsp/grub/grub2.inc               |   4 +
 .../inetutils/CVE-2026-24061-01.patch         |  38 ++
 .../inetutils/CVE-2026-24061-02.patch         |  82 +++++
 .../inetutils/inetutils_2.6.bb                |   2 +
 .../dropbear/dropbear/CVE-2025-14282-01.patch | 280 +++++++++++++++
 .../dropbear/dropbear/CVE-2025-14282-02.patch |  97 +++++
 .../dropbear/dropbear/CVE-2025-14282-03.patch | 282 +++++++++++++++
 .../dropbear/dropbear/CVE-2025-14282-04.patch |  72 ++++
 .../dropbear/dropbear/CVE-2025-14282-05.patch |  46 +++
 .../recipes-core/dropbear/dropbear_2025.88.bb |   5 +
 .../expat/{expat_2.7.3.bb => expat_2.7.4.bb}  |   2 +-
 .../glib-2.0/files/CVE-2026-0988.patch        |  58 +++
 meta/recipes-core/glib-2.0/glib.inc           |   1 +
 meta/recipes-core/glibc/glibc-version.inc     |   2 +-
 meta/recipes-core/glibc/glibc_2.42.bb         |   2 +-
 .../libxml/libxml2/CVE-2026-0989.patch        | 309 ++++++++++++++++
 .../libxml/libxml2/CVE-2026-0990.patch        |  76 ++++
 .../libxml/libxml2/CVE-2026-0992-01.patch     |  49 +++
 .../libxml/libxml2/CVE-2026-0992-02.patch     | 336 ++++++++++++++++++
 .../libxml/libxml2/CVE-2026-0992-03.patch     |  33 ++
 meta/recipes-core/libxml/libxml2_2.14.6.bb    |   5 +
 meta/recipes-core/zlib/zlib_1.3.1.bb          |   2 +
 .../docbook-xml/docbook-xml-dtd4_4.5.bb       |  10 +-
 ...-dirs.c-set_rootfs-was-not-checking-.patch |  46 +++
 meta/recipes-devtools/dpkg/dpkg_1.22.21.bb    |   1 +
 .../go/{go-1.25.5.inc => go-1.25.6.inc}       |   2 +-
 ...e_1.25.5.bb => go-binary-native_1.25.6.bb} |   6 +-
 ..._1.25.5.bb => go-cross-canadian_1.25.6.bb} |   0
 ...{go-cross_1.25.5.bb => go-cross_1.25.6.bb} |   0
 ...osssdk_1.25.5.bb => go-crosssdk_1.25.6.bb} |   0
 ...runtime_1.25.5.bb => go-runtime_1.25.6.bb} |   0
 ...ent-based-hash-generation-less-pedan.patch |   8 +-
 ...ng-cgo-on-386-call-C-sigaction-funct.patch |   4 +-
 ...d-go-make-GOROOT-precious-by-default.patch |   2 +-
 .../go/{go_1.25.5.bb => go_1.25.6.bb}         |   0
 meta/recipes-devtools/pseudo/pseudo_git.bb    |   4 +-
 .../python3-urllib3/CVE-2026-21441.patch      | 111 ++++++
 .../python/python3-urllib3_2.5.0.bb           |   1 +
 .../{libpng_1.6.53.bb => libpng_1.6.54.bb}    |   4 +-
 .../libtheora/libtheora_1.2.0.bb              |   2 +
 .../gnutls/libtasn1/CVE-2025-13151.patch      |  30 ++
 .../recipes-support/gnutls/libtasn1_4.20.0.bb |   1 +
 scripts/lib/resulttool/store.py               |   9 +-
 scripts/oe-git-archive                        |   2 +-
 51 files changed, 2228 insertions(+), 31 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-54770.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-61661.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-61662.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-61663_61664.patch
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/CVE-2026-24061-01.patch
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/CVE-2026-24061-02.patch
 create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2025-14282-01.patch
 create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2025-14282-02.patch
 create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2025-14282-03.patch
 create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2025-14282-04.patch
 create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2025-14282-05.patch
 rename meta/recipes-core/expat/{expat_2.7.3.bb => expat_2.7.4.bb} (92%)
 create mode 100644 meta/recipes-core/glib-2.0/files/CVE-2026-0988.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-0989.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-0990.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-0992-01.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-0992-02.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-0992-03.patch
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/0001-lib-dpkg-options-dirs.c-set_rootfs-was-not-checking-.patch
 rename meta/recipes-devtools/go/{go-1.25.5.inc => go-1.25.6.inc} (91%)
 rename meta/recipes-devtools/go/{go-binary-native_1.25.5.bb => go-binary-native_1.25.6.bb} (79%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.25.5.bb => go-cross-canadian_1.25.6.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.25.5.bb => go-cross_1.25.6.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.25.5.bb => go-crosssdk_1.25.6.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.25.5.bb => go-runtime_1.25.6.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.25.5.bb => go_1.25.6.bb} (100%)
 create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2026-21441.patch
 rename meta/recipes-multimedia/libpng/{libpng_1.6.53.bb => libpng_1.6.54.bb} (94%)
 create mode 100644 meta/recipes-support/gnutls/libtasn1/CVE-2025-13151.patch


