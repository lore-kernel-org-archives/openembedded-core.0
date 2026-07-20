Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9A76C44520
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 18:42:59 +0000 (UTC)
Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4651.1784572976316786359
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 11:42:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=fRDnYuHp;
 spf=pass (domain: cisco.com, ip: 173.37.86.80, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3583; q=dns/txt;
  s=iport01; t=1784572976; x=1785782576;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=oNVEuzZ5420iiSBZ+CZcodJYVOnISUrDjBkqDubYEP0=;
  b=fRDnYuHpbH7tlXsoKdp13UunV9urMzbn4XsP5BS9p1zvx/l7JkfZ1tQU
   kg4v2fIF2DcoHNB0wPvvP+ZGxJm/ZvTKv1UQHa/ncnjBi4K+4CnAYx24+
   ODf7Tyv+N+OR0h3cwaGY1Ml4JiGw8LxWCfF5C08X/dABV6u23ZRfEKnjp
   ajITzTRdq3nxvjJqxBsbDwU5D6aDW/B8KIBza/NT+PV84NzJrqclCJbZl
   PB3Mek6YdolmlvXIY15c0GBOIRE++uEmfds0EHd+Bt0PILnmofgXI098Y
   TaQwNVkGgkWrPOLzrAJfZo00pJZmBxpnERFB065B2cFUjDE5plv0Q9zWc
   Q==;
X-CSE-ConnectionGUID: oW+upeXPTRCiBGngSPFxog==
X-CSE-MsgGUID: pOLjf9AiRxq6NZMLZWEB5g==
X-IPAS-Result: =?us-ascii?q?A0BJAgA7a15q/5D/Ja1aglmCV3ReQ0mWSpoahASBfg8BA?=
 =?us-ascii?q?QEPRA0EAQGFBY1XAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4Thk8NhloBAgE1ARgBLSwDAQJaIyGDAgGCdAMRu2iCLIEBgygBPwJDUNsuA?=
 =?us-ascii?q?QsUAQWBM4U/iCBcGAGEfCcbG4FyhH6BBYFcAQECiCMEgiKBDIFaHo94SIEeA?=
 =?us-ascii?q?1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4EMGwcFgR2BOoEChHQjHwM5f4Evd?=
 =?us-ascii?q?Up3LWkBEheBJoISAoE7AhADCxgNSBEsNxQZBD5uB41AI4FzTQGBDQEqAReBb?=
 =?us-ascii?q?ZcCjHuCIaEPCiiDdYwhlToaM4QEgVeSQJJRC5h9iguDf5ZQhGmBaDyBRwsHc?=
 =?us-ascii?q?BWDIglKGQ+OLQsLhV+DFIE9yAonMgIJMgEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:eqxMLa3TBl8eWxM3S/bD5YJwkn2cJEfYwER7XKvMYLTBsI5bpzwOy
 mZNCj3XbPqMYWHyfNxwOd6x8BtU75XUztA2GlM63Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmH4E/xbtANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 Lsen+WFYAX7g2EuajpKg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGC351IJUVyt5LO0pP3
 9MeJws1QACEiLfjqF67YrEEasULNsLnOsYb/3pn1zycValgSpHYSKKM7thdtNsyrpkRRrCFO
 IxDNGcpNUicC/FMEg9/5JYWkOq2j3/kcyVwo1OOrq1x6G/WpOB0+OW0aoKEJ4fSGK25mG6Ag
 UbE8TXQAysKLYK5+x+hwE2BrLLAyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc8BbH+t/7ESGzbDZpl7GQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSv1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:VyEbOaFZOuMecsFdpLqExMeALOsnbusQ8zAXPo5KJiC9Ffbo8v
 xG88576faZslsssRIb6LK90cu7IU80nKQdieJ6AV7IZmfbUQWTQL2KxLGSpwEIYxeOldJ15O
 NHb7V0DsH2ABxRiMb35xT9LvMbqeP3l5xBQYzlvg5QpcYAUdAH0ztE
X-Talos-CUID: =?us-ascii?q?9a23=3Af501umj0TvWdgI41xR10koFlGDJudUKe0W/dE3e?=
 =?us-ascii?q?EM01oYpKTRmSo1rNjnJ87?=
X-Talos-MUID: 9a23:tFBrBAq2ENoaTMdubxQezylFEMVmso2vMlAUz7M0nu22CgFaZjjI2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,175,1779148800"; 
   d="scan'208";a="512095305"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Jul 2026 18:42:55 +0000
Received: from sjc-ads-9357.cisco.com (sjc-ads-9357.cisco.com [10.30.212.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id 3CAC9180003D4;
	Mon, 20 Jul 2026 18:42:55 +0000 (GMT)
Received: by sjc-ads-9357.cisco.com (Postfix, from userid 1887503)
	id D8AC7CC12A6; Mon, 20 Jul 2026 11:42:54 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Devansh Patel <devanshp@cisco.com>
Subject: [OE-core][scarthgap][PATCH] libxml2: Fix CVE-2026-11979
Date: Mon, 20 Jul 2026 11:42:52 -0700
Message-ID: <20260720184252.4060675-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.44.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-9357.cisco.com [10.30.212.121];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.212.121, sjc-ads-9357.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 18:42:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241476

From: Devansh Patel <devanshp@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://gitlab.gnome.org/GNOME/libxml2/-/commit/c2e233fc1b341685fc99621b2768b503f777a72e
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-11979

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 .../libxml/libxml2/CVE-2026-11979.patch       | 70 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.12.10.bb   |  1 +
 2 files changed, 71 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-11979.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2026-11979.patch b/meta/recipes-core/libxml/libxml2/CVE-2026-11979.patch
new file mode 100644
index 0000000000..427026b345
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2026-11979.patch
@@ -0,0 +1,70 @@
+From d8566dd918c612078dfb3ee1a95d7bb6f0656bfe Mon Sep 17 00:00:00 2001
+From: Daniel Garcia Moreno <daniel.garcia@suse.com>
+Date: Fri, 22 May 2026 12:21:20 +0200
+Subject: [PATCH] xmlcatalog: overflow check for large --shell commands
+
+Fix https://gitlab.gnome.org/GNOME/libxml2/-/work_items/1124
+
+CVE: CVE-2026-11979
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/c2e233fc1b341685fc99621b2768b503f777a72e]
+
+Backport Changes:
+- The commit modifies test/catalogs/test.sh.
+- test/catalogs/test.sh does not exist in the libxml2 v2.12.10
+  source used in Scarthgap and was introduced later version
+  libxml2 v2.14.0 [1].
+- The test changes were omitted; only the required fix in
+  xmlcatalog.c was backported.
+
+[1] https://gitlab.gnome.org/GNOME/libxml2/-/commit/f06fc933cdaea2ce8e9cea275fdbf4edb85f9837
+
+(cherry picked from commit c2e233fc1b341685fc99621b2768b503f777a72e)
+Signed-off-by: Devansh Patel <devanshp@cisco.com>
+---
+ xmlcatalog.c | 16 ++++++++++++++++
+ 1 file changed, 16 insertions(+)
+
+diff --git a/xmlcatalog.c b/xmlcatalog.c
+index 588802b41..51569b879 100644
+--- a/xmlcatalog.c
++++ b/xmlcatalog.c
+@@ -114,6 +114,12 @@ static void usershell(void) {
+ 	       (*cur != '\n') && (*cur != '\r')) {
+ 	    if (*cur == 0)
+ 		break;
++            /* Do not read beyond the command array capacity */
++            if (i >= (int)sizeof(command) - 2) {
++                printf("Invalid command %s\n", cur);
++                i = 0;
++                break;
++            }
+ 	    command[i++] = *cur++;
+ 	}
+ 	command[i] = 0;
+@@ -131,6 +137,11 @@ static void usershell(void) {
+ 	while ((*cur != '\n') && (*cur != '\r') && (*cur != 0)) {
+ 	    if (*cur == 0)
+ 		break;
++            if (i >= (int)sizeof(arg) - 2) {
++                printf("Invalid arg %s\n", arg);
++                i = 0;
++                break;
++            }
+ 	    arg[i++] = *cur++;
+ 	}
+ 	arg[i] = 0;
+@@ -143,6 +154,11 @@ static void usershell(void) {
+ 	cur = arg;
+ 	memset(argv, 0, sizeof(argv));
+ 	while (*cur != 0) {
++            if (i >= (int)sizeof(argv) / (int)sizeof(char*)) {
++                printf("Too much arguments\n");
++                break;
++            }
++
+ 	    while ((*cur == ' ') || (*cur == '\t')) cur++;
+ 	    if (*cur == '\'') {
+ 		cur++;
+-- 
+2.35.6
+
diff --git a/meta/recipes-core/libxml/libxml2_2.12.10.bb b/meta/recipes-core/libxml/libxml2_2.12.10.bb
index 2bfa78324f..d476ba14b6 100644
--- a/meta/recipes-core/libxml/libxml2_2.12.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.12.10.bb
@@ -31,6 +31,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://CVE-2026-0992-02.patch \
            file://CVE-2026-0992-03.patch \
            file://CVE-2026-1757.patch \
+           file://CVE-2026-11979.patch \
            "
 
 SRC_URI[archive.sha256sum] = "c3d8c0c34aa39098f66576fe51969db12a5100b956233dc56506f7a8679be995"
-- 
2.44.4


