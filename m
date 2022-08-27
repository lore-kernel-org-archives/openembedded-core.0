Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47932ECAAD1
	for <webhook@archiver.kernel.org>; Sat, 27 Aug 2022 18:26:04 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web08.51889.1661624763306282220
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 11:26:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=xmSsSbGu;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id x26so4533071pfo.8
        for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 11:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc;
        bh=zMHC3Onky43ab6qpdB8TZU8V0D4+LJxCVWrm37PyZsQ=;
        b=xmSsSbGuAbQe8xJaqWWAy4GKYawV7rIeY7cQIcS7PCNzrVwlGHbfMek+uxn4eF12+r
         dVDyTsTicP4zQ4oOLRDHilPaJrN86O/Wg8r/HOY78K5hOA1eC6iTNK52PqevS2olR3BY
         6aOoDIJHHTX3DyWA7TDFUTBJhp1vsmHjJFHZqXF451lm+MvR2BWjAvB8E4YbVTvm9brY
         9un0Y3KfKVCJYa2dDYZz8drGa9Ajy8UVZHXz5cLJJOqsKVPb8qCLTS1riogbObzA1V32
         JBLb/g2AMby21MeHVTzXmoSPIG3xzp2DyPclFyaYvkJvegaLeWf5SWpROHqN7JOYPg3e
         vqeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc;
        bh=zMHC3Onky43ab6qpdB8TZU8V0D4+LJxCVWrm37PyZsQ=;
        b=dStxfy8+sxlXE/Om6qlvRw/VPWCCDQyYh2+5gyc/al3y/cl1d3DDgCQ5xDps5CfuBt
         v8LtAkU/qlpmzZv1CWXNopnvFrvoORhiopm/t8czFWJm4WM5p31KKi+E3oBB9ivdJfqS
         JtuHYw1zWCbWKWHlB0BqOYF2Jqf6RLAtgWseL2i4nNV8QZnSs96RheNBmsUq86LMVfoR
         Z8SmCSCKVzF4ASxsn2eghVkThwnhTZRH3SY5gpMwotDlmyA5EeAiCsXxQmM2pFY2X8Pd
         tRHhm9xIDvXsIjNOblToPV5vF/7YpyLDFHPuVjvUUCAmyNMTIVNdGr8Mo6dA1C5CiLmw
         fZdw==
X-Gm-Message-State: ACgBeo1GQqpc/qkZuIiWQRkbJG7EiV85v5fLkFdBUXq8F3semJyeT01/
	nUqS5WfFkA5Wr205ZHquHh8Q5OWFBuNE8mxR
X-Google-Smtp-Source: 
 AA6agR611CQOu+XsAytKn0cc0Z0PGJJ/8ZF4NYNnqUu/GFR8nmrFe/IXEbyStf2Z62NlKCD1KQI+NA==
X-Received: by 2002:a05:6a02:207:b0:41c:9e7d:775e with SMTP id
 bh7-20020a056a02020700b0041c9e7d775emr7753611pgb.227.1661624761935;
        Sat, 27 Aug 2022 11:26:01 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 r21-20020a170902ea5500b001708c4ebbaesm3864716plg.309.2022.08.27.11.26.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Aug 2022 11:26:01 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/24] Patch review
Date: Sat, 27 Aug 2022 08:25:24 -1000
Message-Id: <cover.1661624569.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Aug 2022 18:26:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169941

Please review this set of patches for kirkstone and have comments back by
end of day Tuesday.

Pass a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/4141

The following changes since commit 7709a8c1c1b2dcf05678f1a2a1fd579a95e492f2:

  packagegroup-self-hosted: update for strace (2022-08-23 04:23:01 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Alexander Kanavin (10):
  tzdata: upgrade 2022a -> 2022b
  xz: update 5.2.5 -> 5.2.6
  gdk-pixbuf: upgrade 2.42.6 -> 2.42.8
  gdk-pixbuf: update 2.42.8 -> 2.42.9
  epiphany: upgrade 42.3 -> 42.4
  glib-networking: upgrade 2.72.1 -> 2.72.2
  libjpeg-turbo: upgrade 2.1.3 -> 2.1.4
  libwebp: upgrade 1.2.3 -> 1.2.4
  wireless-regdb: upgrade 2022.06.06 -> 2022.08.12
  wpebackend-fdo: upgrade 1.12.0 -> 1.12.1

Awais Belal (1):
  kernel-fitimage.bbclass: only package unique DTBs

Bertrand Marquis (1):
  sysvinit-inittab/start_getty: Fix respawn too fast

Hitendra Prajapati (1):
  Revert "gdk-pixbuf: CVE-2021-46829 a heap-based buffer overflow"

Jon Mason (1):
  oeqa/parselogs: add qemuarmv5 arm-charlcd masking

Pavel Zhukov (1):
  package_rpm: Do not replace square brackets in %files

Richard Purdie (1):
  vim: Upgrade 9.0.0115 -> 9.0.0242

Ross Burton (7):
  oeqa/qemurunner: add run_serial() comment
  oeqa/selftest: rename git.py to intercept.py
  oeqa/gotoolchain: put writable files in the Go module cache
  oeqa/gotoolchain: set CGO_ENABLED=1
  wic: add target tools to PATH when executing native commands
  wic/bootimg-efi: use cross objcopy when building unified kernel image
  wic: depend on cross-binutils

Shubham Kulkarni (1):
  sanity: add a comment to ensure CONNECTIVITY_CHECK_URIS is correct

 meta/classes/image_types_wic.bbclass          |  2 +
 meta/classes/kernel-fitimage.bbclass          |  8 ++
 meta/classes/package_rpm.bbclass              |  6 --
 meta/classes/sanity.bbclass                   |  1 +
 meta/lib/oeqa/runtime/cases/parselogs.py      |  1 +
 meta/lib/oeqa/selftest/cases/gotoolchain.py   |  8 +-
 .../selftest/cases/{git.py => intercept.py}   |  0
 .../oeqa/selftest/cases/oelib/buildhistory.py |  6 +-
 meta/lib/oeqa/utils/qemurunner.py             |  2 +
 ...ng_2.72.1.bb => glib-networking_2.72.2.bb} |  2 +-
 meta/recipes-core/meta/wic-tools.bb           |  3 +-
 .../sysvinit/sysvinit-inittab/start_getty     |  3 +
 meta/recipes-extended/timezone/timezone.inc   |  6 +-
 .../xz/xz/CVE-2022-1271.patch                 | 96 -------------------
 .../xz/{xz_5.2.5.bb => xz_5.2.6.bb}           |  7 +-
 .../{epiphany_42.3.bb => epiphany_42.4.bb}    |  2 +-
 .../0001-Add-use_prebuilt_tools-option.patch  | 18 ++--
 .../gdk-pixbuf/CVE-2021-46829.patch           | 61 ------------
 .../gdk-pixbuf/gdk-pixbuf/fatal-loader.patch  | 20 ++--
 ...-pixbuf_2.42.6.bb => gdk-pixbuf_2.42.9.bb} | 19 ++--
 ...-turbo_2.1.3.bb => libjpeg-turbo_2.1.4.bb} |  2 +-
 ....06.06.bb => wireless-regdb_2022.08.12.bb} |  2 +-
 .../{libwebp_1.2.3.bb => libwebp_1.2.4.bb}    |  2 +-
 ...fdo_1.12.0.bb => wpebackend-fdo_1.12.1.bb} |  2 +-
 meta/recipes-support/vim/vim.inc              |  4 +-
 scripts/lib/wic/misc.py                       |  7 +-
 scripts/lib/wic/plugins/source/bootimg-efi.py | 25 +++--
 27 files changed, 84 insertions(+), 231 deletions(-)
 rename meta/lib/oeqa/selftest/cases/{git.py => intercept.py} (100%)
 rename meta/recipes-core/glib-networking/{glib-networking_2.72.1.bb => glib-networking_2.72.2.bb} (93%)
 delete mode 100644 meta/recipes-extended/xz/xz/CVE-2022-1271.patch
 rename meta/recipes-extended/xz/{xz_5.2.5.bb => xz_5.2.6.bb} (88%)
 rename meta/recipes-gnome/epiphany/{epiphany_42.3.bb => epiphany_42.4.bb} (94%)
 delete mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2021-46829.patch
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.42.6.bb => gdk-pixbuf_2.42.9.bb} (87%)
 rename meta/recipes-graphics/jpeg/{libjpeg-turbo_2.1.3.bb => libjpeg-turbo_2.1.4.bb} (97%)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2022.06.06.bb => wireless-regdb_2022.08.12.bb} (94%)
 rename meta/recipes-multimedia/webp/{libwebp_1.2.3.bb => libwebp_1.2.4.bb} (95%)
 rename meta/recipes-sato/webkit/{wpebackend-fdo_1.12.0.bb => wpebackend-fdo_1.12.1.bb} (90%)

-- 
2.25.1


