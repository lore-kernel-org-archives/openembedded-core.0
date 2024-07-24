Return-Path: <dnagodra@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDFDFC3DA63
	for <webhook@archiver.kernel.org>; Wed, 24 Jul 2024 04:45:16 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.web11.3550.1721796309403260939
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jul 2024 21:45:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport header.b=ag7ljDGT;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: dnagodra@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1605; q=dns/txt; s=iport;
  t=1721796309; x=1723005909;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=H/MCpgqyWW3OQcjSH2Idhn9aOATFM9DtfidjCnLYMnc=;
  b=ag7ljDGTH39C6csqkdWOxnRpRpYGXKqfpG+geHlF84Zg1HNeqHv0y6CG
   giLrWvB76D+nyCjpfAJCNrWVP3nBtDAM3kZxmSbOFyeD4hhvv8rvaSs51
   8YmPC6hHFd1vfwCw4i1OPd4g+yfDLYErbNH+BBNaK7+wxgWBcA/uxE9r6
   k=;
X-CSE-ConnectionGUID: A4fZeUaUQm+lCijj/S5hnA==
X-CSE-MsgGUID: LvxdwgPgTh2b5PdcwlkCUw==
X-IronPort-AV: E=Sophos;i="6.09,232,1716249600"; 
   d="scan'208";a="233293631"
Received: from rcdn-core-10.cisco.com ([173.37.93.146])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2024 04:45:08 +0000
Received: from sjc-ads-6228.cisco.com (sjc-ads-6228.cisco.com [10.28.89.212])
	by rcdn-core-10.cisco.com (8.15.2/8.15.2) with ESMTPS id 46O4j8ga009191
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 24 Jul 2024 04:45:08 GMT
Received: by sjc-ads-6228.cisco.com (Postfix, from userid 1820939)
	id 4FC8CCCA766; Tue, 23 Jul 2024 21:45:08 -0700 (PDT)
From: Dhairya Nagodra <dnagodra@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com, Dhairya Nagodra <dnagodra@cisco.com>
Subject: [PATCH] cve-check-map: Move 'upstream-wontfix' to "Unpatched" status
Date: Tue, 23 Jul 2024 21:45:05 -0700
Message-Id: <20240724044505.3345411-1-dnagodra@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 10.28.89.212, sjc-ads-6228.cisco.com
X-Outbound-Node: rcdn-core-10.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 04:45:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202425

- The 'upstream-wontfix' is to be used when the CVE is accepted by the
  upstream, but they are not planning to fix it.
- If the version used in Yocto is vulnerable, it should not have
  "Ignored" status. The package is still exploitable by the CVE.
- Also, when the status is exported out of the SDK, it would be
  incorrect to put it under Ignored catgory.

Signed-off-by: Dhairya Nagodra <dnagodra@cisco.com>
---
 meta/conf/cve-check-map.conf | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/cve-check-map.conf b/meta/conf/cve-check-map.conf
index b9df41a6f3..7ff53f5601 100644
--- a/meta/conf/cve-check-map.conf
+++ b/meta/conf/cve-check-map.conf
@@ -15,6 +15,8 @@ CVE_CHECK_STATUSMAP[unpatched] = "Unpatched"
 CVE_CHECK_STATUSMAP[vulnerable-investigating] = "Unpatched"
 # use when CVE fix is not compatible to the current version and cannot be backported.
 CVE_CHECK_STATUSMAP[cannot-backport] = "Unpatched"
+# use when upstream acknowledged the vulnerability but does not plan to fix it
+CVE_CHECK_STATUSMAP[upstream-wontfix] = "Unpatched"
 
 # used for migration from old concept, do not use for new vulnerabilities
 CVE_CHECK_STATUSMAP[ignored] = "Ignored"
@@ -26,5 +28,3 @@ CVE_CHECK_STATUSMAP[disputed] = "Ignored"
 CVE_CHECK_STATUSMAP[not-applicable-config] = "Ignored"
 # use when vulnerability affects other platform (e.g. Windows or Debian)
 CVE_CHECK_STATUSMAP[not-applicable-platform] = "Ignored"
-# use when upstream acknowledged the vulnerability but does not plan to fix it
-CVE_CHECK_STATUSMAP[upstream-wontfix] = "Ignored"

