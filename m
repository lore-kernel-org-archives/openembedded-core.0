Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAEA8CD342C
	for <webhook@archiver.kernel.org>; Mon,  4 May 2026 09:58:27 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.58])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11334.1777888703053837839
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2026 02:58:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@prevas.dk header.s=selector1 header.b=dsABOyl4;
 spf=pass (domain: prevas.dk, ip: 52.101.84.58, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XhzdulDFt4/TyolbqKUKg4BeNOE8UgRqew3iT4H3eynj2pMZYJw2+8s3gobzEuF5Tj+Ps19NoaFzFh1b2NrMMKognJgYpgaCjk11sQUb2VJ4j7cTgRdOxfH61l8cDjPOafLhokZcnCCTCdsI4+28LNcFH3YX/8/4PENa2aeSOi7fsFYbHx1Fe575sYWSTZwlZpVpPvJ77b7fUVxT/CAHXPf3bA7qwC1nhmIJUXRhculKSiwgLcFJ0oQr4IxGtsk4Z6YOW66JNeREkpdGf4ut81GZBC3ZRH+N66ovC3LWikOkYrVBWBfCtO6cabbIKU8jX2gV7j/2ct1Y7oyR2OkIZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JXbmrwYL1zmnFFsD8/zS+qf+L9oe615GQ+tiQ4wpib4=;
 b=zNGLUegkZaC6R69+fyMxlu2sEeQGMqxJ7TXOwSXFUNCye/ZMG16UaWgd6DbiY7/forkqVVjy8Q7Zs1uhoPDdQ7gaB9hHFzRtnVf1T7ppDm+JjZyJ+watSxsIbnlVdCiJSWbWHd1VKQrP/bcYqycSiagoI1/5+mkHTeR+g5BEsMgHqpDBoxRfOJ4KFeaXuRbIHzAYN95br+QVAahAvZnEcQnhvXIx8EfaNZzNqqYkB4/AXn4jVLDCNm9/f3WqFXhiTtjgcBRmhERDL1WGxpMw5ZtJ9YjUNl6+zv39I/AeK8myyLaYuWN5bhFDVowmkB67wEHvABBjZXmOv/xKFi7wWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JXbmrwYL1zmnFFsD8/zS+qf+L9oe615GQ+tiQ4wpib4=;
 b=dsABOyl4spceXPE6z8dlYTGoFjZ0hlLne3x2dHIAb8AaeGuSjhlW9Rx0cqCjeF4Uptf3+ALpuZe+7y4NOkOS/LOlUNOPK7YdPPGUuntpyskwLuXqQK/baRs8pRRsFkfXA35zqx8KNg0dlwwWGTap/f9bLwPXLZdHtNfqL1YArko=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:681::18)
 by GVXPR10MB9138.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1de::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 09:58:14 +0000
Received: from AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ebc6:4e0d:5d6b:95d8]) by AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ebc6:4e0d:5d6b:95d8%6]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 09:58:14 +0000
From: Rasmus Villemoes <ravi@prevas.dk>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org,  chbs@prevas.dk,  emkan@prevas.dk
Subject: Re: [OE-core] [RFC PATCH] license.bbclass: only create hardlinks
 within $TMPDIR
In-Reply-To: <0a68ea544451d546991ca5b532204af6fe3b6e69.camel@linuxfoundation.org>
	(Richard Purdie's message of "Mon, 04 May 2026 09:35:24 +0100")
References: <20260501183615.2728124-1-ravi@prevas.dk>
	<2130c0c232f6f4e0bebe64c4b3838d2de5ce022b.camel@linuxfoundation.org>
	<87cxzbshkn.fsf@prevas.dk>
	<0a68ea544451d546991ca5b532204af6fe3b6e69.camel@linuxfoundation.org>
Date: Mon, 04 May 2026 11:58:12 +0200
Message-ID: <878q9zsdhn.fsf@prevas.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: GV2PEPF000239F7.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::2a9) To AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:681::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS5PR10MB8243:EE_|GVXPR10MB9138:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f41b389-85c6-4f5d-aa47-08dea9c3a829
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|22082099003|18002099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	aUs1VMQm+R1aALWdvK4PoMPj4fZKJapysFMVCRPcVam/3xk3hLu+y9f6NLRQGYoczsKH7/2iJDP7JOFMv+lQbd3TxqvTlNefkFwdguvC73iXDYnfUMoTzIbAlqJVe/5qaCN7Me1SkYzwb5/8jk2a2e+9J7ceoOrxa/7Xe/vy8yNdPKK2vzGHzzZDn3eXxOHMlvLV5tZGmoaL2VUzY+ykShzcQO7JriN7KUgf7vpjf8mxfz+yfu6OfBr/ePB+9t4p5ZlPUZ+9148fHiIRbA/3rVaPgoiYk9hqzpwSsWurzBcxpGtL1Vxti1tnkx5okTY5wRFki5YF6wWq1LoapD3aMmSc/PMNUYRjJO9FuL2SGUr8JtudYQjjpMd4RNqO80Bs+VdRnkXBj9X2y497hUq4+cYrZ+dM5UMKt/61EFUJRVPCCX5yPcnyL9SH4fT4fAHvAInNfwoA65TfFiU/wvG4xReE9GnO/APpTTgb7LRa4NOqceFktctrn4zI5KkXJRnZq/5xPTdAA7RuERV+8wPJ45zrYfJJWwWdjWKlQUp0vv83zMrfRjA4x40zh10CgTD6A+z9ZwOcHig/9lDpcTrfTYr/eT/CEiUzzI5H4Rh63QoXmfIuWFAVZjqGOiGQgSI5pM8SprSw6U3hRKqDlqROTkc8u5Tf2hZwIfRJK0gcpkXHwLzoE9Irag5Rsq4GzcKr3LRvp5QXkQ2+kRef1PR2trnfLJr1xItzVTLiV/EisRulssrLRaIgTBnRiJsToVs3
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(22082099003)(18002099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ejl5cTQ0ZGxMT0tSMXlraGlQWkJkSDhSNDZXSlpmUllMK05ZNGpwdXNleUd0?=
 =?utf-8?B?WHg4NFh5ZXdLMWNyNUlKUmVkMXlWeDQrU1FiU1VMWkxIbTQvcjU2TVhvRklq?=
 =?utf-8?B?V203N1lqUUF3UFllbmx1RnRKRTBtMEFlSEtBRVBNd25xM1IvZTIyR1BQYXVX?=
 =?utf-8?B?eXBySE55eEpmakU3ekx2VHh2OW9FcEIreStocE8vWmxzQ3diNVRvMUprNmVo?=
 =?utf-8?B?QlZXK1NPZ3BXME9WNGRmajFXL3FRamZpMHRUWHBPYU9pNVdIRzgxWFEyTlFH?=
 =?utf-8?B?enFMWWRaK3BkVEdaYzNXR1c4WCtjejdNVkpOTkdneDhGcDdvRi8rbjJJdys1?=
 =?utf-8?B?TGhuQnVqMVBTNmttNkxkV3RydnRMTXBUV0l6MEVTWUVobk1KMy8vR1Yxc3Yv?=
 =?utf-8?B?MkRnNXBxaGZUNjNCRWtkUjZlNnRFZXR1cWpad08xNllsZm5tSEpaL0REYk5q?=
 =?utf-8?B?eW1qbUgvNVZSSkpKbWJwRG9qczhHdEgzWVF4SzQ0dTIzYW5SYmE0UjRtQ1VR?=
 =?utf-8?B?TDFMaTZkTVpRdDdRejJOT3FuOHNSbjdJK2phWjdvU0htUkFHUlVUSlRJSFFO?=
 =?utf-8?B?YWZBRDN1V3dJU0lENTFBNGlrQmp3QU9oWHk1SVJQUnkvbGwrYmQ1bmVtWGRD?=
 =?utf-8?B?TWZGSnpNT2Y4K0UwSnZVNEV1WS9DL1Q1QjlrbFVoZGRiU2J4aTZ6OHJTbmwy?=
 =?utf-8?B?RThlOGxPRUVHSklBcUVMMlpvQS91RDYzRTM3OW1VcWhRZU5JSkRtaHBsQTlx?=
 =?utf-8?B?ZS8xQjNzbThGOFhXOEluRUNMN09xaUVSZHZBU0prZDNiSXBabXNKa2E1NFhT?=
 =?utf-8?B?SVBLN1J2V3JqN1dRVkc0d1FxM2ZPV3hZQ1pxR1U4Qk5pZnBpL1NzdVhuTzVa?=
 =?utf-8?B?T1NMbHZ2dlZCOWNQUFlhZWZMQjA3UEhuK3lGVWRVdnJHZnpSMEI0aTNhNUpB?=
 =?utf-8?B?V0ZvbHQvRmxRWHZSZFMvWURyNitGREsxUk5mUHlaQ1hwSU1QQ0paRVpIWGMw?=
 =?utf-8?B?S0VMQXdPZzcrdCszSEs5dUpFMW5GUzdqcWpZZHFDOVlwc3BySkFjQXd6YnRx?=
 =?utf-8?B?d0ovR0xQNVNNY3pzVFE2UjU0MEE5Z3BqTkRYUHNhbG1vNTJsWDBQdUFjeGVH?=
 =?utf-8?B?SmlLSDU0RGJuRG53WHdzVWNIalZWNjhBYUdveFluWTMvZTI5Z1BpUnErcUdY?=
 =?utf-8?B?NSt1aWczOTBEdTBQR2cySVViRmJSVkNKSGt2SElCaDgwRXV1NGlNODJvWVYy?=
 =?utf-8?B?Ymt0MDR0cWtoenRvNWZKZ3FYa01Pc09BeDZBdERhZGN1V25aOXNwTzdkZlpj?=
 =?utf-8?B?YzJFZ3hPVmlucEN1V3Rtdy82YVRWQ1p2bzlFWTJGNU1ZZWFJSURJam9idFRu?=
 =?utf-8?B?V0FIN0xuQk1FWmhxYlBzRVlMNnJTclNNUThqb1JnZlFZY1pueFdJMENtRjNa?=
 =?utf-8?B?R09SK3NZOUt6WUw4ano3dWhPcUFGcmxVQXBxUytWNjE1dXVHZGxDdEVLcDNJ?=
 =?utf-8?B?SFFkTkROY2hTbEh3SzNRRUxoMUgwNjA2eCtSUkVBUTFFY2t4Y01EdFV3cWtr?=
 =?utf-8?B?UVcweFRmbGtoTGV5SkhpUm1Od1REcUNmZUxFMEdyZnZlNEtGR3VlNmdycVRK?=
 =?utf-8?B?bHZmY3dNYXlUZGUzcHVUMGlsdDdMdGs4SFNsMjA5ajZPdEllb3JsdytGUG40?=
 =?utf-8?B?dTZMSmZKa1g1Mnp2NGdHY3JlTjhEbjdaTEhFcXR4Rm9NRytYYmZXSGJTYkhQ?=
 =?utf-8?B?QmlCZlEyK2NSSDdSRlZ1SFFncnVGM2gxZ0tnRU1FMHMyZUs2SGs0VG1OMzUz?=
 =?utf-8?B?eTB6RVBRS2R4N2s3NFlKTkdyTDJmNjUyN1FjUU9yKzdzNGtQclZGSFJIYTll?=
 =?utf-8?B?Vkp2eW9HVVExQ0xjTEZjdHlqUjdiT2k2QUxxUEladmc2cS9SOERMWFBmSG9a?=
 =?utf-8?B?K0Z1bHZIZlNJR1ZFVnRQSFJQdXlCbHcwNWdGNUdwR0dsbkRRd2ZDQVFOS29H?=
 =?utf-8?B?cW0wK2ViaXlVOHdGSEt3UHdFRWxhYVYxTWpTVWhrSnBZcFlVQWJwNVVkOXZV?=
 =?utf-8?B?ZFZsOXFnQ1YxNWZ6djBRMmtPeU1Rb3FqMFZjdnBiT3hrUnROblBURDFyaUJD?=
 =?utf-8?B?V1FHNnVZL1Jja1lOODQrQTlrRGNEekROeGxnK3NSWWNTL2VCaFdPenYzd0I5?=
 =?utf-8?B?Qy8vYitoeXZzZ0RSeEhtejA0UjlkR1dUbWJISU9ZaGhKSFFHSGhXdVR1Tnd3?=
 =?utf-8?B?Q0tpbHo1eUZWNkVROVZRek5UMzNGVWpEa0o2Rm52VDVqM2RWWmlrVG1NcEJV?=
 =?utf-8?B?UFoyZG4wa3YrSUkyeG5OVkgveGhYN1JBZWJ1bmQrWlpOcmNERXQ5bWNOY1NB?=
 =?utf-8?Q?I6vwjEMSWQ7D3E3I=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f41b389-85c6-4f5d-aa47-08dea9c3a829
X-MS-Exchange-CrossTenant-AuthSource: AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 09:58:13.9925
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RXyzIaDC+iBB1axFoHJe9lfcDs7xzipPM/zxoWZEmv7M6YeDy44vzyr8V4qqmva816VLEQYySVLRpuDoSPKeTqh7cAfaRSkjc1ONxtedtK0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB9138
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 May 2026 09:58:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236445

On Mon, May 04 2026, Richard Purdie <richard.purdie@linuxfoundation.org> wr=
ote:

> On Mon, 2026-05-04 at 10:30 +0200, Rasmus Villemoes wrote:
>> On Sat, May 02 2026, Richard Purdie <richard.purdie@linuxfoundation.org>=
 wrote:
>>=20
>> > On Fri, 2026-05-01 at 20:36 +0200, Rasmus Villemoes via lists.openembe=
dded.org wrote:
>> > From: Rasmus Villemoes <ravi@prevas.dk>
>> >=20
>> > This is _not_ meant to be applied, but merely acts as a place to start
>> > a discussion.
>> >=20
>> > > In our CI setup (which is gitlab-based, but I'm not sure that's too
>> > > relevant), we sometimes see spurious errors like
>> > >=20
>> > > =C2=A0 touch: setting times of '[...]/rootfs/usr/share/common-
>> > > licenses/go2rtc/COPYING.MIT': Operation not permitted
>> > >=20
>> > >=20
>> > > I do understand that using hard links is quite valuable for saving
>> > > time and space (I see GPL-2.0-only having 135 links, so that alone i=
s
>> > > a few MB), which is why I don't think this should be applied as-is.
>> > >=20
>> > > Could we do something like create a $TMPDIR/license-pool/, and
>> > > whenever encountering a src not inside TMPDIR, copy that file to
>> > > $TMPDIR/license-pool/<basename>-<sha256 of source> [if it doesn't
>> > > already exist], and then use the latter as src in the subsequent "ca=
n
>> > > we hardlink" logic? That would then also improve the case where the
>> > > meta-layers are (bind)mounted R/O, and we thus always end up copying=
.
>> >=20
>> > I agree it does look like there is a potential issue here.
>> >=20
>> > I'm not sure we have ever claimed isolation between the build metadata
>> > and the builds, I know that for example patch files are linked in, so
>> > that when you update patches, it updates the metadata more easily. I
>> > can see why you might want that, equally, the ability to update patche=
s
>> > that way is a nice usability feature.
>> >=20
>> > Did you track down where the utime of the files was being changed? Fro=
m
>> > the link, it looks like:
>> >=20
>> > =C2=A0=C2=A0=C2=A0 find=C2=A0 ${IMAGE_ROOTFS} -print0 | xargs -0 touch=
 -h=C2=A0 --date=3D@$REPRODUCIBLE_TIMESTAMP_ROOTFS
>> >=20
>> > in reproducible_final_image_task in image.bbclass
>>=20
>> Yes, it it precisely that command/function where it triggers.
>>=20
>> > I think that function could be changed to clamp to anything newer than
>> > REPRODUCIBLE_TIMESTAMP_ROOTFS rather than changing all files, and that
>> > might actually avoid the issue.
>>=20
>> I don't see how. First, how would that then serve the purpose of
>> producing something reproducible? It seems that the timestamps would or
>> could then depend on when the meta-data repo was cloned. Second, if the
>> mtime is still going to be changed sometimes under some conditions, the
>> problem is not really gone. And third, I think it would make the
>> implementation much more complicated, if one would need to make a
>> decision for each file for whether to touch it or not (i.e. the simple
>> find|xargs would no longer suffice).
>
> Pretty much all the rest of the system works like this for
> reproducibility. Whether you make everything
> REPRODUCIBLE_TIMESTAMP_ROOTFS or just clamp to a max value of
> REPRODUCIBLE_TIMESTAMP_ROOTFS doesn't really matter since you're using
> that value regardless.
>
> Basically anything touched as part of the build process (newer than the
> timestamp) would be reset, everything else (older than that) should be
> deterministic.
>
> The value of the actual timestamp used is a different discussion but
> we're not changing that.
>
> Having thought about this a bit, I do think that is the right solution,
> and it does match how we handle timestamps elsewhere like the packages.

OK, but then that still wouldn't solve the problem we see, where the
build has decided that it can create a hard link, but then later it
fails to perform the futimensat syscall because the user running bitbake
is not (apparently) the user owning the inode.

As I said, I don't really understand how that actually sometimes happens
and most of the time doesn't, perhaps it is some weird interaction
between how gitlab starts docker containers and perhaps with some pseudo
in the mix.

Rasmus

