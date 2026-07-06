Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A921C43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 08:14:43 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.146475.1783325673021736649
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 01:14:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=gNWvatAT;
 spf=pass (domain: est.tech, ip: 40.107.159.45, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d8798pfXIfiACOjHwzmwK/try8E/P5VJ+m7OPY3S4VBi341SsRv9BYVxYJ/la6caWpIh+tPGubhweYlr+BirP/9AUg6hvDJr8zjQ8e2mVnu1qKDnOl3w389xBOI+TzpgPVR+7xB4G2VL1l0ekshSpmonxZHq/1V1oV0lO2l1DOkFJocK9I1XbQGv7vO1x6BcoTUexY3ByZS9BiTHhW1nkomLBHSwUQGklpLr0va93ZTEDQ5BWsKOZlKnFuNZB5mBudcDgFRRXjrTD4jJnSgpDS/3MwJfP9YOIfwhqd66UpqqvSzETFECnSG0/io94xW/HnO6jieAzVPBfrOX0Ty7+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oQipondIBmju/FlYKYJhbUsu+njcm94XgVIC6Yp3m7w=;
 b=FeDFV4pBnptpghhc2Bufn1tEv6nKGWwBpGHwA+7+Rs8fTX4XdjCcgxMpzpjQ2AmaoOUiJIbaZkOZQvHjACek6X9dYR/2nXsyhKWRv+IiM+v61Xl6iNvZfUr6bnmBFqr0+j95RTrbTLw9PGpE3IpNQ0trcZNR8pGjiaErJ7R5yisxYMB+TdpvAkk2lMK+Gq/rNKpS4qPgm0hHzMVF9U4OgryS4VqPZ3w4p1uhLc8D+k2/FdbmjUGmR/TStrmXNu8/u5BuMHqJ0YYIM/qj+n/ktFgEdkGefmjlHFbDVPCAEH0HDj4AJgBsBG1koNi4keFMKLVznPOHnjpWxpoAVhSbBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oQipondIBmju/FlYKYJhbUsu+njcm94XgVIC6Yp3m7w=;
 b=gNWvatATPte/xT/9S/o0aSieed+XKOxLCe+xpOJ8Or7XZmjMVpsCyO/yqpW/LLs0/kxCziq6iCnIJkiQgG0NUK3O4JOxftv1HInVqSPyPyvdFBN8JEEJ8XRndZWABSQXUGyF8NC6XcZdm1P/v6ikcmexSQ8LiDIy8KhLWQ7VFyIYrA11u+AtEmBsqvhwA+jDY5yApSdPuDO3yGqyQbtNaYUTD2kSdx3sTajfwzA591iFLtfTifFpAIaH2dbr0teSL8U/QQPuCUWIhKZSeWHptw7U2JB0M4poN4mUe+LDevxeY1YirkB0eK75cfB+fBZ/etn0YTXa178jo4RZ4ifNUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by PR3P189MB1083.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:2a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Mon, 6 Jul
 2026 08:14:23 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%8]) with mapi id 15.21.0181.012; Mon, 6 Jul 2026
 08:14:23 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [wrynose][PATCH v5] curl: fix CVE-2026-5773 - wrong reuse of SMB connection
Date: Mon,  6 Jul 2026 10:14:17 +0200
Message-ID: <20260706081417.10420-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260623120850.29881-1-jaipaul.cheernam@est.tech>
References: <20260623120850.29881-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0230.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:315::6) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|PR3P189MB1083:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f562e18-dc72-4258-c147-08dedb36964f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|18002099003|22082099003|3023799007|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 
	l5hPZUdNt8itmX6huh+vztumdgs5CRg5T8p4bSPioV8kmRpMR8Vg5bE/u85CtqVKY/TArlGG6KBzJEo/e3LOyGFJ178PR250DAXDaz5zWmFlE1Yqq7/Hn+9oAYKu+GDrfhcWaKrWrCVAbuy6P4w1KO0S0xVWfHgE7GPQdm5hLEHS3NcrwVCkecslQn8uRvc/t02W8xBbLkor9pzKvzsZc7otJq/w9adxDl/WfLVXqb4S+55VaPERTE6XfBPORu1ML/9keYUv3eV9ptN67B64cJpdPwtUy0/mge02rw4xfwyPgJZOaVgxLPuIdYSRr3AOYblbHmC+IXrL9BY/hDirXlO9j5d7NU0G0lVKyuvZkKvFZs5tcLS2P37I2YS6P89QUZbuqV3+F8kawy89oAoWLQZgx2ss1nVVbuUUIfbC4eX/NDeZPs9AryL+y0nIDvOkyl8CKa3T9uzuPEfBomauBnQNq3EcHxGi7WET2/T0vZ4MQEOgSIUmdpovX9Nh5s0POV8Y6NbKJvrPzWcfJLNSNymeRx6iHgWGckzgxDiRQqZZQt+hwNiGxGgJ+DsDKyTUwCH7rdf8V8M85YPMO1BL0Rgq4pcM4REHvExc78XAp0Y9ZUlo+4AdRu9rhlxfFCLH
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(22082099003)(3023799007)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?YAsaspcI1j2PdOHo769J6/x1EDooqtNsTrqoN5O1IVL3pZ9MpsQhtA9J777T?=
 =?us-ascii?Q?WPaJSwwoDEpv4MX0ZkP17h2n9mRjnb1iIBPcNzaraGeiE0EiHjW6adxfsuda?=
 =?us-ascii?Q?1ZGMA6KrtfQerTB/HZxb9+mWAl9rQJ+HOOKNaV5nNRiT4Ti+P+rBTv7Mh3R7?=
 =?us-ascii?Q?cIcfvdV5NSpLpMPkhHPJFf91+QfqximPegro3LiVrnXj87xaVELNtM7xnf07?=
 =?us-ascii?Q?UJjgRmf2lb3WUVeCsMz4JaKhbS7tUzqnORZ8LUFjhoZSLv2bOd7fhf7b7HAr?=
 =?us-ascii?Q?Bk/JuCOi5B/ibE1vrzT7/1pup1dG/N1+Cdj2s74y+sKKgW3pMxUfjPVOm1BW?=
 =?us-ascii?Q?5AOceedwM47Q5gIfO6sF8hLEcA6iajdX7b7EoIKuXIc5FtMkr0165rNSUr6P?=
 =?us-ascii?Q?ZnOQHTOotr6acnyJCCDbJWn4B2gE7Xppamgj27+pk/FMgeKwnA3yQc2milBW?=
 =?us-ascii?Q?0uVTxz6Trg4CPjNbCaW68RkenOU+JsYc7S2/6zBWyNVddzv358G7EHbg1Y7I?=
 =?us-ascii?Q?Lccbb5PV8T2QzRq0fOzMUBLX7nFxv/wDFyv6QT3U3DFzmDjOHyLYowHYLhbC?=
 =?us-ascii?Q?zCBiTmUfyee81H2sIa57jmAMUx/R0y6Qy6HS9s9s2PXeIJDfVZqFYGfHD3Qm?=
 =?us-ascii?Q?QshPCwm6t0DXz9aEMX6xpgEBi7W9V2ZrsOfqG4/4eXfjw/VHqu92gEz1dNKs?=
 =?us-ascii?Q?Jptk5ydCAHEm39Z/we4CpHNbaUBUdMYCSWof4AoT5kcG3uHnnudfgQ59UFQg?=
 =?us-ascii?Q?zFTHhEWXX4ljQVg11vpQMAN+cULLuSKEPoOzJivb03zWbamLPIeKt6lNEcs9?=
 =?us-ascii?Q?/1FdSyMEWNZI7dGM4MwSzmg434+vHHHzXVeBpsjASSBf2RJYJSdc+2Ns5M8C?=
 =?us-ascii?Q?fxt9M+6oIiSvwihVPrKrLwJY3wmBej51+XB9dVJ9PHauUrFdaYKf9ORUTI/I?=
 =?us-ascii?Q?4PZLfMN1XVqG/5CCHgH/kaEaz8y+eraqg0P1UNtxFS5iWqWC8wWjP2sUg/6y?=
 =?us-ascii?Q?4RtVsm209rEH5s/kON2ZJr59EJ4apvSMnbu1XDhKqB0ENtxATpPkSh82dU7r?=
 =?us-ascii?Q?Rr2vc5pPpctZWmMl4iDSUaqrpea1iCjpddQtTUlHtBaCSPO7cOn42Pmy3/Qq?=
 =?us-ascii?Q?5ofL55tAqkG/OZhUmJe+iWGwWfAgg4VJs6UGFqCPlGR5t8CfVSrwHNi3Ta+/?=
 =?us-ascii?Q?toVmJdiMwALbry/15feUKeE33MAtYC5F0TrD7KG5pq7bwq8DXBnEyHhgDwg/?=
 =?us-ascii?Q?VsiTK/7SgmjFqcykcGMD46tt/kMa81nOVeB8FrsvyO0sIH9L4Mr3ugGdmDZJ?=
 =?us-ascii?Q?WXQaMsEzZDK6wXqkMq+1329Ewd5/CR+oKPaZlteY48KRHcEzqt2ReHkagC4x?=
 =?us-ascii?Q?DKBBH2R47Np1bzr7dgLclDbS+j5CHFHhDgVxqSG7vmXZ+ElFQW2YZkmDOxak?=
 =?us-ascii?Q?9reuUSci8rplV703EoTWJEItm1XOkOGSQwWn75XV4+h0/9ZsKs5VC1Pi7/Ph?=
 =?us-ascii?Q?AIiwCa1bHmTJHahwixiP5obKthdHm9d6/BFb4I2S0YuJQkoR7xUxiMZUBj/X?=
 =?us-ascii?Q?gWSOVFkIUjiV68fj7iIxLXd9IW/Lm4zP+l2hibyOONfqLkRDtlHYOix8KXBD?=
 =?us-ascii?Q?D/fi/iGQLwe4HyiOv2/CHsTwNybIa/X+8KsQY33PaqElunAb+XQl/3p80EWC?=
 =?us-ascii?Q?GAlT/ywoqXNgJwucHRgNVYzXxuUF2oWf8djWEXy2o15XNfavrToEvHkTrzcu?=
 =?us-ascii?Q?TTdMrxZNlA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f562e18-dc72-4258-c147-08dedb36964f
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 08:14:23.0931
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uSXTeinslusk/0dAbNzyUNyQ5nfK9Zk1MlPOE6/pJ1M7+lXu/iu5HV+Z7OgP/HMrDxFPp43hC2ENlM5FQYcTT7H/kx/hwf6DC4GgTQSU1Hg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P189MB1083
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 08:14:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240219

Remove PROTOPT_CONN_REUSE from SMB handler flags to prevent
connection pooling. Without this, a second SMB request to the same
host reuses a connection authenticated for a different share.

Reference: https://curl.se/docs/CVE-2026-5773.html

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
Changes v4 -> v5:
  - Removed incorrect Signed-off-by from Daniel (upstream commit has none)

Changes v3 -> v4:
  - Rebased on latest wrynose (5d1aa5c806c0)
  - Refreshed patch context to eliminate fuzz on hunk #2
 .../curl/curl/CVE-2026-5773.patch             | 47 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-5773.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-5773.patch b/meta/reci=
pes-support/curl/curl/CVE-2026-5773.patch
new file mode 100644
index 0000000000..a997371242
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-5773.patch
@@ -0,0 +1,47 @@
+From e5c7f93734345260820ca46b29db85f75d277399 Mon Sep 17 00:00:00 2001
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
+curl 8.20.0. In 8.19.0 the SMB handler flags are still in lib/smb.c,
+so this patch removes PROTOPT_CONN_REUSE there instead. The effect is
+identical: SMB connections are no longer pooled for reuse.
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ lib/smb.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/lib/smb.c b/lib/smb.c
+index 00297ad..c15fdce 100644
+--- a/lib/smb.c
++++ b/lib/smb.c
+@@ -1242,7 +1242,7 @@ const struct Curl_scheme Curl_scheme_smb =3D {
+ #endif
+   CURLPROTO_SMB,                        /* protocol */
+   CURLPROTO_SMB,                        /* family */
+-  PROTOPT_CONN_REUSE,                   /* flags */
++  PROTOPT_NONE,                         /* flags */
+   PORT_SMB,                             /* defport */
+ };
+=20
+@@ -1259,6 +1259,6 @@ const struct Curl_scheme Curl_scheme_smbs =3D {
+ #endif
+   CURLPROTO_SMBS,                       /* protocol */
+   CURLPROTO_SMB,                        /* family */
+-  PROTOPT_SSL | PROTOPT_CONN_REUSE,     /* flags */
++  PROTOPT_SSL,                          /* flags */
+   PORT_SMBS,                            /* defport */
+ };
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-suppor=
t/curl/curl_8.19.0.bb
index d58b774011..3326f478b5 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -15,6 +15,7 @@ SRC_URI =3D " \
     file://disable-tests \
     file://no-test-timeout.patch \
     file://CVE-2026-6276.patch \
+    file://CVE-2026-5773.patch \
     file://mbedtls.patch \
 "
=20
--=20
2.34.1


