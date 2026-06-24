Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37EFDCDB479
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 08:34:53 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.17])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2406.1782290090428672769
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jun 2026 01:34:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=hB5f8UZl;
 spf=pass (domain: est.tech, ip: 40.107.162.17, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JakfjeArEyT0NLUHq6118CQaj4bPwwmfGt3eLkqlz9VxpVEW/y4Rg62GVzr1rd41hq9WVCB7/Xsv7Tc8KmbAl5MziXl4E3QNEgecZLDxXeSODJqgaRsr3LkrFFog6jZCsvQDsI7ixw2tYyvOYyKp48OixWRVAemVmVL4UfKjeCCmz7Bkhtcet9VkdrulKb9+nQ4OeWIRklXF1wUmN0iKmuhp2OYwP+3PCR9yvMpUxKRLwO8vCTZiEAs7HfWUgbfBWMM7eCySXMIaSsZsgNY90sfadzilDiIct26yvTJ6es2h1l56XAF6lSMZrYXQFy+FTsJOHd5b1c2bmkkzyw9Q7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7zjlmzND9XSorFsNm5VrCuhbtlFLc7eLZ4p15dkpLNk=;
 b=VWtEfkpjLNsyXqsSGuFLAW0D+se61onLmUjHQjSTGl4V0TXYU8XhvVvPDy2DnDAWkwnJdW71IhzwYmbeH7Ke14w2WjxQzcZlCNwfDmEIU96F0swQc2FHoq75BkI22iPgikOf3oMC7kA6A6ZmptAuqHF6v0qwm2BIbhtPdG5KxNYMwhtNHPTy2Lp3ZomM4lTZcK+w5MODCRjOtk5lC7IPLRkxBcmmLplYSJBJLGfumv3YgGm4InDoiWEcNT1jbLbD31SmUsedJlO5BfwQTxqfOhYVbpzax6xqdHnOIkT5r+ZjA5XDi5U2gv9OlqYMwiV3/XLZXxX/a0N0kmniF3ZHFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7zjlmzND9XSorFsNm5VrCuhbtlFLc7eLZ4p15dkpLNk=;
 b=hB5f8UZl1xPRQvjTZQ9mv546IqT8vREuM9dMdjUXvKIoTcC5ifOx63p0boVqfoHYJcO+JmO3ZdFanpOf6Dli+5/FqiqmrMQE9yawg3N940jLqtMQNd12M+rq/JXrG4Frt5FvI//+Ckjos8fdy9rfUXiCgXJfthgvWIQeotNOeUyIvpZNzFTrFeCU/40//Cy6YpXclHwvRbmw3G/Rz+wQp7M7Ix4EIMkJBPZZTiHWjrMGJ23LVj8+J+WIIBj4os24y2YVnTwLJ+IGHOkQuEYwLBO6zWYgIw+3GwuRi+pHeT00ZjLeWt8oihuvqPwe80KgD97bkJM6eRtiYM0erd2oew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by AM7P189MB0613.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:113::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.15; Wed, 24 Jun
 2026 08:34:46 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::18b0:e114:b839:ca49]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::18b0:e114:b839:ca49%8]) with mapi id 15.21.0139.018; Wed, 24 Jun 2026
 08:34:46 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [scarthgap][PATCH v2] curl: fix CVE-2026-5773 - wrong reuse of SMB connection
Date: Wed, 24 Jun 2026 10:34:40 +0200
Message-ID: <20260624083440.67952-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260623074847.3424-1-jaipaul.cheernam@est.tech>
References: <20260623074847.3424-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PA7P264CA0040.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:34b::10) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|AM7P189MB0613:EE_
X-MS-Office365-Filtering-Correlation-Id: 89e5e2dd-564b-48fe-ae02-08ded1cb7257
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|22082099003|18002099003|3023799007|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	4qTWY9K2qCubY8nkjIX3M8nZLWjR8R0ZoEgP+m06744LGKcPTgG+828ZjPcKJKfsvSUmuOntGREMdah0ITzojUJ8ZCF1BVRfwuQ4zkXsbqumZmC1PTiedSMr3ar90eJCHFapt9+2y1ENOVC3bsa6cCR8WG6MOXguNf8yJtIV9+U9+NwaRdKfzNr3VXAmF68ffTS7a83fgOg/XGhlM+GrDfeUwXi84nviYCX1sjJFO9gwiXqF5KHAQVhS4Nxi/dhdpluCUA2aPe8pVVE13s9c/IXbXBmVTLRHf/Ai1AxITcJ3YDb264FHpL66npysAoJHrq/Qnyli/+A9vx9TPipjyxLowsWunYt5ffGXozrSun3cDmu4ZbEJdlKMi+T4K9OZQMdQCxHrvvgMBOS5OUifYqEMOEPL9q7pwi8tHOcCw3oZR4Gi0F3vahB/cjJWcqsdrN8Xlh6sRHWlSNYFsZwGVtQ8lUrXEiTL7aduQBM2Z6KQhINNOCVqfB3HnUp5VGwXKbpxm+cvkjPZ8BKELrHfYS8S339T6lb0d6FTGc2D4JwNnp/DmuK/dmW2JEsbg98TplFRgAo04g/6t7Y7ZYg1z+R49qisfBO+cH2f45Ud0FOaGbuLTrQlPlIwnyLyeIm/CYT5obqqPYj+t88se2I0JkLuE5COcTt5xfJ98iA2OQA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(22082099003)(18002099003)(3023799007)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?nD90l73XvD2RNaQr7ZIwqgOKefTeUE3r0Ueey0MWnIopdvIkFfhF6SMViyK3?=
 =?us-ascii?Q?UvjoNmwX9br9o3/KsIA1gVhw844WQg7a6UlEITzgXS38Csz250CTI1Ksx4Kj?=
 =?us-ascii?Q?1oEk4eJxX1z6h8J4O7m/a1zTS+Ly+TALQhaZgE8A7PhnKM+fnw0JZVFz8Efw?=
 =?us-ascii?Q?dKL3ohUH0chVnjE0bpACgLARNsb+dv8bNxvlMEy4R8Q79D4nRO4c3C959eEg?=
 =?us-ascii?Q?OF8U/yzh7nne336ZjWDzh4eaYzQEIBRxiXt9QS5TvOBJOy0P7WXZBekdvrk7?=
 =?us-ascii?Q?+2R1ryM0E3fhB6yCscybebt2m111gI7jafa/8cPF7gpCELOxtkO0cPl81gjj?=
 =?us-ascii?Q?OpappErcIpXWlP5AJn1v9EMvMhb/jDVvYSO7fAyBixa7dHWr/TgT23p4dDKg?=
 =?us-ascii?Q?2KZ9X+jobGIeVM1vqPVD0G/XfdylUWAXDHedhV5M2AmYw35JDllgK8FQ5Gkd?=
 =?us-ascii?Q?mXv+IAb1xvueXMSgz8cMEl2q13XmKjIe1t2J0/2TNI4Hzm+++zeHWfB95nya?=
 =?us-ascii?Q?rgk3Cgef2jaWQrNDdR1KeqbXpnvlP+Xl5GU6xnF/FMcQomCyozHVGwSfK5Ff?=
 =?us-ascii?Q?aoolibV82S7t7asSmGqj6pNFqKbQxXoiWQV+IIiQlHzkW/XJaL+OtbwhNvL5?=
 =?us-ascii?Q?QrmeqNjWy2Sies5WnP+D+2FshLko+8QmaZ9uf+BxmUWnpi+YJX1/GWJP6Elz?=
 =?us-ascii?Q?c5IbHRndfXVyh8FzxmdH+w/DKfNGemvhQAMQDjTyW1YpHN92Sz29EBdB3U52?=
 =?us-ascii?Q?X3zqBVWu0J8BSjPAe+UZVzdDME7q/eOME4Tkcgq0U4jtcv1BukNbZENIcdkp?=
 =?us-ascii?Q?nP0IqjbYlusaOi18TpuiHueXlUwpZv86D4TPuVuh1mtXMJh3n60NWwb5Ts+Z?=
 =?us-ascii?Q?zci6QeploR+mGINFGtD7un9UGYbk9NCSQ8C84pQMDqCXo+Z9zMhOyrzIRO6m?=
 =?us-ascii?Q?7snOIQkumh6VJ4GZS+9xF/5jrlQiTjhpnzRDlXbblc85aMoJ7BJVkPRtY4He?=
 =?us-ascii?Q?YNNSvPzHKs5tn6ct/Qd1CraM3NvCfyhGPKQa77BOquInTdJRoeEK7468xQE/?=
 =?us-ascii?Q?770Y41nYxFvRHMl9pGwsXNljPOommNACklsSIned57Uix4qZmKo40UjKXvlC?=
 =?us-ascii?Q?YHwqJ8+atqW43ieSbVdap/dISGTnwcRm9bGiaqmHWfzGxRvLJrnLWyNz55sJ?=
 =?us-ascii?Q?dMUtePWm9Mbk0ChCw7Kx5XxzkVOwO+9Q7Allt298yijG/Ov1xOyZGcxfLSXs?=
 =?us-ascii?Q?+8rvznsfUw9fu1usHOLa24E/XXmnBAoSvdTXeZHUFpQTONKgmN4DmVkvXwpb?=
 =?us-ascii?Q?/aMXQk2kL+GVntCT4FaP044WXQl3YckpCMbCCz1V9b5VD89EiWAaqyMf88n9?=
 =?us-ascii?Q?P3c8b2z2Hp9usOiNTzd5tL/XroG+LX6WgRCHMRXn1itOUmcNHAiod5nBBjyk?=
 =?us-ascii?Q?CVp7zPnqC/mVwm+22zQDmZtxi4GRyYap+prOjUxGACPpCI2/t/YJp5G6CfVt?=
 =?us-ascii?Q?5wMEsZUcK/0Jmutjhx9HFXLHieMKJWSH6tDCBRynY2dC7uP6U7BBgiWI6PeZ?=
 =?us-ascii?Q?biQxJb929Arl6ouO9jGO/Ot5FI4s2+SUlkd+/UVcdFrLzlz55XyPZylf8tOg?=
 =?us-ascii?Q?AZ/EOSNz4gKnp2izFx9o/pbuAT0xHT0guZ67G8z3yYefQ+5Zz10XrT2BlAyC?=
 =?us-ascii?Q?Eclq1YWLi3fBwrUYajhoVrdhSPPIwR+xrtjTdxD3MV2kVB/Z37IkN/d3sPPl?=
 =?us-ascii?Q?GQwUOC8BhQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 89e5e2dd-564b-48fe-ae02-08ded1cb7257
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 08:34:46.1403
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IGLYT/PlVahIHhCPvkCa7eysNmUVOpMz0Mnyy3kG1fin861YKzU85lexGhWj3O+Ep8KOsfQuktoJqAeD18t+N3CGT84BQITPxjE2y87pS78=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P189MB0613
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 08:34:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239479

libcurl's SMB handler marks connections for reuse (connkeep) without
verifying that subsequent requests target the same share. This allows
a second SMB request to the same host to reuse a connection
authenticated for a different share, potentially accessing data
without proper authorization.

The upstream fix removes connection reuse for SMB entirely in
lib/protocol.c, a file introduced in curl 8.20.0. For 8.7.1, the
equivalent fix is changing connkeep() to connclose() in lib/smb.c,
which prevents the connection from being returned to the pool.

Tested with SMBv1 server (Docker dperson/samba):
  Without patch: "Re-using existing connection" for different shares
  With patch: New connection per request, no reuse

Binary verified: Curl_conncontrol arg changes from 0 (KEEP) to 1 (CLOSE)

Reference: https://curl.se/docs/CVE-2026-5773.html

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../curl/curl/CVE-2026-5773.patch             | 41 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-5773.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-5773.patch b/meta/reci=
pes-support/curl/curl/CVE-2026-5773.patch
new file mode 100644
index 0000000000..0a5fa588fe
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-5773.patch
@@ -0,0 +1,41 @@
+From 74a169575d6412dc0ff532acdf94de35a6c2a571 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Sun, 5 Apr 2026 18:23:35 +0200
+Subject: [PATCH] protocol: disable connection reuse for SMB(S)
+
+Connections should only be reused when using the same "share" (and
+perhaps some additional conditions), but instead of fixing this flaw,
+this change completely disables connection reuse for SMB. This protocol
+is about to get dropped soon anyway.
+
+Reported-by: Osama Hamad
+Closes #21238
+Signed-off-by: Daniel Stenberg <daniel@haxx.se>
+
+CVE: CVE-2026-5773
+Upstream-Status: Backport [https://github.com/curl/curl/commit/74a169575d6=
412dc0ff532acdf94de35a6c2a571]
+
+Note: The upstream fix targets lib/protocol.c which was introduced in
+curl 8.20.0. In 8.7.1 the equivalent is changing connkeep() to
+connclose() in lib/smb.c, which prevents the connection from being
+returned to the pool. The effect is identical.
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ lib/smb.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/lib/smb.c b/lib/smb.c
+index 7c73cbcec..a1f5c9b31 100644
+--- a/lib/smb.c
++++ b/lib/smb.c
+@@ -461,8 +461,7 @@ static CURLcode smb_connect(struct Curl_easy *data, bo=
ol *done)
+   if(!smbc->send_buf)
+     return CURLE_OUT_OF_MEMORY;
+=20
+-  /* Multiple requests are allowed with this connection */
+-  connkeep(conn, "SMB default");
++  connclose(conn, "SMB default");
+=20
+   /* Parse the username, domain, and password */
+   slash =3D strchr(conn->user, '/');
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support=
/curl/curl_8.7.1.bb
index 14d63d6373..d026731751 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -36,6 +36,7 @@ SRC_URI =3D " \
     file://CVE-2026-1965-2.patch \
     file://CVE-2026-3783.patch \
     file://CVE-2026-3784.patch \
+    file://CVE-2026-5773.patch \
 "
=20
 SRC_URI:append:class-nativesdk =3D " \
--=20
2.34.1


