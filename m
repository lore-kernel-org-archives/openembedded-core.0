Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A908C4332F
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 15:51:08 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web12.12444.1664898661974910266
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 08:51:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=C3aQ6M4Y;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id g130so12898049pfb.8
        for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 08:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date;
        bh=R6XQmPEL0iID6Ex01Hf7XsLGTgq+kFSR7qxrvEBDJGw=;
        b=C3aQ6M4Yf09iSuZxzzddttMuH/ZBm1c5S6sb6UIiOuMcspp1MXml6seI8STzNPEtYR
         sOlKnMBRzl1l7XXx1q31vppGNFI2qh1hE6a0cy4lv3mr4MvTGAMnLcQtZQCAagkhQJRN
         MGhdhnw+suZd97DFPdJU6HgQn08pBxquaMck8rDfpHITIYHVetzUG4k4e0d/P3zu/wPV
         b1SLpX7JCRsdcOom9tk5EeoIndHdSvr/OvUhnWUgHCVeE14x9w7lI+5mx0GH/Cypq8Wh
         nujrVCxDzJ4jcJFeDX+KQrEtV/YBKauKh5ZLKd4CfloEQli0OmYepr6Owmf2b4HH3BTw
         SuhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date;
        bh=R6XQmPEL0iID6Ex01Hf7XsLGTgq+kFSR7qxrvEBDJGw=;
        b=O3SNgDYH15QEBIwYG842mHoLBCbJel6WNz8joNPcnnEg2UHR+Wy2/DTzyjwVyPq56U
         1ZwtlemcRk3rbdPCU6cs1ffJFvNTuDzy/HTCMGVC7n/d2yddcjm/xkb6EPCfwlLVQ8VS
         MWjx6i779hmZyWPdpsBZqHlL+ozVmHwfOCGKgQH/lJQnfgkPsqMJlupgrFCKe6sZjiBT
         /XJKiLfLiSgwME5uljhU29FzFWGnKPPSx6f/WHPrLW1xmBkgubgVmcP8JVqT4E2hpaJz
         lVeBy/ASrVryw0Y8btTC0LR8PKcfGy8c53XdMzk8SiLQLtdcZLP5SSt20QnALqGGtL8r
         jVLg==
X-Gm-Message-State: ACrzQf0s2AYvm6TpW58q9mKSfGQsqz93lQLgLj62deM9y0UFrco4gNL5
	k1OgS3hCr1PM7Jb9S25p2pTLOOTFSiLd8oF2
X-Google-Smtp-Source: 
 AMsMyM4gGkDBXU0nJQM4WFTmcwmdI2VahAccP/7wW97FgOxR6yyrBEm+hwBd9QoM3IFC2OUmrtfWhg==
X-Received: by 2002:a62:52cf:0:b0:561:60a8:5257 with SMTP id
 g198-20020a6252cf000000b0056160a85257mr11088578pfb.13.1664898660699;
        Tue, 04 Oct 2022 08:51:00 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 a2-20020aa78e82000000b00561642b6903sm4464266pfr.120.2022.10.04.08.50.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 08:50:59 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/18] Patch review
Date: Tue,  4 Oct 2022 05:50:29 -1000
Message-Id: <cover.1664898546.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Oct 2022 15:51:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171407

Please review this set of patches for kirkstone and have comments back by
end of day Wednesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/4294

The following changes since commit d19cd09b43a7009d660b28ac9dcb21b8038e399f:

  busybox: add devmem 128-bit support (2022-09-24 04:03:56 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Alexander Kanavin (2):
  rpm: update 4.17.0 -> 4.17.1
  tzdata: update to 2022d

Daniel McGregor (1):
  coreutils: add openssl PACKAGECONFIG

Denys Dmytriyenko (1):
  glibc-locale: explicitly remove empty dirs in ${libdir}

Florin Diaconescu (2):
  rsync: update 3.2.3 -> 3.2.4
  rsync: update 3.2.4 -> 3.2.5

He Zhe (3):
  lttng-tools: Disable on qemuriscv32
  stress-cpu: disable float128 math on powerpc64 to avoid SIGILL
  lttng-tools: Disable on riscv32

Khem Raj (3):
  webkitgtk: Upgrade to 2.36.6 minor update
  webkitgtk: Update to 2.36.7
  rpm: Remove -Wimplicit-function-declaration warnings

Martin Jansa (1):
  create-pull-request: don't switch the git remote protocol to git://

Richard Purdie (2):
  vim: Upgrade 9.0.0541 -> 9.0.0598
  go: Fix reproducibility failures

Teoh Jay Shen (1):
  bind: upgrade 9.18.6 -> 9.18.7

pgowda (1):
  binutils : Fix CVE-2022-38127

wangmy (1):
  bind: upgrade 9.18.5 -> 9.18.6

 ...1-avoid-start-failure-with-bind-user.patch |    0
 ...d-V-and-start-log-hide-build-options.patch |    0
 ...ching-for-json-headers-searches-sysr.patch |    0
 .../bind/{bind-9.18.5 => bind-9.18.7}/bind9   |    0
 .../{bind-9.18.5 => bind-9.18.7}/conf.patch   |    0
 .../generate-rndc-key.sh                      |    0
 ...t.d-add-support-for-read-only-rootfs.patch |    0
 .../make-etc-initd-bind-stop-work.patch       |    0
 .../named.service                             |    0
 .../bind/{bind_9.18.5.bb => bind_9.18.7.bb}   |    2 +-
 meta/recipes-core/coreutils/coreutils_9.0.bb  |    1 +
 meta/recipes-core/glibc/glibc-locale.inc      |    5 +-
 .../binutils/binutils-2.38.inc                |    4 +
 .../binutils/0017-CVE-2022-38127-1.patch      | 1224 +++++++++++++++++
 .../binutils/0017-CVE-2022-38127-2.patch      |  188 +++
 .../binutils/0017-CVE-2022-38127-3.patch      |  211 +++
 .../binutils/0017-CVE-2022-38127-4.patch      |   43 +
 meta/recipes-devtools/go/go-runtime.inc       |    2 +
 .../rpm/files/0001-CVE-2021-3521.patch        |   57 -
 ...lib-rpm-as-the-installation-path-for.patch |   14 +-
 ...lling-execute-package-scriptlets-wit.patch |   18 +-
 ...-linux-gnux32-variant-to-triplet-han.patch |   31 +
 .../rpm/files/0002-CVE-2021-3521.patch        |   64 -
 .../rpm/files/0003-CVE-2021-3521.patch        |  329 -----
 .../rpm/{rpm_4.17.0.bb => rpm_4.17.1.bb}      |    6 +-
 ...-the-hostname-in-the-certificate-whe.patch |   31 -
 .../rsync/files/makefile-no-rebuild.patch     |   12 +-
 .../rsync/{rsync_3.2.3.bb => rsync_3.2.5.bb}  |   17 +-
 ...le-float128-math-on-powerpc64-to-avo.patch |   43 +
 .../stress-ng/stress-ng_0.13.12.bb            |    4 +-
 meta/recipes-extended/timezone/timezone.inc   |    6 +-
 meta/recipes-kernel/lttng/lttng-platforms.inc |    4 +
 ...ebkitgtk_2.36.5.bb => webkitgtk_2.36.7.bb} |    3 +-
 meta/recipes-support/vim/vim.inc              |    4 +-
 scripts/create-pull-request                   |    2 +-
 35 files changed, 1803 insertions(+), 522 deletions(-)
 rename meta/recipes-connectivity/bind/{bind-9.18.5 => bind-9.18.7}/0001-avoid-start-failure-with-bind-user.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.5 => bind-9.18.7}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.5 => bind-9.18.7}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.5 => bind-9.18.7}/bind9 (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.5 => bind-9.18.7}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.5 => bind-9.18.7}/generate-rndc-key.sh (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.5 => bind-9.18.7}/init.d-add-support-for-read-only-rootfs.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.5 => bind-9.18.7}/make-etc-initd-bind-stop-work.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.5 => bind-9.18.7}/named.service (100%)
 rename meta/recipes-connectivity/bind/{bind_9.18.5.bb => bind_9.18.7.bb} (97%)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0017-CVE-2022-38127-1.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0017-CVE-2022-38127-2.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0017-CVE-2022-38127-3.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0017-CVE-2022-38127-4.patch
 delete mode 100644 meta/recipes-devtools/rpm/files/0001-CVE-2021-3521.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0001-configure.ac-add-linux-gnux32-variant-to-triplet-han.patch
 delete mode 100644 meta/recipes-devtools/rpm/files/0002-CVE-2021-3521.patch
 delete mode 100644 meta/recipes-devtools/rpm/files/0003-CVE-2021-3521.patch
 rename meta/recipes-devtools/rpm/{rpm_4.17.0.bb => rpm_4.17.1.bb} (97%)
 delete mode 100644 meta/recipes-devtools/rsync/files/0001-rsync-ssl-Verify-the-hostname-in-the-certificate-whe.patch
 rename meta/recipes-devtools/rsync/{rsync_3.2.3.bb => rsync_3.2.5.bb} (67%)
 create mode 100644 meta/recipes-extended/stress-ng/stress-ng-0.13.12/0001-stress-cpu-disable-float128-math-on-powerpc64-to-avo.patch
 rename meta/recipes-sato/webkit/{webkitgtk_2.36.5.bb => webkitgtk_2.36.7.bb} (98%)

-- 
2.25.1


