Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5C58CD1288
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 09:42:30 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.33812.1711964539665221077
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 02:42:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=cNLyX5uL;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=48215f78b9=yash.shinde@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4318xbXs012735
	for <openembedded-core@lists.openembedded.org>; Mon, 1 Apr 2024 02:42:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:cc:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=YroBnIhp9oMvEOw56Ok
	UhvKoPBaXUc3C3dOgruy4M10=; b=cNLyX5uLRw3klJcwGStDwhJukTX4s3e26vH
	Nv3FfpWl4sq3hocui/s63c+46furqiu50LlBrFItODqjti7ZJwhEqFLe8j1nxiw+
	2cyfy7yagl4d1OHVgphCUUFtkgajE3oZpoSNWdkmhnoR+m+760uQeJlC3egPx7ln
	xm4Z+jnkK+fEkSo/z3hNCB9lPPozmpzNCbYq2WkRD5W5MkqX8Cs14Lt/Asq42Ity
	pk9P8ZIbjk16LFX8q+3m5F+9NKZtgAV3FyoQGFOpZkebLB6GvDACSWMi46NjltFR
	7RUmutIOb1q8wL5zo53gISRn3XF95xUdMoMnY+mQtZ0sfFGO+lQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3x6j8fsc8p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 02:42:19 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4319gIBB004859;
	Mon, 1 Apr 2024 02:42:18 -0700
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2041.outbound.protection.outlook.com [104.47.56.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3x6j8fsc8n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Apr 2024 02:42:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P9+XpFsnb1TxEg0P2R+awcTeIm/J/+gpC7wK7mr6n2H8cP5naIR0ckvvwFQSmGeiG1g3Ry/VlVmc53PU+RlyYcPG5My37GLauODAHXXSazBsHUie7QM6X4X9USV3BREezyxQPZTIueuWsybUXguMt5IetdDmNBMpdMUQgzMFaspuLUi0+L1X99d+J1jpqtd9hVcUzwkAMWc6SJCD2v/3sj+st6/0zFDIG9TfI547BpatKaEBuKb6F5XCKqkGxUUF1bYbP0Noobv34FVWyAJ0LBehkZri7io7hKXuvjvvZHu51bQnn5UijF3sYDXVXiyIQsHA7Xa+7a/0Ocd2t9Ssig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YroBnIhp9oMvEOw56OkUhvKoPBaXUc3C3dOgruy4M10=;
 b=RI+QfSnCeAsdwJcr+1yevXHqmDrO1bI1nhP5S19RFx6wrS8Dyb0zLxe5XyS5MygfVRPL2LVHx3XrffDoPKdZIKJyTsh6PQpBuAVs4HsKPybhbKrZcRMHp0KM+vM9qSU2wAUthi1FEB/zMcloV+Y6E3nRuTPGkgaUdUcYGlWH+109/Gm7xViJr9l8y8We3q6tLf/LC45ZOkzQ7xC/ARlS/hBO4kNpysloSZFVzWWUT7stDrIp3y8qfZiOWxVunIsFNOs6YxjFScvqWG6t0WeCfmGLAJHmJVKu3HufMEhlucAIksMGjCpAxr9jZ5qwVsKlMkXLILog/dVBEnDJOUJbZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by IA0PR11MB8354.namprd11.prod.outlook.com (2603:10b6:208:48c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.22; Mon, 1 Apr
 2024 09:42:13 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::86fd:8a6:5f86:104e]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::86fd:8a6:5f86:104e%6]) with mapi id 15.20.7452.019; Mon, 1 Apr 2024
 09:42:12 +0000
Content-Type: multipart/alternative;
 boundary="------------KVv0hpC7gPMw0G3502QPcXr3"
Message-ID: <0398b42f-3bd0-4b3b-96bd-bf7d225bf02b@windriver.com>
Date: Mon, 1 Apr 2024 15:12:02 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] glibc: Fix stale qemu processes left after
 glibc oe-selftest
To: Randy MacLeod <rwmacleod@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
        Randy MacLeod <Randy.MacLeod@windriver.com>,
        Umesh.Kallapa@windriver.com, Naveen Gowda <Naveen.Gowda@windriver.com>,
        Sundeep KOKKONDA <Sundeep.Kokkonda@windriver.com>,
        Shivaprasad.Moodalappa@windriver.com
References: <20240401081011.479084-1-Yash.Shinde@windriver.com>
 <CAK6=ix4Z4cC7h3xzHpURNC8ZOWrBqMUYV1+xkGFWzFcSFH2_Rg@mail.gmail.com>
Content-Language: en-US
From: Yash Shinde <Yash.Shinde@windriver.com>
In-Reply-To: <CAK6=ix4Z4cC7h3xzHpURNC8ZOWrBqMUYV1+xkGFWzFcSFH2_Rg@mail.gmail.com>
X-ClientProxiedBy: VI1PR07CA0301.eurprd07.prod.outlook.com
 (2603:10a6:800:130::29) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|IA0PR11MB8354:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rC1XXJbOH/5qk+qBjMC83bP6B+Dx1IE3zAb+6xa1WhdvZ+n4l5nYjXIrt9eYf0Xb4OUd1Q/9pkNtNh87EFGsnnC5WjvWTQ/ybEwPiICHONo0L3UsJuKLsLei98vxDML6OoO2u/W/JYF1tX2NVzLjugfbP1Qg5GvkMksmh9THF/bmQL4Bhz1HHMC7GJbqOFCnRgtGclD9VK8azW8bBVnlzIZ7ZAacpldkJ6tDytvCLWV48uESaCNDhNWQXwxFSPdJOT0CNALZB1ZK4u4lIWHY0dS+jjOj1eg6QCWvxD9yT+YTXvkY3f9RBT2uPNsZJpSnAkJbtV1gEMLtmJcYIA0T7bnk8Llit0ZFuxctWjA54nuQqqzGcc9qo4ceCtnDTX0J5ihNuDgVizvg8ZajkXqTdlzDejl+O39ALRGIjsgX2qBYNP9nRxluy09cGGn3Kw5FUmbz5952EiqLkcHj0txC8jiOdtop5DjidLQ6tp0NlE4Y9G/NNn4YJ03vFEJpmoab3vBbx7SULuz+bntB+gQ5WUaIyKVze0spgy2S6QqiVdZDZyGyJHsMoXcwxqeI2AbcuZE8S/vMdvIYHQzc2yVNAbwk79Kzm5x5XoYmTtKoIGg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NW9qeGJ6QU5iUVYxWDRqSVVrZVBueElGemdzVXJ5aVh0cE53bldCZVRMREk4?=
 =?utf-8?B?ekZFd1JmN0dKL0ZCcW1hdjRCRldoK2l2Wmx5VW1rZ3NkSkdkdUNHc2p0aVNL?=
 =?utf-8?B?eHR4cUdFeFhkR29mU01uVHZtcEhkaHZDcWdwNTNLZTFYM3VId0tiUTY4SEhH?=
 =?utf-8?B?eHRTZ1dmcFZTaHNzTFlrNVhTRFNqNno5WEFMVlA0eHl0NVQxQkFQUld1RHEr?=
 =?utf-8?B?SXc2NUowMXBkaXo1QlJURFk2eUxGK1lNNG1BM0IxdGF1NExCZWFuUFFkckNP?=
 =?utf-8?B?Z1Z2QjI1a09XTVM3WXZSNVZrUHdsa1ZrUFJRZEtWOCs0S2VGcHA2TXZpOEZF?=
 =?utf-8?B?Y1FIQlU2ZE91MURrK2tSSVNZbnlkaEc1VUxZTHE4RXJvSDgrSVpHTUc3aG9Z?=
 =?utf-8?B?TmpyNmNDSDdRNzJUZVc1eHBaTndvMVgvaEIzQUs4L3lpK2RPODU1blFtZS9K?=
 =?utf-8?B?U1JpUDBKdWtlRy9ZdFpVQTBLOFNjaGRGZy9UTjJVTWdCOWx6OG9PUTQyRHpy?=
 =?utf-8?B?TlhhK3JSOXdlQnhBUWxrdEttTHJOaXg3SmxtWVdCUnZUTnBJSmhnVFdaVW8x?=
 =?utf-8?B?eStkeGtTa0t5WmN1R1dLclJrTzB3VURWV2llVWRlNWQraUdTdUc4aFhIdjBR?=
 =?utf-8?B?OVdwSnZRVnExU2hXUWNkcStRc2F4clNKMERQRG5DMXlMK3B6bDdnWUdRVzFN?=
 =?utf-8?B?OElvc3Fsa1VXTFR6MW9qZjF0SDIySTMrakIzVlhPQlNhZVN5VkFmU2lOZ2Jp?=
 =?utf-8?B?ZE1ZZ2ROWHJLVmhmZ0hIakthazZpeHA5empHSHllV290VzByY09KUW9HL2U3?=
 =?utf-8?B?NTh5SlMrNGZERThsaytJaXZvQmpuaFBHNm4yS1dMUllIem5QbFUwZHVpV0x0?=
 =?utf-8?B?Ykl1UjU3ajJhUU5tdXB5Uzg4VEFmNEppVXZXTnpVSlRPaDM3MlBRdVF4QW5T?=
 =?utf-8?B?V3g2eWc0RW4yc2w1MmVGVlVSV3ZVUHd5MFpjclBnRlhZeUgydTVNamNQeEJv?=
 =?utf-8?B?Q3lRODFhZk5BV1FwWCtTenFnZzk1dUJFUlN0Q2hBMm9iR3dSWEE5VUZtMEpL?=
 =?utf-8?B?Y0NRdUs5d2U2MTliWVlWMFNTWVJaN2xuUXNtMG1HdHhFUGpDdCtweFJGdkRM?=
 =?utf-8?B?ME4rZk9FakZIN0hTTU9wcjNPQTRTQUZOK0VwcjBndFYvRVNlUU9MdzR2clJx?=
 =?utf-8?B?NmtNY3htZWpodSt2c25DZGRmNUpJQjA5TFA4a0JQYVMxTFhmeHYwLzY3UTZQ?=
 =?utf-8?B?S0JUaFNTQ1BUOTdqcXFuNTZEcFBWRnExMlhSZnJ0ejNsSVFtbEJVSHF3NDVF?=
 =?utf-8?B?SVArWDJtbEdhYU5DNmVwaGFjNXdLMW9HYVNKSG0xaUR1dzJqQW1LUEFlMEx6?=
 =?utf-8?B?K0JiS0dmVmJid3ZCa1Eyc2xHTmJ5SkVCTDlTZi8rdGFRYlp1Vy9nNkpJRGVO?=
 =?utf-8?B?RzRuTk5QTzVKeTRBQlNJd0NvY2d3b1psY1FrR1RRcjluSnZuaUlKQXk3clBK?=
 =?utf-8?B?ZnUwWDhEcTFpdGY3VU1xYk0vNG5VNFBrem9MeVVGOGFVZDhLcU1jOUlhUU9R?=
 =?utf-8?B?QTFEQ0E0cjZIU2Q2a3ZvS01NMDNqdVVYOW4yeU5uVWlqNkV1Zk1zaGlCVkRX?=
 =?utf-8?B?M1R1THdteHpEcS9uR0E0ak44ZFJidzhIYWRyYTVrSEhEci9LbnoxWi9BaXRD?=
 =?utf-8?B?UEd6Qnh1Nk93am5VMEl6dStYbHZWUlJWK2xTcjhBb2l1eFlxVVNoT3ZiYUov?=
 =?utf-8?B?SjZGWmF5K0xEc2dvS0lESzZLYkpsTGFDMFViWndDOXJMTFNKMzBEemNUYUty?=
 =?utf-8?B?eGN5K0QwLzNjY1dZVzRHSWJwdW5sb1RzcjFLWlgrMVN1d0hMWDNwWjdFUE1p?=
 =?utf-8?B?QWluem1CQnVCanNQLzhrSEFMUHZxNGJRRnI5ZElVbUNaREEyQkMxSmprMi8v?=
 =?utf-8?B?cTFXMDlJU3VFd0hrMjJKamJjVHFWWVRqL1dySVY0U21vYmlkaFVtWCtyeWhx?=
 =?utf-8?B?MTZsUnM2V25ob3VXcld2R1Nhc2ZMZmR2RzRyMWFQYVY3R2pPR0Q5UlRhbXpL?=
 =?utf-8?B?UytFSUNCRVN6eUR0dW5MNWtVMFNNeDZqUHV1cXVJS1BCejdpVHpBTTA4eEpQ?=
 =?utf-8?B?akxQbC85RTJxZTB6eEFhc3FZVkVJYzl5dnNuS0hTMGxFRUNhQkQ0L2xWM09n?=
 =?utf-8?B?VHc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5ce1bac-5546-4ed6-27d1-08dc523001f1
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2024 09:42:12.7488
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 38hOHBjC+afQa+BKRaPquth49VSA/Cezg1w94jNwe5A2DokGcZjm1nawIVnpr0eZmMNKCNUY1SX1Ve6r0SWiY5ldMIGdFzLZ7UrxEoFnCag=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8354
X-Proofpoint-ORIG-GUID: AgvcU7kfRU9f2X93HTcybimLXLr2f-vV
X-Proofpoint-GUID: FBwRbbpINKFhoFgDYWrqeYNQthxQjzyN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-01_06,2024-03-28_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 spamscore=0 suspectscore=0 clxscore=1015 mlxscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2403210001
 definitions=main-2404010067
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 09:42:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197680

--------------KVv0hpC7gPMw0G3502QPcXr3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4318xbXs012735


On 01-04-2024 14:36, Randy MacLeod wrote:
> **
> *CAUTION: This email comes from a non Wind River email account!*
> Do not click links or open attachments unless you recognize the sender=20
> and know the content is safe.
> The short log is misleading since this isn't really a fix.
>
> You have:
>
> glibc: Fix stale qemu processes left after glibc oe-selftest
>
>
> Maybe:
>
> glibc: Skip 2 qemu tests that can hang in oe-selftest
>
Will send a V2 with updated short log.
>
> Skipping is what we want for now but
> have you tried=C2=A0 wrapping the hanging test in a script that runs:
> strace -f -ttt -o foo <test>
> ?
>
I tried to reproduce and strace this issue outside yocto environment for=20
ppc/mips target but make errors were observed when cross-compiling and=20
building.
Thus, unable to capture strace logs.

With the latest poky sources, the issue is not reproducible locally and=20
unable to check there also.

Regards,
Yash

> Randy
>
>
> On Mon, Apr 1, 2024, 04:10 Shinde, Yash via lists.openembedded.org=20
> <https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8=
EvQ!faU3OEL_GY3mffcv-d5kC1-J3efAL2vZ7s_BGVXjacmweHYyh4mRgvZVMhDDg7A6JW9ov=
UA3pSdMsSAEHYVEUA$>=20
> <Yash.Shinde=3Dwindriver.com@lists.openembedded.org> wrote:
>
>     From: Yash Shinde <Yash.Shinde@windriver.com>
>
>     qemumips and qemuppc were leaving stale processes behind after
>     running glibc oe-selftest. During analysis, it was found that
>     it was due to "tst-scm_rights" and "tst-scm_rights-time64" tests.
>     Disable them so that there are no stale processes left behind.
>
>     [YOCTO #15423]
>     https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15423
>     <https://urldefense.com/v3/__https://bugzilla.yoctoproject.org/show=
_bug.cgi?id=3D15423__;!!AjveYdw8EvQ!faU3OEL_GY3mffcv-d5kC1-J3efAL2vZ7s_BG=
VXjacmweHYyh4mRgvZVMhDDg7A6JW9ovUA3pSdMsSBJ3U20Jw$>
>
>     Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
>     ---
>     =C2=A0.../glibc/glibc/0024-qemu-stale-process.patch | 45
>     +++++++++++++++++++
>     =C2=A0meta/recipes-core/glibc/glibc_2.39.bb
>     <https://urldefense.com/v3/__http://glibc_2.39.bb__;!!AjveYdw8EvQ!f=
aU3OEL_GY3mffcv-d5kC1-J3efAL2vZ7s_BGVXjacmweHYyh4mRgvZVMhDDg7A6JW9ovUA3pS=
dMsSD3-s9FAQ$>=C2=A0
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +
>     =C2=A02 files changed, 46 insertions(+)
>     =C2=A0create mode 100644
>     meta/recipes-core/glibc/glibc/0024-qemu-stale-process.patch
>
>     diff --git
>     a/meta/recipes-core/glibc/glibc/0024-qemu-stale-process.patch
>     b/meta/recipes-core/glibc/glibc/0024-qemu-stale-process.patch
>     new file mode 100644
>     index 0000000000..c28fa31b89
>     --- /dev/null
>     +++ b/meta/recipes-core/glibc/glibc/0024-qemu-stale-process.patch
>     @@ -0,0 +1,45 @@
>     +glibc: Fix stale qemu processes left after glibc oe-selftest
>     +
>     +qemumips and qemuppc were leaving stale processes behind after
>     +running glibc oe-selftest. During analysis, it was found that
>     +it was due to "tst-scm_rights" and "tst-scm_rights-time64" tests.
>     +Disable them so that there are no stale processes left behind.
>     +
>     +[YOCTO #15423]
>     +https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15423
>     <https://urldefense.com/v3/__https://bugzilla.yoctoproject.org/show=
_bug.cgi?id=3D15423__;!!AjveYdw8EvQ!faU3OEL_GY3mffcv-d5kC1-J3efAL2vZ7s_BG=
VXjacmweHYyh4mRgvZVMhDDg7A6JW9ovUA3pSdMsSBJ3U20Jw$>
>     +
>     +Upstream-Status: Inappropriate [oe-core specific]
>     +Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
>     +---
>     +diff --git a/sysdeps/unix/sysv/linux/Makefile
>     b/sysdeps/unix/sysv/linux/Makefile
>     +--- a/sysdeps/unix/sysv/linux/Makefile=C2=A0 =C2=A0 2024-03-18
>     01:15:49.019202881 -0700
>     ++++ b/sysdeps/unix/sysv/linux/Makefile=C2=A0 2024-03-14
>     06:26:18.581404107 -0700
>     +@@ -222,7 +222,6 @@
>     +=C2=A0 =C2=A0tst-process_mrelease \
>     +=C2=A0 =C2=A0tst-quota \
>     +=C2=A0 =C2=A0tst-rlimit-infinity \
>     +-=C2=A0 tst-scm_rights \
>     +=C2=A0 =C2=A0tst-sigtimedwait \
>     +=C2=A0 =C2=A0tst-sync_file_range \
>     +=C2=A0 =C2=A0tst-sysconf-iov_max \
>     +@@ -233,6 +232,8 @@
>     +=C2=A0 =C2=A0tst-timerfd \
>     +=C2=A0 =C2=A0tst-ttyname-direct \
>     +=C2=A0 =C2=A0tst-ttyname-namespace \
>     ++=C2=A0 # Skip this test to avoid stale qemu process
>     ++=C2=A0 # tst-scm_rights \
>     +=C2=A0 =C2=A0# tests
>     +
>     + # process_madvise requires CAP_SYS_ADMIN.
>     +@@ -270,9 +271,10 @@
>     +=C2=A0 =C2=A0tst-ntp_gettimex-time64 \
>     +=C2=A0 =C2=A0tst-ppoll-time64 \
>     +=C2=A0 =C2=A0tst-prctl-time64 \
>     +-=C2=A0 tst-scm_rights-time64 \
>     +=C2=A0 =C2=A0tst-sigtimedwait-time64 \
>     +=C2=A0 =C2=A0tst-timerfd-time64 \
>     ++=C2=A0 # Skip this test to avoid stale qemu process
>     ++=C2=A0 # tst-scm_rights-time64 \
>     +=C2=A0 =C2=A0# tests-time64
>     +
>     + tests-clone-internal =3D \
>     diff --git a/meta/recipes-core/glibc/glibc_2.39.bb
>     <https://urldefense.com/v3/__http://glibc_2.39.bb__;!!AjveYdw8EvQ!f=
aU3OEL_GY3mffcv-d5kC1-J3efAL2vZ7s_BGVXjacmweHYyh4mRgvZVMhDDg7A6JW9ovUA3pS=
dMsSD3-s9FAQ$>
>     b/meta/recipes-core/glibc/glibc_2.39.bb
>     <https://urldefense.com/v3/__http://glibc_2.39.bb__;!!AjveYdw8EvQ!f=
aU3OEL_GY3mffcv-d5kC1-J3efAL2vZ7s_BGVXjacmweHYyh4mRgvZVMhDDg7A6JW9ovUA3pS=
dMsSD3-s9FAQ$>
>     index b203060064..9122472689 100644
>     --- a/meta/recipes-core/glibc/glibc_2.39.bb
>     <https://urldefense.com/v3/__http://glibc_2.39.bb__;!!AjveYdw8EvQ!f=
aU3OEL_GY3mffcv-d5kC1-J3efAL2vZ7s_BGVXjacmweHYyh4mRgvZVMhDDg7A6JW9ovUA3pS=
dMsSD3-s9FAQ$>
>     +++ b/meta/recipes-core/glibc/glibc_2.39.bb
>     <https://urldefense.com/v3/__http://glibc_2.39.bb__;!!AjveYdw8EvQ!f=
aU3OEL_GY3mffcv-d5kC1-J3efAL2vZ7s_BGVXjacmweHYyh4mRgvZVMhDDg7A6JW9ovUA3pS=
dMsSD3-s9FAQ$>
>     @@ -49,6 +49,7 @@ SRC_URI =3D
>     "${GLIBC_GIT_URI};branch=3D${SRCBRANCH};name=3Dglibc \
>     file://0021-fix-create-thread-failed-in-unprivileged-process-BZ-.pa=
tch
>     \
>     file://0022-Avoid-hardcoded-build-time-paths-in-the-output-binar.pa=
tch
>     \
>     file://0023-aarch64-configure-Pass-mcpu-along-with-march-to-dete.pa=
tch
>     \
>     + file://0024-qemu-stale-process.patch \
>     =C2=A0"
>     =C2=A0S =3D "${WORKDIR}/git"
>     =C2=A0B =3D "${WORKDIR}/build-${TARGET_SYS}"
>     --=20
>     2.43.0
>
>
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#197678):
>     https://lists.openembedded.org/g/openembedded-core/message/197678
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-core/message/197678__;!!AjveYdw8EvQ!faU3OEL_GY3mffcv-d5kC1-J3efAL=
2vZ7s_BGVXjacmweHYyh4mRgvZVMhDDg7A6JW9ovUA3pSdMsSD_nlFatw$>
>     Mute This Topic:
>     https://lists.openembedded.org/mt/105259855/953399
>     <https://urldefense.com/v3/__https://lists.openembedded.org/mt/1052=
59855/953399__;!!AjveYdw8EvQ!faU3OEL_GY3mffcv-d5kC1-J3efAL2vZ7s_BGVXjacmw=
eHYyh4mRgvZVMhDDg7A6JW9ovUA3pSdMsSDwV4R2SQ$>
>     Group Owner: openembedded-core+owner@lists.openembedded.org
>     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-core/unsub
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-core/unsub__;!!AjveYdw8EvQ!faU3OEL_GY3mffcv-d5kC1-J3efAL2vZ7s_BGV=
XjacmweHYyh4mRgvZVMhDDg7A6JW9ovUA3pSdMsSB6aZfgkA$>
>     [rwmacleod@gmail.com]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
--=20
Regards,
Yash Shinde

--------------KVv0hpC7gPMw0G3502QPcXr3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 01-04-2024 14:36, Randy MacLeod
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CAK6=ix4Z4cC7h3xzHpURNC8ZOWrBqMUYV1+xkGFWzFcSFH2_Rg@mail.gmail.com">
      
      <strong>
      </strong>
      <div style="border:solid #9c6500 1pt;padding:2pt;background:#fcfc03"><strong><class="msonormal" style="line-height:11pt"><span style="font-size:11pt;color:#000">CAUTION: This email
              comes from a non Wind River email account!</span></class="msonormal"></strong><br>
        <class="msonormal" style="line-height:10pt3"><span style="font-size:10pt;color:#000">Do not click links or open
            attachments unless you recognize the sender and know the
            content is safe.</span><br>
        </class="msonormal"></div>
      <div>
        <div dir="auto">The short log is misleading since this isn't
          really a fix.
          <div dir="auto"><br>
          </div>
          <div dir="auto">You have:</div>
          <div dir="auto"><br>
          </div>
          <div dir="auto">glibc: Fix stale qemu processes left after
            glibc oe-selftest<br>
          </div>
          <div dir="auto"><br>
          </div>
          <div dir="auto"><br>
          </div>
          <div dir="auto">Maybe:</div>
          <div dir="auto"><br>
          </div>
          <div dir="auto">glibc: Skip 2 qemu tests that can hang in
            oe-selftest<br>
          </div>
          <div dir="auto"><br>
          </div>
        </div>
      </div>
    </blockquote>
    Will send a V2 with updated short log.<br>
    <blockquote type="cite" cite="mid:CAK6=ix4Z4cC7h3xzHpURNC8ZOWrBqMUYV1+xkGFWzFcSFH2_Rg@mail.gmail.com">
      <div>
        <div dir="auto">
          <div dir="auto">
          </div>
          <div dir="auto"><br>
          </div>
          <div dir="auto">Skipping is what we want for now but</div>
          <div dir="auto">have you tried&nbsp; wrapping the hanging test in a
            script that runs:</div>
          <div dir="auto">strace -f -ttt -o foo &lt;test&gt;</div>
          <div dir="auto">?</div>
          <div dir="auto"><br>
          </div>
        </div>
      </div>
    </blockquote>
    <p>I tried to reproduce and strace this issue outside yocto
      environment for ppc/mips target but make errors were observed when
      cross-compiling and building.<br>
      Thus, unable to capture strace logs.<br>
      <br>
      With the latest poky sources, the issue is not reproducible
      locally and unable to check there also.<br>
      <br>
    </p>
    <p>Regards,<br>
      Yash<br>
    </p>
    <blockquote type="cite" cite="mid:CAK6=ix4Z4cC7h3xzHpURNC8ZOWrBqMUYV1+xkGFWzFcSFH2_Rg@mail.gmail.com">
      <div>
        <div dir="auto">
          <div dir="auto">
          </div>
          <div dir="auto">Randy</div>
          <br>
          <br>
          <div class="gmail_quote" dir="auto">
            <div dir="ltr" class="gmail_attr">On Mon, Apr 1, 2024, 04:10
              Shinde, Yash via <a href="https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8EvQ!faU3OEL_GY3mffcv-d5kC1-J3efAL2vZ7s_BGVXjacmweHYyh4mRgvZVMhDDg7A6JW9ovUA3pSdMsSAEHYVEUA$" moz-do-not-send="true">
                lists.openembedded.org</a> &lt;Yash.Shinde=<a href="mailto:windriver.com@lists.openembedded.org" moz-do-not-send="true" class="moz-txt-link-freetext">windriver.com@lists.openembedded.org</a>&gt;
              wrote:<br>
            </div>
            <blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
              From: Yash Shinde &lt;<a href="mailto:Yash.Shinde@windriver.com" target="_blank" rel="noreferrer" moz-do-not-send="true" class="moz-txt-link-freetext">Yash.Shinde@windriver.com</a>&gt;<br>
              <br>
              qemumips and qemuppc were leaving stale processes behind
              after<br>
              running glibc oe-selftest. During analysis, it was found
              that<br>
              it was due to &quot;tst-scm_rights&quot; and &quot;tst-scm_rights-time64&quot;
              tests.<br>
              Disable them so that there are no stale processes left
              behind.<br>
              <br>
              [YOCTO #15423]<br>
              <a href="https://urldefense.com/v3/__https://bugzilla.yoctoproject.org/show_bug.cgi?id=15423__;!!AjveYdw8EvQ!faU3OEL_GY3mffcv-d5kC1-J3efAL2vZ7s_BGVXjacmweHYyh4mRgvZVMhDDg7A6JW9ovUA3pSdMsSBJ3U20Jw$" rel="noreferrer noreferrer" target="_blank" moz-do-not-send="true">https://bugzilla.yoctoproject.org/show_bug.cgi?id=15423</a><br>
              <br>
              Signed-off-by: Yash Shinde &lt;<a href="mailto:Yash.Shinde@windriver.com" target="_blank" rel="noreferrer" moz-do-not-send="true" class="moz-txt-link-freetext">Yash.Shinde@windriver.com</a>&gt;<br>
              ---<br>
              &nbsp;.../glibc/glibc/0024-qemu-stale-process.patch | 45
              +++++++++++++++++++<br>
              &nbsp;meta/recipes-core/glibc/<a href="https://urldefense.com/v3/__http://glibc_2.39.bb__;!!AjveYdw8EvQ!faU3OEL_GY3mffcv-d5kC1-J3efAL2vZ7s_BGVXjacmweHYyh4mRgvZVMhDDg7A6JW9ovUA3pSdMsSD3-s9FAQ$" rel="noreferrer noreferrer" target="_blank" moz-do-not-send="true">glibc_2.39.bb</a>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; 1 +<br>
              &nbsp;2 files changed, 46 insertions(+)<br>
              &nbsp;create mode 100644
              meta/recipes-core/glibc/glibc/0024-qemu-stale-process.patch<br>
              <br>
              diff --git
              a/meta/recipes-core/glibc/glibc/0024-qemu-stale-process.patch
b/meta/recipes-core/glibc/glibc/0024-qemu-stale-process.patch<br>
              new file mode 100644<br>
              index 0000000000..c28fa31b89<br>
              --- /dev/null<br>
              +++
              b/meta/recipes-core/glibc/glibc/0024-qemu-stale-process.patch<br>
              @@ -0,0 +1,45 @@<br>
              +glibc: Fix stale qemu processes left after glibc
              oe-selftest<br>
              +<br>
              +qemumips and qemuppc were leaving stale processes behind
              after<br>
              +running glibc oe-selftest. During analysis, it was found
              that<br>
              +it was due to &quot;tst-scm_rights&quot; and
              &quot;tst-scm_rights-time64&quot; tests.<br>
              +Disable them so that there are no stale processes left
              behind.<br>
              +<br>
              +[YOCTO #15423]<br>
              +<a href="https://urldefense.com/v3/__https://bugzilla.yoctoproject.org/show_bug.cgi?id=15423__;!!AjveYdw8EvQ!faU3OEL_GY3mffcv-d5kC1-J3efAL2vZ7s_BGVXjacmweHYyh4mRgvZVMhDDg7A6JW9ovUA3pSdMsSBJ3U20Jw$" rel="noreferrer noreferrer" target="_blank" moz-do-not-send="true">https://bugzilla.yoctoproject.org/show_bug.cgi?id=15423</a><br>
              +<br>
              +Upstream-Status: Inappropriate [oe-core specific]<br>
              +Signed-off-by: Yash Shinde &lt;<a href="mailto:Yash.Shinde@windriver.com" target="_blank" rel="noreferrer" moz-do-not-send="true" class="moz-txt-link-freetext">Yash.Shinde@windriver.com</a>&gt;<br>
              +---<br>
              +diff --git a/sysdeps/unix/sysv/linux/Makefile&nbsp;
              b/sysdeps/unix/sysv/linux/Makefile<br>
              +--- a/sysdeps/unix/sysv/linux/Makefile&nbsp; &nbsp; 2024-03-18
              01:15:49.019202881 -0700<br>
              ++++ b/sysdeps/unix/sysv/linux/Makefile&nbsp; 2024-03-14
              06:26:18.581404107 -0700<br>
              +@@ -222,7 +222,6 @@<br>
              +&nbsp; &nbsp;tst-process_mrelease \<br>
              +&nbsp; &nbsp;tst-quota \<br>
              +&nbsp; &nbsp;tst-rlimit-infinity \<br>
              +-&nbsp; tst-scm_rights \<br>
              +&nbsp; &nbsp;tst-sigtimedwait \<br>
              +&nbsp; &nbsp;tst-sync_file_range \<br>
              +&nbsp; &nbsp;tst-sysconf-iov_max \<br>
              +@@ -233,6 +232,8 @@<br>
              +&nbsp; &nbsp;tst-timerfd \<br>
              +&nbsp; &nbsp;tst-ttyname-direct \<br>
              +&nbsp; &nbsp;tst-ttyname-namespace \<br>
              ++&nbsp; # Skip this test to avoid stale qemu process<br>
              ++&nbsp; # tst-scm_rights \<br>
              +&nbsp; &nbsp;# tests<br>
              +<br>
              + # process_madvise requires CAP_SYS_ADMIN.<br>
              +@@ -270,9 +271,10 @@<br>
              +&nbsp; &nbsp;tst-ntp_gettimex-time64 \<br>
              +&nbsp; &nbsp;tst-ppoll-time64 \<br>
              +&nbsp; &nbsp;tst-prctl-time64 \<br>
              +-&nbsp; tst-scm_rights-time64 \<br>
              +&nbsp; &nbsp;tst-sigtimedwait-time64 \<br>
              +&nbsp; &nbsp;tst-timerfd-time64 \<br>
              ++&nbsp; # Skip this test to avoid stale qemu process<br>
              ++&nbsp; # tst-scm_rights-time64 \<br>
              +&nbsp; &nbsp;# tests-time64<br>
              +<br>
              + tests-clone-internal = \<br>
              diff --git a/meta/recipes-core/glibc/<a href="https://urldefense.com/v3/__http://glibc_2.39.bb__;!!AjveYdw8EvQ!faU3OEL_GY3mffcv-d5kC1-J3efAL2vZ7s_BGVXjacmweHYyh4mRgvZVMhDDg7A6JW9ovUA3pSdMsSD3-s9FAQ$" rel="noreferrer noreferrer" target="_blank" moz-do-not-send="true">glibc_2.39.bb</a>
              b/meta/recipes-core/glibc/<a href="https://urldefense.com/v3/__http://glibc_2.39.bb__;!!AjveYdw8EvQ!faU3OEL_GY3mffcv-d5kC1-J3efAL2vZ7s_BGVXjacmweHYyh4mRgvZVMhDDg7A6JW9ovUA3pSdMsSD3-s9FAQ$" rel="noreferrer noreferrer" target="_blank" moz-do-not-send="true">glibc_2.39.bb</a><br>
              index b203060064..9122472689 100644<br>
              --- a/meta/recipes-core/glibc/<a href="https://urldefense.com/v3/__http://glibc_2.39.bb__;!!AjveYdw8EvQ!faU3OEL_GY3mffcv-d5kC1-J3efAL2vZ7s_BGVXjacmweHYyh4mRgvZVMhDDg7A6JW9ovUA3pSdMsSD3-s9FAQ$" rel="noreferrer noreferrer" target="_blank" moz-do-not-send="true">glibc_2.39.bb</a><br>
              +++ b/meta/recipes-core/glibc/<a href="https://urldefense.com/v3/__http://glibc_2.39.bb__;!!AjveYdw8EvQ!faU3OEL_GY3mffcv-d5kC1-J3efAL2vZ7s_BGVXjacmweHYyh4mRgvZVMhDDg7A6JW9ovUA3pSdMsSD3-s9FAQ$" rel="noreferrer noreferrer" target="_blank" moz-do-not-send="true">glibc_2.39.bb</a><br>
              @@ -49,6 +49,7 @@ SRC_URI =&nbsp;
              &quot;${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
              <a class="moz-txt-link-freetext" href="file://0021-fix-create-thread-failed-in-unprivileged-process-BZ-.patch">file://0021-fix-create-thread-failed-in-unprivileged-process-BZ-.patch</a>
              \<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
              <a class="moz-txt-link-freetext" href="file://0022-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch">file://0022-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch</a>
              \<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
              <a class="moz-txt-link-freetext" href="file://0023-aarch64-configure-Pass-mcpu-along-with-march-to-dete.patch">file://0023-aarch64-configure-Pass-mcpu-along-with-march-to-dete.patch</a>
              \<br>
              +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<a class="moz-txt-link-freetext" href="file://0024-qemu-stale-process.patch">file://0024-qemu-stale-process.patch</a> \<br>
              &nbsp;&quot;<br>
              &nbsp;S = &quot;${WORKDIR}/git&quot;<br>
              &nbsp;B = &quot;${WORKDIR}/build-${TARGET_SYS}&quot;<br>
              -- <br>
              2.43.0<br>
              <br>
              <br>
              -=-=-=-=-=-=-=-=-=-=-=-<br>
              Links: You receive all messages sent to this group.<br>
              View/Reply Online (#197678): <a href="https://urldefense.com/v3/__https://lists.openembedded.org/g/openembedded-core/message/197678__;!!AjveYdw8EvQ!faU3OEL_GY3mffcv-d5kC1-J3efAL2vZ7s_BGVXjacmweHYyh4mRgvZVMhDDg7A6JW9ovUA3pSdMsSD_nlFatw$" rel="noreferrer noreferrer" target="_blank" moz-do-not-send="true">
https://lists.openembedded.org/g/openembedded-core/message/197678</a><br>
              Mute This Topic: <a href="https://urldefense.com/v3/__https://lists.openembedded.org/mt/105259855/953399__;!!AjveYdw8EvQ!faU3OEL_GY3mffcv-d5kC1-J3efAL2vZ7s_BGVXjacmweHYyh4mRgvZVMhDDg7A6JW9ovUA3pSdMsSDwV4R2SQ$" rel="noreferrer noreferrer" target="_blank" moz-do-not-send="true">
                https://lists.openembedded.org/mt/105259855/953399</a><br>
              Group Owner: <a href="mailto:openembedded-core%2Bowner@lists.openembedded.org" target="_blank" rel="noreferrer" moz-do-not-send="true">
                openembedded-core+owner@lists.openembedded.org</a><br>
              Unsubscribe: <a href="https://urldefense.com/v3/__https://lists.openembedded.org/g/openembedded-core/unsub__;!!AjveYdw8EvQ!faU3OEL_GY3mffcv-d5kC1-J3efAL2vZ7s_BGVXjacmweHYyh4mRgvZVMhDDg7A6JW9ovUA3pSdMsSB6aZfgkA$" rel="noreferrer noreferrer" target="_blank" moz-do-not-send="true">
                https://lists.openembedded.org/g/openembedded-core/unsub</a>
              [<a href="mailto:rwmacleod@gmail.com" target="_blank" rel="noreferrer" moz-do-not-send="true" class="moz-txt-link-freetext">rwmacleod@gmail.com</a>]<br>
              -=-=-=-=-=-=-=-=-=-=-=-<br>
              <br>
            </blockquote>
          </div>
        </div>
      </div>
    </blockquote>
    <pre class="moz-signature" cols="72">-- 
Regards,
Yash Shinde</pre>
  </body>
</html>

--------------KVv0hpC7gPMw0G3502QPcXr3--

