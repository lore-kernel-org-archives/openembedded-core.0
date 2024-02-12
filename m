Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35315C4829E
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 19:49:21 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.16430.1707767357817305454
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Feb 2024 11:49:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=HphA0wl4;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2772da6af1=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41CC743n009965
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 19:49:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:cc:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=49NaZqjo37UISPb2vzJ
	jx2WWq5T1jfje4eiooIppZIc=; b=HphA0wl4TLwx3xAvLauoPtTx7zMKw6ZXv2q
	Uj6AA7VQOR4uPgydnqKgG79ybq/VBpGCymzZhPV/n9hSFfxguPqHl8FZiUThGH2B
	V1iVDgbe74ZjcvBaau4lUAWkK0VvWcgc9S9Q7ZHf07Hy6S2+TzEm1irYRxH82Ieb
	Z6VY/A/oiae4zt66Ra+cpexggMIa38K7Sk863NQCcw0LJPOojGhXWnLU5PUUIIRr
	3vmmbbmhMz4V8Eb11oyNhXspH/8NfLVuGXv4SeGjlChXmCCZyuSAFjt8n2QkRxGn
	rFpB9qe8MJTPqeDw3m/D/6/8Kcxq32kB+9NfX+MTnJ7f5Zd0f5A==
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2040.outbound.protection.outlook.com [104.47.73.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3w5xbxt1qx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 19:49:16 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IKLeDcSlSHNKs3CoaE0tIFNOfLNMhnrHd75Nf4Oo9Ru/tsGaWFvsLhMgXSQTQvyYdhbYt1afFkrvKDrURPJAFAr+Lhd1IpcT+piPDegPMKoaheIsYmH7O+a+4jzzq9zBX/lYdio1H/Yc42ttvdKP4wEVeT4ZwDoaRyEJ3H7fBIk7IrNOc2cR3Obic6U5Foih6P7TGFDqL6uxJdYfSldEAsXeE49TZsUkMJuLUr1/o10npnf2B8h7NuIlxK9yp1wvjjC+sNDwp+hOLM0koshQ9R07dZdI01O36dlESrUY72bHbrNR8Krx/BlIWoUELZ4Fb6N3MGo+LeJeUUqGZNNudg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=49NaZqjo37UISPb2vzJjx2WWq5T1jfje4eiooIppZIc=;
 b=ez/dWZ4LVP00D0tKq9g1R49h32feVsomps41ptW9dq2nnbqggjTc2P0OBZjLKBXJ9YIiI58HSpDT5qRhFtY/z7JDZyP78bbwhubQg3UgA19EwYDlt2bunfKu6oo8EFrW/viYc+Bm4hGUQ4dNpG62d4hQ9SEa/XkXGUdPlCOtnHYr+hYDLA1/o37d4hlu2U6nTx2C7SaQFnLHdYaDONtBTgQCfCiuENxvrGfodOgP0DMD8dQOXHLwbPBWjBlYMD6uAbLTy9KwGd2i9bupj4pgz0Ann72d32usCZGEv1ILZmFLLJryzUzDTy8BCl5fVIxN22dyY4bNIy1VqGG4NuHh4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5920.namprd11.prod.outlook.com (2603:10b6:a03:42e::9)
 by DS0PR11MB7682.namprd11.prod.outlook.com (2603:10b6:8:dc::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.38; Mon, 12 Feb
 2024 19:49:12 +0000
Received: from SJ0PR11MB5920.namprd11.prod.outlook.com
 ([fe80::f3ba:ff33:12be:cff7]) by SJ0PR11MB5920.namprd11.prod.outlook.com
 ([fe80::f3ba:ff33:12be:cff7%7]) with mapi id 15.20.7270.036; Mon, 12 Feb 2024
 19:49:11 +0000
Content-Type: multipart/alternative;
 boundary="------------BJ8x2Eu2fyKYHVFbke4CVjWK"
Message-ID: <df3c6eb1-2cec-490f-bb89-e06de070b62c@windriver.com>
Date: Mon, 12 Feb 2024 14:49:08 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gcc: Add riscv64 as a compatible host to gcc-sanitizers
Content-Language: en-CA
To: Deepthi.Hemraj@windriver.com, openembedded-core@lists.openembedded.org,
        "Ramasamy, Rajeshkumar" <Rajeshkumar.Ramasamy@windriver.com>,
        "Hao, Kexin" <Kexin.Hao@windriver.com>
Cc: Umesh.Kalappa@windriver.com, Naveen.Gowda@windriver.com,
        Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com
References: <20240212110000.1687187-1-Deepthi.Hemraj@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20240212110000.1687187-1-Deepthi.Hemraj@windriver.com>
X-ClientProxiedBy: SJ2PR07CA0006.namprd07.prod.outlook.com
 (2603:10b6:a03:505::18) To SJ0PR11MB5920.namprd11.prod.outlook.com
 (2603:10b6:a03:42e::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5920:EE_|DS0PR11MB7682:EE_
X-MS-Office365-Filtering-Correlation-Id: ba504e5a-198c-4456-d4f2-08dc2c03af3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JD9FO2GAZ4iYXE0YndvYMOdeekUZ92H6LWk67HFnufAtkJLMReaFET7aRmFCQcvD24fgZDimry45sW5Z6v3+kD+v3/6PoiESF0+pL6FE0A/byJi1HYcZo01ll7TFQyEPCrxRqi9QoUw++pvw06Hp9t/IDR1r5wPyNC92CL1nDZQ0oasyHX/AMQX42i+nP7hygvc8Z+gZS/jH24O/GBa1BCV0+fVWhI6qZOjZVTZyhPlVTW8+YJt5HN3/Ju2Dvl0yVTODEngIduCMn6EAr6DiBcfFgbEk/MOjhMCkeiWIOroiJfoej6KJHdffp3gTPtn9gI4qSH2kX24zKNSxV05aFUgiKqzWkcyUfJ03qYd3+ImoCLBuaE/FbG1sIgenr+d5tYWqKgs5MAvPDd88YX+9EONnn0Uu68wu/nGqD1fz3VhooTzuTpLrRSkOF4P9DzM9oxmMcTd9tRJSqBtlM3jKt2qtySZm/9dTI5ips91kqMyyop+0pEF25aTtDmKfNS7S2EQ6qixb8NaJEYF1iIYBpLcjhuRf4QhitWC/pRhoR0w=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5920.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(396003)(346002)(39850400004)(366004)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(36756003)(4326008)(26005)(2616005)(107886003)(478600001)(41300700001)(8676002)(83380400001)(66946007)(66556008)(66476007)(8936002)(5660300002)(6636002)(33964004)(110136005)(53546011)(316002)(6506007)(6486002)(6666004)(31696002)(6512007)(86362001)(38100700002)(166002)(2906002)(31686004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MjR1ZUJNa0VKajMrUkU2d2JyS0wvNmpKM0VsSGE4QkNTR2swMzFUeERWQ3VY?=
 =?utf-8?B?N3dIbjJuU1FPYXJXNmNLcXhtSFMyRy9DVHV1TnJ4VEw4d3JHKzY4aStBd3l2?=
 =?utf-8?B?WTB3eVFxbDdSRzl4UkdZYWoxR3l5elZYdWxUTlRZWE5SVEdLemp3c3FpU1Fy?=
 =?utf-8?B?RDNieGJ3UStkeUxyU01JRVdUSnJwWjZ3M2pWU2hmc1dncURLbVc1MzZGRGw4?=
 =?utf-8?B?SGRXTDBZZys3eGV3VVFzUnZKeGFsMUI4QXlYNmUyQUo3ciswWXVQZ05BVml0?=
 =?utf-8?B?SGpDNTdUWTRaTzZuWmQrbzVncnpnbmZlZFNod3plMHhOQk1Bd1paVTcxVkty?=
 =?utf-8?B?Mlg2blZVQnhlQVNBL1FqZkF5cjVobU80eXNDVHBTa2NuaUgwcTZjSFRkSkx0?=
 =?utf-8?B?Q3FQUWxvTzBQdWl6UFM3OXE1Y3RyaUVLU0dodHF3Y1VFdmxzS0luTlJzWm1U?=
 =?utf-8?B?TlRnVHkzSmt5SnNYT1RHb0NXdk9HaCtmMWJERDVlQnRIQ2tpeXcrbWFNbE9K?=
 =?utf-8?B?UmZXZGExVGVwMGtUaEVURXBmWEhkdGtRelhicWtTcmRYUnY4ZzIwK1hmNmNp?=
 =?utf-8?B?eTVQaExhZWNXNnBwYWhaSlhocnpkL2I5NkFtelhWc08wUTlaUU1EMGFzR3Nz?=
 =?utf-8?B?U2JqWkpDMSsreFNGa3BpMENUeU9ldHg1TWl1QnhQKzM0eWwwc2lxVGMvYXRm?=
 =?utf-8?B?a2krdUcrNjdxZ1p5WWxqUk5aTXVzYk1jc3RMdnZpYlEvek8zYm8zYjc3UEFr?=
 =?utf-8?B?SEZJV2pXUFZ3R2pSakdseDBXbnFDZU5FWGNuTjgxamNnNitJeEVzbkhMZm55?=
 =?utf-8?B?ZmZUQXJIeWRWVU9yL3JBd1g4VGFvTGRXYVlhMnVPdkdDclFnTHFuMjBlOXVW?=
 =?utf-8?B?MlpzOCtrelBJclkvVjc0LzZkaXM1ampjaTkreXZ4Q04vYVV0MXJmV3Q3WDg0?=
 =?utf-8?B?Z0NuZmVHV2xXSWlwbzRvNngxZ2V4NEFGTkJzb3RQcnRrZEYveDNJZ2c5TlNB?=
 =?utf-8?B?Y3cvK29Ha3NVNWVhSDBSSjdhOW96Wk1mTkxRd29zeGlhNGlLMitZQ1o1cDhH?=
 =?utf-8?B?bDh4ZUhsWG9UUStXR2h2SFJLMnhKZ0I1NEVZTHR3VHdWZVFSQ284cm1veWVF?=
 =?utf-8?B?YWVuZ2tFYWoyUG4wNGczNzlvUGZSQW1FWWUxbDFpVWN0WENuWGFGNTc4aVo2?=
 =?utf-8?B?bm05L0VTWVBHZFdnZ3QrNk9XZzFJK09hM0FCZndqZFYzWVg3SDhpNFBzdVVG?=
 =?utf-8?B?NVVTV3BrV3ZmUU54OTd5Y2IxVnpyYTlHWnZzNTJsVHVDbk91MWsya1AwMFVq?=
 =?utf-8?B?WTJGZldsTXYrbGRwZzBYRHNBeVAxOHpFb1NTZFVaT2RmSlZjVWF0RitZbU1D?=
 =?utf-8?B?NFdjRTJPS0laOHp3WHhXRm5FcXd1T21ySVZhVmlGRVFuUXczdUVKbkZTZFpN?=
 =?utf-8?B?VE1aekdHcWdGVXZ5N203SkhyOFBMek42TU9ET1pmbVNpbjZjRUVkSWtMbVFT?=
 =?utf-8?B?TmFKTDRtMm9wRTRkamxNMzlSOExhdk5kQmR5a2QwUHpCZHJObFJacWtWRGJW?=
 =?utf-8?B?aEgxSktVVktYL1g2eVgrMDV1WXFyc254RzBOSUJtRzV6SlJmemZOYjU4V1hk?=
 =?utf-8?B?RS9IdzNYTFVOZzRLbTg1ZXVzMVFjYTE3c1ppMkthWHgwZ09rMkNIK3JEY1RJ?=
 =?utf-8?B?azRweG1YaUhrczdQY1pIQmsrL25abnlWVGZQaHdvZDU2QjBOTE5xL0lVTUtL?=
 =?utf-8?B?VW1ka25MbTBJcDl2V0cyTGFhdnpOczVvclVWMXJZOW5lcWpNTTMvTXMzQmZY?=
 =?utf-8?B?MEVaODlYUHM2ZjRyTCtkbG84ZFEvRklQcW9NUVZsMjBaYjFmQ3FYaUsvb3d2?=
 =?utf-8?B?UktESklXUVBMVjZra0JBZktvdEF3RS9SVG91L0owdDJDWjZEQ2Y3eVF6bnNu?=
 =?utf-8?B?MkJDZThJem5PQzVUYjFtTElseTV3R3VGVGFvaTRlUDVXSFduNnljdWluZDAw?=
 =?utf-8?B?aWNCSHFmWlVHTjdFWHRQcUxhQ281cHd2NnJKZnlQaXZ1STl5TW12V1lBMFJm?=
 =?utf-8?B?cFpoeHFZdWpRTGdYeVd5QXVxblJRSUZQOXdWUzhiMThQUGsybXhZYTkvQ0NF?=
 =?utf-8?B?amhPRFhGdUZZZDcrQjhyNTRwQmJ6bThjbWxGRXhaVnBoeENhS2hJbm9zV0FO?=
 =?utf-8?B?amc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba504e5a-198c-4456-d4f2-08dc2c03af3d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5920.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2024 19:49:11.8566
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JJ0sR+m8iXdgZvmP4G1GHAEJYECsXuxGakjWyUmAlYQ0f8YbI1MrqrZg7HOMrnMb7sZlHOHJ966quyjhvjsbazRjSTmwsBKGWT+9QnTdMn4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7682
X-Proofpoint-ORIG-GUID: DJvVZXdlfuITOjq9sQsTONjdXA4Nyigg
X-Proofpoint-GUID: DJvVZXdlfuITOjq9sQsTONjdXA4Nyigg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-12_16,2024-02-12_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 phishscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402120152
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 19:49:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195359

--------------BJ8x2Eu2fyKYHVFbke4CVjWK
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 41CC743n009965

On 2024-02-12 6:00 a.m., Deepthi.Hemraj@windriver.com wrote:
> From: Deepthi Hemraj<Deepthi.Hemraj@windriver.com>
>
> The issue address-sanitizer check failure arises when attempting to run=
 a testcase compiled with AddressSanitizer on RISC-V 64 systems using the=
 SV48 and SV57 virtual address scheme.
> This error occurs due to the lack of support for SV48 and SV57 in ASAN,=
 which was originally designed for SV39 in Riscv64 architecture.
> This patch disables SV48 and SV57 support in QEMU and modifying the ker=
nel to use SV39 by default.


Deepthi,

Thanks for looking into the gcc-sanitizers feature for qemuriscv64.

I'm not sure if we want to make the qemu change that you have proposed an=
d
since no one else has replied, I've looped in Kevin and Raj who may be=20
able to
comment on the change.

Oh, in reading over the comments to the issue linked below, I see:
 =C2=A0 "As a temporary workaround for this problem"

so I really doubt we want to make this change. Changing thevirtual=20
address range for qemu is not to be undertaken lightly!

Let's see what we hear from Kevin, Raj and upstream qemu over the coming=20
week or two.

To me, this is a '(very) nice to have' feature not a 'must have feature'
so if we have to wait until after Yocto-5.0, that's fine.

>
> Upstream-Status: Backport [https://github.com/google/sanitizers/issues/=
1707]

s/Backport/Submitted/

as you have done below in the patch body.


Only commits merged to supported branches or master/main, should be=20
labelled as back-ports

Thanks,

../Randy

`

> Signed-off-by: Deepthi Hemraj<Deepthi.Hemraj@windriver.com>
> ---
>   meta/recipes-devtools/gcc/gcc-sanitizers.inc  |  3 ++-
>   meta/recipes-devtools/qemu/qemu.inc           |  1 +
>   ...isable-sv48-sv57-support-for-riscv64.patch | 25 ++++++++++++++++++=
+
>   3 files changed, 28 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-devtools/qemu/qemu/disable-sv48-sv57-=
support-for-riscv64.patch
>
> diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers.inc b/meta/recipe=
s-devtools/gcc/gcc-sanitizers.inc
> index 524ebd4ba4..8c98e9cf8a 100644
> --- a/meta/recipes-devtools/gcc/gcc-sanitizers.inc
> +++ b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
> @@ -73,13 +73,14 @@ RRECOMMENDS:${PN}:append:x86 =3D " liblsan"
>   RRECOMMENDS:${PN}:append:x86-64 =3D " liblsan libtsan"
>   RRECOMMENDS:${PN}:append:powerpc64 =3D " liblsan libtsan"
>   RRECOMMENDS:${PN}:append:aarch64 =3D " liblsan libtsan"
> +RRECOMMENDS:${PN}:append:riscv64 =3D " liblsan libtsan"
>  =20
>   do_package_write_ipk[depends] +=3D "virtual/${MLPREFIX}${TARGET_PREFI=
X}compilerlibs:do_packagedata"
>   do_package_write_deb[depends] +=3D "virtual/${MLPREFIX}${TARGET_PREFI=
X}compilerlibs:do_packagedata"
>   do_package_write_rpm[depends] +=3D "virtual/${MLPREFIX}${TARGET_PREFI=
X}compilerlibs:do_packagedata"
>  =20
>   # Only x86, powerpc, sparc, s390, arm, aarch64 and loongarch64 are su=
pported
> -COMPATIBLE_HOST =3D '(x86_64|i.86|powerpc|sparc|s390|arm|aarch64|loong=
arch64).*-linux'
> +COMPATIBLE_HOST =3D '(x86_64|i.86|powerpc|sparc|s390|arm|aarch64|loong=
arch64|riscv64).*-linux'
>   # musl is currently broken entirely
>   COMPATIBLE_HOST:libc-musl =3D 'null'
>  =20
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtool=
s/qemu/qemu.inc
> index 2a81870151..56c988e7fd 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -36,6 +36,7 @@ SRC_URI =3D"https://download.qemu.org/${BPN}-${PV}.ta=
r.xz \ file://fix_segv.patch=20
> \ file://qemu-guest-agent.init \ file://qemu-guest-agent.udev \ +=20
> file://disable-sv48-sv57-support-for-riscv64.patch \ "
>   UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
>  =20
> diff --git a/meta/recipes-devtools/qemu/qemu/disable-sv48-sv57-support-=
for-riscv64.patch b/meta/recipes-devtools/qemu/qemu/disable-sv48-sv57-sup=
port-for-riscv64.patch
> new file mode 100644
> index 0000000000..7f3eab1463
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/disable-sv48-sv57-support-for-ris=
cv64.patch
> @@ -0,0 +1,25 @@
> +From: Deepthi Hemraj
> +Date: thur, 18 jan 2024 17:52:45
> +Subject: disable-sv48-sv57-support-for-riscv64
> +
> +Disabling  48 & 57 bit virtual memory address in a RISC-V program, whi=
le the system's upper address limit resembles that of a 39-bit address sp=
ace.
> +This signals a lack of support for the 48 & 57 bit virtual address spa=
ce on RISC-V; only the SV39 scheme is supported.
> +
> +Upstream-Status: Submitted [https://github.com/google/sanitizers/issue=
s/1707]
> +Signed-off-by: Deepthi Hemraj<Deepthi.Hemraj@windriver.com>
> +
> +---
> +
> +diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> +--- a/target/riscv/csr.c
> ++++ b/target/riscv/csr.c
> +@@ -1178,7 +1178,7 @@ const bool valid_vm_1_10_64[16] =3D {
> +     [VM_1_10_MBARE] =3D true,
> +     [VM_1_10_SV39] =3D true,
> +-    [VM_1_10_SV48] =3D true,
> +-    [VM_1_10_SV57] =3D true
> ++    [VM_1_10_SV48] =3D false,
> ++    [VM_1_10_SV57] =3D false
> + };
> +
> + /* Machine Information Registers */


--=20
# Randy MacLeod
# Wind River Linux

--------------BJ8x2Eu2fyKYHVFbke4CVjWK
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2024-02-12 6:00 a.m.,
      <a class="moz-txt-link-abbreviated" href="mailto:Deepthi.Hemraj@windriver.com">Deepthi.Hemraj@windriver.com</a> wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240212110000.1687187-1-Deepthi.Hemraj@windriver.com">
      <pre class="moz-quote-pre" wrap="">From: Deepthi Hemraj <a class="moz-txt-link-rfc2396E" href="mailto:Deepthi.Hemraj@windriver.com">&lt;Deepthi.Hemraj@windriver.com&gt;</a>

The issue address-sanitizer check failure arises when attempting to run a testcase compiled with AddressSanitizer on RISC-V 64 systems using the SV48 and SV57 virtual address scheme.
This error occurs due to the lack of support for SV48 and SV57 in ASAN, which was originally designed for SV39 in Riscv64 architecture.
This patch disables SV48 and SV57 support in QEMU and modifying the kernel to use SV39 by default.</pre>
    </blockquote>
    <p><br>
    </p>
    <p>Deepthi,</p>
    <p>Thanks for looking into the gcc-sanitizers feature for
      qemuriscv64.</p>
    <p>I'm not sure if we want to make the qemu change that you have
      proposed and<br>
      since no one else has replied, I've looped in Kevin and Raj who
      may be able to<br>
      comment on the change.</p>
    <p>Oh, in reading over the comments to the issue linked below, I
      see:<br>
      &nbsp; &quot;As a temporary workaround for this problem&quot;&nbsp;</p>
    <p>so I really doubt we want to make this change. Changing the<span style="white-space: pre-wrap"> virtual address range for qemu is
not to be undertaken lightly!
</span></p>
    <p>Let's see what we hear from Kevin, Raj and upstream qemu over the
      coming week or two.<br>
    </p>
    <p>To me, this is a '(very) nice to have' feature not a 'must have
      feature' <br>
      so if we have to wait until after Yocto-5.0, that's fine.<br>
    </p>
    <p></p>
    <blockquote type="cite" cite="mid:20240212110000.1687187-1-Deepthi.Hemraj@windriver.com">
      <pre class="moz-quote-pre" wrap="">

Upstream-Status: Backport [<a class="moz-txt-link-freetext" href="https://github.com/google/sanitizers/issues/1707">https://github.com/google/sanitizers/issues/1707</a>]</pre>
    </blockquote>
    <p>s/Backport/Submitted/</p>
    <p>as you have done below in the patch body.</p>
    <p><br>
    </p>
    <p>Only commits merged to supported branches or master/main, should
      be labelled as back-ports <br>
    </p>
    <p>Thanks,<br>
    </p>
    <p>../Randy</p>
    <p>`<br>
    </p>
    <blockquote type="cite" cite="mid:20240212110000.1687187-1-Deepthi.Hemraj@windriver.com">
      <pre class="moz-quote-pre" wrap="">
Signed-off-by: Deepthi Hemraj <a class="moz-txt-link-rfc2396E" href="mailto:Deepthi.Hemraj@windriver.com">&lt;Deepthi.Hemraj@windriver.com&gt;</a>
---
 meta/recipes-devtools/gcc/gcc-sanitizers.inc  |  3 ++-
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 ...isable-sv48-sv57-support-for-riscv64.patch | 25 +++++++++++++++++++
 3 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu/disable-sv48-sv57-support-for-riscv64.patch

diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers.inc b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
index 524ebd4ba4..8c98e9cf8a 100644
--- a/meta/recipes-devtools/gcc/gcc-sanitizers.inc
+++ b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
@@ -73,13 +73,14 @@ RRECOMMENDS:${PN}:append:x86 = &quot; liblsan&quot;
 RRECOMMENDS:${PN}:append:x86-64 = &quot; liblsan libtsan&quot;
 RRECOMMENDS:${PN}:append:powerpc64 = &quot; liblsan libtsan&quot;
 RRECOMMENDS:${PN}:append:aarch64 = &quot; liblsan libtsan&quot;
+RRECOMMENDS:${PN}:append:riscv64 = &quot; liblsan libtsan&quot;
 
 do_package_write_ipk[depends] += &quot;virtual/${MLPREFIX}${TARGET_PREFIX}compilerlibs:do_packagedata&quot;
 do_package_write_deb[depends] += &quot;virtual/${MLPREFIX}${TARGET_PREFIX}compilerlibs:do_packagedata&quot;
 do_package_write_rpm[depends] += &quot;virtual/${MLPREFIX}${TARGET_PREFIX}compilerlibs:do_packagedata&quot;
 
 # Only x86, powerpc, sparc, s390, arm, aarch64 and loongarch64 are supported
-COMPATIBLE_HOST = '(x86_64|i.86|powerpc|sparc|s390|arm|aarch64|loongarch64).*-linux'
+COMPATIBLE_HOST = '(x86_64|i.86|powerpc|sparc|s390|arm|aarch64|loongarch64|riscv64).*-linux'
 # musl is currently broken entirely
 COMPATIBLE_HOST:libc-musl = 'null'
 
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 2a81870151..56c988e7fd 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -36,6 +36,7 @@ SRC_URI = <a class="moz-txt-link-rfc2396E" href="https://download.qemu.org/${BPN}-${PV}.tar.xz\file://fix_segv.patch\file://qemu-guest-agent.init\file://qemu-guest-agent.udev\+file://disable-sv48-sv57-support-for-riscv64.patch\">&quot;https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://fix_segv.patch \
            file://qemu-guest-agent.init \
            file://qemu-guest-agent.udev \
+	   file://disable-sv48-sv57-support-for-riscv64.patch \
            &quot;</a>
 UPSTREAM_CHECK_REGEX = &quot;qemu-(?P&lt;pver&gt;\d+(\.\d+)+)\.tar&quot;
 
diff --git a/meta/recipes-devtools/qemu/qemu/disable-sv48-sv57-support-for-riscv64.patch b/meta/recipes-devtools/qemu/qemu/disable-sv48-sv57-support-for-riscv64.patch
new file mode 100644
index 0000000000..7f3eab1463
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/disable-sv48-sv57-support-for-riscv64.patch
@@ -0,0 +1,25 @@
+From: Deepthi Hemraj
+Date: thur, 18 jan 2024 17:52:45
+Subject: disable-sv48-sv57-support-for-riscv64 
+
+Disabling  48 &amp; 57 bit virtual memory address in a RISC-V program, while the system's upper address limit resembles that of a 39-bit address space. 
+This signals a lack of support for the 48 &amp; 57 bit virtual address space on RISC-V; only the SV39 scheme is supported.
+
+Upstream-Status: Submitted [<a class="moz-txt-link-freetext" href="https://github.com/google/sanitizers/issues/1707">https://github.com/google/sanitizers/issues/1707</a>]
+Signed-off-by: Deepthi Hemraj <a class="moz-txt-link-rfc2396E" href="mailto:Deepthi.Hemraj@windriver.com">&lt;Deepthi.Hemraj@windriver.com&gt;</a>
+
+---
+
+diff --git a/target/riscv/csr.c b/target/riscv/csr.c
+--- a/target/riscv/csr.c
++++ b/target/riscv/csr.c
+@@ -1178,7 +1178,7 @@ const bool valid_vm_1_10_64[16] = {
+     [VM_1_10_MBARE] = true,
+     [VM_1_10_SV39] = true,
+-    [VM_1_10_SV48] = true,
+-    [VM_1_10_SV57] = true
++    [VM_1_10_SV48] = false,
++    [VM_1_10_SV57] = false
+ };
+ 
+ /* Machine Information Registers */
</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------BJ8x2Eu2fyKYHVFbke4CVjWK--

