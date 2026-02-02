Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19ABBE7DEF7
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 15:38:29 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.55784.1770046705286977128
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Feb 2026 07:38:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=nOUC1xsN;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6493c9f9b1=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6125Z1Np2849800
	for <openembedded-core@lists.openembedded.org>; Mon, 2 Feb 2026 07:38:24 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=x6c5JmsbzilnMuG/AESJ5hfkEDtsFHVyO7t+LRjuKgU=; b=
	nOUC1xsNmWmPB8sH1ea2hD48BDUs8I76PgfZfqmWUf/EfaEL8gjPBW5sPBXxydq9
	DqhBRZNe1DEMLYUU46B6t6JpT3BzCrQ1dZ9R8qKR+SUwrcKTuvnmbJeAPRyuyD9m
	CwxrEV3DMHjTeQuaLFC5Oiz7NvyDf/PlGPQsiAr7TU8dQ0a5oyWRC/nJ4ysMIlzw
	XoyBj2IK7+84Ld4Hoqxm5dzmlatbXeU+NP/TXkBUeDZb4vB/5270XI0+ICHHCfXa
	HvsFHDbqMx6piDdzyjcSFrB+6H79IIAVkihEQ9SZJgsxTM/U26Vggs54MLGKpJek
	dVG0b7fI1t9+830oOG42Tg==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012027.outbound.protection.outlook.com [40.107.209.27])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c1dw0syy2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 02 Feb 2026 07:38:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gjodR+y8yivvpoYBbbiKJODKetUyFB6wFQQfSlNdSua9oZagVZPuqxjdcWPUer3bfmQuFqIBBnz+aXtdNO+KQWEwVOMtYRw0gxScQeVBv8guzEuqqZcgW79Cd98VscR31a+nDwoWQQIkoW/7EDjguvBWf06dO46bgD7643zw+r21pA9Ms3wG4YcQMGp4Ozs2ODPIW686VCfauuoo/D11/OKDiJ1CMlSsVg5nZV7Pnvh5lcjd6lam2+Y0caBN4hsPczRRHQyD88AHHwz9jJPq1N6Cihijiscngc09QwaWhd4DOp0iIQ6xCWgx3UCPhQe8Ae58NzCo+ddAlWugCB4+ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x6c5JmsbzilnMuG/AESJ5hfkEDtsFHVyO7t+LRjuKgU=;
 b=iopCVF/L/M74a0Nm3Rw/wn3aiBr29r6Hy3dZ/cR3RSVR5GgWoDfPnuWRB9feaAm2n0LLXhR7/5iRvELs362pxAqg5iEDz174IW2U5VZLI3rNDnbj+Ecc+7nMWDAzBlR6yFb6eWvsXb0+Rcp1pqAYZw9Yi1PQbtouYZa7lrsPYodqqZ+sEBiyUck9UnoJvSUDraZj3JPX/mFowkPvgI9qX8Q9q8vkcGFi3UdJEqXjt6TDiGxIaAEL0QnMu8Dun30ZJ8GQ6VGFqk6ToaVywKUYvZNr2FLdlnKeBXCFQSCjCQeEEXBkE7U6jY78Qdf8/0DyT9Sg56gur4mz5HVE64Gn7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by SJ1PR11MB6156.namprd11.prod.outlook.com (2603:10b6:a03:45d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 15:38:21 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 15:38:21 +0000
Message-ID: <f65f886b-a879-44a0-adfc-d556d728bea2@windriver.com>
Date: Mon, 2 Feb 2026 21:08:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] rust: Upgrade 1.92.0 -> 1.93.0
To: mathieu.dubois-briand@bootlin.com, Hemanth.KumarMD@windriver.com,
        openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
References: <20260130134137.2463745-1-Hemanth.KumarMD@windriver.com>
 <DG3GN4VGMAU4.OOYLJKHV2X2B@bootlin.com>
Content-Language: en-US
From: Harish Sadineni <Harish.Sadineni@windriver.com>
In-Reply-To: <DG3GN4VGMAU4.OOYLJKHV2X2B@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0010.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::19) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|SJ1PR11MB6156:EE_
X-MS-Office365-Filtering-Correlation-Id: 713d9b75-8278-4524-6a20-08de6271185a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|4022899009|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cXFHZjlsSnlQcTBKMjBldDlyM1dxblZMMkFWY0dzNzBlZXo0dDhjWStzZjEr?=
 =?utf-8?B?ZHFmUUlqUHN2SW1iQUg4RDNZekhqSDI0ZkV1STY5L3JLblpENXhmTGdYd09m?=
 =?utf-8?B?OURvNzZmUi9JSmpDV09aZmNEOC96WStkbDlvRjEvc0V2V0lLZXQvVWQ0ZkNx?=
 =?utf-8?B?WDJNNU41OThjblk0UUE3RDZrZVpIVEU3NHR2M2dkc1hURWdjS3RHZ3JYNnpM?=
 =?utf-8?B?V0JNLzFsdG5aUUw0cmFBZkkwMkZOV1FTT3l6bmNDdXlaM0lnSVZRdTEydm83?=
 =?utf-8?B?T1VpR2k1dXdlM1NQejd1ZmlwamIwNjR4VzZkVE1aNVdWSnp4STVLS1dTdmFX?=
 =?utf-8?B?dnhmak1WQkpJMHlOM3B4Nm1wTXp6WlorUXpsNGZIcHBkRU5nY1pDOVFpZ0dJ?=
 =?utf-8?B?Zld5T2U0cDdMR2oxbHloOU1TRFJsSzFXdU9RN0VpWnVRNVVWQUFudm96ZlZX?=
 =?utf-8?B?SXlCVTBZdk5FNU5nRHNjZW9YeHcvYzA1bjZZckVsc2YzZkVKZE5uYi9VdUdi?=
 =?utf-8?B?di9uYlZaN0E5cUxiU09zZTNxYTVnaWJodjU2V0FYQitibVNaSTBFaTA5ZTl5?=
 =?utf-8?B?THJPYVlSWUk5VlNJeVJTVnNpS2VpdHNCVmxNMVQxZXZJK0F6QmthVlMvUDh4?=
 =?utf-8?B?OS9GNFExSkZuRE5oaWVoMFNCNGtNMDNkVkdrUzZEd1FtMklOVTl3WlRVOHlL?=
 =?utf-8?B?TE1WVTNiRXB0WWR4TGlMVlI4SkFaOFJEeEdBMnZvRWdGeDBrZWIrUXd3UGxN?=
 =?utf-8?B?WEVBeXNzNkpVUWJMQTZ2TS8wY2R6SVZBMW1HUnFESDkzOVYrQmlWdXkzcnZX?=
 =?utf-8?B?RS9XU3F2bmViakxYSTJPTzhhcmxPQi91ZGN2a1VFUFd5Z2hiRTRvNkFISnpM?=
 =?utf-8?B?QUVybVVzQUVhNUs5VG1FbmU3Qk45U0I0NDJCdVI3emJtY1ZlbDdwTWUwZFB0?=
 =?utf-8?B?RnEvMDRQVXhjZTE3MXpvRXhxSTVlNkxJZVFjdEVoaERvdXl1YTdtalhIZDFO?=
 =?utf-8?B?dCtsMHpxSjg4UVVMNTdiRitNRlpORmpOZG9Sd1h5Mno5MzNqaXU0OFB3cGhj?=
 =?utf-8?B?dUlZMVFENnhPZjdyQlVzMVI1ZkhXdTNtQ3RGNFZmNXBOMFIvZkxRcVRsR2xs?=
 =?utf-8?B?RzJPODRVZnQ5djh4Y0FIK2orUS9JV0dISFN6N2dpbVVyMHNoU3NPMXRYcVRa?=
 =?utf-8?B?TitpUlF6Rncyc2dXbWlEdmZIYWtCQS81akxka09sQ0FzSEJCS1N1T01CS1ZR?=
 =?utf-8?B?SXJuZDUwMjg5SElOQnhmSnp0YjVEZmhIL1Zidy9JakJBNm9QdURCM1VqOW5x?=
 =?utf-8?B?RmkxLzVJS3c4djBFbVJYZE1kR0RtY2d6Z29JWWJ2dTJFcGhkWGlEY1pRMHc3?=
 =?utf-8?B?SEtiZi82dWJwemdnYkhYZ25xOHFtWTh6dFNENFZBN3RZaEx6c0xyM1J0S3dW?=
 =?utf-8?B?SWVXS1E0NGUwNHlsRGFtU0o1bG0ycUVMRDBFUEwyZG5XcERxR0F6UzRVNnVP?=
 =?utf-8?B?UmlmRXdrMjJRVUlrNmxmYVY3ZzU2UnlGaC9EcVY5YlZmL1FMK1NlTzRLRy9a?=
 =?utf-8?B?RGVCZXE1dkNtV3hUd2hLVk01akhVR1Q0UGRDMVdUZnNNdGhYdFRWQzJFVkpj?=
 =?utf-8?B?ckxqZG0zREFUaktyTEdON3BRT0VWYTVucXJLTStSakhvRVplWTZmNmVmcmdM?=
 =?utf-8?B?S3hYcitsVlA4RllRZ1RTME04WlBsR1RxbDB1cnR3NGRMenBrZWtCbGRhWUds?=
 =?utf-8?B?eVAvY2p2R1pVdVZqbnphbDllM1BZNzBIbTkzV0lQSlJiNEszRzNpY0pqbmcw?=
 =?utf-8?B?anZ2WGM5NjEzenRkcEQ4RmFRVEJsVDRzekxOdi94OGxjNC9peCtZNjRiTXY4?=
 =?utf-8?B?TnYxNzRyUmVqMmFSNzI5RWVJUEdVc0w3OFJQemlsTXJHc01FejZGZWdUbVBo?=
 =?utf-8?B?WkZRZ1YzZk11L25FZkVwejd6VTFJSllmS1FKcEI4a0FuYjMreEoveUVYYkZW?=
 =?utf-8?B?R3ArZlBxbG5OcTVaZVBxNGgwanRRT0pjQUJWdlp5bUE1SjdyaWh3RXJoWml4?=
 =?utf-8?B?UzZCSVNKNEJ2SUIxVjZldFR6a3c0WmFseDVsaE1jSFZSL1JBb2hEZHpNVVpV?=
 =?utf-8?Q?F+TwUbnvRFVlHldfTQFk8tpnU?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(4022899009)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YmhIWVl5S3lxZlhSdU9FSTZ3ZGxRbkErZTdTaWI1RzBmS3c3TnVGMFAvVDFF?=
 =?utf-8?B?a0xQcjgzeE41cnV2THZidjc0VlFvcUV0YnNJWVlpenhiNU9rUmZZenRONklj?=
 =?utf-8?B?MnFBSU51ZHVBdzI2bEdjTVlyVitHRFBtUGVSbTJma0ZHR2dOWFpPU1lKVVhj?=
 =?utf-8?B?Mmt0S1lxQU1qdFBiU05Xb09GOWptMlpvclUxSENOWmEzdzZrcTFhdVpxMkR1?=
 =?utf-8?B?TWIycWxtY3AvSUE5dkNCa0tZcE1paG9HeTNhS21yZkNucmYveGNURmRHRW9J?=
 =?utf-8?B?akViTHhLSFBldzNPVVcyVkw1SktUbm5MdHp3NFBRSDV6eDFrMUNLUk53Z09a?=
 =?utf-8?B?OWpNek1ad0I5eFAzTkhHT3E1SEdJNWlsQ0ZnMGdMb0FjVmlIMVp3UXk1YUZQ?=
 =?utf-8?B?bTZSMXBJb2x1UkszYWlkTmVKRi9kdG53QWh2Yy84QjFBUE1weU5kSEVWZWxa?=
 =?utf-8?B?bkdUWXQ0ak5XTE1ybTJhYkJsMUkrRjZlSW9NTmtlaERJNDJ1b1dyTjE3WTY5?=
 =?utf-8?B?SFdqNlA4SXdJVGt1MktUM0F3OXlkN2RPQkRqdUhOSklvNWxKT2RXdzVKN293?=
 =?utf-8?B?ZnhUS0JJeHBWV2t3MVZoZzJPQVAwQ3ZIaDRuMjY3V1FwWElzU3Nic1I2dUhv?=
 =?utf-8?B?WkNvQkRUQkZyMjRQUzBrNFl2RnB5dktaWEVOcFZNNmV4RDYyMm1EQVdsYmJj?=
 =?utf-8?B?Qm1OMFFwbjNoZWo2THU3STlRQzEybWdvZTNyQ3hIM2JlUkdrcjJpc21iK2JX?=
 =?utf-8?B?TS9zMnBreXAwMER4c0c2RHZtdUhlek12SjRmeTllekpwNUF0ZzcwSFFIQkhx?=
 =?utf-8?B?Y2hqZE1EcjJxUjJpZ3Y4V2NZQXI5Q3hmV01KRTl3a3hoQldDRzhXcDZaTTlK?=
 =?utf-8?B?dHlQWnhib05tMW1ob096dTZub2NYZmErUjNmQ0JkVWR5dnROWnBrTUFQeVBM?=
 =?utf-8?B?VG51NXBpNjdWZ2NqWFRlWEhNMVo5c21rWXNFMk53YUx3SGdXSUovOFBqbyty?=
 =?utf-8?B?NEhnVkpXYlUvUDlEZ3RidC9CTkhpbEVKUmZkMEl1bldIRkt3MjZTREgxcWNP?=
 =?utf-8?B?ZTFESXlOS0swMWdIUyt1QWZNUXhmOXUvdlNpdWV2R0x6NFB0aSsvMmI4bzZj?=
 =?utf-8?B?YzV1a3ZTRzVzbDlyWjFvQS9RNlV5b1pLbzgreG44d0xkcXNldCt2ckRWT0sz?=
 =?utf-8?B?WVN0OWhKZG0vZzlGMUVWQ21kdVhZUVh4Q3k2a0JCZjMxd0V5ek9Fd3RSRWdQ?=
 =?utf-8?B?eHhPMzd4U29STnAwckovRHpJelBET0NaYzNXeFdEVFRYb3ZoUFhXaXBLM3cx?=
 =?utf-8?B?dEJvZzdoazVzUjJxaUVrMVNFakIxYmFnZkwrMFI0WmREa0tpS25lRU4vZ2tO?=
 =?utf-8?B?bUJDTS9rUFQ1VGl2NlJlR0cySmNML0w1VUh4OGkyb25RUjFiUVdveXgvSVdV?=
 =?utf-8?B?dVRjMVp5dXJNeTNJZU96V21yNVlQRTluNVhGb1U1OGtSNnZ0ZjFoYlpTdHpH?=
 =?utf-8?B?YXVRZkd3Qm4yYkdGTGpqNzJOREE0V2NhRzZXV3dqajBpUVVIU0ZndndTejRs?=
 =?utf-8?B?ME8vQVVIZm1PTnliYUdVYUJPVWFaWU81dDF6TnhQUzZGYWhCQ0g3VzgwbG1F?=
 =?utf-8?B?TzVHVEFEMlpxakw2elpnK2NtaG1mTmJGcW1kRGFnajFtclB5L2hFSDdlaE1Y?=
 =?utf-8?B?STErNlEvRjhQdXB2ZkQ3VkVQTDBxdUljSGM3US8zNzZoN3JaMFZydHJoTmN0?=
 =?utf-8?B?bWxkcnVRdEcrYW9yLy91cTJyZllmelI0UnRsYzZWMW1Ob09aUmZPQWdUK1Ax?=
 =?utf-8?B?SlVQdEE0dWdwSlJweVZCRGxhbVRSNkZDR0NESDlMR3QyZ2t3OHI2T2pkYjlO?=
 =?utf-8?B?MkFySkhvNldTTG91MFhoa2lKWHNEbmxVOFJHMnJPRkFuU2VlMThNUFR2ODBN?=
 =?utf-8?B?U1dHd0lWQzZBOXBMYUNocDRBVWdFZFdDQVdwK3VPalhlOER0bEtITkozRlcz?=
 =?utf-8?B?dEhEUHJOTjFKQ0E3RkxMajcwby9Kb0hEbzBDUlVhZ3VNd0hVdlRHRSs4cFpw?=
 =?utf-8?B?YjJvRTBwdEdmOTZjTjYzMStWMXA3K09iYnd6Qng4M09BR3hENTQ0Qm02UmJO?=
 =?utf-8?B?eVBlSisvc0pSV1FidzJSSCsrVHhMakFKdmZmVWQ2SmxIcXlKUC82WmpMOWl5?=
 =?utf-8?B?MlJQeHRwd0JLL1VpblBXM2VRSThKSVFaUGYxOE53MjFrSkp4ZEpmSCtCYjh6?=
 =?utf-8?B?ZXpOc3laejM4ZHc4aWRNVzN4eStQVVZ0eWFiak1sQkoxblJqSDQyTGorcnlS?=
 =?utf-8?B?Y3IxYmw0MGhWYnE2VlhxNTN5eHJOaXByRnNKVG5ic3BHK0xwUEtocENpVExS?=
 =?utf-8?Q?RSMGnhEYBDI9ugi4=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 713d9b75-8278-4524-6a20-08de6271185a
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 15:38:21.6366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Usvu8Y8sfngHLc/IgfZzb2SsGR5VGE5n887+qfVTBoUjOlKrJGOhbhcUdy77dvWyuIgDEqyrD9vVSMZo3iGl02CwDADkrsQ7KK3hipq2MY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6156
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: nHrBnT4vOUWXT8XR2BVRBidLA7eJX2Br
X-Proofpoint-ORIG-GUID: 7VoPVSN0Z4LR5fpUteqdsMbZXfrvN6Z6
X-Authority-Analysis: v=2.4 cv=Htd72kTS c=1 sm=1 tr=0 ts=6980c4f0 cx=c_pps
 a=HiuaN0cSM6iMs60el9to+g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=ei4SEBeUAAAA:8 a=NEAV23lmAAAA:8 a=iGHA9ds3AAAA:8
 a=P-IC7800AAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=aXE9ayZBYitGuVysazsA:9
 a=QEXdDO2ut3YA:10 a=ocp33sKsEv4A:10 a=8zIOOLb7Ym0NljyPXbuS:22
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=d3PnA9EDa4IxuAV0gXij:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDEyMiBTYWx0ZWRfX+4sAeaE5Ekkj
 uzv0WJcVdyoNrXNLbsxY8z9X9TLb8irCfWu9+Kzz+cURPX8q4WVg5DF2CClJdZjDwfWbihRjfFh
 8Xu9Nx7w9bxSUgGGxOmo5qeIAc+tZnuv6vai9Yyp7gn3+nPUfny9nL4d3IOrIVXcRz5W2E469+h
 zaehlw/q0RgPWuVxYhBGCFPwaaTIsOnSVY3mTpOFTAY/F19+uHEz6Y+Qf1+dmqTvwIrh+2rWGN7
 eaxkBsIPBPexH/CiwG66fsFg/WK7EgXEm5Cm0PK+tv+g5tJ+QRMsQ9bP4UwpEw5mA7BgZx6mQ5J
 mgtB7+13OP6B03s2sp6Yl74paoKCPV1Ci3cyQXLQG+KQTd0mtyC8cMWzyIckx/o3adCI92K3N4R
 7OZLD+DTRKbaYMkn+yz3aEuVKN27WsXwcthmHkyewmJH47Djrivxepuzm5H5DxJLOBPnWeGjvwP
 V1Ww47dbs2YZY4IKN+w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_04,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020122
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Feb 2026 15:38:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230374


On 2/1/2026 1:21 PM, Mathieu Dubois-Briand via lists.openembedded.org wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Fri Jan 30, 2026 at 2:41 PM CET, Hemanth.KumarMD via lists.openembedded.org wrote:
>> From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
>>
>> https://blog.rust-lang.org/2026/01/22/Rust-1.93.0/
>> Rust changes: https://github.com/rust-lang/rust/releases/tag/1.93.0
>> Cargo changes: https://doc.rust-lang.org/nightly/cargo/CHANGELOG.html#cargo-193-2026-01-22
>>
>> * rust-oe-selftest.patch updated for 1.93:
>>    Renamed UI test directive from add-core-stubs to add-minicore as in
>>    https://github.com/rust-lang/rust/commit/3796f7de57f5d4cf4325d1f13aeb07fdaa57983b
>>
>> * OE-selftests:
>>    - Exclude src/tools/remote-test-client from test suite.
>>      This unit test modifies the TEST_DEVICE_ADDR environment variable,
>>      which breaks the OE test harness that uses the same variable for
>>      QEMU remote testing. Filed a bug with upstream:
>>      https://github.com/rust-lang/rust/issues/151823
>>
>>    - Enable +v8a feature for cortexa57.
>>      Rust 1.93.0 added a regression test (PR #149549) to verify that the
>>      ARMv8-A system register ttbr0_el2 is recognized in inline assembly.
>>      This addresses issue #97724 where LLVM wasn't recognizing ttbr0_el2
>>      as a valid register. Upstream Rust enables +v8a by default for all
>>      AArch64 targets (PR #105026), but Yocto's custom target specification
>>      doesn't inherit this. Adding +v8a ensures LLVM recognizes ARMv8-A
>>      system registers, fixing the test failure.
>>
>>      Related upstream links:
>>      - PR #149549: https://github.com/rust-lang/rust/pull/149549
>>      - Issue #97724: https://github.com/rust-lang/rust/issues/97724
>>      - PR #105026: https://github.com/rust-lang/rust/pull/105026
>>
>> Test results:
>>
>> rust v1.93.0
>> +-------------+--------+---------+
>> | Machine     | Passed | Skipped |
>> +-------------+--------+---------+
>> | qemux86-64  | 21,689 |   646   |
>> | qemux86     | 21,439 |   896   |
>> | qemuarm64   | 21,495 |   840   |
>> | qemuarm     | 21,421 |   914   |
>> | qemuriscv64 | 21,466 |   869   |
>> +-------------+--------+---------+
>>
>> Test results difference (1.93.0 - 1.92.0):
>>
>> +-------------+--------+---------+
>> | Machine     | Passed | Skipped |
>> +-------------+--------+---------+
>> | qemux86-64  |  +205  |   +33   |
>> | qemux86     |  +205  |   +33   |
>> | qemuarm64   |  +206  |   +32   |
>> | qemuarm     |  +205  |   +33   |
>> | qemuriscv64 |  +205  |   +33   |
>> +-------------+--------+---------+
>>
>> Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
>> ---
> Hi Hemanth,
>
> Thanks for the upgrade.
>
> I suspect this is responsible of the
> runtime_test.RustKernel.test_kernel_rust_sample selftest failure:
>
> 2026-01-31 16:20:41,991 - oe-selftest - INFO - runtime_test.RustKernel.test_kernel_rust_sample (subunit.RemotedTestCase)
> 2026-01-31 16:20:41,994 - oe-selftest - INFO -  ... FAIL
> ...
> ERROR: linux-yocto-6.16.11+git-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-766138/tmp/work/qemux86_64-poky-linux/linux-yocto/6.16.11+git/temp/run.do_compile.189616' failed with exit code 1
> ...
> | error: unknown unstable option: `no-jump-tables`
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3127
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3022
>
> Can you have a look at what is going wrong here?
Hi Mathieu,

This issue was already identified in upstream when building linux Kernel 
with rust-1.93.0, They have taken fix to linux kernel v6.18/master.
But it is not present in linux kernel v6.16:
https://github.com/torvalds/linux/commit/789521b4717fd6bd85164ba5c131f621a79c9736

To address this, I will submit a backport of the upstream change to 
linux-yocto v6.16/standard/base.

Thanks,
Harish
>
> Thanks,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#230253): https://lists.openembedded.org/g/openembedded-core/message/230253
> Mute This Topic: https://lists.openembedded.org/mt/117544255/8054390
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [Harish.Sadineni@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

