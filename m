Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4BB6C9830C
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 02:26:57 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27810.1768789612271953848
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Jan 2026 18:26:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=H5xZ/lSA;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5479bfbe8d=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J2QpKC2517363;
	Mon, 19 Jan 2026 02:26:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=33hDZYi3ULJFtUeGpXT0oiU7GNF1kt34cz/mzDd0MjI=; b=
	H5xZ/lSA337/M05qLZJopNzDvwk545gvjMkLlrg9+ptYZzAX6gOI9IAPNvM4lYlm
	UuGYG4rqPctTN9/8ua4fsPqExhq1CWQ3svbw7guGapcmiQt1IkFk1u7syRBe7nry
	WHlKm05VxUB6VG9v8CxJWoTzV9lG0YJesq6rwU0pT9eqP7u3ClLHze3PMP8MsWAU
	avNADwDRnIgdl6tF29iNyyhMujFwJh28flqkEooReIlPVVu17Yfk9iOXClKJPPQF
	jrZAAMu8UmAayuBPBXRpm7YnhdINMiAtw4t81yY1xmr9SIXfjh4Y+K+BjHLFBScI
	Pvi0HVMxCY6XJXCicP2q0w==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011050.outbound.protection.outlook.com [40.93.194.50])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4br1d49bgg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 19 Jan 2026 02:26:50 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dj59DFWLCFBCcgFozTvWostfRRo5LiuHYTA7NQ8E/rRmKDLlxIq7yiyLyezC9XdtzDSGslxXOW2dv+FPBy1/SHzYSAX5VvNlO9+sEMEm6HL2S7VVW33BbvPQ5TE4eC11nutMVXgfEnDDA0QVzq0NLZQqvSBYAE1wxzAMsVwnScM8cTmFqSvHV9zazTh2rV40TLbmMZuTC0NDGDBKTiNmF9s916wpB9cHDdIq35RFqSpVzGdMdUcz5esqFM3Wv87G7a3FhIj35ZUVRzyPodT38AKxIphCGuM+8sbRf1DRTp+CJBXm7niaXnEMGI6XLYBfHiPfuIpluTULxivvD5VHRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=33hDZYi3ULJFtUeGpXT0oiU7GNF1kt34cz/mzDd0MjI=;
 b=BikaGdE5lewsi2OwpdhNez3HgsaPhUFbHao4JFW8Jx1n8AOBOzGBVsn5Y8RMldgb/DPPCLms2UA9xGSEUlFjllM7D8pS4TzM/SCpVokJr4Lf0dwT1/FZEzpYvRZJ/5RRDLtoWXC/4yb7bT8as9WlDt6rmXy1Zbxm4CpHdW3DMArCJgYiUXNmo/v0YBW3DbMxLeQMBtIfL0xMyTQ2aW1uaYbcwEfUnnjfi0hjcNvPrycBOJMB8UASS0WJ36qi0w+f6Cbay3QdQ5ITp5eqOgTDsiT2EBTVcZiHTDoI1+MUgvuqjnW5zQyCZkXlcQU0Y8Cb7V93gePdje2LdrOiM0GpNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by PH8PR11MB6999.namprd11.prod.outlook.com (2603:10b6:510:221::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Mon, 19 Jan
 2026 02:26:48 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::c84c:d2c3:1102:cf45]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::c84c:d2c3:1102:cf45%3]) with mapi id 15.20.9520.010; Mon, 19 Jan 2026
 02:26:47 +0000
Message-ID: <c586a89f-3e84-4e74-8e03-6598045fd501@windriver.com>
Date: Mon, 19 Jan 2026 10:26:42 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 2/2] webkitgtk: upgrade 2.50.0 -> 2.50.4
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, alex@linutronix.de,
        mathieu.dubois-briand@bootlin.com
References: <20260113124504.961856-1-hongxu.jia@windriver.com>
 <20260113124504.961856-2-hongxu.jia@windriver.com>
 <CANNYZj9VBv_G3phFkW_mosnZ5hvzXxP4OJ=nJ3G_oExV+FtNrw@mail.gmail.com>
 <188A774745AD7FE0.3093368@lists.openembedded.org>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <188A774745AD7FE0.3093368@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCP286CA0209.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::12) To PH7PR11MB7608.namprd11.prod.outlook.com
 (2603:10b6:510:269::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7608:EE_|PH8PR11MB6999:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fe4d126-e563-4c22-b170-08de57023236
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|4022899009|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TTlRdndBZitmSHlneC93OG9teENFa2JCbFlYWmU5UmVrQmRNVDZZR2pQUFlJ?=
 =?utf-8?B?UUZSSENGV1ZKM29YOFBreFJ5TWpSWkFjQnVHd1BMMGhiblpBZFpFT2NsWFFw?=
 =?utf-8?B?STRuODY4OGRTMU5VQWxleThVYmw5cGErdS8vZEtySTJZZGFVWitaTExiWkZl?=
 =?utf-8?B?M3JSWGhjY09peE5QZzhJdkthQWkwZ29DQVlVY0dJMnFiSnhkSVNqVmxURlRq?=
 =?utf-8?B?YjllbUxuZ1V1WGtld2FTRElFb3FmWHl6T3dCOHdySjZRNmNpd3NjT0Z2QlNJ?=
 =?utf-8?B?VVcxMkFZNEZMUXVUS2N0L2V4dytmSFdUM2Z1Zm04c3prbGNmYkJ1bmxxYlFT?=
 =?utf-8?B?RkJOa1lTeW5rNERMTDQ5d3lyUWc2RzJIMEJTa3JTVnNQVTRHa25XMWR0UEFO?=
 =?utf-8?B?dnd4Yi9SdTN6RmlzYjFFeUlPek9SejRvb2F6VTNhNmx5a1RzQ0VpL21ZTkRu?=
 =?utf-8?B?S3B0aE9zaU1vQURxL1F4VVNmL3VtSy93aUNkb2ZHOGdtN1lseGUxOTFIY3R2?=
 =?utf-8?B?WHAzMGRQUnJ2VVZDZXdYMXQzSFR3b3hxNXJrY0hHZnBkeTBkcXBJMWg2L2Jx?=
 =?utf-8?B?YndkbkdkKzVIbjZmZkxXQmtOdXNodUkzVUpyRVoxNnlxQmt2c1RQVWczSnZo?=
 =?utf-8?B?dERreFZ5RDkvakZnMGhSZGQvNjRaV1ZtRGw2UWN0ZU0xcGU2YS9qbnhQaGY4?=
 =?utf-8?B?SzVHRVdDNUtTOVJoVDRyQ0ZCM0xXYmtDcWg2MDY0UEF1WTdDUXE0S2VtZXNS?=
 =?utf-8?B?NGNsOXJaeDFqcFpGQkFkWE10akVRdkVJQXVmQUNyVEVwOW9OQlBKcWoweTU5?=
 =?utf-8?B?dWgrT1pESzlQWGFDTEpMZTA2bkg5cnJ1RlRYNkQvdzZpSkp0RFFMd1NTcld0?=
 =?utf-8?B?MEc3ZEhMYVJoWExSVThqQ1JBZXBaR1VmUGpYclJEUXkrN1BaQ0d2V0g0UC9i?=
 =?utf-8?B?WlQ2K0ExV2psNklBYiszVEQxaHlWTzh3a0t0UGZjbkcwcUJOaER3MG10U2Jk?=
 =?utf-8?B?WDRTRmxVUFJEWU9PcXVaSk10OU9BbGxremE5RHQ0aWdsekVjd3hLOTZMRnlE?=
 =?utf-8?B?d3lDbGV0YWRzNFN6bjZFSVhsdjVMcjE4ZGhMblQzNHpuQXREUFBzb3c3S2gy?=
 =?utf-8?B?VGM2MUpWVFZjSTM4V2NGQUJIVVk1dERicko1dE1yWjBCMHdPTG1jOCtnNUVu?=
 =?utf-8?B?Ymk5Y2hqR3NTNklRbnBkeVFWSFUwNjNDTXRZaTlHUzVhaDdrTVJZQSt4dS9J?=
 =?utf-8?B?dFQ3WkI2ckRQd01mR3FDWHRHYm9PRU9uZnBVY0doSlBKTWV2blFGN2RQNzhs?=
 =?utf-8?B?eCtKTWpnS253QytyRFQraEZFZzMrRG13djB2eXRHb2JmdVBXZlBJS3Y0c0Q0?=
 =?utf-8?B?a25LbmJPbmwyTnc1Sk5QbWNGV0VneHAxbWpzMnNhOENDcTExWWt0aE1BcDI5?=
 =?utf-8?B?aURoRWNkSmxmWG9IckFPRy9GbkpmTldnenBtWG82QktjKzVYNmM3K0MxVkVw?=
 =?utf-8?B?N1JwMTFaWU1NZXkzaFpXT1FqeU5pdHN0elZQOGw4cGI2b050Q3lBOTM0ZXNh?=
 =?utf-8?B?RWlaU1lqTkRDL2ZFWTNUSWw3K1NHQThKc2daUmROb1JZRnNlQ2lscldCUURW?=
 =?utf-8?B?YnV4dVdrbTZ1cmxRRzI1TS82cVJBU3RZbWRhZDViR2RRL25ZUkVCNTFnNk9E?=
 =?utf-8?B?L2pScURtTkVnaGZnUmlpaVJ6TDdMdG1rWHM2djVlVFJwK2k4NGpaMFRUVzI5?=
 =?utf-8?B?ZllucUx1RnRCa1hOU0x2RC8xanRnZ2gzYUcrRUk4WW56SWg0VW9LNmU3SzZK?=
 =?utf-8?B?cVU4OGc5enRMQjlWdUV4NG1GdXhLdTFXc1cyS0c1K3FPMWZpUkVBUjdjSElM?=
 =?utf-8?B?K3ZwVFQzdGM1WXQxQ2xLS0NSWWowOWFXR1dVTlhyeWl0c1lQeXVhUlR3SS9E?=
 =?utf-8?B?dlNwbThBN0lnK0p4Mm9QeFRqRTFMSTR1T1BnaXg5bDF4cFVYaU95dkxCWXFn?=
 =?utf-8?B?OC9uTDJpN1g0dDk2YW42UnJYN1Q2d2hxNXNkRUVyK1N4a0l6OXdQMmRYeTcv?=
 =?utf-8?Q?dVpU13?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SUZHRFFtQ2JtTEdpV1JUdjFtNzZvV1dUdnZpbFF0RGZxeTVDSkRTd1lNK1lJ?=
 =?utf-8?B?U3N0Y29pQnhXNGdJeXVDQ1M0aUpuanV5ejV1WXkxNWFMWCtVRGZJVFZ3WTFk?=
 =?utf-8?B?TjhsNmhTTmMwQlQ3dng3OWNYSDU4dzVYVFZmcUY3M1l1V2kyR05DMHBwQTN1?=
 =?utf-8?B?eXltcjZPcmo1UXBwcjFtUlVEWEp2VHYxV1dJOHRHbW9mRWJrMUJFOGczbyto?=
 =?utf-8?B?ckZTQUlqV2lsd0g5SlZ2NWhKWVppWFQwUFUvTTdBMUNtQ0FBdEFWZnVLUmxF?=
 =?utf-8?B?cE05YWlDMXZtMFA2bUV5V2pvVGNGR0dTY2wxQlhEQ295ckhCTUtPQm10TElS?=
 =?utf-8?B?ckpDY1VDZHF2UW9SakYxcHdmOHU4enpUN0V2ZWxUeTYrZ1VRa3BFZlp5V3gv?=
 =?utf-8?B?a0ErMHI1Tmx3ZzhTdmhyR3dFN1ZKb3VkQjBqYnkvRkVtUWV3VnhCNStodFF6?=
 =?utf-8?B?RCsvdVpDSUVveTFwbHhwUmZ4VG5pZXk3aHd1QUxLdVVyQ1dBQ0lWdzdBd3Nl?=
 =?utf-8?B?UGVJb0l6ZnpwMXpXdG52L0J6VnlDdkFRU2pLdnZUUGYreEx6RFQzdE81VkUy?=
 =?utf-8?B?U2kwdTlQRFRNdzRhMlNka01leVU0MWs3cHA0UnB3U25iQ0tlTEpjQVM1OVZp?=
 =?utf-8?B?Wm0valVJTVprNGZLUFVhVEpHc3QycVBCZzlYWjQvZlNYZ1N5S0pjWUNaS1pY?=
 =?utf-8?B?RU9lQ2tpYU96eG9UNnVBNmVaUlpFSi9KQzdCZXZpazU1ZlhFUHIvZWErbkVq?=
 =?utf-8?B?Zy9sNVlPeUxHWnVzNERXSHZMTS82TTJGdm9jcndKTllQengyZWwvcjhobVQx?=
 =?utf-8?B?TzFaN1ZzeTMwbnhBNEZZWS92ekhlazlYcjYvYlRXRFhPLzRBaFRQQUZ3b1FK?=
 =?utf-8?B?djg2ZEhXV2YxN2ZYMlFtckxWajE2WXJvVGNqcXdFZmlSVFhqUkpIME9Vajln?=
 =?utf-8?B?aC9vdDg5N2RqMHozWmo3SGt5ZnM0bGJaMUIrRzJ3OUFkcjYvOXJ5blNFdHYr?=
 =?utf-8?B?UVcwVG9TVUpvT0VnVkxQaGY1cEJRRXVwKzVGN0EvWXFIRXpoR0lzN3FGTzJS?=
 =?utf-8?B?Qzg1UU9oNUxBSWR6YVVUNmJsSm9LRHIvSUZmMjZpYkhRZUlndWxTT2h6UUs4?=
 =?utf-8?B?cW5uYXRyYjI3TVRNYmtMMjIzSnpPQmtXbENzcG9nWGg2NXBXWmNMNUhVRGo2?=
 =?utf-8?B?ME1wVGJodWFDYzBkL2FQRXVpcW1iYS93WWVMNHNaNk9DZFg4eTRFWGtPZ3Zh?=
 =?utf-8?B?ak4wTWdHVkVWbTVqQkZWY2tlMzNrVlhGU1RNSjJGeUN0MTBYYkgzWElvQjdR?=
 =?utf-8?B?Y0YrWnNMeHVlMUd0RE12R1I0eGlMbXR2enpqWFQrcFR1ME5xOUIySVNpYUEy?=
 =?utf-8?B?SElXb3AyRE5ydFVULzhQczlrRVBnNk1WdUI4d0hqZTZ5NllIZHpPdjRHQTE4?=
 =?utf-8?B?bzM3M0ZaM0VEcHdMQkVQOXdzM1dYK1U3bWNjQ3VGUm5OZG1YbnFXdTBtWE5i?=
 =?utf-8?B?dEl0cm1xWjhzUlNPTEgrRmxwMnkrNkNjN3BYOWZBMWRtR2xGRy9SRkpRUUJI?=
 =?utf-8?B?bXdpcU02NkcwUUl5QW9LcmtSWWdVTXdJeWtwbmhKQUpYczdSbXBSOEx3OXhR?=
 =?utf-8?B?R25JdWpsT0RaRWdtVHRWUDRzc21NdFNTdWNKaVpIdEgvTWVZb3VVNi83dHl4?=
 =?utf-8?B?NHB3QU83M1dYRDZqK1NXcEo1eDRGZmhnRG1NK3VEMVZYbTVHODZtYW5uSWJ1?=
 =?utf-8?B?UGZ0REpqa1VGeHJ2RDVnMGhpL1hvSlRIZ0U2ZW56dXhvaU91SkVZQm1EQW1M?=
 =?utf-8?B?SFlQcnpnaXV2MFBzTWlBMUJzME5ZTG13Szlld2FzTUpzd25yOTVZQVIrYjd4?=
 =?utf-8?B?amZ3M0lXc2RtbEpadVhxZktGNzFCT3hsMFhVV3hyV1Nxb09hUUlYYThVYk1M?=
 =?utf-8?B?R2VhZ0ZVcnB2MW5KZ1Nra2pmNzVWb3Z3MTZsVW5UZGNDb00ra3NXWXhxTHNZ?=
 =?utf-8?B?WmFUbzIvTGNEcnJldmV4RjB6Y0FKWjRuVm56QkxPL3RvZFRibXBDbWVodXYv?=
 =?utf-8?B?ZVhlOSt0S0lkeXF5K1NqQjRJSmxkcEV3MHhEZDk3VTBTU3hTQ3lYRTR5S3Rl?=
 =?utf-8?B?cWZMVHBSSFlGbkk2ajNDZWdRTXRXMGtVME5tOUxHQWdDNDFJSzhCYUdqVzNG?=
 =?utf-8?B?cjB4WHVacmZlaHQ4S051a1VRbUgwd1JqUXBhTnRtV3pRdG9QWk1qWEZMRVVl?=
 =?utf-8?B?akYwdGJiWGFlSUJESjlZaGpSdk9SczhTQjY1T2pVT0tBVnBZOEZKT2M2Q1VY?=
 =?utf-8?B?R1JPeldwNjc1Z3E1bmwwVWZVR0ZRdXY0SXFTV1BRdFZ5eEZZVGtVZz09?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fe4d126-e563-4c22-b170-08de57023236
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 02:26:47.9099
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yKCEuzRKPk5IMoZAE37xREDdQfAJLOCEPRCh8X/kV5h8ZBaiHJoYapVYmTRWfgDFzJGV8zZ/YilwvCJiJNIzg99z+K+XJzps3v9rBNbC35E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6999
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: 1jT5FIV31ZtuOiGVfZk_0JwhVGybmkSd
X-Authority-Analysis: v=2.4 cv=Rs3I7SmK c=1 sm=1 tr=0 ts=696d966b cx=c_pps
 a=UNZgSj2+zgRPHH//f1mBVA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iGHA9ds3AAAA:8 a=NEAV23lmAAAA:8 a=Q1sTgoEvAAAA:8
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=IvQJNAUUq8ru2VKf7xoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=FkGh3qDytyf094M0uOEt:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: jceaVNpCIwMSYvcGV0Xsv1KfFRoengl0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDAxOSBTYWx0ZWRfXxaDQ47w9sgox
 QdRXmC0VAk3rOpFus7+FZiC4JYEbQGhcPw1j+4gaCsNQ5EetTwJym/qhRlP7sAVgq3vYDIx6jlf
 eex5MHFvhdnjyae8Ig0EwHuwUUa7DdM42Wd6nYObCEtCgHP7YOIv54rR8aXIUh8LtMie/1VIyeC
 JDH46sObEQM/XCHT4tLCygBOdyCdmRmFot5ZtmzE0nEINI3V/b+m42W8rgPvKEUMqU+MCv0D6OO
 jIEnl1PHqThI3vc+O8EukbvmQjwNbLSAnVqXf0wlUWdrkyG4gdwH4nyrxCiewWcRguTLECOIaei
 TpdqON5lpgoDX5/DtsOC4fD1j2sww9YR8H9f5RUNoapFjYThOdQrsY33AhVrBPCaIjYB6IDIrkG
 DEmCckM9VwDnR6SYbCYcf9F4v2dxDv9K01S0AsDwa/fOCRXNPcUE7snPYONf9okeK7SPgQQF3ep
 BdHuuJMNzBl4EgmKaqg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-17_03,2026-01-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601190019
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 60J2QpKC2517363
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jan 2026 02:26:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229588

Ping,

On 1/14/26 10:15, hongxu via lists.openembedded.org wrote:
> On 1/13/26 23:25, Alexander Kanavin wrote:
>> CAUTION: This email comes from a non Wind River email account!
>> Do not click links or open attachments unless you recognize the=20
>> sender and know the content is safe.
>>
>> On Tue, 13 Jan 2026 at 13:45, hongxu via lists.openembedded.org
>> <hongxu.jia=3Dwindriver.com@lists.openembedded.org> wrote:
>>> Drop backport fix-musl-compilation.patch which already exists
>>> in 2.50.4
>>>
>>> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>>>
>>> - Fix compile failure on qemux86 [1] to
>>> drop fix_op_instanceof_handler_for_32-bit_C-loop_build.patch,
>>> which conflicts with upstream solution [2]
>>>
>>> - Fix compile failure on qemuriscv64
>>> ...
>>> Source/ThirdParty/skia/modules/skcms/src/Transform_inl.h:810:71:=20
>>> error: cannot tail-call: tail call production failed
>>> =C2=A0=C2=A0 810 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DE=
CLARE_STAGE(name, arg, [[clang::musttail]] return=20
>>> (*list.fn)(list, ctx, src, dst, \
>>> | ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~
>>> =C2=A0=C2=A0 811 | r, g, b, a, i))
>>> | ~~~~~~~~~~~~~~
>>> ...
>>>
>>> [1]=20
>>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/290=
7
>>> [2]=20
>>> https://github.com/WebKit/WebKit/commit/fcaa289f6015595a638eb96b9f728=
eaaa7b13ab8
>>>
>>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>>> +# Fix Source/ThirdParty/skia/modules/skcms/src/Transform_inl.h:810:7=
1:
>>> +# error: cannot tail-call: tail call production failed
>>> +CXXFLAGS:append:riscv64 =3D " -DSKCMS_HAS_MUSTTAIL=3D0"
>> Thanks for completing the update. Perhaps this last risc-v tweak
>> should be reported with an upstream ticket?
>
> Sure, I will try it later
>
File https://bugs.webkit.org/show_bug.cgi?id=3D305745 for upstream

//Hongxu

> //Hongxu
>
>> Alex
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#229301): https://lists.openembedded.org/g/openembed=
ded-core/message/229301
> Mute This Topic: https://lists.openembedded.org/mt/117242049/3617049
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
hongxu.jia@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


