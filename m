Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7472C71157
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 00:19:29 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.19918.1750033163776169909
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jun 2025 17:19:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8262fcfb06=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G09dfY015951
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 00:19:22 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 478xa1hbfy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 00:19:22 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55G0JLGw029481;
	Mon, 16 Jun 2025 00:19:21 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2046.outbound.protection.outlook.com [40.107.237.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 478xa1hbfx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Jun 2025 00:19:21 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kVaa5q2Bk6UL5HRXaX2ntrk4NHph1yY+0JziCOLGCtTPPrie8tSc78QjaZZkGSzmgUkcWioKopjI/pvEII1i4kgpq9mWxg95UwPOxbSJjDguVNYBEpdS5wpbPu5RYEZfLj72ZKIt6UC3zp+CdCiHKAePuGxmWp9BY22BI+7k/hYJ78kAy9X6fqP6JYgUDsoFr5hhQcWoW+QYrlw3pN8Ubha6kiMV6m3MTNsOOt0y1ObwrNVdElr8ZnxFjGJyNbisHwGiknDi1X65z6dJUYIqLkZBPPMT/1M0wWFH02JCbEWH+h2VTaoJIMQm05/DVTBFjIVXQJxgfG2ttCX1KhjvKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NuLBjUB51UxJQ73+7rEz2wXwnkqwNqoV5xYOwj1M8ko=;
 b=K2tpwfVHBjxJRce9DYT52RezKBcl3ZQbkT1Qi/ib5Qo+UIHtUulzB2QY4cPpKgnhpnzG6TZcu+/di1hs1vZudCHeJmbFQHALAXVU5VDYKCC/rul+EGL5VLQaF7MkZ4HZC4INABloPW7Ucb1hhC/O5sc6pzBEINI8sZw50LvbAYZnkGM/ygZ255WRtbbBXZNBMkyL7ab7DKHTO4dOivcN8ABH1A3KPzfWgUGXG4h8OzzG4XOW6e8N+uM6qVqDgFQgSd3/qOn4fUFdVePHKVUNBNv3R1icWuGxNfYjdckhjFTpsODtSqT15NV+wuGLBSKnlSUSyvBpo3mEeWaGDDfyUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by SJ2PR11MB8513.namprd11.prod.outlook.com (2603:10b6:a03:56e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 00:19:18 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%4]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 00:19:18 +0000
Content-Type: multipart/alternative;
 boundary="------------ZRGHujzvtWW5iMe5jSRwQRvu"
Message-ID: <e8d9e1d0-ae8b-4172-bacb-2f9efb42bc71@windriver.com>
Date: Mon, 16 Jun 2025 08:19:12 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [kirkstone][PATCH 00/20] *** libsoup/libsoup-2.4: fix
 CVEs ***
To: Steve Sakoman <steve@sakoman.com>, Vijay Anusuri <vanusuri@mvista.com>
Cc: openembedded-core@lists.openembedded.org
References: <20250613034352.175878-1-changqing.li@windriver.com>
 <CAOSpxdZwOjkN+OaHEzhv6qngpS+aGTx8OcdCWR9ewb9U5PSvfQ@mail.gmail.com>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <CAOSpxdZwOjkN+OaHEzhv6qngpS+aGTx8OcdCWR9ewb9U5PSvfQ@mail.gmail.com>
X-ClientProxiedBy: SI1PR02CA0024.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::12) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|SJ2PR11MB8513:EE_
X-MS-Office365-Filtering-Correlation-Id: f0063084-b3dc-4e4c-400f-08ddac6b6f1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|366016|1800799024|376014|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MTJFN3FxN1Q0L284UkJoUFBBeStsZVEwempyTEVLV3RrTXhROHU5ZWp0cEox?=
 =?utf-8?B?YWRUUjlBbmh4RWpkNUJ1cUdxdm5UOXREKzNSK2w4MDdJdVQ0bE42LzNHcXE5?=
 =?utf-8?B?ZXAxYmJpdmRaV05NNlM0TkxxeCtIMWtZZk1TcGdZR2lXaEZnMHpuc1ZkN3BX?=
 =?utf-8?B?OUJrNkdONUp2UFpQYXpyMUZ5RDRxdm91RjNXTzdCZ2IvdTNVOWEvVmRYTXUr?=
 =?utf-8?B?bmpTZ0pNYm41MjBoQ05EbnVzdFgrc3BsNW1Pc25WczFxZmNZWUpZU1lKRGRY?=
 =?utf-8?B?dzlvL1lyVldXU1gzNDNtK3dibGdPWlNmejB3TEkwd3NMWU9BeTZlT0U0VHlu?=
 =?utf-8?B?UTZWR3N3cldrQUQwbzRVb0ZRd1hyM2VtNW5ibm5pSXdwb3Nycng4REFzTWhJ?=
 =?utf-8?B?L2NZb3E1Q2MzT0ZvcFI1SzA3N3ZCZVIwZmdqU0cyZjdRRkJOcitOL3FocWVD?=
 =?utf-8?B?aW9xS3VOVUFiRXNNVTdWcStKUDk5MkRNS251NllrOG1KdHo4WFBldFlJS0R6?=
 =?utf-8?B?akZDbzBOMjlEMlpIa291VUNldUhSdC9DRm5SdEUrQzBqWE5KRThPaTcxamhD?=
 =?utf-8?B?WTY4UUlVZzRhaDFUZHpQaElyZUlEQ2NZVEhiWVJOQkNmY3lYNGNmdlRpeFMw?=
 =?utf-8?B?ZnBleUNnYjg4cXh3MU5PS2xRckpFMnM5ZXRDTFFpWGtCZ2ZtTEN5d0VYaE1r?=
 =?utf-8?B?RWdaV25rUXFRZVVwRGtLZndna1FzRmJYTmplR1RRZ0twc09UbGZLWDFzUVRr?=
 =?utf-8?B?eUw1Q0N4QXhKVVdzTEU3dHlCZWRBTFd1bEJ3UGhhbmk2Z01ZQnFjaW5GNjl6?=
 =?utf-8?B?Q1dSZXlkdFBwWnFYTHlqNmRycTU2d1BMODVlTDFBSmErNlRJM1dIbmFIUzE2?=
 =?utf-8?B?Z0FwMGtJTXRWV2loZzd5akNPVnJHc2RvK2lzeldMZSs2UXFzUGc1d2xaRzVr?=
 =?utf-8?B?dE5CTDBkbk5ENGxGWmN6RUIvWTZLZHYweHRMUW5Lb3V5a3czbjNWR1QvNEdO?=
 =?utf-8?B?NHlwdnN1QkM3QVpOQW9rZ2lrdnU3Zy9tZlU2WmlabHZjRitDOVFyWjZZQ3Rj?=
 =?utf-8?B?YVNIcWhBTjM3KzdSUzhicWdqRkYwT3liZlp3cXIxYTZ1NG1pNjZNSHUvR3Y3?=
 =?utf-8?B?OGNNM1g2L3U0V2lmM3JjdkVLVkt2b25CMzNKQ2xBVzRUQ3AwVWJESEY3cWxS?=
 =?utf-8?B?a1QyZXZvbU4vOWx1VXJCYVpDTXcrWXhZaE1rbzhzWVZZbFVWOFZObnpLYld4?=
 =?utf-8?B?a2dZeGRuSGRPM25adkk2VitCUjRhVzBPb2tTZnVZY1Vvakwrbm5FdnY3NXBV?=
 =?utf-8?B?UzV1V1FGQzBmZmQ4TUJ3RitGdmhOMlVka00vYk4wZUR4dGZWWE1zT0ljZlhO?=
 =?utf-8?B?Q2c5d3hxMlUrbE44TEEvck01SUxNdFY5bkt6Rzl2aEdlNGZFYU53NUp6bExR?=
 =?utf-8?B?eTJuek90Y0ZCbWx5UUFzN3VNZkVHYnNSeFp0U0p5NnYwSlBrUHBQQmFWZzBC?=
 =?utf-8?B?WkJORnAvVGVhMnZuRDN0U1RoKzZka3haT2ptQTFyZ0pEM2JQTUxwYU9hKzlP?=
 =?utf-8?B?TFRqUElnWGgwcnpnRlpkc3c2L091aHZOMWtwQ21Ta2psS3lIdkpTZGw4ODlE?=
 =?utf-8?B?d3NBWjZZb200TXlub21VemJiTzVXeTFBTlRMVmo2SnplWEFvWmc3OVp5VTA1?=
 =?utf-8?B?VWtWaGNZMFE5cFA3MVgzL1g1aWFSWUhDeUZ5dEVRSzlrT1ZRZVlrc2tJdjFB?=
 =?utf-8?B?UE5jQlFuSVhXZUdFNEZuNUJLV2czcWphdnQ1MVhqS3ZweHB6eHpjNE1Ldjhi?=
 =?utf-8?B?RTV0TldDZjliM05ZKzJWQ0ZDMStkKzh2Q0lZblVEVGpVd3JLWHljaG1FY3Bn?=
 =?utf-8?Q?E1DHX3hM80/ni?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(366016)(1800799024)(376014)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZlMrRHdCaVdqNVBBdW1ueitsMENPTjF2YWhjOEhORnprWDJ3R3hoWjhDRDhB?=
 =?utf-8?B?NmZXdUJZazNhdFBYNW0vRVdnamFHMWEwUmN3V1RLQ2JVdW9Gcmg4RkN5UDBm?=
 =?utf-8?B?eTljSEpGWXJabjZXZ3d2V05jSGVNS3UyNUlnaEdaYm0zdkJHbFJHakdWd0ZW?=
 =?utf-8?B?UzFxRGFvZElmMmU3SmhhdjIybGdwa0xDRUg1SWpSTzRjZksxMFR5VE1iK0tu?=
 =?utf-8?B?VHZWbG5kaEVmMkNLZmw5Ui9lSFdqcnI3ekdCWlQ4WmJ1b09ncEtaM3RiWHJK?=
 =?utf-8?B?OExXQW1wTkhoeGk4QUpERi9kejNjQ0poMGViSUVaT2N6OGFwK2NhWlk2aC9w?=
 =?utf-8?B?UG9INjIzWDRuQ0R4cndsdm5yLzk2cC9TNU01ZCtGTlVyb2ExZXo3S2oxY2FN?=
 =?utf-8?B?OHVWUGhMNWJCVU8yVDdsT3l6aXlPNjFEaG9kMVZSb2IrMS9icHlsVVJJTFcx?=
 =?utf-8?B?U2FVTjJyRVQrQnpzdnBBaWNRalhpNDRLWU03d2M5cHJUT3psNzBuTkpodjlt?=
 =?utf-8?B?SmtWaE1GNlh5anNDczlQWDZCN3JQM3dlRm1LL3dGVzVFVmVpOXlpVDYrMU9F?=
 =?utf-8?B?a3RNOXY3THd4dkdmTlEwT2t6N2U2bWdtczJWWE9Oc3BVN2dQN2dhb0dWc2ps?=
 =?utf-8?B?c3MwZWhnZUtERkw5M3htemhjaXJlc2YrRmJYOXd4L1duTFNpd0lEUXBybnQ5?=
 =?utf-8?B?Y0NmWDlaWWZrMmEvWFhNb0pBbFBzamc5bDNMaEllR2tIZHNmQzYwZGthOXAz?=
 =?utf-8?B?Y21ZSnVJZmxGamcvcVU1ZEhYVEdDQTc1UTJQN2p0Rnl3ZXlOMG9Uall0RXJ5?=
 =?utf-8?B?U0tLMEpENXlRNkhPWXRuWUFXQkZXSjhJQ1kyU2NEZkljRmxmN0gwRGh3cGZi?=
 =?utf-8?B?V1FDa2lpcjNkTTRHRldodG05U0szYnZzbjVxQzRTanFjdDRaNGhuZWJBY2ZD?=
 =?utf-8?B?QnRYSDVCdGlEQmo0T2U5SndIcllsRVh6Y2Z6Y2JZM216Zm5SYnZyOWZ0R1My?=
 =?utf-8?B?dkNUZjZSL0o2eTJrUjdxcXJYOXN5S2JmbVhEb3BZUTZUYW40a1hsSFY5ZEww?=
 =?utf-8?B?Z2JieEh3L2U0T3pZNEU4NDBQbGdyNnBHY0Fia2NCaFByUWFzWWhxTGJWVVdv?=
 =?utf-8?B?b1ZSMDRYZDZ5eHoyOHlpMVZRSHFqL2NDMG9qc0tlaTBqZnRtRzNHUkRvLzRQ?=
 =?utf-8?B?Z1QvVEt6aDFWT21BUzdTcFJPR2hBVE42RUhFalBJV0t6YTR3SmUyRUVUMm83?=
 =?utf-8?B?clFNVUQ2K05oMTdrTHVzRHhZOVYyWFpENUxSS1RjTU1YQmErVzU4WVdERXVM?=
 =?utf-8?B?cjcrTUdkazJnbHk2NXJaTXdnRFl5OTlqL2JocmsybU9wYjk3WUgxRkNzK3Rs?=
 =?utf-8?B?L1hidmw1ejEyQ01QczdqOTdobDY5bVRBdlpjMGZzdVVPRjBnT2g2TXRnVDRF?=
 =?utf-8?B?Y21ONk5YUHR0aGFuVGZpQjAzQ0t0a1JnOUN6NStScXoxVkxiR1VONTAvQXVp?=
 =?utf-8?B?ODZkcENVUFd4M0NCKzZPbk44d3dFTnpSS0pOQUd3czg4ZDkzbVcwL09USmox?=
 =?utf-8?B?bXFGVGlsWVduVkFBZ0liQ0IxVytsV0ZjM3JYU0FWSzR3MFpDYmhIOWl2Z1ZY?=
 =?utf-8?B?U2d6V3NLVFlsRE1qM04xVnRqSVlQNTYyNGtENEZPbThCaUd3enUxZmtrbEpS?=
 =?utf-8?B?QlJxTUx2ajVkbnFldi96SmEzRk55Wnp6MDFDa2dGL281M0JlaHZJblFEbFpY?=
 =?utf-8?B?d3hmSDN2WDFXWk9KdDdPZVlDR2xGclVXSzE3N29HV3kzSC9JUW5wQ002M2gv?=
 =?utf-8?B?d3lYeDVKbXZoUFJ5SSt1VDVuTU9NV0NtTnlRSStENTV3V1dxRXo5U1RvVjE1?=
 =?utf-8?B?Z0x1d2sxdVhkQUVKYk92Tkpsc1BkNFUyajJlYTQ0RG1QR0sySDF1WHlwUlhy?=
 =?utf-8?B?TlBsUEcvbXdiTkFoajBkdFZvb2lKOWQ3a2RSaU83bE1DcTlTMWdabGlNRmxk?=
 =?utf-8?B?RWwrL2M0em9xRTc1NHlGOTB4Q20xUWwrUEN5alkrU1VCcERrelhaTW85TWRH?=
 =?utf-8?B?L3JTUENzMzJ5NTZwM0ZMUUl4Zm4vS28zUTdKbDNQUW9wM0Zpd1hlc1F6UnZH?=
 =?utf-8?B?YUs2enZFcGFDL3RBUnU2UG9ZRWkzZ0VoeUZkb2NSUkRJTHYyVzAxRHBIaUlE?=
 =?utf-8?B?SWc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0063084-b3dc-4e4c-400f-08ddac6b6f1f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 00:19:18.3888
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EsgD2TIwjpDtfaTIB56hzHCj9AW+hh111f7+f+AQWOEzKMXVTCkH78vtYyRPnXDCkMXTzbZqfOgsgIbk6HR/seQbYa9/njgFG4INCEXJ1kE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8513
X-Authority-Analysis: v=2.4 cv=PuiTbxM3 c=1 sm=1 tr=0 ts=684f630a cx=c_pps a=dkOAgHmpwkZRZLZOA/69FA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=_enOPnqeAAAA:8 a=3dD0C_qG7lTfBE8dTfwA:9 a=tFFRPE_jeEwlvvFe:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=pGLkceISAAAA:8 a=52mdeZd8sWgJSgSe30wA:9 a=7QK4oRqFkQUaCCWL:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=XAbD3I9PDrnSMThV5XoS:22
X-Proofpoint-ORIG-GUID: E9mPyxriitSTZirTdtT2UY9JS7LVU0yV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDAwMCBTYWx0ZWRfX4tdKoco+yUju LNUiClojqDfoRdJTVbQ/khg0twUSvEc31J3fa2gJQPYqt9NwcaNYMkLeaVqvNfcr+E09yHHSWp3 2sKbCFMSCcfhhcyai8wlwgjOPcWIY4b3n7F8h39VWlMGJIsA2xcQyDQ8OE0bfRWBEwCJrjxi5u0
 yvjZbj36CjaGGDrp5zfYhKyjhUkmsB2D+z/wknLrHKRcnveHSg4jReovpMoz3g1QXYMmDghLNX5 xyCgTv4blW/3bKE8NDyAX8AowK+8uvKOMMVJWCGVeWBdZatOcGtlzGBP+/9Es+BRY1pIOG/+3O0 OABPvugOs8ozESMRLDdDiTFlMqC2u4cj5z0z7u0HqM+MFsjGWhKZpiJqxNTSMxJLY78WwDRZAk/
 1sB9OeBkDiud36jwPrKA0fiLv2d/TGKgCXDncivV6Vyl1tT3RQV1bdeC1bcJO9CjebrBgL2l
X-Proofpoint-GUID: zzf9IqXAnH7Y02y-8xYBjUmjhSvibTFl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-15_10,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 malwarescore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506160000
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 00:19:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218751

--------------ZRGHujzvtWW5iMe5jSRwQRvu
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 55G09dfY015951


On 6/14/25 00:23, Steve Sakoman wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> Hi Vijay and Changqing,
>
> Seems you sent similar patch series at just about the same time!
>
> There is a good deal of overlap, but each contains some that the other =
lacks.
>
> Also, Changqing's has a conflict in "libsoup-2.4: fix do_compile
> failure" with a patch currently in kirkstone: "libsoup-2.4: Backport
> auth tests for CVE-2025-32910"
>
> Could you please work together to decide which I should take and kirkst=
one-nut
> submit a new series?
>
> Thanks!
>
> Steve

Hi, Vijay and Steve

How about take Vijay's series of patches first,=C2=A0=C2=A0 after is is m=
erged in=20
branch kirkstone-nut

,=C2=A0 I can rework my patches bases on branch kirkstone-nut, send a V2=20
series with other needed patches.

Regards

Changqing

>
> On Thu, Jun 12, 2025 at 8:43=E2=80=AFPM Changqing Li via
> lists.openembedded.org
> <changqing.li=3Dwindriver.com@lists.openembedded.org>  wrote:
>> From: Changqing Li<changqing.li@windriver.com>
>>
>> Backport several CVE fixes from branch scarthgap, cherry picked from
>> poky-contrib: stable/scarthgap-nut,  and do some changes accordingly.
>>
>> Ashish Sharma (1):
>>    libsoup: patch CVE-2025-4476
>>
>> Changqing Li (17):
>>    libsoup-2.4: fix CVE-2025-32907
>>    libsoup-2.4: fix CVE-2025-32053
>>    libsoup-2.4: fix CVE-2025-32052
>>    libsoup-2.4: fix CVE-2025-32050
>>    libsoup-2.4: fix CVE-2025-46421
>>    libsoup-2.4: fix CVE-2025-4948
>>    libsoup-2.4: fix CVE-2025-4476
>>    libsoup-2.4: fix CVE-2025-2784
>>    libsoup-2.4: fix do_compile failure
>>    libsoup: fix CVE-2025-32907
>>    libsoup: fix CVE-2025-32053
>>    libsoup: fix CVE-2025-32052
>>    libsoup: fix CVE-2025-32051
>>    libsoup: fix CVE-2025-32050
>>    libsoup: fix CVE-2025-46421
>>    libsoup: fix CVE-2025-4948
>>    libsoup: fix CVE-2025-2784
>>
>> Hitendra Prajapati (2):
>>    libsoup-2.4: Fix CVE-2025-4969
>>    libsoup: Fix CVE-2025-4969
>>
>>   .../libsoup/libsoup-2.4/CVE-2025-2784.patch   |  56 +++++
>>   .../libsoup/libsoup-2.4/CVE-2025-32050.patch  |  29 +++
>>   .../libsoup/libsoup-2.4/CVE-2025-32052.patch  |  32 +++
>>   .../libsoup/libsoup-2.4/CVE-2025-32053.patch  |  39 ++++
>>   .../libsoup/libsoup-2.4/CVE-2025-32907.patch  |  39 ++++
>>   .../libsoup-2.4/CVE-2025-32910-1.patch        |  79 +------
>>   .../libsoup-2.4/CVE-2025-32910-2.patch        |  60 +-----
>>   .../libsoup-2.4/CVE-2025-32912-1.patch        |  20 +-
>>   .../libsoup/libsoup-2.4/CVE-2025-4476.patch   |  38 ++++
>>   .../libsoup/libsoup-2.4/CVE-2025-46421.patch  |  47 ++++
>>   .../libsoup/libsoup-2.4/CVE-2025-4948.patch   |  38 ++++
>>   .../libsoup/libsoup-2.4/CVE-2025-4969.patch   |  76 +++++++
>>   .../libsoup/libsoup-2.4_2.74.2.bb             |   9 +
>>   .../libsoup/libsoup/CVE-2025-2784.patch       | 137 ++++++++++++
>>   .../libsoup/libsoup/CVE-2025-32050.patch      |  29 +++
>>   .../libsoup/libsoup/CVE-2025-32051-1.patch    |  29 +++
>>   .../libsoup/libsoup/CVE-2025-32051-2.patch    |  57 +++++
>>   .../libsoup/libsoup/CVE-2025-32052.patch      |  31 +++
>>   .../libsoup/libsoup/CVE-2025-32053.patch      |  40 ++++
>>   .../libsoup/libsoup/CVE-2025-32907-1.patch    | 200 ++++++++++++++++=
++
>>   .../libsoup/libsoup/CVE-2025-32907-2.patch    |  68 ++++++
>>   .../libsoup/libsoup/CVE-2025-4476.patch       |  38 ++++
>>   .../libsoup/libsoup/CVE-2025-46421.patch      | 139 ++++++++++++
>>   .../libsoup/libsoup/CVE-2025-4948.patch       |  97 +++++++++
>>   .../libsoup/libsoup/CVE-2025-4969.patch       |  76 +++++++
>>   meta/recipes-support/libsoup/libsoup_3.0.7.bb |  12 ++
>>   26 files changed, 1380 insertions(+), 135 deletions(-)
>>   create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025=
-2784.patch
>>   create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025=
-32050.patch
>>   create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025=
-32052.patch
>>   create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025=
-32053.patch
>>   create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025=
-32907.patch
>>   create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025=
-4476.patch
>>   create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025=
-46421.patch
>>   create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025=
-4948.patch
>>   create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025=
-4969.patch
>>   create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-278=
4.patch
>>   create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-320=
50.patch
>>   create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-320=
51-1.patch
>>   create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-320=
51-2.patch
>>   create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-320=
52.patch
>>   create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-320=
53.patch
>>   create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-329=
07-1.patch
>>   create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-329=
07-2.patch
>>   create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-447=
6.patch
>>   create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-464=
21.patch
>>   create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-494=
8.patch
>>   create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-496=
9.patch
>>
>> --
>> 2.34.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#218553):https://lists.openembedded.org/g/openembed=
ded-core/message/218553
>> Mute This Topic:https://lists.openembedded.org/mt/113619132/3620601
>> Group Owner:openembedded-core+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  =
[steve@sakoman.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
--------------ZRGHujzvtWW5iMe5jSRwQRvu
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 55G09dfY015951

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body text=3D"#000000" bgcolor=3D"#cceed0">
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 6/14/25 00:23, Steve Sakoman wrote:=
<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CAOSpxdZwOjkN+OaHEzhv6qngpS+aGT=
x8OcdCWR9ewb9U5PSvfQ@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">CAUTION: This email comes fr=
om a non Wind River email account!
Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.

Hi Vijay and Changqing,

Seems you sent similar patch series at just about the same time!

There is a good deal of overlap, but each contains some that the other la=
cks.

Also, Changqing's has a conflict in &quot;libsoup-2.4: fix do_compile
failure&quot; with a patch currently in kirkstone: &quot;libsoup-2.4: Bac=
kport
auth tests for CVE-2025-32910&quot;

Could you please work together to decide which I should take and kirkston=
e-nut
submit a new series?

Thanks!

Steve</pre>
    </blockquote>
    <p>Hi, Vijay and Steve</p>
    <p>How about take Vijay's series of patches first,&nbsp;&nbsp; after =
is is
      merged in branch <span style=3D"white-space: pre-wrap">kirkstone-nu=
t<span style=3D"white-space: normal"></span></span></p>
    <p>,&nbsp; I can rework my patches bases on branch <span style=3D"whi=
te-space: pre-wrap">kirkstone-nut,   send a V2 </span>series
      with <span style=3D"white-space: pre-wrap">other needed patches.</s=
pan></p>
    <p><span style=3D"white-space: pre-wrap">Regards</span></p>
    <p><span style=3D"white-space: pre-wrap">Changqing
</span></p>
    <blockquote type=3D"cite" cite=3D"mid:CAOSpxdZwOjkN+OaHEzhv6qngpS+aGT=
x8OcdCWR9ewb9U5PSvfQ@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

On Thu, Jun 12, 2025 at 8:43=E2=80=AFPM Changqing Li via
lists.openembedded.org
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:changqing.li=3Dwindrive=
r.com@lists.openembedded.org">&lt;changqing.li=3Dwindriver.com@lists.open=
embedded.org&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">
From: Changqing Li <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:chan=
gqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>

Backport several CVE fixes from branch scarthgap, cherry picked from
poky-contrib: stable/scarthgap-nut,  and do some changes accordingly.

Ashish Sharma (1):
  libsoup: patch CVE-2025-4476

Changqing Li (17):
  libsoup-2.4: fix CVE-2025-32907
  libsoup-2.4: fix CVE-2025-32053
  libsoup-2.4: fix CVE-2025-32052
  libsoup-2.4: fix CVE-2025-32050
  libsoup-2.4: fix CVE-2025-46421
  libsoup-2.4: fix CVE-2025-4948
  libsoup-2.4: fix CVE-2025-4476
  libsoup-2.4: fix CVE-2025-2784
  libsoup-2.4: fix do_compile failure
  libsoup: fix CVE-2025-32907
  libsoup: fix CVE-2025-32053
  libsoup: fix CVE-2025-32052
  libsoup: fix CVE-2025-32051
  libsoup: fix CVE-2025-32050
  libsoup: fix CVE-2025-46421
  libsoup: fix CVE-2025-4948
  libsoup: fix CVE-2025-2784

Hitendra Prajapati (2):
  libsoup-2.4: Fix CVE-2025-4969
  libsoup: Fix CVE-2025-4969

 .../libsoup/libsoup-2.4/CVE-2025-2784.patch   |  56 +++++
 .../libsoup/libsoup-2.4/CVE-2025-32050.patch  |  29 +++
 .../libsoup/libsoup-2.4/CVE-2025-32052.patch  |  32 +++
 .../libsoup/libsoup-2.4/CVE-2025-32053.patch  |  39 ++++
 .../libsoup/libsoup-2.4/CVE-2025-32907.patch  |  39 ++++
 .../libsoup-2.4/CVE-2025-32910-1.patch        |  79 +------
 .../libsoup-2.4/CVE-2025-32910-2.patch        |  60 +-----
 .../libsoup-2.4/CVE-2025-32912-1.patch        |  20 +-
 .../libsoup/libsoup-2.4/CVE-2025-4476.patch   |  38 ++++
 .../libsoup/libsoup-2.4/CVE-2025-46421.patch  |  47 ++++
 .../libsoup/libsoup-2.4/CVE-2025-4948.patch   |  38 ++++
 .../libsoup/libsoup-2.4/CVE-2025-4969.patch   |  76 +++++++
 .../libsoup/libsoup-2.4_2.74.2.bb             |   9 +
 .../libsoup/libsoup/CVE-2025-2784.patch       | 137 ++++++++++++
 .../libsoup/libsoup/CVE-2025-32050.patch      |  29 +++
 .../libsoup/libsoup/CVE-2025-32051-1.patch    |  29 +++
 .../libsoup/libsoup/CVE-2025-32051-2.patch    |  57 +++++
 .../libsoup/libsoup/CVE-2025-32052.patch      |  31 +++
 .../libsoup/libsoup/CVE-2025-32053.patch      |  40 ++++
 .../libsoup/libsoup/CVE-2025-32907-1.patch    | 200 ++++++++++++++++++
 .../libsoup/libsoup/CVE-2025-32907-2.patch    |  68 ++++++
 .../libsoup/libsoup/CVE-2025-4476.patch       |  38 ++++
 .../libsoup/libsoup/CVE-2025-46421.patch      | 139 ++++++++++++
 .../libsoup/libsoup/CVE-2025-4948.patch       |  97 +++++++++
 .../libsoup/libsoup/CVE-2025-4969.patch       |  76 +++++++
 meta/recipes-support/libsoup/libsoup_3.0.7.bb |  12 ++
 26 files changed, 1380 insertions(+), 135 deletions(-)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-278=
4.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-320=
50.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-320=
52.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-320=
53.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-329=
07.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-447=
6.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-464=
21.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-494=
8.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-496=
9.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-2784.pa=
tch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32050.p=
atch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32051-1=
.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32051-2=
.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32052.p=
atch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32053.p=
atch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32907-1=
.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32907-2=
.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-4476.pa=
tch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-46421.p=
atch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-4948.pa=
tch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-4969.pa=
tch

--
2.34.1


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#218553): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/218553">https:/=
/lists.openembedded.org/g/openembedded-core/message/218553</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/113619132/3620601">https://lists.openembedded.org/mt=
/113619132/3620601</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:steve@sakoman.com">steve@sakoman.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------ZRGHujzvtWW5iMe5jSRwQRvu--

