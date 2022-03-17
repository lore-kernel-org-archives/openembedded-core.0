Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2A04C433EF
	for <webhook@archiver.kernel.org>; Thu, 17 Mar 2022 14:14:37 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web12.10711.1647526474312722703
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 07:14:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=Ash1ZEi2;
 spf=pass (domain: intel.com, ip: 134.134.136.24,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647526475; x=1679062475;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=37WNF6bh7nwsemMhoxaK5RgdggYQbYuWI6wVt4krv4s=;
  b=Ash1ZEi2jVoEIp2XxrXVAgETe/meiXVyatF558JB+G38Q5hLwPwY2VY8
   Bv7Muz7SLDIE8qZ5DtxmcgSvzi2fx/WazeobdpZF/v8Uw+trBmZqokZeX
   fIOy3efu+/Q3pow36sKNg+Ro4pYd8VnrdaLG3dtSMLceTeBgvOEU1FAlo
   O5qnKhrowKrByi28Z+iT8BmwXVd9LmKnE4iMNUP/slvmwZAewsbpsvjcw
   ZNCFDbZA8yY0A3hkX6WdmXTvH91iFiY+4v63tXwkGmYEpOwM+j/uDQcNb
   RStFyVw9viJncOLJA3pr3gzQo5UX9joH1uv84PuGV73B6DSNuyEBp5t3j
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10289"; a="256604312"
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400";
   d="scan'208";a="256604312"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 07:14:32 -0700
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400";
   d="scan'208";a="513439896"
Received: from djlow-mobl2.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.215.234.144])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 07:14:31 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 0/6] Pull request
Date: Thu, 17 Mar 2022 22:14:22 +0800
Message-Id: <cover.1647526261.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Mar 2022 14:14:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163418

The following changes since commit d0b1807edc10835beff9a55a105ac191b6ac2fe7:

  unfs3: correct configure option (2022-03-07 22:19:01 +0800)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib stable/hardknott-next

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


