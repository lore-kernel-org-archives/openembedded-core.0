Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D658CCD4F3C
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 03:07:55 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.550.1779073675260600205
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 May 2026 20:07:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=hCEcOqiN;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9598bf1d35=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I22jhM252669
	for <openembedded-core@lists.openembedded.org>; Sun, 17 May 2026 20:07:54 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=gVfyFBViQ6ABRBFtaXmH2I7szSqyqmOJsnFJVTjsyyU=; b=
	hCEcOqiNScQhL7qOzwKgUfnGrC/WEkg9t6ISM+wuedVWSyJau8EcqboMu+yX42Zx
	HYesK+oc/Znn32qzJVNCNWfqzeQIFUA9PpoY7nTAnbSysJ4mX7NFpAE9IKo/yolu
	lnviITjkNacxW/3vNlhVpBxO30uZy8K+AlbVlEZ2P80dRd98bn5gWYsg5sB1dfML
	wWC9zxjouteQxM4GfO1OmLiORGFFClYv9+ZElKcmz+06rID7+VnBVsBWG0xEXnYu
	FemSB39b5tXHkAkMDOGmsHXp9oOlAJ9KaGxdWaoCSPOeLkH2ka3liZLtIzss7f32
	LoMy3MRtA8rXh3GkZ1s2WA==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013038.outbound.protection.outlook.com [40.93.201.38])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e6r3g97ae-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 17 May 2026 20:07:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IaekfPhg0qp6jIYD9co1jEs16BYpJkhZwuECFbSZJ/Hw8/oCbrF7Ka/ays//e0M9RXw1cgtOfjcqYs+Kr1vYQEH/K3CWgk9BXtaPIv41OQi5aKYGnCZYZKD2Y+X/KloQqVuL8xf5DjHOAkwZZ1CfnSCamtEQmJvYcBK2R1cRlAvfxhopMz2xoO2bpkTQTkzLx2dsIt49/laAh4oRgis2sFwNkUj+YIcHkDXaxpENXPlEYnOLY2GsnTHh6e6r8fSEYKxFWNAZx7jLfSnm0k5tPBWVK8mWXcv4/cWi3cdvVP53FvbqpH34eHC2joI9/I4PFlZ8gWF5/VPyhKkZZsvZOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gVfyFBViQ6ABRBFtaXmH2I7szSqyqmOJsnFJVTjsyyU=;
 b=Rug6QwKjlZcetoQwmC0mokFVCHqbrrS0BZp4XJtQzh3GO7SYRNB6dnunbg90IDIv5m8hcH8vJZk0uCzxf8L3IbA6VHnqYmF9vqKPjkkGqN5hYyzFise+vw66I7L62VL7u587cht1jezPJxwsV310pgway10Ts/bzF1d3CccLQzINhqzyZJZnk8B7BvMX5sLukNwAdLeXrvchdRDB4rTGWa1jDa4RpD/2+1MuO5jApCl8JvWJU001bFxoZWCHKTzfCO1rViuYQLTK9kGCmgvb6T1bt+r60bHIV2wTNTBrOeZpjiGaUqQduF04X7RoeDXSlmjsEsxBwngUBeC3T70sng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH7PR11MB6884.namprd11.prod.outlook.com (2603:10b6:510:203::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Mon, 18 May
 2026 03:07:51 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%3]) with mapi id 15.21.0025.022; Mon, 18 May 2026
 03:07:51 +0000
Message-ID: <2db00e13-31b7-4aee-af4b-18e4332294cf@windriver.com>
Date: Mon, 18 May 2026 11:07:45 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH V5 1/7] recipeutils: add optional stable_upgrade
 parameter to get_recipe_upgrade_status
To: mathieu.dubois-briand@bootlin.com,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Cc: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>,
        "MacLeod, Randy" <Randy.MacLeod@windriver.com>
References: <20260513052334.2271800-1-Qi.Chen@windriver.com>
 <DIIC2A22J8TH.2IC6O1ZQ1MODS@bootlin.com>
 <CO6PR11MB5602B1780BBA2AD5C925D884ED042@CO6PR11MB5602.namprd11.prod.outlook.com>
 <DIJ75SUU12NB.1RALWVIO1OS58@bootlin.com>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <DIJ75SUU12NB.1RALWVIO1OS58@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR04CA0214.apcprd04.prod.outlook.com
 (2603:1096:4:187::17) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH7PR11MB6884:EE_
X-MS-Office365-Filtering-Correlation-Id: 125e5679-a323-4e34-6e44-08deb48aa592
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|366016|376014|1800799024|4143699003|11063799003|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	Tx4y9qjyOH+1jsvejoJTQmCkcxj8CPzOmRi9JwSpU9klf66UhmDKXTliMxY767Qimt3F0YpdNmuK9jSH09jRtG1d/SoYgvBzveMklmEhz3Xgiuto3+yVzHyL5tVHJKjykXGS01T8xbJiwlvmwXWK0e+IQeeKzPFeJlNZzs15oIvHuLlVYfdiWxqKuIFLLlTyn6n+XU6bUX2B71ClqwC2D1NZoux5rZT0mpQ1czu8AxhGKdvVVCOKv9khKM2EIW92wQdIbG1r79Gl+f2jjmiv4aIOdl9GKUSwhdO00xms0Z+8Jyei6SdALiEpDlHXLtI8P3cBvMFpjeAvSyK+wlyb9bQvMcYKHVy/HmpbZHHy0zYhjLHq+4wK6SpBMgzCDmkkbRD+HPY4IjCvXwIPMWGK4ddYbQC2L0REI4eicYo3mXUumLtrVIZCK2KesFqguwJ5lNLMSEp/mgeR7WPC9t9JTHg1hqtbxdXiGOl6vL5SrM4+ALNAuNb6v76OTffbj/v0XBlvbsLVm+HdCuCmOtjaqUVARkIzFMseycTP2O2jbODPec3Se6B/BvVAcosx0OkS2hjss+bqVkU9GauI61oEpQKGWOGF/SwyiHg1OFat42Yvm8zaevw/c0BILuN4V3zdhjFOq4LlR5B/bTU+M3id8g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(366016)(376014)(1800799024)(4143699003)(11063799003)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eGM3L2JyRExDaWtZRnBjWlNRWE50aFhKT2dXQUV1WThQc1NyNTJ3Q09qN0xO?=
 =?utf-8?B?eWpUcEIvbEl2Yjk1emM0TGRhRjNDUHJldFU4cGVGdVJKNW5aRWlvRzRqa1NM?=
 =?utf-8?B?azIyK0VXbnpCZkNIcGc5QS9OZnorVVQ1NzR1eXhJT3Q1bkpIM0ordGt3c3dx?=
 =?utf-8?B?RVNoRVZoUS9wYmd2WXdqTFRoWVVnVTZscVBoeXZnYnVBckJaOGlFd0Ewdkta?=
 =?utf-8?B?VVdETyt1Qk5MV1BPZmR5aFRiVjBrVmd1S3BrZEJ2dG4yRVYwZ2xsbEV1Rm9J?=
 =?utf-8?B?cFM0emxpSXZtZU53NlBrNGozY3NDVCs0OXRGRGRsbGlXWmVLSGczeWZhUm9l?=
 =?utf-8?B?Vms5Vitsa0p1QWIzUE9FZkNkSDM1dXNweExFM3FnYkZPSDNVaFg3UnM5K1Fx?=
 =?utf-8?B?aTJ6L3ZGL21XUThjdzU0c3ZUZWZRN0JpRXBUQ1dsY1F4Vit2blVCN3g2MUFh?=
 =?utf-8?B?dkRTQXFmT0NkaWxhT0tkTGR6eWtpSnBYQ2pIM29zaW1WRWR2dHk3NFdHZkJO?=
 =?utf-8?B?ZUdZemRrRitzN2h0WjJOcHBjRDRiRDc0NUwvTW9pZ2pIdW5ldU5jUUJ2NVhQ?=
 =?utf-8?B?TG90SVZFYWM4SzNTVDZBZVlmZXFxUzRjWUtpSUwvTi9aeTA0L1p5U0V0R2w2?=
 =?utf-8?B?b25IRzVFWFEvV2NzN2FCa1pLWVIwcjdFMWRWN0F2NzcxWWp5Qzl6U3YwUnhC?=
 =?utf-8?B?bENXenNSVmJZL09pZG82SE1obkhMQ3FyQS9ZN3phQU9HNDZZMkc1NDFHakxh?=
 =?utf-8?B?ZmFRQ0M1ZVRsbDduU244RjZnMCtYQWZiWmYyTWIweUlnTzZGOGQvTlpXNTZ2?=
 =?utf-8?B?eU11K1hBSUtHV2hBT1ZzRjNKZGxOTG9ZeGE3djBzOTBqejNUbXFXZlUzdEFT?=
 =?utf-8?B?VnlvOEZQalVuTUgyM3o4T2FYbEZzU0ExY05vZ3RDNGhaNHZvdk1zT2NkOGVq?=
 =?utf-8?B?UFhSL2xUQmIzN1RzRStISXZpQVlCUGoza2orTG9KeGZwbzZ5bFR0aDJ2VUgy?=
 =?utf-8?B?TGsyMEUzeGVMb2tjMzVJKzdUazhaVTE2T0IySklqeHcrQzFKSG01Z2hyZmpW?=
 =?utf-8?B?OE5tMlJaeUlmM0JXcUZtR0plZ2pNTW1peFp3Q01VR2xNNzZmQm5DbkoxUkMr?=
 =?utf-8?B?dXFJWTEwODg2QndmVkVwQ0h3L0pXZE52NjJVSFVHc3FXbW1OblByWjdVcWI4?=
 =?utf-8?B?ZzNoUmcwYlJXUi9nWk5ob3ptTGZuaTIzN1hTRXE4dmM2bXlCQkxzSzVZaXUz?=
 =?utf-8?B?VlQraUF5YnRIbGFkQ2ZIYUlqRHlqNVdrTkM4RFVRQVNCNUcySVFDR0dSZ0dE?=
 =?utf-8?B?c2VyVmdKeWxkaWszUE0raVRRMGZFTnF5Uzl6NlIxT2luMW0zQTNORlFDZitw?=
 =?utf-8?B?dGZ6UUFQYVk2QnJwaEFva2RnMmJiZExQMzhUdTc0dGdHNE5paWtzTnlzeHR1?=
 =?utf-8?B?QzczaHNrWnVObGVVS252QXFzSjVDOS9sQ0JCdmFxdXl6V2x2ZDNwY2RnQ2Ns?=
 =?utf-8?B?QlppMzcrekh6T25JVTBXdTVsR0xBYVNVSkJJK0ZtaHVlS0FaU1JTZUhzS1l1?=
 =?utf-8?B?YVRoODV2MzFXWElJc1Q3U2lMZXY3MXlmbEZNYVlYRVBRUzIyR2JrYzJBVU9u?=
 =?utf-8?B?bCtlVWx0U0lsdnpEQ3dBMEk3cEtqT21qU3VnMlNkakt2VzBjTDBPZm5waitr?=
 =?utf-8?B?N3VRLzRwWjRNSXRvdkNRVG1zNE1pWUhXWUNDL0M4UTAyc3BPeHNFc0tQUFVZ?=
 =?utf-8?B?eEJYMnNWNmJWU2VzVlFMMk44eWt5VUROY1ZheHpmM2lEeVdOSk9zcVhVWnlK?=
 =?utf-8?B?SjJTakplRGRDbnlqSVROb3dlUjZ3MFVkWU42ZmxJK3JGWmJJZ01PbnAyenNw?=
 =?utf-8?B?Zm1QOG1hWkVlNldTVHFUVDI1d3JGVldoSVcrTE5NY1R3emNHUGNBdVQ1ZFhP?=
 =?utf-8?B?a2xNUzVNWXRCRlI0SUdIYUp1UlBuMWVGZVVYR1lpVzJ4aFIrbGowcURXdHZw?=
 =?utf-8?B?Q3UvSmdUNEVhKzBsd21Wd2pURE51cno3eWdNdTcrWHppdG40Vys3SnpzUFFm?=
 =?utf-8?B?STk2L0JRN3d4bGtIbEtHUXJ5cWtPdnNPNXZSZVlMMEo1azhWOGJBcFAwZFdS?=
 =?utf-8?B?dFNGaXR6cU8wMVI5VlZLNTJ6dW1MNXZXc1pTcEVobWx3Ymp6Vkh4N0NsOExk?=
 =?utf-8?B?d1pjaGtqQ0pUYm9ORElwUHl4Q1p3ZlEwZTZDNFpHRGhaY1VRUjByd28wZFhi?=
 =?utf-8?B?T3RkajNYSUxRSGtSM2RsSGVlNmpzdnEveTQxM2crcVduYTgzcGZ3QUZyTldQ?=
 =?utf-8?B?YUVYTmlLNjk1ZUswWTR4dWFCM3k0WWNRMkpKU3F1NUdjaDYwZVp4QT09?=
X-Exchange-RoutingPolicyChecked: 
	S3dBsJSJRX3qyE30a/wXm5KP1vzEL+kW6vsLzKUn0zJeMLxJrH8UyMTvqDuQVvXK3ImHqRG5e7/ThSht4x351RXIefKzLYWsrQRL0qIMLFGAgtyBITrUXKIR1ECp9zi9T7GfLHtBTJj3VdDIv9Vb2mEY6oCbhnCusgRYIYMvN2rnlwJJqqa6dohYBVtDDfZn6KPkfijW1AnkueP28ZShBLz452NDlxMWttMQDKqcyhe/Br40WEFtXLh1qcJvozmvT/ZkdegV/az/W+vsDyPLB3mTa80h78/+nZVOWSJUeN2UpK2EYQzTUVKr/E+JiaSLaZVe08TMANkdj3tmdx8/4w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 125e5679-a323-4e34-6e44-08deb48aa592
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 03:07:51.0823
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mxw6QeMhQgyPfbwu/gZUQF846GN6dl0wtwclcPSixEnBY2UAYHzrG/ckxGrxd/THl4M1WQ2WvQEhKoVmjVM/Ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6884
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: BGAb85UqQJJENMzhZAU0NpCw6pbd3M16
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDAyNyBTYWx0ZWRfX1IBRGbDNFK2K
 nrkEAMzUY75juG/GRyK/Ws76zTgentexFwMYf+2A0/DiNDyOKsXUrOjkK51W7ZdN4x5jvXENSJ9
 ayzULrXOgF2qE5jjBj16fhp36ZIyYVEDIhaLG35usDOjAz/UsRvssHbYK36TFgqN0kfNqJq5uxd
 HUp1CtRBa7okzUaApRb4HysvrWDz5zRAVP2cDYj2hAlpwtp3RAqFSz4RPtL3/Yp532HvFicKNOR
 +zvZ3t1dbN2c0ULJqbEIbJuWoVkPyHhuCs+ax1sWeX5MpT0sWxHHoiKvjFm7ptel24T6tEO6gNn
 NviLiQX0EeAGo1MDc/eRuKbu8t7aMt6jFacwKWhb3yd51keyx5RC30MbiNfFOJep3epQPPI/T/W
 zecMP69wWn7x5R0/+EQfYYLrOUBczlE6TCyrAlhbaMuUjwH2dVvjpelsH2QnD3R1xGDsZx3UJMR
 J5cwgZ9nlfuuGGHzeEA==
X-Authority-Analysis: v=2.4 cv=I45Vgtgg c=1 sm=1 tr=0 ts=6a0a828a cx=c_pps
 a=n9MmWVbgKLYxIbvHr99TLw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=ct_9NsyFYe89rYyS-C8A:9 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: WmpEWN092VL3NQtuhyIm7LyunpZfd0UG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_01,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180027
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 03:07:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237192

On 5/15/26 19:00, Mathieu Dubois-Briand via lists.openembedded.org wrote:
> On Fri May 15, 2026 at 11:06 AM CEST, Qi Chen wrote:
>> Hi Mathieu,
>>
>> I can't reproduce this issue.
> Hi Chen,
>
> Yes, I confirm I have the same issue on my side: I can't reproduce the
> failures locally.
>
> Yet I confirm the issue is linked with this series: dropping the patches
> solves the issue, and I have similar issues with the v4. It's not clear
> why in only happens on the autobuilder.
>
> If you have ideas you want to test on the autobuilder to debug it, I can
> easily schedule some builds. Aside of that, I fear I have no better
> solution right now, I'm sorry.

Hi Mathieu,

That would be much appreciated. I want to login onto the autobuilder and 
do the debug.

Regards,
Qi

>
> Thanks,
> Mathieu
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#237079): https://lists.openembedded.org/g/openembedded-core/message/237079
> Mute This Topic: https://lists.openembedded.org/mt/119293054/3618072
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [Qi.Chen@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


