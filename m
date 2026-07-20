Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C985AC44515
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 12:20:28 +0000 (UTC)
Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7668.1784550025135817828
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 05:20:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=WVYSvUvH;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3117; q=dns/txt;
  s=iport01; t=1784550025; x=1785759625;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=RmeFMKv/7RL++JeRa65QITvG9JoIexx9IrAi/KoowuI=;
  b=WVYSvUvH1OdOKTWojXRBNej5GNBFmUWFOzv/u2+1nbbs30bK3nn3P6PU
   iKwHAl4fJFr70iBKwwqJYaRisjYq+OLMYUL05HrEiQOw1E3f0UHUP427s
   P0iXh+BsU0OWEyBMOivy9HGO31GkyYDjETySuHFpbrVOQYqg2EiobRwph
   UuXqpGyJhWSy0Emgj03Yhtfea8W4eBfjF5j2y5yBC4JsUnqWCj3AYMjHm
   H12GLlm0W4C+2lSR77ylEO8LsZ557iCsgXX2aYPvhclvvWAESC9PKMWDm
   PvJrBoAn3+fkN8T4vjQlSwTjthuY8LstAM0N84Mc/puAtaxDeQ5tiNDvi
   w==;
X-CSE-ConnectionGUID: APAlwIjnSei5hh3mROzarA==
X-CSE-MsgGUID: 8A8xL+2AQxOdaYpGXeZfPg==
X-IPAS-Result: =?us-ascii?q?A0BJAgAfEl5q/4r/Ja1aglmCV3RfQkmUKYIhA4tkkjeBf?=
 =?us-ascii?q?g8BAQEPRA0EAQGEP0YCjVMCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2GWgECAQMnCwEYAT0cAwECLyALIwgRCIMCAYI6AzcDEbxFG?=
 =?us-ascii?q?jeBeTOBAYMoAT8CQ1DYSQ2CWAELFAGBOIU/gn2FI1wYAYR8JxsbgXKBFYNpg?=
 =?us-ascii?q?QWBGkIBAYglBIIigQyBWh6BfY1xSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdg?=
 =?us-ascii?q?SM+F4EMGwcFgR2BOoEChHQjHwM5f4EvdUp3LWoSF4EmghICgTsCBwMLGA1IE?=
 =?us-ascii?q?Sw3FBkEPm4HjTwjgj+BDgErgUMRpkugIXEKKIN1jCGPPoV8GjOqbAuYfY4Kh?=
 =?us-ascii?q?AmSR4RpgWg8gSgfCwdwFTuCMwEzCUoZD44tCwuDYIF/xkY8NQIJMgEBBwIHD?=
 =?us-ascii?q?gMLgWiRHmABAQ?=
IronPort-Data: A9a23:UU5PRaM3sLFfKWbvrR30lsFynXyQoLVcMsEvi/4bfWQNrUok12QEy
 moZCDiFO/ncYWSkeo10aojg9EsDuJCDzNVnT3M5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeaphyFTmE+kvF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WV7lV
 e/a+ZWFZgf6gWYsbwr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj69xWJUUpHI8ewet2XGFOr
 vkiDyIEdDnW0opawJrjIgVtrt4oIM+uOMYUvWttiGmAS/0nWpvEBa7N4Le03h9p2ZsIRqmYP
 ZdEL2M0PHwsYDUXUrsTIJ4zkf2hmnn4WzZZs1mS46Ew5gA/ySQsieK1b4eOK4XiqcN9zm/It
 kaFpU3AEjYWPe2H5gqIwHyUibqa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVul/4waXx++MukCSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXMIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:lfEXTav6DYsU7tUMSY+anF9b7skDWtV00zEX/kB9WHVpm6uj5q
 STdZsguyMc5Ax9ZJhko6HiBEDiewK4yXcK2+gs1N6ZNWGM0ldAbrsSj7cKqAeOJ8SRzIJgPN
 9bE5RWOZnXEUVwi9r87U2TFtYtx8TCzYWT7N2uqEuEiWpRGthdB8ATMHf8LnFL
X-Talos-CUID: =?us-ascii?q?9a23=3AMsOzWWh2PgzmobyW4Q6eaAjhozJuW0X0yGjxIUm?=
 =?us-ascii?q?DBGc0SL3OTGW36qp+up87?=
X-Talos-MUID: =?us-ascii?q?9a23=3A/ooc0w4O2HQjvLeBAlsECxj1xow4yvS+LANXuKw?=
 =?us-ascii?q?WnMWNBDRfCzqvggy4F9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,174,1779148800"; 
   d="scan'208";a="512075391"
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Jul 2026 12:20:24 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id 13D15180001DF
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 12:20:24 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 304C6CBEFAA; Mon, 20 Jul 2026 17:50:22 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH v2 08/10] expat: fix CVE-2026-56411
Date: Mon, 20 Jul 2026 17:46:13 +0530
Message-Id: <20260720121615.2520859-9-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260720121615.2520859-1-deeratho@cisco.com>
References: <20260710130809.2817559-1-deeratho@cisco.com>
 <20260720121615.2520859-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 12:20:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241385

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream fix shown in [1] as referenced by [2].

[1] https://github.com/libexpat/libexpat/commit/528a4e5017e1bd3b48b689fd0c131df940ae3ea5
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-56411

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
- Changes from v1 to v2: Refresh the patch on top of
latest wrynose branch merged commits.
 .../expat/expat/CVE-2026-56411.patch          | 47 +++++++++++++++++++
 meta/recipes-core/expat/expat_2.7.5.bb        |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56411.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-56411.patch b/meta/recipes-core/expat/expat/CVE-2026-56411.patch
new file mode 100644
index 0000000000..884837b61e
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-56411.patch
@@ -0,0 +1,47 @@
+From e447d5d72884a1246894f111a5b72de4e479152e Mon Sep 17 00:00:00 2001
+From: netliomax25-code <netliomax25@gmail.com>
+Date: Tue, 2 Jun 2026 13:13:34 +0530
+Subject: [PATCH] xmlwf: protect notation list allocation from integer overflow
+
+CVE: CVE-2026-56411
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/528a4e5017e1bd3b48b689fd0c131df940ae3ea5]
+
+(cherry picked from commit 528a4e5017e1bd3b48b689fd0c131df940ae3ea5)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ expat/xmlwf/xmlwf.c | 11 +++++++++--
+ 1 file changed, 9 insertions(+), 2 deletions(-)
+
+diff --git a/expat/xmlwf/xmlwf.c b/expat/xmlwf/xmlwf.c
+index 6a0a707a..a9640190 100644
+--- a/expat/xmlwf/xmlwf.c
++++ b/expat/xmlwf/xmlwf.c
+@@ -383,9 +383,9 @@ static void XMLCALL
+ endDoctypeDecl(void *userData) {
+   XmlwfUserData *data = (XmlwfUserData *)userData;
+   NotationList **notations;
+-  int notationCount = 0;
++  size_t notationCount = 0;
+   NotationList *p;
+-  int i;
++  size_t i;
+ 
+   /* How many notations do we have? */
+   for (p = data->notationListHead; p != NULL; p = p->next)
+@@ -395,6 +395,13 @@ endDoctypeDecl(void *userData) {
+     goto cleanUp;
+   }
+ 
++  /* Detect and prevent integer overflow in the multiplication, mirroring
++     the guards in xcsdup() and resolveSystemId() */
++  if (notationCount > SIZE_MAX / sizeof(NotationList *)) {
++    fprintf(stderr, "Unable to sort notations");
++    goto cleanUp;
++  }
++
+   notations = malloc(notationCount * sizeof(NotationList *));
+   if (notations == NULL) {
+     fprintf(stderr, "Unable to sort notations");
+-- 
+2.43.7
+
diff --git a/meta/recipes-core/expat/expat_2.7.5.bb b/meta/recipes-core/expat/expat_2.7.5.bb
index cb8f9dd1ac..bd6656c6e0 100644
--- a/meta/recipes-core/expat/expat_2.7.5.bb
+++ b/meta/recipes-core/expat/expat_2.7.5.bb
@@ -29,6 +29,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://CVE-2026-56406-dependent.patch;striplevel=2 \
            file://CVE-2026-56406.patch;striplevel=2 \
            file://CVE-2026-56409.patch;striplevel=2 \
+           file://CVE-2026-56411.patch;striplevel=2 \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"
-- 
2.35.6


