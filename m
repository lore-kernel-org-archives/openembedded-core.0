Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B0F1C369D5
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 18:10:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.55222.1745863833494213958
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Apr 2025 11:10:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=721376b657=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SA1TH1025647
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 18:10:32 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 468mq1bbeh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 18:10:32 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53SIAVPe019805;
	Mon, 28 Apr 2025 18:10:31 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2047.outbound.protection.outlook.com [104.47.51.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 468mq1bbeg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 18:10:31 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qL8qHIMgIvgt5ZfSpGz64cikzMxtGDpvkPDaRj6eBYWNuz8FAtPOMRdLMJcPp331/52k8O8wsC5Qe8B2BKkdAwOkuRT+OSfnEG4kktuUJLDinolJRpWqv6g+u02hHFhZgpBnyeGZFmOYTKfBzJaxqtZbqRsmIVbBwAUKoq1jkPp68F1atHbxu0EWkvRqTJ29JATDQJapCH9y2OONz0T5Sc3/x1lQEVlQfpHGkpEvL+kEytY8qoFVX8LCQkXu+T4Y3JS5Jo97YUdNX2ICOKhDS090hhZy2cUjIwoY5ZSURq9rzUJFoP2PvXxS0T6Bna8qHqCrchOuO025VqEiDD9SsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TG3qFPGhf9euakuVpLsp8vPgsogaOZntpm5TBSm0vs4=;
 b=qzbgXhM8Tw6jfE6flawYml1okSckIKI5Xt6pZ4itGRo44iTZ7FCG2gU5wkzlLBjyZodUj7axxexJmxdtXy2pH6rluIgxZL6jokHvV5bfTpistbM9RYu9TTs2EPsRhU9aa3ZyFDEnVNdJfRJ1TQwuRGkoKBQqKJv2wdE0IkiplJ38HRcOCfnYDh6e+TgiMfWI7CsJraHkEwX2k774Pl/D4m0wo3jEiQJMU3t8MUqHdiLk6QphKJsxfnxQq9sXaw4KU6M+KgfXFLzwExPqGX+RDmLO/xDhuDbxl4hakal/q3bd8HRL3gMkkbg7mrInlyod7Q3u96rfOaNYnrIhmZ1JFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by IA3PR11MB9326.namprd11.prod.outlook.com (2603:10b6:208:57d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Mon, 28 Apr
 2025 18:10:29 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%5]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 18:10:29 +0000
Content-Type: multipart/alternative;
 boundary="------------Wj4fAyBYFU92Ge5LM0jzNkfq"
Message-ID: <92ce92bb-1a6d-470a-ad95-8b8ebb1d2750@windriver.com>
Date: Mon, 28 Apr 2025 14:10:26 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 2/2 v3] sassc: fix runtime version
To: yi.zhao@eng.windriver.com, Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20250425073757.498411-1-yi.zhao@windriver.com>
 <20250425073757.498411-2-yi.zhao@windriver.com>
 <CANNYZj9p6PoEKJ+FC+K=goQWhGSDi5n+AcGJ8yzq1U5PSXcCcg@mail.gmail.com>
 <46f27f5f-ffe9-4ec0-9c2b-a2a6e6bf3056@windriver.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <46f27f5f-ffe9-4ec0-9c2b-a2a6e6bf3056@windriver.com>
X-ClientProxiedBy: PH7P221CA0005.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:32a::22) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|IA3PR11MB9326:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d8a48a7-252f-4e83-cc07-08dd867ff57a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|4022899009|1800799024|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?djlRdnVxRFQ3SmJKOXlUTklDR25yc3lmalh0MCsvSWRGQjlHS2JVVGozT1V2?=
 =?utf-8?B?Q3BEMDRXM3R3T1JGQ2k4WCtNOWpTU0Q5TWluUzN1WWtCUzhKN0NXMDRrcHQy?=
 =?utf-8?B?VjA1ckNkVVdTRmxpbnBTZVdmTHEwMWRHQ0ZpemxVNjRvaEkzdlFlT0hxRFNu?=
 =?utf-8?B?U2ozTG5pcEtZVEo0VENIT1FDVWlJeGtPcFozbDJVUWh4NDh5aTVzYUtkL0Q1?=
 =?utf-8?B?Qnl5SkxaSU56dDZ6Ris3eFNhc1pkcHp0b2pxZ212TTg4cGxaOEVuYlRLWVp0?=
 =?utf-8?B?NHB6eURIaCtUSlpLSXVKT3phUTJoWTc2cW1hSXRSc2ZQbkg2NmlqQnY5NTVm?=
 =?utf-8?B?YW9IVWZZSC9tUHd3bStFZXA2UTlsaUZveWo1TllBNG9jYnBuc01CYnp2S1Fh?=
 =?utf-8?B?SENmVkcycmw2Ymh4QjRhSzhrRzJjbzlDU0ZPMTVQVm83WnZDWE0xVlRoZGV0?=
 =?utf-8?B?eFQwMXpFSk90ZlRKTEVvMFA1d1JTYmhMSEI1b1BYSTByWjNLeDRhUFE1NCsz?=
 =?utf-8?B?aWkrNW54d1ZTZXpXbVZkQjYyNWZRVGRpOHhmc1ZvS0NmMjFyNWgzRjBKTHdx?=
 =?utf-8?B?WlJaZTJkMTduQmI2Ymo0Vnc5TXBRS2N6TWdNU3ZxamxnNGZZa1N4RytNT1Ax?=
 =?utf-8?B?bENJRngxRUM0UlFPOEhlN2Y5QlMrSjArak9YeUlpRExIN0Ira1A1dXBkeDlV?=
 =?utf-8?B?eko2RWVLUEZDa3V5REhhV1BzemtuaUFqU0dXMFRRMUYvUThoa3A3TEpETHlp?=
 =?utf-8?B?eHZhc3MycGFZRU9haVpsZ1A3WEZnZGNaeGZFRytXWlZiblRUbW1XcGFXaEEv?=
 =?utf-8?B?RVFxSEtwMTFtOHhTZFd6L0VwUWk4NkxiRUJLMWxPY1VhaU9WYm1FWEtkTzBR?=
 =?utf-8?B?ZWFmOXdpMVJuL0N4NnJaV2lDMVVWeXMrUEo3MUpDMWV1WEhleTNtcy9YVjNq?=
 =?utf-8?B?R2ZYTnMwYjhYd3NqZ0cza3JlbjE5ZlBaVnh3QkJEU0RwYmsrMnl1Y0pjV3Vt?=
 =?utf-8?B?ejRFdGxUanJVYWNvdktabW94dkdLaGxWMll6Y3huOStLd1J0SnZEOEFCRlg1?=
 =?utf-8?B?RVdTV1dFVnNoRWk4dG9JVzJ3L1ozbVl4QnEzb1JPaFJzUHZFSjFsOWpZajlx?=
 =?utf-8?B?VXN1bVFUbWZLZkdHalNPSUgyaU1VODhvUnRpWmZIZjVYejlHeTRkaU5MME1U?=
 =?utf-8?B?ZFVWWVROVnM1T2NGcFhqNE5KSXE1WUc3VXBRbTUrVk5nRWZuTVBqeHg1Rkgv?=
 =?utf-8?B?N1ZTZG5CeDVPY1N2K1dCR0VwYnJrOEp6dHMzWVRGdVBWR3h1ZUZFeElvbkZn?=
 =?utf-8?B?bFFSQVNOSm4vRFJEMWZhZGVIYjQwcVRJNmdZT054QktDYlF5NnRDUG9ZTGZS?=
 =?utf-8?B?RVU3akN6ekxYOFA4NXBVNm9MQkkxTVYxLytHYXRyUE9Pa1JqN3c2SGZIa3pY?=
 =?utf-8?B?VHByY3R1ZXhOejh1MmZiVEh6VzJJWlV4QkRsdkY2NUNXNm1ya0xQQjhVRkN0?=
 =?utf-8?B?VlRUbGFqUTF0cHhkdjBsUnNWVHVNYlllUno2Ynh4R1UyZk9rRm1SbWp3WTVV?=
 =?utf-8?B?UWhLZjltTldXRW9uczlpYkp1ZWM4WDhhaXc3Qkhmc014VTVmREFjd2VaazlR?=
 =?utf-8?B?V2N0bVZGNmszallKbFpPTnA0ODhNQ2IvaS9TLy9lZ1k5N1hZZERsTWxqaEVq?=
 =?utf-8?B?M3IrWldGVmtvUEdteDZiQ2hvdHhTazQrYzBtMGZ6Umo4cjR0QmhZQ05lMTZ5?=
 =?utf-8?B?bU1qSUtGV0tsdEdxdW9oSkp0QkRMZDBscllCOHJ1aGpiTC85bXlUU1UyRWpa?=
 =?utf-8?B?Sk5hVFdLUXJVV2E3RXd4UlJRUER1dS8rYzQxclBHRzRwT2hERElTdHJVRVYz?=
 =?utf-8?Q?bhplANMQnwHk0?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(4022899009)(1800799024)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VTZwYWdBeEd5cEhZd2dZVVRqaHJCcVorUW9zMnp1MHZORlN4YU9oeDIrdXp1?=
 =?utf-8?B?OWtWWjl6WGhKVzI3bGV3cW1xd3N6bDdqcGJ0dWR2TGFaMGMrZEIwU3h5cm5U?=
 =?utf-8?B?SXJQMG1DNlhkaWRDOEV4cjVmOTZFaytWR2E4YjRkV1JVWXdNc08xMEhFV3pR?=
 =?utf-8?B?WXY2eUVaY1p0b3hoVUhqT1Z5T2VFMDNPaEZnNDJuanFpdVl0RGJsZnovMzho?=
 =?utf-8?B?cllFNXF4RUZSMDBRTUlNekxGZGRuSDdSbDE1WDBwOU01RkVZT1RFTlptaUIy?=
 =?utf-8?B?cGNURSsrWnEyem9tNlpqUzNaOGJIaVlIVE5pVm1RRUxadkcvUEQ0YXNQTDBk?=
 =?utf-8?B?WHVzWjBlR2J5OGV3Qk1CN0d3bTJibjg1ckZ1eEM2cFVGUjduU0J6NzNJU28w?=
 =?utf-8?B?L1ZQa20xUGViVldBYU1CYVU5YzVML3FGRXFOZWhQRzBzNlJ3NkVzR1JLZlVY?=
 =?utf-8?B?cEoybzd2UndKcjExTGI4Y0g4UzlpZ0VsbUhtanZnRUFiTWZnYURJRHZSU003?=
 =?utf-8?B?enNVQkU3Zi83cG85VUZzKzk3b3Fjays4SDdIMTZ1a1BiQlkzUE50TnByaUhn?=
 =?utf-8?B?bGJmMFJDdysxeWtmQmhvQ2VyQVhRckZ6d2xlNDg2REpNY0pVblFrVlR5M1BM?=
 =?utf-8?B?N1Y3UEVjcEdJWDIvT09CcTkzejRNdmFIeWtsUGFCbk5vTEthWW9OekRoejBr?=
 =?utf-8?B?Y0Q1NmpkT24rWEpldkVCSCtQc1lHOFQreVdSMHBpZ0h0UFpmbUlUVnNwd3JB?=
 =?utf-8?B?THBZMjVCS25OOEpPblNNdjBCM1I1SUtBN2h3N2oyQTFtelNYVkdoeHNWUzZp?=
 =?utf-8?B?dWxQd3YxdkR6QjJjOXlpNFFLVmZqWEIvV0tQM2JGV2wxN1FXMk90YVZtQnhY?=
 =?utf-8?B?YytSSTVkYWdMSDQxSDZyaXhxcHVvSkJrVHFJa3hkWk5xN0VvVVNIMDh3a1Ft?=
 =?utf-8?B?RFVuS1JkaGx3QW5ScGdwUWx1S3IwQS9nYi9ydjZqWlNqUHlMVTd4Vjlad2h1?=
 =?utf-8?B?dU1lQ05QSnE2dDY3MDFWMnV5QmkxSVNSSytobGZRTlVSVGNFY0V5KzNWSDVW?=
 =?utf-8?B?WWNPUXlLUmJRVWZZbjkvTlphWUxxaGdKUTRrV3YyQ2graFlxckNuRXgwcll5?=
 =?utf-8?B?S2haaHErY0tncHlQRjBHTSsvTWZnNTB4aHl1dUlKeDZsN0pkR0pJUXByZjZy?=
 =?utf-8?B?ZjRPK0tmYjkrZU5KSytRcjlQdG9mbVpoQTVpUHlGWmRnVWVIZG9iL1kyTTFa?=
 =?utf-8?B?MlpDaS9YNThIOUovMThBR200Qnd2UGQ3YjU0VEw1Q0xHUVZWYXVIaHNoMWxH?=
 =?utf-8?B?bUZrbjA3ajltVU5ES25CYU9hUnJuVVZKZmVZanlUWFcvOGtYY1V1TldvVkpy?=
 =?utf-8?B?bHA3V2tnOW9oNlgrbjVMUzJGdE1PV2YwRkl5ajlhaktrMUFxRnJIOXZ4OTJw?=
 =?utf-8?B?MHJFbDNhRmdJcDV4anRmSG5MYkRtb2s4UldjZGFGZHJCUDR1MFpGeVAyZVlp?=
 =?utf-8?B?dDhlV1d4ZlFXRXJGOVYyY0p4L0Q1dlFsS2JsdWhBNlFUMEZyZWN6TkQ4dTZI?=
 =?utf-8?B?VUFuL0pibkREWXZsRmlMWUVNa1kvQjVVdUFPWFRBWE9adEhlakQ3blN3bFQ1?=
 =?utf-8?B?RVgvck1BV0lkOXpWME1sc043UGlGbGpqdUhjT2FZVHY2ODkwM051LzJ6eUdr?=
 =?utf-8?B?elhEeE8vMGZBOTNBbSs1VkN1V3hyam9XQmdpeTRkOWo4dm9NMzVOMCt3dDZa?=
 =?utf-8?B?NzdVc0R2cTNIUEI3LzlnZTFYTXB5MlRjNis2Y2pITER0TkJHaEwwSkFXV1Na?=
 =?utf-8?B?RGVQcm5kU3lYbUsyTDR3MkhSMk9jL1Z5bzQzRzN4c24vYnhPRm9tQzV0Q2I1?=
 =?utf-8?B?c1oydGU5WmVyQzU1OC80Sy9OdWpUOFY3S2hyVVpwV0k2QmovQkN3YmMvaUdr?=
 =?utf-8?B?WmtDSnBGWStHMVhFUTFtelozdEFGUUowalZXVzlKb2lndGc5MG5vbHUyVTNZ?=
 =?utf-8?B?TVVWTkZQTmJ1WDZLYjBlcDJsWHZFbUNGRUdCWGVEUklnRzExa1p2YndQek9W?=
 =?utf-8?B?elN6QUhDYmJtMGhRS252bGhTNHVRWWR5RGNGTzQ3NW9aNC9uQ2RQR2ljby9x?=
 =?utf-8?B?UittWjk4aDh2L041WmpxOXcyMG1lY1RZRnVxYUI1SlpDKzJSYXpoMWtxSVhI?=
 =?utf-8?B?bkE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d8a48a7-252f-4e83-cc07-08dd867ff57a
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 18:10:29.5498
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aIlY2WzZ46ZKgY0AGEPpnSL86ao/UaOW6a8g0t94Vo359+NSVWYTF3VFu9RvUGxaPXqmaKAJxTGLWPfOCd4bz+UHvZQLTfiHSaVmTvSBbvs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9326
X-Authority-Analysis: v=2.4 cv=KsNN2XWN c=1 sm=1 tr=0 ts=680fc498 cx=c_pps a=u2H4imzVBiBAAVvoIH6jzw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=GHR8O2WEAAAA:20 a=qbLOQGqaAAAA:8 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=hUsISnDMil_EpruoJa8A:9 a=PRpDppDLrCsA:10 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=5HHBg_ie6hl66G1yLSAA:9 a=zDjlbIaZ9on8bghr:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=ImwWUX5h3JJ3gRE9moBe:22 a=m7yqlbrVXkTAUhdofiT9:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: CJa71eHiKbs4MB4k9_eNSHrQkA10IAAD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDE0NiBTYWx0ZWRfXw0CVRQKOKx5R szdJr8c7zZQcSX8rnbZsoZbZO2C8qF91j2QnXxIesoxFFuAVAfP2y+I13h8BMGY/kG5h3Q59pg4 ssFu4Z8VAU/H1/KmblIYPKypCzKczPtR2lyw7dPfcFuIjw/vfWrrl6asT17A8pUF5x8LrS1asLb
 ASZ9N67eBFtoB3qephfp0FTAGkImv4JLPBI3D27fsPNZbGQJFfC10ZoYZvQxOQL/OxXm2z1hpxy 278wDUTvtUjHu7EVUgTVi5yuemTa5Y9zflcQAqh1kmwyx813CI9qx2B5YqoRK6KFMfEVtCzQJ4j me9Vsz+ioccv4p8Whuq/srC620Keqsk+vuIdOpXOZJ+y5IKkG+nr59it31TBFQN+QxbGSK0MwT8
 M8kPMFTcP/gctciw7m/X6sWuPgei6ooIPuALpPPClTuSFt16DA7lMFk9w3lecSi1KzzTC4it
X-Proofpoint-GUID: UMxtZdTti2paXLx_3TiLI9-8baK6H1kb
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_07,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 mlxscore=0 phishscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2504280146
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 18:10:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215627

--------------Wj4fAyBYFU92Ge5LM0jzNkfq
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 53SA1TH1025647

Yi,

We'll likely wait a week or two to see if we hear=C2=A0 hear from upstrea=
m=20
before merging.

Could you open an issue with libadwaita to see if they know that sassc=20
isn't really maintained?

Ah, there's already one opened=C2=A0 2 years ago but:
https://gitlab.gnome.org/GNOME/libadwaita/-/issues/484

Can (should) they=C2=A0 switch to: https://sass-lang.com/dart-sass/=C2=A0=
 ?
It seems that they are justifiably concerned about using dart-sass as of=20
a few weeks ago.

Does anyone have a different solution?

../Randy




On 2025-04-26 10:18 p.m., Yi Zhao via lists.openembedded.org wrote:
>
> On 4/25/25 16:11, Alexander Kanavin wrote:
>> Thanks, v3 for both patches look good.
>>
>> Can you review usage of these components in core and meta-oe? Are they
>> optional or hard dependencies?
>
>
> Only 2 recipes depend on it. libadwaita (in oe-core) and adw-gtk3 (in
> meta-oe). There is no build option to enable/disable this dependency.
>
> For libadwata, if sassc is not found, it will try to build sassc itself.
>
> In src/stylesheet/meson.build:
>
> sassc =3D find_program('sassc', required: false)
> if not sassc.found()
> =C2=A0 subproject('sassc', default_options: ['warning_level=3D0',=20
> 'werror=3Dfalse'])
> =C2=A0 sassc =3D find_program('sassc')
> endif
>
>
> //Yi
>
>
>>
>> Alex
>>
>> On Fri, 25 Apr 2025 at 09:38, Yi Zhao via lists.openembedded.org
>> <yi.zhao=3Deng.windriver.com@lists.openembedded.org> wrote:
>>> The sassc_version.h should be generated from sassc_version.h.in. But
>>> there is already a sassc_version.h file in source directory. When ${S=
}
>>> !=3D ${B}, the sassc_version.h is generated in build directory, and t=
he
>>> original sassc_version.h in source directory is not overwritten.
>>> However, the latter is used during the build, resulting in a missing
>>> runtime version. Remove sassc_version.h from source directory to ensu=
re
>>> that the one in build directory is used during the build.
>>>
>>> Before the fix:
>>> $ sassc --version
>>> sassc: [NA]
>>> libsass: [NA]
>>> sass2scss: 1.1.1
>>> sass: 3.5
>>>
>>> After the fix:
>>> $ sassc=C2=A0 --version
>>> sassc: 3.6.2
>>> libsass: 3.6.6
>>> sass2scss: 1.1.1
>>> sass: 3.5
>>>
>>> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>>> ---
>>> =C2=A0 ...assc_version.h-from-source-directory.patch | 61=20
>>> +++++++++++++++++++
>>> =C2=A0 meta/recipes-support/sass/sassc_git.bb=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 4 +-
>>> =C2=A0 2 files changed, 64 insertions(+), 1 deletion(-)
>>> =C2=A0 create mode 100644=20
>>> meta/recipes-support/sass/sassc/0001-Remove-sassc_version.h-from-sour=
ce-directory.patch
>>>
>>> diff --git=20
>>> a/meta/recipes-support/sass/sassc/0001-Remove-sassc_version.h-from-so=
urce-directory.patch=20
>>> b/meta/recipes-support/sass/sassc/0001-Remove-sassc_version.h-from-so=
urce-directory.patch=20
>>>
>>> new file mode 100644
>>> index 0000000000..c6717995c5
>>> --- /dev/null
>>> +++=20
>>> b/meta/recipes-support/sass/sassc/0001-Remove-sassc_version.h-from-so=
urce-directory.patch
>>> @@ -0,0 +1,61 @@
>>> +From b5d03d5313d4cc19a7e6e9ba5fd74d1f8400cd46 Mon Sep 17 00:00:00 20=
01
>>> +From: Yi Zhao <yi.zhao@windriver.com>
>>> +Date: Thu, 24 Apr 2025 21:28:55 +0800
>>> +Subject: [PATCH] Remove sassc_version.h from source directory
>>> +
>>> +The sassc_version.h should be generated from sassc_version.h.in. If=20
>>> the
>>> +build directory is out of the source directory, the sassc_version.h =
is
>>> +generated in build directory and the original sassc_version.h in=20
>>> source
>>> +directory is not overwritten. However, the latter is used during the
>>> +build, resulting in a missing runtime version:
>>> +
>>> +$ sassc --version
>>> +sassc: [NA]
>>> +libsass: [NA]
>>> +sass2scss: 1.1.1
>>> +sass: 3.5
>>> +
>>> +Remove sassc_version.h from source directory to ensure that the
>>> +sassc_version.h in build directory is used during the build.
>>> +
>>> +Also remove '--dirty' option from 'git describe' command line in
>>> +version.sh to get rid of '-dirty' suffix from version number that
>>> +was introduced with this change.
>>> +
>>> +Upstream-Status: Submitted [https://github.com/sass/sassc/pull/283]
>>> +
>>> +Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>>> +---
>>> + sassc_version.h | 8 --------
>>> + version.sh=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
>>> + 2 files changed, 1 insertion(+), 9 deletions(-)
>>> + delete mode 100644 sassc_version.h
>>> +
>>> +diff --git a/sassc_version.h b/sassc_version.h
>>> +deleted file mode 100644
>>> +index 3ca12e3..0000000
>>> +--- a/sassc_version.h
>>> ++++ /dev/null
>>> +@@ -1,8 +0,0 @@
>>> +-#ifndef SASSC_VERSION_H
>>> +-#define SASSC_VERSION_H
>>> +-
>>> +-#ifndef SASSC_VERSION
>>> +-#define SASSC_VERSION "[NA]"
>>> +-#endif
>>> +-
>>> +-#endif
>>> +diff --git a/version.sh b/version.sh
>>> +index d56af99..cf97d82 100755
>>> +--- a/version.sh
>>> ++++ b/version.sh
>>> +@@ -1,5 +1,5 @@
>>> + if test "x$SASSC_VERSION" =3D "x"; then
>>> +-=C2=A0 SASSC_VERSION=3D`git describe --abbrev=3D4 --dirty --always =
--tags=20
>>> 2>/dev/null`
>>> ++=C2=A0 SASSC_VERSION=3D`git describe --abbrev=3D4 --always --tags 2=
>/dev/null`
>>> + fi
>>> + if test "x$SASSC_VERSION" =3D "x"; then
>>> +=C2=A0=C2=A0 SASSC_VERSION=3D`cat VERSION 2>/dev/null`
>>> +--
>>> +2.34.1
>>> +
>>> diff --git a/meta/recipes-support/sass/sassc_git.bb=20
>>> b/meta/recipes-support/sass/sassc_git.bb
>>> index b7f57ca244..64e92f48cf 100644
>>> --- a/meta/recipes-support/sass/sassc_git.bb
>>> +++ b/meta/recipes-support/sass/sassc_git.bb
>>> @@ -7,7 +7,9 @@ DEPENDS =3D "libsass"
>>>
>>> =C2=A0 inherit autotools pkgconfig
>>>
>>> -SRC_URI =3D=20
>>> "git://github.com/sass/sassc.git;branch=3Dmaster;protocol=3Dhttps"
>>> +SRC_URI =3D=20
>>> "git://github.com/sass/sassc.git;branch=3Dmaster;protocol=3Dhttps \
>>> + file://0001-Remove-sassc_version.h-from-source-directory.patch"
>>> +
>>> =C2=A0 SRCREV =3D "66f0ef37e7f0ad3a65d2f481eff09d09408f42d0"
>>> =C2=A0 S =3D "${WORKDIR}/git"
>>> =C2=A0 PV =3D "3.6.2"
>>> --=20
>>> 2.34.1
>>>
>>>
>>>
>>>
> pLK@tY:ATbOf1"dW
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#215529):https://lists.openembedded.org/g/openembedd=
ed-core/message/215529
> Mute This Topic:https://lists.openembedded.org/mt/112447458/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [r=
andy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------Wj4fAyBYFU92Ge5LM0jzNkfq
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Yi,</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">We'll likely wait a week or two to see
      if we hear&nbsp; hear from upstream before merging.<br>
      <br>
    </div>
    <div class="moz-cite-prefix">Could you open an issue with libadwaita
      to see if they know that sassc isn't really maintained?</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">Ah, there's already one opened&nbsp; 2 years
      ago but:</div>
    <div class="moz-cite-prefix">&nbsp;&nbsp;
      <a class="moz-txt-link-freetext" href="https://gitlab.gnome.org/GNOME/libadwaita/-/issues/484">https://gitlab.gnome.org/GNOME/libadwaita/-/issues/484</a><br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">Can (should) they&nbsp; switch to:
      <a class="moz-txt-link-freetext" href="https://sass-lang.com/dart-sass/">https://sass-lang.com/dart-sass/</a>&nbsp; ?<br>
      It seems that they are justifiably concerned about using dart-sass
      as of a few weeks ago.</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">Does anyone have a different solution?<br>
    </div>
    <p>../Randy</p>
    <p><br>
    </p>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">On 2025-04-26 10:18 p.m., Yi Zhao via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:46f27f5f-ffe9-4ec0-9c2b-a2a6e6bf3056@windriver.com">
      <br>
      On 4/25/25 16:11, Alexander Kanavin wrote:
      <br>
      <blockquote type="cite">Thanks, v3 for both patches look good.
        <br>
        <br>
        Can you review usage of these components in core and meta-oe?
        Are they
        <br>
        optional or hard dependencies?
        <br>
      </blockquote>
      <br>
      <br>
      Only 2 recipes depend on it. libadwaita (in oe-core) and adw-gtk3
      (in
      <br>
      meta-oe). There is no build option to enable/disable this
      dependency.
      <br>
      <br>
      For libadwata, if sassc is not found, it will try to build sassc
      itself.
      <br>
      <br>
      In src/stylesheet/meson.build:
      <br>
      <br>
      sassc = find_program('sassc', required: false)
      <br>
      if not sassc.found()
      <br>
      &nbsp; subproject('sassc', default_options: ['warning_level=0',
      'werror=false'])
      <br>
      &nbsp; sassc = find_program('sassc')
      <br>
      endif
      <br>
      <br>
      <br>
      //Yi
      <br>
      <br>
      <br>
      <blockquote type="cite">
        <br>
        Alex
        <br>
        <br>
        On Fri, 25 Apr 2025 at 09:38, Yi Zhao via lists.openembedded.org
        <br>
        <a class="moz-txt-link-rfc2396E" href="mailto:yi.zhao=eng.windriver.com@lists.openembedded.org">&lt;yi.zhao=eng.windriver.com@lists.openembedded.org&gt;</a> wrote:
        <br>
        <blockquote type="cite">The sassc_version.h should be generated
          from sassc_version.h.in. But
          <br>
          there is already a sassc_version.h file in source directory.
          When ${S}
          <br>
          != ${B}, the sassc_version.h is generated in build directory,
          and the
          <br>
          original sassc_version.h in source directory is not
          overwritten.
          <br>
          However, the latter is used during the build, resulting in a
          missing
          <br>
          runtime version. Remove sassc_version.h from source directory
          to ensure
          <br>
          that the one in build directory is used during the build.
          <br>
          <br>
          Before the fix:
          <br>
          $ sassc --version
          <br>
          sassc: [NA]
          <br>
          libsass: [NA]
          <br>
          sass2scss: 1.1.1
          <br>
          sass: 3.5
          <br>
          <br>
          After the fix:
          <br>
          $ sassc&nbsp; --version
          <br>
          sassc: 3.6.2
          <br>
          libsass: 3.6.6
          <br>
          sass2scss: 1.1.1
          <br>
          sass: 3.5
          <br>
          <br>
          Signed-off-by: Yi Zhao <a class="moz-txt-link-rfc2396E" href="mailto:yi.zhao@windriver.com">&lt;yi.zhao@windriver.com&gt;</a>
          <br>
          ---
          <br>
          &nbsp; ...assc_version.h-from-source-directory.patch | 61
          +++++++++++++++++++
          <br>
          &nbsp; meta/recipes-support/sass/sassc_git.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 4 +-
          <br>
          &nbsp; 2 files changed, 64 insertions(+), 1 deletion(-)
          <br>
          &nbsp; create mode 100644
meta/recipes-support/sass/sassc/0001-Remove-sassc_version.h-from-source-directory.patch<br>
          <br>
          diff --git
a/meta/recipes-support/sass/sassc/0001-Remove-sassc_version.h-from-source-directory.patch
b/meta/recipes-support/sass/sassc/0001-Remove-sassc_version.h-from-source-directory.patch
          <br>
          new file mode 100644
          <br>
          index 0000000000..c6717995c5
          <br>
          --- /dev/null
          <br>
          +++
b/meta/recipes-support/sass/sassc/0001-Remove-sassc_version.h-from-source-directory.patch<br>
          @@ -0,0 +1,61 @@
          <br>
          +From b5d03d5313d4cc19a7e6e9ba5fd74d1f8400cd46 Mon Sep 17
          00:00:00 2001
          <br>
          +From: Yi Zhao <a class="moz-txt-link-rfc2396E" href="mailto:yi.zhao@windriver.com">&lt;yi.zhao@windriver.com&gt;</a>
          <br>
          +Date: Thu, 24 Apr 2025 21:28:55 +0800
          <br>
          +Subject: [PATCH] Remove sassc_version.h from source directory
          <br>
          +
          <br>
          +The sassc_version.h should be generated from
          sassc_version.h.in. If the
          <br>
          +build directory is out of the source directory, the
          sassc_version.h is
          <br>
          +generated in build directory and the original sassc_version.h
          in source
          <br>
          +directory is not overwritten. However, the latter is used
          during the
          <br>
          +build, resulting in a missing runtime version:
          <br>
          +
          <br>
          +$ sassc --version
          <br>
          +sassc: [NA]
          <br>
          +libsass: [NA]
          <br>
          +sass2scss: 1.1.1
          <br>
          +sass: 3.5
          <br>
          +
          <br>
          +Remove sassc_version.h from source directory to ensure that
          the
          <br>
          +sassc_version.h in build directory is used during the build.
          <br>
          +
          <br>
          +Also remove '--dirty' option from 'git describe' command line
          in
          <br>
          +version.sh to get rid of '-dirty' suffix from version number
          that
          <br>
          +was introduced with this change.
          <br>
          +
          <br>
          +Upstream-Status: Submitted
          [<a class="moz-txt-link-freetext" href="https://github.com/sass/sassc/pull/283">https://github.com/sass/sassc/pull/283</a>]
          <br>
          +
          <br>
          +Signed-off-by: Yi Zhao <a class="moz-txt-link-rfc2396E" href="mailto:yi.zhao@windriver.com">&lt;yi.zhao@windriver.com&gt;</a>
          <br>
          +---
          <br>
          + sassc_version.h | 8 --------
          <br>
          + version.sh&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 2 +-
          <br>
          + 2 files changed, 1 insertion(+), 9 deletions(-)
          <br>
          + delete mode 100644 sassc_version.h
          <br>
          +
          <br>
          +diff --git a/sassc_version.h b/sassc_version.h
          <br>
          +deleted file mode 100644
          <br>
          +index 3ca12e3..0000000
          <br>
          +--- a/sassc_version.h
          <br>
          ++++ /dev/null
          <br>
          +@@ -1,8 +0,0 @@
          <br>
          +-#ifndef SASSC_VERSION_H
          <br>
          +-#define SASSC_VERSION_H
          <br>
          +-
          <br>
          +-#ifndef SASSC_VERSION
          <br>
          +-#define SASSC_VERSION &quot;[NA]&quot;
          <br>
          +-#endif
          <br>
          +-
          <br>
          +-#endif
          <br>
          +diff --git a/version.sh b/version.sh
          <br>
          +index d56af99..cf97d82 100755
          <br>
          +--- a/version.sh
          <br>
          ++++ b/version.sh
          <br>
          +@@ -1,5 +1,5 @@
          <br>
          + if test &quot;x$SASSC_VERSION&quot; = &quot;x&quot;; then
          <br>
          +-&nbsp; SASSC_VERSION=`git describe --abbrev=4 --dirty --always
          --tags 2&gt;/dev/null`
          <br>
          ++&nbsp; SASSC_VERSION=`git describe --abbrev=4 --always --tags
          2&gt;/dev/null`
          <br>
          + fi
          <br>
          + if test &quot;x$SASSC_VERSION&quot; = &quot;x&quot;; then
          <br>
          +&nbsp;&nbsp; SASSC_VERSION=`cat VERSION 2&gt;/dev/null`
          <br>
          +--
          <br>
          +2.34.1
          <br>
          +
          <br>
          diff --git a/meta/recipes-support/sass/sassc_git.bb
          b/meta/recipes-support/sass/sassc_git.bb
          <br>
          index b7f57ca244..64e92f48cf 100644
          <br>
          --- a/meta/recipes-support/sass/sassc_git.bb
          <br>
          +++ b/meta/recipes-support/sass/sassc_git.bb
          <br>
          @@ -7,7 +7,9 @@ DEPENDS = &quot;libsass&quot;
          <br>
          <br>
          &nbsp; inherit autotools pkgconfig
          <br>
          <br>
          -SRC_URI =
          &quot;git://github.com/sass/sassc.git;branch=master;protocol=https&quot;
          <br>
          +SRC_URI =
          &quot;git://github.com/sass/sassc.git;branch=master;protocol=https
          \
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <a class="moz-txt-link-freetext" href="file://0001-Remove-sassc_version.h-from-source-directory.patch">file://0001-Remove-sassc_version.h-from-source-directory.patch</a>&quot;
          <br>
          +
          <br>
          &nbsp; SRCREV = &quot;66f0ef37e7f0ad3a65d2f481eff09d09408f42d0&quot;
          <br>
          &nbsp; S = &quot;${WORKDIR}/git&quot;
          <br>
          &nbsp; PV = &quot;3.6.2&quot;
          <br>
          --
          <br>
          2.34.1
          <br>
          <br>
          <br>
          <br>
          <br>
        </blockquote>
      </blockquote>
      pLK@tY:ATbOf1&quot;dW
      <br>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre wrap="" class="moz-quote-pre">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#215529): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/215529">https://lists.openembedded.org/g/openembedded-core/message/215529</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/112447458/3616765">https://lists.openembedded.org/mt/112447458/3616765</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------Wj4fAyBYFU92Ge5LM0jzNkfq--

