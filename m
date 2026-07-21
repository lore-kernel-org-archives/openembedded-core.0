Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67C5FC44536
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 17:42:48 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29029.1784655767761020105
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2026 10:42:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=JZeOdTWv;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3144; q=dns/txt;
  s=iport01; t=1784655767; x=1785865367;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=UdTF08qPa//LT7srbfR7kRrnQQWD4jRXXmqXSE5A5go=;
  b=JZeOdTWv9hPVT1bs0IxWaQNpswrjn7NB8TpyQi6/+W0XYINJsVCtU10W
   d8j3QuygIxKn+Nawez+T2MfXuN3acD3eFub1jjvDVIVGTPdQXs4LN95nR
   wYEkdXvl7ngWfUpfIRHU8oaAghDc5IeqQ0R6/4By63qf5FWRaRTm1O/Db
   3MaCo+2IHn3IpvO0nYuyDZTURLPiSEApvgeyh4+0RB0TJThkjR8zz04tF
   JPoU7dtCGX6dPVhiEOMakdrNmDZS340KSzL8UtB+VQ7ObuJE4Aa09yKOG
   AuY39Tuk4uKhyD28e3uqPU/dRX+W4SWvsCcr5j4dbXMJYM/j45d5UbRDK
   g==;
X-CSE-ConnectionGUID: fbqEEhZZRvmUJdpUHkTYgQ==
X-CSE-MsgGUID: VVCiEqm2SMGfRbRH58S+4A==
X-IPAS-Result: =?us-ascii?q?A0BLAgD/rl9q/5T/Ja1aglmCV3RfQkkDhFSPUoIhA4ETn?=
 =?us-ascii?q?QgUgWoPAQEBD0QNBAEBhQUCjVcCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBB?=
 =?us-ascii?q?QEBAQIBBwWBDhOGTw2GWgECAQMjDwE0IhwDAQIDAhQSAgIrIwgRCIMCAYJ0A?=
 =?us-ascii?q?xGoZ5cXGjd6gTKBAYNoAkNQ2y4BCxQBgQouhT+DHQGFAlwYAYR8JxsbgXKBF?=
 =?us-ascii?q?YJzdoEFgVwCgSOBDYMLgmoEgiKBDIFaGAaEb4IGg2+FK0iBAhwDWSwBVRMNC?=
 =?us-ascii?q?gsHBYFmAzUSKhVuMh2BIz4XNFgbBwWBHYEugQKEbiMfAzl/gS91SnctahIXg?=
 =?us-ascii?q?SaCFIE6AlUDCxgNSBEsNxQZBD0BbgeNVCOBcU8BPFEBK4IskyWSTqESCiiDd?=
 =?us-ascii?q?YwhlToaM4VbnWGHMAuYfY4KllCEaYFoPIFZcBWDIglKGQ+OOINrhAeBDMcmP?=
 =?us-ascii?q?DULAy8BAQcCBw4DC4FokCaBWAEB?=
IronPort-Data: A9a23:ymcYDaOwJSICdXzvrR30lsFynXyQoLVcMsEvi/4bfWQNrUok0jNSy
 zQeX2CPa6mMZWH9KIgibNvi8U0GuJ6AyYVhG3M5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeaphyFTmE+kvF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WV7lV
 e/a+ZWFZgf6gWcsaAr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj6/tkFWwbPb8qwPhyPENC7
 cE4Kww8YSnW0opawJrjIgVtrt4oIM+uOMYUvWttiGiAS/0nWpvEBa7N4Le03h9p2ZsIRqmYP
 ZdEL2MzPHwsYDUXUrsTIJ4zkf2hmnn4WzZZs1mS46Ew5gA/ySQsieO2boeOJYTiqcN9oHizp
 0/f+j7CJz4UDtal6WfVyTHwr7qa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVul/4waXx++NukCSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXPIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:6ByGm6ilH+JcNxIRSUEMPtHGNHBQXvgji2hC6mlwRA09TyX+rb
 HIoB17726RtN9/Yh8dcLy7VZVoBEmslqKdgrNhWItKIjOGhILAFugLhuHfKn/bak/DH4Vmup
 uIHZITNDSJNzhHpPe/xhWkGNA9x9TC2qWpieDCi0pJd2hRGsddB8MTMHfiLqWwLzM2fKYEKA
 ==
X-Talos-CUID: =?us-ascii?q?9a23=3Ab5xyuWq5zfGPINcb8lf0ZNfmUc4va1DwzEXiGVG?=
 =?us-ascii?q?9NERlUIC1SmOh95oxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AE6USIwzNPg7c8d21ZV0gmPuPd1yaqJqQI0EgiJB?=
 =?us-ascii?q?cgOyrOxZ6ARfA3A/0HqZyfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,177,1779148800"; 
   d="scan'208";a="513365370"
Received: from rcdn-l-core-11.cisco.com ([173.37.255.148])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 21 Jul 2026 17:42:46 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-11.cisco.com (Postfix) with ESMTPS id 8F7F51800014A
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 17:42:46 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id B1867CC037D; Tue, 21 Jul 2026 23:12:44 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH v2 7/8] cups: fix CVE-2026-39314
Date: Tue, 21 Jul 2026 23:12:16 +0530
Message-Id: <20260721174217.229620-7-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260721174217.229620-1-deeratho@cisco.com>
References: <20260721174217.229620-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 17:42:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241565

From: Deepak Rathore <deeratho@cisco.com>

Pick the upstream patch [1] as mentioned in [2].

[1] https://github.com/OpenPrinting/cups/commit/928a86b1b794f738f0a3dc87561b2e054bff7ce4
[2] https://security-tracker.debian.org/tracker/CVE-2026-39314

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
Changes in v2:
- Rebased the patch on current Scarthgap CUPS recipe context.
- Refreshed the embedded source patch context; no CVE logic changes.

 meta/recipes-extended/cups/cups.inc           |  1 +
 .../cups/cups/CVE-2026-39314.patch            | 45 +++++++++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-39314.patch

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 1cef1e71fe..575dbf9c57 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -30,6 +30,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/cups-${PV}-source.tar.gz \
            file://CVE-2026-34980-regression_p2.patch \
            file://CVE-2026-34979.patch \
            file://CVE-2026-34990.patch \
+           file://CVE-2026-39314.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/OpenPrinting/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/CVE-2026-39314.patch b/meta/recipes-extended/cups/cups/CVE-2026-39314.patch
new file mode 100644
index 0000000000..f8d1a69f56
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2026-39314.patch
@@ -0,0 +1,45 @@
+From 65c463ada188915d6700d92ce48a9a14949ca413 Mon Sep 17 00:00:00 2001
+From: Michael R Sweet <msweet@msweet.org>
+Date: Sun, 5 Apr 2026 10:45:25 -0400
+Subject: [PATCH] Range check job-password-supported.
+
+CVE: CVE-2026-39314
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/928a86b1b794f738f0a3dc87561b2e054bff7ce4]
+
+Backport Changes:
+- Rebase cups/ppd-cache.c context to the CUPS 2.4.11 source carried by
+  this recipe.
+- Omit the upstream CHANGES.md release-note hunk because Yocto patch metadata
+  carries the CVE details and the target source release-note sections differ.
+
+(cherry picked from commit 928a86b1b794f738f0a3dc87561b2e054bff7ce4)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ cups/ppd-cache.c |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
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
2.35.6


