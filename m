Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35E04CA5FCE
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 10:27:01 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.24])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7822.1790850411235347614
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Oct 2026 03:26:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=Vqq4bKvi;
 spf=pass (domain: est.tech, ip: 52.101.65.24, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MFqQNaFlRBpqAwOe1ep1Jogo3JAWfLr5sVyhQVKl554l9D3B+YyojtEwWH7qnMZOp3hyKOjZ4FDPj3xSgDscnWmPg800aG43F/vXTdLFdNMC5bSF6PZNT8nJiehRpimiCSLMPJutgGWGL3NwqOU2Ha3xKSh/5gyCvVXva3F1Zsfa/K6P8PTdjJ0f3BIqxqPqRu3Y2WMfxSc3wTRbKAZRoFGJP6+i2HW5kxfjCaUKuVPql0Ms0K08F30PZKvB/U+fkOPGxPZUgqGtitixmQJVvk8DPGtwpwzc2RBFsqjjTebSArlf18hX7RpzrtMCj0gunDqYqqYs6kQ/+MX2N+kTLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QRb35RD0A4vWrgsFp34tNYnuItC/RSODtTkxiFJF/Nk=;
 b=ahcTiKSAlut5hyhhfeBl9ZkGYmd8/C2eX3Zgrn2PxxAQf2YtPJycP+222LcLEjrbOmDyPl0HBLfPTyEg9zT7BELKq2c5/QSxFWIauh78xiEnlR+QlVz1XLdF36jiNGTL59piIwSSj7GQ5Mse9On6+XsLJakvt9saAbr67A0cjvrL0gu5cq6/Oj8JfJ6WsXNY/CtUhVdXzmXLw4l4YGAYmagggpKn8f3g0Vqvqr2fqq2ytQa/jY2sE4xchAHpYvxFdfTqpEV2oW15zGOHeClbWmVoOWyOKruqf4Dc+rFYFeM4ogKykgWoDO5vQ5rQ0KuSTAMJ5Y56+Oba2f+v0jwFug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QRb35RD0A4vWrgsFp34tNYnuItC/RSODtTkxiFJF/Nk=;
 b=Vqq4bKvin65xcCiKwwD/cz/zcmP8jKqXcht8uB8zsoORNoUs2v5j1wc7Nnis+Xtcou0GlL3QFXmAfdvCqkyYEK2VhhZlTrb2ux+H4xqLPkWotAtAt/+00feeYBgT/DJEpstt6MYeaCxMohtoYBF6LVBwrp019e3rFmLljo3KSQV4urb1kCopmH2LJHwBJ/z6yMVUOCZepmWyIY3mYLxU9c+7sTZCNSMRotsNlUx+RcuRZt5xb2FgN4zevg0ZV4b3W+MGN5pzToVo3dHV2w2TTIL9Nu97dXgr789LOuor+LG7slcmGNZHN7HrRpRPgZjDV6TBv1kmjS+Zoe9bhdlSBQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AS4P189MB1848.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:4b0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Thu, 1 Oct
 2026 10:26:46 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0472.015; Thu, 1 Oct 2026
 10:26:46 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libsoup: Upgrade 3.6.6 -> 3.8.0
Date: Thu,  1 Oct 2026 12:26:45 +0200
Message-ID: <20261001102645.12210-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO6P123CA0040.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::18) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AS4P189MB1848:EE_
X-MS-Office365-Filtering-Correlation-Id: 04b72178-caae-458c-2775-08df1fa67efb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|6133799003|10067099003|260925021311599003|260925021911599003|56012099006|5023799004|11063799006|260925022911599003|18002099003|3023799007|29003799003|10126099003|25016099003|10063799003;
X-Microsoft-Antispam-Message-Info: 
	YlxZvds9Zl8fcW0XVlWpCEd4R1hga0F/r6c2e5q4a5k404xTb1fHxzhzG+PGdpEDqi7qYaTbsSYtywNJ3NK8MIyM/rdjqDB8MKET+Ko2cTACdE/WRIclERhanYBIgrQhx8u3xD+dR5PzDmKUh/sDrlkgR0zHiLmjnzA2trJLuhO7jHN+m9eXKlHplOok2QkwN+PYmeYy3hLOLo4mUoBWvk7hkNMjcy/hf8JTAo8OSrdvloC5FkeLwqTxTWQf7e8jmOQ0ny1WE3bLxyrnyVp11U10ACcxHPDv59CTOGxjMWw+qtWluHOmBFnVlhtGvAYMhlWnIS5qSyQYG5UFK2qdvEvgubTRm2z9SGvUVOFBPgjzODGmnMnlf0mbGR1ajMEd4lUAFmoWte5VHaakwi9zN4I+IGZsvLfR1NcwbSHA3GG7tM8lJc7gyumL0Cvxl3cU7qyS3KHeom8uFea4QspYTAk3WZWhMwbog6H0N7EIjhgndRtXi+okMI30UuRrvvK3o3FuJ5PgSsrG5Yb47CMBZNilwjdfivySW0LB+BuZ+n2kyytEHXa15EY3S60j+2CTFPa7DVCmwFWz4K/FFinuSlAT1jEQfgN5owaThoN8NiU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(6133799003)(10067099003)(260925021311599003)(260925021911599003)(56012099006)(5023799004)(11063799006)(260925022911599003)(18002099003)(3023799007)(29003799003)(10126099003)(25016099003)(10063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?nt3oXuClFlZpnP3Q5uPFeuEIg+JZTXovAXRi4r8ScXs4R3gKiQIvZmsGCuyj?=
 =?us-ascii?Q?2z8YJawCLg97odZflRQazRN+6V6V49qwkUcb6j3VRGk1RT3qhaT3l0Ol2/Ye?=
 =?us-ascii?Q?U/Prsb4vT/1S2Ug1DTGcWEIFko1fsgB/VQTbuKeZBwxjB/sgKa64JQJRcxGS?=
 =?us-ascii?Q?CdaRvKl49WEfHe3c8vRdHigT/VTch0O2xrbqRyesoOLlA7Q76fVG4vCqimZB?=
 =?us-ascii?Q?o3hc8aUeJOAildXjOQj5ek2f/bbaraJdw5o8E+VYlXPycWMQSN+aKdcZJNnl?=
 =?us-ascii?Q?S48z3PvdD1YUxPT0M1n+koYed72xWnwquPJblvwzc6vx/9N9H/OaDQOZ4LHb?=
 =?us-ascii?Q?T/XtQcx510A/pkdPH4bPlAd2pE2uQgpp6jjF2PBgfYrIJm4Wo+WQD0X9w+AT?=
 =?us-ascii?Q?S/k7Dq/o6Za2HWet5v0s/Efp5JEuN9NuRLJkVlXD96Xvcvoen0KKOGcJf5N3?=
 =?us-ascii?Q?fMRQmqice4ojlSR4pLoeIpTnRfxj6dgA2vftQDJpKokyUxQ3JI1iKy9ngAPd?=
 =?us-ascii?Q?Qdc0pXh5NFBx3mjoYSH5miyWsE8BMw5SPYeBBCq6pRMmCxEfVC0iQm8ay5F+?=
 =?us-ascii?Q?ad+v41V9floygBnCIVi+vI1dkX3rxNfq3dkHkTw7i+yd7MH+jvi8XK1uE0/p?=
 =?us-ascii?Q?+kLmTDkbphqQxZmoNSaJ4vpmMulBme2+ThaQjUebVv8Zpv+gmrN7qPLpsjFj?=
 =?us-ascii?Q?5kczzbrfH0Mef72wOM6m9O1nmvF3wTEJgMnODaNuXiI1nbRwQw2Ws1NaqXsC?=
 =?us-ascii?Q?QdJGO0zdjEVDPTTJygRsCIzUc1Su0RDbMm3fU40jjGfWlPkAIopgqS+N2lH1?=
 =?us-ascii?Q?BxD2DAk6toQmWMmj0IU2j+0JtPSrNcLu+qaoup3MKCeQX0eJpEuSiI3YMyrm?=
 =?us-ascii?Q?M83MHKDssnv7/SfmpYRubdsnUvNdRVAtvCaSjLESneSrTKnISMsZMA+7FT4+?=
 =?us-ascii?Q?yhNe77oeLjUkpmCOLsivJftNnW9oPgZni0TI57dQgGycLldhhjWgChADRjsa?=
 =?us-ascii?Q?uVNJu2CV1SdBB8Z0FdiOPoQimkJRkVOpSpAxdV1xAUtZMPK9Jgh8W/iHKgJd?=
 =?us-ascii?Q?O2S9TmhJCubHw1M/+hMC2OhFyenfDLCZxGE7eCgISyTa7SYpd/DagxUbdZwA?=
 =?us-ascii?Q?9tW9lvXeVpB7aWlzsaPhPCAVHuFxkJ0nWPf+kAcPL3UTgnsWU8XoFzPzQeB0?=
 =?us-ascii?Q?3XzkusIVmQMIk6SLSilqPzaA+TyKGvR9rHfEQe2zg/nIEKJMoEtsiXkNqA4U?=
 =?us-ascii?Q?k7pXBRLp9zjaFnpblTMkYzBmipBXhKzGF+Kx4UadCn5Qber4stMFxnQBXuWV?=
 =?us-ascii?Q?4YyJ/toDSPbLmaLE61NIP6IzX/NNo8Jzaxpg9TOeKAfu9mZef8izRaVzKgwF?=
 =?us-ascii?Q?dAo9DClhZO4T6EdRC3xA7urH+Gnwgb+c4GivA8etd49cAaRAsf8lGD+uAiIu?=
 =?us-ascii?Q?ewvoULOrYLYWPXcUdjo3D/PBQt+764rvbPeOPF1wNF+xLVdIbJpwYnaEXML7?=
 =?us-ascii?Q?i4HU/ORWjlfFfAA9HuTeQWR2Cp+soSU9kwKqHjudg0f7pJv/7tOUIuGQarPq?=
 =?us-ascii?Q?UzqpTgXIBntVihDu5Qj36ySJ9xfJ5QtShEc+m757cdZdTfqtG3lp1bkqMrGs?=
 =?us-ascii?Q?c2Nv6fBZKIYVk9AMQoRXtheqra5pV1EEVoE3NI2dHo8uBWjaEkK7OxUmi/q8?=
 =?us-ascii?Q?RL8kOeUUntq8CNGyVAzDYsREiciq+4khF3j68ZzhqEBYgxu8/PASQQNDyLMc?=
 =?us-ascii?Q?GZ1KGOJasA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 04b72178-caae-458c-2775-08df1fa67efb
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 10:26:46.7414
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CndXaefkx1Ln3wwZ9vTeQiDd6PgdJ2g5mlj2z11UZ6VbE9Ar3tNC3qPylgQeZpPuzgxphFc8dQBLlIvFE2FrzyRLLEjeyTR6KpEhF8qZgeg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P189MB1848
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Oct 2026 10:27:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247025

NEWS: https://github.com/GNOME/libsoup/blob/3.8.0/NEWS

- Drop CVE patches which are part of release

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../libsoup/libsoup/CVE-2025-32049-1.patch    | 229 -----------
 .../libsoup/libsoup/CVE-2025-32049-2.patch    |  34 --
 .../libsoup/libsoup/CVE-2025-32049-3.patch    | 133 -------
 .../libsoup/libsoup/CVE-2025-32049-4.patch    | 291 --------------
 .../libsoup/libsoup/CVE-2026-1539.patch       |  97 -----
 .../libsoup/libsoup/CVE-2026-2708.patch       | 218 -----------
 .../libsoup/libsoup/CVE-2026-4271.patch       | 362 ------------------
 .../libsoup/libsoup/CVE-2026-5119.patch       | 122 ------
 .../{libsoup_3.6.6.bb =3D> libsoup_3.8.0.bb}    |  12 +-
 9 files changed, 1 insertion(+), 1497 deletions(-)
 delete mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32049-1.p=
atch
 delete mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32049-2.p=
atch
 delete mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32049-3.p=
atch
 delete mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32049-4.p=
atch
 delete mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2026-1539.patc=
h
 delete mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2026-2708.patc=
h
 delete mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2026-4271.patc=
h
 delete mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2026-5119.patc=
h
 rename meta/recipes-support/libsoup/{libsoup_3.6.6.bb =3D> libsoup_3.8.0.b=
b} (83%)

diff --git a/meta/recipes-support/libsoup/libsoup/CVE-2025-32049-1.patch b/=
meta/recipes-support/libsoup/libsoup/CVE-2025-32049-1.patch
deleted file mode 100644
index adec7b3cf07..00000000000
--- a/meta/recipes-support/libsoup/libsoup/CVE-2025-32049-1.patch
+++ /dev/null
@@ -1,229 +0,0 @@
-From 46338bccc2ad9c34f892af19123f64ca2d9d866f Mon Sep 17 00:00:00 2001
-From: Ignacio Casal Quinteiro <qignacio@amazon.com>
-Date: Wed, 24 Jul 2024 15:20:35 +0200
-Subject: [PATCH 1/4] websocket: add a way to restrict the total message si=
ze
-
-Otherwise a client could send small packages smaller than
-total-incoming-payload-size but still to break the server
-with a big allocation
-
-Fixes: #390
-
-Change SOUP_AVAILABLE_IN_3_8 to SOUP_AVAILABLE_IN_3_6
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit=
/db87805ab565d67533dfed2cb409dbfd63c7fdce]
-CVE: CVE-2025-32049
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- libsoup/websocket/soup-websocket-connection.c | 106 +++++++++++++++++-
- libsoup/websocket/soup-websocket-connection.h |   7 ++
- 2 files changed, 110 insertions(+), 3 deletions(-)
-
-diff --git a/libsoup/websocket/soup-websocket-connection.c b/libsoup/webso=
cket/soup-websocket-connection.c
-index 36e8459..a4fc36e 100644
---- a/libsoup/websocket/soup-websocket-connection.c
-+++ b/libsoup/websocket/soup-websocket-connection.c
-@@ -78,6 +78,7 @@ enum {
- 	PROP_KEEPALIVE_INTERVAL,
- 	PROP_KEEPALIVE_PONG_TIMEOUT,
- 	PROP_EXTENSIONS,
-+	PROP_MAX_TOTAL_MESSAGE_SIZE,
-=20
-         LAST_PROPERTY
- };
-@@ -120,6 +121,7 @@ typedef struct {
- 	char *origin;
- 	char *protocol;
- 	guint64 max_incoming_payload_size;
-+	guint64 max_total_message_size;
- 	guint keepalive_interval;
- 	guint keepalive_pong_timeout;
- 	guint64 last_keepalive_seq_num;
-@@ -164,6 +166,7 @@ typedef struct {
- } SoupWebsocketConnectionPrivate;
-=20
- #define MAX_INCOMING_PAYLOAD_SIZE_DEFAULT   128 * 1024
-+#define MAX_TOTAL_MESSAGE_SIZE_DEFAULT   128 * 1024
- #define READ_BUFFER_SIZE 1024
- #define MASK_LENGTH 4
-=20
-@@ -696,8 +699,8 @@ bad_data_error_and_close (SoupWebsocketConnection *sel=
f)
- }
-=20
- static void
--too_big_error_and_close (SoupWebsocketConnection *self,
--                         guint64 payload_len)
-+too_big_incoming_payload_error_and_close (SoupWebsocketConnection *self,
-+                                          guint64 payload_len)
- {
-         SoupWebsocketConnectionPrivate *priv =3D soup_websocket_connectio=
n_get_instance_private (self);
- 	GError *error;
-@@ -713,6 +716,24 @@ too_big_error_and_close (SoupWebsocketConnection *sel=
f,
- 	emit_error_and_close (self, error, TRUE);
- }
-=20
-+static void
-+too_big_message_error_and_close (SoupWebsocketConnection *self,
-+                                 guint64 len)
-+{
-+	SoupWebsocketConnectionPrivate *priv =3D soup_websocket_connection_get_i=
nstance_private (self);
-+	GError *error;
-+
-+	error =3D g_error_new_literal (SOUP_WEBSOCKET_ERROR,
-+				     SOUP_WEBSOCKET_CLOSE_TOO_BIG,
-+				     priv->connection_type =3D=3D SOUP_WEBSOCKET_CONNECTION_SERVER ?
-+				     "Received WebSocket payload from the client larger than configur=
ed max-total-message-size" :
-+				     "Received WebSocket payload from the server larger than configur=
ed max-total-message-size");
-+	g_debug ("%s received message of size %" G_GUINT64_FORMAT " or greater, =
but max supported size is %" G_GUINT64_FORMAT,
-+	         priv->connection_type =3D=3D SOUP_WEBSOCKET_CONNECTION_SERVER ?=
 "server" : "client",
-+	         len, priv->max_total_message_size);
-+	emit_error_and_close (self, error, TRUE);
-+}
-+
- static void
- close_connection (SoupWebsocketConnection *self,
-                   gushort                  code,
-@@ -973,6 +994,12 @@ process_contents (SoupWebsocketConnection *self,
- 		switch (priv->message_opcode) {
- 		case 0x01:
- 		case 0x02:
-+			/* Safety valve */
-+			if (priv->max_total_message_size > 0 &&
-+			    (priv->message_data->len + payload_len) > priv->max_total_message_=
size) {
-+				too_big_message_error_and_close (self, (priv->message_data->len + pay=
load_len));
-+				return;
-+			}
- 			g_byte_array_append (priv->message_data, payload, payload_len);
- 			break;
- 		default:
-@@ -1111,7 +1138,7 @@ process_frame (SoupWebsocketConnection *self)
- 	/* Safety valve */
- 	if (priv->max_incoming_payload_size > 0 &&
- 	    payload_len > priv->max_incoming_payload_size) {
--		too_big_error_and_close (self, payload_len);
-+		too_big_incoming_payload_error_and_close (self, payload_len);
- 		return FALSE;
- 	}
-=20
-@@ -1428,6 +1455,10 @@ soup_websocket_connection_get_property (GObject *ob=
ject,
- 		g_value_set_pointer (value, priv->extensions);
- 		break;
-=20
-+        case PROP_MAX_TOTAL_MESSAGE_SIZE:
-+		g_value_set_uint64 (value, priv->max_total_message_size);
-+		break;
-+
- 	default:
- 		G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
- 		break;
-@@ -1486,6 +1517,10 @@ soup_websocket_connection_set_property (GObject *ob=
ject,
- 		priv->extensions =3D g_value_get_pointer (value);
- 		break;
-=20
-+	case PROP_MAX_TOTAL_MESSAGE_SIZE:
-+		priv->max_total_message_size =3D g_value_get_uint64 (value);
-+		break;
-+
- 	default:
- 		G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
- 		break;
-@@ -1716,6 +1751,26 @@ soup_websocket_connection_class_init (SoupWebsocket=
ConnectionClass *klass)
-                                       G_PARAM_CONSTRUCT_ONLY |
-                                       G_PARAM_STATIC_STRINGS);
-=20
-+	/**
-+	 * SoupWebsocketConnection:max-total-message-size:
-+	 *
-+	 * The total message size for incoming packets.
-+	 *
-+	 * The protocol expects or 0 to not limit it.
-+	 *
-+	 * Since: 3.8
-+	 */
-+        properties[PROP_MAX_TOTAL_MESSAGE_SIZE] =3D
-+                g_param_spec_uint64 ("max-total-message-size",
-+                                     "Max total message size",
-+                                     "Max total message size ",
-+                                     0,
-+                                     G_MAXUINT64,
-+                                     MAX_TOTAL_MESSAGE_SIZE_DEFAULT,
-+                                     G_PARAM_READWRITE |
-+                                     G_PARAM_CONSTRUCT |
-+                                     G_PARAM_STATIC_STRINGS);
-+
-         g_object_class_install_properties (gobject_class, LAST_PROPERTY, =
properties);
-=20
- 	/**
-@@ -2186,6 +2241,51 @@ soup_websocket_connection_set_max_incoming_payload_=
size (SoupWebsocketConnection
- 	}
- }
-=20
-+/**
-+ * soup_websocket_connection_get_max_total_message_size:
-+ * @self: the WebSocket
-+ *
-+ * Gets the maximum total message size allowed for packets.
-+ *
-+ * Returns: the maximum total message size.
-+ *
-+ * Since: 3.8
-+ */
-+guint64
-+soup_websocket_connection_get_max_total_message_size (SoupWebsocketConnec=
tion *self)
-+{
-+	SoupWebsocketConnectionPrivate *priv =3D soup_websocket_connection_get_i=
nstance_private (self);
-+
-+	g_return_val_if_fail (SOUP_IS_WEBSOCKET_CONNECTION (self), MAX_TOTAL_MES=
SAGE_SIZE_DEFAULT);
-+
-+	return priv->max_total_message_size;
-+}
-+
-+/**
-+ * soup_websocket_connection_set_max_total_message_size:
-+ * @self: the WebSocket
-+ * @max_total_message_size: the maximum total message size
-+ *
-+ * Sets the maximum total message size allowed for packets.
-+ *
-+ * It does not limit the outgoing packet size.
-+ *
-+ * Since: 3.8
-+ */
-+void
-+soup_websocket_connection_set_max_total_message_size (SoupWebsocketConnec=
tion *self,
-+                                                      guint64            =
      max_total_message_size)
-+{
-+	SoupWebsocketConnectionPrivate *priv =3D soup_websocket_connection_get_i=
nstance_private (self);
-+
-+	g_return_if_fail (SOUP_IS_WEBSOCKET_CONNECTION (self));
-+
-+	if (priv->max_total_message_size !=3D max_total_message_size) {
-+		priv->max_total_message_size =3D max_total_message_size;
-+		g_object_notify_by_pspec (G_OBJECT (self), properties[PROP_MAX_TOTAL_ME=
SSAGE_SIZE]);
-+	}
-+}
-+
- /**
-  * soup_websocket_connection_get_keepalive_interval:
-  * @self: the WebSocket
-diff --git a/libsoup/websocket/soup-websocket-connection.h b/libsoup/webso=
cket/soup-websocket-connection.h
-index f047c0a..ea0cb58 100644
---- a/libsoup/websocket/soup-websocket-connection.h
-+++ b/libsoup/websocket/soup-websocket-connection.h
-@@ -88,6 +88,13 @@ SOUP_AVAILABLE_IN_ALL
- void                soup_websocket_connection_set_max_incoming_payload_si=
ze (SoupWebsocketConnection *self,
-                                                                          =
    guint64                  max_incoming_payload_size);
-=20
-+SOUP_AVAILABLE_IN_3_6
-+guint64             soup_websocket_connection_get_max_total_message_size =
   (SoupWebsocketConnection *self);
-+
-+SOUP_AVAILABLE_IN_3_6
-+void                soup_websocket_connection_set_max_total_message_size =
   (SoupWebsocketConnection *self,
-+                                                                         =
    guint64                  max_total_message_size);
-+
- SOUP_AVAILABLE_IN_ALL
- guint               soup_websocket_connection_get_keepalive_interval (Sou=
pWebsocketConnection *self);
-=20
---=20
-2.34.1
-
diff --git a/meta/recipes-support/libsoup/libsoup/CVE-2025-32049-2.patch b/=
meta/recipes-support/libsoup/libsoup/CVE-2025-32049-2.patch
deleted file mode 100644
index 4cb9cf201b1..00000000000
--- a/meta/recipes-support/libsoup/libsoup/CVE-2025-32049-2.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From c00f1e961a17c0af1cd34881f64db2948f32bb65 Mon Sep 17 00:00:00 2001
-From: Ignacio Casal Quinteiro <qignacio@amazon.com>
-Date: Fri, 20 Sep 2024 12:12:38 +0200
-Subject: [PATCH 2/4] websocket-test: set the total message size
-
-This is required when sending a big amount of data
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit=
/4904a46a2d9a014efa6be01a186ac353dbf5047b]
-CVE: CVE-2025-32049
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- tests/websocket-test.c | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/tests/websocket-test.c b/tests/websocket-test.c
-index c924601..1678042 100644
---- a/tests/websocket-test.c
-+++ b/tests/websocket-test.c
-@@ -615,6 +615,11 @@ test_send_big_packets (Test *test,
- 	soup_websocket_connection_set_max_incoming_payload_size (test->server, 1=
000 * 1000 + 1);
- 	g_assert_true (soup_websocket_connection_get_max_incoming_payload_size (=
test->server) =3D=3D (1000 * 1000 + 1));
-=20
-+	soup_websocket_connection_set_max_total_message_size (test->client, 1000=
 * 1000 + 1);
-+	g_assert (soup_websocket_connection_get_max_total_message_size (test->cl=
ient) =3D=3D (1000 * 1000 + 1));
-+	soup_websocket_connection_set_max_total_message_size (test->server, 1000=
 * 1000 + 1);
-+	g_assert (soup_websocket_connection_get_max_total_message_size (test->se=
rver) =3D=3D (1000 * 1000 + 1));
-+
- 	sent =3D g_bytes_new_take (g_strnfill (1000 * 1000, '?'), 1000 * 1000);
- 	soup_websocket_connection_send_text (test->server, g_bytes_get_data (sen=
t, NULL));
- 	WAIT_UNTIL (received !=3D NULL);
---=20
-2.34.1
-
diff --git a/meta/recipes-support/libsoup/libsoup/CVE-2025-32049-3.patch b/=
meta/recipes-support/libsoup/libsoup/CVE-2025-32049-3.patch
deleted file mode 100644
index b5ccf374bf1..00000000000
--- a/meta/recipes-support/libsoup/libsoup/CVE-2025-32049-3.patch
+++ /dev/null
@@ -1,133 +0,0 @@
-From aa189f8bf0593427c67e0becb13f60f2da2fea26 Mon Sep 17 00:00:00 2001
-From: Michael Catanzaro <mcatanzaro@redhat.com>
-Date: Thu, 8 May 2025 16:16:25 -0500
-Subject: [PATCH 3/4] Set message size limit in SoupServer rather than
- SoupWebsocketConnection
-
-We're not sure about the compatibility implications of having a default
-size limit for clients.
-
-Also not sure whether the server limit is actually set appropriately,
-but there is probably very little server usage of
-SoupWebsocketConnection in the wild, so it's not so likely to break
-things.
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit=
/2df34d9544cabdbfdedd3b36f098cf69233b1df7]
-CVE: CVE-2025-32049
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- libsoup/server/soup-server.c                  | 24 +++++++++++++++----
- libsoup/websocket/soup-websocket-connection.c | 24 +++++++++++++------
- 2 files changed, 36 insertions(+), 12 deletions(-)
-
-diff --git a/libsoup/server/soup-server.c b/libsoup/server/soup-server.c
-index 63af0cf..023abed 100644
---- a/libsoup/server/soup-server.c
-+++ b/libsoup/server/soup-server.c
-@@ -188,6 +188,16 @@ static GParamSpec *properties[LAST_PROPERTY] =3D { NU=
LL, };
-=20
- G_DEFINE_TYPE_WITH_PRIVATE (SoupServer, soup_server, G_TYPE_OBJECT)
-=20
-+/* SoupWebsocketConnection by default limits only maximum packet size. Bu=
t a
-+ * message may consist of multiple packets, so SoupServer additionally re=
stricts
-+ * total message size to mitigate denial of service attacks on the server=
.
-+ * SoupWebsocketConnection does not do this by default because I don't kn=
ow
-+ * whether that would or would not cause compatibility problems for websi=
tes.
-+ *
-+ * This size is in bytes and it is arbitrary.
-+ */
-+#define MAX_TOTAL_MESSAGE_SIZE_DEFAULT   128 * 1024
-+
- static void request_finished (SoupServerMessage      *msg,
-                               SoupMessageIOCompletion completion,
-                               SoupServer             *server);
-@@ -952,11 +962,15 @@ complete_websocket_upgrade (SoupServer        *serve=
r,
-=20
- 	g_object_ref (msg);
- 	stream =3D soup_server_message_steal_connection (msg);
--	conn =3D soup_websocket_connection_new (stream, uri,
--					      SOUP_WEBSOCKET_CONNECTION_SERVER,
--					      soup_message_headers_get_one_common (soup_server_message_get_r=
equest_headers (msg), SOUP_HEADER_ORIGIN),
--					      soup_message_headers_get_one_common (soup_server_message_get_r=
esponse_headers (msg), SOUP_HEADER_SEC_WEBSOCKET_PROTOCOL),
--					      handler->websocket_extensions);
-+	conn =3D SOUP_WEBSOCKET_CONNECTION (g_object_new (SOUP_TYPE_WEBSOCKET_CO=
NNECTION,
-+					  "io-stream", stream,
-+					  "uri", uri,
-+					  "connection-type", SOUP_WEBSOCKET_CONNECTION_SERVER,
-+					  "origin", soup_message_headers_get_one_common (soup_server_message=
_get_request_headers (msg), SOUP_HEADER_ORIGIN),
-+					  "protocol", soup_message_headers_get_one_common (soup_server_messa=
ge_get_response_headers (msg), SOUP_HEADER_SEC_WEBSOCKET_PROTOCOL),
-+					  "extensions", handler->websocket_extensions,
-+					  "max-total-message-size", (guint64)MAX_TOTAL_MESSAGE_SIZE_DEFAULT,
-+					  NULL));
- 	handler->websocket_extensions =3D NULL;
- 	g_object_unref (stream);
-=20
-diff --git a/libsoup/websocket/soup-websocket-connection.c b/libsoup/webso=
cket/soup-websocket-connection.c
-index a4fc36e..f60297c 100644
---- a/libsoup/websocket/soup-websocket-connection.c
-+++ b/libsoup/websocket/soup-websocket-connection.c
-@@ -166,7 +166,6 @@ typedef struct {
- } SoupWebsocketConnectionPrivate;
-=20
- #define MAX_INCOMING_PAYLOAD_SIZE_DEFAULT   128 * 1024
--#define MAX_TOTAL_MESSAGE_SIZE_DEFAULT   128 * 1024
- #define READ_BUFFER_SIZE 1024
- #define MASK_LENGTH 4
-=20
-@@ -1681,9 +1680,10 @@ soup_websocket_connection_class_init (SoupWebsocket=
ConnectionClass *klass)
- 	/**
- 	 * SoupWebsocketConnection:max-incoming-payload-size:
- 	 *
--	 * The maximum payload size for incoming packets.
-+	 * The maximum payload size for incoming packets, or 0 to not limit it.
- 	 *
--	 * The protocol expects or 0 to not limit it.
-+	 * Each message may consist of multiple packets, so also refer to
-+	 * [property@WebSocketConnection:max-total-message-size].
- 	 */
-         properties[PROP_MAX_INCOMING_PAYLOAD_SIZE] =3D
-                 g_param_spec_uint64 ("max-incoming-payload-size",
-@@ -1754,9 +1754,19 @@ soup_websocket_connection_class_init (SoupWebsocket=
ConnectionClass *klass)
- 	/**
- 	 * SoupWebsocketConnection:max-total-message-size:
- 	 *
--	 * The total message size for incoming packets.
-+	 * The maximum size for incoming messages.
- 	 *
--	 * The protocol expects or 0 to not limit it.
-+	 * Set to a value to limit the total message size, or 0 to not
-+	 * limit it.
-+	 *
-+	 * [method@Server.add_websocket_handler] will set this to a nonzero
-+	 * default value to mitigate denial of service attacks. Clients must
-+	 * choose their own default if they need to mitigate denial of service
-+	 * attacks. You also need to set your own default if creating your own
-+	 * server SoupWebsocketConnection without using SoupServer.
-+	 *
-+	 * Each message may consist of multiple packets, so also refer to
-+	 * [property@WebSocketConnection:max-incoming-payload-size].
- 	 *
- 	 * Since: 3.8
- 	 */
-@@ -1766,7 +1776,7 @@ soup_websocket_connection_class_init (SoupWebsocketC=
onnectionClass *klass)
-                                      "Max total message size ",
-                                      0,
-                                      G_MAXUINT64,
--                                     MAX_TOTAL_MESSAGE_SIZE_DEFAULT,
-+                                     0,
-                                      G_PARAM_READWRITE |
-                                      G_PARAM_CONSTRUCT |
-                                      G_PARAM_STATIC_STRINGS);
-@@ -2256,7 +2266,7 @@ soup_websocket_connection_get_max_total_message_size=
 (SoupWebsocketConnection *s
- {
- 	SoupWebsocketConnectionPrivate *priv =3D soup_websocket_connection_get_i=
nstance_private (self);
-=20
--	g_return_val_if_fail (SOUP_IS_WEBSOCKET_CONNECTION (self), MAX_TOTAL_MES=
SAGE_SIZE_DEFAULT);
-+	g_return_val_if_fail (SOUP_IS_WEBSOCKET_CONNECTION (self), 0);
-=20
- 	return priv->max_total_message_size;
- }
---=20
-2.34.1
-
diff --git a/meta/recipes-support/libsoup/libsoup/CVE-2025-32049-4.patch b/=
meta/recipes-support/libsoup/libsoup/CVE-2025-32049-4.patch
deleted file mode 100644
index c89637eae24..00000000000
--- a/meta/recipes-support/libsoup/libsoup/CVE-2025-32049-4.patch
+++ /dev/null
@@ -1,291 +0,0 @@
-From 800cbde5e42131bdea3d6f30808b7e034d45d438 Mon Sep 17 00:00:00 2001
-From: Michael Catanzaro <mcatanzaro@redhat.com>
-Date: Fri, 16 May 2025 16:55:40 -0500
-Subject: [PATCH 4/4] Add tests for max-incoming-packet-size and
- max-total-message-size
-
-An even better test would verify that it's possible to send big messages
-containing small packets, but libsoup doesn't offer control over packet
-size, and I don't want to take the time to learn how WebSockets work to
-figure out how to do that manually. Instead, I just check that both
-limits work, for both client and server.
-
-I didn't add deflate variants of these tests because I doubt that would
-add valuable coverage.
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit=
/4d00b45b7eebdcfa0706b58e34c40b8a0a16015b]
-CVE: CVE-2025-32049
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- tests/websocket-test.c | 213 +++++++++++++++++++++++++++++++++++++----
- 1 file changed, 196 insertions(+), 17 deletions(-)
-
-diff --git a/tests/websocket-test.c b/tests/websocket-test.c
-index 1678042..60da66f 100644
---- a/tests/websocket-test.c
-+++ b/tests/websocket-test.c
-@@ -591,16 +591,9 @@ test_send_big_packets (Test *test,
- {
- 	GBytes *sent =3D NULL;
- 	GBytes *received =3D NULL;
-+	gulong signal_id;
-=20
--	g_signal_connect (test->client, "message", G_CALLBACK (on_text_message),=
 &received);
--
--	sent =3D g_bytes_new_take (g_strnfill (400, '!'), 400);
--	soup_websocket_connection_send_text (test->server, g_bytes_get_data (sen=
t, NULL));
--	WAIT_UNTIL (received !=3D NULL);
--	g_assert_true (g_bytes_equal (sent, received));
--	g_bytes_unref (sent);
--	g_bytes_unref (received);
--	received =3D NULL;
-+	signal_id =3D g_signal_connect (test->client, "message", G_CALLBACK (on_=
text_message), &received);
-=20
- 	sent =3D g_bytes_new_take (g_strnfill (100 * 1000, '?'), 100 * 1000);
- 	soup_websocket_connection_send_text (test->server, g_bytes_get_data (sen=
t, NULL));
-@@ -611,23 +604,173 @@ test_send_big_packets (Test *test,
- 	received =3D NULL;
-=20
- 	soup_websocket_connection_set_max_incoming_payload_size (test->client, 1=
000 * 1000 + 1);
--	g_assert_true (soup_websocket_connection_get_max_incoming_payload_size (=
test->client) =3D=3D (1000 * 1000 + 1));
-+	g_assert_cmpuint (soup_websocket_connection_get_max_incoming_payload_siz=
e (test->client), =3D=3D, 1000 * 1000 + 1);
- 	soup_websocket_connection_set_max_incoming_payload_size (test->server, 1=
000 * 1000 + 1);
--	g_assert_true (soup_websocket_connection_get_max_incoming_payload_size (=
test->server) =3D=3D (1000 * 1000 + 1));
-+	g_assert_cmpuint (soup_websocket_connection_get_max_incoming_payload_siz=
e (test->server), =3D=3D, 1000 * 1000 + 1);
-=20
- 	soup_websocket_connection_set_max_total_message_size (test->client, 1000=
 * 1000 + 1);
--	g_assert (soup_websocket_connection_get_max_total_message_size (test->cl=
ient) =3D=3D (1000 * 1000 + 1));
-+	g_assert_cmpuint (soup_websocket_connection_get_max_total_message_size (=
test->client), =3D=3D, 1000 * 1000 + 1);
- 	soup_websocket_connection_set_max_total_message_size (test->server, 1000=
 * 1000 + 1);
--	g_assert (soup_websocket_connection_get_max_total_message_size (test->se=
rver) =3D=3D (1000 * 1000 + 1));
-+	g_assert_cmpuint (soup_websocket_connection_get_max_total_message_size (=
test->server), =3D=3D, 1000 * 1000 + 1);
-=20
- 	sent =3D g_bytes_new_take (g_strnfill (1000 * 1000, '?'), 1000 * 1000);
- 	soup_websocket_connection_send_text (test->server, g_bytes_get_data (sen=
t, NULL));
- 	WAIT_UNTIL (received !=3D NULL);
- 	g_assert_true (g_bytes_equal (sent, received));
-+	g_bytes_unref (received);
-+	received =3D NULL;
-+
-+	/* Reverse the test and send the big message to the server. */
-+	g_signal_handler_disconnect (test->client, signal_id);
-+	g_signal_connect (test->server, "message", G_CALLBACK (on_text_message),=
 &received);
-+
-+	soup_websocket_connection_send_text (test->client, g_bytes_get_data (sen=
t, NULL));
-+	WAIT_UNTIL (received !=3D NULL);
-+	g_assert_true (g_bytes_equal (sent, received));
- 	g_bytes_unref (sent);
- 	g_bytes_unref (received);
- }
-=20
-+static void
-+test_send_big_packets_direct (Test *test,
-+                              gconstpointer data)
-+{
-+	g_assert_cmpuint (soup_websocket_connection_get_max_incoming_payload_siz=
e (test->client), =3D=3D, 128 * 1024);
-+	g_assert_cmpuint (soup_websocket_connection_get_max_total_message_size (=
test->client), =3D=3D, 0);
-+
-+	g_assert_cmpuint (soup_websocket_connection_get_max_incoming_payload_siz=
e (test->server), =3D=3D, 128 * 1024);
-+	g_assert_cmpuint (soup_websocket_connection_get_max_total_message_size (=
test->server), =3D=3D, 0);
-+
-+	test_send_big_packets (test, data);
-+}
-+
-+static void
-+test_send_big_packets_soup (Test *test,
-+                            gconstpointer data)
-+{
-+	g_assert_cmpuint (soup_websocket_connection_get_max_incoming_payload_siz=
e (test->client), =3D=3D, 128 * 1024);
-+	g_assert_cmpuint (soup_websocket_connection_get_max_total_message_size (=
test->client), =3D=3D, 0);
-+
-+	/* Max total message size defaults to 0 (unlimited), but SoupServer appl=
ies its own limit by default. */
-+	g_assert_cmpuint (soup_websocket_connection_get_max_incoming_payload_siz=
e (test->server), =3D=3D, 128 * 1024);
-+	g_assert_cmpuint (soup_websocket_connection_get_max_total_message_size (=
test->server), =3D=3D, 128 * 1024);
-+
-+	test_send_big_packets (test, data);
-+}
-+
-+static void
-+test_send_exceeding_client_max_payload_size (Test *test,
-+                                             gconstpointer data)
-+{
-+	GBytes *sent =3D NULL;
-+	GBytes *received =3D NULL;
-+	gboolean close_event =3D FALSE;
-+	GError *error =3D NULL;
-+
-+	g_signal_connect (test->server, "error", G_CALLBACK (on_error_copy), &er=
ror);
-+	g_signal_connect (test->client, "closed", G_CALLBACK (on_close_set_flag)=
, &close_event);
-+
-+	g_assert_cmpuint (soup_websocket_connection_get_max_incoming_payload_siz=
e (test->client), =3D=3D, 128 * 1024);
-+
-+	soup_websocket_connection_set_max_incoming_payload_size (test->server, 0=
);
-+	g_assert_cmpuint (soup_websocket_connection_get_max_incoming_payload_siz=
e (test->server), =3D=3D, 0);
-+
-+	/* The message to the client is dropped due to the client's limit. */
-+	sent =3D g_bytes_new_take (g_strnfill (1000 * 1000, '?'), 1000 * 1000);
-+	soup_websocket_connection_send_text (test->server, g_bytes_get_data (sen=
t, NULL));
-+	g_bytes_unref (sent);
-+	WAIT_UNTIL (close_event);
-+	g_assert_null (received);
-+	g_assert_error (error, G_IO_ERROR, G_IO_ERROR_CONNECTION_CLOSED);
-+	g_assert_no_error (test->client_error);
-+}
-+
-+static void
-+test_send_exceeding_server_max_payload_size (Test *test,
-+                                             gconstpointer data)
-+{
-+	GBytes *sent =3D NULL;
-+	GBytes *received =3D NULL;
-+	gboolean close_event =3D FALSE;
-+	GError *error =3D NULL;
-+
-+	g_signal_connect (test->client, "error", G_CALLBACK (on_error_copy), &er=
ror);
-+	g_signal_connect (test->server, "closed", G_CALLBACK (on_close_set_flag)=
, &close_event);
-+
-+	soup_websocket_connection_set_max_incoming_payload_size (test->client, 0=
);
-+	g_assert_cmpuint (soup_websocket_connection_get_max_incoming_payload_siz=
e (test->client), =3D=3D, 0);
-+
-+	g_assert_cmpuint (soup_websocket_connection_get_max_incoming_payload_siz=
e (test->server), =3D=3D, 128 * 1024);
-+
-+	/* The message to the server is dropped due to the server's limit. */
-+	sent =3D g_bytes_new_take (g_strnfill (1000 * 1000, '?'), 1000 * 1000);
-+	soup_websocket_connection_send_text (test->client, g_bytes_get_data (sen=
t, NULL));
-+	g_bytes_unref (sent);
-+	WAIT_UNTIL (close_event);
-+	g_assert_null (received);
-+	g_assert_error (error, G_IO_ERROR, G_IO_ERROR_CONNECTION_CLOSED);
-+	g_assert_no_error (test->client_error);
-+}
-+
-+static void
-+test_send_exceeding_client_max_message_size (Test *test,
-+                                             gconstpointer data)
-+{
-+	GBytes *sent =3D NULL;
-+	GBytes *received =3D NULL;
-+	gboolean close_event =3D FALSE;
-+	GError *error =3D NULL;
-+
-+	g_signal_connect (test->server, "error", G_CALLBACK (on_error_copy), &er=
ror);
-+	g_signal_connect (test->client, "closed", G_CALLBACK (on_close_set_flag)=
, &close_event);
-+
-+	soup_websocket_connection_set_max_total_message_size (test->client, 128 =
* 1024);
-+	g_assert_cmpuint (soup_websocket_connection_get_max_total_message_size (=
test->client), =3D=3D, 128 * 1024);
-+
-+	soup_websocket_connection_set_max_total_message_size (test->server, 0);
-+	g_assert_cmpuint (soup_websocket_connection_get_max_total_message_size (=
test->server), =3D=3D, 0);
-+
-+	/* The message to the client is dropped due to the client's limit. */
-+	sent =3D g_bytes_new_take (g_strnfill (1000 * 1000, '?'), 1000 * 1000);
-+	soup_websocket_connection_send_text (test->server, g_bytes_get_data (sen=
t, NULL));
-+	g_bytes_unref (sent);
-+	WAIT_UNTIL (close_event);
-+	g_assert_null (received);
-+	g_assert_error (error, G_IO_ERROR, G_IO_ERROR_CONNECTION_CLOSED);
-+	g_assert_no_error (test->client_error);
-+}
-+
-+static void
-+test_send_exceeding_server_max_message_size (Test *test,
-+                                             gconstpointer data)
-+{
-+	GBytes *sent =3D NULL;
-+	GBytes *received =3D NULL;
-+	gboolean close_event =3D FALSE;
-+	GError *error =3D NULL;
-+
-+	g_signal_connect (test->client, "error", G_CALLBACK (on_error_copy), &er=
ror);
-+	g_signal_connect (test->server, "closed", G_CALLBACK (on_close_set_flag)=
, &close_event);
-+
-+	soup_websocket_connection_set_max_total_message_size (test->client, 0);
-+	g_assert_cmpuint (soup_websocket_connection_get_max_total_message_size (=
test->client), =3D=3D, 0);
-+
-+	/* Set the server message total message size manually, because its
-+	 * default is different for direct connection vs. soup connection.
-+	 */
-+	soup_websocket_connection_set_max_total_message_size (test->server, 128 =
* 1024);
-+	g_assert_cmpuint (soup_websocket_connection_get_max_total_message_size (=
test->server), =3D=3D, 128 * 1024);
-+
-+	/* The message to the server is dropped due to the server's limit. */
-+	sent =3D g_bytes_new_take (g_strnfill (1000 * 1000, '?'), 1000 * 1000);
-+	soup_websocket_connection_send_text (test->client, g_bytes_get_data (sen=
t, NULL));
-+	g_bytes_unref (sent);
-+	WAIT_UNTIL (close_event);
-+	g_assert_null (received);
-+	g_assert_error (error, G_IO_ERROR, G_IO_ERROR_CONNECTION_CLOSED);
-+	g_assert_no_error (test->client_error);
-+}
-+
- static void
- test_send_empty_packets (Test *test,
- 			 gconstpointer data)
-@@ -2262,11 +2405,47 @@ main (int argc,
-=20
- 	g_test_add ("/websocket/direct/send-big-packets", Test, NULL,
- 		    setup_direct_connection,
--		    test_send_big_packets,
-+		    test_send_big_packets_direct,
- 		    teardown_direct_connection);
- 	g_test_add ("/websocket/soup/send-big-packets", Test, NULL,
- 		    setup_soup_connection,
--		    test_send_big_packets,
-+		    test_send_big_packets_soup,
-+		    teardown_soup_connection);
-+
-+	g_test_add ("/websocket/direct/send-exceeding-client-max-payload-size", =
Test, NULL,
-+		    setup_direct_connection,
-+		    test_send_exceeding_client_max_payload_size,
-+		    teardown_direct_connection);
-+	g_test_add ("/websocket/soup/send-exceeding-client-max-payload-size", Te=
st, NULL,
-+		    setup_soup_connection,
-+		    test_send_exceeding_client_max_payload_size,
-+		    teardown_soup_connection);
-+
-+	g_test_add ("/websocket/direct/send-exceeding-server-max-payload-size", =
Test, NULL,
-+		    setup_direct_connection,
-+		    test_send_exceeding_server_max_payload_size,
-+		    teardown_direct_connection);
-+	g_test_add ("/websocket/soup/send-exceeding-server-max-payload-size", Te=
st, NULL,
-+		    setup_soup_connection,
-+		    test_send_exceeding_server_max_payload_size,
-+		    teardown_soup_connection);
-+
-+	g_test_add ("/websocket/direct/send-exceeding-client-max-message-size", =
Test, NULL,
-+		    setup_direct_connection,
-+		    test_send_exceeding_client_max_message_size,
-+		    teardown_direct_connection);
-+	g_test_add ("/websocket/soup/send-exceeding-client-max-message-size", Te=
st, NULL,
-+		    setup_soup_connection,
-+		    test_send_exceeding_client_max_message_size,
-+		    teardown_soup_connection);
-+
-+	g_test_add ("/websocket/direct/send-exceeding-server-max-message-size", =
Test, NULL,
-+		    setup_direct_connection,
-+		    test_send_exceeding_server_max_message_size,
-+		    teardown_direct_connection);
-+	g_test_add ("/websocket/soup/send-exceeding-server-max-message-size", Te=
st, NULL,
-+		    setup_soup_connection,
-+		    test_send_exceeding_server_max_message_size,
- 		    teardown_soup_connection);
-=20
- 	g_test_add ("/websocket/direct/send-empty-packets", Test, NULL,
-@@ -2421,11 +2600,11 @@ main (int argc,
-=20
- 	g_test_add ("/websocket/direct/deflate-send-big-packets", Test, NULL,
- 		    setup_direct_connection_with_extensions,
--		    test_send_big_packets,
-+		    test_send_big_packets_direct,
- 		    teardown_direct_connection);
- 	g_test_add ("/websocket/soup/deflate-send-big-packets", Test, NULL,
- 		    setup_soup_connection_with_extensions,
--		    test_send_big_packets,
-+		    test_send_big_packets_soup,
- 		    teardown_soup_connection);
-=20
- 	g_test_add ("/websocket/direct/deflate-send-empty-packets", Test, NULL,
---=20
-2.34.1
-
diff --git a/meta/recipes-support/libsoup/libsoup/CVE-2026-1539.patch b/met=
a/recipes-support/libsoup/libsoup/CVE-2026-1539.patch
deleted file mode 100644
index e887b441df9..00000000000
--- a/meta/recipes-support/libsoup/libsoup/CVE-2026-1539.patch
+++ /dev/null
@@ -1,97 +0,0 @@
-From 7a70f089e13cc113032b1459286835b72a2986af Mon Sep 17 00:00:00 2001
-From: Carlos Garcia Campos <cgarcia@igalia.com>
-Date: Tue, 20 Jan 2026 13:17:42 +0100
-Subject: [PATCH] Also remove Proxy-Authorization header on cross origin
- redirect
-
-Closes #489
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit=
/98c1285d9d78662c38bf14b4a128af01ccfdb446]
-CVE: CVE-2026-1539
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- libsoup/soup-session.c |  1 +
- tests/httpd.conf.in    |  1 +
- tests/proxy-test.c     | 34 ++++++++++++++++++++++++++++++++++
- 3 files changed, 36 insertions(+)
-
-diff --git a/libsoup/soup-session.c b/libsoup/soup-session.c
-index 2d34022..386d145 100644
---- a/libsoup/soup-session.c
-+++ b/libsoup/soup-session.c
-@@ -1234,6 +1234,7 @@ soup_session_redirect_message (SoupSession *session,
-         /* Strip all credentials on cross-origin redirect. */
-         if (!soup_uri_host_equal (soup_message_get_uri (msg), new_uri)) {
-                 soup_message_headers_remove_common (soup_message_get_requ=
est_headers (msg), SOUP_HEADER_AUTHORIZATION);
-+                soup_message_headers_remove_common (soup_message_get_requ=
est_headers (msg), SOUP_HEADER_PROXY_AUTHORIZATION);
-                 soup_message_set_auth (msg, NULL);
-         }
-=20
-diff --git a/tests/httpd.conf.in b/tests/httpd.conf.in
-index 809dc5c..cc0a116 100644
---- a/tests/httpd.conf.in
-+++ b/tests/httpd.conf.in
-@@ -34,6 +34,7 @@ LoadModule ssl_module           @APACHE_SSL_MODULE_DIR@/=
mod_ssl.so
- DirectoryIndex index.txt
- TypesConfig /dev/null
- Redirect permanent /redirected /index.txt
-+Redirect permanent /Basic/realm1/redirected https://127.0.0.1:47525/index=
.txt
-=20
- # Prefer http1 for now because most of the tests expect http1 behavior.
- Protocols http/1.1 h2
-diff --git a/tests/proxy-test.c b/tests/proxy-test.c
-index d730c8a..68c97ac 100644
---- a/tests/proxy-test.c
-+++ b/tests/proxy-test.c
-@@ -269,6 +269,39 @@ do_proxy_redirect_test (void)
- 	soup_test_session_abort_unref (session);
- }
-=20
-+static void proxy_auth_redirect_message_restarted (SoupMessage *msg)
-+{
-+        if (soup_message_get_status (msg) !=3D SOUP_STATUS_MOVED_PERMANEN=
TLY)
-+                return;
-+
-+        g_assert_null (soup_message_headers_get_one (soup_message_get_req=
uest_headers (msg), "Proxy-Authorization"));
-+}
-+
-+static void
-+do_proxy_auth_redirect_test (void)
-+{
-+        SoupSession *session;
-+        SoupMessage *msg;
-+        char *url;
-+
-+        SOUP_TEST_SKIP_IF_NO_APACHE;
-+        SOUP_TEST_SKIP_IF_NO_TLS;
-+
-+        session =3D soup_test_session_new ("proxy-resolver", proxy_resolv=
ers[AUTH_PROXY], NULL);
-+
-+        url =3D g_strconcat (HTTP_SERVER, "/Basic/realm1/redirected", NUL=
L);
-+        msg =3D soup_message_new (SOUP_METHOD_GET, url);
-+        g_signal_connect (msg, "authenticate", G_CALLBACK (authenticate),=
 NULL);
-+        g_signal_connect (msg, "restarted", G_CALLBACK (proxy_auth_redire=
ct_message_restarted), NULL);
-+
-+        soup_test_session_send_message (session, msg);
-+        soup_test_assert_message_status (msg, SOUP_STATUS_OK);
-+
-+        g_free (url);
-+        g_object_unref (msg);
-+        soup_test_session_abort_unref (session);
-+}
-+
- static void
- do_proxy_auth_request (const char *url, SoupSession *session, gboolean do=
_read)
- {
-@@ -402,6 +435,7 @@ main (int argc, char **argv)
-=20
- 	g_test_add_data_func ("/proxy/fragment", base_uri, do_proxy_fragment_tes=
t);
- 	g_test_add_func ("/proxy/redirect", do_proxy_redirect_test);
-+        g_test_add_func ("/proxy/auth-redirect", do_proxy_auth_redirect_t=
est);
- 	g_test_add_func ("/proxy/auth-cache", do_proxy_auth_cache_test);
-         g_test_add_data_func ("/proxy/connect-error", base_https_uri, do_=
proxy_connect_error_test);
-=20
---=20
-2.34.1
-
diff --git a/meta/recipes-support/libsoup/libsoup/CVE-2026-2708.patch b/met=
a/recipes-support/libsoup/libsoup/CVE-2026-2708.patch
deleted file mode 100644
index 479a53ae212..00000000000
--- a/meta/recipes-support/libsoup/libsoup/CVE-2026-2708.patch
+++ /dev/null
@@ -1,218 +0,0 @@
-From e032d3e9b0a27d10597398023532dd8f9b6654cf Mon Sep 17 00:00:00 2001
-From: Carlos Garcia Campos <cgarcia@igalia.com>
-Date: Tue, 17 Feb 2026 16:39:26 +0100
-Subject: [PATCH] Do not allow adding multiple content length values to hea=
ders
-
-Closes #500
-
-CVE: CVE-2026-2708
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit=
/e032d3e9b0a27d10597398023532dd8f9b6654cf]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- libsoup/soup-message-headers.c | 27 ++++++++++++++
- tests/header-parsing-test.c    | 50 +++++++++++++++++++++++++-
- tests/server-test.c            | 64 ++++++++++++++++++++++++++++++++++
- 3 files changed, 140 insertions(+), 1 deletion(-)
-
-diff --git a/libsoup/soup-message-headers.c b/libsoup/soup-message-headers=
.c
-index ca7719db..34cd2d8f 100644
---- a/libsoup/soup-message-headers.c
-+++ b/libsoup/soup-message-headers.c
-@@ -269,6 +269,33 @@ soup_message_headers_append_common (SoupMessageHeader=
s    *hdrs,
-                 return FALSE;
-         }
-=20
-+        if (name =3D=3D SOUP_HEADER_CONTENT_LENGTH) {
-+                /* RFC 9110 - 7.7. Content-Length
-+                 * If a message is received that has a Content-Length hea=
der field value consisting of
-+                 * the same decimal value as a comma-separated list (Sect=
ion 5.7.1) =E2=80=94 for example,
-+                 * "Content-Length: 42, 42" =E2=80=94 indicating that dup=
licate Content-Length header fields have
-+                 * been generated or combined by an upstream message proc=
essor, then the recipient must either
-+                 * reject the message as invalid or replace the duplicate=
d field values with a single valid
-+                 * Content-Length field containing that decimal value pri=
or to determining the message body
-+                 * length or forwarding the message.
-+                 */
-+                const char *content_length =3D soup_message_headers_get_o=
ne_common (hdrs, SOUP_HEADER_CONTENT_LENGTH);
-+                if (content_length) {
-+                        guint64 decimal_value1, decimal_value2;
-+                        char *end;
-+
-+                        decimal_value1 =3D g_ascii_strtoull (content_leng=
th, &end, 10);
-+                        if (*end)
-+                                return FALSE;
-+
-+                        decimal_value2 =3D g_ascii_strtoull (value, &end,=
 10);
-+                        if (*end)
-+                                return FALSE;
-+
-+                        return decimal_value1 =3D=3D decimal_value2;
-+                }
-+        }
-+
-         if (trusted_value =3D=3D SOUP_HEADER_VALUE_UNTRUSTED && !is_valid=
_header_value (value)) {
-                 g_warning ("soup_message_headers_append: Rejecting bad va=
lue '%s'", value);
-                 return FALSE;
-diff --git a/tests/header-parsing-test.c b/tests/header-parsing-test.c
-index ebdc3246..5a3c92eb 100644
---- a/tests/header-parsing-test.c
-+++ b/tests/header-parsing-test.c
-@@ -368,6 +368,22 @@ static struct RequestTest {
- 	  }, 0
- 	},
-=20
-+        { "Duplicate Content-Length with the same value", NULL,
-+          "POST / HTTP/1.1\r\nContent-Length: 4\r\nContent-Length: 4\r\n"=
,
-+          -1,
-+          SOUP_STATUS_OK,
-+          "POST", "/", SOUP_HTTP_1_1,
-+          { { "Content-Length", "4" } }, 0
-+        },
-+
-+        { "Duplicate Content-Length with the same decimal value", NULL,
-+          "POST / HTTP/1.1\r\nContent-Length: 04\r\nContent-Length: 4\r\n=
",
-+          -1,
-+          SOUP_STATUS_OK,
-+          "POST", "/", SOUP_HTTP_1_1,
-+          { { "Content-Length", "04" } }, 0
-+        },
-+
- 	/************************/
- 	/*** INVALID REQUESTS ***/
- 	/************************/
-@@ -507,7 +523,16 @@ static struct RequestTest {
- 	  NULL, NULL, -1,
- 	  { { NULL } },
- 	  G_LOG_LEVEL_WARNING
--	}
-+	},
-+
-+        { "Duplicate Content-Length with different value",
-+          "https://gitlab.gnome.org/GNOME/libsoup/-/issues/500",
-+          "POST / HTTP/1.1\r\nContent-Length: 2\r\nContent-Length: 4\r\n"=
,
-+          -1,
-+          SOUP_STATUS_BAD_REQUEST,
-+          NULL, NULL, -1,
-+          { { NULL } }, 0
-+        }
- };
- static const int num_reqtests =3D G_N_ELEMENTS (reqtests);
-=20
-@@ -1475,6 +1500,28 @@ do_append_duplicate_host_test (void)
- 	soup_message_headers_unref (hdrs);
- }
-=20
-+static void
-+do_append_duplicate_content_length_test (void)
-+{
-+        SoupMessageHeaders *hdrs;
-+        const char *list_value;
-+
-+        hdrs =3D soup_message_headers_new (SOUP_MESSAGE_HEADERS_REQUEST);
-+        soup_message_headers_append (hdrs, "Content-Length", "42");
-+
-+        /* Inserting the same value doesn't generate a list */
-+        soup_message_headers_append (hdrs, "Content-Length", "42");
-+        list_value =3D soup_message_headers_get_list (hdrs, "Content-Leng=
th");
-+        g_assert_cmpstr (list_value, =3D=3D, "42");
-+
-+        /* Inserting a different value does nothing */
-+        soup_message_headers_append (hdrs, "Content-Length", "45");
-+        list_value =3D soup_message_headers_get_list (hdrs, "Content-Leng=
th");
-+        g_assert_cmpstr (list_value, =3D=3D, "42");
-+
-+        soup_message_headers_unref (hdrs);
-+}
-+
- int
- main (int argc, char **argv)
- {
-@@ -1491,6 +1538,7 @@ main (int argc, char **argv)
- 	g_test_add_func ("/header-parsing/append-param", do_append_param_tests);
- 	g_test_add_func ("/header-parsing/bad", do_bad_header_tests);
- 	g_test_add_func ("/header-parsing/append-duplicate-host", do_append_dupl=
icate_host_test);
-+        g_test_add_func ("/header-parsing/append-duplicate-content-length=
", do_append_duplicate_content_length_test);
-=20
- 	ret =3D g_test_run ();
-=20
-diff --git a/tests/server-test.c b/tests/server-test.c
-index 09ea03b3..59230444 100644
---- a/tests/server-test.c
-+++ b/tests/server-test.c
-@@ -1422,6 +1422,68 @@ do_chunked_test (ServerData *sd, gconstpointer test=
_data)
-         }
- }
-=20
-+static void
-+do_multiple_content_length_test (ServerData *sd, gconstpointer test_data)
-+{
-+        gint i;
-+        struct {
-+                const char *description;
-+                const char *test;
-+                const char *expected_response;
-+        } tests[] =3D {
-+                { "Double Content-Length with different value", "POST / H=
TTP/1.1\r\nHost: 127.0.0.1\r\nContent-Length: 0\r\nContent-Length: 4\r\nCon=
nection: close\r\n\r\n\r\nABCD", "HTTP/1.0 400 Bad Request" },
-+                { "Double Content-Length with the same value", "POST / HT=
TP/1.1\r\nHost: 127.0.0.1\r\nContent-Length: 4\r\nContent-Length: 4\r\nConn=
ection: close\r\n\r\n\r\nABCD", "HTTP/1.1 200 OK" },
-+        };
-+
-+        sd->server =3D soup_test_server_new (SOUP_TEST_SERVER_IN_THREAD);
-+        sd->base_uri =3D soup_test_server_get_uri (sd->server, "http", NU=
LL);
-+        server_add_handler (sd, NULL, server_callback, NULL, NULL);
-+
-+        for (i =3D 0; i < G_N_ELEMENTS (tests); i++) {
-+                GSocketClient *client;
-+                GSocketConnection *conn;
-+                GInputStream *input;
-+                GOutputStream *output;
-+                gsize nwritten;
-+                char buffer[4096];
-+                gssize nread;
-+                GString *response;
-+                const char *boundary;
-+                GError *error =3D NULL;
-+
-+                debug_printf (1, "  %s\n", tests[i].description);
-+
-+                client =3D g_socket_client_new ();
-+                conn =3D g_socket_client_connect_to_host (client, g_uri_g=
et_host (sd->base_uri), g_uri_get_port (sd->base_uri), NULL, &error);
-+                g_assert_no_error (error);
-+
-+                output =3D g_io_stream_get_output_stream (G_IO_STREAM (co=
nn));
-+                g_output_stream_write_all (output, tests[i].test, strlen =
(tests[i].test), &nwritten, NULL, &error);
-+                g_assert_no_error (error);
-+                g_assert_cmpuint (nwritten, =3D=3D, strlen (tests[i].test=
));
-+                g_output_stream_flush (output, NULL, &error);
-+                g_assert_no_error (error);
-+
-+                response =3D g_string_new (NULL);
-+
-+                input =3D g_io_stream_get_input_stream (G_IO_STREAM (conn=
));
-+                do {
-+                        nread =3D g_input_stream_read (input, buffer, siz=
eof(buffer), NULL, NULL);
-+                        if (nread >=3D 0)
-+                                response =3D g_string_append_len (respons=
e, (const char *)buffer, nread);
-+                } while (nread > 0);
-+
-+                boundary =3D strstr (response->str, "\r\n");
-+                g_assert_nonnull (boundary);
-+                response =3D g_string_truncate (response, response->len -=
 strlen (boundary));
-+                g_assert_cmpstr (response->str, =3D=3D, tests[i].expected=
_response);
-+                g_string_free (response, TRUE);
-+
-+                g_object_unref (conn);
-+                g_object_unref (client);
-+        }
-+}
-+
- int
- main (int argc, char **argv)
- {
-@@ -1464,6 +1526,8 @@ main (int argc, char **argv)
- 		    server_setup, do_steal_connect_test, server_teardown);
-         g_test_add ("/server/chunked", ServerData, NULL,
-                     NULL, do_chunked_test, server_teardown);
-+        g_test_add ("/server/multiple-content-length", ServerData, NULL,
-+                    NULL, do_multiple_content_length_test, server_teardow=
n);
-=20
- 	ret =3D g_test_run ();
-=20
diff --git a/meta/recipes-support/libsoup/libsoup/CVE-2026-4271.patch b/met=
a/recipes-support/libsoup/libsoup/CVE-2026-4271.patch
deleted file mode 100644
index ca377e03553..00000000000
--- a/meta/recipes-support/libsoup/libsoup/CVE-2026-4271.patch
+++ /dev/null
@@ -1,362 +0,0 @@
-From 489affa74c8a229b8a4dd541710d4a5debedb7b4 Mon Sep 17 00:00:00 2001
-From: Carlos Garcia Campos <cgarcia@igalia.com>
-Date: Mon, 16 Feb 2026 12:09:08 +0100
-Subject: [PATCH] server: protect message io while reading and writing
-
-Ensure the nghttp2 session is not destroyed while being used.
-
-Closes #496
-
-CVE: CVE-2026-4271
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit=
/489affa74c8a229b8a4dd541710d4a5debedb7b4]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- .../http2/soup-server-message-io-http2.c      | 117 +++++++++++++-----
- tests/http2-test.c                            |  54 ++++++++
- 2 files changed, 141 insertions(+), 30 deletions(-)
-
-diff --git a/libsoup/server/http2/soup-server-message-io-http2.c b/libsoup=
/server/http2/soup-server-message-io-http2.c
-index 913afb46..6f8d1bb6 100644
---- a/libsoup/server/http2/soup-server-message-io-http2.c
-+++ b/libsoup/server/http2/soup-server-message-io-http2.c
-@@ -69,6 +69,8 @@ typedef struct {
-         GHashTable *messages;
-=20
-         guint in_callback;
-+        guint protected;
-+        gboolean destroyed;
- } SoupServerMessageIOHTTP2;
-=20
- static void soup_server_message_io_http2_send_response (SoupServerMessage=
IOHTTP2 *io,
-@@ -146,6 +148,8 @@ soup_server_message_io_http2_destroy (SoupServerMessag=
eIO *iface)
- {
-         SoupServerMessageIOHTTP2 *io =3D (SoupServerMessageIOHTTP2 *)ifac=
e;
-=20
-+        io->destroyed =3D TRUE;
-+
-         if (io->read_source) {
-                 g_source_destroy (io->read_source);
-                 g_source_unref (io->read_source);
-@@ -160,10 +164,14 @@ soup_server_message_io_http2_destroy (SoupServerMess=
ageIO *iface)
-         }
-=20
-         g_clear_object (&io->iostream);
--        g_clear_pointer (&io->session, nghttp2_session_del);
--        g_clear_pointer (&io->messages, g_hash_table_unref);
-+        io->istream =3D NULL;
-+        io->ostream =3D NULL;
-=20
--        g_free (io);
-+        if (io->protected =3D=3D 0) {
-+                g_clear_pointer (&io->session, nghttp2_session_del);
-+                g_clear_pointer (&io->messages, g_hash_table_unref);
-+                g_free (io);
-+        }
- }
-=20
- static void
-@@ -321,7 +329,33 @@ static const SoupServerMessageIOFuncs io_funcs =3D {
-         soup_server_message_io_http2_is_paused
- };
-=20
-+static void
-+soup_server_message_io_http2_protect (SoupServerMessageIOHTTP2 *io)
-+{
-+        io->protected++;
-+        g_object_ref (io->conn);
-+}
-+
- static gboolean
-+soup_server_message_io_http2_unprotect (SoupServerMessageIOHTTP2 *io)
-+{
-+        g_object_unref (io->conn);
-+
-+        if (--io->protected > 0)
-+                return FALSE;
-+
-+        if (io->destroyed) {
-+                g_clear_pointer (&io->session, nghttp2_session_del);
-+                g_clear_pointer (&io->messages, g_hash_table_unref);
-+                g_free (io);
-+
-+                return TRUE;
-+        }
-+
-+        return FALSE;
-+}
-+
-+static void
- io_write (SoupServerMessageIOHTTP2 *io,
-           GError                  **error)
- {
-@@ -336,51 +370,57 @@ io_write (SoupServerMessageIOHTTP2 *io,
-                 if (io->write_buffer_size =3D=3D 0) {
-                         /* Done */
-                         io->write_buffer =3D NULL;
--                        return TRUE;
-+                        return;
-                 }
-         }
-=20
-+        if (!io->ostream)
-+                return;
-+
-         gssize ret =3D g_pollable_stream_write (io->ostream,
-                                               io->write_buffer + io->writ=
ten_bytes,
-                                               io->write_buffer_size - io-=
>written_bytes,
-                                               FALSE, NULL, error);
--        if (ret < 0)
--                return FALSE;
--
--        io->written_bytes +=3D ret;
--        return TRUE;
-+        if (ret > 0)
-+                io->written_bytes +=3D ret;
- }
-=20
- static gboolean
- io_write_ready (GObject                  *stream,
-                 SoupServerMessageIOHTTP2 *io)
- {
--        SoupServerConnection *conn =3D io->conn;
-         GError *error =3D NULL;
-=20
--        g_object_ref (conn);
-+        soup_server_message_io_http2_protect (io);
-+
-+        while (!error) {
-+                if (io->destroyed)
-+                        break;
-+
-+                if (!nghttp2_session_want_write (io->session))
-+                        break;
-=20
--        while (!error && soup_server_connection_get_io_data (conn) =3D=3D=
 (SoupServerMessageIO *)io && nghttp2_session_want_write (io->session))
-                 io_write (io, &error);
-+        }
-=20
-         if (g_error_matches (error, G_IO_ERROR, G_IO_ERROR_WOULD_BLOCK)) =
{
-                 g_error_free (error);
--                g_object_unref (conn);
-+                soup_server_message_io_http2_unprotect (io);
-                 return G_SOURCE_CONTINUE;
-         }
-=20
--        if (soup_server_connection_get_io_data (conn) =3D=3D (SoupServerM=
essageIO *)io) {
-+        if (!io->destroyed) {
-                 if (error)
-                         h2_debug (io, NULL, "[SESSION] IO error: %s", err=
or->message);
-=20
-                 g_clear_pointer (&io->write_source, g_source_unref);
-=20
-                 if (error || (!nghttp2_session_want_read (io->session) &&=
 !nghttp2_session_want_write (io->session)))
--                        soup_server_connection_disconnect (conn);
-+                        soup_server_connection_disconnect (io->conn);
-         }
-=20
-         g_clear_error (&error);
--        g_object_unref (conn);
-+        soup_server_message_io_http2_unprotect (io);
-=20
-         return G_SOURCE_REMOVE;
- }
-@@ -390,13 +430,12 @@ static gboolean io_write_idle_cb (SoupServerMessageI=
OHTTP2* io);
- static void
- io_try_write (SoupServerMessageIOHTTP2 *io)
- {
--        SoupServerConnection *conn =3D io->conn;
-         GError *error =3D NULL;
-=20
-         if (io->write_source)
-                 return;
-=20
--        if (io->in_callback && soup_server_connection_get_io_data (conn) =
=3D=3D (SoupServerMessageIO *)io) {
-+        if (io->in_callback && !io->destroyed) {
-                 if (!nghttp2_session_want_write (io->session))
-                         return;
-=20
-@@ -416,12 +455,19 @@ io_try_write (SoupServerMessageIOHTTP2 *io)
-                 g_clear_pointer (&io->write_idle_source, g_source_unref);
-         }
-=20
--        g_object_ref (conn);
-+        soup_server_message_io_http2_protect (io);
-+
-+        while (!error) {
-+                if (io->destroyed)
-+                        break;
-+
-+                if (!nghttp2_session_want_write (io->session))
-+                        break;
-=20
--        while (!error && soup_server_connection_get_io_data (conn) =3D=3D=
 (SoupServerMessageIO *)io && !io->in_callback && nghttp2_session_want_writ=
e (io->session))
-                 io_write (io, &error);
-+        }
-=20
--        if (soup_server_connection_get_io_data (conn) =3D=3D (SoupServerM=
essageIO *)io) {
-+        if (!io->destroyed) {
-                 if (g_error_matches (error, G_IO_ERROR, G_IO_ERROR_WOULD_=
BLOCK)) {
-                         g_clear_error (&error);
-                         io->write_source =3D g_pollable_output_stream_cre=
ate_source (G_POLLABLE_OUTPUT_STREAM (io->ostream), NULL);
-@@ -434,11 +480,11 @@ io_try_write (SoupServerMessageIOHTTP2 *io)
-                         h2_debug (io, NULL, "[SESSION] IO error: %s", err=
or->message);
-=20
-                 if (error || (!nghttp2_session_want_read (io->session) &&=
 !nghttp2_session_want_write (io->session)))
--                        soup_server_connection_disconnect (conn);
-+                        soup_server_connection_disconnect (io->conn);
-         }
-=20
-         g_clear_error (&error);
--        g_object_unref (conn);
-+        soup_server_message_io_http2_unprotect (io);
- }
-=20
- static gboolean
-@@ -481,31 +527,37 @@ static gboolean
- io_read_ready (GObject                  *stream,
-                SoupServerMessageIOHTTP2 *io)
- {
--        SoupServerConnection *conn =3D io->conn;
-         gboolean progress =3D TRUE;
-         GError *error =3D NULL;
-=20
--        g_object_ref (conn);
-+        soup_server_message_io_http2_protect (io);
-+
-+        while (progress) {
-+                if (io->destroyed)
-+                        break;
-+
-+                if (!nghttp2_session_want_read (io->session))
-+                        break;
-=20
--        while (progress && soup_server_connection_get_io_data (conn) =3D=
=3D (SoupServerMessageIO *)io && nghttp2_session_want_read (io->session))
-                 progress =3D io_read (io, &error);
-+        }
-=20
-         if (g_error_matches (error, G_IO_ERROR, G_IO_ERROR_WOULD_BLOCK)) =
{
-                 g_error_free (error);
--                g_object_unref (conn);
-+                soup_server_message_io_http2_unprotect (io);
-                 return G_SOURCE_CONTINUE;
-         }
-=20
--        if (soup_server_connection_get_io_data (conn) =3D=3D (SoupServerM=
essageIO *)io) {
-+        if (!io->destroyed) {
-                 if (error)
-                         h2_debug (io, NULL, "[SESSION] IO error: %s", err=
or->message);
-=20
-                 if (error || (!nghttp2_session_want_read (io->session) &&=
 !nghttp2_session_want_write (io->session)))
--                        soup_server_connection_disconnect (conn);
-+                        soup_server_connection_disconnect (io->conn);
-         }
-=20
-         g_clear_error (&error);
--        g_object_unref (conn);
-+        soup_server_message_io_http2_unprotect (io);
-=20
-         return G_SOURCE_REMOVE;
- }
-@@ -931,5 +983,10 @@ soup_server_message_io_http2_new (SoupServerConnectio=
n  *conn,
-         nghttp2_submit_settings (io->session, NGHTTP2_FLAG_NONE, settings=
, G_N_ELEMENTS (settings));
-         io_try_write (io);
-=20
-+#ifdef __clang_analyzer__
-+        // Suppress false positive about io being destroyed here, since a=
t this point we have only
-+        // send the initial settings and not callback is called.
-+        [[clang::suppress]]
-+#endif
-         return (SoupServerMessageIO *)io;
- }
-diff --git a/tests/http2-test.c b/tests/http2-test.c
-index 0846a0a6..d12b4bf7 100644
---- a/tests/http2-test.c
-+++ b/tests/http2-test.c
-@@ -1268,6 +1268,40 @@ do_broken_pseudo_header_test (Test *test, gconstpoi=
nter data)
- 	g_uri_unref (uri);
- }
-=20
-+static void
-+disconnect_on_got_headers (SoupServerMessage *msg, gpointer user_data)
-+{
-+        GUri *uri;
-+        SoupServerConnection *conn;
-+
-+        uri =3D soup_server_message_get_uri (msg);
-+        if (!g_str_equal (g_uri_get_path (uri), "/close-on-got-headers"))
-+                return;
-+
-+        conn =3D soup_server_message_get_connection (msg);
-+        soup_server_connection_disconnect (conn);
-+}
-+
-+static void
-+do_server_disconnect_on_got_headers_test (Test *test, gconstpointer data)
-+{
-+        SoupMessage *msg;
-+        GUri *uri;
-+        GBytes *response;
-+        GError *error =3D NULL;
-+
-+        uri =3D g_uri_parse_relative (base_uri, "/close-on-got-headers", =
SOUP_HTTP_URI_FLAGS, NULL);
-+        msg =3D soup_message_new_from_uri (SOUP_METHOD_GET, uri);
-+
-+        response =3D soup_test_session_async_send (test->session, msg, NU=
LL, &error);
-+        g_assert_error (error, G_IO_ERROR, G_IO_ERROR_PARTIAL_INPUT);
-+
-+        g_clear_error (&error);
-+        g_bytes_unref (response);
-+        g_object_unref (msg);
-+        g_uri_unref (uri);
-+}
-+
- static gboolean
- unpause_message (SoupServerMessage *msg)
- {
-@@ -1396,12 +1430,26 @@ server_handler (SoupServer        *server,
-                 shutdown (fd, SHUT_WR);
- #endif
-=20
-+                soup_server_message_set_response (msg, "text/plain",
-+                                                  SOUP_MEMORY_STATIC,
-+                                                  "Success!", 8);
-+        } else if (strcmp (path, "/close-on-got-headers") =3D=3D 0) {
-                 soup_server_message_set_response (msg, "text/plain",
-                                                   SOUP_MEMORY_STATIC,
-                                                   "Success!", 8);
-         }
- }
-=20
-+static void
-+server_request_started (SoupServer           *server,
-+                        SoupServerMessage    *msg,
-+                        SoupServerConnection *conn,
-+                        gpointer              user_data)
-+{
-+        g_signal_connect (msg, "got-headers",
-+                          G_CALLBACK (disconnect_on_got_headers), NULL);
-+}
-+
- static gboolean
- server_basic_auth_callback (SoupAuthDomain    *auth_domain,
-                             SoupServerMessage *msg,
-@@ -1428,6 +1476,8 @@ main (int argc, char **argv)
-                 return 0;
-=20
-         server =3D soup_test_server_new (SOUP_TEST_SERVER_IN_THREAD | SOU=
P_TEST_SERVER_HTTP2);
-+        g_signal_connect (server, "request-started",
-+                          G_CALLBACK (server_request_started), NULL);
-         auth =3D soup_auth_domain_basic_new ("realm", "http2-test",
-                                            "auth-callback", server_basic_=
auth_callback,
-                                            NULL);
-@@ -1584,6 +1634,10 @@ main (int argc, char **argv)
-                     setup_session,
-                     do_broken_pseudo_header_test,
-                     teardown_session);
-+        g_test_add ("/http2/server-disconnect-on-got-headers", Test, NULL=
,
-+                    setup_session,
-+                    do_server_disconnect_on_got_headers_test,
-+                    teardown_session);
-=20
- 	ret =3D g_test_run ();
-=20
diff --git a/meta/recipes-support/libsoup/libsoup/CVE-2026-5119.patch b/met=
a/recipes-support/libsoup/libsoup/CVE-2026-5119.patch
deleted file mode 100644
index f5e3f91b000..00000000000
--- a/meta/recipes-support/libsoup/libsoup/CVE-2026-5119.patch
+++ /dev/null
@@ -1,122 +0,0 @@
-From b0626fff8538e3dd4a52f148d91c8348d51d64d1 Mon Sep 17 00:00:00 2001
-From: Carlos Garcia Campos <cgarcia@igalia.com>
-Date: Fri, 27 Feb 2026 12:03:25 +0100
-Subject: [PATCH] cookies: do not send cookies to a HTTP proxy for a HTTPS
- request
-
-Closes #502
-
-CVE: CVE-2026-5119
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit=
/b0626fff8538e3dd4a52f148d91c8348d51d64d1]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
-
----
- libsoup/cookies/soup-cookie-jar.c | 24 +++++++++++-----
- tests/proxy-test.c                | 47 +++++++++++++++++++++++++++++++
- 2 files changed, 64 insertions(+), 7 deletions(-)
-
-diff --git a/libsoup/cookies/soup-cookie-jar.c b/libsoup/cookies/soup-cook=
ie-jar.c
-index 7e200f8f..6a996ffe 100644
---- a/libsoup/cookies/soup-cookie-jar.c
-+++ b/libsoup/cookies/soup-cookie-jar.c
-@@ -885,18 +885,28 @@ process_set_cookie_header (SoupMessage *msg, gpointe=
r user_data)
- 	g_slist_free (new_cookies);
- }
-=20
-+static gboolean
-+allow_cookies_for_request (SoupMessage *msg)
-+{
-+        /* Do not send cookies to a HTTP proxy for a HTTPS request */
-+        return soup_message_get_method (msg) !=3D SOUP_METHOD_CONNECT || =
!soup_connection_is_tunnelled (soup_message_get_connection (msg));
-+}
-+
- static void
- msg_starting_cb (SoupMessage *msg, gpointer feature)
- {
- 	SoupCookieJar *jar =3D SOUP_COOKIE_JAR (feature);
--	GSList *cookies;
-+	GSList *cookies =3D NULL;
-+
-+        if (allow_cookies_for_request (msg)) {
-+                cookies =3D soup_cookie_jar_get_cookie_list_with_same_sit=
e_info (jar, soup_message_get_uri (msg),
-+                                                                         =
      soup_message_get_first_party (msg),
-+                                                                         =
      soup_message_get_site_for_cookies (msg),
-+                                                                         =
      TRUE,
-+                                                                         =
      SOUP_METHOD_IS_SAFE (soup_message_get_method (msg)),
-+                                                                         =
      soup_message_get_is_top_level_navigation (msg));
-+        }
-=20
--	cookies =3D soup_cookie_jar_get_cookie_list_with_same_site_info (jar, so=
up_message_get_uri (msg),
--	                                                               soup_mess=
age_get_first_party (msg),
--							               soup_message_get_site_for_cookies (msg),
--								       TRUE,
--							               SOUP_METHOD_IS_SAFE (soup_message_get_method (msg))=
,
--							               soup_message_get_is_top_level_navigation (msg));
- 	if (cookies !=3D NULL) {
- 		char *cookie_header =3D soup_cookies_to_cookie_header (cookies);
- 		soup_message_headers_replace_common (soup_message_get_request_headers (=
msg), SOUP_HEADER_COOKIE, cookie_header, SOUP_HEADER_VALUE_TRUSTED);
-diff --git a/tests/proxy-test.c b/tests/proxy-test.c
-index 68c97aca..945de2cc 100644
---- a/tests/proxy-test.c
-+++ b/tests/proxy-test.c
-@@ -406,6 +406,52 @@ do_proxy_connect_error_test (gconstpointer data)
-         soup_test_session_abort_unref (session);
- }
-=20
-+static void
-+connect_message_wrote_headers_cb (SoupMessage *msg, guint *counter)
-+{
-+        SoupMessageHeaders *hdrs;
-+
-+        *counter +=3D 1;
-+
-+        hdrs =3D soup_message_get_request_headers (msg);
-+        if (soup_message_get_method (msg) =3D=3D SOUP_METHOD_CONNECT)
-+                g_assert_null (soup_message_headers_get_one (hdrs, "Cooki=
e"));
-+        else
-+                g_assert_nonnull (soup_message_headers_get_one (hdrs, "Co=
okie"));
-+}
-+
-+static void
-+request_queued_cb (SoupSession *session, SoupMessage *msg, guint *counter=
)
-+{
-+        g_signal_connect (msg, "wrote-headers", G_CALLBACK (connect_messa=
ge_wrote_headers_cb), counter);
-+}
-+
-+static void
-+do_proxy_secure_cookies_test (void)
-+{
-+        SoupSession *session;
-+        SoupMessage *msg;
-+        SoupCookieJar *jar;
-+        guint counter =3D 0;
-+
-+        SOUP_TEST_SKIP_IF_NO_APACHE;
-+        SOUP_TEST_SKIP_IF_NO_TLS;
-+
-+        session =3D soup_test_session_new ("proxy-resolver", proxy_resolv=
ers[SIMPLE_PROXY], NULL);
-+        g_signal_connect (session, "request-queued", G_CALLBACK (request_=
queued_cb), &counter);
-+
-+        soup_session_add_feature_by_type (session, SOUP_TYPE_COOKIE_JAR);
-+        jar =3D SOUP_COOKIE_JAR (soup_session_get_feature (session, SOUP_=
TYPE_COOKIE_JAR));
-+
-+        msg =3D soup_message_new (SOUP_METHOD_GET, HTTPS_SERVER);
-+        soup_cookie_jar_set_cookie (jar, soup_message_get_uri (msg), "use=
r=3Dpassword; secure");
-+        soup_test_session_send_message (session, msg);
-+        soup_test_assert_message_status (msg, SOUP_STATUS_OK);
-+        g_assert_cmpuint (counter, =3D=3D, 2);
-+
-+        soup_test_session_abort_unref (session);
-+}
-+
- int
- main (int argc, char **argv)
- {
-@@ -438,6 +484,7 @@ main (int argc, char **argv)
-         g_test_add_func ("/proxy/auth-redirect", do_proxy_auth_redirect_t=
est);
- 	g_test_add_func ("/proxy/auth-cache", do_proxy_auth_cache_test);
-         g_test_add_data_func ("/proxy/connect-error", base_https_uri, do_=
proxy_connect_error_test);
-+        g_test_add_func ("/proxy/secure-cookies", do_proxy_secure_cookies=
_test);
-=20
- 	ret =3D g_test_run ();
-=20
diff --git a/meta/recipes-support/libsoup/libsoup_3.6.6.bb b/meta/recipes-s=
upport/libsoup/libsoup_3.8.0.bb
similarity index 83%
rename from meta/recipes-support/libsoup/libsoup_3.6.6.bb
rename to meta/recipes-support/libsoup/libsoup_3.8.0.bb
index e5c2d18ded7..3301451292d 100644
--- a/meta/recipes-support/libsoup/libsoup_3.6.6.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.8.0.bb
@@ -11,17 +11,7 @@ DEPENDS =3D "glib-2.0 glib-2.0-native libxml2 sqlite3 li=
bpsl nghttp2"
=20
 inherit gettext gnomebase upstream-version-is-even gobject-introspection g=
i-docgen vala
=20
-SRC_URI[archive.sha256sum] =3D "51ed0ae06f9d5a40f401ff459e2e5f652f9a510b77=
30e1359ee66d14d4872740"
-
-SRC_URI +=3D "file://CVE-2025-32049-1.patch \
-            file://CVE-2025-32049-2.patch \
-            file://CVE-2025-32049-3.patch \
-            file://CVE-2025-32049-4.patch \
-            file://CVE-2026-1539.patch \
-            file://CVE-2026-5119.patch \
-            file://CVE-2026-2708.patch \
-            file://CVE-2026-4271.patch \
-"
+SRC_URI[archive.sha256sum] =3D "bbf08fa3e03a88c31a3d27a0d87cb422e9490f2d08=
e149211103df6d638a2238"
=20
 PROVIDES =3D "libsoup-3.0"
=20

