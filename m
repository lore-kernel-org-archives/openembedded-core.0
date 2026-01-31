Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03DD8D79748
	for <webhook@archiver.kernel.org>; Sat, 31 Jan 2026 07:57:06 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5097.1769846216584991168
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jan 2026 23:56:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=k/HoCb38;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4806cc07ce7so27798735e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Jan 2026 23:56:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1769846215; x=1770451015; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=VpmTxxqgiNpML1LUbVONF5mZll5LuZ8itAHHMWAvhEc=;
        b=k/HoCb38c0J+Y7wf7ELCSicnsZRx14p04H7LWf51G49A/Nxr6Jzro19SDTzaXXwhAN
         cYMjppZX5vZ+snf3vhsdgem3Lfqvz6xftUCLhourQ22JZJPMFZr4+ly/sORZCLycCXfL
         GNwJ+63dpqQRGOA6pWBTYvmEAtvwMZhxzsYlw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769846215; x=1770451015;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VpmTxxqgiNpML1LUbVONF5mZll5LuZ8itAHHMWAvhEc=;
        b=ZVFHVOdkxud2mBDYajLxjrWuwnouh30ce6EqLchfPLZtyiQXfOjFSwRUun+bOMWiZ6
         8DtLgcXa3dn/KbyxhDbn2q8PEaHIxaMzMjq3FuHnaH9XrW8413SownSsJoL0qCNid29/
         6vnEQJaParSMm8ryd7a7+8Z9D+lBk78xHBMxS/nypmSOyMC6ZkP/R8cQahWN4eTXOE12
         uv2+9PKNBKaY7r/xKBXlsiZ/syUAZUGkyvUBAUhm3wh1bt3UEFavYym0V0Egr/UQWbAb
         cvk37QW7Dj3c3X/abX7g4Ja018+fdrlnzjOHgNi1WDwcdAcS2FKmwz3sSych/yoW1PZy
         ou/A==
X-Gm-Message-State: AOJu0YzZxWyJAVs/c9g+pQTKvJ4Ta/Sh2eZ3lX3cEPBTnTYUMmKVMzh1
	stIMntHyjyvzYQhkMppGUioSTYjygCaXxC7gy7VlCz59ec3rqOe8yJFfQNXuQEimCFmR0jLvzI5
	cpspkSBU=
X-Gm-Gg: AZuq6aJM9ItqeVR0YkT4RMekhuYNM6elR0aYJz9ZYJqGfQY9RK4XBe0vJhm/X/+FlNq
	eoSGSG85rzdqCepY9pl5fCapr0a6YRhds45xOcZX+/l26M5PoI2l6xorITlVhrqGZX7tj17OmDT
	GJhTwYAfhIH+mNz+801J5einDw1qDqwupRkcwDv/bu1WOKWbeVnEjRyE63sN9hxH+kQF7Y6vYp5
	3Avm0Cg1kypJJytW0eVIzB7kDnYl15FOcZmCDCYRJrKjDKOnbSRfWynaGzhCW4+SuQhRd35Pl2h
	FMuIgQk/MkqZRziQ0TAa6NEB2uneCjFQNMPJTcTO2gf3nd14ZzxM18k+/Heig/Y5D3bowcfjjGV
	trNPyPEsUiBdg+t51lTu04s/4WYSmAXYpitAh59iE5AtmINoXmT87ybMqdl0zGMa8oBlAX8NqB3
	AUHs8QXdFQJCtc5JMfAHButKttDwE5OoBGRU1kAN7fl6wHAA+ko/nFY+ZvSE/xE0wQbj26M9RmC
	fOZ8SFOHrgRgBmj
X-Received: by 2002:a05:600c:528f:b0:480:6fbc:695f with SMTP id 5b1f17b1804b1-482db49702dmr58568315e9.32.1769846214507;
        Fri, 30 Jan 2026 23:56:54 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00fa8b238ae1dd6dd8.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:fa8b:238a:e1dd:6dd8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806ce564f9sm258621475e9.14.2026.01.30.23.56.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 23:56:54 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 00/22] Patch review
Date: Sat, 31 Jan 2026 08:56:11 +0100
Message-ID: <cover.1769845858.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 31 Jan 2026 07:57:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230205

Please review this set of changes for whinlatter and have comments back by
end of day Tuesday, February 3.

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/3151

The following changes since commit fa31089d48cac2aa11279e932a77f4dbdc02c02d:

  libarchive: upgrade 3.8.4 -> 3.8.5 (2026-01-26 08:44:38 +0000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/whinlatter-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/whinlatter-nut

Hemanth Kumar M D (1):
  binutils: Upgrade to 2.45.1 release

Hugo SIMELIERE (1):
  libtasn1: Fix CVE-2025-13151

Jiaying Song (1):
  grub: fix CVE-2025-54770 CVE-2025-61661 CVE-2025-61662 CVE-2025-61663
    CVE-2025-61664

João Marcos Costa (1):
  mesa: fix build error with llvmpipe gallium driver

Ken Kurematsu (1):
  libtheora: set CVE_PRODUCT

Khai Dang (1):
  docbook-xml-dtd4: fix the fetching failure

Mark Hatle (1):
  dpkg: Fix ADMINDIR

Mathieu Dubois-Briand (2):
  oeqa/gitarchive: Fix git push URL parameter
  oeqa/gitarchive: Push tag before copying log files

Peter Marko (11):
  go: upgrade 1.25.5 -> 1.25.6
  zlib: ignore CVE-2026-22184
  python3-urllib3: patch CVE-2026-21441
  glibc: stable 2.42 branch updates
  expat: patch CVE-2026-24515
  dropbear: patch CVE-2025-14282
  libpng: upgrade 1.6.53 -> 1.6.54
  glib-2.0: patch CVE-2026-0988
  libxml2: patch CVE-2026-0989
  libxml2: patch CVE-2026-0990
  openssl: upgrade 3.5.4 -> 3.5.5

Richard Purdie (2):
  scripts/oe-git-archive: Ensure new push parameter is specified
  pseudo: Update to 1.9.3 release

 meta/lib/oe/package_manager/deb/__init__.py   |    4 +
 .../oeqa/selftest/cases/gitarchivetests.py    |    4 +-
 meta/lib/oeqa/utils/gitarchive.py             |    8 +-
 .../grub/files/CVE-2025-54770.patch           |   41 +
 .../grub/files/CVE-2025-61661.patch           |   40 +
 .../grub/files/CVE-2025-61662.patch           |   72 +
 .../grub/files/CVE-2025-61663_61664.patch     |   64 +
 meta/recipes-bsp/grub/grub2.inc               |    4 +
 ...ke-history-reporting-when-test-fails.patch |   23 +-
 .../0001-extend-check_cwm-test-timeout.patch  |    2 +-
 .../{openssl_3.5.4.bb => openssl_3.5.5.bb}    |    2 +-
 .../dropbear/dropbear/CVE-2025-14282-01.patch |  280 +++
 .../dropbear/dropbear/CVE-2025-14282-02.patch |   97 +
 .../dropbear/dropbear/CVE-2025-14282-03.patch |  282 +++
 .../dropbear/dropbear/CVE-2025-14282-04.patch |   72 +
 .../dropbear/dropbear/CVE-2025-14282-05.patch |   46 +
 .../recipes-core/dropbear/dropbear_2025.88.bb |    5 +
 .../expat/expat/CVE-2026-24515-01.patch       |   43 +
 .../expat/expat/CVE-2026-24515-02.patch       |  117 ++
 meta/recipes-core/expat/expat_2.7.3.bb        |    2 +
 .../glib-2.0/files/CVE-2026-0988.patch        |   58 +
 meta/recipes-core/glib-2.0/glib.inc           |    1 +
 meta/recipes-core/glibc/glibc-version.inc     |    2 +-
 meta/recipes-core/glibc/glibc_2.42.bb         |    2 +-
 .../libxml/libxml2/CVE-2026-0989.patch        |  309 +++
 .../libxml/libxml2/CVE-2026-0990.patch        |   76 +
 meta/recipes-core/libxml/libxml2_2.14.6.bb    |    2 +
 meta/recipes-core/zlib/zlib_1.3.1.bb          |    2 +
 .../binutils/binutils-2.45.inc                |    6 +-
 ...-system-directories-when-cross-linki.patch |   38 +-
 .../binutils/0008-Use-libtool-2.4.patch       | 1827 ++++++++---------
 .../docbook-xml/docbook-xml-dtd4_4.5.bb       |   10 +-
 ...-dirs.c-set_rootfs-was-not-checking-.patch |   46 +
 meta/recipes-devtools/dpkg/dpkg_1.22.21.bb    |    1 +
 .../go/{go-1.25.5.inc => go-1.25.6.inc}       |    2 +-
 ...e_1.25.5.bb => go-binary-native_1.25.6.bb} |    6 +-
 ..._1.25.5.bb => go-cross-canadian_1.25.6.bb} |    0
 ...{go-cross_1.25.5.bb => go-cross_1.25.6.bb} |    0
 ...osssdk_1.25.5.bb => go-crosssdk_1.25.6.bb} |    0
 ...runtime_1.25.5.bb => go-runtime_1.25.6.bb} |    0
 ...ent-based-hash-generation-less-pedan.patch |    8 +-
 ...ng-cgo-on-386-call-C-sigaction-funct.patch |    4 +-
 ...d-go-make-GOROOT-precious-by-default.patch |    2 +-
 .../go/{go_1.25.5.bb => go_1.25.6.bb}         |    0
 meta/recipes-devtools/pseudo/pseudo_git.bb    |    4 +-
 .../python3-urllib3/CVE-2026-21441.patch      |  111 +
 .../python/python3-urllib3_2.5.0.bb           |    1 +
 .../files/0001-gallivm-support-LLVM-21.patch  |   56 +
 meta/recipes-graphics/mesa/mesa.inc           |    1 +
 .../{libpng_1.6.53.bb => libpng_1.6.54.bb}    |    4 +-
 .../libtheora/libtheora_1.2.0.bb              |    2 +
 .../gnutls/libtasn1/CVE-2025-13151.patch      |   30 +
 .../recipes-support/gnutls/libtasn1_4.20.0.bb |    1 +
 scripts/lib/resulttool/store.py               |    9 +-
 scripts/oe-git-archive                        |    2 +-
 55 files changed, 2752 insertions(+), 1079 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-54770.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-61661.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-61662.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-61663_61664.patch
 rename meta/recipes-connectivity/openssl/{openssl_3.5.4.bb => openssl_3.5.5.bb} (99%)
 create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2025-14282-01.patch
 create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2025-14282-02.patch
 create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2025-14282-03.patch
 create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2025-14282-04.patch
 create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2025-14282-05.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-24515-01.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-24515-02.patch
 create mode 100644 meta/recipes-core/glib-2.0/files/CVE-2026-0988.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-0989.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-0990.patch
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/0001-lib-dpkg-options-dirs.c-set_rootfs-was-not-checking-.patch
 rename meta/recipes-devtools/go/{go-1.25.5.inc => go-1.25.6.inc} (91%)
 rename meta/recipes-devtools/go/{go-binary-native_1.25.5.bb => go-binary-native_1.25.6.bb} (79%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.25.5.bb => go-cross-canadian_1.25.6.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.25.5.bb => go-cross_1.25.6.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.25.5.bb => go-crosssdk_1.25.6.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.25.5.bb => go-runtime_1.25.6.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.25.5.bb => go_1.25.6.bb} (100%)
 create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2026-21441.patch
 create mode 100644 meta/recipes-graphics/mesa/files/0001-gallivm-support-LLVM-21.patch
 rename meta/recipes-multimedia/libpng/{libpng_1.6.53.bb => libpng_1.6.54.bb} (94%)
 create mode 100644 meta/recipes-support/gnutls/libtasn1/CVE-2025-13151.patch


