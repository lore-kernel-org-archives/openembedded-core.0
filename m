Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63F4AD358D4
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 07:40:05 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10409.1769672403667967969
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jan 2026 23:40:04 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=I7fMVCxK;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6489911ce8=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60T7U8PF2877601
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 07:40:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=Y1f+h1ezbj9uzyoiu3x+WriBflDNpxcNH47Mkdg8u4s=; b=I7fMVCxK6wHr
	cHLBMSaMgKQ2oTyTp4+Vj5kKMsx1AxKITBgMSnfTgGJKhAG/henOdPfPP4M9jPZi
	I2UuTDYeDi64Q9XTI4/HExF33SOf19Hos6TtHWUFtRogyIrmj43QxizzCK0rBUxs
	R9oxcB4elrybLv+Y5o2t1lhpIGouniBC9RFH60FdmVN7t3qGG9VG4kWFXQ7iQ02M
	JKlp1ivq/eiMU0hQ/GoT/MzW6gzNxq2CcpP4WiSZrlLNQ6FnGIXmf8Mw5CMs3205
	snUhJMMDCk0dvdTD6J3EvgtouQSWKnrskY403gSXmIryLljjscO8BeUzAQIevv3u
	r+h6UL3/TQ==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010010.outbound.protection.outlook.com [40.93.198.10])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bywwjg8q8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 29 Jan 2026 07:40:01 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QowRlD8UmlS6C9N6764PDb9lhuP7GRBqPeCm2Ft3uYG882aL2WcBTOzktosdMzCKjW+5z+HuV6UwbPyhsKnWLEEx4auNWgkit7MGFesOTAlAcJgeHFo5sDpj0Czyjs5kRj/MR32MSopwd5HdASoWXeAbI8/GWwvAZ7eMAPVIKXXd7wPNx3aZR42ollFzT9Jk3/xIvru6HNzoEep+4VkIQ6cWsV1F20mQaadqlo/DQcwFX3XJXaTX1rY/OXDErQiEMzp/rKNcsScuLXEwGlJMaeSK++CxZwIYMtJYaHSM37+qsWJfu3/POKTZNd+VW01VJ21rMAZgKODAlTAbchdH3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y1f+h1ezbj9uzyoiu3x+WriBflDNpxcNH47Mkdg8u4s=;
 b=cJarj5jT0vi7E/qBnVcFfF+oqPS9/yJjkovztU7wfBqgQzQ6r88ZGCoaoOuv8d2hn/zju9s6mdRFX55m8VnWxvJl3ECVPwFEvcByJzvcot8W9hMY3Datm7+3BPZv3pu3Q/91gVCugwKqaz/bkFkZ6NwSp2fzTzzyGOAPTT3E5jw9MJGeVPzNXFJotDn6hnH10ekLZV6k44vWA1jYbW7AVU9tTvnnujISy/G+Iwewmq7dqWlE3IvnAdbdL+7VMHNnIEgwPiddyWOTbKisuj8mny1in7J5K21ZeBsUVXFerNTyjqZfc0ZUHiwyou/NVPsc6M/dO/elRMHxjZtAVfdroA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by SA3PR11MB7611.namprd11.prod.outlook.com (2603:10b6:806:304::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Thu, 29 Jan
 2026 07:39:58 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%3]) with mapi id 15.20.9564.010; Thu, 29 Jan 2026
 07:39:58 +0000
Message-ID: <37a761eb-816c-4d57-8f35-8123d8b5edf7@windriver.com>
Date: Thu, 29 Jan 2026 15:39:52 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH V3] procps: support ptest when TCLIBC is glibc
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
References: <48503D06-1C65-407A-8EE8-B2E5099C797C@arm.com>
 <20260127085808.1980602-1-changqing.li@windriver.com>
 <9b4c9e13e430e3cbf0a45fe15b5a361b63a2b250.camel@linuxfoundation.org>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <9b4c9e13e430e3cbf0a45fe15b5a361b63a2b250.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TY4P286CA0052.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36e::17) To CH3PR11MB7297.namprd11.prod.outlook.com
 (2603:10b6:610:140::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|SA3PR11MB7611:EE_
X-MS-Office365-Filtering-Correlation-Id: 7333634d-b5cd-4d9e-984a-08de5f099a34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?QVRzOHNnODV6WnROQldzVHVaTEdLUC9PemRaSHFsdDNOc0hoOXpoTU0xUzFw?=
 =?utf-8?B?c25sUkxRY2xHdWpkdVpPOGFtNzVVQ1E1cWFTTUJBNGZRV2lSUHlDaHVlajJC?=
 =?utf-8?B?MTM1ZGhrTFREU2h1UndLejE1dnZtcjllekF6VnhxcXo4QkhZMmNqa283YVFq?=
 =?utf-8?B?MkJNNk83NGtaaGpPQXhZOVZodGREaGFEdy8xMVJydXUvOVJFTjdObnNuTkQy?=
 =?utf-8?B?MURyT3FTQ0YrWTZoSFJEK2xvbU9vVTgrR2hWQjkyVUx6UVRaclVSd1JHTmZu?=
 =?utf-8?B?SjV5WXJDOXFHTWF6b0RMYmJqVklWbVIrSzdsL0s1V2h0akk2Zkc3WnNscFR6?=
 =?utf-8?B?RFBiTEdHKzE1ZlNLRmREcCttNk8xK0tld0djeHFRMTVLU1BBbWl2N3FHV0Zi?=
 =?utf-8?B?bEJFU0s4WVdSMXZnd3pVdWxEYUJhRWh3MjR4N3pGd3lMTnF0U1pmU1dtMFBH?=
 =?utf-8?B?ZzBya1dNaVJ5Q2pNQnVnMWNCd0hNMXF1ZWZFVElsVzZwVFlpZjN4cHBQcmJD?=
 =?utf-8?B?TDJWL3RsSTdQUHErTVpvTWMxQkYyNnRzc0RVcEtqWG5JZXBLK3ZuWktkWE1U?=
 =?utf-8?B?c2hQcTRKc3EvTE1aSHA0RGZISTcxaXpzQm1PWFYyTGxHN1NicFBVM3g0VHBC?=
 =?utf-8?B?WW1MMEk2NkZsYjFTSHB4SnBhWElMeEdteXpmcERxUUpIcEh0cGFDNzMrMEpL?=
 =?utf-8?B?TkVKaHo5Nk5iTVN6RUtSZFFzZ1VTUjVVcnNXYXlEOXJPSXF5QndNWURiYmg4?=
 =?utf-8?B?blhQNS9Zc1VsS3FHelhuWGFGMlpKckhkakl6NmE0QXZZaUtrbnRUdDFlck85?=
 =?utf-8?B?WVlBU2wzK0Zzc1NqVUoyTGhXSExxM1p2UHBNQ0JnczEzdjAvYmNWcUtWNW8r?=
 =?utf-8?B?RTBtdkdzY05sVEMzZEJlaVZNZUExaXJYV09pTjBNRjFWTlFpT3V5SVBiMGVs?=
 =?utf-8?B?aUNJVGkzcWt0VXJrSldOU2gwa0tzNmNkdUU1bmF2OGdUdGFXR0VESThwdzE3?=
 =?utf-8?B?dXlUS296eUNKZGQ0SGVIeDlzQmRKYllON1E4MDhyb1Znb2VEQlVFTi83VGJx?=
 =?utf-8?B?Y0owNGg5LzAvWExhMEhQZ0FYbVdTMmFJY0c3WjhsVFZubnN3eTVMUEJ5OVhs?=
 =?utf-8?B?dU84SWVUZzEvbXRScDRFZEZDTVByM053SmNPamdqU2hlaGE5UmdmWE0wcWZ0?=
 =?utf-8?B?ekFxVzZyUkxIQ0pWU2NSNU5KL1FUQWlibUlYd2lNdHI0K0ZkY3FqMFVVeFRV?=
 =?utf-8?B?UTRac1pCdWdyY3lZaFdxcnc2cmlTYlBHTzhmSk4zSjR0RVhUTFcvNTNWUHNk?=
 =?utf-8?B?Z2VYWC9vL1UzeGs1RU42UktLTmlmL0Mxdk1nTEtqckJQZG9kVUpqa3ZnZ290?=
 =?utf-8?B?SUMrcXRFc0ltd2lrZzlsMmFVQzVBS0FJa2RtclN2cjBWTmhSVlN6dmRhMzJW?=
 =?utf-8?B?NEtVRmZKTk9RRktJNy9YYWVNQkxjMTJVVGsyME5RY00xNnlITysxUmhrRmlV?=
 =?utf-8?B?VXE3WFFaMjRSUDBmeVRaZWFMNjRJbGE1OG1hRHVTaFlEMnA0Z2Q1SVhDdURO?=
 =?utf-8?B?bDZWNHJYVjdkSXVwaytQZUtaT2lrbXdWSWw1eGFCVkxaWVIzUHRXdkVvdFpQ?=
 =?utf-8?B?MFZjdHptdGZxZVl0QXBsWDhTQ1BBZGZuSEVORDh4UFlnT1huQmJVeHlDWVB0?=
 =?utf-8?B?VXc5YjVNcnF1aWJhSWZhb3dRazg2Uzh6c0pOZzU0c1laVU5OQXhucVVjb3li?=
 =?utf-8?B?NExQMVg0M1ZFNHl3bVVMQjRLdVZoL3RJTFo1dzVHREdIQ0ljWG94V09YeWx5?=
 =?utf-8?B?dythL1ZXWG5jejhjZGs0RGFoVGtHUTRaRG4rQmo2SG1uVVBIdTljck5JcUVm?=
 =?utf-8?B?d1IrWGsvWGlKdldHTGxtS1hickhLK2dDQ0pzZUpqbHNQSS81MksrM1k3ais5?=
 =?utf-8?B?bEVuUGIxcFo2aU5QQUVwZ05aR3pnQzlHY2ZGeUk2YU5pdDlQRklkQ3hXaVhj?=
 =?utf-8?B?bllrSmtYS05JQ1hycFYxMEJVWGR4MHNHNXZjSlRpdWNzZU02ZUt2UE9sZWNu?=
 =?utf-8?Q?Ioc6dg?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bktCTlpBOFBqbDZ2a0g5Q29GRm15SG82N05TN2JuTGZpVkR1UU0zU2VxcTBO?=
 =?utf-8?B?RzlLdFFlVkdiK092SWE2OGEyemVUbCtvajEzTERHZmFzVXM4dlhhSkhsUUJq?=
 =?utf-8?B?TU9sQkF1K1BNZjBjaHhmc0ova1g1RVVKRmo3cnkxUmRVc1NWTG8yWHpSdE10?=
 =?utf-8?B?U2loNGJYek05Z0FIY0hHZlBQakJjMGpKdGZOQzVXMnZFY0FaSkMwNWxWSzFt?=
 =?utf-8?B?S0hrVG00WW9OQ1lXbE9rQTBuUURLSkhjcTB2V3VtdUs3SjFtTldGVU9oN2dS?=
 =?utf-8?B?eTZidHNPbVNiUWNwU1RmcmtxVWkwZDlOdXVGeVBVNUR3WmNWb25JS29Jc214?=
 =?utf-8?B?UElXRGhsMmQ0Ujk3YlFTdTBOQTZkQVd1U2lJQkovU09MUmNEQXZ3OC9hS1l5?=
 =?utf-8?B?RURIVGxuUVRKcnV3U3NIWDVYQXpYR3RwMW8wMFR1NDBiYmNvL2FEeFlXcXhI?=
 =?utf-8?B?ellPZlZJaEoydE50a1FTS0dyUTA2M0FVaU5WTkFuUFh1ZXc0OFdTWForZU1S?=
 =?utf-8?B?b2ZjanFGTDc4ZnVkVkZoK1FWaW9NNi9WblBaeHlLQWdSYXBDWFRLakMzM3ov?=
 =?utf-8?B?cWgxbWNwK1lUdnNCcWtoa0NZTGRmVG1jd20rSm44UXBQNUNyeGVLOWd5N3Y3?=
 =?utf-8?B?S0JKenBMMVNSbjJmRGliYUIwbEVsbFdWSzFWamhiem1EYUtNMVlLOFo1Vk1Z?=
 =?utf-8?B?S2plSThFR0lNNGtXY2p0NGVXeWZsdEdBbWloMHlFcHZ3MkNSTjg0c2VXbjRz?=
 =?utf-8?B?VlcwUk1JcTdIUnpiNHhSVlM3ZW9VTU8xd0xqazQ2VkF5TkFUYWJtSnZvaVJp?=
 =?utf-8?B?WGRTd2xEbW5FUVpuTjVNUENzNnRBQkdvcDVZdnZiMlZvZ0YxOEp6QWgramRY?=
 =?utf-8?B?a1RIVUc3Zms5NGtWVm04TWF5enl2VnFtMHMra21GV2hiREIrQm12RWMwaEZP?=
 =?utf-8?B?QS93RC9uOWxnbkdJVFJZaVhvT0hoMVJVZnBIWGZLQndXcmFKT1I2bVFiYkN3?=
 =?utf-8?B?MHhjaC9IY2Y3L0lIVEhwMzM0VHIxdnhCVWZTbjgzN0ZWTHljZm9vS3MrS3Rm?=
 =?utf-8?B?eUJVYndScDk3WVJyZ1FqYlRiVFFaQVFENE1kbEdMSUw0UisyQXFuWmdHMjMr?=
 =?utf-8?B?dGlkRkY0S2Y3U1J6cm1ianpvQzdVL2RtcS85MURGbzJPU1l1dUxjY2FVWFI1?=
 =?utf-8?B?M3lpWU9sVXovbDBLcDhFRFloc2Joc2RRa2lBZmN3R1dOaEpOZ1YzWGxpUDlU?=
 =?utf-8?B?d3gxNTJsUGlhblZMejhJOEM3K1hqWURsektzQUVKNm9Oc2J0VkMwK1creW1j?=
 =?utf-8?B?WXNWTTFHVDFaTUJjejRScy95OHpVVWhObVdzWWRXc2RLeXczdTd5S3lyTVZG?=
 =?utf-8?B?cWhTRnU0T3RHVVhrNDU4bXJLQjRkMExmYW1sOWhpeUxXZmxMRURNdnpJR0tV?=
 =?utf-8?B?a3FHanJUN1ZNNmYrUTEreUdUWlpNWitBRmxJMjJlU25ZK2UxREZSVWdPOWpT?=
 =?utf-8?B?VzU4em05TURJNnF0bjBpc1h3ODV5TmlHeGxkdEdpN3BkMDhpaUNQWW1YQUpF?=
 =?utf-8?B?SThUYzM5UUJuaWJyWmxOcUprbXBrL0xtVFZNc1ZuSXN4Z25VTWg5b0hKaUhJ?=
 =?utf-8?B?SkpSVHpoY3lUNWpQVWw3aUhEUlUydk9Dei9HWWJodlhlNWFVUThMK2FmWGt4?=
 =?utf-8?B?ZUtaTUFhckE5Z3Y1ZTRTNU82V1ZhUWpqMGxmckJ6OW1sK2FXZU40dHZjeUJo?=
 =?utf-8?B?eHB1aEg3cnFQZnZaOGlocE1PWG1jOVV3TTg4TmhvR1E2ME1DaGNnNDk0Q2dF?=
 =?utf-8?B?cVRpSHhnZnVjTFlyZFUzWGp2Q2hLSkZWcElZNkl5Qmgvdyt2SWIyTncxNVRP?=
 =?utf-8?B?Q21wMEVvQ3lMT2dsTnpPMk1KRnloUHVHbCtKbHJuVklxM3VJUDVINVNlNkdC?=
 =?utf-8?B?SXAvMUxPaCtYL05Nc3d3Y2xvcjFJUzJWMjJQSEFqOFZza1YxT2dnazV5V1Jh?=
 =?utf-8?B?dXRxM1ZOczFkUktMOWFLbStqTXc1aWV6U0xkWWkxcVY5SUVWd21lQnVmdm5v?=
 =?utf-8?B?czBFbGgzZWNSbkZhZDE1aTdSYTVaY3dTVmwrYjZ5TjFpUE1GUUozaUpVQ053?=
 =?utf-8?B?QjZ1WjNlK2ZwTk1lLzZEVUhIYi9XemVNRlUrbHlnZXZhV2oyVDg0N1lWM2xz?=
 =?utf-8?B?RHVUaGpuaHBaVGlCYm9uNUF3ZmtpZlF4Z3BNYm9rb2o5cmdCVXVoS1FxM2o3?=
 =?utf-8?B?RFNRckdtZzhOa3Y2NVVmME5UcXNwM1hiM0VYcmZacnhycmxwbG0wMDZjTWht?=
 =?utf-8?B?cVladGNpdnNvaXVTQlRTK1lWSXBiQVlZWi94TVRrU0M3bzZUMEIyTlRYckdx?=
 =?utf-8?Q?HCD1FX8ioeairSv0=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7333634d-b5cd-4d9e-984a-08de5f099a34
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7297.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 07:39:58.5530
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3jad+ECH1U8MsoK02Xx4kiSVBbfzZNIO/uZXKnXr9f81yCHaGmjaGmKAgD02S+M3xX65GM5hcFZWnwIVD7376OP1uoX89osiUYL7d5QYUzg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7611
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDA0NCBTYWx0ZWRfX7Oof+A8hWwhU
 CNPIxF+gd6KacSAWwcNxCo9N0dUFquhLDWRGR4VHbMn1KdmRunPYNL2TaPdtr90bvWiKfNmAfYE
 hLMLkr+TwHcFi3HLbwcdW89qlrATj47i6RGL47LM/EChN4ua8g6q4sscDVTYrAboz7vsWSucwGj
 6BHxCN18Ano9X7iNSgJpWIHqevc5NT8iYVX+QZ9iWaQ2V8yWDfgjubnAqGqnTTrh1lViW19xG/6
 XkPHezPTuUpJITNNwJ4RDXKJmg2VtKpyOd/jEQu2l5jUndGI4lTPv8MBsFYnyss8q79gsbLSqU1
 Ifqe0ch7y1J7Z36++eS1XdHWVKryxqt3Da0+nhXDoZnexBylMkJkRVNcRsMPOTE5nD9TtqZJZZc
 HSAZkJDW6Tkqxqvsy4a60Ojvr1q9knzpDQmZtrkbciXf+5IRFJ64kVMcuqwAQopdVvpBLOuiP0H
 sTzld/Ax2oDwJtJM9gA==
X-Authority-Analysis: v=2.4 cv=I7hohdgg c=1 sm=1 tr=0 ts=697b0ed2 cx=c_pps
 a=aTIAhetxxWeNPRurEgqQXA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=-fguY0gWTNyjXRmyRuUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 1LLWJ6bD5GnFcoJNSzEuADgW3tQql0QX
X-Proofpoint-ORIG-GUID: wfz1jTll4Dffsr1EHwlJCVPSOQFuvEde
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_01,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290044
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 60T7U8PF2877601
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 07:40:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230121


On 1/28/26 19:32, Richard Purdie wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Tue, 2026-01-27 at 16:58 +0800, Changqing Li via lists.openembedded.=
org wrote:
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> * support ptest for procps TCLIBC is glibc. The configure.ac only matc=
h
>>    LINUX as "linux-gnu", we can patch it to make test can run on musl =
lib
>> system, but the upstream testsuite should only run on gnu libc host,
>> some test cases only suitable for glibc, eg: Some of the error message=
s
>> for free command on musl system is not the same as glibc system, which
>> will make test failed. In order to avoid some other unexpected failure=
,
>> just support ptest for glibc.
>>
>> * procps's testsuite use DejaGnu test framework.  The testsuite is
>>    expected to run during build time, this implementation create the s=
ame
>> folder structure as the testsuite expected to make it can work well.
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
>>   .../distro/include/ptest-packagelists.inc     |=C2=A0 2 +
>>   meta/recipes-extended/procps/procps/run-ptest | 24 ++++++++
>>   meta/recipes-extended/procps/procps_4.0.5.bb  | 57 +++++++++++++++++=
+-
>>   3 files changed, 81 insertions(+), 2 deletions(-)
>>   create mode 100644 meta/recipes-extended/procps/procps/run-ptest
> This might trigger a ptest warning:
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/2990

There are two test cases may run failed randomly.=C2=A0=C2=A0 it run "pma=
p -X pid=20
pid",=C2=A0 and it expects the same total,

 =C2=A0but it is possible that the memory changes between the two walks o=
f=20
mypid's memory. I opened an issue upstream,

and send a V4 patch,=C2=A0 set these two case as XFAIL.


Regards

//changqing

>
> Cheers,
>
> Richard

