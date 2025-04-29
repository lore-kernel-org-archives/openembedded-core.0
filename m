Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B72EC369CB
	for <webhook@archiver.kernel.org>; Tue, 29 Apr 2025 04:23:34 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.7775.1745900605554294121
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Apr 2025 21:23:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=721457ca09=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53T3IQjH032201
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 21:23:25 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 468ts3shg0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 21:23:24 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53T4NOjZ030323;
	Mon, 28 Apr 2025 21:23:24 -0700
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2040.outbound.protection.outlook.com [104.47.56.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 468ts3shfy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 21:23:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nTWi2PAZa5NYUsjeyPICHSVTrsKCTczJkMxTyT6XklCtHK60NCfPs2aCeL3z70znymseXpZmZNyAZTDX/4oCGjTHFM05EY+uk5E2IZxbMyf0aNee7MB/wF5Z2YrM74CoAyNUonozHtfg6tukxGAH9nuLkC4+1UOvnUsKHOc+/PuSj5uWjCZzIaRaJrYpnvlNL0Q+yFmiX3AJbhWzOESGQzZjtuWekySTP9pYYuADTwYLlJMzO3f8WtH3CmrvF0gx3Cik85X+oWsv9DWSZl902iVHP12fmw1FCaGVDoaX89XSenScgmRrSNYc14lW9/tOWWMG2ot4eXrU0lUADtalPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XdDRAafMAm9eowX1WGFMQw1eQwwGyNmmvyINyFZKrf0=;
 b=op0O3uPxiOYe45cjDaf++O4hVxYC0z2QtKMb4TIB8GatU6pw40QjemPQgSYi24fNfxreLqQWx5yHItUSC9dXRNxoXhF/es5L34ZXi16zWeeUs108Obyat7KHuNRqlT5dYPnc/QSshdvfDVAtn35bomIvECXCBMJaDS8AF7GQ+/YMvjCcZQW86c9cVXWPtgPq6L+C9tAg6m4W4E2FhZt78BoVd8HLetKZfpJSABnaIxCWYwOutGM9XzkoNfN7vFNDGHT4I07coN/33QgQMIujyDouhm09PJpvDTfq2MwqA32HlHyHQcAp4xeIZNEljs7kcZ0y5MAv2KXm9ENWM5/RyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by DS7PR11MB6104.namprd11.prod.outlook.com (2603:10b6:8:9f::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.33; Tue, 29 Apr 2025 04:23:20 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%4]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 04:23:19 +0000
Message-ID: <95f7995e-90d2-4399-b141-6f5dfee3ae47@windriver.com>
Date: Tue, 29 Apr 2025 09:53:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] rust: restore unit tests that were marked as
 ignored
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        openembedded-core@lists.openembedded.org
Cc: Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com
References: <20250423112604.3718426-1-Deepesh.Varatharajan@windriver.com>
 <D9ES53X06ZYS.O2YBSMHAGNG2@bootlin.com>
Content-Language: en-US
From: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
In-Reply-To: <D9ES53X06ZYS.O2YBSMHAGNG2@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0038.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::11) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|DS7PR11MB6104:EE_
X-MS-Office365-Filtering-Correlation-Id: 579520b1-3cd3-489b-1853-08dd86d591c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?YjJ1SEhYTVNJWm1IQU5SN1Y4RVZYUjVpM2lkQ2IxMU02cERCNXpscThtMVdG?=
 =?utf-8?B?R3JTZXI5cHI4L0hpVG1ScEdudXJscmgxV05jNHB1QlRGZXZSZ3E4UWx0ejh0?=
 =?utf-8?B?TWExc2NNUEcxcjgrNVIzNzRSWDJUMVNpS3E4VEg3Yk5FdjBTVHdrZng1OGlu?=
 =?utf-8?B?RDF0bVVVaFE3VStyeDBtTm54QUhRMHFua2syaHdJaTRlSmw4S1NaRFYzcTVY?=
 =?utf-8?B?WWdVS3NFZHNJRnFjcURKNjZXQjF0V252dnlpZFVDN2tPRGZPSVowMUJua0wz?=
 =?utf-8?B?TXRSQlU2emVmYU5Fak5aVlQxTmhpemNMYkJkWFVndGwvdmF1VXlza05SNm82?=
 =?utf-8?B?dk0xa1ZGWm5lVmZIK3pJOUpMNHQyaFI0Sndvb01peklVai9sN1RBU1NHNWxj?=
 =?utf-8?B?a3dmRGdBSEZQT2xETmN5UTAxanBDWncwaVY2dW4xUDNmODVPRXUwTHZVZjdS?=
 =?utf-8?B?cFUwSGxNYjFoVThEQlhYbTY2elJlcjlmN0dwL3B1RGRZL3YrTXNJVm8yQ2xO?=
 =?utf-8?B?YVlFTmg0akVDYUpHRnlBdzRnc1dnR0ZVaG9PWEVQeEZzUk1BaUVoNmhsam5n?=
 =?utf-8?B?RTFveER2K3RuZ3hvVWpYNzlSQm44YnYvT1IrbHBSYTV5MG84OGEvY1FLRGp5?=
 =?utf-8?B?WmZud0FGbWlsdnIzclNrblZ2VU1RMUliUkdxV2h3NFltQ0RiL0VrbDJoUWhi?=
 =?utf-8?B?L3JqaE1DNE5EdWdNUDdrbHRjOHBUU0JkTm9PMGYvZFo5S2YwTzhHT2N4aHhi?=
 =?utf-8?B?U2o1VkNsMUJmeS82RHlMWGpsdmt2Zlh5UXF5SVhBT0hRTUVJM0xJZC9YN1I4?=
 =?utf-8?B?WDQ3VkI2ZktVd3RrMVBKZFhGZDU5OFVJU1liTlJ6aTJMUm5XTGZCYkUyeFo4?=
 =?utf-8?B?WExqTndxUSttUkJZSWNGMDdGTkNMMlBGMWhSTHhWcmFvRlUrUzBDLzlwVDdE?=
 =?utf-8?B?bXdPSXBJSkQvaU9xcmJMRlN6S2pYRDlxc2Q2RjNPaHNZdUxwZ3VhWXFBU1U4?=
 =?utf-8?B?MjRVaGJJTmtxai9seFNtdUU1NlI2T2NVR0pyc2tYMUw0RjJOVk9ONldiL3JE?=
 =?utf-8?B?MVFvL1FiNzBtdHZlOGxRbkdjeTJ6S1BwK20vU01mOE5KYTVGMjJqb1d1eExG?=
 =?utf-8?B?dHFEY0VzaW9TMXVaVEFrZnZFQW5uR1l3Vm4yZnlZMnlqeGtqQnp6OURtZVkz?=
 =?utf-8?B?WXZ4T3YwSU0yaWtZbW5wTjhoQk5OV1ZEM1U0bzc1UmxSODhkMk0xSWtIbmpO?=
 =?utf-8?B?VmwwTlFTS21YNzl2ckpHYVo4U3RYZ1ZaMnJVZ29JSk96a0J2UFdieXJMQTQ3?=
 =?utf-8?B?NE83MVNBY3c1bTd5MGlBdlpoVXBXdENaSk5mSDJhTUpqcGJ3WFI1M0pVY2hY?=
 =?utf-8?B?dWJWZmNHR3pGeS9EOWJxUWJZcjA4ei9lSUNHcDJkZDZ4cFJyNXlKN2tBMVJP?=
 =?utf-8?B?WGpzWWt1cHRRa1EzaTdwSkEzamNMZ1R5OCtNMUgrN2xLM3hjZjI1ZGRkcHgy?=
 =?utf-8?B?d1BNYjVXNlFreG1CSlI0MTZ5dDIrMU94Y2hOVmkzcHo3NkNxQzB6MXhLOWVt?=
 =?utf-8?B?RU5pS2xWaTM1dmZiMERlYzJkd1psRlZKZkJmNDNZUDBnNmRGVHFFWFhjOVhv?=
 =?utf-8?B?alZKNU90Q3ZCakwrZ0xZY0hQN29GSksyc2lkQm8yRThHLzI4ajdKQlBUNzM4?=
 =?utf-8?B?Rm1pMVF4OWFHYmhXWDJIZE1rcHJ3K0NxT2tpcG1mQTBQNmZmdkEvZ2ttZHNE?=
 =?utf-8?B?b0NrYWgrR0svRkNlMDRQNThnd0hxbDlHa2pBdHBxT1BQd21wNkpQd3FIZkpB?=
 =?utf-8?Q?pzJl0DStAp1pLxkacYpwcnHLAcc/AyxRX/YLk=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MHhkQzNPWjVEM2xVSmdVSzc2OFpuWTNiT0t2WUtCWlhLaXBURUpHcTdJN1Vw?=
 =?utf-8?B?RXdLa25qMTkrTlZMQStqTko0R3RzTXdKYmtYQS96VG9nZjUwYThrb2xuYUI2?=
 =?utf-8?B?aU9xTW43M0NpQUNvaXNrSGU2TjRoNjZpMTZ2a1pUVy81Ukk5T1pMcHliUzJv?=
 =?utf-8?B?U1grQnFCR2U1MXR3S2ZjZmhBcmVFT1BlbEIvTzduTm1GVVBZT1JNenlqNEYw?=
 =?utf-8?B?dmMyMUZTdVJJZ2g3WGJ0bUc5R1M2UUhoKzhZUzFkbk5Cd0VVWFRZWlR6OC9w?=
 =?utf-8?B?TkJpZkgvVXVWRVJHczZ2WWt4Nzd5eUJtUmR0amRlQTFZaCtaQ2wzQUpVZzVS?=
 =?utf-8?B?RXFWdklHWStLeEtoQ21iYVhsSzd6WG44Wm9DWVo0a1BQTkk2VnZUNGw0bXox?=
 =?utf-8?B?SWw2TE11cXZYeEtzcEwwVG9BZ0hLOGdianNidXAyVjVCUHQzTE1nODNER0tz?=
 =?utf-8?B?dW9RelhhbXN1Vm5LUjUvSXpzWHBVVVlmbks0eGtFbXExVENTRjBTUS84RDR1?=
 =?utf-8?B?WFVyOGhFZVF5OFZuMnFBVUY4SjFLYjVRcHE3K1R4OTZtK2ZvYXN3TU5PMVJM?=
 =?utf-8?B?ZTRaMlJmSzgwUnR6THVGMU9NcktxdzZhcVZFN3luYThyM0xzM1h4dlBTdGN0?=
 =?utf-8?B?cThYbXFwYkpCWjdQQkROT1loZTF6dGZxVGhTUWVYYUQ1bWJ1QXJ3Q1doWVhM?=
 =?utf-8?B?SUhHYXNSeEs3MUFSSW5GZG50V3Y4bndBRGtEdVRNeTVQeFdCdDVkTE1tRGlF?=
 =?utf-8?B?RHpqQkdJVU5WVmRZMzhXOGRCQUUrUjk1Sjhwa2hTRkh0NnlrVnRjVkNUVTR4?=
 =?utf-8?B?ekNMMDZ1ay9XdXpheXNlU3B2RnE3dkMzaFZZOW91dThVZmhTY0h6enhxSUNE?=
 =?utf-8?B?TWxMWVU3b1kwSWgzL3RQZ29CWGgxWCtFN3J3azJqZDB1OHg0SDA1ODJiNWVp?=
 =?utf-8?B?RnNUczM1MHpYQXdVdXYvdUc4TkZhUENjMFdtM255NXZ3ejZDS2xKY0pzZGpQ?=
 =?utf-8?B?bEEzdmR3QmRiMXVGaVNab1ZUZ0k2Qi9BREpKeUNQWnNiQUlwVU9aMVdraFNq?=
 =?utf-8?B?Rm5wQkZLcWRVKzhFU2l1VmFvZEtpM1hNckdhWGgyMTVxc0NZbkhuSjM1UTNO?=
 =?utf-8?B?V3ZFckVwVDJaM0ZFUGtJR2gvMWRuODNVdjZMQXRTZzdyL2Njb3hKbjM1bzFZ?=
 =?utf-8?B?YWs0OUo1S0d3N3puckE5aWhsaGxldWs1OFZSUmduL3pKbFA5bm5IdDNiSktU?=
 =?utf-8?B?NTRjdy85REZKM2JLOXBBQ09tL3Fha3laMkNLZW1xajh3UlJCbG1KR2JIWWgx?=
 =?utf-8?B?Z01iekRtU0xLcjVMNUZ6amlLcGxhays1Z1UvYlNtUkVUQ21Bdlc0NnJieXVm?=
 =?utf-8?B?VHNIR2VmTWYxZzA0d09heUQ4bmNFTGI5YmU0d0dvd1BDbnBtMzNWd1duYk1D?=
 =?utf-8?B?YnVyV0hrRUdFZ2hTb3Q2dzdLTWp4Tm0zZndabkVYcG5waFNHbkdsbFpkSHFK?=
 =?utf-8?B?amszUDJOdXQ4MWwxUXQwdEF4ZGRWMmw0TTRwMXhudWNZbThWZTVuQ29sZUtE?=
 =?utf-8?B?OTRwK2pQTk03Rm5ZcGtpdWZqUWhybk15ZlRSRDFVV3FWL3RobWZEZGhKK1k3?=
 =?utf-8?B?RVpvcENjVEQ2OTZVN1U0ZlJNTGh2cEUrd2VCK0lEYlROSWdIQjgwNWZDWGFL?=
 =?utf-8?B?eWV1QXdQNERrYmI3YVJyQkhwVVBvcmQ2eFVKL2JMb0Z0K0xZcW1kTWFoUlZ0?=
 =?utf-8?B?S3VGTlZIYkpOVjJwRWx0aUNMYXlkMXNyZUdLbnF2SDVGd0RUVG1EaEorTCtI?=
 =?utf-8?B?ZHk0M2pRUWR1ZTVENS9yeTE5V0xYZWVjc2ZMSHRYTUVHYTVDaVEzUWJLSHgy?=
 =?utf-8?B?WnhSMnJIQUlieFRCczFhQUhUVnVIU2RQR2NQRDdsVlJVM2J4dFlhQ3ZacVFh?=
 =?utf-8?B?b0FKZ3FqbUYxRmg1aElhRlVwOGFzZEJ4OGlDVHFQQ0pFK2swWmNKYU5xTnp6?=
 =?utf-8?B?aGVGT0duZ0NYVGhrM3FuaHlUSSt5dEpkeitsOHZKUlN1S0VYK05WaDBJWTdl?=
 =?utf-8?B?U2U5SVV1cC9VV25YU200WEdraW1vMmZZRU5qVk9FWnFLNlRsbVN6dGJmUmxK?=
 =?utf-8?B?M3BmblZDUUNzeUd1WFhkcU96b1p3TmtmdmhvbG1RdzBQa2xxeWhHMzloODgr?=
 =?utf-8?Q?bN9HhACHkCbMrf6QADQaGGE=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 579520b1-3cd3-489b-1853-08dd86d591c8
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 04:23:19.3952
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sA3LJffrFmIRYyXj8r9QwfeHWgUxQJfmvVAqZrDDtFQb9Osy2GHyJuByai7n8LEogy+BczLiQJKK1ZA7Ra5VbEGLV7gX3borznMpTQsmAJ//ldJVvJ1GYKm1TvxZzhwR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6104
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDAzMSBTYWx0ZWRfXxr/LtRkGHKJ4 2UdEx0GUWGZl9H2Ru6u3041AnB3KhzXhuyLcG/ek9+gfwueyaU2Trc+VwXqJ8fYb5LLPcpi0iuZ 4uXjJ6+/RHg1naNf5VrU6RymNtXOLSwaQ6mp2krC1h6SrcywF0bJLTbbeBKkVGPDuycgwYrYMPF
 qNcNliaJVBNvGfyw+4MGaY/zu1rMp/3fAJ7xpZuE3B0er59TpYd7VeiRwUdNTLyi9ZRXu1Y3y0e kEmB6uN0YYxjMqnbeamUej/MJyZ1K0f6om4a7rAFVkWm9JUytvAKmR46u7AJ03zx0br0FCbQylp S1o90wZpgvjKaXOL8F9sXxJgTcQl8Pd1AvtESk2O271m1be4RMiVtkcOifJ6seh4K/rmco7sOQp
 aEhexK/TmthagbMrYTnfW6x48p+Otclw7vLeVtAb2xK2L4nNAhV1CPsEN1UU+HbIZcv4D+pd
X-Proofpoint-GUID: LBLzZ31LvB9uKqlly08c_cfdUz448Z_o
X-Proofpoint-ORIG-GUID: SaupzNSI74g2isG4ytRMa5twyhcopdie
X-Authority-Analysis: v=2.4 cv=YJifyQGx c=1 sm=1 tr=0 ts=6810543c cx=c_pps a=TWVVkEr8Ytp/jGYVlMgQuQ==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=iGHA9ds3AAAA:8 a=P-IC7800AAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=OjvIGoHiAn9Uv2E9__YA:9 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=d3PnA9EDa4IxuAV0gXij:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015
 suspectscore=0 mlxlogscore=999 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2504070000 definitions=main-2504290031
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 04:23:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215648

Hi Mathew,

I attempted to reproduce this failure locally on two different servers 
using qemuarm as the machine,
but I was unable to replicate the issue. Additionally, I observed that 
the failing unit test had not been
previously ignored and it was not part of the unit tests I re-enabled 
for execution. Do you think I should
investigate with any additional configurations?

Regards,
Deepesh

On 24-04-2025 15:30, Mathieu Dubois-Briand wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Wed Apr 23, 2025 at 1:26 PM CEST, Deepesh via lists.openembedded.org Varatharajan wrote:
>> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>>
>> Some unit tests were previously marked as ignored due to failures
>> in earlier Rust versions. Following the upgrade to Rust 1.85.1,
>> these tests now pass reliably and have been re-enabled. They have
>> been verified to run successfully on the latest version.
>>
>> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>> ---
> Hi Deepesh,
>
> Thanks for your patch.
>
> I believe we can still see some test failures on the autobuilder:
>
> 2025-04-24 08:28:31,576 - oe-selftest - INFO - rust.RustSelfTestSystemEmulated.test_rust (subunit.RemotedTestCase)
> 2025-04-24 08:28:31,590 - oe-selftest - INFO -  ... FAIL
> ...
> test fs::tests::file_lock_drop ... FAILED
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/42/builds/1422
>
> Can you have a look at this issue please?
>
> Best regards,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

