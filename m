Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 315A0C001DF
	for <webhook@archiver.kernel.org>; Wed, 26 Jul 2023 16:22:31 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web11.15664.1690388543744120259
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jul 2023 09:22:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=Q+poj9iL;
 spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690388543; x=1721924543;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+nqjXW1CD1KEM51Y6VZVW3sqzlyNFFbIyTAKnsxxo0s=;
  b=Q+poj9iLr0X6tzFZK0VigLSMvbf2i2VTPTPBZ4ahfppMPzZpZJa4HgB+
   zuzOQcZQF8daLkmTJodM5+bSySMjmvmA3cNIDjRDzxWp3oI/7MMEUrCSR
   rc6mbBjdUp/GAV5Vc8tiKwFmmrsJCpNpubIJX+uL2EHRSKSDCAMp0u5u0
   xVUH00QRa4mlhbEuCkH7NtIxIeuHYcE+tJ+GX+AxYNh12zFEmABhEXGjQ
   41Ahm0i87jiqzoYk1AUEScx6mYFHFZwZgX9uiQHAJS+VCLTsgQdLZ+GeH
   hKqywL7lfGubCwnk0EjISRrlHq2kUc1foDqM0xPqoOlAIkehodLrtokpm
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="347676097"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; 
   d="scan'208";a="347676097"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 09:22:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="816745730"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; 
   d="scan'208";a="816745730"
Received: from anmitta2-mobl3.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com) ([10.215.151.246])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 09:22:22 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/4] Fix glibc test failures when running through qemu
Date: Thu, 27 Jul 2023 00:22:05 +0800
Message-ID: <20230726162209.131855-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jul 2023 16:22:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184891

After applying these changes, the number of tests failing for glibc come
down to 69 on autobuilder. Result summary for qemux86-64:

-----------------------------------------------------------------------
---------------------------------------
Recipe           | Passed       | Failed   | Skipped     | Time(s)
-----------------------------------------------------------------------
---------------------------------------
binutils         | 289          | 0        | 8           | -
binutils-gas     | 1582         | 4        | 1           | -
binutils-ld      | 1622         | 6        | 111         | -
gcc              | 149696       | 28       | 27599       | -
gcc-g++          | 219260       | 30       | 21108       | -
gcc-libatomic    | 27           | 1        | 27          | -
gcc-libgomp      | 3426         | 1        | 1962        | -
gcc-libitm       | 24           | 1        | 24          | -
gcc-libstdc++-v3 | 9695         | 32       | 5459        | -
glibc            | 4984         | 69       | 147         | -
rust             | 15768        | 0        | 554         | -
-----------------------------------------------------------------------
---------------------------------------

Some of the remaining failing tests (~8) need python/gdb or gprof to be
installed. Some (~8) seem to be still triggering out of memory errors.

Some others (~26) fail while trying to setup test container with error:
error: test-container.c:844: Cannot create testroot lock

Anuj Mittal (4):
  glibc/check-test-wrapper: don't emit warnings from ssh
  selftest/cases/glibc.py: increase the memory for testing
  oeqa/utils/nfs: allow requesting non-udp ports
  selftest/cases/glibc.py: switch to using NFS over TCP

 meta/lib/oeqa/selftest/cases/glibc.py            | 6 +++---
 meta/lib/oeqa/utils/nfs.py                       | 4 ++--
 meta/recipes-core/glibc/glibc/check-test-wrapper | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.41.0


