Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C301C02180
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 11:45:23 +0000 (UTC)
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.web11.18520.1736939356668178390
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 03:09:17 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport header.b=M9PHD18t;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: mmeerasa@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2509; q=dns/txt; s=iport;
  t=1736939356; x=1738148956;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Ss2Yk50qFI5D9Sqq3x8fqt0LPL9bUbHVVHH36gYlnnE=;
  b=M9PHD18t/Hmg3k21/O7LofvfC90eQ42ZHlZD9id0BJGUojvwOTTTSGQC
   VKgrsfLl7na8RAi1cYfsjxcyWgoEp1OTlj9J+W2pKppdJK/MS0fzGTDkC
   B/TD6Su2Y70F3P0x2qJkRhyRPVOBsHvvdMBWe/wOEE4nPRNM6Tc9PrFko
   A=;
X-CSE-ConnectionGUID: RtA2GAdJTLar1oe4YulHag==
X-CSE-MsgGUID: LHeHSmQtSr2FQEi5e9r1xg==
X-IPAS-Result: =?us-ascii?q?A0A5AAASlodn/5X/Ja1aHQEBAQEJARIBBQUBgX8IAQsBg?=
 =?us-ascii?q?kp2WkJIA4xviVGeG4ElA1YPAQEBDzkLBAEBhQeKdQImNAkOAQIEAQEBAQMCA?=
 =?us-ascii?q?wEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBDhOFew2GXTYBGAEtgQxEgwEBgmQCA?=
 =?us-ascii?q?REGsnKCLIEBgygBgVLZOIFtgUgBjUlwhHcnFQaCDYJQgi2CYQMBgiuFdwSHZ?=
 =?us-ascii?q?oZmhxyRBUiBIQNZLAFVEw0KCwcFgXIDOAwLMBWBTEQ3gkZpSTcCDQI1gh58g?=
 =?us-ascii?q?iuEXIRHYC8DAwMDgzqFYoIUhk5AAwsYDUgRLDcUGwY+bgebOgE8g3EBDm0TK?=
 =?us-ascii?q?gIEHVqBMRGTUpF1oQOEJYwYlS4aM4QEpk+YfIJYoFWBGiuEO4FnPIFZMxoIG?=
 =?us-ascii?q?xWDIglJGQ+SG79ZIjUCDC4CBwsBAQMJkWsBAQ?=
IronPort-Data: A9a23:7TcRN6xYCDXbxHARezl6t+dmxyrEfRIJ4+MujC+fZmUNrF6WrkVWn
 2oaDzvSbP+MYjbyKY8gOoy+ph4EvZbTn9VqTQJq+FhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCea/lH1b+CJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 ImaT/H3Ygf/hmYtaz9MsMpvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJHsqFNc30+pVPUVH7
 6UfJWw8cxSjju3jldpXSsE07igiBNPgMIVavjRryivUSK98B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2cMnWjOX9PYH46tOKti3TleiZRgFmUvqEwpWPUyWSd1ZC3YYCJI4PQHpU9ckCwg
 kLL31/8Ow0hLoax8BeEr3/9nLbfknauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8gUmkVvpbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPAXC4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rEnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:doBoNaELp+lCXiy1pLqE48eALOsnbusQ8zAXPo5KJiC9Ffbo8v
 xG88576faZslsssRIb6LK90cu7IU80nKQdieJ6AV7IZmfbUQWTQL2KlbGSoAEJ30bFh4lgPW
 AKSdkbNOHN
X-Talos-CUID: 9a23:L+z9EW83MAi3KOu6RuCVv3QIM5oKW3H/8FPZORa/BDpYVbm1QFDFrQ==
X-Talos-MUID: 9a23:Qs/P4wXg72rhnqzq/BvMiRFZMf502L70JnkgkMgL6tPdJSMlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.12,206,1728950400"; 
   d="scan'208";a="292417238"
Received: from rcdn-l-core-12.cisco.com ([173.37.255.149])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 15 Jan 2025 11:09:15 +0000
Received: from sjc-ads-3744.cisco.com (sjc-ads-3744.cisco.com [171.68.250.191])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-12.cisco.com (Postfix) with ESMTPS id BE9D8180001DB;
	Wed, 15 Jan 2025 11:09:15 +0000 (GMT)
Received: by sjc-ads-3744.cisco.com (Postfix, from userid 1839048)
	id 51BEECC1293; Wed, 15 Jan 2025 03:09:15 -0800 (PST)
From: Mohamed Meera Sahib <mmeerasa@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Mohamed Meera Sahib <mmeerasa@cisco.com>
Subject: [OE-core] [master] [PATCH] db 5.3.28: Ignore multiple CVEs
Date: Wed, 15 Jan 2025 03:08:56 -0800
Message-ID: <20250115110857.1372278-1-mmeerasa@cisco.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
X-Outbound-SMTP-Client: 171.68.250.191, sjc-ads-3744.cisco.com
X-Outbound-Node: rcdn-l-core-12.cisco.com
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 11:45:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209894

Analysis:
- Unspecified vulnerability in the various components of Oracle
  Berkeley Db was identified as potentially exploitable without
  authentication. Later these were closed by the Critical Patch
  Update (CPU).

Reference:
[1] https://www.oracle.com/security-alerts/cpujul2015.html
[2] https://www.oracle.com/security-alerts/cpuapr2016v3.html
[3] https://www.oracle.com/security-alerts/cpujul2020.html

Signed-off-by: Mohamed Meera Sahib <mmeerasa@cisco.com>
---
 meta/recipes-support/db/db_5.3.28.bb | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/meta/recipes-support/db/db_5.3.28.bb b/meta/recipes-support/db/db_5.3.28.bb
index a7d061e0da..d93e77a1ee 100644
--- a/meta/recipes-support/db/db_5.3.28.bb
+++ b/meta/recipes-support/db/db_5.3.28.bb
@@ -120,3 +120,20 @@ BBCLASSEXTEND = "native nativesdk"
 # many configure tests are failing with gcc-14
 CFLAGS += "-Wno-error=implicit-int -Wno-error=implicit-function-declaration"
 BUILD_CFLAGS += "-Wno-error=implicit-int -Wno-error=implicit-function-declaration"
+
+# The risk matrix of Oracle Berkeley Db was published in July 2015 by which many vulnerabilities
+# in different Oracle products were identified.
+# https://www.oracle.com/security-alerts/cpujul2015verbose.html#DB
+# The Oracle Berkeley Db issued the Critical Patch Update Advisory in July 2015
+# which determined the status of the vulnerability whether applicable or not.
+# https://www.oracle.com/security-alerts/cpujul2015.html#AppendixDB
+# Apart from this, different CPUs change status of the vulnerabilities e.g.
+# CVE-2020-2981: https://www.oracle.com/security-alerts/cpujul2020.html
+# CVE-2016-0682, CVE-2016-0689, CVE-2016-0692, CVE-2016-0694, CVE-2016-3418: https://www.oracle.com/security-alerts/cpuapr2016v3.html
+
+CVE_STATUS_GROUPS = "CVE_STATUS_INGR"
+CVE_STATUS_INGR = "CVE-2015-2583 CVE-2015-2624 CVE-2015-2626 CVE-2015-2640 CVE-2015-2654 CVE-2015-2656 CVE-2015-4754 CVE-2015-4764 \
+CVE-2015-4774 CVE-2015-4775 CVE-2015-4776 CVE-2015-4777 CVE-2015-4778 CVE-2015-4779 CVE-2015-4780 CVE-2015-4781 CVE-2015-4782 \
+CVE-2015-4783 CVE-2015-4784 CVE-2015-4785 CVE-2015-4786 CVE-2015-4787 CVE-2015-4788 CVE-2015-4789 CVE-2015-4790 CVE-2020-2981 \
+CVE-2016-0682 CVE-2016-0689 CVE-2016-0692 CVE-2016-0694 CVE-2016-3418"
+CVE_STATUS_INGR[status] = "fixed-version: The Critical Patch Update of Oracle Berkeley DB discovers these vulnerabilities may not be remotely exploitable without authentication."
-- 
2.44.1


