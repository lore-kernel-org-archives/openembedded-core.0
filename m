Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AC76C74A5B
	for <webhook@archiver.kernel.org>; Thu, 16 Mar 2023 21:45:34 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web10.5140.1679003129632650619
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Mar 2023 14:45:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=2kKYXwlb;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id x37so1802672pga.1
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 14:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679003129;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=X2ZlgGCRHtWhu7M+e/cQqlBeZPoqAPbxZvrqOpEW5AM=;
        b=2kKYXwlbl6FVFkLE8809Sq3cyb1eLDdDC4soLJsqWTsFO6ruQxJYborjgthxgQXr3j
         mkI06Vt+edzyxl6gUxlgPZmXXsuGcTDGKubnkfaF6Wst2K0Lu2GIeAWBjdFSHnbzhOk0
         FeTal91P644smsry4Ew+DrkIqI17b7iBH9BYv9De78woytVkSiUb7BannIlyxJXdo4pS
         dN+8wDYPR83qKORTGwRm4dS8C9CDRe5t1UTpAdQosgQc5E6Jigho0z8RZsoYtvP6KP/9
         bdWVJB1U194uO22mqXSnF+yrRMPG3yLFCspzTbM4l6nviGGW8igI6Mp/qWD/81qjl7sl
         kzkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679003129;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X2ZlgGCRHtWhu7M+e/cQqlBeZPoqAPbxZvrqOpEW5AM=;
        b=SyULrm7trgQRB9vY2MvmPGK6Wsu4LydLx7eTVNy6/oH7712R5JfjyVQCIRNfwiYzrU
         wpK/6ktUDza0bjbn6arUI3RCg+z0LqqoBxMMqEWa2YzPTWtKNbwqbpTadO9IJgUd0mKw
         WLhe7hLTfqKkwtahURal6CHnZ+gcOMeh45f4fY5FXWqKEL7xzSyjzOMkP+s+YEavL4fr
         D2jDjJ3M+LJRw0orTXiLXiGEyzknyVPApRea6R4ud+Bhj9UnB7C2x8uvTaoKvugLF1iA
         QIFt8PPeRG8jYvi/GM4jNmIbvEkzRu1/hP0Y88KgwXW3RoIFFdRwu5SOADYNN0wMifxs
         X11A==
X-Gm-Message-State: AO0yUKW5XwG3eJIBjtYI8ZVu3/ocMB2TqGvgxBFyEUzgPIkWwHvFgQuL
	ycdW6plgZLyjimoMuCam0B2fOVpAJh2OlmpqSWc=
X-Google-Smtp-Source: AK7set9nA2HJ10HcqY/ennqo1UMRNcJcOLa63YYRaxVegJM8reMhrcjNzOcZdAwsArHP48HcM3s4UA==
X-Received: by 2002:a62:7b4b:0:b0:625:c048:2f81 with SMTP id w72-20020a627b4b000000b00625c0482f81mr4180174pfc.32.1679003128339;
        Thu, 16 Mar 2023 14:45:28 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id bn10-20020a056a00324a00b005a84ef49c63sm137746pfb.214.2023.03.16.14.45.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 14:45:27 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 00/23] Patch review
Date: Thu, 16 Mar 2023 11:44:57 -1000
Message-Id: <cover.1679003014.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 21:45:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178711

Please review this set of patches for langdale and have comments back by
end of day Monday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5058

The following changes since commit 21e8a662e6232e7fdd642b1d86d4f8f980be1a09:

  vala: Fix install conflict when enable multilib. (2023-03-10 05:54:34 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/langdale-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/langdale-nut

Alexander Kanavin (4):
  sudo: update 1.9.12p2 -> 1.9.13p2
  libdnf: update 0.69.0 -> 0.70.0
  pango: upgrade 1.50.12 -> 1.50.13
  apt: re-enable version check

Kenfe-Mickael Laventure (3):
  buildtools-tarball: Handle spaces within user $PATH
  toolchain-scripts: Handle spaces within user $PATH
  populate_sdk_ext: Handle spaces within user $PATH

Michael Halstead (1):
  selftest/runtime_test/virgl: Disable for all Rocky Linux

Richard Purdie (5):
  staging: Separate out different multiconfig manifests
  staging/multilib: Fix manifest corruption
  glibc: Add missing binutils dependency
  selftest/recipetool: Stop test corrupting tinfoil class
  base-files: Drop localhost.localdomain from hosts file

Ross Burton (3):
  vim: upgrade to 9.0.1403
  vim: set modified-by to the recipe MAINTAINER
  meson: remove obsolete RPATH stripping patch

Siddharth (1):
  harfbuzz: Security fix for CVE-2023-25193

Trevor Woerner (3):
  cups: use BUILDROOT instead of DESTDIR
  cups: check PACKAGECONFIG for pam feature
  cups: add/fix web interface packaging

Wang Mingyu (1):
  dhcpcd: Fix install conflict when enable multilib.

Xiangyu Chen (1):
  sudo: update 1.9.13p2 -> 1.9.13p3

Zoltan Boszormenyi (1):
  piglit: Fix build time dependency

 meta/classes-global/staging.bbclass           |   4 +
 meta/classes-recipe/populate_sdk_ext.bbclass  |   2 +-
 meta/classes-recipe/toolchain-scripts.bbclass |   2 +-
 meta/classes/multilib.bbclass                 |   1 +
 meta/lib/oeqa/selftest/cases/recipetool.py    |   5 +-
 meta/lib/oeqa/selftest/cases/runtime_test.py  |   3 +-
 .../dhcpcd/dhcpcd_9.4.1.bb                    |   1 +
 ...-conflict-error-when-enable-multilib.patch |  46 +++++
 meta/recipes-core/base-files/base-files/hosts |   2 +-
 meta/recipes-core/glibc/glibc.inc             |   4 +-
 meta/recipes-core/meta/buildtools-tarball.bb  |   2 +-
 meta/recipes-devtools/apt/apt_2.4.5.bb        |   2 -
 ...xt.cpp-do-not-try-to-access-BDB-data.patch |  37 ----
 .../{libdnf_0.69.0.bb => libdnf_0.70.0.bb}    |   3 +-
 .../meson/meson/disable-rpath-handling.patch  |  37 ----
 meta/recipes-devtools/meson/meson_0.63.3.bb   |   1 -
 meta/recipes-extended/cups/cups.inc           |  16 +-
 ...o.conf.in-fix-conflict-with-multilib.patch |  21 +-
 meta/recipes-extended/sudo/sudo.inc           |   2 +-
 .../{sudo_1.9.12p2.bb => sudo_1.9.13p3.bb}    |   2 +-
 .../harfbuzz/CVE-2023-25193-pre1.patch        | 135 ++++++++++++
 .../harfbuzz/harfbuzz/CVE-2023-25193.patch    | 192 ++++++++++++++++++
 .../harfbuzz/harfbuzz_5.1.0.bb                |   2 +
 .../{pango_1.50.12.bb => pango_1.50.13.bb}    |   2 +-
 meta/recipes-graphics/piglit/piglit_git.bb    |   2 +-
 meta/recipes-support/vim/vim.inc              |   8 +-
 26 files changed, 421 insertions(+), 113 deletions(-)
 create mode 100644 meta/recipes-connectivity/dhcpcd/files/0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch
 delete mode 100644 meta/recipes-devtools/libdnf/libdnf/0001-libdnf-dnf-context.cpp-do-not-try-to-access-BDB-data.patch
 rename meta/recipes-devtools/libdnf/{libdnf_0.69.0.bb => libdnf_0.70.0.bb} (93%)
 delete mode 100644 meta/recipes-devtools/meson/meson/disable-rpath-handling.patch
 rename meta/recipes-extended/sudo/{sudo_1.9.12p2.bb => sudo_1.9.13p3.bb} (96%)
 create mode 100644 meta/recipes-graphics/harfbuzz/harfbuzz/CVE-2023-25193-pre1.patch
 create mode 100644 meta/recipes-graphics/harfbuzz/harfbuzz/CVE-2023-25193.patch
 rename meta/recipes-graphics/pango/{pango_1.50.12.bb => pango_1.50.13.bb} (94%)

-- 
2.34.1


