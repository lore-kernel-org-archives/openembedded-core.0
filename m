Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C040DEFD20F
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 08:56:20 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41618.1772009776879340099
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Feb 2026 00:56:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=No3Urb0c;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6516ff5eb8=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P6XnH61697245
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Feb 2026 00:56:16 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=PBQUj/Ju2vyHveTd3KuSm0Q3X7fnzr/iBV4UzcBFBY4=; b=
	No3Urb0cWAMhHofii6DXzaINWU3RuRtIzV6jxahiL6ZWhdm/yK8AstDPUBmfrb1L
	qiv+yLpn5i9Mf7jwgIFtTA6c4zhKtFKQ9YmK7oPT6Up50EqwpDP+NctkxMHonBU3
	U/hevLh3CxUKxtBjlAuewWHrcQnFFzTt0snyEO78YHPJmWrSw+jt55FHYlaBXxOw
	0ERrARetkXm5G9PtMHFWq6uzKG31kNq1aP8TXXamgHgxFTrFBgjxRhRIp79gLnYO
	Bm9GTexV/RYhhv+FuN3YTv8llLjSaEdH/lYyE9yU/JxeDFUlWuRuA/8oqGww6zXR
	qSVEwIvtHVJQ0LgKUwblAw==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012010.outbound.protection.outlook.com [40.107.200.10])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cfd3k4b3w-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 25 Feb 2026 00:56:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eByCwibpXDhuDUKIg+rZeNljdQcVvrLTbL+z10cX6/ZFdyYNP0ArrcmzgxSXrtuIEDwN5xN21BUgB8bVa2OFeVEH9xY0hqZsZAUkyA8nELcaPJo6ZMM5kctBTZVt5C9neJbbso5IY/nyaun6fQFZLxZfiqa698ji2ap/87uD6jE4CWeNjc8Nl1Ih2pemquX44XA7/l05hNDywQ6PVY40RM8UL6AYtO6akVGwVLcT1QcbQfFNhp1BNBI1nVw8jbZN0IKi8wYPswXtmZL8pfEwYV6zlrDXgCg1TmhPcT4W9CjZwHgBjTSdlu3FfPfX283GjvafIzWOTCLPmVBnhf1txQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PBQUj/Ju2vyHveTd3KuSm0Q3X7fnzr/iBV4UzcBFBY4=;
 b=k76tpNqDgroab+6HIGKKZOIPKl8BSx/ZS4OzO82UHWNOmFvxMFMn7O+u2Y0BOd7uv3TxzZWvgJtQi0RzdPRakYUaMnE3TC/eUPmZnnqAG/IujG+82fz55B5QtUjleEXUIuVkxKp1XXUAh8HegVA1BeF9SSKxvpRGWGUJ3IC6wqJaSWNKQMTfGikfXGxkHmGmUn1C5NU14T3NMLAmNeeMiTi+Qc7TjDCh/Ubg+0HBXwJD3JeAP+0wbtMf6uqiMyszVGx3YEd+VUMaU/aBs7MJBZssRIXzUrOd4/Z+znnH75Xlf+7eb/WAUFcVv7h/mpdJQWj92grGvWccER1IMH4Lwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by DM3PPF027BB0053.namprd11.prod.outlook.com (2603:10b6:f:fc00::f05) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Wed, 25 Feb
 2026 08:56:13 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%7]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 08:56:13 +0000
Message-ID: <7adb7654-8874-409d-8a33-309eb237e1e6@windriver.com>
Date: Wed, 25 Feb 2026 14:26:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 0/4] Oe-selftest for Clang, LLVM, LLD
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Randy.MacLeod@windriver.com
References: <20260220060252.77248-1-Deepesh.Varatharajan@windriver.com>
 <DGKHU0R6V881.3PN6D4V3SHOUB@bootlin.com>
Content-Language: en-US
From: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
In-Reply-To: <DGKHU0R6V881.3PN6D4V3SHOUB@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: MA5P287CA0232.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b1::16) To SN7PR11MB6677.namprd11.prod.outlook.com
 (2603:10b6:806:26b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|DM3PPF027BB0053:EE_
X-MS-Office365-Filtering-Correlation-Id: 748a6587-e74e-4fbd-4a80-08de744bba29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	my0/fy8at6qf2Hf66BuUyKticur9Ku3RTtt1Kq3316d4KZP3eoTv9f+Ed28p9m0wmvUVVdPkNkiPd6UZxJS1oHYW1JuwgRA7mdw41Fccf/0YKbVds+8QtdC3+z+ihJLOZtK2qpIt5A24L5xDzA6SZ9hQHA5veJWJ5iNrMNpcu9xUwaaCZppQueaiZo8wS9cC2ElcK4PRDsydjPL7Y6QbdfTiLjeavC2mgfuzB0Ubf0kH7yeV5xLW8Q+IwxWAIIoX9BDh89a7DwunQmY7ypPI6Qnm4wi6I8zXrxiKoqclvxcWUpI25msoOtK6UoXC9GUTZKYNtzD0ixAozfGKoCi4XdTpgaz5NmLoghHtRthb+bBwfNcSWUeVBZXGHcyoLh5/7zrGhwNxAUwOVKqXwMVBOtPqZjPDM+y4cZgRRVy1J2+bwi/L3MMHm2SbK6FA/x0pSlU1rlmXF8CD0ry39QTzM4mzBt+M4NWGqCdOK+lCklu8zRsaxW90NuDVxDpvS3BPxkTgaV6RsB6nViUMf/NS1H7NEaQy9RJrHDRN++7HTrF+xmQO53hXf60/qRv4/SIeSOkVzP5iZ4cH0ZWGS014JGLLVPflRdZuH0F7Cd0ALqTX1RlYyukbIEFim4PkB7JGeQ5z85zWJfU5GhOztqJ+uBxBQDzitBRReiYb9h522dxtj3O3WLFyWyTO2yqr82Xu
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Tm94NHppYnpZdTRtTDh2VXhiMCt5YVFNVStFWmgyeUNtN3M1TXltQUdVcjdp?=
 =?utf-8?B?YVBtcVd3Q2ZxTjdTOHU4M0ZNRzk4aDRxYzFySldWcldocU00VnpDdVJzQndz?=
 =?utf-8?B?M3RZYlk0WmlUb1pRMjJDVGJIMzZDRm5MMkRIaE96WHliS2Qxa3UzZVF5TC8x?=
 =?utf-8?B?ZFRDMXZGRW9SejlMWUdCR3NIWFZSclpsUnd5Z3EwTVRBUUJHT3FINy90clc5?=
 =?utf-8?B?Y2VUZXZzUy9vamYrSlpkdTl2NWU4b2QzbllVQU9nVWpYMUovNEYxbVEwcEoy?=
 =?utf-8?B?dVRUZWI4RDBoS0RJWXExZkVKZmlFc04wdldwcTByR01Nc00yN21ZS3prcnBi?=
 =?utf-8?B?SFFJRE9uRXBiMHVNVGNxSnIzT1Y5SU9DQkNPaXRxY3JWdnRlcXNRU3I5U2c4?=
 =?utf-8?B?T0lRZ0dFRys0TFlpc3B6cFJPcVlaM3VzTXkzemU2RWczNTVaZ21RR1FiNHMr?=
 =?utf-8?B?WmZ0ZlhOZkxQaXpsbCtxbXJPWXRseDNLdTYrNHdoSEdRRjR4RmhtV2hzdGI2?=
 =?utf-8?B?MytVL1QxWTNiZHZUVE1uRTg3T3pXdGpVdU1oTGtoR3F4RGhTbUZOSXQzY2lG?=
 =?utf-8?B?ZzJYWTk4ejdSLzA4Q2FGTEFFZUwwY3N0cS9MWWtnMDRwNWViUjdlSjR0T25x?=
 =?utf-8?B?MGxobWhQZEoxV3pId3JKYW9WN2Mvd1FoeTc4YmtzMStEL0hHcHJRT3QweE5X?=
 =?utf-8?B?ZFBPM0MvSURQQ3BMR0M2YzJzMmFQc3FVTFFGSElIUzdIb0U0d1E3TTdOU3dh?=
 =?utf-8?B?cFVyK1lkYVgraVhUa1lCWVZuYlVSQXJJSVFuVVlHRmV6R2h3UU5HS2c4Y1lL?=
 =?utf-8?B?YjRMdkIzeDJ6L2kzNEprQmlFT1hWc1RtWkJHZDJReUU3MDJCYngzbllKaUpW?=
 =?utf-8?B?K2F1R0lyVXRDUlFrZnpvancrV0NIaW53SFZhZGg1ajl3Nnc1S0ZNUUtreWEr?=
 =?utf-8?B?aStDLy9ZWEFhSTRyNkc5cDB2VDlWbWRkNHlHeGZ1ZXVQQTlNVFFEQmtvSW1y?=
 =?utf-8?B?emFVTnVSMmZLVHI2bWRWeHhaVVVTTjcwRVFaZkVzd0lsNnhpdk5NZ1pOT2Q0?=
 =?utf-8?B?cE1LREltZmVaUXBtbDlJWUVnNlo0R0pveGpQbThVcmVHaENkY0RFT3NhbVlL?=
 =?utf-8?B?dlNHOWhTYmdGNWY2L2dIUEF6ZzVmTDQ3OWZ4M2RLV2pKMlNDcTl1YXJtei9W?=
 =?utf-8?B?Ti93YW8rMldEb0JlNXkvdDFqdjRiUy9aZjRNTGNVbkNVdnN1RWJEYXBYMkM2?=
 =?utf-8?B?NjdjN3lxUjVNaVBicXRrVnVNZ0htOExRUGJ1M1RXZjhoVTRvUjlicTlFdWtL?=
 =?utf-8?B?VjRQZExDV2lvaEdSM0ZhVTJzUU5JbTZCQ2l2NGZBT0FRbTU3ekQzZ1hTNGIv?=
 =?utf-8?B?OFNTRVlkSTFXelpKSk9KeXZVMHZNZnlBV3gxck9yK3pnQW91ZG1Fc1FXODcw?=
 =?utf-8?B?dUhjM2hpVm1xQnNkcWQ5T0dOUTNDbFNSUkZvYnV3VWxYay9JdkhEdm44VlNW?=
 =?utf-8?B?amJyZ2pZb2ZBODRhSWdSWVpxY2tLekNlcTZBcGQ1QVdEQ1E2bEdFTnFseXJC?=
 =?utf-8?B?T2l2d0ZBK0UrY0ZoSGxPUEVEWEJXTE5sN2lkRVkvbjlDTTZTN2UrUjgvdWxE?=
 =?utf-8?B?SWlVUjVEY3lnTkFoaUlqaTF4MXcvZnNXRzNNUFhNZ09EUDhjVE50c05ZaEl5?=
 =?utf-8?B?UzhaWUFRZ3Z4djhGWWxtTUFQUjMvc0tsY083WGd5TUlRRzFiZ21LTm9QQ05G?=
 =?utf-8?B?eEJhUWRKbXdTREhhNExUYmc0THNadmcwVDFrMExubitlQVN6L3ByczF4V3or?=
 =?utf-8?B?cGJxM1p6U3VOM3JqbERiU0lTRlBXTHU3V0FYbjdnbnVreFIzUWdGc3dheld4?=
 =?utf-8?B?TFo1UlRMeHZrUVZHQzVUZEdkWCtiTGlRNnZraEVGSE1saVJEb3ZCZEw1b1gy?=
 =?utf-8?B?SWxGSzhidDkzRmJZV1FFQW9kd0J4SXhrdGhzU3owV3hPZ3hlc3BZOGZkK09D?=
 =?utf-8?B?eXQyc1JjYlJlSW80a09nRFdJaTJ1NERlM3k0YlRqN01ZWU51UWs2Y2Q1Skdp?=
 =?utf-8?B?cy93a1E2VWpyNVNaWit5T3h5THZsZGd4VDZQMGd4dDkzOGJrbFhPTVlLTnBo?=
 =?utf-8?B?K1hwRDE1Qnc3U2JBRElGeER4ZVp1eWpUS1QwVXdLSGtDV0NIOFJmUzdBZWpN?=
 =?utf-8?B?NUtnbE1VRUxwSkVwVUI4ZXkvVlNvMnI5TUtqNXc2bENGMzFmZ0laNVJzcU0z?=
 =?utf-8?B?dUFvRU1LTWpKNVUyVXYxOFBudS9uRnpaRytlYlB2V09lcElxUGtBV3lFc1BQ?=
 =?utf-8?B?Rk9HZG0yOEFqTTBkUSszMUZsMFByOUZIanBHVk1uNE9Tb1dUQnRwNVpiWjE5?=
 =?utf-8?Q?ENxKhZ7SfZi5ZwvwOB0DPoh3acOMHZDhSf4x1?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 748a6587-e74e-4fbd-4a80-08de744bba29
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 08:56:13.2182
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dmAAvO26Vbn+jGZZPdmcOXBP0S8PvK6m120lCd0jMPM0XWGunxnoohg29AbvQ7fRD3zdmzeBeeFEhv0AVGmt15KwsTrX0GcolANNAYen6vSPSa8+hx7msAdqv1vdZ+dJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF027BB0053
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: OkCcmGBkCfDtPAzNmZuLy6U7T3rPJ8OG
X-Authority-Analysis: v=2.4 cv=Bo2QAIX5 c=1 sm=1 tr=0 ts=699eb930 cx=c_pps
 a=I0dIGTHPrmtoUi9UVMbYOA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=iGHA9ds3AAAA:8 a=P-IC7800AAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=O7ALaFozQm_kpTQDMWwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=d3PnA9EDa4IxuAV0gXij:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 7ITBc_Vcrio8xj414UcghFkUf5dM0OWz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDA4NiBTYWx0ZWRfX0m/TQS8w3XYl
 w2P9YvezYnQBqbKXHFcwvS6vopZZFR6py77yFULaB2gSyNvmvEs0UxPuiQDQJiknWXX+TZQM7MP
 PbMY02+I2Vqqcor2CQnW9Og2cDXkbZk97YOtjXRB339R/Q8KCgFlfyEBZdhxv68nbGrKN6JmufG
 tAxYiKB5PYSNkebOr+aygYK027f5mBWs8TjFyP9fTHuCp+PuBILG72j56eqxZdcE8IhTjtOwvxQ
 jz9pxouINygz0kOhqv+YsotsmDvD77V09/H5IIhQBH7VVAxNcwcRFQkyB7Zl4YffUN+NnMgnTrf
 5r6cTvEMGPtnqOIuhoW45KhXCMHA2r1Rut7UUZymkmOBFLUC8C+MJ+qFoid2GsSa44yRsWllM+3
 7OuJ+nrwDCXAzIZG7a9GHNzFZfm4vXc+dCdR+urwbsqlUcH69DNXGzU79AkFi5gZSzEuRwEg50i
 6foYrdfz1PiRukHDHQA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602250086
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 61P6XnH61697245
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Feb 2026 08:56:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231942


On 21-02-2026 13:53, Mathieu Dubois-Briand wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Fri Feb 20, 2026 at 7:02 AM CET, Deepesh via lists.openembedded.org =
Varatharajan wrote:
>> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>>
>> This patch series introduces a test framework to run selftests for
>> target builds of Clang, LLVM, and LLD.
>>
>> Summary of changes:
>> -Patch 1: Disable clang-tools-extra tests, as Clang's CMake cannot
>>            detect the llvm-bcanalyzer target.
>> -Patch 2: Enabled the necessary CMake flags for clang, llvm & lld test=
s
>> -Patch 3: Selftest script for Clang, LLVM, and LLD including exclude l=
ist
>> -Patch 4: Fix rust build failure by replacing target llvm-config with =
native
>>
>> Testing:
>> 1. The test suite has been successfully validated on x86-64, arm64, ri=
scv64
>> and arm32 for all Clang, LLD & LLVM components.
>> 2. Clang and LLD tests passed successfully on x86. LLVM tests are skip=
ped
>> on x86 since it's broken. A follow-up bug will be filed and addressed.
>> 3. Clang, LLVM & LLD all together ~80K tests are there and we currentl=
y
>> ~250 tests to exclude list which are failing (0.32%).
>>
>> Impact on build time:
>> These builds were executed in a controlled environment without poky-ss=
tate
>> enabled.
>>
>> Default(without changes):
>> |  Target   | Run 1      | Run 2      | Run 3      |    Average     |
>> | --------- | ---------- | ---------- | ---------- | -------------- |
>> |   llvm    | 22m18.441s | 22m31.905s | 22m23.718s |   22m24.688s   |
>> |   clang   | 30m09.774s | 30m22.680s | 30m15.312s |   30m15.922s   |
>> |   lld     | 1m26.994s  | 1m30.415s  | 1m29.006s  |   1m28.805s    |
>>
>> With the testsuite changes applied:
>> |  Target   | Run 1      | Run 2      | Run 3      |    Average     |
>> | --------- | ---------- | ---------- | ---------- | -------------- |
>> |   llvm    | 23m32.104s | 23m45.887s | 23m38.157s |   23m38.716s   |
>> |   clang   | 30m31.402s | 30m46.198s | 30m39.445s |   30m39.015s   |
>> |   lld     | 1m29.845s  | 1m34.212s  | 1m31.925s  |   1m31.994s    |
>>
>> Comparison:
>> |  Target   | Default Avg | With Changes Avg |     **Diff**     |
>> | --------- | ----------- | ---------------- | ---------------- |
>> |   llvm    | 22m24.688s  | 23m38.716s       |   +1m14.028s     |
>> |   clang   | 30m15.922s  | 30m39.015s       |   +0m23.093s     |
>> |   lld     | 1m28.805s   | 1m31.994s        |   +0m3.189s      |
>>
>> Impact on tmpdir size:
>> | Metric                               | Size  |
>> | ------------------------------------ | ----- |
>> | Default target `tmpdir` size         | 74 GB |
>> | Target `tmpdir` size (after changes) | 79 GB |
>> | Difference                           | +5 GB |
>>
>> Deepesh Varatharajan (4):
> Hi Deepesh,
>
> It looks like some selftests are failing:
>
> 2026-02-20 20:32:17,178 - oe-selftest - INFO - clang.LLVMSelfTestSystem=
Emulated.test_llvm (subunit.RemotedTestCase)
> 2026-02-20 20:32:17,179 - oe-selftest - INFO -  ... FAIL
> ...
> 2026-02-20 20:32:17,179 - oe-selftest - INFO - 3: 1/1 8/21 (298.44s) (0=
 failed) (clang.LLVMSelfTestSystemEmulated.test_llvm)
> 2026-02-20 20:32:17,179 - oe-selftest - INFO - testtools.testresult.rea=
l._StringException: Traceback (most recent call last):
>    File "/srv/pokybuild/yocto-worker/qemux86-64-tc/build/layers/openemb=
edded-core/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped=
_f
>      return func(*args, **kwargs)
>    File "/srv/pokybuild/yocto-worker/qemux86-64-tc/build/layers/openemb=
edded-core/meta/lib/oeqa/selftest/cases/clang.py", line 184, in test_llvm
>      raise AssertionError(f"llvm-lit failed for LLVM: {output}")
> AssertionError: llvm-lit failed for LLVM: sh: cd: line 0: can't cd to /=
srv/pokybuild/yocto-worker/qemux86-64-tc/build/build-st-177928/tmp/work/x=
86-64-v3-poky-linux/llvm/21.1.8/build/bin: No such file or directory
> ...
> 2026-02-20 20:32:20,596 - oe-selftest - INFO - clang.LLDSelfTestSystemE=
mulated.test_lld (subunit.RemotedTestCase)
> 2026-02-20 20:32:20,597 - oe-selftest - INFO -  ... FAIL
> ...
> 2026-02-20 20:32:20,814 - oe-selftest - INFO - clang.ClangSelfTestSyste=
mEmulated.test_clang (subunit.RemotedTestCase)
> 2026-02-20 20:32:20,815 - oe-selftest - INFO -  ... FAIL
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/66/builds/3243
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/58/builds/1069
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/42/builds/3147
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/28/builds/3165
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/5/builds/3151
>
> Can you have a look at these failures?
Hi Mathieu,

These failures appear to be intermittent and were not caught during our=20
testing.
We=E2=80=99ve been able to reproduce the issue locally and have implement=
ed a=20
fix. V2
incoming.

Regards,
Deepesh
>
> Thanks,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

