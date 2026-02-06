Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8754DEB28D6
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 08:19:40 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6893.1770365973473820584
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Feb 2026 00:19:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=I8N4HWDv;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=649769ffa2=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6164o2iv2159382
	for <openembedded-core@lists.openembedded.org>; Fri, 6 Feb 2026 08:19:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=aj4QJlp4Cesy5F8eZd95G9
	HjYczcNL+znCNcZEit5Ug=; b=I8N4HWDvNvM0UJmSYgJn8zrK1s1lQqFy+7aIPh
	DuIAM3bNWeBOn68/FUUBKnqmq26Yv4Wn/8ipFhRMTfo1ld3lUWzgaJAoQe5xklRe
	IpFbogXTpR7CULjsoDAvnYx23yojTd/CVKPdFnNmGmXW1B8Omw17p2S3rphGbHte
	eFl1kfZuKNtJpyj31HJ7+0uMm2c7gnUsmSc41CsFwk8SsTKczQgGbfU5wtP+yebQ
	S1CsIA2N+5ZVPEY1BnmI8xW7hoj3aGHmi9hGwoFbBKfCrDDHmMkkkfi8omQVZMvM
	D1of0CzhWvVLGFI4c84WJrcWz2ceI20fx54D4EWy9WBzaObw==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010005.outbound.protection.outlook.com [52.101.201.5])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c4jdhst98-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 06 Feb 2026 08:19:31 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IOifSCm2oPU7I/FbewE8AO6TJYu22MLfllgjtt5IAmYVnkU6uMX6BWFgZdx0nkNSfiQJkoNr7gsQyV9aDIhw6icvbB8JiXvtM6e65zy2fjOhjGP++FM8t8tpjvFcGJQiBbaJcpLGBMRtfCQZfjS/e/lVU+l3S/I/nH7MZEhj2gOyc1hHZAoQN23Tga26OMsVuJxa0uBZZTbpuegRrqgC2iQujWEw+LnODGRZIzW2fG42ucgdlY1isofaz0dYdJZiLSVrIRuaC/XET0p5xSRmpMhAar0+fRnuoNSNKuQMSOO+Atqe49OXsE2nDzaIY/Gx7QNqgzIzGaoVggtR5IGyvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aj4QJlp4Cesy5F8eZd95G9HjYczcNL+znCNcZEit5Ug=;
 b=HL7r4Gymk7Lq1RWlzSzNqTTH9D6Hzo8ETwTciWhk+eknlWMBFrrhg4gx0HaVxQcCMMm1a0OaunqyTRKcBRH42PWllr6P6M7HWmo4+I90AYhlnB7oQAC5kTJ76t3zzqUy29SK48k3f9sK9ph89d7SD1I/YE5Kl9Oxnlr0GcOgo450C++LAc93J3YxF/KRh3yxOeq1eVAOyntnVfkXr9MUf/9oZSavEFpcsMuRurkJC2wZKEtlWLh8Opk7ZDICecnlihb5kNvZkb4bIoKMbTeoWB4MDJt2pvJObe8PQ8G5UianzvHzwx3FwHAaQ18CdQi8volg2Tg1DchBVW94r1o0KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3228.namprd11.prod.outlook.com (2603:10b6:5:5a::29) by
 IA0PR11MB7403.namprd11.prod.outlook.com (2603:10b6:208:431::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 08:19:29 +0000
Received: from DM6PR11MB3228.namprd11.prod.outlook.com
 ([fe80::9c7:8577:7549:d188]) by DM6PR11MB3228.namprd11.prod.outlook.com
 ([fe80::9c7:8577:7549:d188%3]) with mapi id 15.20.9587.010; Fri, 6 Feb 2026
 08:19:28 +0000
Content-Type: multipart/alternative;
 boundary="------------yu68tuJkDxZHOr2FxU3RfV6g"
Message-ID: <b467cdbc-75d3-4da9-abd6-f5ccdaae4191@windriver.com>
Date: Fri, 6 Feb 2026 13:49:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [scarthgap][PATCH] glibc: stable 2.39 branch updates
To: Yoann Congal <yoann.congal@smile.fr>,
        openembedded-core@lists.openembedded.org
References: <20260125161623.729884-1-peter.marko@siemens.com>
 <554632.1770355472810056681@lists.openembedded.org>
 <DG7OEQVVA24V.11T3BEC402DYS@smile.fr>
Content-Language: en-US
From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
In-Reply-To: <DG7OEQVVA24V.11T3BEC402DYS@smile.fr>
X-ClientProxiedBy: PN3PR01CA0175.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:de::20) To DM6PR11MB3228.namprd11.prod.outlook.com
 (2603:10b6:5:5a::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3228:EE_|IA0PR11MB7403:EE_
X-MS-Office365-Filtering-Correlation-Id: e7b69e37-a603-4c11-9e0e-08de655871ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WG9SMzluSklCaUM5aFFGbk5Sc0hQcEo1azc2VEJIbENRS0RERGNwRC9VYXhL?=
 =?utf-8?B?ZjZrRDlNS0JRZnpmUmJWMFNJYVRyUTdlRmlFQzg0ajhJQlY5T1poSHBvY1Q0?=
 =?utf-8?B?dHpvWW93d0lvcnJ2UDE4U3l0VlV2NUZUeWYrWThIUm9ZVVp0M3FzM0lMSGpK?=
 =?utf-8?B?NTlpa3dscFhSV1NGZnhpRnBJRW1IVzc2bnhnblF0OVd6b0pVdVVraVgrT0pH?=
 =?utf-8?B?WjBlc0RXTndDaVpNYzJDaTlnVzY5NnVJZFhnQkZ5bVlodmtCVFRaTTVZTlBz?=
 =?utf-8?B?d3Z0em1uMzkwUyswM1pDdkxscnJucU43UHBpNUNUaTk1aGpvbnlGUmRxRGM1?=
 =?utf-8?B?cW1SK1g3RlVrWWVNSTFIbnZhOXZ1RHpEQXE0U2pWTW8yUmc1dm9JQ2hQMW1r?=
 =?utf-8?B?dVZqYk0vSEd6TkV0b0lLaHRqRXd2OFNWbHpIV0ZEUTlQSU84cmVrbUhsVGsw?=
 =?utf-8?B?Ykd4RGN0eWd3MVZTZG4yaGtEOFcra2JnckdsR05KSTZhbXowbHVhK2p3ZWlH?=
 =?utf-8?B?ZTNYaEd3NlhHY0NzQy9OeWJzT0lJd1ltcGcvMS9kN3NKVyt6SzQ2UEZBSDhW?=
 =?utf-8?B?OTNkY2t1L3VXTHFHZTNLUy83eW1yQTFuQktIdHRwVzdVVzlMZ0toNGJYWmdI?=
 =?utf-8?B?bmRSd2V3bmRjSGRyTnU3cS9PY0JZMFA4K3JRNTNrOEd0VjVuMks5dmpNbEtF?=
 =?utf-8?B?bWxpMG9kb1dEQzZBaXA0SGtCWFRNb3NqT3BidE9wSlVQem5QYUhJWFNEWGpJ?=
 =?utf-8?B?Q2ErdkpXL2U0R2hWR0FXNStDa00rSWdSUlhKVGVEQ1M3VFZSVVI3UTY4bG1x?=
 =?utf-8?B?YjVINjEwcTBQOTlIUEtTbTFkK1hGazZXdE5tN1ZDMlJPWVBvUDMzTlIzZ056?=
 =?utf-8?B?NzNWSlI1SEs5VkRYK2RiMVpTUFo3Ynlzb2VJT1RlV1M4a3J5d2ZyOFdXbTV3?=
 =?utf-8?B?NWRKWDlZR0M1VzBRbjJHWlNpUlVIU1dFU2RQZVUyNENadUZnQ0J6aVozY1lF?=
 =?utf-8?B?a3hQczVJS2ZvVUZqTXBnRHk4VFZKS2Y0WWxxQUxPeFFFdys4dHNEVU80bkgw?=
 =?utf-8?B?Z1BSdDhQc0t0MjVqWkpVKytCd0ZocktSSUwzQ0Z1eElnd2pMVk1qVDdIdnox?=
 =?utf-8?B?OW5LYkN2alA0THVGV2FienNlR3d0d1VCQXg3NE40eG4vNWpsRDFPTmJhNyto?=
 =?utf-8?B?RTBLdWdaS3EwN09vSlR5UHIrRzY4UzZQblkwY1dUZDlkYW0zbDdZZWNwMmlQ?=
 =?utf-8?B?TWdzaXBjeWlwcXp3aHFZTmhsUy82TzZGRTZqbGdqWGZvT0tuY2FrQjNPak40?=
 =?utf-8?B?SklhcG1oa0dPK1lzNC9QbEhrOFUxWWkxMHFib0NaRlRUemFVRWJ6TVdXTjBX?=
 =?utf-8?B?Q3RPTEU3YXgzcnBiME9MR2JDbGFaM1IvUUJ4VW5DQndWMDZmL3JFMXVLcUFl?=
 =?utf-8?B?bEN0MGRINGJuS3JWY2x6bXVsay9TMlNPcWkvQ1JJaE9LcEhzVXVzZ0NnRDAx?=
 =?utf-8?B?WDJDTk9HeWZLL1JSRFhuRWdSR21qQUFjR0pmLzhXS3dSenAzclRCTE16WGs3?=
 =?utf-8?B?SnZMN1Q1RHZNNEVNVUplbEIvMkdnQ0xKc0FtL3RDOU5pV2R3dU9pVGpFUlF0?=
 =?utf-8?B?bHBsd0dQZi9HVFZPMXpaNXZUZW9YaVFOcVBXSnFON2ZqSjZNY3VFRWd5bFRS?=
 =?utf-8?B?dUM1ekw0WHZBejVtQXhzd3EyQ2pVZFFKdjJaWUJhbVVMVjdScUc5VmJWVlpS?=
 =?utf-8?B?ekhPeGhIOTZYd1pOK2lDSXM0cldRSk5WcGxoNjNTaUtOVzNOZlhYNGdDNklF?=
 =?utf-8?B?SmluUlNSdUUrdEhUSUVRREkwc2cxQlFyaS82TTNXSlFQME1ESFBIVzJ5c2x4?=
 =?utf-8?B?N3VjMWpMMmh4b2tRYlNrWXpMQVN6WXUxaTFOMmFQTVorWFBrQjI3OHJIQ293?=
 =?utf-8?B?aHVMaGFLV21tQ05KdW5JQWxBbkhnRXFkbHBhT3UxdmZjd2M1R1JGTTZRUG9W?=
 =?utf-8?B?UVlDT1FUNDI1dXZkclNXTUZFM1VWejAzSkxoNG9sU2h0Z1h6b1YzY3d5WGJX?=
 =?utf-8?B?V1lCaVZneVlnUUZZTGEwMERiQUIxZ0dXUDNUaklwaThUcldTSWJwT0NoUTBC?=
 =?utf-8?Q?DggPalxeAW4AdhXNRn1lnRKJo?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3228.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NHNQb1JWbWVzNkRnZjBCckcvR0ZCdHJaRklLRTZWQ1ZUV2Fqem9ueU9rVjd0?=
 =?utf-8?B?Rm0wWkZ6YjQ5YlV0Smt3N2hoK21lTlhQY3A5VFR5RlRMWGdxVXlDSHBndGI1?=
 =?utf-8?B?K1ZCQy9JOUxmaWQvQVgxUVlsT3NqT0tXNHpCU21HMG9sK1ZLaUlxTUwxNUQ1?=
 =?utf-8?B?ZVZhQ3FpZzVMa0hvdUxURUQ1MlRCbHh1K2xjWkNzSGF3bCt3T0NrVVRnblk4?=
 =?utf-8?B?RmVteElYM3JWV0RVL0dIQlZtKzBWbk1aZlBYWnZBd1BpTWxJeWxuVnUydGNl?=
 =?utf-8?B?ZzYrS1BLVWJzYkRNZWx0ckVJajFMOFpLTFJndjVSaWJBRjgvMkZBb29ZYTdN?=
 =?utf-8?B?MklHRC8vMFpPV1pySk5mWGFiRk9Ia0RYQjFDZS90VFdRVGdiVGJtZlo3eGZV?=
 =?utf-8?B?REEwZUg4cVJCNkd3NHlsSGppYzdkbGFoWUp5QXJNaG9QWkF6SG1MS2gzdmZn?=
 =?utf-8?B?R3E5Q0xhazNqYUdES0xjaTFJOXd0dkx3SWJOMGRjd21mdTcwWktYNnZJYnlK?=
 =?utf-8?B?Nm1CZGpPTUg1SFZhR3hCWHZHYlgzOGhtV2RpbVhKc012ZkxhZUswRkpXbGFJ?=
 =?utf-8?B?K3NPL0ZSZHVFNHo0TWUxQmJ6dDIyZkI5MEoxaXY0MHZXeko5MkNGb0F4YUpP?=
 =?utf-8?B?N21KZE1EQWdSSWRoNERVWldHaXhWMVVhSHNiSldad1g1ZVRja2xsNWZkLzBi?=
 =?utf-8?B?ZDF6TExLNFY1cDhveVQ4L0JPcVBxM2p0cDNDVkVtRHA2SFFDSUJIN3p2YmUv?=
 =?utf-8?B?bDE0UStoSllmcitIdU15U1JxSWdTMHJZQ2F5VXcyY0VBMUgrU3Y2Q3dyLzZa?=
 =?utf-8?B?Tkx0YkFuT3hNMkFuR1Y3YjIwcDY1N1FCeDNnU3IzbXVuM1NuNXhIN3A4TGw2?=
 =?utf-8?B?RGZFRDB4OVd1M2RMWWF5aGV4NXQ4VnFmc0Q2RXBuaWc3M1JRdHhTc01aeHc5?=
 =?utf-8?B?MGpXUklHOFNocGFvWFlDYU1iZ2N5WUFFUHMwTGRvWTRYc0pQeUpCQ3dMeWYz?=
 =?utf-8?B?YkNFcWFLaWVldnIzeWxXSlNzTU51UFdsZHhzcXFadkdlS21Bb0NNS1BTVUxt?=
 =?utf-8?B?d2NXdVl2OC9hTUtzZlZlWmpyZVlTakQyVkhXaVFoSDROcGxsSk9vR3cwSER4?=
 =?utf-8?B?K0hkcW1qb0g3b0d4ajRxbHZBTWNuVXdINmJOSngvZzRMekluYk9Cc1JjcXdj?=
 =?utf-8?B?bFZzNE14enMzVXpwRnRpTkZFb1g5NTIrVFI2V3ZZRThXbDF3M1AzUTZTZzdx?=
 =?utf-8?B?aDNGRkRMdU12Z3FveVNEUXRDWk14citYQVp3MzY2YVVoaGR6TkgvRnlBWmxu?=
 =?utf-8?B?Wkd3aWpFem55OUlWZmxrQlQxNnNoaWhibmkwMlp6c21lYlJRMkNlb2NXandV?=
 =?utf-8?B?Y2hEb001QzVyWDZGN0lpeUhwZk1BWUpvVmhYdFlFM1VxSTVzSWhFbGNxOUoy?=
 =?utf-8?B?enBxU0dSYU9CKzhmMlNya3l1ck8vSS82ck52dGRzNzdpbFNzVXIrMUF3Nitx?=
 =?utf-8?B?M2NLRGw0SFZaS3Q5YldkTjlISzZGaFRQRk9waC8vSzRzSjlLNE9qdUZvUldF?=
 =?utf-8?B?YjhndkJ4ejVaU1ZQRytXNnBhcUtXVzJaYXVtUGRac0dXNmtYMmhTWTBMZXkr?=
 =?utf-8?B?WnprTmlLVGZaNXArRWFQSlBrVUVGekI4MjdpUGNiL09LUXcwTnNyRUxSZlVX?=
 =?utf-8?B?bTQyNXZzZzJVclZsU2NyOGhrL29ybGZ5RFAwY3RiR3BJbCtmcVp2akRjbkdt?=
 =?utf-8?B?NURsWHZINFNKUHJSSVVXdnp1dTZDcW0zVGwzWFFuaERXeHBBL0NZNEdPVHgr?=
 =?utf-8?B?YU9Yd3hlSVlQN1ZiWXMwSStXbzNNWm5uM1ZRREVmQnB3dzVSMTdIaU43UUNV?=
 =?utf-8?B?MU1sZU53VzVtUlNMMzhEWlJZRGhzTjh0MzNWUE9oNXVEQS96Z01UVkpic0d3?=
 =?utf-8?B?QjExb09ERmpmeGJmekJ5bm1rdjRoN2FTZFJ5V1pUdUM1SHRLSlE3c2I3MzU0?=
 =?utf-8?B?TFp4QXlEb0lyeTRFdVNWQVNmZHVCekFaTVoxQkhzbVViUFcvRGJiWmkvblBR?=
 =?utf-8?B?ZFd6ZGU0ZkM2MUs1OFJGQ0laeFhlSmEyMElMQ1U4VFFJUzFEcWNBbUhRYUVH?=
 =?utf-8?B?NWxJbDFkNmVVeHRFUHJIV0VvYzgxRzNjTW13RldxVC9RNUN6aHFEdXZTTGd0?=
 =?utf-8?B?Z05KdWg4OVhWdkRYRURwbEFIeTVzcDZNTW9qQ1Fnalp1dDJkemgrQ1JjN1k3?=
 =?utf-8?B?QkVTVWdKYnR0TG9TajZHOGNndHpURWFRa21nSTd2RkswMzF0elRsZzFuMHVH?=
 =?utf-8?B?WlZ3TlFWMXAyQWdPYm5ReTRWMVQ4N0NkU3pSR1YwUDhZbERyeFJrS1JQRUE3?=
 =?utf-8?Q?LkliUEuatXccWCh0=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7b69e37-a603-4c11-9e0e-08de655871ff
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3228.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 08:19:28.4493
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5CeIgarKo0qGpU+Kaxez1BN2BO9rPCkHoAWbz9k926SFT2cW22QgDRzmaQU6U4S+FgACol5leUpRvkJfFzVtaMG4nAM2aqCWygBqcEFCFUM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7403
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: 4DFxOoplloaeKlALHEGGh-cDuHghTN_M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDA1MyBTYWx0ZWRfXze7s3/YOrtn5
 XW78GNBTPoy6rE1Yn7lnJk0/tG931pAaK9Rhg0MQFy1JbPwTPbO98SfFb0tKLNrdP5xgWMtQdVn
 VGyff671ILB2AZon5WsFi9jaHlwf1WTBnGolIcGGqzu8lDOdCeSiinG0AYA3iOEvwpC0zZi30ZF
 kPxhM4dRIGFIkW+yKQKGPHGmIFYtEIXoNgeNkV8w60AtnbCIBLOVxDEpq4HRDfr2Dqsm5XTV9n3
 6tZNN2Szg0wEIBOR6ZOcCbnyG1tVsvUgsfrN4GllGavnNxUs6esjZ4PZ80oTEn1xiL0Kk92M4pa
 wm1KuNPQVtCRaUntkD8UPMeYt62zn7PgLRfI5rnJSTucpf6qFCzmGkGQFCbgWBzS+M8+Fcjp/F2
 5lzIz5heaSXskjlCKwePPsgWMrsgIpVYto1Ag77eQhT4qgoVSHkM3LxaV6maKkr6/8jTyKdEdD9
 Ah3zG4KMndvHqWvXU4g==
X-Proofpoint-GUID: 9ukEtsbP6IglQzlTGzy0lOZxnxbD1ubu
X-Authority-Analysis: v=2.4 cv=TsDrRTXh c=1 sm=1 tr=0 ts=6985a414 cx=c_pps
 a=q0do3moUNMjvKVsQ3EtoVg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=1NWNoF9oAAAA:8
 a=Q4-j1AaZAAAA:8 a=wNV9t37Ywbe2xMMxI1gA:9 a=QEXdDO2ut3YA:10
 a=wvPkM9v7g1_ikmSEda4A:9 a=grB-EQh0kq1tDxqA:21 a=_W_S_7VecoQA:10
 a=97APRTa-CG6DvPMFVxHL:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_02,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602060053
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 08:19:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230598

--------------yu68tuJkDxZHOr2FxU3RfV6g
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 06-02-2026 12:17 pm, Yoann Congal wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> Hello,
>
> On Fri Feb 6, 2026 at 6:24 AM CET, Hemanth.KumarMD via lists.openembedded.org wrote:
>> Hello Peter,
> (Yoann here)
>
>> We sometimes see regressions in glibc test runs depending on the local
>> environment. In such cases, it can help to re-trigger the tests to
>> check whether the failures are consistently reproducible. It may also
>> be useful to cross-check the results with autobuilder runs, which
>> generally provide a more stable baseline before concluding on
>> regressions.
> I'm willing to test this on the autobuilder. But I never done that...
> Any pointer? Where do I get the nice test report with the comparison to
> the previous version?

Hello Yoann,

You can trigger a *qemux86-64-tc* build with this patch applied. Once 
the build completes, the corresponding results link will be available in 
the published artifacts.

example: 
https://valkyrie.yocto.io/pub/non-release/20260206-8/testresults/qemux86-64-tc/

The *qemux86-64-tc* build artifacts include the |test-results.json| 
file. You can compare this against any recent successful *qemux86-64-tc* 
autobuilder run as the baseline.

Hope this helps.

Thanks, Hemanth

>
> Thanks!
> --
> Yoann Congal
> Smile ECS
>
-- 
Regards,
Hemanth Kumar M D

--------------yu68tuJkDxZHOr2FxU3RfV6g
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 06-02-2026 12:17 pm, Yoann Congal
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:DG7OEQVVA24V.11T3BEC402DYS@smile.fr">
      <pre wrap="" class="moz-quote-pre">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

Hello,

On Fri Feb 6, 2026 at 6:24 AM CET, Hemanth.KumarMD via lists.openembedded.org wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Hello Peter,
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
(Yoann here)

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">We sometimes see regressions in glibc test runs depending on the local
environment. In such cases, it can help to re-trigger the tests to
check whether the failures are consistently reproducible. It may also
be useful to cross-check the results with autobuilder runs, which
generally provide a more stable baseline before concluding on
regressions.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I'm willing to test this on the autobuilder. But I never done that...
Any pointer? Where do I get the nice test report with the comparison to
the previous version?</pre>
    </blockquote>
    <br>
    <pre wrap="" class="moz-quote-pre"><span data-teams="true"><p>Hello Yoann,</p><p>You can trigger a <strong>qemux86-64-tc</strong> build with this patch applied. Once the build completes, 
the corresponding results link will be available in the published artifacts.</p><p>example: <a href="https://valkyrie.yocto.io/pub/non-release/20260206-8/testresults/qemux86-64-tc/" rel="noreferrer noopener" title="https://valkyrie.yocto.io/pub/non-release/20260206-8/testresults/qemux86-64-tc/" target="_blank" class="moz-txt-link-freetext">https://valkyrie.yocto.io/pub/non-release/20260206-8/testresults/qemux86-64-tc/</a></p><p><span data-teams="true"><span><span style="font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, system-ui, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Web&quot;, sans-serif; font-size: 14px; white-space: pre-wrap;"></span></span></span>The <strong>qemux86-64-tc</strong> build artifacts include the <code>test-results.json</code> file. You can compare this
against any recent successful <strong>qemux86-64-tc</strong> autobuilder run as the baseline.</p><p>Hope this helps.</p></span></pre>
    <pre wrap="" class="moz-quote-pre"><span data-teams="true"><p>Thanks,
Hemanth</p></span></pre>
    <blockquote type="cite" cite="mid:DG7OEQVVA24V.11T3BEC402DYS@smile.fr">
      <pre wrap="" class="moz-quote-pre">

Thanks!
--
Yoann Congal
Smile ECS

</pre>
    </blockquote>
    <pre class="moz-signature" cols="72">-- 
Regards,
Hemanth Kumar M D</pre>
  </body>
</html>

--------------yu68tuJkDxZHOr2FxU3RfV6g--

