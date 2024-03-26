Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD361C54E67
	for <webhook@archiver.kernel.org>; Tue, 26 Mar 2024 21:35:01 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.22824.1711488893822427234
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Mar 2024 14:34:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=AVrK9hLY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3815b0b2f8=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 42QHxncF002008
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 14:34:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:cc:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=GQIgSSM20bRLnkdXXGZ
	qX+gSmn9mCYE+DDmHe4b1ZY8=; b=AVrK9hLYF/DxhXZgGFmHgcgKI/dQXtUKVA7
	7pYyavKzaBdUlGRIfniFflN3dEMpm7U4vHa13OXmjfcxf84OXy4At6yZCz9x6soE
	wTKOr6txXTbYMhtdAQVL3QNZ3l37r/dI059UAenLL7g0VLEP0TMA60ryZcNrUKCX
	vcxnQ8xBi8TZmtRUcTxjcH3RtOP+0VSIoSiYDxjkPoo9UQ7TuTO0wS+n/CDIwS/k
	5zXwSB4Fetcw5kpq4Hle4olnQHJnxwjpLJnSBHETiN2nwfsPa8yRkTXNKKb8WxpX
	RGMbcN4BiBM1JOd8ohd5Au+Bu9+RYKC5RLKOPINNZLZ6D4jkJyg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3x1tc0v8tk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 14:34:52 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 42QLYqxO030418
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 14:34:52 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3x1tc0v8tg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Mar 2024 14:34:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T4Md0xWPHhSJDTtN2BZ4XXaZA+b2b88OKDNh8G/EwQ/uwqBX87/zJ5bd7lx7M8p3nxXQttl3c+p7Qy06qPlBD1l1x8RBpYaFQwfWd579D3LraOpxk7fNep8hSZa2hGdHVsBD6OZHrdFNSqw6pJNEJbab2WyI+/KjOdY80Uuz/JNhSAZyZrBoC6Wa7LSIlAtdsnBwcQvKoiDNvwNr8+F9NpDZLGHuoRI1jt+RTVte9U3VkZFM01gLfj7qktBkpm+qHZqEqKKh8WRI7TnliKymlT7mSTjVLelYoC9/6Lndm2WF4X1V+vv/dL0x+yYR7rYN0xlO1KaFxU9HwBhTEVkEtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GQIgSSM20bRLnkdXXGZqX+gSmn9mCYE+DDmHe4b1ZY8=;
 b=YPs6ZHc1dNbvcH5E+FsDZhdN10jshpd4JdIkr6aibMMi+bEqWB8U2cCNIO9zxmjL+oPK+BfrKCkUFrDQgf5Yjcdpd6HcHcegZHxqevidrgPb/BRoIHAKw4sfxu0Ly/2tZIsyBvoliqBwAN+219BgYA61vLK6+WEzgU8TPknHp/EsZ2dDGG95GSWPOrTPAuOaRzfgfTeBVJrSb+DJXUiCqUuiJD+6G/ugA8dbIHzPhuLQ3MEJqPlXTRyMQd9KpcmLL9awsR3P3pQ4NFYB+CDtvBR2E4NEDiogGiiDrM8EScSwgAeqqjOGi6y3unKZjYsIGnyERfoZoaUcJj7tJ91Gcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5920.namprd11.prod.outlook.com (2603:10b6:a03:42e::9)
 by PH7PR11MB7025.namprd11.prod.outlook.com (2603:10b6:510:208::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Tue, 26 Mar
 2024 21:34:40 +0000
Received: from SJ0PR11MB5920.namprd11.prod.outlook.com
 ([fe80::c613:f5c5:2c48:3f9d]) by SJ0PR11MB5920.namprd11.prod.outlook.com
 ([fe80::c613:f5c5:2c48:3f9d%4]) with mapi id 15.20.7409.031; Tue, 26 Mar 2024
 21:34:40 +0000
Content-Type: multipart/alternative;
 boundary="------------kUSAvX6L90lwvW38HpYUUQCd"
Message-ID: <785f2c07-1615-4435-8723-6d9b8aa0eb52@windriver.com>
Date: Tue, 26 Mar 2024 17:34:37 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][kirkstone][PATCH] openssl: Improve FIPS RSA keygen
 performac
Content-Language: en-CA
To: Haitao.Liu@windriver.com
Cc: openembedded-core@lists.openembedded.org,
        Steve Sakoman <steve@sakoman.com>
References: <20240318065524.3337545-1-haitao.liu@windriver.com>
 <1bc87f74-e7b7-42b9-9c73-1f30846df519@windriver.com>
 <CAOSpxdapBOHDS6YX9LfApq1sbXeJ=FtHam3OBx0PfCaz5Pvsgw@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <CAOSpxdapBOHDS6YX9LfApq1sbXeJ=FtHam3OBx0PfCaz5Pvsgw@mail.gmail.com>
X-ClientProxiedBy: BYAPR08CA0025.namprd08.prod.outlook.com
 (2603:10b6:a03:100::38) To SJ0PR11MB5920.namprd11.prod.outlook.com
 (2603:10b6:a03:42e::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5920:EE_|PH7PR11MB7025:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kCcgY7Ms9dQO1Mo20ZDotsBngFo34P3bKkcD2tmfV61tenBNRk7cGvUvJWPYnh4REk5aDoKbDv6c0d7aUvj8ks6q0UjVTKYlpA5leLqAC/Zgmh1q3evIDbU98w1JAxXISteOyoGk+DkjFKWeoAXTOg8vARk0dWKgp47Qy7xYn8rdv6wY0nGePlYsKnsgYt15B+QzEIzF7aXfFXTNWmmcswXeBjChpoPD1CELYHfNf92ia2/24/2RbwyljpcRAXTffpJuMyWfovjUqjJq94g+j2aH4BuFC7Rgpc3bbZbehR27q4jawN+f/p/vVFE64ok5fXX1YXKrysW0stb6cojBHXNet+WF6+DsQAKCTHkMY0Rvh738a8tUOFVDLQu3vJ5rQxSPn3BBF+re7dqRLo4p1ewJOiqWw8yaXhx7S8kDcuxaZ68XpZF8o5IRaVe7vPgmPxjz2v/rG9po/qsYEPa8S/sujO3TZ0oLk+fngBe9VQWyiXD4cub1jJCcdAz7iRNUH5ceRHVV/EP1pCQOapw7KmdOuZGmTikHJ/huRFYLI11oKfpzv9PsIq81fW/7Lsv+gHLzu62RuNHDdosnsl23Nur+JMICu9Fh5Z/gSwII2O0U3cOr13l1+yYmVN+s4tTC
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5920.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ckRLNXJmTlViTG5JRks4WTd3TDJ0V2xya2M4bjJkdmZsU3FRL1hQL3l5anpN?=
 =?utf-8?B?aUZGc0VkcVVyV0s3S0E0dDdEeWZRak9vK09QV2Zpa25qaVdrZ3J1eEZDZnJY?=
 =?utf-8?B?djJvVlY1T1N2ZUJPTDFXOHNuUXB3ZmluZjdzNTEvN3B3Rm1acmpVdG15bTNk?=
 =?utf-8?B?VCtDNGlWQjZrZ2NpTEQreDFJeFNSbWt2eEVkRWdNczZNM3dxbXlFZ2oreW80?=
 =?utf-8?B?bjR4bGRRU3NnRFM2QTNTWG93MWVzc1ovSmo4U3hYZ0NSLzFTWGVKU2pWWDVV?=
 =?utf-8?B?Q21ZQ0lBVUtjaWUzL3lDSGRYcTgrTXQybnQ5K3dZS1B5OHVibmdhTzV1a05Z?=
 =?utf-8?B?OFFPckM1NmFjbWM2RjZwS2ZNd29lazI5aUlPazFhMW5ZdUU1ZE5QZWZvUW1p?=
 =?utf-8?B?V0pJNmJQbFVRSUltRDZFdmlFcWVEd0dMYjZWOHZQVVNJdG1US3p5N1lCaUNw?=
 =?utf-8?B?U3RseWR0MnA1K09COTUvZGlNdXR5aXozTWM2ejZFK3NRY1NOMHQ2cmtXUERO?=
 =?utf-8?B?VGVFZlZBT1pOWWtiVG5Xc3FzL2VKblRuaE9DeDlGM1lWOGhsc0ZrcE1zNUhV?=
 =?utf-8?B?cjBTc3NNcWUwS2dvVSsyejZlZmFjV05kRyt5OFhKNVY0d3haRkZYMnd0MnJI?=
 =?utf-8?B?MmxGSkZIclVmSmg4R3cyWVpFL1VGNzZTcFY3bHZMN3lhZ0hDMnF6WHVINEMy?=
 =?utf-8?B?Uy84SW1hQVFlTjYzR2I3bFdhV2tFN21ZZ0xVUlhRTW9jblFXZXBZUDRGVDJs?=
 =?utf-8?B?eTlTOVhMaUNJdzQvQkErWmwzclRWZ3lMR1hUSWpuZ29tM1p0TzlMRW9QSStJ?=
 =?utf-8?B?R0pSWldsbVl4b3RHUDJRZjgzd05LbVVSNnpYaGZyS2RQaHFDQTJib2xPQXdI?=
 =?utf-8?B?VFNBRituTmZzSTljaGpOdWdIU2JyQkY0aTFsRXZGc0VIZEc2WkVaQ2J5a0ZP?=
 =?utf-8?B?Z1pSS1Z6TDhjYXF5YXh3V1REdUNkbTlNM2I2dGxlTGlHK0MxZmYvWE45T0JP?=
 =?utf-8?B?VnREemNLcDhOYmJPcitVckt6bEdqZk14ZFo4Rk9UWENKMjg0U0QzaE5jZG1N?=
 =?utf-8?B?aStTRUFPbHZ0dGFZVG00K0M3Y3piY2xIa05zYWdGditZdzlxcnB5NjY2cXBw?=
 =?utf-8?B?MkZrUlkxYktmeEtJbTJjSjVpT21Ub3hRMUl5MTh2UC91LzRzWTJiNVFYelE4?=
 =?utf-8?B?QXAyMVhSRllrczV6dlUwRlpVL0tRVnpSQnZLenExMnBVRVBmV0R2TWdWR2My?=
 =?utf-8?B?VDNtUGNpSHZJTzYzaW9Gb1c1YW91aDdvdUw5VU1XT1hBT0NCL0xybHpjWXNn?=
 =?utf-8?B?UkZtSXpaWGIwNWs0Vnc3SFdBV1M3ZEtwdDgvc1BHcDFCNVhBTDVyM1I3NDBQ?=
 =?utf-8?B?V0xyNERSd1k1bmxreWh5bFRRbC9mYVc5OHU5azZFV1NUVHdiRGNjQ2lIL1Fy?=
 =?utf-8?B?YlhORVZUanh3SGlNWGM0YVJ5bmU1NVVUOVRXUXIxb1cySnd6bHBzQVB1L2JN?=
 =?utf-8?B?cHJCU3FUVk05WVhZNXVXbzJkR3UwblRDVmE5ZDlQKzV6K0pGbkREYUxTclI2?=
 =?utf-8?B?ZlV0Z1BDekR5anJqZ2dnOWdKYUNmeXdCOThCRUt1U1M0NXFraEg4cENJaTlB?=
 =?utf-8?B?bVRiL0dlRG9vOURJMjNWSThNRHAxYjd4RkFPWkwvZ1V5ZTBSRlRaN01pRmtS?=
 =?utf-8?B?R2JNd2lCWXNjSzdvT2pMMWpFUFFrK2R3R2Q1S3BmUkx3RURGV0RsMzBaaTF1?=
 =?utf-8?B?UmExUUNHWHRpK1pTdmlQNGVEcUFUN3pJV1BZN1pEdEszemZRUktRVVBpTTBG?=
 =?utf-8?B?dzRHV3JXeUsxdkNHZElXc1BVSWZWcG5hMURQSm5pb09kYVVLdnhKd3NzUUdR?=
 =?utf-8?B?R2JDaGJ0NWx5VzRtdFVtbk02ZmdiVDVUbWNlb29RaStRS2VKNlBSWE51Y211?=
 =?utf-8?B?S0pKQXBkQVFQbitXL2pPZ3JnL2JMN0VEdzVEL2E1dXBNc1hTdjhJZVpMVGho?=
 =?utf-8?B?SDcyOU1PbVcwYWs5N3pZeEhKaklTUXp6RU9CUFhmVjF4eFU2R2VYUVhNV1Bw?=
 =?utf-8?B?RHF4ODBwZEt1U2dvMGlGdjFFQ0I3RVdvVzFaMUZ2M084endSS2JhWDVyUitR?=
 =?utf-8?B?cTdiQ3pnK2lldW9MQWs2MkJrY0dvdVpIZ1BBN2dnTjlyLytCQzlOdDd4RTh4?=
 =?utf-8?B?ZlE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12007f83-4029-4d3c-dfe9-08dc4ddc8b07
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5920.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2024 21:34:40.4159
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cGVTdUJcmq9MM6V0nqfZEqeaMdLWVoBrov4/5ci/hRRiIKykcHqALsLHbKDJQMxVjRxAH4ytviBLTxjr0vwPsxaW2uM5733MYhzuGT51JJU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7025
X-Proofpoint-GUID: l2eDoWtuur65qI5sHG28z8dXO1D6SSoS
X-Proofpoint-ORIG-GUID: f8Kvyo1UoT93lJRAdeKvQEkoDB3ak2N3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-26_08,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=999 clxscore=1015 impostorscore=0
 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403260155
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 21:35:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197541

--------------kUSAvX6L90lwvW38HpYUUQCd
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 42QHxncF002008

On 2024-03-19 7:23 p.m., Steve Sakoman wrote:
> On Tue, Mar 19, 2024 at 11:45=E2=80=AFAM Randy MacLeod
> <randy.macleod@windriver.com>  wrote:
>> Hi Haitao, et al,
>>
>>
>> Summary:
>>
>> I think we could bring these two commits back to kirkstone even though=
 upstream openssl mtc
>> does not plan to do so, at least not without "very good reasons".
>>
>> but I have some comments and questions below that I'd like you to resp=
ond to before sending a v2.
>>
>> ../Randy
>>
>>
>>
>> Typo in the subject:
>>     [OE-core][kirkstone][PATCH] openssl: Improve FIPS RSA keygen perfo=
rmac
>> should be:
>>     [OE-core][kirkstone][PATCH] openssl: Improve FIPS RSA keygen perfo=
rmance
>>
>> On 2024-03-18 2:55 a.m., jason.lau via lists.openembedded.org wrote:
>>
>> The ssh-keygen would take a long time to generate the entropy of a key
>>
>> It's best to be more specific.
>>
>> You mentioned in:
>>
>> https://github.com/openssl/openssl/issues/23766
>>
>> that "ssh-keygen (built with openssl3.0) is taking 1-2s to execute whe=
reas in openssl3.1 it was hardly half a second"
>>
>> so you should mention that in the commit log.
>>
>> You should also include a link to the upstream issue you opened to exp=
lain that:
>>
>>     "Performance fixes are in general not eligible for backports to st=
able release branches.
>>      In specific cases an exception could be given by OTC but there wo=
uld have to be very good reasons for such an exception."
>>
>> I saw that comment last week and wondered if we should push harder for=
 upstream to backport these commits but
>> I understand your reluctance to do that when it might make sense to ju=
st backport here in oe-core.
>>
>> Note that the commits are only part of 3.2.0+:
>>
>> =E2=9D=AF git tag --contains dd1d7bcb69994d81662e709b0ad838880b943870
>> openssl-3.2.0
>> openssl-3.2.0-alpha1
>> openssl-3.2.0-alpha2
>> openssl-3.2.0-beta1
>> openssl-3.2.1
>>
>> =E2=9D=AF git tag --contains d2f6e66d2837bff1f5f7636bb2118e3a45c9df61
>> openssl-3.2.0
>> openssl-3.2.0-alpha1
>> openssl-3.2.0-alpha2
>> openssl-3.2.0-beta1
>> openssl-3.2.1
>>
>> so they'd also have to be back-ported to nanbield technically:
>>     https://git.openembedded.org/openembedded-core/tree/meta/recipes-c=
onnectivity/openssl/openssl_3.1.4.bb?h=3Dnanbield
>>
>> Steve,
>> Given that nanbield is a week or so away from EOL, is it worth doing t=
hat?
> I'm going to close down changes to nanbield in the next day or so, so
> there probably isn't time to get such a change in.
>
> And I suspect that the kirkstone v2 patch won't make it through

Haitao,

Steve has NOT merged this to kirkstone:
https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dstable/ki=
rkstone-nut

https://git.openembedded.org/openembedded-core/log/?h=3Dkirkstone


Please reply to and/or deal with my comments and send a v2.

Thanks!

../Randy


> testing until after the nanbield final release is done, so I don't
> have an issue with taking it.
>
> Steve
>
>> Note that the original commits were from Nov 2, 2022 so they've had so=
me time to ummm, bake but
>> the 3.2.0 release was 'only' on Nov 23, 2023:
>>     https://www.openssl.org/source/old/3.2/index.html
>> so it's got 3 or 4 months of the public being able to test it.
>>
>> I've taken a look at the commits and haven't seen a problem with the b=
ackport.
>>
>> Haitao,
>> Did you have to adjust the patches at all? If so please explain what y=
ou did.
>>
>> Your tests show that openssl is faster, have you tested for correctnes=
s at all?
>> Does it make sense to run: test/bntest.c ? Steve will likely run the p=
tests of course.
>>
>> Do we need the oneline change: "Fix incorrect error branch in ossl_bn_=
rsa_fips186_4_derive_prime()"
>> from:
>> openssl.git on master
>> =E2=9D=AF git log --oneline crypto/bn/bn_rsa_fips186_4.c
>> da1c088f59 Copyright year updates
>> 835b90a19c Fix incorrect error branch in ossl_bn_rsa_fips186_4_derive_=
prime()
>> d2f6e66d28 Improve FIPS RSA keygen performance.
>> dd1d7bcb69 Improve FIPS RSA keygen performance.
>>
>>
>> Are there any other changes to the files touched by these commits that=
 would affect
>> the correctness or performance of the code introduced?
>>
>> ../Randy
>>
>>
>>
>> The following commits have fixed the issue.
>> https://github.com/openssl/openssl/commit/dd1d7bcb69994d81662e709b0ad8=
38880b943870
>> https://github.com/openssl/openssl/commit/d2f6e66d2837bff1f5f7636bb211=
8e3a45c9df61
>>
>> Signed-off-by: Haitao Liu<haitao.liu@windriver.com>
>> ---
>>   ...-Improve-FIPS-RSA-keygen-performance.patch | 271 ++++++++++++++++=
++
>>   ...-Improve-FIPS-RSA-keygen-performance.patch | 185 ++++++++++++
>>   .../openssl/openssl_3.0.13.bb                 |   2 +
>>   3 files changed, 458 insertions(+)
>>   create mode 100644 meta/recipes-connectivity/openssl/openssl/0001-Im=
prove-FIPS-RSA-keygen-performance.patch
>>   create mode 100644 meta/recipes-connectivity/openssl/openssl/0002-Im=
prove-FIPS-RSA-keygen-performance.patch
>>
>> diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Improve-FI=
PS-RSA-keygen-performance.patch b/meta/recipes-connectivity/openssl/opens=
sl/0001-Improve-FIPS-RSA-keygen-performance.patch
>> new file mode 100644
>> index 0000000000..aed0e1a5c1
>> --- /dev/null
>> +++ b/meta/recipes-connectivity/openssl/openssl/0001-Improve-FIPS-RSA-=
keygen-performance.patch
>> @@ -0,0 +1,271 @@
>> +From a940dfa152707ba82f3efc2c147f6313c28f7662 Mon Sep 17 00:00:00 200=
1
>> +From: slontis<shane.lontis@oracle.com>
>> +Date: Wed, 2 Nov 2022 12:01:34 +1000
>> +Subject: [PATCH 1/2] Improve FIPS RSA keygen performance.
>> +
>> +FIPS 186-4 has 5 different algorithms for key generation,
>> +and all of them rely on testing GCD(a,n) =3D=3D 1 many times.
>> +
>> +Cachegrind was showing that during a RSA keygen operation,
>> +the function BN_gcd() was taking a considerable percentage
>> +of the total cycles.
>> +
>> +The default provider uses multiprime keygen, which seemed to
>> +be much faster. This is because it uses BN_mod_inverse()
>> +instead.
>> +
>> +For a 4096 bit key, the entropy of a key that was taking a
>> +long time to generate was recorded and fed back into subsequent
>> +runs. Roughly 40% of the cycle time was BN_gcd() with most of the
>> +remainder in the prime testing. Changing to use the inverse
>> +resulted in the cycle count being 96% in the prime testing.
>> +
>> +Reviewed-by: Paul Dale<pauli@openssl.org>
>> +Reviewed-by: Tomas Mraz<tomas@openssl.org>
>> +(Merged fromhttps://github.com/openssl/openssl/pull/19578)
>> +
>> +(cherry picked from commit dd1d7bcb69994d81662e709b0ad838880b943870)
>> +
>> +Upstream-Status: Backport [https://github.com/openssl/openssl/commit/=
dd1d7bcb69994d81662e709b0ad838880b943870]
>> +
>> +Signed-off-by: Haitao Liu<haitao.liu@windriver.com>
>> +---
>> + crypto/bn/bn_gcd.c           | 31 +++++++++++++++++++++++++++++++
>> + crypto/bn/bn_rsa_fips186_4.c | 24 +++++++++++++++---------
>> + doc/man3/BN_cmp.pod          | 14 +++++++++++++-
>> + include/openssl/bn.h         |  1 +
>> + test/bntest.c                | 26 ++++++++++++++++++++++++--
>> + util/libcrypto.num           |  1 +
>> + 6 files changed, 85 insertions(+), 12 deletions(-)
>> +
>> +diff --git a/crypto/bn/bn_gcd.c b/crypto/bn/bn_gcd.c
>> +index cd0b015..879a84b 100644
>> +--- a/crypto/bn/bn_gcd.c
>> ++++ b/crypto/bn/bn_gcd.c
>> +@@ -534,6 +534,37 @@ BIGNUM *BN_mod_inverse(BIGNUM *in,
>> +     return rv;
>> + }
>> +
>> ++/*
>> ++ * The numbers a and b are coprime if the only positive integer that=
 is a
>> ++ * divisor of both of them is 1.
>> ++ * i.e. gcd(a,b) =3D 1.
>> ++ *
>> ++ * Coprimes have the property: b has a multiplicative inverse modulo=
 a
>> ++ * i.e there is some value x such that bx =3D 1 (mod a).
>> ++ *
>> ++ * Testing the modulo inverse is currently much faster than the cons=
tant
>> ++ * time version of BN_gcd().
>> ++ */
>> ++int BN_are_coprime(BIGNUM *a, const BIGNUM *b, BN_CTX *ctx)
>> ++{
>> ++    int ret =3D 0;
>> ++    BIGNUM *tmp;
>> ++
>> ++    BN_CTX_start(ctx);
>> ++    tmp =3D BN_CTX_get(ctx);
>> ++    if (tmp =3D=3D NULL)
>> ++        goto end;
>> ++
>> ++    ERR_set_mark();
>> ++    BN_set_flags(a, BN_FLG_CONSTTIME);
>> ++    ret =3D (BN_mod_inverse(tmp, a, b, ctx) !=3D NULL);
>> ++    /* Clear any errors (an error is returned if there is no inverse=
) */
>> ++    ERR_pop_to_mark();
>> ++end:
>> ++    BN_CTX_end(ctx);
>> ++    return ret;
>> ++}
>> ++
>> + /*-
>> +  * This function is based on the constant-time GCD work by Bernstein=
 and Yang:
>> +  *https://eprint.iacr.org/2019/266
>> +diff --git a/crypto/bn/bn_rsa_fips186_4.c b/crypto/bn/bn_rsa_fips186_=
4.c
>> +index 62d8685..55efaf2 100644
>> +--- a/crypto/bn/bn_rsa_fips186_4.c
>> ++++ b/crypto/bn/bn_rsa_fips186_4.c
>> +@@ -286,14 +286,20 @@ int ossl_bn_rsa_fips186_4_derive_prime(BIGNUM *=
Y, BIGNUM *X, const BIGNUM *Xin,
>> +             goto err;
>> +     }
>> +
>> ++    /*
>> ++     * (Step 1) GCD(2r1, r2) =3D 1.
>> ++     *    Note: This algorithm was doing a gcd(2r1, r2)=3D1 test bef=
ore doing an
>> ++     *    mod_inverse(2r1, r2) which are effectively the same operat=
ion.
>> ++     *    (The algorithm assumed that the gcd test would be faster).=
 Since the
>> ++     *    mod_inverse is currently faster than calling the constant =
time
>> ++     *    BN_gcd(), the call to BN_gcd() has been omitted. The inver=
se result
>> ++     *    is used further down.
>> ++     */
>> +     if (!(BN_lshift1(r1x2, r1)
>> +-            /* (Step 1) GCD(2r1, r2) =3D 1 */
>> +-            && BN_gcd(tmp, r1x2, r2, ctx)
>> +-            && BN_is_one(tmp)
>> ++            && (BN_mod_inverse(tmp, r1x2, r2, ctx) !=3D NULL)
>> +             /* (Step 2) R =3D ((r2^-1 mod 2r1) * r2) - ((2r1^-1 mod =
r2)*2r1) */
>> +-            && BN_mod_inverse(R, r2, r1x2, ctx)
>> ++            && (BN_mod_inverse(R, r2, r1x2, ctx) !=3D NULL)
>> +             && BN_mul(R, R, r2, ctx) /* R =3D (r2^-1 mod 2r1) * r2 *=
/
>> +-            && BN_mod_inverse(tmp, r1x2, r2, ctx)
>> +             && BN_mul(tmp, tmp, r1x2, ctx) /* tmp =3D (2r1^-1 mod r2=
)*2r1 */
>> +             && BN_sub(R, R, tmp)
>> +             /* Calculate 2r1r2 */
>> +@@ -305,7 +311,8 @@ int ossl_bn_rsa_fips186_4_derive_prime(BIGNUM *Y,=
 BIGNUM *X, const BIGNUM *Xin,
>> +
>> +     /*
>> +      * In FIPS 186-4 imax was set to 5 * nlen/2.
>> +-     * Analysis by Allen Roginsky (Seehttps://csrc.nist.gov/CSRC/med=
ia/Publications/fips/186/4/final/documents/comments-received-fips186-4-de=
cember-2015.pdf
>> ++     * Analysis by Allen Roginsky
>> ++     * (Seehttps://csrc.nist.gov/CSRC/media/Publications/fips/186/4/=
final/documents/comments-received-fips186-4-december-2015.pdf
>> +      * page 68) indicates this has a 1 in 2 million chance of failur=
e.
>> +      * The number has been updated to 20 * nlen/2 as used in
>> +      * FIPS186-5 Appendix B.9 Step 9.
>> +@@ -337,10 +344,9 @@ int ossl_bn_rsa_fips186_4_derive_prime(BIGNUM *Y=
, BIGNUM *X, const BIGNUM *Xin,
>> +
>> +             /* (Step 7) If GCD(Y-1) =3D=3D 1 & Y is probably prime t=
hen return Y */
>> +             if (BN_copy(y1, Y) =3D=3D NULL
>> +-                    || !BN_sub_word(y1, 1)
>> +-                    || !BN_gcd(tmp, y1, e, ctx))
>> ++                    || !BN_sub_word(y1, 1))
>> +                 goto err;
>> +-            if (BN_is_one(tmp)) {
>> ++            if (BN_are_coprime(y1, e, ctx)) {
>> +                 int rv =3D BN_check_prime(Y, ctx, cb);
>> +
>> +                 if (rv > 0)
>> +diff --git a/doc/man3/BN_cmp.pod b/doc/man3/BN_cmp.pod
>> +index f302818..e9ddf8f 100644
>> +--- a/doc/man3/BN_cmp.pod
>> ++++ b/doc/man3/BN_cmp.pod
>> +@@ -2,7 +2,8 @@
>> +
>> + =3Dhead1 NAME
>> +
>> +-BN_cmp, BN_ucmp, BN_is_zero, BN_is_one, BN_is_word, BN_abs_is_word, =
BN_is_odd - BIGNUM comparison and test functions
>> ++BN_cmp, BN_ucmp, BN_is_zero, BN_is_one, BN_is_word, BN_abs_is_word, =
BN_is_odd, BN_are_coprime
>> ++- BIGNUM comparison and test functions
>> +
>> + =3Dhead1 SYNOPSIS
>> +
>> +@@ -17,6 +18,8 @@ BN_cmp, BN_ucmp, BN_is_zero, BN_is_one, BN_is_word,=
 BN_abs_is_word, BN_is_odd -
>> +  int BN_abs_is_word(const BIGNUM *a, const BN_ULONG w);
>> +  int BN_is_odd(const BIGNUM *a);
>> +
>> ++ int BN_are_coprime(BIGNUM *a, const BIGNUM *b, BN_CTX *ctx);
>> ++
>> + =3Dhead1 DESCRIPTION
>> +
>> + BN_cmp() compares the numbers I<a> and I<b>. BN_ucmp() compares thei=
r
>> +@@ -26,6 +29,10 @@ BN_is_zero(), BN_is_one(), BN_is_word() and BN_abs=
_is_word() test if
>> + I<a> equals 0, 1, I<w>, or E<verbar>I<w>E<verbar> respectively.
>> + BN_is_odd() tests if I<a> is odd.
>> +
>> ++BN_are_coprime() determines if B<a> and B<b> are coprime.
>> ++B<ctx> is used internally for storing temporary variables.
>> ++The values of B<a> and B<b> and B<ctx> must not be NULL.
>> ++
>> + =3Dhead1 RETURN VALUES
>> +
>> + BN_cmp() returns -1 if I<a> E<lt> I<b>, 0 if I<a> =3D=3D I<b> and 1 =
if
>> +@@ -35,11 +42,16 @@ of I<a> and I<b>.
>> + BN_is_zero(), BN_is_one() BN_is_word(), BN_abs_is_word() and
>> + BN_is_odd() return 1 if the condition is true, 0 otherwise.
>> +
>> ++BN_are_coprime() returns 1 if the B<BIGNUM>'s are coprime, otherwise=
 it
>> ++returns 0.
>> ++
>> + =3Dhead1 HISTORY
>> +
>> + Prior to OpenSSL 1.1.0, BN_is_zero(), BN_is_one(), BN_is_word(),
>> + BN_abs_is_word() and BN_is_odd() were macros.
>> +
>> ++The function BN_are_coprime() was added in OpenSSL 3.1.
>> ++
>> + =3Dhead1 COPYRIGHT
>> +
>> + Copyright 2000-2021 The OpenSSL Project Authors. All Rights Reserved.
>> +diff --git a/include/openssl/bn.h b/include/openssl/bn.h
>> +index ecd7f01..73895a5 100644
>> +--- a/include/openssl/bn.h
>> ++++ b/include/openssl/bn.h
>> +@@ -344,6 +344,7 @@ int BN_gcd(BIGNUM *r, const BIGNUM *a, const BIGN=
UM *b, BN_CTX *ctx);
>> + int BN_kronecker(const BIGNUM *a, const BIGNUM *b, BN_CTX *ctx); /* =
returns
>> +                                                                   * =
-2 for
>> +                                                                   * =
error */
>> ++int BN_are_coprime(BIGNUM *a, const BIGNUM *b, BN_CTX *ctx);
>> + BIGNUM *BN_mod_inverse(BIGNUM *ret,
>> +                        const BIGNUM *a, const BIGNUM *n, BN_CTX *ctx=
);
>> + BIGNUM *BN_mod_sqrt(BIGNUM *ret,
>> +diff --git a/test/bntest.c b/test/bntest.c
>> +index c5894c1..eec6222 100644
>> +--- a/test/bntest.c
>> ++++ b/test/bntest.c
>> +@@ -38,6 +38,7 @@ typedef struct mpitest_st {
>> +
>> + static const int NUM0 =3D 100;           /* number of tests */
>> + static const int NUM1 =3D 50;            /* additional tests for som=
e functions */
>> ++static const int NUM_PRIME_TESTS =3D 20;
>> + static BN_CTX *ctx;
>> +
>> + /*
>> +@@ -2573,6 +2574,25 @@ static int test_ctx_consttime_flag(void)
>> +     return st;
>> + }
>> +
>> ++static int test_coprime(void)
>> ++{
>> ++    BIGNUM *a =3D NULL, *b =3D NULL;
>> ++    int ret =3D 0;
>> ++
>> ++    ret =3D TEST_ptr(a =3D BN_new())
>> ++          && TEST_ptr(b =3D BN_new())
>> ++          && TEST_true(BN_set_word(a, 66))
>> ++          && TEST_true(BN_set_word(b, 99))
>> ++          && TEST_int_eq(BN_are_coprime(a, b, ctx), 0)
>> ++          && TEST_int_eq(BN_are_coprime(b, a, ctx), 0)
>> ++          && TEST_true(BN_set_word(a, 67))
>> ++          && TEST_int_eq(BN_are_coprime(a, b, ctx), 1)
>> ++          && TEST_int_eq(BN_are_coprime(b, a, ctx), 1);
>> ++    BN_free(a);
>> ++    BN_free(b);
>> ++    return ret;
>> ++}
>> ++
>> + static int test_gcd_prime(void)
>> + {
>> +     BIGNUM *a =3D NULL, *b =3D NULL, *gcd =3D NULL;
>> +@@ -2585,11 +2605,12 @@ static int test_gcd_prime(void)
>> +
>> +     if (!TEST_true(BN_generate_prime_ex(a, 1024, 0, NULL, NULL, NULL=
)))
>> +             goto err;
>> +-    for (i =3D 0; i < NUM0; i++) {
>> ++    for (i =3D 0; i < NUM_PRIME_TESTS; i++) {
>> +         if (!TEST_true(BN_generate_prime_ex(b, 1024, 0,
>> +                                             NULL, NULL, NULL))
>> +                 || !TEST_true(BN_gcd(gcd, a, b, ctx))
>> +-                || !TEST_true(BN_is_one(gcd)))
>> ++                || !TEST_true(BN_is_one(gcd))
>> ++                || !TEST_true(BN_are_coprime(a, b, ctx)))
>> +             goto err;
>> +     }
>> +
>> +@@ -3066,6 +3087,7 @@ int setup_tests(void)
>> +         ADD_ALL_TESTS(test_is_prime, (int)OSSL_NELEM(primes));
>> +         ADD_ALL_TESTS(test_not_prime, (int)OSSL_NELEM(not_primes));
>> +         ADD_TEST(test_gcd_prime);
>> ++        ADD_TEST(test_coprime);
>> +         ADD_ALL_TESTS(test_mod_exp, (int)OSSL_NELEM(ModExpTests));
>> +         ADD_ALL_TESTS(test_mod_exp_consttime, (int)OSSL_NELEM(ModExp=
Tests));
>> +         ADD_TEST(test_mod_exp2_mont);
>> +diff --git a/util/libcrypto.num b/util/libcrypto.num
>> +index 0f6f30b..a1d1ed9 100644
>> +--- a/util/libcrypto.num
>> ++++ b/util/libcrypto.num
>> +@@ -5429,3 +5429,4 @@ OPENSSL_strcasecmp                      5556 3_=
0_3 EXIST::FUNCTION:
>> + OPENSSL_strncasecmp                     5557 3_0_3 EXIST::FUNCTION:
>> + OSSL_CMP_CTX_reset_geninfo_ITAVs        5558 3_0_8 EXIST::FUNCTION:C=
MP
>> + OSSL_CMP_MSG_update_recipNonce          5559 3_0_9 EXIST::FUNCTION:C=
MP
>> ++BN_are_coprime                          5560 3_0_0 EXIST::FUNCTION:
>> +--
>> +2.25.1
>> +
>> diff --git a/meta/recipes-connectivity/openssl/openssl/0002-Improve-FI=
PS-RSA-keygen-performance.patch b/meta/recipes-connectivity/openssl/opens=
sl/0002-Improve-FIPS-RSA-keygen-performance.patch
>> new file mode 100644
>> index 0000000000..1a6b601f65
>> --- /dev/null
>> +++ b/meta/recipes-connectivity/openssl/openssl/0002-Improve-FIPS-RSA-=
keygen-performance.patch
>> @@ -0,0 +1,185 @@
>> +From dfb8e0e716a1fd060eb13402d85cc46c8f64f929 Mon Sep 17 00:00:00 200=
1
>> +From: slontis<shane.lontis@oracle.com>
>> +Date: Wed, 2 Nov 2022 13:20:55 +1000
>> +Subject: [PATCH 2/2] Improve FIPS RSA keygen performance.
>> +
>> +Reduce the Miller Rabin counts to the values specified by FIPS 186-5.
>> +The old code was using a fixed value of 64.
>> +
>> +Reviewed-by: Paul Dale<pauli@openssl.org>
>> +Reviewed-by: Tomas Mraz<tomas@openssl.org>
>> +(Merged fromhttps://github.com/openssl/openssl/pull/19579)
>> +
>> +(cherry picked from commit d2f6e66d2837bff1f5f7636bb2118e3a45c9df61)
>> +
>> +Upstream-Status: Backport [https://github.com/openssl/openssl/commit/=
d2f6e66d2837bff1f5f7636bb2118e3a45c9df61]
>> +
>> +Signed-off-by: Haitao Liu<haitao.liu@windriver.com>
>> +---
>> + crypto/bn/bn_prime.c         | 11 ++++++++
>> + crypto/bn/bn_rsa_fips186_4.c | 49 ++++++++++++++++++++++++++++++----=
--
>> + include/crypto/bn.h          |  2 ++
>> + 3 files changed, 54 insertions(+), 8 deletions(-)
>> +
>> +diff --git a/crypto/bn/bn_prime.c b/crypto/bn/bn_prime.c
>> +index ddd31a0..79776f1 100644
>> +--- a/crypto/bn/bn_prime.c
>> ++++ b/crypto/bn/bn_prime.c
>> +@@ -252,6 +252,17 @@ int ossl_bn_check_prime(const BIGNUM *w, int che=
cks, BN_CTX *ctx,
>> +     return bn_is_prime_int(w, checks, ctx, do_trial_division, cb);
>> + }
>> +
>> ++/*
>> ++ * Use this only for key generation.
>> ++ * It always uses trial division. The number of checks
>> ++ * (MR rounds) passed in is used without being clamped to a minimum =
value.
>> ++ */
>> ++int ossl_bn_check_generated_prime(const BIGNUM *w, int checks, BN_CT=
X *ctx,
>> ++                                  BN_GENCB *cb)
>> ++{
>> ++    return bn_is_prime_int(w, checks, ctx, 1, cb);
>> ++}
>> ++
>> + int BN_check_prime(const BIGNUM *p, BN_CTX *ctx, BN_GENCB *cb)
>> + {
>> +     return ossl_bn_check_prime(p, 0, ctx, 1, cb);
>> +diff --git a/crypto/bn/bn_rsa_fips186_4.c b/crypto/bn/bn_rsa_fips186_=
4.c
>> +index 55efaf2..c3466df 100644
>> +--- a/crypto/bn/bn_rsa_fips186_4.c
>> ++++ b/crypto/bn/bn_rsa_fips186_4.c
>> +@@ -48,6 +48,34 @@ const BIGNUM ossl_bn_inv_sqrt_2 =3D {
>> +     BN_FLG_STATIC_DATA
>> + };
>> +
>> ++/*
>> ++ * Refer to FIPS 186-5 Table B.1 for minimum rounds of Miller Rabin
>> ++ * required for generation of RSA aux primes (p1, p2, q1 and q2).
>> ++ */
>> ++static int bn_rsa_fips186_5_aux_prime_MR_rounds(int nbits)
>> ++{
>> ++    if (nbits >=3D 4096)
>> ++        return 44;
>> ++    if (nbits >=3D 3072)
>> ++        return 41;
>> ++    if (nbits >=3D 2048)
>> ++        return 38;
>> ++    return 0; /* Error */
>> ++}
>> ++
>> ++/*
>> ++ * Refer to FIPS 186-5 Table B.1 for minimum rounds of Miller Rabin
>> ++ * required for generation of RSA primes (p and q)
>> ++ */
>> ++static int bn_rsa_fips186_5_prime_MR_rounds(int nbits)
>> ++{
>> ++    if (nbits >=3D 3072)
>> ++        return 4;
>> ++    if (nbits >=3D 2048)
>> ++        return 5;
>> ++    return 0; /* Error */
>> ++}
>> ++
>> + /*
>> +  * FIPS 186-5 Table A.1. "Min length of auxiliary primes p1, p2, q1,=
 q2".
>> +  * (FIPS 186-5 has an entry for >=3D 4096 bits).
>> +@@ -97,11 +125,13 @@ static int bn_rsa_fips186_5_aux_prime_max_sum_si=
ze_for_prob_primes(int nbits)
>> +  *     Xp1 The passed in starting point to find a probably prime.
>> +  *     p1 The returned probable prime (first odd integer >=3D Xp1)
>> +  *     ctx A BN_CTX object.
>> ++ *     rounds The number of Miller Rabin rounds
>> +  *     cb An optional BIGNUM callback.
>> +  * Returns: 1 on success otherwise it returns 0.
>> +  */
>> + static int bn_rsa_fips186_4_find_aux_prob_prime(const BIGNUM *Xp1,
>> +                                                 BIGNUM *p1, BN_CTX *=
ctx,
>> ++                                                int rounds,
>> +                                                 BN_GENCB *cb)
>> + {
>> +     int ret =3D 0;
>> +@@ -117,7 +147,7 @@ static int bn_rsa_fips186_4_find_aux_prob_prime(c=
onst BIGNUM *Xp1,
>> +         i++;
>> +         BN_GENCB_call(cb, 0, i);
>> +         /* MR test with trial division */
>> +-        tmp =3D BN_check_prime(p1, ctx, cb);
>> ++        tmp =3D ossl_bn_check_generated_prime(p1, rounds, ctx, cb);
>> +         if (tmp > 0)
>> +             break;
>> +         if (tmp < 0)
>> +@@ -160,7 +190,7 @@ int ossl_bn_rsa_fips186_4_gen_prob_primes(BIGNUM =
*p, BIGNUM *Xpout,
>> + {
>> +     int ret =3D 0;
>> +     BIGNUM *p1i =3D NULL, *p2i =3D NULL, *Xp1i =3D NULL, *Xp2i =3D N=
ULL;
>> +-    int bitlen;
>> ++    int bitlen, rounds;
>> +
>> +     if (p =3D=3D NULL || Xpout =3D=3D NULL)
>> +         return 0;
>> +@@ -177,6 +207,7 @@ int ossl_bn_rsa_fips186_4_gen_prob_primes(BIGNUM =
*p, BIGNUM *Xpout,
>> +     bitlen =3D bn_rsa_fips186_5_aux_prime_min_size(nlen);
>> +     if (bitlen =3D=3D 0)
>> +         goto err;
>> ++    rounds =3D bn_rsa_fips186_5_aux_prime_MR_rounds(nlen);
>> +
>> +     /* (Steps 4.1/5.1): Randomly generate Xp1 if it is not passed in=
 */
>> +     if (Xp1 =3D=3D NULL) {
>> +@@ -194,8 +225,8 @@ int ossl_bn_rsa_fips186_4_gen_prob_primes(BIGNUM =
*p, BIGNUM *Xpout,
>> +     }
>> +
>> +     /* (Steps 4.2/5.2) - find first auxiliary probable primes */
>> +-    if (!bn_rsa_fips186_4_find_aux_prob_prime(Xp1i, p1i, ctx, cb)
>> +-            || !bn_rsa_fips186_4_find_aux_prob_prime(Xp2i, p2i, ctx,=
 cb))
>> ++    if (!bn_rsa_fips186_4_find_aux_prob_prime(Xp1i, p1i, ctx, rounds=
, cb)
>> ++            || !bn_rsa_fips186_4_find_aux_prob_prime(Xp2i, p2i, ctx,=
 rounds, cb))
>> +         goto err;
>> +     /* (Table B.1) auxiliary prime Max length check */
>> +     if ((BN_num_bits(p1i) + BN_num_bits(p2i)) >=3D
>> +@@ -243,11 +274,11 @@ err:
>> +  */
>> + int ossl_bn_rsa_fips186_4_derive_prime(BIGNUM *Y, BIGNUM *X, const B=
IGNUM *Xin,
>> +                                        const BIGNUM *r1, const BIGNU=
M *r2,
>> +-                                       int nlen, const BIGNUM *e, BN=
_CTX *ctx,
>> +-                                       BN_GENCB *cb)
>> ++                                       int nlen, const BIGNUM *e,
>> ++                                       BN_CTX *ctx, BN_GENCB *cb)
>> + {
>> +     int ret =3D 0;
>> +-    int i, imax;
>> ++    int i, imax, rounds;
>> +     int bits =3D nlen >> 1;
>> +     BIGNUM *tmp, *R, *r1r2x2, *y1, *r1x2;
>> +     BIGNUM *base, *range;
>> +@@ -317,6 +348,7 @@ int ossl_bn_rsa_fips186_4_derive_prime(BIGNUM *Y,=
 BIGNUM *X, const BIGNUM *Xin,
>> +      * The number has been updated to 20 * nlen/2 as used in
>> +      * FIPS186-5 Appendix B.9 Step 9.
>> +      */
>> ++    rounds =3D bn_rsa_fips186_5_prime_MR_rounds(nlen);
>> +     imax =3D 20 * bits; /* max =3D 20/2 * nbits */
>> +     for (;;) {
>> +         if (Xin =3D=3D NULL) {
>> +@@ -346,8 +378,9 @@ int ossl_bn_rsa_fips186_4_derive_prime(BIGNUM *Y,=
 BIGNUM *X, const BIGNUM *Xin,
>> +             if (BN_copy(y1, Y) =3D=3D NULL
>> +                     || !BN_sub_word(y1, 1))
>> +                 goto err;
>> ++
>> +             if (BN_are_coprime(y1, e, ctx)) {
>> +-                int rv =3D BN_check_prime(Y, ctx, cb);
>> ++                int rv =3D ossl_bn_check_generated_prime(Y, rounds, =
ctx, cb);
>> +
>> +                 if (rv > 0)
>> +                     goto end;
>> +diff --git a/include/crypto/bn.h b/include/crypto/bn.h
>> +index fd1c09d..00544d9 100644
>> +--- a/include/crypto/bn.h
>> ++++ b/include/crypto/bn.h
>> +@@ -95,6 +95,8 @@ int bn_div_fixed_top(BIGNUM *dv, BIGNUM *rem, const=
 BIGNUM *m,
>> +
>> + int ossl_bn_miller_rabin_is_prime(const BIGNUM *w, int iterations, B=
N_CTX *ctx,
>> +                                   BN_GENCB *cb, int enhanced, int *s=
tatus);
>> ++int ossl_bn_check_generated_prime(const BIGNUM *w, int checks, BN_CT=
X *ctx,
>> ++                                  BN_GENCB *cb);
>> +
>> + const BIGNUM *ossl_bn_get0_small_factors(void);
>> +
>> +--
>> +2.25.1
>> +
>> diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.13.bb b/met=
a/recipes-connectivity/openssl/openssl_3.0.13.bb
>> index 5e43fdc2de..5b09493ccd 100644
>> --- a/meta/recipes-connectivity/openssl/openssl_3.0.13.bb
>> +++ b/meta/recipes-connectivity/openssl/openssl_3.0.13.bb
>> @@ -12,6 +12,8 @@ SRC_URI =3D"http://www.openssl.org/source/openssl-${=
PV}.tar.gz \=20
>> file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch=
=20
>> \ file://afalg.patch \=20
>> file://0001-Configure-do-not-tweak-mips-cflags.patch \ +=20
>> file://0001-Improve-FIPS-RSA-keygen-performance.patch \ +=20
>> file://0002-Improve-FIPS-RSA-keygen-performance.patch \ "
>>
>>   SRC_URI:append:class-nativesdk =3D " \
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#197294):https://lists.openembedded.org/g/openembed=
ded-core/message/197294
>> Mute This Topic:https://lists.openembedded.org/mt/104998278/3616765
>> Group Owner:openembedded-core+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  =
[randy.macleod@windriver.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>
>> --
>> # Randy MacLeod
>> # Wind River Linux


--=20
# Randy MacLeod
# Wind River Linux

--------------kUSAvX6L90lwvW38HpYUUQCd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 42QHxncF002008

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2024-03-19 7:23 p.m., Steve Sakoman
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CAOSpxdapBOHDS6YX9LfApq1sbXeJ=3D=
FtHam3OBx0PfCaz5Pvsgw@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">On Tue, Mar 19, 2024 at 11:4=
5=E2=80=AFAM Randy MacLeod
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:randy.macleod@windriver=
.com">&lt;randy.macleod@windriver.com&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">Hi Haitao, et al,


Summary:

I think we could bring these two commits back to kirkstone even though up=
stream openssl mtc
does not plan to do so, at least not without &quot;very good reasons&quot=
;.

but I have some comments and questions below that I'd like you to respond=
 to before sending a v2.

../Randy



Typo in the subject:
   [OE-core][kirkstone][PATCH] openssl: Improve FIPS RSA keygen performac
should be:
   [OE-core][kirkstone][PATCH] openssl: Improve FIPS RSA keygen performan=
ce

On 2024-03-18 2:55 a.m., jason.lau via lists.openembedded.org wrote:

The ssh-keygen would take a long time to generate the entropy of a key

It's best to be more specific.

You mentioned in:

<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/openssl/ope=
nssl/issues/23766">https://github.com/openssl/openssl/issues/23766</a>

that &quot;ssh-keygen (built with openssl3.0) is taking 1-2s to execute w=
hereas in openssl3.1 it was hardly half a second&quot;

so you should mention that in the commit log.

You should also include a link to the upstream issue you opened to explai=
n that:

   &quot;Performance fixes are in general not eligible for backports to s=
table release branches.
    In specific cases an exception could be given by OTC but there would =
have to be very good reasons for such an exception.&quot;

I saw that comment last week and wondered if we should push harder for up=
stream to backport these commits but
I understand your reluctance to do that when it might make sense to just =
backport here in oe-core.

Note that the commits are only part of 3.2.0+:

=E2=9D=AF git tag --contains dd1d7bcb69994d81662e709b0ad838880b943870
openssl-3.2.0
openssl-3.2.0-alpha1
openssl-3.2.0-alpha2
openssl-3.2.0-beta1
openssl-3.2.1

=E2=9D=AF git tag --contains d2f6e66d2837bff1f5f7636bb2118e3a45c9df61
openssl-3.2.0
openssl-3.2.0-alpha1
openssl-3.2.0-alpha2
openssl-3.2.0-beta1
openssl-3.2.1

so they'd also have to be back-ported to nanbield technically:
   <a class=3D"moz-txt-link-freetext" href=3D"https://git.openembedded.or=
g/openembedded-core/tree/meta/recipes-connectivity/openssl/openssl_3.1.4.=
bb?h=3Dnanbield">https://git.openembedded.org/openembedded-core/tree/meta=
/recipes-connectivity/openssl/openssl_3.1.4.bb?h=3Dnanbield</a>

Steve,
Given that nanbield is a week or so away from EOL, is it worth doing that=
?
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">I'm going to close down chan=
ges to nanbield in the next day or so, so
there probably isn't time to get such a change in.

And I suspect that the kirkstone v2 patch won't make it through</pre>
    </blockquote>
    <p>Haitao, <br>
    </p>
    <p>Steve has NOT merged this to kirkstone:<br>
      &nbsp;
<a class=3D"moz-txt-link-freetext" href=3D"https://git.openembedded.org/o=
penembedded-core-contrib/log/?h=3Dstable/kirkstone-nut">https://git.opene=
mbedded.org/openembedded-core-contrib/log/?h=3Dstable/kirkstone-nut</a></=
p>
    <p>&nbsp; <a class=3D"moz-txt-link-freetext" href=3D"https://git.open=
embedded.org/openembedded-core/log/?h=3Dkirkstone">https://git.openembedd=
ed.org/openembedded-core/log/?h=3Dkirkstone</a></p>
    <p><br>
    </p>
    <p>Please reply to and/or deal with my comments and send a v2.</p>
    <p>Thanks!<br>
    </p>
    <p>../Randy</p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CAOSpxdapBOHDS6YX9LfApq1sbXeJ=3D=
FtHam3OBx0PfCaz5Pvsgw@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">
testing until after the nanbield final release is done, so I don't
have an issue with taking it.

Steve

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">Note that the original com=
mits were from Nov 2, 2022 so they've had some time to ummm, bake but
the 3.2.0 release was 'only' on Nov 23, 2023:
   <a class=3D"moz-txt-link-freetext" href=3D"https://www.openssl.org/sou=
rce/old/3.2/index.html">https://www.openssl.org/source/old/3.2/index.html=
</a>
so it's got 3 or 4 months of the public being able to test it.

I've taken a look at the commits and haven't seen a problem with the back=
port.

Haitao,
Did you have to adjust the patches at all? If so please explain what you =
did.

Your tests show that openssl is faster, have you tested for correctness a=
t all?
Does it make sense to run: test/bntest.c ? Steve will likely run the ptes=
ts of course.

Do we need the oneline change: &quot;Fix incorrect error branch in ossl_b=
n_rsa_fips186_4_derive_prime()&quot;
from:
openssl.git on master
=E2=9D=AF git log --oneline crypto/bn/bn_rsa_fips186_4.c
da1c088f59 Copyright year updates
835b90a19c Fix incorrect error branch in ossl_bn_rsa_fips186_4_derive_pri=
me()
d2f6e66d28 Improve FIPS RSA keygen performance.
dd1d7bcb69 Improve FIPS RSA keygen performance.


Are there any other changes to the files touched by these commits that wo=
uld affect
the correctness or performance of the code introduced?

../Randy



The following commits have fixed the issue.
<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/openssl/ope=
nssl/commit/dd1d7bcb69994d81662e709b0ad838880b943870">https://github.com/=
openssl/openssl/commit/dd1d7bcb69994d81662e709b0ad838880b943870</a>
<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/openssl/ope=
nssl/commit/d2f6e66d2837bff1f5f7636bb2118e3a45c9df61">https://github.com/=
openssl/openssl/commit/d2f6e66d2837bff1f5f7636bb2118e3a45c9df61</a>

Signed-off-by: Haitao Liu <a class=3D"moz-txt-link-rfc2396E" href=3D"mail=
to:haitao.liu@windriver.com">&lt;haitao.liu@windriver.com&gt;</a>
---
 ...-Improve-FIPS-RSA-keygen-performance.patch | 271 ++++++++++++++++++
 ...-Improve-FIPS-RSA-keygen-performance.patch | 185 ++++++++++++
 .../openssl/openssl_3.0.13.bb                 |   2 +
 3 files changed, 458 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/0001-Improv=
e-FIPS-RSA-keygen-performance.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/0002-Improv=
e-FIPS-RSA-keygen-performance.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Improve-FIPS-=
RSA-keygen-performance.patch b/meta/recipes-connectivity/openssl/openssl/=
0001-Improve-FIPS-RSA-keygen-performance.patch
new file mode 100644
index 0000000000..aed0e1a5c1
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/0001-Improve-FIPS-RSA-key=
gen-performance.patch
@@ -0,0 +1,271 @@
+From a940dfa152707ba82f3efc2c147f6313c28f7662 Mon Sep 17 00:00:00 2001
+From: slontis <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:shane.lo=
ntis@oracle.com">&lt;shane.lontis@oracle.com&gt;</a>
+Date: Wed, 2 Nov 2022 12:01:34 +1000
+Subject: [PATCH 1/2] Improve FIPS RSA keygen performance.
+
+FIPS 186-4 has 5 different algorithms for key generation,
+and all of them rely on testing GCD(a,n) =3D=3D 1 many times.
+
+Cachegrind was showing that during a RSA keygen operation,
+the function BN_gcd() was taking a considerable percentage
+of the total cycles.
+
+The default provider uses multiprime keygen, which seemed to
+be much faster. This is because it uses BN_mod_inverse()
+instead.
+
+For a 4096 bit key, the entropy of a key that was taking a
+long time to generate was recorded and fed back into subsequent
+runs. Roughly 40% of the cycle time was BN_gcd() with most of the
+remainder in the prime testing. Changing to use the inverse
+resulted in the cycle count being 96% in the prime testing.
+
+Reviewed-by: Paul Dale <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto=
:pauli@openssl.org">&lt;pauli@openssl.org&gt;</a>
+Reviewed-by: Tomas Mraz <a class=3D"moz-txt-link-rfc2396E" href=3D"mailt=
o:tomas@openssl.org">&lt;tomas@openssl.org&gt;</a>
+(Merged from <a class=3D"moz-txt-link-freetext" href=3D"https://github.c=
om/openssl/openssl/pull/19578">https://github.com/openssl/openssl/pull/19=
578</a>)
+
+(cherry picked from commit dd1d7bcb69994d81662e709b0ad838880b943870)
+
+Upstream-Status: Backport [<a class=3D"moz-txt-link-freetext" href=3D"ht=
tps://github.com/openssl/openssl/commit/dd1d7bcb69994d81662e709b0ad838880=
b943870">https://github.com/openssl/openssl/commit/dd1d7bcb69994d81662e70=
9b0ad838880b943870</a>]
+
+Signed-off-by: Haitao Liu <a class=3D"moz-txt-link-rfc2396E" href=3D"mai=
lto:haitao.liu@windriver.com">&lt;haitao.liu@windriver.com&gt;</a>
+---
+ crypto/bn/bn_gcd.c           | 31 +++++++++++++++++++++++++++++++
+ crypto/bn/bn_rsa_fips186_4.c | 24 +++++++++++++++---------
+ doc/man3/BN_cmp.pod          | 14 +++++++++++++-
+ include/openssl/bn.h         |  1 +
+ test/bntest.c                | 26 ++++++++++++++++++++++++--
+ util/libcrypto.num           |  1 +
+ 6 files changed, 85 insertions(+), 12 deletions(-)
+
+diff --git a/crypto/bn/bn_gcd.c b/crypto/bn/bn_gcd.c
+index cd0b015..879a84b 100644
+--- a/crypto/bn/bn_gcd.c
++++ b/crypto/bn/bn_gcd.c
+@@ -534,6 +534,37 @@ BIGNUM *BN_mod_inverse(BIGNUM *in,
+     return rv;
+ }
+
++/*
++ * The numbers a and b are coprime if the only positive integer that is=
 a
++ * divisor of both of them is 1.
++ * i.e. gcd(a,b) =3D 1.
++ *
++ * Coprimes have the property: b has a multiplicative inverse modulo a
++ * i.e there is some value x such that bx =3D 1 (mod a).
++ *
++ * Testing the modulo inverse is currently much faster than the constan=
t
++ * time version of BN_gcd().
++ */
++int BN_are_coprime(BIGNUM *a, const BIGNUM *b, BN_CTX *ctx)
++{
++    int ret =3D 0;
++    BIGNUM *tmp;
++
++    BN_CTX_start(ctx);
++    tmp =3D BN_CTX_get(ctx);
++    if (tmp =3D=3D NULL)
++        goto end;
++
++    ERR_set_mark();
++    BN_set_flags(a, BN_FLG_CONSTTIME);
++    ret =3D (BN_mod_inverse(tmp, a, b, ctx) !=3D NULL);
++    /* Clear any errors (an error is returned if there is no inverse) *=
/
++    ERR_pop_to_mark();
++end:
++    BN_CTX_end(ctx);
++    return ret;
++}
++
+ /*-
+  * This function is based on the constant-time GCD work by Bernstein an=
d Yang:
+  * <a class=3D"moz-txt-link-freetext" href=3D"https://eprint.iacr.org/2=
019/266">https://eprint.iacr.org/2019/266</a>
+diff --git a/crypto/bn/bn_rsa_fips186_4.c b/crypto/bn/bn_rsa_fips186_4.c
+index 62d8685..55efaf2 100644
+--- a/crypto/bn/bn_rsa_fips186_4.c
++++ b/crypto/bn/bn_rsa_fips186_4.c
+@@ -286,14 +286,20 @@ int ossl_bn_rsa_fips186_4_derive_prime(BIGNUM *Y, =
BIGNUM *X, const BIGNUM *Xin,
+             goto err;
+     }
+
++    /*
++     * (Step 1) GCD(2r1, r2) =3D 1.
++     *    Note: This algorithm was doing a gcd(2r1, r2)=3D1 test before=
 doing an
++     *    mod_inverse(2r1, r2) which are effectively the same operation.
++     *    (The algorithm assumed that the gcd test would be faster). Si=
nce the
++     *    mod_inverse is currently faster than calling the constant tim=
e
++     *    BN_gcd(), the call to BN_gcd() has been omitted. The inverse =
result
++     *    is used further down.
++     */
+     if (!(BN_lshift1(r1x2, r1)
+-            /* (Step 1) GCD(2r1, r2) =3D 1 */
+-            &amp;&amp; BN_gcd(tmp, r1x2, r2, ctx)
+-            &amp;&amp; BN_is_one(tmp)
++            &amp;&amp; (BN_mod_inverse(tmp, r1x2, r2, ctx) !=3D NULL)
+             /* (Step 2) R =3D ((r2^-1 mod 2r1) * r2) - ((2r1^-1 mod r2)=
*2r1) */
+-            &amp;&amp; BN_mod_inverse(R, r2, r1x2, ctx)
++            &amp;&amp; (BN_mod_inverse(R, r2, r1x2, ctx) !=3D NULL)
+             &amp;&amp; BN_mul(R, R, r2, ctx) /* R =3D (r2^-1 mod 2r1) *=
 r2 */
+-            &amp;&amp; BN_mod_inverse(tmp, r1x2, r2, ctx)
+             &amp;&amp; BN_mul(tmp, tmp, r1x2, ctx) /* tmp =3D (2r1^-1 m=
od r2)*2r1 */
+             &amp;&amp; BN_sub(R, R, tmp)
+             /* Calculate 2r1r2 */
+@@ -305,7 +311,8 @@ int ossl_bn_rsa_fips186_4_derive_prime(BIGNUM *Y, BI=
GNUM *X, const BIGNUM *Xin,
+
+     /*
+      * In FIPS 186-4 imax was set to 5 * nlen/2.
+-     * Analysis by Allen Roginsky (See <a class=3D"moz-txt-link-freetex=
t" href=3D"https://csrc.nist.gov/CSRC/media/Publications/fips/186/4/final=
/documents/comments-received-fips186-4-december-2015.pdf">https://csrc.ni=
st.gov/CSRC/media/Publications/fips/186/4/final/documents/comments-receiv=
ed-fips186-4-december-2015.pdf</a>
++     * Analysis by Allen Roginsky
++     * (See <a class=3D"moz-txt-link-freetext" href=3D"https://csrc.nis=
t.gov/CSRC/media/Publications/fips/186/4/final/documents/comments-receive=
d-fips186-4-december-2015.pdf">https://csrc.nist.gov/CSRC/media/Publicati=
ons/fips/186/4/final/documents/comments-received-fips186-4-december-2015.=
pdf</a>
+      * page 68) indicates this has a 1 in 2 million chance of failure.
+      * The number has been updated to 20 * nlen/2 as used in
+      * FIPS186-5 Appendix B.9 Step 9.
+@@ -337,10 +344,9 @@ int ossl_bn_rsa_fips186_4_derive_prime(BIGNUM *Y, B=
IGNUM *X, const BIGNUM *Xin,
+
+             /* (Step 7) If GCD(Y-1) =3D=3D 1 &amp; Y is probably prime =
then return Y */
+             if (BN_copy(y1, Y) =3D=3D NULL
+-                    || !BN_sub_word(y1, 1)
+-                    || !BN_gcd(tmp, y1, e, ctx))
++                    || !BN_sub_word(y1, 1))
+                 goto err;
+-            if (BN_is_one(tmp)) {
++            if (BN_are_coprime(y1, e, ctx)) {
+                 int rv =3D BN_check_prime(Y, ctx, cb);
+
+                 if (rv &gt; 0)
+diff --git a/doc/man3/BN_cmp.pod b/doc/man3/BN_cmp.pod
+index f302818..e9ddf8f 100644
+--- a/doc/man3/BN_cmp.pod
++++ b/doc/man3/BN_cmp.pod
+@@ -2,7 +2,8 @@
+
+ =3Dhead1 NAME
+
+-BN_cmp, BN_ucmp, BN_is_zero, BN_is_one, BN_is_word, BN_abs_is_word, BN_=
is_odd - BIGNUM comparison and test functions
++BN_cmp, BN_ucmp, BN_is_zero, BN_is_one, BN_is_word, BN_abs_is_word, BN_=
is_odd, BN_are_coprime
++- BIGNUM comparison and test functions
+
+ =3Dhead1 SYNOPSIS
+
+@@ -17,6 +18,8 @@ BN_cmp, BN_ucmp, BN_is_zero, BN_is_one, BN_is_word, BN=
_abs_is_word, BN_is_odd -
+  int BN_abs_is_word(const BIGNUM *a, const BN_ULONG w);
+  int BN_is_odd(const BIGNUM *a);
+
++ int BN_are_coprime(BIGNUM *a, const BIGNUM *b, BN_CTX *ctx);
++
+ =3Dhead1 DESCRIPTION
+
+ BN_cmp() compares the numbers I&lt;a&gt; and I&lt;b&gt;. BN_ucmp() comp=
ares their
+@@ -26,6 +29,10 @@ BN_is_zero(), BN_is_one(), BN_is_word() and BN_abs_is=
_word() test if
+ I&lt;a&gt; equals 0, 1, I&lt;w&gt;, or E&lt;verbar&gt;I&lt;w&gt;E&lt;ve=
rbar&gt; respectively.
+ BN_is_odd() tests if I&lt;a&gt; is odd.
+
++BN_are_coprime() determines if B&lt;a&gt; and B&lt;b&gt; are coprime.
++B&lt;ctx&gt; is used internally for storing temporary variables.
++The values of B&lt;a&gt; and B&lt;b&gt; and B&lt;ctx&gt; must not be NU=
LL.
++
+ =3Dhead1 RETURN VALUES
+
+ BN_cmp() returns -1 if I&lt;a&gt; E&lt;lt&gt; I&lt;b&gt;, 0 if I&lt;a&g=
t; =3D=3D I&lt;b&gt; and 1 if
+@@ -35,11 +42,16 @@ of I&lt;a&gt; and I&lt;b&gt;.
+ BN_is_zero(), BN_is_one() BN_is_word(), BN_abs_is_word() and
+ BN_is_odd() return 1 if the condition is true, 0 otherwise.
+
++BN_are_coprime() returns 1 if the B&lt;BIGNUM&gt;'s are coprime, otherw=
ise it
++returns 0.
++
+ =3Dhead1 HISTORY
+
+ Prior to OpenSSL 1.1.0, BN_is_zero(), BN_is_one(), BN_is_word(),
+ BN_abs_is_word() and BN_is_odd() were macros.
+
++The function BN_are_coprime() was added in OpenSSL 3.1.
++
+ =3Dhead1 COPYRIGHT
+
+ Copyright 2000-2021 The OpenSSL Project Authors. All Rights Reserved.
+diff --git a/include/openssl/bn.h b/include/openssl/bn.h
+index ecd7f01..73895a5 100644
+--- a/include/openssl/bn.h
++++ b/include/openssl/bn.h
+@@ -344,6 +344,7 @@ int BN_gcd(BIGNUM *r, const BIGNUM *a, const BIGNUM =
*b, BN_CTX *ctx);
+ int BN_kronecker(const BIGNUM *a, const BIGNUM *b, BN_CTX *ctx); /* ret=
urns
+                                                                   * -2 =
for
+                                                                   * err=
or */
++int BN_are_coprime(BIGNUM *a, const BIGNUM *b, BN_CTX *ctx);
+ BIGNUM *BN_mod_inverse(BIGNUM *ret,
+                        const BIGNUM *a, const BIGNUM *n, BN_CTX *ctx);
+ BIGNUM *BN_mod_sqrt(BIGNUM *ret,
+diff --git a/test/bntest.c b/test/bntest.c
+index c5894c1..eec6222 100644
+--- a/test/bntest.c
++++ b/test/bntest.c
+@@ -38,6 +38,7 @@ typedef struct mpitest_st {
+
+ static const int NUM0 =3D 100;           /* number of tests */
+ static const int NUM1 =3D 50;            /* additional tests for some f=
unctions */
++static const int NUM_PRIME_TESTS =3D 20;
+ static BN_CTX *ctx;
+
+ /*
+@@ -2573,6 +2574,25 @@ static int test_ctx_consttime_flag(void)
+     return st;
+ }
+
++static int test_coprime(void)
++{
++    BIGNUM *a =3D NULL, *b =3D NULL;
++    int ret =3D 0;
++
++    ret =3D TEST_ptr(a =3D BN_new())
++          &amp;&amp; TEST_ptr(b =3D BN_new())
++          &amp;&amp; TEST_true(BN_set_word(a, 66))
++          &amp;&amp; TEST_true(BN_set_word(b, 99))
++          &amp;&amp; TEST_int_eq(BN_are_coprime(a, b, ctx), 0)
++          &amp;&amp; TEST_int_eq(BN_are_coprime(b, a, ctx), 0)
++          &amp;&amp; TEST_true(BN_set_word(a, 67))
++          &amp;&amp; TEST_int_eq(BN_are_coprime(a, b, ctx), 1)
++          &amp;&amp; TEST_int_eq(BN_are_coprime(b, a, ctx), 1);
++    BN_free(a);
++    BN_free(b);
++    return ret;
++}
++
+ static int test_gcd_prime(void)
+ {
+     BIGNUM *a =3D NULL, *b =3D NULL, *gcd =3D NULL;
+@@ -2585,11 +2605,12 @@ static int test_gcd_prime(void)
+
+     if (!TEST_true(BN_generate_prime_ex(a, 1024, 0, NULL, NULL, NULL)))
+             goto err;
+-    for (i =3D 0; i &lt; NUM0; i++) {
++    for (i =3D 0; i &lt; NUM_PRIME_TESTS; i++) {
+         if (!TEST_true(BN_generate_prime_ex(b, 1024, 0,
+                                             NULL, NULL, NULL))
+                 || !TEST_true(BN_gcd(gcd, a, b, ctx))
+-                || !TEST_true(BN_is_one(gcd)))
++                || !TEST_true(BN_is_one(gcd))
++                || !TEST_true(BN_are_coprime(a, b, ctx)))
+             goto err;
+     }
+
+@@ -3066,6 +3087,7 @@ int setup_tests(void)
+         ADD_ALL_TESTS(test_is_prime, (int)OSSL_NELEM(primes));
+         ADD_ALL_TESTS(test_not_prime, (int)OSSL_NELEM(not_primes));
+         ADD_TEST(test_gcd_prime);
++        ADD_TEST(test_coprime);
+         ADD_ALL_TESTS(test_mod_exp, (int)OSSL_NELEM(ModExpTests));
+         ADD_ALL_TESTS(test_mod_exp_consttime, (int)OSSL_NELEM(ModExpTes=
ts));
+         ADD_TEST(test_mod_exp2_mont);
+diff --git a/util/libcrypto.num b/util/libcrypto.num
+index 0f6f30b..a1d1ed9 100644
+--- a/util/libcrypto.num
++++ b/util/libcrypto.num
+@@ -5429,3 +5429,4 @@ OPENSSL_strcasecmp                      5556 3_0_3=
 EXIST::FUNCTION:
+ OPENSSL_strncasecmp                     5557 3_0_3 EXIST::FUNCTION:
+ OSSL_CMP_CTX_reset_geninfo_ITAVs        5558 3_0_8 EXIST::FUNCTION:CMP
+ OSSL_CMP_MSG_update_recipNonce          5559 3_0_9 EXIST::FUNCTION:CMP
++BN_are_coprime                          5560 3_0_0 EXIST::FUNCTION:
+--
+2.25.1
+
diff --git a/meta/recipes-connectivity/openssl/openssl/0002-Improve-FIPS-=
RSA-keygen-performance.patch b/meta/recipes-connectivity/openssl/openssl/=
0002-Improve-FIPS-RSA-keygen-performance.patch
new file mode 100644
index 0000000000..1a6b601f65
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/0002-Improve-FIPS-RSA-key=
gen-performance.patch
@@ -0,0 +1,185 @@
+From dfb8e0e716a1fd060eb13402d85cc46c8f64f929 Mon Sep 17 00:00:00 2001
+From: slontis <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:shane.lo=
ntis@oracle.com">&lt;shane.lontis@oracle.com&gt;</a>
+Date: Wed, 2 Nov 2022 13:20:55 +1000
+Subject: [PATCH 2/2] Improve FIPS RSA keygen performance.
+
+Reduce the Miller Rabin counts to the values specified by FIPS 186-5.
+The old code was using a fixed value of 64.
+
+Reviewed-by: Paul Dale <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto=
:pauli@openssl.org">&lt;pauli@openssl.org&gt;</a>
+Reviewed-by: Tomas Mraz <a class=3D"moz-txt-link-rfc2396E" href=3D"mailt=
o:tomas@openssl.org">&lt;tomas@openssl.org&gt;</a>
+(Merged from <a class=3D"moz-txt-link-freetext" href=3D"https://github.c=
om/openssl/openssl/pull/19579">https://github.com/openssl/openssl/pull/19=
579</a>)
+
+(cherry picked from commit d2f6e66d2837bff1f5f7636bb2118e3a45c9df61)
+
+Upstream-Status: Backport [<a class=3D"moz-txt-link-freetext" href=3D"ht=
tps://github.com/openssl/openssl/commit/d2f6e66d2837bff1f5f7636bb2118e3a4=
5c9df61">https://github.com/openssl/openssl/commit/d2f6e66d2837bff1f5f763=
6bb2118e3a45c9df61</a>]
+
+Signed-off-by: Haitao Liu <a class=3D"moz-txt-link-rfc2396E" href=3D"mai=
lto:haitao.liu@windriver.com">&lt;haitao.liu@windriver.com&gt;</a>
+---
+ crypto/bn/bn_prime.c         | 11 ++++++++
+ crypto/bn/bn_rsa_fips186_4.c | 49 ++++++++++++++++++++++++++++++------
+ include/crypto/bn.h          |  2 ++
+ 3 files changed, 54 insertions(+), 8 deletions(-)
+
+diff --git a/crypto/bn/bn_prime.c b/crypto/bn/bn_prime.c
+index ddd31a0..79776f1 100644
+--- a/crypto/bn/bn_prime.c
++++ b/crypto/bn/bn_prime.c
+@@ -252,6 +252,17 @@ int ossl_bn_check_prime(const BIGNUM *w, int checks=
, BN_CTX *ctx,
+     return bn_is_prime_int(w, checks, ctx, do_trial_division, cb);
+ }
+
++/*
++ * Use this only for key generation.
++ * It always uses trial division. The number of checks
++ * (MR rounds) passed in is used without being clamped to a minimum val=
ue.
++ */
++int ossl_bn_check_generated_prime(const BIGNUM *w, int checks, BN_CTX *=
ctx,
++                                  BN_GENCB *cb)
++{
++    return bn_is_prime_int(w, checks, ctx, 1, cb);
++}
++
+ int BN_check_prime(const BIGNUM *p, BN_CTX *ctx, BN_GENCB *cb)
+ {
+     return ossl_bn_check_prime(p, 0, ctx, 1, cb);
+diff --git a/crypto/bn/bn_rsa_fips186_4.c b/crypto/bn/bn_rsa_fips186_4.c
+index 55efaf2..c3466df 100644
+--- a/crypto/bn/bn_rsa_fips186_4.c
++++ b/crypto/bn/bn_rsa_fips186_4.c
+@@ -48,6 +48,34 @@ const BIGNUM ossl_bn_inv_sqrt_2 =3D {
+     BN_FLG_STATIC_DATA
+ };
+
++/*
++ * Refer to FIPS 186-5 Table B.1 for minimum rounds of Miller Rabin
++ * required for generation of RSA aux primes (p1, p2, q1 and q2).
++ */
++static int bn_rsa_fips186_5_aux_prime_MR_rounds(int nbits)
++{
++    if (nbits &gt;=3D 4096)
++        return 44;
++    if (nbits &gt;=3D 3072)
++        return 41;
++    if (nbits &gt;=3D 2048)
++        return 38;
++    return 0; /* Error */
++}
++
++/*
++ * Refer to FIPS 186-5 Table B.1 for minimum rounds of Miller Rabin
++ * required for generation of RSA primes (p and q)
++ */
++static int bn_rsa_fips186_5_prime_MR_rounds(int nbits)
++{
++    if (nbits &gt;=3D 3072)
++        return 4;
++    if (nbits &gt;=3D 2048)
++        return 5;
++    return 0; /* Error */
++}
++
+ /*
+  * FIPS 186-5 Table A.1. &quot;Min length of auxiliary primes p1, p2, q=
1, q2&quot;.
+  * (FIPS 186-5 has an entry for &gt;=3D 4096 bits).
+@@ -97,11 +125,13 @@ static int bn_rsa_fips186_5_aux_prime_max_sum_size_=
for_prob_primes(int nbits)
+  *     Xp1 The passed in starting point to find a probably prime.
+  *     p1 The returned probable prime (first odd integer &gt;=3D Xp1)
+  *     ctx A BN_CTX object.
++ *     rounds The number of Miller Rabin rounds
+  *     cb An optional BIGNUM callback.
+  * Returns: 1 on success otherwise it returns 0.
+  */
+ static int bn_rsa_fips186_4_find_aux_prob_prime(const BIGNUM *Xp1,
+                                                 BIGNUM *p1, BN_CTX *ctx=
,
++                                                int rounds,
+                                                 BN_GENCB *cb)
+ {
+     int ret =3D 0;
+@@ -117,7 +147,7 @@ static int bn_rsa_fips186_4_find_aux_prob_prime(cons=
t BIGNUM *Xp1,
+         i++;
+         BN_GENCB_call(cb, 0, i);
+         /* MR test with trial division */
+-        tmp =3D BN_check_prime(p1, ctx, cb);
++        tmp =3D ossl_bn_check_generated_prime(p1, rounds, ctx, cb);
+         if (tmp &gt; 0)
+             break;
+         if (tmp &lt; 0)
+@@ -160,7 +190,7 @@ int ossl_bn_rsa_fips186_4_gen_prob_primes(BIGNUM *p,=
 BIGNUM *Xpout,
+ {
+     int ret =3D 0;
+     BIGNUM *p1i =3D NULL, *p2i =3D NULL, *Xp1i =3D NULL, *Xp2i =3D NULL=
;
+-    int bitlen;
++    int bitlen, rounds;
+
+     if (p =3D=3D NULL || Xpout =3D=3D NULL)
+         return 0;
+@@ -177,6 +207,7 @@ int ossl_bn_rsa_fips186_4_gen_prob_primes(BIGNUM *p,=
 BIGNUM *Xpout,
+     bitlen =3D bn_rsa_fips186_5_aux_prime_min_size(nlen);
+     if (bitlen =3D=3D 0)
+         goto err;
++    rounds =3D bn_rsa_fips186_5_aux_prime_MR_rounds(nlen);
+
+     /* (Steps 4.1/5.1): Randomly generate Xp1 if it is not passed in */
+     if (Xp1 =3D=3D NULL) {
+@@ -194,8 +225,8 @@ int ossl_bn_rsa_fips186_4_gen_prob_primes(BIGNUM *p,=
 BIGNUM *Xpout,
+     }
+
+     /* (Steps 4.2/5.2) - find first auxiliary probable primes */
+-    if (!bn_rsa_fips186_4_find_aux_prob_prime(Xp1i, p1i, ctx, cb)
+-            || !bn_rsa_fips186_4_find_aux_prob_prime(Xp2i, p2i, ctx, cb=
))
++    if (!bn_rsa_fips186_4_find_aux_prob_prime(Xp1i, p1i, ctx, rounds, c=
b)
++            || !bn_rsa_fips186_4_find_aux_prob_prime(Xp2i, p2i, ctx, ro=
unds, cb))
+         goto err;
+     /* (Table B.1) auxiliary prime Max length check */
+     if ((BN_num_bits(p1i) + BN_num_bits(p2i)) &gt;=3D
+@@ -243,11 +274,11 @@ err:
+  */
+ int ossl_bn_rsa_fips186_4_derive_prime(BIGNUM *Y, BIGNUM *X, const BIGN=
UM *Xin,
+                                        const BIGNUM *r1, const BIGNUM *=
r2,
+-                                       int nlen, const BIGNUM *e, BN_CT=
X *ctx,
+-                                       BN_GENCB *cb)
++                                       int nlen, const BIGNUM *e,
++                                       BN_CTX *ctx, BN_GENCB *cb)
+ {
+     int ret =3D 0;
+-    int i, imax;
++    int i, imax, rounds;
+     int bits =3D nlen &gt;&gt; 1;
+     BIGNUM *tmp, *R, *r1r2x2, *y1, *r1x2;
+     BIGNUM *base, *range;
+@@ -317,6 +348,7 @@ int ossl_bn_rsa_fips186_4_derive_prime(BIGNUM *Y, BI=
GNUM *X, const BIGNUM *Xin,
+      * The number has been updated to 20 * nlen/2 as used in
+      * FIPS186-5 Appendix B.9 Step 9.
+      */
++    rounds =3D bn_rsa_fips186_5_prime_MR_rounds(nlen);
+     imax =3D 20 * bits; /* max =3D 20/2 * nbits */
+     for (;;) {
+         if (Xin =3D=3D NULL) {
+@@ -346,8 +378,9 @@ int ossl_bn_rsa_fips186_4_derive_prime(BIGNUM *Y, BI=
GNUM *X, const BIGNUM *Xin,
+             if (BN_copy(y1, Y) =3D=3D NULL
+                     || !BN_sub_word(y1, 1))
+                 goto err;
++
+             if (BN_are_coprime(y1, e, ctx)) {
+-                int rv =3D BN_check_prime(Y, ctx, cb);
++                int rv =3D ossl_bn_check_generated_prime(Y, rounds, ctx=
, cb);
+
+                 if (rv &gt; 0)
+                     goto end;
+diff --git a/include/crypto/bn.h b/include/crypto/bn.h
+index fd1c09d..00544d9 100644
+--- a/include/crypto/bn.h
++++ b/include/crypto/bn.h
+@@ -95,6 +95,8 @@ int bn_div_fixed_top(BIGNUM *dv, BIGNUM *rem, const BI=
GNUM *m,
+
+ int ossl_bn_miller_rabin_is_prime(const BIGNUM *w, int iterations, BN_C=
TX *ctx,
+                                   BN_GENCB *cb, int enhanced, int *stat=
us);
++int ossl_bn_check_generated_prime(const BIGNUM *w, int checks, BN_CTX *=
ctx,
++                                  BN_GENCB *cb);
+
+ const BIGNUM *ossl_bn_get0_small_factors(void);
+
+--
+2.25.1
+
diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.13.bb b/meta/r=
ecipes-connectivity/openssl/openssl_3.0.13.bb
index 5e43fdc2de..5b09493ccd 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.0.13.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.0.13.bb
@@ -12,6 +12,8 @@ SRC_URI =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"=
http://www.openssl.org/source/openssl-${PV}.tar.gz\file://0001-buildinfo-=
strip-sysroot-and-debug-prefix-map-from-co.patch\file://afalg.patch\file:=
//0001-Configure-do-not-tweak-mips-cflags.patch\+file://0001-Improve-FIPS=
-RSA-keygen-performance.patch\+file://0002-Improve-FIPS-RSA-keygen-perfor=
mance.patch\">&quot;http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from=
-co.patch \
            file://afalg.patch \
            file://0001-Configure-do-not-tweak-mips-cflags.patch \
+           file://0001-Improve-FIPS-RSA-keygen-performance.patch \
+           file://0002-Improve-FIPS-RSA-keygen-performance.patch \
            &quot;</a>

 SRC_URI:append:class-nativesdk =3D &quot; \


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#197294): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/197294">https:/=
/lists.openembedded.org/g/openembedded-core/message/197294</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/104998278/3616765">https://lists.openembedded.org/mt=
/104998278/3616765</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


--
# Randy MacLeod
# Wind River Linux
</pre>
      </blockquote>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------kUSAvX6L90lwvW38HpYUUQCd--

