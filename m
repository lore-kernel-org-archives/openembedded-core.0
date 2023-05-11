Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A63E2C7EE22
	for <webhook@archiver.kernel.org>; Thu, 11 May 2023 15:06:46 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.62336.1683817597540442388
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 May 2023 08:06:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=cpVcAzEQ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4495d4136c=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34BAdcBq032728
	for <openembedded-core@lists.openembedded.org>; Thu, 11 May 2023 08:06:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=content-type :
 message-id : date : subject : to : references : cc : from : in-reply-to :
 mime-version; s=PPS06212021;
 bh=ez5I3//0ld6/70qrMA7QYC+LaZRB5ybKg/l03E08xYA=;
 b=cpVcAzEQUJLgSaYVih+dVlC3iiksIewy3PEhZ8ixnWOVWKZJmjxChXZUaWKhrQznVHBx
 MyCy6rNu1dDls1XBq859ILOxjNiGVr4zW3mpUJ3UIlZ3QWQwwfnWdQM/tSceLYyizLpB
 Zt/d7YHTAw9OCfmEBdIW2jgAjYOScavJ+zB9s/Kxf0mOgjxBnO50OZkNnkHyEyOgEros
 VnTaieqYXcP3MPIKgajH5ALO/NW1bbahfQLGvqfvqao5mbe3Hu6/j0+82JXrlJ6LEJum
 2TdXjtnhV5ep/jYa7FA3sEpvhJPiEsnxROB1+Nb73SWMCBk4Geg47UZYgKxd8k+ZvYlP Lw== 
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qf7ucttff-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 11 May 2023 08:05:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DglU5OM4B/Xn8/Rf9Bs5uyyQc/g3LJbe0ZhCMUea6TSSn1aui4Uuhfg9vvp30Oh0ufPdxPy8KGhFrfoojvrxAr97synHFiECSD6YvsT4SHNH9AMAC1VY2hEvSVpWLfaIUMl86ysVckMlN0GplG0CCsjfC1CQqHl8DLa2A5rLSnzP0eMJmJ7LAeLfLVbLkhiOQoORMqdM0X8czL/gUTfchnH4Z0dYl4NiI3e0gWeKajkgx4ytS7kdIDomvYWBdC7I/soKdNgRsI6TmJQ3zGh8TPWlcPuzBf+2O0YuHmAk0nSrH81Mkd2vK5UOP5Yh3vfk+Zi8iV9oH/cEVcyJmHuW2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ez5I3//0ld6/70qrMA7QYC+LaZRB5ybKg/l03E08xYA=;
 b=PsE1No2pDav0rrZNqudowoJvrKEl+1/zZCZJvz3vEKNT96x8yfbnD4zuYQCy50uIJt6N6Uk+ka9P72UmqWE2zQfep45OS4WPkZ4ibBJ0bZDEekCSXsnWMfWKRBzk3ru7lza57/buvwD3m3zft+62amTxCToUD4Y6nnEqrjxGiP700P+/wgE+nw1xxu/0NAgbpCNqP/hdkSCH6p1SIPZlOFOrgqoVzjY5WnUstYkE7+gdBzxh/XTbNq+OJK/njsYJBrPToXyJ2qSL4g6kH+iFiDcQG4c3SE0yfMKrQ0yZdFLBfMrKt3CWK79da6UdogG/+BNP++s/G9zQOaf01OamSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by SJ2PR11MB8586.namprd11.prod.outlook.com (2603:10b6:a03:56e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.20; Thu, 11 May
 2023 15:05:46 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::1450:e2a0:f220:b6eb]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::1450:e2a0:f220:b6eb%5]) with mapi id 15.20.6363.032; Thu, 11 May 2023
 15:05:45 +0000
Content-Type: multipart/alternative;
 boundary="------------VBBBPCsJOjyXkGIewolseQsn"
Message-ID: <21615aa4-58d7-b635-b7e9-ad0195ec3dda@windriver.com>
Date: Thu, 11 May 2023 11:05:42 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [OE-core] [PATCH] vim: upgrade 9.0.1429 -> 9.0.1527
Content-Language: en-CA
To: openembedded-core@lists.openembedded.org
References: <175E1EC8C1126E05.14362@lists.openembedded.org>
Cc: "Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>,
        "Hemraj, Deepthi" <Deepthi.Hemraj@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <175E1EC8C1126E05.14362@lists.openembedded.org>
X-ClientProxiedBy: SJ0PR05CA0027.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::32) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|SJ2PR11MB8586:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e779190-ac4d-45dd-1a3c-08db52313288
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	IdIlH8+bv9dk8rFMGp2rQiZxvLHZVyAL8pD88KRD3ZUJ3uWJ+itLdgs1pX+jSPuBmp6YnzATuZSPOOIq8ZR7itjQRg/tPO4/ZpBkA+o67VacJVNRSDDdyPD+pTejD12OQligJVj2fS5GodASnUpcvFxUVwtsjcG6YEeOFsMoLe0aoxBtFEAGWaudd01vMXfmNvcGJ7hTsogz6HEQba7Nt8ymsXJT6iQ3XEAeTAOEkZFqe97MSYEseAYcvQwSJFZ7+x0ydyAqQZo8DV9BbO5/woVlc0uIhR+Ye6ue9GjIMmcKGlViohtcnppEiqaqsrn29AFr8Gsp9dccGgMb1peBhSuu3KfIYyzJgtuATK7AMPeQOzaL/7YH74BYwc1mKa14S1WsVezDnLSL3Pmut8sWJSQdX1ruOylbYeo0OeeMY/dUs4t0DPtFHWK4llAxZf6T80bkFWeIm8wm6Ch13qoFSO5v0tafsxhUpAA5eAhqFcOeK6lpjnruEBTbrU7hYwf1qkGpdHCJDXQThtIq2J0iPrRVHJI2Ace78iWOgt2A9El1CnNM0SNqW/mJVH8c4G4FuvNvWlsZutflN0FRXNIYTSZzkvROgDbm0c70HkG62GCI7GVqCXCKi1OI9kcNGf05bvSYdysN4CkVzO88xARCyjvIRsCYCu0zaugFqko4wWA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(136003)(396003)(376002)(346002)(366004)(451199021)(5660300002)(54906003)(31686004)(966005)(6486002)(6666004)(41300700001)(478600001)(33964004)(8676002)(8936002)(316002)(66899021)(53546011)(6512007)(26005)(6506007)(6916009)(66946007)(66476007)(66556008)(4326008)(107886003)(186003)(2906002)(83380400001)(2616005)(31696002)(166002)(86362001)(38100700002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NHA1TEZXOWNxMVlqSUQ3OXJsdUdFWmxoUEpOeTU1YnpCMVQzOS9yK1ZpN1Jv?=
 =?utf-8?B?UkxkdUVGa3p6cGc5ckNNa08zREtsVTdid01oYVNQSWVQenMwdUJaMUdYNkJq?=
 =?utf-8?B?RGhaTUV4MWxlLzB3WlVXeUp5Vk9RY3BkdXI5aE51OEVINk9JbG0wZE1zTmhF?=
 =?utf-8?B?VE01QTBtSEF4RFNzMG0zRGRlYVFTZ3FaNnNpUkhhOStTYUpCYlVEZUE0aDh4?=
 =?utf-8?B?Zlg5OCs0NWsvbXVoZXR3L1FDNUNib0tXVm5DM1dJekNpZ0R1WVpNT3k5bC93?=
 =?utf-8?B?YmVIM3FxZFJmaWlueTc0WHVRbVB3V2F3b3owT3BBV0JZOUdudG1scjJMczZy?=
 =?utf-8?B?aXYwcFczUVNLRkJSYUhMWjBhSjJyZE5zMHh2TTR5b0p6eUNYUmRnQWRYQ3Z4?=
 =?utf-8?B?S2JibWk1UjBTZ01ybTBTSW1GRU9mMFpZTm1pOVlTVWhmeEdZTGxGR3p5N0lj?=
 =?utf-8?B?SEhuelNacjhnR1RlU3lpQXpMZEJ1U1hTVkpscTJkVUJ4aTdVV0hDSTJkdUxJ?=
 =?utf-8?B?TXp2Sy9NZDd6OEpVd2ltWXZsSWpONHc0Q3IzUmVOK0RsclUxLy9wUkF2ajMy?=
 =?utf-8?B?Y1BoTUZFN2IvUmUxS3g0VTBlQTlhNEwxRjBZZk5zT04xMWE3Uml4ZHd6bjhj?=
 =?utf-8?B?T2tSdUIxTE9rNmNna09EUzQzREdBMjFQcWFjZGFmRmpTRWR3bGk3WEtUUnBs?=
 =?utf-8?B?dVZKa3dNU2dXYmRFY09tMzVvUnVCaUcwWnBNM0RXUThuYitWWFkvODdOZkZJ?=
 =?utf-8?B?UUVwdnRlVCtzSlkwakt4TitPMjRyK1IvWWxtVVBBelBlcGw1NDhCMkliRnNm?=
 =?utf-8?B?Zk1VREE1a0dsbUlCWnE2Vi9vZmQ2OUhpSyt4cWJoVHJES3NkV1U1MDJQeEZt?=
 =?utf-8?B?b3BVZEs0U01xcXJ4dzZpcnhXYmlJMjBlbHBQdEp1Tlc5YTZTZGVCS1k0SUVV?=
 =?utf-8?B?TmVKOFl3ZFVyU0dNcGdnYUNQUDk1alZUVDROdFQzalBFY24vN1VMdlBweDJV?=
 =?utf-8?B?b0EzK1FPZnMzWHhzYkp6RUVZN0ZDMFlEaG4wRUhvZTVMT2p0d0llbU1ZQzFK?=
 =?utf-8?B?QkZSejdnT3JiRVhmWmdjb005QjBUOE9TaUZXM1lkd2dXVnhpRzEyMkRLT2Iy?=
 =?utf-8?B?anpHb3Q3QlhrWUdGKzhaVkUzbzNtaVN1QjBydThkY0UvMTdHSkNEaFdudGZm?=
 =?utf-8?B?Si9UU3NEdTY2NkxwSStUSHJtNENuK3NaSlN1ZCs3VnZSK2NFVVR1ellwUlhi?=
 =?utf-8?B?cnNQZU9zMFgvaHk4VlBlQ2IwRnVaVWVvbXlRUzdTdTJici9pYm5PMXJkdDZl?=
 =?utf-8?B?K0M1V3JZL3pkMzdKb0hXVEV6YU9tczBsMENlb0xqRWIyb0hPN2NZYWpDRTFW?=
 =?utf-8?B?b0xIUmhJOHMzbWdnTWxuQVhKSWdaOGJ3bnZYRklIdXFNei9NSWwrV2xCRHRE?=
 =?utf-8?B?TUE4dU9Ja0lDaSt2RWpVOUkrakhiZ2RQOVoyNTBpOGorWEo5Mk1Xd0h2VEw4?=
 =?utf-8?B?Z2pJNFZXR0paRlN6cFk2Nkp2ZTB1OWhsOVFJYzNyZTlPZWQ3cTltM294Njc4?=
 =?utf-8?B?M0p1TGZFMEVqN3JidUZrY3h2YnNReXpHSUNEUDVSTnhtQ09RWkUrSE9UQzlE?=
 =?utf-8?B?RjhmbjJiWE5sQWRHOERqcGRXOWdTdDJ5OEFqWTQ3ejJlamZpb3NQOHJ3T0dU?=
 =?utf-8?B?Ny9ha0FXOWpUWmtLcDQxV21rZkJ5bGljL3EwaDNlUE84MVREbGtEWE9nZmxt?=
 =?utf-8?B?dE1yZm5mUjZsL0duNmo5VFBDSWpkUnVDeGtkeGpaUGxMWXdMVHVXVFdEODV3?=
 =?utf-8?B?cWdiamFpZUgrdHhqZkIzQmZmMEVPdnVHUlY0aTJ1MnJLeTdqT3o2MVhHNHFw?=
 =?utf-8?B?Kzh4MzYzbG9OZlRWRjdpQU5CcUJzZ29RWktWQ3lnc2VmMlVONElxYm5ET3RW?=
 =?utf-8?B?cWVKVmVtZTFuRzRMWTNGaFdOZVVmVTdvTEsycklpVkcwcWxteUIwVnNGVDM2?=
 =?utf-8?B?THVRNDVnb0VkTTBpR09ZVWlNdXBZYmp3RSt5cHliS1hMT0wzT3RFL0swb2Qv?=
 =?utf-8?B?RzZFMDVoMTdJVzJDdXJ6VDl2Sll2K1NOdGUyRDhDbHlvTnMxdldaUnFWK2JI?=
 =?utf-8?B?dzFzUy8xYnByd3hRa3VROXlGN1MrWU1LM1dNbllBMEQ5cjFIbzhTS0dCMmQv?=
 =?utf-8?B?VkE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e779190-ac4d-45dd-1a3c-08db52313288
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 15:05:45.9220
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A3nw3FYDK3JTmZpMkc5eOoOpcGZ/5eC6VHMEB/w7UlItNsIa2l/i67QIkJavUhw3gIbNiY+Kd5pXVphtlqyhdo+0ctrgjYOYogEVCEECabU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8586
X-Proofpoint-GUID: D8mlzf3SpwY664I57_rmUizzJ5BZt0h6
X-Proofpoint-ORIG-GUID: D8mlzf3SpwY664I57_rmUizzJ5BZt0h6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-11_12,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 mlxlogscore=650 spamscore=0 adultscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305110131
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 May 2023 15:06:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181138

--------------VBBBPCsJOjyXkGIewolseQsn
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 34BAdcBq032728

On 2023-05-11 10:59, Randy MacLeod via lists.openembedded.org wrote:
> Fixes:https://nvd.nist.gov/vuln/detail/CVE-2023-2426
> caf642c25 patch 9.0.1499: using uninitialized memory with fuzzy matchin=
g
>
> Signed-off-by: Randy MacLeod<Randy.MacLeod@windriver.com>
> ---
>   meta/recipes-support/vim/vim.inc | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vi=
m/vim.inc
> index 1e27415288..e1d2563316 100644
> --- a/meta/recipes-support/vim/vim.inc
> +++ b/meta/recipes-support/vim/vim.inc
> @@ -19,8 +19,8 @@ SRC_URI =3D "git://github.com/vim/vim.git;branch=3Dma=
ster;protocol=3Dhttps \
>              file://no-path-adjust.patch  \
>              "
>  =20
> -PV .=3D ".1429"
> -SRCREV =3D "1a08a3e2a584889f19b84a27672134649b73da58"
> +PV .=3D ".1527"
> +SRCREV =3D "c28e7a2b2f23dbd246a1ad7ad7aaa6f7ab2e5887"

I noticed that qemuppc failed to build (1) and
bisected that back to:

 =C2=A0=C2=A0 fa72b850b1 gcc: upgrade 11.3 -> 12.1
from April 2022.

Tracked by:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15116

../Randy


1)

=E2=9D=AF cat vim-buildall.log
BUILDALL-QEMU LOG FOR vim
START TIME: 2023-05-08_17:41:29
HOSTNAME: ala-lpggp3
HOST OS: Ubuntu 22.04.1 LTS
HOST KERNEL: 5.15.0-56-generic
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
BUILD RESULTS:
[glibc]
PASS: qemuriscv32
PASS: qemuarmv5
PASS: qemumips
PASS: qemux86-64
PASS: qemuarm64
PASS: qemumips64
PASS: qemuarm
FAIL: qemuppc
PASS: qemuriscv64
PASS: qemuppc64
PASS: qemux86
FAIL: qemuloongarch64
[musl]
FAIL: qemuriscv32
PASS: qemuarmv5
PASS: qemumips
PASS: qemux86-64
PASS: qemuarm64
PASS: qemumips64
PASS: qemuarm
PASS: qemuppc
PASS: qemuriscv64
PASS: qemuppc64
PASS: qemux86
FAIL: qemuloongarch64
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
PASSED: 20
FAILED: 4

>  =20
>   # Remove when 8.3 is out
>   UPSTREAM_VERSION_UNKNOWN =3D "1"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#181137):https://lists.openembedded.org/g/openembedd=
ed-core/message/181137
> Mute This Topic:https://lists.openembedded.org/mt/98829205/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [=
randy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------VBBBPCsJOjyXkGIewolseQsn
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 34BAdcBq032728

<html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2023-05-11 10:59, Randy MacLeod via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:175E1EC8C1126E05.14362@lists.op=
enembedded.org">
      <pre class=3D"moz-quote-pre" wrap=3D"">Fixes: <a class=3D"moz-txt-l=
ink-freetext" href=3D"https://nvd.nist.gov/vuln/detail/CVE-2023-2426">htt=
ps://nvd.nist.gov/vuln/detail/CVE-2023-2426</a>
caf642c25 patch 9.0.1499: using uninitialized memory with fuzzy matching

Signed-off-by: Randy MacLeod <a class=3D"moz-txt-link-rfc2396E" href=3D"m=
ailto:Randy.MacLeod@windriver.com">&lt;Randy.MacLeod@windriver.com&gt;</a=
>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/=
vim.inc
index 1e27415288..e1d2563316 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -19,8 +19,8 @@ SRC_URI =3D &quot;git://github.com/vim/vim.git;branch=3D=
master;protocol=3Dhttps \
            <a class=3D"moz-txt-link-freetext" href=3D"file://no-path-adj=
ust.patch">file://no-path-adjust.patch</a> \
            &quot;
=20
-PV .=3D &quot;.1429&quot;
-SRCREV =3D &quot;1a08a3e2a584889f19b84a27672134649b73da58&quot;
+PV .=3D &quot;.1527&quot;
+SRCREV =3D &quot;c28e7a2b2f23dbd246a1ad7ad7aaa6f7ab2e5887&quot;</pre>
    </blockquote>
    <p>I noticed that qemuppc failed to build (1) and<br>
      bisected that back to:</p>
    <p>&nbsp;&nbsp; fa72b850b1 gcc: upgrade 11.3 -&gt; 12.1<br>
      from April 2022. <br>
    </p>
    <p>Tracked by:<br>
      <a class=3D"moz-txt-link-freetext" href=3D"https://bugzilla.yoctopr=
oject.org/show_bug.cgi?id=3D15116">https://bugzilla.yoctoproject.org/show=
_bug.cgi?id=3D15116</a></p>
    <p>../Randy</p>
    <p><br>
    </p>
    <p>1)</p>
    <pre class=3D"bz_comment_text" id=3D"comment_text_1">=E2=9D=AF cat vi=
m-buildall.log=20
BUILDALL-QEMU LOG FOR vim
START TIME: 2023-05-08_17:41:29
HOSTNAME: ala-lpggp3
HOST OS: Ubuntu 22.04.1 LTS
HOST KERNEL: 5.15.0-56-generic
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
BUILD RESULTS:
[glibc]
PASS: qemuriscv32
PASS: qemuarmv5
PASS: qemumips
PASS: qemux86-64
PASS: qemuarm64
PASS: qemumips64
PASS: qemuarm
FAIL: qemuppc
PASS: qemuriscv64
PASS: qemuppc64
PASS: qemux86
FAIL: qemuloongarch64
[musl]
FAIL: qemuriscv32
PASS: qemuarmv5
PASS: qemumips
PASS: qemux86-64
PASS: qemuarm64
PASS: qemumips64
PASS: qemuarm
PASS: qemuppc
PASS: qemuriscv64
PASS: qemuppc64
PASS: qemux86
FAIL: qemuloongarch64
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
PASSED: 20
FAILED: 4</pre>
    <p></p>
    <blockquote type=3D"cite" cite=3D"mid:175E1EC8C1126E05.14362@lists.op=
enembedded.org">
      <pre class=3D"moz-quote-pre" wrap=3D"">
=20
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN =3D &quot;1&quot;
</pre>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre class=3D"moz-quote-pre" wrap=3D"">-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#181137): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/181137">https:/=
/lists.openembedded.org/g/openembedded-core/message/181137</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/98829205/3616765">https://lists.openembedded.org/mt/=
98829205/3616765</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------VBBBPCsJOjyXkGIewolseQsn--

