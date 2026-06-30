Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 579C0C43602
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 06:38:50 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15559.1782801523615593276
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 23:38:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=iCIan2jy;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1641d3c438=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U5hEmf271304
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 06:38:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=sl6NHYJpZoxH1od2xI8/hOTuQtYj4eG4KI2E/peOy7k=; b=
	iCIan2jy4rkF12Z2OWefQwcv5ha1tIDwHJp3hwkD9W+CaAzFQbiUdFB8TpdpXatE
	iZxRho2x5eDK0YzE89dJNk2dzvC7yxRdQ7UxpM+xyZaCVqnzovgSVTB4Ow09BYyz
	fHYUAjhuUfvP8mgfzDUvol35MKIHgaNLQ4IPLy6UH5qHpl4W0rTYQe1HMVXEp8Gk
	l0EWbpNlrdh+2YgDy1uSxSGk8fpbO+taZbQC+gfwlkDMbGJDftlN2LkILf8/OLMl
	X13Z6cfJUUHQz9zDF6qOKjb2f4oxmyO8IPP2vhprrO9ujPBXo/srRHQP7OTKyVRW
	1pUuRmBVQ+90BVMH4fP7KQ==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013046.outbound.protection.outlook.com [40.93.201.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4f25g5keb0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 30 Jun 2026 06:38:41 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rGaFCF7db2TncnORH5VGTfNXReiSig0RVHNLOwTiI9mu2POiB6QJBZLjT3OJ5QPtYVlAzy7LMbCqzDkctd9wy1qIq9tsX04+CmcL3I+NtojOa+0FWWxo1DWVbY9JPMo6W7VtHb+TjTXt/JXaeqQ2DBGca3q4dUIDt+1wozNXvOfuZSwrS5QtjcPW3x6Dg7FHpiwos5WTl1h+MPySPsIFSyQyr8QthxnGdB6Y2tpmR88l5BmV5n0DsBXcfEir7G0x9qziffzfm/Vj2t6DK9FgGYZQMonxtN9vRZWfAaACFSI/rU1lTaYpJOAD3JLSzOeQ6Uk4dYVVCx74zwRmdxYR/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sl6NHYJpZoxH1od2xI8/hOTuQtYj4eG4KI2E/peOy7k=;
 b=WXU3txsq3A7ENFFYwj919m3hQ/30+fRd38ozdKNDMCKquX3cPWCW4hrdQmIt8TLzPAG/jYf0b0ViF2pa9IcXdnMMQ8YE3lVaPbOSF49c4I7hb/aIa0k557BfZXGUjbdLkHi9C5DPxxrKSh4sVlvaEvfj/NMyykZs/PCvA5JCCGzOuZcgzXCfw2m5bQs6p0MbUQg9CXfzvWzBVwAs/Y2Lg1F/21Cm99hMj4tGKFI/TNuxfHR6Ls03CR5y72VCLvjL0KTU/oVmgfWgLgqpCTnTJv6EN8ZadMXeFM1N9/aEUawIPk3sGhUZItjJNiCFcdMN00755r4oF9pWZYnQLjq/0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 SA1PR11MB8812.namprd11.prod.outlook.com (2603:10b6:806:469::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.19; Tue, 30 Jun 2026 06:38:39 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%3]) with mapi id 15.21.0181.008; Tue, 30 Jun 2026
 06:38:39 +0000
Message-ID: <57455a9e-a4b0-4f15-abb6-6f77712cc385@windriver.com>
Date: Tue, 30 Jun 2026 12:08:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2] sanity.bbclass: warn on cargo config files
 outside the build tree
To: =?UTF-8?Q?Martin_Hundeb=C3=B8ll?= <martin@geanix.com>,
        openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com
References: <20260625065213.2634586-1-Hemanth.KumarMD@windriver.com>
 <22e6d6813c9c58269482eb3f3031fc7ba38af8aa.camel@geanix.com>
Content-Language: en-US
From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
In-Reply-To: <22e6d6813c9c58269482eb3f3031fc7ba38af8aa.camel@geanix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: MA5P287CA0319.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21a::18) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|SA1PR11MB8812:EE_
X-MS-Office365-Filtering-Correlation-Id: 2aa7c5fb-ce35-4e10-b9d6-08ded6723846
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|4022899009|376014|1800799024|366016|18002099003|22082099003|11063799006|56012099006|4143699003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	dTIEHkTk6elHSzNK9EGZjXfMmzFZV1+q+ntzCmTulzV5a0C1GtCH8zQjsksgQqdBQSnYzbgLE/1k4HZN6akI+5xZVfUVzoiZx91no2kWKv1jLwNPbKNtb1ZmtufF8qySlfP7RbQnAnVRWdRtMFigVO4ir2tstStuzBl8J3GFxJh07leabUNkMFiHV3o7JvcoCPJ4qiuxYxfKQD/LTrn536cJ4KMHjpMuzU0IRozxm6/f1+rFFPEo2LkVmcyS9G9AOIVwdMzdFrqtBzhuOdyLpOWa6azabv9O3N+kkrvnybwDgT272fX4BwZDuxcvKhKFP/UDdb/RdwnK/Y0P6qmAsDD3+bsgoyXdoZx7WM/C5PEykM86giAXaAeBpLj6S8VWwjWCpCLK+df2Jm3Wa8Ppn7QbinBzcPEBYl3MZoNT8MzeH90Rl9m/tR22m7wp1byvwxfQGxFwFm8MEh6+6DGqP4CHAb6P57kF3Ebnzq8LI+nXmG052Z9F3YfbKHRrCqktsI/RhiEPk2x55e2NFLeqda5gL97ZVvAercpKsA+9sx5+lYYzzEEdRbsOvC0HOZOHR5FaVsPnu/D0TPKiysg6hmhWZYqJ9Tc5MgqGgPNQQ33+lXhmTwp2WgKeCuv7hYUv
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(4022899009)(376014)(1800799024)(366016)(18002099003)(22082099003)(11063799006)(56012099006)(4143699003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?d1J6YmtpeXBlbWZSODhvK3lRSzhYQnlXMUVzZHFibmk1TUREaHkyc3hPdEFh?=
 =?utf-8?B?aTRaa1cxcmRnY2Zob2dVTEF4citUK0VKTFNuS1V2VTFESlhJVXRsemhTd012?=
 =?utf-8?B?ZzlxdUw2Nml0WEZUT3dIV3R0VGpGek8rOHUzeU1pK1dXL1VJVHhudU1vc1A5?=
 =?utf-8?B?SmhxS3NuamtWR2FLUWl6NTJ2K2JwNGVYREtYS3kzSFMzOEVXZHNIWW9qM0Nv?=
 =?utf-8?B?OCsvaXV0Z0NMZTE1QW5lQXdqb0FjWE9Yb0h5RU9qcFJERzFBQzYrelQzUmhk?=
 =?utf-8?B?eUQ3OVRvcG9aMDJYZ0xqNnBsazZCYm9ISVEvRFJab2gxRUxGK1lwVVE1alVG?=
 =?utf-8?B?UGtYd0g1dG0yenA3NVFWT21laFV1NTBHUnV0RnZXZ1kxMlJLb3orMEVPT2I2?=
 =?utf-8?B?TXdTWTliNG9mKzM5Y2pGMngybjlMZ3BGYkJuRTFXVGtvd055UnVmeDA5T08r?=
 =?utf-8?B?Nll4RHdiR3RZejc2NTYzWWFTR3ZqNm01MFphamk2ZGx3ekNXVTlQZU5OTEQ2?=
 =?utf-8?B?QjMydkdMKytDN1JTOWlBUzJ2cGhiWlFEWDlOSEM0ZUJHQTdubjF6WGpHVXp2?=
 =?utf-8?B?UWljYnYxODQ3R1R6eDN2K28vZXdGY25vUHVQajN1T3hySGdHbHpuRVdMcTN3?=
 =?utf-8?B?TnhwOUFiN2ZiVnpNU09jZWdsMlVPMHViajhtT2R5eElhN1d3cE9NNnFZSi83?=
 =?utf-8?B?aDNPeDROcUF4dlpUcUhhRnBiWkQ4R1p1REk3Q3doUXRwQVo2UysxblZrb3FY?=
 =?utf-8?B?WE90NU5odFhmcUNDdFpyQXJLb1NEMThObktxN2JYa1RtWHJHRzBQQmNvU1VO?=
 =?utf-8?B?TjlPUkM1dWdoRWxjSEt0K1h6aHVOWkNGL1VGUmNHS01Udm9Sak9xOXpzTjF0?=
 =?utf-8?B?a3IzY1JMRVl4djBVeXZ5akxGdnA4ME9MOUZHRzZTY01qekhyM2U3aEx2OExB?=
 =?utf-8?B?WkJOOStOWVAyWWZJUCsxWFNqU2R4MDdwV2l0NEZMc3Y4Ym9lMUcyeDhlV0Fq?=
 =?utf-8?B?MWtNeTM2VUFYZ1hQZzIvZDh3KzZVK09mSHpYL3hIUGFuR3F6bVlsWGpBUWc1?=
 =?utf-8?B?QXZ1cHZOOUlTRjQwYjJSUGxIRklkcnY2R1BJanBla1VRMkprQXUxZ0I3QTVB?=
 =?utf-8?B?K1JkeFNia3FMaWtaTkZQMWswWnhqRE5aVC9LTFZRS045emxuTll4UlJLMk1z?=
 =?utf-8?B?dUF3SHVzQ1dwRU8wWTdEL08wZUpBbGR1dVNoZ1cwbEdVUUlzOFV6UkY2eS9V?=
 =?utf-8?B?ZVlhTnZMRGxndkIvNmNHVWNRSElaZ1h2RlpEMlo4SW01WTZmWjVLSUdoMmRo?=
 =?utf-8?B?aTJQRjJIc2lwZktxK2tDTURyc0d5cTBUQVlTNDFRUzdQSE1XVENNZ0k0bTUw?=
 =?utf-8?B?eEhGM0VvYkpEMjhHQ2pVQUx2dXZuWDBWbG10VWxRWHlsdFVzVGlxdjdPcExY?=
 =?utf-8?B?eFJWTCt6YnhuVy91elA0R01NODVSRDdpNVJrQXMrK2Q0aFlNekZqOEwxY1Fj?=
 =?utf-8?B?SGFPa0dHYlIzUzNSZnYrYjlMUXFrVDJPWWgvL3huSDlhM0tFRE5YNWhvc3Bw?=
 =?utf-8?B?TnpWSnR6eXByNEptbmNoeDR1OHJFUkJwTXRXL20rV0cyeGVoSlNGYkZ5eUpu?=
 =?utf-8?B?SE5ZZmlRcVF3eWVOR25RbW1HWW10b0dqV1ErazlOZm9VN1BzMVY5a2dhcWVi?=
 =?utf-8?B?SmtqWkVmY0hRdHNCSTZBL0lTbjNIeGE0a1NJckVTQnQycDcveHU4RVpXa054?=
 =?utf-8?B?MTVFKzJSQUdNbkZHaFMvTTgxTDBnOG93dlh1eXFiQ2pQWGtXWWh3bkhkZU50?=
 =?utf-8?B?ZjlHMVdsYzF4WHJSVjBYeTNqRU5MejVpL2JJWVVhcy9XUis4aG5rOE1teDVs?=
 =?utf-8?B?ZW01YVBqdFFSQUU5aTNIYkUzeFg5b0dMeldLSFgrZStaK1ViWXFVWXB2d04y?=
 =?utf-8?B?VW1IVy85UDVtR3Fmd1hnM2djYmJqZVk1azEySVZzQ05CNEN2YlJ4c0h3ZVJ5?=
 =?utf-8?B?RTYrODJZWE9PN2xJNy9UU24wVkpUYmdXN0NHdUl4Tmpsais4NVQ5UVNoMGlP?=
 =?utf-8?B?R29pc3cyZzl2cWlSRk9aZ1dxSitBTHZNbndoU0xwQVVPYjJyckdnNVJ3MUpi?=
 =?utf-8?B?aU9XRzd6Q0ROR1gzU09CYTNPeElVdStqK3N3VjVnV1JkR21ER21vb2s5ZWI2?=
 =?utf-8?B?ak9COHp3bHdaNXNqaDR3K2ZFeUszUkdxaHBsT1NXRzRhSGJGcmI3MU5PWUIv?=
 =?utf-8?B?KytBYUFwWlBXNHFMN2JHZjhjKzVzRlNCZW16TEtQZG9yWkRidjQrb3g5Vndk?=
 =?utf-8?B?RnhXWlNhdEpWV0Jqd01wTHpGK1hsRVpaVnliWExpQVZoVnlHR0kwbEw0UGkx?=
 =?utf-8?Q?z8wEe2qhjOhOev44=3D?=
X-Exchange-RoutingPolicyChecked: 
	mkUSjQ6gRVQHSkUDRuaNKUaAgxeWKRhY1V/5AD9VNJy6J9zQbhEmgaqDb+h1SFeL9dK1q51i485OOSDmwv0yq/rxMtrDcm5W/udXwhQTAUcW8Izh9IjlN89sOxIvvdi/nM/3essLVdCEbw1W3agaj+aJcQxNjI8v3qEf+70V6V+f87ZuVKamG3qMuYwqwjUBuXHN7gMcThW0qUsuV9lBW74KnDGJg7stN7f70bASBkYbK+2Z4I6ysewiUAkNMzw7axhE980EI2Fhty3zN9Cnft+/IUBlnhDjWF2nj4xcFJr5pM0ZIfNp4UrCZcAFba0DItZOVqxcWMbgOG5y0BNqsQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2aa7c5fb-ce35-4e10-b9d6-08ded6723846
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 06:38:39.5534
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MElJgjNN8khLlGs4DVvAvWoPTjZG8EEy8QhOz+6FoeHS8AgcnhV49y6GH/8Omi2igEepqJqQ6mnCgxAwbXoOZnkehIPw2Bdui7h1cuTqjJg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8812
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA1MyBTYWx0ZWRfX/YSpGhzlhIWL
 RHJzbjAsaVDl/rhO53OYCje4Wjlp2qBoiSJIb86QGT1SD0MhyL6dQ08HrgdOFZGUeAnjgmDLSsF
 WaroQxgr1jI7aCZcjk+4wPdxgciWw5f68GPnG8VGsMya8GTNrZgB
X-Proofpoint-ORIG-GUID: H7HmpaFU_1ym9SW2UBl1FGxVzufSexb0
X-Proofpoint-GUID: 2EdCXoam3i3LUnHZs3PutdukxvlRrvU7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA1MyBTYWx0ZWRfX1ocXSBLg/tAe
 fo99qhDyS5ew9JhzXSoIuTrkuklRAdB88XP4Rem80VYRsUISJdgfYLxbyJZgyTYorAf+q8Ankwq
 biQr3PngJZIAKB8qbr3lemePjbyZqrLbCZINTId6wjd7PoeS7UPAWk9LVFHrJ310wxRjeClGr8H
 UNRFxyfUUewu66Al2wBSlT2ZlgfFX9MKANhl7I0qjyBi/COigbfiofnScgvE2OFhUjaf6NkOg2h
 gkMZWhrHr+TIW0f3ySOyl1vEw9nYP5bg4JKbIwOeiO+gwDHu9veSuE95Uc/1TfqD5rhn6hQN2jN
 fuLnQ1t+b7zAkbxC0n9q7wSV3q32ixDtv3xjNft/D6hD1sC1S9OSc3sw9Z5BGyvbfHQ6dDtF9BJ
 vdX8Lp6HfGI2ZBakGBK1rBC1so8C/y/ne03JmAqxMYLj6IVDHqJs4H/T3omPMhY2zP0KT5YeC7h
 bhx8cPshVaJTV4J6tYw==
X-Authority-Analysis: v=2.4 cv=TvLWQjXh c=1 sm=1 tr=0 ts=6a436472 cx=c_pps
 a=hJOwGQj5EtsonyTFrxeutQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22
 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=iGHA9ds3AAAA:8 a=t7CeM3EgAAAA:8
 a=ilKATfAMAAAA:8 a=SuuyZisULfazq8FRg-EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=73awMTU50e6eLoBjGbzZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300053
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 65U5hEmf271304
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 06:38:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239851


On 26-06-2026 04:50 pm, Martin Hundeb=C3=B8ll wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> Hi Hemanth,
>
> On Wed, 2026-06-24 at 23:52 -0700, Hemanth Kumar M D via
> lists.openembedded.org wrote:
>> From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
>>
>> Cargo walks from CWD up to the filesystem root merging every
>> .cargo/config[.toml] it finds. Any such file above BASE_WORKDIR is
>> silently picked up and can override Yocto's linker, registry or
>> compiler settings, leading to build failures.
>>
>> Until cargo provides a proper fix upstream, add a warning so users
>> get a clear diagnostic instead of a build error.
>>
>> Upstream meta-issue: https://github.com/rust-lang/cargo/issues/9769
>>
>> [YOCTO #15637]
>>
>> Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
>> ---
>>   meta/classes-global/sanity.bbclass | 33
>> ++++++++++++++++++++++++++++++
>>   1 file changed, 33 insertions(+)
>>
>> diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-
>> global/sanity.bbclass
>> index bdfa7f059d..5c5cf311da 100644
>> --- a/meta/classes-global/sanity.bbclass
>> +++ b/meta/classes-global/sanity.bbclass
>> @@ -854,6 +854,38 @@ def sanity_check_locale(d):
>>       except locale.Error:
>>           raise_sanity_error("Your system needs to support the
>> en_US.UTF-8 locale.", d)
>>
>> +def check_cargo_config(d):
>> +    # Cargo merges .cargo/config[.toml] from every directory between
>> CWD and
>> +    # the filesystem root. Warn for anything found in ancestor
>> directories
>> +    # above BASE_WORKDIR that Cargo would pick up silently.
>> +    import os
>> +
>> +    base_workdir =3D d.getVar('BASE_WORKDIR')
>> +    ancestor =3D os.path.dirname(base_workdir)
>> +    found =3D []
>> +    last_ancestor =3D None
>> +    while True:
>> +        for name in ('config', 'config.toml'):
>> +            cfg =3D os.path.join(ancestor, '.cargo', name)
>> +            if os.path.exists(cfg):
>> +                found.append(cfg)
>> +                last_ancestor =3D ancestor
>> +                break
>> +        parent =3D os.path.dirname(ancestor)
>> +        if parent =3D=3D ancestor:
>> +            break
>> +        ancestor =3D parent
> This can easier be implemented using pathlib.Path:
>
>    from pathlib import Path
>
>    base_workdir =3D Path(d.getVar('BASE_WORKDIR'))
>
>    for path in base_workdir.parents:
>        for config in (".cargo/config", ".cargo/config.toml"):
>            if path.joinpath(config).exists():
>                found.append(path / config)
>
> // Martin
Hi Martin ,


Thanks for the suggestion , addressed in v3 :=20
https://lists.openembedded.org/g/openembedded-core/topic/patch_v3_sanity_=
bbclass/120043231

>> +
>> +    if found:
>> +        bb.warn("Cargo config file(s) found at %s which is/are
>> outside the build "
>> +                "directory. Cargo will silently apply their settings
>> during the "
>> +                "rust/cargo build and can override Yocto's settings
>> like linker, "
>> +                "registry or compiler settings causing build
>> failures. You can "
>> +                "either remove these file(s) or move your build
>> directory outside "
>> +                "of %s to fix this. "
>> +                "See
>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15637 for more
>> details."
>> +                % (', '.join(found), last_ancestor))
>> +
>>   def check_sanity_everybuild(status, d):
>>       import os, stat
>>       # Sanity tests which test the users environment so need to run
>> at each build (or are so cheap
>> @@ -873,6 +905,7 @@ def check_sanity_everybuild(status, d):
>>           status.addresult('Bitbake version %s is required and version
>> %s was found\n' % (minversion, bb.__version__))
>>
>>       sanity_check_locale(d)
>> +    check_cargo_config(d)
>>
>>       paths =3D d.getVar('PATH').split(":")
>>       if "." in paths or "./" in paths or "" in paths:
>> --
>> 2.49.0
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#239544):
>> https://lists.openembedded.org/g/openembedded-core/message/239544
>> Mute This Topic: https://lists.openembedded.org/mt/119970000/3618414
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe:
>> https://lists.openembedded.org/g/openembedded-core/unsub [
>> martin@geanix.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

--=20
Regards,
Hemanth Kumar M D


