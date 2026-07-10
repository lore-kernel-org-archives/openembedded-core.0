Return-Path: <amaury.couderc@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54BF0C43458
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 14:30:23 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.208.1783693814393581554
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 07:30:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=uxSwdfiz;
 spf=pass (domain: est.tech, ip: 52.101.83.23, mailfrom: amaury.couderc@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IKAuhazeBMOn1n816nWQElbtv4ZCGGJwQg00CH/kxJ8TUwpZKI3FqCezgINvXlDXqUsNdMy6EEGYxxHt0D71cRRRZ7QnCRhew1abiDr+P/8NyBa4YSywS1XPAUWyM/PC4FREtPM29KybWHHxzIQDnhJ2rHlfi03dQsZKrl7PY35JsavM7XJOoJ5RUnAmoJ0e/D0ymGo+D8fKFOrA9hHKo1W4WDFUHVaTciONsRl8XiwvV7qfoIOwNVz5dpWX0Z42vgGg4zDsGVzsCY+4RTz1NwiQr/bvJF0akYjolceZdSCS5MESbXLT6dHOlcVlaVlzAPMAvjujwO1Kr3j0Fsc5mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ke+kqgD/cHH5EMZ1qPSNGSh7v0cbvfO2tiNJYuiIE1E=;
 b=Pvhak0+864kcDWe9uIKlQYIDl8aZ2CZzqo4zoFHUjHckOK5bi2TE3zn5/k/ccmxAW892QNbrWfBuvq6Zsgd3tniNP99/1ZoJqpBpanCMGn1jN1K6WeAiBIyzdH8rgUoZdEdk34LGUcawSEq7dp9DxRSv/U3zvVEbGgOK5epaqfMiNmIYWCLWgewMkmvyaUzUR+Eifrvzz2yyt027UetSz3Dbfw+5+AD2/H0XSupFICkTGpkUhzjwZ+D1XO+ESs/3phKOOQsSpgWZn4axWXWdxujsvNujNSXbjvXzYMn7j4b5GJ/Yzok6LRyz35hd1VmFpEQy+JNlptRVqncpM1Wwig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ke+kqgD/cHH5EMZ1qPSNGSh7v0cbvfO2tiNJYuiIE1E=;
 b=uxSwdfizOZIOsL6549Cmr9YGkTkS+6ecb3e2sm76x4jUvxpVxKRf9KhqgpRcXov9NQpfR490OQ3i/rnb4w648OCabXafAI3Ch1YnbtoISQ8uYIWwBoOCHl3JQYPzdHCPo3rbFo+paE+ICbV7lTemnbduwpv71XLfgZa5CSznzmrYgGrS0Xn1GekjvbLDUROoUJEOeqWt3Kj+l92RpgdUdXo981Kj1jeEDHg/l15VI/ykqXt/mNkcs1pSAiuttPMWRFM+0uVxTTBrJCkdrhERxRlUiUM4ZsCX2pSWkY34DnI479o/bLjs+QDR3f/eQi6dVMG+4H7cmCEsoxjH5wI00A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6ad::11)
 by FRZP189MB2782.EURP189.PROD.OUTLOOK.COM (2603:10a6:d10:139::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Fri, 10 Jul
 2026 14:30:09 +0000
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95]) by AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95%4]) with mapi id 15.21.0181.008; Fri, 10 Jul 2026
 14:30:09 +0000
From: amaury.couderc@est.tech
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][PATCH v3 0/1] Changes in v3
Date: Fri, 10 Jul 2026 16:29:51 +0200
Message-ID: <20260710143003.37829-1-amaury.couderc@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0349.eurprd04.prod.outlook.com
 (2603:10a6:10:2b4::6) To AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6ad::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBP189MB3196:EE_|FRZP189MB2782:EE_
X-MS-Office365-Filtering-Correlation-Id: 452b38c1-adc7-4944-c712-08dede8fbe87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	vQUY+/LRWHPmV3VzKzrSjLzSpwtwz+yb+0eUpYvgDdDv9JsgbTz4tdDD9H50yQ5aHOD5klfK1o41LP7WN7j+NDeMKg6o07d2ynrhnYlTu4Ap2FFKwH8tPT2ISG6P8GoGwguqp9PsJ1jMQR5sIjVTrW2ezz7gctiXjADLq8vslijKtXxSdqhxgDhvrSnwnmeegLaWhQGSxsEwYG5J2QbfHjQwmu25GIwNbVIw/JvPzZaTXBTeJ+rD2zOJkW9mhS4dMtxPFrPYOeGZ3bRzTlQIOo5DnAbniM6fuJf27iGpNC8CW3e9pHeaczPOiI7XQqbXxpztgiJhhbes6HNvZxRXQT5iRxxOC96UZHOrkyxBxYOWuWZiSScd/3g7eLpAFMD83bGaVu8OmD1qb99zgUcyJNJn4LqV7Fl9aSdiF5wNe1xku9kf63CqyhEjgB0Np60y7L1J2+8hLHx7OwI9FFx6HzG5/NXaVaJlj+UKm+0eNC+PD5vl5NBRUA6OKjHCKcYvRxHTi1ZgeTTq4ryqUNxQfbEJMECzSqScWjpwt2LDQtwPZrfe7zgKFt5K5fJkkvTswHPi2IzYPZvF2kTvISSZ0ENXhl4s2R5+uKK2I1I0ejPT2FYPU/Z4zuXerTDkoLnrhdqcsez0+ucw6pNBqS8BDww8wFq1nywnSueVcEG5R2Q=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBP189MB3196.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XXmDlwPeZd0Cx3enLmCEGH9BBX4jGRzD2pAlOkdqfp5wHIlIzCEIvQdfamZP?=
 =?us-ascii?Q?jqm6fi1+qfCsPtTR5hD+g+JAPMHT2IlN+ktvrOqi61JzqP4ms5rPUpdJWcC3?=
 =?us-ascii?Q?o/9XRs5vzdY59rsiBET+2NWurYyVzwEa2TQiPOoj7NVgm5guGiYxQmocWGuw?=
 =?us-ascii?Q?f0d/gCDHYiz4pMhRG8fDdEF+h7RkN1/0/FN/9soJy56dfdWB/bCWmNQZltrB?=
 =?us-ascii?Q?oGr+63Jk3TMrgYUVcEG1KRglEfhbHkmFTXI0Pi/IkeFnujY5+ZttuMM6lN2q?=
 =?us-ascii?Q?GCr1KMe7BTV/xWOg1PdBtPe5jMy46A7K4rgfjZsiNsANJO82giVwp1hqAYlP?=
 =?us-ascii?Q?SiJB7SUelW/eqMKi89fKBgS5xqWavk0L/3KThbTp7Tm5mx2fOZI3mGq/LToF?=
 =?us-ascii?Q?COICscW4TdZ/d9XMisvWsnhjh+ufkyo/55gZyasMTUZ5kDQWcVEL9Ivhv5wa?=
 =?us-ascii?Q?kCul+jtLrIb5X32Q6BAoBsbSQlQKLigYSUGLMAGeHw6cyyP+cOqTrMn6LW//?=
 =?us-ascii?Q?spCjLLGupxqHfzYRItVK7HzShelbPbyk1eyl6pfUwavZ8QZxvWGrtxjlBIkJ?=
 =?us-ascii?Q?ttgx0nmtKjh/Njp6ahgTH5Vz0NmbTNbrpmrcLEtZvLpPPXTGsvdmZ8Vy0rgn?=
 =?us-ascii?Q?guC4zKnc+U/ttysCPvTvS/zdyYtlQB5rfWD/AdlIuaIRvjEQ8OvJjJtp03Rn?=
 =?us-ascii?Q?VE+8jcwEZiMkgv00/aEbh6WIRViTw98biBSRLKXAmNvEH+q6kst4f+c0INAN?=
 =?us-ascii?Q?gAyZ/LkEqq38aktAw5I3N0rpO992qcLrC3iDgek/qAsRPKNjx1TUAoY4C5If?=
 =?us-ascii?Q?M+rlwnsvp7JR38WtZ2dOwP4+jiay1YaqEno+WJaUHR4LZ5obRV0Dg8ckXmOy?=
 =?us-ascii?Q?6IQR0zt7N8yyoSPjB6RHnosw85i8F/ZSz+SYBZ0cs5+QbnSXe5LPGPEzA1dQ?=
 =?us-ascii?Q?xSVZiwqEVEvOz3bRRKmxkrR4MlIO6QHVx7emFMSGsp9l63gwLXzqWLQz5qPb?=
 =?us-ascii?Q?TV9Dr4R9i4sNYyddrO2n92KX3YpuEa1xZJTn7SnZ2os5pVd8P5lcgR12ysFL?=
 =?us-ascii?Q?QSmEGwKJuDyzHieAkp8My5KSgVn37IywuqRjHlqbdLrhnDtPZZUf6KJLR6MT?=
 =?us-ascii?Q?Z0+wYN0clQWSCbMlZC8xAZZSjBZsTHVqfbmJbqkB8xw6T0Ep69p5YKS5Jtwe?=
 =?us-ascii?Q?HRNKTZ/CvqkYFRxyX6V5HxJjuAOPBzuNl9IuHrLIzgs6CcNgtWtYx71dYPcE?=
 =?us-ascii?Q?qdYNYfQbfmim9p/Hi9SAk5H5UXvAsr9Xkbk/eIverq19HWauG0QlNQ61Fq5t?=
 =?us-ascii?Q?kxU3tJD4IcRx+hyDnlh7iRA8tbGTvqG/6yDHZmzbkTpejIsYmpOntSm88KXv?=
 =?us-ascii?Q?ibIkglGwYOeteDYJNnvfKW2QOdebVHi/MRI8wPdGmF9fvnC56kJ2k6wjLp6o?=
 =?us-ascii?Q?FxntJk1eg35kk/3bi5DVjQrGqay9rv0OO/WXZyn3tZ8PfhHQB9T/UBdRSpaR?=
 =?us-ascii?Q?rYtd1KsF0p2S2XkRhIfc+6WCJ0Yj6gh/ubRT2JT8nulZvIgq9ER4Qr2jGm74?=
 =?us-ascii?Q?2Ncl1kLTIWFsZ2ni6aU6Ccx3xLjSZ+tXl/T+kv3oUHW/gSR8AiHvsUS8VNOe?=
 =?us-ascii?Q?6gOMlkE6mo4kVVeJLctCOI4IksFINalWgSNAT7MepCxi1T7FO0yNgPLZKY4q?=
 =?us-ascii?Q?sUFiHtrF49e5zFJ25EbHZF1EF9WeDY6ddGGtTvVFWFwvW9R/0Y1+YOIchwfi?=
 =?us-ascii?Q?XkBogKmxeQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 452b38c1-adc7-4944-c712-08dede8fbe87
X-MS-Exchange-CrossTenant-AuthSource: AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 14:30:09.2255
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xayiXxvqPHH+YpcquS5weJlupDUahGQ0cvbddD6JObZqpEBnSh/R4XBwa+7Iq7x6FpX058mttzzDIrghyXMJIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZP189MB2782
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 14:30:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240656

From: Amaury Couderc <amaury.couderc@est.tech>

- Merged CVE-2026-41080-1.patch and CVE-2026-41080-2.patch
  into a single CVE-2026-41080.patch. Dropped the
  Windows/cmake .def export (not needed for OE Linux builds).
- Cleaned up inner patch subject to "[CVE-2026-41080]
  Improve protection against hash flooding".
- Simplified outer commit message to match the single-patch
  approach.
- SRC_URI now references one file://CVE-2026-41080.patch
  instead of two.
- C code fix is unchanged from v2.

Amaury Couderc (1):
  expat: fix CVE-2026-41080

 .../expat/expat/CVE-2026-41080.patch          | 517 ++++++++++++++++++
 meta/recipes-core/expat/expat_2.7.5.bb        |   1 +
 2 files changed, 518 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-41080.patch

--=20
2.34.1


