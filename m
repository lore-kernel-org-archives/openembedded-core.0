Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F8F3CCF9F0
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 02:59:04 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.6524.1761879542454371776
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Oct 2025 19:59:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=hDBxaAwX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=33993df286=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59V2bQKF1347975
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 19:59:02 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=w8m4KXRznFyaQX83bQ2Lhcw1ufUaXMjq3Gk24rKpURI=; b=
	hDBxaAwXwL/J6rWCOS59U7+ToFujwXxszsXRgk9lIDPF1O5ZeCntyg04slZ5ZVcn
	BncdT1phkGRyzVzrFnnj9DA700cWjXQhnnjwFDV9xf6Lejlke6/T0ew6AKol1Y4n
	Cq4EPbPO51BUcLZPRo6Fwg762n0rjZzUyKqUHhUxgPiMUyfC7CFYPA1Zsv8DDvYG
	XgI90N5gZ0NggqLSZcss4KZvZGgS31Zi7TE4YFI9iRLfpi/aiB9p+qPIy7k/CoLB
	2TPp876e2nXV153D+fFUarcu5B7Ual7eEpcmxtxERBg7/W2lrfzVPLJ/1e0qT75b
	p1pfhFfYsX2rjQf6TEP4dQ==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010069.outbound.protection.outlook.com [52.101.46.69])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a4mg200n8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 30 Oct 2025 19:59:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xf0BEErASfzTrOn9rLUv1utaXX+9PrIv7bkttlnDnYkjVt0AXkew6xtNvEsvQvXCXWum4je/8TOwkrc7uUOiRh9w3ZQ2Lg99EO0C9IdBUsWkgLV9wboCNjESKJX5eW6b5Ru/ldK7VETIJnTiM6SdNEE/cOw+mVyk2Vz2OkaUqddVf5Pu3m8DZ9Rasaz9chOiK8dI7hVM2MuousV+mMf/Ll8SFOU0OEn+uUt7gvO5BORozAkjO94ioJJgAY3yrApj0QK3G2gx2CfCoYUSdaiIAtesgUauTcFnncUraTnTwGZla0EuG2itHawZSaiM6M3p44nJIImfSx70iBTFUg+Ntg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w8m4KXRznFyaQX83bQ2Lhcw1ufUaXMjq3Gk24rKpURI=;
 b=Qos6YkvPb7qxZrS53CQ2gX81qMcFOP5u7tq+rUf6xCXWT3HcdzRIjpoIG9Ky+wvhvwxxucQccmLg6Vx9EpIkKY9kP9887DP3WG9HAJGobcRtj9X7K7G917fq6+Q4q4OnVzznKzNA9xXAwZV/Qlwy3hQ+XNR4fdl9iwhy0juYbPu263/JsfgHVeqRtMfFQte60QEiRkxi+Fy7qEwKzyBVjt1xUcKT2+oYx+Uh/yhS44h2C7s41VuLynSLzQhgjZW2K1zbLERCcnYeE5j1JtZqLOdLp2tZaMIWBkuq389De24Myvp+RZ5LdCCRMwUDfh9g9SsjfOUeYSV7f+lNtpTiHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CH3PR11MB7723.namprd11.prod.outlook.com (2603:10b6:610:127::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Fri, 31 Oct
 2025 02:58:58 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 02:58:57 +0000
Message-ID: <8c6216e2-59fc-4807-a1ce-ae86c22a2bf2@windriver.com>
Date: Fri, 31 Oct 2025 10:58:54 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH V4 1/3] base-passwd: add clock group
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20251029045527.2865818-1-Qi.Chen@windriver.com>
 <CANNYZj-a7AVDtX4R4VDSfgmTOFd7XpxeCrbmnaskrw-QPigvrQ@mail.gmail.com>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <CANNYZj-a7AVDtX4R4VDSfgmTOFd7XpxeCrbmnaskrw-QPigvrQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP286CA0364.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::8) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CH3PR11MB7723:EE_
X-MS-Office365-Filtering-Correlation-Id: f9627a87-958a-4328-e0f9-08de18296f64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TlZENzJRekV6Q2F1c08rRDZFOFFweHFxNVhqS1JTUkNrMnFsZDcvYzA5Tms4?=
 =?utf-8?B?aEdHOUJpS0VjbmxTUjBFZm1teldMMDRmcEF3aFZUa3Evd3RzQisxVTJKVzd1?=
 =?utf-8?B?dHduNlJSakZDNHVOY2RXUnZqZkhjaExhRHNKZ0FpcHFlcHRyeVhtQnBGcTZQ?=
 =?utf-8?B?RVBCL253Z2ZZQmZZMUk1SmdvQ00yUzc4aW4xSTJTUzRlUTJtSEFod0l1a0xD?=
 =?utf-8?B?M2pZNGp4VmZuRTZhb0hTazdBK1U4ZUUwcDNKd1JSSENocE1CY3Z2TkZORHls?=
 =?utf-8?B?eFNhNkRLZDdvY1dER0FDblh0czdNTzA5OExLd01pbDRpZ0x0N1ZKL0xRNS9z?=
 =?utf-8?B?SVdUTVBDQkkxRHU0cERqd0NxdktMM2pCUmVrMnZxLzhkL3luNUU4cnVlVkJF?=
 =?utf-8?B?dmdoUXZKakNVS3VUWXZ1MUhJUEc2cVE2R2RFWGVWU2ZQMnNqM1lmOVJTSFF0?=
 =?utf-8?B?Qjk2M1FtM2tUODdGc3NWSXpZcjV2TWN1d2VGanRib09JWVlweTZSZmpaQXd0?=
 =?utf-8?B?YTdWend4QnlMdWRkeWpHVm1XNVA5ZHMxM3BHTmdVUVY5Yk5yaTVxVG84V1NW?=
 =?utf-8?B?cmNPYThXU21Nd2U4OWJkdkM3YUErZHF6TXdBeDFVZEhLdXpVcElkaUFJZkM0?=
 =?utf-8?B?QzVzRVBhRGt2UHBKQlJ1cmJFUGJ5cUdkUUN0dnIvamxubi83eVlzVWRSVE9S?=
 =?utf-8?B?RHN6Q1BJNHM2bnNCTC9OWXlCZnNPRG1XK1J1MTNEOXpNL0pqNVM0dnZHWWVS?=
 =?utf-8?B?VXNsNnI4bnYyM1NtSWJMS056L0NXWUxMMGxqZUpUL2VoQlBQRE0wSi9NSDAr?=
 =?utf-8?B?dzBleUZ3R0JJSDJQd1loeThKbVI1K085RS91S1JFbmxaTGpaR1Rlc0dvdVZa?=
 =?utf-8?B?bWtPWTJ6Uk9ZZVd4QzNseXVPTHVIWFAyTldyMjBic093bm5PNXUvM3hVTTZE?=
 =?utf-8?B?a1o5eUN0T1J3amRYSFQ4UFliWVlIbkJFN1lsbVdQRUJ4bENodkdpeHBqNDZB?=
 =?utf-8?B?RHZSaTk2UHVtMFdXb0hSK1lHcmFPVndpbzBheUpCcXRvNDBnMWxnbjlPVk5o?=
 =?utf-8?B?cVhHZnh6NTlhUVRnSmpPUSttbGJoU2lNYUdHaCtxL212MWdycUl1a3JPb1o5?=
 =?utf-8?B?WXlpVGNaVEJGQWZzZzRIdExtaFJKa043eW04aTBrYW5XUU1ycUZ0R2dCcVJu?=
 =?utf-8?B?RjdRMFREV21oalg3ZlhidlpvL0pneUpMYUtiSE1QNmRHNWJoV2FPdFNrV2Ex?=
 =?utf-8?B?NFdZdUt4dmVqelY1KzV0WlNvdkpJOGxmTEJSM21xQVQ5TERTcUdQdXI2dmla?=
 =?utf-8?B?Y3A4bFZ5eXhYMlRPcVNqRGx3ejBxTFAybUNaeEgxLzBYVitkQXZpSWltWTNW?=
 =?utf-8?B?WHJteGZGYmRvOHdLc21FMm5ucXQvcWRDOUFTd3A0c0hVNTBtTTNHNkU0MjZP?=
 =?utf-8?B?OVZpQmllNEx4MlNXYkIyWHh0Ymc5VnYzK09qQTIwUHlTSU4zNTE5enl1a3NU?=
 =?utf-8?B?eUpxZEIyeW43d1lnZUhQaWtOVmRtZ21KdGlzOWpWMGt3N1Rma0VBRlR2TWli?=
 =?utf-8?B?akE3NWhYSVE0TDR5citrT0N2TXhnUFh4M1F4OEZjRk9NWlhZUEVwbzlreW9r?=
 =?utf-8?B?R1dyRTU3ekx2UjBoMVMraENNeFJuQVdoNDNUYldVWi9kdXl0Z1dHeFZVbGh1?=
 =?utf-8?B?dDJSOXRCb05mZGtiQWVYV1c4bWljaVdXbkFaRU13S3ZaQTVJdzFqNkxNeXdB?=
 =?utf-8?B?ajRjb3hTOVlXMEJhbzBUcU16THdtbWtwaEJFc3JtbjFZVktXTXhDRTMrWU9v?=
 =?utf-8?B?ZWZaYUd3MEtvR01UNTBKM1ZYMTlTOGovZElNZTRTT2h3bHg0aTFKYTNLNzdh?=
 =?utf-8?B?YSszQUNaWDVCWVI4bVBDYm5CMGF2UllKQUtwalBld3dHTHlwZGQwZlhNTmM4?=
 =?utf-8?B?SGdjb1ptTkdWWlF5K0FYdFFLZHBDZ3Y4NkFKRDViaG5HMEloLzAyUnB2eVJQ?=
 =?utf-8?B?ZllscWV2RmNBPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SnVQQUgzbDZrdkNIdzhNdXhtalZhbkNpZWwvMWNiYy9jRkk2SkxTY1NwT2F2?=
 =?utf-8?B?am5nREZSMmZFTlBMMk1IUkRSdlNDZUNibG9PUmFBRlVEZGZnRllLQkMyazh4?=
 =?utf-8?B?bXBTM0hKbWdyUjA4V05obGRLU0VoN2ROSGJWdzYyYlVRb3FncTJ6QnZkNkNB?=
 =?utf-8?B?c0VQcnFicmdjQktwVFQrSjJPMHNydUJ2Z2hxV2F6L295dTVacTZwM3QraFJC?=
 =?utf-8?B?cjdaM3Y3M0R3Y0hXN0cyNTRGUEV5a1BjbXRsc1VFUVNkNHphQmI1Yld2bVNt?=
 =?utf-8?B?eUtUUHpJU0w1SUZBZTVlS3I4ZWlNOTZTQ2dBKzJrb2NlN0NVeGY2VFZpdUE2?=
 =?utf-8?B?VlRkYWNpbldQMjdQNldRN2xSU0dGamF2MXhDQkxQeUNZV0tINndwZHZHTVBh?=
 =?utf-8?B?a09UdWFpWGRCTzFXWmM4SEZEeFhoL1JtTldVUUJISnl0ZUUxZXFlOUErS1hH?=
 =?utf-8?B?ODI2TitJT1ZLSWFsMytQVHlJdzZIMXlTUllJbWt1SWRENmhFZzA5ektoM0Zx?=
 =?utf-8?B?SGZKYklrZ29iOFlDVVlaMzNwdUQ4cENmclFRNU9nUVBkWFUxRm9OMUljYmhO?=
 =?utf-8?B?dzZ5dDZHTm1kRy9MNVkyMG93ZDNGSzRGMGtuaC9wSWtVT1NRYkdWeDFvUmVw?=
 =?utf-8?B?RSt5Y3lzOEZkRCtJM3N2WjVqckhLankwVUswRWUxbE5Yc1hXd0xiOEVxRzRH?=
 =?utf-8?B?bnBhTjRVRlNJZGRrb0JsdVlMbE9yTkR5ak1sZ1VsT3MyYWU1Rkc5SElMUlZF?=
 =?utf-8?B?U2xwQ0xEcHhNVHFOVkl3YmsxRjVqOVBVMHVaaFJCQURCUktRME8xbmprTlpN?=
 =?utf-8?B?MlB6czhrcVMrNTlWZ0xlTlBzcklBRDJTb2RBYTJwS2Q5MURFVnBjVm90aEVC?=
 =?utf-8?B?SkQ5SmQ2OWsrM3lRa0g3U0dHcGxENzdMUFVXTTdiZ0xTZHRlZFBsaWE0YlhS?=
 =?utf-8?B?alZmZmk4Tnh6aFFGNUlDYm05aDllTStuL29ydUltTVlLY3AwbTBhSDJrUk56?=
 =?utf-8?B?clRGSFZZVVgxcmJ3ZldwLzdYV2t3NEJ5SVRtQzJKWVpxWFdFNTVGNEZpYVJE?=
 =?utf-8?B?blBUSFdIbVdMSE80enZaazV1aHVYaFM5cHFvOEVMMnVpampWTVRLQVlQNzE3?=
 =?utf-8?B?U3kvb0hMQ25Ta29DY3Q4L1FxV2gvYkhKcmQzdDVqQ011UmhSMmlnUk4wZkp2?=
 =?utf-8?B?QXdjeTc0SCtvQ0FMektLZW1ZWFE1WXhLSlYySzZwbTFSR3JLMFpjM2MwUUlJ?=
 =?utf-8?B?Sm9KeHE5bUMzWlVWeEFnMkI0UWNtbkt5bUhFQm5iY3prL2RlcWhiZjBjUC8r?=
 =?utf-8?B?SGlydlBLL2hvbEtxY1FFaytocGlTempZc2E3MEt2UkJwdFRTUnhuWStXSGkr?=
 =?utf-8?B?TjJvdHl0MUppUjV5V1gxMjl1WHlFSHNjaEFKMGd4a2xuNXhMMG95QThiQ0NK?=
 =?utf-8?B?djJWSEpaSnhBTmtLSjVNWDFsOHI4MXhLeUQ2Nm14aDN2VU9GcFBiTWFJWHZW?=
 =?utf-8?B?K2FTL2s4aWdHZFNwLzFaWmVLVmNOLzNRdmp2UW4vMzh3QkZaRlZTNmJ1V1BG?=
 =?utf-8?B?UC9YenlCTVRhMHY4Ry9FaC9KV21pMjVJckdweFVzaGpITDdpRWo0cUZ2WUMv?=
 =?utf-8?B?MzhxTmp3YlRLZ2g1dG51OU5tT09RdmpJTDRJRHA3TzNTM0NEYVp0QUgwN1Zy?=
 =?utf-8?B?dzY3M1pEcTQraUZYeTg3ZlBSS3dGdW1pMm16dzJMdUprLzBVRDArbVhINHNi?=
 =?utf-8?B?TUVUVlJtSms5TTlvN0lkTC9ZZ29nYktVYzlYRE1EdXFXdWlacFpOLyszeitv?=
 =?utf-8?B?SjZjcVZBYUxjM1VORUUyS0tqaks4QWJpUXQ5eVZqK05iUVJVdENFaSs4TTMv?=
 =?utf-8?B?T1BlZWtmVjJiNWR0eVhSUFBhSFFuU1NoT1VkTjlFM1BTT09mNEhtbEtBOFlQ?=
 =?utf-8?B?Rk1DbWwzM2F5MXJ2UzYxRGczZjJ6Ulo0dFZtb2svSGpVOUMvbkpVTnlxZ3Rv?=
 =?utf-8?B?YXIwRzRaeW8zMkFOYVJVVTBqSm01WFoyU2NvVGJDYmpWZkRqd3RjQkVUS0do?=
 =?utf-8?B?a3l6L093YjJmMXcyaFgrakp6YmJXNndxNm9ubjBNNDJLMmtkQk1TaHp5bzJp?=
 =?utf-8?Q?3EDm4nCP1Vdoe7ckU50SdN48r?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9627a87-958a-4328-e0f9-08de18296f64
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 02:58:57.9174
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SsWddrjAu8fJGm79cSVWUkinehEC8ReU0aktNLEDzt5yhZ8vIVJknykhin+KZhIlsSA8w27lw6O7kS7GkYGjQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7723
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDAyNSBTYWx0ZWRfX/AM9mPQypwYz
 RKMAJBOZzUs+af0RbfHTcnaCfhkRSvVqZ/2UZVBhUYGvcVb4k+/HboEDZIJm0wZLEMT6YucpczH
 QOouYPgLcbATLlyXJVFc1Yps+t6zZPtFC9jZrzJ3SkAgsYt2HCp/kTlwrT8bCfhkZPVxFne6r1d
 FcqYuXtpsfZl75esA6OAd1n60E2FJZu+Dlewb/1pvCQVLJ4wGWgsS3DOB/XiSfMtmZeJ7VCt+LM
 9WWYGznGppIxSS8/jCrDND3t/YSaYfhA9FtpDU9jEpuQrdWbZARA3IOHnIoEte7GAYOBj2PAaT/
 BstMfz4tZD/rHQpBS0tDZPItX1WHOeg7ikCJIjXdjv42bSMCqR2LOFDsECzlOrWlF3yfpiYeYHc
 R0Rk7GOoSmb4fPb6SxBX/Y5yOo8ICg==
X-Authority-Analysis: v=2.4 cv=JemxbEKV c=1 sm=1 tr=0 ts=690425f5 cx=c_pps
 a=keqI8JQlqSRTfAJNayiRog==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=xNf9USuDAAAA:8 a=Q4-j1AaZAAAA:8
 a=uecOyxNDtq_ZWWaganUA:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: 3cUq_2PoWRU7DoYb47fYiTVhgNlZH5of
X-Proofpoint-GUID: EmQ5uUCrE3t2hq4c8tMtMXWfftu9hy7a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_08,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310025
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Oct 2025 02:59:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225522

On 10/29/25 18:50, Alexander Kanavin wrote:
> On Wed, 29 Oct 2025 at 05:55, Chen Qi via lists.openembedded.org
> <Qi.Chen=windriver.com@lists.openembedded.org> wrote:
>> +Subject: [PATCH] Add clock group
>> +
>> +The clock group is needed to "to enable applications like linuxptp
>> +to open clocks without root privileges". See the link below:
>> +https://github.com/systemd/systemd/commit/af96ccfc24bc4803078a46b4ef2cdeb5decdfbcd
>> +
>> +Note that this group is needed as long as people use udev from
>> +systemd because 50-udev-default.rules needs it. See the above
>> +commit.
>> +
>> +Upstream-Status: Inappropriate [oe specific]
>> +[
>> +  MR: https://salsa.debian.org/debian/base-passwd/-/merge_requests/17
>> +  It was rejected by upstream. See details in MR's comments.
>> +]
> Thanks for engaging with upstream. The upstream-status should be
> Denied [link] in this case.
>
> Which brings the point that (I think?) has already been made: as this
> group is systemd-specific, it should probably be handled in that
> recipe.
>
> Alex

Hi Alex,

Debian is using sysusers to handle common groups. You can see that sgx 
and kvm groups are also handled in this way: 
https://salsa.debian.org/systemd-team/systemd/-/commit/7aab0da57c0df18bf552aae58076500081f93e01

But in Yocto, we are not relying on sysusers. So we have to use 
base-passwd. sgx and kvm are also added to base-passwd via oe-specific 
patches.

I'll correct the Upstream-Status and send out V5.

Regards,
Qi


