Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE5C5CD6E56
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 01:50:22 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15322.1780365019280298390
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 18:50:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=bnBYxDg1;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=061317d246=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6521FJuF551174
	for <openembedded-core@lists.openembedded.org>; Mon, 1 Jun 2026 18:50:18 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=sqC50ax0Rpyka1qj/k6UP3qJPB7Rxy1A4eY4CMd3Ksw=; b=
	bnBYxDg1+JNnvODtQdzON80eO+Rwv9yd6v1qfirnZkk//tqCYonlYA+tftROqM5d
	E9B/3Td2k4tS5iLctmaYIyBlLjdkbOeIAMAi6IpLAPIyL/5OIfnhZRfvhu/0eMZ+
	1juk7IDYqn1jkfk1yMj8VwYWrw26DPczPlhUaJqWZo3tih5U0P+ESg4rqRPLkZMS
	W9ha12wU1h7rYUuA9BQ1q5LINQVuA/nGrTMJ4N7gs1qTd6+i09Xf5uvkjkvVN77J
	LK58yIRJIxyelIKnar9lzb6uyftq3ydNeGCnH1Lhtwtni08o/TloCiNLtXewNz6H
	B+nYV2SsSNUl2P2mrC6lGw==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010011.outbound.protection.outlook.com [52.101.85.11])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4efydebjy9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 01 Jun 2026 18:50:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cQJl9mzGqIRxtOhD6JrK8+puryAPMAbgwC+6/RtqINmjRFvXD5NYfmASHOmFSjRDrLdjixFhqfDhWw+bvzt+0Q0xUgrgMiq3H1I+rSO8qz/T6kXvoXpPejw7r7Fp+nYit74vlRsY9/zarst6EfHn4Kb6MmaYw4MEIT6Zj6KP58url/HFqQ3h0s8/dYefQHaKwXNH0nzq6ZCdWOngJ9FnhYmOwLh6OkAJtDjKviH/MZQzkTeJoNvFmy04xVa37vEG4OS8f6O+/6bp/YQ7p3H7PugqBR9ZonV+RLJe77Bx9Dz8cdSOgy7JxyxqUWSG5KLctiJh93pjLDR3hzGz99N3mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sqC50ax0Rpyka1qj/k6UP3qJPB7Rxy1A4eY4CMd3Ksw=;
 b=rpFIdBvMq/V5vvFauqXLMOg64d3yon399B8W3DGYzAUuFA7LAB3eTizVl3+imwg4DXPU7mVhVEi9n+Nqf01HvOTIgR/vwqhbKKhMxhwwxr6n1EZNHCo6qQB6UJndeUPRZPvEu+IaQ3IFi3KQwUNIcQoV5VG8aId+qyMe5LoMbDPf71AmHBbgEqnAV37gV5Nw55neUc7KS8hWFAAqWghrCjDjO9nCL0SO4QKMSdHacGtUC7iL66CRVTmmr/FIbgyFf31Bg3cQ0pRO16WTR8+28ZnH66Q8PhvMUapJuTRY72R4ECgGNNUj08xYvFe/b4TZNhfzquJHCY1f9EXNXZMh6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CH3PR11MB7177.namprd11.prod.outlook.com (2603:10b6:610:153::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 01:50:16 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%3]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 01:50:15 +0000
Message-ID: <93b08d1c-bf21-4635-8aa2-f944f6f9953d@windriver.com>
Date: Tue, 2 Jun 2026 09:50:10 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH V6 1/7] recipeutils: add optional stable_upgrade
 parameter to get_recipe_upgrade_status
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, randy.macleod@windriver.com
References: <20260518055558.3982813-1-Qi.Chen@windriver.com>
 <CANNYZj8N8gizUO3NpiH_tL3urg6L5hnWo8y3oQwfCLKpJeLO-Q@mail.gmail.com>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <CANNYZj8N8gizUO3NpiH_tL3urg6L5hnWo8y3oQwfCLKpJeLO-Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SEWP216CA0109.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bb::18) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CH3PR11MB7177:EE_
X-MS-Office365-Filtering-Correlation-Id: c5944603-9f02-4252-c05d-08dec0494afa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|22082099003|18002099003|11063799006|56012099006|4143699003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	qaqlfzncJudnXhY7P4DStRQDEKJSKwXijdN3pHhs1xolI2+u68pBmmYQrVSN4GP5EWicDGql3pr4dIqstQ2fBbgK9DGLW/RWt5ZWcSAzyWA8G7LzsaPDQHz0SCnoFFJWYti/+5rtgtIBV6YadiB3hiWGy3gDSGt5tmERoMBgabEheNrBaBhmu/a0PsW0pJgOMeVQAf5qZy2xWcMDjfGwH0Hpc57zr1gjB++oc29PqKCOfighqxcmCmcdwixwjh60vxmbeoJ23gRCGh9TMTYoa2wuQACATYIXg4gtTP3Kgfr1ByF3i1uRVI3dS3QVUH2d9LwY2UdbZ+DGcT3Wos63pZi13pe0LH5ZHadXqZ37EquQt6bKpITm0BdzVkLkBOEuSIVtjQGi54ThIZrj9sk2QFGBbQ68t5veHR9TYYoJjmb9m7PO10TuuiQQtDQVyGea4ZcTw7+9s5iiObFcKudkAz35Vj2hA4OTmtjvZSVg2IqiKLkhCJXeBoKClWDwO7PlrN21cPigg1A0zh1EQ/2K59qY9kTalh2ssmsg7Wyjb2ilfa7H77jTmRZ7GEpnHREBG15RLnSO0AJNy+psMbZjz6bQ8CH2bb1KT207ORMeNF5JyyBb3aAWTatP6uw8A14p8l6ElMCyO65TNv+TS1Dyl3Djq5m34XMD4zoTZwoNFGCTOuu0GQtSFqQx7WfMvn5q
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(18002099003)(11063799006)(56012099006)(4143699003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZnJuWkJzRmNELzA1UHpQOS82aDRpcndOaW9WRDdacnRyWDdvNkxrQS9MaDRE?=
 =?utf-8?B?bnUwM0N1Ui9NREp5UUxMMlR1elRRa3pTcDNhczdpdmR0QTdxRGJKQnNvMmNH?=
 =?utf-8?B?SjRaOG0ycm1wbzlteXFJNHJBWEFOVGJMUWFaM1lXL1EyV1JIN0lFMURmYTJS?=
 =?utf-8?B?MVpxVzRkQ1VqNC9nK0ZNT3E2bmZHQjI4RjliWXpTV3VjWUFIYktVSVNiUVh6?=
 =?utf-8?B?MW8rWWk3WjVZY1h5N0t6eE1Wd2Y5ZWVNa3lhdFA4NkNhY3BzZ2dDbDdaSERm?=
 =?utf-8?B?NVRTM3FFY0pCVGhpTTZLSzQyTmFLeFRsWW9oajNmdFFLT1hreE1Fc1JvWlJ3?=
 =?utf-8?B?bmFRZEVUeENGY1g5SjBGWnYrUWFwOG1CaGpIUnVtbmJ4K3NhMW90cFBZUHdV?=
 =?utf-8?B?L3haelg3NzZweHVjc0NsSUhnNHB0YUpUSGlrTS9FWmVGVHpXQk5nRnloUEdi?=
 =?utf-8?B?UHRuQk9CcmhTTjF2a2xSd1hZRGJYRWhuUGFrSWo2U2RjMDZOMWE5Vlh0UmNY?=
 =?utf-8?B?Z2dKY2ZFZUV2TmJhWTF3VDQ4ZlkwVDBRSDB0UjJzRU5HMGNHK0w1dE5lcmFz?=
 =?utf-8?B?ek1IcGV2SFhmT0t2SDZMdHBnQ3lQOVFPQjZ2Y2ZNZTQ2KzI2eDVZYm5vN1Qv?=
 =?utf-8?B?SUZMTVp0aEJLbXk3ekYvdUx3UkIxRGRrK1pXTVNnMWUxQWJkdWlMbVhEajJa?=
 =?utf-8?B?L3JmQnVqVE9BN2VRZ0xlMVNGN2Jjbk9yVVZycVlvczJtM1pEOFAvcnZjQ0RP?=
 =?utf-8?B?K2lxTnNQa1FNWVNwdzdNV01hUXJ2bGIzaHdMalVCakRGTi8ydEdndjNhUmMy?=
 =?utf-8?B?SzZLZHg5UnNLTlVKb0s4dXJIVklyekdWWDFhMU5DQXM3SjRnTS9JL2Nnbktn?=
 =?utf-8?B?SnlGNEZjMnFMSDVQbHN0NnlkMStwcVdBV05xNEV4bWRVWFMzOHlyNERmWUxh?=
 =?utf-8?B?SjBreEx1Z2RoaFNCUDFBOEw2bFFwZVlqdDA3NUFtbzJpZ0VVS0tyYnBrNEtW?=
 =?utf-8?B?SlFpOXYzR1pYK0xnNVhjaG1wR1ZIKzNkQVhiUzV5WGFhRjFhR3dqVnhQWXUr?=
 =?utf-8?B?Z1lFcVZWdjE5MUd2S0tNRXlIWlhOYTU2N1g2Q2ZUU3djS3NtcHk4S0doRHFF?=
 =?utf-8?B?YkhWRVNmRFl0akxZWmpwYy80Y0pjWk9PdXJvWWFadGU4azJwQ3JXQXFDNEN0?=
 =?utf-8?B?ZWI1UVZWbUNmdmd6cEhycFhCczNRbFg0YTRaOEFuaUxPOWNnZHRsZnRXQ0Ja?=
 =?utf-8?B?Q0V5VXczR285Lzk0Z283VGdVRE16UzZvSGJleWg0Zk43OSs5RDhEb1Z2M1Jn?=
 =?utf-8?B?MUd3SWJiWjFyM1drUmh4L3VTcEFBa2k4MDJMSlNaSGtLM3ZRR2c1QmhuYXhx?=
 =?utf-8?B?NzJ4NlJFR1BYVXBuNjh2ZkZzRFBXZ0pDUGN6c2NuODBZYkpmd1ZSQk5rY2pZ?=
 =?utf-8?B?ZVRtUWtCQ0pQaFU4NTdpRU5lVU1PT0RwdUlxT3ZUMzJoK0hwZEN0NC82RjRI?=
 =?utf-8?B?MlpMb1RVS3ZNbUtTdHNWbkJwdVVwV1oyclVuV3pzdkFLOXdxclVjSCtRc1JE?=
 =?utf-8?B?UGRJY1R5YnJJcHY5SXQ2NU5DSUpiLzVYeGgvbU5LQlhtSHVqZ1VwaW9hWnJz?=
 =?utf-8?B?RGpMUDlIY2cySjg3Mko5RTB2WlY5UTNlUUVPdmc1M3ZBNjJ5WG1UV3VBelFK?=
 =?utf-8?B?bzJPdUZSMDhYM01KelYwbG8wQldYRWZFbjhUUVYrbXRaWUFETWJxa1cycW9z?=
 =?utf-8?B?Y0g0ajUzM1YrMG1nK3BSM0RCbkVOWjUzcnFxOW9aT3VwRXcvYStEYkNhamRp?=
 =?utf-8?B?VW5MYWptYnIyRXU3WGprTTFMcDFGb0JJMFh5eDVCc2taVWdvSm1hcWJ2L1Yv?=
 =?utf-8?B?T2pILzNJcnRFQ0l1RUtRWThLNlhjelJWbmxYZUdiWkFsaVFjcWIwNGpTMW9O?=
 =?utf-8?B?SzRsZmVLM2swdGNicWc0b1ZGUzREWjdmM1ZzUFJFa2Z3WGV3L1VlcUdQWVk4?=
 =?utf-8?B?MGowT3lySk5FL04zcHVzbnk3Tkk5M1dzUHdKQ0tOaUhZb25PQ0dEMVpMeFJk?=
 =?utf-8?B?aGlySU9TVHNHL1JQTWkvd0h1eE1CQ1F1SkE2VVF1YXNodVRpaEtYZFNRUzAx?=
 =?utf-8?B?Q2ZvTUtXVUQzZzhNOE0xOWcvMFhJY0dIcUo5RWlEMUxzMExFMkxCU2RvR0kr?=
 =?utf-8?B?Y2NJWldvaDZUaGtBOVVRbE5NK3hyNWtnSXVKKzROMXNYbjN4TVkvdmlpQXRa?=
 =?utf-8?B?YUluQWQvSmdKOEJmRTNYNjVxQi9jTnB5ZzB5SzV3ekRSejlnRlJhNEl4SjdX?=
 =?utf-8?B?RCthYnlYWjZpVU1FUlZ3YlJKUGNpa3F2VWFJZ3RkVHBjZzkyVkFTQT09?=
X-Exchange-RoutingPolicyChecked: 
	Qw49J4ZVrASxIxCEmtFKxt88Fns771XuNkwqcUpc62F733+tDLZy5iV50BF75N6WbD3VMbrf+r5Fwb2mwNrtwXzT6KJye/Oh+eWL9492LuMqznf5Hu0prKZGCozDohaV8JSt+TIqcxcLctjR1HqRWKsv6b0ke/Cenix8c5EC31BCQxTb+X9iSzTUfxs+I02gcdUKB8qYb5XGARTw3EdqTkXFq/PpJBfnthcO8TKrk+JsRb3B7/7iyJ6QrNR7me2d3T+XQREDMq1IIXOsH3Ela41leUGtfvBvX3YitFK5b/lvhNDsxnWbs8aw0zAy1j8+ZHoaTs8pqpr/YK95NvB/0Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5944603-9f02-4252-c05d-08dec0494afa
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 01:50:15.9115
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9bdlc5/qHljCs3MHlGJNl+d1vINsmoZWeSDWV17qjBAgVoOL0VkrC0bhP53lSMJs4RFMRE2y5jrBSbF7UIKSpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7177
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDAxNSBTYWx0ZWRfX6c6p+9NW8lsS
 9JeX0OmRruzlzI4yaP3MZan+LFCLGvP0uyE68Wis2FQKoN2rN7K8mojv1E8tZkxNhTPH+gQ9iik
 W1kPo4KjdBep14TNUFEQXO1TiB23arLFe57/5YHC6PXZjz5lZMy6XWlTuYYd4X9F3OgDd+HZSTb
 9bAY4ry97A1KQsEB8+Hhg0aI4MUcF6wUK7O/DuU9yNwLq0LURzRqfcbwz6lF7otJuC64Mh+/YEp
 OjeHQHuzAucF+X+k2aCwWUg3jl9Q24TKwWOCvtjaUp67JOBNT3cQUqn48rIYYlMf9FRiVIicuNf
 BX1vF4noi6HLomlwdLvGcg0WqKKa0uigr8UEmS9yVtShA2Chc3FZL9cn65Y6Z8xps9YMYJw3TSd
 IVbmknBvvpQctSrCGjZIMnjQA8n23p0VYiEZOimgg8pld2ngGOy57SNMu0pFteBkcyFPjyhAd/y
 Gc/TQleJ944EPbUm/1w==
X-Proofpoint-GUID: Mhs79r4R8HmSuMItRPLFxQic72s6Paqv
X-Authority-Analysis: v=2.4 cv=Iq0utr/g c=1 sm=1 tr=0 ts=6a1e36da cx=c_pps
 a=IaRwrOchHg7qSZqgGdB+Bg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=t7CeM3EgAAAA:8 a=JCoTiOmrRPOfnwbTsH0A:9 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: r5jApWJChnx0Pm3W-sFyjggB5bd-P5ey
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020015
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 01:50:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237996

On 6/2/26 01:08, Alexander Kanavin wrote:
> On Mon, 18 May 2026 at 07:56, <Qi.Chen@windriver.com> wrote:
>> We want the ability to do stable version upgrades for recipes.
>> To this end, add an optional stable_upgrade parameter to the
>> get_recipe_upgrade_status function, which defaults to False and
>> when enabled will try to get the latest stable version of the recipe.
>>
>> The UPSTREAM_STABLE_RELEASE_REGEX is respected. If a recipe sets
>> it, it will be used as the filter_regex. If it's not set explicitly,
>> it means that there's no stable updates or the recipe hasn't been
>> checked yet.
> Hello Chen,
>
> can you also add support for this to 'devtool latest-version' and
> 'devtool check-upgrade-status' and 'devtool upgrade' which would use
> this when --stable option is passed in? So that stable updates can be
> checked for and upgraded to without having to set up and run AUH.
>
> Alex

Yes. I'll add '--stable' option to these three subcommands of devtool.

Regards,
Qi


