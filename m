Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5753FC2D0CD
	for <webhook@archiver.kernel.org>; Mon, 19 May 2025 13:14:14 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.67.58])
 by mx.groups.io with SMTP id smtpd.web10.50837.1747660453199128328
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 May 2025 06:14:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=qe3twPUI;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=qe3twPUI;
 spf=pass (domain: arm.com, ip: 52.101.67.58, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=DSRIKMDCvBQK8A7ohPWAVZyCoFMZdiYjnLl64DW3HRVyWQh7lVaSxnI7FbsxCOXUucv6cx2jdN2lPGcENMG6Ys3NZddrMPVqP+4TE0JnptpCQHLkk6hd/qk1ymGRgJdDgXO9JWLxp9S83zQq1Uc0tw4s6zNY4wzq+Vkl0V6fRRN7L9Q04A8kZhVg0o7BGwajO8oorEm2G32cY1ppPOEgTxrmC9ckZSvibEDUIGYO7DHEX+rA0gxsysx6urpGQV4Wla4dubF9/u8xiDRCL3vt1bEFYQx7f4niV9Xxdu5tjVwhleQQ5Yl5/hV/7UUcpbplwG8LUlty5kw76TutCyaOKA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aZMvjcw44ykMb5R9lJ2ZDhJDNs2lFLkBl+fUW3aBDuY=;
 b=AdSbwDWf9sXo2p028dNEMJbvnGvr91qV15P0e5Vz2UCeBiPUogrW1PC/C2ShkyBfSiuNiscua3v9xSURhxRL2pEMMluS5breZ7+KITBI936AHlEHFwlXU0g5ciyX5Dn2YlztyLCNg+PR9koJh+pSZbh4sRjf4rbhRA2O/Clncf8g4v9NhDgRgDrOgc66Wr9tpvXrRw/qgId22OL/W8iYEfmfmrses1m2EXHu2ERMWIlrUL3nJLjs2VGdyWf2sWMLcBQXuLGEp9aEjm6PIoa035kvCvsgcy1kpUmu00lSpPDY1qXdHNuc73lQl1qwcS543nuDK3pyROhys4lkf+1dwg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=t-online.de smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aZMvjcw44ykMb5R9lJ2ZDhJDNs2lFLkBl+fUW3aBDuY=;
 b=qe3twPUIbp0MS+ueg3Qzd5WnhzBAleELrpHKRjYcsfSJUUUNzoNp8ejy4KuR+3YnvU/+waIQgI8cgfvaJ1kMvsDOVIgb+NSkS6kZPru3f34SDpm/sLpBSS2Peg7fORrTrzhyYtVE7mq0/m08YBQGIR9Pm3KCADx7RHWcB96cYZY=
Received: from AS4P189CA0052.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:659::21)
 by AS8PR08MB6725.eurprd08.prod.outlook.com (2603:10a6:20b:394::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Mon, 19 May
 2025 13:14:10 +0000
Received: from AM3PEPF0000A798.eurprd04.prod.outlook.com
 (2603:10a6:20b:659:cafe::c4) by AS4P189CA0052.outlook.office365.com
 (2603:10a6:20b:659::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.30 via Frontend Transport; Mon,
 19 May 2025 13:14:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A798.mail.protection.outlook.com (10.167.16.103) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18
 via Frontend Transport; Mon, 19 May 2025 13:14:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uOF5plbBgniInHath7ZBgo66giBB4h4BaTQE/gBtPoP+TE+Y2Ycmb+kE6Pph+HcvAIjzQkfFrxaaJyY8fMSQxhBjW2vfsvmdQ8U/mJBZAUdPtAmi4G2ZelopZlCJwhsbnnFr6CGLbbhZMaq9xxxzCq4/72wkLaeJhTNmhHDG+ceYVD6OQtbKIyaWujIfX/teS2DSdZAb3A96oxlxe21/uxatK/J5htjhDVXYjhrL7IEneR2h2zQO0xx8Dy4uGiz3s2m+FUNyMkfPPRR0FPU0LXFO7gqt5qNF5Vx8RBbbt1wNXnD3VeVkZEMoCIA1Zlf18f4WTVRFPcdP50nSQhdyQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aZMvjcw44ykMb5R9lJ2ZDhJDNs2lFLkBl+fUW3aBDuY=;
 b=TtdNd1qedKuU3xMGm1cD+KM48uCVIdf5avbIDFhHyJqrczq3q87nZJjDQfPnK7kdCql6XMo21hdCFlCpkGmJXhCpfkc2lSoNAWPSWNKmJYaf1W1FCHUQDb56aTb9Xdva95Im060rqnNmw2SlvWR9pQrDATu+2hvy55abCF7eb596qWvupEUWyro8k527sL5enBqSHPUGHuTFHjJhu2y8JUZ3dsyDJ5GB6Uwz0BbCBKuW0mFts58cELyFrX6KC8OiX67tFCAb4Cpaloq1dyEbSSTy9/IWsP9N1lr0chuJ+Jrk4aHxEDpWUIkMhQsRuqj3KAW+iDFPwobncIynUOUq0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aZMvjcw44ykMb5R9lJ2ZDhJDNs2lFLkBl+fUW3aBDuY=;
 b=qe3twPUIbp0MS+ueg3Qzd5WnhzBAleELrpHKRjYcsfSJUUUNzoNp8ejy4KuR+3YnvU/+waIQgI8cgfvaJ1kMvsDOVIgb+NSkS6kZPru3f34SDpm/sLpBSS2Peg7fORrTrzhyYtVE7mq0/m08YBQGIR9Pm3KCADx7RHWcB96cYZY=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DBAPR08MB5720.eurprd08.prod.outlook.com (2603:10a6:10:1a1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 19 May
 2025 13:13:34 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8722.031; Mon, 19 May 2025
 13:13:33 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "f_l_k@t-online.de" <f_l_k@t-online.de>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core][PATCHv2] mesa: update 25.0.5 -> 25.1.0
Thread-Topic: [oe-core][PATCHv2] mesa: update 25.0.5 -> 25.1.0
Thread-Index: AQHbyIIrVudjVpAKWkCrvgafoeAFIbPZ7pSA
Date: Mon, 19 May 2025 13:13:33 +0000
Message-ID: <8EBE7E51-851E-46DF-A6CB-0B24DAAE524F@arm.com>
References: <20250519055150.25280-1-f_l_k@t-online.de>
In-Reply-To: <20250519055150.25280-1-f_l_k@t-online.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.500.181.1.5)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DBAPR08MB5720:EE_|AM3PEPF0000A798:EE_|AS8PR08MB6725:EE_
X-MS-Office365-Filtering-Correlation-Id: fea33118-e810-4c5f-ee10-08dd96d709f4
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?bUJRR0pzZ3lRV1RSR3BUWjVWSkR1R2Y5QjhnRUw0UTI0ZnlTRXZYT1hGRXBp?=
 =?utf-8?B?SGxVazJ1WDhkT0hZTkt5eGZEYzEwb1AvK2hCRktSV3VwdGNJQUdENGx2VFBM?=
 =?utf-8?B?V3cvLzBmNHd2VmVhSCtxQ0ZyT2RRMkxiaFFjM1hTQmpPRlA5aXUrZk9wVHBR?=
 =?utf-8?B?d21NUUFmSXV6a0Q5WjBYeW9BZmFXMElhNUV3aFZzYUhMb2VYVHVSTDNWRWlw?=
 =?utf-8?B?UUcxSHNabHVkZ0NtelovanZSUDFnM0tKVnlIQy9UNFhFRlcxMkQ3VGh6dlA3?=
 =?utf-8?B?WkhJZjdMaUJhYWVOZngzcDdhZmFuZEtRQy8zU0k3NDhBdUhaaVlsRVZ3SDVL?=
 =?utf-8?B?dFJjTG1tZmZka0ZRalhydHlDblF0OXEwZFRGdHBjTE1WRzQ5MVRyYUZMendS?=
 =?utf-8?B?MzYwQVFSd3RRbnhWYnNtUWx3WTBOeFd5NEE2UWhvKzVyN0NLZFEwbks0WjFE?=
 =?utf-8?B?SlZYdzVnUDhlMmxNYnV4WWFwNXlvbzV0WitVMVROeGdtMVBLMndCUVdEUUdJ?=
 =?utf-8?B?Mlg1MWpFdk8zdFJURVVjKzA0c0Q2VitoajNxbGo4RVV1SjRWdGxaQjJoQm9B?=
 =?utf-8?B?MVhNZWNOOXJweFkrWkFRbjJ5emtNOGpDT1FRYTBpdGg1bjhBeWh3NFR1SXpn?=
 =?utf-8?B?RlVVMFhBdkJZTlpNSnJTQzJHakMvcHNFbUtwTHRRcnZrZ0daRGlGSHh3c0hD?=
 =?utf-8?B?V0Z4SmV6eHg0VzBiek4wZnljYUxiTW1reGFDQjl3SzhhOGpNYVJ3TXljUjFY?=
 =?utf-8?B?dVlnanp0SnRXWnErdDFLbitQQ1k5R0VVRGd4REpuc251UndUbHo1b1Z6c0Vo?=
 =?utf-8?B?bFp1TXhTcWtqNTlwckVHVk04amlpNmRIcnA3YjJicEZBdS9hZmwrU1V1VEVV?=
 =?utf-8?B?OTROcndJQ1F2NmMzcVVWVmFnMnJBS0Y3MjY4TFRFcWo1d3h6VGVCTGVMVk9K?=
 =?utf-8?B?eXVERnM2dDk3QlJETCszL1J4a244Nm5qdkxORHh4RDg1MlNxZ2VnV2lmRThq?=
 =?utf-8?B?NkVzcWdTUHJqUkIxaCtPZmZEcXlZVjd6c2tTWi9CNGdJMkNRZ05Vd3NEbGNo?=
 =?utf-8?B?cHAzMDIxQnlRQXRWY2tlVzFuenl0OG1JYnRJU2ZOMklacVpFVlpMNS9nNzhW?=
 =?utf-8?B?WkRVY2NvckFZMW5qb1RQeGhJL1h4WTFTdkd3dU93eFNXRDdkYjAzOWpCRUFm?=
 =?utf-8?B?UVZZNitwVU0rSER2TGU1YUNHWXpUTnhMZ3lUbkMrdE12TGtSMEFkdXVmS0Ur?=
 =?utf-8?B?RnRrcXRnN2J2Wk82NzEvMnJsdGFDV0VLS3hwYmh5T1AyU1l4OGxoaDh3NEVS?=
 =?utf-8?B?K2ZDV1FHVWQ0MDRlNDduQ05JQU11REtEdGJ4ZHRBZElHVzBGQVY0NW44OUVt?=
 =?utf-8?B?NkttRFh3T2ZEQ1Rrd0hlK1pybVFYRTRQM0YzY2dLdnozTHlvc01vS2IwUXNt?=
 =?utf-8?B?cnp3T1c0YUhpVjlwVXdvM1J6bWQ3eWZJQXJnYkN2NVEya3pYaHZxYmJVSWJV?=
 =?utf-8?B?d3AvMzhuby9zZ2hoVmk1bkZUTGpFdzZkZW5XOXZjVTJwRDZTMmxFQXlFV3Y2?=
 =?utf-8?B?WnlpWXpsWHZxRUVUSXQ4M080U00zeW92MnMybXh5VGZZRWFTQ0RuaFlXZGZt?=
 =?utf-8?B?L2dER2V6OUZWQjVkTkVNZmxDZmhRN2xPWGxLc2dRdStmS3ZGc0FxUkk3NXZK?=
 =?utf-8?B?anlDa2tXbmhzL0srVEhMTXVzdXcrdHZscHozTmFyTTRGUUlJYTRtWis3S3ph?=
 =?utf-8?B?MnhLMlRYL0lnUTVvOUFCL3RwMGZoNURKdnJWdTJ5bEZFNERyVnVyK1doZ3RU?=
 =?utf-8?B?V1JTaFJSZlZaelZnTXp3Y2VySm5LMWhmenJmZTBxYVZEcDA3OGN1MzYxOE8y?=
 =?utf-8?B?bDN4Z2EzZ053YXFVN3ZEb0pEeStmaDgxbTlNVVZrQTMrN2pOV014SDRlSzV6?=
 =?utf-8?B?WlYzUmN1WWhSdHJtS05NcDZRbkNYZUdTRm0vQVJ0Y0F0SXlVNTNCcmt1VjFH?=
 =?utf-8?B?cFVsbmZCMGdBPT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <87CB8B6DEE09FC469BB1D631679B8BED@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5720
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM3PEPF0000A798.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	77e17eeb-145e-41fa-fd19-08dd96d6f532
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|82310400026|35042699022|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Sm9UYktDNXR3MjVkWmNnL0Y0Y1MyeXpZczFoNFRkSHNzMmc0N0pLUGhCRGtv?=
 =?utf-8?B?bmszY0V3blV4ZnlZVkFnRmtTZ3MyUHZQb2g0RWNZeUhXVHlSQW1vdHRzM2FO?=
 =?utf-8?B?Ukc5VlArTzhQZVhvUHcxM1BZaThhNHlxVzZtdUxjQWprL0F5V3RuMGlOeFA2?=
 =?utf-8?B?amlYd0U5SDd0K203aVdxdW9Zd3NtZFU1OXJRREg5Z05IWHJUQVkwemN5TGFa?=
 =?utf-8?B?eHduNk5rN2laOExXWjI2R2tSTHJuRnBWdEZSRUo5c2ZaTG5XenVmM2tmSDhw?=
 =?utf-8?B?SVVvckk3SWsxYkRUWGNaSnZkS2xKbDRiWW1lRGlNV0lYNkRiK0ZrNXAzaEM3?=
 =?utf-8?B?NU5RSTJZQW9kb29sU0hwcFRGa0czcS92UXJ1NHZ0U1h6cDYrdmZvaFY1ZWRj?=
 =?utf-8?B?T05YNlhEV3gxL2FkeWhCMWdTY0lKNzdvTGFrTnZGbEh1Y3VJM3ZwWmhlRHVw?=
 =?utf-8?B?c3B4QW53b1lnbllRWVZxOHFVbVRUVlhOdnc0Y0hnS3VUaWJsNTZhcE5aNEJG?=
 =?utf-8?B?NWk4TjFXQkVHaVdoblRqTlVUbVF1cGNzZ0huM0sxaDFpQWJhTWhzZ0oyNXla?=
 =?utf-8?B?UllVc3VnckpnbWErR2hvZGd3N3l1R1AzOU1yTE1BbmFHSUk1YjJDSXN1ZGtI?=
 =?utf-8?B?c08vcytta3I2aG5QTlE3MGxzNTZSZ3p3MENLYzhKMnYxUUQ0UXJDUDdhOU1m?=
 =?utf-8?B?cVpGcWtqTmgvdkVWa25vSDZlS3lISllXbG5md0NKUEJ5V0dPdGtPUU1sTUxG?=
 =?utf-8?B?ZTh3WkpnUUxuWG95d3M1bW5qeHhGemtUNlQ5a28wY0hZUWp2b1hkRGsvUXUv?=
 =?utf-8?B?eW5ya1AzQ0J6SnBkMU5ORDlpanJYay9CVXBvWFo3dk9BRkRDL2pPY1NFWmF5?=
 =?utf-8?B?T0JLZTFVYU91SldLZFdJNTV0Z3J3NWpGeWt6RmUzMHVwNXFxK0o2Smpqdzhm?=
 =?utf-8?B?MHhQWmZBVVRXMTBQMDhLWXdabjVZY2QvUEM1OTBwRi9PR3V6ZnpHL1d2aU1r?=
 =?utf-8?B?dzE3SlorMmtqTW55Zk9pN05Bdk5ESFJLaW1sT1g3ZUNGVGVNRXp2K09FNGRR?=
 =?utf-8?B?d0l6VFpuaVdpZ2J2QmN5MmNHaXlKOHdqbVhXcFZ0MDRTNXZNNVZ3Vm9tVzdy?=
 =?utf-8?B?dFc3aDdFM0RmMTBPVTFiVmx6WkRZSjRBdi9SeFdlWkdHQ0pzVjNBdWVpaUxQ?=
 =?utf-8?B?YlVJK3hWMmxacmN4VlpKdnErSFh5UnNudFl4NkNRRlF3cno5cm5NSVZvVjdp?=
 =?utf-8?B?T0lMZEViOVFkZEFLSU9KK0RNUHRCOG91Z0lsQnFSYXEvYmIyWWdTeG53WDRK?=
 =?utf-8?B?a3hwV2I2UzJOcThGWGZyMmFINTRNM3M2TklIUUdpT1VQNUJhUlNQMGpyemlk?=
 =?utf-8?B?UU5sdzVOMnRMWWZqd21aNFRwcEx1TGZvNEI1RjJ5cmhrWE5hc0xWeEhoTGZw?=
 =?utf-8?B?bUk0aXV5UUFSbHVkZTZCQUZRaGhYWlozV2RHOFRoZUVjVmUzbjFLWFZaMUhO?=
 =?utf-8?B?VG1oSExuVjhadXFYU2VuOWNhNGtRQWxKZVpQVXhOZ0MwQVF6bW5jQWtmUEV2?=
 =?utf-8?B?Z0ZsMXIvWE5FYXhvYjRrZ1JSMGhPSE1RWUx0dWxZbHB1dm1uZC9DOVBhM3dH?=
 =?utf-8?B?V3pROU13MWhpQm5zbVcyS2g4bURnSkNLMy9kK09KRkZLVkoycWpTQTNYRkFI?=
 =?utf-8?B?blFXNWNHNGVXa1J0WEZXYzhVZmlxUzlJaHJlay9IUm5tNVg1WExmUmtFMWRF?=
 =?utf-8?B?VUxLdDdBZ2NJTEJ4R2RmQ3VXMW9lYnJJNzFqQUdyREw2L1MyTmtxQmtkc2pV?=
 =?utf-8?B?Q2xVWElpMk8rOWdZOXBQL1RsZjk0TGZQMFEvalNSRW50RjNOK2JTLzNkakpY?=
 =?utf-8?B?Yi9OVUxTeUs3TUw1cDcvdWZaTFBLY2c5QVgrb1NyazFGN0l5NHh3a04wY3Bt?=
 =?utf-8?B?YkY3RThxaldTMDNLRTIrUlBERzZTaEVnVU5HUmxjR1dkQXFzQjdMZytjcHpF?=
 =?utf-8?B?OGdIRll6VlcyakR1akx4NlA4QTJIR1o2R3ZRUG94cXM5RWp3MUpSOFozSHJE?=
 =?utf-8?Q?qyebuK?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(35042699022)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 13:14:08.4271
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fea33118-e810-4c5f-ee10-08dd96d709f4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A798.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6725
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 May 2025 13:14:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216857

T24gMTkgTWF5IDIwMjUsIGF0IDA2OjUxLCBNYXJrdXMgVm9sayB2aWEgbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZyA8Zl9sX2s9dC1vbmxpbmUuZGVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6
DQo+IA0KPiAtIGRyb3AgdHdvIG1lcmdlZCBwYXRjaGVzDQo+IC0gY2xvdmVyIGZyb250ZW5kIGlz
IGFsd2F5cyBjb21waWxlZCwgZXZlbiBpZiBub3QgZW5hYmxlZA0KPiAgY2xvdmVyIGlzIGRlcHJl
Y2F0ZWQgYW5kIHdhcyByZW1vdmVkIGluIG1hc3RlciBicmFuY2gNCj4gIGFkZCBhIHBhdGNoIHRv
IGZpeCB0aGF0DQo+IC0gaW5zdGFsbCBnYm1fYmFja2VuZF9hYmkuaA0KDQoiTWVzYSAyNS4xLjAg
aXMgYSBuZXcgZGV2ZWxvcG1lbnQgcmVsZWFzZS4gUGVvcGxlIHdobyBhcmUgY29uY2VybmVkIHdp
dGggc3RhYmlsaXR5IGFuZCByZWxpYWJpbGl0eSBzaG91bGQgc3RpY2sgd2l0aCBhIHByZXZpb3Vz
IHJlbGVhc2Ugb3Igd2FpdCBmb3IgTWVzYSAyNS4xLjEu4oCdDQoNCknigJlkIHN1Z2dlc3QgcG9z
dGluZyB0aGUgLjAgcmVsZWFzZXMgYXMgUkZDIHBhdGNoZXMsIGFzIHdlIGRvbuKAmXQgcmVhbGx5
IHdhbnQgdG8gbWVyZ2UgdGhlbSBpbnRvIG1hc3Rlci4NCg0KUm9zcw==

