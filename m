Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FD42C3DA59
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 10:20:27 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.34809.1721038821803647302
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 03:20:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7926f0b3a1=kai.kang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46F82IXQ004891
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 10:20:21 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40bgj61m2j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 10:20:20 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 46FAKKIS005061;
	Mon, 15 Jul 2024 10:20:20 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40bgj61m2h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Jul 2024 10:20:20 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j6kPCSss892WmX9TfygF0ypekY4twUhvIEYre4d8yvalNa1ff3c56nkRBR+rOwd8+vKTmvYoMzSsuXeJberYVcybM74kTGzfhlUxL0I5dHqv8wBYUxhZXmXZcC4IawHnYfroXqOc3qTtOc2xMnLvIvh7j9X8X8pkq5HqAy8Q1aAGRrUDset9MeB6X3zGCtKOoUlTZvhj3PNvYvDHW9cXuxi/bjZpCjaFcmGitiy4YcC5Y7Xip3jrGDIdiDSPkrEhZIbE/QTUQoMAnJU9UahzC6yEHo8mznYEKqJWwleGM/BN4N3w/DIgMhYZ0fMRd0miKRGg0g5L8qF1wdHVjup/8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IhADb8GDle3ytNXDs8QnWQkIR25IJ9opoq+WK6ssNhg=;
 b=UxUcfqMS61rRzQjUeQE/wshG0dRmbsQgxpAFfAQFha4TfPw6TbBriykNaceF7kdqSHIPEFjJ4jb+n3jwlRmOcZzKEMkhA87x1pAmemKwoF8I2vPLUP9Ca3iyAeLeU8iqeiq8d4ti14cjCHoKSVSyU/qcVroGG1oL8CTc89Pot6qViDn2zzoZYHhjEfPrO5+humjCpSiyA+ngn/j9kbx0ax4fZYuz6bFdLqkuS5IptTlN5L2A9tIZKKA7NT/S/mD+shytZ+PaOW5JpbZKb1BD5l9jgm1hL5/AyjummSJ/g1A28NeV5kCqUYS6a6HbxjEbxG+7vee9HzuvbbU/AYFZQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB8264.namprd11.prod.outlook.com (2603:10b6:806:26c::17)
 by SJ2PR11MB7426.namprd11.prod.outlook.com (2603:10b6:a03:4c4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.27; Mon, 15 Jul
 2024 10:20:17 +0000
Received: from SN7PR11MB8264.namprd11.prod.outlook.com
 ([fe80::e92:66a8:56ff:f569]) by SN7PR11MB8264.namprd11.prod.outlook.com
 ([fe80::e92:66a8:56ff:f569%5]) with mapi id 15.20.7762.027; Mon, 15 Jul 2024
 10:20:15 +0000
Message-ID: <6a947a6b-4052-413a-bd90-fb460be51ce5@windriver.com>
Date: Mon, 15 Jul 2024 18:20:10 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v3 1/1] gfortran: update runtime dependencies
To: Martin Jansa <martin.jansa@gmail.com>
Cc: richard.purdie@linuxfoundation.org,
        openembedded-core@lists.openembedded.org
References: <20240616153135.3058410-1-kai.kang@windriver.com>
 <20240616153135.3058410-2-kai.kang@windriver.com>
 <17DA6AA6C1087792.28936@lists.openembedded.org>
 <CA+chaQexmQso_xy45yCMU_EsVDq9RsX+qmmuuVb3r8ur3XQe4A@mail.gmail.com>
 <7001a7c7-f500-49bd-ae2b-711d42a97f06@windriver.com>
 <CA+chaQczh+jy5tEz67r+dcLUJzV=tpnbMad3dHGGR1+KOmLFbw@mail.gmail.com>
Content-Language: en-US
From: Kai <kai.kang@windriver.com>
In-Reply-To: <CA+chaQczh+jy5tEz67r+dcLUJzV=tpnbMad3dHGGR1+KOmLFbw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SJ0PR03CA0167.namprd03.prod.outlook.com
 (2603:10b6:a03:338::22) To SN7PR11MB8264.namprd11.prod.outlook.com
 (2603:10b6:806:26c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8264:EE_|SJ2PR11MB7426:EE_
X-MS-Office365-Filtering-Correlation-Id: 142c9a61-a24d-4201-e3fa-08dca4b7b833
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|4022899009|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VlFWUEdzS3lwNEg3b1VQRWtURlhxdFhBYXQ5MjVQRHgrMUpVakdUZzVtTnFU?=
 =?utf-8?B?Nk9oT1hrWm9PSXRPZndidER0akZNT21LQ2Y0ZWZDUnpXMXlZOE5CSWsyWmJ4?=
 =?utf-8?B?NDZCaDRNOW52OFpaWWZjY2IvTlFiVVB2RjVMazRUelZlT1ZZOVF5N3FEVzND?=
 =?utf-8?B?dXVoQzU3SzVVL2NSbnhYNTJSV1NkRjdLK0lqUHEwMUQ4d3lHclB4dGZRTWlU?=
 =?utf-8?B?S1lEa3ZyMGxoZnExdUQzV252WnFYNy9peEsvZ0JsNkVhZW1iQ2t4U0d6S1FN?=
 =?utf-8?B?VzAzazVuZDdpdmdhckhJZDR3bzJ5M0IzdFEvMHlFSURDQjE1QWUvdzNDYk5h?=
 =?utf-8?B?ZGRud1N6NTg1TlpUZUNEVjF6bk1zejlpY1FGekUzSlIwWHFGcjQ5Z3ZUUnRu?=
 =?utf-8?B?SXB5RWFma3ZsRDhKMVlVaUhwWG1mSFlkV0ZaemhvUVBwRXVpY2c1MklHcHMz?=
 =?utf-8?B?Vmc0R0k2b0U1a21ZZUh6VndSbkJZYi9hUGdabTk2MFVPQlhHaHBCUDVhVCtG?=
 =?utf-8?B?SjYyV2YvNUE5Q2UybUhvdW16Mkl4Zm90QmdSbXlTZ2p4Mk44ZDI2K1J5R0c5?=
 =?utf-8?B?TGJpaGtxTDBlYlJCYTczdWU2WHovTDNicy9BZ2oxSlN3YlZiYUFqcWtNcURo?=
 =?utf-8?B?Q2VqcFA2bXlBYTZhd2NWZUx4VzJhT1RuMEgrSkxzZVhsR2xjQTZWYmNtYS9J?=
 =?utf-8?B?MjA2RkZvU1E2YVJIYWkyREppUWdrVXo0UGpRT1dJeUQwcW1lZFdIa1BjU2cy?=
 =?utf-8?B?amRqeFg0TG5mREJmQnorK2E2aVFBcEIwbjlkajRZREl1bjd3ZHpwMHNPckxq?=
 =?utf-8?B?NEVWQlN1V2VNYUR5UWZYbDBrN1g2NkdEZzdlckViR3RiQ1hNY3dHWjhxS3Zw?=
 =?utf-8?B?UW5QSjhPL2tmdE85UWJVLy9hVGVxQUZBdys3NlZsRXVIZTlzSkU2MTNwN1Er?=
 =?utf-8?B?T0xWNXZaRm9JM0N2cktRdHpHbGNkeVJGUTdmWGg3b1RtVFRrUVMzYmZIeDZu?=
 =?utf-8?B?MGxmZiszcU5IRnVOeDFnblV1dnBTVlZlUUptdGI0d3FhRHl6S2k0Y0dLbGM4?=
 =?utf-8?B?VG5BZ2hKVk96aDNGUDIvQnRNODhrL2pkaGE0N2JZTnVrZnhQR0huNncybE9L?=
 =?utf-8?B?SXc1eHgvQm0zUldWVHJobUYrNnE3S21Kc2h5ZUl3YXJPZ0QrWUlCeklxU2Nv?=
 =?utf-8?B?WmxPZEZscEFJQmFwREJsYkl4YmJaQW1Ib2Fzb24wMzkraHZlMitCSXdsUEpV?=
 =?utf-8?B?cTRyRVBnaEgwQU1zbmdZbGJRZWdOM1F3MGdOMUwwLzhBNVg5d1dwS3hlMXBB?=
 =?utf-8?B?VmdRVkh1cS9VTE1BYjVzM1gzaC8xRnhQMVlyNEUzRWQ0SDBtaWZnQkptamEy?=
 =?utf-8?B?UGEyL3hqUFFyb0hVb0FqR3VweU96cHpwOVNUbCt2SU1DV1daZjNsbndDcGM5?=
 =?utf-8?B?SHc1TmREOG94SEpBZElVWStjbEg3TWhyQ0xidVVUaFpDblMzclFRLzVzTjFp?=
 =?utf-8?B?dUt1aVBja1RCMHptUjFZTnNHYlRBL0J1ckhPZjN5a2tyejRyWmVrQm05WW1E?=
 =?utf-8?B?NlJrZGxpZEs4WjlHb0dIS1lvT3NHUVhFNjBOK090NktidXFKMGNHRkduOTN5?=
 =?utf-8?B?dFk1V3NicXZ1U0FOZEY5R3pnMExreTZMbnFVR1NEY2NGSEFXelRxSFczUzJl?=
 =?utf-8?B?RUtSNWNIYk5MSHlwSFNPaU9MVVZhb3UySlltWjFGYi9tcCsyZmQ0WlI3NG01?=
 =?utf-8?Q?q3YDSboBHDiePW/IH/TeB72fjAsrThuUZlAQ+dO?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8264.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(4022899009)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VnZEM2liMXd5dCtIUHJNVjNtV0xBODMxbnZBZHE3QXd1bWFwd2p1MW5UWjdk?=
 =?utf-8?B?emFnRi9QMm9SdXFrVldiS1RBcUdoNHFJOFZmUzR0NkZnMyt0RkxJTDYxS2dv?=
 =?utf-8?B?eENrbzYxdUUrWXhsN1p3UEFYdG91cWIycE16WWRQbzRrN0kvdFFTNHJxYUZr?=
 =?utf-8?B?Y3FXQTYzNEowa3ozMDMycUw1UHlEWUg4V1ZaUmRRVE5OaFNzZnlUbS8zNnpO?=
 =?utf-8?B?emJ1bGZMZnR1bzhEQU10WnJwVFlKQjIxR2ZYYnRYOVhhdjdiWGRYdmJXRFoy?=
 =?utf-8?B?RGpUV0xEbjFweGdWL0xpVVN6WFhFTk1rQVMvMUlSZ3FxZzZlYjhVV0tYcVpy?=
 =?utf-8?B?Yk5LQXpoRnh4UUMzYWNCV0x2TlIzR2NXUDNMTjNmc1dhUEVSaGo1UThZeGRs?=
 =?utf-8?B?RWZuWkVISFhHYkFVanNSTUh1ZWtSMW9mMkxEVjdmNTFGV1AwWVJsUzN3U2k5?=
 =?utf-8?B?anFZOWxpSU1GQ0NUNWVWMmkrTThMbllJS2g3U0pDVWdNSXphUEc4VEJaVmsy?=
 =?utf-8?B?NjF6TFlTUExiMnlVa2k4SUE1Sy9LU1hsOGtnZDdnWXNHQk1mTFcydXJWbENV?=
 =?utf-8?B?RitDMTRmTTBXSDhNK0syK3BpWU1vVEhoc2tvdUovaE9QV1EzaUl1K3FmTUxX?=
 =?utf-8?B?WnBtNUNFVHNBV2traXVHdk83NHMrUUw4cUkxbU50c3p4QTl1RGt3WkF3eXFn?=
 =?utf-8?B?RkkxOXhiZ3FRRlFDUlN5WG1TUUZYck1QWUlWdTBuWktaV0RoaDNvN2FLRjJ3?=
 =?utf-8?B?OXBnbG11dmFuQUhhMTc2RWtTdmQxd09UZVFYWVpGa3ZlR3d2RU9YT21RTXVO?=
 =?utf-8?B?SGg2Ylg4VHcwQ1Zlb25uYTJLYmwwbFFERTV6eFRCM2k5NUNBZjFScXJZM0NC?=
 =?utf-8?B?eURCSnU4alErTlp2R2VldjhlanpZbXd3V0F3NUhQL3VXQnpvemxyNk0yUEwz?=
 =?utf-8?B?WG91dFRHcjRDdGZzcW9mQ1EzV216NnZCelYweDVYU3hnNFdEQVlPYTdCdnRD?=
 =?utf-8?B?RFAwNHFPb0pwZ1dJZi9xdmZpcGRvY1JVdWpkekJ4SGU5bDYza0FCRXZMUEcr?=
 =?utf-8?B?Wi9BK1hhQlhSd0pUSFFiZGVNTVhhQlVjSGRQdUhyTXdNalhTL3hnMWZ6RHdY?=
 =?utf-8?B?ZHR2YnJKVEhNemJVYmZWcElPd2hiUDFWTDhhNGNGdGZ0eW45UDgwSkhFNzNV?=
 =?utf-8?B?a1JPV0o1QTNkb1NIRVhGMkw2dGdVR1lpQmxOKzVWeUx6VGZ6bkEzdDJFazhS?=
 =?utf-8?B?U0o4TWR3K2FpKytjYyt2a1JPcnpBNGhrV1V5U0ZHYjhESjUvVWFPeXk2M25v?=
 =?utf-8?B?YVlINVFtdFNsY3VqNGdkSmhEMWk4MXZlN0twb0IxMnVuN0dJK0dOelZtemVF?=
 =?utf-8?B?Q1hCTGRiUHFrdlZXUEwzTlE5a2U5RUl6UjFiTVF6Y3dCRjRxbDRWMVo2ZHRa?=
 =?utf-8?B?enkrZEVlRW8zVVZhdjczQ2hqNXh4d3V4cStQaXg2Q2tGTEF4VlEyRnJTeXZL?=
 =?utf-8?B?YzkzOS80V0MvNVpKMTdVRks0MkJZS2xMdjhpM0MrdVBybFVpbi84dkhVcjkv?=
 =?utf-8?B?cHgxV1Q1dE1XczFNWDcwZWVFVWNtYllpZEZYN1BqT1FjakpYWldwa0VZaUJy?=
 =?utf-8?B?ZWlGeWU3MFZtbTJkR2dRbS9HK09DbExQVTdQdlg3YUNJMVRVTXVXTE5xMlNx?=
 =?utf-8?B?ZU9EeCt3Zm5WVHMwM05VcGorVWFFZG1KZFJBSmF0a0JRQVNObERPUFQ5ZFNR?=
 =?utf-8?B?b0crN2pXWmZFMGFGcUpvUGdGRnp4M1hHQ2lSVzMwbWN4QU1pTVZ4eERwVGZF?=
 =?utf-8?B?V0QzQ2pzSG1saEdhWm0vYmxnbWpjV1lON3hoRGl4d3dBY3F5cUo2NjVXdDBs?=
 =?utf-8?B?S3VvY0dTMWhGYVFjdFE5YVAwei9LcVh6ZVBBeGhwb3R6clVVYjljNmEzQTJr?=
 =?utf-8?B?S3FRbXBQZ2ZNQXVMU1Q3bVErWEM4cGl4NjZGaElGbVdQRlIyTHBJTzVXSkRW?=
 =?utf-8?B?RWp2aXc2N1Z1UXJwMi9FdUNPQjB2cW5sT2JUWmFFaUtjZk1DTm9QNjhOMzZu?=
 =?utf-8?B?OUVGbXdhNzBZTUVsQ3BqOEovcnRsckRpQ3ZsbFdwYnNEUDlxKzZmRURUQkF2?=
 =?utf-8?Q?VPh4OQpCBwbRt9Y+CnFnYPO0s?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 142c9a61-a24d-4201-e3fa-08dca4b7b833
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2024 10:20:15.7471
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HPAME9X9YUVcebT5Mq/mwTBeT5yqjjv6zBguvkdIPRFuT5MyFr2PPaNq0mUrU8rt9NHBIYE9+KSW8NbNzEU5ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7426
X-Proofpoint-GUID: nC5klk4FIVQTYu3ryV5cBXkpuVpygfGx
X-Proofpoint-ORIG-GUID: CTLdbDBFTzEOBBwSDmOS9QYAdz5gpqI4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-15_06,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 mlxlogscore=999 bulkscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2406140001 definitions=main-2407150081
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 46F82IXQ004891
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 10:20:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201906

On 7/15/24 17:59, Martin Jansa wrote:
> Hi Kai,
>
> are you also seeing these buildpaths warnings from libgfortran? These
> will be fatal since ERROR_QA update from yesterday:
> https://git.openembedded.org/openembedded-core/commit/?id=3Db79b191cc43=
a45dde2adb61ea349b426cb2461d1
> and it probably wasn't detected in AB builds which might not enable for=
tran.
Yes, it seems exists for long time. My colleague worked on it for=20
several days. But it seems hard to resolve that

host path are somehow set to the intrinsic path.

I'll discuss with him tomorrow and check if we can fix it.

Regards,
Kai

>
> Regards,
>
> On Mon, Jun 24, 2024 at 12:12=E2=80=AFPM Kai <kai.kang@windriver.com> w=
rote:
>> On 6/19/24 23:00, Martin Jansa wrote:
>>> See https://lists.openembedded.org/g/openembedded-core/message/200915
>>> which allows to me to build nativesdk-gcc again.
>> Thanks for your fix.
>>
>> Regards,
>> Kai
>>
>>> I've built nativesdk-libgfortran and libgfortran with the patch, but
>>> haven't used fortran in runtime at all, that's why it's an RFC, there
>>> were also 2 warnings:
>>> WARNING: nativesdk-libgfortran-14.1.0-r0 do_package_qa: QA Issue: Fil=
e
>>> /opt/.../usr/lib/.debug/libgfortran.so.5.0.0 in package
>>> nativesdk-libgfortran-dbg contains reference to TMPDIR [buildpaths]
>>> WARNING: libgfortran-14.1.0-r0 do_package_qa: QA Issue: File
>>> /usr/lib/.debug/libgfortran.so.5.0.0 in package libgfortran-dbg
>>> contains reference to TMPDIR [buildpaths]
>>> which I guess were already there.
>>>
>>> On Wed, Jun 19, 2024 at 3:24=E2=80=AFPM Martin Jansa via
>>> lists.openembedded.org <martin.jansa=3Dgmail.com@lists.openembedded.o=
rg>
>>> wrote:
>>>> Something seems wrong with this change which was merged today, now w=
ith:
>>>> MACHINE=3Dqemuarm64
>>>> FORTRAN:forcevariable =3D ",fortran"
>>>>
>>>> I'm seeing:
>>>> build/oe-core $ bitbake -g nativesdk-libgfortran
>>>> NOTE: Resolving any missing task queue dependencies
>>>> ERROR: Nothing PROVIDES 'gcc-cross-x86_64' (but
>>>> virtual:nativesdk:/OE/build/oe-core/openembedded-core/meta/recipes-d=
evtools/gcc/libgfortran_14.1.bb
>>>> DEPENDS on or otherwise requires it). Close matches:
>>>>     gcc-cross-aarch64
>>>> ...
>>>>
>>>> This might have been broken even before this change, but now it got
>>>> included in dependency tree of nativesdk-gcc (as shown in bitbake -g
>>>> nativesdk-gcc now failing when host and target arch don't match):
>>>>
>>>> "nativesdk-gcc.do_package_qa" -> "nativesdk-libgfortran.do_packageda=
ta"
>>>> nativesdk-gcc.do_package_write_ipk" -> "nativesdk-libgfortran.do_pac=
kagedata"
>>>>
>>>> Missing or unbuildable dependency chain was: ['image',
>>>> 'nativesdk-packagegroup-sdk-host', 'nativesdk-lcov',
>>>> 'nativesdk-gcov-symlinks', 'nativesdk-libgfortran-dev',
>>>> 'gcc-cross-x86_64']
>>>>
>>>> I guess the easiest fix would be in:
>>>> meta/recipes-devtools/gcc/libgfortran.inc:DEPENDS =3D "gcc-runtime
>>>> gcc-cross-${TARGET_ARCH}"
>>>> but I'm not very familiar with fortran (we've enabled it long time a=
go
>>>> to build lapack(blas) for snowboy, but wasn't actively used for coup=
le
>>>> years).
>>>>
>>>> Regards,
>>>>
>>>>
>>>>
>>>> On Sun, Jun 16, 2024 at 5:32=E2=80=AFPM Kai Kang via lists.openembed=
ded.org
>>>> <kai.kang=3Dwindriver.com@lists.openembedded.org> wrote:
>>>>> From: Kai Kang <kai.kang@windriver.com>
>>>>>
>>>>> It fails to run both `gcc` and `gfortran` with errors:
>>>>>
>>>>> | root@qemux86-64:~# x86_64-poky-linux-gcc a.c
>>>>> | x86_64-poky-linux-gcc: fatal error: cannot execute 'as': posix_sp=
awnp: No such file or directory
>>>>>
>>>>> then add binutils which provides `as` to RDEPENDS of gcc.
>>>>>
>>>>> libgfortran-dev provides libgfortran.spec which required by gfortra=
n:
>>>>>
>>>>> | root@qemux86-64:~# gfortran hello.f95
>>>>> | gfortran: fatal error: cannot read spec file 'libgfortran.spec': =
No such file or directory
>>>>>
>>>>> And gcc provides liblto_plugin.so:
>>>>>
>>>>> | root@qemux86-64:~# gfortran hello.f95
>>>>> | gfortran: fatal error: '-fuse-linker-plugin', but liblto_plugin.s=
o not found
>>>>>
>>>>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>>>>> ---
>>>>>    meta/recipes-devtools/gcc/gcc-target.inc | 9 +++++++--
>>>>>    1 file changed, 7 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipe=
s-devtools/gcc/gcc-target.inc
>>>>> index 8e9693b4cb..e9187fc444 100644
>>>>> --- a/meta/recipes-devtools/gcc/gcc-target.inc
>>>>> +++ b/meta/recipes-devtools/gcc/gcc-target.inc
>>>>> @@ -33,7 +33,7 @@ PACKAGES =3D "\
>>>>>        ${PN} ${PN}-plugins ${PN}-symlinks \
>>>>>        g++ g++-symlinks \
>>>>>        cpp cpp-symlinks \
>>>>> -    gfortran gfortran-symlinks \
>>>>> +    ${@bb.utils.contains('FORTRAN', ',fortran', 'gfortran gfortran=
-symlinks', '', d)} \
>>>>>        gcov gcov-symlinks \
>>>>>        ${PN}-doc \
>>>>>        ${PN}-dev \
>>>>> @@ -60,7 +60,7 @@ RRECOMMENDS:${PN} +=3D "\
>>>>>        libssp \
>>>>>        libssp-dev \
>>>>>    "
>>>>> -RDEPENDS:${PN} +=3D "cpp"
>>>>> +RDEPENDS:${PN} +=3D "binutils cpp"
>>>>>
>>>>>    FILES:${PN}-dev =3D "\
>>>>>        ${gcclibdir}/${TARGET_SYS}/${BINV}/lib*${SOLIBSDEV} \
>>>>> @@ -80,10 +80,15 @@ FILES:${PN}-plugins =3D "\
>>>>>    "
>>>>>    ALLOW_EMPTY:${PN}-plugins =3D "1"
>>>>>
>>>>> +INSANE_SKIP:${MLPREFIX}gfortran +=3D "dev-deps"
>>>>>    FILES:gfortran =3D "\
>>>>>        ${bindir}/${TARGET_PREFIX}gfortran \
>>>>>        ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/f951 \
>>>>>    "
>>>>> +RDEPENDS:gfortran =3D "\
>>>>> +    gcc \
>>>>> +    libgfortran-dev \
>>>>> +"
>>>>>    RRECOMMENDS:gfortran =3D "\
>>>>>        libquadmath \
>>>>>        libquadmath-dev \
>>>>> --
>>>>> 2.34.1
>>>>>
>>>>>
>>>>>
>>>>>
>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>> Links: You receive all messages sent to this group.
>>>> View/Reply Online (#200913): https://lists.openembedded.org/g/openem=
bedded-core/message/200913
>>>> Mute This Topic: https://lists.openembedded.org/mt/106704990/3617156
>>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsu=
b [martin.jansa@gmail.com]
>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>>
>> --
>> Kai Kang
>> Wind River Linux
>>

--=20
Kai Kang
Wind River Linux


