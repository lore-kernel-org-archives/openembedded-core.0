Return-Path: <roland.kovacs@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAA26C43458
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 12:37:50 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8179.1783600668873458940
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jul 2026 05:37:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=oZFXDvy5;
 spf=pass (domain: est.tech, ip: 52.101.84.44, mailfrom: roland.kovacs@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p069c0ANB8Idp5ImoP1ERv72NGnGjGwmc2BIqYt7Yp5/k8Ew8sp9t79+9vvR6PmJHiMvbfyYrcq/sCidOb9x0WXbfO1E+uzac98cZq/CqDgRSt2GOtkJGH7oc8vFeghxms8bYhzwtpih6bs9Odpa39+XbMeIMcbHbSUpydniLJngnRdviqBp2F5+waj3G0pIYsPV4CQ2vxCAuorS7Rtq1PeKVXrOmjKtDK3bhhe1p/8O5KR/qDX5jy2ZWGtbeVmc1bR3M5MuLs9cSCYIshXDh5gi6B9Fb6tnRVqI6N8TNOKnm/NHUXDmrpCey0xIFHzGiXMGlEbqz5OfF1c0UrIdTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Xuxf4krXwGUBxQIPcM68ZSccRs8HCsLTRVstuiTLIc=;
 b=u5yoCc9WmwEwTaNIONh2aywRbrTY30TX7WATERLU1XRMV586vdTG4VOeE6wo1Oo1me2NK+Y9xciksXAgZUZ5RhKDEBwKwgOE2yGyPPMSCf6RtBrvRB0PijxoVEMQ7IfLYKd8ortOEVFX5sA8agioc+LBb8hUomXQLZvGCtKXTpUv+vHKmQkU1enIWHNXcwsVQUKSfo/07KcLcx7bofyhLBER2Ds/xnIWcFQ0Jn/9vQT76qjmcWfIO7OFTzsfFGyKIE5m3CeOaN+wc3BRDVtv7d4zP0v4Svui6ZYpNa0CipTa8QRZPmwMsDzAzOUkjB2yoH5bMorCwgKltNTevJAAvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Xuxf4krXwGUBxQIPcM68ZSccRs8HCsLTRVstuiTLIc=;
 b=oZFXDvy53BugGlUpw33tCVNedJHqT8j47Ts3/1ETBDrgjeatnPsEeXDS6h/u68sBzDDlAm0DfcPO5jXnjolzZm5TGd7ZiXdx6eeUXD1Q/kRDeaxcvS/hFf2YTf2SbqNCduks95KFzQcHIlgAOdiUDfPNAAaD3pfkmrhV4COKaZA0UV5q1+1aD/kl2nhUKaSr1WTSq+D3E55iOc5cBHjO3rjgb0iSDRs6G8lpCYc9WG7Wb/XJXSVUmfEioPV8XXkQIBwe2YLIrTolhTswywip4LpvICfbcIYJ96J/AFdtYvZSC4wVevsmpG09ko1YJ8qwMx6jgg2i9lzDStFWujiZ2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DB8P189MB0732.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:127::14)
 by DU2PPFB830855DA.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::a9f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Thu, 9 Jul
 2026 12:37:43 +0000
Received: from DB8P189MB0732.EURP189.PROD.OUTLOOK.COM
 ([fe80::6c51:738c:1290:f77b]) by DB8P189MB0732.EURP189.PROD.OUTLOOK.COM
 ([fe80::6c51:738c:1290:f77b%4]) with mapi id 15.21.0181.012; Thu, 9 Jul 2026
 12:37:43 +0000
From: Roland Kovacs <roland.kovacs@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH v2 0/1] binutils: fix CVE-2025-69649, and CVE-2025-69652
Date: Thu,  9 Jul 2026 14:37:39 +0200
Message-ID: <20260709123740.150315-1-roland.kovacs@est.tech>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0688.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:37b::17) To DB8P189MB0732.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:127::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8P189MB0732:EE_|DU2PPFB830855DA:EE_
X-MS-Office365-Filtering-Correlation-Id: cd7a53ae-7fda-4715-c7fb-08deddb6df13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|11063799006|56012099006|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: 
	gHoc6TlGO3+lB9esFyR0So/kWj/WlXVjLkWmvYp6gTNWkx25CTu24mdIQEPn00na6rRrQ78TWWLZbDZVzI6rd2vo/JpyONeP6vSLEottXuYr8oMpU/u8cFRZQR7ZUA72XQ90wR9UVnWoU5IXB87hCfCe350qRkCFxjJ6F0+K7IvkcE/uOkm6kvx5hbFtf52JBaBIjNhzwE7RzuZXRgfbrcELvlWTSCsxz7TObbobVVZ5Oxm9r2URz/zQrW3oQUv6ucoGO/txsAFgvNDMRx1qmLQetsIn4dWpF89/l1MLpxIKjx48E0k42RSsCRTOZUbJPteNZKcVI8KOelyGUu7kTSl6/VnhsA80Qs5CbJwim7HDaR+brGQYOmkzbBSuFJyQZvnz6ImuGOW0fdweDrizM8ZkcKBAEWeDrEKgSfpYAecVThDZh6Zd2ZbG6qU5lFwjWldSAY3xpbex1x0U5IcgnS367R1mvCgP+3uS7BAf8EL3+jSN3cimwEMUUrzqIxeOdLksN7T/2wYaQPHO6Ze7GYD4HdXjE1eeCAuvC3ddqKQCXPt+5zROtqw+ixV2SPEmS3aPuI9/ErGCsLjhMkSb/S5aVT+i6DL7pitoptcKzat7WQlg1kl7TCrcyeTBVIYMvqMzhLoipkxuwHYxE006BEqMCqyyg8M970l+s0jUKsY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8P189MB0732.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(11063799006)(56012099006)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?CgS9nLyYC6wMG3VB204b9YiYtLGdS41U6jpEuixvj7CCopqKqhWftcZkSY1T?=
 =?us-ascii?Q?FCyV/hseo/736Qstne9JMjI94SdnaXILsXkfFHT1YEvE5H2yqbWwipYAE6UJ?=
 =?us-ascii?Q?5RX0ybVkpsomvb9SjGCLri8RClgBdFmO9ugu8piOzzrrudlXQqmcy+rOAlXR?=
 =?us-ascii?Q?0rkDm2e67DSIHS4/hjOFToLylZ3yhu4MiP2HPzrc1wSYt9vnLi0WDI3jLYQD?=
 =?us-ascii?Q?jk5pvrfLbm8Dg9ON84u2QtUzDhRVdRtndHOHWeT5qQcmTti3kIVgQC15p49p?=
 =?us-ascii?Q?hCai1eBAwhleeNY6AK507S6jejqQuzX0AVV41RWdsBhW8rd3K+1I7RT3F9HX?=
 =?us-ascii?Q?Z4FmgionsgVunkkYYOTkgTsdFyDTjj9Pj1kuPuRznlmozJiCR43HzNaQZ+rW?=
 =?us-ascii?Q?gVsSC/NYoOqo60UzZflZ5/Hg+sVj5w43L2rDYEvDhaQvGsGz64QxAR75t6ew?=
 =?us-ascii?Q?N8/Kal+cnKK4gw6MkZYzSljwwMnXbk5Es4HmW3Enho/4QoEy1oArNblYL1Xu?=
 =?us-ascii?Q?DinciiwpPI+0ujC5l/Nvenxff6UQ5t7BxOReum/YbfCn5SXjd5w4POtoF7DV?=
 =?us-ascii?Q?aRT7kDQ+fOs3hz+HVGtPpz7LvRkkr1wCucmjb31Rb5Sr4uwgbPIBIc5HxfU+?=
 =?us-ascii?Q?uYQmoBFlXxPeyFFpIl+rOHAQ/VIl2FM3P8+z/XPvp4N/5q954zK+iNcK8GLS?=
 =?us-ascii?Q?n7JoSKFVdxBAxigRqCjb9R9E8jNdVqEXEeDUb0V02qLdANdJzh54YP8UPcgK?=
 =?us-ascii?Q?cVoC3m7Nd+AdrYoZ0VhhJqezd4k2HOvx4IZJb7NVUmhMiUIXjVcwxGBmYOvA?=
 =?us-ascii?Q?eYCX9eIbKQDCUwEIsBykFS1mMBC7MZwwU5DP/H7DQZ4/hUxa4b4iAw6ML4IH?=
 =?us-ascii?Q?kpno2Hpz1GEFd9XN1+4qC+CJDzf5lvfLQ74ftofRIPpcQlgc9xikoac+fPMB?=
 =?us-ascii?Q?IoIm25hLnYycMHQOCdPiduFlC5PcGiNKEk7Oc1c2oaXl57XlcIgFTXaAZ/Xk?=
 =?us-ascii?Q?AFiorc6rlA51EUQpQR60zSQGjR/lcl9r40ATV2JE6aG9RPvBmg8RAbKfKG2K?=
 =?us-ascii?Q?jKFf18o1anT8w2R3bITPpYoVOF7dwukgpp0gTJuBzkUqk2xoitZyJGMViQoa?=
 =?us-ascii?Q?+8ODXWBHYFK19YKX/blbhQJnbukbdWcx70JUE78U72wUmbML6dajC5OxdOiy?=
 =?us-ascii?Q?PkyS7Tjni4KAR0fUYyxnmw/X8gh6ughgCe8Uz+Oj7ngfY1OrBfh1ZlVORbH5?=
 =?us-ascii?Q?9JxhpHL2K4e58NObWVnQgn0Ai3yl9fBXz2RYttAOB5/WVNfmw0+6SGjtWRix?=
 =?us-ascii?Q?9ZWNrcKxeCR12wgQOWIvq8tgLga56wzM7YYGQfDIEXTiPJyomRrfHoF8/DJK?=
 =?us-ascii?Q?Ly22YKYA+EJNmqQp0QnsA2/yKtjGCGjjtHFpgtqR2qMk/u94NNP67S+EAc9W?=
 =?us-ascii?Q?xrO0/e6pJ+LBn/KIndYXY2M7uEBB91rwrv0OF+StsDL07lJLozMx6SrIN+Zh?=
 =?us-ascii?Q?6e1nxDaJ83Kaw5LNnmMHbMrrWPj4I9K/IvLRTCF0wtup+dUBeKzQVGO2nf0f?=
 =?us-ascii?Q?GnzulNFHjU+DlhfwhQX6J4z6u/Ga92i6iuOxmwUe7tiNuYs5PeTHtDuLu8Qr?=
 =?us-ascii?Q?7/wj5nVFnBKfj/TtsxctKfXq036UNOGEhXadizYdSLH7BdunwWk0aT/Qt5TF?=
 =?us-ascii?Q?KkAjTo1cPG6s7rqzMN/HhiJbZYpA+I4ZwEoDsrh4Gnw8CSkvjWyv4xMvRTiv?=
 =?us-ascii?Q?d7HLQx6hPg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: cd7a53ae-7fda-4715-c7fb-08deddb6df13
X-MS-Exchange-CrossTenant-AuthSource: DB8P189MB0732.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 12:37:43.1801
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n4uWslots0BaJB1+LuGo8kPGnCwXKB6QAnHdiF2liaDfICihdsEQ/Z95hICdKcJnu47stipTTKxyYNf1qS/zyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PPFB830855DA
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 12:37:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240576

Changes compared to v1:
  - Add note to CVE-2025-69649 patch on difference compared to upstream
    change.

Roland Kovacs (1):
  binutils: fix CVE-2025-69649, and CVE-2025-69652

 .../binutils/binutils-2.42.inc                |  2 +
 .../binutils/binutils/CVE-2025-69649.patch    | 44 +++++++++++++++++++
 .../binutils/binutils/CVE-2025-69652.patch    | 39 ++++++++++++++++
 3 files changed, 85 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-69649.=
patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-69652.=
patch

--=20
2.34.1


