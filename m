Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22D84C4332F
	for <webhook@archiver.kernel.org>; Wed, 12 Oct 2022 07:10:07 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.17301.1665558602185973402
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Oct 2022 00:10:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=fCtOqdyU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=728440fc29=kai.kang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.5) with ESMTP id 29C6obIZ014784
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Oct 2022 00:10:01 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=0ZqUE8HkyS7MSMlV5Qi3j3mmBMVFyfc7KoZgsrVLxL0=;
 b=fCtOqdyUxU5lpVl7uZVNu01bll+JrdIPilpKsQItOv1ZSPyzbN5pnl6uJADPIlN7Xg4b
 0dDCZjiGh0BSPM/cxQ0bGDti+9jjwFxWLbQ3uTV4yuD/nWrT7tfdNEk6AnSkLvtR+8ce
 bRBDynxi1/DPYnSxakNqHPQiYXpQxfrmjSpaVY/YZkg/ArEsFizUIk5vUIG0zHimjqsW
 SvtYdrjvMHWgwabgNLODN5ZpGYbdimztbledXdsOI86iS4g74Ogax18yHW5e/WJiIH0J
 CHLAVwWqv9HGJg3IQGvbNMrmmtfZp7J22y1fQO2evAXpnW70LhwPBkf1U9THcaxPNOaZ 5w== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3k38qjattd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Oct 2022 00:10:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rz+Y8cn0//lHm0P9cTPvFkioUEetz+N+ykMiWY7GNv7ioiSKGndr+h44BWyKiFg8trAWiIT4VjbSEx4W/2JchfEIZ9qplKQaZv6p1o/KusWt8NG3WAhi6ew6P/7TyB3AbMwStC3ea5MdT0VXGxc9BP/lhi7HaEqiAE1GvDNAUfld+bL0bNPZT7vMrbU4SxsszKUGS7WkOqPFJAPt8vsHhJQvAtKMioCzdEGLrr9B6Em6visoUqYFEn0e0F30R9ybKZKjwkgoNI6d0ohBMT3iGcI0fKiCYGZxBsguuVOotsBCLhzMyNM4FwCVmvDvt6dygSODB+CRhXLwYiYEYUnZwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ZqUE8HkyS7MSMlV5Qi3j3mmBMVFyfc7KoZgsrVLxL0=;
 b=fZHPiYCt58Es87W2bRJl0Y1vpLUcOF3hyq0rXwUW+uQmLtKGP48vBCxAoN9S2Y3AUpcioXoz+QvhvAB5uupC61Nzfgxy7lgiMSicdG2JDEXdd39Vb0xQu892EfiU409A8ez1jEE6yrGno9YHO0Wrw915lu30CLDWc8rn+Y5zKoKAjd+Y7ui8v2KpIl/AOWxZE2FoaLE9iyNzqGICx3yPJqLys3Zj4qWV/snUOIRe2RwA+6Q6ldDqCBzSw2KY1cdokj/EvVfwQN/5jRKYh99OPLoKXqVl8TYpKsQh6uw8KdrNzRe4w4uhiGeIoYehoaxvUVdhLwWe8pGQ/mb4WqLFYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS7PR11MB6064.namprd11.prod.outlook.com (2603:10b6:8:77::14) by
 BN9PR11MB5465.namprd11.prod.outlook.com (2603:10b6:408:11e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Wed, 12 Oct
 2022 07:09:58 +0000
Received: from DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::28f6:87a8:896c:30a0]) by DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::28f6:87a8:896c:30a0%9]) with mapi id 15.20.5709.015; Wed, 12 Oct 2022
 07:09:57 +0000
Message-ID: <756d646f-6b68-804d-edcd-7933d2a66356@windriver.com>
Date: Wed, 12 Oct 2022 15:09:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [OE-core] [PATCH v3] mesa: only apply patch to fix ALWAYS_INLINE
 for native
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: <171996618BFD121B.23184@lists.openembedded.org>
From: Kai <kai.kang@windriver.com>
In-Reply-To: <171996618BFD121B.23184@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCP286CA0014.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::8) To DS7PR11MB6064.namprd11.prod.outlook.com
 (2603:10b6:8:77::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6064:EE_|BN9PR11MB5465:EE_
X-MS-Office365-Filtering-Correlation-Id: fe740a5e-7bdd-4ea0-470a-08daac20c55c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pQkMoJ/vk/s3dW0ozE034FF68xCjeW31RHNPEdaJCrJYfEtWZ4MEDQKDnn0KqUhoB8AlDdmJiT/zVM7QRXzBZOqQuZIquVTNp0rHbXOUqCwYlRHiQtZ2aWta3b8h3/38BZ5kKtgtun1iBulsxR/3rETya7Gvn+9ajNjoT6hxrpdZhi/yx8DP3dWn3V10SEabFvdilUA4Jqv1kY+j+qCHSr363ty1y8EtEfMXq+PHmrrGzdNzIjrfJRYCZKOGEbcRmyGAYfwO0HF6fmlyrnLveuW255hTc+KFw0/IHTuS8McBF9I8a20EyXgtw/6UqA81gOGpMpSwCZ8eiVF33YemSa6eEkv4K1WuFuQfZB36t8g+ruaaYfmUssy8YU5supCpIgM5596u+79vSyw9E2T0e4j0lO/jbui3TP0OK5cnRjvvpUjoVEtb56r8IaQXhF/2tdbkDG8B5R89ttbNsCwu0gLxNmL7+/n5Tztw4bVx3wPJYClAAF1gB+ILDMOCYLymVN9PXX9GJzpE7GSTGpx7U8Zy8QMPgmElBZ1gIt/wdyrL1zWhqjqwxm8jFTnz38Qq02HvyGuCXWqNAMuILGoHMZmtFQpeMRY1NeW0FXzc8BWpSnygKFzRQvvckQd/ql3WS70y1xibGdKwpMdtmtPdnuLdzdR+6cCd0z7Vd3M7DSPrIpnUwRHjglMZSPaiT0vDIXbiJbcnBLFnDuOLHDTfK9FrcKQ8FTGCZ5VgHrb2IC6Snddpkqje2AIyNPVCY+OK93tVqCfRxuZEaQpl6pr9Pw7/YTzMmR66IGuFNAFKalRTxK3D4iEqhUy7CuAl8YRbQx2MsPcZhveqwwyiJ9T8wY31uwb/Zn7tm2QyQkYo5Hs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6064.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(136003)(366004)(346002)(39850400004)(451199015)(186003)(86362001)(38100700002)(83380400001)(66476007)(966005)(2906002)(6916009)(26005)(66946007)(316002)(6666004)(41300700001)(5660300002)(8936002)(6506007)(53546011)(66556008)(6486002)(8676002)(6512007)(478600001)(2616005)(66899015)(31686004)(36756003)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WnBsL2doS0QwUWQzVzRNWEp3SWFLTW9ndFhhYTRBZUZoenV4UTFuRE45czBV?=
 =?utf-8?B?bkJidEJxbUZwQkFObXBaNzlDdTk1bkltOGNrZlQ2VWI4NHAraGtnR3lqZk9P?=
 =?utf-8?B?TGJKOU1ramgwVEMrVUo1eG56MUwvTEZoWDM4REF1RGFKQ3MySzA5Nnhtc0h3?=
 =?utf-8?B?V0tFMXpZS2pRN0dlMUNEMDBUUXVjYnlGdEh0eEZiM2tBU3NsTDQrVkJoWUx6?=
 =?utf-8?B?ZzRINXJmdkZCT0NMNWtpSEVVSUFVZE1VbUVpTkd5NUJ5cVhaQWJUdzcrWi8z?=
 =?utf-8?B?bno4UHFoVEo1OWsrcitsNHZtNS94emh5NlFGMTUrNGQ0MVJHM2l4eDcvcVdK?=
 =?utf-8?B?QWQxek9wTTJhZTRFQWVWZmYwZG15bG5peWpxV0UxZ3U3dmw0ZDRnc1VIWit0?=
 =?utf-8?B?RTJsOVZHYm5WR3ZzNFc2a1ZtVU5uYTZycjV6THl2S2prVWpuTS9VU0V1RTls?=
 =?utf-8?B?UjJFNXB5M0FaZnhsemorcFQ5aWFZeVB1WC80aWUvMEVENXZ5Z3BlcVhSMXND?=
 =?utf-8?B?ZVY0YU1TSmhkWlVSRE1xbHBUa2oxNU85Vk1ua01SZGthcW1zQkFtREVTRmdn?=
 =?utf-8?B?ZEQrSUhUT0d6YjM0bU9HaURibU5PblJ2ckRBb2FwZGc3QUhWRTZlanBMSDBM?=
 =?utf-8?B?d1RBT1hrTmhHTDY0VFo1SG5UM25xSDFVSW8rSmxuQU1RNHNpS2xhWDI1LytH?=
 =?utf-8?B?TG9qVlFnVDRoa2o5VTlKOEVwaVQ4WGZ2b2pEQ3MxNEVKL0JIQUJwcDBjbnFq?=
 =?utf-8?B?N2pHdkxVaHlJK2RTTWg5OEZpM2xuOWdyWFJUbE5LMnZuM0ZLSHZ5bThyWXFX?=
 =?utf-8?B?RE10MTA3RWZSZ2NiV0NXQXBBSFVDT2xNNllqb1pBbDE3TnU0ckR4OUYzeFln?=
 =?utf-8?B?dWYxYkZreVNlRHRhSEJ2NXN0NTFaeWJGRlhIMWk4elhod2NmdHZPY1N6bkdm?=
 =?utf-8?B?Qk5RYzNQNHBCWlYvMmhGeU5IRFcwRnFLNWhtbHNGQS8zdEJPaHkxOHpwMXg0?=
 =?utf-8?B?S1ZnYmdPUDdMVjYrZFVNZFhHbjRMckprTGltTnpVQ29sWkR0b2ZxRFNoYW02?=
 =?utf-8?B?R3BXZnhXenh3SDQxM3J6allWSVJyNEV2U293NHk1Y3MyQTVaUGpFaVpzL2Qr?=
 =?utf-8?B?ZGJKNzEzbG8rbkoxcjZ1MCtZeUtlUzg5cS9yVHJsTmJtNEVUb3NpSXMzSW1F?=
 =?utf-8?B?c2p1WjhBOEYrK1dFM3E2ZEg0NldiSGpYT2NkYUh0aXliTzJZb3o2Q3hGSEEz?=
 =?utf-8?B?V20yUDBUQlJtbGxYaVhEOWxWR0ZqRm1LU3VaRGZ2S0pjL3gzaDVsRkJQcytM?=
 =?utf-8?B?cERkRlVzVzZrMmhBYW5jN3FPajQ4VURLRXRabkJFcHlNcDdLc3FscEgzVDNK?=
 =?utf-8?B?N3FTRk1kMTlRaTlTUmcrN3B6ME9teDM5MVQzSVN3S2tSK3hNcy9TVHRvRXh4?=
 =?utf-8?B?NnZVaUtqODVyVldWeCtSSzY3RXpDMThjcWFtek9jWFB1TUVhSWdtWDR5R09T?=
 =?utf-8?B?cUlZUm5Gd2pGRGliVUs3N1krazA5MlhYdmZuY1BtSGlZQ3JNNHlGYWhRTnE1?=
 =?utf-8?B?dVJZN1ZXU05sTldOQXRBNHJWNGE4NDBsZGxOMWJtdFpqcm9COHdpY2VhVVht?=
 =?utf-8?B?RXh3a1FvZktvdzRzV0lXeWd2alhDamNTdFZLVkpHV3loaSszTHFkRERXcmti?=
 =?utf-8?B?bEhJN1dGa2c5cWo2dkZOaDdocjNaWVdQK3kydWNuSmtTNGx3MTFiT0c3NGs0?=
 =?utf-8?B?bnoxZlBLcGJPdFZFYW1ySStYLzhkM0dTNURuVXFJcFZQNFdQcFg1MW9hOHh2?=
 =?utf-8?B?Z29qSXBqSWc5VFhWRGVIYkYvTk45L0UwWFdKYXJ0OFBncUI4QzdFcGlOc1FJ?=
 =?utf-8?B?K1EwNHFwMXpMQ2NIYVRQRFZ5WUZYY1YzNWxjRnRLUmVuOFVOQlpLOXk0V25K?=
 =?utf-8?B?Y2R0a1paUkp1dk1wSUx4NFA4R2N3Szl0b2piYk8wbDdxc0pyTE5HdzEwTUNW?=
 =?utf-8?B?UDNWdGVJcDlGNlFJRnNaSzZPU1ZQU2xSRXFzamVLaDh2YTdsbXY5akQyNlZP?=
 =?utf-8?B?WFI3ZUNBSUpxNlVYbld0TVM2N1JHTHZnKzRmNjlQRkJKSWpYc0hrT1ZqTmhQ?=
 =?utf-8?Q?5+bLyvadQt4tVcogaR1UG3Sbk?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe740a5e-7bdd-4ea0-470a-08daac20c55c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6064.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2022 07:09:57.7686
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X6TcDW5oANo3ytE+I4AxRAPunIPPCmLmrbnNwHijbyCz4JT7mXpppADmwhf1YFub+cgtIjrPRS6KWBey3F9RFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5465
X-Proofpoint-ORIG-GUID: VQogwBmgnCoMOeQKH-Ed3LA-A0kXKd6t
X-Proofpoint-GUID: VQogwBmgnCoMOeQKH-Ed3LA-A0kXKd6t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-12_03,2022-10-11_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 suspectscore=0 priorityscore=1501
 mlxlogscore=808 bulkscore=0 impostorscore=0 mlxscore=0 adultscore=0
 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210120046
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 29C6obIZ014784
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Oct 2022 07:10:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171646

On 9/30/22 16:34, kai wrote:
> From: Kai Kang <kai.kang@windriver.com>
>
> 0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error.patch is not
> needed by target mesa any more. But it still fails to compile
> mesa-native without this patch when DEBUG_BUILD is enabled on Ubuntu
> 18.04 with gcc 7.5.0:
>
> | ../mesa-22.1.6/src/compiler/nir/nir_inline_helpers.h: In function =E2=
=80=98nir_opt_move_block=E2=80=99:
> | ../mesa-22.1.6/src/compiler/nir/nir_opt_move.c:55:1: error: inlining =
failed in call to
>      always_inline =E2=80=98src_is_ssa=E2=80=99: indirect function call=
 with a yet undetermined callee
> |  src_is_ssa(nir_src *src, void *state)
> |  ^~~~~~~~~~
>
> So only apply it for mesa-native.
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
> v3:
> * rebase

Ping.

Kai

>
>   meta/recipes-graphics/mesa/mesa.inc | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphic=
s/mesa/mesa.inc
> index 8a74e0a80a..c94e439363 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -19,9 +19,11 @@ SRC_URI =3D "https://mesa.freedesktop.org/archive/me=
sa-${PV}.tar.xz \
>              file://0001-meson-misdetects-64bit-atomics-on-mips-clang.p=
atch \
>              file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist=
.patch \
>              file://0001-util-format-Check-for-NEON-before-using-it.pat=
ch \
> -           file://0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-err=
or.patch \
>              "
>  =20
> +# required by mesa-native on Ubuntu 18.04 with gcc 7.5 when DEBUG_BUIL=
D enabled
> +SRC_URI:append:class-native =3D " file://0001-nir-nir_opt_move-fix-ALW=
AYS_INLINE-compiler-error.patch"
> +
>   SRC_URI[sha256sum] =3D "b1f9c8fd08f2cae3adf83355bef4d2398e8025f449473=
32880f2d0066bdafa8c"
>  =20
>   UPSTREAM_CHECK_GITTAGREGEX =3D "mesa-(?P<pver>\d+(\.\d+)+)"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171214): https://lists.openembedded.org/g/openembed=
ded-core/message/171214
> Mute This Topic: https://lists.openembedded.org/mt/94012441/3616933
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
kai.kang@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
Kai Kang
Wind River Linux


