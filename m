Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13711E7490F
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 04:49:59 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.115349.1766551794039475244
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Dec 2025 20:49:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=qw7FN4ta;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4453656b1c=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO4nqv42513661;
	Wed, 24 Dec 2025 04:49:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=MlepOo08E6ndq8W2rh8fdq9uZfMVJhTBvCv+QDAsCd4=; b=qw7FN4taentn
	JAhoIsflwNVUe0cZGVF/MoIcYLyuca3Ya/LhTVME8cBES5znRSVdYKCpKKNj1v4V
	RSdd3Emp3IZ/2KW6OXKmzjcWxpIG+psBNE2uQHEUhUjbpVP/7hOXJaL5XOz1rRq7
	H5DJuNhbjGgZL8EVeEWNPoHPl9OJwrOvZgbwFYTgopSntqSYRdaG5HOoP9eqnhkv
	OgRJrXXXO63bjKiuwFtapfVllAh9lGiY54h43JjuA74I+vuPxFQuZK4iBi0ilcp/
	xPQYU9QOUOJQosYGdl7YIzIg0jbIgY9hNNGhX/MnoS1byZWhM1wgbcPhXaaKcNyJ
	CTkQOWe1oA==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012046.outbound.protection.outlook.com [52.101.48.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b5js73thh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 24 Dec 2025 04:49:52 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ePRYl9AjmfcKDcE25/RktAak1HV/BUug/Hwp7Z9yr4Et3sO+H2QsL9noJjnWGPxSI88MsTGppJie81guTfMclkBybSWEOqWoEDlsX7jzAWifexjBL6XFwua0FAVoGly/r4JvohlaVDpye+4jWP8+Jza6lwXKkIONGYalwfjxZFFZO9+wF6i95F8PnNEtIUDnLrg6uEdxUfL/1xEf/bT1F/HcHQUN80nqIH/tl9RiN2vIXMNQFG2rDIMFXeufmEeQ/VQ4bTsp9+jvYAuypGleQbQt4KAUlPPNI/0P4EtOKbYlpiiKiPTchiPlQPFXRulYmaCa1ptHrVgzhqYdER/gcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MlepOo08E6ndq8W2rh8fdq9uZfMVJhTBvCv+QDAsCd4=;
 b=e7RiB/UMSfkUE1bOOHlZC1faUQxJXsLZsFhpk92ECsE5nX6yc3qzV2F3pHB1cp9zxdzKmYpsHfA6vy4f0OId1DcxoSfxv2W9x92CNNSmv5U0sviQyKuazNZO/i+0tQHuJIjeiTaQIWuBj4pEKPaiccnJPhU10r6v5K7HkmJDHmUt/4H1OfXHbf8h3stn6XTgetumD+zqPmGAX27bgy/hEnztzI7anMaK+hlifeXzwB1voYQ4uDnwwXOsDPop5lCm11fv0JtERwl7rNmwekYkweMsDNyWWw4iRcd05C5Q98lIjKc2YVgY2CBML9tnlRMDVmDYkcSdHhZidaNu9Fkm2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by SA3PR11MB8022.namprd11.prod.outlook.com (2603:10b6:806:2fe::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Wed, 24 Dec
 2025 04:49:49 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::c84c:d2c3:1102:cf45]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::c84c:d2c3:1102:cf45%3]) with mapi id 15.20.9434.009; Wed, 24 Dec 2025
 04:49:49 +0000
Message-ID: <45f2d106-ad3e-4746-88c7-4df90b274bda@windriver.com>
Date: Wed, 24 Dec 2025 12:49:37 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2] vte: fix build failed for ppc64
To: openembedded-core@lists.openembedded.org, alex.kanavin@gmail.com
References: <1884086C67716646.1342979@lists.openembedded.org>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <1884086C67716646.1342979@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TY4P286CA0037.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2b2::11) To PH7PR11MB7608.namprd11.prod.outlook.com
 (2603:10b6:510:269::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7608:EE_|SA3PR11MB8022:EE_
X-MS-Office365-Filtering-Correlation-Id: 2489ca21-a4ba-4b2c-a9ee-08de42a7de38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|4022899009|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?OFkzQnV5S2tDalptenA0aUNWSlgwV2I2M2d5WGZ4aDZDSFpMa2hGdlovNkhL?=
 =?utf-8?B?bFJRUDB2WVB0cHQ3TkYyYm43eFE5U3B0N25uYXNHcjFkOVJZV0N6N1RZUDUw?=
 =?utf-8?B?QWprUm50WlE0cVMvZXlaTGNqdG13SkNjR0EvMUZlT3FCOVdrbWtzaVYxcmdZ?=
 =?utf-8?B?ZnVyZ0M3OHVGWit0QlczOW9laVhXRmlVNStmc0VvZ1Vjd1F0d3paSWZRb2NT?=
 =?utf-8?B?MTh6aEN3My9YeXdaUmozV2lVcnpOWWpzK0VreXVxWUZTRmY2ZCtPNEN4QzN6?=
 =?utf-8?B?Z0d0THFhVFFVcWlaWWt5UU95S2JpYW9pNFVSKzJwTVVtZDF4ZmJYOFZwVFJY?=
 =?utf-8?B?Q1VIMytHZWZjTWlDVjVrWStESHI3N1ptb1BGcGFRWkxoamFmbytGTVZBUWs0?=
 =?utf-8?B?SXVhUEpaWE9TRG1ZQzl2eE5UeVJVZ2huZXZqVDFhclZWNmhvVmdoL2xxQzMy?=
 =?utf-8?B?a3NwN0hhaHgwcnNNTnZySWxSV0JzWVRQbGY2RnZvWS9OZ05oSHZyWnFSR2hv?=
 =?utf-8?B?QlYySFM3TldLaUpHaW9remJHcWhUNXhmVnByR21YRzBKN1JUd3hwd0tqQVBj?=
 =?utf-8?B?dkdQTzc1ZU5FZHlvMXhSMlNyZzNkMkhzajM2dllmMTMrQ015dUVRTW9HQ1E2?=
 =?utf-8?B?Vm5HZkVhbHMyS3hHbVgyMGxYdjVWTEVaSThjMjh4R0pMdi9CNWUyNzBYTzlH?=
 =?utf-8?B?MHBnRXQvVFJUNzJqdHNvUTcvbHY0aGd3UlpJWlA1RjN5dTNMaGw0M3dmdkZt?=
 =?utf-8?B?R202c0t1ZEdHL3llKzY5dXVidnV5U2ZXWXR5MWlrbFREUWw5eS9XSDVkMUEv?=
 =?utf-8?B?cVhOMFl6NEcxVGtVdkNhNmJKZjdreWZwb3dsaFMwbEpjQXhpR3V4bTBvdkUx?=
 =?utf-8?B?d0hqM1FWL2lOUWlES2l1dkJGRHlOMC9rWmFzRzhvUjJ5UnY5aEpqWmtIc011?=
 =?utf-8?B?WlcxU1RlNHpTWXluK1ZQTmZ5SlphbjhVUDZIK1V6R2FYclRpSVFTYm40U2la?=
 =?utf-8?B?UmtNcVc4eG9XUmQ4bUVicll5eGVVWGI3UFBGOUVoSGtxWjBkaUF3aGlIV1li?=
 =?utf-8?B?Ym9lNkRwUDVmOWVCNmw0MUxqbzZjV2R3M2FLWjRxeHhlcE9oN3RFQXgvb1FX?=
 =?utf-8?B?MzN0c2h4cVRFeWxDWGVhcDM3S0Z0cXhtaTB5VWQraXJWVWVKU1FtZzZKRUtr?=
 =?utf-8?B?eHdjREQ3Q1d0bkFIOCtNYXpqSFJqczJLNkJqUm5ONEFXOG01R0J6TGdzMElF?=
 =?utf-8?B?ZHJiMmZpMTdGVEtkbzB1U3pIc0t6Ym1VOXlFa0FEU05YLzhzKzM5NG9oS3I0?=
 =?utf-8?B?YlpZUFRmdnFzQ2NHQWk5RXVuWXRoSWxTWDMzSzI5S05PWC84V3Rsbk01ZjVD?=
 =?utf-8?B?Ly94OGhEd1NnRUQ0WTFqTXdWWEJMM3N4ajUxNzYvYWJhdm1KK25teE9JdVpS?=
 =?utf-8?B?WUpKOW1aenF4dUVpWW1jb1pya2VPaWcycm91QXVHKzA3eEhiRm9UelBsRFc3?=
 =?utf-8?B?T1dabWV6dzB5Z3g5bGhGUDZyT2pRR1FLb05DVlNmcjJ0TGMvemNZeTdsVW55?=
 =?utf-8?B?aWlxVTNpWnFCWG9zQXFXcjhHd0lrSkI4aHBlTXhiZEhEVDAzY3ZValpnUWZR?=
 =?utf-8?B?NFVuNjV6eHNlcHg3OVhIeVZUdThVUzhFYjY2NW1SamVYbGlFSlMrRjlXTXQz?=
 =?utf-8?B?RmNyMDBGMjVsZUVCMGNQMStna0ZNR29kNG8wM1E1WXFKUEZVOTRtdFN2UWlr?=
 =?utf-8?B?YzZMMnlJdU1FM1g2d1RUR2ZBaUY5Yy9sVXliclpjNXdNQzJCbVE1R1d6RTNp?=
 =?utf-8?B?NlgzZFIyZXVsLzdMNWxSR2NKZHhkcmJub1dKRUhOTFJRejRkcStsT0tlSkxm?=
 =?utf-8?B?QnlPdjZUN2QwemRiNTkwNGFXMnhtdm1HNnltSHFoaWpaWnQ2T0lqdmIxZGR0?=
 =?utf-8?B?MUdGZUllMEVSN05WRmtEd2dFbGdGWml1amZ3Qkk2VVhxM2drdFRybmZ5N2FK?=
 =?utf-8?B?dk1XMzdQTFNRPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(4022899009)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ejJUaWtDRWI1VXMwdWpwMDJHWkZnOXZhMWs2RmduVk8zY0RGUkJxVFV0WUJD?=
 =?utf-8?B?cDc0dFFJa0trSjFZNGNBOUdFMFhVMTY2aFc3NlY2d3R0eXJiTGxHbG82cjFQ?=
 =?utf-8?B?ejU5QnhiaHZISlJEMkxoSjhtVXRQQjBXVmorUUhDOTY3UndaY0NYQUlpZXpI?=
 =?utf-8?B?NUErNTFXVzdXU1RLQzlRMjdKSjJwVXlvNDcvWWJKYWJOYW9XUGJYSy8rM2Vm?=
 =?utf-8?B?TnNPNDV1KzlFSFZYam9kNE9mK0hjMkxlUHUybkFqK2xUaEQ1ZlF6Z2Y4UUpo?=
 =?utf-8?B?dUhZUUJKcTdlSHVyajJ0S1JxMkU1SEEwa29aMXdWRW9nUmpscXU3d0pXODdt?=
 =?utf-8?B?SXVYTTd6V3VZK0ozaUcwVlVtWEE1eldLcTU5L29lODROZWtibENSRTdNMDJi?=
 =?utf-8?B?SzJ2eXk1M0xHdTQ3QlU3M1VYU0Z2Ni9aOUdVM21RR0NWZ1BwOVUyMStPeG5h?=
 =?utf-8?B?WlB5eVV0NGJPc2NPNFFRci9LTlJ4SENNQk14Q2xVZnVFWHNPTGdaR3E1bWgr?=
 =?utf-8?B?RWMwMWRWR0lYZlVGU1hJWTN1dzdhb0RoQWRoQnc0QndYWGFaQ2RIN0VSdERW?=
 =?utf-8?B?UHdEN0tMeTViZVpSeDUvTS9rZDdPV1E0R1VkNjRkc1NudkprWWp6L3NGYW5r?=
 =?utf-8?B?cmF2UEtIMVJmOW10cTk3UE9hRDgwTE8vNFpiTnpXMTlPWWhCbkN1dEZYRUZI?=
 =?utf-8?B?TG1FaHVtZmJTcTJQVDBkRmFWR1Y3NDFZTXNMc1hxa3JIK2VJTHRhbVJkWkdp?=
 =?utf-8?B?L2VKQTk5VU0vbTEySTFpQWZydU1Ca2M5c1FKank4dDI3cEdDbVlvdGNxa3Zw?=
 =?utf-8?B?Qm43RGdPVDEzM1pPWVVvd2R0bzhOSzBGSW1uNVNKVlZUY2N3ZExtN0dZbE04?=
 =?utf-8?B?dWlOTE9JMzZsZ0RZU00xQVFuTXZVSjhzejVRaXlydHJYZkJ4QXQ2enJWb0Z0?=
 =?utf-8?B?Sk1qdndlb2IvMngrT2V3UEdrTXpUeG5UUDJHaUtlZ3lidEUrTFhnNUI2ZWZJ?=
 =?utf-8?B?UmdaM2hhcEJRZ1ZBSUVZNGozSWIyUW5iNW5vUnZBZHJmeWE2MTF5QWpkMWFq?=
 =?utf-8?B?czVyRXdYRkJLb0dZWTFNR2JEMUg2dTZwNDQ0bzMvTVBscVhNV1lvN3dhY21M?=
 =?utf-8?B?ZW1vRWlBajljNHljd0kwdTNzSE5wYzA2RlNUNGYxb2ZXK0h0eUxwcFpNZis5?=
 =?utf-8?B?YStnUktMNUY3Qnhnc2tJN1VHN1lYMjB0cXNlL1dVeE1lME9QL1FDVHAwZzJQ?=
 =?utf-8?B?dTkrQ243OGF6NGtoTEFqejcxRGprWFVHSENuNDh2WU9UaTBVb0JxUU5lVXRE?=
 =?utf-8?B?Z05iTTV5L2xremNZdnFLMHpSa2VvUnIyWjdZaUhDSGI1NVRVZjlrV0NxcFdW?=
 =?utf-8?B?cjNrYjU3RnhHM3l2bnF0N3lYRDZ6cmp0Vm9sYjd1Ti9iN0xyQjBuVmlGZVI5?=
 =?utf-8?B?ZWRPbm54RzQrS0RZd1lNRFFlS2tNUDRCOS9TTnE5OWova2dudUVrRWx2NUxn?=
 =?utf-8?B?aTY5R1F5KzBvSUhwdFlMTytjMjFPRm1teThHL2NIZFlPUUFHWVA0WXk4cElM?=
 =?utf-8?B?M0E2dEhFdHlnNzNIRlJaY1R4YWNqajJ6ZlpvQ1ZobnlUYjZGSUZVOE5pQ3Ji?=
 =?utf-8?B?YndtbVNpRUZ1SzFjRUZLRno4blhhT25odXRpVmpWYmVnN09Vam1CdjhOWkov?=
 =?utf-8?B?eUFnTjlQOEVMbVMwUDZGRzIvSHpvSFdzdDRqa3JMZlVkb3hGWTAzWSt6S3ZI?=
 =?utf-8?B?dWw0dVhVTWdpRUdZcGd5dVdhdndrWENndFloQW5VYm5JcWJqV01yWngwYXB0?=
 =?utf-8?B?aXFsVlhOR3YxRVFjMDZRTmFZeDhYU0tqbW9VbUJjZjc1MFpyUmkwOHQ1TEtm?=
 =?utf-8?B?QmpOQjhTTVpvaTIrL1RlOVJKSDVvaGY4N09qZUdrTGF3dW9wOHdQYzFLSHVy?=
 =?utf-8?B?Zyt5eGpqSWtkdnh0UXpJTDh6SmxCalRNVnQxeFZ3cCtnMW9hV0owYzJkYmF0?=
 =?utf-8?B?cUxFcVJYYzZMZGJwWTcrUGhPUnVMSU5jay92b1dwTndvZ2pYOEx1L2IzQ3ds?=
 =?utf-8?B?cGo4UUI0eTl6VUZNT1RFaDFNOWpkTjUwUnZYRGNyUEl1MnhVQ1BTUXFFUmw2?=
 =?utf-8?B?d0J3aC90MmxWRkFyOS8rT25qTlljZkp3UTkvN0NMNUVuQkVlZ1BZdnFHWnJK?=
 =?utf-8?B?WnBxU0VDWGV6aGw4WDlQMFJtaExxVkdWNGVkMnAwZWhjSmdOTHhwSnJGRWJ2?=
 =?utf-8?B?OTZVN1JJWGM4UWlYbDd2SGF1MXhYbEZ0S280MFpGWHByTlVnUGdLZXZWd3Nz?=
 =?utf-8?B?ZnBqQlIrem1oUFl3SFdqR2JMNS9IMHQrWE5iaXltQ2pjSDhrUklJZz09?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2489ca21-a4ba-4b2c-a9ee-08de42a7de38
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2025 04:49:49.1087
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IT0XS2/UpZSkPAUWPvWtK22vo5Vrgw5D2uXI2QqFfegxtoIJnEscldEJ5YqDpel99Lp6aV4VPP0w7vt5M/iDusQLrrx+EQZOVlI5eQPv4OE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8022
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: 8hN6Bk-7BmTqW1mVKoMEuO2zUHCsfRTc
X-Authority-Analysis: v=2.4 cv=To7rRTXh c=1 sm=1 tr=0 ts=694b70f0 cx=c_pps
 a=5EMrObNM7I5xfgT5kXX3QA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=GHR8O2WEAAAA:20 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=wH-8bvzEYDpbLcjuQW8A:9 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 0i6NoGk0l5Ivpk_Xh5TYZajX3_9ZYYzI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDAzNyBTYWx0ZWRfX55eJnn9nKQew
 iQTXphx9d3Pv5kYB2ycdKBI4hT+WUV2T3JO02F6Hb0JqFTEfzj0Sv5oDADghhz8UzBo2tRQ9Br0
 OQLDzKxSIYRpWj6WGK+7LUVsenfxwUNTCPwUglXaz+w56S9HBEmHePER4EHS2ab9fOUNxsYUqf1
 XP7htyf78W3bmphx0+VMLOF8G6M72slOylVXn03+Bo+LDxkK0nkRUvlGtLGPT5SpERQM306X9zW
 KERbQvm9EpkUXs6uQOpF4gvJyytJPGSIFihqpEGbYdG/5jKfnIbPgkr5/82pjUSnCdYxLJXFfCv
 ggrEjovrICLRWreMh3UX3+K5mYjkLOANwcGcLE3Xy5Xg6y7knkEIh+XtPldWncOwIy2MyrNUEzG
 iACsSv4TT+PpV7DCZ7kriIjXMQSkGQ2fQ1M4JsBCP6BMgUcotw4C8SHDbh9JV1iIoTnR4wkZfMm
 6FUO/vtWlvxi6pFlsSQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_01,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240037
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Dec 2025 04:49:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228521

Please drop this v2,
there is slightly differ between development git vs released tarball for 
vte,
I need to tweak the patch for release tarball, v3 incoming

//Hongxu

On 12/24/25 11:16, hongxu via lists.openembedded.org wrote:
> $ echo 'MACHINE = "qemuppc64"' >> conf/local.conf
> $ bitbake vte
> ...
> |subprojects/simdutf/simdutf.cpp:20533:7: error: there are no arguments to 'write_v_u16_11bits_to_utf8' that depend on a template parameter, so a declaration of 'write_v_u16_11bits_to_utf8' must be available [-Wtemplate-body]
> |20533 |       write_v_u16_11bits_to_utf8(
> |      |       ^~~~~~~~~~~~~~~~~~~~~~~~~~
> |subprojects/simdutf/simdutf.cpp:20533:7: note: (if you use '-fpermissive', G++ will accept your code, but allowing the use of an undeclared name is deprecated)
> |subprojects/simdutf/simdutf.cpp:20559:7: error: there are no arguments to 'ppc64_convert_utf16_to_1_2_3_bytes_of_utf8' that depend on a template parameter, so a declaration of 'ppc64_convert_utf16_to_1_2_3_bytes_of_utf8' must be available [-Wtemplate-body]
> |20559 |       ppc64_convert_utf16_to_1_2_3_bytes_of_utf8(
> |      |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> |subprojects/simdutf/simdutf.cpp:20533:33: error: 'write_v_u16_11bits_to_utf8' was not declared in this scope
> |20533 |       write_v_u16_11bits_to_utf8(
> |      |       ~~~~~~~~~~~~~~~~~~~~~~~~~~^
> |20534 |           in, utf8_output, as_vector_u8(one_byte_bytemask), one_byte_bitmask);
> |      |           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ...
>
> The source file subprojects/simdutf/simdutf.cpp is generated by python3 script
> singleheader/amalgamate.py and the definition of write_v_u16_11bits_to_utf8 and
> ppc64_convert_utf16_to_1_2_3_bytes_of_utf8 for ppc64 [1] requires option
> --with-utf16 and --with-latin1
>
> [1] https://github.com/simdutf/simdutf/commit/497f4f29fe25a79af00ce25693a14682a5f669a5
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   ...-fix-compile-simdutf-failed-on-ppc64.patch | 57 +++++++++++++++++++
>   meta/recipes-support/vte/vte_0.82.1.bb        |  1 +
>   2 files changed, 58 insertions(+)
>   create mode 100644 meta/recipes-support/vte/vte/0001-build-fix-compile-simdutf-failed-on-ppc64.patch
>
> diff --git a/meta/recipes-support/vte/vte/0001-build-fix-compile-simdutf-failed-on-ppc64.patch b/meta/recipes-support/vte/vte/0001-build-fix-compile-simdutf-failed-on-ppc64.patch
> new file mode 100644
> index 0000000000..d84630c164
> --- /dev/null
> +++ b/meta/recipes-support/vte/vte/0001-build-fix-compile-simdutf-failed-on-ppc64.patch
> @@ -0,0 +1,57 @@
> +From 26e55adb9bd03fbd50bdce63aef8effc2d02b634 Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Tue, 23 Dec 2025 18:28:29 -0800
> +Subject: [PATCH] build: fix compile simdutf failed on ppc64
> +
> +...
> +|subprojects/simdutf/simdutf.cpp:20533:7: error: there are no arguments to 'write_v_u16_11bits_to_utf8' that depend on a template parameter, so a declaration of 'write_v_u16_11bits_to_utf8' must be available [-Wtemplate-body]
> +|20533 |       write_v_u16_11bits_to_utf8(
> +|      |       ^~~~~~~~~~~~~~~~~~~~~~~~~~
> +|subprojects/simdutf/simdutf.cpp:20533:7: note: (if you use '-fpermissive', G++ will accept your code, but allowing the use of an undeclared name is deprecated)
> +|subprojects/simdutf/simdutf.cpp:20559:7: error: there are no arguments to 'ppc64_convert_utf16_to_1_2_3_bytes_of_utf8' that depend on a template parameter, so a declaration of 'ppc64_convert_utf16_to_1_2_3_bytes_of_utf8' must be available [-Wtemplate-body]
> +|20559 |       ppc64_convert_utf16_to_1_2_3_bytes_of_utf8(
> +|      |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +|subprojects/simdutf/simdutf.cpp:20533:33: error: 'write_v_u16_11bits_to_utf8' was not declared in this scope
> +|20533 |       write_v_u16_11bits_to_utf8(
> +|      |       ~~~~~~~~~~~~~~~~~~~~~~~~~~^
> +|20534 |           in, utf8_output, as_vector_u8(one_byte_bytemask), one_byte_bitmask);
> +|      |           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +...
> +
> +The source file subprojects/simdutf/simdutf.cpp is generated by python3
> +script singleheader/amalgamate.py and the definition of write_v_u16_11bits_to_utf8
> +and ppc64_convert_utf16_to_1_2_3_bytes_of_utf8 for ppc64 [1] requires option
> +--with-utf16 and --with-latin1
> +
> +Add option --with-utf16 and --with-latin1 by default.
> +
> +[1] https://github.com/simdutf/simdutf/commit/497f4f29fe25a79af00ce25693a14682a5f669a5
> +
> +Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/vte/-/issues/2926]
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + subprojects/packagefiles/simdutf/meson.build | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/subprojects/packagefiles/simdutf/meson.build b/subprojects/packagefiles/simdutf/meson.build
> +index 330ee89f..ab934c30 100644
> +--- a/subprojects/packagefiles/simdutf/meson.build
> ++++ b/subprojects/packagefiles/simdutf/meson.build
> +@@ -41,11 +41,12 @@ simdutf_amalgamate = [
> +   '--no-zip',
> +   '--no-readme',
> +   '--with-utf8',
> +-  # '--with-utf16',
> ++  '--with-utf16',
> +   '--with-utf32',
> +   # '--with-base64',
> +   # '--with-detect-enc',
> +   '--with-ascii',
> ++  '--with-latin1',
> + ]
> +
> + if get_option('debug')
> +--
> +2.49.0
> +
> diff --git a/meta/recipes-support/vte/vte_0.82.1.bb b/meta/recipes-support/vte/vte_0.82.1.bb
> index b5d6f2fb62..0a2535f21e 100644
> --- a/meta/recipes-support/vte/vte_0.82.1.bb
> +++ b/meta/recipes-support/vte/vte_0.82.1.bb
> @@ -19,6 +19,7 @@ inherit gnomebase gi-docgen features_check upstream-version-is-even gobject-intr
>   
>   SRC_URI += "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch \
>               file://0001-support-reproducibility-for-debug-sources.patch;patchdir=./subprojects/simdutf \
> +            file://0001-build-fix-compile-simdutf-failed-on-ppc64.patch \
>   "
>   
>   SRC_URI[archive.sha256sum] = "79376d70402d271e2d38424418e1aea72357934d272e321e3906b71706a78e3a"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#228514): https://lists.openembedded.org/g/openembedded-core/message/228514
> Mute This Topic: https://lists.openembedded.org/mt/116925096/3617049
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [hongxu.jia@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


