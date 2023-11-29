Return-Path: <shin.matsunaga@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30C03C4167B
	for <webhook@archiver.kernel.org>; Wed, 29 Nov 2023 02:19:30 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.18985.1701224363831192716
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Nov 2023 18:19:24 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: shin.matsunaga@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="141158694"
X-IronPort-AV: E=Sophos;i="6.04,234,1695654000"; 
   d="scan'208";a="141158694"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 11:19:21 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 35DE9D6187
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 11:19:19 +0900 (JST)
Received: from storage.utsfd.cs.fujitsu.co.jp (storage.utsfd.cs.fujitsu.co.jp [10.118.252.123])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6F335D3F26
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 11:19:18 +0900 (JST)
Received: by storage.utsfd.cs.fujitsu.co.jp (Postfix, from userid 1068)
	id 4557E964E; Wed, 29 Nov 2023 11:19:18 +0900 (JST)
From: Shinji Matsunaga <shin.matsunaga@fujitsu.com>
To: rybczynska@gmail.com,
	richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org,
	shin.matsunaga@fujitsu.com,
	Shunsuke Tokumoto <s-tokumoto@fujitsu.com>
Subject: [PATCH] cve-check: Modify judgment processing using "=" in version comparison
Date: Wed, 29 Nov 2023 11:19:15 +0900
Message-Id: <20231129021915.21212-1-shin.matsunaga@fujitsu.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 02:19:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191422

Judgment processing of vulnerable using "=" compares characters as strings rather than numbers,
and misjudges "cases that do not match in strings but do match in numbers" as "Patched".
(e.g. PV = "1.2.0" and Vulnerabilities Affected Versions (registered with NVD) = "1.2")

Therefore, if the comparison operator used in the judgment processing of vulnerable is "=",
add numeric comparison processing.

Signed-off-by: Shinji Matsunaga <shin.matsunaga@fujitsu.com>
Signed-off-by: Shunsuke Tokumoto <s-tokumoto@fujitsu.com>
---
 meta/classes/cve-check.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 5191d04303..086d87687f 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -375,6 +375,7 @@ def check_cves(d, patched_cves):
                         try:
                             vulnerable_start =  (operator_start == '>=' and Version(pv,suffix) >= Version(version_start,suffix))
                             vulnerable_start |= (operator_start == '>' and Version(pv,suffix) > Version(version_start,suffix))
+                            vulnerable_start |= (operator_start == '=' and Version(pv,suffix) == Version(version_start,suffix))
                         except:
                             bb.warn("%s: Failed to compare %s %s %s for %s" %
                                     (product, pv, operator_start, version_start, cve))
-- 
2.42.0


