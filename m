Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62D3FC5B543
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 13:59:30 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.18])
 by mx.groups.io with SMTP id smtpd.web10.8246.1749131963875229909
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jun 2025 06:59:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Bls6jrdf;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Bls6jrdf;
 spf=pass (domain: arm.com, ip: 52.101.70.18, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=NYci2AWvr57aJAgasP9p1rj4JGYeWQlY5XjoJ6qdV6uXidSxpP0MSabXG6qjQ2mm5s0PQPmlIepK+yLKfi3U5DJcVsjuvvb+mu/kpPogvpVJzF09ND8WM4F+dj70CEwfoHphRTszr7V3Xw1ysHeWphQf4hlBdqi4MkYFcytQ1qOT8B2xmiix9Gp6UJQDvkhYTHaR2Tlq2F0OWZkCCubo3bDFTHEX2hDxAeFeDPN+pIKo7ZygHQOstZQU+Ctrdt8oCWL00hHzyoIHWSPFWnveu8O/pnFMCOZdoMdbT3C0OK1Q1Lw9RXHN6S398QzTR1+i1gaIBb/ACtgvVtuqWgi0iw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d0VQrkP2CiwF03Db5btdm0IWXmqMGsskwsOePweHqO8=;
 b=YVrtDN+4ygkWgubYnMvql+svCfRLV2M0syF2G1l6qGAeYF6PUeDHzOc/j3hVSigyFtAH86/YQNeDoBuqSEPPWukKV/JeL27fJc1GGtYJxzdxXBEc7BtBXxgDSeqyqKMkxSL0Vagilz7tOURg3yhOiGO9CKfo09tY1x0DUaPOvYFtuaFrh4Xb//rGBl3YYaKpqmKAwCuCdA8gtTurKBBi+x0vThyHLkA5MbC+fdcPM8RtKbGUCq+TEZyjCVmYAipHmif2Xf/3njIMDGoXo1zYIH7RS06p1ebzwV+dzgEksXuY/Pyju6h+aD2qheCS9WYftiukleFP0ptumgG6IhHJvQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=ericsson.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d0VQrkP2CiwF03Db5btdm0IWXmqMGsskwsOePweHqO8=;
 b=Bls6jrdfX+PsgNASXwdLjxabxJh2ahjYhOPqA2K5Rh0i64vlrsF2YvlklpPyY1fiGp5u8j7ratv5an7/xwkx5L6RgbcIwTJBokGpNJYkjfL427oIIRVwaHZe2E6zJI0YXspt0Yzvc91DAnofLaAkR0upT74FAQd1Xqvmv6vuMLg=
Received: from AM0PR02CA0189.eurprd02.prod.outlook.com (2603:10a6:20b:28e::26)
 by AS8PR08MB10071.eurprd08.prod.outlook.com (2603:10a6:20b:633::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.22; Thu, 5 Jun
 2025 13:59:16 +0000
Received: from AMS0EPF000001B4.eurprd05.prod.outlook.com
 (2603:10a6:20b:28e:cafe::d4) by AM0PR02CA0189.outlook.office365.com
 (2603:10a6:20b:28e::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.29 via Frontend Transport; Thu,
 5 Jun 2025 13:59:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001B4.mail.protection.outlook.com (10.167.16.168) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.29
 via Frontend Transport; Thu, 5 Jun 2025 13:59:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RGCUcFsTEK0XteyEh4eZwIU8m7yzGAUhkvtJnheywZ1Sgh1RB7WHFWPg5lnsPUvmO1SRqex67siwUT7zFUq2vot1sFx1sF9DRiXZcfo4/lF7C6/Jkd0Zv4x2xwTdBHuLhekgYd2ahmyFmF/PLXmo52ppK/+T8aVDfffZR7W9fUND7VdIVhOwQYHugSFRL33Y9Nk0Nak4ncZONUsjfr+Y10sKqKrmdMzGzL8SpPk1ahgAeQkf3XGa7dRuCiLxrx3qiG0ElD2Tukvqbi/NzAEYqub+r4xJsHXGZcLOM22AWYyK/pGtZCououvwrkmSKdlCC4+t4OqnUiMjpMbOA+6Jzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d0VQrkP2CiwF03Db5btdm0IWXmqMGsskwsOePweHqO8=;
 b=kK5190+uem7rRI25pvQr1rufiiYKZErczjg/VFzsKLBcB0yFB1USPjbuhxJmzRX3ZipdgOXWWt1YnVVjnMZS5soRRt3zhFN47lXIVlNqYVy+JvqCJkpU9hSqTJe04ADptqeZEyxVUXJY86xPqtBu0mFID6Dwj4IfLi910UKxPZMv8dPB4t0FXXc00tbQxLs8/Md9JW5yZrqGI9JfIW0YAW15++nVFZZHc145y+e2fzMwSKSn2bRkn4OxTIWnPDeDntYZ7fNRxacg/MS3nt6G1OEPXz5ps660dQs1O4XtLuuf0n0O6886YOlyoGa2/SVCl3PvkybnpRrPD3CUmAc+nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d0VQrkP2CiwF03Db5btdm0IWXmqMGsskwsOePweHqO8=;
 b=Bls6jrdfX+PsgNASXwdLjxabxJh2ahjYhOPqA2K5Rh0i64vlrsF2YvlklpPyY1fiGp5u8j7ratv5an7/xwkx5L6RgbcIwTJBokGpNJYkjfL427oIIRVwaHZe2E6zJI0YXspt0Yzvc91DAnofLaAkR0upT74FAQd1Xqvmv6vuMLg=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB4PR08MB9382.eurprd08.prod.outlook.com (2603:10a6:10:3f2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Thu, 5 Jun
 2025 13:58:42 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8792.033; Thu, 5 Jun 2025
 13:58:41 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Daniel Turull <daniel.turull@ericsson.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v7] package: export debugsources in PKGDESTWORK
 as json
Thread-Topic: [OE-core] [PATCH v7] package: export debugsources in PKGDESTWORK
 as json
Thread-Index: AQHb1hHeBRsL52JRQk6iCxVe3IfpfrP0iQsAgAABo4CAAA0FgA==
Date: Thu, 5 Jun 2025 13:58:41 +0000
Message-ID: <EFE73EC5-7CCC-448F-992F-BB98DE01401A@arm.com>
References: <20250605120306.3692449-1-daniel.turull@ericsson.com>
 <F45D78A4-1E20-47BE-9A54-DAB7B86CCABD@arm.com>
 <PR3PR07MB666677B4A7CD5EC0D5550F528A6FA@PR3PR07MB6666.eurprd07.prod.outlook.com>
In-Reply-To: 
 <PR3PR07MB666677B4A7CD5EC0D5550F528A6FA@PR3PR07MB6666.eurprd07.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB4PR08MB9382:EE_|AMS0EPF000001B4:EE_|AS8PR08MB10071:EE_
X-MS-Office365-Filtering-Correlation-Id: c1edee98-cd3b-48ee-5a51-08dda4392816
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?f85Yr6FG5LuKgliSq2pmqBcG+lY4sgAhN0JYX8zUo6U1hJvcSibjlZ+zOAmS?=
 =?us-ascii?Q?BnvODJFkl3y5Pp/XWCdZ+su/9zAzy1XYQrNKDBg64xtfLenvxQaRbWIEpcBf?=
 =?us-ascii?Q?7yRgBxu4fMLUtKsUGP5aFS+/aH/6AwxiMvXAmnsjWhP0/W9lpFu++ZoeNDYf?=
 =?us-ascii?Q?atx8scB5TqE0lxOHk5sIXho4Cxj38unstbuTvMHLO/Tr5ERnezJ8G6YCsseu?=
 =?us-ascii?Q?lADHiZdGVz8MIVYp0AaodTOApXf0TR7uW1aUBzvIb7lXCyO8JtHml1RiPJiy?=
 =?us-ascii?Q?TAlmlfbJi+t0uNRZZbeLMGqQlg8cG7hvCPC3ET0v8rjMogUJlLVb3yJ8kC8R?=
 =?us-ascii?Q?q1wFR3J40aCvIh5OerXCR6dojt51GZoYIV7IPb6n6heYHEXZk3dL5YfOag18?=
 =?us-ascii?Q?7VuuOGESH4EpebUVmFha5YS2rctXT04AEPt5G8Y2bgmsO/J0+c7cMhUxMs1f?=
 =?us-ascii?Q?fNmBB+1Tdmwq+ZrQE+XRlQgk3qLPE0IPehTc9LpNkr6NMpDmkBzRSxaKxDPL?=
 =?us-ascii?Q?MEvGHBIIoWs10ZakZZ8fCqnC/qh5YelF/YkiIx/CoKeIIwlzSLGi3WQFyF8z?=
 =?us-ascii?Q?ozbKyDGptBVzUtRTWNj7ZL0s8gAjz0GLYS98wFKbX0t0tNbdL/hfg4Cf1SbE?=
 =?us-ascii?Q?QGXYo2+1nLZC+654iP8vpYWHyPuw4OlTcmiwx07lwv0ISRzBg8c3c2JFA647?=
 =?us-ascii?Q?8KX/7zxwvppark9U3hgzQCUkunvN1Tg8hVB3MKQ4hyBPVsMrAxIA2nMu22Wb?=
 =?us-ascii?Q?bv7tO3TNNGNpREjd0Fj2bkdmicE/MtUvQ67O0X7j3/xV5JUOfEruYXsR5zyf?=
 =?us-ascii?Q?2WGOFKRo6YqvJe5Z2dOFArsMFeAdYgSdW0ooEgCawAb7Bhd5jcmE2bfZkFWd?=
 =?us-ascii?Q?CYOaxz4BDhU01RFJpjUPtFM/5bG7qvDWl/E53a0NS+UM8scU5WEJsM/AFmuy?=
 =?us-ascii?Q?JhtJQXrNfm2ZE2qeQl0Mgxpe6ySE+vjqqtYlEPXoW4lANjZD6qJQYT8QVGLZ?=
 =?us-ascii?Q?oUsvCIbHw4CqD5RsHx3/ppLTRwliG4JteBLi8UoM1kQ2bwb6B6NVUxxVslfY?=
 =?us-ascii?Q?02Qcopdrqj6qQgJoiyoyVOrn1OL0QFsgFmkIrU4CEmG2u3HPOY75kqV/2/PG?=
 =?us-ascii?Q?mbbIUH7wP6wuODXLPxb+4S+heqgFs2EA3HsJjvXD1J+v7Cbd/bddgeo45YOs?=
 =?us-ascii?Q?ucb6eylZ67o0ccwsVydw8XC5LMM32Vu37EGcz1ANs0cJ1LCrLVm9HS5Ya7eT?=
 =?us-ascii?Q?OF/xmpkb0qgbeerkGTAXyvTqjJQfKPv66tr55aUZEIVLGEl0MpMAIhLsCuA4?=
 =?us-ascii?Q?mNWKQw51MBh13q29wwvtgMPUfAcWXP5amBjNj3zaym7zDSqPpuUhKhn1B+ha?=
 =?us-ascii?Q?veIxmRjUdAYg+99TzqvCETsuzgQOTV+PgWhBjc2TKzRFbYhhaoCoxT0+UyWf?=
 =?us-ascii?Q?QnuqBIiVWR2/vGbHMkWSnlD4fcGcwxLiFM5QVYlmy4bbBIoUThUd6PmcKJRD?=
 =?us-ascii?Q?l+iEFKfJvlJgRMI=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7CEA50B34BEC6C458C0354F6AFC29186@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9382
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001B4.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	23af3d6e-3139-4b4d-9c0d-08dda4391468
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|35042699022|1800799024|36860700013|14060799003|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?luOO4W8GOLx8Ph5Bdo3J/rZrQvKlWDGq9xGYbHetWDGoDZqaV+qaHndYjOTu?=
 =?us-ascii?Q?Dif2lrPLmcsGcRgyZ0q34SvH36zwDLWk/PDQvgda/twxk+STWFvI8BvSs4Hu?=
 =?us-ascii?Q?EKO5prBc2DPzmAd/2HRL2w6ZlT2yGdKyoOn5VyHxPmwJBChKK3OxoDlML9nu?=
 =?us-ascii?Q?cIn+tL7oLdn5O91zr+f+FBYaMw2vPIQL4gZfcslYcTigGv/8PAe6/JEWa018?=
 =?us-ascii?Q?fmPRrZX6EzAVVTuHlqok0c921G00LL0/SCo3Vvs84gu5V1U1pBqyo4PKeCkL?=
 =?us-ascii?Q?DnRWM83dbS6JlQlSFcBTJhATQWswdSVj02bNJ3yqBZg9J+5qwxe4EDt2001V?=
 =?us-ascii?Q?P7OqblFLaeCibmevLMAA49mqz00JkP5PsXudBjy7FTjmhMi8gro7n6JgJlTs?=
 =?us-ascii?Q?W/jgGS4iK2qSaJgox1ITYtaxdwcfGNFfhV4wg9TZ3bPUxWUboIn7wOnVPXku?=
 =?us-ascii?Q?IDG7SwCI/K+63ODOYU0YWhmz2YmdS7sARmnpmVHXyoakPp3Aa78PRzYIFfau?=
 =?us-ascii?Q?2dWbF8l6d1AjSsbBjZVMIe6pk/jh+T0fDhGfHEKLoyELpSZZzv5TDPtP+rdv?=
 =?us-ascii?Q?ig5Lu6L0pWYOgViMtu3ukicvQbJpuzco9rTOFBcEVhYA2rOoIuttYKPG8fxe?=
 =?us-ascii?Q?Aqq4TkcVMfEy732fbd6almXTWIdOdVq3Y0LUy0eneghPw+HueK7XLZFJLrXt?=
 =?us-ascii?Q?9z2jF7kv2qcxycMtBV/RTXzIrkogLkG0hJM7xsBXyUIIfcsTq9il+PQYdj9g?=
 =?us-ascii?Q?Y7abp1BHFyC1zUpeFFWCxya7i8fCSMUsmwm4VwoEM+nVrzPRdP5QoDej3WO2?=
 =?us-ascii?Q?S33xZljTE59DWR5gA3vg29xadCeorVG9Y6158+My7Vc2feOBSjDV8IJcW2Mw?=
 =?us-ascii?Q?FpGRplBvMJ+X2h8bI6F3CxZcvsGQh9P2dciT1yPk5M85we8djQZCz+Y2Pp8E?=
 =?us-ascii?Q?znLD8nbnjrBL8C0ueth9H2t6nIp//HEpSV5sRkNeBd0BzafiVrkXhqODnnl0?=
 =?us-ascii?Q?sQp3M760I5PwP3VG9910845YSlQ0yDF/l72rR5b5Y2wmoGktHBlNixMSBLBD?=
 =?us-ascii?Q?uq0WoC54VtiMQkH/o6ZZM4EcwPVUn32Fgd0Abs8s/JXn5HVCgauVVsuSvDbK?=
 =?us-ascii?Q?3uxYwWmQvfodI6iE/KWPX9U82iAsQwm/4qE7T5USq/lh95O4OZQhHd3kufX/?=
 =?us-ascii?Q?f5PyG3k90qcSGUmg7yiqcR/Oh+o6DITScrwuNjelzi6MLdRSO/Y273yqtjNk?=
 =?us-ascii?Q?bfFE6TV9vxWvJ5RXcSGsnNcWrk7CXOzmccDtcHgZ/s9FZCsmmUuC3Z1PM4Za?=
 =?us-ascii?Q?FMcqv0HeqZ/2Z1QvPGyFC+oUIRn6N8J7+lFI3AUqPOnRxChJGdVQOlT8I+wd?=
 =?us-ascii?Q?zsWF9ZPF6eCxfa0liLtoKPwsQhjT4oAJUPUVFD46nBcOBG+JEGh77zLWVgnY?=
 =?us-ascii?Q?aib9TXSoHlMEZXRflRrHdPdq/fZPDVTZl/W8u+pnqVps3s5SgycjuoHvscQN?=
 =?us-ascii?Q?XqoWhMieHW4AjtYoEx5mEhxzbUocLTFyzHK6?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(35042699022)(1800799024)(36860700013)(14060799003)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 13:59:14.8264
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1edee98-cd3b-48ee-5a51-08dda4392816
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001B4.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10071
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 13:59:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218025

Hi Daniel,

> On 5 Jun 2025, at 14:11, Daniel Turull <daniel.turull@ericsson.com> wrote=
:
> Hi, now I noticed that I put the wrong unit when reading du -s.
> It is Kbytes. So the increase is 1976 KB, not 1976 Bytes

That makes a lot more sense and is an acceptable cost for that useful data.

Thanks,
Ross

