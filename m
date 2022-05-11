Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E58A5C433FE
	for <webhook@archiver.kernel.org>; Wed, 11 May 2022 02:57:47 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web10.6479.1652237862214713100
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 19:57:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=PBd1rNNp;
 spf=pass (domain: intel.com, ip: 134.134.136.20,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652237862; x=1683773862;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=C+S/lehltPHOpBpKt6z/PnBj3pnrtCggK7sbBnqrYiU=;
  b=PBd1rNNp4KUIbX+OMF1lUoRBlXE3S+UDGyaSKRMFKlH7EHTTEB3WotY5
   pMFIXooDSUCSwSNliGzt8BzGC0q0eHzZKW+aVTtNSS/JRVzvqlU0YyMOy
   XygSpLl4kyRYTSOs5mslzx2b8pw5iTv9bQNu8jPbMGh3ObBQf5+ZwhyOi
   UNtIbC+RRGz5iMyJVynEZzipWLQWa36jwmKLElXuzigxHtgu5Ye/9SJTI
   MOV9KF3hczuF5g/Qn5isLiViJT4YqHrGKWjuZCSq6h47b/a6SknH01zcL
   7Yf+2qQ67VKX7F34DA3NdEzhUmPt61InBt1n43q+jfHDndrV7FWn1CYMm
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10343"; a="257105978"
X-IronPort-AV: E=Sophos;i="5.91,215,1647327600";
   d="scan'208";a="257105978"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 19:57:38 -0700
X-IronPort-AV: E=Sophos;i="5.91,215,1647327600";
   d="scan'208";a="602754664"
Received: from ukandhax-mobl3.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.214.163.3])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 19:57:37 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 00/17] Patch review
Date: Wed, 11 May 2022 10:57:15 +0800
Message-Id: <cover.1652231471.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 May 2022 02:57:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165468

Next set of changes for honister. Includes fixes to perf and
lttng-modules to support newer kernels with honister. Please review.

No problems seen while testing:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3646

Thanks,

Anuj

The following changes since commit 1a6f5e27249afb6fb4d47c523b62b5dd2482a69d:

  build-appliance-image: Update to honister head revision (2022-05-03 21:56:48 +0100)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib anujm/honister

Bruce Ashfield (2):
  lttng-modules: update to 2.13.1
  lttng-modules: support kernel 5.18+

Chen Qi (1):
  cases/buildepoxy.py: fix typo

Davide Gardenal (1):
  rootfs-postcommands: fix symlinks where link and output path are equal

Khem Raj (1):
  busybox: Use base_bindir instead of hardcoding /bin path

Max Krummenacher (2):
  perf: sort-pmuevents: don't drop elements
  perf: sort-pmuevents: allow for additional type qualifiers and storage
    class

Paul Gortmaker (1):
  install/devshell: Introduce git intercept script due to fakeroot
    issues

Portia (1):
  volatile-binds: Change DefaultDependencies from false to no

Rahul Kumar (1):
  neard: Switch SRC_URI to git repo

Richard Purdie (4):
  base: Avoid circular references to our own scripts
  base: Drop git intercept
  scripts: Make git intercept global
  scripts/git: Ensure we don't have circular references

Ross Burton (1):
  oeqa/selftest: add test for git working correctly inside pseudo

wangmy (2):
  lttng-modules: upgrade 2.13.1 -> 2.13.2
  lttng-modules: upgrade 2.13.2 -> 2.13.3

 .../git-submodule-test/git-submodule-test.bb  |  15 +
 meta/classes/base.bbclass                     |   4 +
 meta/classes/devshell.bbclass                 |   2 +
 meta/classes/rootfs-postcommands.bbclass      |  14 +-
 meta/lib/oeqa/sdk/cases/buildepoxy.py         |   2 +-
 meta/lib/oeqa/selftest/cases/git.py           |  15 +
 meta/recipes-connectivity/neard/neard_0.16.bb |  13 +-
 meta/recipes-core/busybox/busybox.inc         |   2 +-
 .../files/volatile-binds.service.in           |   2 +-
 ...x-compaction-migratepages-event-name.patch |  37 +
 ...Remove-deprecated-CPU-hotplug-functi.patch | 394 ---------
 ...vent-allow-same-provider-and-event-n.patch |  48 +
 ...ile-Enable-Wimplicit-fallthrough-for.patch | 829 ------------------
 ...g-Don-t-re-read-p-state-when-emittin.patch | 183 ++++
 .../0004-fix-block-remove-genhd.h-v5.18.patch |  45 +
 ...emove-REQ_OP_WRITE_SAME-support-v5.1.patch |  79 ++
 ...ndom-remove-unused-tracepoints-v5.18.patch |  47 +
 ...rethook-for-kretprobe-if-possible-v5.patch |  72 ++
 ...ore-Remove-scsi-scsi_request.h-v5.18.patch |  44 +
 .../0009-Rename-genhd-wrapper-to-blkdev.patch |  76 ++
 ...n-cleanup-the-compaction-trace-event.patch | 106 +++
 ...ules_2.13.0.bb => lttng-modules_2.13.3.bb} |  15 +-
 .../perf/perf/sort-pmuevents.py               |  28 +-
 scripts/git                                   |  26 +
 24 files changed, 845 insertions(+), 1253 deletions(-)
 create mode 100644 meta/lib/oeqa/selftest/cases/git.py
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-Fix-compaction-migratepages-event-name.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-cpu-hotplug-Remove-deprecated-CPU-hotplug-functi.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0002-Fix-tracepoint-event-allow-same-provider-and-event-n.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0002-fix-Revert-Makefile-Enable-Wimplicit-fallthrough-for.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0003-fix-sched-tracing-Don-t-re-read-p-state-when-emittin.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0004-fix-block-remove-genhd.h-v5.18.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0005-fix-scsi-block-Remove-REQ_OP_WRITE_SAME-support-v5.1.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0006-fix-random-remove-unused-tracepoints-v5.18.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0007-fix-kprobes-Use-rethook-for-kretprobe-if-possible-v5.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0008-fix-scsi-core-Remove-scsi-scsi_request.h-v5.18.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0009-Rename-genhd-wrapper-to-blkdev.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0010-fix-mm-compaction-cleanup-the-compaction-trace-event.patch
 rename meta/recipes-kernel/lttng/{lttng-modules_2.13.0.bb => lttng-modules_2.13.3.bb} (65%)
 create mode 100755 scripts/git

-- 
2.35.3


