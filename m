Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF035CFD315
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 08:40:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12847.1764060041886628033
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Nov 2025 00:40:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=nXuuWAvq;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3424b42751=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AP5IZOj2825827
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Nov 2025 00:40:41 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=1Ld23zU6vqc4oW8nG1YSeBO/PKJ321Bo06majjtxEig=; b=
	nXuuWAvqkHhG3OClQkMPh/tKcTtF1YVZVXYJT7JK6xiBjH0evDSkXYywvQGEqFKk
	r8dPU/Av68VnmcnyvgmpQBppvGGvP7MsItzq1h92QZFpb6vIcO3zpAb+NVHBMtK/
	h/aveHRGrHfqO8axZkVob5YaaR+GlwdQ+4Q9T9zmKEvIGkOuhOwHhuGzOgaiBNIE
	Fle/PMa1nusF59dACB3Yv5Lp3337qzJa2dLb9pvqucFwS8fHgdHcW2yIB/D0gfYK
	oX3DuskO/kSW8EzkVgp0Wx1GYqrvQX8ZciWAASZqXSwWxmYjiZV4GAEDCC3vS3DU
	v5nd0GsGbNoluYipDz+/xg==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013054.outbound.protection.outlook.com [40.93.196.54])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4akdjjahuj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Nov 2025 00:40:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u6gRq9A0rjczqSR052IJ9MyMGfRPwzEtc031Wypxo1imm9QCZSsz+15xG8Mn47flUx/MxNPCCYVc31mVJ+iI3Ujo31pNeWFqCqLrEKZoM97W4zqkhFrGuAWjLkv8a9GWXQ/2A9f+hfcMuofVEN7l3nhYjG54J9WM276dqC/OM5PV2pBmMVXfjZ/LV+oxEI4zuTcljn6AF5wQsDDZCUpvrFeDaRHlJhxMriY330uN3X9WT4l0QgzEwqzoQ3yDnBgqJHcWh72uAYYj3Iv41YBG5oy76GEqFP1xnOMUAreCu30UnlrCY/IrN0L1nt/OnXDCYcElh3NWWxzv1LwpUWu0qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Ld23zU6vqc4oW8nG1YSeBO/PKJ321Bo06majjtxEig=;
 b=P4xLSf1cdzNnSLcLusqupWSuktY+NQXVnVJIHslP8+LimHcatIVka5yPpX9UxrT6FEBs6sqZ0Sl2fmZTGPVV4D86Yqs9nb1E0v+mUcNc1WrgGz3LnKWsh9p+rpzem34eft6AkwtmhRe1uvAtCsWUEB4Iu18CmLutaV0AgswwwsvJVmxAP+2TOE8oXo4CTij8n3+s8j+cMiAgVKvHV68xPmvTbaUY1XA2nWvnBa6h1x87VeNwrPZ14BxrJ2J2Ubm9rQ48QxsyT50zVM/8DPoFxFxqmXH3ex+Qj+UpEhZdDwlXeg1Ua62n4TM22fQms0ddv1ZyXJYl5F81uq31izZeWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by IA4PR11MB9249.namprd11.prod.outlook.com (2603:10b6:208:55f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.16; Tue, 25 Nov
 2025 08:40:37 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%5]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 08:40:37 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [PATCH 2/2] glibc: Enable NFS local file locking for glibc tests
Date: Tue, 25 Nov 2025 00:40:05 -0800
Message-ID: <20251125084005.3939139-2-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251125084005.3939139-1-Deepesh.Varatharajan@windriver.com>
References: <20251125084005.3939139-1-Deepesh.Varatharajan@windriver.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: BYAPR01CA0072.prod.exchangelabs.com (2603:10b6:a03:94::49)
 To SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|IA4PR11MB9249:EE_
X-MS-Office365-Filtering-Correlation-Id: 519dbc7b-7522-47f9-33c9-08de2bfe4e8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?eTFSbXRrcmltYWxQcEJ4cXI4TmNSL2pVVDhHaFc3SWlXYUIwK3daQUFzYzlO?=
 =?utf-8?B?TmxVMDdHVWFGUTR2Mk8xcDVEakxYcDJoa2ZrbHdZckI1dVhqSGtlaEdjU2p0?=
 =?utf-8?B?bi95WDhacEN4KzdpeTFDMTdOQjJOOXZCLysvdDVoWWlIMUhkRjArZTlCdlNL?=
 =?utf-8?B?Smt0Ykd0ZG81YVMvS0oxcEVLS0VpOEl1VG9HSHNmaGxiMWI3alNwb0grS3px?=
 =?utf-8?B?YnBQMUVDa0VqbWVJRTRXL05pYWh1bjFNVXl5SmhIQW1MQ1l2UENpMXpRRUVY?=
 =?utf-8?B?bTcxK1Nlcm1pZkt1SkdUelAvZjF3ZWN1RXBSVGNNOElUSTZhYmwyNThwQWNi?=
 =?utf-8?B?SlJueWFQVm5nWWEzMDR1ZHBoK3g3cTJZOGU3SWQxNCtjbklGRG5QUTdmTUVp?=
 =?utf-8?B?cEwybzB5ME1ML3hIeHF3Z3VGWHdzYjd1dW5lRnF3TWJpVTUrckZTWU5oeHda?=
 =?utf-8?B?L24vLzhxY2tYSXpqNlNjc2xCSERCcUNrazhOYU5YUlMzSU5xU3hCNFE0K21i?=
 =?utf-8?B?QW5kcGdIc1NqSEI5UUNIVk9iL0V2ZXJDdU9WT1hSb3hWMUtycVlFeDh6QXp2?=
 =?utf-8?B?VE1QNUhRbWFXYmVndDAwQ2p0c1NqN202QmFiUmRMQVNhVkh0TWY2Vyt2Nm5R?=
 =?utf-8?B?QlBWL1hXbFJWSUllUTU4YTQwRzUwaURxK0pCaEEyU0hQSXlOYmtlWHZpNW9i?=
 =?utf-8?B?SURmdGsyT0NyRHZ2MHJFWjhzRE9rRDJWNWJlTi8yMnp3emRidFJsaDQ4NWU2?=
 =?utf-8?B?NVQ3NUpYbEZPNlBpZlp6ZThBMm04NGZOOHpTaDZpTGU4bEp3OHU2citlcm1P?=
 =?utf-8?B?dXpXTkFoWlhQMVFJVlJlbWF5RUM4U0R5R1Jjd2puRndPWWN6RTFDUTJYY0M4?=
 =?utf-8?B?Rjdya3dvdlVmNm1UN2dHMDRhbDhZRXNLQWdYNDdGY2J2aXRkR0ZMN1BvUjhW?=
 =?utf-8?B?eTFjMVc2ckQ0aEdtdEpvWnlGV3dJem8zQ0RnVmNxQ0t3aGs4SkQ1S0pUbnI3?=
 =?utf-8?B?VExzeXB4M0VpZWZ5QlZBR1B5QnJabnpjRDl4aHR3K2xqQnBidVlwTkdqRnRw?=
 =?utf-8?B?bVV6bzRrSzFVYlZHTm1icTAzNUdGR1JmZWo3QVUzdHg1cFFoRDJCelVkRjhQ?=
 =?utf-8?B?UlcwcUxVa2d1OXZSL1RMK0dXcXFqbHI4WHlQZWxOMnR5QzFIRjhZclRRdG1D?=
 =?utf-8?B?cGs2SG5QZkZwYUxpR2xIN0FsUDBRanMzcnVYS1Z6VksyQVltMVNSM3Z1Q1FP?=
 =?utf-8?B?ZUVZalRLako5MXlRbWhXdmdYd05pZ1Z5TW5OQktzbTBkVnhGM1BGcUxSV2F2?=
 =?utf-8?B?RnphdzZ2cTFkV2RiK2QyUktwRGxIYjhsbzJBaWtQSVArTzdnMlBqdGNIVHEx?=
 =?utf-8?B?OVE1ck9JNks0UTBJVnV1aGEvSWtoNllGZjNKaFF3bzN2djgvbWU3UFh0TkRp?=
 =?utf-8?B?RGIvRFp2SmwrNGdyZ0RlYzNUdllTTDlOUXI4TjAycmR6QmJ5T0dRRStYN3kz?=
 =?utf-8?B?TXlyMFlKaU8zQXRTTDZpQUJ6YklyVVkyOG1XTDdyTlNiSjg3a1BFek9yZWM5?=
 =?utf-8?B?dk5FenR1MGVJN05DMUd3YXl1U3VkRU1tWjJJcjdhRjlqNW9xOURhNm8zNTln?=
 =?utf-8?B?ZmxCK0pHZFAwYk9ZZW9yZ1ZIMUZaN01HU0tKRXE4VURZN0NZMjhxNE05blQ5?=
 =?utf-8?B?L2pYV3JqYXEzclFVczdEVVB5dklkL0dtekRDTk56QStrd05NWnR2U2daUlky?=
 =?utf-8?B?L0paRjVMVzE3UW9FeDhJSlRaaTdGNW5SUVAxWjMxdThCaEU0Q2M3Q3BoZThs?=
 =?utf-8?B?UzBGWGszakhGN2NlRFZlM3JsbWU4WDc0Q1BSbE5tUmt5NkRaUDBkZ0x2MnVC?=
 =?utf-8?B?MktjcFRONDcrSnJxclk5d2tFL3NXSjBJbGZyd2RjL1FraGFGZmtJQzNha1VQ?=
 =?utf-8?B?RndQbnNrYmFtNTFuWklUaVpmL0pveHFTTGZtQWx6dU9sMmFUakNmc05QTzJL?=
 =?utf-8?B?UDJsemQxSGtqaVhCSjVEanVIVkloOFljUDhzOWlWQ29TOUxtQlh2N0dMNkEv?=
 =?utf-8?Q?H+B75E?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MC9YMmVYWlJpZGJ6QjBjbWp6Y0RCeWgzZjBlSFpDYzF3TG55L2huSFlsY3ll?=
 =?utf-8?B?aWJMYWZXK25iTitBeWtZZlhxY1NvcW9uVFdhM0J6ako5QXBGZFFvTmVyaEx0?=
 =?utf-8?B?QWNFZzRHd1RZa293YXhJR3h4V1RBSGpUU2lVOUZTdzV2UjFDR01hZXFsT1lL?=
 =?utf-8?B?RVdRU1oyN1llZUhaek1PZlpwQXRnbHVnTDF3OGYyWno3UjdZM1ZweWFxQTZv?=
 =?utf-8?B?NmF0aEZVMXoyNVpJSWYwcjNITjVSb0NZMXZ4aEsrdWZWVVAweno0RWlzVlIz?=
 =?utf-8?B?N3MzeVJLT2w3QlM4dXRhc29pOGFzdzVtU3g3R0NUZk91VmVIc1hKc25KREY5?=
 =?utf-8?B?UHo3NFN3THRNbEorcE45MmpjVFZNb1RpQzZsZTQ3M1ZUNkFLeHlpQjRBWXAy?=
 =?utf-8?B?d3ljN0JQMkJwaEFqcXB5TGhza1pCcThneWlJZGhXaEJxRGp4VVora2o1VmVE?=
 =?utf-8?B?aEM5aG1IRU4yb2t2UzBpVnZBQUsvWjlXUlA1TjlDYXpaV3Z6YzVtMytUSUV2?=
 =?utf-8?B?eE5VVWhmeEVhUVJjdUMwdmhxT2pzVmE2THRwZzBMbk5nTkJjeVlUUjhoNG4w?=
 =?utf-8?B?eHlsTmkxSzBJQ0RnK01wSFk0RFBCNWVSWXBxNHBTYUNUUDVVS0pydUw2OWVO?=
 =?utf-8?B?N0YyTWJYVkFjN1RWSjNSQXdiQ0NmSnlSelFGL3dvdDAvWDN6U2dhYkxXaVQ3?=
 =?utf-8?B?YTZ5WnZYczREblpCdkFheThxUE5YckRVdm9DT2NNdk1sRmtuZ1JUWWpLdXJj?=
 =?utf-8?B?TWhuMjVWamVKNDQ4NS9jOUZtZ2d4T0pmcHlRQ3hxM0hRdHR5ZC8xQk9LZ252?=
 =?utf-8?B?eEd2akZMck1XOE83QnRWNytKSHc4WDdPTEJDeFJSSzFUVm1mdFBmaytRRlVx?=
 =?utf-8?B?d0t4a1lSL3BEeXMrYjR5bDVzWjU5RUIrV2F2WDhadlZCSkNRN1lWR01HdDFS?=
 =?utf-8?B?TjduMVVhOTNuZ2tFVjFTN2E0cDl2YUcwSXp5UElONzFPL0dTdVNYekg4eXBZ?=
 =?utf-8?B?QUo1T0FFbkJROTJnRDRRcFZQVzg2elQ4RjBEbmpYWEZSa2g0dTdiOXlMTjJG?=
 =?utf-8?B?WTErNFdDRXVuNERpaWkyQXFIVlZER0tFYzNrSnRBWGRBekF5TTJ1eUxWMWVt?=
 =?utf-8?B?WXBaU25Tc1J1TTV6bkFrTDRmL3l6L1FzV2E2RTByb0RFcEl5MExVTS91SHI0?=
 =?utf-8?B?elpUNVJpRE81UENVUVZoMUlDZ1ZGWG1IS3B4dzVrQmtsQ2JHOTc1MFhYYVpC?=
 =?utf-8?B?ckU4aWRDSEVwOWJaRjBVcWpjZFRVRTJMUjF5aHJCZzl0VzFtVjI1bUE1V1hE?=
 =?utf-8?B?T3JQWmF1dUZrR0Z3Nm9PZzNyLzdscnViV2RGZ29yWGFCM0x2WGFYYVpmelUr?=
 =?utf-8?B?bnZuUW9OR3p1M2JGRkxJcm5NYS9CdE5ONVpXRWo5eGlDaGlFRXZveWo0V25x?=
 =?utf-8?B?TWhyV05PVGJMSkRjb2NtNThBem1jVjNMSXEzalYyS0l1eTZ2TlVqY3RBYTRL?=
 =?utf-8?B?YXpHN3NZQlo5eHRPekRjbXM0OGxGQmhSQXR1VngzanNLRTFZWnovSXhuczJP?=
 =?utf-8?B?TTNycjFsdTFoQUNUdVJoVDNLK2hpQW4wL1ZPY3JVRm0wMVFYNHdTZHM1VlBY?=
 =?utf-8?B?MlQ4MktQd3VmSTlTUmJtZUwyVUVac0tSb2pIa25jWjZsUzcyT3ZZaG5DZElF?=
 =?utf-8?B?ZWlYWWt5ZG5hbGhYeHFpWmtMK0pFRFFrQkplK3pqOHRETG1iMkh1KzZLNUJ3?=
 =?utf-8?B?OElENkpmN3E4OWZtUTVOV20wSnJFVVhFbS9GQ2NDRmhyRHdzMUQ3dk5GVnlX?=
 =?utf-8?B?dkFKeWZBc1JobGpPNmVDZEVrRU9IOVprclVjMmlIM1UrWDRoYUd2cUM0bldq?=
 =?utf-8?B?cDUyemJJeXhpYUErRjUzamMxbmFYRHRMd3hYWDdzcUFxeHZ2UCt3ZmlWTFlK?=
 =?utf-8?B?RFBESFR1eU9KZFpwbitzeDU1Y2luNy9UNDUrTEpkQ0oyY0s4c2llc1p4WGNj?=
 =?utf-8?B?RGhUS3lMWUF3VEx4MGkvc3ZhUllFSFhpVGF3cmRpSGNUM29URk9vcmlnUXpQ?=
 =?utf-8?B?RzI0QXI2d2o1WFNOeUhzbVhDZE9naVRHbkVaQVE5eVp5RnoweEYxbXB0UlVt?=
 =?utf-8?B?TWhKczFIREJ1TWRScU96dHc2OGl2bHRKNGZUNEdZcXpnZkhteXliaVVKTnp0?=
 =?utf-8?Q?sgNMmurncDX6x1AlnZeGhjc=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 519dbc7b-7522-47f9-33c9-08de2bfe4e8e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 08:40:37.3669
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UMNaavJgWphCjzmRk1xLClE+zRb+bseINnXf16y9HrkY7pw90AiS79SBmtJD1SEQfSjR9UbSi+C21+mPMvLHAJ05X8dT9py7BdlC26IkvUjQg8HE5Sx1CBZCZ0djdogG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9249
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDA2OSBTYWx0ZWRfXzAQWoV7GTW89
 +AR1rNCLr9P23f5Yd8uqG0I8ToQyOOFG0mhDtzZqlQ5mSwW9CVi8gsnMulTJOR1pftSbVNt26Bs
 onFHXuPxuSjqytEHUn6QU9ObhWR6m4AJl5qACXI81+GlSaN7rYtPjFks7Ii5M89oXukOqT5SwT6
 UH3vtZ6v0CGoedb7UUAxjmrYFD16dHSeQK5nSzcOpLdOnPXIvN/QjKHUq5r3lpe3QiaIC+xNwto
 y/BGXC3lSE97ZkGoop7ldZpTlJ0CYZ8iALGLcgw7TGkcT1t5QKAhbi+zLGQ2X69BUc4m3jxxB22
 O58mGL1wzjLEQroggDfrLxLh/us5sH8VQ8R2bWkUtp+bDs/oDTpu5h7zuJDFe6Nk+YdrE5uRQs5
 RIFjchfK9fkHIPrDDYuioNu57H9amg==
X-Proofpoint-ORIG-GUID: C7p81epL_rR64I5jmqMkypvVZk0Dp6Cy
X-Authority-Analysis: v=2.4 cv=Wq8m8Nfv c=1 sm=1 tr=0 ts=69256b89 cx=c_pps
 a=S/uo/C2bPHUhgLefKkPNaQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8 a=R3pyMazuGKP45Se3O5AA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: C7p81epL_rR64I5jmqMkypvVZk0Dp6Cy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511250069
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5AP5IZOj2825827
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Nov 2025 08:40:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226755

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Some glibc tests in oe-selftest were failing with

error: test-container.c:837: Cannot lock testroot

The issue came from test-container.c, which creates testroot.pristine/loc=
k.fd
and uses flock() to coordinate test execution. The lock file itself was c=
reated
successfully, but flock() failed only on the NFS-mounted test directory,
while it worked everywhere else inside QEMU.

The root cause is that the default NFS mount options used by oe-selftest =
implicitly
set local_lock=3Dnone, which disables local file locking on NFSv3. With t=
his setting in
place, every flock() call on the mounted directory failed with ENOLCK (=E2=
=80=9CNo locks available=E2=80=9D).

Switching the mount to use local_lock=3Dall restores local file locking o=
n NFS and
allows flock() to work as expected. With this change, the locking-depende=
nt glibc
tests run successfully.

Testing results:

            before    after   diff
PASS         6943      6968    +25
XPASS           4         4      0
FAIL           66        46    -20
XFAIL          16        16      0
UNSUPPORTED   108       103     -5

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/lib/oeqa/selftest/cases/glibc.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/glibc.py b/meta/lib/oeqa/selfte=
st/cases/glibc.py
index bd56b2f6e7..0838e8ac33 100644
--- a/meta/lib/oeqa/selftest/cases/glibc.py
+++ b/meta/lib/oeqa/selftest/cases/glibc.py
@@ -79,7 +79,7 @@ class GlibcSelfTestBase(OESelftestTestCase, OEPTestResu=
ltTestCase):
             # setup nfs mount
             if qemu.run("mkdir -p \"{0}\"".format(tmpdir))[0] !=3D 0:
                 raise Exception("Failed to setup NFS mount directory on =
target")
-            mountcmd =3D "mount -o noac,nfsvers=3D3,port=3D{0},mountport=
=3D{1} \"{2}:{3}\" \"{3}\"".format(nfsport, mountport, qemu.server_ip, tm=
pdir)
+            mountcmd =3D "mount -o noac,nfsvers=3D3,local_lock=3Dall,por=
t=3D{0},mountport=3D{1} \"{2}:{3}\" \"{3}\"".format(nfsport, mountport, q=
emu.server_ip, tmpdir)
             status, output =3D qemu.run(mountcmd)
             if status !=3D 0:
                 raise Exception("Failed to setup NFS mount on target ({}=
)".format(repr(output)))
--=20
2.49.0


