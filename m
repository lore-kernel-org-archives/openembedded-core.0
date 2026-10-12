Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C038ECA9ED0
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 11:22:18 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10979.1791804124465758907
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2026 04:22:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=V7HZ56RJ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=47453a78d5=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C8MNRf101727
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 11:22:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=/TU/+FYRA1F6ZLBzpb83Rc
	jK1aIMQImzE2USDtFBTrU=; b=V7HZ56RJvQvVPTVQLYoGuE9qHO94J0lI6h/Nxr
	Jlkv2tgnGXWd7z/20dyRwQh9yjuRfPBzk3X0VIRd8rRMfUgXFNBVu3F9ECnt8MDi
	SEtE1XDdVsnQyPw28nVxxtpa5E2oJ/OCdnhXcT5rsUM4qqPJTZRaCw0BLXB7bie9
	Fg9tvpNdAbmLE2keVyrTYjWUZONWUWjq5cxmLXI9pKceNWTTP+VGw7j2L4Wk2I43
	/TSap+FWDufl7NUhnq2L0jrP1/feQmhYgcPR/B5IcNbXDUc1FGh2itPHKzr8HzWh
	AhI0YTwuEErl78fkVejEheek6WGctFtXOSpKNvmRCXEFtcuQ==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11020095.outbound.protection.outlook.com [52.101.85.95])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4h7cb526qv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 12 Oct 2026 11:22:02 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YK+Xc40xm1ElQ8COWUOmQ078vyCG6Vbfk5l75WyF8z1MOpkcA6lX2pBtlLJ2loSDCQBTbsOHir/jISZK8zHMrboDAZl3PbXezHWwwXR5nQy3PnJtPIJlwYzPj9/Xu1q/ln9QyMK8H2LLDwUIMmHRL5Rm7+LN/KCvLlZznCMMuZVm5dRBnlgGJOq6DqjJdf61p8Xm4Yvjx24kJXSQQMyJkMPg4WUfNpldjr12nwZLUHlOpflDGcHqpAsax1y0czY6pItu79jKrLP8eEfwEIU+UqtbSveJhuig14wJJhAGCTPsQFBwIV47kRHuQN4/ymNjFaPByR48FxQ61KsNaETmSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/TU/+FYRA1F6ZLBzpb83RcjK1aIMQImzE2USDtFBTrU=;
 b=WUvS+SIvdD268s5uvLe/xvt52vTM8MSlp9JiqGPJ0x9+DEoWBLUtaQytPRkqyfvWZE2o4HgkLmpZBmnn5kvr261ZJLV0sZkOCnXcZaTwYIz9s9IkmYr13U190hwHRAvP9QAndmL1CI+NMlkbU8LPwO2jhwZ+vwmdEx1s9e9inEqP3LQGYypk4M3R5YCE6ocmQPaXat3sA3qH01711N3N4bEkDvMwGvc4AaG/n+g9J8wGtltFFFdJbJDxtwRtUvvrOxsBK3btqAo525Aeuu3d5rq+6izO4mVm06HAcZPoFGx2TrF6WAILns0hCPK2wGMNVnQJb0r7gSnHGtmnAEzBWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from DM4PR11MB7328.namprd11.prod.outlook.com (2603:10b6:8:104::9) by
 SJ2PR11MB8300.namprd11.prod.outlook.com (2603:10b6:a03:548::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Mon, 12 Oct
 2026 11:21:59 +0000
Received: from DM4PR11MB7328.namprd11.prod.outlook.com
 ([fe80::26e8:ea57:9a33:9a86]) by DM4PR11MB7328.namprd11.prod.outlook.com
 ([fe80::26e8:ea57:9a33:9a86%4]) with mapi id 15.21.0451.026; Mon, 12 Oct 2026
 11:21:58 +0000
Content-Type: multipart/alternative;
 boundary="------------Q28HDCa5X51x4opYTHl6M3Rn"
Message-ID: <cd30879f-780f-4315-85c3-e57c38b1b2bf@windriver.com>
Date: Mon, 12 Oct 2026 16:51:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] ptest-cargo: fix quoted RUSTFLAGS passed to
 cargo
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
        "Sundeep.Kokkonda@windriver.com" <Sundeep.Kokkonda@windriver.com>,
        "Dora, Sunil Kumar" <SunilKumar.Dora@windriver.com>
References: <20260930055437.1584781-1-Deepesh.Varatharajan@windriver.com>
 <71E03368-5767-4B30-B483-9367712FDAEA@arm.com>
Content-Language: en-US
From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
In-Reply-To: <71E03368-5767-4B30-B483-9367712FDAEA@arm.com>
X-ClientProxiedBy: PN2PR01CA0120.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::35) To DM4PR11MB7328.namprd11.prod.outlook.com
 (2603:10b6:8:104::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7328:EE_|SJ2PR11MB8300:EE_
X-MS-Office365-Filtering-Correlation-Id: b67db63c-f2ab-41ad-b3a6-08df28530769
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|11063799006|56012099006|261009223027099003|4143699003|22082099003|6133799003|13003099007|10067099003|18002099003|3023799007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	JLCF1j05Ba6YHPaetEEL7omF8jB6cX0SM4H4AWneh7feJJyH3bP18uviBPdISW83INGgiAiMMM3QRrpMySzOYElBjzyxEcCCMj1DaNEVnhkoY4WfyZAP3VM2CiwJPbeTN0QNy6x/nTl18oYAXT1ZzL4l1gZa43p6+07az/GDcnx5A48+IR0VDyMoTJB9yZdEfCMj1YLhjd0ia5Sd3DrqqfnpffuRmFjbhAeqH3DqHvZjTSLKUK24xJ5MgF0cZcs/Pcfl8+6YDOvC/zS1akYDTDzPlbasSCjD1ED3h5Vry8NeuHiweWME8M3rbS5Rpf0Zew7nbu7P9UdaqmxItAEJcjgf7hFFM9O8SRJxnbryYE+1HOm1oYVA+p4GzMwZGGGc6hXGZqzjbt3DF7/bMj47Fps3IahYy8jfSG0FSssUQ2EcrpR963AAqAOwNpscdOVklw48e3kGutpdOAE57EwCDlY1Sp/QC32yKnr7NeL8oT4pMsjTD76mcApmOFIIhf3c4uA3nKIGK3+0TMsYi85tba6vXBpLBkQs7uhFtx4im6DSnnW3mSZMVkRCSxzJ3UWfbHnP2SUJUqUv49K9kE9uMt7pwcFmMVdV30Xj7iLVpJU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7328.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(11063799006)(56012099006)(261009223027099003)(4143699003)(22082099003)(6133799003)(13003099007)(10067099003)(18002099003)(3023799007)(8096899003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bklkdzNlQnE3d1U1L2w3UXpIQ0w2VG5pL3FWSEh0eWoyeURPRUhDTFJqd1BT?=
 =?utf-8?B?MGdvSUVmeEx2S1JvTnl5THF2QVhBQ2dGU2dhS0s1TUk0bUxBQm9pSDR6WDBJ?=
 =?utf-8?B?aFZBUmlGUVUvQWdtZUlRbTlkUXdYZzFHanpaUk9WY2JKaWJOUWVsSGR6SGRw?=
 =?utf-8?B?ODlxRzFKcGhVSjcvQmJ0eWw4RGtBYWZpeFA2djV6VXo5TnFWek1xckZvSkM1?=
 =?utf-8?B?Ukx6d1pYeVF1MDhVNnNQYmtzbHN4YlVMV3ZqdzVmbWJDZFBxdVBLK1JCTDZY?=
 =?utf-8?B?V29Uem9BV0xKbXpiYzQxNnI0d3V5VFdXWjJTMEhTNVBOU3k4aW90SzFQUGtY?=
 =?utf-8?B?dmlxdm84aXZqSWpML2VHOWMzdTFSWXBEcGZUcGtndW85Nno4SGRMRHlyUVNv?=
 =?utf-8?B?YktpQUtrSXBxamVXTDhSSDRIbGpXc3cyTDdNbGNJbGZaYVU2L204NGZRSlNG?=
 =?utf-8?B?NWNqZ3pldTBxNWgrZjg3R3J0RmU2NGlLWlVlSFllaVBRZnVwQVFzN1M2WUV1?=
 =?utf-8?B?TGxuNE1HVEVpMXlndDQzR0JSRXUxMW5CUmdqY1hsV0ZDam0wN1RsRnMvZ2Y5?=
 =?utf-8?B?NmNicXRZTytGb3Z3R0ZBbXNZaEx1SWJsNldnMWRhUjRpdDdXajNxUloyK0pa?=
 =?utf-8?B?V2RIVFZKbXRMZnJnSjJWbDgyeHdZNlpOV29xT0xQdW5ESXpSK2h2ZkJpL1hU?=
 =?utf-8?B?NmdDRUJGa29BM3VGSkhBU1JvUlVJeS9sUUwvVVIyYXhOSzUvVTJHZWtGOWtz?=
 =?utf-8?B?R09jQnFuNmdzc1dIcng0bk1UbFJGcGxEZEJBdUZRU1k5OTM1Z2c2NWh5U3hx?=
 =?utf-8?B?NE9BTENBVERmZk5VS0hSZWVGQzR2NkxmZFJQRkIxRkdJK0d6UjRKUGdPcjJq?=
 =?utf-8?B?WEt6YlFVdlZGN2NkZFIrSUJmV3ZzSEc1ZFFjbTJZclVJVlozbys2WDcwM3No?=
 =?utf-8?B?MXNUSVZlcE1YZW5vLzV1QjVCOUFoM1NJZzJWK3RNSFhDY3hrcW5iZHRJU3Vt?=
 =?utf-8?B?ZFRiUGMvVHFFTldNNFI2aENuaUxNK3lhL0lBZmxKdEIxcEJseXFuSkx4Y01V?=
 =?utf-8?B?NHhOb0NZbVhDc3RuY1BPdnRkSjRCdnBCMVhEbnZ2UmVSNkxCRTJYbWpPdkNQ?=
 =?utf-8?B?dGJTNnROTlQ0M3I2N2JBVjJvY3RSVFlNem5UK0ZWKzdaYVhDYjF4RlNVZlM4?=
 =?utf-8?B?MGdDVGxmTEp2elpBdkl6SVpXa0IranVmWFgweFZhN1ZadXpSQm9RVnBDZ0Z2?=
 =?utf-8?B?N283ejhmUkdYNXc0QUNZTU14dXBTZUQzY3NMSWFDWnlRdndtTlViNyt4VjJI?=
 =?utf-8?B?M3I2WGp3QTM2b1FPcjgrNnJleFhub1dkTmp1K2pmbU0wdzVaRWZ6SDBnMTRW?=
 =?utf-8?B?UmEyVjJQaW42L2Y2blpJQURCK2hxMWV2dEhlVVFJZjIvVzA4Sytkd2NKZTdE?=
 =?utf-8?B?MGNTd1RXOEFmTGdKK0xxWW1jQk9IZm1GMFo4Uk5wTXRaUlNncDUrVDFsZFp0?=
 =?utf-8?B?dHRSZXRvTHhadG9MOENQb1FIaDZUbnVSaUdNL0RJNHJQdlJBU01ydnIxUEFy?=
 =?utf-8?B?d0JuWjlrclJiOHlpRzRBcVdIaVpuT2l5d2xiOVFXWVE2L1dmR21UcWdlMnVV?=
 =?utf-8?B?NEswU3V0bWJ5elFvRVZRSVRhTjB4Zzc3V05KVnJqeDEva0hONnZUajVDSDVM?=
 =?utf-8?B?UVdmaWJwZnVzUENOTkx5Y3NEcWNuVytKdmNJNGVpNG9Fb0pJRlYyY050ZDd1?=
 =?utf-8?B?N2xxNlIvaFZIa09LZW5XNnBMSGNSdWFqczhjcXZCY0dlT1BCMDZLUkNtWXFJ?=
 =?utf-8?B?SlI5b3Qvekt3cGFsK0ZxOXpMTXlpQnBsK0FvR1RYWmpwaTkyNnIxZk5vaTlm?=
 =?utf-8?B?YnBuVitabTl3Y1Q1aVI4RFlDRjExZ0Irc3R1RnNOYUJ6NWdnekZIUGRvUWRw?=
 =?utf-8?B?VzBzbVdHSk5wakU2MmhJZTFhSnBOaXpVYjVieUpaZXpmUWtCZVl0SXZxVzlu?=
 =?utf-8?B?RjIwUEp6eDJPaThWMTFJNlJEQzd5SGVuZXdxbEEybWRtMFhyUzhtTGdIZTdt?=
 =?utf-8?B?WWxIcDk3b1RGOWYrc3dMTVFNYmRKb0pwLzBQdTZLZ2NEYTJsK2dxMXJNY3lG?=
 =?utf-8?B?cVFUSFhUb3VKUXBORG84WVlVMU9RTDh3YTl3NEtKMThlMXlpbjFRUDZ6UmxL?=
 =?utf-8?B?UG41ZS9vNUVDbTZiV1NScTZKOTBTUG5sMnJueGE3Ulk3b1lDRHFQZlNMazA3?=
 =?utf-8?B?UDBkVWorWjBnV0tNRHA4V01GUmJZdGtpUFN1cy83NFpwc3EvcCs5YjMvcmJh?=
 =?utf-8?B?K0FqMCszQStkRCtNdXFjd1VNU1RvemEvV095eThTQ2Y0dkdiOXptUysya2Z5?=
 =?utf-8?Q?OkxFs6SEnK18mx5+aYSqtV3jBAzvVkU+/g1Sk?=
X-Exchange-RoutingPolicyChecked: 
	a6eqJ/Ahx5M4bnxNgnNmeoVj2cXgsVIx1t1grSbJbPCceiqRFDzaiBb8I01OlH0Fg1iH6f2/1F3Znr20qoxwbT6QdY+Yzje6gPZ2dyOc+eXB8BLfXfC2VoXDKHEU9+VTy9POa9qFFWv3Px2d96asYhy7V49Cp0AH6o7IplrFoDPgzh+mOaVNSlQ22RcIlmBalY3LcPAysixXjhBCdjmpQX27CN2PydtswGgNDFBHAy9vm6sN9GdgzeasqOdvLH1gpsrGOCsHODE+ssRHiZFsdOcIbp2RZ1lYF+SJ/EnZbk8ASeIISaINa2JE2jFQWRPXG3OOUJRuJbzmMPjv4obe4Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b67db63c-f2ab-41ad-b3a6-08df28530769
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7328.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 11:21:58.8184
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SZxx+uizrHx3P5ajco+0qL2IE61ENYpaqmGyA6MiNV4MFw0G9C6S69e8bGBLdSvf/leM6hyHfgpbxwwL8/4B1YMUFOtX8vlRTb3BiJ5Are8ef59CtO+PX96D2pn3/prK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8300
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=K/a3jCWI c=1 sm=1 tr=0 ts=6accc2db cx=c_pps
 a=ws69a72eWNNXWagsEosLDA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=p0WdMEafAAAA:8
 a=ei4SEBeUAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=8hN_XUIzYmDVg3lRu-IA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=7CQSdrXTAAAA:8 a=TGWRFvGZnzJx6LKCTUUA:9
 a=1ITDC6KNngwSdHug:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=8zIOOLb7Ym0NljyPXbuS:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: YI_qh_2m2ysQ89en14yyrSd7ENW3dg8v
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0NSBTYWx0ZWRfXy7JjasM4aXuY
 ycF3ArgEG1Gt15ZoFDZSOO7B4Z4oiB5QactaisnAs4M8J+AlFyW+RfAKOSEqP0tpTxPfNGcuTdb
 KjuXRGruqJcoNMxnzNuFB+84dghvE6vDVSYOV8RpZ2XRmkA6LrrR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0NSBTYWx0ZWRfXy919pfMsFytJ
 2vwCJEuJCQCL1ECFDLyyhyyR/Y2kA4LrmWSVZi/X/yk9BCK1uGYoBUc5YH1Q11KVJpuzvy0crun
 BX3en8p1tjeaUdEOwqYB6oB5qtHHH05IyFCBauFhIKaNHb+/y4tv6mamaxENXTZ03jrGlMFK18k
 nODVg0n2TxMxWINmaKvNZR9QjNdUpeIm7ooN1l9XP7iUnOzbgfgjrw41icaO3P0VFhINzFbzSkQ
 hT15tdk/Fof5gyvjHeKlAhxh8c6IjDCh997yx0GVbxvRilQoiXqRFdhy63M2ObrUSGA9Z2/ERs5
 mMa61OKbyxtWy7UMzj82292Q+M3Fnr+N1rIE5iC1sFpgFSr8SrvzG+Y+Xaz0TCWhWBR0Wf4zq9B
 jDVjJnB3q6l9t4v0FomwFyaJIhM6jvyXkjVQtCCnnm1oB4VYoCEXC5/yAalvYZaIqtRXNOU2oIs
 1MKgrdKMvvIgsnu9SBA==
X-Proofpoint-GUID: o-fcx8KdFLBlgiNWVdfJkJWqQDiRBt8J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120045
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 11:22:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247637

--------------Q28HDCa5X51x4opYTHl6M3Rn
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 69C8MNRf101727


On 02-10-2026 18:29, Ross Burton wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On 30 Sep 2026, at 06:54, Varatharajan, Deepesh via lists.openembedded.=
org<deepesh.varatharajan=3Dwindriver.com@lists.openembedded.org> wrote:
>> From: AnnLeelu George<AnnLeelu.George@windriver.com>
>>
>> do_compile_ptest_cargo passes RUSTFLAGS directly to the cargo environm=
ent,
>> bypassing the shell. As a result, BitBake's shell escaping is preserve=
d and
>> can cause quoted cfg values to reach rustc incorrectly.
>>
>> This can be reproduced with:
>>
>>     DISTRO_FEATURES:append =3D " ptest"
>>     DEPRECATED_CRYPTO_FLAGS:pn-openssl =3D "no-des"
>>
>> OpenSSL then defines OPENSSL_NO_DES, which openssl-sys emits as an oss=
lconf
>> cfg. The resulting RUSTFLAGS contains:
>>
>>     --cfg osslconf=3D\"OPENSSL_NO_DES\"
>>
>> The rpm-sequoia ptest build consequently fails with:
>>
>>     error: unknown start of token
>>     error[E0765]: unterminated double quote string
> The need to shlex.split a variable that is set by the recipe seemed unu=
sual to me, so I poked a little into this but I can=E2=80=99t replicate t=
his behaviour.  rpm-sequotia does indeed fail to build with the reproduct=
ion steps, but printing the value of RUSTFLAGS at the point where this pa=
tch uses shlex gives the following string:
>
> WARNING: rpm-sequoia-1.10.2-r0 do_compile_ptest_cargo: rust_flags=3D' -=
L /work/ross/build/tmp/work/cortexa57-poky-linux/rpm-sequoia/1.10.2/recip=
e-sysroot/usr/lib/rustlib/aarch64-poky-linux-gnu/lib --remap-path-prefix=3D=
/work/ross/build/tmp/work/cortexa57-poky-linux/rpm-sequoia/1.10.2=3D/usr/=
src/debug/rpm-sequoia/1.10.2  --remap-path-prefix=3D/work/ross/build/tmp/=
work-shared=3D/usr/src/debug/rpm-sequoia/1.10.2 =E2=80=98
>
> No quotation marks in there.  The build does then fail, but (after undo=
ing several layers of json and escaping) the error is:
>
> aarch64-poky-linux/aarch64-poky-linux-ld:
> libopenssl-3aad21d8f08654a9.rlib(openssl-3aad21d8f08654a9.openssl.4278b=
d4403a9a010-cgu.10.rcgu.o):
> in function `<openssl::cipher::Cipher>::des_ede3_cbc':
> openssl.4278bd4403a9a010-cgu.10:(.text._RNvMs0_NtCs5HPgRTJKBnE_7openssl=
6cipherNtB5_6Cipher12des_ede3_cbc+0x0):
> undefined reference to `EVP_des_ede3_cbc'
>
> aarch64-poky-linux/aarch64-poky-linux-ld:
> libopenssl-3aad21d8f08654a9.rlib(openssl-3aad21d8f08654a9.openssl.4278b=
d4403a9a010-cgu.10.rcgu.o):
> in function `<openssl::cipher::Cipher>::des_ede3_ecb':
>
> openssl.4278bd4403a9a010-cgu.10:(.text._RNvMs0_NtCs5HPgRTJKBnE_7openssl=
6cipherNtB5_6Cipher12des_ede3_ecb+0x0):
> undefined reference to `EVP_des_ede3_ecb'
>
> aarch64-poky-linux/aarch64-poky-linux-ld:
> libopenssl-3aad21d8f08654a9.rlib(openssl-3aad21d8f08654a9.openssl.4278b=
d4403a9a010-cgu.10.rcgu.o):
> in function `<openssl::cipher::Cipher>::des_ede3_cfb64':
>
> openssl.4278bd4403a9a010-cgu.10:(.text._RNvMs0_NtCs5HPgRTJKBnE_7openssl=
6cipherNtB5_6Cipher14des_ede3_cfb64+0x0):
> undefined reference to `EVP_des_ede3_cfb64'
>
> Which seems fair, considering we just disabled the des functions.
>
> Can you reproduce using plain oe-core?  I wonder if the problem you see=
 is specific to WR Linux?
>
> Thanks,
> Ross
Hi Ross,

Thanks for reviewing this. As you pointed out, *the error[E0765]:=20
unterminated double quote string* issue is specific to WR Linux.

However, the linker errors we observe in oe-core when setting=20
DEPRECATED_CRYPTO_FLAGS:pn-openssl =3D "no-des" indicate a
potential issue that needs further investigation ?

To address this, we submitted and backported the upstream Sequoia commit=20
https://gitlab.com/sequoia-pgp/sequoia/-/commit/fcc286417cdf9152e7df1a615=
2d31388a0ca9d24=20
,
Fix this issue by checking OPENSSL_NO_DES before using the related=20
functions in sequoia-openpgp and we pass --cfg=20
osslconf=3D\"OPENSSL_NO_DES\" to RUSTFLAGS by
checking DEPRECATED_CRYPTO_FLAGS has no-des or not.

This raises two questions regarding oe-core:

Is this also a potential issue in plain oe-core?

If rpm-sequoia is built against an OpenSSL configuration with DES=20
disabled, would oe-core also need to backport the upstream change and=20
explicitly pass
--cfg osslconf=3D"OPENSSL_NO_DES" to rustc?

Could you confirm whether this configuration needs to be handled in=20
oe-core ?

Can the RUSTFLAGS quoting issue be fixed without using shlex.split()?

When building with ptest enabled, we encounter:

/=C2=A0 =C2=A0error: unknown start of token
 =C2=A0 =C2=A0error[E0765]: unterminated double quote string/

The underlying issue appears to be that cargo_do_compile and=20
do_compile_ptest_cargo handle RUSTFLAGS differently. The=20
cargo_do_compile exports it
through the shell, whereas the do_compile_ptest_cargo sets the=20
environment variable directly from Python. Consequently, the quoting=20
required for the
cfg argument is not handled consistently.

We are considering using CARGO_ENCODED_RUSTFLAGS instead:

/python () {
 =C2=A0 =C2=A0 if bb.utils.contains('DEPRECATED_CRYPTO_FLAGS', 'no-des', =
True,=20
False, d):
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 flags =3D (d.getVar('RUSTFLAGS') or '').spli=
t() + [
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 '--cfg', 'osslconf=3D"OPENSSL_=
NO_DES"'
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ]
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar('CARGO_ENCODED_RUSTFLAGS', '\x1f'.j=
oin(flags))
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVarFlag('CARGO_ENCODED_RUSTFLAGS', 'exp=
ort', '1')
}/

Cargo documents CARGO_ENCODED_RUSTFLAGS=20
<https://doc.rust-lang.org/cargo/reference/environment-variables.html#:~:=
text=3Dsee%20CARGO_ENCODED_RUSTFLAGS.-,CARGO_ENCODED_RUSTFLAGS,-%E2%80%94=
%20A%20list%20of>=20
as accepting compiler arguments separated by the ASCII unit separator=20
(\x1f), avoiding shell-dependent quoting.
This should allow the same arguments to be passed through both compile=20
paths.

Would this approach be preferable to using shlex.split() to work around=20
the quoting issue? Alternatively, is there a more appropriate way to=20
handle this
in the existing Cargo classes?

I'd appreciate your thoughts on whether any corresponding change is=20
needed in oe-core, and on the preferred way to handle the flags=20
consistently across
both Cargo task paths.

Regards,
Deepesh
--------------Q28HDCa5X51x4opYTHl6M3Rn
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 69C8MNRf101727

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 02-10-2026 18:29, Ross Burton wrote=
:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:71E03368-5767-4B30-B483-9367712=
FDAEA@arm.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">CAUTION: This email comes fr=
om a non Wind River email account!
Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.

On 30 Sep 2026, at 06:54, Varatharajan, Deepesh via lists.openembedded.or=
g <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:deepesh.varatharajan=3D=
windriver.com@lists.openembedded.org">&lt;deepesh.varatharajan=3Dwindrive=
r.com@lists.openembedded.org&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">
From: AnnLeelu George <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:A=
nnLeelu.George@windriver.com">&lt;AnnLeelu.George@windriver.com&gt;</a>

do_compile_ptest_cargo passes RUSTFLAGS directly to the cargo environment=
,
bypassing the shell. As a result, BitBake's shell escaping is preserved a=
nd
can cause quoted cfg values to reach rustc incorrectly.

This can be reproduced with:

   DISTRO_FEATURES:append =3D &quot; ptest&quot;
   DEPRECATED_CRYPTO_FLAGS:pn-openssl =3D &quot;no-des&quot;

OpenSSL then defines OPENSSL_NO_DES, which openssl-sys emits as an osslco=
nf
cfg. The resulting RUSTFLAGS contains:

   --cfg osslconf=3D\&quot;OPENSSL_NO_DES\&quot;

The rpm-sequoia ptest build consequently fails with:

   error: unknown start of token
   error[E0765]: unterminated double quote string
</pre>
      </blockquote>
      <pre wrap=3D"" class=3D"moz-quote-pre">
The need to shlex.split a variable that is set by the recipe seemed unusu=
al to me, so I poked a little into this but I can=E2=80=99t replicate thi=
s behaviour.  rpm-sequotia does indeed fail to build with the reproductio=
n steps, but printing the value of RUSTFLAGS at the point where this patc=
h uses shlex gives the following string:

WARNING: rpm-sequoia-1.10.2-r0 do_compile_ptest_cargo: rust_flags=3D' -L =
/work/ross/build/tmp/work/cortexa57-poky-linux/rpm-sequoia/1.10.2/recipe-=
sysroot/usr/lib/rustlib/aarch64-poky-linux-gnu/lib --remap-path-prefix=3D=
/work/ross/build/tmp/work/cortexa57-poky-linux/rpm-sequoia/1.10.2=3D/usr/=
src/debug/rpm-sequoia/1.10.2  --remap-path-prefix=3D/work/ross/build/tmp/=
work-shared=3D/usr/src/debug/rpm-sequoia/1.10.2 =E2=80=98

No quotation marks in there.  The build does then fail, but (after undoin=
g several layers of json and escaping) the error is:

aarch64-poky-linux/aarch64-poky-linux-ld:
libopenssl-3aad21d8f08654a9.rlib(openssl-3aad21d8f08654a9.openssl.4278bd4=
403a9a010-cgu.10.rcgu.o):
in function `&lt;openssl::cipher::Cipher&gt;::des_ede3_cbc':
openssl.4278bd4403a9a010-cgu.10:(.text._RNvMs0_NtCs5HPgRTJKBnE_7openssl6c=
ipherNtB5_6Cipher12des_ede3_cbc+0x0):
undefined reference to `EVP_des_ede3_cbc'

aarch64-poky-linux/aarch64-poky-linux-ld:
libopenssl-3aad21d8f08654a9.rlib(openssl-3aad21d8f08654a9.openssl.4278bd4=
403a9a010-cgu.10.rcgu.o):
in function `&lt;openssl::cipher::Cipher&gt;::des_ede3_ecb':

openssl.4278bd4403a9a010-cgu.10:(.text._RNvMs0_NtCs5HPgRTJKBnE_7openssl6c=
ipherNtB5_6Cipher12des_ede3_ecb+0x0):
undefined reference to `EVP_des_ede3_ecb'

aarch64-poky-linux/aarch64-poky-linux-ld:
libopenssl-3aad21d8f08654a9.rlib(openssl-3aad21d8f08654a9.openssl.4278bd4=
403a9a010-cgu.10.rcgu.o):
in function `&lt;openssl::cipher::Cipher&gt;::des_ede3_cfb64':

openssl.4278bd4403a9a010-cgu.10:(.text._RNvMs0_NtCs5HPgRTJKBnE_7openssl6c=
ipherNtB5_6Cipher14des_ede3_cfb64+0x0):
undefined reference to `EVP_des_ede3_cfb64'

Which seems fair, considering we just disabled the des functions.

Can you reproduce using plain oe-core?  I wonder if the problem you see i=
s specific to WR Linux?

Thanks,
Ross</pre>
    </blockquote>
    Hi Ross,<br>
    <br>
    Thanks for reviewing this. As you pointed out, <b>the error[E0765]:
      unterminated double quote string</b> issue is specific to WR
    Linux.<br>
    <br>
    However, the linker errors we observe in oe-core when setting
    DEPRECATED_CRYPTO_FLAGS:pn-openssl =3D &quot;no-des&quot; indicate a<=
br>
    potential issue that needs further investigation ?<br>
    <br>
    To address this, we submitted and backported the upstream Sequoia
    commit
<a class=3D"moz-txt-link-freetext" href=3D"https://gitlab.com/sequoia-pgp=
/sequoia/-/commit/fcc286417cdf9152e7df1a6152d31388a0ca9d24">https://gitla=
b.com/sequoia-pgp/sequoia/-/commit/fcc286417cdf9152e7df1a6152d31388a0ca9d=
24</a>
    ,<br>
    Fix this issue by checking OPENSSL_NO_DES before using the related
    functions in sequoia-openpgp and we pass --cfg
    osslconf=3D\&quot;OPENSSL_NO_DES\&quot; to RUSTFLAGS by<br>
    checking DEPRECATED_CRYPTO_FLAGS has no-des or not.<br>
    <br>
    This raises two questions regarding oe-core:<br>
    <br>
    Is this also a potential issue in plain oe-core?<br>
    <br>
    If rpm-sequoia is built against an OpenSSL configuration with DES
    disabled, would oe-core also need to backport the upstream change
    and explicitly pass<br>
    --cfg osslconf=3D&quot;OPENSSL_NO_DES&quot; to rustc?&nbsp;<br>
    <br>
    Could you confirm whether this configuration needs to be handled in
    oe-core ?<br>
    <br>
    Can the RUSTFLAGS quoting issue be fixed without using
    shlex.split()?<br>
    <br>
    When building with ptest enabled, we encounter:<br>
    <br>
    <i>&nbsp; &nbsp;error: unknown start of token<br>
      &nbsp; &nbsp;error[E0765]: unterminated double quote string</i><br>
    <br>
    The underlying issue appears to be that cargo_do_compile and
    do_compile_ptest_cargo handle RUSTFLAGS differently. The
    cargo_do_compile exports it<br>
    through the shell, whereas the do_compile_ptest_cargo sets the
    environment variable directly from Python. Consequently, the quoting
    required for the<br>
    cfg argument is not handled consistently.<br>
    <br>
    We are considering using CARGO_ENCODED_RUSTFLAGS instead:<br>
    <br>
    <i>python () {<br>
      &nbsp; &nbsp; if bb.utils.contains('DEPRECATED_CRYPTO_FLAGS', 'no-d=
es',
      True, False, d):<br>
      &nbsp; &nbsp; &nbsp; &nbsp; flags =3D (d.getVar('RUSTFLAGS') or '')=
.split() + [<br>
      &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; '--cfg', 'osslconf=3D&quo=
t;OPENSSL_NO_DES&quot;'<br>
      &nbsp; &nbsp; &nbsp; &nbsp; ]<br>
      &nbsp; &nbsp; &nbsp; &nbsp; d.setVar('CARGO_ENCODED_RUSTFLAGS', '\x=
1f'.join(flags))<br>
      &nbsp; &nbsp; &nbsp; &nbsp; d.setVarFlag('CARGO_ENCODED_RUSTFLAGS',=
 'export', '1')<br>
      }</i><br>
    <br>
    Cargo documents <a moz-do-not-send=3D"true" href=3D"https://doc.rust-=
lang.org/cargo/reference/environment-variables.html#:~:text=3Dsee%20CARGO=
_ENCODED_RUSTFLAGS.-,CARGO_ENCODED_RUSTFLAGS,-%E2%80%94%20A%20list%20of">=
CARGO_ENCODED_RUSTFLAGS</a>
    as accepting compiler arguments separated by the ASCII unit
    separator (\x1f), avoiding shell-dependent quoting.<br>
    This should allow the same arguments to be passed through both
    compile paths.<br>
    <br>
    Would this approach be preferable to using shlex.split() to work
    around the quoting issue? Alternatively, is there a more appropriate
    way to handle this<br>
    in the existing Cargo classes?<br>
    <br>
    I'd appreciate your thoughts on whether any corresponding change is
    needed in oe-core, and on the preferred way to handle the flags
    consistently across<br>
    both Cargo task paths.<br>
    <br>
    Regards,<br>
    Deepesh
    <blockquote type=3D"cite" cite=3D"mid:71E03368-5767-4B30-B483-9367712=
FDAEA@arm.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------Q28HDCa5X51x4opYTHl6M3Rn--

