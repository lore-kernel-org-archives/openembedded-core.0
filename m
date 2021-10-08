Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AE67C433FE
	for <webhook@archiver.kernel.org>; Fri,  8 Oct 2021 07:43:05 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.48])
 by mx.groups.io with SMTP id smtpd.web11.6111.1633678981107909583
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Oct 2021 00:43:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=qNs/Jg57;
 spf=pass (domain: weidmueller.com, ip: 40.107.7.48,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V9VDjAo8MUWHLb+jdnijBlQiKscTt7FBOuXCSFeCqv/G9P6zecx9UEu+CYkAFPIz3BI1vCoP2S9dZvVOeRQE/xOJH2s8drlvmXpFYFSs7CFVabL2UL/PZMaMggc6AtzdjAUWREsuJI8lQMts/oR31Ys7F+kulduM7iU10E9zD2NQkZACiPgB9QvhRsaj59TfpCJsvrUwlprJRHqQSmN2caDe5wX3NVYL+oB3NKamEbk5CNl8T+3sAIQ5z6cHWoaMxM4DzC+sjy0UEPkfaH31H72IHrLRwK6I3mGG+zRipZoDCn1OKcPv/WwlHBVAjvtj4HhFCeJxG3fLAVYmsEFV0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SGNTYJ1VWbmVm5OMy6onSJcbUlmJfySOYtd67R799Vo=;
 b=gKKF89WyLJAra4KgQuHKW+AQ04Yu6A1KJX82OJYieQO8H29OSe4GDlH2fotCMAOQd34g/yAiytOdnYzcbm6Ab501KtcZ/ET5fY6oU5uLfoKaRtXdnrebjofH/zbdofQTmpc5egC5+xn0n+nawSqpv9bohwol944MqaKSa3fvyMnqxLihMi3L4ECjwY09BBTA8LkROqQXKRb/W9Bsy9CnguV9fTXMLX1iE0XbA7cRsTUfGz3GT6hOFvO0DxgpmxPzZgCQIJc4S0sKNwuQaxLeGz3T9QeZuJTqevbnt08HIok2xGx/vYPLuLulYSL3qwJ9Ee5m5PKcP0eUaV1KnHCYMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SGNTYJ1VWbmVm5OMy6onSJcbUlmJfySOYtd67R799Vo=;
 b=qNs/Jg57lKs22rsB3Dsd751Ygt2zXrP/CJYqO8W5WJlPRJ6cnbirynxs0M/GDhJbl56EurU8IqzHPPqp8/YRf4RKDURjTZVxyuHfbIGkwcoBjRG2AUZCuuKIGYuqrBssFdIvpmLn5U7kYT3pEdhV6HYCVKwG9pIbh6hn7pFc2yk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PA4PR08MB6207.eurprd08.prod.outlook.com (2603:10a6:102:f2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Fri, 8 Oct
 2021 07:42:58 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0%3]) with mapi id 15.20.4587.022; Fri, 8 Oct 2021
 07:42:58 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH 03/12] recipetool: Skip common source files in guess_license
Date: Fri,  8 Oct 2021 09:42:19 +0200
Message-ID: <20211008074228.8635-3-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: 
 <20211008074228.8635-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: <20211008074228.8635-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM6PR08CA0023.eurprd08.prod.outlook.com
 (2603:10a6:20b:b2::35) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
Received: from DE10512.weidmueller.com (94.134.181.155) by
 AM6PR08CA0023.eurprd08.prod.outlook.com (2603:10a6:20b:b2::35) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Fri, 8 Oct 2021 07:42:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6992ffac-d13b-4375-c9b2-08d98a2f3f69
X-MS-TrafficTypeDiagnostic: PA4PR08MB6207:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PA4PR08MB620725A8F92E2CD4F7443CB2D7B29@PA4PR08MB6207.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1775;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TZbPKG2t3CSKVW4toReiGn/opqKC+j33uS+sLhIWNxm/buyIG6n8okrrWer9FIS5YhBFnjaAIprIusUxAjKnRKvq1T+OV+ESoDWiN2ZpQWDIcW5d43uJk334/xh1zU5rYKYL7AUA0995g8jGRNevemaM4Qa5n1LkPnvINtFOfNsUxR82mwfsRXpzYPfK28mX16tLtqHzmYvU73CKq6tO4J33zpcAZ4wGGdi2cJrQoJRPxzHPoYZYtf+ZnUkqk96CxUPvPyfxyroLEHEdSiMzARRzV9amouDliLF5JgZAZ7MyAyB650nHZkj7mzqVviNtcUVjc8QAthLKLF2VEkBdsiDme8jwudZFLJNoVKGqVK6aS08vgqUlBntg1it+KOT0qW/uLi3hmungEG5QhavxhWt92+Pn5VGaHfOBugRIELE2oEKK0Qc6yZoTYes3HxUzIEhXpbNyNMBM45juKQv9tybXg4zi1aqdO3KFb3Va/W8OEPIbKRnSZX+UFpjeK2k0ZGcfDvfZl0zkXuWv1OTVDEm1A1cyjgIOTm8eXk75rOXCbe6sKX4/i7uj36OE/Ydb6FfQPduzoLxPWaxDO94cXxpoH0zBfSF3zZzcQEA2dVoGEytJtc8zdYsQ+kfRkdFcPpKfCQxlPAxKLOoF8E4z+bhSxQGEwxOe5CcgX+GLnRVYUbBtrUoj+V9cIYAItjdpi7McB0o5XDragx68RF0t3g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(8936002)(38350700002)(5660300002)(316002)(38100700002)(4326008)(186003)(1076003)(6916009)(2616005)(6666004)(956004)(107886003)(66946007)(66556008)(66476007)(2906002)(86362001)(6486002)(8676002)(52116002)(36756003)(508600001)(4744005)(7696005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?JNEUs/36wAsyJsv9U0QEcC+j/PiGoVQlh0QmcvaaNjcd/j/l0lxuO6JKK1FZ?=
 =?us-ascii?Q?SR4/9wnpwyOduqEHchnKxzM0dgPl57Vh4DSKgtLp2mWmhg+A+9+iXIBk7135?=
 =?us-ascii?Q?fH6A/U7vZ9zgFisiYVi94AG/eu9USi6vrEYBEwWn52LONfkYLwbfq6wNyagp?=
 =?us-ascii?Q?y2qB+JHMO+Iz1x6Rf/zkYicwjyhdiN+/0FXRowCSEI6X2ENVL3f9lz9yfPD+?=
 =?us-ascii?Q?1b3CDSZGdgTvy/t/lPR8sdQv3N7SqZj0OdCTGsz61mYyfUXcqiS5crDPp6Nc?=
 =?us-ascii?Q?EcynNGeclp4ODRMlxj/rnOescOrVpaZU9ou9HU/Xfe1a1n0t0T1PMie73CMz?=
 =?us-ascii?Q?w+8zYSaJPW5+aOVt+cayaR/Cpk44K9nP0Gi+HHzJae5M3g6se4ayqGwnc8Yv?=
 =?us-ascii?Q?nL+gidU4dLveXaVWkGXBGa+fJYui7rZh2N5q0phJqpd3BTyS0K7Hid1IHB0w?=
 =?us-ascii?Q?AWSOnCS6YuBxOafd5GZ7qz9kGE4CgLXtOI/YGaDFVVKcdlEhdltKOlUUGZFU?=
 =?us-ascii?Q?du/wnMcW7Mh1HVgT6AZEsS7VFCGlaHui7RY/9dnGeB7hBBwyKwEcwiIUcAA9?=
 =?us-ascii?Q?wVY21fWxvHpeQuJKBkButYUmTcanh7nc3cO8M57lFyHyaZIF7rOnUQ+3YZn7?=
 =?us-ascii?Q?68PrfBfgWCc1YS/BKmRhZeWGqfn8sBhoJZs9r2frQo7IVA7W2NUw034/dcsK?=
 =?us-ascii?Q?DiF7SQB2XihCcCDD/L242ux09U5oFMWnTVH8NIXPkD2NtCeVABmzKQp/7uCy?=
 =?us-ascii?Q?M4T0EFXuq7QNTOgICozIMddITTG6Z4Bnc8dvYyVst0+NUHarZZUiw+ili7fn?=
 =?us-ascii?Q?8P82KnLKU/Nr8ajODQJXze+GivXHDMpQP/wOn4BpjE6dgXHG7g4WexcNWdOR?=
 =?us-ascii?Q?gS7K3sneVkkibGn1BZDpgBzcfkmljYRH6u0cgwB/FfFn4LpfwFwsgICBppvm?=
 =?us-ascii?Q?uzfclGDivK8mIBm2RupD3uLOzBqrEKuu8TWcrybbcBnfnWlaHkkwukhbnXCN?=
 =?us-ascii?Q?707qYWY1KyyAj4blqrm3KiAQ5JMPaKPjXcjn+nc1SjAInbssd0o/g8aA5ubQ?=
 =?us-ascii?Q?rPvUzIrTyIFuZnevKSRUSE9F6a4q/vJ/tfgzU6dEcLg+i+m8jv18lEFOoCYh?=
 =?us-ascii?Q?ukHzIqaVakJFqvgcvtkENr/bwZ9IoblMs+Xy0XxLcRMTr+dx6D825dw4F09n?=
 =?us-ascii?Q?jPZvbFh6oZ8Q+3HCpQN+1pqhM9vSOG9He5HP+So+LUTF7wMIJNqOEAyogcef?=
 =?us-ascii?Q?QfD6aN/Xaq44TONLFvNuAE2C/zlF2Kl2jw7pEulz875nz0kPP7xlDdQOjTN4?=
 =?us-ascii?Q?/a63L8DZurXVXZ518PQpZKqQ?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6992ffac-d13b-4375-c9b2-08d98a2f3f69
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2021 07:42:58.3700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 03yQlS0TOSo7lr5B2SonEpJ86hZg7ZWnGXXRxDKIK69u3B3T960NhBEQ/8/oYNbM7KtWIGHKaMtRz1Frba8+sQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6207
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Oct 2021 07:43:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156745

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

(no changes since v1)

 scripts/lib/recipetool/create.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/crea=
te.py
index e88a4253da..83cf25d9b7 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -1114,6 +1114,8 @@ def guess_license(srctree, d):
     licfiles =3D []
     for root, dirs, files in os.walk(srctree):
         for fn in files:
+            if fn.endswith(".html") or fn.endswith(".js") or fn.endswith("=
.json") or fn.endswith(".svg") or fn.endswith(".ts"):
+                continue
             for spec in licspecs:
                 if fnmatch.fnmatch(fn, spec):
                     fullpath =3D os.path.join(root, fn)
--=20
2.20.1


