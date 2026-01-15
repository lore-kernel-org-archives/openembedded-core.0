Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 080FBD3CCA7
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 03:21:00 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28038.1768447255762529296
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jan 2026 19:20:55 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=Rk0yCBjj;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=54756eb491=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EKREBW2964952
	for <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 19:20:55 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=uhAp3W1stbPMwnJ3niNe2PPVHnGKLoVu851co4O0O34=; b=Rk0yCBjjm5Mg
	VwVugXgh0TMtaBqV2kQq/Xoz+gkMjCXOw/0/Nd5cXlvK3Ac6Cqm9i4J6R7SUvVGV
	Si81eIphQCGkAXlyTK4Pqv/8p6sQof+1FeNf/kshq5bT4gfWskjfbt5/iBLClW7M
	sa8t+v1eUeTKxTitrMSuecvZmnk+/aCT27IDKPAy/AMstf7dPR4Bx4wxa+H0+tae
	gz4b/TnWk9Al4kojY6WrvpacbggnB7EHixuKOl8cW6aK+eY2f65atS7fjtZ8BMiy
	ScCDHLtXqisgET0Dog5QirPGMUJq91TFB3pFgSlzDO2H+2jgyhs1PIhhHyt/LsOh
	+Mj0UttbDg==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010008.outbound.protection.outlook.com [52.101.201.8])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bkjx0w8ju-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 14 Jan 2026 19:20:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qIMWPPz/KO1t1i0hwXPxkcc1Few7bSa1/o2WoefgbMqbdIPRxwfuCNV9RBc0pnFva7i1TILX7bnsv00DBHd2nOCh5PZdEVXR8jqPkqDl9mJxpkBQv9S4AqoXS4EjeM1ONewBmTnBHpwD69/AkQpAGotjILFV4XuhQDXA87UVrl1Aqn02Och8CjMn2otuyO1zdvKwIYoSQgiqDrdtP6fQJn6hGJtCUlOPAZg1t8u47p7yXVD64c/JRUs6+J8f0wJ/YsO5SRpSVXYXOtiHVxga1+c9w6dxWpt9OUljHfd3UrgcejXpIPm9JctXHTvc/l29bvPzn8pPmIcjeHpIDiJBCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uhAp3W1stbPMwnJ3niNe2PPVHnGKLoVu851co4O0O34=;
 b=ekaZ3Y7j5j1+l/27rJZMiQiquvYsy+iYZEAjDKj9yLl+hYD5RqBQodq5O+FmP7Gh9P9NwqIXsPOTSwSyNPeBLC122hzMtp4Q5zNO5tJP/GLkBK9SI34aISZwFhHQchXe95XVkBvcDCHV58ZVvP7KOhiFq37y/pl0qA7a4XGtaHf2rBlhwdJ6wJL0FPy2yjGoz1B8hOynksyHZiO984ykjWs73zzbuuabbI0JP5QFvWzB2x2qSEOrq7aBxFWOsVjyP/pSQNzFmRVkQopKceI174H5KQi9jmS6i5A5V4veGrhLtPv0J/JgKuNJEIEyYeMeZyGfAKAnutMUos5m+rU53g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by PH3PPFEC5C0F28D.namprd11.prod.outlook.com (2603:10b6:518:1::d5c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 03:20:52 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%4]) with mapi id 15.20.9520.003; Thu, 15 Jan 2026
 03:20:52 +0000
Message-ID: <22a8492c-781f-4450-a107-10397f74bc56@windriver.com>
Date: Thu, 15 Jan 2026 11:20:46 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4] go.bbclass: set buildid to empty string to improve
 reproducibility
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org, bruce.ashfield@gmail.com,
        mathieu.dubois-briand@bootlin.com
References: <20260114064400.4070617-1-changqing.li@windriver.com>
 <a065254107d5d01736b8a68b67cf53c0b26fbe6e.camel@linuxfoundation.org>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <a065254107d5d01736b8a68b67cf53c0b26fbe6e.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SI2P153CA0023.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::6)
 To DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|PH3PPFEC5C0F28D:EE_
X-MS-Office365-Filtering-Correlation-Id: 66e3bceb-94bf-4a0f-63ac-08de53e51630
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7142099003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZmlKczZ5TkJZV1Bhb00wRGlQVlJqL1JPYWk0cTBPNnRqUWFCdmd4SmU5ckRl?=
 =?utf-8?B?b2ZZMTFxSVY1a3FqcVM3bkIrTVV3d1YveE1FTkJlQlhBdXdROVEvUVRDbGcy?=
 =?utf-8?B?dTNQTzhkdVhWS0xxVHFadFNKYXZ2eUppeEg1L2VOc1pPZ2VRNjRZU3lhOFRS?=
 =?utf-8?B?TXhaR1VzUm1nYS9iRzExa1Vrb25UNVRUUXNwNWJXWkxOVzczZVVFamIvLzJi?=
 =?utf-8?B?QUU0TUxlcDhVQ3I3U21zaXp0WGw5MHBGZWM5NlBBRExwc2VEZERRQUx3L2VW?=
 =?utf-8?B?eTdYV2ZvL1d3OW9ZaWhCV3BVR0oyYlIxaGVGbTJJRjVjWTRac2RkWk4rMlV4?=
 =?utf-8?B?eUJqa1lzajI2aG5hSFBLQ29PYlBzOFgzUzJDTmRCbWd6WTZMcDdJejYyRE9u?=
 =?utf-8?B?bmg5OEptT2YzdXFnQ2xWa2ZSdkhnQUNTZ2pzNklvYlVIN2YwU2MvaHNzaW1G?=
 =?utf-8?B?Y0tFQzBVY0JtQnBBNXF5ZEYyeXdGend1c3cyb042UWRBSDVrdmltRi9nNXQ2?=
 =?utf-8?B?K3Nzc2RQTGhITXdhelRkQi9Ic3VXbHdTeXNySVVRd0NVWVdpUXNOd05qNmNU?=
 =?utf-8?B?ZzF3ZDRRbjBsdmNFR2RvUUkzV21CSi9RejdsMSt0VGlCOGJ2VHFDcy9RMUQy?=
 =?utf-8?B?RTlwM1A4TXBPc1RDNTVxV2hxdmVENGVidmZnK3VONzR0TS9PY2o0TnJKVEFH?=
 =?utf-8?B?cytrZjljd0JGVkhWcm1kdGNzTWZFb2ZnWFh0aHo4UTY4a1p4b28zbUVSMCtw?=
 =?utf-8?B?YXJSUEtyTUNFY1NFYSt4ZGczdVZ4Zm5HN2N0WXNpdVhYdUQweGM1ZE5PVFUx?=
 =?utf-8?B?UUxNRk14dnFwNTBJV2pSdXY0Z2VhemFDZDlkWTJOeWRPYWRRNDM3a3VBLzFK?=
 =?utf-8?B?dTVta3AzZ0xaMVEzSlBWazJQUG9HaitaZkF2VkpWeUplbXBkbEZwSTlHMzFL?=
 =?utf-8?B?NzRwN2NNczl6K0REcU45YjJpRU5TTytxZUtxRThVTDk5Y2lIME1EbkdDNFJV?=
 =?utf-8?B?MUM3NHdZRFc2bG05WTExMHFTT3p0ekcvdEFPYUt6V0NZdHVZMjNQK1kwSGl4?=
 =?utf-8?B?S2U1eTZSY3hkUWpYdm8wZkZBdURLb2VnU0V6czIzQXdmQXZhbS9xcmhRNmxl?=
 =?utf-8?B?ejQ1bmlmS05CbzhreW9DUUJSVm9OUktuZ0dMVE0wcm1YY1hVNy9TZVVobDV6?=
 =?utf-8?B?Mk15NHpuYWpabG92b0t4YS9weWdvekxjUTdBZWhMNlFRQjh0QlllNmFmSzRz?=
 =?utf-8?B?bDdocWFaYUNNZi9xSEp2eS9yRzNYY004SHBCd0JhM05GUTg2NXBhbVVwMHFq?=
 =?utf-8?B?U21WSVZZNGkzR1VRZG01QkNjelRBV29uaDJyMkNBMEN2K296eEVIb3gzZlVa?=
 =?utf-8?B?eitaVmFGZU5xZ2RyZVE5eXgrc1pJckZHU1FzQ09NdkpXa1RmWGtGT05BRG5Q?=
 =?utf-8?B?QlVtYnZUMXBBVmFkd1orZUIzRjQ5UnVOa2RNN0VVSmJBMjFxY2VaZEJ3UDZa?=
 =?utf-8?B?dFNtNDdTV0VTMEVNZGZicWF4S2dLTm04ZHdaeDZZbjB1dHNIQ2hDL0p1dG1Y?=
 =?utf-8?B?aFpCTy9UZkllY2htektaSEpEakRqMmswKzdrQ0UvS3hyeE11dUhTSnppd0lv?=
 =?utf-8?B?QmJBVmZNRkV5VUl0VkppekZub3BkZjFYenpwSmQwcXJlVWlkb2pXTDhKQzI0?=
 =?utf-8?B?Z0VHdFkyVTA0S21PeHJBSERLSGl4aDZCTDU4VFVBMHVXaTU0MGFYM0JleFVS?=
 =?utf-8?B?UHZvcTUvVFJaUmVIeVFjakxTK3ZCZUxwdUJyeWRkbWgzTk9DWGtwY1F1RUFQ?=
 =?utf-8?B?SDkxcUNJMmZlTGE3TTY2WG5BYjdHdy9DaTBlM2YxOTZRTVQvK085TVo2Ky9S?=
 =?utf-8?B?SDllRTNXUHR5bGlDTHRYNTdOMkZ6eDFZVGFhOEhzMHJ0UmcvNHcrT0pyTWNl?=
 =?utf-8?B?L3d3d2xJOGpXVWlsSjFERDA2djdWalozaXNVVDhkeUxzTmJJZ3Rxek9ZZDQ4?=
 =?utf-8?B?cVlMNjlBMy9LTldqeTdsVU1WT2NxMmZiNEhnS05DcVNVQmZPTzRJRFFnSUE1?=
 =?utf-8?B?aEY3QVpWRUN6cXAxSGcrMldtM25SV2JJZjRnK0tGUVd4MEdlVlhTNS9YZVF3?=
 =?utf-8?Q?rcKM=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VDNobXlPWWp2cU9Ma25wNmRJczk2bW9YSGsvcmhrQjY0b1VqYlBSTTdTbTdI?=
 =?utf-8?B?US9PVldXOE5aUUhZQThxTHlaZWdoalNPTGF6WmplbmxMWUZaTlFlSmM4Z3pI?=
 =?utf-8?B?MWJ0MVVEZHN6Z2w3RkNETzVnbWZ4SlpmVElDNXBEMHp4aEJzeDBMUlU2VDVk?=
 =?utf-8?B?K3dmaHdjNUtuVkNwNnVUWHFZV3RyWGRZMG9VNkhPaytuL1Ira0xCZExkOU1s?=
 =?utf-8?B?NHZSTTVWVUlFdmZ2Q1gvMit2RHlsLzdHUVhiZHl6WHdmTHdwQytuUkpPdlY5?=
 =?utf-8?B?aUpXbG9UcnE4K3V0N21VdUxhd1RwL0xMa2o5bXE0ckR0RnBFZExsQTc1bDlN?=
 =?utf-8?B?dllzdkRCRk40aTVJb1p3ZFB1UUJLcnJsVkUrOHFLUEdxdzBqcVJLb0EreHk1?=
 =?utf-8?B?SWhEc2hCRXJEck0wYmMrYXA1TXo3d0c0YVpENWNTT2RlczlNRVQ1Tm5KMUI0?=
 =?utf-8?B?dThoU0dZbEhwSjRmM1d0Z3g4NGJmWGdTTGphMTBxL2l1bi9xNnlFTU1JSG9i?=
 =?utf-8?B?WVJvNlBRZTdqTm9xQzNPaWZWc2wwYzcvL0hzTzZpWWtRaEFHa2Y3akdoTE1G?=
 =?utf-8?B?WDNEdU01K1dyNWp6bHk4bzE1cXg4a0R4Wi9XOE1DTkNUbXVudm9XQ0J1MXVw?=
 =?utf-8?B?ZDNLOCtFRm1pa08xN3hyQlovTWRaSnFxZGVnbmUzeWg2WENmT0RuRityVUJX?=
 =?utf-8?B?V2FrK3RBN1BJOVk4OVFrYTRzNWlFNW5jR1FVMmdmQUZjQmhXOGFoOEd0SC94?=
 =?utf-8?B?cnFtUlpqOFhLQ1lEeXNJUTBZVk54WTZHRWQ3M3NZZmFwVncybzFVaXF2YTIv?=
 =?utf-8?B?U21oQnpiK1pUelhVdVN1UmpZZXVkUTFrdWRkYlNkVThtYy96NmFIWEluVmJp?=
 =?utf-8?B?Rzlad2YxOTRHcWFKbFVrT0xzTVpUNVpNNHp2QlZGRjhBNGttRkR0dWRVLzU4?=
 =?utf-8?B?TklhT0F3THZNejUwNE9xQXk0aE5zdkduS0F3QXh4NVhCaUxJRklka1J6cEZC?=
 =?utf-8?B?OUltYUoyT05tczUrU0NDaGFQYlk4anI4djByWFBEVXBwblFzV3o5UjduTVhF?=
 =?utf-8?B?REpXZEY2TTJTaVp3Tlh4QU0xQVQyaHJZN0Z2aEVCa3VKVjZzOTZyNXVGRk1L?=
 =?utf-8?B?ZSs5MWk3UHlrWUdXaThFTGdDR3hHa3RDZUZpVVJPMGZpV1hRYUtRM1FZZVhT?=
 =?utf-8?B?cTJTS0tEKzM3cER3OFNDNUlnV255eTB6OG16QWUxdzVId0g0cFM1OXJzVHRG?=
 =?utf-8?B?SWt1emwwNjZMRmUzWWZJc3IwLy9aV0s3VkNnRGNNZy84eERkdzQzMnkvdmg4?=
 =?utf-8?B?dmxJbFFxWkp6dDlwd0pPVjRtdmJaNXZLRktTdUZTNWRDcnB5T3NPd2NEUW9t?=
 =?utf-8?B?bkhrVTdobWVnRWNzNFVMbGVCUzF0b0JzOWRXb1hKbm92RU54WWtrbGE0dVFI?=
 =?utf-8?B?dXN0NFFhOVBTbkRQeFZsbFkyVVQ3ejlxQTNkS1dJRDdkK3l2THVITE1hVE16?=
 =?utf-8?B?a1k2YkhEdjlrNHA1cFAwdGxvZTJqdlFGVGs2V2NUeW1mZEp0L1FIQU1WckJQ?=
 =?utf-8?B?amtpVVRXV1dyN2QvWGpmUjVDcGJjSzVLVXZPUFRubUtEdHA0anhLTlo5NXow?=
 =?utf-8?B?Q0Vidm1OWjIzRGROV1FPWUUzSHR2cWhHSVc0VWZrcVpPYzNWdWpibk5WbHhh?=
 =?utf-8?B?VU5nNHVkVE5lVkV5YmJvYzhqRnkvNVNyUWcveWlBa09UME56NzBtUkl4bkZP?=
 =?utf-8?B?WHZnOXBTMjVMMDRsMlBVR0tOMU9VcTVoZDdGb1I0Y0R3OEEvYU5OQk9jUDda?=
 =?utf-8?B?LzRSdHAxRzI0RElESXp2eTBKOFNmbUEvUHlxUFhOWVpoREtVRHFyQ1BUWEFE?=
 =?utf-8?B?dHFVUkpEZEdJZ0REWEhEYThyTHdzTWk4bG1uQUZXUjFmZ2JiMlp4QjFMalpw?=
 =?utf-8?B?L1lBN2d2MTJKcmtrWUdnKzB6dXJBYk9lSVJhRVB3amlpN010QVFMTytkQlV6?=
 =?utf-8?B?eU9aa2o3ZERUSVFadTB0UzRvd3NqOXNDWE5MNm5vZ3lhWnFxcGxtOHVCb202?=
 =?utf-8?B?U2J5V0pvZlQzU01iS0Ewd3o3OUJEaEc3Y3NFOGZrT1Nrc1ZtOEhtYmtZWnFM?=
 =?utf-8?B?L3FqUGxaN1BUbklRUXlYVmhNSlVsVVlYNERuY0Y3L2JxT3JDWkRmMTQySURk?=
 =?utf-8?B?Z0svak5VU1V4MmE1VWgvVVFHR2tCZC9sakYzZkFnZFhaQ1RzaXdtUWpCRFNX?=
 =?utf-8?B?U0JtVHdWQ0gzSmIyUVkwK3d4VDc2R1d1NHJueFVUUXQ1OEl2bFhPZzR6VkFC?=
 =?utf-8?B?RE5HeDhkUG1zb0hRVlJNZ3lxVTRQaEtLKzVGcUxyK2pGeFlKb1BiUm9pZmI0?=
 =?utf-8?Q?BwtmZzRsRl3GxFq4=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66e3bceb-94bf-4a0f-63ac-08de53e51630
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 03:20:52.0939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QLRZWLoWtQlFJSeAkDKzocToelHgje2pGz5sS4dzRBChgi/0F4OwB6TX9vikwcsZ2hDLaSqUV8+ECUK9/ttUFxSAsz0UgrHIujB1dUeihGA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFEC5C0F28D
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: RSeLhyRxUmxeUZ9baIMMxl4T7VrLG_Qr
X-Authority-Analysis: v=2.4 cv=e5ULiKp/ c=1 sm=1 tr=0 ts=69685d17 cx=c_pps
 a=5av3elwsUCsOTZAZyay1PA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8 a=BmUP7Xt9BjQTwal25yYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDAxOSBTYWx0ZWRfX9LRSBF7c/615
 LQc6v4XreEbWKrxBE1krZrwcuIg3bQwJ1XGR7zNpux26TxD31ktCA7bB2JOZZaFD6JxFfaub0x+
 ESk9Y6oHr4O2ckW9mphMkD7APmrsG1MsDDi1oYok8fwLtTHl6yJvLSVMj6xpVNB5wH50yRNcRI7
 bP9/Ld17sfx3SsQVbJQn0myiQHtuEWnc150z+iZqK79xlwZfr5YhhUwTkrm8a7OlEibHxP4qD5O
 tcSaDALlP/ifWaDDyN4vwuBB4Kq7wiHah2uD5R2U9tNiQpstQdFVdFupO3OfARHRlfOHRI28mAW
 BaX4zdUDKdZ/RRsqDjyJIfcmzgF4N0/8/9zpk168MpdzesiMu7mQErq3fZ3vg3jXxLETc+kE2g5
 PBbdo1/EiePSQx24ZQDwcN+aNVkdN1O3OPew1/n6bjUWA6mCpr1TCr2GXWxRY/HQkCZS42ZXlVe
 ZhDrR+RUEGIvTTT6MBA==
X-Proofpoint-ORIG-GUID: Uek9uQ_fEyQmeYOe1cVliooru6viWZS1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_01,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150019
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 60EKREBW2964952
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 03:21:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229382


On 1/14/26 20:36, Richard Purdie wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Wed, 2026-01-14 at 14:44 +0800, changqing.li@windriver.com wrote:
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> Go packages and binaries are stamped with build IDs that record both t=
he
>> action ID, which is a hash of the inputs to the action that produced t=
he
>> packages or binary, and the content ID, which is a hash of the action
>> output, namely the archive or binary itself, Refer [1].
>>
>> And action ID include hash of modroot, which will include build path,
>> so this make go package not reproducible.
>> Refer [2], keying off module path instead of module root directory is =
a TODO.
>>
>> [snip of log]
>> HASH[moduleIndex]: "go1.25.3"
>> HASH[moduleIndex]: "modroot /build-a/tmp/work/x86-64-v3-wrs-linux/buil=
dah/1.41.5/recipe-sysroot-native/usr/lib/go/src/cmd\n"
>> HASH[moduleIndex]: "package go1.25.3 go index v2 /build-a/tmp/work/x86=
-64-v3-wrs-linux/buildah/1.41.5/recipe-sysroot-native/usr/lib/go/src/cmd/=
buildid\n"
>> HASH[moduleIndex]: "file buildid.go 2025-10-13 16:08:43 +0000 UTC 1704=
\n"
>> HASH[moduleIndex]: "file doc.go 2025-10-13 16:08:43 +0000 UTC 558\n"
>> HASH[moduleIndex]: 007b9fe2edd5b3232f5c98ae6c46e80a435141cb627ba5418c5=
314c0cbf4df7b
>>
>> Report this issue to upstream, refer [3]
>> Workaround the reproducible by setting buildid to empty, refer [4]
> The trouble is there is a lot of potentially important information
> going into these buildids and you're just removing that functionality
> entirely.
>
> Can we patch out the problematic component until it is fixed instead?

OK.=C2=A0 I will check if it can be patched out.

//changqing

> I'm very reticent to remove them entirely, that doesn't feel like a
> good solution.
>
> Cheers,
>
> Richard

