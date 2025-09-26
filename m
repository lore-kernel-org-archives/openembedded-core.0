Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E4DFCAC5AC
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 07:12:29 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.11870.1758870746773736953
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Sep 2025 00:12:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=H2N0r+Sf;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1364670208=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58Q4FkVQ1581083
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Sep 2025 07:12:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=CI/PGSg3E
	yB5wH08wbI9aQkNnEXFXFpZDeB97S8QDYQ=; b=H2N0r+SftcqVLIYcPOheaY7e9
	3XFukK8xjPMex/PLU0a87N+e20+oImz4JPy3zPgjFC2O+egSL4Ti+I3lLHwtmqzC
	+4Bxf3oWnE+lxpj0rrpZAJOJHrSGbRD3/Sunpv0xfrIS2cjJyzL+Jr5I5OXurVhW
	YDKtmLjHHrtqcioYUshliSXL2YNjStG1EqbyNh5qaX6DuL4KbwPfqxyQsr5Y2Rit
	PDWLGr8Bqq+tqkSqzIDMfCweumEkVSzY0Jts4TO1ltmByUCxhlH0mborLEqAImjS
	qvxSR1/LJPnK0Fh52sYL0or9Qdn3DQQ8w5tL6nzMeiP+tfnRrdV7txX+DcpAg==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013065.outbound.protection.outlook.com [40.93.201.65])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49dbsm8gcj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Sep 2025 07:12:25 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PT+ZXpnt8eREsTiOQcPbcq4vjo6j4rL5YW2zR5NoffSFID3Nwo6OtD6znBWfR91Gn4LoIVfWIFhKP0lkrjBgET80LBlVLm3JULKoQpI18N71NpLDK4IekmF3c4T+n7w8F/tkBJwVkw9XTCq39NS9L2LbHQFLLlwDBfmeaWydikaeXx8psL+i8ilelu0wZt/XHYMaXpx16kHJq4ffAma2/JK6m9uPBK+0KyRosiGu6V5iyHpN4qeBgZ4R/xp/EnRT7G+ve4sk6+CiH/ynR345s9OIpUad3cREvigYnHUNpKqqmnz2ovzC2eFuHq9FRSY6tSiGgprF3lpwAgr1ujwKWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CI/PGSg3EyB5wH08wbI9aQkNnEXFXFpZDeB97S8QDYQ=;
 b=ZIWCZlY2tFkxHsJiNA61HDJiw6SZ7felRHQv/HSEgsa03nmTuv68XugIU0CblFCImfX+RLxLn+rUB+wqzQ+R11drQEqPkB0tau2fMo+y1IsN2n8yNCK1bC6KK7vtNcwVrXhOSmN36W+qNE240s4XDJD5/bfSFqEjCS/NuXfQCF0GMePREHiP/SgPGY8tiZ7Gmwuglcf1a4l3E+fa+x92KC7oYSapL4J9w26JTscMyDAThg4tUWN4RyV7ekjbbN4YXhkHw+t93jOYtqDz+aq5F8uEDMLWt71nSOShXKfss9BJ8EruVKd28z7yQ8ITJFrmNQt0I9bebtaQQ4W+FyvjgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by SJ5PPF8225D2149.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::83a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Fri, 26 Sep
 2025 07:12:22 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%5]) with mapi id 15.20.9160.008; Fri, 26 Sep 2025
 07:12:22 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [PATCH] rust: Drop rust-llvm use clang instead
Date: Fri, 26 Sep 2025 00:11:52 -0700
Message-ID: <20250926071158.3439500-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SJ0PR13CA0233.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::28) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|SJ5PPF8225D2149:EE_
X-MS-Office365-Filtering-Correlation-Id: cbf0735c-3ab6-4101-1b34-08ddfccc09df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZWg3OHk3UGJBZ294eVJ2blZoU2QvVlhIeTVpY2J6MmxOdG15bXJwZkVoUXV0?=
 =?utf-8?B?bDFJN2dnWGdlS1hrNmVrVUFKR2U0TG1wbmhNSHVhZFRtdHNVU0NJZ3lmbVlX?=
 =?utf-8?B?OTF4a1phd1RSYXdTRHIzQUtNN2w5LzlWQ2xHZi9mK1ZMR3gyL2YvTndxL2Jz?=
 =?utf-8?B?RjdWSU40ZDRpcXBIT3E0NDJMRjM4aEJqRVJuc25uZEN4eFJST2FLbXhramNN?=
 =?utf-8?B?U0VUeFVmVG01TjBCS0JKQU56dzNQMjluSHNvSVlHOWVFWm9UbDlONkhzYjFs?=
 =?utf-8?B?OUdteWVaUDFXNlJRN0RHUmZYcjJydW5KdTFEVkZ0WHZ3UDlBUms3YlE0NE43?=
 =?utf-8?B?ak9IMlo1M0ZpbWIwR2Rwa3R3aVNGajZmM25WeU9vR3lXTWtMcjlkbmFCeEFj?=
 =?utf-8?B?VkhpY05uQXdOL0M5dFNvWVRRQzVWSXhNL0xaamY1dDZZMlQ5Mnc0VEk0L1lT?=
 =?utf-8?B?YkgrdjE2ajVvUWpqZVJtUS9OclJHNmFXbkdJMFJTQWpGMmJ4eFQvaE8yaFhQ?=
 =?utf-8?B?RDVKZUZadk9NZjNYUUxrcVFra2NKdVowTXovcmg5bVFrVGM1TnpadXROT24w?=
 =?utf-8?B?VVRaSkdsa3Vla2szT3FmdCsvWkRPdDFNaldCSjRnT3N4bklJVGdNN0VwR29a?=
 =?utf-8?B?WXVrSDBZL0NaeVBJWVpMSVZqMGlXZ1NuVzg2NEp1NVFOelZiZGhRQzVYRkh1?=
 =?utf-8?B?S1BLRmZFRDJvbjhuSFFVTTk1dkpONVFoZ1l3VGtWYStoRFBaYUJZck12V1h6?=
 =?utf-8?B?dlNMK0g5Mlh4SFlYa01TOTlkRzBvTytuRkhNMGJlT01RUHhJVytrMDJ3UTNT?=
 =?utf-8?B?Qy8zMHJ3N2NtZ3g5UjU1S0RxV1E3VytQd2loeGlVVzNOdGJldHkwTmlQdHV5?=
 =?utf-8?B?eDlPZzlwMy9hM1g1VTg0d3pxdGRwVzVITEp4NW8yN3IzckVBSmYwdHRSWGNz?=
 =?utf-8?B?OGZLVmhuUFJMRUFIY1BITkRFeXJTeGdDU2FvTTBOR2h2QzJmQktnTlNXODhy?=
 =?utf-8?B?c0xxbHBSdTdwcHEwS2VVT2VuU0lMRW56K0dLa2hhUDdLeGxUelRXQnBjVTBq?=
 =?utf-8?B?N214eFR1aHltbjU2VUxmVTlkYmVCMmNzTW1LWFJMSzNRUzRoNFFDUlIvdmNu?=
 =?utf-8?B?VkJxMkYwRXBRMmZZWTF0S2V5OXBrUDNvK0xWWTRYL0NSVmxDWE1QWEpEb2Jx?=
 =?utf-8?B?UWphcVBoRlRid0NsSjIwLzZHS3pHYU5JMWFVczlBNXE2ZFJsOTJWelkwRlV2?=
 =?utf-8?B?T0xSRVpzS3dmeHJDSGtsUU9FKzNBNTg1RmlCd2VXclBqV1MyWjNzK21xWDFm?=
 =?utf-8?B?Wk1seUlVVEY5M29CVlA4VlVtK2RSZWVKeS80L2J6aTl2Z0dFWm5tanBQLzdX?=
 =?utf-8?B?UklHMDZmMk9Ib2dYS21SZ1Bod3oveHAxVWEwdTBTUUhEdVRyYkVmZmJYSmIv?=
 =?utf-8?B?aFVBbEFMMWlORmU0aFZIbzByenFlSVpQZi9Oais3Z1cwQm1zN0U4ZUwra1dm?=
 =?utf-8?B?YmRBSHhEU2V3L2NVSkFaYVNqdThhVnNiVWYyRE1QVlhzVWE1VGdzUjByd1Zh?=
 =?utf-8?B?NUhOVnFpWjRweFRrMm9PL3NmalJFSUxwK3MyZW5McTNLZEhadnZYVHlUZS8w?=
 =?utf-8?B?Q280eVBzcWwzekkxeTE1eEQ3VGQwS216NzZVVGo5RUcvVW81aElrblNzTHBm?=
 =?utf-8?B?TVk5enN0TUswOTA2K0ZaY2lHV3VnK2pRZFcwenZ0Mi9vTlZUOGRic0pNN044?=
 =?utf-8?B?YWJveGhDVm9URVQ5WHUwa0ZtUW1DMEd6aVZ4U3psVFdmOHdxSTl0elBLYVRw?=
 =?utf-8?B?cjNxbWJzTm5wREVuZy95UDVUSzZhVDVwaklkRW8vTFlMMnNpWHJVU3JCQVI0?=
 =?utf-8?B?eUFtQXIyQXhaTmRiamxIRkJZMDFnZWdDcm85Um1leGN6Q3lQQkEwZ0FJeGNF?=
 =?utf-8?B?cWI5aTRKWUpmTzRwaG5yK2hLREZ1MFdLUzBBNnFuNGJUSU15YzJsZVhhVnZS?=
 =?utf-8?B?Vk00bjlOUmlnPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aFVXR2FIa1hDN21EYW9VM25uV0JwMC9rdndRaU4rQVBKNjlhdWF1aFJDVENF?=
 =?utf-8?B?SHRiYnFiT0V0NFZXblYxVXVmb1dmZ2h3MmRIKzJhTHV4bUNLR3c5QVlyYlMw?=
 =?utf-8?B?V0lnR1ljNjY1N1pYWHp6V1o2dzVMNmhjT2FCKzcrbWMvQVQwVCtZQ09yMEMy?=
 =?utf-8?B?dSt1TXBYTU5Gb2k5RTJjMWIxOWhmV0tDeXRoek9ra2Y4VFB2WW5ZRTdSb2tQ?=
 =?utf-8?B?Szdaa2tvRmFzNStVSnVlc2d4NVJkbkZXMHB1MlVKYzdGcWIxR0tOOFdJU1Jz?=
 =?utf-8?B?c21JblVBY2oyUjUvMllDVHlnMTNGZUdFSlBrcE11ajJOZ3F6QTVNMnZyQ1pq?=
 =?utf-8?B?NzZiWlF3QVhyWktpRTI5QjREUCs2dmFJRDVrWlJBaWdsYzMxUE9ndzBsWnV4?=
 =?utf-8?B?R2tWeWpYSldXUU55djBTQWhxTktaQ05qMnd6d3U2VFoxc2lMRHd5REx1NHVL?=
 =?utf-8?B?L3d5STFtcjY1Zk9DZ1hJQXY3UTUveGx2anRyRXB0TGVlaENRQ09sUjdvUFZH?=
 =?utf-8?B?VnR1UGlCTGMzbHBpS0MzWEk2RDFJMmVuUmx2bDBaU3A4Rk1ldWU3NHhXUmh2?=
 =?utf-8?B?ZmYzS1RXNk1kcm5CSjArRmFEYnZiVXFRdFVUTnpPQ1RFMmZVdHV1eDhEQWth?=
 =?utf-8?B?UDliZXA2aVQ3WnkxNGxuRkVFVE9EZ2phOTExblcwMlJCSk9sdStPcnFVN1pX?=
 =?utf-8?B?ajZic200OHFtSkxxdkpVWG9wUU16ODhOdGdnbWhENG8weHRBdjQ5OW1VNUhu?=
 =?utf-8?B?RmtvZFJZaFhjWEZvWE9JQUIxdzdOcm5aQmpRSnZsaGZINEZLQnYycXBIaDdN?=
 =?utf-8?B?cGd3eG1VSUE0ckJrNUdNTUZ0TlBDV29hSXo0anQ5Si9VTVJZSi8vRndkMUJG?=
 =?utf-8?B?VTBYZDZFdGp0V0l6dUFSV0VjR3lHYnJIaHNYL1RJOHN4K00xUWUzOEVtdnpq?=
 =?utf-8?B?NU5uZ1RSNmwrRTIzV3R5RUI1VnBvQU9XS1gzdEhXZ1M5RjA0d2FYckd5ekpI?=
 =?utf-8?B?elhQRHhXUFRvVjVSa1FVL2lHKzJnR1owMUNQZGNsYklLWEU5VkFRU3BsbFZP?=
 =?utf-8?B?SFg0eEZTWVovaVFycXBsZ0VkRllWek1FTG0rdkorU2E5eUZYdzhwZ04wQVVG?=
 =?utf-8?B?Uld3eWdVbFFub2RFc1BNNC8rMU9zd2JWTlZxMzg5UUZ1eFdpUU44RmswVTdw?=
 =?utf-8?B?YW4rTkZ5eEtiNTNzdFJMUjYxQXViZ0VsMlFFdzUxNzVRZExnM0tIekZKbWdj?=
 =?utf-8?B?eGQ2eDF2WFY2RzdoWmdCU2lWbTk5aFgwM3hwT1N2aGlaUlMxb3FDQjkxcXNG?=
 =?utf-8?B?VFl5SEZCK3U5R2tEUXZXNEJtN0ZldEZ2dzMrQWo1YVZTNTZXSXNvR0p6dUx4?=
 =?utf-8?B?Z3ZrenBzNTd6YkRuZWNJL00zYkNSRUN5SWhTUlNocjB6MmFJbER2aUE3U2dT?=
 =?utf-8?B?UHNwZmZ6bzlwenMxK2l4dXVFZzBqZHJSZWUyUldxQi9hWFFUVmhmS3hqVEhX?=
 =?utf-8?B?YXZKeFNheVBFZVFwV2lCSlJ5UFJFeC92V2JZakVYZm1Rcm16VldVTnZKZEli?=
 =?utf-8?B?cU15ZE5nVUlodEJ1bks3aW9BZ0dHaHNYdC9JZ3R6ZXRoY1FKRXI5ZGN3Vkxl?=
 =?utf-8?B?ek9ja2h5RjlCRHFub3ZtZjVLYXJJQmNlVXl2NTJJQ1p3RlFwSkNZcEVtem5m?=
 =?utf-8?B?dXB4YXUzREtKQS92ZTh1b0M2VklMdXJtNEJTbVo2TEZzYmxQSDF4WU1PVDQ5?=
 =?utf-8?B?TmhhcXZTbFlpRm1WQkdvTEN1SEVpMDhXSXhxdEV2ZVFNaWhiRURqaXYxQnVC?=
 =?utf-8?B?M2w1TmQ1U2dPT08yUFByWkdBblZnNG5Xa1FSOUJnVGxSK1QvdFdBRVJhcC9R?=
 =?utf-8?B?ZnRNS2w0U1BEVWJycnM5Ukp4N1puMDlSd3JneFd3Tm90Q2d0V04rOWY0ZERO?=
 =?utf-8?B?MklPWmsxcmVmd05mT1ppbDZmdThxSkFHb2VTZFZHSElZbWk0eEQvNkR3R2ll?=
 =?utf-8?B?cFR4cmhFMHBPV2VIMCtuSVF1UGNCclpFMktzZnJaditNeFpOdXlWTDJQYXJD?=
 =?utf-8?B?RUl0QTF0Tmtka0tzb0NuTjJXOCttc2oyVk5PLzRSVDJXc2xJMFlmQXZBNE9z?=
 =?utf-8?B?WEVEUFBhQkF2WlI4NllQVnNLSDFjK0dwd2tCalJ2L3J3UDFrVEpPeFR4RWZ1?=
 =?utf-8?Q?+r8BWnSdk+CkfhlveyUgXg0=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbf0735c-3ab6-4101-1b34-08ddfccc09df
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 07:12:22.7159
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5fzK7u1gX9/SaM27fvNXX3sgYNHwNW2JMhY68Hx9HRGKv32BmwXbpDzVxFWjyANl9tGmNS9utg5/zH2f6lpgPr0tW5nkBP0/wRDHwZMW0viEfryIibPI7msi7fhWPlex
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF8225D2149
X-Proofpoint-GUID: yUyDGuUJdVY-SUYFwFqupba6hSB6UIRQ
X-Authority-Analysis: v=2.4 cv=TJhIilla c=1 sm=1 tr=0 ts=68d63cd9 cx=c_pps
 a=aMvkJueGaHUSD5gdo5rTxw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=ei4SEBeUAAAA:8
 a=NEAV23lmAAAA:8 a=mDV3o1hIAAAA:8 a=Twlkf-z8AAAA:8 a=t7CeM3EgAAAA:8
 a=7CQSdrXTAAAA:8 a=iGHA9ds3AAAA:8 a=8wEic9LhAAAA:8 a=pGLkceISAAAA:8
 a=IvTj1HvjAAAA:8 a=ies9aqoq9IkWzbJyAFoA:9 a=RNcOj5fWOn7y6IS6:21
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=Hqou25T6mLgA:10
 a=8zIOOLb7Ym0NljyPXbuS:22 a=-74SuR6ZdpOK_LpdRCUo:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=M9VCcFR7d36vLOFuqMn8:22
 a=kmyLcwvAnC_t3PsnBtKb:22
X-Proofpoint-ORIG-GUID: yUyDGuUJdVY-SUYFwFqupba6hSB6UIRQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI2MDA2NSBTYWx0ZWRfX0ObP1RAUuyYR
 wgFVt4TFVw90e81Ny4qm9asC/Ji0qClNgTP3nm0+uYXriwQfg8RqiRRxo1cBbzuOPx4/6UKgKpf
 lxGkW7qJh+Bp15FB/qCE184zTfUOw8NXN48/xwqCBOzIzOB2bCv5WX44ZHIMujw3cDs6kbfwUWB
 Oy7EDJhos4H9Sv9j7UdhLl/GSQffMuyE0pv9oyOvROo2JJrbU+opC7kSUYYg4tV0NetjUWGdNYU
 nUSvq4jS3+iCEXweupuFVWZlTFwr8YUjKDP4zmwokDucDWRoj+vcuPI7CyWP83IDlVOIMkyviGb
 sstpK2wZgqQtEY5y0uXAsSgMuLAY1vigtyNLPBZbWeZzRlzbSdha5SN2rgV2aQ+2xSEk4/WhvZp
 5eXhJTQRaF4NEZbntX4UuPUVWVPUqA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_02,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2509150000
 definitions=main-2509260065
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 58Q4FkVQ1581083
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Sep 2025 07:12:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224055

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Removed rust-llvm and updated the Rust build to depend on Clang instead.

Summary of discussion with the rust upstream about using latest LLVM inst=
ead of Rust maintained LLVM fork.
https://internals.rust-lang.org/t/can-we-use-proper-clang-instead-of-llvm=
-fork-what-rust-uses/23489

Upstream LLVM is generally compatible:
- Rust does support building with upstream (vanilla) LLVM, especially the=
 latest
major release and the one or two preceding ones.
https://rustc-dev-guide.rust-lang.org/backend/updating-llvm.html#updating=
-llvm

*Impact on Yocto Rust upgrades:
- Rust upgrades shall always check for updates on rust forked llvm and ba=
ckport
the relevant patches to clang's llvm.

*Regarding the rust forked llvm local patches:
- There are no local patches on rust forked llvm other than the backporte=
d fixes
from llvm master.

*We now add these flags "-Clink-arg=3D-lz -Clink-arg=3D-lzstd" because of=
 this following
diff otherwise we will get errors during link time.

Setup in rust-llvm
-DLLVM_ENABLE_ZLIB=3DOFF \
-DLLVM_ENABLE_ZSTD=3DOFF \
-DLLVM_ENABLE_FFI=3DOFF \

Setup in clang
-DLLVM_ENABLE_FFI=3DON \
-DLLVM_ENABLE_ZSTD=3DON \

*When multilibs enabled:

llvm-config expects static libraries to be located in the lib directory r=
ather than
lib64. However, since LLVM is built as a non-multilib component, the lib =
directory
doesn't contain any library files. To accommodate this without breaking m=
ultilib
behavior, we copy the required library files appropriately.

Previously, when we depended on rust-llvm, this worked because we specifi=
ed:
-DCMAKE_INSTALL_PREFIX:PATH=3D${libdir}/llvm-rust

With this setup, llvm-config was installed inside ${libdir}/llvm-rust, wh=
ich included
its own bin and lib directories. Thus, llvm-config located in bin would c=
orrectly find
the libraries in the adjacent lib directory.

Even when multilib was enabled or not, llvm-config would still look for l=
ibraries under
lib in this structure, so everything functioned as expected.

*Dropped Patches:

0001-libunwind-Use-gcs-instead-of-gcs-target-attribute.patch(Merged)
https://github.com/llvm/llvm-project/commit/b46f34452e9dec50eee6ddbe07875=
f05e421a81c

0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
0002-llvm-allow-env-override-of-exe-path.patch
(We have the above two patches in clang)

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 -
 meta/recipes-devtools/clang/clang_git.bb      |  4 +-
 meta/recipes-devtools/clang/common-clang.inc  |  6 +-
 ...-gcs-instead-of-gcs-target-attribute.patch | 66 -------------
 ...r-sort-ClassInfo-lists-by-name-as-we.patch | 31 ------
 ...-llvm-allow-env-override-of-exe-path.patch | 33 -------
 .../recipes-devtools/rust/rust-llvm_1.90.0.bb | 98 -------------------
 meta/recipes-devtools/rust/rust-source.inc    |  1 -
 meta/recipes-devtools/rust/rust_1.90.0.bb     | 18 +++-
 9 files changed, 19 insertions(+), 239 deletions(-)
 delete mode 100644 meta/recipes-devtools/rust/files/0001-libunwind-Use-g=
cs-instead-of-gcs-target-attribute.patch
 delete mode 100644 meta/recipes-devtools/rust/rust-llvm/0001-AsmMatcherE=
mitter-sort-ClassInfo-lists-by-name-as-we.patch
 delete mode 100644 meta/recipes-devtools/rust/rust-llvm/0002-llvm-allow-=
env-override-of-exe-path.patch
 delete mode 100644 meta/recipes-devtools/rust/rust-llvm_1.90.0.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index 0988bf50a7..7eec664619 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -773,7 +773,6 @@ RECIPE_MAINTAINER:pn-ruby =3D "Ross Burton <ross.burt=
on@arm.com>"
 RECIPE_MAINTAINER:pn-run-postinsts =3D "Ross Burton <ross.burton@arm.com=
>"
 RECIPE_MAINTAINER:pn-rust =3D "Randy MacLeod <Randy.MacLeod@windriver.co=
m>"
 RECIPE_MAINTAINER:pn-rust-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "=
Randy MacLeod <Randy.MacLeod@windriver.com>"
-RECIPE_MAINTAINER:pn-rust-llvm =3D "Randy MacLeod <Randy.MacLeod@windriv=
er.com>"
 RECIPE_MAINTAINER:pn-rxvt-unicode =3D "Unassigned <unassigned@yoctoproje=
ct.org>"
 RECIPE_MAINTAINER:pn-sassc =3D "Simone Wei=C3=9F <simone.p.weiss@posteo.=
com>"
 RECIPE_MAINTAINER:pn-sato-screenshot =3D "Ross Burton <ross.burton@arm.c=
om>"
diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devt=
ools/clang/clang_git.bb
index 53bca1c24f..3e117b308b 100644
--- a/meta/recipes-devtools/clang/clang_git.bb
+++ b/meta/recipes-devtools/clang/clang_git.bb
@@ -83,7 +83,6 @@ OECMAKE_SOURCEPATH =3D "${S}/llvm"
 # https://github.com/llvm/llvm-project/blob/main/llvm/CMakeLists.txt
 LLVM_TARGETS_GPU ?=3D "${@bb.utils.contains_any('DISTRO_FEATURES', 'open=
cl opengl vulkan', 'AMDGPU;NVPTX;SPIRV', '', d)}"
 LLVM_TARGETS_TO_BUILD ?=3D "AArch64;ARM;BPF;Mips;PowerPC;RISCV;X86;Loong=
Arch;${LLVM_TARGETS_GPU}"
-LLVM_TARGETS_TO_BUILD:class-target ?=3D "${@get_clang_host_arch(bb, d)};=
BPF;${LLVM_TARGETS_GPU}"
=20
 LLVM_EXPERIMENTAL_TARGETS_TO_BUILD ?=3D ""
=20
@@ -107,6 +106,7 @@ EXTRA_OECMAKE +=3D "-DLLVM_ENABLE_ASSERTIONS=3DOFF \
                   -DLLVM_ENABLE_PIC=3DON \
                   -DCLANG_DEFAULT_PIE_ON_LINUX=3DON \
                   -DLLVM_BINDINGS_LIST=3D'' \
+		  -DLLVM_INSTALL_UTILS=3DON \
                   -DLLVM_ENABLE_FFI=3DON \
                   -DLLVM_ENABLE_ZSTD=3DON \
                   -DFFI_INCLUDE_DIR=3D$(pkg-config --variable=3Dincluded=
ir libffi) \
@@ -137,7 +137,7 @@ EXTRA_OECMAKE:append:class-target =3D "\
                   -DCMAKE_AR=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREF=
IX}llvm-ar \
                   -DCMAKE_NM=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREF=
IX}llvm-nm \
                   -DCMAKE_STRIP=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_P=
REFIX}llvm-strip \
-                  -DLLVM_TARGET_ARCH=3D${HOST_ARCH} \
+                  -DLLVM_TARGET_ARCH=3D${@get_clang_target_arch(bb, d)} =
\
                   -DLLVM_DEFAULT_TARGET_TRIPLE=3D${TARGET_SYS}${HF} \
                   -DLLVM_HOST_TRIPLE=3D${TARGET_SYS}${HF} \
                   -DLLVM_LIBDIR_SUFFIX=3D${LLVM_LIBDIR_SUFFIX} \
diff --git a/meta/recipes-devtools/clang/common-clang.inc b/meta/recipes-=
devtools/clang/common-clang.inc
index bf3a63914a..c22e3c1b19 100644
--- a/meta/recipes-devtools/clang/common-clang.inc
+++ b/meta/recipes-devtools/clang/common-clang.inc
@@ -30,10 +30,10 @@ def get_clang_arch(bb, d, arch_var):
     elif re.match('aarch64$', a):                      return 'AArch64'
     elif re.match('aarch64_be$', a):                   return 'AArch64'
     elif re.match('mips(isa|)(32|64|)(r6|)(el|)$', a): return 'Mips'
-    elif re.match('riscv32$', a):                      return 'RISCV'
-    elif re.match('riscv64$', a):                      return 'RISCV'
+    elif re.match('riscv32$', a):                      return 'riscv32'
+    elif re.match('riscv64$', a):                      return 'riscv64'
     elif re.match('p(pc|owerpc)(|64)', a):             return 'PowerPC'
-    elif re.match('loongarch64$', a):                  return 'LoongArch=
'
+    elif re.match('loongarch64$', a):                  return 'loongarch=
64'
     else:
         bb.fatal("Unhandled architecture %s" % arch_val)
         return ""
diff --git a/meta/recipes-devtools/rust/files/0001-libunwind-Use-gcs-inst=
ead-of-gcs-target-attribute.patch b/meta/recipes-devtools/rust/files/0001=
-libunwind-Use-gcs-instead-of-gcs-target-attribute.patch
deleted file mode 100644
index a704671fb9..0000000000
--- a/meta/recipes-devtools/rust/files/0001-libunwind-Use-gcs-instead-of-=
gcs-target-attribute.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From e4f4094de8ddcbe6d5ff1cdf782d2b89e0563903 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 30 Apr 2025 19:51:19 -0700
-Subject: [PATCH] libunwind: Use +gcs instead of gcs target attribute
-
-__attribute__((target("gcs"))) does not work with gcc
-
-GCC-15 has added gcs intrinsics [1] but the syntax for enabling it is
-slightly different. This syntax works with clang too.
-
-With gcc15 compiler libunwind's check for this macros is succeeding and =
it
-ends up enabling 'gcs' by using function attribute, this works with clan=
g
-but not with gcc but '+gcs' works with both
-
-We can see this in rust compiler bootstrap for aarch64/musl when system
-uses gcc15, it ends up with these errors
-
-Building libunwind.a for aarch64-poky-linux-musl
-cargo:warning=3D/mnt/b/yoe/master/sources/poky/build/tmp/work/cortexa57-=
poky-linux-musl/rust/1.85.1/rustc-1.85.1-src/src/llvm-project/libunwind/s=
rc/UnwindLevel1.c:191:1: error: arch extension 'gcs' should be prefixed b=
y '+'
-cargo:warning=3D  191 | unwind_phase2(unw_context_t *uc, unw_cursor_t *c=
ursor, _Unwind_Exception *exception_object) {
-cargo:warning=3D      | ^~~~~~~~~~~~~
-cargo:warning=3D/mnt/b/yoe/master/sources/poky/build/tmp/work/cortexa57-=
poky-linux-musl/rust/1.85.1/rustc-1.85.1-src/src/llvm-project/libunwind/s=
rc/UnwindLevel1.c:337:22: error: arch extension 'gcs' should be prefixed =
by '+'
-cargo:warning=3D  337 |                      _Unwind_Stop_Fn stop, void =
*stop_parameter) {
-cargo:warning=3D      |                      ^~~~~~~~~~~~~~~
-
-[1] https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcommit;h=3D5a6af707f0af
-
-Upstream-Status: Submitted [https://github.com/llvm/llvm-project/pull/13=
8077]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/llvm-project/libunwind/src/UnwindLevel1.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
---- a/src/llvm-project/libunwind/src/UnwindLevel1.c
-+++ b/src/llvm-project/libunwind/src/UnwindLevel1.c
-@@ -185,7 +185,7 @@ extern int __unw_step_stage2(unw_cursor_
-=20
- #if defined(_LIBUNWIND_USE_GCS)
- // Enable the GCS target feature to permit gcspop instructions to be us=
ed.
--__attribute__((target("gcs")))
-+__attribute__((target("+gcs")))
- #endif
- static _Unwind_Reason_Code
- unwind_phase2(unw_context_t *uc, unw_cursor_t *cursor, _Unwind_Exceptio=
n *exception_object) {
-@@ -329,7 +329,7 @@ unwind_phase2(unw_context_t *uc, unw_cur
-=20
- #if defined(_LIBUNWIND_USE_GCS)
- // Enable the GCS target feature to permit gcspop instructions to be us=
ed.
--__attribute__((target("gcs")))
-+__attribute__((target("+gcs")))
- #endif
- static _Unwind_Reason_Code
- unwind_phase2_forced(unw_context_t *uc, unw_cursor_t *cursor,
---- a/src/llvm-project/libunwind/src/cet_unwind.h
-+++ b/src/llvm-project/libunwind/src/cet_unwind.h
-@@ -42,7 +42,8 @@
- #include <arm_acle.h>
-=20
- // We can only use GCS if arm_acle.h defines the GCS intrinsics.
--#ifdef _CHKFEAT_GCS
-+// Enable gcs with clang for now, gcc does not build unwindlevel1.c cor=
rectly
-+#if defined(_CHKFEAT_GCS) && defined(__clang__)
- #define _LIBUNWIND_USE_GCS 1
- #endif
-=20
diff --git a/meta/recipes-devtools/rust/rust-llvm/0001-AsmMatcherEmitter-=
sort-ClassInfo-lists-by-name-as-we.patch b/meta/recipes-devtools/rust/rus=
t-llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
deleted file mode 100644
index 48af6fc283..0000000000
--- a/meta/recipes-devtools/rust/rust-llvm/0001-AsmMatcherEmitter-sort-Cl=
assInfo-lists-by-name-as-we.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 86940d87026432683fb6741cd8a34d3b9b18e40d Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 27 Nov 2020 10:11:08 +0000
-Subject: [PATCH] AsmMatcherEmitter: sort ClassInfo lists by name as well
-
-Otherwise, there are instances which are identical in
-every other field and therefore sort non-reproducibly
-(which breaks binary and source reproducibiliy).
-
-Upstream-Status: Submitted [https://reviews.llvm.org/D97477]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- llvm/utils/TableGen/AsmMatcherEmitter.cpp | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/llvm/utils/TableGen/AsmMatcherEmitter.cpp b/llvm/utils/Tabl=
eGen/AsmMatcherEmitter.cpp
-index ccf0959389b..1f801e83b7d 100644
---- a/llvm/utils/TableGen/AsmMatcherEmitter.cpp
-+++ b/llvm/utils/TableGen/AsmMatcherEmitter.cpp
-@@ -359,7 +359,10 @@ public:
-     // name of a class shouldn't be significant. However, some of the b=
ackends
-     // accidentally rely on this behaviour, so it will have to stay lik=
e this
-     // until they are fixed.
--    return ValueName < RHS.ValueName;
-+    if (ValueName !=3D RHS.ValueName)
-+        return ValueName < RHS.ValueName;
-+    // All else being equal, we should sort by name, for source and bin=
ary reproducibility
-+    return Name < RHS.Name;
-   }
- };
-=20
diff --git a/meta/recipes-devtools/rust/rust-llvm/0002-llvm-allow-env-ove=
rride-of-exe-path.patch b/meta/recipes-devtools/rust/rust-llvm/0002-llvm-=
allow-env-override-of-exe-path.patch
deleted file mode 100644
index 9be26677a9..0000000000
--- a/meta/recipes-devtools/rust/rust-llvm/0002-llvm-allow-env-override-o=
f-exe-path.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 7111770e8290082530d920e120995bf81431b0aa Mon Sep 17 00:00:00 2001
-From: Martin Kelly <mkelly@xevo.com>
-Date: Fri, 19 May 2017 00:22:57 -0700
-Subject: [PATCH 12/18] llvm: allow env override of exe path
-
-When using a native llvm-config from inside a sysroot, we need llvm-conf=
ig to
-return the libraries, include directories, etc. from inside the sysroot =
rather
-than from the native sysroot. Thus provide an env override for calling
-llvm-config from a target sysroot.
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Martin Kelly <mkelly@xevo.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- llvm/tools/llvm-config/llvm-config.cpp | 7 +++++++
- 1 file changed, 7 insertions(+)
-
---- a/llvm/tools/llvm-config/llvm-config.cpp
-+++ b/llvm/tools/llvm-config/llvm-config.cpp
-@@ -226,6 +226,13 @@ Typical components:\n\
-=20
- /// Compute the path to the main executable.
- std::string GetExecutablePath(const char *Argv0) {
-+  // Hack for Yocto: we need to override the root path when we are usin=
g
-+  // llvm-config from within a target sysroot.
-+  const char *Sysroot =3D std::getenv("YOCTO_ALTERNATE_EXE_PATH");
-+  if (Sysroot !=3D nullptr) {
-+    return Sysroot;
-+  }
-+
-   // This just needs to be some symbol in the binary; C++ doesn't
-   // allow taking the address of ::main however.
-   void *P =3D (void *)(intptr_t)GetExecutablePath;
diff --git a/meta/recipes-devtools/rust/rust-llvm_1.90.0.bb b/meta/recipe=
s-devtools/rust/rust-llvm_1.90.0.bb
deleted file mode 100644
index 42d4031da1..0000000000
--- a/meta/recipes-devtools/rust/rust-llvm_1.90.0.bb
+++ /dev/null
@@ -1,98 +0,0 @@
-SUMMARY =3D "LLVM compiler framework (packaged with rust)"
-LICENSE ?=3D "Apache-2.0-with-LLVM-exception"
-HOMEPAGE =3D "http://www.rust-lang.org"
-
-# check src/llvm-project/llvm/CMakeLists.txt for llvm version in use
-#
-LLVM_RELEASE =3D "20.1.8"
-
-require rust-source.inc
-
-SRC_URI +=3D "file://0002-llvm-allow-env-override-of-exe-path.patch;stri=
plevel=3D2 \
-            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-a=
s-we.patch;striplevel=3D2 \
-           "
-
-S =3D "${RUSTSRC}/src/llvm-project/llvm"
-
-LIC_FILES_CHKSUM =3D "file://LICENSE.TXT;md5=3D8a15a0759ef07f2682d2ba4b8=
93c9afe"
-
-inherit cmake
-
-DEPENDS +=3D "ninja-native rust-llvm-native"
-
-ARM_INSTRUCTION_SET:armv5 =3D "arm"
-ARM_INSTRUCTION_SET:armv4t =3D "arm"
-
-# rustc_llvm with debug info is not recognized as a valid crate that's
-# generated by rust-llvm-native.
-CFLAGS:remove =3D "-g"
-CXXFLAGS:remove =3D "-g"
-
-LLVM_DIR =3D "llvm${LLVM_RELEASE}"
-
-RUST_LLVM_TARGETS ?=3D "ARM;AArch64;Mips;PowerPC;RISCV;X86"
-
-EXTRA_OECMAKE =3D " \
-    -DCMAKE_BUILD_TYPE=3DRelease \
-    -DLLVM_TARGETS_TO_BUILD=3D'${RUST_LLVM_TARGETS}' \
-    -DLLVM_BUILD_DOCS=3DOFF \
-    -DLLVM_ENABLE_TERMINFO=3DOFF \
-    -DLLVM_ENABLE_ZLIB=3DOFF \
-    -DLLVM_ENABLE_ZSTD=3DOFF \
-    -DLLVM_ENABLE_LIBXML2=3DOFF \
-    -DLLVM_ENABLE_FFI=3DOFF \
-    -DLLVM_ENABLE_LIBEDIT=3DOFF \
-    -DLLVM_INSTALL_UTILS=3DON \
-    -DLLVM_BUILD_EXAMPLES=3DOFF \
-    -DLLVM_BUILD_LLVM_DYLIB=3DON \
-    -DLLVM_LINK_LLVM_DYLIB=3DON \
-    -DLLVM_INCLUDE_EXAMPLES=3DOFF \
-    -DLLVM_BUILD_TESTS=3DOFF \
-    -DLLVM_INCLUDE_TESTS=3DOFF \
-    -DLLVM_INCLUDE_BENCHMARKS=3DOFF \
-    -DLLVM_TARGET_ARCH=3D${TARGET_ARCH} \
-    -DCMAKE_INSTALL_PREFIX:PATH=3D${libdir}/llvm-rust \
-"
-
-# Forcibly disable the detection of these packages as otherwise
-# it will look at the host Python install
-EXTRA_OECMAKE +=3D "\
-    -DPY_PYGMENTS_FOUND=3DOFF \
-    -DPY_PYGMENTS_LEXERS_C_CPP_FOUND=3DOFF \
-    -DPY_YAML_FOUND=3DOFF \
-"
-
-EXTRA_OECMAKE:append:class-target =3D "\
-    -DLLVM_BUILD_TOOLS=3DOFF \
-    -DLLVM_TABLEGEN=3D${STAGING_LIBDIR_NATIVE}/llvm-rust/bin/llvm-tblgen=
 \
-    -DLLVM_CONFIG_PATH=3D${STAGING_LIBDIR_NATIVE}/llvm-rust/bin/llvm-con=
fig \
-"
-
-EXTRA_OECMAKE:append:class-nativesdk =3D "\
-    -DLLVM_BUILD_TOOLS=3DOFF \
-    -DLLVM_TABLEGEN=3D${STAGING_LIBDIR_NATIVE}/llvm-rust/bin/llvm-tblgen=
 \
-    -DLLVM_CONFIG_PATH=3D${STAGING_LIBDIR_NATIVE}/llvm-rust/bin/llvm-con=
fig \
-"
-
-# The debug symbols are huge here (>2GB) so suppress them since they
-# provide almost no value. If you really need them then override this
-INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
-
-export YOCTO_ALTERNATE_EXE_PATH =3D "${STAGING_LIBDIR}/llvm-rust/bin/llv=
m-config"
-
-do_install:append () {
-    # we don't need any of this stuff to build Rust
-    rm -rf "${D}/usr/lib/cmake"
-}
-
-PACKAGES =3D+ "${PN}-bugpointpasses ${PN}-llvmhello ${PN}-liblto"
-
-# Add the extra locations to avoid the complaints about unpackaged files
-FILES:${PN}-bugpointpasses =3D "${libdir}/llvm-rust/lib/BugpointPasses.s=
o"
-FILES:${PN}-llvmhello =3D "${libdir}/llvm-rust/lib/LLVMHello.so"
-FILES:${PN}-liblto =3D "${libdir}/llvm-rust/lib/libLTO.so.*"
-FILES:${PN}-staticdev =3D+ "${libdir}/llvm-rust/*/*.a"
-FILES:${PN} +=3D "${libdir}/libLLVM*.so.* ${libdir}/llvm-rust/lib/*.so.*=
 ${libdir}/llvm-rust/bin"
-FILES:${PN}-dev +=3D "${datadir}/llvm ${libdir}/llvm-rust/lib/*.so ${lib=
dir}/llvm-rust/include ${libdir}/llvm-rust/share ${libdir}/llvm-rust/lib/=
cmake"
-
-BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-de=
vtools/rust/rust-source.inc
index cf8274b443..ac814c67b6 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -7,7 +7,6 @@ SRC_URI +=3D "https://static.rust-lang.org/dist/rustc-${R=
UST_VERSION}-src.tar.xz;n
             file://oeqa-selftest-Increase-timeout-in-process-sigpipe-ru.=
patch;patchdir=3D${RUSTSRC} \
             file://0001-src-core-build_steps-tool.rs-switch-off-lto-for-=
rust.patch;patchdir=3D${RUSTSRC} \
             file://revert-link-std-statically-in-rustc_driver-feature.pa=
tch;patchdir=3D${RUSTSRC} \
-            file://0001-libunwind-Use-gcs-instead-of-gcs-target-attribut=
e.patch;patchdir=3D${RUSTSRC} \
             file://0001-riscv32-Define-plain-syscalls-as-their-time64-va=
rian.patch;patchdir=3D${RUSTSRC} \
 "
 SRC_URI[rust.sha256sum] =3D "6bfeaddd90ffda2f063492b092bfed925c4b8c70157=
9baf4b1316e021470daac"
diff --git a/meta/recipes-devtools/rust/rust_1.90.0.bb b/meta/recipes-dev=
tools/rust/rust_1.90.0.bb
index 5d804c7398..c2cb8f8829 100644
--- a/meta/recipes-devtools/rust/rust_1.90.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.90.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3D11a3899825f4=
376896e438c8c753f8dc"
 inherit rust
 inherit cargo_common
=20
-DEPENDS +=3D "rust-llvm"
+DEPENDS +=3D "ninja-native clang"
 # native rust uses cargo/rustc from binary snapshots to bootstrap
 # but everything else should use our native builds
 DEPENDS:append:class-target =3D " cargo-native rust-native"
@@ -28,8 +28,8 @@ PV .=3D "${@bb.utils.contains('RUST_CHANNEL', 'stable',=
 '', '-${RUST_CHANNEL}', d)
=20
 export FORCE_CRATE_HASH =3D "${BB_TASKHASH}"
=20
-RUST_ALTERNATE_EXE_PATH ?=3D "${STAGING_LIBDIR}/llvm-rust/bin/llvm-confi=
g"
-RUST_ALTERNATE_EXE_PATH_NATIVE =3D "${STAGING_LIBDIR_NATIVE}/llvm-rust/b=
in/llvm-config"
+RUST_ALTERNATE_EXE_PATH ?=3D "${STAGING_BINDIR}/llvm-config"
+RUST_ALTERNATE_EXE_PATH_NATIVE =3D "${STAGING_BINDIR_NATIVE}/llvm-config=
"
=20
 # We don't want to use bitbakes vendoring because the rust sources do th=
eir
 # own vendoring.
@@ -188,6 +188,16 @@ python do_configure() {
     bb.build.exec_func("setup_cargo_environment", d)
 }
=20
+#llvm-config expecting static libraries in 'lib' instead of 'lib64'.
+#Since LLVM is built as a non-multilib component, the 'lib' directory=20
+#doesn't have any library files when multilibs enabled. So, copying=20
+#library files without impacting multilib behavior.
+do_compile:append:class-target() {
+if [ -d ${STAGING_DIR_TARGET}/usr/lib64 ]; then
+    cp ${STAGING_DIR_TARGET}/usr/lib64/libLLVM*.a ${STAGING_DIR_TARGET}/=
usr/lib/.
+fi
+}
+
 rust_runx () {
     echo "COMPILE ${PN}" "$@"
=20
@@ -199,7 +209,7 @@ rust_runx () {
     unset CXXFLAGS
     unset CPPFLAGS
=20
-    export RUSTFLAGS=3D"${RUST_DEBUG_REMAP}"
+    export RUSTFLAGS=3D"${RUST_DEBUG_REMAP} -Clink-arg=3D-lz -Clink-arg=3D=
-lzstd"
=20
     # Copy the natively built llvm-config into the target so we can run =
it. Horrible,
     # but works!
--=20
2.49.0


