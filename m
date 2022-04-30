Return-Path: <jiaqing.zhao@linux.intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AAE5C433FE
	for <webhook@archiver.kernel.org>; Sat, 30 Apr 2022 02:48:44 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by mx.groups.io with SMTP id smtpd.web08.18515.1651286914150547358
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 19:48:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=UP0b+vCr;
 spf=none, err=permanent DNS error (domain: linux.intel.com,
 ip: 192.55.52.151, mailfrom: jiaqing.zhao@linux.intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651286914; x=1682822914;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5ITFTrKA4vTaRk7n5G301J+GYjD1SYtgjSPC70PnR+o=;
  b=UP0b+vCr1GCzROpdfmBOpfs8I5DCaFyWvhxD5PDX7Dw9RtQmwqAOdXJf
   3MKPi+MrRIJanyNONlAeLdC7xRJQ1oGX/EjVRND6FBcJlOo7G/kXexzM4
   vh6os0mRBe3QO0oNstIgyGQtdoOYOPlksilea59uPal2AquY7YQPpOMzq
   dEO0VxX/TYvIy+Dm9pgr+2DB/HP++sLIYQdAMQwBPxZv4kqR37BCRRdIj
   7h9itBCtAy++1H8f+qwR2HAtNuqDKoul0FEDcjoAID7Jvq3Bd8wxxPDNv
   V43QvYt63CHuujf9bowwSeLBdOiwQ1OLDhImpLTlmf0B2Bj0IQMbovB6k
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10332"; a="247377495"
X-IronPort-AV: E=Sophos;i="5.91,187,1647327600";
   d="scan'208";a="247377495"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2022 19:48:33 -0700
X-IronPort-AV: E=Sophos;i="5.91,187,1647327600";
   d="scan'208";a="560687044"
Received: from unknown (HELO jiaqingz-bmcdev-container.sh.intel.com)
 ([10.239.138.232])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2022 19:48:31 -0700
From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
Subject: [PATCH v3 0/3] Disable shell for default users
Date: Sat, 30 Apr 2022 10:48:09 +0800
Message-Id: <20220430024812.745583-1-jiaqing.zhao@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Apr 2022 02:48:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165062

This patchset changes the default shell of default users other than
root and sync from /bin/sh to /sbin/nologin to fix potential security
vulnerabilities. This is backported from base-passwd 3.5.30.

Upstream issue trackers:
https://launchpad.net/bugs/216813
https://launchpad.net/bugs/248844

v3:
Fix ptest for sed and strace.
v2:
Fix indentation in bbfile.

Jiaqing Zhao (3):
  base-passwd: Disable shell for default users
  sed: Specify shell for "nobody" user in run-ptest
  strace: Don't run ptest as "nobody"

 .../base-passwd/disable-shell.patch           | 57 +++++++++++++++++++
 .../base-passwd/base-passwd_3.5.29.bb         |  1 +
 meta/recipes-devtools/strace/strace/run-ptest |  6 +-
 meta/recipes-extended/sed/sed/run-ptest       |  2 +-
 4 files changed, 60 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-core/base-passwd/base-passwd/disable-shell.patch

-- 
2.34.1


