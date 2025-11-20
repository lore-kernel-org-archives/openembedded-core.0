Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3B77CF887B
	for <webhook@archiver.kernel.org>; Thu, 20 Nov 2025 15:27:16 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36762.1763652431858033205
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Nov 2025 07:27:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=H+urm2Y2;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=341909d004=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AK5QJIH2046408
	for <openembedded-core@lists.openembedded.org>; Thu, 20 Nov 2025 15:27:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=ATCm+w1tJKogFk7F1LqQe/vGPEUzMerr4oUbrofMYy8=; b=
	H+urm2Y2IXa6QA/oHbxoo0+8ylhdW1WlY/xGOppe64UCsV/0qXWcIk7DQYAE6yTF
	CYmPkFStvP2MAqWp9YlbRjsFpuC6icFGbHUwE3DSXBYfKh/rbVLmBP4CAOqIxrZ2
	+nA+iw2Yu5lD7uZQ0AkDevGCmh00t+TW9qggTtFYS/weOCv6fBSWrrTD2RGmSN+s
	bQWREWJEnzPIDeF866iPQABI3J56YpYPQGw1P/gjN3tjDOu/aeMBuwS0kCaUWmSQ
	fKghHmzNHUruqfQalf0C5cGa2fHD3YmB51S2LB4OF1JoHIZH7xCypLb49ZcG2HGx
	EQ5+0HfqOj3/grtIzpGsbg==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010063.outbound.protection.outlook.com [52.101.85.63])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ahrs3rrnn-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 20 Nov 2025 15:27:10 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wm1Ks5CPHIlbjzrz+V6kgaHm+uBh9b2g83J1/MHiSWVQzuBHR50XIX1wRQ5KG/HWX+8HbJGuSuVOEJfnE1aH1N1qF/Wz3P5jXinGr+gen/VuOCtw8W6j10/0TGgRHUfJK5A3D3HmHz8HRpIWBvWZAbDcLxYExFKri/w7ksXRj8aLONHsMz5rMGcNR3zemgscksWIjrjs+jAy46+S15PBJoWpJn7OlQ2ysvgFPHkZdtYguJki8vXQRWezTjvzTQ/6Sqn5z53OH7VsmYVVL76wradKnmBPKmVN8GMi1X0FsyFG4YZoDuX+KhKo5zkQJP/kV8E32uzmDosMAFYizgmLNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ATCm+w1tJKogFk7F1LqQe/vGPEUzMerr4oUbrofMYy8=;
 b=Ejst/eQrvIFMnA0UzslLY9h9rIqMOCTvosadBUIv4rz5aYnyJRySQUe3I8WmIRmCMup227bynYGGp6Lx+vNMan9TYrAv9jsnNm8P7gunYtF64dWML0/ovVg3GwjXcsM8mwK1n5x9AjG+otCvMeT1qJMAxUHK2H1Chl+Hiulh1lMyaOjY5UpEu6Pgy4NHQBzA4NJbm7kecoHYsrfqsXYpGlPDeTF1SUxcTx8lSaAcAtaENpDliy0C6vLVvPqd/RdiIkKyOshRsCKCAewJSxYgSyQT+mTmVBFUwVmlZL9eWcN/eOFKZ5puXkiDUn0Hr/hE9BcCEDJpgQ7njAMSIiVwKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by MN2PR11MB4760.namprd11.prod.outlook.com (2603:10b6:208:266::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Thu, 20 Nov
 2025 15:27:08 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 15:27:08 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        bruce.ashfield@gmail.com, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH RFC v4 11/11] selftest/cases/runtime_test: Add test for Linux Rust sample
Date: Thu, 20 Nov 2025 07:26:49 -0800
Message-ID: <20251120152649.1128685-12-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251120152649.1128685-1-Harish.Sadineni@windriver.com>
References: <20251120152649.1128685-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0161.namprd03.prod.outlook.com
 (2603:10b6:a03:338::16) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|MN2PR11MB4760:EE_
X-MS-Office365-Filtering-Correlation-Id: c0c9cb54-f489-43f9-de9d-08de284944be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?jf+JbE6d6MZHMLAOVjmL1vgKQaO1IPciqonGn2GSLwdWFnScoXlSfsQXdJOj?=
 =?us-ascii?Q?M7xi/NdZQSlyzx4JOuJlJNTVnGBy1X2Y2RwHfiKmoJKRaEv1P5LQpUzT91gC?=
 =?us-ascii?Q?2lWULqqr3sbA+pat3SPa8CNb6MKNwRczntuKKXHudvCQTyan7Ivl8jPwiSC4?=
 =?us-ascii?Q?aKcsyTFjfqta3VH/H5EfnPZnfcgyDR0pH90ItSBWAlxDZJGbe4Gqi/lp2tdx?=
 =?us-ascii?Q?brYXXacSW1HpXMt3P/u8cNApvXvtowsN80eol51kP3ds9MsG2qyVvPKqGokj?=
 =?us-ascii?Q?ZJIoAxq0LQDU1elcQ/3qxTLURSV9vzinFwFyr5A+j0fwrTok9/kwrSGPbY8d?=
 =?us-ascii?Q?t3nNoeZjNlgFOYZXXAdS9mXP8vwdJuLRJ0QTLjqmprnNlC3w0C6h5gjoBd+6?=
 =?us-ascii?Q?2FLDcAfCmxlAafpxFV9PC3dYaXwEcxHS2Y60+J8mUeE+vy/Wx2nte3nc3HVn?=
 =?us-ascii?Q?sHeqfSqYwRe145uodUtQ0AUkriDRKd6c8T+5If06gcrzxTNik1RQsBez6+7J?=
 =?us-ascii?Q?dU6uXZ8cS4AHzGGrKpyaVnnhCl4+en9KhK7upyYs0SH1qVbF0ZWUEfsSCa/T?=
 =?us-ascii?Q?hvkznFGr/szdI8uJUCAgGpfy9UG5JZWLijdDitsSY0ibfqbYMhO0Wx7YSl8Y?=
 =?us-ascii?Q?GLTgsb6DMwL23icxOQ0Cg9Reman+XQ6ZNV64IZjlmU2BY9HQkgErclDoaQJ0?=
 =?us-ascii?Q?zyWqHr6VQLgG017UG4zIEizzZFrb2/7h2ERB32mWzQPxoXUkhfsv1tsOeK4g?=
 =?us-ascii?Q?2BuYRn6Fv0X75sJK+1Bc1LEi7kJ0WI2wRDkt5aJTf6pe1kkEuQtgJvZ1cpPU?=
 =?us-ascii?Q?gF4R10Cmi2VNww2dl7OEwYQYyywO3l2aI8AeV+3J4mjLJ4ierIHlUwz9oPXG?=
 =?us-ascii?Q?PqrDyA56S28O1W4bQ6xcfYfnznuwzTCFc4TKs9cUBRSnOeB/BunpZ+dbyltU?=
 =?us-ascii?Q?Wy5xr+PFu6h5Zw4LUEZJvubsUfmzeji8mkSUhcQBa9QNkjs+6GtbXAp4xzfY?=
 =?us-ascii?Q?247yIUQTxM5xchROobBD0vxd1RiqX0juY0dulNE4R5E4V3Tv6fGpl0u3osnK?=
 =?us-ascii?Q?6HyKI8zD6uiOKv9BJpI4X8yI77bWNFSBizSrLm7I9obL26bUaAgNm4AEteVb?=
 =?us-ascii?Q?zx5vkf62aqoxQwf6SMotk/zqqkUY88kFthj9tgJMl332MTxOwLw5ZGhJY7xC?=
 =?us-ascii?Q?WjQ558QxghA9mJG6fMkfqIpuak3jx/m+0Ubbo3eFrHukMqJavdtcYUpfDCjL?=
 =?us-ascii?Q?DjBbBB4o8O/+x7JHTCdS+JVqDYEFLyBnq3KSS+xtJWJadHNYmWYFc9VdtEsm?=
 =?us-ascii?Q?nF4YXY1UhSsr11KITJX3xcQc/cjgSY4OUvnNAOA51ALrXXN8+0+FW94bapef?=
 =?us-ascii?Q?VWmqigkfUs5rj6o533CQogEJOy9CguxBsjoMbBiOHZUuowH0sd6nV2q9k2B6?=
 =?us-ascii?Q?nGfUtKh3NeuJyaKEAU2wInT6+X/ZEPI6rrIJZDe+PwS1ZiaR6r1C70kutEaC?=
 =?us-ascii?Q?XxKxmGjuOR0GkdjpW1Jh85WcIIHe9J1WeuJr?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?EZhkcwN3UHmAqkIUayvcfNUDzmIH8+f1wH96zHJunPrDhQ2O+oh3xyF6xzSV?=
 =?us-ascii?Q?I1SjUPcxy7sT0qxMO+x622IdEsrSSrWX22NohwtxSSuPGxEDnjwwsh3zWNW5?=
 =?us-ascii?Q?NKtgt+mGDi0MmI+m952FPAzPWilSIU/XtlI1YJG5vrlZdq6u2slqJkWdA8VS?=
 =?us-ascii?Q?Yau22FrdvAB8jOD+KMgfPCSI0G5AqN8dyYEYuCzqtcszyO8EXokP+YxTolMP?=
 =?us-ascii?Q?yAvD+i402VNKM5v9haw0pwMSF1WCQS8XwrurfnMnbzIwMP47ZFx6fHixbiRI?=
 =?us-ascii?Q?0Fh2E4TRUBv0NLV291dc+wxpTFkd1iQtnDqUNR9Fxq3vvPRtUfIEvqTo8Fco?=
 =?us-ascii?Q?mzs/BbtTKwTKjPw8ABwkjuYM+e/3SEwLQYhLJcVEGY5/6JcoMCqITPCdjmU2?=
 =?us-ascii?Q?VJqP84csqK5Cpxnx5sHgziJEv7VmOlxdshL/87KLN7jknAAB5tr1R2QBfLsl?=
 =?us-ascii?Q?TUZBFOcBiSwpX3l2VaXIO0ZsoYlkwGnozj4c/jdGqG06JdiOOPMGEhKa3UZ8?=
 =?us-ascii?Q?aghipBKhylZk7927MVugcTwyMiOVjDpHgYthWkWD06JsRgj9e61XdLWvj5Pi?=
 =?us-ascii?Q?KGrwG1RuBtGJDKeZPBPm9Hci8ILkbZNhk9K7Bk+AEn+bjs9z8wZDxWhS7NEh?=
 =?us-ascii?Q?TXl1CdzzaO3dQtby4Np8eYMEbFe65HRgmpHKD/baeTE3Ge05HPopW49V1dk0?=
 =?us-ascii?Q?8DSbEXPQ8ZQSZzx3Nij27Zl4R6lQJRREUe42QCz4JZbvo68uhCvorgj3vy6Q?=
 =?us-ascii?Q?SQ6wvAir1lTl77P1+UlmxDJso8ELX8qCfVLC5QKT57S3ns/MbveDETZ2gJk3?=
 =?us-ascii?Q?e3dSs/tXo/ylSCdUWjhRMDk3X8t1exTp5FzIz4v8tgdVJkfSQTEUMG4FA7AB?=
 =?us-ascii?Q?QRg1nhFYYwiSzs3H5/VAVD1Fk3jEXcltaOjf3lfMq8nRO9Ou9RfVpTY4cOB2?=
 =?us-ascii?Q?GKsEiuLJdEbe3dIjZM9Bz8UaCFcvTOkhiqsYxnDawOG3h8ozQtXkt1ypPlCi?=
 =?us-ascii?Q?11a+unkLy8tQR89vmg0QOXPUPam5RWJ2LHU0fyNOu937IoieMF4gAImH/nFV?=
 =?us-ascii?Q?93fZDkrG0rxJ3A26T29chURo2qFAWftfevPEA0m5+Z7x2utzaD/W7bHtiz5b?=
 =?us-ascii?Q?IiJQQb0WTh/Ia0OtpoGNx6scaoogs/VilqteCpv2qQrPJlRAIHWGffqSeUhz?=
 =?us-ascii?Q?BvT9PCMqBJNpnXFiJBejZbGpImbSsWwTotgQKZfND2vcJDyxac7dNscQw/oM?=
 =?us-ascii?Q?x7noCulGD9SErz9foeG9k6f+1gCm0hCfKj1aAskU+w5B3y1FdDnbROeHRwbn?=
 =?us-ascii?Q?OUgLu889H71oqUKNQy7Sqc+OCRP8fxA06lhQw1c1Ji3Nbj0eau0Ffi4gw5px?=
 =?us-ascii?Q?PkKQqZAJP/9YaGV390i7EmYHGnwlXpo431DHsDqvnI1P8DS7kL8huTcHcxri?=
 =?us-ascii?Q?kGKRKZ02cQ9Z22g8JflwsnuAGPY5r1akevuAMtxqtc0G1k0RpIXWhwJ/5oNh?=
 =?us-ascii?Q?gSRUa0bBiGmI8sJF7Of9w7OC5ZPaTSAIyX3Bg5WbaZXtvoSw1LUiDvgo933a?=
 =?us-ascii?Q?oJqsGCtdAdnSbsrjU4Bl6v7AvCjY/sie+ZRDxNRzd6dmfStMWh8XLdCnkpLh?=
 =?us-ascii?Q?60BGuIyvSmIVKPDdltNBhm0=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0c9cb54-f489-43f9-de9d-08de284944be
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 15:27:08.5143
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UWMBRyIX9ElP311FHBglVcRpyrccF6hy/ZLzn6NZ8cSm1gKZHLMqOgoeEc80VrTCiwt+32CAvG28PW8THbcj+9/v6InpkY4IA/KFAFB4J9k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4760
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDEwMSBTYWx0ZWRfX5pRWs6wGWEeY
 CXqXcPBy6tx65Zg1/l53kb0wJeS7DZ7hRR9nwCOQkdyOkRLIQSszg+HaeIA1Hk0mg/qTdjSC2nd
 3gfCH9F5z6V1n9Z5utov3DgtIqCjbODFxfkG0KO6/iY9CrVxipT5v0pNJdKTVrYVZfygHZEqUcX
 /CQiSrmMdKVF9F8iFsBXblaujTuBv9mNGZY5RvTNybGlRdrFyrBPA8tWKB5D2YdnMZNbzYTYdaK
 bfkUXILeRXwOIFNEETeKCn5eNm+6RuhstACfE5fGSIgVuR83yLiuaHV7TcggGPfYAdt0isJHk/n
 xYlMymjbw5LVoXNM+GgR5uCx19JB2JsGF6k1R5PnTkqLL5Xef9ZQXda4UA9TpJ+zFq063EVE3AO
 ihjD5+GM4Oojbv6PjXlF+QY121yQUg==
X-Proofpoint-GUID: qJjkeHMSi_uo7gsl-njD4WRp1GnXb3cA
X-Proofpoint-ORIG-GUID: DrCS6wOrYCqYy-vc7w4713YS1JLtH2S3
X-Authority-Analysis: v=2.4 cv=f61FxeyM c=1 sm=1 tr=0 ts=691f334e cx=c_pps
 a=mOz+rD6hbbSUvRiPFvEd3g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=p_vdLtrgfc09iYJXKugA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_05,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511200101
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Nov 2025 15:27:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226634

From: Yoann Congal <yoann.congal@smile.fr>

This new case tests that the rust_mininal sample inside the kernel source
tree is buildable and works properly: check that the module can be
loaded and that it prints correctly.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 24 ++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index d58ffa80f5..66cb112a7c 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -481,3 +481,27 @@ IMAGE_INSTALL:append = " systemtap-runtime"
                 cmd = "crosstap -r root@192.168.7.2 -s %s/process/ syscalls_by_pid.stp" % systemtap_examples
                 result = runCmd(cmd)
                 self.assertEqual(0, result.status, 'crosstap  syscalls_by_pid returned a non 0 status:%s' % result.output)
+
+@OETestTag("runqemu")
+class RustKernel(OESelftestTestCase):
+        @classmethod
+        def setUpClass(cls):
+            super(RustKernel, cls).setUpClass()
+            cls.image = "core-image-minimal"
+
+        def test_kernel_rust_sample(self):
+            import textwrap
+            self.write_config(textwrap.dedent("""
+                DISTRO_FEATURES:append = ' rust-kernel'
+                CORE_IMAGE_EXTRA_INSTALL += "kernel-module-rust-minimal"
+            """))
+            bitbake(self.image)
+
+            with runqemu(self.image, runqemuparams = "nographic") as qemu:
+                qemu.run_serial("dmesg -c > /dev/null")
+                status, _ = qemu.run_serial("modprobe rust_minimal")
+                self.assertEqual(status, 1, "Loading rust_minimal module failed!")
+                _, output = qemu.run_serial("dmesg")
+                self.logger.debug(f"rust_minimal dmesg output:\n" + textwrap.indent(output, "  "))
+                self.assertIn("Rust minimal sample", output, "Kernel Rust sample expected output not found in dmesg")
+
-- 
2.49.0


