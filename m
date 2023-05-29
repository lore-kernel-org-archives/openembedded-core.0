Return-Path: <schitrod@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 973CCC7EE29
	for <webhook@archiver.kernel.org>; Mon, 29 May 2023 08:03:22 +0000 (UTC)
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.web11.45143.1685347392183384502
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 May 2023 01:03:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=FlLHSVmI;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: schitrod@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=3309; q=dns/txt; s=iport;
  t=1685347392; x=1686556992;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=SHMxPQvEFpaU3wWo27/1PdpLRsaI+Jr7NTcg0e3/vLU=;
  b=FlLHSVmIT7zAscFaVp8nDxUTE9uhZyoSHREXe06RRy9mYt/MSKR/ymhR
   ZdG/7pMwTBxpTsGkGEK2ehs8MQNj5Gqa05dAWzfD2STu1cGGylEBIFmpI
   9xDIX5UQwA+JZisuX6J85QNHt3kaRg8idwy8q58TkXUO0VjKGNcInsN4G
   s=;
X-IronPort-AV: E=Sophos;i="6.00,200,1681171200"; 
   d="scan'208";a="64510756"
Received: from rcdn-core-9.cisco.com ([173.37.93.145])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 29 May 2023 08:03:11 +0000
Received: from sjc-ads-7441.cisco.com (sjc-ads-7441.cisco.com [10.30.220.226])
	by rcdn-core-9.cisco.com (8.15.2/8.15.2) with ESMTPS id 34T839x1027917
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 29 May 2023 08:03:10 GMT
Received: by sjc-ads-7441.cisco.com (Postfix, from userid 1812315)
	id DBEA3CC1293; Mon, 29 May 2023 01:03:08 -0700 (PDT)
From: Sanjay Chitroda <schitrod@cisco.com>
To: openembedded-core@lists.openembedded.org, schitrod@cisco.com
Cc: Xiangyu Chen <xiangyu.chen@windriver.com>
Subject: [OE-core][PATCH v2] sysstat: Fix CVE-2023-33204
Date: Mon, 29 May 2023 01:03:02 -0700
Message-Id: <20230529080302.1154687-1-schitrod@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.30.220.226, sjc-ads-7441.cisco.com
X-Outbound-Node: rcdn-core-9.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 May 2023 08:03:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181855

From: Xiangyu Chen <xiangyu.chen@windriver.com>

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-33204
https://ubuntu.com/security/CVE-2023-33204

Upstream Patch:
https://github.com/sysstat/sysstat/commit/954ff2e2673c

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
Signed-off-by: Sanjay Chitroda <schitrod@cisco.com>
---
 .../sysstat/sysstat/CVE-2023-33204.patch      | 46 +++++++++++++++++++
 .../sysstat/sysstat_12.6.2.bb                 |  4 +-
 2 files changed, 49 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/sysstat/sysstat/CVE-2023-33204.patch

diff --git a/meta/recipes-extended/sysstat/sysstat/CVE-2023-33204.patch b/meta/recipes-extended/sysstat/sysstat/CVE-2023-33204.patch
new file mode 100644
index 0000000000..a7b51f3217
--- /dev/null
+++ b/meta/recipes-extended/sysstat/sysstat/CVE-2023-33204.patch
@@ -0,0 +1,46 @@
+From 0764cb56df4a5afdf04980c9eb6735f789f5aa42 Mon Sep 17 00:00:00 2001
+From: Pavel Kopylov <pkopylov@cloudlinux.com>
+Date: Wed, 17 May 2023 11:33:45 +0200
+Subject: [PATCH] Fix an overflow which is still possible for some values.
+
+CVE: CVE-2023-33204
+Upstream-Status: Backport [https://github.com/sysstat/sysstat/commit/954ff2e2673c]
+
+Backport Changes:
+Adopt additional changes as per following merge commit of pull request:
+https://github.com/sysstat/sysstat/commit/6f8dc568e6ab
+
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+Signed-off-by: Sanjay Chitroda <schitrod@cisco.com>
+---
+ common.c | 14 ++++++++------
+ 1 file changed, 8 insertions(+), 6 deletions(-)
+
+diff --git a/common.c b/common.c
+index a3d31a5..138920c 100644
+--- a/common.c
++++ b/common.c
+@@ -447,15 +447,17 @@ int check_dir(char *dirname)
+ void check_overflow(unsigned int val1, unsigned int val2,
+ 		    unsigned int val3)
+ {
+-	if ((unsigned long long) val1 * (unsigned long long) val2 *
+-	    (unsigned long long) val3 > UINT_MAX) {
++	if ((val1 != 0) && (val2 != 0) && (val3 != 0) &&
++		(((unsigned long long)UINT_MAX / (unsigned long long)val1 <
++		(unsigned long long)val2) ||
++		((unsigned long long)UINT_MAX / ((unsigned long long)val1 *
++		(unsigned long long)val2) < (unsigned long long)val3))) {
+ #ifdef DEBUG
+-		fprintf(stderr, "%s: Overflow detected (%llu). Aborting...\n",
+-			__FUNCTION__, (unsigned long long) val1 * (unsigned long long) val2 *
+-			(unsigned long long) val3);
++		fprintf(stderr, "%s: Overflow detected (%u,%u,%u). Aborting...\n",
++			__FUNCTION__, val1, val2, val3);
+ #endif
+ 	exit(4);
+-		}
++	}
+ }
+ 
+ #ifndef SOURCE_SADC
diff --git a/meta/recipes-extended/sysstat/sysstat_12.6.2.bb b/meta/recipes-extended/sysstat/sysstat_12.6.2.bb
index f9e5778e76..b5014eaefb 100644
--- a/meta/recipes-extended/sysstat/sysstat_12.6.2.bb
+++ b/meta/recipes-extended/sysstat/sysstat_12.6.2.bb
@@ -2,6 +2,8 @@ require sysstat.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=a23a74b3f4caf9616230789d94217acb"
 
-SRC_URI += "file://0001-configure.in-remove-check-for-chkconfig.patch"
+SRC_URI += "file://0001-configure.in-remove-check-for-chkconfig.patch \
+            file://CVE-2023-33204.patch \
+            "
 
 SRC_URI[sha256sum] = "3e77134aedaa6fc57d9745da67edfd8990e19adee71ac47196229261c563fb48"
-- 
2.35.6


