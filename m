Return-Path: <dnagodra@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E06FC3DA63
	for <webhook@archiver.kernel.org>; Wed, 24 Jul 2024 04:44:27 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.web11.3540.1721796257299546440
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jul 2024 21:44:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport header.b=HTOX3pg0;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: dnagodra@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1237; q=dns/txt; s=iport;
  t=1721796257; x=1723005857;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=GJ2sfOyP95A50dS0VEY/jkfZaE7oorY8uD9lgOK1sqs=;
  b=HTOX3pg0rZziRR5WQvPgA/h6GKzKyJJYc4IXOWCElNiyeG4v9BJ6gQAw
   oRY04DisoDBwiD/5snwXOHeVpEKHDUkSnZJJQBuFiDvCmSl+Rf8uk8naf
   EUfbekL0StwqfCkt6k9tAX6f+DborAIS/52qyIEVrBdKjX/rDuoYKW7Oi
   E=;
X-CSE-ConnectionGUID: 4SXPX1qFT8yxUs8whg7Xzg==
X-CSE-MsgGUID: MMDhAmhPRwWcNGpGRxhxwg==
X-IronPort-AV: E=Sophos;i="6.09,232,1716249600"; 
   d="scan'208";a="233293322"
Received: from rcdn-core-11.cisco.com ([173.37.93.147])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2024 04:44:16 +0000
Received: from sjc-ads-6228.cisco.com (sjc-ads-6228.cisco.com [10.28.89.212])
	by rcdn-core-11.cisco.com (8.15.2/8.15.2) with ESMTPS id 46O4iGKR022595
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 24 Jul 2024 04:44:16 GMT
Received: by sjc-ads-6228.cisco.com (Postfix, from userid 1820939)
	id 1CF55CCA766; Tue, 23 Jul 2024 21:44:16 -0700 (PDT)
From: Dhairya Nagodra <dnagodra@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com, Dhairya Nagodra <dnagodra@cisco.com>
Subject: [PATCH] cve-check-map: Add 'cannot-backport' to status map
Date: Tue, 23 Jul 2024 21:44:12 -0700
Message-Id: <20240724044412.3343884-1-dnagodra@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 10.28.89.212, sjc-ads-6228.cisco.com
X-Outbound-Node: rcdn-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 04:44:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202424

- Sometimes, the difference in the codebase of the fixed CVE's version
  and the current version of the package is huge.
- This would make the backporting of the CVE not a feasible option.
- And due to other dependencies and limitations, the upgrade of the
  package might not be possible as well.
- This commit would allow users to add a description via CVE_STATUS and
  still show the CVE as vulnerable.

Signed-off-by: Dhairya Nagodra <dnagodra@cisco.com>
---
 meta/conf/cve-check-map.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/cve-check-map.conf b/meta/conf/cve-check-map.conf
index 17b0f15571..b9df41a6f3 100644
--- a/meta/conf/cve-check-map.conf
+++ b/meta/conf/cve-check-map.conf
@@ -13,6 +13,8 @@ CVE_CHECK_STATUSMAP[fixed-version] = "Patched"
 CVE_CHECK_STATUSMAP[unpatched] = "Unpatched"
 # use when CVE is confirmed by upstream but fix is still not available
 CVE_CHECK_STATUSMAP[vulnerable-investigating] = "Unpatched"
+# use when CVE fix is not compatible to the current version and cannot be backported.
+CVE_CHECK_STATUSMAP[cannot-backport] = "Unpatched"
 
 # used for migration from old concept, do not use for new vulnerabilities
 CVE_CHECK_STATUSMAP[ignored] = "Ignored"

