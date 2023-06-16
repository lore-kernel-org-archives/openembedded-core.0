Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23BA1EB64DA
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 14:37:29 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.244.1686926243289351247
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jun 2023 07:37:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=rMP04XPC;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1b53910241eso2503435ad.2
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 07:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686926242; x=1689518242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Jr0ed7Dh7V9yQ9LxCCFvRMzSkEHkqgbc2I2sHGbIcRQ=;
        b=rMP04XPCHhZ3UfF+zwb8WFUmS6D6BaF/Zm3c3RHeTrxQPDjd9R6rCLK7o8+aGDrxCk
         bX9XMgNvyowyUz28NJlt8+6w4qjYx/g2dCerWe3ecy3GtO/fGR4nVmvAD1b/Cy2BtVJE
         qWMJDa5q0lL+60F9Dh3bXHHBWfu+N5Z/b9zIfU5lLkYLYMNiUz3iyOZV19TSPmjtxrvi
         bV8OxH6IwppF5+Yd98qaxeNdajHLJQqyMZFKkN7VAf3nXV2hC7gMsv3yFStKOriMuTB5
         PlPrIaQgrcOoi7okPnZY2qAI0idQ+D/oBol+vjzT6vnIYZ2FaNIgnPhaS4fEwzKHVa5K
         1Xgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686926242; x=1689518242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jr0ed7Dh7V9yQ9LxCCFvRMzSkEHkqgbc2I2sHGbIcRQ=;
        b=CiOM933M1DudYtwXpcu3BkO1PJY4JjDn1YvtZJ7PWuZ+G9vKWJlqe49iekL11aa+fB
         RFIgOr9HagkYwaFp92LhoTtJlJd7i6TDP2RHCBnmGaZsiBXpJkDqkCEI6r0JSKbQHm2x
         2On40L+1NZvMvyKIz+0G7TiiekmGR5vjweO2H8QEijps1zCorudWFuhWELp82MPPKAIB
         XP4JSanEa3BK43vvNal7iNwhXj5BY9QoeOymcNDSLcDgIIWcXkiAN0/2hPHdvCOTTnvD
         0ACtRuslVlwckn5O2SoNQeyQ8qCvPVhfrSaoNWsoSf3BgK6Vk7Q5TyukpS8jx6px1AZ7
         ZBGw==
X-Gm-Message-State: AC+VfDyd+EJsVAzl6ghvSog8zAHaYY9awC1wGs/Eth3lM2BRn0qsfNwz
	UMJRGB0SpDBQqB5BnguodpxzkrSjBG7MUxU3tyo=
X-Google-Smtp-Source: ACHHUZ4rEjrer+vN4gpraYgkUlyKcq+HSRVng0HqgcZ/A9roGnxb/nTkpBXtA3g5nbqNWhelqyloHg==
X-Received: by 2002:a17:902:e847:b0:1af:a2a4:837f with SMTP id t7-20020a170902e84700b001afa2a4837fmr2183857plg.26.1686926241723;
        Fri, 16 Jun 2023 07:37:21 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id k21-20020a170902761500b001b03f208323sm15865547pll.64.2023.06.16.07.37.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jun 2023 07:37:21 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 00/24] Patch review
Date: Fri, 16 Jun 2023 04:36:51 -1000
Message-Id: <cover.1686925952.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 14:37:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183021

Please review this set of changes for mickledore and have comments back by
end of day Tuesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5474

except for the meta-virtualization test, which failed due to the busybox
bug fix version update in this patch series.  A version update to a bbappend
recipe will be required and the maintainer has been notified.

The following changes since commit a24b257189e83ce4cd073acb3e31591d31dfa5b1:

  uninative: Upgrade to 4.0 to include latest gcc 13.1.1 (2023-06-08 16:22:12 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/mickledore-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/mickledore-nut

Alexander Kanavin (4):
  maintaines.inc: unassign Richard Weinberger from erofs-utils entry
  maintainers.inc: unassign Andreas Müller from itstool entry
  maintainers.inc: unassign Pascal Bach from cmake entry
  maintainers.inc: correct unassigned entries

Andrej Valek (1):
  busybox: 1.36.0 -> 1.36.1

Chen Qi (1):
  cmake.bbclass: do not search host paths for find_program()

Frieder Schrempf (1):
  psmisc: Set ALTERNATIVE for pstree to resolve conflict with busybox

Ian Ray (1):
  systemd-systemctl: support instance expansion in WantedBy

Kai Kang (1):
  pm-utils: fix multilib conflictions

Khem Raj (2):
  systemd: Drop a backport
  perf: Make built-in libtraceevent plugins cohabit with external
    libtraceevent

Marc Ferland (1):
  connman: fix warning by specifying runstatedir at configure time

Markus Volk (1):
  ell: upgrade 0.56 -> 0.57

Martin Jansa (6):
  libx11: remove unused patch and FILESEXTRAPATHS
  qemu: remove unused qemu-7.0.0-glibc-2.36.patch
  minicom: remove unused patch files
  inetutils: remove unused patch files
  libgloss: remove unused patch file
  kmod: remove unused ptest.patch

Mingli Yu (1):
  curl: fix CVE-2023-28319 through CVE-2023-28322

Natasha Bailey (1):
  tiff: backport a fix for CVE-2023-2731

Richard Purdie (1):
  selftest/license: Exclude from world

Tim Orling (1):
  openssl: upgrade 3.1.0 -> 3.1.1

Trevor Gamblin (1):
  bind: upgrade 9.18.13 -> 9.18.14

 .../license/incompatible-license-alias.bb     |   2 +
 .../license/incompatible-license.bb           |   2 +
 .../license/incompatible-licenses.bb          |   2 +
 .../license/incompatible-nonspdx-license.bb   |   2 +
 meta/classes-recipe/cmake.bbclass             |   1 -
 meta/conf/distro/include/maintainers.inc      |  16 +-
 meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb   |   5 +-
 ...1-avoid-start-failure-with-bind-user.patch |   0
 ...d-V-and-start-log-hide-build-options.patch |   0
 ...ching-for-json-headers-searches-sysr.patch |   0
 .../bind/{bind-9.18.13 => bind-9.18.14}/bind9 |   0
 .../{bind-9.18.13 => bind-9.18.14}/conf.patch |   0
 .../generate-rndc-key.sh                      |   0
 ...t.d-add-support-for-read-only-rootfs.patch |   0
 .../make-etc-initd-bind-stop-work.patch       |   0
 .../named.service                             |   0
 .../bind/{bind_9.18.13.bb => bind_9.18.14.bb} |   2 +-
 meta/recipes-connectivity/connman/connman.inc |   1 +
 ...-multiple-definitions-of-errcatch-an.patch |  58 ---
 .../inetutils/fix-buffer-fortify-tfpt.patch   |  25 -
 ...1-Configure-do-not-tweak-mips-cflags.patch |  19 +-
 .../openssl/openssl/CVE-2023-0464.patch       | 226 ---------
 .../{openssl_3.1.0.bb => openssl_3.1.1.bb}    |   3 +-
 ...ab_1.36.0.bb => busybox-inittab_1.36.1.bb} |   0
 .../{busybox_1.36.0.bb => busybox_1.36.1.bb}  |   2 +-
 .../ell/{ell_0.56.bb => ell_0.57.bb}          |   2 +-
 .../libgloss/fix_makefile_include_arm_h.patch |  30 --
 .../systemd/systemd-systemctl/systemctl       |   9 +-
 .../0007-Add-sys-stat.h-for-S_IFDIR.patch     |  29 --
 meta/recipes-core/systemd/systemd_253.1.bb    |   1 -
 .../qemu/qemu/qemu-7.0.0-glibc-2.36.patch     |  46 --
 ...erfluous-global-variable-definitions.patch |  35 --
 ...erfluous-global-variable-definitions.patch |  37 --
 ...erfluous-global-variable-definitions.patch |  42 --
 meta/recipes-extended/psmisc/psmisc.inc       |   2 +
 ...ak-in-XRegisterIMInstantiateCallback.patch |  57 ---
 .../recipes-graphics/xorg-lib/libx11_1.8.4.bb |   6 +-
 meta/recipes-kernel/kmod/kmod/ptest.patch     |  25 -
 meta/recipes-kernel/perf/perf.bb              |   6 +-
 .../libtiff/files/CVE-2023-2731.patch         |  39 ++
 meta/recipes-multimedia/libtiff/tiff_4.5.0.bb |   4 +-
 .../curl/curl/CVE-2023-28319.patch            |  38 ++
 .../curl/curl/CVE-2023-28320.patch            |  88 ++++
 .../curl/curl/CVE-2023-28321.patch            | 111 +++++
 .../curl/curl/CVE-2023-28322.patch            | 441 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.0.1.bb       |   4 +
 46 files changed, 771 insertions(+), 647 deletions(-)
 rename meta/recipes-connectivity/bind/{bind-9.18.13 => bind-9.18.14}/0001-avoid-start-failure-with-bind-user.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.13 => bind-9.18.14}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.13 => bind-9.18.14}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.13 => bind-9.18.14}/bind9 (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.13 => bind-9.18.14}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.13 => bind-9.18.14}/generate-rndc-key.sh (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.13 => bind-9.18.14}/init.d-add-support-for-read-only-rootfs.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.13 => bind-9.18.14}/make-etc-initd-bind-stop-work.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.13 => bind-9.18.14}/named.service (100%)
 rename meta/recipes-connectivity/bind/{bind_9.18.13.bb => bind_9.18.14.bb} (97%)
 delete mode 100644 meta/recipes-connectivity/inetutils/inetutils/0001-ftpd-telnetd-Fix-multiple-definitions-of-errcatch-an.patch
 delete mode 100644 meta/recipes-connectivity/inetutils/inetutils/fix-buffer-fortify-tfpt.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2023-0464.patch
 rename meta/recipes-connectivity/openssl/{openssl_3.1.0.bb => openssl_3.1.1.bb} (98%)
 rename meta/recipes-core/busybox/{busybox-inittab_1.36.0.bb => busybox-inittab_1.36.1.bb} (100%)
 rename meta/recipes-core/busybox/{busybox_1.36.0.bb => busybox_1.36.1.bb} (96%)
 rename meta/recipes-core/ell/{ell_0.56.bb => ell_0.57.bb} (89%)
 delete mode 100644 meta/recipes-core/newlib/libgloss/fix_makefile_include_arm_h.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0007-Add-sys-stat.h-for-S_IFDIR.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/qemu-7.0.0-glibc-2.36.patch
 delete mode 100644 meta/recipes-extended/minicom/minicom/0001-Drop-superfluous-global-variable-definitions.patch
 delete mode 100644 meta/recipes-extended/minicom/minicom/0002-Drop-superfluous-global-variable-definitions.patch
 delete mode 100644 meta/recipes-extended/minicom/minicom/0003-Drop-superfluous-global-variable-definitions.patch
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11/0001-fix-a-memory-leak-in-XRegisterIMInstantiateCallback.patch
 delete mode 100644 meta/recipes-kernel/kmod/kmod/ptest.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2023-2731.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-28319.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-28320.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-28321.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-28322.patch

-- 
2.34.1


