Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 871C7C369D1
	for <webhook@archiver.kernel.org>; Sun, 27 Apr 2025 14:28:49 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.27261.1745764121201869555
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Apr 2025 07:28:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=621298a954=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53RBeeYr010906
	for <openembedded-core@lists.openembedded.org>; Sun, 27 Apr 2025 14:28:40 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 468mq19tm1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 27 Apr 2025 14:28:39 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53RESdkM002472;
	Sun, 27 Apr 2025 14:28:39 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2046.outbound.protection.outlook.com [104.47.73.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 468mq19tm0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 27 Apr 2025 14:28:39 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xWZpl0FLmi2rmpFCaO+KZeURBFSNuQJVaFnL4g9l0gxBm7bxRb1MiALGnPu+oELlOShEER7ZjyZ9lPXofDErgzUTj/ByFOnkBu16ysfeEP+JGYYZSeQD4t0V0pXhW56UNcDw+FHgrFsgQCpwNq+V2jFlrqdX7iI1/hjHvler7BU1tNhgGjl0+5YB0mPqkEhZB3NKY/Dv+Trhomc7+LiZu0JpgR/qgFWz54WL2mw67PfUbglVbxopfbrhYceJQxbc5FZ+2qpA0s/+vRyhZ4TEM9D02u5LGeDWsMCtWFTMo+Jwnj4swlbijokIouCzBmIkgVbLPrUATyeHxEXoFJNAhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hXHRO1haKuhVoNWRFrObvabZtHpXDBODl61RbpzslbE=;
 b=cv4L6lDgIjj2YQPlbezgSymxNIq/i0V7MC9QaPcPgV9UiwiQHQhrbjIpjculyVpO054k9Gye7EUUk7i/gJr/zoW9jKw9e+UwcVNHFueYsQFSP05AcwsvXooH+wHdJ+a4lm1OTrDAMlaKUWKToaG11rQaaFhi5/cv69K3Wh2HAVt2v8GY7C9IH8/L3d0uwJlS1NK5K/LvS/FmqY0FpdW3z8RO77bijzkjYB9QmGNU7Pu2SWHqZQ31aJ2vpi8sDrf/Rn9CbtUQTur4fvLAvPBAV63t2RWO15yBp3FxW0JqJuRt4Q+ZMDw3WUxo1+27t+aPmcCTVyzMHvg/nVj/XLVBzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by CY8PR11MB7799.namprd11.prod.outlook.com (2603:10b6:930:78::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Sun, 27 Apr
 2025 14:28:37 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%5]) with mapi id 15.20.8678.028; Sun, 27 Apr 2025
 14:28:37 +0000
Content-Type: multipart/alternative;
 boundary="------------6cauXX4VkGp4azTgkx3eJ1uc"
Message-ID: <91e60116-ce32-4073-81ea-b7747d600e4b@windriver.com>
Date: Sun, 27 Apr 2025 10:28:34 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] pybootchartgui: visualize /proc/net/dev network
 stats in graphs
To: alex.kanavin@gmail.com, denisova.olga.k@yandex.ru
Cc: openembedded-core@lists.openembedded.org
References: <20250415163527.15924-1-denisova.olga.k@yandex.ru>
 <CANNYZj9+wcnLE7TkKHNLytR58mkAAmyRbFhp_jm6e6wW8OXRmA@mail.gmail.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <CANNYZj9+wcnLE7TkKHNLytR58mkAAmyRbFhp_jm6e6wW8OXRmA@mail.gmail.com>
X-ClientProxiedBy: BYAPR21CA0012.namprd21.prod.outlook.com
 (2603:10b6:a03:114::22) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|CY8PR11MB7799:EE_
X-MS-Office365-Filtering-Correlation-Id: 5acf632c-4556-47b4-caf3-08dd8597cc11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|4022899009|376014|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MVJJOGV1NkF1dzBGM25YSXl2YlRpRklkZ2pKd3pCVlhMQm03enU0UGQ4OGtq?=
 =?utf-8?B?bjFVY0VyakViM2R5Y3JMblhFRXMycjQ3U25INjJYaXovenQydGVCMVNOREh3?=
 =?utf-8?B?aWxlcndXdXQ5SVROSi9DdHdaOTVGbVNtc0tramV6UzRML01odFpwVVZLeUJQ?=
 =?utf-8?B?K1ZoaTdHRjJTTGUyaXBlZlMyeUxscGFuMHBGY0t0REtpMTI5UHpqMlhZR0pv?=
 =?utf-8?B?WkFRMkRqMFV3RFVxdWNzMGphSmgwRHNZVWw0UEVtbkdWc3Rod0tNRXA0RFQ0?=
 =?utf-8?B?NVVpazd4MEhQY1FVTzhSbE9KSFNhQUNtelZHbmNJZTY5a1BTdW9NclZjV1Jq?=
 =?utf-8?B?VU5obU5Rdmt2UkV1Z0JQbmRiTGg4STU1WG8yL0ZMM1A2UkMrS2dVYUs1VG1B?=
 =?utf-8?B?bVd2SWpWdjFVQ3RXRUIxM2FId2NyR3RYTnU5NVY2ajdGV0NUVzk1WDBIODVU?=
 =?utf-8?B?QWMyblF2dkFKZUNxRjAwTllyakFuZXd2eUtpMmhIN0RhY1hiKytxdWVscjlR?=
 =?utf-8?B?Q3JKTG1ocHQwak1BaDRFWnRyTVNGbzZ5Z2xkNDk3TUsyZnBjUGtlWGlJbWln?=
 =?utf-8?B?WjZsdW1hK1pQamJzbDhkcG9iZUg1N0RPaTlVaHJhc0hBZHlybkFpMXZoTTNU?=
 =?utf-8?B?UURPZS9LSkQreXBWOUNSSnBxNWlDSTk4N1JTVWRzcUpSOEtEblprVDkwS1hN?=
 =?utf-8?B?b0Zscmg1Rzl6YUVPaDhUOGE5TjV4ZTdCVEZJNDNxMGRteE9YdGVNalorRlR2?=
 =?utf-8?B?UGZUVGFmdDJoOVhOczBiM01EYzFJc1JkdEhjYXdnOXh2K05yRVlHQUpDK3JT?=
 =?utf-8?B?dnNYT0J1MGwrRnZKbVlHL1hCWSt2dklRRTBNNGdLQmZ6MnhQQStES0ZwaWND?=
 =?utf-8?B?MCtLV1B2cVhJdWxGcVVBdllNdkdzS0IyMjhia1FRSlNveWsxcWd3QlljMmY5?=
 =?utf-8?B?QjlLSzJoYVRCWnBtdFluTnVqUnZ6dWc4VzJFczd2ZzlSZ1RwMStwQWx6Mlh1?=
 =?utf-8?B?QmlIN29GN3Q2SjJrNjE1N3FISU1VeXk2TGExWG1LN0E1NTJzYjBhVXhGZEdp?=
 =?utf-8?B?VllVcEJITGkrOWY4L0F6cVJGMlp2SEI0elQyVTIxZW5kOEQrRGNOZEJZakxY?=
 =?utf-8?B?WHhmekg4R09rZFJWV2JMbXVuZnIrVVQyeXN1dzJpeE1wUGhlRkRpTjJKQ0g5?=
 =?utf-8?B?OC9UcG8wOTN4TkpKSk15d1RLNXliZUpDOEZwSXBsQmVRQnRaR2QxVkZQMWVw?=
 =?utf-8?B?M0VGS3JUVGhsMEZrelg1UmVSQWdMYUJ4SDlmQUZLV2x0bjFDVU85dGhpRUhy?=
 =?utf-8?B?TCtWbVhBcmZqSktWSURlNzVBUzIydVFDSnJ3cTlqSzkwaDA4TlhwdDk4RTZn?=
 =?utf-8?B?UjdlazRKRnY0bVVGU2IwclpIKzlYM1ExWndXNHJOakJWYmxRTUNtWDR3VWlS?=
 =?utf-8?B?WnBORjlzVWJuMHloR3RxSlViQ2VIaE1RcEJrLytRWmd0M0dFQUJ6R1NCRHlM?=
 =?utf-8?B?Y0ZQaldyTlcwTDhJMDVwL2ViYXNpZE5qcEl0SXU5T25LT3g4dkI2YWZpaGx4?=
 =?utf-8?B?MmVtWlVKOUl0MGE0bHVxYkxaY0k5NG53RFFTVUZDQ2c3WjRxdzE1U0x1Vmxh?=
 =?utf-8?B?ZzB2Z081Mk8zelZONS9uRW0yTE9IeG5XTGVxSkpRdHVUa3d4UjFhRXo2RGo3?=
 =?utf-8?B?MjBBR1NqdDVUcFpiUFRqbFQ3dm1KbzhwdGY0azlUY1NIWVNML0loekJxY1pZ?=
 =?utf-8?B?bTVYbGlhRURycUxRdDdGVWtzMFFrYUNMc0JjZy9uQURHdXBFMjZHcXVhak1E?=
 =?utf-8?B?bkVRUnhhSFlOMlFPallxTlNVcTlXaEV1cm9VdHY1SFRwMk9ZaENpeUpsOTgx?=
 =?utf-8?Q?EzpbQfxTd7Hks?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(4022899009)(376014)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YVRnOXRRRFdlNzFVNHdKSWhjQnBqOEpFUVZtNHM5UmF5b01BQ2I0ekNvMzFI?=
 =?utf-8?B?eEFWeE9VYTZxSHNoTjlUSFE0REh0QnNkNmIzL2ZCSnV2YUdCeXFFdXUwYytR?=
 =?utf-8?B?eHZNanlWb3dQTW5pNXlpV3A1SVFCR2lab05XWGJOSmgrZ002TjgvNEVnOHVB?=
 =?utf-8?B?RllWZXJ1NkRZQ3lSM1RUR2ovV3E1Rkc4cWxpZGJieThQdnM1V0tUeVVhaFRE?=
 =?utf-8?B?empBczBoaGtlTm01Q3dTWXAxTTFSK0hlaVpiL0ZzRzhCUitLQi9iK0dRVUN3?=
 =?utf-8?B?TURQbUhiamlJMzlZeTJrdFlDcHFnQ2ZQZlNjQlB2RVRxMGJwOURYOXZxRUFI?=
 =?utf-8?B?ZjVWRHNOZjJKTXlndEorV0gzbGVUUlBEV0lOeVdEdEdHWElDblE1dUIvdHR5?=
 =?utf-8?B?TUlsNVF2WE5hRTRibEFFQVQ3T1ZSbDI1L2xwbmVyb2VIS2NqbExZamZ4Skhp?=
 =?utf-8?B?VC8waHpCMlQ3YnFSZWk5N3pBVlVWSUNVS2d3VEdxR3lsb0M4NXZxRDIvbU5B?=
 =?utf-8?B?cXAveUV4QUZTZ2VTVWtraDV5d09IVWFuU3lSQTNxSXpZYVY5dkRPMEVxZVFC?=
 =?utf-8?B?eno2bkFReUdVNlU2L1djTnpITEVFdjF6UVlnTytDSE9ERDY5dkRRUzJiRkVs?=
 =?utf-8?B?MStvTGVTQUo4YmlJY1JSSG9RNW9sN2dqWkFBakVxNzlmVUZjc3NpdUxKTkFB?=
 =?utf-8?B?N2RZeW40L2laK1ltenM1VmJETVF4WldwVDFIcHhIRE1ENEVFNmdYNkc1MG1h?=
 =?utf-8?B?OWlQTmZVYldsRkN1b3k1TUEwU3RXTlpqdmppSmxFWTcrL2U5OE1vdGhTc0Zr?=
 =?utf-8?B?a0tWTzZlWHd1TjFrdDhVMHl6dHRsQ2dTY3FBb1BxY3d4ZmxTSjZ0M2pkRVVm?=
 =?utf-8?B?dXhqNkp4Y3JHeVpaUS85ZmJQYTBIb2Z6K2hDdXBMbmhVVkFqT0Yzcmd5OEtn?=
 =?utf-8?B?M05QOW5wc2lMUVVFYWMvS1JLWFQxSXVzckRva3RabjdLRFI2VnJHVXJMdVpY?=
 =?utf-8?B?NE9Uc09oejh3aVMza2lFUldZSlVISk9kY2pYK2VNYU41WXA2Z3RIMi94WDMr?=
 =?utf-8?B?WnFLTDFsU0VLenpyY3A4WEtVbGd5TThNQ3lMUitWNDk2YzV4REIvWGJlYkFH?=
 =?utf-8?B?R09jbURCbFUzbUl4TG94WjdCRWVkSzVVOGpXNzRQNE1oWEJLdiswNXRHczV6?=
 =?utf-8?B?RXRBU1Z2OWorSmRKNzA3VHdBaDFKSW1ic21vOU5YMUxVMDlTSUh4SFY4M1J3?=
 =?utf-8?B?S3NLK1hXT3VFaEh6NmpmNG4xSnR1YldsWHk3R3doSk9GMHhoa0F5REV3SmdM?=
 =?utf-8?B?THZvS1hVU3J2YzRmM0gyMUs4TytkaWFqUVpoTmNGWFQ4cFV0K2NOM1NGbCtl?=
 =?utf-8?B?ZXBQRmhBdWxaby9hY1VBa2pBMWxsekJnRGt1ZWhZbGdtVVFyd0N3NVdiWW1O?=
 =?utf-8?B?cWlkNGk4UEt0TXFXN1ZJcjJUTFhyUGJRSGZSeC8rM3RlZGUyVEd5YlpjYUow?=
 =?utf-8?B?WnEzRjdXVTRYSUh0VWwvNGtuZWo0NlU5R2U3V3lHWGxGRkx3S3M0aWVNb0Rp?=
 =?utf-8?B?c3FGaFR0MDN4MTNiUlhpaVpBVGZIcHZzeFoxb1lONndBWW1DWVBKVndTQTIx?=
 =?utf-8?B?d0o0SDdLNTRvTjltT0tXM0gzS1NGUzNmVlhOdlNXT0x2ZmtJN243MlJ6USs1?=
 =?utf-8?B?MUNya0NoVUpON2taYkdmTFNWYmRFVCtBa2RsZWNTczIvOGlGSkxVZGpuTFA4?=
 =?utf-8?B?REZXRXZPUWVQdDI1eHh5WE10SGFLb1gvMVNaTHZJUldndDI5cFRZTjdMeHNo?=
 =?utf-8?B?SkZnV0hJTVBPR1RjVFlBUU1tREhncXg5cGJQcHI2US9IZFlJYlVVaUtnN2hG?=
 =?utf-8?B?d0N1QlJhNFhCcHFhQ2JkWjNhcEZmVEwzMHRWQnlFekxQYUwrZHRMTG4rUnpC?=
 =?utf-8?B?M1ZuejNmdFRtcHNDV1ZUQU5mdkk5a2k5NmwyYUhXdWxSTTJZblpBUUx5c1B1?=
 =?utf-8?B?WVhNc212dTJBN0RWUUxGcFVtcWxCTGV5ekJPMGV0SmthNW9lSzk2NzhQMXRx?=
 =?utf-8?B?VmllTm1idWZrRXk4aWh6eEdBL1d6dGtMaTJNU25pdUtGeUg1Um9lZTlENm1z?=
 =?utf-8?B?UGMxQ3JoekxOZmZZZU5aV2IveC9VcDE2MldTT3Bic3JlYkdmVzBxZmpyNWVt?=
 =?utf-8?B?VEE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5acf632c-4556-47b4-caf3-08dd8597cc11
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2025 14:28:36.9009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SDQYwlXeDkWAQ5sroeY7iKQP5B9pU1AaoVCscQcsVqUoS8985DKeuMWzmyLo3UqD073OWyJlOG9QTToINE5A5pAX1dbS5cccd24B/sSP+5Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7799
X-Authority-Analysis: v=2.4 cv=KsNN2XWN c=1 sm=1 tr=0 ts=680e3f18 cx=c_pps a=wXDgSYWbwZencpnnUUTq5g==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=dRXE1jWJAAAA:8 a=MaVQuvEoAAAA:8 a=Q4-j1AaZAAAA:8 a=vaJtXVxTAAAA:8 a=t7CeM3EgAAAA:8 a=cXZ63ITx9AIs0AoMvw4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=pGLkceISAAAA:8 a=KP8sOTs95c-tDF69T24A:9 a=UajGBAbG3hAmIQ4k:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=I84_JwFgYcz8Gf5-qaVM:22 a=X0fKb1DUdu0K3kojRJDb:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: q7gsVctU9xLdmSJUv21QVrq5qal7tIPS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI3MDExOSBTYWx0ZWRfX4SCy4ECJirU+ 9bw+JWTiH/jUpAgEXTLIlaGICxCy+VYOi0L64Q4QWVtsLhYLXdmtouQ/U1QSuwGkuGt+0eTAsuU CpLezCbJ46JXj54xQ3BhbSAFy0+X0yCX1XfBu0y71TEdLcABv6QNu3li3DDMawjx7VDyOib5NIH
 UihunFf5yKCcj5ON63b/yaoojauIs7giKANFl0SXaCz9tBscHdpBMXGh9/afULYEl4zkKd6zt0E l64of2QTV5IPziomjHP/nc0ad9rCrN4a16cTZj2cNrGiyROrKI+SuV7/Co/ydSFMvrsbcN85mNw pa1xJZSz71/yB+iHC+SGCqOXd442ScA7QYqvhcHv+rnUVhxWmCjdsN2hNMr870EOgAodgc9imvQ
 HeN69iNnlGgfsBkpsGaC1CzlNtWBPaI1agb9N6rsfdbR6rmgy6/aMMJAch8WDVhBW0g1eCv+
X-Proofpoint-GUID: KwencsMQ5mvYV18TBp2zcWJBXmOVX52l
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-27_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 mlxscore=0 phishscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2504270119
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Apr 2025 14:28:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215557

--------------6cauXX4VkGp4azTgkx3eJ1uc
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 53RBeeYr010906

On 2025-04-22 10:50 a.m., Alexander Kanavin via lists.openembedded.org=20
wrote:
> Also here it would be good to see a demo, perhaps you can publish an
> image somewhere and link to it?


Here are 4 screenshots showing the new network traffic:
https://photos.app.goo.gl/AeqMBiRQzRWbMadU9

c-i-sato-full-fetch-full-time.png
c-i-sato-full-fetch.png
c-i-sato-prefetch-full-time.png
c-i-sato-prefetch.png

one set (prefetch) after running bitbake --runall fetch then bitbake=20
core-image-sato
and the other from a clean build (full-fetch) without any downloads.

The builder is my 20 core laptop with an SSD and wired 100/30 (dl/ul)=20
Mbps home network.
There were a few apps running in the background so there's some low=20
bandwidth network chatter.


The pybootchartgui works but it would be nice to be able to:

1.=C2=A0 select which stats are displayed using a command line or interac=
tively,

2. separate the display of various stats over time from the dependency=20
waterfall
 =C2=A0=C2=A0 so that you could zoom into a small area of the waterfall a=
nd see=20
the corresponding area of the stats.

I wonder if there are any web devs who would perhaps use OSM=20
(https://openmaptiles.org/) to do 2. ...

../Randy




From: /home/rmacleod/wrs/lts25/pybootchartgui


>
> Alex
>
> On Tue, 15 Apr 2025 at 20:37, denisova.olga.k via
> lists.openembedded.org
> <denisova.olga.k=3Dyandex.ru@lists.openembedded.org> wrote:
>> From: Olga Denisova<denisova.olga.k@yandex.ru>
>>
>> This patch adds support for parsing and visualizing network interface =
statistics from /proc/net/dev in pybootchartgui. It introduces a new NetS=
ample class to hold per-interface metrics, including received/transmitted=
 bytes and their deltas over time.
>>
>> The data is drawn using line and box charts in draw.py and helps to mo=
nitor
>> network usage during the boot process for each interface individually.
>>
>> Signed-off-by: denisova-ok<denisova.olga.k@yandex.ru>
>> ---
>>   pybootchartgui/pybootchartgui/draw.py    | 48 ++++++++++++++++++++++=
++
>>   pybootchartgui/pybootchartgui/parsing.py | 18 +++++++++
>>   pybootchartgui/pybootchartgui/samples.py | 10 +++++
>>   3 files changed, 76 insertions(+)
>>
>> diff --git a/pybootchartgui/pybootchartgui/draw.py b/pybootchartgui/py=
bootchartgui/draw.py
>> index c6e67833ab..16739a0fa1 100644
>> --- a/pybootchartgui/pybootchartgui/draw.py
>> +++ b/pybootchartgui/pybootchartgui/draw.py
>> @@ -69,6 +69,11 @@ CPU_COLOR =3D (0.40, 0.55, 0.70, 1.0)
>>   IO_COLOR =3D (0.76, 0.48, 0.48, 0.5)
>>   # Disk throughput color.
>>   DISK_TPUT_COLOR =3D (0.20, 0.71, 0.20, 1.0)
>> +
>> +BYTES_RECEIVED_COLOR =3D (0.0, 0.0, 1.0, 1.0)
>> +BYTES_TRANSMITTED_COLOR =3D (1.0, 0.0, 0.0, 1.0)
>> +BYTES_RECEIVE_DIFF_COLOR =3D (0.0, 0.0, 1.0, 0.3)
>> +BYTES_TRANSMIT_DIFF_COLOR =3D (1.0, 0.0, 0.0, 0.3)
>>   # CPU load chart color.
>>   FILE_OPEN_COLOR =3D (0.20, 0.71, 0.71, 1.0)
>>   # Mem cached color
>> @@ -437,6 +442,49 @@ def render_charts(ctx, options, clip, trace, curr=
_y, w, h, sec_w):
>>
>>           curr_y =3D curr_y + 30 + bar_h
>>
>> +    if trace.net_stats:
>> +        for iface, samples in trace.net_stats.items():
>> +            max_received_sample =3D max(samples, key=3Dlambda s: s.re=
ceived_bytes)
>> +            max_transmitted_sample =3D max(samples, key=3Dlambda s: s=
.transmitted_bytes)
>> +            max_receive_diff_sample =3D max(samples, key=3Dlambda s: =
s.receive_diff)
>> +            max_transmit_diff_sample =3D max(samples, key=3Dlambda s:=
 s.transmit_diff)
>> +
>> +            draw_text(ctx, "Iface: %s" % (iface), TEXT_COLOR, off_x, =
curr_y+20)
>> +            draw_legend_line(ctx, "Bytes received (max %d)" % (max_re=
ceived_sample.received_bytes),
>> +                             BYTES_RECEIVED_COLOR, off_x+150, curr_y+=
20, leg_s)
>> +            draw_legend_line(ctx, "Bytes transmitted (max %d)" % (max=
_transmitted_sample.transmitted_bytes),
>> +                             BYTES_TRANSMITTED_COLOR, off_x+400, curr=
_y+20, leg_s)
>> +            draw_legend_box(ctx, "Bytes receive diff (max %d)" % (max=
_receive_diff_sample.receive_diff),
>> +                             BYTES_RECEIVE_DIFF_COLOR, off_x+650, cur=
r_y+20, leg_s)
>> +            draw_legend_box(ctx, "Bytes transmit diff (max %d)" % (ma=
x_transmit_diff_sample.transmit_diff),
>> +                             BYTES_TRANSMIT_DIFF_COLOR, off_x+900, cu=
rr_y+20, leg_s)
>> +
>> +
>> +            chart_rect =3D (off_x, curr_y + 30, w, bar_h)
>> +            if clip_visible(clip, chart_rect):
>> +                draw_box_ticks(ctx, chart_rect, sec_w)
>> +                draw_annotations(ctx, proc_tree, trace.times, chart_r=
ect)
>> +
>> +            if clip_visible (clip, chart_rect):
>> +                draw_chart (ctx, BYTES_RECEIVED_COLOR, False, chart_r=
ect, \
>> +                        [(sample.time, sample.received_bytes) for sam=
ple in samples], \
>> +                        proc_tree, None)
>> +
>> +                draw_chart (ctx, BYTES_TRANSMITTED_COLOR, False, char=
t_rect, \
>> +                        [(sample.time, sample.transmitted_bytes) for =
sample in samples], \
>> +                        proc_tree, None)
>> +
>> +            if clip_visible (clip, chart_rect):
>> +                draw_chart (ctx, BYTES_RECEIVE_DIFF_COLOR, True, char=
t_rect, \
>> +                        [(sample.time, sample.receive_diff) for sampl=
e in samples], \
>> +                        proc_tree, None)
>> +
>> +                draw_chart (ctx, BYTES_TRANSMIT_DIFF_COLOR, True, cha=
rt_rect, \
>> +                        [(sample.time, sample.transmit_diff) for samp=
le in samples], \
>> +                        proc_tree, None)
>> +
>> +            curr_y =3D curr_y + 30 + bar_h
>> +
>>       # render CPU pressure chart
>>       if trace.cpu_pressure:
>>           max_sample_avg =3D max (trace.cpu_pressure, key =3D lambda s=
: s.avg10)
>> diff --git a/pybootchartgui/pybootchartgui/parsing.py b/pybootchartgui=
/pybootchartgui/parsing.py
>> index 144a16c723..72a54c6ba5 100644
>> --- a/pybootchartgui/pybootchartgui/parsing.py
>> +++ b/pybootchartgui/pybootchartgui/parsing.py
>> @@ -48,6 +48,7 @@ class Trace:
>>           self.filename =3D None
>>           self.parent_map =3D None
>>           self.mem_stats =3D []
>> +        self.net_stats =3D []
>>           self.monitor_disk =3D None
>>           self.cpu_pressure =3D []
>>           self.io_pressure =3D []
>> @@ -557,6 +558,21 @@ def _parse_monitor_disk_log(file):
>>
>>       return disk_stats
>>
>> +
>> +def _parse_reduced_net_log(file):
>> +    net_stats =3D {}
>> +    for time, lines in _parse_timed_blocks(file):
>> +
>> +        for line in lines:
>> +            parts =3D line.split()
>> +            iface =3D parts[0][:-1]
>> +            if iface not in net_stats:
>> +                net_stats[iface] =3D [NetSample(time, iface, int(part=
s[1]), int(parts[2]), int(parts[3]), int(parts[4]))]
>> +            else:
>> +                net_stats[iface].append(NetSample(time, iface, int(pa=
rts[1]), int(parts[2]), int(parts[3]), int(parts[4])))
>> +    return net_stats
>> +
>> +
>>   def _parse_pressure_logs(file, filename):
>>       """
>>       Parse file for "some" pressure with 'avg10', 'avg60' 'avg300' an=
d delta total values
>> @@ -767,6 +783,8 @@ def _do_parse(writer, state, filename, file):
>>           state.cmdline =3D _parse_cmdline_log(writer, file)
>>       elif name =3D=3D "monitor_disk.log":
>>           state.monitor_disk =3D _parse_monitor_disk_log(file)
>> +    elif name =3D=3D "reduced_proc_net.log":
>> +        state.net_stats =3D _parse_reduced_net_log(file)
>>       #pressure logs are in a subdirectory
>>       elif name =3D=3D "cpu.log":
>>           state.cpu_pressure =3D _parse_pressure_logs(file, name)
>> diff --git a/pybootchartgui/pybootchartgui/samples.py b/pybootchartgui=
/pybootchartgui/samples.py
>> index a70d8a5a28..7c92d2ce6a 100644
>> --- a/pybootchartgui/pybootchartgui/samples.py
>> +++ b/pybootchartgui/pybootchartgui/samples.py
>> @@ -37,6 +37,16 @@ class CPUSample:
>>           return str(self.time) + "\t" + str(self.user) + "\t" + \
>>                  str(self.sys) + "\t" + str(self.io) + "\t" + str (sel=
f.swap)
>>
>> +
>> +class NetSample:
>> +    def __init__(self, time, iface, received_bytes, transmitted_bytes=
, receive_diff, transmit_diff):
>> +        self.time =3D time
>> +        self.iface =3D iface
>> +        self.received_bytes =3D received_bytes
>> +        self.transmitted_bytes =3D transmitted_bytes
>> +        self.receive_diff =3D receive_diff
>> +        self.transmit_diff =3D transmit_diff
>> +
>>   class CPUPressureSample:
>>       def __init__(self, time, avg10, avg60, avg300, deltaTotal):
>>           self.time =3D time
>> --
>> 2.34.1
>>
>>
>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#215228):https://lists.openembedded.org/g/openembed=
ded-core/message/215228
>> Mute This Topic:https://lists.openembedded.org/mt/112282219/3616765
>> Group Owner:openembedded-core+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [=
randy.macleod@windriver.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

--=20
# Randy MacLeod
# Wind River Linux

--------------6cauXX4VkGp4azTgkx3eJ1uc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2025-04-22 10:50 a.m., Alexander
      Kanavin via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CANNYZj9+wcnLE7TkKHNLytR58mkAAmyRbFhp_jm6e6wW8OXRmA@mail.gmail.com">
      <pre wrap="" class="moz-quote-pre">Also here it would be good to see a demo, perhaps you can publish an
image somewhere and link to it?</pre>
    </blockquote>
    <p><br>
    </p>
    <p>Here are 4 screenshots showing the new network traffic:<br>
      &nbsp;&nbsp; <a class="moz-txt-link-freetext" href="https://photos.app.goo.gl/AeqMBiRQzRWbMadU9">https://photos.app.goo.gl/AeqMBiRQzRWbMadU9</a></p>
    <p>c-i-sato-full-fetch-full-time.png<br>
      c-i-sato-full-fetch.png<br>
      c-i-sato-prefetch-full-time.png<br>
      c-i-sato-prefetch.png<br>
    </p>
    <p>one set (prefetch) after running bitbake --runall fetch then
      bitbake core-image-sato<br>
      and the other from a clean build (full-fetch) without any
      downloads. <br>
    </p>
    <p>The builder is my 20 core laptop with an SSD and wired 100/30
      (dl/ul) Mbps home network.<br>
      There were a few apps running in the background so there's some
      low bandwidth network chatter.</p>
    <p><br>
    </p>
    <p>The pybootchartgui works but it would be nice to be able to:<br>
    </p>
    <p>1.&nbsp; select which stats are displayed using a command line or
      interactively,</p>
    <p>2. separate the display of various stats over time from the
      dependency waterfall <br>
      &nbsp;&nbsp; so that you could zoom into a small area of the waterfall and
      see the corresponding area of the stats. <br>
    </p>
    <p>I wonder if there are any web devs who would perhaps use OSM
      (<a class="moz-txt-link-freetext" href="https://openmaptiles.org/">https://openmaptiles.org/</a>) to do 2. ...<br>
      <br>
    </p>
    <p>../Randy</p>
    <p><br>
    </p>
    <p><br>
    </p>
    <p><br>
    </p>
    <p>From: /home/rmacleod/wrs/lts25/pybootchartgui<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:CANNYZj9+wcnLE7TkKHNLytR58mkAAmyRbFhp_jm6e6wW8OXRmA@mail.gmail.com">
      <pre wrap="" class="moz-quote-pre">

Alex

On Tue, 15 Apr 2025 at 20:37, denisova.olga.k via
lists.openembedded.org
<a class="moz-txt-link-rfc2396E" href="mailto:denisova.olga.k=yandex.ru@lists.openembedded.org">&lt;denisova.olga.k=yandex.ru@lists.openembedded.org&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">From: Olga Denisova <a class="moz-txt-link-rfc2396E" href="mailto:denisova.olga.k@yandex.ru">&lt;denisova.olga.k@yandex.ru&gt;</a>

This patch adds support for parsing and visualizing network interface statistics from /proc/net/dev in pybootchartgui. It introduces a new NetSample class to hold per-interface metrics, including received/transmitted bytes and their deltas over time.

The data is drawn using line and box charts in draw.py and helps to monitor
network usage during the boot process for each interface individually.

Signed-off-by: denisova-ok <a class="moz-txt-link-rfc2396E" href="mailto:denisova.olga.k@yandex.ru">&lt;denisova.olga.k@yandex.ru&gt;</a>
---
 pybootchartgui/pybootchartgui/draw.py    | 48 ++++++++++++++++++++++++
 pybootchartgui/pybootchartgui/parsing.py | 18 +++++++++
 pybootchartgui/pybootchartgui/samples.py | 10 +++++
 3 files changed, 76 insertions(+)

diff --git a/pybootchartgui/pybootchartgui/draw.py b/pybootchartgui/pybootchartgui/draw.py
index c6e67833ab..16739a0fa1 100644
--- a/pybootchartgui/pybootchartgui/draw.py
+++ b/pybootchartgui/pybootchartgui/draw.py
@@ -69,6 +69,11 @@ CPU_COLOR = (0.40, 0.55, 0.70, 1.0)
 IO_COLOR = (0.76, 0.48, 0.48, 0.5)
 # Disk throughput color.
 DISK_TPUT_COLOR = (0.20, 0.71, 0.20, 1.0)
+
+BYTES_RECEIVED_COLOR = (0.0, 0.0, 1.0, 1.0)
+BYTES_TRANSMITTED_COLOR = (1.0, 0.0, 0.0, 1.0)
+BYTES_RECEIVE_DIFF_COLOR = (0.0, 0.0, 1.0, 0.3)
+BYTES_TRANSMIT_DIFF_COLOR = (1.0, 0.0, 0.0, 0.3)
 # CPU load chart color.
 FILE_OPEN_COLOR = (0.20, 0.71, 0.71, 1.0)
 # Mem cached color
@@ -437,6 +442,49 @@ def render_charts(ctx, options, clip, trace, curr_y, w, h, sec_w):

         curr_y = curr_y + 30 + bar_h

+    if trace.net_stats:
+        for iface, samples in trace.net_stats.items():
+            max_received_sample = max(samples, key=lambda s: s.received_bytes)
+            max_transmitted_sample = max(samples, key=lambda s: s.transmitted_bytes)
+            max_receive_diff_sample = max(samples, key=lambda s: s.receive_diff)
+            max_transmit_diff_sample = max(samples, key=lambda s: s.transmit_diff)
+
+            draw_text(ctx, &quot;Iface: %s&quot; % (iface), TEXT_COLOR, off_x, curr_y+20)
+            draw_legend_line(ctx, &quot;Bytes received (max %d)&quot; % (max_received_sample.received_bytes),
+                             BYTES_RECEIVED_COLOR, off_x+150, curr_y+20, leg_s)
+            draw_legend_line(ctx, &quot;Bytes transmitted (max %d)&quot; % (max_transmitted_sample.transmitted_bytes),
+                             BYTES_TRANSMITTED_COLOR, off_x+400, curr_y+20, leg_s)
+            draw_legend_box(ctx, &quot;Bytes receive diff (max %d)&quot; % (max_receive_diff_sample.receive_diff),
+                             BYTES_RECEIVE_DIFF_COLOR, off_x+650, curr_y+20, leg_s)
+            draw_legend_box(ctx, &quot;Bytes transmit diff (max %d)&quot; % (max_transmit_diff_sample.transmit_diff),
+                             BYTES_TRANSMIT_DIFF_COLOR, off_x+900, curr_y+20, leg_s)
+
+
+            chart_rect = (off_x, curr_y + 30, w, bar_h)
+            if clip_visible(clip, chart_rect):
+                draw_box_ticks(ctx, chart_rect, sec_w)
+                draw_annotations(ctx, proc_tree, trace.times, chart_rect)
+
+            if clip_visible (clip, chart_rect):
+                draw_chart (ctx, BYTES_RECEIVED_COLOR, False, chart_rect, \
+                        [(sample.time, sample.received_bytes) for sample in samples], \
+                        proc_tree, None)
+
+                draw_chart (ctx, BYTES_TRANSMITTED_COLOR, False, chart_rect, \
+                        [(sample.time, sample.transmitted_bytes) for sample in samples], \
+                        proc_tree, None)
+
+            if clip_visible (clip, chart_rect):
+                draw_chart (ctx, BYTES_RECEIVE_DIFF_COLOR, True, chart_rect, \
+                        [(sample.time, sample.receive_diff) for sample in samples], \
+                        proc_tree, None)
+
+                draw_chart (ctx, BYTES_TRANSMIT_DIFF_COLOR, True, chart_rect, \
+                        [(sample.time, sample.transmit_diff) for sample in samples], \
+                        proc_tree, None)
+
+            curr_y = curr_y + 30 + bar_h
+
     # render CPU pressure chart
     if trace.cpu_pressure:
         max_sample_avg = max (trace.cpu_pressure, key = lambda s: s.avg10)
diff --git a/pybootchartgui/pybootchartgui/parsing.py b/pybootchartgui/pybootchartgui/parsing.py
index 144a16c723..72a54c6ba5 100644
--- a/pybootchartgui/pybootchartgui/parsing.py
+++ b/pybootchartgui/pybootchartgui/parsing.py
@@ -48,6 +48,7 @@ class Trace:
         self.filename = None
         self.parent_map = None
         self.mem_stats = []
+        self.net_stats = []
         self.monitor_disk = None
         self.cpu_pressure = []
         self.io_pressure = []
@@ -557,6 +558,21 @@ def _parse_monitor_disk_log(file):

     return disk_stats

+
+def _parse_reduced_net_log(file):
+    net_stats = {}
+    for time, lines in _parse_timed_blocks(file):
+
+        for line in lines:
+            parts = line.split()
+            iface = parts[0][:-1]
+            if iface not in net_stats:
+                net_stats[iface] = [NetSample(time, iface, int(parts[1]), int(parts[2]), int(parts[3]), int(parts[4]))]
+            else:
+                net_stats[iface].append(NetSample(time, iface, int(parts[1]), int(parts[2]), int(parts[3]), int(parts[4])))
+    return net_stats
+
+
 def _parse_pressure_logs(file, filename):
     &quot;&quot;&quot;
     Parse file for &quot;some&quot; pressure with 'avg10', 'avg60' 'avg300' and delta total values
@@ -767,6 +783,8 @@ def _do_parse(writer, state, filename, file):
         state.cmdline = _parse_cmdline_log(writer, file)
     elif name == &quot;monitor_disk.log&quot;:
         state.monitor_disk = _parse_monitor_disk_log(file)
+    elif name == &quot;reduced_proc_net.log&quot;:
+        state.net_stats = _parse_reduced_net_log(file)
     #pressure logs are in a subdirectory
     elif name == &quot;cpu.log&quot;:
         state.cpu_pressure = _parse_pressure_logs(file, name)
diff --git a/pybootchartgui/pybootchartgui/samples.py b/pybootchartgui/pybootchartgui/samples.py
index a70d8a5a28..7c92d2ce6a 100644
--- a/pybootchartgui/pybootchartgui/samples.py
+++ b/pybootchartgui/pybootchartgui/samples.py
@@ -37,6 +37,16 @@ class CPUSample:
         return str(self.time) + &quot;\t&quot; + str(self.user) + &quot;\t&quot; + \
                str(self.sys) + &quot;\t&quot; + str(self.io) + &quot;\t&quot; + str (self.swap)

+
+class NetSample:
+    def __init__(self, time, iface, received_bytes, transmitted_bytes, receive_diff, transmit_diff):
+        self.time = time
+        self.iface = iface
+        self.received_bytes = received_bytes
+        self.transmitted_bytes = transmitted_bytes
+        self.receive_diff = receive_diff
+        self.transmit_diff = transmit_diff
+
 class CPUPressureSample:
     def __init__(self, time, avg10, avg60, avg300, deltaTotal):
         self.time = time
--
2.34.1




</pre>
        <br>
        <fieldset class="moz-mime-attachment-header"></fieldset>
        <pre wrap="" class="moz-quote-pre">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#215228): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/215228">https://lists.openembedded.org/g/openembedded-core/message/215228</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/112282219/3616765">https://lists.openembedded.org/mt/112282219/3616765</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
      </blockquote>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------6cauXX4VkGp4azTgkx3eJ1uc--

