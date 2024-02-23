Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF4DDC48BC4
	for <webhook@archiver.kernel.org>; Fri, 23 Feb 2024 09:36:45 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.7217.1708680998824867048
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Feb 2024 01:36:38 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=mEIl6K5G;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2783925a10=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41N78lZ3004278
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 01:36:38 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=MFfBvsMOG1MdNiD5QaS4nK6BAIWFu0BQwSfI6b9fDJo=; b=
	mEIl6K5GfvXP/uh0W+T+mvyOvrLqjuNa4gJ3BkCoXG32QGen0LVw4XnA6dG51KQa
	Ew6PhlNyeMeBp84JnHPYTiDYbOOHW6yLE4ZGBY+7Aimc+sttZSxisjiZKT60ePCO
	bBa0CJvJ/QdUMXCHdCcGdqn52i0WH0s2p19HyvM+m4tmWF6B52xzElh4mR2YYANI
	tEnBOUQYGjLEzlJjGMvGdX6R5xXR6ql/whtUi+LeIg0RfedAciv0F4mjoFoKtWal
	/iIGIo6OUofwvQzWkSp4Ji2yQIW9wMHWAnVpoOlFsCstQkUG1SKxFnsL9h8nydZm
	CaarpQOwZXxltfQ7KJXW5A==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wd20ck07d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 01:36:38 -0800 (PST)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 41N9abIJ015606;
	Fri, 23 Feb 2024 01:36:37 -0800
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wd20ck07c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Feb 2024 01:36:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TnLGLRSNXJ5PTwy3AbNqcXyE6nxqA7P+vECNaWP1or8+eUQ/p8Sc14CZGr3gJnew52J0o1Eow/yJs4e51zoeXaTnMipoMh6PjNCfFr7cgQ5LhQeO51g7GaxjZRhQIt9otMhAgjWO2vfZ52h5n1eBzKcJErmrgUrM9zAtw2Oj6iGaljlfBAltw23GEFhrt9nfsJMG1WPYszqYAfGq39tQlNyvH1fS8c20q1RmBqxPNbzNJU576S8cHj4jLeAtJFmgvP56hzWgi0cvpW0JxP70b5Y43sV572j3/sWXKQ8qa9PA9EAJAl1gBRhCI4eJ4w3TFBNO8llaChq9VlIEb2FVhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MFfBvsMOG1MdNiD5QaS4nK6BAIWFu0BQwSfI6b9fDJo=;
 b=E1wPv2YnpkwUWuBNxYoen2b1QthNajUhk0LPkd8VtaC3qZK+KjNro9nw703KX6aaezIF7NSAQbJtHXJimIIuZx1C8dRNB++Rd7NYj2fNoWZmRIr7rO4HDo38HdN8IxesPWm8WNP0e4gDUo4FRtGUGlK2R7+1FEZKNDvU7+DWLpcMqKT6mtmIFpQDF04almzJhRWjCNqms5LHv+b7dSNrUDoNU2Hd5h2ByO9uR+L7nR/9BMUks5Z/b/vkmSMHh/c863fRYU6OQFK5t8xDTGIaBTsfiAJiH/lDbBI8MI+fbEWwWzVsXnv3tOqC8ZRlSoDsBbw9/Rc9tIRsyM5w3qE73g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DM8PR11MB5591.namprd11.prod.outlook.com (2603:10b6:8:38::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.10; Fri, 23 Feb
 2024 09:36:34 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7bce:b7a0:1830:98d0]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7bce:b7a0:1830:98d0%3]) with mapi id 15.20.7339.009; Fri, 23 Feb 2024
 09:36:34 +0000
Message-ID: <0d86535f-8745-443f-d5ac-48fbc337db6a@windriver.com>
Date: Fri, 23 Feb 2024 17:36:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [OE-core] [PATCH 1/3] useradd.bbclass: Fix order of
 postinst-useradd-*
Content-Language: en-US
To: =?UTF-8?B?RWlsw61zICdwaWRnZScgTsOtIEZobGFubmFnw6Fpbg==?=
 <pidge@baylibre.com>,
        openembedded-core@lists.openembedded.org
Cc: =?UTF-8?Q?Piotr_=c5=81obacz?= <p.lobacz@welotec.com>
References: <cover.1708613381.git.pidge@baylibre.com>
 <5eb199fe11d71f598726b75808b3330cd3efd2e5.1708613381.git.pidge@baylibre.com>
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <5eb199fe11d71f598726b75808b3330cd3efd2e5.1708613381.git.pidge@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SI2PR02CA0025.apcprd02.prod.outlook.com
 (2603:1096:4:195::21) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|DM8PR11MB5591:EE_
X-MS-Office365-Filtering-Correlation-Id: ac3c0ae0-35d3-4415-0f1f-08dc3452ec5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kfhJW4K5bx9SZB146m01mzonrYZOss1av8uUtEZJ+x8MQLta3NiUN5lsYt6vuweQC0dBNbG+K1xwVspFRUgP2lWusqd6d4tEm0KB4MBzRBiAzM/nPfjrkKCFMg38eCrXp3j1NIRyoNMm5xvon7aGJLPMPG9wM2nlX3U6V87Rw/B0oSrmu6vAJVQIlCXyLE9pd0Oohxk7k7biUmKrDE7jz09VIieyE1i5yZt5nJgAVym0znLLcA+fLJyQzNvUDUNomp/ZLzURyQmpZB7PxScZCLEer+xwvlPe1farH3hfBmwEJDMXsgPMcjSXLJ4Ze/XU5Iu0TtXxmTAU3c1njrpzEijCMBNasXkveJ2K/iU3+28wQtVuuEFyRZJ9uAFiPziVcHT78uKAmT+rFfG126lrHYdKwkU9JJ92q4DdpPxvqM1VtPy0AJvljC/VOCZHRkphigr6ZQqJXKqrnX86ii76EoNPkRmxJYsa65D+rRVB2gGdM58L/05OEHeYBs7MP8J5TYhNG71wLPifIpN3Jr/KOw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SUJvQ3VPbmVDdnljR0dsUlptN0taNGw5OUJiaUV0U3Zrd3ZqVTRDTDlMK2dM?=
 =?utf-8?B?bkZhcWE2eHVPSWY5QWQxUGtlVWVHMXRrUG5uKzhodDFGVlgyR0grT29aMVFY?=
 =?utf-8?B?cVd6Z1RpTkpsWVl3SWJiWWd0Y3lhNWZ5SlRRQlgxZzZWWFByL0pnWFgrN0lx?=
 =?utf-8?B?ZDJGbkhXNVlIWHdieVFxZlB2VnZBcnBWRzhnNUg3SzNkTWZxNzlXZW1heGJa?=
 =?utf-8?B?YjRtYTNOWmVpQllzYlAzUjNUUUorMnpUOWxwQVZ1empSMEE5ZmNsUytSUU5t?=
 =?utf-8?B?ZU1wN3FRcHljaTNLdVFCQmIxL2o3azgxQWhjaERrcWhYUDNIeHh0azZsSXF5?=
 =?utf-8?B?U1VQV20zR25WRWphTUZINzdoN0JmRzlKWk1kM1RPRVlVYS9xNm1yYzdnU2h2?=
 =?utf-8?B?bHJVQWtyL1lnK0h1aklVWEtoSitQUXNPRCtpUkZwemthdkVsKzlKdW1pWHRP?=
 =?utf-8?B?QmVtS1hoY2Rqd3dtUlBETkZDMFhmcDlwMHpwUEJyTG9tOUpvOERqYXpRNWlm?=
 =?utf-8?B?VUtXcmZMRHZ5QWQ4WWduT0cyelI3THpUUk5NV3FDVGsxZzVJdmhpQUNtbDB1?=
 =?utf-8?B?UGNSU0lxTHhndS9KN3pkbm9IcVJOdHZRZHlNQ2hNeWNVUDB5RzdoN1ZqOG5L?=
 =?utf-8?B?ZTl3OWFYZXVnV2kyRDdrZUE0c2ljNXllL1ByVTlYa1hyZ1hCNHZ3TlBoakVO?=
 =?utf-8?B?YURybTlJMnFuWHp6UUozUmk4SGlkb1NLRjhXWFZWdHdQMkdsdEhicGxqN0ll?=
 =?utf-8?B?UXR1Rkw0SmFGdnhNcS9yVENGVXhXMFd5TEwycVQrbzlRRysrR3BlaHpyN3cr?=
 =?utf-8?B?dlc0SW13ZGFrclN0R2k0QXg1b0l1MjVhUHpIQkM4V2lQRlRzMkFwR0F0Q2Vh?=
 =?utf-8?B?RzF3d1JpVWlFRkd1THcvZzdkR3NNR1JiWXZVOVdLQ012aGR0K1FTOGR3Ykdu?=
 =?utf-8?B?T3BKR0VxdEFsc05KcWJpWTVZNFg3bkI1enk5Y2J2NEZVamhlYTlpb212enRi?=
 =?utf-8?B?WVhoSjdCbHJYU1dVM1NsNzU0OHl6Y1ZJY1VIN25EUG8xbHc3aWRVZmxQZTNJ?=
 =?utf-8?B?V1gyeThwcEdUSDl3d2pNRkUzWU5DcXMxdURwU2ZkRmpOSGpkYXZrYWo1ejZP?=
 =?utf-8?B?S2IxaFBTd05mNGNGbnZ0bnBPTkJicmZLKytma1VOUTZ3QnhtTzdaNERNbk1j?=
 =?utf-8?B?WlI3eDVsZkZ0ZVJobWpjQjlMSDZoejlYWkM5OFNEVGFqNEJQN0ZUUkFYWWdH?=
 =?utf-8?B?dy9lM2NXamlKd1RNM1JHS3RUeTlFWUNZV1VhSXFlL0ppeSsyWGJ1eGtlS2kx?=
 =?utf-8?B?RFkyVDY4VE5KV1J1TzV3eDRNRCtLWnZXdkRPM1pIcXpXNFhoVExHdng0aHBD?=
 =?utf-8?B?aktCNVZXSkpHdkpaU0ZFSTVNQkNvelQ5a3VYSlA1akx6RWxHNStHRkxaQkxo?=
 =?utf-8?B?UFlYaTNiZzRXdzlYczMvN2R6VTFicHhHald1eFFBdk5TNVp0b1lVNHVjSTNs?=
 =?utf-8?B?bjBJc1h2WWQ3aEJpM2ZzZlhIYi9mUmVkNnBoZTM0SmQ5YXB0Y3F5c2IyQStZ?=
 =?utf-8?B?VkdDMmRiSFdnUG1ROUJ5WUxsREZmODdRUnZPZW5odGhxcTlnQVo5dEFBRHRZ?=
 =?utf-8?B?MjliZmx0dExjQU1McDFVUHEvenFMUmRzMkJHUlM1VFdHSVZqWEJDYWlYcmZX?=
 =?utf-8?B?enpxMStLNkFTSVNwVC8rVFdOeU5MUFRieEI0V3d5SVdJRVJOZlNOT1IwK01D?=
 =?utf-8?B?am8xd3BGYzR3d1IzejNZZUhDMlJnNTZTVVRBOGFtaDJuSjlpS2ZmaVNaV3hU?=
 =?utf-8?B?a3hnaW5GdFpaOEV2K2o0Yy90Qm1iVUlqSCtNbk9sdG54S0xOdk9xa2hTTGpt?=
 =?utf-8?B?dTl2R1piVmliL1dpM2ZCNTFYNDZiaWx3Wlo3Y0l3SFVqYysyOU5waHpEOWpx?=
 =?utf-8?B?UzUwQUN1dDhIdFdOVGRUdVRYdlNWRGdFcWg2ampIWWRoUlFPcldUalNvWWFG?=
 =?utf-8?B?SXZNdVM4STQ4enNYNEZiY0tHSXp4RjR4dGZYb0NpRGFJWFVVOW91TnZoc20v?=
 =?utf-8?B?T3ZwMXkwWmdaMXNvd1NCSE9XOWRRRE9BRWRVM2NGeDhRSURuc2JrVmxSZU9m?=
 =?utf-8?Q?2nNKFcU85t9Ki7krAKnTSa/bL?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac3c0ae0-35d3-4415-0f1f-08dc3452ec5b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2024 09:36:34.1401
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G78Tof1AdZawYD6OwXqpUQFPT8z2168pBVXLYp4Tgd/bKl/dHaJNeKj+i6VtH8yH78d3GLj6hcw/wJfYttFudg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5591
X-Proofpoint-GUID: eIiuW8qqs9c1nyW2vwyqK1hcujSpsa3X
X-Proofpoint-ORIG-GUID: 2gZ4kIdQpy6DxrNRQbbuYxP0WGD3vurT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-22_15,2024-02-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999 malwarescore=0
 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402230067
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 41N78lZ3004278
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 09:36:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196054

1. I can see what this patch mainly does is ensuring groups first, then=20
user, then groupmems. But the current useradd_preinst, which is called=20
by useradd_sysroot has already ensured this. Is that not working?

2. You're using bb.warn as a method of outputting debugging information,=20
which I don't think is appropriate.

Regards,
Qi

On 2/22/24 22:53, Eil=C3=ADs 'pidge' N=C3=AD Fhlannag=C3=A1in wrote:
> From: Piotr =C5=81obacz <p.lobacz@welotec.com>
>
> postinst-useradd-* haven't been running in order of dependency.
>
> This patch is reworked from Piotr =C5=81obacz's patch and fixes:
>
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15084
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D13904
>
> It ensures that groups, users and groupmems are all run in the correct =
order.
>
> Signed-off-by: Eil=C3=ADs 'pidge' N=C3=AD Fhlannag=C3=A1in <pidge@bayli=
bre.com>
> ---
>   meta/classes-global/staging.bbclass |  7 +--
>   meta/classes/useradd.bbclass        | 72 ++++++++++++++++++----------=
-
>   2 files changed, 49 insertions(+), 30 deletions(-)
>
> diff --git a/meta/classes-global/staging.bbclass b/meta/classes-global/=
staging.bbclass
> index ab3e1d71b5..6c21510377 100644
> --- a/meta/classes-global/staging.bbclass
> +++ b/meta/classes-global/staging.bbclass
> @@ -245,8 +245,9 @@ def staging_populate_sysroot_dir(targetsysroot, nat=
ivesysroot, native, d):
>                           continue
>  =20
>       staging_processfixme(fixme, targetdir, targetsysroot, nativesysro=
ot, d)
> -    for p in postinsts:
> -        bb.note("Running postinst {}, output:\n{}".format(p, subproces=
s.check_output(p, shell=3DTrue, stderr=3Dsubprocess.STDOUT)))
> +    bb.warn(sorted(postinsts))
> +    for p in sorted(postinsts):
> +        bb.warn("Running postinst {}, output:\n{}".format(p, subproces=
s.check_output(p, shell=3DTrue, stderr=3Dsubprocess.STDOUT)))
>  =20
>   #
>   # Manifests here are complicated. The main sysroot area has the unpac=
ked sstate
> @@ -629,7 +630,7 @@ python extend_recipe_sysroot() {
>       for f in fixme:
>           staging_processfixme(fixme[f], f, recipesysroot, recipesysroo=
tnative, d)
>  =20
> -    for p in postinsts:
> +    for p in sorted(postinsts):
>           bb.note("Running postinst {}, output:\n{}".format(p, subproce=
ss.check_output(p, shell=3DTrue, stderr=3Dsubprocess.STDOUT)))
>  =20
>       for dep in manifests:
> diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclas=
s
> index a58f8287c9..924eeadf9c 100644
> --- a/meta/classes/useradd.bbclass
> +++ b/meta/classes/useradd.bbclass
> @@ -103,6 +103,18 @@ fi
>   }
>  =20
>   useradd_sysroot () {
> +	user_group_groupmems_add_sysroot user
> +}
> +
> +groupadd_sysroot () {
> +	user_group_groupmems_add_sysroot group
> +}
> +
> +groupmemsadd_sysroot () {
> +	user_group_groupmems_add_sysroot groupmems
> +}
> +
> +user_group_groupmems_add_sysroot () {
>   	# Pseudo may (do_prepare_recipe_sysroot) or may not (do_populate_sys=
root_setscene) be running
>   	# at this point so we're explicit about the environment so pseudo ca=
n load if
>   	# not already present.
> @@ -130,10 +142,19 @@ useradd_sysroot () {
>   		exit 0
>   	fi
>  =20
> -	# Add groups and users defined for all recipe packages
> -	GROUPADD_PARAM=3D"${@get_all_cmd_params(d, 'groupadd')}"
> -	USERADD_PARAM=3D"${@get_all_cmd_params(d, 'useradd')}"
> -	GROUPMEMS_PARAM=3D"${@get_all_cmd_params(d, 'groupmems')}"
> + 	# Add groups and users defined for all recipe packages
> +	if test "x$1" =3D "xgroup"; then
> +		GROUPADD_PARAM=3D"${@get_all_cmd_params(d, 'groupadd')}"
> +	fi
> +	if test "x$1" =3D "xuser"; then
> +		USERADD_PARAM=3D"${@get_all_cmd_params(d, 'useradd')}"
> +	fi
> +	if test "x$1" =3D "xgroupmems"; then
> +		GROUPMEMS_PARAM=3D"${@get_all_cmd_params(d, 'groupmems')}"
> +	fi
> +	if test "x$1" =3D "x"; then
> +		bbwarn "missing type of passwd db action"
> +    fi	=09
>  =20
>   	# Tell the system to use the environment vars
>   	UA_SYSROOT=3D1
> @@ -148,29 +169,26 @@ useradd_sysroot () {
>   EXTRA_STAGING_FIXMES +=3D "PSEUDO_SYSROOT PSEUDO_LOCALSTATEDIR LOGFIF=
O"
>  =20
>   python useradd_sysroot_sstate () {
> -    scriptfile =3D None
> -    task =3D d.getVar("BB_CURRENTTASK")
> -    if task =3D=3D "package_setscene":
> -        bb.build.exec_func("useradd_sysroot", d)
> -    elif task =3D=3D "prepare_recipe_sysroot":
> -        # Used to update this recipe's own sysroot so the user/groups =
are available to do_install
> -
> -        # If do_populate_sysroot is triggered and we write the file he=
re, there would be an overlapping
> -        # files. See usergrouptests.UserGroupTests.test_add_task_betwe=
en_p_sysroot_and_package
> -        scriptfile =3D d.expand("${RECIPE_SYSROOT}${bindir}/postinst-u=
seradd-${PN}-recipedebug")
> -
> -        bb.build.exec_func("useradd_sysroot", d)
> -    elif task =3D=3D "populate_sysroot":
> -        # Used when installed in dependent task sysroots
> -        scriptfile =3D d.expand("${SYSROOT_DESTDIR}${bindir}/postinst-=
useradd-${PN}")
> -
> -    if scriptfile:
> -        bb.utils.mkdirhier(os.path.dirname(scriptfile))
> -        with open(scriptfile, 'w') as script:
> -            script.write("#!/bin/sh -e\n")
> -            bb.data.emit_func("useradd_sysroot", script, d)
> -            script.write("useradd_sysroot\n")
> -        os.chmod(scriptfile, 0o755)
> +    for type, sort_prefix in [("group", "01"), ("user", "02"), ("group=
mems", "03")]:
> +        scriptfile =3D None
> +        task =3D d.getVar("BB_CURRENTTASK")
> +        if task =3D=3D "package_setscene":
> +            bb.build.exec_func(f"{type}add_sysroot", d)
> +        elif task =3D=3D "prepare_recipe_sysroot":
> +            # Used to update this recipe's own sysroot so the user/gro=
ups are available to do_install
> +            scriptfile =3D d.expand("${RECIPE_SYSROOT}${bindir}/" f"po=
stinst-useradd-{sort_prefix}{type}" "-${PN}")
> +            bb.build.exec_func(f"{type}add_sysroot", d)
> +        elif task =3D=3D "populate_sysroot":
> +            # Used when installed in dependent task sysroots
> +            scriptfile =3D d.expand("${SYSROOT_DESTDIR}${bindir}/" f"p=
ostinst-useradd-{sort_prefix}{type}" "-${PN}")
> +
> +        if scriptfile:
> +            bb.utils.mkdirhier(os.path.dirname(scriptfile))
> +            with open(scriptfile, 'w') as script:
> +                script.write("#!/bin/sh\n")
> +                bb.data.emit_func(f"{type}add_sysroot", script, d)
> +                script.write(f"{type}add_sysroot\n")
> +            os.chmod(scriptfile, 0o755)
>   }
>  =20
>   do_prepare_recipe_sysroot[postfuncs] +=3D "${SYSROOTFUNC}"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196031): https://lists.openembedded.org/g/openembed=
ded-core/message/196031
> Mute This Topic: https://lists.openembedded.org/mt/104509398/7304865
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
Qi.Chen@eng.windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


