Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01574EB64DA
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 14:13:07 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.17352.1687961581456612679
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jun 2023 07:13:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Fg1F9cNP;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1b7f223994fso35331015ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 07:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687961580; x=1690553580;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ezH5oA+kP953jtlm2uz/zBj1PyRk6pWUfM5U8O/GXXU=;
        b=Fg1F9cNPUT9py59VzWJM1vlrbhUD2ENsV2E/sCy4Cid43r0Ze8d+bS49iJARQ4iKJt
         MtwGMiAU5m1afr0+9W0rdBAeAKWePJNezZSyO3gIA9FsF/mhcWc11o3U89ZWPTmPzVeS
         yOnWnfW+komi+uQykgEpX7jq9La2HnlUvz5THVDZWHeyY3iMDaek0JD8Vx6v/EosCvAm
         n4IlALQ+nWj5bYRUP+FR0DQgntuDbZ9aNJ8iwBRwNrdD/IFpoZj7ltUR6L24RP8MF6Vw
         sylqYqBc+47YRLdYwye+/vVER1mSQcw3ADqNe3d1B8Y2KbobRUVEQv455+lrCS7J2PlQ
         6ITQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687961580; x=1690553580;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ezH5oA+kP953jtlm2uz/zBj1PyRk6pWUfM5U8O/GXXU=;
        b=gqKJdS61Fjtk9dh6HrZFN9Y4i2C0qBWXrzuv4IVKdOoaSTKGdI3iUFlYysP8PQcSLz
         BJTArU5Ppu61ahn6Mx9Q2AyGqohzd12FeW1fcmYw7GrbUYMdAGQizjm0Al/dlBgI6mxR
         6YPA/qoO2yn4stNJf+8eA5Bh0TKBIpcDGxl/HW4kceyS5yBf25/ncqQ/q50V5iEYt1St
         U8PjVWnu7Q5T43ncCl2yydGXc0eflnNYI4ercQNS72lWGl9jW6uR+RP8yxuKNNe4HMx7
         0TGxOjB13wk649tKMqezbWwMYFeSxsBuc/IgI1bmO2npiF0J5yeXHijSitO99EOmk7XI
         jRCQ==
X-Gm-Message-State: AC+VfDw6ImKf9sTZmihjT8iuWPLfmX1hLq5xMsIrJCNaE4rDHz/wxDgW
	6i+MiTSQc3TW5oBZ9R1Un1mrEJWf1V1V5j1wpoYcJQ==
X-Google-Smtp-Source: ACHHUZ7K/nV6wFYWgAFly3cO+Cda02nYNQp4l4JvQ9y9TFjzzZScuxErYeSWe3p+F4FUwK6ahp1ONQ==
X-Received: by 2002:a17:902:da81:b0:1b7:fae4:9867 with SMTP id j1-20020a170902da8100b001b7fae49867mr13032414plx.10.1687961580316;
        Wed, 28 Jun 2023 07:13:00 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id b19-20020a170902d89300b001b3ce619e2esm7792092plz.179.2023.06.28.07.12.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 07:12:59 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/29] Patch review
Date: Wed, 28 Jun 2023 04:12:25 -1000
Message-Id: <cover.1687961326.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 14:13:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183555

Please review this set of changes for kirkstone and have comments back by
end of day Friday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5530

The following changes since commit 7949e786cf8e50f716ff1f1c4797136637205e0c:

  build-appliance-image: Update to kirkstone head revision (2023-06-23 04:17:20 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Alexander Kanavin (5):
  maintaines.inc: unassign Richard Weinberger from erofs-utils entry
  maintainers.inc: unassign Andreas Müller from itstool entry
  maintainers.inc: unassign Pascal Bach from cmake entry
  maintainers.inc: correct unassigned entries
  maintainers.inc: correct Carlos Rafael Giani's email address

Archana Polampalli (3):
  go: fix CVE-2023-29404
  go: fix CVE-2023-29405
  go: fix CVE-2023-29402

Bruce Ashfield (5):
  linux-yocto/5.10: update to v5.10.182
  linux-yocto/5.10: update to v5.10.183
  linux-yocto/5.10: update to v5.10.184
  linux-yocto/5.10: update to v5.10.185
  linux-yocto/5.10: cfg: fix DECNET configuration warning

Frieder Schrempf (1):
  psmisc: Set ALTERNATIVE for pstree to resolve conflict with busybox

Hitendra Prajapati (1):
  libcap: CVE-2023-2602 Memory Leak on pthread_create() Error

Kai Kang (1):
  pm-utils: fix multilib conflictions

Marc Ferland (1):
  connman: fix warning by specifying runstatedir at configure time

Martin Jansa (2):
  minicom: remove unused patch files
  kmod: remove unused ptest.patch

Richard Purdie (2):
  selftest/license: Exclude from world
  layer.conf: Add missing dependency exclusion

Ross Burton (1):
  ninja: ignore CVE-2021-4336, wrong ninja

Sakib Sajal (1):
  blktrace: ask for python3 specifically

Wang Mingyu (5):
  babeltrace2: upgrade 2.0.4 -> 2.0.5
  fribidi: upgrade 1.0.12 -> 1.0.13
  libxpm: upgrade 3.5.15 -> 3.5.16
  xdpyinfo: upgrade 1.3.3 -> 1.3.4
  mobile-broadband-provider-info: upgrade 20221107 -> 20230416

Xiangyu Chen (1):
  dbus: upgrade 1.14.6 -> 1.14.8

 .../license/incompatible-license-alias.bb     |   2 +
 .../license/incompatible-license.bb           |   2 +
 .../license/incompatible-licenses.bb          |   2 +
 .../license/incompatible-nonspdx-license.bb   |   2 +
 meta/conf/distro/include/maintainers.inc      |  18 +-
 meta/conf/layer.conf                          |   1 +
 meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb   |   5 +-
 meta/recipes-connectivity/connman/connman.inc |   1 +
 .../mobile-broadband-provider-info_git.bb     |   4 +-
 .../dbus/{dbus_1.14.6.bb => dbus_1.14.8.bb}   |   2 +-
 meta/recipes-devtools/go/go-1.17.13.inc       |   3 +
 .../go/go-1.19/CVE-2023-29402.patch           | 194 ++++++++++++++++++
 .../go/go-1.19/CVE-2023-29404.patch           |  78 +++++++
 .../go/go-1.19/CVE-2023-29405.patch           | 109 ++++++++++
 meta/recipes-devtools/ninja/ninja_1.10.2.bb   |   3 +
 ...erfluous-global-variable-definitions.patch |  35 ----
 ...erfluous-global-variable-definitions.patch |  37 ----
 ...erfluous-global-variable-definitions.patch |  42 ----
 meta/recipes-extended/psmisc/psmisc.inc       |   2 +
 .../{xdpyinfo_1.3.3.bb => xdpyinfo_1.3.4.bb}  |   2 +-
 .../{libxpm_3.5.15.bb => libxpm_3.5.16.bb}    |   3 +-
 ...plot.py-Ask-for-python3-specifically.patch |  35 ++++
 meta/recipes-kernel/blktrace/blktrace_git.bb  |   4 +-
 meta/recipes-kernel/kmod/kmod/ptest.patch     |  25 ---
 .../linux/linux-yocto-rt_5.10.bb              |   6 +-
 .../linux/linux-yocto-tiny_5.10.bb            |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb |  24 +--
 ...eltrace2_2.0.4.bb => babeltrace2_2.0.5.bb} |   2 +-
 .../{fribidi_1.0.12.bb => fribidi_1.0.13.bb}  |   2 +-
 .../libcap/files/CVE-2023-2602.patch          |  45 ++++
 meta/recipes-support/libcap/libcap_2.66.bb    |   1 +
 31 files changed, 522 insertions(+), 177 deletions(-)
 rename meta/recipes-core/dbus/{dbus_1.14.6.bb => dbus_1.14.8.bb} (98%)
 create mode 100644 meta/recipes-devtools/go/go-1.19/CVE-2023-29402.patch
 create mode 100644 meta/recipes-devtools/go/go-1.19/CVE-2023-29404.patch
 create mode 100644 meta/recipes-devtools/go/go-1.19/CVE-2023-29405.patch
 delete mode 100644 meta/recipes-extended/minicom/minicom/0001-Drop-superfluous-global-variable-definitions.patch
 delete mode 100644 meta/recipes-extended/minicom/minicom/0002-Drop-superfluous-global-variable-definitions.patch
 delete mode 100644 meta/recipes-extended/minicom/minicom/0003-Drop-superfluous-global-variable-definitions.patch
 rename meta/recipes-graphics/xorg-app/{xdpyinfo_1.3.3.bb => xdpyinfo_1.3.4.bb} (88%)
 rename meta/recipes-graphics/xorg-lib/{libxpm_3.5.15.bb => libxpm_3.5.16.bb} (83%)
 create mode 100644 meta/recipes-kernel/blktrace/blktrace/0001-bno_plot.py-btt_plot.py-Ask-for-python3-specifically.patch
 delete mode 100644 meta/recipes-kernel/kmod/kmod/ptest.patch
 rename meta/recipes-kernel/lttng/{babeltrace2_2.0.4.bb => babeltrace2_2.0.5.bb} (98%)
 rename meta/recipes-support/fribidi/{fribidi_1.0.12.bb => fribidi_1.0.13.bb} (90%)
 create mode 100644 meta/recipes-support/libcap/files/CVE-2023-2602.patch

-- 
2.34.1


