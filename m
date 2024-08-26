Return-Path: <clara.kowalsky@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A916C5472E
	for <webhook@archiver.kernel.org>; Mon, 26 Aug 2024 18:37:04 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.61])
 by mx.groups.io with SMTP id smtpd.web10.60348.1724697415202488418
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Aug 2024 11:36:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@siemens.com header.s=selector2 header.b=Tf7xmGb9;
 spf=pass (domain: siemens.com, ip: 40.107.22.61, mailfrom: clara.kowalsky@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sHHkn43BHGwy6sNdQzpiKzHG8qgo8py26qNVsoAKvjnneTVjG6WOjxkecsv8RLfF8I15rPsaWlTDnswFJCNUArQxFC/f+k2XOut7V0rQtn+rln2U/jpWdWNkWTjyTUff4kZLVJ+h/1lETAq8jehIuFFa3nYcdZJoa68Sg6sYjRt8bBo8NT0echXMk9Qo1i3WZgIN998N/VO/XY3Wxmvf4VcNH620i1LcDJJ0zWCXbSI9TelBBL3WBLdHeRicojmVckxx2b9YpxW1zvlZLcdr8df0oS9AeZvNxGwKFVAX/InnrVqj26j0xkkomBBinW9ZN4tSe6aVUbSeDP4iL5hyvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ifAsH7k/6XlnNOGyiSqeXzqf17COEXEZ0YrFxkvJUNY=;
 b=ABBFUtP/JD0brEOa6Qcb2cTNLTnKsJyz8VUyVB9v0SBq6H64ZX1zM9cONf7NqlAkOPf+ik5KbBgT4f8ce9Ky9M9YC2y9HkjjyCVRO7QE8fXADSVu0ErJWQcszeghIX6A5zc9mLxyDa8ZJgpm2b2Qo+yfL1VehpSuDLfd1OIGc8YS7uaIV1kXgiTVG2ySMnFBqWLhHdQe+ZwEhemJIym7vVptD2zX5ColNh4O9vvv4WhQebp4Cr9jWI5MjrK5wK4Ua0egvtcmYaZNMhB1B0vIO6szfHmDmQ8dad8vxwFGqOw1pj/iZMS6C7dL/awASt362z1dTcbU7WfCRZ/9gw4raA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ifAsH7k/6XlnNOGyiSqeXzqf17COEXEZ0YrFxkvJUNY=;
 b=Tf7xmGb9ScnSfVPDOj3wuWh3gKfMFifylYzzvWsADJGTsqCN6PyBgABFTm6yuXQHBlHp/3zzKK7Xvw7u/j6RyaTMqc/CDjhjKqsb5bdECLVhB839FPyetrG04o1Plmf06mrQzHF1yC3gfwzhA2oLVaB65Naxwzc1wkbHV/Pgn1lEF7Sb8f/8JydvGwKiHtOCUvl9SCXGV9+FQ/Rm+swqRtnPfkk7NR+D6WmUVTC44wX1OS6gmGiFOaHduYei3dm51V/oUkE2MXvjj+t9d2alIqQTCCwySOMJWCOmDpYpQw7CSYD9PCEsh8pcgoZyAAw+p60ogSAQWhhKI3HLMhzpiw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
Received: from AS5PR10MB8173.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:672::17)
 by GV2PR10MB7581.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:bf::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Mon, 26 Aug
 2024 18:36:52 +0000
Received: from AS5PR10MB8173.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::184c:3bea:5551:1c43]) by AS5PR10MB8173.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::184c:3bea:5551:1c43%3]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 18:36:51 +0000
Message-ID: <30ef314f-ea9f-4ecf-9d83-5e8478cd8e93@siemens.com>
Date: Mon, 26 Aug 2024 20:36:49 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] testimage: Add support to create test report in
 JUnit XML format
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20240826081337.2737132-1-clara.kowalsky@siemens.com>
 <671eb55a3c01febbd0b857947993ca7b0c96471b.camel@linuxfoundation.org>
Content-Language: en-US
From: Clara Kowalsky <clara.kowalsky@siemens.com>
In-Reply-To: <671eb55a3c01febbd0b857947993ca7b0c96471b.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0137.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::13) To AS5PR10MB8173.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:672::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS5PR10MB8173:EE_|GV2PR10MB7581:EE_
X-MS-Office365-Filtering-Correlation-Id: 4df9d1f3-b388-4787-49ac-08dcc5fe0d41
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?TGth7Ps1G1h8QlVfLNZFaTzQnPK3XlhGWDVmh5H3a3sAVRSeQL+9+HBDBtT8?=
 =?us-ascii?Q?pE2SXhRkbgtySN0I1s62a+/+ncBsw8yiWkFuDXhP+MH4cOXTMiHC6lbmR3M+?=
 =?us-ascii?Q?Set+tB0e806EYc9yAiBGpzM45tmQqkpK5hx/b786pGSEJ0mphx0HWe73zW29?=
 =?us-ascii?Q?LznMVZmjtWxpj0Bts/C77GlZCdP2SklcXJvQQekMzr+Iq4g31bdwuyPI67Bv?=
 =?us-ascii?Q?P8fOcBnHrBkHezc6DOQC6GBdR0EhrzHMVS0D7Gu8l9Mkq/gxpM1UKouSQ1eT?=
 =?us-ascii?Q?0J39RZo2CBIKb2njB4WuJCTdc9g5Wm8XH596wFNN78hxOYZslI6rJypvANMB?=
 =?us-ascii?Q?5Bl5cvIYO4Ig8WeOJUahVOE6PBCca5oyZL6kWDJTDpPRBEyeS3U9CwFEdYIi?=
 =?us-ascii?Q?eL2eAhSj7W5RH2Lh1gt8lLbK62bkRN4lt3cihzbrk0y/tv6LscT/a3R1zi4s?=
 =?us-ascii?Q?Mo2Q1XJillhSDqVFG/rev6+XxYn1kBuDqm+fsPvqJw2BM8Xzen8XrTDUjvBh?=
 =?us-ascii?Q?9idbNEnUT8BZegWaKK5DPzzWcmN1L41QCt8b1J/IkKruk0YK+fhwdAiZg9o6?=
 =?us-ascii?Q?Ah2dQADmfz5Hja5VM0XCDNpDX+Xa5y8kwFdB5uwrhuELfXQRopktqtVBF7ss?=
 =?us-ascii?Q?xNTdzAyivaz6usJjEGeeUXXjBSmJ+iViLKsHKLRa87qFMnVnKymhluj0JHNt?=
 =?us-ascii?Q?zjMc2iedRhujdregG8Q9X2Q52/huWrBX6P7n4OMDmwzSbMcwWtKrYtyQf2tj?=
 =?us-ascii?Q?8+X9Vgp7VV5twCuGRJmkckD71GGFObMUMfiRLWo7Q4FL8Bgp88oDwAaK/lW5?=
 =?us-ascii?Q?2B6Jrju0o0tTHEUgWnux4338+eZKWbOTD9OlWeju4AxtrpwdNGVEG8V/QUh3?=
 =?us-ascii?Q?tjnGHkQRRgjCw+HPwetd96gBRvBhqF36n8bKM8QIjitNO7rMmj1PiNbZND3k?=
 =?us-ascii?Q?z9ZVFC1tLWj/lP2HBGSRNmCLxHMBGP1IKEStWo1IyWmBbNt2ZUFW95hO+4GY?=
 =?us-ascii?Q?usS1yqp92qJFLUZhNoZWza5SnT5OXnWDxN/4pSQfHZO18kFvpMvENzh91Zuf?=
 =?us-ascii?Q?AIyUipzMjX3FUFmfjxR5W0NtxrrxRadwPyG5xb7CFrJ0xdiK1aO2U5rgOspI?=
 =?us-ascii?Q?bh3eBG6sPUvyMKFrgcidlmrn9MrQWLapLNhYM4Ue4BbhSud0wpWY7ZrOnJt5?=
 =?us-ascii?Q?qVVAO0Rs851kzurdl88zSzzM24pSZXMu9dZLUOc2NULqRdcXZNWxZSdcjszC?=
 =?us-ascii?Q?azoxLXy8sd725mLTScnpLNjoEcu1pXxZxscR00tw3UpuL8gnrrbc3ew6mN51?=
 =?us-ascii?Q?Kg7fhCxpJfrIpQzZ5aBgYK1Qn4hNTtFDt3Tbw/TsV7Gbvw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS5PR10MB8173.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?bqtJ4jJ8SoVmX+DnJOI/Au4ZJPD4LhoM/AZ8PVuwhFaxxgADC2dzFYO85ZX+?=
 =?us-ascii?Q?SsHZLUuOAfmSNnAi8tozZTjx4xzPoA0VHnd2d8u/9kcuc1eAHRJdtGIW5Vba?=
 =?us-ascii?Q?2fWB4B82hdHzgipfvUPcxkTPgRoQGm1r93n9bMNm9hUXfm9SQiZkL6zgP1xn?=
 =?us-ascii?Q?Qg0GOT90p3wA9dOJR9ubbXSRHvnH61WHGQPx1fisDTIoVvS2fwcc9JC1iF9N?=
 =?us-ascii?Q?+dGJOShka4dBOgF30jNol4GHQXnLJdimPUzBDfgDvy8B1dSlnsPPTM3lHYhx?=
 =?us-ascii?Q?0nTZ095uX1frljBI9rICEvXBk+wZFX0Lthp30WXKRq4AB6s2VCsrda6wf+93?=
 =?us-ascii?Q?0rcP3ziPPBiLD4lxiyzz8tWJ4Nq9R9z7gnCVhIhlh9AVsnDsTRwwxo67F3ZM?=
 =?us-ascii?Q?Fn/8qFW5a6kDtmov9pk6pEa2M/FCsxt3eNlbEyT9IWa6EaYbKt1Qw90/BOkv?=
 =?us-ascii?Q?i5ahYf4m5HFMxSOwB8nKQg7khjcpU7sp1mieLhN5UmIWHzLA/PkX4TSyVyDB?=
 =?us-ascii?Q?8axM7XYoBEQCuz1VJS2PtR7ofTKjYea+g5o9PBwMu5jTXNT4vnodWsMcqyWN?=
 =?us-ascii?Q?DEH71fMQCDf64xbV8MJFQtOgYP9GjI1JhCffhYcjQNPZQfvPBTCePeXc8R3H?=
 =?us-ascii?Q?QZ0o5rWo89NDy8nUsaE3OkfVWxsUYtbGviq7NXuNEhMBywLj6f1E+pb08zxo?=
 =?us-ascii?Q?eSkrIbuRIYFMqqEVisvXBB733cq4QJWTTw8d6OmN57bzZluiMzJXJ+sxz4XS?=
 =?us-ascii?Q?yD4xJ2mUXKUl63dG+KyHovt+EnLTgOwe7Qofl3V7+OpM/ZuWwAUYtAWQonHT?=
 =?us-ascii?Q?tjOn1vLmkOc+77N1U4waJUTY25lYYjOmn6qjelWTJ54PCzGu9ssxKteoIj0J?=
 =?us-ascii?Q?mqiuMjd9zu5XQYz3CUzTRTvqCAN9q8glqUr/8RXmBv6pmh1RE+vQIzKiJfLq?=
 =?us-ascii?Q?EstCnTmLCrvgvlSjmx7Df311hMXsbLdx7joSrD3X/QswawTunVqxZdkmdtSl?=
 =?us-ascii?Q?u0B/yMfHmCbO/zu/CbQmSXGKhrD1kCM7PEEM4g+IRwUoKm8HSPkdguDf6Da2?=
 =?us-ascii?Q?ETG5tHYWPNias/L75ne3NBFqS3AFAsl52Q0bKuAD5ELwJ3lXkXr8NV4sxgt0?=
 =?us-ascii?Q?rNu6pWqco4N0YKEYiToi90S/5srFSLnYETH4fMDDgMAWRirDSBRtS8QJWv9Y?=
 =?us-ascii?Q?xnH3ioTGhkYpLSfzjP/aTkGEWNockP0KJDBshkkpgzeq2t6hwxDOlGd0cN2y?=
 =?us-ascii?Q?sBotwSXSUoCv9MtwVnVjJCiM5uQY+1pLQn9dpRZVH/t+UZLwPQfLk3R7FNpV?=
 =?us-ascii?Q?nTjUNKK84+sRqZ3RNuQEqCAtnH5DkZg2EedC5KhgZcq32NeM2iV8d/cfINk2?=
 =?us-ascii?Q?PP5B1uivbmKwguE1koCppoArtSgjp/1OcsQC7e6T/h984sdDGxN33JizaBY3?=
 =?us-ascii?Q?mnkb62/Q4P2oHaqmX3dozbzdDew1OJ1zqxc6gxZlrvzoyJF9WCv+ZKi6lusy?=
 =?us-ascii?Q?IaEnb8MrrMWJAMF++6ULgdrgWtmLlbGC/YdTJmwY0eyjZ4x3TUl02SUqwS/q?=
 =?us-ascii?Q?0f3BVZQBDHzPOJkr+Od1/m8twpSzcDiIvsEb/XBKDpAqlpCtvJuZYFLphnHK?=
 =?us-ascii?Q?sQ=3D=3D?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4df9d1f3-b388-4787-49ac-08dcc5fe0d41
X-MS-Exchange-CrossTenant-AuthSource: AS5PR10MB8173.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 18:36:51.5321
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L62qtSD9EqgGE4llxFU+yYDQ1ntVC0+9B4ODjw75bMG91FbTdQSmOec+g8q8BivH7Omk6vcl91E+nZOeXfzpxp50vSU5Q350sUI4dTr/xk0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB7581
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 18:37:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203771



On 26.08.24 12:49, Richard Purdie wrote:
> On Mon, 2024-08-26 at 10:13 +0200, Clara Kowalsky via lists.openembedded.=
org wrote:
>> This introduces the possibility to report the test results of testimage
>> in JUnit XML format by setting TESTIMAGE_JUNIT_REPORT =3D "1".
>> The generated unit test report is located in the TEST_LOG_DIR and can be
>> used in the CI/CD pipeline to display the test results.
>>
>> Signed-off-by: Clara Kowalsky <clara.kowalsky@siemens.com>
>> ---
>>  =C2=A0meta/classes-recipe/testimage.bbclass | 15 +++++++++++
>>  =C2=A0meta/lib/oeqa/core/runner.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 39 ++++++++++++++++++++++++++-
>>  =C2=A02 files changed, 53 insertions(+), 1 deletion(-)
>=20
> I'm not sure that we want to add new output formats every time we have
> a need for a different way of displaying the results as this won't
> scale each time a new output format is needed and we can easily end up
> with missing data with one of the formats.
>=20
> Could we use a conversion tool instead (it could be part of
> resulttool)?
>=20
> If there is data missing in the json format, we should be able to add
> it.
>=20
> Cheers,
>=20
> Richard

Ok, I understand. I will write a resulttool script based on the=20
testresults.json to extract the relevant data.

Best,
Clara

