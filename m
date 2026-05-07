Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 826D7CD3427
	for <webhook@archiver.kernel.org>; Thu,  7 May 2026 05:12:02 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5473.1778130719441604305
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 May 2026 22:11:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=IrzWlPxJ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=95877633c6=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6474QtL33726071
	for <openembedded-core@lists.openembedded.org>; Wed, 6 May 2026 22:11:59 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=lZpNn142RfWvBNjICtYyfVMZ/1IVwOFJw1wFgA9Pg/Y=; b=
	IrzWlPxJ0nqicOHjy1Co/3ocqnD0+OSvhJXTzUdyx6vNxToKb5T1hFsJ9X5K7a34
	2VGGZyDWQFo8DRZeDTy7gxutObWXnKpust00/1Wf1AX07igDApjdW/1NgFzPcvCY
	oDvJxXzOXO9t7af6d1YbsW/iXpzCwOk3waAq96pjJy7/9t1O0ylnFp7MoujAJOpM
	xe6OfnwE1AGJAIUdM4uQ6iJrS2O5It+PnPXa9Mmo+Gurq5GfLsEpS+NGTYOOE/Sp
	j2Hdh1Neogp2GIxrzMtTd/eVTc+RDTLSOaA/3AuPeiQWR5dH/RErW7vchkr5WCdH
	Jt33uGi8fDjfQ4AeevvL4A==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010037.outbound.protection.outlook.com [52.101.85.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dwgsddr29-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 06 May 2026 22:11:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UYAmCroXV8CTCPCsuxxuLXZABWZ1oPpRROFEaIMePe30Mhg51mA5rLZsKrSN4UZth2kVIvPB5fFW1G8oZxXT/YVYOyPbfU+HrR8IeBi3Hme/G/GlH427e8o2XunazrEMaUJQ8d+8dwBa8qAd3Hy5+MST8B4eSE9E2Fc5+w+txCXMlBx77de0jHP9jlUQXLPOtd7AIiICTPuGYO3Ti0lWIV1sK1GJXIYM6Las7+/M00iV11fqzUx9cxbwuLRM7zW1Ivl3HNFoETh+gIyQKWiphJg1a/ONA7evTGgI5nOvUWWA2gEIyqaCp6zMuHbftH6rAvxJiR3LhiAyiDJatXfSLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lZpNn142RfWvBNjICtYyfVMZ/1IVwOFJw1wFgA9Pg/Y=;
 b=bKrfQAFX1jG5aDVyNyh+3r+0La6R7mW0ZE6WrucdejUPaoiv+BiHeeN1DsUdctRuiMeGIWDymU/E8wHjxKWpEnT8gqqtBkmcsRzZ685Yeu4JAQj0mioP6O62mGxyzp7dRwNSmgoxf+uUt5you0kw5kZP+nMPrVcQVnseg7SosgnUnJiTe5XABp9+ZW52fImsbvX+oAcgMll/UbrZzgbqd7tHC4QlaeLzChQx7p1q3dOdVeNNulbtMgvag/yY3EQOxyOmiAQJaqMqCielznWzugQZZ5MKpujKhsYn8n5PNVqSyItjc2FEujmtoaTnxGbt/wPyv7hmpKkzy+P9yd5u3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by MW4PR11MB5774.namprd11.prod.outlook.com (2603:10b6:303:182::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 05:11:56 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9891.008; Thu, 7 May 2026
 05:11:55 +0000
Message-ID: <9a29beca-9ec6-4bc3-bff8-dc078eb277f1@windriver.com>
Date: Thu, 7 May 2026 13:11:49 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [V3][PATCH] gstreamer1.0-plugins-bad: add
 ANY_OF_DISTRO_FEATURES
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <18A61B7E9B9AB538.1398202@lists.openembedded.org>
 <20260415021611.525515-1-changqing.li@windriver.com>
 <EA0FD39A-16BC-4AFD-B20C-165881302EFD@arm.com>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <EA0FD39A-16BC-4AFD-B20C-165881302EFD@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SI1PR02CA0027.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::18) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|MW4PR11MB5774:EE_
X-MS-Office365-Filtering-Correlation-Id: 42f5a894-a210-4ee4-363d-08deabf72839
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	AgSQob61Xp3diFHroWv9yDWc1Co1YaORIsNWjF6ifuF7bXa8J2fpkjFUd3s3uIAOP5hyC3GTlw8IL8LvcQg43SC0EoS134yjgBEDc/1IGL1i5z8Ic9I67Umhjp8mo28IwhtcHUlHObWsUchwrYFB/hvmdpUP18d2GIJxL6QM/g0ml1OBFTS98Sh+9vBuY9AQHobedmspAlc+ebZ/KhgGxHJ6dIcpn0TTy3I7AD80XD/1Mv1rdHG4b2YzD8U7pZiZF6Cg/UaPIKPTC/RB5x753/fDgw+Zt3epqhzMYPQt1x4ljEP/I8i6y+Q96qnpTuVfiAFRSNwI10zvqpuqqt19k221EyyN4mbzw+XxJslY/WdOcHyBe9FZncjvSsxv/I5IZ7BzaUO4x8ZAqdkr5oiBG5z7YeGivdUeo6qFCvgIeZKYRkBmAeQSaqOA4n3EwO0kvGGrCqKq/VodbZwGMC4lUD5Pwz37rENDs3rPxd5Z/chS86ImIha5MogoS0n0N9Euvbdks5wRr+fzR709LBk+6VHvYuy2CZMCIFGJi6V+Qv6QjGPahV9BQEqVkEadIq2PJNmkSIrOve9LdkeN6oqWFpShEeeV+QjhM4Xn65jlOe/0SRQ6h47tbZ0wRJLjiziaZVAoRsDOR968jacCxjPFie34J9oAUudyfI8GtaALT7xxh67Kw555owcNkW4c25db
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?b2NyWDRjcTdpVkNIRFJNYjNlZk55Ym15eVh2d3c1YzdUZnBvdGFveDFkNG9u?=
 =?utf-8?B?LzdSR1Y0NnFUdDgzZWRXY01IbEdNd2JHMDFBYTFKdzk2NUFocVBFcXRxUXV3?=
 =?utf-8?B?Q3phdWJwT1hFa2xDalNFL0hPZkUrVjNnWVlQVGZQOG9MbEhOSFhQeUQwWGtX?=
 =?utf-8?B?b1d3bHhqUmorb3ZjZ0VTTEFBQ2Nka200WS9pY0xQYnk4K21QQjNnYVlQa3Z1?=
 =?utf-8?B?TGJ0QzVLdDU0T0hxUkoxWEV3aVdLOWpQb2pSWnp4dC9DUnMxNmo3TU9JK1dI?=
 =?utf-8?B?KytIMVBRRUdwWWxoTUJYTEJzWFVvNVZvVFFzTWdpVzlxQTJ0ZlV1QlNDUmV4?=
 =?utf-8?B?UkNhaUM3MlJ1VlhRR1pqTzhxRUJ6UWNaanR1VUVDVm51YU1JUGJvQnphNWtV?=
 =?utf-8?B?WlRSNzdBNWZJUWZnK2FxOFZXTU10eDB1Tm1TQlFaTzFIZFVaWFpLYmxwTHdl?=
 =?utf-8?B?WVNGbS9tVGsyaDBVenhHL3ZUMEYxcTZhKzJsdCtMT0dyVGpzMXJSSS9ZZ1lP?=
 =?utf-8?B?Ri9LT0pjMThHZnF4N3ZKN3p1VnBRYTF4U1NXMFE3Nno3bFE1U1ZpRVVrT2hh?=
 =?utf-8?B?djRFdGtZWWZUR2NPUGxJK3NVMk0vSS9rZjZocDNVeWwvVXNsR2NNNG40QVZ4?=
 =?utf-8?B?NDFiTTZkSlBmZFVhTE9KNFFzVXZ5YWh5NWpwcEZ2eEY1aDJwTVV4WCtpYktT?=
 =?utf-8?B?emtFVEZzS0E1Y09kSlVoeVl6SFBWWDIwU3JqeUxXVStpRlR6dlFHYVFDaS9R?=
 =?utf-8?B?bWlUM0dDWEZTTTFvRmJsTTQ2eFEvalFnZjNyNXczaXRLblk0S01HQ0JNdklk?=
 =?utf-8?B?T09KRHdxbUs0UDdnQWVWaVFBeFNKaDhVUU1UVitNaXhOdEs4TTVoMmxUSUEx?=
 =?utf-8?B?WHNRWnRqS1lSNFZEV3hxTE9vS1pXS2tDeWNvV2hPS2lxdkNwbGtsWUp0cHlW?=
 =?utf-8?B?MU84T3JUR3ViL0xzWFF4Ym9vMXlBcnB5a2E5OG9oL0xqU2dzSFpNUHQ1Y0pz?=
 =?utf-8?B?M3BHQ3ZGdGc4MU5xQXlqTjhSa2d6enFaK2Voc2lFYzhLWTNuQitMYlNSR29C?=
 =?utf-8?B?eFNpT2o4VWJEVnZmYTJhejRWWjNEK0VPQk9lYzlrdzhEd290SUNzZ0JrQWRp?=
 =?utf-8?B?K3E5c0oyWUtIKzNGQ0FLSTFyK2JHYzVqK3V4ZVVDUTdhMVZVYlhsVmdxVGkz?=
 =?utf-8?B?akhBNjNBcTFtZllpWFZIcDBKT2VyVTZkZEpXNm5YR3pqMWFrQzRmc3BuM0lG?=
 =?utf-8?B?czdCU2xXNFAzYkkyc3ByV2xFanVuNDIxYXgybmE1U3lwN294b3Q1Y3lUS05N?=
 =?utf-8?B?dFRsMzVVbkNoOENWakFYUjVFTmNjRi9nWno5Y1VDRlJwUktGMTRjZW1YTzd5?=
 =?utf-8?B?TEdYcVR1bUVoSnlia2xyWWVRQXhVb2VGZnVwbjhNTjlITmxxOUR1em5jUnRz?=
 =?utf-8?B?VXlESk1qTWFnNUo5ZDFHSW5NVWFSSUVrTFplak9tK3JQVjZmNFNzWC9qOUxp?=
 =?utf-8?B?WVlxUmxQcC9PNW1rK1p2bVI1YjdxbkxmNDFQNjQxZkE5ZWwwVEVrZm5zMGcz?=
 =?utf-8?B?QWZYV0s3cGtBUGFRSXI3c1lFMi9kTFpLcHdWK1dDS1ZwT1k5bU04NVhpNWZa?=
 =?utf-8?B?aVMzRWs2UC9Pb0pMZE1KdW52OUIzYnRqOW8rWE00eGdOUjlwaTY5SEYvR2Ft?=
 =?utf-8?B?NlY3TXlwWmJNV2dCTGpVNllnL3lkOVZXUEEvV2MwRGlXcWQ4bEdKMGY3a2xK?=
 =?utf-8?B?bWswRlpuQk1oN0sxNTNhelpJbU5kWE5YUTJrR2ZiWlJOcEh3aDlTbjdMNGtz?=
 =?utf-8?B?cHl5cDNEdnJxNnBuSWk4Tm5DMkpsSkxJeGxmbDFOaGVhM056NHViQ2lLS3V3?=
 =?utf-8?B?b3NjdXo4RHcyVzk5OW9jTU5LZ0xKaWhUelJ3dnFFMklRZXRWYlBBaGEzVldz?=
 =?utf-8?B?UC9CVWNTcmo5K1Y0Z25KL20yRzBuYXhzWDdjcm15MndJbTJMcXhoRUtxUlF6?=
 =?utf-8?B?ODNVSGpSbXQ1TUg5YldISnEyN241WVVDZVJFZS9BaDVvamZoSWFPVTB3Ny9i?=
 =?utf-8?B?NENrd1Y5NUJKakFJb0lqNGs3d2UyL0VGT2pBMjhhREJzako5ck8vQStlTENV?=
 =?utf-8?B?RUl3bTBUaFdWZlNjSUQ2MTdiL0VCNmZDbkQzMklHTEpqancwZFhGbWxMZ3Vi?=
 =?utf-8?B?Mk9hYWltYjMzNEZSTTlTS1NOSExUQWVzNzFCdjhGdlBUV2RHYzFZZmNsbUQ0?=
 =?utf-8?B?UmZwbFdGaWFJU0ZTVWg5U3FWVnY0UjlJVGRIN24vRTlJTjZkNDFEWFVZVm96?=
 =?utf-8?B?MzRlQmZvMHJRZ3hCU2pSSnNYVno4VnpDSTZLQlhhTU4wRldKVXlYNUFacHc5?=
 =?utf-8?Q?4fVc9U/dyqYD+9H8=3D?=
X-Exchange-RoutingPolicyChecked: 
	ThTIYwrzDOmFgo0J8iCwNB4L4NYR+cqGNJ5YW6S4+6v8bcG4gLSfcJgLFmTXxxIb3w0tveJx8r+8bTsiyUgHnoirB8SE2Wu5l5t7UWBpJncMhw9+o+Xs6KH6n1kBI+K/iH0EC4cyz053UYkT1i5TAz3HVVKoD64/fl4c8iYrzJ3pzZtppqznTEEDRRiYTkiHzsKKs01RlPFtdoJxZFeindJSb019eYkqnjvnXeZgJ91cM/eKXFzJO9sPCFJ/aivbjHPYoju4x55X0B4ZRZa4zakCpQsXwhMvqEYgJ5cgJlLjX8VuEmi289qg2jg5g2V0rlGbM1KTY5ujsVD8MLjO7A==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42f5a894-a210-4ee4-363d-08deabf72839
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 05:11:55.7130
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0+dXW5Pw+c8yM+aYEDdOpsx927NQtjgjUGpf4yo15nZbEZZ9auX7j6E2HjWC+kcjfF+JObZlTOxtYXk3FxXxESR9EzP+yIhke2ZQopMwNao=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5774
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: 0R2SmUlLQ5lVQRJELEUHzW_-IfKRD0Ji
X-Authority-Analysis: v=2.4 cv=JeGMa0KV c=1 sm=1 tr=0 ts=69fc1f1e cx=c_pps
 a=jETFHvz8UvQZFuPXE07H+g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=Q4-j1AaZAAAA:8 a=PsjR_W-e97UUppd3sJAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: ARJqKjCbQGeYUNxvT6SXhGCa_iQIplHz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA0NyBTYWx0ZWRfX5dp+X+F7Ctiz
 AlrFgxtz+sxlhOGz7+/QC6oykjx8T7nfqwP01iOQpVrZKqNGcl2MC2lTi8HzDCer3zy32JUZoCz
 QsTCbMXUocwh0QNHwV73b3dm9X9/w8/SnlP7HtreiTAprv6yFWkTV4C9LwYzgs4PLEuceY4XL1f
 bwVFelz8e5/aKpjThhPNYr4W4+K8Cs8IH2WKpNlKJAjYHkgPHnL8Al/q/ZvOstC0Loo1fFeuqQD
 pTDBN/mni3d1oAR4M3zM2lsywsZYathcF8nLESPBAWYwCTLIft7Qjw3xLOSONGZqKauJcCnKQVU
 0GaIVkBwtstWDe3hcxiu7Ga25v4XGGlcvonQh7CnpAsOzFuCokxpNeeXtxN9DDzYQG81tUfZ9Ku
 5BTs/d1va85/8s7zUlIU3CYebXjq3DAzQnqceiDbJZ9KfWofy82PO11qPb9Ck/7beZGjKiqFNtc
 j0GEhCPMa50XQjlGwMA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070047
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 6474QtL33726071
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 05:12:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236556


On 4/30/26 18:19, Ross Burton wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On 15 Apr 2026, at 03:16, Changqing Li via lists.openembedded.org <chan=
gqing.li=3Dwindriver.com@lists.openembedded.org> wrote:
>> When vulkan is enabled in DISTRO_FEATURES without x11 or wayland,
>> do_configure will failed with error:
>> gst-libs/gst/vulkan/meson.build:311:4: ERROR: Problem encountered: No =
Windowing system found. vulkansink will not work
>>
>> when vulkan is enabled in DISTRO_FEATURES, set ANY_OF_DISTRO_FEATURES =
to
>> x11 or wayland to skip building of gstreamer1.0-plugins-bad
> It=E2=80=99s absolutely fine to enable vulkan but not x11/wayland (beca=
use you=E2=80=99re doing vulkan to raw buffers, or using vulkan for compu=
te) so I don=E2=80=99t think this combination should cause the entire rec=
ipe to fail just because the vulkansink needs vulkan+display backend.
>
> Ideally, the PACKAGECONFIG is only enabled if vulkan && (x11 || wayland=
) DISTRO_FEATURES are enabled, but that=E2=80=99s going to be quite a lon=
g line in the recipe until we have a version of bb.utils.contains() that =
can do logic.
>
> I think the better solution is that distros who want to do this just do=
 PACKAGECONFIG:remove =3D =E2=80=9Cvulkan=E2=80=9D for this recipe.

Hi, Ross

Thanks.=C2=A0 I resend a patch to try remove vulkan in this recipe.

//Changqing

> Ross

