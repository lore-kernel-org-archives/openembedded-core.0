Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC024EFD23E
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 09:57:51 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42173.1772013441720799022
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Feb 2026 01:57:23 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=rv3BGiFT;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6516ff5eb8=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P6QVZt1339108
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Feb 2026 09:57:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=LzUbO4l5GifqKoT+8vnrNTbBSXqaoyufkPAup4VnQq4=; b=
	rv3BGiFT/1hYjYsY2YgfmPysJ6Uo4kJxaYKDLfo687qOzBPBufZ+GkRPzxio9/pX
	eDCK5TF5am/pLOk3UgdlHPcPvMBKSfBEIkWgwEscWlCSA7cjnaNXOF54zla1usWP
	3KPo1TmMXEZlKj0ClryrA+aMYGNp1PR9fwVhV6DgNx2ngY622H+ezACtRCgoekqp
	6FCEQRecAO91TVGGigk4aG9F2c3A8C1oEdhRqYdiiNf8THXqHpkt4Xwl6/9mkvBW
	22oCHIOR/RME8Hnd9x9QfR7gJuhxeqggtJOUHNZOJeFkcavHY0sIAKwaHu3HLyWi
	6wJnv5k6vRf97JlpYZs3nQ==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013003.outbound.protection.outlook.com [40.93.196.3])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cf1wvcs08-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 25 Feb 2026 09:57:20 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FMgF7xSwF0vvog09h+CeW75X5b7TAftik20kIJzcOYLg59K1oaYfiQj1G05yWF/b1zpLP9qyy2X87r8ZA6MnDslHr4ZMn1+whFHeeruoYjFQSNsjuFGHzh9ahA2VmoJqBTFWLcrAed8OTPPaKdvyB1cwXR0B5u5KIkegVzDnMACire4apAe/HRvH40V00K9AF4QrD9Etn7hUJjkDjkBEChD7d35eFyZ9zj7Fg1cspw0X3z07PVb8zTT3FhJQbz+YCsfqGS5FzUX/ZLDYqcjUxPVPFmHQfQD6OnmVxNBgVyhRb2FjnH5/df3yCtEsyqaOo4POwa0ueBn5X3+TOk4nxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LzUbO4l5GifqKoT+8vnrNTbBSXqaoyufkPAup4VnQq4=;
 b=Nd90jwaRQE/Mm7fadPq55Ss1QGo8pXRDKjqgRZhk9/4jrj8o31qK4f1qSBnzahbe0g2ZLSQvkMxrvDPEaQ0DW/BL6TJmM8ilvquN2nwTp8/nyKW8A0uV4B0lUUdc1dPSs0tLY4MOvmPx+itf4J+uTv46OKelTaKgv5P9Ms6sEyO+Hdher7fvXWxmCMunZWXwfT1GkcNwWIKFbAGIc5rP/eml4IT3sE7gtVEuTR1RYR3qRVNHnI40S/kGJK+AObWeApHdh31An49KZZ2Mw/XzqW55j1SSLg7agQlKio16CXHbcmehKIxb28UOQsLoNU6t4tEExvzw3ehwfTZn6aoD4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by SJ5PPFA0B9CD929.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::84a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Wed, 25 Feb
 2026 09:57:18 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%7]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 09:57:18 +0000
Message-ID: <7b35b9ae-3c56-4096-9925-d3202ac442cc@windriver.com>
Date: Wed, 25 Feb 2026 15:27:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] binutils: Upgrade to 2.46 release
From: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
To: Joao Marcos Costa <joaomarcos.costa@bootlin.com>,
        mathieu.dubois-briand@bootlin.com,
        openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
References: <20260212142933.3543788-1-Deepesh.Varatharajan@windriver.com>
 <DGDWTI56DB4D.1I1SUNULX6S5R@bootlin.com>
 <5cfda679-374f-4bc7-a33e-53f75833b090@bootlin.com>
 <09acdd74-3a51-4de1-9d94-8c6332b0d4c5@windriver.com>
Content-Language: en-US
In-Reply-To: <09acdd74-3a51-4de1-9d94-8c6332b0d4c5@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: MA5PR01CA0062.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b8::16) To SN7PR11MB6677.namprd11.prod.outlook.com
 (2603:10b6:806:26b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|SJ5PPFA0B9CD929:EE_
X-MS-Office365-Filtering-Correlation-Id: 9eaa37ab-a993-44b4-665b-08de74544289
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	yeQtK1C2x5hlLKwCoI/71E7tSHQBXYqZT9iWXN+GcryKDR2oB1pLv/hwPGyfTCms0qrnkn3KjYqQrRcSd5d8T/0DlRybryJlcZjW1ZiQdKo/hTKaaR0xWdQAmA3e7npxQ0C0CATPQBJmKhbSln+yQmI+Ngh4S6LETVBuVaFvu1HDfgz4O6kZvlZMH27sr+bQxriXMOIWwhLbRBGTlqZ4gFlr82z4zZCpppOCpMr8XTV6LarQVa6HF1Rk0k2I6nggHv+kFVw9gYi+uuc2m08I4z+2x/zUi6rdg0WB6YSTFAqzb5uSev0NGnSC3BCRzI9846CQK9d4CY1qTW7HO8nZheTu/2LmhMh3AzmoqLAIkNR62Ts4jqKaDLSTsiVfRJFHABPJxhMe2rCgHbyrHooe6ALBqmD1fBCSV231Myd+oc51wqIAJBcIJKdLtfYzyxGuZ97ZIFO9wVha3DMhCvekS1aSj7zQUsdQKnKc4dflp5gk+yU5vMbElWOq0ibzxWhPTXM+4OfINUUBUgEKk+U9TZk7Qpl7/2PokhXB4YQWmeNKTzFG9KwkKVjSzezfYqZoK9dk9W6YYcYw4qV0R6otCbu6Pj6MfmmzZ8nWRj1/rax0+QiLrwlU8o/AbQzVR7yWtOHn4tOMvwiGbywAvdl11xm80AjeWWRnYF+xAWJ7LZzI0PR5gvWB8OWMMpbC7J2Q
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MUVzdWpuMUNkaWxsb0NFdW84dktLNURuRW9wcm4zeHMyaDFxc1RleW1Zekxx?=
 =?utf-8?B?VzZnQm16WFU3ZGdqQThQa3pnUm04WHRNQXRseXVNVE0xaDc2M0dKMUhoVFlB?=
 =?utf-8?B?bWZIa3FqRzg1d0k3MlV3cTgwVnZoVTN0QS92NlVkZTYvWG9nSzE2QVNTaER2?=
 =?utf-8?B?VDM1eXU5Z1pxSk5nVlpEcmszcWUwODVHR0tvMVhTTnNyZERhVUx4NElyZDdw?=
 =?utf-8?B?UndtQ1ZYay8zaFhId0M4dFZsTUwzZHJHQ2d4QWF4WHBzUmFianNJT3l6R0xR?=
 =?utf-8?B?THlXb1JUMnVacmlBdEZRc3hwTnFELzJqd1k2Zko0bUMyMzhkdUh3dDJJMnhK?=
 =?utf-8?B?MmdDN3VlcXVBNWQzdWNLOGhXREV3bTJHZWpOMjVNK3p2YnVvVHp6WU02aHNv?=
 =?utf-8?B?dW1lcHMrOVJ2dUpyRzhxVkVxZldLUHJ5Q1VYSklIOEpKTUh0allUbjZ2SXQr?=
 =?utf-8?B?N253NTdlYzdKOENCcXErV2E2UHNNaTQxQlBMbzg1Z0dhNzlGanRsK252MGx1?=
 =?utf-8?B?VUVZeG9CRnVOQ2Ywa0NkUk5YcHIza0pZRWhyVWZaYTdrRVB4K2tqNUdtK0I0?=
 =?utf-8?B?SS9iNEdyaXMxUlpwemlGQjJwTWNrRmtOT1BvWFVZbHF4eDJMdTcwL0JPU3Bw?=
 =?utf-8?B?V1g5WlV1Zmt4RGtUKzRmQ0htNHhzWVlXWmlHT3FxUXRiK056cVVTZVVUckhp?=
 =?utf-8?B?TFhIZnllSENjaXNsSG1ZSXZEL1RWVjhDSTM3V1p2VURxSUNXZGRaY25FSE5H?=
 =?utf-8?B?N25SV2JhM2dEcGhpWFBIZmpBZ1J0REF3MHorbG5yV3ZZSWpRMUpNTVBYMzg2?=
 =?utf-8?B?bi8vYngrRUs3eEJRV3k3Rm5UN2JsZFR5dTdVTXZ4UDRTR1pwckltLzlpUnhH?=
 =?utf-8?B?Tnk1dlgrT0o0eSthd0VBWmNQa0xZUDZ3THc3Zm9MYUhjMzl4OGo2WXkwK3po?=
 =?utf-8?B?WXY1L0x1OWJBVXY3Y2E0NnZjUUdPY0RqZ3hXZWVMK0NQOG1uT2IxdjUxQjBC?=
 =?utf-8?B?allXaXI0d3VLOHZ5RTU2enludTBOWHJpVjZldTZhWGcxbUhzK2Jra2JURnNk?=
 =?utf-8?B?OEQyeWhVSWFjM2dKRDdFc3dVVUtxUVpQNDV1Z1pxSmN0REN0b1ZEZDFmcUdw?=
 =?utf-8?B?OEVEd3JyVGtJaysvUlFvRjZ6OGpDeDE5TVVKRmJEblMzZE1SVk8wQ0tVenUv?=
 =?utf-8?B?dTFCMGFmMm8zZmp5VlhqTy8vdU0wWkdTWnVIWlNXeTZ1SmNSaTZRODY5ZThK?=
 =?utf-8?B?alloblpPcEQ3UlU0SVdBZ3Evem94TXFWbVhoODNCMURudXBjRUhzSUJwdGVk?=
 =?utf-8?B?NTZyMkMxczJuTE9XVkJ1c3RheXZJWThLa0M1L3RRM2ptcUxaZWY2WEp1UXFK?=
 =?utf-8?B?WVo5citYTm12dU50Ui9aMExPSlJkOVNxZlpoSmttYjd2OGZaSkE2UktVNTRj?=
 =?utf-8?B?N2lBVzQxbjljUEo3KzRQVS96QXo5TzZ0V2I4U1NIQ0d0YVpxMzVXY0pLVWdX?=
 =?utf-8?B?QnJDYVZJdG9YdWtXWWwrU1VySTNiSUZud01wL2tyWVBmMHJJbTNtTE9vVHc5?=
 =?utf-8?B?SDRaV05EbzJ4UnA5Rm9tOGQ1VlZOc3RwSTFlUTB1bXZNREY4ZDNLdTdOVXkr?=
 =?utf-8?B?WDFlQmVzc3lxbkJRR2JFMGloZmpZelBKV2QzZjlVekZ4ZGhhODRlVC9sMkx6?=
 =?utf-8?B?N2ZmV0x1Q1RTRk1HdzBsVlIvOGU1VlNHd1FWMUVTZjlyRHVTcjVIZkViS3NN?=
 =?utf-8?B?MXROWkNaZ0VTRGV6SFBGbURJUjkrN25USmN5aTdMSnc3cDg4Tk1vU1dhVzdm?=
 =?utf-8?B?VGVCY2F2UGYrVGJ6YUwrcU9tWndPYzl0aDdENTBPNDhyNlc5SVpLS3Fvc1dZ?=
 =?utf-8?B?NHZYRnl2MGdIVnIrM2FPMXJ3WTdvNXh6enlDanhFSjZvVHNVK09ESUhsNTdJ?=
 =?utf-8?B?YWpJWHRxZUY3WUs2MmFTcm01Z0ZuNjhycjUxN2VKczFOWXZQTVBob09aQU5x?=
 =?utf-8?B?NVVsSlY1bUZjeFVLcWRDMExiUUN4T3BERTBKdmwvNW1HMW0weVVRK1lZY2Q0?=
 =?utf-8?B?U1c2bFpkR3kxdEF0bDBObjVpUE1xQW1yN1BLU0paeVNKcVpqNE9pcjlnVjNL?=
 =?utf-8?B?V0JtY2tnVHVZVXA5WkdTZGROeHk3ckRmcFFCSzBOcDhsRW13eFp3aWdQUjlw?=
 =?utf-8?B?cTJmV0tZUlJvallpMlZoTnBhbVlhaFJGNTFlV09hTGdmZEtVdENxK0g2dGRn?=
 =?utf-8?B?ZzcwZFNOZ1Z4VzRVZG0zK2pKbTM1TXBhQVh5Z29mUGRSaDZxbGhKZkJsRXVN?=
 =?utf-8?B?Z045K2pTS1RVaFhrNGlXSE5aVGRucDI4eEZFaUN6a3BpSXNIWWRMbmw2VFFr?=
 =?utf-8?Q?GH/JCqh0ihgX/zixGIVCHbud3cNJKUPwA4c7h?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9eaa37ab-a993-44b4-665b-08de74544289
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 09:57:17.9895
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PMv+TpD3ejvLuU7sNcsJpOTjTiIHahrApU1js1SfQ7v8xmEIXl9aXPIYX+GWrCKEa+0SW0Ok4WxQEMk1Jjq/EdOijTJDLFvDUUie9fMCXrgZPIgwRyTIJr+ZE1wjAhwb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFA0B9CD929
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDA5NyBTYWx0ZWRfX1VEg7zW73+Gi
 Vg3UKHHTK8a3h9PMmcvR0spKVzgZcAdzpVtWovnyFS5sxpwBilVUfgB7wvfuLqSyi5l2G5bdpLJ
 c8zbNWvbNMCleF86e/xG2DzZHnKWoQuSMaeMJZu55pYD0lLtX9of7CXUHfK1d+vZUqJNlRowVuI
 6cbhnm29aVSdy3Gsy7QuB9y7skwxbvMMKQR5ic5R9K08+jb3co09wo5T0aP2Vu0xKorj0C9qbzz
 xiFzIkYFq0fgGxiinuZIo2eB+/zfPcNp1FD0+BCxYKFJ8qXSWXpcPqsVjfvzP8x6TxBRmf7KcEF
 43f6z4+cZ6zzdCG27La4XUTiqjtMlxq8qMppUqiAt+27Z63VpEnTGNFNy+8DG3+UTX0h5baB/85
 Oc+EUXnLknhl0CFx48x632Nbl5XHrJMHWyQslOA+1/yn/W+i0Xk7wKVwAnYYn/O+dxTGMgf8AN0
 eXiqk/ZvkGjDM+ZNzbQ==
X-Proofpoint-GUID: PrN65yG_FuyjIu5VoxTkmOGjKBNJ8J1g
X-Proofpoint-ORIG-GUID: pBpSPKslsA1hKdQgOiC8jGgKWTTytFVo
X-Authority-Analysis: v=2.4 cv=F+hat6hN c=1 sm=1 tr=0 ts=699ec780 cx=c_pps
 a=rjhVvYU/dOM9ArBm263f9w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22
 a=mDV3o1hIAAAA:8 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=z8vU8Gr3U-nLPclttLsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250097
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 61P6QVZt1339108
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Feb 2026 09:57:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231946


On 20-02-2026 15:25, Deepesh Varatharajan wrote:
>
> On 13-02-2026 21:03, Joao Marcos Costa wrote:
>> CAUTION: This email comes from a non Wind River email account!
>> Do not click links or open attachments unless you recognize the=20
>> sender and know the content is safe.
>>
>> Hello,
>>
>> On 2/13/26 15:39, Mathieu Dubois-Briand via lists.openembedded.org=20
>> wrote:
>>> On Thu Feb 12, 2026 at 3:29 PM CET, Deepesh via=20
>>> lists.openembedded.org Varatharajan wrote:
>>>> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>>>>
>>>> New Features:
>>>> Support for new instructions added to AMD, ARM and RISC-V=20
>>>> architectures.
>>>> Support for version 3 of the SFrame standard.
>>>> The readelf program can now display the contents of Global Offset=20
>>>> Tables.
>>>> Improved linker tagging support.
>>>>
>>>> Detailed release notes are here [1]
>>>>
>>>> [1] https://lists.gnu.org/archive/html/info-gnu/2026-02/msg00006.htm=
l
>>>>
>>>> Dropped patches:
>>>> 0001-aarch64-constify-BTI-and-GCS-report-functions.patch
>>>> Since the fix is already included in binutils 2.46.
>>>>
>>>> CVE patches: CVE-2025-11081,CVE-2025-11082,CVE-2025-11083,
>>>> CVE-2025-11839,CVE-2025-11840,CVE-2025-11412,CVE-2025-11413,
>>>> CVE-2025-11414,CVE-2025-11494,CVE-2025-11495.
>>>> These were dropped because they are already addressed in binutils=20
>>>> 2.46.
>>>>
>>>> Drop CVE_STATUS:
>>>> binutils 2.46 has needed fixes for CVE-2025-7545 and CVE-2025-7546.
>>>>
>>>> Rebase existing patches with binutils 2.46.
>>>>
>>>> Testing Results:
>>>> +----------------------+--------+--------+------+
>>>> | Result=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 2.45.1 |=C2=A0 2.46=C2=A0 | Diff |
>>>> +----------------------+--------+--------+------+
>>>> | Expected Passes=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 318=C2=A0=C2=A0=C2=
=A0 |=C2=A0 331=C2=A0=C2=A0 | +13=C2=A0 |
>>>> | Untested Testcases=C2=A0=C2=A0 | 5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 5=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 0=C2=A0=C2=A0 |
>>>> | Unsupported Tests=C2=A0=C2=A0=C2=A0 | 8=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 6=C2=A0=C2=A0=C2=A0=C2=A0 | -2=C2=A0=C2=A0 |
>>>> +----------------------+--------+--------+------+
>>>>
>>>> Testcases changes:
>>>> --------------------------------------------------------------------=
-----------=20
>>>>
>>>> Testcase-name 2.45.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.46
>>>> --------------------------------------------------------------------=
-----------=20
>>>>
>>>> nm --ifunc-chars=3D-- (global ifunc) -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PASS
>>>> nm --ifunc-chars=3D-- (local ifunc) -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 PASS
>>>> copy with unknown section flag -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 PASS
>>>> objcopy tek2bin -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 PASS
>>>> binary symbol (implicit) -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 PASS
>>>> binary symbol (explicit) -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 PASS
>>>> readelf SFrame V2 (x86-64/test-v2-ET_EXEC.sframe) -=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PASS
>>>> objdump SFrame V2 (x86-64/test-v2-ET_EXEC.sframe) -=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PASS
>>>> readelf SFrame V2 (x86-64/test-v2-ET_REL.sframe) - PASS
>>>> objdump SFrame V2 (x86-64/test-v2-ET_REL.sframe) - PASS
>>>> run objcopy of executable UNSUPPORTED=C2=A0=C2=A0=C2=A0 PASS
>>>> run stripped executable UNSUPPORTED=C2=A0=C2=A0=C2=A0 PASS
>>>> run stripped executable with saving a symbol UNSUPPORTED PASS
>>>> Copy object attributes v2 data from an object to another -=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
>>>> UNSUPPORTED
>>>>
>>>> Signed-off-by: Deepesh Varatharajan=20
>>>> <Deepesh.Varatharajan@windriver.com>
>>>> ---
>>>
>>> Hi Deepesh,
>>>
>>> Thanks for the upgrade.
>>>
>>> It looks like some patch needs to be refreshed or dropped. It's only
>>> applied for class-nativesdk, so that's probably why it does not show =
in
>>> most builds.
>>>
>>> ERROR: Task=20
>>> (virtual:nativesdk:/srv/pokybuild/yocto-worker/genericx86-64/build/la=
yers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.46.bb:do=
_patch)=20
>>> failed with exit code '1'
>>> ...
>>> ERROR: nativesdk-binutils-2.46-r0 do_patch: Applying patch=20
>>> '/srv/pokybuild/yocto-worker/genericx86-64/build/layers/openembedded-=
core/meta/recipes-devtools/binutils/binutils/0003-binutils-nativesdk-Sear=
ch-for-alternative-ld.so.conf.patch'=20
>>> on target directory=20
>>> '/srv/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/x86_6=
4-nativesdk-pokysdk-linux/nativesdk-binutils/2.46/sources/binutils-2.46'
>>>
>>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/318=
9
> Hi All,
>
> We looked into this issue and fixed it.
>>>
>>> Can you have a look at it?
>>>
>>> Thanks,
>>> Mathieu
>>>
>>
>>
>> Just in case, there's also a ptest failure that could be related to th=
is
>> update:
>>
>> Failed ptests:
>> {'elfutils':
>> ['run-strip-strmerge.sh',
>> 'run-elflint-self.sh',
>> 'run-reverse-sections-self.sh']}
>>
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/303=
6/steps/13/logs/stdio=20
>>
>
> We have been able to reproduce this issue. It is related to three=20
> elfutils ptest failures. These test cases were previously
> failing with LLD linker and were marked as XFAIL. However, after=20
> upgrading to binutils 2.46, the same failures are now
> occurring with GNU ld as well.
>
> The issue appears to be specific to the arm64 architecture. We are=20
> currently investigating the root cause and will
> provide further updates once we have more information.
Hi All,

We discussed with elfutils community and arrived at a fix. Currently=20
testing the fix. V2 will be sent soon.

Regards,
Deepesh
>
>
> Regards,
> Deepesh
>>
>>
>> --=20
>> Best regards,
>> Jo=C3=A3o Marcos Costa

