Return-Path: <sudumbha@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68C4EC43458
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 05:45:29 +0000 (UTC)
Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2762.1783575925774701941
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 22:45:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=hcJu8ZSv;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: sudumbha@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1639; q=dns/txt;
  s=iport01; t=1783575925; x=1784785525;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Lg8dCfcEDquet2kJ/LGHkM6xBeu3M7cIG3iUq6CQ3aY=;
  b=hcJu8ZSvuHmzX+rqmclHG+lAIiV3Lpc4Ys5gvfqVbfk9N+lp1ph4h69N
   vpHHbsXCDIL5kTZ2i+2iEcPVIBktAqa051QOBdzF0RAqGmTj9SzDJmtHa
   UpDJo2zBX/OS1PUr1jIEXZnjDc41j4qQff0EF6IcXQ88FvKn4iER5QPaZ
   yGeAdlMPuNUs04gcXxZ1n1Vs1IiPujg24+lQcAMu8HyJwVPGNwxw1bwu7
   ZcBYpF4ZgugnIwtdwshzNo0Coo0ToWmhbO41Y/zcUSWUbxFI752PCNK8e
   hsLafO+BFzkTdXuZWj9Hobpq9Pu0/0n9tJYNJIVZ14DtvNoh/WhU3hMhE
   Q==;
X-CSE-ConnectionGUID: PX6c7KDmRtS5z2wjT9vrXQ==
X-CSE-MsgGUID: 3Gbc58OtTvGjjlrU0AVw8Q==
X-IPAS-Result: =?us-ascii?q?A0AxAwC+NE9q/43/Ja1aglmCV3RfQkmHYot3AU+CIaAcD?=
 =?us-ascii?q?wEBAQ89FAQBAZJUAiY3Bg4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4Thk8NhwgLARgBXVxEgwIBgnMCARG3Bho3gXkzgQGDCR8BPwJDUNsuAQsUA?=
 =?us-ascii?q?YE4hT+IH3MBhHwnGxuBcoR+ER+CMQGBKCFlhXgEgiJ6EoF4hw+IWUiBHgNZL?=
 =?us-ascii?q?AFVEw0KCwcFgWYDNRIqFW4yHYEjPheBDBsHBYEdgV+BAoR5Ix8DOX+BL3VKe?=
 =?us-ascii?q?S2BARIeCoFSghY6AwsYDUgRLDcUGwQ+bgeNPBcPgj6BDisBIIIMkyUJTJF8g?=
 =?us-ascii?q?TWfWgoog3WMIZU6GjOqbJkIiRyEbpZQhGmBfiaBRwsHcBWDIglKGQ+UIoMUy?=
 =?us-ascii?q?UckNQIBOgIHAgcOAwuRaIF+AQE?=
IronPort-Data: A9a23:unkHbqtIXUlAxlm0wByxr0lfY+fnVAdfMUV32f8akzHdYApBsoF/q
 tZmKW7TPfnbazfzfI90b4nn9khX68CByNAyGwVrqXs3EHgagMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrav666yEgiclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZTdJ5xYuajhKs/3b+Es21BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIwwtYpCj5t2
 fkiNAtQfEqchd7n3qiLc7w57igjBJGD0II3oHpsy3TdSP0hW52GG/mM7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwtOYH49tL/Aan3XaCBUtVefpaMf6GnIxws327/oWDbQUoHSG5QJxBfA/
 goq+UyiLRsRaYy41Qab3XCugvXyxQrFR9IrQejQGvlCxQf7KnYoIBoOWF22pPO0hkKzV5dUL
 FYZ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwBuGxqyR50OSAXIJC2YdLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWra1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:6bVzlKnqIsr3ot4tG3kltPHEBVPpDfIc3DAbv31ZSRFFG/Fw8P
 re/sjzuiWbtN98YhwdcLO7Scq9qBHnlKKdiLN5VdzJYOCMggSVxe9ZgbcKuweBJwTOsshAyK
 xnb69yTPf0DVR8kILGxTPQKadE/DFCm5rY4ts3CBxWPGVXV50=
X-Talos-CUID: =?us-ascii?q?9a23=3Apolj6mv/o5Fpz0XVg/e2M7T36IsdQiPWk1T8JnW?=
 =?us-ascii?q?kMjt7EqKXdQ6O4pNdxp8=3D?=
X-Talos-MUID: 9a23:r1N0PAbim7uLPuBT7BDmj2wyE9tU/YusCkQXrM0vhdbUDHkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,154,1779148800"; 
   d="scan'208";a="506942900"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 09 Jul 2026 05:45:24 +0000
Received: from sjc-ads-12007.cisco.com (sjc-ads-12007.cisco.com [171.70.97.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id C790D180001AB
	for <openembedded-core@lists.openembedded.org>; Thu,  9 Jul 2026 05:45:24 +0000 (GMT)
Received: by sjc-ads-12007.cisco.com (Postfix, from userid 1840713)
	id 3AC57CB6A93; Wed,  8 Jul 2026 22:45:24 -0700 (PDT)
From: "Sudhir Dumbhare -X (sudumbha - E INFOCHIPS PRIVATE LIMITED at Cisco)" <sudumbha@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH] socat: upgrade 1.8.1.1 -> 1.8.1.3
Date: Wed,  8 Jul 2026 22:44:33 -0700
Message-ID: <20260709054433.2568553-2-sudumbha@cisco.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-12007.cisco.com [171.70.97.7];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.97.7, sjc-ads-12007.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 05:45:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240524

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


