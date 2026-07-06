Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C6F3C43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 08:15:03 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.55])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.146480.1783325694287507165
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 01:14:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=j53CSZXP;
 spf=pass (domain: est.tech, ip: 40.107.159.55, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R0Um8BdQvlgZan8kRpKRcJnpQk90INr1KepGW02IZJAbMLz2gLWjqa1j0wWkhtGnZMlETynJG3qytV3td7g+0fYLjVnxP9tQRtNV19Jn8gsoZsLzqBKmJMkrJJTm4Ex/nBMu9xCpUsv6wmE0JXVt/YaBm4znCGxi7YEfIT5p0Xow6HwBjbxcq/jVYuIIRVUNNI+1BmUCwCouTDPZSjq+gs1xZUoYjv8+HeJhxp2HkAfKIWbejxiH7iceM2huoNgmjRR5nRSBCbFwUeA3k+lql0KBHxeIMPL0z30CIkFwmsuLHGYu+o3w8eX5X1mYMZNfrcmN7XwmQIevb8epreQMkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i8dfYN3m+Wlq0b75UCxO1m/ziLzl6V9dLlrlOMpYZck=;
 b=XkziJRePaVyE/Od5AnbZBHIS3ZqrVRjVbDzCACajWEPpP1fDEDhlsXtsT60zz+LRoSovkVrpSF3hCHBPOw6aTErrcu7HLXXIxE9uvm1lBRYmELs9gOnUL6AcUgBW+mCN0Am3GGIGCwzVhMMXprNzdUzc6xf8o+tb1MBgkRdGIKKkDZRZWo248PbwZt+jweJxo1sqO8XRrLiXr2opkUedcq4e04dOhDf54JH/LDsfUgfFt/PMz9uaUSl49W4yDj6r36X47B2jzAUN+CiE/mPlWG3QpCgY5JKcIEgSLlxKLTcTNzvZPcVcfD+iaQjijHs2g6bu74xbd3gEad6f1YCnIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i8dfYN3m+Wlq0b75UCxO1m/ziLzl6V9dLlrlOMpYZck=;
 b=j53CSZXPPpjyteuFQ5Nrk55KZyrrL5sG5ObRt7JTuBkvFqff4ap01SGZavhDEfw2vthjkaVqzN5+MhqFyhT2+iSe2ifOpUy/kCIeL4bdHfhnrMV5C31MxFyexU52bJ4S1txkJdbiYLWORfKvhR7QzQBW4EVjQOyqd+RK7+XxFJNuB13vlzUwvaZlHOyUUaho3uwhYiEV/Vwl5iG3ISkcUHSltt05G5h/klEnoXMVmE+J6u/lWRgZ8ZVNdc3Gew6Alc547q6IqHn2St13e3plfysFaM/e9Fybn9KRGppjZjHVljJea93Ll/hg28zXo/ajMzlKkyAfOU+lZm5Q1FWxng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by PR3P189MB1083.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:2a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Mon, 6 Jul
 2026 08:14:51 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%8]) with mapi id 15.21.0181.012; Mon, 6 Jul 2026
 08:14:51 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [scarthgap][PATCH v3] curl: fix CVE-2026-5773 - wrong reuse of SMB connection
Date: Mon,  6 Jul 2026 10:14:49 +0200
Message-ID: <20260706081449.10444-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260623074847.3424-1-jaipaul.cheernam@est.tech>
References: <20260623074847.3424-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0640.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::21) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|PR3P189MB1083:EE_
X-MS-Office365-Filtering-Correlation-Id: af01e511-6472-4db2-d6fb-08dedb36a746
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|18002099003|22082099003|3023799007|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 
	+OBDRmgjOdf/ZfjsSV+Bv8b/tZtWj8pR/a8C/5JW4xvyhwUO5VwZze1yijkRKgHNdzQlYbeMwywX65Ontdwnt4AHWmQd6xey9bFSlKBArljrWIfP1b816WlUYI7RWw2jbfn6B3h+McscrreV0Q4d8tZRxZhOlVj9rXUzuhHGj6lUNZbkFTi0PL/EYuHFIRVlEPT6p24nvzHw4pEJph/kxuyYlUmfalQFTF5aBr2ImRtvZFDZfUrDJiwuTgcnU3mWOzW8IiOnHB+pNMMTjR23X/4paLlv6Qns21CDhm7JNI5/XrM5oEz1AM2ethITE2gE7je18Q4OaFUFiZGIdfDsC2I5MMttPSPT7XwDKlGkxcGOho1nwweeSGYBKIWRugmH4LbbhIc1liFw9RjJK/KTIhC67OK4OYXIm1J9AVmfUtHve0t6H23mzgNs2roJ7ssMrmNR+as3R19nKjFth5lxI3nCk+JwPDJpHjp10V3Lm89TZjWqnf7FdSsM+iDvtTWojmnnrgskRY6ZLkoGrXgvwJhSLbjF+6qjvdPu0Qe3MUU4G5cOMdPeaiZiAdayn6vuqAie9IOeBsLPzn/8+T8uMAX84djrVN3gGDHSvcurrjs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(22082099003)(3023799007)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ENpFwaT6V0W2duCqLtaWyM/I5prrdGEORcJX+qubRVEO4z/EZV5IyWxzkQJW?=
 =?us-ascii?Q?8pp+WgRAR9NT3g51VbbV3iX/1hYaimWwmoGmVmz3Tnx0Jv7IAJnGxzB7oM6n?=
 =?us-ascii?Q?QX57RHR7gpyRX227QSYdkbSqRrzlnyglHkCkjxAgs9NXBrPxlu0Uwx/Rj5uO?=
 =?us-ascii?Q?9cqAQlzdwXwL/BLgICM4BGJTONir8pfraQNd49PQEwPbUFbT7dJXmGe1/9+K?=
 =?us-ascii?Q?CBcSsF1IMFq9D5WZMCLcM+Q1uVx3ADsCI8GSei2mwGpt9Ep4/z38QhmWsnNO?=
 =?us-ascii?Q?N0rBvj7KTkmnYwZpgP+90GT+i3vHOQobEN3p/Bk4wQhh2b6twIM6/PNQVles?=
 =?us-ascii?Q?e3yzsvMMUTgVehQbdm1ATFYItj826q1Y2u7rWB6511VPTuy9gibR1F2uQm8W?=
 =?us-ascii?Q?eOSd839SsXlUAjTw++feMQqH/1WLkmomgvOi4xOpqpO6fRsKrUkXRl99s4CH?=
 =?us-ascii?Q?RCQQ2pu3BIb4FyUgSm3TT/3kTgg+VdtqQJg4ytZLN3IXwFJywQd/2Y3qz0x7?=
 =?us-ascii?Q?/PhCqv26rvB/7Kovk8XQ5g55atZlfqW3wotYb47DPRxtPvdgJI923/fkpKBi?=
 =?us-ascii?Q?Fv+MSx6eXRHYerkbLEOkgmuuw/QFJDPZAc25HvMWwvMw1z5R7Cf8I5olGPEJ?=
 =?us-ascii?Q?axNf+LvQN2WXIO2FFWltmdSLTpRm0vKSWQ7HdddA+YqaHUroYnGaH9uWe4yQ?=
 =?us-ascii?Q?vy7+2JlYbM5X8iL8YbZDx3S1vzRHFaLskKGPYUsHEgNXZGDtE1SEqM74mr/+?=
 =?us-ascii?Q?LWa1bj+FioKKqEbENTE1dTEhBMW+fRKUDYA6SBxPbiQISBBcyObxjSF/hrWF?=
 =?us-ascii?Q?wv9HO10AIbTpB9uzZIJLbbqe41w31IgUf1jKByFFTWzk2akVVreaD4UnsvL7?=
 =?us-ascii?Q?pnkUzxolV0/05ClZnAN8nZ7nVbySNOzlznYgcFZUV2kKVFGOITVzzVw8WzWE?=
 =?us-ascii?Q?/Xz4XuQMH4liOjhgYTk0/EpwAzgSrKjLECw9I8wCspWIMQAi0u+iqZorWL8X?=
 =?us-ascii?Q?1m6KAWzt+BHXfeIN2LjE8to3RZk/T9VuCt/B29UFRmErSPldnTp/g2O34OMi?=
 =?us-ascii?Q?aML4QHt+tjekRk2VLz2uWrd+CcC8yuJGBIN7Sb0fBDb8qDtA4UXm+S/KwpiB?=
 =?us-ascii?Q?XigaQKSTXvHpAcI0WekqzOffs0bBIaEtGWSeMRGUUoYm3JardmRkUM04XeQN?=
 =?us-ascii?Q?yRGbmxJ81O5ccYzDDnQodi61+cmTL4Uk76SYyR2hr0PuyCh+edLLhzOOtZnf?=
 =?us-ascii?Q?Sea9XvXOEwGFeD2H8wkGr3F3vlKn8WjZVb7BJLRRFhWS0uVPeKrhN01imY6P?=
 =?us-ascii?Q?pLqCpBHk3U4P2NGuDrjJbzCUpjC+Hplq9nBhMV6INVLTJE7wN6K3EyOoUsZ7?=
 =?us-ascii?Q?0Y9SAvAIiSWP0rgTQHV4Gs6yTlEL1rxyGRGv6XK6N2E2i9E9KGUGX9KsuiYS?=
 =?us-ascii?Q?HyE2HU6yycrqsl5+l6PN5luHwn4gNc6Cde9WDTO5ib5h6yK3es2rJOVRJDja?=
 =?us-ascii?Q?4wEqQuV2rBM5uwYSCqFrjYpQrEpdEqc4uBAlX86XWzg/m+yanPwGLr2pvuTa?=
 =?us-ascii?Q?ytjMk/xZ3gu7XRIP1lg3yYFA+1OKigDNu86coG/ZtZwMF6uccayEy97RvQzC?=
 =?us-ascii?Q?y5gfy4K6+QN1cj5yE3Xmr+9OLCXz66G1bSfb5ETS9PCOrjLcpYQYcDjflX9A?=
 =?us-ascii?Q?6KvCBN7+1rPab33GBqgpXRa7CC5pN6PijKLQLbc8i85E9twJCC6qDWqJUA07?=
 =?us-ascii?Q?upwur5bl5w=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: af01e511-6472-4db2-d6fb-08dedb36a746
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 08:14:51.5498
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y0d5/2Wlu3RSZ82H++jgRETDHzkAAfJkmqDC8vKZxNqYfxgGjg2rR/tJgIeP6MXeDqfYKxfMUMX+ufjqNayWRtOcqNvFhnuLcP9DGXxcgAs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P189MB1083
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 08:15:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240220

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
 .../curl/curl/CVE-2026-5773.patch             | 40 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-5773.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-5773.patch b/meta/reci=
pes-support/curl/curl/CVE-2026-5773.patch
new file mode 100644
index 0000000000..42ec2b5a5f
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-5773.patch
@@ -0,0 +1,40 @@
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


