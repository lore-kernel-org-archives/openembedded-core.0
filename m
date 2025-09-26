Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD4BACAC5B9
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 09:59:40 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.13722.1758880771237385271
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Sep 2025 02:59:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=lV7xYBqU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1364670208=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58Q59u8l1135257
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Sep 2025 09:59:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=ZcDa2mglsDckOr3g9vsfIVXdChkM/IxOMirssHg5bSM=; b=
	lV7xYBqUteJPIWe6at/4r9TtX2EtJq1KDJmBMCGvZEzLX/4ye8EOvikp60bzE2xT
	7yO6h12xG5rRDUqg11nsrcXM7TndjWJI+++IidQTgEdrJEQle9T/wGDcTPXm881o
	9zInWbuQPiP57esJQ8K2BCRY/c2/eUvE3y8lY5rpIKrgS+MOKQiWZYQbRlB890S9
	EuRxNfmyI6/7OXOrC8mV6ytpxQP3nB2uiYorfUEZVQx27u6U7+RHM3zB63d9iS7l
	koVKT4f67pk8V+9oIGVvBq3TMXF/PH3JRV4iEt5SmuRKklPmLxqEpI0M7ex2WYcx
	LuL3ZRNiw/qW29BuWK43cQ==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012014.outbound.protection.outlook.com [40.93.195.14])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49dbsh8n0a-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 26 Sep 2025 09:59:29 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t+kCtkLIbok9Hn7P/lE7oTfkweqx6to9tfJ9oe4QEskAOpGHkjuLSQpBSyDQjFw0qwQ0TfYI6mYQgGMPyuD5WqZRCLWHWwAOMXiBLzrGi4vCikw35iodrONGXjB1ll44Cx5tkU9D2ufmGl1It2r2G2+xsPwgeN0QySgqYFcVE2rGuhkSsDz+UCSsKwdWWbLwomcet83G81GSaCB0vQ9sEZhZjy5xkMpsOMxOPd87TzYX0LkQ31wt1oxl3wuMx8ws5yMI1QoGUyaPc35OpoxGuL+2A6dcmC0XljXFVTK8ouKcqck5ObyiRQ/qGqpdFWl+2rKGG/9y0ghxltSDBuFNzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZcDa2mglsDckOr3g9vsfIVXdChkM/IxOMirssHg5bSM=;
 b=LOddexHlW8jEkM+s8naO5SHjrgdIO9PbSEmCcNv4/OR9zdMGijfj7+9czVXHHD4c0yqlZz/+TA1ZAo43N9sXbUrdel3J/WQrkTSGYk1MxON58zjr70YE7cnROI2K2uNuaYdgOQmJSDk9PIRFFe4/7UHpGGO1l03rbWRZuUrbBiTbvO6fljyPzeyXxvEPeOtr61a1KrIkMpvfWmtiqOIjbC/776LlXw2PHs0gEFwHPHM6sPnsYs8JlkjDfdCsL/H57q6J/nPr98MFylf2bTTCjBjXaM1WGrFE2zKbgy6TNSlzIVFoTBMvypAnPQFhhD2yo6h5kjH7UVMl3J6MP1TaTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by SA1PR11MB5948.namprd11.prod.outlook.com (2603:10b6:806:23c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Fri, 26 Sep
 2025 09:59:28 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%5]) with mapi id 15.20.9160.008; Fri, 26 Sep 2025
 09:59:28 +0000
Message-ID: <ffcbdf27-539f-42d2-9baa-db2313d0fd36@windriver.com>
Date: Fri, 26 Sep 2025 15:29:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] rust: Drop rust-llvm use clang instead
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com
References: <20250926071158.3439500-1-Deepesh.Varatharajan@windriver.com>
 <CANNYZj-=rkw_rpYXK9FA5wQDbXRXthUk2y_LWRs4Mym+_em6iw@mail.gmail.com>
 <80e911a6-ff3e-4f2e-ac0d-6f6043d43670@windriver.com>
 <CANNYZj_E99VW1o5pSJtPAmU_mJXK5HoWvo6Ns1zsN5s5uOcqwQ@mail.gmail.com>
Content-Language: en-US
From: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
In-Reply-To: <CANNYZj_E99VW1o5pSJtPAmU_mJXK5HoWvo6Ns1zsN5s5uOcqwQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: MA5P287CA0028.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:17a::12) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|SA1PR11MB5948:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a504f58-a8c6-454d-67a3-08ddfce3616c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|10070799003|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SGE0OCsyVWR5Wk9sWjRRanJuVTdFaXcvYnhKMUtGRWZjM2dEeCt0em1ITmFY?=
 =?utf-8?B?dG93N2wydFlKc1VpMDEwQWxDTVFHQ3M3WUJvNys5aVc1YmdxUnNoaXBwZWEx?=
 =?utf-8?B?bEU1NHB2ZzdPZDRWVHdJS3ZnRFlGTkxGNnR4cXB3UktsZ3dRTzdnd3dDUmxh?=
 =?utf-8?B?QUtpUkw0d2o5NHdqbDVycEpKTnRpWDdrK0pya3hmdGdzU1pJM01ObnFQZ09F?=
 =?utf-8?B?VVI4NGxHVnE0NG55ZGZhR0lwOUg2YzliQnBIMytObnRtcGJXMWFtY3I2L2NI?=
 =?utf-8?B?VVpxelYxZldScTU4a1NoTTZUSlpLOHViMVFnTWJUSTB3eSs4b2JySGlQNWEw?=
 =?utf-8?B?MnRGRkpSMXl6VXpVdHhsVnZWWmZsTWxwWTg2SFNMQ3NkcStJU09mdS9qbWFO?=
 =?utf-8?B?bGh4S2lQbFNRakRpMmx4OFczVlpWb21takVueGtEbTNlTDg5ZmZHdW1xTDdU?=
 =?utf-8?B?bm9qZ1hMck5sVnZqWDBManRpck9vVEVzVzdmQjF1K045bTFTcUZlaWJoZ29o?=
 =?utf-8?B?dGpFL0pCTDZOWHdsOG9XbWFsckZ1YkVwRHZlQ1JDdlloS2pnQi9hWmJwbVZO?=
 =?utf-8?B?RFRkdnNvRCt5dW12T3dCZXF2dFhYSnovek40djI5azZMTFpQcWxkbjM1QWto?=
 =?utf-8?B?azZOdnBUY3lDM0hUbS9sa0ZKN2dMblE3S0Q2QUFJaHlId1Ntb2dIZHBleEtY?=
 =?utf-8?B?L0k5UE5sK01uTGlFVjhxc1JvQzV2MjlnbjROUWxRbGVlQzF5djBtWGYxMUN1?=
 =?utf-8?B?cmRhRUhDSzFoTk9HMElLUXlpcVhnQWJDeXJobE5KcEZYV240K21OWlQ4eTZm?=
 =?utf-8?B?MXBOWWxEWXQ4aWhRMnd2alJ1ZitBUUFtdXVjOHR6VXA0aWlJZllCbmdRdmtk?=
 =?utf-8?B?QXVUejRlSks0L0M3czAzUjRiZ2lnTlNxckNzcjVtc0s0TlNYQU5FV210b1Jn?=
 =?utf-8?B?RUdvZjNWelgrV0VrUUM4S25UZDZEY1l2OTR3VWxjSnNXTDdWVjhlZm16eTUr?=
 =?utf-8?B?SDhNNi9YMzVCMzZpc1JnYnFrbFZ6Tjd5eXZnZkpjeVZjZSt0MUpzaGRERVU3?=
 =?utf-8?B?T3p1WU9YcEpsMkFOV282ZTU2VDdkZi9kMHgxNHk0Uk1aT0VJR1lJMW9oeUFG?=
 =?utf-8?B?VDZPSkhiYStld3dWSWZVU25OeDhJZEU5WFlpbTE1dHpqVVFvNzdmb2t0MG5v?=
 =?utf-8?B?amlsS0poMTFLZzJ4Z3FON1NqK3drS2JQOHEyM21nMHprNHlVT3lsd2hvY3F4?=
 =?utf-8?B?eStOWGFEaHdTeXIxdE10VjhoQ2tqNnhzZ2UvbXJKUFBYdkVaVmVDTmVXRjI4?=
 =?utf-8?B?ekQyVDdKNzYwTktrdWJ5OWM2QW1vUXdlUHpiQnVyZXU2OXl5MXNOeDRkK1JG?=
 =?utf-8?B?a2Z6RjlIYzdDUjdTN0VPa1g4dmloNEV0eFdZU2kycFQxaEd3Qm9hVjBPdGh1?=
 =?utf-8?B?aFlxTlVIcUVlTzUvdlpNc0Qvb01yZ2FTTFUzUDJOYndPRG0ybmhYTUY4VFow?=
 =?utf-8?B?NWlaL1NkNFFGNkU4eUNBUGFDc1FMUUhiWGJQbTFQUEtVN016RndBWStUSnIv?=
 =?utf-8?B?emRFNlJ5Y1RkbUtzeFRHYkdQMFJ4Nk1OaU8vajZsWlpLVktuWDl6K1YxWE9W?=
 =?utf-8?B?OFY2SG0zOG9oS2JaYW5yWXFUbysrQjRUcWRtRHlhUm5oMTBVQ3F0Zk1xZEZ3?=
 =?utf-8?B?ckhET2ZXbDg3MzVGYjdiS2tNL1l5dkV3dEMrRXdRUStaR25RNm15d0dGbWJQ?=
 =?utf-8?B?NmFYbXFwdGsxUFdPM2tYOXRlVitaZlpQdWNJRTE2b0xObnd2R1JWVXBCYSto?=
 =?utf-8?B?MWE2bXhrMTZndk5HOFlpMVZycytvZXc0T1FidC83STRGNHdzUE95b0dYd0xF?=
 =?utf-8?B?ZDBJNFJ0YVZrWXVuRmdCZitKUXM1K1NoNTlHREdIeWQwK0FGaVFsRDlMeUZI?=
 =?utf-8?Q?9mZXIYaZZvy4v45B7Cr0xqOU1is+N2f+?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Zi82VW5SemNrMGV0TE5oUUNXY3VidGsxQnhWTnlrMHl1MGt0ZDdpNi8wVHVX?=
 =?utf-8?B?R052NWFuYTdFRVgrNnVvazVnTG4wLzlJdVltS0pvdTMrQm9YU1U3NnV0Zml4?=
 =?utf-8?B?MXdaRXpzZStxY3p4ckpyUlFXVDlTQnJER1BERFBaWmpGRjZkVkkwV002VW14?=
 =?utf-8?B?ek5nMTF0REVWc0djSVd0QzZVYmd5SGNwa1BIMHhLN0dnYmNlZ0hvVDM3Z2l0?=
 =?utf-8?B?Tm9lRXR1Y3pZcUlVMGRMN2xwbHFBUTU3N0dmb213OEJmL1JPYTIzSzlocXNZ?=
 =?utf-8?B?ZG9wSTFWQ1kzdHljV2ppT3ZhSFVkQW9iejR2Q1IzWFBKUC9oVCtqWkRnVHp1?=
 =?utf-8?B?YlZzMExyTHYzZGxZNmFCUHpaU3JjV3plaGJJTElNV01saDYyWW5PQWJkOVNs?=
 =?utf-8?B?bk56MVhpalpUZmUyWEdMMCtUNzd3Y0x2WmFvWWFmNnBvUWVFMHk3TkltM0h4?=
 =?utf-8?B?ejVRMEh4NnIyeG5qUGpOTWJZdTZZaUtmZWd1azl1UVgzUmxKcEtHVGxFVW9U?=
 =?utf-8?B?NUYzMnkwWk1HTllWam5NdUU1b093RmUycDNkR3NvTlN3dVFpVFZzUms0UjBv?=
 =?utf-8?B?WndpZkFwYnhKdlh1SSt3cEhwMU14N01lUWNMU1FwQlRiemc1bWNEOGc3M0tQ?=
 =?utf-8?B?SGZRc1VtQVZHU3NzWkF4MUFHVHQyVDExSjhLSUtQenBuSkdnUzhuQVAxOE1K?=
 =?utf-8?B?WVAvU29HN2FzWGJRZGoreXYxS0xDYTZRcUM2WXQwRVVBWEVnQjNyYmJxNGpD?=
 =?utf-8?B?cUljOEQwMzk4bVpETHJnZ3k5dGsza1VpaXQ4eUlmTDNYTnFwejBtU3RLUDll?=
 =?utf-8?B?aHpGdTZXK2JTdzNFbCtJT0wwNzhMeGNLcHFSaWkxbmptRGFJWGlTc2Nyemla?=
 =?utf-8?B?ZmIzelhySFFKZEdqRzhwVTR4S1EwQXYyRjQwMWh5RTdDQmtYT0M3VStXTkRu?=
 =?utf-8?B?QVN5bVFaNDFnc0R4VHVQcnVhcFV2ZHh4b3l0aHVCYlhHS0IyK09nVzdNS21l?=
 =?utf-8?B?ODZyeTlURzBoVSt0cVlic2tyZnNEaUJtWi81ditISjdOWDlkRDc0UnRKK05Q?=
 =?utf-8?B?SWpINzgvM1lIYVp3SmhEejdaLzN2UEZOSVg1V216djdkK2N2L1MxQ1QrT0Rh?=
 =?utf-8?B?S0YzRU95dXU0STJDZnE2MUwyWjJhcEIvTjFzSDN6V0NJcGw3SEw0UTRtR2Fr?=
 =?utf-8?B?ZTM1M3I1Q28vMUxyeElpVnNmSEJ4bVFRc3BVdmJYVmVjM1VKak9FRGZMRy9i?=
 =?utf-8?B?V3dpMFpiRHZ4eWY2STZhZ0pGR3JuY0FaRndSVEJpQkVwYUE3WGQ4WnlZNGNK?=
 =?utf-8?B?RlRtK3kwN0RURWtQcTkzbzdYdWZtSDJuUTdTSVV1REJhck5xRjNJZlp1a2Vs?=
 =?utf-8?B?NzFLRUVwSDFIZ1FVREVER1ZqWDZaUCthb3psR3Y0VHBWSVJYN29KY2lGbDRP?=
 =?utf-8?B?RFhWVUlydkN3Tkd1M1BxRWNFdTdCUzVML28wUTdkUTB3ekpKd3VUVm5Zekx2?=
 =?utf-8?B?K1ZFMG5udGVUT0NvSnpwY3JacVgzNHNnUytsQk80eFBXeDJSVm9ReTZsNm1Z?=
 =?utf-8?B?NXRtTmVJYXJlcmtwV0MrQndZZTdQSGIxQzVKRmJ5bFlKNEIyUlhOWkNxMnVr?=
 =?utf-8?B?R0FoUHZqbHlrNG54MmpYemdVbHFtT2hZdndoSjAyT1o4YVNOZ08wa2lYUzBL?=
 =?utf-8?B?eVVQa3ZSUkRvQnpkN0ZJaE9XVkNJNUxGZ0tlSExDOGViRkRNSkR4OVR6Nk03?=
 =?utf-8?B?VlV3bnRhbFovRE94QUIvQXF5UGpBY1g4djROWkQvbjNCYXVuVmxSUDBrRGJV?=
 =?utf-8?B?aWV6NHFNZXcyM2RRR1hxalMxMGlvaTdzKy9YYURBendqSHhLTUQxd3RrUnVa?=
 =?utf-8?B?UGRaTzdVeXJPeFRDMGE3VFBHSEJpMHZad1dkcC9LTThnZ0NrTjAwZmtQZWhu?=
 =?utf-8?B?MWRtVnVIS1Zobml2R2JKbGJRdlBsRzM3eGtMRUJLdkJPVjZ2d2xIR3R3Y0Jz?=
 =?utf-8?B?YnJnY1h0aEY0T1BHK0V3SlMzVGhIS2NSYUd2ZHBkM3FURnJGUzl2SXA1TU1j?=
 =?utf-8?B?eDJJczJmZUd1YTI5bTlTQm45cElyTXVXL3VxZ0dBQTY5L0FHRHk5MkxTN3M1?=
 =?utf-8?B?OVR4OEltQVBkYlpLc1J0V2dWcktwaGRVOEFPVmtzU1dZRUlzNktWS1B0MytG?=
 =?utf-8?B?VEdVdFBkOStjTS9kTnFaMFBUNG5lNGI2bkF6aFowc2pXdHZ3YUx6TGpLSW5w?=
 =?utf-8?Q?oJgZ/s7fCx/35wjOOhpqHmfgsZeVTprzAQCatGgSiQ=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a504f58-a8c6-454d-67a3-08ddfce3616c
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 09:59:28.2489
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: chzd/0GeRz8PnwBoS437Nh1gKMl5fbAtOJmil/MEIYFn4VMjVSNI0fDANffi44A8B03ZoxDnmKl2yO0dmCpCFpYhLFjTV01sDwJHSisViukliHLf0SCLKlBdv8XR0nxp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5948
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI2MDA5MSBTYWx0ZWRfX0QNL7zuKiasl
 FpnflYrElwkpkGTjIeCQL+6huZnK8OTAcmwpkNxGiz9ARj0TibRhGSuoT2XMXJcceXRB9Tyhid3
 2bT0cBtq5fdZmfwqL6XeNraLLz6yhFstjZzUdSWsh7bAwo5KGkob+UHEZpgcOo7g6PUIgt3Ir2f
 ayRopG8w6KztrRyyXcllGRwpZeB0CV45kchiyimg5fuUBnME6IY5+h+vIWgH2rUT3Upmxq0lxn0
 kybF5KfFWolCdBRPrky+jNL6gTvqPYncoujtz0GQyAC6hcKPIdcYNsNCwW7LQafro+2qTFZSTcX
 rjliuu2TlcKUp0avI6q024f19dIYNtw8tyyROoP9vfdA3VuO+5YMxsve9xEReph+PZ76ySPqcOa
 s/7bqKKDmos92Dhy6oO2nOpJKbbGTA==
X-Proofpoint-ORIG-GUID: 0I0kaQm1WIdUyNwbyjG9temuTNITmjuH
X-Proofpoint-GUID: oKeGrzwlFcZ0ucBenYdHv59hNOjnlSuF
X-Authority-Analysis: v=2.4 cv=U4WfzOru c=1 sm=1 tr=0 ts=68d66402 cx=c_pps
 a=C5q/T6pJLpFJxMBEEzTjbA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=t7CeM3EgAAAA:8
 a=dAaDURE6MltIYV8_kNoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_02,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0
 impostorscore=0 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2509150000
 definitions=main-2509260091
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 58Q59u8l1135257
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Sep 2025 09:59:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224069


On 26-09-2025 14:46, Alexander Kanavin wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Fri, 26 Sept 2025 at 11:03, Deepesh Varatharajan
> <deepesh.varatharajan@windriver.com> wrote:
>
>> I=E2=80=99ve also rebased these changes on top of Ross=E2=80=99s poky-=
contrib branch that splits LLVM from Clang. The rebase went smoothly, and=
 the build completed successfully without
>> requiring major changes, the only adjustment needed was to depend on l=
lvm recipe instead of clang. Given this, would it be appropriate to send =
a v2 now ? or should I wait till Ross's patch to merge first ?
> Don't wait. You can include a comment about what needs to be done
> if/when llvm is split.
Updated and sent a V2.

Regards,
Deepesh
>
> Alex

