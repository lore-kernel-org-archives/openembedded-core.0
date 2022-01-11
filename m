Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F53FC43219
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 14:33:16 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web12.7797.1641911596199171730
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 06:33:16 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=YGh7NZ4O;
 spf=pass (domain: intel.com, ip: 192.55.52.120,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641911596; x=1673447596;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vbv3XnDdeU/ubVtF61wi1DcWiRtOXXRlEH6Pu1YMzi4=;
  b=YGh7NZ4OvTIiWhF8EBjsFtn2HEWuj5FKT7idpDjltUzIKv79/WXw7J4J
   o93Va50JsmfMt2BZfhS2Tk6ZzsxrTo0uGuGsOkE8vkaGxdy56lYopzYUV
   lxBdGyMPR2bIg+mbW8Dj5nxFS9wc9tIzmBIG7pg7AY5ICBM/2bfqWDT8t
   PlFugvf6G0jbHLxBw5okCe45EVeJjWeLr8YVICnItqdZouEdmYEVaPxO/
   sFCEEcZ4HQTzMlRoAHk+JBKIJk7LWDWPHJzvDJ/tEFcSO+h/bGxu5Qh1B
   C5kHlQSoBTkemWwxpoDlqC56QG2XPMVIt6nhU63qeVAnnGusZCYmfoXNP
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10223"; a="242307036"
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600";
   d="scan'208";a="242307036"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2022 06:33:08 -0800
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600";
   d="scan'208";a="623086315"
Received: from wongkye-mobl3.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.137.187])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2022 06:32:58 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 0/9] Patch review
Date: Tue, 11 Jan 2022 22:32:44 +0800
Message-Id: <cover.1641911316.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 14:33:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160409

Next set of changes for hardknott. Please review. 

No problems seen while testing on autobuilder.

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3103

Thanks,

Anuj

The following changes since commit b90dab2c8634c052c101cebb38fcd3d869f3b1bb:

  linux-yocto: add libmpc-native to DEPENDS (2022-01-10 11:57:23 +0000)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib anujm/hardknott

Alexander Kanavin (1):
  lib/oe/reproducible: correctly set .git location when recursively
    looking for git repos

Anuj Mittal (1):
  python3-pyelftools: fix the override syntax

Chen Qi (1):
  busybox: backport patches to fix CVEs

Kai Kang (1):
  webkitgtk: fix fix CVE-2021-42762

Pgowda (2):
  glibc: Backport fix for CVE-2021-43396
  gcc: add support for Neoverse N2 CPU

Yongxin Liu (1):
  grub2: fix CVE-2021-3981

pgowda (2):
  gcc: add aarch64 support for Arm's Neoverse N2 CPU
  gcc: Fix CVE-2021-42574

 meta/lib/oe/reproducible.py                   |    2 +-
 ...onfig-Restore-umask-for-the-grub.cfg.patch |   49 +
 meta/recipes-bsp/grub/grub2.inc               |    1 +
 .../busybox/busybox/0001-awk-fix-CVEs.patch   | 3266 +++++++++++++++++
 .../0002-man-fix-segfault-in-man-1.patch      |   30 +
 meta/recipes-core/busybox/busybox_1.33.2.bb   |    2 +
 .../glibc/glibc/0031-CVE-2021-43396.patch     |  182 +
 meta/recipes-core/glibc/glibc_2.33.bb         |    1 +
 meta/recipes-devtools/gcc/gcc-10.2.inc        |    7 +
 .../gcc/gcc/0001-CVE-2021-42574.patch         | 2906 +++++++++++++++
 .../gcc/gcc/0002-CVE-2021-42574.patch         | 2270 ++++++++++++
 .../gcc/gcc/0003-CVE-2021-42574.patch         | 1724 +++++++++
 .../gcc/gcc/0004-CVE-2021-42574.patch         |  138 +
 .../gcc/gcc/0005-CVE-2021-42574.patch         |  575 +++
 .../gcc/0038-arm-neoverse-n2-support.patch    |   88 +
 .../gcc/0039-arm64-neoverse-n2-support.patch  |   60 +
 .../python/python3-pyelftools_0.27.bb         |    2 +-
 .../webkit/webkitgtk/CVE-2021-42762.patch     |  468 +++
 meta/recipes-sato/webkit/webkitgtk_2.30.5.bb  |    1 +
 19 files changed, 11770 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2021-3981-grub-mkconfig-Restore-umask-for-the-grub.cfg.patch
 create mode 100644 meta/recipes-core/busybox/busybox/0001-awk-fix-CVEs.patch
 create mode 100644 meta/recipes-core/busybox/busybox/0002-man-fix-segfault-in-man-1.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0031-CVE-2021-43396.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc/0001-CVE-2021-42574.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc/0002-CVE-2021-42574.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc/0003-CVE-2021-42574.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc/0004-CVE-2021-42574.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc/0005-CVE-2021-42574.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc/0038-arm-neoverse-n2-support.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc/0039-arm64-neoverse-n2-support.patch
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/CVE-2021-42762.patch

-- 
2.34.1


