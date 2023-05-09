Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87EC7C7EE23
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 22:32:55 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.3049.1683671567327553636
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 May 2023 15:32:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=si+KMYnn;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-643aad3bc41so5385014b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 15:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1683671566; x=1686263566;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=JJRjBCo+rXvzaDGe3r2sksI4pKrocQ32oawwR9UU3SY=;
        b=si+KMYnnV0m+q6c/hD9IoHKX48yQyvqXwV4/6ELpGUO/XmL/FzrdFFE6GCftsfkwef
         QL4Leg2jcFX5DTYkrqEjGHCHQwL7qxm8Q8UrgnYavRisTye8fSCxa3Ry7viOocBOnhn6
         jmedzFk+LRMHdZLdUrS5jAv2WrXjXTqzPQzHV7JncWtwydueNtuS02SV9d4tUwnPdEsN
         rY6Q6Z3m7DiW+eFbMu3u2GqbLT+VtBU5tnCXFdfsDvmrO6+Q+Zzla7hWMej6uf19QXEw
         v7QiZNnpDTjwZLb2FAV02a5phhVTHSXyuTpWxmKPJ6Hrtk19axro1ZVFxmjAL+6KeJPx
         SkTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683671566; x=1686263566;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JJRjBCo+rXvzaDGe3r2sksI4pKrocQ32oawwR9UU3SY=;
        b=jIm7EnSzwyNzd4OpcT0yDrBYbninyC18CaowbV10/DTnXyathnrVZtlXE+qtvL6J7f
         4mTngerqQf/r1X4P1StA1I3LaxU/6M77GPQvvJAIGwnjfEoBHM7R8abuxAezL49oHOLc
         LuY2z34Tyu+GRZt9XVqtuAMleDA3KYRv4TewNiBZI6YXbih9yYdBQbn6915p988Uekfx
         YdXL9esqZ8y55IfDv6KzItiJq+sLKQyC11pZdW1nuSjlWZkzFOAh6jGGfGyKsAvrkLp4
         w6rrLG27t/05SjA1ylnR7cjNboaHdbla/TeL/qneWQ741OyX6rkdp2IO6JqVLfHEpNWz
         opNQ==
X-Gm-Message-State: AC+VfDwE6wmy2y5rNMq26BU++CuBHkOjmyhi80KQZ6aYpotBDXRoBEQj
	OzwZX3dm/WGL9Wq+IYuwB+b0v3EkrFtSeem1818=
X-Google-Smtp-Source: ACHHUZ6hZfxfeMPXKsTLhPHh6rGtyez6Zqzg510ZZgKZmakLQeWv8Ksc94n/gwuwipDrgsMPzmN0xA==
X-Received: by 2002:a05:6a00:2d9a:b0:641:d9b:a458 with SMTP id fb26-20020a056a002d9a00b006410d9ba458mr20913745pfb.18.1683671565995;
        Tue, 09 May 2023 15:32:45 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id u17-20020aa78491000000b0063d2dae6247sm2263125pfn.77.2023.05.09.15.32.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 15:32:45 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/15] Patch review
Date: Tue,  9 May 2023 12:32:26 -1000
Message-Id: <cover.1683671423.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 22:32:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181085

Please review this set of patches for kirkstone and have comments back by
end of day Thursday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5285

The following changes since commit 5fca673d8fe0ee97dc37ed2c9941696842cd667a:

  run-postinsts: Set dependency for ldconfig to avoid boot issues (2023-05-08 04:15:11 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Archana Polampalli (2):
  git: fix CVE-2023-29007
  git: fix CVE-2023-25652

Bruce Ashfield (1):
  kernel: improve initramfs bundle processing time

Dmitry Baryshkov (1):
  linux-firmware: upgrade 20230210 -> 20230404

Martin Jansa (1):
  populate_sdk_ext.bbclass: set METADATA_REVISION with an DISTRO
    override

Peter Bergin (1):
  update-alternatives.bbclass: fix old override syntax

Peter Marko (1):
  libxml2: patch CVE-2023-28484 and CVE-2023-29469

Piotr Łobacz (1):
  libarchive: Enable acls, xattr for native as well as target

Steve Sakoman (1):
  Revert "xserver-xorg: backport fix for CVE-2023-1393"

Thomas Roos (1):
  oeqa/utils/metadata.py: Fix running oe-selftest running with no distro
    set

Wang Mingyu (2):
  wpebackend-fdo: upgrade 1.14.0 -> 1.14.2
  xserver-xorg: upgrade 21.1.7 -> 21.1.8

Yoann Congal (1):
  linux-yocto: Exclude 121 CVEs already fixed upstream

Zhixiong Chi (1):
  libpam: Fix the xtests/tst-pam_motd[1|3] failures

bkylerussell@gmail.com (1):
  kernel-devsrc: depend on python3-core instead of python3

 meta/classes/kernel.bbclass                   |   2 +-
 meta/classes/populate_sdk_ext.bbclass         |   3 +-
 meta/classes/update-alternatives.bbclass      |   4 +-
 meta/lib/oeqa/utils/metadata.py               |   6 +-
 .../libxml/libxml2/CVE-2023-28484.patch       |  79 ++
 .../libxml/libxml2/CVE-2023-29469.patch       |  42 +
 meta/recipes-core/libxml/libxml2_2.9.14.bb    |   2 +
 .../git/git/CVE-2023-25652.patch              |  94 ++
 .../git/git/CVE-2023-29007.patch              | 162 ++++
 meta/recipes-devtools/git/git_2.35.7.bb       |   2 +
 .../libarchive/libarchive_3.6.2.bb            |   6 +-
 ...rely-on-all-filesystems-providing-a-.patch | 108 +++
 meta/recipes-extended/pam/libpam_1.5.2.bb     |   1 +
 ...posite-Fix-use-after-free-of-the-COW.patch |  46 -
 ...-xorg_21.1.7.bb => xserver-xorg_21.1.8.bb} |   5 +-
 ...20230210.bb => linux-firmware_20230404.bb} |   6 +-
 meta/recipes-kernel/linux/cve-exclusion.inc   | 875 ++++++++++++++++++
 meta/recipes-kernel/linux/kernel-devsrc.bb    |   2 +-
 meta/recipes-kernel/linux/linux-yocto.inc     |   3 +
 ...fdo_1.14.0.bb => wpebackend-fdo_1.14.2.bb} |   2 +-
 20 files changed, 1384 insertions(+), 66 deletions(-)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2023-28484.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2023-29469.patch
 create mode 100644 meta/recipes-devtools/git/git/CVE-2023-25652.patch
 create mode 100644 meta/recipes-devtools/git/git/CVE-2023-29007.patch
 create mode 100644 meta/recipes-extended/pam/libpam/0001-pam_motd-do-not-rely-on-all-filesystems-providing-a-.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-composite-Fix-use-after-free-of-the-COW.patch
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.7.bb => xserver-xorg_21.1.8.bb} (80%)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20230210.bb => linux-firmware_20230404.bb} (99%)
 create mode 100644 meta/recipes-kernel/linux/cve-exclusion.inc
 rename meta/recipes-sato/webkit/{wpebackend-fdo_1.14.0.bb => wpebackend-fdo_1.14.2.bb} (90%)

-- 
2.34.1


