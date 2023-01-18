Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF8E9C00A5A
	for <webhook@archiver.kernel.org>; Wed, 18 Jan 2023 02:08:10 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.5931.1674007684533060761
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jan 2023 18:08:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=HhzOsZPA;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0382a4270f=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30I1CHRR017574
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jan 2023 02:08:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=PPS06212021;
 bh=5Kl9+TbXE5SyNugon7ZQ/GRH3W5UMRndKj8KMakyPeo=;
 b=HhzOsZPABfaXdFJLmytspNP5wZL5s1AsbvSEYNDiRsAy5Odl/gxd/ITG7nGPkAPoTGxn
 Hje5XqhK8EqJJDRwRPuuDrLbb8zOsy+wS+j32XsB93zHttPHIQDnR/vJ/p2/zd1h4cjO
 lxDcsU849/gmF39em/2jl/0YzI7U3dayWF5sO/4jbm3bwcwcPG07DQN4MuEvjFGZEtOK
 J0cpJVadG64DPDN5Tm/t/RWhZThnHhnNwgfDGK6A9EQS79HIsmmY461fAv4+WeA1RIQI
 zHrj6ZGzQ3AFOX+6a+CWfus+T7NDgP7Q1C8sessu+7qSym96J/5d6mXtiA8GLM0IlgC+ xw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3n3jx6kkgj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jan 2023 02:08:03 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30I21S8D017798
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jan 2023 02:08:03 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2173.outbound.protection.outlook.com [104.47.73.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3n3jx6kkgh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Jan 2023 02:08:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PJSgsxjvcVQUgoGhtMhT6RQQ/cuAWWM4WK42R1ALuI1mPWPfj+qd3RdzvcHGiMCCKhqgBW7qxixci2/9b91V10r06uYe4EFLPHRG2G9LD2Bsi8UmI64cGybkg/TJJ0LvPnXL09KTAbK9sYovmz6R6Z6V4dYnGO/eSbIFAOeux63q9IQBusok7rqfPNuPEClGJrcppw5fqzDJumyd5KuG6moeYcKARpflsLDCIrAmEH0ak+H+qHR8m25Rkat2ZhfctfeCdmasBCscrm0ACfuw1Qem0g90PXJoagKy4ZzofFhZ7AlHaqLNu9lAWt94ip0pQBzqOqhIxKe3lig7NMNeZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Kl9+TbXE5SyNugon7ZQ/GRH3W5UMRndKj8KMakyPeo=;
 b=AsV31KOYdeqHGCr9bhYU8tsGoSmxRWLOKy8fEH6GiePBEBbyTwjeS6YTIbtOsyq3Se/BinX+EidXgf3pyMpDHlTfgAxEMYbM57YSBVGQcazwpmdlH4FvzhaXCUYcmJp7Bw778GoemeoZCjVRzIJgJQ2+KXjnjeSnoo/z91BYXZaIbADUqKWpt6euZNcI+uh39mn5fs02Tm4wdxD7afLskwFBX8KFjAsHEhRmN9/9OCsJhfxPEUDfjYfw4Yfsyez36+wuEQ4UUM29pIzlQV5J8Rt1swsKfc+A3CWhbumyjvjPE8+xXq5Ek0IwAGpjmXYWU7ja7OMVmvw48ZMJXPVoNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by PH0PR11MB5063.namprd11.prod.outlook.com (2603:10b6:510:3d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Wed, 18 Jan
 2023 02:07:58 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e794:335f:5e0f:8d36]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e794:335f:5e0f:8d36%6]) with mapi id 15.20.5986.023; Wed, 18 Jan 2023
 02:07:58 +0000
Content-Type: multipart/alternative;
 boundary="------------H5uaTA3eXRTF96dOORfLkEhf"
Message-ID: <765d5133-42eb-2ef6-7ba0-b5556a7a1d1b@windriver.com>
Date: Tue, 17 Jan 2023 21:07:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [OE-core] [PATCH] rust: Upgrade 1.66.0 -> 1.66.1
Content-Language: en-CA
To: Steve Sakoman <steve@sakoman.com>,
        Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
        sundeep.kokkonda@windriver.com,
        openembedded-core@lists.openembedded.org
References: <17490.1673869297796319682@lists.openembedded.org>
 <17490.1673882452401971192@lists.openembedded.org>
 <d74652b6-1342-491f-b949-320cf9f63012@windriver.com>
 <41add1d8b8a0f94c13e6599bd4c400dee7c611d1.camel@linuxfoundation.org>
 <49909f0e-9fc9-cb74-66f4-e6feec95f8d0@windriver.com>
 <CANNYZj_UxfHNdOyT0t1S=gov7DXDVnNdCOQ4i8-cXfK9VGw0GQ@mail.gmail.com>
 <CAOSpxda3VsmobDFyVCmNH6cqGd+MZahO=g=yf_6XNY0sJAwcLg@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <CAOSpxda3VsmobDFyVCmNH6cqGd+MZahO=g=yf_6XNY0sJAwcLg@mail.gmail.com>
X-ClientProxiedBy: BY5PR17CA0070.namprd17.prod.outlook.com
 (2603:10b6:a03:167::47) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|PH0PR11MB5063:EE_
X-MS-Office365-Filtering-Correlation-Id: 366d60be-32ab-4264-8434-08daf8f8d1cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KuP6ZUlh72ESGOs8dgFmFg6VbKX0TysSgTZAg6rQZKjBsHiGPVC3HYrG6dNT1qvk7vIPTr3yi9GwwlYzwINnoBBIZEcfjg4CLvw8EiF2XKfx9BhVt2YxT71a1poEAVup239i2LD1KSzdwLhSxpmGm0xUA8xBKTOcX/ahG6ySfIRTaiFU+0+FLne9WNuMOYYX3H4kVGT4UMcamKKVRDJUt4wzsP8BINqfkRjtWcqX9E8CGuY4KIdQeL/iFSAslIVDu7n8YQFzTp9pS54nL45ILnHT0iIOsNjU+BIm5MuBRHmltATGQBdlwhMfiH8BqJcmeNPJVVZjxB6cmbImZy42ra/oyA+7nckWLBKgecoyBy6BJz4L8DtL2keQLQXpLR1tRRpLu3PKObFfigbB9RQBK5T5OKWjVzT1I0YXRBwE0V/fB3bFVMnZcZV/T04d6hVOSC0OTVtrc9Q+NmTsvJtiyao+90GpAqQnRHuZ4ffKin9yykAMH/WhG61qVEPPZzt/RNhQ2pbTrj6ZpY2U7bZjJaPgW2in+DqHUMoUsPTDq3xvtlYDn4yTnuxcEXSpQHVV4iJrN4Wo5UpekJn25Nqwx6g2/g+tlevJRxxZEQmZVIXZxNh2OiolgtD6MeXjcPxVrDht4hgin+GKUVeEtFYG5ftfPmgC4zc+Z/mW2cTjyEgOzM+fDvc073YOeZW7LyGWfds5mht7h4818jTPNtSK3zWnDz7sxisx8Qfz9RMjakZjKzURb7Im0oXaytS/dHXtwUpcMAqjbxA/hqNx522yKoeMyhW87nohko3lSuRlcdXULpAlQr+K96O68dfJFFGV
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(39850400004)(366004)(376002)(136003)(396003)(451199015)(86362001)(36756003)(41300700001)(5660300002)(83380400001)(8676002)(30864003)(66476007)(66946007)(4326008)(66556008)(21615005)(186003)(26005)(6486002)(6512007)(478600001)(8936002)(6506007)(966005)(53546011)(6666004)(33964004)(316002)(110136005)(2616005)(2906002)(38100700002)(166002)(66899015)(31696002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dnk1cXNCTHFJSTJ6UWh2NHZlMWxFQS9FcXh6UXZRVk4xOHVmZUhhTWFPbHVC?=
 =?utf-8?B?SU4zMUlPMURoR3hSa0xhNURWcEJCMEZURXdmTkdDemxwak8wQUFvbHRkdGpN?=
 =?utf-8?B?QjFTVUtwQzVVdUV2dkpTSkY2c2VoSU5PMWJRNjV6RUxpUFBTZWZkRUFlNWRy?=
 =?utf-8?B?WFBjVnJCQkZ6Z0tQaUFBZTdCMGN6YVlWc0d3VTJSRGNMb2FwVlVCWTdoYm8y?=
 =?utf-8?B?QWRhd3kzdllqWGZFUnNLempqbHJUNDRLYlR1OU5PcmN6bGNqS1NObHB2dnNM?=
 =?utf-8?B?V2t2VElkM050WC9nUkpQNkFGL1dlLzhHUHRQN3hleGUrVGwvMFM1eUVNZXZ0?=
 =?utf-8?B?MnZaem5GN05XRm5uSlYyU2k1UThxMjdnNkpWU0RoZE5tZ0FNVVdhaGV3bkNp?=
 =?utf-8?B?bVFHMnZPZ3U2WnZTTU1leitOL1N3UDF1ZEo3YXltMXFEZmpHK2Y5SUFIYno1?=
 =?utf-8?B?TlJxOHQrNzRaODQ5WE9zVVFGUld0VFhtcVd6SVAvRWNzenZEVUh5NmxSeXhW?=
 =?utf-8?B?aGlSbFMwRnJ6V0tNTHlDNC9mNTF2bWhLaFUvQ3RKUkMzbEVPVGgyN1JrbXhB?=
 =?utf-8?B?WVhWZ1FWaVowaFUzd0NXQzBPTkFjMm9MZjIyYWZ5cXMvalhjN0ZTYmdDZjN2?=
 =?utf-8?B?VTU4emlXQ3RGRThrdDNLUTVkeTVyWG85RTkxbXRXaTBjWEVtVVRrZjZad1pz?=
 =?utf-8?B?VTNzMnBPMHhyY3NFbmYyNXlpc0lLMHlHeUpRa2JydC9OemZORWZhSnhJa2pI?=
 =?utf-8?B?TDZpWEVRTWZvT3BSamJYemZ1OXM2U0lISmM3RmFzOHNxbkdNNmc3SkNBM0o2?=
 =?utf-8?B?NmdlNnhCWUFBZGJnUzJQVDVlZFFRdDBHaytQNUJXZmJyaXJBVkxPZkFuRFp5?=
 =?utf-8?B?NlpUejk4NkRPTkR5VTl5Q2tjbFBsMTBsc0d4cGM1SVV3dXRPQWVBZUFmb0Fl?=
 =?utf-8?B?dEZickVzVmxhN0JsMkcwbDlnaHFmTUx3by9lc0JoSFpUUFZSN2VVSklYK2Zi?=
 =?utf-8?B?V2V0Tmx5cFliUU5EeTUvOGRVNy9uK2tlQTNVanZEOFhnQTgySVAvUkpxdjNF?=
 =?utf-8?B?ZFZlNHRQbFI1Umw0MDBFdVVrdkYwWUpoQmVvSzdycHNGbnFsVzM3WGZVeTFP?=
 =?utf-8?B?akc2VTQ1eDMrRFY1T3NVeGlFRHRDUFROM3NVZjJpSzdLaW5jNGFZcVdudisy?=
 =?utf-8?B?dkxjRjB6b2QxQTRpVGdaY29HZkg0aUEweERpeU54bGhDWkduR1h3Z2l0VGFB?=
 =?utf-8?B?TTNGVTJuY2JGVGc3ZE1zWEhMUndTQy9SZXhFRk92UzVXbUxZSkNiNGJRMUw3?=
 =?utf-8?B?SisxemxBT0lPbzMrQjRpTjJZSDhpNDZoTXErdXM2VWM5NkVleS9NTDBWVkZT?=
 =?utf-8?B?VmZIYnVLOTRKUVZVN0owV1NxY2Z6Q0U3WXplcVZ3aWxRanA3eXlCMVV4d2Nq?=
 =?utf-8?B?ei9YYzByejBXcVFoS3J4Q0FMeEJyQWxqRXp6SU1qNERJRllPZXV5TGl4Qko2?=
 =?utf-8?B?RnNncCtXSXNubVhqMW9vUFRpWU1EMzRMV21WR3JYMGtXT0UvQU1NV2RTYS9X?=
 =?utf-8?B?VzF6OGp0SkRwOURvVkxxZ2hXVENCci82djVhV3d4RUxZZkN3UEhLemluMDJF?=
 =?utf-8?B?eUZuemwzUmZVdEc5bE1RNGJrdHFmeUErS2Q1WU4xWUNMWXpNbER4bkxkTFBu?=
 =?utf-8?B?YUxoOGFGZUxYSnhabWt1YUZ3RTVrZDVSOGxlbUUwNmZDMzZtWUROZFkvZWRi?=
 =?utf-8?B?TmNGcGF4NWtTSUpBNXBiRlkvaGp6T25acE5xN1V2cGJZWlZoRDFhT0dwUS9w?=
 =?utf-8?B?eHZTOExDcGNMYlpwek1ickI0ckxZZEJkUXZJTENMN2FZT1B6WnBxdmF2V2Ru?=
 =?utf-8?B?MSt4YTBYVmp4Tk1zMG8veVh0VnhFUW1venZha0Q4dnZVU3lyOHpqZ24zYXAx?=
 =?utf-8?B?YmpoUFdzVG5vMkQyNVp1SnJYbktIclN6eERlUlhnRlZVYnF4bWtYVlNHUlRi?=
 =?utf-8?B?NzJFRlFDZjFDT2V0RnB1MzM1K2lreUl5dFBmUjQ5S3gxWlRkL0FvOTd1RGM5?=
 =?utf-8?B?Qkt4VmNCblRqZlNKOWJZVmltWG8xOXlQc3dKNGJHWW95Tjl4L3I5R05HR0F2?=
 =?utf-8?B?TVVFc2FKd3QzQ0F1ZDgyL0FGMDZjSmlpMHJhSUxoOHJVeWNoNVhlWnRsank1?=
 =?utf-8?B?L2c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 366d60be-32ab-4264-8434-08daf8f8d1cf
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2023 02:07:58.3993
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oJ5aCHdhKzSDYyD4yYrMSKKDU9RSjpk9VrJfsZg8Iz3gyR9dnUHWKbmXFIJymYU/Bor8slsif1zZZixiuW6xCCfBTWHfbcLeeqPPkGyG3mI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5063
X-Proofpoint-GUID: yicuBky_k7SPm3OqN5qldnj2mXlp2B3j
X-Proofpoint-ORIG-GUID: x6CYM_ffqSLs_eso5f8q4qsC3ApXN2bt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-17_11,2023-01-17_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 adultscore=0 mlxlogscore=999 suspectscore=0 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301180015
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jan 2023 02:08:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176070

--------------H5uaTA3eXRTF96dOORfLkEhf
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023-01-17 17:37, Steve Sakoman wrote:
> On Tue, Jan 17, 2023 at 12:00 PM Alexander Kanavin
> <alex.kanavin@gmail.com>  wrote:
>> Option 1 looks like a new policy too. If we can upgrade rust across
>> many major versions in a stable release, then why not other items?

In oe-core we have a trivial exception for vim but of course it's an 
application not a toolchain.

Similarly, in other layers, applications such as Chromium (and 
Tensorflow?) only maintain one version and
users are expected to upgrade to get bug fixes.

The Rust developers / community seems to want their software to work in 
a similar way.
They have a quite exhaustive test suite (Crater) to check for regressions.
I'll look for some actual test results from Crater and reply here when I 
find them.
I not sure what to make of the "Rust Editions" and how they'd fit into 
our distro support
but the clear mandate from upstream is that only the 'stable' release is 
supported.

https://doc.rust-lang.org/edition-guide/editions/index.html

I think there's an argument to be made that until Rust releases 2.x, we 
just update
to the latest version. If you haven't please read:

https://internals.rust-lang.org/t/cargo-cve-2022-46176-fix-for-older-releases/18152/3?u=sundeep-kokkonda

Assuming that some day, Rust-2.x is released, then one would hope that 
1.x would be maintained
for a few years on it's own branch but again the semantic versioning 
rules would allow them to
release say 1.288, 1.289, ... and at that time, it would likely be more 
clear that we should be following the
1.x releases for older branches and 2.x releases for newer branches.


> According to the stable release "rules" option 1 would require an
> exception granted by the TSC.  Otherwise it is a no go.
>
> So it seems to me that this is a classic case for using a mix-in layer.

Once I have enough data, I'll present it here and if it makes sense to ask
the TSC, we can do that.

Upstream is not backporting fixes for a CVE such as this or for less 
notable bug fixes,
so we'd be giving up those improvements. I suppose we'd only backport
bug fixes should someone encounter the bug or it becomes equally notable.

So far, there haven't been many Rust/Cargo CVEs so maybe we're making
too big a deal out of this. I certainly don't miss the deluge of memory 
management CVEs that
C/C++ applications suffer from!


Sundeep,

Please also try to backporting the fixes to say Cargo/Rust for kirkstone.
This CVE resulted in ~10 patches so it's hopefully one
of the more complicated back ports and will prove to be a good test case.

../Randy


>
> Steve
>
>> On Tue, 17 Jan 2023 at 22:57, Randy MacLeod<randy.macleod@windriver.com>  wrote:
>>> On 2023-01-17 16:54, Richard Purdie wrote:
>>>> On Tue, 2023-01-17 at 15:29 -0500, Randy MacLeod wrote:
>>>>> On 2023-01-16 10:20, Kokkonda, Sundeep via lists.openembedded.org
>>>>> wrote:
>>>>>
>>>>>>    Rust community said the security fixes are only for the current
>>>>>> stable relases.
>>>>>>
>>>>>> https://internals.rust-lang.org/t/cargo-cve-2022-46176-fix-for-older
>>>>>> -releases/18152/3?u=sundeep-kokkonda
>>>>>>    For old release we've to backport the patches ourselves.
>>>>> The other alternatives are
>>>>> 1. upgrade to 1.66.1 on older branches,
>>>>> 2. add 1.66.1, which will be the PREFERRED_VERSION but keep the older
>>>>> version for those who are risk averse,
>>>>> 3. add a mix-in layer (1) with the upgrade to 1.66.1.
>>>>>    For langdale, we'd update from 1.63 and for kirkstone, we'd update
>>>>> from 1.59
>>>>> See the link above for a discussion about what Fedora/RHEL and other
>>>>> distros are doing
>>>>>    and a description of the rust / crates.io test system known as
>>>>> crater that builds the
>>>>>    world for any significant rust change.
>>>>>
>>>>> Is there any objection to doing 2 and if we don't see any problems
>>>>> after some time,
>>>>>    then removing the older version?
>>>>> Sundeep,
>>>>> If no one object, please update kirkstone and see if librsvg or
>>>>> python-cryptography or
>>>>>    anything else encounters a problem.
>>>> I'm afraid I don't like option 2. We don't do this for anything else so
>>>> we're now inventing some new policy. Either the upgrade is what we
>>>> decide is right or it isn't, I don't really like the idea of hedging
>>>> our bets and providing two versions, one of which nobody will use until
>>>> they're forced. It will also make security scans tricky as is the issue
>>>> dealt with or not?
>>>>
>>>> Just for context, going back in time OE used to be awash with many
>>>> version of recipes and I'm reluctant to go back there as it was
>>>> horrible. They were added for exactly this kind of reasoning, which at
>>>> first seemed like a good idea.
>>> Okay, make sense, option 1 it is!
>>>
>>> ../Randy
>>>> Cheers,
>>>>
>>>> Richard
>>>>
>>>>
>>> --
>>> # Randy MacLeod
>>> # Wind River Linux
>>>
>>>
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#176063):https://lists.openembedded.org/g/openembedded-core/message/176063
>>> Mute This Topic:https://lists.openembedded.org/mt/96218038/1686489
>>> Group Owner:openembedded-core+owner@lists.openembedded.org
>>> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [alex.kanavin@gmail.com]
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>

-- 
# Randy MacLeod
# Wind River Linux

--------------H5uaTA3eXRTF96dOORfLkEhf
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2023-01-17 17:37, Steve Sakoman
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CAOSpxda3VsmobDFyVCmNH6cqGd+MZahO=g=yf_6XNY0sJAwcLg@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">On Tue, Jan 17, 2023 at 12:00 PM Alexander Kanavin
<a class="moz-txt-link-rfc2396E" href="mailto:alex.kanavin@gmail.com">&lt;alex.kanavin@gmail.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Option 1 looks like a new policy too. If we can upgrade rust across
many major versions in a stable release, then why not other items?</pre>
      </blockquote>
    </blockquote>
    <p>In oe-core we have a trivial exception for vim but of course it's
      an application not a toolchain.<br>
    </p>
    <p>Similarly, in other layers, applications such as Chromium (and
      Tensorflow?) only maintain one version and <br>
      users are expected to upgrade to get bug fixes.<br>
    </p>
    <p>The Rust developers / community seems to want their software to
      work in a similar way.<br>
      They have a quite exhaustive test suite (Crater) to check for
      regressions.<br>
      I'll look for some actual test results from Crater and reply here
      when I find them.<br>
      I not sure what to make of the &quot;Rust Editions&quot; and how they'd fit
      into our distro support<br>
      but the clear mandate from upstream is that only the 'stable'
      release is supported.<br>
    </p>
    <p>&nbsp;&nbsp; <a class="moz-txt-link-freetext" href="https://doc.rust-lang.org/edition-guide/editions/index.html">https://doc.rust-lang.org/edition-guide/editions/index.html</a>&nbsp;&nbsp;
      <br>
    </p>
    <p>I think there's an argument to be made that until Rust releases
      2.x, we just update<br>
      to the latest version. If you haven't please read:</p>
    <p>&nbsp;
<a class="moz-txt-link-freetext" href="https://internals.rust-lang.org/t/cargo-cve-2022-46176-fix-for-older-releases/18152/3?u=sundeep-kokkonda">https://internals.rust-lang.org/t/cargo-cve-2022-46176-fix-for-older-releases/18152/3?u=sundeep-kokkonda</a></p>
    <p>Assuming that some day, Rust-2.x is released, then one would hope
      that 1.x would be maintained<br>
      for a few years on it's own branch but again the semantic
      versioning rules would allow them to <br>
      release say 1.288, 1.289, ... and at that time, it would likely be
      more clear that we should be following the<br>
      1.x releases for older branches and 2.x releases for newer
      branches.<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:CAOSpxda3VsmobDFyVCmNH6cqGd+MZahO=g=yf_6XNY0sJAwcLg@mail.gmail.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">According to the stable release &quot;rules&quot; option 1 would require an
exception granted by the TSC.  Otherwise it is a no go.

So it seems to me that this is a classic case for using a mix-in layer.</pre>
    </blockquote>
    <p>Once I have enough data, I'll present it here and if it makes
      sense to ask<br>
      the TSC, we can do that.</p>
    <p>Upstream is not backporting fixes for a CVE such as this or for
      less notable bug fixes, <br>
      so we'd be giving up those improvements. I suppose we'd only
      backport<br>
      bug fixes should someone encounter the bug or it becomes equally
      notable.<br>
    </p>
    <p>So far, there haven't been many Rust/Cargo CVEs so maybe we're
      making<br>
      too big a deal out of this. I certainly don't miss the deluge of
      memory management CVEs that<br>
      C/C++ applications suffer from!<br>
    </p>
    <p><br>
    </p>
    <p>Sundeep, <br>
      <br>
      Please also try to backporting the fixes to say Cargo/Rust for
      kirkstone. <br>
      This CVE resulted in ~10 patches so it's hopefully one<br>
      of the more complicated back ports and will prove to be a good
      test case.<br>
      <br>
    </p>
    <p>../Randy</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:CAOSpxda3VsmobDFyVCmNH6cqGd+MZahO=g=yf_6XNY0sJAwcLg@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">

Steve

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On Tue, 17 Jan 2023 at 22:57, Randy MacLeod <a class="moz-txt-link-rfc2396E" href="mailto:randy.macleod@windriver.com">&lt;randy.macleod@windriver.com&gt;</a> wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">On 2023-01-17 16:54, Richard Purdie wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">On Tue, 2023-01-17 at 15:29 -0500, Randy MacLeod wrote:
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">On 2023-01-16 10:20, Kokkonda, Sundeep via lists.openembedded.org
wrote:

</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">  Rust community said the security fixes are only for the current
stable relases.

<a class="moz-txt-link-freetext" href="https://internals.rust-lang.org/t/cargo-cve-2022-46176-fix-for-older">https://internals.rust-lang.org/t/cargo-cve-2022-46176-fix-for-older</a>
-releases/18152/3?u=sundeep-kokkonda
  For old release we've to backport the patches ourselves.
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">The other alternatives are
1. upgrade to 1.66.1 on older branches,
2. add 1.66.1, which will be the PREFERRED_VERSION but keep the older
version for those who are risk averse,
3. add a mix-in layer (1) with the upgrade to 1.66.1.
  For langdale, we'd update from 1.63 and for kirkstone, we'd update
from 1.59
See the link above for a discussion about what Fedora/RHEL and other
distros are doing
  and a description of the rust / crates.io test system known as
crater that builds the
  world for any significant rust change.

Is there any objection to doing 2 and if we don't see any problems
after some time,
  then removing the older version?
Sundeep,
If no one object, please update kirkstone and see if librsvg or
python-cryptography or
  anything else encounters a problem.
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">I'm afraid I don't like option 2. We don't do this for anything else so
we're now inventing some new policy. Either the upgrade is what we
decide is right or it isn't, I don't really like the idea of hedging
our bets and providing two versions, one of which nobody will use until
they're forced. It will also make security scans tricky as is the issue
dealt with or not?

Just for context, going back in time OE used to be awash with many
version of recipes and I'm reluctant to go back there as it was
horrible. They were added for exactly this kind of reasoning, which at
first seemed like a good idea.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">Okay, make sense, option 1 it is!

../Randy
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Cheers,

Richard


</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">--
# Randy MacLeod
# Wind River Linux


-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#176063): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/176063">https://lists.openembedded.org/g/openembedded-core/message/176063</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/96218038/1686489">https://lists.openembedded.org/mt/96218038/1686489</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
        </blockquote>
      </blockquote>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------H5uaTA3eXRTF96dOORfLkEhf--

