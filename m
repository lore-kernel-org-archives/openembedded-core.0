Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFB1ACD4F26
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 07:49:08 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15781.1782200938697261350
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 00:48:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=D74hihMo;
 spf=pass (domain: est.tech, ip: 52.101.66.9, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PWuPiyhGUOj3f58y6DUlKeA3PMV+vsciDSEzwatTEEU8rDD8wN6Cd2yEuaWhd6xJkYbqRsbcbL2KzeRO+b3Urzdz8ZBoUTiVvRLBvgbxE1rMpo4EtLZ5aPKGeFo5aaezcJp8ifVS8+fhSimgKnw0UsuPogNNEvIoeFZdRf3YdWXg20D5xTkezazOSn4WxAL1k/fix+/0hBuvOP1pqwQsuQdvCYm88gF+syPqecAgJD9qDyajt+xXAz7HLkSwlUXGePzucWv7TbWVWBVAHKYgJ7T8TE73BLULChPVDx/1SQeAORUwCHZIEi1BgY+7F1L0wjFvnG0lzaqPwBBe1FFpXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FvpR8t4ADsfJNnEh33n0SHlmIJsFf15EQ3sF6wmJQxQ=;
 b=X8m1kAR541MpcZmEJeq5wR1aUIJ/D1qdVy06+tGiGEA2MaABfbdUoQAGYIqptPC+zoTf97JOgh2OCTZXiRcbx6PGmO3O72nvLHvAoSWwyuDZ5DZsJNBS2lmWe2Pb1nKXcA+Jy7ga2zvYz/7846UdQwXMLDRjpwiyzoVYX+T9hQyKF6X/RdQtJ1sgw3E4f1iVDnPNvF6GA/YQPSu+wpXKk7p2uDwk1V1lwsufRTM2Sw6fSCBfjR0Z2mnbOQqxFc8WsLqvagrlM7fcg/mganV1xD5msDIp8LRwqvQ937nivniakSg9HEEoTorv9yUSZ1ZmWtC/3O/hXo5KVkmWpZnf7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FvpR8t4ADsfJNnEh33n0SHlmIJsFf15EQ3sF6wmJQxQ=;
 b=D74hihMoz0WCb207QbPEY/XwgngYcJ36ZA5NcWnODuRj/aRa4E8z2NV4zGP05CfGP/GvSYztn4ypaKRIs8P93icWeksAyPmtANft1u1rHU43xnS0heLj6ZvDGZownoKtcNd9SjrYc0MFuawR+MxMZsE+Xa/dyltjcvjKHClYG1qhaHWenB5QCPwP4ubV92YkcZi1EWxUMN8pSDgB5w9n72lcm9HWc74D0/vTESLQdceDPKZonqfpdBoYYXvC04lUI8nPAO/+enHHEJgIgFhVemiSC8P3Uo48CF9x9d4Zu/PjWwHZwXd5kxORIHmsirq/8iwSZIPtB6j0hoJu7hdYRw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by BESP189MB3179.EURP189.PROD.OUTLOOK.COM (2603:10a6:b10:f5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Tue, 23 Jun
 2026 07:48:54 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::18b0:e114:b839:ca49]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::18b0:e114:b839:ca49%8]) with mapi id 15.21.0139.018; Tue, 23 Jun 2026
 07:48:54 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [scarthgap][PATCH] curl: Fix CVE-2026-5773 - SMB connection reuse across shares
Date: Tue, 23 Jun 2026 09:48:47 +0200
Message-ID: <20260623074847.3424-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0152.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::27) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|BESP189MB3179:EE_
X-MS-Office365-Filtering-Correlation-Id: fda75ef0-d52f-4a8f-13d8-08ded0fbdfba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|11063799006|56012099006|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	hxc71qo3Q20UM2LqE2+u4+qPLDtYocpUPCW++gnC9CdGBATyu9/QJf0sArgciYULuH+VmsdJNzZipQ6Hcr1nMrhoGItIIZ0ozYsMZaI+eIaZO5doZWYufmtfEF0AjXM3OrqH7CbdR/27GKvpw1YlJxO02L6puxBIyZm669JTsMZbwXVH+EGUuC1zQgx6e5L2uxo2q7QbWuUtAax39mYgwnEq+L9DAp8qISzm5K3B2yj8hPaIyHaQiAEARlY2gEnToaLaETKNVpPP2Jox0Kkrx/ItFClPpu6a0ppNz+/MtEtFMQBr/RmFyVZ7CY/SnFfIU9qQogmLa55ngrfbti9MlZIOAwS/0cjoLCnNBpoV3zyd9x5WjRGzkAVuyUq8JZxc8K1sQxGRV7kgOPhH99EA3v74ot1dSuBG7eATnwA2pbcS0pzWuFME+/cOPe9zZHy0xytSFVEYqHmoNjV9/IiLEMbRMMqABu+Denm4YtwExQAMFxRx9WjsBXuVgs4k1SlFVBAIqujwaYREe5u4ZNWxIpXYfPnvPR+yIPCHyES1tcD1WkTc3es/ivy6Lp5CgIevnY5CnvdhyMKLV+/YtARs6mhKp+o+t3MUDobjlfEUIr4nrcnqzII+nWiD8uompVtCL9OfVBzS+G/3U2YnAkEn5gg8cJhh8eLxUUaKwOCfOIc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(11063799006)(56012099006)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?tpKYIPoxjPj3VuQrtSl8zBlHyEqoiopmgYdOr3QclGjjiX+cFiaoBVpMaW4E?=
 =?us-ascii?Q?+ZFYV4YTGSXE6Va1GdId4qe78qiDCYGPZDBRDyCRB+CHB7Katl6d+9LlVRsz?=
 =?us-ascii?Q?fdlMKO5+wEsYtHXaYzTn21bA+9UDtyZ46X3LWz/ESjYVSNA9L81b3wHeMhTE?=
 =?us-ascii?Q?0vljDa/Q29+PChD4CvZDaGjrHWcs2FgzVMqnVYCGEgD9svUq1bQZoXLN6knK?=
 =?us-ascii?Q?s4fXb5710mhGc5JmIAgWqIYH2asu5wczrWtvgbp286gicXCiauXyFP2d/PJH?=
 =?us-ascii?Q?PCi0hCARwKIBb7zuUJylv8SBlqQfzSEn8HmaeKuZ3s20ejIdd8Hcw3J0huS5?=
 =?us-ascii?Q?vMmHinveK8yJc4vF+D3GKI91n24FoMu6O9GuewveZ43A62FhUCDlYuywYqAQ?=
 =?us-ascii?Q?i47roJR8xZ5RQ/+18Ha6cn4pMY5fREpKTVc7vsBh+jnNnQrtbI5Nbkd4x8+g?=
 =?us-ascii?Q?5poIcyClBRHKlxnWjb/aCVURuOevzLWRPFdHv9T5q7ibPGgZjixwme1RbCfn?=
 =?us-ascii?Q?DoK4drW83Jo3O9jETnlwBtd8I7ZvV5a05/VxeSN9hiP6GhrGGnszuVM/HII+?=
 =?us-ascii?Q?LtsGms3XsWLSN+jZWCw/EhAAcGG0dxXwSMLbaB1XKHt73uqhJH8ip1CeJwpz?=
 =?us-ascii?Q?SRKnTLO15X3++i3ftBDHZbJmM2dNPj2V00j6qZYlPMs5nNsTVa0KODrCvTDn?=
 =?us-ascii?Q?fJu36j4C/PbnR8sXxl3MlVTM483NfCzhXg1EiUv7OWyfcl7ETSXwwYCOIEQx?=
 =?us-ascii?Q?EqZhFSjymysHvAcP21miqr5yipRyPkSieQhVmyRgg8V3jUe0FZ+O7K+mxcJm?=
 =?us-ascii?Q?68muBN3cnJ/mtisjPQMe3U53E9FzEPd0Wog2XR8E4vJiOdsqCQXQ31DZq1ps?=
 =?us-ascii?Q?7Zp9i4cAeP+ChX0tiZpk3RZLCAxFxPEp/SnSqzcza9KnhQwVmwFMKY3TtSij?=
 =?us-ascii?Q?InZr3aG/TnGkPEwXTTxTtibn2y4Rlxzj9rDE6oEi8U3pWF18n98+B7VidjQS?=
 =?us-ascii?Q?cx/O68Dho0nryhTtNcW1tD9/flT+vYciaYlyWUs9PE6NKH5nhiSi9Pgq/kDj?=
 =?us-ascii?Q?XYOEy7ZavxP48jYlPIa7X6ylK8XBy1qz8+O4czoHEMX3XhMslGr4tHM3bQir?=
 =?us-ascii?Q?YnM4CkAESi9t9yR8u83Ifn8roNqVIeqF3PiNBhso7Hkf5HmTLpdtOnHxbX87?=
 =?us-ascii?Q?Vkc4ozI1evmdcCP0Idqym0ldGg88GarE+p5WnMs6GZLgTUqFY1s/Jy5gktak?=
 =?us-ascii?Q?0EnKwQ7N7H+/gO5LplH2dNDtzLD1C891o9M8JTr83ZqHvy2SOZNSSqSf1ev6?=
 =?us-ascii?Q?GUs/Zmu+kYEjCFsf8+YDwXvNI3Xu8XxxR2oajtQK20DLFLF9Uypp8tshc3eQ?=
 =?us-ascii?Q?kzQPsdDWwK3LhH9o4KGMz42rNT1fju7nBJ8+0x0mpHtMoBLBHkmHwNwMC/So?=
 =?us-ascii?Q?a5fmS5NG5etaVCZn7bPqEy7f+VVkBvlRGay9xoMDQnWi8yNmfB5At1wZ4Eh0?=
 =?us-ascii?Q?RtsllbEfCaqjzYlAPS/FS5BR60Fa6Yhqm+I9/XjBzl2GCXrcS5LEkujcsV8Y?=
 =?us-ascii?Q?tP4N6ppGIvJDk0BZum4ERoi2Qh2KAHR8hnd8pJ5LtC49GFm04jOiUwXykf53?=
 =?us-ascii?Q?V3y+GDQlQSc067aKq80N+t7+yG6L6XyDNB4BSEVveg51PPxmZ4ITTCs2M3lD?=
 =?us-ascii?Q?YyJdJmhOTcw6Zjj0bh6lX2Rgua2UZFLSpW6w/3YqFymsJoON8FmawtumElLM?=
 =?us-ascii?Q?WFdX1zO2QFmZIRjwL69DziYHxIlGcDQ=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: fda75ef0-d52f-4a8f-13d8-08ded0fbdfba
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 07:48:54.3364
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: esNeo0gjAKQLFjD5mc2t6r/NiB7UsFUrUz/9Tlmw6e/QFtzSM4DOIMjFy3R9ii6O5Bjyh8hNfDomP4ADA8SCcl4MFmbgT5AajnQg28aGT+E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESP189MB3179
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 07:49:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239338

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
 .../curl/curl/CVE-2026-5773.patch             | 30 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-5773.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-5773.patch b/meta/reci=
pes-support/curl/curl/CVE-2026-5773.patch
new file mode 100644
index 0000000000..a62b389d62
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-5773.patch
@@ -0,0 +1,30 @@
+From 74a169575d6412dc0ff532acdf94de35a6c2a571 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Sun, 5 Apr 2026 18:23:35 +0200
+Subject: [PATCH] smb: disable connection reuse
+
+Signed-off-by: Daniel Stenberg <daniel@haxx.se>
+
+CVE: CVE-2026-5773
+Upstream-Status: Backport [https://github.com/curl/curl/commit/74a169575d6=
412dc0ff532acdf94de35a6c2a571]
+
+(cherry picked from commit 74a169575d6412dc0ff532acdf94de35a6c2a571)
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


