Return-Path: <jiaqing.zhao@linux.intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8DFCC433F5
	for <webhook@archiver.kernel.org>; Fri, 13 May 2022 09:40:49 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web11.6383.1652434844037464640
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 May 2022 02:40:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=GyEtJ1Z/;
 spf=none, err=permanent DNS error (domain: linux.intel.com,
 ip: 192.55.52.115, mailfrom: jiaqing.zhao@linux.intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652434844; x=1683970844;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=6ugzGTere2PmnjuS7ALeIu3bajlma8bB31cwI5BSfpo=;
  b=GyEtJ1Z/Vj5nStHDW+9rx3os0UyR+aBjV3P90RgB53ABNRBShxHuu559
   nIDu8lWalsrEm8a9BF3ozsTd2w5RUq6+ndZyO4tEX54IZ0sK6SZtV4BpY
   /xEW7V7uLk4JOhcZqGT5MKb8Ss1mW+3oulR0ESPtaBVoufbTYoKKAqsON
   yAWNlecfvOkx4l+0fddRjjSztikUYGNLqk+p2DGUDF6pNTp1P2CyJNLug
   RbRmYOUJN0J/GPA2m5W97UZHAT5TOk2+IaLJ1jp4vw6e56gYZquH6OeM7
   PNk+d4o2rpo5wIjj5J3o4g7DxTA11cRv2d0aYeYgY0zjPvbkNxKGBgNFx
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10345"; a="270399112"
X-IronPort-AV: E=Sophos;i="5.91,221,1647327600";
   d="scan'208";a="270399112"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2022 02:40:42 -0700
X-IronPort-AV: E=Sophos;i="5.91,221,1647327600";
   d="scan'208";a="595144063"
Received: from unknown (HELO jiaqingz-bmcdev-container.sh.intel.com)
 ([10.239.138.232])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2022 02:40:41 -0700
From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Cc: davide.gardenal@huawei.com,
	Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
Subject: [kirkstone] [PATCH v3 0/3] base-passwd: Disable shell for default
 users
Date: Fri, 13 May 2022 17:40:13 +0800
Message-Id: <20220513094016.3345337-1-jiaqing.zhao@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 May 2022 09:40:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165548

Change the shell of all global static users other than root (which
retains /bin/sh) and sync (as /bin/sync is rather harmless) to
/sbin/nologin (as /usr/sbin/nologin does not exist in openembedded)

Davide Gardenal (1):
  base-passwd: Disable shell for default users

Jiaqing Zhao (2):
  sed: Specify shell for "nobody" user in run-ptest
  strace: Don't run ptest as "nobody"

---
Updates:
    - v3: cherry pick related patches to fix ptest issues
    - v2: fix commit message

---

 .../base-passwd/disable-shell.patch           | 57 +++++++++++++++++++
 .../base-passwd/base-passwd_3.5.29.bb         |  1 +
 meta/recipes-devtools/strace/strace/run-ptest |  6 +-
 meta/recipes-extended/sed/sed/run-ptest       |  2 +-
 4 files changed, 60 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-core/base-passwd/base-passwd/disable-shell.patch

-- 
2.34.1


