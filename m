Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9B5EE7717D
	for <webhook@archiver.kernel.org>; Wed, 11 Dec 2024 20:11:35 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.4236.1733947889950179320
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Dec 2024 12:11:30 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2075c83590=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BBCd30B012291
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 20:11:29 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43cx4xcnts-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 20:11:28 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4BBKBSgu027978
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 20:11:28 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43cx4xcntn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 20:11:28 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J90OqVxL7P3rjzeoHYwoBhIYG73ZLcPo3XOBhSnqchzVAushKCJFFNUh6+RfVYcZglHYZoPK7vUAF2Ge5DDWMVZtTdpKUvxAOrUZtG4/+u8O/y6PHhZdkNtJCKKNi9MaGT/bo0glnA4vu6XBr+p4xRtlSm1IWSftZbMwHxqM+1YPZcVeCCkvd84cAZxCdkCgRPAF7OEfvkofbTzQg0fLEUY80iYE7k6KabnWDLtTCEnAbH/MLKb/e4hRyRx0+PcGzVKmjbKheZT/HEqO420aAKo4aUgZw4x9CI7GXaUsBTQjEh8IpZw+kS0rwFwtwnuswF309ExRhbgi8y6V3EHy0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=omqEVsFVQ+FMk7SCQm/kl2YSgGCQzN8r9hIpB3t8ZkI=;
 b=Kbn/fO8MRhYfxrZBGTElhPlMjrnHvhpZyReRV570NnQl3VSTDBeoQaewla395hC1A4EG0U6MWfJA09Dka6hxCTPmcp5g5qIjYJmuyaXgH0xyaGvseYQ6d2Aa5rUR67Iq3sgBt/p8eojJaqwIV0cxg/ua8lao31e4UOzS8TJR5Ts/ZOOLysBhqn02iqJTV4J34aTDgG6zk20emSHGAWT3b7VOatsXyQeuSjvCg9MESjRR1m0VV3+PyLaspA7GGRtOlTApY0YOf5p/SKDVc+iZ/pVMl/Fz3LwXYkeNRX813ebrfFNj6/qyp53vQLH9wVMS6s5aEkXM5wjhxWdDx3lY8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by CH3PR11MB7177.namprd11.prod.outlook.com (2603:10b6:610:153::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Wed, 11 Dec
 2024 20:11:22 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%3]) with mapi id 15.20.8230.016; Wed, 11 Dec 2024
 20:11:19 +0000
Content-Type: multipart/alternative;
 boundary="------------PY70aBBOR3l95yMV96U800CR"
Message-ID: <84c2f3e5-e5ea-4a77-b62a-172d1057d14e@windriver.com>
Date: Wed, 11 Dec 2024 15:11:16 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [styhead][PATCH] Backport: Fix c++: tweak for
 Wrange-loop-construct
To: sunilkumar.dora@windriver.com, openembedded-core@lists.openembedded.org,
        "steve@sakoman.com" <steve@sakoman.com>
Cc: Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com
References: <20241211172242.4040469-1-sunilkumar.dora@windriver.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20241211172242.4040469-1-sunilkumar.dora@windriver.com>
X-ClientProxiedBy: BYAPR11CA0043.namprd11.prod.outlook.com
 (2603:10b6:a03:80::20) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|CH3PR11MB7177:EE_
X-MS-Office365-Filtering-Correlation-Id: 6957b088-cba4-4dab-5b9b-08dd1a1ff9c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MTgzK253aXBsNmpoNm1pOU1ReEFaWGJleTV1Vy9UMkk5Mmp3ald3RnNRbzIr?=
 =?utf-8?B?eWdhK2NRQVZ5dVhuZUZBSTNSaFRBVzU3TlFYRTI5aVV5Y1F2NnhUQ2tMNUh2?=
 =?utf-8?B?ajJ4eXhyekZuWlRNNFhEa0VzSms0Q2JpVEtGZmJQaUQva2xFMkd1eGpvUmlh?=
 =?utf-8?B?TzdVc0N2NldOcXRtUzE2aUNxMjdqdjY4bmtibUNrU2lwbW9HOUo0dENQMGhj?=
 =?utf-8?B?S1U3dk0vUmdQS0xETzJudEpPTC9iSUhFS1dpS21FZ0N4OFVoMmFwcWVMZmEx?=
 =?utf-8?B?T05SWGlKeWIyRm5FbjFCZ3VWLzNxMTQ1czN2aERWSnlBSlZvUEJRMjV2TnYw?=
 =?utf-8?B?U0VFVkxJNGg2cm1LLzdNcWdVLzVQVzFZcGlra1ZuQURvRk5JN2NQSlRSbDEv?=
 =?utf-8?B?bnFpYkIvNXF3RGdSTEZSVDBvTHZiL2l4NVRVWUhPSTcxUFY2ZGRTaUluWmds?=
 =?utf-8?B?RVQxS1o1ZUtBWllyTndaeWpyaGF1azFTY0psd21sOWloTDYxOW5ZaUxWVHRZ?=
 =?utf-8?B?M21pUFZ3OEtRZlM3VmRiRU5hYXJvb0M1ZmJ3M05DRXVyOGhraXZyYlZsaisy?=
 =?utf-8?B?TUFrb1pPckVJWldNMkFSVEV0N3U4SENORzI5UTRNTkxPc3hEWGx6MVVJbHFP?=
 =?utf-8?B?K1hXaXVzS3E5VDBHM09DMXJDODlMMmJtUE0vZ0F5cENrUDNrYXBWclRJS0Vv?=
 =?utf-8?B?eWZ0VE5hVWxDcmErWm53MWY3S00zZEkxOWsrdmR6UG5EYllyUjExZGxBQTlo?=
 =?utf-8?B?ZjVPVUJPeml5eExPQk9jU04xcGNkNWJvVVN4RkxzWlVKOHJYRnYzbmxEdHY0?=
 =?utf-8?B?SHkrbW1jSzJ5OWM4cEV5cndUSG1hYm9neWIvMFNiRC83U2tFaHdWZ3hLcDNN?=
 =?utf-8?B?aG9halFiNU12TjA1emIzclZGcjZxYWJZcTBuczdTc0J4eVA3MllLZ28wckVs?=
 =?utf-8?B?bFRubVZtejFYN2w2RmhvSnNIc1ZVUmFRR2RDOGNvWVM0WWZPYURheEdja1ZL?=
 =?utf-8?B?NmpqQ1J0VlZrczYxa2VBNHBMTmZpaVdzRHdMSFNvSy9YSzdCU2J0M0pJakpa?=
 =?utf-8?B?cnFOYnBra3BwekI2bjc5b2IydFNUejJWejdiMjBLQzh5UmxqSU1FRjVBTEh4?=
 =?utf-8?B?ZWZBaXNOOEdiTVNocnVHeXNZWE81Q0hacjkxVW5xMXNTOEFXNTR3eEJ5c3ph?=
 =?utf-8?B?NjM4OWc3ek1xeWpBU3h3K2tIb25qMnh0K1RiN3FpZGU0RXdVK3FoWHQ4RUFi?=
 =?utf-8?B?TURxSXo2cklsNS9sbUUxeUVmaWg3d1JPbXZqYnc1bFZUMU5rNzAvMG0xeVlE?=
 =?utf-8?B?OUZpNmhqQmJRVWdGLzlieEdLWld5czlqbWFvQVhhSzhCTU1NZHdvWGZhWXlz?=
 =?utf-8?B?czNGc0diNXYybFNnUHZreThyYmtEeUhwWTQzWmw3dk4xOU9nS1o4MmU0MU1K?=
 =?utf-8?B?c1l0WmtHMElBNmhMTXZXWGZzWGRYMW1WNzJqak5aWEhKdnozRUl3dUYyKzdD?=
 =?utf-8?B?MXZRS0djblN6djY5ZGpNczg3VFQ0ZTh5OXEzc2tCMGh5MnI1L1Btb2MvcERL?=
 =?utf-8?B?aVRKVDZ6Y0d5bU9rRllvM3BlbDhRT1dTRmVzT0VtUUNFSUJRTE1nam5Jc2do?=
 =?utf-8?B?VGZaMC9nT256ZndMZFpWb3ZWRVRDZEx2UWU0ZkROcmo3R3lENGVpMFltZzd6?=
 =?utf-8?B?ZUZUL0NmSlBSRnBnbytCZysrQm9EdVhHbUJxVXcrOFNPaUg3TzRwS2lsOHhV?=
 =?utf-8?Q?wUUOMMUNHU17WfQg2DIFI64poapYjAtfkYMr1/P?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VVNMNDYxUDRpY0RCa25MTHdkUGNsNStadG9OU3g1MnB0aFdydVVEcEFNK2ZO?=
 =?utf-8?B?REl1UEl4VXFvODFXRFRyR3gyKzArRjYrOXAxVXJETVlVOGdIMmM2RmFFdjdp?=
 =?utf-8?B?cFpld01SeVJPMTBoUTd3cklwYnRvRnQxMGtBOU9tOTh1ZmRFcFdtVUczR21v?=
 =?utf-8?B?cEJ2YUoyOEowTC9CYVVRdlpJVnp0WXRCUjhrUTNuWkVFbXUxWW9pT2JBQWJ1?=
 =?utf-8?B?N0liYzQ3ZGFQblJiZ0lPYURmVkprc01PV3ovb2FQY0d5a3dMelFOMTQ2VXdG?=
 =?utf-8?B?MDBUQkxNTGxNUzVyUm80a09rSElWaDIrUGxhckplYUU0djZ3NWdlaFR2S3dn?=
 =?utf-8?B?L1N6L3BMUTAwMkM1QlFZUXQzUVZUUjk5dVFOdEFBazNVYmdMRkZpSHZrT0pL?=
 =?utf-8?B?QTVLcjg2MGFFTk9UWDFvOVN3cUNJdEo1UjE0cXNaTWRJMXpMb1FsUUlIanBK?=
 =?utf-8?B?NDlXSDBiSVNna2RLVW5hOFNpcm5tYWQ0cnovaEJobU9EMGhpWXZiRmVDNVpT?=
 =?utf-8?B?bDNYL2NIeTVkREpPdjdJb2FDUERtLzcvN0d3Z3laUW5oWklrbW5EUUF3TWJK?=
 =?utf-8?B?Tzluc0RJYjd3ZFBtS1FFK24zSWt2M3BvRm8zUmtjNktHdXZQZzExOG45Rlha?=
 =?utf-8?B?SU9uUWQ1R0o0NjVhMUQ2RFJvRlZnakNzMFBTQXhHTndRSk9JRFQ2SlNVSUVM?=
 =?utf-8?B?VW00NzZVckN6OW1PRFc1N3I5R1VzZmIvTmY1MUN3MGRnbXpiTTdjL2lLZXJG?=
 =?utf-8?B?eHdwa3cvNXo4WWhCck84YzAybHVwSStOTGYvamRLbHFmSDdycGxIUytBV1VE?=
 =?utf-8?B?UFZ0dUVySlhsZDF0L0tUc1R6QkUzbi8vdkltbjR5WUNvTTZzaFhrMTlvYnAv?=
 =?utf-8?B?UHhwdVlveERrTDErbXV0bzZGZTFaNy9zZ1ZLamVadC8xUzRaMVE2RytXY3ZQ?=
 =?utf-8?B?Y0M3NHlSQ0tmUFJPKy84WGFxeHFhekpJSjN1VjRUaUg0a2RNMU9lWjhDcHJu?=
 =?utf-8?B?OEZ6bFpwRXo2QVFVb1BKcFJVNnIyaWdiWkJBMmFGalcrcm1VWDc1bTFUYUhx?=
 =?utf-8?B?UUpJczNJaHB0OU9MMTFaR09jZ1NZRmgvWk5udW1lRUJ5c0FPTitEOWcrWlg3?=
 =?utf-8?B?T1MxazFBTE1xTSsweHZMUENTYkRocjRjTEo5UjdpeWVNMHhwY0xtRDllcVc1?=
 =?utf-8?B?MkVKV0NoU3d5OFYxOFZkcnNSR0s0RVJ0YjAySnZwL2FSSkl2V3BwVUwya0ZV?=
 =?utf-8?B?WThHbXp1T3F3SEtxR1FTazd3cGFaOStDZnIyOEVSZGtjdFdYSzhrT0Fid2lM?=
 =?utf-8?B?aWFZaU0wa08yWmRLbkduWGlGRVJTNCsvbkFCNjBOS2YwSExnYkUzbk9lb25j?=
 =?utf-8?B?V3FoTzZCV1JuZk1SeVRDQUFjbGx0dEd3QXN4M2NCSkN4UzhjbUp1Q0ZrSVdJ?=
 =?utf-8?B?ejA2aWxDTmlMcklIOTkrQ2Z6OTc3OFRSZkhGa1phN3lINGUvY3A1emwwT1JH?=
 =?utf-8?B?ay9lNHduUkU4dXI4YnBOQ1p1K0c4WUdlNHVNaG9Tb0EzK0IzSG9GWGlJWXdH?=
 =?utf-8?B?dVB0d1Joai9yaG5WWGpFdnlmNjA1cnBzbml3ekQvUlFYQmtuMEt5b0dGYjNS?=
 =?utf-8?B?MU40N0VwQWlGRGJUblh5NE5mV3FLR0hJUjlqdS9ZdnlLdjZZbDUzSE52TW9u?=
 =?utf-8?B?UzVJNTQ1eHpnWUxPRjFsb3Yra01zYzV1c2IzRytEa1czU2tWNjFYMlBiV04v?=
 =?utf-8?B?U1FkUmtkSjJPNGFacVhlNldCZnRyUVQ4WFVFVGtGTm0yOEl1QVBUZEx4L1A5?=
 =?utf-8?B?b1VyYTVCamtyUUNFVWxGRDRad09nS3dNcjdWM25weW4vMG9wMjREQjdWUUhD?=
 =?utf-8?B?N2I3ME5Cak5EVEs0dUpkb0JEOVVHd000alZPQytpYW0zTkNFYVU5SUxMclJO?=
 =?utf-8?B?UENQVCtuY0dUUmxRR2t2a2ZpaU8wdEFWZncrWWlNMy9zVVRCYUtmRkVOdjJw?=
 =?utf-8?B?WXhubU1RcEQvRTk3VTFnaGJsN1JJR293Zno2K0dTKytJeEptMUdUN2YvYlBp?=
 =?utf-8?B?RGFEVTB0OXZvMENTQ0xScUpVSFQ1UThpZzJEaUhaRUR0LzRqMTNzeXFTQ0ho?=
 =?utf-8?B?Nk50T21Rci9qK1BRRUUzSVc4Rk83eHg3d3ByeitKKzlDaWNyeUxtSGxUQ1J2?=
 =?utf-8?B?b2c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6957b088-cba4-4dab-5b9b-08dd1a1ff9c8
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 20:11:19.5276
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R4S44lI1ylMw6LVRyk1Tt3HtUb71Bn8ik1GhGHc3KlmR9JCHIWd8bKX/jkqUzvWH98HaV7sgC4iaQDWfyzKicLLfOqsln+FRj2GrrxErGPg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7177
X-Proofpoint-GUID: O3_fYS7JhLqfUcoNk6C7BJve1uVWcG-_
X-Proofpoint-ORIG-GUID: WgZMMOxa9r5zh49RRYkBLXFwLPFsog7l
X-Authority-Analysis: v=2.4 cv=Y/UCsgeN c=1 sm=1 tr=0 ts=6759f1f0 cx=c_pps a=F7QtyTBSWJEVkVFduP+sHw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=RZcAm9yDv7YA:10 a=bRTqI5nwn0kA:10 a=VwQbUJbxAAAA:8
 a=iGHA9ds3AAAA:8 a=NEAV23lmAAAA:8 a=mDV3o1hIAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=3Nrwied4pWpKP_adiYkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=NXIwzYraRHkA:10 a=a-JvsMfEWAn1j2l-mrkA:9 a=MgrsCHU-Sa1sVq6V:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-11_11,2024-12-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 mlxscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 phishscore=0 suspectscore=0 adultscore=0 mlxlogscore=999 spamscore=0
 impostorscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2411120000 definitions=main-2412110142
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 20:11:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208610

--------------PY70aBBOR3l95yMV96U800CR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4BBCd30B012291

Steve,
Ignore this one, a v2 has been submitted.

Sunil,

Please follow-up on your own patches like this to help people know that
they should ignore a patch that you have sent. Steve has 10s of emails=20
or more
to deal with so clear instructions are helpful.

For future commit revisions, please also indicate that the patch is v2,=20
v3 again,
so that anyone reading your thread can follow along. Some people even thr=
ead
follow-ups to the initial commit using --in-reply-to=3D<identifier> but=20
that's not required.

You can use:
 =C2=A0=C2=A0 git send-email ... --subject-prefix=3D"branch-foo][PATCH v2=
"
See:
https://lore.kernel.org/openembedded-core/?q=3Dv2
and:
https://docs.yoctoproject.org/contributor-guide/submit-changes.html#sendi=
ng-patches-via-email

Thanks,

../Randy


On 2024-12-11 12:22 p.m., sunilkumar.dora@windriver.com wrote:
> From: Sunil Dora<sunilkumar.dora@windriver.com>
>
> This commit updates the warning to use a check for "trivially construct=
ible" instead of
> "trivially copyable." The original check was incorrect, as "trivially c=
opyable" only applies
> to types that can be copied trivially, whereas "trivially constructible=
" is the correct check
> for types that can be trivially default-constructed.
>
> This change ensures the warning is more accurate and aligns with the pr=
oper type traits.
>
> LLVM accepted a similar fix:
> https://github.com/llvm/llvm-project/issues/47355
>
> PR c++/116731 [https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D116731]
>
> Upstream-Status: Backport [https://gcc.gnu.org/g:6ac4e2f4b2ca9980670e7d=
3815a9140730df1005]
>
> Signed-off-by: Marek Polacek<polacek@redhat.com>
> Signed-off-by: Sunil Dora<sunilkumar.dora@windriver.com>
> ---
>   meta/recipes-devtools/gcc/gcc-14.2.inc        |   1 +
>   ...ix-c-tweak-for-Wrange-loop-construct.patch | 114 +++++++++++++++++=
+
>   2 files changed, 115 insertions(+)
>   create mode 100644 meta/recipes-devtools/gcc/gcc/0026-Backport-Fix-c-=
tweak-for-Wrange-loop-construct.patch
>
> diff --git a/meta/recipes-devtools/gcc/gcc-14.2.inc b/meta/recipes-devt=
ools/gcc/gcc-14.2.inc
> ...


--=20
# Randy MacLeod
# Wind River Linux

--------------PY70aBBOR3l95yMV96U800CR
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Steve,<br>
    </div>
    <div class="moz-cite-prefix">Ignore this one, a v2 has been
      submitted.<br>
      <br>
      Sunil, <br>
      <br>
      Please follow-up on your own patches like this to help people know
      that<br>
      they should ignore a patch that you have sent. Steve has 10s of
      emails or more<br>
      to deal with so clear instructions are helpful.<br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">For future commit revisions, please
      also indicate that the patch is v2, v3 again,<br>
      so that anyone reading your thread can follow along. Some people
      even thread<br>
      follow-ups to the initial commit using
      --in-reply-to=&lt;identifier&gt; but that's not required.<br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">You can use:&nbsp; <br>
      <span class="o">&nbsp;&nbsp; git send-email ... --</span><span class="n">subject</span><span class="o">-</span><span class="n">prefix</span><span class="o">=</span><span class="s2">&quot;branch-foo][PATCH v2&quot;</span></div>
    <div class="moz-cite-prefix">See:<br>
      <a class="moz-txt-link-freetext" href="https://lore.kernel.org/openembedded-core/?q=v2">https://lore.kernel.org/openembedded-core/?q=v2</a><br>
      and:<br>
<a class="moz-txt-link-freetext" href="https://docs.yoctoproject.org/contributor-guide/submit-changes.html#sending-patches-via-email">https://docs.yoctoproject.org/contributor-guide/submit-changes.html#sending-patches-via-email</a><br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">Thanks,</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">../Randy</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">On 2024-12-11 12:22 p.m.,
      <a class="moz-txt-link-abbreviated" href="mailto:sunilkumar.dora@windriver.com">sunilkumar.dora@windriver.com</a> wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20241211172242.4040469-1-sunilkumar.dora@windriver.com">
      <pre wrap="" class="moz-quote-pre">From: Sunil Dora <a class="moz-txt-link-rfc2396E" href="mailto:sunilkumar.dora@windriver.com">&lt;sunilkumar.dora@windriver.com&gt;</a>

This commit updates the warning to use a check for &quot;trivially constructible&quot; instead of
&quot;trivially copyable.&quot; The original check was incorrect, as &quot;trivially copyable&quot; only applies
to types that can be copied trivially, whereas &quot;trivially constructible&quot; is the correct check
for types that can be trivially default-constructed.

This change ensures the warning is more accurate and aligns with the proper type traits.

LLVM accepted a similar fix:
<a class="moz-txt-link-freetext" href="https://github.com/llvm/llvm-project/issues/47355">https://github.com/llvm/llvm-project/issues/47355</a>

PR c++/116731 [<a class="moz-txt-link-freetext" href="https://gcc.gnu.org/bugzilla/show_bug.cgi?id=116731">https://gcc.gnu.org/bugzilla/show_bug.cgi?id=116731</a>]

Upstream-Status: Backport [<a class="moz-txt-link-freetext" href="https://gcc.gnu.org/g:6ac4e2f4b2ca9980670e7d3815a9140730df1005">https://gcc.gnu.org/g:6ac4e2f4b2ca9980670e7d3815a9140730df1005</a>]

Signed-off-by: Marek Polacek <a class="moz-txt-link-rfc2396E" href="mailto:polacek@redhat.com">&lt;polacek@redhat.com&gt;</a>
Signed-off-by: Sunil Dora <a class="moz-txt-link-rfc2396E" href="mailto:sunilkumar.dora@windriver.com">&lt;sunilkumar.dora@windriver.com&gt;</a>
---
 meta/recipes-devtools/gcc/gcc-14.2.inc        |   1 +
 ...ix-c-tweak-for-Wrange-loop-construct.patch | 114 ++++++++++++++++++
 2 files changed, 115 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0026-Backport-Fix-c-tweak-for-Wrange-loop-construct.patch

diff --git a/meta/recipes-devtools/gcc/gcc-14.2.inc b/meta/recipes-devtools/gcc/gcc-14.2.inc
...</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------PY70aBBOR3l95yMV96U800CR--

