Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0C0FCFA477
	for <webhook@archiver.kernel.org>; Fri, 21 Nov 2025 05:46:33 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5613.1763703990749562544
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Nov 2025 21:46:30 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=nxkUMHpP;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3420b0e600=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AL4iOqM2433130
	for <openembedded-core@lists.openembedded.org>; Thu, 20 Nov 2025 21:46:30 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=gB3kKZZkFRSVq82iO/LfG/
	8MW7hX/p2KIuenTfNbfQw=; b=nxkUMHpPhDHi5MHusQ9Owv3KGhpD8kH2yC+4si
	3Ny13AXKAdo4LFXpeY/0TpbZX9kJVJYhhOH3+GT4P3o4AEetiGfOTMylbU+whttN
	oNWWbsdDP5rIVW4+UDuXCU4hn3WxPfAwJSUfpnnxgRvYxgY9+eTVj3m8CLHJrfzb
	YjdEdIkebwRK4J1BpOcX78oqWto5IRhDqdlPBzVPxFGbfyRioC15M5vdiNnxjESQ
	e6OjSiiJe0lWatqb+8ox/1GQX3k2/xcHO8agPtwUKfWxhUhrIaI0UQ2u9z+JHmzX
	Vw2vZB/bUNqeuvgI4EnWpMDsr94EOhcUVqW0jHl/oiVBgjKA==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011008.outbound.protection.outlook.com [52.101.52.8])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ajekag5e0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 20 Nov 2025 21:46:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K58PQSm55IiBQIaJRYRYq+7R8q4vc9gyBL4sJ+9T/MMhoXa0LddSA33kj0n5lQFbaKbdkvJW8m1smqg8GKq5smpOtNliDQIenO4p8EfJflgYqX7Y0iOEmH5UXJffD3l63qK0A9CIldPLdyhGxLhMMViYZk4ZOT5hZuaAfkIMFlYEa8rdVskhhFGJhd5eWP3co+2cVH7y7ixOwPb7bK5O1D2CkgdA8drHOd1Jz4ZEryZGjfS5sz1AlYOluMXlTvDW/tV7HpNXETZzAm72aB4ZNYsoONtcIlAD6wWiIJv6gKZQh2ud3FkPv706eJrILq5pvGjDcnefEsLNtyLeWFkGOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gB3kKZZkFRSVq82iO/LfG/8MW7hX/p2KIuenTfNbfQw=;
 b=MxV8xCoj8EDZLccg1MOZ394romwf+9ANFcS3MO8yGeEgo4pwywKVBv74Xl+3NCFVnN43+YrXBq1sNPGGRLgxfxCTNlOmbUevG4BqcIJFuVmBNv77Ziu5LDqPOg5agWi9l5UjmHmoPZr4WNTflnrnNBVKgkP85P8Ixv6E8L4VQlY6FG02cdtJz5aKljz5hmMhjA5fR/nAzi/AKsFO1ezWUiTckxjIu9yE/gHnkyDaJ/WUaO6lwvCAiSc5Fm+Vljc4tOWscMI0VsQUC+3sCh+TAZizDLfZgFEoFk65Ayso3c2pBirZD5SPyW5/JdekbL1L9Pi7GtI7/gL2Ex10Z5AyzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by CY8PR11MB7268.namprd11.prod.outlook.com (2603:10b6:930:9b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 05:46:25 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%4]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 05:46:25 +0000
Content-Type: multipart/alternative;
 boundary="------------npwH8XGu0oC4TlzIv0Vgwmyv"
Message-ID: <3767419f-6fb4-48be-815a-601c883475fe@windriver.com>
Date: Fri, 21 Nov 2025 13:46:20 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] bitbake.conf: add new variable
 FIXED_SOURCE_DATE_EPOCH
To: alex.kanavin@gmail.com
Cc: openembedded-core@lists.openembedded.org
References: <20251120114041.193806-1-changqing.li@windriver.com>
 <CANNYZj8mj1ag5M_gh_sWTmBr0teW-Q2=LyDi1VDzzcfWNYokkg@mail.gmail.com>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <CANNYZj8mj1ag5M_gh_sWTmBr0teW-Q2=LyDi1VDzzcfWNYokkg@mail.gmail.com>
X-ClientProxiedBy: SG2P153CA0015.APCP153.PROD.OUTLOOK.COM (2603:1096::25) To
 DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|CY8PR11MB7268:EE_
X-MS-Office365-Filtering-Correlation-Id: 339165ea-e06e-4300-4b10-08de28c14f0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|4022899009|366016|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZWFJTXJRN2NYWEt1bXc1bThpNlB3WWo5VXUvRzFXTlZ2QkZ2cGQrMjBpU08x?=
 =?utf-8?B?aFRsZHd5aGtQUitSY01ramNVakprZVBBbjQ2ckZXb0dXTlFyejB6VWVZLzFM?=
 =?utf-8?B?cG1xekh6V3JMT2dscXJYc2VINWQ1MFlYcjNFK0haUDZua1pLUW5kNy8vZGZT?=
 =?utf-8?B?ZGFJWU4xZ3A2YUorSVFZUkY4QU4yV2RMTnlRR1gwNmxWWHgyTi9xMUlHTk10?=
 =?utf-8?B?bVlGZEdIT0NKS2d0aUwxejU0K3pOeDZqRy8vVVJPcjRSTm5wVXhwbkEzSllW?=
 =?utf-8?B?RUdwOVEzb1M1OFNZbExMQWJWWU9qYktSWjJCR25kSGtnai94cnpRM0gxM3I3?=
 =?utf-8?B?Uys0U0xOalNvRTlaVVBqY0lJeFpocHVJZ29FWkJvQ1NKdjBpa2c5cy9XbGl2?=
 =?utf-8?B?ZGxraHRSYnpPVVpwc2pZNE1ONWVibHAxM2xxdG9yUjBzL1Rjb2N0NTcrd2NK?=
 =?utf-8?B?ZGoyVDF2YW1PLytkU2VYenNpZDZZSEFDWXl5RzVuUWtZaGhXYTllWFFyNlA3?=
 =?utf-8?B?TGo5MnBXbjkwNVR6aGRaeVdoZGR1blBOcnh4d1FyRlVZZWNaSzdveURWamJk?=
 =?utf-8?B?SndVWFdlY0kvWXFMNHIrMGNYQWFmZ1FYcFM3RER5V2Zlb3RrWmFnS1QzTnhQ?=
 =?utf-8?B?TXJ0VnZFTlpkOEZHL0IvODJjMmZURk56Q0lJbkt1NmwvVmtqWnc4UmR0M0RB?=
 =?utf-8?B?a2pma3VBU2ttQTVlL3FBOUVSZUdxczlyMFdQS3lqODBkS29nMlJOYUdwUVNl?=
 =?utf-8?B?Z2JQWE1TZ3pOUVUza1A3M2paRlZhVUhxT0k2dWlCZEpaNmRDS0JRUU0vaks2?=
 =?utf-8?B?S3RGRzVsQnlJdTYxWXBkYTQ3THgrVFdTOTJBenZHMVdEWTRoQzlLWGxTZVg0?=
 =?utf-8?B?bEJoNW1sc09FbUxqUUpTMnlFaExpcDdlQk41dGZhOGR4MWFJd3dpU0JKOGVO?=
 =?utf-8?B?Y3B1Z3V3b2tXNU1VbE53UHYwK1FiQUZ0V1dzK2JVWWpndUpGMjRrREJzY1V3?=
 =?utf-8?B?ZU05Vno0SDArTTFBSFB3UlNGVzFQNys2bmlxQnZ6b3BpUExxNmRzMG80NXpw?=
 =?utf-8?B?NUhkOUs3WWNJbTVoTmRuT3dHdG9MSndnMGxnRkhPaFZHazZ3Vlc3eEZQM29D?=
 =?utf-8?B?WnJsb0JjaVRtOEcyd0RtbTlUQzkzZFVGQU9SOWxTWUVyeFY0MDk5UnFxcCt2?=
 =?utf-8?B?UjdYYlF5dU5EQlpSeTdCRVN2aUU3cGhHRFFBeG1jZURvaVNmcWpyL2Z6QTY3?=
 =?utf-8?B?b1paYkZ5TnJDczc2Qml4dnRGWG92OUg2TUdaNTdYTEgwUHJIWmxndEVGRGJP?=
 =?utf-8?B?cGd5Uks5SzIxbWd1cDZHenRLRXU4dTUweFNqQTVIUVR5eFo5TEtaOUJab25D?=
 =?utf-8?B?OGFxK0l1aGN1QURINjFRY3lvZHFvVTRnS2xyRVljNmlBRUFaRFljMlBjM3JY?=
 =?utf-8?B?REJMWk42VHZDRUc4T0VOVWdWWUpiUzhwM2VkckR5RUtmRzN3TzZYNTNKb2s5?=
 =?utf-8?B?b3VWZDc2ZWtOUEZxV0pTVSs2cGRyd05TWnBaTklIeUg2NmttMVRpbFByaUd2?=
 =?utf-8?B?U1FUWVRpY3R6YmJTK285dUtNRldXaHp5blRSSWhRdUFYWkZBSmRwbFBUOUdS?=
 =?utf-8?B?M0xXK1hGY3lydDhJODJnR1AyNmU1K2x1ZmliYSswankwR1lJa1pZR2wzUkkr?=
 =?utf-8?B?d3FMTmhmcm9XMWpUNnB2cmc2aHBBQkZSVjdTcGZ3T2VZam5FMWpUdS9TS3Bp?=
 =?utf-8?B?YWtjL09rS2NBZS8rdm9CZ0g4V3dDRC9SYXhGaDc0TEIrU1JRUTB3eHNRQXRL?=
 =?utf-8?B?MGF1citsU2c3d1laamlML1lZZHpSK252UjhpTmszZnlSVzcxZDk3aDdoWjJB?=
 =?utf-8?B?WE42eEpNUWNwSlhXYVFlemNEb0YyUVlWc25kMDFZN282c1E9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(4022899009)(366016)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UmdUa3hyczl4VWdlVFNtVUtvL3phWHRyQ2luTE9US1dzRjVsa05aQWJmQTN3?=
 =?utf-8?B?enlucFZnVUlKTGdqSHc5ZG1LRjY5Qi8vQUh1WkdEVWprNVkreFh0RDNLYjFW?=
 =?utf-8?B?Wk5vcTBzZEFMR2podEE3Q2NaZm85eWhCZzhwdFBpNUtiTjVUS3U0cEU4VTFN?=
 =?utf-8?B?Tk9lTzNUVHZKMU5jSldjZFNFaGlKZ1RwWmhZbTJOcVZFb1lIeTdNTUNJaVBP?=
 =?utf-8?B?Z2M4c3RaODc3eFNSTDdUbWVSVmp5Z1p4UWozTml6ZDRseHJiK3dBcUZnV0ND?=
 =?utf-8?B?a1pIZXFDK1ZZTjNtVXNxa1lFVHhxSmcrK0RsY2pVb3ZlVGdqajVTZEhubG5m?=
 =?utf-8?B?S0loMGU2V1d5d0FYTnlhUGNVeEhGTm5mNjROelpnalc4YWE4S3NzQzhqa3Jn?=
 =?utf-8?B?akY0RFFYRTY5Q2VDaENaTnBOb3ViRzYxQ256MmI5TDZqaGgrVXA1eUtMdU54?=
 =?utf-8?B?amduelUyM1c3Y096RVdZZDJIaW5Fb0dybk5ubEVqOENoY3Voc001ZWMxUmZi?=
 =?utf-8?B?eWZoL3ZDUWVqd0o5dnRVQmtuWWlsTlNrMUZoazQzSkRCbGFLUkhHQ0RhcXJQ?=
 =?utf-8?B?VHFxQ3FBS3M4QW9CUkZadHg4eVF4SnA0cnhWaUJuQ25lb0FqRlVFVXpaZzhx?=
 =?utf-8?B?MXNSZEJrU0dtSVlGTituUW0xN3Z2dFRFWitGTDRvSllQMVdoNFEzTjE4ZEZz?=
 =?utf-8?B?NlpZd2tjTE9GdnJ4bHE0S0FlVHBxY1N1ZXVXS0JUVGNta1ErSU5vZzArTW94?=
 =?utf-8?B?UlUxeExtQjIrVmdDamJhdlRRNHp2c3lLa2xGRGIvK1VFMitRMzZKRFhkcTBq?=
 =?utf-8?B?UUhZRVhCRWJHSElaTC9BdWFxNDcwaHFNSnErRDNicjkyTWM5b3AwNHFLcUVn?=
 =?utf-8?B?azRpM04vOGxramNLL1J3WDFEWTRlSjk5MW9wQ21mcmVvVFRLYlIwc0pjQ0Zu?=
 =?utf-8?B?Z1NKOWVqVGo4YWFhZzBQOC9wRkh6TlZRS3c5c3dHelZicWd1U3hSSWQvOGRy?=
 =?utf-8?B?enFCRnd1UVNKVlcxU1NyZFl2WjduZERMZCt0bVhLT3MrUUk2VitoOTBWc3N3?=
 =?utf-8?B?ZDUzUTRKSThod0VsUU1UVVhNb1hSTWpmQnkzWFcxMmR2RXlrV2JYR0VvcVdw?=
 =?utf-8?B?TGpibWE0UENjUjV5K1NTZzFadmtLQlBENEhNOWo3S2cwU3RPWnBaMlA1Snl1?=
 =?utf-8?B?elQ4UGpCcW5DYzdLVWpCcHVYVnA5Vy9aVmlobUVzUXJWcCtVcWMvWXBVd2gx?=
 =?utf-8?B?WWw4YnhyMHIzMGh3NGpjQUdyT2JDZ1ljRU1QNEN2Z1RKMzlJVE9HbWcvQ1pY?=
 =?utf-8?B?b0lYTFJKZzFMbUpUdmtjVGE1eEtQcHVtbGJWbGpqeUo5UXBFZDRWOXRsTTRP?=
 =?utf-8?B?Q2ZwUEJEY05rRVd3SWNPTTkwTFNhVkYzWTBmRGU0eGNOTTZmeS9RUzBOalcx?=
 =?utf-8?B?Q2UrNGlDdkhYT1J1cklrdnJxQjh0ajhVV1BNWmo0Z3Fqd1BBREF3MmFhTDdC?=
 =?utf-8?B?clI4eSs3MFdINlA4cEVKeG1uTFFSRWJ5Qll0LzhlTERSejhLVG9ZYmFiQmND?=
 =?utf-8?B?c2xDZWZmQVJVQ2JpTlpJVTFIZlA3VC8xUDBTczBvNnoraW1TblNYT0pZRmMx?=
 =?utf-8?B?eWNHcXFNbkY0RlZjWmh0WEFyTjBCQ0JYT2M0QUdoR252am9KaStwd0dHUTZB?=
 =?utf-8?B?MGZFd01jVno3Mmc4dDdEUlkybG54cXdMUE43TnBRNi83emF2M20wcEs1UndV?=
 =?utf-8?B?aE5xbHFqbWJxQ2VlaVhVZ0lWSXRGZ2JYOHBlUEJuckU4cHEzQUtURHUrUmds?=
 =?utf-8?B?UFhiS3NPd0RpTWdGS1VqUkJ5M25WelZxVlhsMENZajhKdGZaSnErSmJDSnlk?=
 =?utf-8?B?ZDhTTjdFM1RDbDRXcHdESTl4VTJscytoYTVQSjhTcXh5aXRGU0pWdWhiZHpD?=
 =?utf-8?B?UUQwWUk3NGNhbHZmNVhsenRWd3pRMElUR090alBwak1KSUc3eStDM3hGUk9S?=
 =?utf-8?B?d2N0NXlibmxZSmh0d2hTZmcrS1JnVWJqcURrRTFQTDZBTTY2RkIwR1h2dlkx?=
 =?utf-8?B?dm0rb2dMNDBrWCtjT3N2TVlUZldOMkMvblhuc3kvUGxmV0NiTWdMRHFkcFNh?=
 =?utf-8?B?Qmg5aXhWT2VKeDEvZHZ2Z0ZJdUpyZTd1ZHBQWTRCQzRKL0pwaEEveS90bHVW?=
 =?utf-8?B?aWc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 339165ea-e06e-4300-4b10-08de28c14f0c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 05:46:25.6290
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RV8hg7qB9z9dIzy5RkqU4Yl3ZQSpfpdQQeCakbUbG9TibPRzYL3wNZizkUGVvof+Elgd9ZYHDWoQlizxizghdg/lpEMIavqtrlyD55ltgy8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7268
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDA0MyBTYWx0ZWRfX8I05qCAeYgPO
 zWRGlxSWb33u6cB+YQYvDXSp/wNeVD3VSzKZpaBp3glnwAmLtzvIVsZWUIHIGA5SdBKamSsc9Vs
 iOdu9/+C7BYHCUQI3GNscrMN8goYLldZ10uSo96Mc9oGovM4BjzF4v2mkogC7FT7jYllgeGpOXR
 avWFNzYoEeKZm9/mi3FsykQfttPDKkzD/vJXSn7+qOkumN5AgClaFuIw6RcbO/i5YVGVaLNPsnd
 mEUMBnv+c8c4zeaNYoqUCnlCaP7Gx8R5TKg/+s39mCejUfqYvIJuVwUVuxX+TeZJfLkiDv4E2DW
 RnqbwHLJ2a1fjQbnY0M5KhsYqtePYp4mXN8Z+t1R4p97zDO2VBhYv02HpbRvypUf3ks7NiMpFT9
 mYCVQ7giwk5IbV1ODifswYOsoMluKw==
X-Proofpoint-GUID: wILSO5S9GvYFFL3FOr1WgVq24xNdTpOG
X-Authority-Analysis: v=2.4 cv=YIuSCBGx c=1 sm=1 tr=0 ts=691ffcb5 cx=c_pps
 a=56WOIFdoL1k8+DRIoLPNvg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=JQSNpBNHAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=hiOClYlC7LBd86DnzNIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=pGLkceISAAAA:8 a=yj-aMKAYKbz0kkd27lYA:9
 a=fSqxbhsRKn-HUEuO:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: BMImOouICIX5yOl2tl5fvA4q6RHwm2nY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_02,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210043
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Nov 2025 05:46:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226648

--------------npwH8XGu0oC4TlzIv0Vgwmyv
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5AL4iOqM2433130


On 11/20/25 19:46, Alexander Kanavin via lists.openembedded.org wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Thu, 20 Nov 2025 at 12:40, Changqing Li via lists.openembedded.org
> <changqing.li=3Dwindriver.com@lists.openembedded.org> wrote:
>> From: Changqing Li<changqing.li@windriver.com>
>>
>> Here is SRC_URI of jquery:
>> SRC_URI =3D "\
>>      https://code.jquery.com/${BP}.js;name=3Djs;subdir=3D${BP} \
>>      https://code.jquery.com/${BP}.min.js;name=3Dmin;subdir=3D${BP} \
>>      https://code.jquery.com/${BP}.min.map;name=3Dmap;subdir=3D${BP} \
>>      "
>> When ${BP}.js/${BP}.min.js/${BP}.min.map are downloaded in a git repo,
>> and this git repo is cloned locally as a PREMIRRORS. In this case, mti=
me
>> of these files will be current time when checking out.
> I don't understand. Is SRC_URI tweaked in a .bbappend to something
> else? Can you provide a way to observe the issue?

No, there is no .bbappend. Here is how to reproduce it:

we have a git repo,=C2=A0 which contains downloades sources, which contai=
ns=20
jquery's sources: ${BP}.js, ${BP}.min.js, ${BP}.min.map .

Create project under path A, and clone source_mirror under=20
A/sources_mirror, and set A/sources_mirror as the first PREMIRRORS

Create another project under path B, and clone source_mirror under=20
B/sources_mirror, and set B/sources_mirror as the first PREMIRRORS

In this way,=C2=A0 since jquery sources are fetched by git, the files mti=
me=20
is the current time when the files are checking out.=C2=A0 So files mtime=
 in=20
project A is different with project B.

Then bitabke jquery under A and B get different rpm package,=C2=A0 the=20
different part is "Build Date", which is get from source_date_epoch.

According to logic of get_source_date_epoch,=C2=A0 source_date_epoch of=20
project will set to the youngest file of the sources.

in this case, unstable files mtime cause unstable source_date_epoch.

//Changqing

>
> The bar for adding new variables to bitbake.conf is high, and we
> should strive to avoid that.
>
> Alex
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#226615):https://lists.openembedded.org/g/openembedd=
ed-core/message/226615
> Mute This Topic:https://lists.openembedded.org/mt/116389229/3616873
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [c=
hangqing.li@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
--------------npwH8XGu0oC4TlzIv0Vgwmyv
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#cceed0">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 11/20/25 19:46, Alexander Kanavin
      via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CANNYZj8mj1ag5M_gh_sWTmBr0teW-Q2=LyDi1VDzzcfWNYokkg@mail.gmail.com">
      <pre wrap="" class="moz-quote-pre">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

On Thu, 20 Nov 2025 at 12:40, Changqing Li via lists.openembedded.org
<a class="moz-txt-link-rfc2396E" href="mailto:changqing.li=windriver.com@lists.openembedded.org">&lt;changqing.li=windriver.com@lists.openembedded.org&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>

Here is SRC_URI of jquery:
SRC_URI = &quot;\
    <a class="moz-txt-link-freetext" href="https://code.jquery.com/$">https://code.jquery.com/$</a>{BP}.js;name=js;subdir=${BP} \
    <a class="moz-txt-link-freetext" href="https://code.jquery.com/$">https://code.jquery.com/$</a>{BP}.min.js;name=min;subdir=${BP} \
    <a class="moz-txt-link-freetext" href="https://code.jquery.com/$">https://code.jquery.com/$</a>{BP}.min.map;name=map;subdir=${BP} \
    &quot;
When ${BP}.js/${BP}.min.js/${BP}.min.map are downloaded in a git repo,
and this git repo is cloned locally as a PREMIRRORS. In this case, mtime
of these files will be current time when checking out.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I don't understand. Is SRC_URI tweaked in a .bbappend to something
else? Can you provide a way to observe the issue?</pre>
    </blockquote>
    <p>No, there is no .bbappend. Here is how to reproduce it:</p>
    <p>we have a git repo,&nbsp; which contains downloades sources, which
      contains <span style="white-space: pre-wrap">jquery's sources: ${BP}.js, ${BP}.min.js, ${BP}.min.map .</span></p>
    <p><span style="white-space: pre-wrap">Create project under path A,  and clone source_mirror under A/</span><span style="white-space: pre-wrap">sources_mirror, and set </span><span style="white-space: pre-wrap">A/</span><span style="white-space: pre-wrap">sources_mirror as the first </span>PREMIRRORS</p>
    <p><span style="white-space: pre-wrap">Create another project under path B, </span><span style="white-space: pre-wrap">and clone source_mirror under  B/</span><span style="white-space: pre-wrap"></span><span style="white-space: pre-wrap">sources_mirror, </span><span style="white-space: pre-wrap"> and set </span><span style="white-space: pre-wrap">B/</span><span style="white-space: pre-wrap">sources_mirror as the first </span>PREMIRRORS</p>
    <p>In this way,&nbsp; since jquery sources are fetched by git, the files
      mtime is the current time when the files are checking out.&nbsp; So
      files mtime in project A is different with project B.</p>
    <p>Then bitabke jquery under A and B get different rpm package,&nbsp; the
      different part is &quot;Build Date&quot;, which is get from
      source_date_epoch.</p>
    <p>According to logic of get_source_date_epoch,&nbsp; source_date_epoch
      of project will set to the youngest file of the sources. <br>
    </p>
    <p>in this case, unstable files mtime cause unstable
      source_date_epoch.</p>
    <p><span style="white-space: pre-wrap">//Changqing
</span></p>
    <blockquote type="cite" cite="mid:CANNYZj8mj1ag5M_gh_sWTmBr0teW-Q2=LyDi1VDzzcfWNYokkg@mail.gmail.com">
      <pre wrap="" class="moz-quote-pre">

The bar for adding new variables to bitbake.conf is high, and we
should strive to avoid that.

Alex
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre wrap="" class="moz-quote-pre">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#226615): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/226615">https://lists.openembedded.org/g/openembedded-core/message/226615</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/116389229/3616873">https://lists.openembedded.org/mt/116389229/3616873</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:changqing.li@windriver.com">changqing.li@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------npwH8XGu0oC4TlzIv0Vgwmyv--

