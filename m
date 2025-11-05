Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D991CCF9E3
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 02:40:43 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8.1762310435748451240
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Nov 2025 18:40:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=SXRxtaxD;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3404044f81=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A51oa91440227
	for <openembedded-core@lists.openembedded.org>; Tue, 4 Nov 2025 18:40:35 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=z883M/y1MHq/4hmF66ut32LChMPZJYqyWv1tbNEXEI0=; b=
	SXRxtaxDrjV6RQzA5tEaJXzSEeJrMtWO9fyOlLRtfhMkLOQOpehsrZTU0Frj2QDd
	xZZnxMMmR+ZLKD2FRGWEp8E3AHhyb/u04zNg2255ik1mAYUZuwYWwEdIDEoKmN83
	dXCbBuAxpM7QpETWi6W6m84YTIb9866jH96VpOVrxg+ZO/iqs1iWYBW/zeFh5QTI
	Y6GP/VTLCy+ReRqbi6hN9o6jYXNP4hDxO50NAfncdtcAzsbVNmRc/WWI4RYgnMSm
	OnpS5YtQUgf97x716xTPTLqfrnE7ci77qCTwWQ8018FO9GQYZ+rQkvVJn2t4097Q
	N9gp6ufy/zOdFRC6xeUlCQ==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011041.outbound.protection.outlook.com [52.101.62.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a7w8k019n-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 04 Nov 2025 18:40:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=leuVJJgsDLs+idygVtjeTxvE6ATYfVWRj5K8KrgXgRkGZu2aa2ymlbdQOxl6KgYwLmlSgDYBt9yDCBBD9yP29ZLAjn5TrwI3zAV/iacWErBRaVKAs3QCgN1aP5WR+N/GC8l7EbJaV2N8ysEJTXUUbN1HusA9bY8Ld++3c3uxd4NwLzcwZ13QXBe4X7RHzkzuhJGx0N3v0zMZQR3wexqweADsLh4AR7BUtBSR8kQWQzbpKpZCsFIEdmtkKMHcFkXSNpJOzIB3d3aLEDaFqej5a5PT/NfLsptYi7+qDW48fuEgMukPIZoeVhukcRmIDIZhpNZ7mKWM2O1rGXrxNbdlbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z883M/y1MHq/4hmF66ut32LChMPZJYqyWv1tbNEXEI0=;
 b=v4Q6o47ylhDezrqKyJK4dtjOmcPvW40QggFPjcWIRi0cx9VMn+gHy2bc0oENMVO2MLvpfhfcA9h8TDMYeo22ITo32f0eoTpcMgVWIXLlGfYySwdYXJMhIJo0XgUKDfYy6swiyIF51aKANNgjaXRvZjCQB6q1PSMz9mvxe5JgDACQ4737qfBA/R0Z4Li5LQkylXatQlA7PPo2UtW021DwlJis/+vLyuewEb6PeQGwQbaRiUR6tJYK0O3jRyZxlia4gfBKpc/t5pTn+bXFNY6tIpfXrbj2+ZlEHckhAJ/gC9c6qMSiirKmkRkJt3dg9lyV2vfiRUS26uUKmuaKa43GIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Wed, 5 Nov
 2025 02:40:32 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9275.015; Wed, 5 Nov 2025
 02:40:32 +0000
Message-ID: <a42b8494-ded5-43df-87af-a48700d27cc8@windriver.com>
Date: Wed, 5 Nov 2025 10:40:28 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] oeqa/sdk/cases/autotools.py: fix host_sys value
 to handle multilib case
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20251104033329.466996-1-Qi.Chen@windriver.com>
 <CANNYZj-1v+RJvkMaij=LQJH=Edbp2ci80_+qOuGfDSkbCNY3xw@mail.gmail.com>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <CANNYZj-1v+RJvkMaij=LQJH=Edbp2ci80_+qOuGfDSkbCNY3xw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP286CA0014.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::8) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|DS0PR11MB8718:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a4a7e4b-1c11-462f-f082-08de1c14b094
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?L2NGOFRZSTJFa016OVRadThhNlZHTUpuZFZsR1JkRmVlOTFBYlNKYmR3dDhz?=
 =?utf-8?B?ZjNVMjZ3NTQ0cFNwc2FZS1F0WUF3NzZLZm5naGVNS2k0NDZIWmNwOG9MZExF?=
 =?utf-8?B?SlhUWU1jQVp6ZGJ0R2FtVzZzQnJieVJLRTJmVFM2ZWF5a0xIK1BpMGorVmk1?=
 =?utf-8?B?eld4N3FuNzJleXpFNUJCWHlYbEM4MmxQNDdaWVFMM3o2d00wT3VFdTdZQTc0?=
 =?utf-8?B?bHBQWk4rd285MHZiTjZTbncrQnhvMmNTMU9lWWlnN2NvVTJIRnZ4aUFpRVJQ?=
 =?utf-8?B?S1NpclAyckJvTDZyRjUxRjZ5T3lsNEsxbktlWFllajdkcnFiczVmQzJZcWd0?=
 =?utf-8?B?Uk5HeTM2dDhLOGhpTGZZNllONDc5YXhhTXFQNldkZk5udkZkakY1WnZVM21u?=
 =?utf-8?B?U1ozd0VIeXl1YWV1allpTkVaRm4zT0V6RE1OcDRySTM4N3dmT0M4YWF1cGlO?=
 =?utf-8?B?N1JRdU4wanVXMm1LTDU3OUpWdHlZK0ovakhNcGlJalB5S20xS3NudE9zWVNQ?=
 =?utf-8?B?ajRiS0FBWGZoZlRnRUtudytXSi9ucFJrY2ZlUXRwVVp4YXhWNitWcytxSU5V?=
 =?utf-8?B?djVHRnFxRzY1TFBra00wUmFlL1NDR2JvMTUrY0RDQzBUWjFBV0g4b3Q0d21I?=
 =?utf-8?B?UW9QREJkMWp0eDNkaHhkNjhvVUorT2w3MTlKRTNlK2V0dnRrekhiblhFeWJQ?=
 =?utf-8?B?akVzNzZWclVwaEtpREI4WjJHaDVDL0VoaTlsendJdW9TazkyTDZ2RElxKytQ?=
 =?utf-8?B?bDk1SnFvd3h4ZnY4UVJIM3NtYnpSc1JjT3FYYXY5WnNXSVV2ejhXRmtseTh3?=
 =?utf-8?B?THMxU3ptcDFkM29GclU5YlhoeEFlYnJyWkUrTmxIVHg2WGN2b1RDNi95VmxY?=
 =?utf-8?B?MzFrUnhmaVMxaXZxa2hMaDBsVktUdEZBWnZUaDBOQVJLYWRqUXkvZlpYWHNF?=
 =?utf-8?B?cW1SMzNmZ3owc2VHRks1ODF6aWxFL2h6Z0hVTTNna0s0dmY1czgwTGxCOWxK?=
 =?utf-8?B?bzRDUXcwbjh6VVZvYklCZytLTFRzS1NpWFVwYTV4OXJibHA4UENaQkVpUVFm?=
 =?utf-8?B?ZWdZZHcyY3QxZGVWdnJta255ZWdTSEFRL1pvbjE2M0k4Tm5qdnpodHh3VTZO?=
 =?utf-8?B?dHFyamJneHhwYWc5WjZTRE50Q2dEWmlYZTkvNk5Sb00vd1RlZzU2SjBCNTMv?=
 =?utf-8?B?ai84ejJIelpyT0FHTjg5WGpsR25nRittRE9SWnFkYi9IU3c1TGttRU5rTkJN?=
 =?utf-8?B?MHY1eHg2TmtVd016OGxXL1VqamlxMWFpK3AyTG9xUHRReWFHRnQ1YTFPTnZU?=
 =?utf-8?B?WGdMcFRvU0d1WGcyVkljOE9ZUzhoRmluU1UwM0VBVmpwSFJLbmFEb3ZENWJ3?=
 =?utf-8?B?a01yTXNTZTBRalFtVFBHcXpMUGFKREQ4NCtINTBIajVOVldkTUNtV2FzdDZP?=
 =?utf-8?B?Ung3UFpOY0lUcC80L0ZQT2t4ZmsvWHpMMU9CVjZFTm8vdlpwaitJR3F4d1FX?=
 =?utf-8?B?TktxajJKL3oremdMU0NFd20xcGpMZ092QStzVmhXOVV0bWJ3OXkxTUlLZGVR?=
 =?utf-8?B?Z2lXc1ZldWN4RzNxK3dkYjIyaStWZ01WYTBYcUwvQSsrcDUxTUl0cVJSb0I1?=
 =?utf-8?B?R2dQWUhNTHpQU3N6N1ZsZmw0Mmhzb3FiUUZHcEY4dnYwb0lsTno4L0xoK0t1?=
 =?utf-8?B?eGdBNEJnNjVNS2JjalhjV1dvd2crQXFpNXpwbGpYaXJhODZjTURnelFZaUE2?=
 =?utf-8?B?dzE2WldxbTg1Q0U1akQzNEE4Vk5xbjkyTlVrT2VEUG51MWxlMkJHcTV0YmVO?=
 =?utf-8?B?MGdBT3p4ZDNPWmNpWmpqN08xR0ZRSVVNV1VHR0lTV2w5LzVwZWd0TmQ1Ynpw?=
 =?utf-8?B?aEZRYmYvMmozdjEwS291NUt5MWZ1SkJkc0gwNS9WR2NPdFZNc3VaVkZxRDN6?=
 =?utf-8?Q?rATAlub88W59NKonA4hKguL0Z1yGQvCz?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SkI1ek9Zamp1OEdrSE01RVRwVitvTnJoTjN3TTRJYlhEUzBPY1pSeERndjRE?=
 =?utf-8?B?a282RmM1eHBwZ2kvMDArVGxId1Q4N0NIQU5ubzkrdFd2Nk1ZWkpMaTlrSGJE?=
 =?utf-8?B?NFczLzZ0bm5OOHVlMkpJUGEvYWQvS0l0QS96cTR4dFRlNWcrd29DQjh4VlNi?=
 =?utf-8?B?ZEhGVmx3blZTU0ZNQ1lIekN1dS9vWTZtaGxqb2NJUjB3YWhjeW9tMElOS2dZ?=
 =?utf-8?B?V24zTnJESEp2MmRjSmZDbHBjNkJ3a0puN0JJZmVsN21iWllJNEVDY2dWSUtx?=
 =?utf-8?B?NEhpeER5dk12ODVmNjhOd0lZR09KUFdybDBjK0pBSTdHZGh1azBrQUNiZDk3?=
 =?utf-8?B?LzVHRlhEaUpEMUp4bUxLYVJpTWs0ditScnB0WHA3SDRycHFtZVA1ZExwVmx0?=
 =?utf-8?B?a0FrRjdML2VkdUhqa1JiYXBDYlRDclFXOGZsV0hqRk9lZVBIdml3bkUyclpY?=
 =?utf-8?B?czNrRW1iclp3d2l2eTM5U29pOXhxVEU2dFpUTDhNNUdqQTFwMGZtV0N1UmNy?=
 =?utf-8?B?YytMK2pqY0RPZWFpVXFJZWFwZDJOdzlRTERuZ2dSQXF2WWgrejBLWHJNOE5j?=
 =?utf-8?B?amcrejdIZ283S25hNjhDSXVGUWVvc3phVGpvYUMrWXNodU5jeGxTZmltS1pp?=
 =?utf-8?B?Tk1jUTdTaXYrb1lnWFl2Z0lBZERWS3o3Y1JHZnpReHhSS1dyS3k0NUFtVU5u?=
 =?utf-8?B?VU13WVlFdVBpRzl6bVBld2ZLRVAwNU9lbkYyUUZkLy9paDVaNlhQUmdhVkgy?=
 =?utf-8?B?VjYxb1BpcFNVdzdWZVoyVUZ5cW04Q0syTlRTdzh0M3pRUmFPT2tCeFlxR2FK?=
 =?utf-8?B?dmdDbERVdG5oTVY3UkdjeXJmdmpaNW04NHdBSzAwNHlmYktyVlZzN0UvMUt0?=
 =?utf-8?B?WCtFakhodVdnQ29DaXhVaW8wSDVpQWwwYTBRd2lHbVJ4cEtpM2h4V2JzTmZk?=
 =?utf-8?B?SC9DWW0wV0QrcG1EaVdaOUw0dDBqZWNDQkhUc3NCcHYzTkQ1S0VZY2NzV0tp?=
 =?utf-8?B?TlpmTmxVUHY1NmNjMEhYb2JYOEFNOE1SV0pJN1ZKbFE5QkhTaXoxQmxRY2V5?=
 =?utf-8?B?aHFuVHRjRFJMbi9nYWZrbDJ6T2lTd0pnSXlvZTR1NnRYb2hZcy95Y3hWaVlD?=
 =?utf-8?B?VnBPMVppRDQxSFFsaytFRmlPNzgyYXRHVmhYaDEvVXZudnA5NEp4ZGZrV1A5?=
 =?utf-8?B?SjZpREhzK2JYcWNuZVNZci82VGpaZnhjZ3lHdGxGb1pzb0ptQnlvMk9jdUlN?=
 =?utf-8?B?LzRWWDhNc25XbDk2VWlReVNPdXVXbjY5UXhuSmVFd1RaUEZQcDhDSTFveWgr?=
 =?utf-8?B?ajByYlBIU3pZS2NNdWtoRWZpZ1NGTG9rSjEyc2dOQS95TTd4WEtjQXo5N2U0?=
 =?utf-8?B?RlptaE56Qmc0WC80T0JFOWRjYlpsTnQxRGdENlBaTGpVMjBKakdpMEViUGJt?=
 =?utf-8?B?WHg2aWRiZG9mc1BrZldrU3VtVGg5L3hHSDh0MU5JZUVYSDErRHMwNmpTM2dy?=
 =?utf-8?B?ZGNJbWVnblh5MWtoMkVteUJnYXB3NlZYTTVIdmNqVUpGaUxmWkJvSDNGUnhx?=
 =?utf-8?B?RE5neERaN3lKMGRiZG80UGlZZElyNStkeEYwblVlN1BnZG1Wcm5Fc1J0SzI1?=
 =?utf-8?B?T1puUGxYMzVRVVp4R2JPNVZIK0xYWmlvTksvNnd3bnNSRGlsMjRYSnRjdnVT?=
 =?utf-8?B?TllVdDFvRkxGODZvSlFueTQzcWdHd2RrN3ZoSXN2dXA5UEEvd2VYQ0pDblV5?=
 =?utf-8?B?ZS9xL1pmYnp6bGlkTUFMdHFMR0x2bGt1NkpQK3h2WjNnSjJuRkM1R2RMYTRo?=
 =?utf-8?B?REdyeTBMUVVhRkJYZTlDMU9xVCsySFV5ODZuWmZ5ajNaNHlpSFR1ZWNvR1Ba?=
 =?utf-8?B?VXZ5aGJrSGt5am9aaGl2cWxpRzhPbUZ5RGc3Wi93T1dyQWdubHdUZGRURE05?=
 =?utf-8?B?V1pmc2FFb1pNVE05Wlp4VTlnck9PdzhDWERZUENMZktsSVhTOWUyQ3o2bkc1?=
 =?utf-8?B?MDUzUmNzSFBpSG9zQ3NHdEpNYXFya0hIa3FYRnJnOWRObUMvWGJOYmdjU0Nj?=
 =?utf-8?B?Z1I2ZGRoTkI0T0wrUVNjMzd1VTJTeXI4Tmk2N0F1WUI5ZXc3dnlYU2ZyZFRv?=
 =?utf-8?Q?skO0wZkzOsHq2/5io6v0ebUSL?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a4a7e4b-1c11-462f-f082-08de1c14b094
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 02:40:32.3065
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4QyewXQkjfp+bJCogTYyEkNtoM3Bbi80XZIYR6gYpt03UnwiehX/CBRUsYXDBivjDhiiE2xySsMFVbtowNMqlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8718
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDAxNSBTYWx0ZWRfX3qFkMrfOlws0
 OkBVOmXfecGaVuSSlMXf1Voz0wZTBwUMMiEZ5ujpJg+FJeModcFw3CF0W3DoqU9ecV6Umuwvr+6
 y1VeYfOuoobx2xILSXIifKG5E0DoQbby77doCvRADS/qQ4qrAlv0iMRwCsM5qZiKMzkJ68drjeK
 P0CfIxuK5PzPQF/HcC55Uau+8wc0uvXiQdzpbv+n9v3Qk8R91JjOpK6+UHp+J7N7L7UkMjLt2rd
 IAhNP6lGclyWwP595ud7u6zMveikZFQc1DUrC7BbGs8dgN5sO4z8xSgZbqVXsN8Xl+7C7FOqbsJ
 O6Ph1alsKtW7Ye6jGthDJQ03Dh0fzfTSvd+F+c6LTx5LxkDFA7O3QMy4f1n4ToWRhKnHp5LMN/6
 psx/p+HsWtk2n87lwfejajhDPDd5Ew==
X-Proofpoint-GUID: zfACD-zdcGhq82QX_qDKEWyNLPVYoWj1
X-Proofpoint-ORIG-GUID: PlAtJZb3YIa6i9O8ZGsHsqjy6UgyqUje
X-Authority-Analysis: v=2.4 cv=dovWylg4 c=1 sm=1 tr=0 ts=690ab923 cx=c_pps
 a=ouBVT1c3MJkzDXWVqRnxag==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8 a=9vl3jmbZAiZFlzcANLYA:9
 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_01,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511050015
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 02:40:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225746

On 11/4/25 21:12, Alexander Kanavin wrote:
> On Tue, 4 Nov 2025 at 04:33, Chen Qi via lists.openembedded.org
> <Qi.Chen=windriver.com@lists.openembedded.org> wrote:
>> This is because in case of multilib, HOST_SYS value is not correct.
> Can you please give an example of the incorrect value, and what it
> should be. We probably can find a better way to obtain the correct
> value than surgery on CONFIGURE_FLAGS.
>
> Alex

Hi Alex,

When getting host_sys from td["HOST_SYS"], the value is always 
x86_64-poky-linux. This value is correct for 
environment-setup-x86-64-v3-poky-linux. But for 
environment-setup-x86-pokymllib32-linux, it's not correct. The correct 
value is i686-pokymllib32-linux.

P.S.
In that test case, the check runs after:
self._run("cd {build} && {source}/configure CFLAGS='-std=gnu17 
-Dbool=int -Dtrue=1 -Dfalse=0 -Wno-error=implicit-function-declaration' 
$CONFIGURE_FLAGS".format(**opts))
So I guess the initial intention is to ensure $CONFIGURE_FLAGS actually 
takes effect.

Regards,
Qi


