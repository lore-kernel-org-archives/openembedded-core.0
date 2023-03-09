Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A79EC64EC4
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 22:58:15 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.5715.1678402691370325069
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Mar 2023 14:58:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=5CYHhGJX;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id y2so3561531pjg.3
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 14:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678402690;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ntA92lO3JMOoX6rWc8+Qw+poZ59Os4wlcDhnyYl588U=;
        b=5CYHhGJXKG7elvv3yJP3EtODucNFkoOf2ClKOWKl8rLjf5epC9Jr98is/Z1cdQTyQF
         vgLcN3HHPcWuoTjbrPXknYXAcEOhN+Tq+FTGkAw+lKpu17byG/gMBLpdD24BbP9Bmdgf
         iuWo1x1slCkCOwNb8j2qvi/vjHrjD6JSPIWbbaM9viIh6t0jg8fX8Reyy7ELVjPvmsNg
         J22T+kSh6jMXGskLLhJkSLchWNi5kBm41vhvlhOiChX8mRiM48tAIh1dVnw+vgjGUCDC
         TgWKS+m/d8TO4C32iAXW2cJCBIGQfWTwb6YjS3oApMkOvkIeMgl+M7TlT/ipZ4Ca4a/+
         FSCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678402690;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ntA92lO3JMOoX6rWc8+Qw+poZ59Os4wlcDhnyYl588U=;
        b=etNd02M9NzxmlAeU294GovLKqUIHMZkVvjszTe8Mu2OMmPwn5LaEx8UVvGH1Em+ZrF
         LPB/tbPmNrQ0wWFoKbRkooxwadKsikog0CIj3kYSJz0pxKGfujxdw5pgzNzINx5Atj4s
         4a3OEjcT/gyWuCqnHeXUii5H2sRt7KlOhnUBxH4qSKFCgcbFvxJox+2HfOMBk1lgn+tp
         3RQGj32l63VbK9MpB+etq6hrN5Sa1t9BI1H+wV+ORjW7M/p+hwxe+Ccl0DrCdhKyKOhA
         0S5HgRTWgBoB1gnW5/RwZSwpoYwlSERRVZKgLNf5+mK6KwIpEJw/jWCivXz8advM9aIi
         Ar6A==
X-Gm-Message-State: AO0yUKVtdmslDgzZEQuJu5mY4ovRDSZfvDjTkfnVaiXCnBpiWHRs6SJQ
	BD1E+ltu0SGLNawoD8n2CyB06ZN9DLLF6XDXV0c=
X-Google-Smtp-Source: AK7set8VVqFTLsoPTnCaUFyTSCgQXMnoJNWtjiR4DERN4JXUl3YXCQJXEaSkRoJAqucylfOSZl6nyA==
X-Received: by 2002:a05:6a20:144d:b0:cd:c79:50e8 with SMTP id a13-20020a056a20144d00b000cd0c7950e8mr30940694pzi.62.1678402689955;
        Thu, 09 Mar 2023 14:58:09 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id j9-20020aa79289000000b0058db8f8bce8sm89717pfa.166.2023.03.09.14.58.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 14:58:09 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 00/27] Patch review
Date: Thu,  9 Mar 2023 12:57:35 -1000
Message-Id: <cover.1678401759.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 22:58:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178273

Please review this set of patches for langdale and have comments back by
end of day Monday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5023

The following changes since commit b995ea45773211bd7bdd60eabcc9bbffda6beb5c:

  build-appliance-image: Update to langdale head revision (2023-03-06 15:17:13 +0000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/langdale-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/langdale-nut

Alexander Kanavin (1):
  devtool: ignore patch-fuzz errors when extracting source

Bhabu Bindu (1):
  qemu: Fix CVE-2022-4144

Bruce Ashfield (3):
  linux-yocto/5.15: update to v5.15.94
  linux-yocto/5.15: update to v5.15.96
  linux-yocto-rt/5.15: update to -rt59

Carlos Alberto Lopez Perez (1):
  mesa-demos: packageconfig weston should have a dependency on
    wayland-protocols

Chee Yang Lee (1):
  tiff: fix multiple CVEs

Dmitry Baryshkov (1):
  ffmpeg: fix build failure when vulkan is enabled

Geoffrey GIRY (1):
  cve-extra-exclusions: ignore inapplicable linux-yocto CVEs

Hitendra Prajapati (1):
  libxml2: Fix CVE-2022-40303 && CVE-2022-40304

Khem Raj (2):
  libcomps: Fix callback function prototype for PyCOMPS_hash
  rpm: Fix hdr_hash function prototype

Ming Liu (1):
  linux: inherit pkgconfig in kernel.bbclass

Pavel Zhukov (1):
  u-boot: Map arm64 into map for u-boot dts installation

Peter Marko (1):
  systemd: add group sgx to udev package

Richard Purdie (3):
  binutils: Fix nativesdk ld.so search
  oeqa/selftest/prservice: Improve debug output for failure
  staging: Separate out different multiconfig manifests

Ross Burton (2):
  shadow: ignore CVE-2016-15024
  vim: add missing pkgconfig inherit

Siddharth Doshi (1):
  epiphany: Security fix for CVE-2023-26081

Tom Hochstein (2):
  meson: Fix wrapper handling of implicit setup command
  oeqa/sdk: Improve Meson test

Wang Mingyu (4):
  iso-codes: upgrade 4.12.0 -> 4.13.0
  libmicrohttpd: upgrade 0.9.75 -> 0.9.76
  lua: Fix install conflict when enable multilib.
  vala: Fix install conflict when enable multilib.

 meta-selftest/files/static-group              |   1 +
 meta/classes-global/staging.bbclass           |   3 +
 meta/classes-recipe/kernel.bbclass            |   2 +-
 .../distro/include/cve-extra-exclusions.inc   | 296 +++++++++
 meta/lib/oeqa/sdk/cases/buildepoxy.py         |   2 +-
 meta/lib/oeqa/selftest/cases/prservice.py     |   2 +-
 meta/recipes-bsp/u-boot/u-boot.inc            |   4 +-
 .../libxml/libxml2/CVE-2022-40303.patch       | 624 ++++++++++++++++++
 .../libxml/libxml2/CVE-2022-40304.patch       | 106 +++
 meta/recipes-core/libxml/libxml2_2.9.14.bb    |   2 +
 meta/recipes-core/systemd/systemd_251.8.bb    |   2 +-
 ...dk-Search-for-alternative-ld.so.conf.patch |   2 +-
 ...hash_t-instead-of-long-in-PyCOMPS_ha.patch |  66 ++
 .../libcomps/libcomps_0.1.19.bb               |   1 +
 meta/recipes-devtools/lua/lua_5.4.4.bb        |   3 +
 .../meson/meson/meson-wrapper                 |  17 +-
 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 .../qemu/qemu/CVE-2022-4144.patch             |  99 +++
 ...y_hash_t-instead-of-long-in-hdr_hash.patch |  35 +
 meta/recipes-devtools/rpm/rpm_4.18.0.bb       |   1 +
 meta/recipes-devtools/vala/vala.inc           |   5 +-
 meta/recipes-extended/shadow/shadow_4.12.3.bb |   3 +
 meta/recipes-gnome/epiphany/epiphany_42.4.bb  |   1 +
 .../epiphany/files/CVE-2023-26081.patch       |  90 +++
 .../recipes-graphics/mesa/mesa-demos_8.5.0.bb |   2 +-
 meta/recipes-kernel/linux/linux-yocto-dev.bb  |   2 -
 .../linux/linux-yocto-rt_5.15.bb              |   6 +-
 .../linux/linux-yocto-tiny_5.15.bb            |   6 +-
 meta/recipes-kernel/linux/linux-yocto.inc     |   1 -
 meta/recipes-kernel/linux/linux-yocto_5.15.bb |  26 +-
 .../ffmpeg/ffmpeg/ffmpeg-fix-vulkan.patch     |  34 +
 .../recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb |   1 +
 .../libtiff/files/CVE-2022-48281.patch        |  26 +
 .../CVE-2023-0800_0801_0802_0803_0804.patch   | 128 ++++
 meta/recipes-multimedia/libtiff/tiff_4.4.0.bb |   2 +
 ...so-codes_4.12.0.bb => iso-codes_4.13.0.bb} |   2 +-
 ...ttpd_0.9.75.bb => libmicrohttpd_0.9.76.bb} |   2 +-
 meta/recipes-support/vim/vim.inc              |   2 +-
 scripts/lib/devtool/standard.py               |   1 +
 39 files changed, 1566 insertions(+), 43 deletions(-)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2022-40303.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2022-40304.patch
 create mode 100644 meta/recipes-devtools/libcomps/libcomps/0001-libcomps-Use-Py_hash_t-instead-of-long-in-PyCOMPS_ha.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2022-4144.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0001-python-Use-Py_hash_t-instead-of-long-in-hdr_hash.patch
 create mode 100644 meta/recipes-gnome/epiphany/files/CVE-2023-26081.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/ffmpeg-fix-vulkan.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2022-48281.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2023-0800_0801_0802_0803_0804.patch
 rename meta/recipes-support/iso-codes/{iso-codes_4.12.0.bb => iso-codes_4.13.0.bb} (94%)
 rename meta/recipes-support/libmicrohttpd/{libmicrohttpd_0.9.75.bb => libmicrohttpd_0.9.76.bb} (90%)

-- 
2.34.1


