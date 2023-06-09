Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 798F1C7EE25
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 15:26:59 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.16289.1686324416790753272
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jun 2023 08:26:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=Mm4hb1hf;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=552454e49a=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 359DxccU004916
	for <openembedded-core@lists.openembedded.org>; Fri, 9 Jun 2023 08:26:56 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=PPS06212021;
 bh=R3gTnXTsGln4hhtcabyB/RQOOt18xcek0XTABc4Mgrg=;
 b=Mm4hb1hfZTeNBIcDyj3LMDazYLTK0Hp1cpa9hJ84A7AvEW0HNnuElSpmXkC2F+QKkPWg
 +245JvflgPn0aSYmKV15W/+dib4IyfTcGMsDn1t/61MhooZB5nHan4Jgqai6rdK6wpzZ
 N6iVHXip8HOfp/uOb6dP0JGfIZUf6TXpr46q3OnnR3oju2NQ3HS9SAYFbbiryn64hi6r
 n/wIzOXZ1Wm9ns8Px1BB2HJvaxM4X32WfXVSu7uwmpdILB0C2IV3ZMXJwjR1s4s/mQ3x
 0EJ0YkcBNN/Ou34SFomkgiSB0Bc+WhIeV7W0B/XWp/B83mSH78MBOpe4cC5NmV/8ie/J 4w== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r2av7asv9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 08:26:55 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 359FQtcM020077
	for <openembedded-core@lists.openembedded.org>; Fri, 9 Jun 2023 08:26:55 -0700
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r2av7asv7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Jun 2023 08:26:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YvFxE7WO4FaVFB0aSV/75v9WjQpCgMZeeHdQeynmyU2II3QzbNY9B0o+n7PnVHrCegxN0+JRxQ3h+8ud/PJ89wmlCA7AcBKpe3jpgksyzsXvhdL6NSkwpWvWu8N367gn4APBuKqtteYajygefvx3rhBetbvVfHusFpFfU8e/aYMi4Ea/RsqoXTEmm3BxbhSnQKsWG/XQQtdFbZrz27HtIhNPoyhYv3CWqodTsa3CW6IeHGbkBLniwpIs2etMBLmLXBLBs+JuYrv3wmSllWvqMpCsJ78s8V+RyLqMaN344gHkkoNmYRMALfumtC2IAITMIdoTP6W5ArVTO6Su7yZcPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R3gTnXTsGln4hhtcabyB/RQOOt18xcek0XTABc4Mgrg=;
 b=MkPMeSzI7yeLvesxmNYo6rHUDAiRZumAakYWT9FABESRxWeNOJooVOpUXhVgfiYTJoat2YRCtBy/9oQBkG3qtQwwJ7NhPODVQ7v6CJeEG8M7WzuVfR8nM0ExWvKDdanZ6zvq/CgRwpzN3k56wYLwt7J2gfp2N92OODl8NteN5/RXeicP7KGhIlsmCEhH+CFX2s40TF10LZJieenWe+VyqnBbCBz4R2wOeV1NiYWJCcS3T0roqaBtLNVDLN663RSEx2fWAUZW77WkmIrG93PoAxFjA021UeT7fJ0bjdHiyJZNz/5durh3sFl+Vu7xKQDfKp1umXO1ZouoS54D/OMEDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by SA3PR11MB7978.namprd11.prod.outlook.com (2603:10b6:806:2fa::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.36; Fri, 9 Jun
 2023 15:26:53 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::5a4c:c35b:8704:34d5]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::5a4c:c35b:8704:34d5%3]) with mapi id 15.20.6455.037; Fri, 9 Jun 2023
 15:26:53 +0000
Content-Type: multipart/alternative;
 boundary="------------8y5eI3mm701QaHJYZNtVqR8d"
Message-ID: <aeef6617-32b9-442c-7228-f3f3f7d41e8f@windriver.com>
Date: Fri, 9 Jun 2023 11:26:47 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [kirkstone][PATCH] Below commits on glibc-2.35 stable branch are
 updated.
Content-Language: en-CA
To: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>,
        openembedded-core@lists.openembedded.org,
        "steve@sakoman.com" <steve@sakoman.com>
Cc: Umesh.Kalappa@windriver.com, Naveen.Gowda@windriver.com,
        Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com
References: <20230609131841.3291186-1-Deepthi.Hemraj@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20230609131841.3291186-1-Deepthi.Hemraj@windriver.com>
X-ClientProxiedBy: SJ0PR13CA0036.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::11) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|SA3PR11MB7978:EE_
X-MS-Office365-Filtering-Correlation-Id: a33c7835-6ec3-49d8-8aa9-08db68fdf3c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	x8geuWcpJirIMwlUYfLw8bea6TJbLJK62Wvn2iXbCzcoXocdQrj+aB0Ms/Q86qd9Ul223vMw7V99CYfBaleOzfu9oJaxgAiV1S1ddk2rafDh8HiftWSflSE2+EGL8etbCm6nBp274impC/QqQFo1ya03LB3KZpVewHT2ZdLHFh53Qh+AUSZII22iod9Inx6KRuHWBN3RkSFr2A+fRgfK5DJh7Gfm3Kee4rw27H/WjDplp5jq8Q/2ptk3qj1rzWIZ0oCHOBrQ3PCfX3vDyVmM/n0VmvoZL8JgJvl4k91HPL+mRHgZqkb7g2HQ0FqHoOv2RG4Qt4t9+XYO0gVN7XpEnCLCSvlDVi0NRBGQJlxqi2NhYlfqhYBbosP52TDCtldsC/cx68nVB5EjzH6wCRbwuSHHlrDgUL/HVQf1PbU4/xTyz4QC3BRaB4EjX1NKE07eLP2Jw0Pk7JqVQ9wNmox0j8X1536FuXk20jCj9qX6kQDs7ZYg8Ds1gyo77whqD1ej5pYhZ7iQl3lc3UDLi/gLx1Mx5ngf6sHY6WsTdVVGOqXPj1q5yUraznVQlW6JTS++K0jKpIeAkg+sqhM9Qd7S9syF8Yt4qn15pHcYt2W1TWAp56/y//3GmzSxT8R71cWsayjVE5D7tR7dcRws8t8eZg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39850400004)(136003)(346002)(376002)(366004)(451199021)(107886003)(8936002)(8676002)(31696002)(5660300002)(31686004)(86362001)(186003)(110136005)(66476007)(36756003)(26005)(6512007)(6506007)(53546011)(15650500001)(2906002)(316002)(41300700001)(38100700002)(4326008)(66556008)(66946007)(2616005)(6486002)(6666004)(33964004)(478600001)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WmdsaTVDbmp6cGhNcVFaVFdsckFFTWRHMVRld21LUThDSUM5bUQzTEF2M2Nq?=
 =?utf-8?B?cVVpVEszdXJGY2JSQ2owWFBWclNMSDFNMEUzQlI5R3kzZEhFRWtLVXB0L0Ny?=
 =?utf-8?B?V2hpWW1WVktydHBRLytHaEplN1NBeTJ2azdON1hhNTh0RzViMlNBbC9kZm1n?=
 =?utf-8?B?bTNzYmk3Q2I4b1Vra1RSSjNBald3Vk5SUDBtQWZPWnVIOUZ0Rm9UWXRNcGFE?=
 =?utf-8?B?NnJ0OVprZkRLdENsOEZzVjdlUTZnZGhjMWhGbXRIcVk0d0M5RCtHaTliWGZN?=
 =?utf-8?B?NWdwQXNycUpiYTZNdXd5NzR5YW8zd2ZRL2w1NlZKS2lRRUh4Q0RxRi9zaHRj?=
 =?utf-8?B?MUUxVDk4amQ2MStha3JHMDZxczFBS1VPNmwwZVFkczEzeWR6Y2UzeGVnTlZ1?=
 =?utf-8?B?TXIzNnNSK0JBWGxDSkJDT2hZbGtvT0I5dFRIT3phNzdySVNzL0xPRTA2MDhl?=
 =?utf-8?B?NllLaWdIUHlRRjY2c3VjSjB5ODkwVXhRWnhldnI2TXEzSEhMSktKNnFDTStl?=
 =?utf-8?B?UDN1ZWVYVklmdzNHSVE1a3ZiSVFaeWt5cWhPVlBiamsvSzhoWjlkRGN5Um1Y?=
 =?utf-8?B?cVZzWTJKVXdWckVyZGIrQWtBMi9OUVpySm9OMXlSSHNiU0REQXNXUGZ6WWRz?=
 =?utf-8?B?Rk1EL3ZrVFFnK1hmY3Z0TGx1aFhXYXhYNGJhQjFlUEtDZFFEUG9SMWpqcGZh?=
 =?utf-8?B?QzFmS2tKYVAwWjhXc0hHRHZOY2h0eC9lSEViVEdsSVhBOEJJMi82YUh2Q0xw?=
 =?utf-8?B?bklSTDlGazh3SDJ1aDBVaG9mdXJzUGtsVnBNZGdybHJ2bnBBeitRaDNmNVJH?=
 =?utf-8?B?dUNpV3VnNzlSMzkxdW9rZndqV2liRjdVNFNYcGc5UmEzYk5DQUZaTGVWTjVm?=
 =?utf-8?B?TkdNcXJKWXA5YXZ2ZUd2UzcwTS9aZkJTaE1sTm10UlltN3VTYmZudlJNUWxs?=
 =?utf-8?B?MGgzZ0JkenVRNmdZaFRGVWI4QmYvcFp6WGxhS3kzV3Y4VEdIRVRLNGRicjhT?=
 =?utf-8?B?M3dqU0JmZURxbXM3UXdUdEt6RzNjOEY5b2tXTXJGRk5xWnNrbGR2eEg5K1V2?=
 =?utf-8?B?MktDZkNHdFJBbVVBRkZKNitlVzk2aU96VE1BMkVad0Uralk1V0EvTmFTeHJU?=
 =?utf-8?B?cXJtRFZ4c1hFblg5dXNwTjZuREVpWHJ2UzRSNmFja25jUXJud0dOQnBOdHdt?=
 =?utf-8?B?RjJzMXoxZUd5bDNGSzdZUEUvWHUwRlVDN0pMQ0ovZCtjRnBWTjhUTkJsRDV5?=
 =?utf-8?B?dGZVVUVJdGkyTlR2Nm8yUjIxSXVlL0pRYUVydlZDZlprVG5aajJDWUlpTGd3?=
 =?utf-8?B?T3hwc1pSb0lzTHFmRlV6QytmUmd3TC9nbzhhcmJpZWJxenBuQ2RHUUlUbC8x?=
 =?utf-8?B?c3dKOUU5VFF6eUNQNHh3RWRSU21NZFZaWndwZWltTkd0THFOZ1Y3VmRYeGRs?=
 =?utf-8?B?ekRaaGpJSVVUS053dXM4eFFUdnBrL1pMSE44Ymp4bTl5Y1g3QlpoYkRlZ3ha?=
 =?utf-8?B?K0R3OElKWWZReFhZMUExblZrZlIyNVBnbFo1SVV4TS8yc2VRRGRDVlFtY09V?=
 =?utf-8?B?VEQ1SXdLVElDRVppeXpDemI3Q3hqYmRaWTNLMEJnQW5leERkd0FKKzdDdysy?=
 =?utf-8?B?WjBqa3A5WkdUZ3JJQWpFenpScTJ2a3oyaG1YY2JEL0ZYVThNL1BDbGRNRmRR?=
 =?utf-8?B?RjlMa2doanVoVk5UcThQQmtqUjgyVFpNbnBzU2hISC9DckR0b2oxY2FZNlJS?=
 =?utf-8?B?MlBmRzJGYVovNmZQcmZCaGdYS1h0RXA0V2ZQTUFybjlGS1N2UElrRWVaRDZT?=
 =?utf-8?B?TGJXVDllQUQ5eDVGUmxuUHNHMHN4K00wYTM4ZnlGalBBVWRObXgzSVdDRzZJ?=
 =?utf-8?B?V0N0dmt6cWRCR1A1MHE3dm1aRDNaQ2I3QmtBOWk0ZnBzeEt2L2Frc25YcERS?=
 =?utf-8?B?bmkrTFdUMEhCWlRVOC82TXRnMTVaNlFMSXc3MVBLb0RiR2FBOGF3dzB3ajcz?=
 =?utf-8?B?dm9IOXZvQmRBZEphSHR0RkFQWC9VVkU1QTd1aDZ5NjhkQUdkWlJGYVR0VG5m?=
 =?utf-8?B?LzN2QkVDY0tQQlFRMTVGd09McnJyL1NtazM0TFoyUTd4VWFpeExyWHNLK1hk?=
 =?utf-8?B?UjVnR1VMendUQk5mcVZROG1henA1WTBKdFplQUd2M1NKd05GbCtTSktBRHk4?=
 =?utf-8?B?Ync9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a33c7835-6ec3-49d8-8aa9-08db68fdf3c9
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 15:26:53.0510
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AR7TsBeTlQfkHO8LfN0YegZ0OQPqX1m5OT6HDZOILBgUYLmWhRoHDC8w9MoeAkFAG5XcWyv9lPCF+hsHsDY9tpBCInYWP/P4r/ldcHKgQn0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7978
X-Proofpoint-ORIG-GUID: oSgTFreXs3dOIik3lUNgkXPCXr4mIwmr
X-Proofpoint-GUID: abfZFuPkez2zm2p-gAij5v9VtJKSprxx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-09_10,2023-06-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 phishscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306090130
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 15:26:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182561

--------------8y5eI3mm701QaHJYZNtVqR8d
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 359DxccU004916

Thanks Deepthi.

Add Steve, who maintains the stable branches of oe-core.

Can you change the subject/oneline git summary from:

Re: [kirkstone][PATCH] Below commits on glibc-2.35 stable branch are=20
updated.

to:
Re: [kirkstone][PATCH] glibc: stable 2.35 branch updates.

like you had in your previous commit.
Remember to keep with the existing style of commit logs.

On 2023-06-09 09:18, Deepthi Hemraj wrote:
> cbceb903c4 io: Fix F_GETLK, F_SETLK, and F_SETLKW for powerpc64
> 0967fb5861 io: Fix record locking contants on 32 bit arch with 64 bit d=
efault time_t
> 739de21d30 Document BZ #20975 fix
> 2b9906f9a0 __check_pf: Add a cancellation cleanup handler
> 7035f2174f gmon: Revert addition of tunables to preserve GLIBC_PRIVATE =
ABI
> e698e8bd8e gmon: fix memory corruption issues
> 9f81b8fa65 gmon: improve mcount overflow handling
> f2820e478c gmon: Fix allocated buffer overflow
> 413af1eb02 posix: Fix system blocks SIGCHLD erroneously

Nice, I checked and this brings us up to date for 2.35 since there
hasn't been anything merged in the last week.


Please add a comment to the commit log explaining that you dropped

 =C2=A0=C2=A0 CVE-2023-0687.patch

since it was back-ported to 2.35 as commit:

 =C2=A0=C2=A0 f2820e478c gmon: Fix allocated buffer overflow (bug 29444)


We still have time to fix the commit log up since theYP 4.0.11 build=20
date is 2023/06/26.

Thanks,

../Randy

>
> Signed-off-by: Deepthi Hemraj<Deepthi.Hemraj@windriver.com>
> ---
>   meta/recipes-core/glibc/glibc-version.inc | 2 +-
>   meta/recipes-core/glibc/glibc_2.35.bb     | 1 -
>   2 files changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-c=
ore/glibc/glibc-version.inc
> index 4d8d96cefb..01b1abef7d 100644
> --- a/meta/recipes-core/glibc/glibc-version.inc
> +++ b/meta/recipes-core/glibc/glibc-version.inc
> @@ -1,6 +1,6 @@
>   SRCBRANCH ?=3D "release/2.35/master"
>   PV =3D "2.35"
> -SRCREV_glibc ?=3D "1c7f51c75ae300fe52ccb636e71b8e28cb20824c"
> +SRCREV_glibc ?=3D "cbceb903c4d770acc7e4ba5641036516830ed69b"
>   SRCREV_localedef ?=3D "794da69788cbf9bf57b59a852f9f11307663fa87"
>  =20
>   GLIBC_GIT_URI ?=3D "git://sourceware.org/git/glibc.git"
> diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-core/=
glibc/glibc_2.35.bb
> index 29fcb1d627..df847e76bf 100644
> --- a/meta/recipes-core/glibc/glibc_2.35.bb
> +++ b/meta/recipes-core/glibc/glibc_2.35.bb
> @@ -50,7 +50,6 @@ SRC_URI =3D  "${GLIBC_GIT_URI};branch=3D${SRCBRANCH};=
name=3Dglibc \
>              file://0024-fix-create-thread-failed-in-unprivileged-proce=
ss-BZ-.patch  \
>              \
>              file://0001-Revert-Linux-Implement-a-useful-version-of-_st=
artup_.patch  \
> -file://CVE-2023-0687.patch  \
>              "
>   S =3D "${WORKDIR}/git"
>   B =3D "${WORKDIR}/build-${TARGET_SYS}"


--=20
# Randy MacLeod
# Wind River Linux

--------------8y5eI3mm701QaHJYZNtVqR8d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Thanks Deepthi.</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">Add Steve, who maintains the stable
      branches of oe-core.<br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">Can you change the subject/oneline git
      summary from:<br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">Re: [kirkstone][PATCH] Below commits on
      glibc-2.35 stable branch are updated.</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">to:</div>
    <div class="moz-cite-prefix">
      <div class="moz-cite-prefix">Re: [kirkstone][PATCH] glibc: stable
        2.35 branch updates.</div>
      <div class="moz-cite-prefix"><br>
      </div>
      <div class="moz-cite-prefix">like you had in your previous commit.
        <br>
        Remember to keep with the existing style of commit logs.<br>
      </div>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">On 2023-06-09 09:18, Deepthi Hemraj
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20230609131841.3291186-1-Deepthi.Hemraj@windriver.com">
      <pre class="moz-quote-pre" wrap="">cbceb903c4 io: Fix F_GETLK, F_SETLK, and F_SETLKW for powerpc64
0967fb5861 io: Fix record locking contants on 32 bit arch with 64 bit default time_t
739de21d30 Document BZ #20975 fix
2b9906f9a0 __check_pf: Add a cancellation cleanup handler
7035f2174f gmon: Revert addition of tunables to preserve GLIBC_PRIVATE ABI
e698e8bd8e gmon: fix memory corruption issues
9f81b8fa65 gmon: improve mcount overflow handling
f2820e478c gmon: Fix allocated buffer overflow
413af1eb02 posix: Fix system blocks SIGCHLD erroneously</pre>
    </blockquote>
    <p>Nice, I checked and this brings us up to date for 2.35 since
      there<br>
      hasn't been anything merged in the last week.<br>
    </p>
    <p><br>
    </p>
    <p>Please add a comment to the commit log explaining that you
      dropped</p>
    <p>&nbsp;&nbsp; CVE-2023-0687.patch</p>
    <p>since it was back-ported to 2.35 as commit:<br>
    </p>
    <p>&nbsp;&nbsp; f2820e478c gmon: Fix allocated buffer overflow (bug 29444)</p>
    <p><br>
    </p>
    <p>We still have time to fix the commit log up since the<span style="font-family:&quot;Arial&quot;,sans-serif"> YP 4.0.11
        build date is 2023/06/26.</span></p>
    <p></p>
    <p>Thanks,</p>
    <p>../Randy<br>
    </p>
    <pre class="moz-quote-pre" wrap="">
</pre>
    <blockquote type="cite" cite="mid:20230609131841.3291186-1-Deepthi.Hemraj@windriver.com">
      <pre class="moz-quote-pre" wrap="">

Signed-off-by: Deepthi Hemraj <a class="moz-txt-link-rfc2396E" href="mailto:Deepthi.Hemraj@windriver.com">&lt;Deepthi.Hemraj@windriver.com&gt;</a>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 meta/recipes-core/glibc/glibc_2.35.bb     | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 4d8d96cefb..01b1abef7d 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= &quot;release/2.35/master&quot;
 PV = &quot;2.35&quot;
-SRCREV_glibc ?= &quot;1c7f51c75ae300fe52ccb636e71b8e28cb20824c&quot;
+SRCREV_glibc ?= &quot;cbceb903c4d770acc7e4ba5641036516830ed69b&quot;
 SRCREV_localedef ?= &quot;794da69788cbf9bf57b59a852f9f11307663fa87&quot;
 
 GLIBC_GIT_URI ?= &quot;git://sourceware.org/git/glibc.git&quot;
diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-core/glibc/glibc_2.35.bb
index 29fcb1d627..df847e76bf 100644
--- a/meta/recipes-core/glibc/glibc_2.35.bb
+++ b/meta/recipes-core/glibc/glibc_2.35.bb
@@ -50,7 +50,6 @@ SRC_URI =  &quot;${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            <a class="moz-txt-link-freetext" href="file://0024-fix-create-thread-failed-in-unprivileged-process-BZ-.patch">file://0024-fix-create-thread-failed-in-unprivileged-process-BZ-.patch</a> \
            \
            <a class="moz-txt-link-freetext" href="file://0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch">file://0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch</a> \
-           <a class="moz-txt-link-freetext" href="file://CVE-2023-0687.patch">file://CVE-2023-0687.patch</a> \
            &quot;
 S = &quot;${WORKDIR}/git&quot;
 B = &quot;${WORKDIR}/build-${TARGET_SYS}&quot;
</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------8y5eI3mm701QaHJYZNtVqR8d--

