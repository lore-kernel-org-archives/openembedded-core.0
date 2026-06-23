Return-Path: <adongare@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 143B2CD98F2
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 11:31:03 +0000 (UTC)
Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18972.1782214253641104153
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 04:30:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=K6jgiD1P;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: adongare@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3378; q=dns/txt;
  s=iport01; t=1782214254; x=1783423854;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=L9B2CVLH4rPL9/xHGV7ail29SFMVeTAFrkYj4a2yYiw=;
  b=K6jgiD1PAasin+/40lP2LMno73GuHGTiJw/L8NJ0mUISCFmmxEfVVmS3
   zYSPFYCSAEnPxglShDP9xVe5eaxcyxUmtECtL0jR2rWeZB3J5znbf0gVo
   xZ3ogJRQXnR39LLdbGKb6fQed/wXC0zSNopOHGqXDOkvA11sP60Um9WFe
   UAZZMv7vYF7MZcDfVBCbKQmV7dW+jeRVFMiqTI8Aa7yLWt5Ca9it/ptkh
   20XTJH+drPoZ8qcnG97Ij0JKHtudYFOf8MFVHqoqP7FPi8s9JwE6LM3C5
   V89/bVqVTFezURatsp2jSfcbc17el7OtQzeIIRachUkj7tZ6deWFvG7Xl
   A==;
X-CSE-ConnectionGUID: dRg6A21CRmu7grWYtT0luA==
X-CSE-MsgGUID: kft/hb0zRLuYhdue+1nJww==
X-IPAS-Result: =?us-ascii?q?A0BLAgCDbTpq/5H/Ja1aglmCV3RfQkkDhFSRdAOeGxSBa?=
 =?us-ascii?q?g8BAQEPRA0EAQGFBgKNSgImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDYZaAQIBAyMPATQSEBwDAQIDAhQSAgIrIwgZgwIBgnMCARGcV?=
 =?us-ascii?q?pcXGjd6gTKBAYNoAkNQ2ywBCxQBBYEFLoU/gxwBhQJbGAGEfCcbG4FygRWDa?=
 =?us-ascii?q?YEFgVwCgSOBDYMLgmoEgiKBDIFaGAaJY4UmSIECHANZLAFVEw0KCwcFgWYDN?=
 =?us-ascii?q?RIqFW4yHYEjPhc0WBsHBYEdgW6BBIUCIx8DOX+BP4EkZGYVMDWBAQERHwqBK?=
 =?us-ascii?q?wMLGA1IESw3FBsEPQFuB4xaFw+Bbk8BehMBKyCCDJM4kj6hDwoog3WMIZU6G?=
 =?us-ascii?q?jOFW51hhzALmH2OCpZQhGiBaDyBWXAVgyIJShkPjjiDa4QHgQzEfiQ1CwMvA?=
 =?us-ascii?q?QEHAgcOAwuBaJAmgVcBAQ?=
IronPort-Data: A9a23:rgG3+aCXyZTP3RVW/3jiw5YqxClBgxIJ4kV8jS/XYbTApDgggWEBy
 WIWDGmEbPfcYzanfYh3YYy18EgPsZ7cnNRqOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZvCCeA+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jX2thh
 fuo+5eBYAH/gGYtWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TEz89hUmhsZKYi//soDntxx
 OAkcDQQR0XW7w626OrTpuhEnM8vKozveYgYoHwllWGfBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGYyBPjDS0Un1lM/AZ45muihnHTXeDxDo1XTrq0yi4TW5FAggOGwa4qLJrRmQ+1WkFrfp
 mie7V7dHyAaOMGSimOD0G2z07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflgQXV9wVF6gx7xuAj/KEpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOf9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:VOM1x6/oQHl4kMEvpdFuk+AGI+orL9Y04lQ7vn2ZhyY7TiX+rb
 HJoB17726StN9/YhAdcLy7VZVoBEmsl6KdgrNhWYtKPjOHhILAFugLhuHfKn/bakjDH4Vmu5
 uIHZITNDTYNykCsS+D2njaL/8QhP+a7auvmeDSi11pTQ1sduVcyj0RMHfiLqWzLzM2f6bQ0/
 Gnl7F6mwY=
X-Talos-CUID: 9a23:oVkFWmN/T/HRUe5DVBNoqmdOQ+sfd2CCw23vElOEUWJ0YejA
X-Talos-MUID: =?us-ascii?q?9a23=3AulazLA1PlWjINQRUq/MzjWrNLDUj4KqyT0AHyYc?=
 =?us-ascii?q?8n9S1NSBtNnTEihaoXdpy?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,220,1774310400"; 
   d="scan'208";a="498153864"
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 23 Jun 2026 11:30:53 +0000
Received: from sjc-ads-4153.cisco.com (sjc-ads-4153.cisco.com [171.70.54.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id D7077180001EA;
	Tue, 23 Jun 2026 11:30:52 +0000 (GMT)
Received: by sjc-ads-4153.cisco.com (Postfix, from userid 1870532)
	id 339D6CC124B; Tue, 23 Jun 2026 04:30:52 -0700 (PDT)
From: "Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco)" <adongare@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com, to@cisco.com,
	Anil Dongare <adongare@cisco.com>
Subject: [OE-core] [scarthgap] [PATCH 6/8] cups: Fix CVE-2026-39314
Date: Tue, 23 Jun 2026 04:30:30 -0700
Message-ID: <20260623113037.28968-6-adongare@cisco.com>
X-Mailer: git-send-email 2.44.4
In-Reply-To: <20260623113037.28968-1-adongare@cisco.com>
References: <20260623113037.28968-1-adongare@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4153.cisco.com [171.70.54.174];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.54.174, sjc-ads-4153.cisco.com
X-Outbound-Node: rcdn-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 11:31:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239356

From: Anil Dongare <adongare@cisco.com>

Pick the upstream patch [1] as mentioned in [2].

[1] https://github.com/OpenPrinting/cups/commit/928a86b1b794f738f0a3dc87561b2e054bff7ce4
[2] https://security-tracker.debian.org/tracker/CVE-2026-39314

Signed-off-by: Anil Dongare <adongare@cisco.com>
---
 meta/recipes-extended/cups/cups.inc           |  1 +
 .../cups/cups/CVE-2026-39314.patch            | 56 +++++++++++++++++++
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-39314.patch

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 2e6bf698e0..7bfa890b3d 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -29,6 +29,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/cups-${PV}-source.tar.gz \
            file://CVE-2026-34980-regression_p2.patch \
            file://CVE-2026-34979.patch \
            file://CVE-2026-34990.patch \
+           file://CVE-2026-39314.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/OpenPrinting/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/CVE-2026-39314.patch b/meta/recipes-extended/cups/cups/CVE-2026-39314.patch
new file mode 100644
index 0000000000..2ebefb3bc5
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2026-39314.patch
@@ -0,0 +1,56 @@
+From 65c463ada188915d6700d92ce48a9a14949ca413 Mon Sep 17 00:00:00 2001
+From: Michael R Sweet <msweet@msweet.org>
+Date: Sun, 5 Apr 2026 10:45:25 -0400
+Subject: [PATCH] Range check job-password-supported.
+
+CVE: CVE-2026-39314
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/928a86b1b794f738f0a3dc87561b2e054bff7ce4]
+
+Backport Changes:
+- Rebase CHANGES.md placement and cups/ppd-cache.c context to the CUPS 2.4.11
+  source carried by this recipe.
+
+(cherry picked from commit 928a86b1b794f738f0a3dc87561b2e054bff7ce4)
+Signed-off-by: Anil Dongare <adongare@cisco.com>
+---
+ CHANGES.md       | 1 +
+ cups/ppd-cache.c | 4 ++--
+ 2 files changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/CHANGES.md b/CHANGES.md
+index 4eeebef..082b9f7 100644
+--- a/CHANGES.md
++++ b/CHANGES.md
+@@ -15,6 +15,7 @@ Changes in CUPS v2.4.10 (2024-06-18)
+   job's options string.
+ - CVE-2026-34990: The scheduler incorrectly allowed local certificates over the
+   loopback interface.
++- Fixed the range check for job password strings.
+ - Fixed error handling when reading a mixed `1setOf` attribute.
+ - Fixed scheduler start if there is only domain socket to listen on (Issue #985)
+ 
+diff --git a/cups/ppd-cache.c b/cups/ppd-cache.c
+index e750fcc..08e0db8 100644
+--- a/cups/ppd-cache.c
++++ b/cups/ppd-cache.c
+@@ -1,7 +1,7 @@
+ /*
+  * PPD cache implementation for CUPS.
+  *
+- * Copyright © 2022-2024 by OpenPrinting.
++ * Copyright © 2022-2026 by OpenPrinting.
+  * Copyright © 2010-2021 by Apple Inc.
+  *
+  * Licensed under Apache License v2.0.  See the file "LICENSE" for more
+@@ -3432,7 +3432,7 @@ _ppdCreateFromIPP2(
+   * Password/PIN printing...
+   */
+ 
+-  if ((attr = ippFindAttribute(supported, "job-password-supported", IPP_TAG_INTEGER)) != NULL)
++  if ((attr = ippFindAttribute(supported, "job-password-supported", IPP_TAG_INTEGER)) != NULL && ippGetInteger(attr, 0) > 0)
+   {
+     char	pattern[33];		/* Password pattern */
+     int		maxlen = ippGetInteger(attr, 0);
+-- 
+2.43.7
+
-- 
2.44.4


