Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73CFFC001DF
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 15:51:39 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.58022.1697817094291688391
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Oct 2023 08:51:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=orZDCLuW;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6bb4abb8100so890322b3a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 08:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697817093; x=1698421893; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=7rJ26nE0gM5X+5OmlweTQIhO9YbIrC2A0W4IyjYJUvc=;
        b=orZDCLuWuTqwOJQaSbRUjp3SMOrf5lLXi7tF0iic6iq03sgW15K8srmErm/5zpLGX1
         iYvsr1zWpW5GkLshtwiOdo3QAl3C5MbbmHpBByGDCeV/k/EsJlBAqn0eNCrDmv6q6/rk
         ND+KPcjdiuKwN3QM8xF2/lOsc5ssKrSrDnpQJbcps9Hqb2UAk/kIIajwo5/D+HFsiDQi
         PgP0LcxicMyBNq8bqZwVlldQurRHHK4henml6ozuVbIfVahj5jxzcUtmepOXIsYPmpSI
         Eh6ADx/EXk5XutDF+ghm5oEeH4kPsX9oMKPanVcqsSmNjj8Tilo4fE9jAeHJqi5MWq87
         hRZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697817093; x=1698421893;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7rJ26nE0gM5X+5OmlweTQIhO9YbIrC2A0W4IyjYJUvc=;
        b=HKQ7HYqFqzl/DRG/7l59ldNJjfdzo4Sd9oTWuAUPhn2xP52v4WxFRgfm925GvznlLs
         yb3+uh89rq+SKRRXC3xYN2q1WUkKBGwgZqhkGORFeZpVfHOjUNKCAL7iYvH9eemWOzGI
         +07xgkQZLbm218nnPtK68taZT2HkBQv65AUlbwKMtNVGNvUD4WCGiuZXztUfKxxW/csb
         9C5qfLK3n1QcBvZN8Z02KQkys1A7J7DlG6p3poU6vgKF15SMlnoJKTTCl1g34irWYCy/
         XetqIKzggeRT0jXUMCvSfsNjQegnzF7T4bFqI/z8aYQ+u23L1XSpA6Yu2rSCU6zPkPxU
         TZ0g==
X-Gm-Message-State: AOJu0YzcGtu5QK4lnqv+L4WOVWXLEQkWfT4fiFZSTKttWo3aBs+3NQL2
	BzFejcXsQPFfgWtjXGuFak3U13dG3p3iHD7WYhY=
X-Google-Smtp-Source: AGHT+IFT0FW/AxPT8X7QV6zOWzfW79LZeMWZauxsIT9dA8YKMLRUoLdogH45bdKMhu4hkUaxJwA1zw==
X-Received: by 2002:a05:6a20:da8e:b0:153:78c1:c40f with SMTP id iy14-20020a056a20da8e00b0015378c1c40fmr2978929pzb.15.1697817092598;
        Fri, 20 Oct 2023 08:51:32 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id q12-20020a170902dacc00b001c71ec1866fsm1679244plx.258.2023.10.20.08.51.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 08:51:32 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 00/24] Patch review
Date: Fri, 20 Oct 2023 05:51:02 -1000
Message-Id: <cover.1697816789.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 15:51:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189545

Please review this set of changes for mickledore and have comments back by
end of day Tuesday, October 24

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6075

with the exception of the meta-arm test which fails due to the linux-yocto 6.1
version bumps in this series. A patch to meta-arm is pending the merge of these
version bumps.

The following changes since commit 266944eb216912b7b2a935360aa51cd79847a071:

  gdb: fix RDEPENDS for PACKAGECONFIG[tui] (2023-10-12 16:23:08 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/mickledore-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/mickledore-nut

Antoine Lubineau (1):
  cve-check: add CVSS vector string to CVE database and reports

Bruce Ashfield (4):
  linux-yocto/6.1: update to v6.1.55
  linux-yocto/6.1: update to v6.1.56
  linux-yocto/6.1: tiny: fix arm 32 boot
  linux-yocto/6.1: update to v6.1.57

Daniel Semkowicz (1):
  wic: bootimg-partition: Fix file name in debug message

Jan Garcia (1):
  insane.bbclass: Count raw bytes in shebang-size

Lee Chee Yang (3):
  cups: fix CVE-2023-4504
  qemu: ignore RHEL specific CVE-2023-2680
  python3-urllib3: 1.26.15 -> 1.26.17

Martijn de Gouw (1):
  busybox: Set PATH in syslog initscript

Martin Jansa (1):
  fontcache.bbclass: avoid native recipes depending on target fontconfig

Michael Opdenacker (2):
  shadow: fix patch Upstream-Status
  libevent: fix patch Upstream-Status

Peter Kjellerstedt (1):
  packages.bbclass: Correct the check for conflicts with renamed
    packages

Quentin Schulz (1):
  uboot-extlinux-config.bbclass: fix missed override syntax migration

Richard Purdie (3):
  oeqa/selftest: Fix broken symlink removal handling
  oeqa/utils/gitarchive: Handle broken commit counts in results repo
  oeqa/concurrencytest: Remove invalid buffering option

Ross Burton (2):
  libx11: upgrade to 1.8.7
  libxpm: upgrade to 3.5.17

Sean Nyekjaer (1):
  dmidecode: fixup for CVE-2023-30630

Siddharth Doshi (1):
  vim: Upgrade 9.0.2009 -> 9.0.2048

Steve Sakoman (1):
  cve-exclusion_6.1.inc: update for 6.1.57

 meta/classes-global/insane.bbclass            |   3 +-
 meta/classes-global/package.bbclass           |   8 +-
 meta/classes-recipe/fontcache.bbclass         |   1 +
 .../uboot-extlinux-config.bbclass             |   2 +-
 meta/classes/cve-check.bbclass                |   5 +-
 meta/lib/oeqa/core/utils/concurrencytest.py   |   4 +-
 meta/lib/oeqa/selftest/context.py             |   2 +-
 meta/lib/oeqa/utils/gitarchive.py             |  10 +-
 meta/recipes-core/busybox/files/syslog        |   2 +
 .../meta/cve-update-nvd2-native.bb            |  11 +-
 .../dmidecode/CVE-2023-30630_1a.patch         | 236 ++++++++++++++++++
 .../dmidecode/CVE-2023-30630_1b.patch         | 197 +++++++++++++++
 .../dmidecode/CVE-2023-30630_2.patch          |   8 +-
 .../dmidecode/CVE-2023-30630_3.patch          |  55 ++--
 .../dmidecode/CVE-2023-30630_4.patch          | 143 +++++------
 .../dmidecode/dmidecode_3.4.bb                |   3 +-
 ..._1.26.15.bb => python3-urllib3_1.26.17.bb} |   2 +-
 meta/recipes-devtools/qemu/qemu.inc           |   4 +
 meta/recipes-extended/cups/cups.inc           |   1 +
 .../cups/cups/CVE-2023-4504.patch             |  42 ++++
 .../0001-Fix-can-not-print-full-login.patch   |   2 +-
 .../{libx11_1.8.6.bb => libx11_1.8.7.bb}      |   2 +-
 .../{libxpm_3.5.16.bb => libxpm_3.5.17.bb}    |   2 +-
 .../linux/cve-exclusion_6.1.inc               |  13 +-
 .../linux/linux-yocto-rt_6.1.bb               |   6 +-
 .../linux/linux-yocto-tiny_6.1.bb             |   6 +-
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  |  28 +--
 ...ts-are-marked-failed-only-when-all-a.patch |   2 +-
 meta/recipes-support/vim/vim.inc              |   4 +-
 .../wic/plugins/source/bootimg-partition.py   |   2 +-
 30 files changed, 654 insertions(+), 152 deletions(-)
 create mode 100644 meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_1a.patch
 create mode 100644 meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_1b.patch
 rename meta/recipes-devtools/python/{python3-urllib3_1.26.15.bb => python3-urllib3_1.26.17.bb} (86%)
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2023-4504.patch
 rename meta/recipes-graphics/xorg-lib/{libx11_1.8.6.bb => libx11_1.8.7.bb} (92%)
 rename meta/recipes-graphics/xorg-lib/{libxpm_3.5.16.bb => libxpm_3.5.17.bb} (88%)

-- 
2.34.1


