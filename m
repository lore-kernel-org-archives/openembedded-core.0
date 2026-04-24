Return-Path: <li.wang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D370FB44C9
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 08:09:09 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16540.1777018139302337417
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 01:09:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=l2k5Unnc;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8574518e23=li.wang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O4e3YV1640065
	for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 08:08:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=+8rAgiGPXGf/ts5svtDkufoJpSPBToZ/iLVXICpp9nk=; b=
	l2k5UnncedC0eUKXNLoMb4zzuxCbpXneHofphWA9gG21omLiFG95qCfJYdYPA8+l
	iH1P7RawRYfXejPwMEK2TkR5qpzwBp26V2wkdWAdH2wXS/q1wX3bjoPA9L0QCxJw
	1OnMmqvxnDFfwFXSU4XoW/fedqf+vUaC5r1sZFR8eqlMlZXO8OwU+XV0tZmbji04
	yhJ1Qe9vB/aq1IV54Uii5bHGcfcmFs6QP2q4yha5lG+ZUNitWoukvn734EFKCM4j
	ybs8GveU5RlFOuQqco8YFp6fFLjI5yHYjG/xhihQTMKy3a/jfA50Z8lk7dRVaWEY
	o43GTWDlpEX1+HpJOssfiw==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012064.outbound.protection.outlook.com [52.101.53.64])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dq8u89pyh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 08:08:57 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Md305YCQ3JJhXz8ifI7Y39t97cLXbdNLl7qCEXNHAqlluw/yOaO9tCoYxgzhLSp2nl/dw3rAza5OqYC/D+hkpl7m2WalDtUalijBzsEs0duTSV/JjHBS2sxpiCb5mdVG6cH8wq76BhWICCU3/N53TUPKxJqpxHqu3G/VlNy5WIbPkMXpGPZarnE8/9j4rUYKL5Rp3s4Tj3452Lwc0uzspKs0R5YOYUPvY0j4fumxQU1HHVvZkXyzmF/PBUyhGAexkDJxw3mECkwi6ky8mDZYi2XygQVfl3pFyAcf6ldfdxWPS+QKNoM2eAgBnRa8q8SM587SurN+sYoHSxnRaNGeWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+8rAgiGPXGf/ts5svtDkufoJpSPBToZ/iLVXICpp9nk=;
 b=VpCgoNvd5mXaCCnFLwocmWnnNEJSqZsx0L8EzCIhAzL34Nmq8cX/WgtDB4oEeCQXaoqGrvAeay2p6/akoVcO3yYPQDXoCQrX2a/4caQWa7d3TFbGPwnp3YfKUn0e6Gzi4rY5KEJGw0dj2I48G/vC+9G5nxFE51402JA9NQZKrqr4/BV95R8J3mfZak4Shz+8dxNJaPRgeVvJZD5wEeO6GcS6eSlLqygYV/e513it4/ic7rz+cBc4BEcCzu0SUdlSzM3qjNa0RGM7SVm+VLdiOVyLUbjbcN7XvSqt145sHZd9Rxy3TUFaHTd4cxWIwwBKC25bGGrV2F1W/ofPWGV1fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV8PR11MB8697.namprd11.prod.outlook.com (2603:10b6:408:1fe::17)
 by LV4PR11MB9513.namprd11.prod.outlook.com (2603:10b6:408:2e4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 08:08:56 +0000
Received: from LV8PR11MB8697.namprd11.prod.outlook.com
 ([fe80::5e93:9ab7:9ff5:7631]) by LV8PR11MB8697.namprd11.prod.outlook.com
 ([fe80::5e93:9ab7:9ff5:7631%3]) with mapi id 15.20.9846.021; Fri, 24 Apr 2026
 08:08:56 +0000
Message-ID: <67c6a54c-91bd-4e5d-a4c5-c2fe7bd9ed85@windriver.com>
Date: Fri, 24 Apr 2026 16:08:47 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf: disable llvm by default
To: openembedded-core@lists.openembedded.org
References: <20260424064804.3331766-1-li.wang@windriver.com>
Content-Language: en-US
Cc: Li Wang <li.wang@windriver.com>
From: "Wang, Li" <li.wang@windriver.com>
In-Reply-To: <20260424064804.3331766-1-li.wang@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SE2P216CA0181.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2ca::13) To CYXPR11MB8691.namprd11.prod.outlook.com
 (2603:10b6:930:d5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8697:EE_|LV4PR11MB9513:EE_
X-MS-Office365-Filtering-Correlation-Id: 54710032-7fdc-4a4c-dc5b-08dea1d8baa1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	OMSkV94J4KIhbNdXBzgJjr/mcuOBIV8Y5P2PJ1N4xPXfdXd7SF5hGXGtMLpiS0p1nwD7bcr0FGT4dGhRDUMzXqhQbIvzIgQqUgOIMFGZE+WWgnCF2E6GUtqS38hVK8yIAccdM7xA279UIscBgUC3xyx19pGe4roXgtEZn+/JmTY3orBdM/upJynm/BY5m4AFOgSmdeQciIrSD7C8hdKVlH97S96w2e7JaAFfF1bnZatiqDcSUSe9UNLkaZT2c7uYZk/JQYSu/p++bSAZsLhkas74W0Avkf3HwRE3TUR0Gv8APiRYZJYaaKVcxz8LZoIXNxh0A6a83qOhomRho6Cus7ZU5IATmfw4fbmNvQlsqMjLO2nxof7d1zuDka3z8P0NZFwbnxNbEYgUmIfvGpS0/9/bO24/lf0kL+y7HSmlfZ1QJlN0UYl1ec4ux95BEMKnjY1EM35GsqRTdwsOTxYlSp7BsZomBSiwCa0ZGPeK+yB+XlX+vRI/lUCn5v4t5ESCfScqbqvAanxU7jpOTpqOaHtUScxmjgc8O4WcCV+bLEHVdHXB4zocYO+FPclyUHwmvLLnOC8YOhXqGonT1UgZfkDz6vhkk1KGo9hhRNO9pJg2Zdj0IP4LEJe8PhSLuIPVTIADrPseNVUB8g4BeJWelHFJNjP4+J/RRRiwCuNq1+H/zb0gyorSqHKz1uG2fxH1QlN99NpgdTX9ZYOOt+Qyu0T9ZJ7rMcdE1rA9C86rHL8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR11MB8697.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bmJXbnJNZmJBaHkybUltYW5oUTA1Wk1pOTZNWkk1aE85R2MrbkdXVkd3enFE?=
 =?utf-8?B?WkFwUnB3SHdWWmNycTMzbEJXMDdCSWtoZTlEZmZxaDNxQ0V0Rm5FVGttd1dj?=
 =?utf-8?B?V1JkTXBYMXdNTkZ5QXhWcGJJc084UU4yakRucExWMmNWb09QOGxHMU4xTDhX?=
 =?utf-8?B?L3U4MU5NYUs1UWZMSW16RWhsVWJWMlZhYzVMR0FJakFZRVBlc2VURE5mM3FI?=
 =?utf-8?B?Rmp1UHFFS2RjdC8wM3lBc3RFY0hwN2dEd0wxWkhYMkNLMUpUZk1mckczSUpH?=
 =?utf-8?B?Y1lKRHBTVHliQ0pXMWFJYWk0NDZiaWxMQ2JBSGVPLzd2ZlNpK2NMYlU4NDVk?=
 =?utf-8?B?QnhyNHJld29lckdWZWZ6bWRJSzBHVnMyMmExQWdsS2VGd3BCSlNqc3JUSnpI?=
 =?utf-8?B?L1EwTFVPbEY3TE1YYXU5SnJ4NmViZ3FnNHo4cy90RGdKOVp2ZlpZWXV5YndS?=
 =?utf-8?B?Q3diNTJxQXRoRGd5ejJQTm1UVmJxeDlHR2owNGx2SkQ1UjFzMzdOVndGZXJK?=
 =?utf-8?B?Q2N5bjBEVWp4eEZSK0MreGtScWdURGxDZXhhQmQveHZNOThBVTRMZ2NZZHBm?=
 =?utf-8?B?eE5GWFFpWGZHYVJyNHRuTDJkVEtKVHZkSzZKSWYyK044ZzBmUHNFQVpEcmFn?=
 =?utf-8?B?UlR1clpaOWtWNVo0ZXB0MVNZd1p0YnpPZ01zR3hocmgzQUNwYTVib205SVE3?=
 =?utf-8?B?SnV5M0VGL0g0VFpqaUw1TWxSZmQ2SFpqczN1Si9rV25lQWFjcHBLeFJMVW83?=
 =?utf-8?B?S3JQUng3UU5GcC9RYTlrWndua1pDVGM4TWhoVlJwc05Bek5IeWJvRjlJR3Bx?=
 =?utf-8?B?NnlIa1FNVVF3WUpCMHM5N3A0OEV5VDNpZ3lHVm9hUzFiTXhUL0VaKzNKeHl5?=
 =?utf-8?B?emR1M3VDaDluRlNqMWswczVUdUI5V0pTMFA3Q1A5NWtQNkQ4Q0QrV3UvWk1N?=
 =?utf-8?B?cndZVUZFVFI1Y3JKQ0VKcTIwcVh4UTN4SkI0YXV3Wk4wMjg4NW50Zm1jQkZS?=
 =?utf-8?B?VDNudmVZMnB1K01TRjB5aEMzTEpxTWh2bHdCL2tneXJFL3lvT1RzNnNETklw?=
 =?utf-8?B?czdvaHAxWk52YnhtczlBT2Q0WnlTUnZxVU90K0t0cWtFQTluV3RQMFZJZVBW?=
 =?utf-8?B?b1dBdWgvcTdRYi9HVHJ1SUI5UjZmTGhmRnM1bFp0VHlyUS9MOVJnMGJ0c3Nh?=
 =?utf-8?B?a2ZkRFJTaitJVXY3SEhyM2lQTXdwb04wdjNqWU1maDFZWW5VYmYya29iN25P?=
 =?utf-8?B?MEZ0TElQSnNTY3l6bEU4SFErUFVDdkZKZ0xPaitUVHNTb3IxMS90YzJQQkc1?=
 =?utf-8?B?UUhXRDY5enk1Qmg1bURXU21uYkQxVkVweDJRRDc0bitlajJ2WWdWd2tCeDRE?=
 =?utf-8?B?VnJvK3lIbFp3Z05WZm10Ty9XL3licTlsYkhxejZibUlJZDFicCtYb1JJWkhQ?=
 =?utf-8?B?ZDRIQ1didVBEUjdUcFEvek9EUGxDVXpDMnFwVGJHWGpKeVZPNFVOUjZneGJn?=
 =?utf-8?B?ZUpkdzlGY1VkQUljb1FqUnMxdFJHSnpDWnBZbGc1aHRQallmK3h0OXljYXBM?=
 =?utf-8?B?SnY4ZU4vWndYaEhjclJQUnhVOHNvSGtvZ0RyRXlGTTRIK01vakl1anF0NFR4?=
 =?utf-8?B?UFEvSnJOTnA0eFdEbWRYMkhMWkF1ZnErclBCc1VZa1duU2JoNDVwOG0zSTVr?=
 =?utf-8?B?WHVjMmhQZEVHaUcxamJ5QW1RSFZZQzI5NllYbmpXVW4xZGc1aXVkbGFhR2xh?=
 =?utf-8?B?aTBEbFZ2cjdWZjVtTTJzcEU4cVN3dEtyRnY2eGRFY3M2QnNNSXJkR2szQTlM?=
 =?utf-8?B?bjRwY3JuYkdwcjJXU0hwRkFicWdxdWMzZWVISDdndnF1SFBEdSszZmdSb3NY?=
 =?utf-8?B?dllCVWdmQ21ZMTd6ODF5R3ZUQVFkcUk0cTdpOW1qRVRGQXRqWXpoblZjTEJT?=
 =?utf-8?B?M3BtdjlQaEZUalVwbzV2SXVDMTRJRG5uR2Fvalk3endJOXZWeGlxUnJlVStH?=
 =?utf-8?B?SUxGczRxNVZ3c3R1V3I3akUveklpRmgzdXJyL1ZaWk0yOGlHRmpkVVhpd2Zq?=
 =?utf-8?B?WlBmdXIzSXRNMWFQNU1ESVVWNGYzUjAzY2NUeTlLNXZZZk1pcXlWMU5LZzlI?=
 =?utf-8?B?REJxQUIzUjZzNXk2ekRXbkhNUEU2MEV6RDYrbWpVT2tLaVR0REFNUEQyZ2NJ?=
 =?utf-8?B?OTBwODhxc1NRZm5CYVpYOVllWEQzK0trTzBGMEV4amV3UDVCcjE2Q0RsRnBM?=
 =?utf-8?B?YW9zdWJoSGtGOHpIWlYyNk5zbUlqTElRY2ZRR0srdUdIZmJGVTI5UVhkZGl0?=
 =?utf-8?B?L1g5WTRzVE1YdzgwZzlrVWZCMzdIUktwVXdyREJZM3lRRzJvaVZ1UT09?=
X-Exchange-RoutingPolicyChecked: 
	XhClaLjWB3b3nlUFye6pqIQF0ycLcqcSwCp8hSyrl8WDFjp5Kau1Ch90Xb6BZh5qNQCs+ZNf4ehTlGNbgE9lDaR1GPMWSj3e9vLI97fEIBQaOre90YwgV+jkKywVEspouzD06eg4jz/PLPSMfph92632fOQeuVcpc8DpOcshs2g6Nmu/I9hGUBMki6YsIYeNMzVUISF+2ZeW+pw/e7tW9ez5hSbSbkCr07jk97lqsx8uzvGF4RBioB+4NyGgXt3eWgIVqBxOMjfA6J6m+QJmyWv9zSEg9CJO7GPIrn36P0EpNTRtslDvnkhqarW1DryoKZSSPDrZQrW4Bo7vBm1jDQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54710032-7fdc-4a4c-dc5b-08dea1d8baa1
X-MS-Exchange-CrossTenant-AuthSource: CYXPR11MB8691.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 08:08:56.0754
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 00+m2/+nUOQ6+jpHcFOys9WmJlZgpYr8zwqxUrKjL9A5cREz9QrKgp9wHrCVDAc2hzk7q/qJhAArjaqD+zk3VA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV4PR11MB9513
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDA3NCBTYWx0ZWRfX7WqvgG8SIdC2
 ZwtiYxepGejjqeS1exMSXIJSfyk0qW95Nxge18h02YgxKeudwD3MzeJh4CtQx1gOgK79geIersE
 qO8XaIwkgSVWEUjoE3WpOrEL+OB6UWw3cHieIGm20qGkwjgcY6K2rn7L2fX2G9vk9VFE1y8Q58P
 lvLjTwSsXqz9fn3sXsHzLWUBENIaNfWBmnGeFWsTlT+2zY1iDCQevteNaWq6EoXQHoaTvx0uJVr
 rv1wDSLfPfrBQxNam3WDnX9zk9zPZWpy6uw0VKPXwNhje6igqPAV3px1n4laQjPcCtLO+SULZD2
 IiZ5PQhj5JUII6EufQqH/Lu/TNt1xI/5TvkWWx0VyxapksylQ8lO9V9d1MYhEp8lTDiamYACHAS
 /dyNZmHfaE/CpuxQ+Ny9CiSEsEcgDl4aRLjbbTpFrNeBLltWVxYvWdf7LidDjCbahQUYoWoTrvV
 ppWmJVBWR9JR5WAPRCw==
X-Proofpoint-GUID: 0BaHFY7oUSsNrNwK8iQksPPmzqGntDag
X-Authority-Analysis: v=2.4 cv=WLNPmHsR c=1 sm=1 tr=0 ts=69eb251a cx=c_pps
 a=BYzTVJwijQ+wlo0xVi9Hgw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22
 a=t7CeM3EgAAAA:8 a=OJW0wz3wZG3RevqjeBIA:9 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 0BaHFY7oUSsNrNwK8iQksPPmzqGntDag
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604240074
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 08:09:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235842

please ignore the fix patch

On 2026-04-24 14:48, Li Wang wrote:
> perf.bb does not include any script about llvm. for avoiding to enable
> llvm option under uncommon condition, force to disable it.
> Maybe a future improvement would be to add llvm function.
>
> Signed-off-by: Li Wang <li.wang@windriver.com>
> ---
>   meta/recipes-kernel/perf/perf.bb | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
> index 7a58088462..f9e2b9f4ee 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -114,6 +114,7 @@ EXTRA_OEMAKE = '\
>       EXTRA_LDFLAGS="${PERF_EXTRA_LDFLAGS}" \
>       perfexecdir=${libexecdir} \
>       NO_GTK2=1 \
> +    NO_LIBLLVM=1 \
>       ${PACKAGECONFIG_CONFARGS} \
>       PKG_CONFIG=pkg-config \
>       TMPDIR="${B}" \

