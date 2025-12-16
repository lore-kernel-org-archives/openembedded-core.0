Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79404D5CCA0
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 09:53:54 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18720.1765878824490126580
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 01:53:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=KrByDFiV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=44450448cf=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BG3tu9e3261186
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 01:53:44 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=85kUtMPEoDXVZKJcFxwjsJR1hU2COD1Nu6DcWWdL2Co=; b=KrByDFiVvLo7
	6St4v58v5iSPMMZTYb+LOiq6FOy09132YV1r/xcWdJ1Qlq2MtWSNMArXVpW2sjMH
	vSOcc+91DbjF6uHxjHWCkDeI7VsC8L8MCBIeP+bms5V4fqe8yxV3qMm6O9KV+i6U
	fQ++rc6COxmuslGSOLxJmS5rs7rXt6mC/WcpTOPSQlorV6HDU59PlIa4PGPSor+c
	PlLpxEH2EJprOBeN6HKs3EhKal3Vd6j+cXNLsX9slgnj4aFBu+DAFJAneCbTRk+D
	Ko7Y5oSxWFjsPTBeXmIoAPc45TcE68f7m57D3uj3NhW7QVqZxlET8GB+U5GTXCTb
	pgNLAcaNzw==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011032.outbound.protection.outlook.com [52.101.52.32])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b14a5juhj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 16 Dec 2025 01:53:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lFfzzRrj6O8WjQX9kNoptRvMexk5PgAypTqcg4blFzRhg0uzy92oSuSLV868cZWl8NJLVZ0HPDzErCFKWCrfS6G4gjflNroxmz84ata6Q1XSWXb3Lu+TF1Iz8y6OPlVch8Jt0UtDeSOejdijOeI5/V858OohjNO92VS4FQ92fbhHj3VB+HjX7/LK+CN7vSynKj+L9dNpCqN0UXKTfH8sAiecbOWcTZaUoe6P+idaLOev932CjSsJZFGgpY0r7pnLWr3XgQqOxJow/FaBTTf3efBg30g5RWaxhoRXILRrPxfkZPl5bz9FQoWkfWR5IF2fIqknvG8EYO9ClkIwFWzavg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=85kUtMPEoDXVZKJcFxwjsJR1hU2COD1Nu6DcWWdL2Co=;
 b=y9nYBaF3Tav7jcnWTrXo2hwJhkSpHSvKmbPBy7e/445KYCjxhhiYJBRexqmPVVHHmMB/+tf43yELTn2KMvVVEqfiQY1BybmVyA/2eYwWsmYKtC9jjx9anDk1bo2tdQ1n/XHakpa/dq5t0SlEvkShsT5JuFfrLDiadPsh/HB1GBMx0o2XQYfuh4WQB4otKlYKMOZjlzPhHEo899pb1fFfrPFrcn081ajnMPpcolrJzPOFmqDLaNUnid8J3QoskdtQjUsJXIBKCFQK0y8V3UeQPl9HG4gdYSeo3kV1DDdAnhBqqZWSvRwU4aqVEtogpvcRHG7ZN0z4d05PK4GYGux8ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by CYXPR11MB8730.namprd11.prod.outlook.com (2603:10b6:930:e3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 09:53:40 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::c84c:d2c3:1102:cf45]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::c84c:d2c3:1102:cf45%3]) with mapi id 15.20.9412.005; Tue, 16 Dec 2025
 09:53:40 +0000
Message-ID: <7ecade65-2582-4eda-9d3d-cced2880cef7@windriver.com>
Date: Tue, 16 Dec 2025 17:53:34 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 2/2] socat: 1.8.0.3 -> 1.8.1.0
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        openembedded-core@lists.openembedded.org
References: <20251215084345.1797393-1-hongxu.jia@windriver.com>
 <20251215084345.1797393-2-hongxu.jia@windriver.com>
 <DEZJIBHT7GKY.AIXJ4FBZHXER@bootlin.com>
 <DEZJJ73RABKA.BBYM9XN1HSLS@bootlin.com>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <DEZJJ73RABKA.BBYM9XN1HSLS@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0127.apcprd02.prod.outlook.com
 (2603:1096:4:188::7) To PH7PR11MB7608.namprd11.prod.outlook.com
 (2603:10b6:510:269::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7608:EE_|CYXPR11MB8730:EE_
X-MS-Office365-Filtering-Correlation-Id: 62f0d361-5ff6-4db9-5f9a-08de3c88fd5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZXpHNnE3c3lBWHV4dmdrYk90eS92SkxycUpuSGg2QjdSYWFFbFJKdUVlaEhU?=
 =?utf-8?B?S0c2KzRwaDJvaVRzOTcrWVdLZ3ZaVXhtS3FsVVRiSndVR3ZCYWtGM3RVSXox?=
 =?utf-8?B?VzVrS2xQRnNUSUZPeDlidXVBOXhwbHNKZ1ZXbWZ4V0xyTGVVR3dIczVlZlph?=
 =?utf-8?B?dXhkT1B6ZjRJYTRVaFNka1ZIVHlrbDllVTVHaGpHU25naWxzQUU1ZTVmY3Bl?=
 =?utf-8?B?T3E3eGpOcGZTM2EyZFMwV292RkhRWk90N1BJVGZ3bGlQWmF6MDlKSXFydWVq?=
 =?utf-8?B?QnlhdThNTGU3Q0VHbldWN0swRWEzdmQ5Y3h4amZGaUZXM3JFZG9XMEZaWGwr?=
 =?utf-8?B?M09rVGJ1UHhLUFp2ejlDYjVZNm5BOXhaWUkxL2M3dlRnQ2VLNWFyRnZDUFU4?=
 =?utf-8?B?YkdaVHRzTUUvNElISTYyZkhOZHV6VFpOSXNpMVNCcGUwbXJQQ3lUWjBVU09C?=
 =?utf-8?B?c2lHU3kyeDM0Sm5KRmtQMHR2RkRJRXFwamFFNGt3ZTRDb1JqSzZaRXpxQWJF?=
 =?utf-8?B?Rjhwam1Fc0s4aHJPVjhQSFRlb2lkblRjOTdCUHJlNHpOelpCbndLazlhTVN4?=
 =?utf-8?B?UGdJZEhzYXBwZXpJa01mblNKY3pBSTA4azNQdXNLTTd3Qk1iNUJHWkVpUzBk?=
 =?utf-8?B?NDJOWEhDckpKMGx3dEVXdENETi9qalNaM2ZVTHFMVmk4Q3oyYVVzdXkyT0JG?=
 =?utf-8?B?WmJ3K21lS20zVU5pRldBK1ZYcm81UGR5OFlMVnE1RkM0b1lBSjQ4UTh3dEJm?=
 =?utf-8?B?UXoyMkl2NnVFeEx4a1JTMHljUHZtU25xY1BJNDBwN2pmaG8zc1k0Mm8xNmFV?=
 =?utf-8?B?SFJSbllMNmt2SEhVVkcyMEtacnEwcUNTQ05obUpOZVYvaGFIS2JjOGpaSGFM?=
 =?utf-8?B?eEx6NldpbG5rZUlnam44RlNZaUZQTHVnbDFzMXc3QnhuZk1vTmNlMGZkKzJO?=
 =?utf-8?B?cCtEWDcrUmJlYmt3WitxeTVxVTRzdm9NcDRvdzRnOXd1ZDU0UjBTd2lJallM?=
 =?utf-8?B?dURYTzJITkNOZE1KVHhtODFLRkVlSUFxcFFxaWxPVFc1NmFidi9SNmxJZUpx?=
 =?utf-8?B?SUwrQmhtNjBZYnJFclJPS1BiR0haOERPbFozb0V5d2dqcFhEN0dYREEvcURp?=
 =?utf-8?B?clF3b0xZemY2SEY1QmlwYXU1alFzTWJFU3hyeVB3V2phUndNMXBaenp4Yjc2?=
 =?utf-8?B?MHFxaXNDMkV6UjJzR0tGa09kTlVmQUt3VC95bG5YRW5rUHRtazF3eDloalcz?=
 =?utf-8?B?aUdwRE5WSU5JZjNsQjg5RDhGR2x5NW84d01STXVLMThna2hYNnJCclQySCti?=
 =?utf-8?B?NkZKOG00Vmltajd5aGw0ZGYrNVcxZnpRUFMxRm1SY3lFTWpIeTlFOTlieHYv?=
 =?utf-8?B?VDB0ZkpaaXd5SUdlc0ZESEY3a1JkQ0w5Y21IaDdSc3JvWXQ2bVZBUVhrZWcy?=
 =?utf-8?B?dDg1R2ZnRzY3M01kdGVvUUdmWm9yS3NGMGJ0Y3F5TEZVTXJRS0JOR2k3VDdy?=
 =?utf-8?B?YjVZZWtCd1E2SlBzTFhqaVBjQVczdHFsVXFlNlVRUkl5bFMxam5wNmN3Um5x?=
 =?utf-8?B?VU5ZY1grSktkQTlXc3luclRHalBCaUxZbitkVkQyaFExTkxsZWJZUWxvdEpv?=
 =?utf-8?B?cTJrUmhqZzg5L1N4U2lnVk1DV2lBeGc4clhtQmlhYUQ2cVhxM1VkNXd6S2NQ?=
 =?utf-8?B?RzZnWEJNV3RWcVYwSHNQTkVPenZZSm1CalNycnRTY1NJMkZ0RDNmUzdYYW1k?=
 =?utf-8?B?NWZscUlEQTFObWkyaEw3OVJYMnhuOGRtVUc3ZnNDTk1oblBkMnQyWjFsTkxZ?=
 =?utf-8?B?WEdlZ24xOENUZ3RwMkhDdjBuOVZieFZBK2ZXR3NrdFdYZklnY2FTQjQrVlRV?=
 =?utf-8?Q?aUF9zUycXyuy2?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Qi92dDFCaERwUExuNC9Zd2lrbUhzN0F5REhJV1FpTndyc0FKU1l0TkNiYnp0?=
 =?utf-8?B?eXVua3lQTnE4QnF0dmpMM3FyVVpxejdJUXFZUDhqM1VXRW1qQ05NSjJ6MEhk?=
 =?utf-8?B?UlRaeEZDQWFJcDFTMURXV3U5eVNjQndIYXdLenpKaFdiMFVidkhZcXpUSUZC?=
 =?utf-8?B?Nkx2RTdpVUJ3RkpVY2RZbVovNFJLYXVOSnc2c2hsQXN0T3d3N2hwc1JFUkVs?=
 =?utf-8?B?c29ubDRnWldZb3pUQUZZSWNidWtoU1hhTE9ZTFZSVkprbHNrS0tHRW9OYm9J?=
 =?utf-8?B?RXU3R0ZoZ2JUUHhSaHVQSzlIR0NRNlpESHJ1eGZrR2lZWkg1bmVTQm56bjlU?=
 =?utf-8?B?MlZXdHd6M0hjTjIrL3AvZ3k3b0hwcXRwSjNQRXhuK0ZydW85eUIwdFQrK0lG?=
 =?utf-8?B?NVF2S3hmVVR2REIyS1VONUEvaDdHWjVqVjRSNU43QjhidnN4ejdKU21JQWRw?=
 =?utf-8?B?UGMydFFsb2ZGMTFSdDBGaWFjcDhQczdsN0pPWjl1K1VxbHlwcHRSc2Y0LzI2?=
 =?utf-8?B?VGEzV3FLbDdxRkxEL2o0Q1lVckNTYlBSRlVBNEVURWNuTTZFMXlWSTBRTkFV?=
 =?utf-8?B?QUxTNk5QYnBUZk14dVdrMnVyeEFBcHlCWWp5WmVrTUdERkg5bHFQRVZZWDU0?=
 =?utf-8?B?UjVtTHdWMXN1RXBGTnIwamtHbHpCWnljSEthWldxM29ibTBldVRUbVpMY0h4?=
 =?utf-8?B?MnJFYkVqQ3F2c2E2MEZ1a01IOTNZVEZDNUJ1azRnY1dMMzZ2ZXBVY29aQmdX?=
 =?utf-8?B?dU1HWnV6aDIrcDgreENnUEplOUVtY3RVSUNNZ2VSejZIUEhVdkRseGY5Z3lV?=
 =?utf-8?B?QUtyN2VBUDBxQkNaR1lEKzhHMUtiRlI0TFJPdlJxV3p0UnM2RTRTZGZobFp2?=
 =?utf-8?B?L3FsRC9ZR0h3OFBNRTVFbTBTQkZVT1Y4MnpScFp2SXpnL1hqOWZBbStWNDlG?=
 =?utf-8?B?VC9QVDZSWDB2cGZyQ3ZQWUptUTgwdDI0N1BOTFlZbURHSzdVYStWcC9tRnZX?=
 =?utf-8?B?VU9tM2lHdEMvSCt1R0taUkJKVDBxUWFVMWl3eFJ1a3dxVGhPN0Y4QmM2QlY0?=
 =?utf-8?B?d1dXOVQwUDBiUGdROU9TTzJRTWMyYVJvUUE5MDV4dlExbXJJMEZDS2dPa1c3?=
 =?utf-8?B?c21kOHpianYrc0FrNU9qalA4N3A1VHNXWmVXbFFNQ090Z0ZRbDVEYlRkSUtM?=
 =?utf-8?B?TDdFQWhVZWQ3cDhHSEh5NGtZN0Fmb3pwTkpNdmovQ0lvbHFDekdVeWtsTXd2?=
 =?utf-8?B?MFQzcVhRQVZZenIrVmxacFlFblhmOGRXWWVaZ1VyUmNzTlM2ZC9wSTAzdGl4?=
 =?utf-8?B?REsrSmpCVENlVnBIWU5WMm5rNlRxUURUbktQUSt0VmhtTWxhcHNQd1lNVzRT?=
 =?utf-8?B?NGlwc2xIeTNhWlFmWGxqV0RpUnFoSjVEeXVUYU5DSVl0WS9aeXpmUDd0bzFa?=
 =?utf-8?B?KzFJam4xdlZ1S2l4US8zNm9CT1hCV1NIT2oyL20xeld1dFByR1AvRk1JUUJT?=
 =?utf-8?B?ZmNFSVJISVlMdVpxMnBadUNkdkYzSFRNRVk0bFlnd1lTak5rakMvTUVmRXJX?=
 =?utf-8?B?dDZLZStuOStsczROWWpYZmV5eDdPZjRTZy85UFJjS3hBQmFZenorZjlDVGZv?=
 =?utf-8?B?U2dqSGhCTitidHNiK0hQZE5yYS9uYThaMWpNQ3NZNTRLV2RyWEM1NG12T0RC?=
 =?utf-8?B?ZDJIdFlWVGRvVWJ2azFxS2lTVVBDQ3VxMUpwSEJWN0FMT1NTekdPZDQ0N0Rh?=
 =?utf-8?B?UmpyY3FEYnFYc3ltNXRoNTlscmNyWXN1QzhHSEUvakdabnp1MVdsZ0ZzUmU2?=
 =?utf-8?B?OC9xbkt5Y3hPR2NQaEcvTEJlSWFHZkg1a3JrcGhvN0JBTmFpSWo4QmpGWGty?=
 =?utf-8?B?QXVidU9MaU9mVGxLWGRvSmkvY1hkaGJ6R3BSVVRDa1o5YVhscFRNUUtNWGJl?=
 =?utf-8?B?V1NmeUZPeXRuejg5T2pKUzgvMzdSQkpMeGJmcHo2cjBQdGw2NGFHNHZiQi9W?=
 =?utf-8?B?bFZXdjBzQWM3VnArODNFc0dXN0krMWpnZzc1YVBUY1RlWXUzN2NRdHdWWWpl?=
 =?utf-8?B?Q0hYOEVUWm14V3V4MEF5Zkhycmt1U0VxQ0Nhd0VPL1RPRi9rNVh2THhSOVh4?=
 =?utf-8?B?TEZ1T1pxVTI3WTMzRWdEOHJaK25ESFF4WjdmUUMvL0hEcmNFSlgwaTM4VUJK?=
 =?utf-8?B?dkE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62f0d361-5ff6-4db9-5f9a-08de3c88fd5e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 09:53:40.0355
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8AuZ1e2A+Z8VPGiKPXvgjJ+YOpxipqUBLIirhL8L0ViIMgGYtLu3CEMfbzYhSQ12Z0AWsdGuSzVf6M0xYGVmLqX3ESz/0gtnyJQTUIWdo34=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8730
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: cGKh_dvy-v6km80UR7fbYL2EziHaQ-En
X-Authority-Analysis: v=2.4 cv=bs5BxUai c=1 sm=1 tr=0 ts=69412c27 cx=c_pps
 a=vMZ8N8iCC09X6dpNzQs02g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iGHA9ds3AAAA:8 a=P-IC7800AAAA:8 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=3jDPZ7RIOx_JFfwmgr8A:9 a=QEXdDO2ut3YA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=d3PnA9EDa4IxuAV0gXij:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDA4MyBTYWx0ZWRfXx1XTPq8txntj
 aK6mqTS9O/sQ2octV1Y1b55ouqfT6ipMY4fbifhTmqZP+SmZep4hFT8AeIgCnrljQAkWd6Hze2A
 wRltDKU7oVXHSuJDRty9Ad79zWhKMQdHl22KYGwDkMF/ltSkyvKtGyTkPHOLrt0mi14TWLdnEUt
 oXXKFXKJdN3uyzxm03MAdl0FdmZhnxmw5O5YN8QgqGVloCAN+r0psLS+HJsyngKKw3jEem1qe/J
 Sfoy1uM2I95dtsdo+/IgVVyWMx9zhU4KkTAirF71mNsBpy4nwts8Zsy9Jtq206fqYCOW55+8oRU
 Xfl88xRnxoFRDmQNUZtKKpnZ19vWxVOAnTCTVzxZligasp9BXqsrXWp27b/lACE2G45qV6kJZHN
 /UtuZ8S/FkWmwJClvR7skYyVmyeDcQ==
X-Proofpoint-GUID: lXXaKhOvbZ586-6wYhgPa3GNXlrlegVU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_01,2025-12-15_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512160083
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 09:53:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227934

On 12/16/25 17:41, Mathieu Dubois-Briand wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Tue Dec 16, 2025 at 10:40 AM CET, Mathieu Dubois-Briand wrote:
>> On Mon Dec 15, 2025 at 9:43 AM CET, hongxu via lists.openembedded.org wrote:
>>> License-Update: No change, update README to add new lines
>>>
>>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>>> ---
>> Hi Hongxu,
>>
>> Thanks for your patch.
>>
>> It looks like the new version is having build issues with musl:
>>
>> ERROR: socat-1.8.1.0-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/x86-64-v3-poky-linux-musl/socat/1.8.1.0/temp/run.do_compile.476916' failed with exit code 1
>> ...
>> | ../sources/socat-1.8.1.0/xio-netlink.c: In function 'xio_netlink_mtu':
>> | ../sources/socat-1.8.1.0/xio-netlink.c:33:59: error: initialization of 'int' from 'void *' makes integer from pointer without a cast [-Wint-conversion]
>> |    33 |         struct msghdr rtmsg = { &sa, sizeof(sa), &iov, 1, NULL, 0, 0 };
>> |       |                                                           ^~~~
>> | ../sources/socat-1.8.1.0/xio-netlink.c:33:59: note: (near initialization for 'rtmsg.__pad1')
>> | make: *** [<builtin>: xio-netlink.o] Error 1
>>
>> Can you have a look at the issue?
>>
>> Thanks,
>> Mathieu
> Sorry, I forgot to add some links:
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/3/builds/2910
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/111/builds/1595

Copy, I am working on it

//Hongxu

>
> Thanks,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>


