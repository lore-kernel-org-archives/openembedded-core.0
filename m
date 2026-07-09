Return-Path: <sudumbha@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68EBBC43458
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 05:40:49 +0000 (UTC)
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2710.1783575636032289158
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 22:40:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=ePkoccVu;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: sudumbha@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1639; q=dns/txt;
  s=iport01; t=1783575636; x=1784785236;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Lg8dCfcEDquet2kJ/LGHkM6xBeu3M7cIG3iUq6CQ3aY=;
  b=ePkoccVukktNqQK6q8nVrldZLMtb65805t0Fw/48GKZGwvFk8vcU7hyN
   AAqvy/uEQd/BHuJIQm1FSdBWjvRHolnHO/yGOjzzQ907FaRR2VZMMHv2P
   gqI/ddejBgM/zfdQE3pxjM0tQ7JNjF/HmaNtLhKjrxU7E9Dk9NPKQXf+g
   jRGEMvvocHV0XKm2v5dKgNKiRx2w+n3ls0ED4vfrgwv3Zycfx0gA+Kat3
   Jw9CS+mhCQdi6AURSuS61IypcpqJQcV3u4jOAL+P8r/PjjkiztiRH24sd
   5lwP0u88ZKPWS0/kxsDFTonEYr8SGte4GowyIybztueAU5m4YffkclKWY
   Q==;
X-CSE-ConnectionGUID: OaE6myG2QOCKx2wO9atGPQ==
X-CSE-MsgGUID: XMq6FeaSR0OBHZgjqey1MA==
X-IPAS-Result: =?us-ascii?q?A0AxAwAbM09q/5H/Ja1aglmCV3RfQkmHYot3AU+CIaAcD?=
 =?us-ascii?q?wEBAQ89FAQBAZJUAiY3Bg4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4Thk8NhwgLARgBXVxEgwIBgnMCARG3IBo3gXkzgQGDCR8BPwJDUNsuAQsUA?=
 =?us-ascii?q?YE4hT+IH3MBhHwnGxuBcoR+ER+CMQGBKCFlhXgEgiJ6EoF4hw+IWUiBHgNZL?=
 =?us-ascii?q?AFVEw0KCwcFgWYDNRIqFW4yHYEjPheBDBsHBYEdgV+BAoR5Ix8DOX+BL3VKe?=
 =?us-ascii?q?S2BARIeCoFSghY6AwsYDUgRLDcUGwQ+bgeNPBcPgj6BDisBIIIMkyUJTJF8g?=
 =?us-ascii?q?TWfWgoog3WMIZU6GjOqbJkIiRyEbpZQhGmBfiaBRwsHcBWDIglKGQ+UIoMUy?=
 =?us-ascii?q?UckNQIBOgIHAgcOAwuRaIF+AQE?=
IronPort-Data: A9a23:5mUJg6MfMtvs6aHvrR30lsFynXyQoLVcMsEvi/4bfWQNrUoh1GFTn
 DYdDTjSafqPY2ryedAkbIzlpEhT6sSBz9ZgSXM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeaphyFTmE+kvF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WV7lV
 e/a+ZWFZgf6g24sawr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj69JnIR8zLKJCw8FcInEU6
 ttJISwiVinW0opawJrjIgVtrt4oIM+uOMYUvWttiGmJS/0nWpvEBa7N4Le03h9p2ZsIRqmYP
 ZdEL2MzMXwsYDUXUrsTIIkjkPqtjHn2WzZZs1mS46Ew5gA/ySQsiOazaIWFIYTiqcN9rmOB+
 EzL9l/DWjYwFO6QyyOI4yuJr7qa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVul/4waXx++Ms0CSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXMIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:PdAMpajgVHNObuv1VrRHzFXQK3BQXuoji2hC6mlwRA09TyX+rb
 HNoB1173HJYVoqNU3I+urwW5VoI0m8yXcd2+B4Vt2ftWLd11dAQrsP0WKb+V3dMhy70PJB3q
 F9dKU7ItjxAV9myfve2mCDYrMdKB3tytHOuQ8YpE0dKT1XVw==
X-Talos-CUID: 9a23:AGHWum+W4hQYIb9FxAuVv2kdN54gY1KH9VD7AF/iFkE4QaG6cWbFrQ==
X-Talos-MUID: 9a23:iLmLwwQYrDDdQ/URRXTcoSg8Gsph2J72L2oto5oEosSVbAlZbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,154,1779148800"; 
   d="scan'208";a="506607830"
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 09 Jul 2026 05:40:35 +0000
Received: from sjc-ads-12007.cisco.com (sjc-ads-12007.cisco.com [171.70.97.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id 2D4BA180001DB
	for <openembedded-core@lists.openembedded.org>; Thu,  9 Jul 2026 05:40:35 +0000 (GMT)
Received: by sjc-ads-12007.cisco.com (Postfix, from userid 1840713)
	id B2056CB6A93; Wed,  8 Jul 2026 22:40:34 -0700 (PDT)
From: "Sudhir Dumbhare -X (sudumbha - E INFOCHIPS PRIVATE LIMITED at Cisco)" <sudumbha@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][master][PATCH] socat: upgrade 1.8.1.1 -> 1.8.1.3
Date: Wed,  8 Jul 2026 22:39:50 -0700
Message-ID: <20260709053949.2422283-2-sudumbha@cisco.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-12007.cisco.com [171.70.97.7];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.97.7, sjc-ads-12007.cisco.com
X-Outbound-Node: rcdn-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 05:40:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240523

From: Sudhir Dumbhare <sudumbha@cisco.com>

According to [1]:
this upgrade includes the fix for Socat security advisory 10, CVE-2026-56123.
The issue is a possible heap overflow in the SOCKS5 client code that can be
triggered by connecting to a malicious SOCKS5 server with knowledge of details
about the client binary code. It also introduced Test: SOCKS5_OVERFL as well.

Version 1.8.1.3 also fixes a false positive in the SOCKS5_OVERFL regression
test on platforms with a non-bash default shell.

[1] http://www.dest-unreach.org/socat/CHANGES
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-56123

Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
---
 .../socat/{socat_1.8.1.1.bb => socat_1.8.1.3.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/socat/{socat_1.8.1.1.bb => socat_1.8.1.3.bb} (94%)

diff --git a/meta/recipes-connectivity/socat/socat_1.8.1.1.bb b/meta/recipes-connectivity/socat/socat_1.8.1.3.bb
similarity index 94%
rename from meta/recipes-connectivity/socat/socat_1.8.1.1.bb
rename to meta/recipes-connectivity/socat/socat_1.8.1.3.bb
index e662c79a75..636c75b117 100644
--- a/meta/recipes-connectivity/socat/socat_1.8.1.1.bb
+++ b/meta/recipes-connectivity/socat/socat_1.8.1.3.bb
@@ -13,7 +13,7 @@ SRC_URI = "http://www.dest-unreach.org/socat/download/socat-${PV}.tar.bz2 \
            file://0001-fix-compile-procan.c-failed.patch \
 "
 
-SRC_URI[sha256sum] = "5ebc636b7f427053f98806696521653a614c7e06464910353cbf54e2327adc1b"
+SRC_URI[sha256sum] = "25bc6476292b2e614220989c77b0b6fca87bb2525d9747b31a6639b1fb602418"
 
 inherit autotools
 
-- 
2.51.0


