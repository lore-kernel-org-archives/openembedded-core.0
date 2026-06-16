Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E013CD98D2
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 21:51:31 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2270.1781646682255771247
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 14:51:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=kM/KC9SV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=06276e21e4=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GLZ2Fp3880336
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 21:51:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=pK2R3HbmQ0v59rxpqJO/UU
	mTDU53J+ywgBq2ys+ocCU=; b=kM/KC9SVvcXPr9JESV+FCcoJvVUaNNPbnB+TXQ
	lqS62LO/sAEi2RVrrV6EhBgtdA2jhSR1Rw9nAfECwsHVuFzv3q608TUMiy424/r3
	hZOjie5zHLKmZkMp/qGKGL9OlOVitoQvnjXBuN30CbuZckqizMR7kKpq/PuT9qvq
	va20hsAXrK7bP9lvQJp44gEyviKncjgxY91j43/Uctceg7S+bPm73Pw9jxh7RWGc
	xwH08rKT4L/ayj9Zw5s/p+K82V+MuUgIWHglVyXrAEQL1AKFufeX1Jorbszao9JK
	xmnFZRqjY/G5KowiRMiiHw+0MKPdv6WbcstV0mY3+P76aa2A==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011062.outbound.protection.outlook.com [52.101.57.62])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4euef801km-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 16 Jun 2026 21:51:20 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AxJ5GeUswA5TuPXLZrLdFnwpVqVxn78Kme3/LgQNkMhYIco679ADl6PZoTSMnf3flUctxUt1X4OYpU9GOMaZ1lOp3QBOBZFpE30P7/Q6YTSKJQ1U1oVljYMEQ7Mm96V98Ge2Uvohs6WXbhFrSQErGbRX79LezM28kkUXKwWVWJIR60boqXA7sz29++yfNJQbJ6dxMXPYuoZW+bNdVRRJKiQTY2MJ18KlANDEHBok3syG+/CiA9IVGmuI4ilgC0RXKct2n0jdCEKbt3/ixl9b0tZmgYm4NeNR+leWj1/o0DPFT12IEP2veTMWV7Ykf/QActM/bRfeWTIGOlOLemS/7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pK2R3HbmQ0v59rxpqJO/UUmTDU53J+ywgBq2ys+ocCU=;
 b=JU57CYB7IzkSVxL7pPHvo2Ucpgpnhj61Nfigr6Ubp3P5REZMBWxkKJyD7DJP6mX+c9iNHfHeriYmddMEVeJjbQiGseyPQvjy8szbi+hhSyDMd2NBaUWJnOkcK/RzoyyRYvhnysBdJQc5vD2b1lwCrBIWxc1d0wI3mDjCGwlriqZakX8rpSjx14hchbYt8OHqXtSkbM4hf+V0yxreNYN3YDihnw8WghI8NEEKXqgvZQf8uOI+WhzaNwUwe10wqmco2Lt9sTAUA1e6FBYakrrii/75dgnucTKf9Q5TUc9DNLSQCoMBFsBenfFS53yAy8BK1O0sjak30F27Wx7BYNDbPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by SJ0PR11MB5937.namprd11.prod.outlook.com (2603:10b6:a03:42c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 21:51:16 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555%4]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 21:51:15 +0000
Content-Type: multipart/alternative;
 boundary="------------ncphTU6f8UZaUtXNRuXikDa2"
Message-ID: <23d301e7-a80e-4578-97be-e9d3b264ef6b@windriver.com>
Date: Tue, 16 Jun 2026 17:51:14 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: binutils: disposition for XCOFF CVEs 2026-3441/3442/6846
To: "Dora, Sunil Kumar" <SunilKumar.Dora@windriver.com>,
        Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Cc: "Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>,
        "Sadineni, Harish" <Harish.Sadineni@windriver.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>,
        "peter.marko@siemens.com" <peter.marko@siemens.com>
References: <DS0PR11MB7901A65C83AEBB08626B2B23E0E52@DS0PR11MB7901.namprd11.prod.outlook.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <DS0PR11MB7901A65C83AEBB08626B2B23E0E52@DS0PR11MB7901.namprd11.prod.outlook.com>
X-ClientProxiedBy: YT1PR01CA0132.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::11) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|SJ0PR11MB5937:EE_
X-MS-Office365-Filtering-Correlation-Id: 73bba636-2eaa-47ca-75af-08decbf163a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|8096899003|56012099006|6133799003|11063799006|13003099007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	n05p3tQKXnHuIJoNx5lczDLDIk4iJSe1xFFAWjn1+pXrWS0dzCsNEIbjMDZEXIsGbLL1dX3psBP2fUMfCc7RnJoNwJ7ugJZZe3G+i0pASyRxe89xbRGujqEdjloLuvICuZJ8uv7X7ow5lQ2ZpTsnw2a91jWZy7zK81sabLasoS0efufHUOtBxJvMN5BJDuXDH2ZT0ngVXt/8y/2Xo3nKDHCohxCof+VmqlpAPichyzfZUhhQm4fy27LhVkTBtnKKomIC5KLUalC/ICOfy60zUde1MYCIn5VXvxqxwchyzoIV8HVKBAviar7+DTNbIt0YhBkhzrLokxb6HAfvZRg2bXn1gcHLjEMT7qG36iG7EKtjKgi8ObYMkvZT83Qy/Y/IMNNWBV2Y84+x10D9WOnBcfHb0whVmSCH7D18KYOxZVG8bDlRFe9evncdWJ24OCphCOwKe5lMt4D5WAJwKJ943hbkPe7kJdhbImxtoXJ1/hZJFTivw9BflFm4uk3mn5EQ7cQ85eIb6NjJEtIbzSE/9fHC9+6o7fRbu1HVjOkLKFujqNTMuB5ZeRPTuZd6StJh4Ms+Ph3Tf/mI5Tq7FKRdXg5icwzYTGf1ypsuTsAux0H9eDoPSh76lUFjq83KJX3QtkaBxfcQo9nC36F61BCld9BOziqO7N+s+Kr5LGIHBuESrlxzY0ieSKqQ6CtKGnORqLq8mlzl7exPcUoCkCxlSg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(8096899003)(56012099006)(6133799003)(11063799006)(13003099007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Smp1Vm1wVmdITm12SXdsUDBuQ0V5Mk1MaVBPUk9DdElHUUQwMGxHeHozMFZC?=
 =?utf-8?B?WHY1YVUvNE85eXk1c1RRN3QzQitrbWFrTml2bGtqWGpBRlZpeVA3b0lHcTVn?=
 =?utf-8?B?RGVVdFBnQmd3YkROVmg1dUZaVW9vdlpEN2JZdENwNDJUeFlWTGorWTYwVEhq?=
 =?utf-8?B?dW1wTkw0d0Noc21YazBQbTNBSTczYndyRldUbitzSGgyMVpydWtYOEVNbnp6?=
 =?utf-8?B?WTEwTlNsczJSeWphMVZzalJHSGc0QXpLNGJpK0NjUXR4MU9wcjgyNXd3TWp4?=
 =?utf-8?B?MzFXVGI1SXlnYndVSzN3bERuWjZxVkdpRnhxaUEyMWVZYTVrTHZWbjVOYkIy?=
 =?utf-8?B?QVB6R0w0OE5YUXUvSFlpRlQyQnQyTVIrNzltc3QxNitiVi9DQWxZVVh2OHFj?=
 =?utf-8?B?TXdnWnduY0Zmc093WnZETUUwV2FzK240WklxV2tXT0F6THVBN2trdmNIaURB?=
 =?utf-8?B?UTNEL2dGVUQvWU53OGo4ZTJkZy9sM3JPenMwalhxbWk4SFFrTjZYVzJYQVlP?=
 =?utf-8?B?OVBNOW5pNGhrYWt3L3JwV0xhcTVEclJyQjZTR3VtbVhUTlZxa1hXdmwxUTBX?=
 =?utf-8?B?cVp2TjdIQUhKcElsNWV1eE1BMU1RbCttNUdPbW9CM3ZUT2RNaDByTnlMVmRK?=
 =?utf-8?B?UUs3QzMrQW8vSHFoMXYzUy9mU2JyQ0VXcXNqc2tCZE5yYjZsY2QvdEdPZmp5?=
 =?utf-8?B?U0VhcmRPMXdxT3FrSzhBcDB1SXp0MFFHQWxzc2xRM09CaTRFQ0lJb2c3U21R?=
 =?utf-8?B?YkFGL1NzcDVJVGQ3WDZoSGJ5ZXdCaGN4S01OUE03U0hwMmlYTUpVUUo4dmpk?=
 =?utf-8?B?UnVtNEhwNDhEUFdaT2VoTWhVRHhUZERIcnk2eXZNclVDVS9YZldmSFFHR0Rx?=
 =?utf-8?B?SEhFVmFESE5ZM1lTbm11dUNmN0dEaDNDZHNZTTQ4OFFIUGc3WkdibXFxRzdx?=
 =?utf-8?B?U2dRNHEwbWVCeFIvaDFxMERZeGdITmVYTXhQMERSdlJyaGpra3d2ZmhFdE16?=
 =?utf-8?B?L3d2QkpCR1pYdGVSZEgzRkQvendiNmpWNDFOWlBnL28rRDJkdW14SlE4eVgz?=
 =?utf-8?B?Q0lEMHJWcVU3S1Y0dUlYTTVGS1Y4bVgrUDVUNXNQWFVVR2VxZ3V1NTVsUXMz?=
 =?utf-8?B?ZWlXb0VzVXZaOTZGeUUvQUxITnNKTHdKeUdVa0l5VjBrbFFxMzZVWTVveWhZ?=
 =?utf-8?B?TUVFNXVxMm00ZXViVVhpOFo4UEMySE0vQkVCSVJCYmU2amgyUnp6SjFNRGZJ?=
 =?utf-8?B?bWtBdkVzNjJtdFZLdlVCT1VtZklsRGx6dGhLZFN6NVRtVXg3c3JPMU9LRlVC?=
 =?utf-8?B?dFF1ZEVBQWxhdWVxdi9UTDZCYVZYTGNzb1oyMzNkd3I4MXhIN1lVbW1ZRVNQ?=
 =?utf-8?B?UjdkaDFHRGtmeVhhcnZsRkRwTXY3U2kreEN6TkdZZFd4OXg5anVnNW9aLzY4?=
 =?utf-8?B?eGQrc1ZsUXltYkZ6b01abCs2MkpzcEZrc1RQUHdIbXdJWnVYV0Y2cFdPSDdk?=
 =?utf-8?B?SHNpZnJGSlovckJxZUhIZ21ubUlNSmFnSWxrZ3ZTRnczSlIyVUlrYm90dGhJ?=
 =?utf-8?B?dW41cllESlZaMlAwdndLOC9UZnRzejYwMENZUktPQjBFSTY2d3RHdzlMRW92?=
 =?utf-8?B?dzBaU3crTlNHTE0wOXdnMGlzbWxtTWJmWG9NaHFLQXUyN0NESW1lVHpvczRy?=
 =?utf-8?B?c3EyMGxVV1dXNFRsb3YrQ0R4bk1aOWFzVVFBN3EyYklYcFZjcjl1eUkwUE9m?=
 =?utf-8?B?YVpob1hudisvR1JaUy92VCtoVkhQNWVGeFpNM1NqZHJMVmowQVNIbUhUZE5y?=
 =?utf-8?B?U2U1cXdaMnBBWm5ra3N1ZUNyZ1lLN2Y3VzgrdnJyUWxwWm9WK3dld2IycU5a?=
 =?utf-8?B?bzRBdWdPZUE1VHVFUWpLcnQxa3BIOXkzb3FYR2Z1YkR0OHBJb2NMZTFXWWVv?=
 =?utf-8?B?RDQvb3JSZG0zQUtmUG1hS1VHOXl1K1FGWnZnUFlxT1ZvMGVubUhSRWJDRmh5?=
 =?utf-8?B?UHYrc2lDbXdlRVlVWFpJSFd6Z2FMcTI4aCtHdTVLV3VKdDlIQ1FwSlZsOVkr?=
 =?utf-8?B?YVBvRW5ZeFBpYXdHWlFlTnlPOXF0VGRSZm9lN3Y0dkRmOXU5dWhvSlk5Z3RV?=
 =?utf-8?B?ZVlwKzY1SW10WmdlS0NnMDNaVkxNZ2F3WWRDZFVNRlVzODRnVk1qYnc2SWVV?=
 =?utf-8?B?Q2JLRTVFNGtibUhmdnVqZk54UmlOcjBrNW4xUHZ5cTJvTlFONjhleEtyN2V5?=
 =?utf-8?B?djh0K1dxTGxFZG82ekVUVmk4NnFpN3lsY3lwWklCVHc4cjRMVGpWT0E2S2JN?=
 =?utf-8?B?NmZqRTRvNEpPTTFncXF1N05zRTBVWWxxalhDNzkzYXJDQnFYbXB2UVdzb1Fn?=
 =?utf-8?Q?9FDNmOIstq4/J6W0=3D?=
X-Exchange-RoutingPolicyChecked: 
	cZwIVbtcNsEZ4Z05IOmm3IbQ7a6z5uFTch1cf02wYdXprpwBn4Jb21lkxlJOqnn6TBfHmsrW0uSSVT4OQK+925dypgyW4K1csy32r4yLzTVlQ4miUf6xezZtOHvergZqllvTkQNB/PDTXHDnIsGBZjAk5krLw+rxKTnCZ6AHAbXCU/Ina2Y49OMzBrjdNJS1FSnXNAtMnDn0tmR3jAQDQ++fl6yRFbF7I69yKZCra5ZwjCm+6Rtl7ae+yHbgQY5A8Stz0cRTYFtFb1zW6/fY4+aN1N746ErX0tRgdY3F18rXyd0ErrB6IrgglSN1zvpmcaLeeHUfwNnU4e9mkY66Nw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73bba636-2eaa-47ca-75af-08decbf163a1
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 21:51:15.7170
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0bMvo2kptpu8du/Zm+MDEJ5tiwquOqwtopHmXY5X3hKC3UyD7T28dC+4NoAhCKm5i9tU3V0o+rMzaYtTwGDLupPO6sNFC4gW2y+pLoikTlI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5937
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: YNIFy5rZQUIYDs04Q_k4Kct0NMqZB4eD
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDIyMSBTYWx0ZWRfXxaLXmawMDP7E
 mc+6oXYKCfXVKYfEUM4+CovelZvWLN2ElbvhOn7108E8ZZVziRaZsJK8wBvwMAL+LRCJYGh9W3G
 dkS3nmT/VyjjyBYH+vMFeJPn2Q5Wq3m5RPVnc/9d9ZImRi9hNBFl
X-Authority-Analysis: v=2.4 cv=auCCzyZV c=1 sm=1 tr=0 ts=6a31c558 cx=c_pps
 a=YV/sJQ11QjtKmCmeYosiFQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=PYnjg3YJAAAA:8
 a=CCpqsmhAAAAA:8 a=Q4-j1AaZAAAA:8 a=ZKXuI7Fse3Kiy_EU75AA:9 a=PRpDppDLrCsA:10
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=UqCG9HQmAAAA:8 a=BYTWohJpWJJEtKPsloMA:9
 a=Efx9APDpT8N1gSDS:21 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10
 a=ul9cdbp4aOFLsgKbc677:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: LN8vmwFsreopUXbuTtTDQ4uKfpg8O3_c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDIyMSBTYWx0ZWRfX18lqvm00dCop
 RsRolXgR7waMSdjycAmW2Hv1yrb4shs7XfZ+O5rHf7RVKfok/ZZAyeZggj3hro7tg1fMKIDOiJg
 ISNCrIypbLemwKhGM2q9ruBp/5IJoo+e8LTtNq1nb6jgeg24I0HgZ3BTB/GamqUWmsDhUXjJf1H
 OHdFIFzTWAzo6F4y3B1m30yCWNFNy0qTMh7sx9vmtv5mIH1mE3J4VSyYI0KmXITiqbTOV5QsS19
 e2KJyFR/X6k1UYyT9UNYMA3g0JYQ09mO6nezm+UEP6a1i/+h/nuVyR4Dy9p2HdBIKMxfidZw7ZO
 N6+wuf4ZF4b35jiuaYjyzIfsZqyQdct19DFsjjpO1K4F9mZReMwL8WNvon4ZqX/Cp0NA/9j2rAJ
 FCluZcRRvb0WM7Tve1LGNIC1LvPDhFyQqWEThASxDXqCkzGE71cpek9ckYqzAcC3u657K//FYg/
 9nvcrewGyYs3J0wIjpg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606160221
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 21:51:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238965

--------------ncphTU6f8UZaUtXNRuXikDa2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 65GLZ2Fp3880336

Hi Sunil,


On 2026-06-16 09:12, Dora, Sunil Kumar wrote:
> Hi,
>
> I'm looking at three XCOFF CVEs against binutils 2.46
2.46.1 is tagged, please do an upgrade for oe-core/master and wrynose=20
once master is merged.

> and want to check the preferred disposition before sending anything.
> All three are in the XCOFF code (xcofflink.c / coff-rs6000.c):
>
> CVE-2026-3441 <https://nvd.nist.gov/vuln/detail/CVE-2026-3441>, 3442=20
> <https://nvd.nist.gov/vuln/detail/CVE-2026-3442><https://nvd.nist.gov/v=
uln/detail/CVE-2026-3442>=E2=80=94=20
> both fixed by commit c2bf7de1eb7=20
> <https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dpatch;h=3Dc2bf7de=
1eb77a91d7a3c86d56408bf57de540faf><https://sourceware.org/git/?p=3Dbinuti=
ls-gdb.git;a=3Dpatch;h=3Dc2bf7de1eb77a91d7a3c86d56408bf57de540faf>("xcoff=
link=20
> buffer overflows"). One commit covers both: the x_scnlen bounds check=20
> is 3441, the r_symndx check is 3442. No CVE in the commit message=20
> (Modra doesn't add them), but the diff matches the Red Hat bug=20
> descriptions exactly (bugs 2443826 and 2443828).
It's a small patch
binutils.git on master
=E2=9D=AF git show c2bf7de1eb7 | diffstat
 =C2=A0xcofflink.c |=C2=A0 =C2=A010 ++++------
 =C2=A01 file changed, 4 insertions(+), 6 deletions(-)

and 'just' does some casts to avoid buffer overflows but as you explain=20
is unlikely to impact users.

Just to ensure that no one else has the same questioning, I'd send a PR=20
to binutils upstream to bring
that commit to:
 =C2=A0 =C2=A0binutils-2_46-branch
and then either wait for 2.46.2 to be released or add the commit as a=20
CVE-20226-XXXXX.patch.

That works for master, wrynose, and it's probably a good approach for=20
older branches too.

Does that make sense and seem reasonable ?


../Randy



>
> CVE-2026-6846 <https://nvd.nist.gov/vuln/detail/CVE-2026-6846>=C2=A0 -=20
> fixed by 7a089e03=20
> <https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;h=3D7a089e0=
302382f4d4e077941156e1eaa68d01393><https://sourceware.org/git/gitweb.cgi?=
p=3Dbinutils-gdb.git;h=3D7a089e0302382f4d4e077941156e1eaa68d01393>=C2=A0=20
> (PR34049 <https://sourceware.org/bugzilla/show_bug.cgi?id=3D34049>).
>
> None of these are in the 2.46 release (checked against binutils-2_46),=20
> so it'd be a backport, same as how CVE-2026-4647 was handled in=20
> 42115ea9=20
> <https://git.openembedded.org/openembedded-core/commit/meta/recipes-dev=
tools/binutils?id=3D42115ea98a6aed68120ec1df703f07905f7dddd9>.
>
> One thing I checked while looking at this: only binutils-native=20
> actually builds the XCOFF backend (it gets --enable-targets=3Dall). The=
=20
> target, cross, crosssdk and cross-canadian variants are ELF+PE only -=20
> confirmed with objdump -i on native and bfd_backends on the others.=20
> So, the vulnerable code is present only in native, a build-host tool.=20
> That made me unsure whether not-applicable-config fits, since the code=20
> isn't entirely absent from the recipe.
>
> There's also the upstream side: binutils SECURITY.txt was updated last=20
> month (commit e1428067748=20
> <https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dpatch;h=3De142806=
7748d6b713637241855d1c315fb657c8b>)=20
> to say a bug from crafted input has to cross a trust boundary to count=20
> as a security bug (Discussion:RFC Thread=20
> <https://sourceware.org/pipermail/binutils/2026-May/149207.html>).=20
> These three are all crafted-XCOFF OOB issues in tools that assume=20
> trusted input, so by that policy they arguably aren't security bugs at=20
> all.
>
> So, I'm not sure which way to go:
>
>  *
>     backport the fixes (like 4647), or
>  *
>     mark CVE_STATUS as disputed, given the updated upstream policy.
>
>
> Happy to send the backport patches if that's preferred - c2bf7de1=20
> applies cleanly on the 2.46 branch. Just wanted to check the direction=20
> first.
>
> Thanks,
> Sunil Dora


--=20
# Randy MacLeod
# Wind River Linux

--------------ncphTU6f8UZaUtXNRuXikDa2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 65GLZ2Fp3880336

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <head>

   =20
  </head>
  <body>
    <div class=3D"moz-cite-prefix">Hi Sunil,<br>
      <br>
      <br>
    </div>
    <div class=3D"moz-cite-prefix">On 2026-06-16 09:12, Dora, Sunil Kumar
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:DS0PR11MB7901A65C83AEBB08626B2B=
23E0E52@DS0PR11MB7901.namprd11.prod.outlook.com">
     =20
      <style type=3D"text/css" style=3D"display:none;">P {margin-top:0;ma=
rgin-bottom:0;}</style>
      <div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_Em=
beddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
        Hi,</div>
      <div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_Em=
beddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
        <br>
      </div>
      <div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_Em=
beddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
        I'm looking at three XCOFF CVEs against binutils 2.46&nbsp;</div>
    </blockquote>
    2.46.1 is tagged, please do an upgrade for oe-core/master and
    wrynose once master is merged.<br>
    <br>
    <blockquote type=3D"cite" cite=3D"mid:DS0PR11MB7901A65C83AEBB08626B2B=
23E0E52@DS0PR11MB7901.namprd11.prod.outlook.com">
      <div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_Em=
beddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">and
        want to check the preferred disposition before sending anything.<=
br>
        All three are in the XCOFF code (xcofflink.c / coff-rs6000.c):</d=
iv>
      <div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_Em=
beddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
        <br>
      </div>
      <div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_Em=
beddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
        <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2026-3441" title=3D=
"https://nvd.nist.gov/vuln/detail/CVE-2026-3441" moz-do-not-send=3D"true"=
>CVE-2026-3441</a>,
        <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2026-3442" title=3D=
"https://nvd.nist.gov/vuln/detail/CVE-2026-3442" moz-do-not-send=3D"true"=
>
          3442</a><a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2026-34=
42" title=3D"https://nvd.nist.gov/vuln/detail/CVE-2026-3442" style=3D"tex=
t-decoration: none;" moz-do-not-send=3D"true">
        </a>=E2=80=94 both fixed by commit <a href=3D"https://sourceware.=
org/git/?p=3Dbinutils-gdb.git;a=3Dpatch;h=3Dc2bf7de1eb77a91d7a3c86d56408b=
f57de540faf" title=3D"https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3D=
patch;h=3Dc2bf7de1eb77a91d7a3c86d56408bf57de540faf" moz-do-not-send=3D"tr=
ue">
          c2bf7de1eb7</a><a href=3D"https://sourceware.org/git/?p=3Dbinut=
ils-gdb.git;a=3Dpatch;h=3Dc2bf7de1eb77a91d7a3c86d56408bf57de540faf" title=
=3D"https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dpatch;h=3Dc2bf7d=
e1eb77a91d7a3c86d56408bf57de540faf" style=3D"text-decoration: none;" moz-=
do-not-send=3D"true">
        </a>(&quot;xcofflink buffer overflows&quot;). One commit covers b=
oth: the
        x_scnlen bounds check is 3441, the r_symndx check is 3442. No
        CVE in the commit message (Modra doesn't add them), but the diff
        matches the Red Hat bug descriptions exactly (bugs 2443826 and
        2443828).</div>
    </blockquote>
    It's a small patch<br>
    binutils.git on master<br>
    =E2=9D=AF git show c2bf7de1eb7 | diffstat<br>
    &nbsp;xcofflink.c |&nbsp; &nbsp;10 ++++------<br>
    &nbsp;1 file changed, 4 insertions(+), 6 deletions(-)<br>
    <br>
    and 'just' does some casts to avoid buffer overflows but as you
    explain is unlikely to impact users.<br>
    <br>
    Just to ensure that no one else has the same questioning, I'd send a
    PR to binutils upstream to bring&nbsp;<br>
    that commit to:<br>
    &nbsp; &nbsp;binutils-2_46-branch&nbsp;<br>
    and then either wait for 2.46.2 to be released or add the commit as
    a CVE-20226-XXXXX.patch.<br>
    <br>
    That works for master, wrynose, and it's probably a good approach
    for older branches too.<br>
    <br>
    Does that make sense and seem reasonable ?<br>
    <br>
    <br>
    <p>../Randy</p>
    <p><br>
    </p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:DS0PR11MB7901A65C83AEBB08626B2B=
23E0E52@DS0PR11MB7901.namprd11.prod.outlook.com">
      <div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_Em=
beddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
        <br>
      </div>
      <div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_Em=
beddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
        <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2026-6846" title=3D=
"https://nvd.nist.gov/vuln/detail/CVE-2026-6846" moz-do-not-send=3D"true"=
>CVE-2026-6846</a>&nbsp; - fixed by
        <a href=3D"https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb=
.git;h=3D7a089e0302382f4d4e077941156e1eaa68d01393" title=3D"https://sourc=
eware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;h=3D7a089e0302382f4d4e07794=
1156e1eaa68d01393" moz-do-not-send=3D"true">
          7a089e03</a><a href=3D"https://sourceware.org/git/gitweb.cgi?p=3D=
binutils-gdb.git;h=3D7a089e0302382f4d4e077941156e1eaa68d01393" title=3D"h=
ttps://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;h=3D7a089e03023=
82f4d4e077941156e1eaa68d01393" style=3D"text-decoration: none;" moz-do-no=
t-send=3D"true">
        </a>&nbsp; (<a href=3D"https://sourceware.org/bugzilla/show_bug.c=
gi?id=3D34049" title=3D"https://sourceware.org/bugzilla/show_bug.cgi?id=3D=
34049" moz-do-not-send=3D"true">PR34049</a>).</div>
      <div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_Em=
beddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
        <br>
      </div>
      <div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_Em=
beddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
        None of these are in the 2.46 release (checked against
        binutils-2_46), so it'd be a backport, same as how CVE-2026-4647
        was handled in
        <a href=3D"https://git.openembedded.org/openembedded-core/commit/=
meta/recipes-devtools/binutils?id=3D42115ea98a6aed68120ec1df703f07905f7dd=
dd9" title=3D"https://git.openembedded.org/openembedded-core/commit/meta/=
recipes-devtools/binutils?id=3D42115ea98a6aed68120ec1df703f07905f7dddd9" =
moz-do-not-send=3D"true">
          42115ea9</a>.<br>
        <br>
      </div>
      <div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_Em=
beddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
        One thing I checked while looking at this: only binutils-native
        actually builds the XCOFF backend (it gets
        --enable-targets=3Dall). The target, cross, crosssdk and
        cross-canadian variants are ELF+PE only - confirmed with objdump
        -i on native and bfd_backends on the others. So, the vulnerable
        code is present only in native, a build-host tool. That made me
        unsure whether not-applicable-config fits, since the code isn't
        entirely absent from the recipe.</div>
      <div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_Em=
beddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
        <br>
      </div>
      <div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_Em=
beddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
        There's also the upstream side: binutils SECURITY.txt was
        updated last month (commit
        <a href=3D"https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dp=
atch;h=3De1428067748d6b713637241855d1c315fb657c8b" title=3D"https://sourc=
eware.org/git/?p=3Dbinutils-gdb.git;a=3Dpatch;h=3De1428067748d6b713637241=
855d1c315fb657c8b" moz-do-not-send=3D"true">
          e1428067748</a>) to say a bug from crafted input has to cross
        a trust boundary to count as a security bug (Discussion:<a href=3D=
"https://sourceware.org/pipermail/binutils/2026-May/149207.html" title=3D=
"https://sourceware.org/pipermail/binutils/2026-May/149207.html" moz-do-n=
ot-send=3D"true"> RFC Thread</a>). These three are all
        crafted-XCOFF OOB issues in tools that assume trusted input, so
        by that policy they arguably aren't security bugs at all.</div>
      <div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_Em=
beddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
        <br>
      </div>
      <div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_Em=
beddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
        So, I'm not sure which way to go:</div>
      <div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_Em=
beddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
        <br>
      </div>
      <ul data-editing-info=3D"{&quot;applyListStyleFromLevel&quot;:true}=
" style=3D"margin-top: 0px; margin-bottom: 0px; list-style-type: disc;">
        <li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFont=
Service, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0=
, 0); margin-top: 0px; margin-bottom: 0px;">
          <div class=3D"elementToProof" role=3D"presentation">backport th=
e
            fixes (like 4647), or</div>
        </li>
        <li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFont=
Service, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0=
, 0); margin-top: 0px; margin-bottom: 0px;">
          <div class=3D"elementToProof" role=3D"presentation">mark
            CVE_STATUS as disputed, given the updated upstream policy.</d=
iv>
        </li>
      </ul>
      <div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_Em=
beddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
        <br>
      </div>
      <div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontS=
ervice, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0,=
 0);">
        Happy to send the backport patches if that's preferred -
        c2bf7de1 applies cleanly on the 2.46 branch. Just wanted to
        check the direction first.</div>
      <div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_Em=
beddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
        <br>
      </div>
      <div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_Em=
beddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
        Thanks,</div>
      <div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_Em=
beddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
        Sunil Dora</div>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------ncphTU6f8UZaUtXNRuXikDa2--

