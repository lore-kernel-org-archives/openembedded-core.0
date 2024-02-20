Return-Path: <shin.matsunaga@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 129DBC48BC4
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 05:04:02 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.6849.1708405436842762910
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Feb 2024 21:03:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hAqMfA3a;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: shin.matsunaga@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1708405436; x=1739941436;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=d0yerBxoXVbuY1Qcd0JECWdx4oyj6+g5P9ZY+by+aTg=;
  b=hAqMfA3aTTSyt9cDWWzqwrl48rPIk8mfRod/GaV3ReMUv/Ey06fqCzqn
   bexZqGlg2lk7Ahx6whJltWE7xxkqCeNZEmZahyYPXDPJUbqKD7lMKGhP7
   PCZ5yiahrRIcgOBrpnyAwMhA2I/5+m/HmBkb20YeQvXfBOaau2EQrNUs5
   xyQb74cMk57SfaiI26Q1wRWCdJjLeoKfGDFALKyDhHd8rytELy3Qk/kcc
   TKZkv7REDKNPDflvlW9LXOsuUBMy//51U07OV6NM92VbaTmnpai3APYeB
   viKb1CbUdOkbLRIizEgeVWNtPNYkOAx+4tQJhap83gguAShqwOEuvCes3
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="137490167"
X-IronPort-AV: E=Sophos;i="6.06,171,1705330800"; 
   d="scan'208";a="137490167"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 14:03:54 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 4BE1E281233
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Feb 2024 14:03:52 +0900 (JST)
Received: from storage.utsfd.cs.fujitsu.co.jp (storage.utsfd.cs.fujitsu.co.jp [10.118.252.123])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 86C76D7B90
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Feb 2024 14:03:51 +0900 (JST)
Received: by storage.utsfd.cs.fujitsu.co.jp (Postfix, from userid 1068)
	id 596D168E2; Tue, 20 Feb 2024 14:03:51 +0900 (JST)
From: Shinji Matsunaga <shin.matsunaga@fujitsu.com>
To: rybczynska@gmail.com,
	richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org,
	shin.matsunaga@fujitsu.com,
	Shunsuke Tokumoto <s-tokumoto@fujitsu.com>
Subject: [PATCH] cve-check: Modify judgment processing using "=" in version comparison
Date: Tue, 20 Feb 2024 14:03:47 +0900
Message-Id: <20240220050347.9424-1-shin.matsunaga@fujitsu.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Feb 2024 05:04:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195902

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


