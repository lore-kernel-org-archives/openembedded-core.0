Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67D78C433EF
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 15:07:02 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web08.12123.1647356821113804643
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 08:07:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=kPuzjK1k;
 spf=pass (domain: intel.com, ip: 192.55.52.88,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647356821; x=1678892821;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=X5TyVB1vTs2arZj32NmpYSI8Is6luE3xJkPJ6ITOe5s=;
  b=kPuzjK1keCWV94rdQJqrnjhU8gNp5FVEC/p5VmMq6HIXgrtJT6JP90in
   PDeJOC5sg7ShZPKrOcGxAYUwDq3DRx6JJDTIhfNa7EyBRYULVCXnX378j
   eplF6os+awwS3jQCGQwtvQP1rMk+TJs4zMPOMIov4ijL1RsLFS/XxReDR
   MZ19Abtjp7/BIlKDa4gDZbFoVbs7NZ6hG0FbvBa1BvEPiPdajVn+DyXG3
   EBPOU3YWUBkeyqohFddjwnCqKiBIYXtE2P8di1Ogp+t5CSgl3mbff3jN7
   R+jHo8owHw2tYIw1lZpmdZQs9dr4+82RsDk3MFdyA86K7be3dckFh9ShF
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="281098879"
X-IronPort-AV: E=Sophos;i="5.90,183,1643702400";
   d="scan'208";a="281098879"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2022 08:05:28 -0700
X-IronPort-AV: E=Sophos;i="5.90,183,1643702400";
   d="scan'208";a="634616101"
Received: from ezulkifl-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.233.253])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2022 08:05:27 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 0/6] Patch review
Date: Tue, 15 Mar 2022 23:05:15 +0800
Message-Id: <cover.1647356478.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Mar 2022 15:07:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163296

Next set of changes for hardknott. No problems seen while testing on the
autobuilder.

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3363

Thanks,

Anuj

The following changes since commit d0b1807edc10835beff9a55a105ac191b6ac2fe7:

  unfs3: correct configure option (2022-03-07 22:19:01 +0800)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib anujm/hardknott

Bill Pittman (1):
  wic: Use custom kernel path if provided

Jose Quaresma (1):
  sstate: inside the threadedpool don't write to the shared localdata

Kai Kang (2):
  expat: fix CVE-2022-25235
  expat: fix CVE-2022-25236

Pavel Zhukov (1):
  patch.py: Prevent git repo reinitialization

Richard Purdie (1):
  vim: Update to 8.2.4524 for further CVE fixes

 .../recipes-test/gitrepotest/gitrepotest.bb   |  16 ++
 .../gitrepotest/0001-testpatch.patch          |   9 +
 meta/classes/sstate.bbclass                   |   2 +-
 meta/lib/oe/patch.py                          |  11 +-
 meta/lib/oeqa/selftest/cases/bbtests.py       |  18 +-
 .../expat/expat/CVE-2022-25235.patch          | 261 ++++++++++++++++++
 .../expat/expat/CVE-2022-25236-1.patch        | 116 ++++++++
 .../expat/expat/CVE-2022-25236-2.patch        | 232 ++++++++++++++++
 meta/recipes-core/expat/expat_2.2.10.bb       |   3 +
 meta/recipes-support/vim/vim.inc              |   4 +-
 scripts/wic                                   |   3 +
 11 files changed, 667 insertions(+), 8 deletions(-)
 create mode 100644 meta-selftest/recipes-test/gitrepotest/gitrepotest.bb
 create mode 100644 meta-selftest/recipes-test/gitrepotest/gitrepotest/0001-testpatch.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2022-25235.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2022-25236-1.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2022-25236-2.patch

-- 
2.35.1


