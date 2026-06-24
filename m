Return-Path: <anders.heimer@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8A61CDE005
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 12:44:26 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.13])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6140.1782305058372622363
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jun 2026 05:44:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=tmWUhmoi;
 spf=pass (domain: est.tech, ip: 40.107.159.13, mailfrom: anders.heimer@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aVw6g53yFF6aaWUQ6+wGUKvYrVptPueyFAYOOUweYV0vH8pCGiYLYviVnGU8upYZf+BWEfoOoI8Ezt9phsBgpLf3iK5G17raufRPj9DHBfeVkkyxEhilGb7OG/rtOLQ+rAuPL37Ub9/Us5BjKoujpnivLFC8uelV9a4vAGG8WMs5Y2P0OmOTJGCOCAVUenSyykZCqo8euD5l95xAEaDedC86kq+/B6JLk31EUr2A442Ft9SLZ1oI2N79/oMm+CF3lvMhAVUnPl/hXLd8z0ilGhjLTEzKV+N3GAMinL5pw/7P4+1E3vQXDlhaeouXYneevtrriZdkdw5sFRFROywWHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vb2b9/0LpB67vSNBSKIg5k3RvHIC4dMIgkTzZCyYGcU=;
 b=tu89GY+0Z1cLKoQkBWHNwG0HjJ7YmReEI2fk+fSTO9pWmcEV4IoIi+2S9DQ9eGMU8kaVc6zljhSnj0rN30GU7/CDm+T2GkJ9zbDTpbRrerCB9fCTT+kZM56Xk4Ul+G434C+kQ0Mvm9nYMlvzCp9Spw9qtIn2d9W5yrCzqNmJg6XBq8kI5GBshWusGsK8CR+OiOfOcPzQSPy4G6qrvEjNMcQXQ7Xb0Bd+/fL+Qsm8tZ/FL1fw6QgMe55yR7netUeWtmU3ih7ApBhZ2sbmDwGbfK2vlya11otBy7xwN37rXqRc/NvxjUGeFiZPrztXaLrJl0mnBJHKxLSQM1+EpJafPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vb2b9/0LpB67vSNBSKIg5k3RvHIC4dMIgkTzZCyYGcU=;
 b=tmWUhmoibl7XSaQt9ncqXnyu8SabxYR0qGaXQ/+gs3C4l1PYrIbYuwAvTz6vFGwooayrmuXLIJoY9x9Frby1lKXfmb7OWZeaJk4Y69ztciv3x1yOxQXaraKY+TC4RrhxTtm8KLHpACG4CswTyFXcjIiqfXhkk3QgwUT1ftWsAYMkiK5xUA/YRmgOS6Qb/zcPeg7Exnjs9WxHApeCeVlk5fdsDwbXOkryFGXBkmom1oDd8QZ/IgYmjpzyv/OOLT8sJ/GPzFLAZKAvWjPFI1bO7IAvOeLUjt/7eoKNIQrXEBhujpI6ZAaPzEvC+53lSQJZ5pUCJWgrO5hytLeSh9Nygw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:2ac::9) by
 GV1P189MB2739.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:1c9::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.20; Wed, 24 Jun 2026 12:44:11 +0000
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::90da:b700:f102:5c82]) by DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::90da:b700:f102:5c82%6]) with mapi id 15.21.0159.013; Wed, 24 Jun 2026
 12:44:11 +0000
From: Anders Heimer <anders.heimer@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Anders Heimer <anders.heimer@est.tech>
Subject: [PATCH v2 0/9]  execute patch commands without an implicit shell
Date: Wed, 24 Jun 2026 14:43:58 +0200
Message-ID: <cover.1782304923.git.anders.heimer@est.tech>
X-Mailer: git-send-email 2.48.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU6P191CA0054.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:53e::21) To DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:2ac::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P189MB1641:EE_|GV1P189MB2739:EE_
X-MS-Office365-Filtering-Correlation-Id: 48bf42a0-ebf5-4fc9-01dc-08ded1ee4a46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|18002099003|3023799007|56012099006|6133799003|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info: 
	rIysJMtcIH+Tscs2T6bSKcLtrP+qXSKKg9L8A05uowI48bY8akN4FBp9+kZNVICAJEkwKV8HMIcIBYaxgEVoJrTSTkdwZRufml1jJB55A4z+YP0QqPFAhypAPQwPBUD7WEDf8rnsYJaVIlA3gHUuKCdXYDmDagEBLLyV2xdjcJuHVeFDmGJdLFZkmF8fHrUMy//YcrY9U54hlNNKsy0GbGMWIvTxqk4DgKejeOL8ScVTlssJeOr21wBlwSiXCBlshrsPdkShZntotcWdMwZX3cu8DFIun9WMzueJLN4QT5wLfu+xhlzPvLp5xOfVyWyfb8uymkEW5L+KbUN3uA+Hngf+YC24Ti3lgTTQCjC1qyh/wnb2NZ7nOcU6v4ni9/bFLDKYHFBrJ2qohywNCNrS8y2Zc+ic48g7+ZmQdsnsTKx2owx2H+PTizOG7RNvQqMe1Vw703JQANVi0YUR5mRKtWPp0bNMCCEn24W14kwhiooPvHZfFTnj0CTWZBpqkOxpZp991uiAmihd/sdxCZlGgN/g1xoRnkFmJ1GScKSHwjGWOs7l9recsX9RYr6MO2gnpXR9QIa3Sw77bNFPDSsglCKqxCP78eCqWlQG0xiTAbkva6mBi82L0bIE4gyPYY9RD3Wb7234/zaZ9CbNW3tGfvxBBRuqRAjXiChdaPrKXAQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P189MB1641.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(18002099003)(3023799007)(56012099006)(6133799003)(5023799004)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GSJa7Ya411NGbat3XXr6htwI5x7MDBpdHfKfdWFxDkRexoTC3BVh2JvlGgyN?=
 =?us-ascii?Q?FEdbz1ousNKN1nIeNMaH4Fa03W9Z/wVHMrsIy36BzeQ9HLxL23lEWGGeml6Q?=
 =?us-ascii?Q?CcVWsmE4kgKWU7GXZ/kbAdseQK72aQZ35iJRrHU/sW996ucGkdd48b+aZes3?=
 =?us-ascii?Q?Fa+hzTmN3vrVB4QwBvqFZtDjAaG77+T25539BP1ew9Hk8qsysyjHoTSaD8DU?=
 =?us-ascii?Q?ViK/y1vhbeahB3RxkKRM20WJIKC3pydA7llHdpMUBYRNnCZErQzWqFveVt7M?=
 =?us-ascii?Q?AcG1UG4Idm9834CdYpfwHbW4CrBqn+JN9zNcV+T5uHKEP7W4uONuXcskT6pE?=
 =?us-ascii?Q?Z9946rMkvaYJJKst+4+2eRuP2Kv570YJGeuGrr5maCo/GVzsfKpZYBV13Wjq?=
 =?us-ascii?Q?Jq8IkKQGNWs7eQjgMGDE0rJbTPfSr+7NDzxgZmQSed5bp8bYkW3/XUV5SLnQ?=
 =?us-ascii?Q?8Iddc6TV7gNWMeXViU9UDJkJz3FWnkvFXErjKwAw3EIoXGgsikBqj00tl/if?=
 =?us-ascii?Q?2+tcuU7cxwNbxnXpqffaZvFOavtLkHZGXudFmid6SxTfRQqkieWe5+Q/uHRS?=
 =?us-ascii?Q?6kT1GWKiNJ07dVwmp+Au9/YrGOFAvXD0KWyAinCpMF2L2GOpiWfxX5NvAAAH?=
 =?us-ascii?Q?o6p/RJ7HC0zs0O1g1p+yNagd9/U7VP77UNoQ6RRBafSq7BDO4EGsT5PKGEfT?=
 =?us-ascii?Q?E4uKmKWWYVRDzp24G/IFbSoPGJhATwQYfV9heTUsEnHqAa1vD+TaQD5Yb/Bk?=
 =?us-ascii?Q?6EgogUvOlmubbUag0KiwIjLESlPuMN5Huw+1Xsebe7shqPsiKqROyrGJkmVL?=
 =?us-ascii?Q?EGlfpa51D6rGN52x1pcSYLHIrFrpYpkCM2ozGC2ZKgM8UM/5BqUTb24qR9QX?=
 =?us-ascii?Q?cVZXc4REr+XZeOwE4MXkgN/HI78WZvwnQKLOd7W6+fbMiaQIFgq6uuyRSjst?=
 =?us-ascii?Q?BYEzkOnlPx+aUuU1Fco167fyA7tvjuR3B8BVS3ruLGnpwFye/EklaPVBcRot?=
 =?us-ascii?Q?it+5/Rz85QSqyNrOYOF3bJTIUXJoVQvyRiTK9LWWy7o77LW5qIRYVj+p7cd8?=
 =?us-ascii?Q?Uv18psE4i6gakYyEHLwnJlMrjXC+m2hox3KXCF9msfVVKj2ivHOXuqdKIKfg?=
 =?us-ascii?Q?d3QoOhIKd598V6FvBwz/SfrQ/kt8JRlqTAphkmVDYkx0JghH1VITXscqDhZX?=
 =?us-ascii?Q?6W5TTeIw7ZoZAWfODFDLIc3ZujbsdQtWNFLoDqqg3/2diEDh9EQ7O17ibJP5?=
 =?us-ascii?Q?yEKmheTDzuJTClfo4Rq+H4wdt2l+gg7ATYYRefcqJlVA+gntSjJjY1aBkaW7?=
 =?us-ascii?Q?5DP8yNTQTbf6vQGQJS6Hpd3njz+5XwD48WZfqgSmVPVUnrmG9Y1WHFkEw2rs?=
 =?us-ascii?Q?uQN+4Xby3odJhHKJy29kpjWcHYMsKKK3De5astKn3HXBeTDWNVAF41Pti++q?=
 =?us-ascii?Q?BE+AqJL9mNEu2miooObQFQtmX6/GnXdaVGWcl7vZHEZl8KL9BrEr9jxULX+Z?=
 =?us-ascii?Q?lkWFDGJa5I2kByMOwZS4KcYZ/7PeNGdi/lkWkfHnxLKzPiD+injndnLO0QRl?=
 =?us-ascii?Q?o7NNns5xzNqZeT3BILMUuGf7rAChqdnezOWgSw6qULV5Xh/FjlDlt0tj+WHg?=
 =?us-ascii?Q?/tLQqkGue8lcLuO+kGlLnsxfiRPEQW3tFkBIzPlcByt93BrT0RsphfKcVSOu?=
 =?us-ascii?Q?8xpPbLwibveftmjYl3ZdPDLX5WrMxf5altidJplaIlGglV3W2E9uLYMVjeIF?=
 =?us-ascii?Q?mvMegSV5IA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 48bf42a0-ebf5-4fc9-01dc-08ded1ee4a46
X-MS-Exchange-CrossTenant-AuthSource: DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 12:44:11.3160
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m5d4BsnUT85fExqoRHL0LZNyB9o878FgWwBDx9XxIoGWJeQ+r3Hp0AlBPBaiKHF4uQGS6jkEPufin3TL6aQZMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P189MB2739
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 12:44:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239494

Continue the shell=3DTrue cleanup in oe.patch.

Run runcmd() argument lists directly instead of joining them into an
implicit shell command string.

This series converts the non test runcmd() callers that invoked it with
-sh.

The series also replaces the cat-to-patch pipeline with patch -i,
removes the obsolete PATCHFILE assignment, converts GitApplyTree
commands to argv lists, and keeps manual-resolution commands as argv
lists.

oelib tests cover argv handling and error reporting, GitApplyTree
patch-name preservation, fallback commit metadata, and run=3DFalse
command generation without repository side effects.

Changes in v2:
- Accept both valid Git `%aI` representations of UTC, `Z` and `+00:00`,
  in the fallback metadata test

Anders Heimer (9):
  oe/patch: drop shell=3DTrue from runcmd
  oeqa/oelib: add runcmd tests
  oe/patch: convert simple runcmd shell callers
  oe/patch: avoid shell pipeline in _applypatch
  oe/patch: remove obsolete PATCHFILE assignment
  oeqa/oelib: test GitApplyTree patch names
  oe/patch: pass GitApplyTree commands as argv lists
  oe/patch: return manual-resolution commands as argv lists
  oeqa/oelib: test patch command argv handling

 meta/lib/oe/patch.py                        | 131 +++++----
 meta/lib/oeqa/selftest/cases/oelib/patch.py | 282 ++++++++++++++++++++
 scripts/lib/devtool/upgrade.py              |   2 +-
 3 files changed, 355 insertions(+), 60 deletions(-)
 create mode 100644 meta/lib/oeqa/selftest/cases/oelib/patch.py


