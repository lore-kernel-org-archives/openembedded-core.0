Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 357A0C0218A
	for <webhook@archiver.kernel.org>; Tue, 28 Jan 2025 21:52:50 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.9446.1738101162902802941
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jan 2025 13:52:43 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=41233a820d=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50SDBuNu012473
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Jan 2025 21:52:42 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44eny70y53-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Jan 2025 21:52:41 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50SLprpe006052
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Jan 2025 21:52:41 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2043.outbound.protection.outlook.com [104.47.70.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44eny70y51-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Jan 2025 21:52:41 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UiGSgpdO/QIJ4hrWnfhhN/h+5HLjX6RInSHdCGvtwBUg21WTKIkRACV0OcnZzEh60JC1A8T2s4tkH5tzuH/Jtvf9M55al64UiEy5y8kYGs9PgAZ367Xe8R4hpQGUHAGPXUUT8zvFvoNamKFHO+LLSvlJc77sg9Jyf6GKVibd3K0U4hfUzy0op4uk81iiFAwvGfcuEIPEhH7iHbJNYnrwQK807DXjJN9Ot8MYJ1oUI8I/wqBHM9jh5xA8d17Yqv52dDxAH9SDC7syQfHxIvu+5P9TRl1telYRqtbaimthRwstrIFQ94GxMGcKiMnQ5svRJmuHTBrDk8orkvT/ZLuztQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZwMXlWGHbXA97Om7csXRDcYaQYXah1QguFXEhT+I1PY=;
 b=kXkrxkrhP6KWNGzCl11M5ewlESCPZzEE8WdVSz1xI9zBr+OVBaTSDuE27Ta1KGg5iwwMAn2PVBmKeNs66XFJjZpQ/7z+EyMksrIwggzaPRhIpgE8MSz4SFr75vE84CzPnAt8EK6P7fQSMV0C6N6ehpxMLDOdh22MTevn3flgOq8bza7+hVJ9GCA41NTlVCYlGBbk1KOuaQMNIUlbaalqOvPNAkrfKw0bjXMPqylnLZlODfWv7iHU3VZsawe2/c1EjXacV1QOhLKTcNER6PgBcI1ATwN8QRtGkxFZMYy71UWWlLedwoFrPmETJ61wUXQbEakBZ8pOD89ZrNl1bIdkjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by PH0PR11MB7469.namprd11.prod.outlook.com (2603:10b6:510:286::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.17; Tue, 28 Jan
 2025 21:52:35 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%4]) with mapi id 15.20.8377.021; Tue, 28 Jan 2025
 21:52:35 +0000
Content-Type: multipart/alternative;
 boundary="------------jVsMt40bEc0R0lGoAz5IY1Dx"
Message-ID: <0a4e3939-3361-4656-956f-ae11af7998ac@windriver.com>
Date: Tue, 28 Jan 2025 16:52:32 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] RPM signing errors in Yocto master
To: zboszor@gmail.com, Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
References: <266ca4d1-62da-401a-b766-ab6b13c6753b@gmail.com>
 <CANNYZj-CNT8_yXKLB6PApG=Mknx=TKz2TAosgh17LiH1LQ0_fg@mail.gmail.com>
 <f8de4060-bba3-4a5c-93f5-eb4685223a73@gmail.com>
 <CANNYZj-tW3k01HstKJymLz4A9WOmMY6EhugyrhzZVEoH96pHkg@mail.gmail.com>
 <ef779855-5513-44b6-8b85-f4c07fa69756@gmail.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <ef779855-5513-44b6-8b85-f4c07fa69756@gmail.com>
X-ClientProxiedBy: SJ0PR03CA0376.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::21) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|PH0PR11MB7469:EE_
X-MS-Office365-Filtering-Correlation-Id: ca0131ca-54a3-471b-067a-08dd3fe6132b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|4022899009|366016|376014|8096899003|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cDg1b1VRR1pjTzBOeEdhbjdBbThCajhlMW5xb3FzaE02elZEd2drZnZWNnl6?=
 =?utf-8?B?TngrOUdOeDYzYXltSG1VcUMvL0J5RFBSbzl6SzRBcE42bHQ1QnVDQmFBd2dY?=
 =?utf-8?B?NDR1STVhdzFEMHRyL1pndzd2RkFrZXZqQ2lEUXc3cng4NnZaYzlPeEtXUXND?=
 =?utf-8?B?alhSRlRlZ0Q2cDY1RmtxZW9CRjRmL1plc2hNZ1dBNjdQdFhsVWhwTFBpY09j?=
 =?utf-8?B?cytOZjM0OFZrT0VIcklTTTJCcEF3bUtjUHNTeTRlNW5kVHMrUGIyZ2tRT3hQ?=
 =?utf-8?B?bndIU245N3RzZHNTREZTZDFiTCtPSTZSbzZ6QWkxZkd1b2M1SmZJbkQydDZQ?=
 =?utf-8?B?Q1p6Qld1VFQxQkErV0dXdE84YWtFVEhrTzR3Q1NsU2UwenMvd0R0TUtPZ1ln?=
 =?utf-8?B?Um14dG9kUVN4Ukp1OUZ1NXI0KzE4eVl5eVVIbTkrd2U4OHVZbVFqaXJkQS8y?=
 =?utf-8?B?UTlFczE1cEJHbGUzQkVoc3BtaW4rZ1VPUVpySk9xbEZuTXBVR2VKOXhVbk5C?=
 =?utf-8?B?NEEzRE90WVBxZk8zRHJqNUQvcTF1WEVUYzl4QXRkbno3OWwyNHg1MjlhNkVZ?=
 =?utf-8?B?NzJCNWFqZG52YmtuT1ZJSElzcUoyOGlqUmN3aEF0VW4wN1pJUDBydVZYNXQy?=
 =?utf-8?B?cWgrNE9qVDhwQlg2ajNGNEZQMnNKOStMQVZJUXhqc0JhSmE5Yjlya1k2OFlt?=
 =?utf-8?B?ZVZucjdrK0ZRZFNBTHhxdDl6aXVtTUcwZTd5a0FOdCs5WXJiR1RvRlM3Mkg3?=
 =?utf-8?B?TWJXV1Q4TGFSOXEvY0M3N1Z2M2J4UkZwWnlrRkhYQW0vQThuYlJLYk5BUzlk?=
 =?utf-8?B?a1dCaWphbEYySDZaQm83cnk1RzJ1b1dEV0lVTnFockJFM2gyVnRXTHRsVFRG?=
 =?utf-8?B?V1hvRXN3SFZLQ1VBazlBalAwbGIxRDJvcTQ4ZGM1TzVFRkx4aHpQdmk0SDFD?=
 =?utf-8?B?ZEFWbkZKMGErd2UrODZCVTJZcXVOd2N4bGpVSG81UWJJc2EramNrWFdyRjlZ?=
 =?utf-8?B?YXZDZ2tGRndybEZiaXpYeWxzRVBYUTdKREZPKzh3d3lQZUxyVlRTZkp4TklZ?=
 =?utf-8?B?eFlTdmYzU2VJVkNBTCtSbjd4Rit5ZzJZK0YxdFp4VkEyenBSYkJMVjFSNEc2?=
 =?utf-8?B?VmZMRnhod0hrQkZUL3RoYWVQaXhETnlLTDdoYWdKM0dPN1pTeTkvUFlSOFF4?=
 =?utf-8?B?V1l5R1hUZjQ0a1EybDlFelR6U3RIOWIzUnRKdmxCNXRsVHZONGd0NER4ZDJL?=
 =?utf-8?B?Zkdtbk5SQ3BJNDFIc0d5aW04RGNkd2l1TElSMVg2S1Nrd0M4dThaWDZsTmdQ?=
 =?utf-8?B?UHM2anFTZjZhbmJFblpMYThFTXpqeEJJbkN4ZVRpWmpIT3lkZ0FUZSt5aWY2?=
 =?utf-8?B?UWpud3JyYnY1dDZRMUViakdyRVgrM0Z4amVuZTYyTFZIc20zd3gzU2JoNndL?=
 =?utf-8?B?V0VYUTVrbkFaY3MrZlg2UWN1bmcrbUM5VDFuUDFkSEUvWlVvQVUyVDdYZ2N0?=
 =?utf-8?B?c2F4K09ueXNKQjlFa3piT1BWWkh0ZmRNTWhkRURnZW5CUWliUW5wUzkyN3BF?=
 =?utf-8?B?Y0lYL0RQejJRbG1TYTl0Q3hyYysrL0JETXBQd0RsTW5IZTNRbERiYlp1TnpJ?=
 =?utf-8?B?MU55SzJRWDc3UGY4Y2o5RnhsRGdUZVl1NnVTS01FSjNyakVObW40R01qMW5p?=
 =?utf-8?B?MmtiMkVPQzhkd0tXaTQxN3h5SDJwUTRuQTY1bHFrU2QvWkNmRmJMWXJUMEZD?=
 =?utf-8?B?SXZaSDd1R0VFZHpzNHI0aVpWdEFWUWlyS1gyUEwwU1BId2Fpc0toRnd6YnMy?=
 =?utf-8?B?b2pBS1F4UDBoS0xvUnhVQT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(4022899009)(366016)(376014)(8096899003)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cjZjT3dkUnlPa0puWlY1MEFEdUJ1MlRJaEh3YlhsWGNRaU5EOWdoOG9neU5r?=
 =?utf-8?B?U2pPdkwyYUN5bWxPNVp5TUk2dkJVTzR0aEhMejhkNzBLbElDRTZneXY0eEFr?=
 =?utf-8?B?QlpvR2NVN2ovcWM1YXpFNlcwVnBja1V4d0VkeDNzQndpWTdsVHVoSGxwNG1Q?=
 =?utf-8?B?dkJFNE1OQWxHUTNLRXRnVU82a3JuTU1yQ3B0c2tYckF4VVdOamxmYURWMXpX?=
 =?utf-8?B?eWZNUnN0MVhwMmx3MnVCcTRjRjdMZU9XVTdXQnBxUTUrLzlPZ1pIVVY3cHAw?=
 =?utf-8?B?ZFpXZ0RoUWFRa01RWHpyQzRlUXRlYjBKUVRHcURUUTJuT09zR3BhQ0hSSW04?=
 =?utf-8?B?V0hlZXVyQUYvWjVxd1kzK1Uzb3FrVWRlaW5kU0RrYjZTYWZWUnNSNjhlVXFR?=
 =?utf-8?B?NUVtY0ZVUXRQa3FVbktla2xqaU10YmZ4ZWd5dEVsZmhBOVZRWm42UEloNFYv?=
 =?utf-8?B?MFpEQ2ZtRlg5bTMxdGsvMmtHSXk3cTBRN0dEZFNxTnZYbTA5UEgyUVVaOGpS?=
 =?utf-8?B?VjIyMTFwZC96bmVNWEd6c2hJeEhDVlZxdnZWbVJXRFFiUTBCSlZmSjRTdnB5?=
 =?utf-8?B?VGdVSkV2TTlvRzhPY2lCaEllWURDNDNLTjVkdW9MbXlMSjZBNjU5dXVmcmM3?=
 =?utf-8?B?TVF1U0luYjl2ZUxyWjFHZkdsOGIyUVU1azFkMjZiL080QXZ1eWRvUXVzbWVp?=
 =?utf-8?B?bXp2WE8yZmxrbzdDa05mcjZhR3RZbVBZVTU5VnRLdnE0ajNiY3RFM2R1TG1x?=
 =?utf-8?B?bUxNU0NiVFpCT2F0NklDWFI4bW1oSklvc000cTBDdjgvNWV6NFVZdFhJVTV1?=
 =?utf-8?B?eGQ2d24vRVpNR1FScVVxNGRGUW9XZENsSDVYaTNIK21FRmF2U25ybTVFZlhp?=
 =?utf-8?B?YmN1Y2kvVjlkdk5ESEc5L21QbzJuNUZHOHpoZm9rd2VJbm5xbUtsNmpVdnpN?=
 =?utf-8?B?dHkrMW1NWFRKUWYrUlJ6d1JYT3dRYWVUenpydzJMUTk0REFyU1loNmR5bmJW?=
 =?utf-8?B?enRJSkF2L2JZYmhaaml1UEFUL2pDdk9QMUZDRG9SSVkyRlhNVjA3K3JveU1M?=
 =?utf-8?B?Yk9tKzFmb2ZaeFhmZzlZd2c0WTNLb1lEZFNrelkrT1l0dWYwTXVBMUw1cHQr?=
 =?utf-8?B?YlZiamlYWmxSNXBFcDhQRE0xMllKc0xkZ3MwYUxBaENTWWxidEZjRjRjWkFo?=
 =?utf-8?B?czJqN1g2MXRSNW1ZV2cxQ1VMQXJIeWJlMVhHYWErOXVwUEtwU21Yc0U4YnZn?=
 =?utf-8?B?NllRMlRCNVVMeHdHamJZOUhnM1hWd1RLeUJuYU5uQUZZNjFrVHkrWU1xc2Fu?=
 =?utf-8?B?WW8vdk56dlN0SVFwWlZ0YUF1TEZzOTVvOWNVdUsza0ZTYXpzaFpXN1pnUjBo?=
 =?utf-8?B?eVZvWUovcWlkWUo4bWx3aVlUN3h2bUZLZ3p1bjBKY0JZTks1U0pZZmJvc1Zo?=
 =?utf-8?B?Z29FR2doQ0E2VEhrL1NBRUw5UmozWFMvVUd0ZTQ3dmM1NUd3S2xEOXlseGxH?=
 =?utf-8?B?NTRld2JiYkNlK1B4SVh6WlFaODlNb1BGWXU0UzU4bExXYVVGaTRPaVBlcmQ3?=
 =?utf-8?B?STR5eVhOUmVSUGt4ZSsvVllBRTQ0VkhLTkk2MFd0V3ZBZ29PM1VBOFRFVWY5?=
 =?utf-8?B?eFR4WGxKcXFuN1YzZUtXY3A1WGV2N2JjaWh6ekVYTC9PZW92QllLTTZrWHJZ?=
 =?utf-8?B?cDBUQklpVUxoVTFHemFYaG56b05QdHdYUnFSV2pHWHFCVmRKWmkrTFVRUXZS?=
 =?utf-8?B?QkxSMEZubWdFNUtDVFhreG9iY1dWRHZEMFBodTl5dlZtNVg1Y3Y3UHZab3hP?=
 =?utf-8?B?VE9QWUVlU3VDc0tnZEhtN05WU3E0WDRlZnE0Q21nME4xalpDUFQvSVFydlBk?=
 =?utf-8?B?QVF0a3RjNWdnenovc1JBNnhndUFzOGhxTTcrdXdTTUZEZUJNVWgxenJITnlC?=
 =?utf-8?B?UUNpMnFiNlJBNVBQelhFblZja3hyQ1l5WmZOMG9mNWE1bGdPQ0pnaDJHR3NI?=
 =?utf-8?B?a2RtdDJzQnEvWis0a2lJM1FxbDdyTlFWWlBKc2RxazRvZHovYlk3SnFPdzgv?=
 =?utf-8?B?cjQzS0ZvUXhha25oSWkzem5OcExyWEluUjgyUTh4RTJ2SXZIQkhRYys1U3BJ?=
 =?utf-8?B?a0ZoSVlTUndVaHd6S2R4dVdHNUN0UjlMM05XT2RnL1FMeTNPT2UzR1dlYlNN?=
 =?utf-8?B?R3c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca0131ca-54a3-471b-067a-08dd3fe6132b
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2025 21:52:35.5008
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2UmCruxj0XyQzF95Vp9U4tZVZZNnEG8N7WBNZXCbJpEppmohpwThMLgd1ed4JFoYrywVN6xiyhKA9P8TDz6wK1GB1xnYxDYCur/zvldyWcM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7469
X-Proofpoint-GUID: Ff6SGibbJd1Do18FLogkSbxDHB-dlxEw
X-Authority-Analysis: v=2.4 cv=fYZXy1QF c=1 sm=1 tr=0 ts=679951a9 cx=c_pps a=GoGv2RwMe+/7w9MjyR+VRg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10 a=Q4-j1AaZAAAA:8
 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8 a=jA0zkCpux914c4q6tMcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=UJqG3l1P6F0ic5YrpxIA:9 a=a7WVe3LXB-SVT7x7:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: U6TUKqLyrZfCGrjEaaTJr25oePmgzfUT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 bulkscore=0 priorityscore=1501 mlxlogscore=999 impostorscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 spamscore=0 suspectscore=0
 malwarescore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501280160
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jan 2025 21:52:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210337

--------------jVsMt40bEc0R0lGoAz5IY1Dx
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 50SDBuNu012473

On 2025-01-28 7:28 a.m., Zoltan Boszormenyi via lists.openembedded.org=20
wrote:
> 2025. 01. 28. 12:57 keltez=C3=A9ssel, Alexander Kanavin =C3=ADrta:
>> On Tue, 28 Jan 2025 at 12:53, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <=
zboszor@gmail.com>=20
>> wrote:
>>>> =C2=A0=C2=A0 Which is
>>>>
>>>> - written in rust
>>> rust is in core.
>>>
>>>> - needs libclang.
>>> There was a motion to merge meta-clang into core,
>>> what happened to it?
>> The effort to move clang to core is ongoing. Patches were posted and
>> reviewed, with a significant number of issues to be addressed. If you
>> want it to happen sooner, please do help out with them.
>>
>> Even once clang lands, we likely won't re-enable signing by default,
>> as having both rust and clang on the way to do_package
>
> That's bad. This would make some packages in my meta-clang-revival
> layer non-buildable:
>
> * older versions of intel-graphics-compiler/intel-compute-runtime
> =C2=A0=C2=A0 from meta-intel need llvm/clang 14
> * python3-llvmlite (dependency of python3-numba) needs
> =C2=A0=C2=A0 llvm/clang 15
>
> With Yocto 5.1 and older, all 3 libLLVM versions (14, 15 and the defaul=
t
> version from meta-clang) can be packaged / signed and the library
> packages can be installed in parallel.
>
> But clang and e.g. clang14 can't be both pulled in as build
> dependencies, since they conflict.

Zoltan,

A patch to enable the signing using=C2=A0 a PACKAGECONFIG for rpm would
likely be accepted. Off by default of course and a test would be ideal.

../Randy


>
>> =C2=A0 (which uses
>> bits of rpm) will lengthen build times to unacceptable levels. I just
>> posted some unfortunate benchmarks for rust-native in particular. But
>> you might get the rpm signing oe-selftest working again.
>>
>> Alex
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#210322):https://lists.openembedded.org/g/openembedd=
ed-core/message/210322
> Mute This Topic:https://lists.openembedded.org/mt/110856095/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [r=
andy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------jVsMt40bEc0R0lGoAz5IY1Dx
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 50SDBuNu012473

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2025-01-28 7:28 a.m., Zoltan
      Boszormenyi via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:ef779855-5513-44b6-8b85-f4c07fa=
69756@gmail.com">2025.
      01. 28. 12:57 keltez=C3=A9ssel, Alexander Kanavin =C3=ADrta:
      <br>
      <blockquote type=3D"cite">On Tue, 28 Jan 2025 at 12:53, B=C3=B6sz=C3=
=B6rm=C3=A9nyi
        Zolt=C3=A1n <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:zbo=
szor@gmail.com">&lt;zboszor@gmail.com&gt;</a> wrote:
        <br>
        <blockquote type=3D"cite">
          <blockquote type=3D"cite">&nbsp;&nbsp; Which is
            <br>
            <br>
            - written in rust
            <br>
          </blockquote>
          rust is in core.
          <br>
          <br>
          <blockquote type=3D"cite">- needs libclang.
            <br>
          </blockquote>
          There was a motion to merge meta-clang into core,
          <br>
          what happened to it?
          <br>
        </blockquote>
        The effort to move clang to core is ongoing. Patches were posted
        and
        <br>
        reviewed, with a significant number of issues to be addressed.
        If you
        <br>
        want it to happen sooner, please do help out with them.
        <br>
        <br>
        Even once clang lands, we likely won't re-enable signing by
        default,
        <br>
        as having both rust and clang on the way to do_package
        <br>
      </blockquote>
      <br>
      That's bad. This would make some packages in my meta-clang-revival
      <br>
      layer non-buildable:
      <br>
      <br>
      * older versions of intel-graphics-compiler/intel-compute-runtime
      <br>
      &nbsp;&nbsp; from meta-intel need llvm/clang 14
      <br>
      * python3-llvmlite (dependency of python3-numba) needs
      <br>
      &nbsp;&nbsp; llvm/clang 15
      <br>
      <br>
      With Yocto 5.1 and older, all 3 libLLVM versions (14, 15 and the
      default
      <br>
      version from meta-clang) can be packaged / signed and the library
      <br>
      packages can be installed in parallel.
      <br>
      <br>
      But clang and e.g. clang14 can't be both pulled in as build
      <br>
      dependencies, since they conflict.
      <br>
    </blockquote>
    <p>Zoltan,<br>
    </p>
    <p>A patch to enable the signing using&nbsp; a PACKAGECONFIG for rpm
      would <br>
      likely be accepted. Off by default of course and a test would be
      ideal.<br>
    </p>
    <p>../Randy</p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:ef779855-5513-44b6-8b85-f4c07fa=
69756@gmail.com">
      <br>
      <blockquote type=3D"cite">&nbsp; (which uses
        <br>
        bits of rpm) will lengthen build times to unacceptable levels. I
        just
        <br>
        posted some unfortunate benchmarks for rust-native in
        particular. But
        <br>
        you might get the rpm signing oe-selftest working again.
        <br>
        <br>
        Alex
        <br>
      </blockquote>
      <br>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre wrap=3D"" class=3D"moz-quote-pre">-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#210322): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/210322">https:/=
/lists.openembedded.org/g/openembedded-core/message/210322</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/110856095/3616765">https://lists.openembedded.org/mt=
/110856095/3616765</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------jVsMt40bEc0R0lGoAz5IY1Dx--

