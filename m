Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD401C44515
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 06:05:37 +0000 (UTC)
Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7800.1784268326802407589
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2026 23:05:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Y9ti25jR;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2505; q=dns/txt;
  s=iport01; t=1784268326; x=1785477926;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=0BRhRsYwmyEzit9miq6XowVB8Zk/QcNHP7Tsxb03ngc=;
  b=Y9ti25jRPfF4N1CpzfTIDVcrUj6nhoJ/KhSmmMSGf0PbFD1+NmQFFcGx
   jXFmCRjzB0aWI1hMhflvcPTWYdFPNJBG0zlr5Q0CFE5bDZEgnn8fcF4/V
   mK8QrYAfISv4qPU8AG8oGd0d9RgGyPirb+g76l3TWpLXv7baQ3lwuRpNu
   Pr19DCuKZzFTYbjuTFq/HmviPzUobLhXjuZymDVtj1ZEAgvJ9Weg21epN
   tCH3io7RS7vDI4i1w9i0Fia4V6Q+7Q5fI3TgR/Czs1sPSjFf94+uLL0ds
   7pZf9r63YDmcxdBSRwCW3aJJYo7ja+jkXr1rtHhbU2NjltRg6npoRUazd
   Q==;
X-CSE-ConnectionGUID: +9a3yYLwQq6oTTEB2EWaLg==
X-CSE-MsgGUID: gp4xqp/JTYKsAPgCE8cjrw==
X-IPAS-Result: =?us-ascii?q?A0BIAgBWw1lq/5L/Ja1aHgEBCxIMggULgld0X0JJlCmCI?=
 =?us-ascii?q?QOLZJI3gX4PAQEBD0QNBAEBhD9GAo1SAiY0CQ4BAgQDAgMBAQEBAQEBAQEBA?=
 =?us-ascii?q?QsBAQUBAQECAQcFgQ4Thk8NhloBAgEDMgEYAT0cAwECLyALIwgRCIMCAYI6A?=
 =?us-ascii?q?zcDEbx6GjeCLIEBgygBPwJDUNhJDYJYAQsUAYE4hT+CfYUjXBgBhHwnGxuBc?=
 =?us-ascii?q?oEUAYNpgQWBGkIBAYIGJ4V4BIIigQyBWh6Ec4sOSIEeA1ksAVUTDQoLBwWBZ?=
 =?us-ascii?q?gM1EioVbjIdgSM+F4EMGwcFgR2BOoEAhHYjHwM5f4EvdUp3LWoSF4FOghSBP?=
 =?us-ascii?q?gMLGA1IESw3FBsEPm4HjUgjgj+BDgErgUMRpC2CHqAhcQoog3WMIY8+hXwaM?=
 =?us-ascii?q?6psC5h9jgqECZJHhGmBaDyBKB8LB3AVgm4BMwlKGQ+OOINrgX/MQTw1AgkyA?=
 =?us-ascii?q?QEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:94CAraNaxvmlvHTvrR30lsFynXyQoLVcMsEvi/4bfWQNrUpw3mFSm
 2YdW2CPbKzcYWbwctpxO4XipxkFvpaGxoBkSHM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeaphyFTmE+kvF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WV7lV
 e/a+ZWFZgf6gmAsaAr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj67Y/BRonDKkHw/8pBl1y2
 NZCBQ8ESh/W0opawJrjIgVtrt4oIM+uOMYUvWttiGmIS/0nWpvEBa7N4Le03h9p2ZsIRqmYP
 ZdEL2MzMnwsYDUXUrsTIJ4zkf2hmnn4WzZZs1mS46Ew5gA/ySQsiOK8aoaKK4ziqcN9kV7Et
 nveuEbFMzIBHeSQ4hfV+XC2mbqa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVul/4waXx++MskCSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXPIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:9d6fRq/fvVZ5Y+XqFHBuk+D0I+orL9Y04lQ7vn2ZLiYlFvBw+P
 rBoB1273LJYXMqKRIdcLO7Scy9qA3nlKKdiLN5VdzJYOClghrLEGgI1+TfKlPbdxEWjtQ86Y
 5QN45jFdb3EV92yez+4AW+DpIc5ePvytHOuQ8bpE0dND2DrMpbnmFENjo=
X-Talos-CUID: 9a23:GjHtxm13Vs33Y3XVA2naGbxfWZEsKWzs6GjpOhG/NVpEYue4dla09/Yx
X-Talos-MUID: =?us-ascii?q?9a23=3AJ7D2Gg9guxji5hC91uXbhomQf8hwv7S3EAcvraQ?=
 =?us-ascii?q?loOC8OgddazyfliviFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,168,1779148800"; 
   d="scan'208";a="502924798"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 17 Jul 2026 06:05:26 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id B17B118000203
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 06:05:25 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id D3789CC037D; Fri, 17 Jul 2026 11:35:23 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH 04/10] expat: fix CVE-2026-56405
Date: Fri, 17 Jul 2026 11:34:31 +0530
Message-Id: <20260717060437.2910653-5-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260717060437.2910653-1-deeratho@cisco.com>
References: <20260717060437.2910653-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-09.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 06:05:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241143

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream fix shown in [1] as referenced by [2].

[1] https://github.com/libexpat/libexpat/commit/2c6c42d33689f6b266a5267b639e03cde17e53c0
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-56405

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 .../expat/expat/CVE-2026-56405.patch          | 30 +++++++++++++++++++
 meta/recipes-core/expat/expat_2.6.4.bb        |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56405.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-56405.patch b/meta/recipes-core/expat/expat/CVE-2026-56405.patch
new file mode 100644
index 0000000000..3df0cedfb8
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-56405.patch
@@ -0,0 +1,30 @@
+From 49ba5bdafa7aaee9b77a32ffaa798e625bd46e73 Mon Sep 17 00:00:00 2001
+From: netliomax25-code <netliomax25@gmail.com>
+Date: Fri, 29 May 2026 11:45:17 +0530
+Subject: [PATCH 05/17] lib: Protect function getAttributeId from signed
+ integer overflow
+
+CVE: CVE-2026-56405
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/2c6c42d33689f6b266a5267b639e03cde17e53c0]
+
+(cherry picked from commit 2c6c42d33689f6b266a5267b639e03cde17e53c0)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ expat/lib/xmlparse.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/expat/lib/xmlparse.c b/expat/lib/xmlparse.c
+index 9d21e136..80ad0811 100644
+--- a/expat/lib/xmlparse.c
++++ b/expat/lib/xmlparse.c
+@@ -7312,6 +7312,10 @@ getAttributeId(XML_Parser parser, const ENCODING *enc, const char *start,
+     } else {
+       int i;
+       for (i = 0; name[i]; i++) {
++        /* Detect and prevent signed integer overflow */
++        if (i == INT_MAX) {
++          return NULL;
++        }
+         /* attributes without prefix are *not* in the default namespace */
+         if (name[i] == XML_T(ASCII_COLON)) {
+           int j;
diff --git a/meta/recipes-core/expat/expat_2.6.4.bb b/meta/recipes-core/expat/expat_2.6.4.bb
index 815b31fc10..615d404d56 100644
--- a/meta/recipes-core/expat/expat_2.6.4.bb
+++ b/meta/recipes-core/expat/expat_2.6.4.bb
@@ -55,6 +55,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://CVE-2026-56403_p2.patch;striplevel=2 \
            file://CVE-2026-56408.patch;striplevel=2 \
            file://CVE-2026-56404.patch;striplevel=2 \
+           file://CVE-2026-56405.patch;striplevel=2 \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"

