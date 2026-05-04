Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17DBBCD3423
	for <webhook@archiver.kernel.org>; Mon,  4 May 2026 08:30:15 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.70])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10380.1777883406980587468
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2026 01:30:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@prevas.dk header.s=selector1 header.b=bXQS7T7n;
 spf=pass (domain: prevas.dk, ip: 52.101.65.70, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=plx5uJxhSi7X/KQHZoR9zXLc/86VEimBwOTV213LmXbfGE45EmU9b5So2eQgU0WQ1Wb03kys+qgkPNWkEHWUbij67QCUX7w2qO+Wnevoo3QbSif2PpZ7s9qv2L2bmo3VVDBrq1E976jMEatFBmZO/CSvTxJSULR3x8V0nPt4qis4PN9jGPAPetr0KrIHuJai9ThhygNivURrAU7rwXb/AcRz3reWDQt28jH1heUno18jZCXRGOY1Y0OWixlnoJ/3oP8nho4rN4sEKajTgUil2wWvNygfAAzQ9uffvmZs1qLoFtl6qUySIGxBcYx/XD9KYLZfchw+qA6eMckL3oU/hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U4Y5Da/y079CsddvPXBoww3AEj17pXdLZ472OX4+gLc=;
 b=uxkSKQ5pXcmcyu3Jc2HhdLHgGs1X6orucSJc4LJgHj3i91YHvUNVs0WlbKZ4jhpEKSvnrvbTqQfbuWwmJ389oEcQ1OuFC4W+9CYdNdEaYbLCMeRHz057JOZFlvvwy09ff032s/WJyDrDX2FY0cm07L7YEN0vziCGmm+KFWJURa109otUFS6apn0rp8rUejVbUqJnF0pXdK5zZof0i+bGFnXkN9V5Q66eK5eGO/7AIBWi1mJjeuqZj3zdJixQS9RSnfrLWnkDD2BCYenDOkeHUzxrIVRu71P4LkvNtCMTSP5jtUoWS6ggdo0yIcQWOdsUGY5mmNlaCuK8WQg5HEyx+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U4Y5Da/y079CsddvPXBoww3AEj17pXdLZ472OX4+gLc=;
 b=bXQS7T7n4Sj7rTMg9DEot19/bYrpLijHjz9G5zN0aQB0KU/9Gi3UN1+setBSe3WRg7c5oNSZOiEE2G+8jwoqWcTim2AKsVJ9C2ROKZpW6Z82luhsOcqxX54QIe1qkR1zQ2rPfn2MM2BoSTgWgoPR7CE2O+LJ1d855Ruy06uvd5w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:681::18)
 by DB8PR10MB3958.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:161::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.33; Mon, 4 May
 2026 08:30:02 +0000
Received: from AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ebc6:4e0d:5d6b:95d8]) by AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ebc6:4e0d:5d6b:95d8%6]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 08:30:02 +0000
From: Rasmus Villemoes <ravi@prevas.dk>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org,  chbs@prevas.dk,  emkan@prevas.dk
Subject: Re: [OE-core] [RFC PATCH] license.bbclass: only create hardlinks
 within $TMPDIR
In-Reply-To: <2130c0c232f6f4e0bebe64c4b3838d2de5ce022b.camel@linuxfoundation.org>
	(Richard Purdie's message of "Sat, 02 May 2026 08:31:22 +0100")
References: <20260501183615.2728124-1-ravi@prevas.dk>
	<2130c0c232f6f4e0bebe64c4b3838d2de5ce022b.camel@linuxfoundation.org>
Date: Mon, 04 May 2026 10:30:00 +0200
Message-ID: <87cxzbshkn.fsf@prevas.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: GV3PEPF0001DC01.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::30e) To AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:681::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS5PR10MB8243:EE_|DB8PR10MB3958:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a69975b-856e-4f3e-0835-08dea9b75604
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|56012099003|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	K124XEiAV75CA1TX1NeFbOE9prDi5Ogq+LpclqBhhzlBSYm8jD0WTFnnmKmaMOlDjhB4pbFEo66AwR2PpaewpeDutNHAZ76HcDLKvuyf5tEfTzFYitG0LdHYzjP6vMnMwL9xqis/xE+Aw1EJJaf/1OxX+AUzNaq5C0RnMRp6YP4jv7na9AH4IiE1EmpDQG6jFyJLQuw19VKjh2dLdmLO5ikrnZnr5ZKPG8gO5M0N8mY4/SCet6rqoLjS1zLRNCkRzT3rTn89m3LS1i4c5AJMrhw1tp8IPQi+3c9sfdoN/UZQYvnB2d6TZ76GUS5BqG5MzrcueNjahJPX90HL4b6AISjX/R5ndcwOO4Cz7qFzyJ+8AZ6Wf2PN3ZOma8OmJ6P5XZP3yu0EIiKmiRxXg0JyZts99eP/0oJpjv0jM5GcHHX91Fsg4hBmbeH1mojpHcue8xg3++GhZWKQqX6V8uMDwDLDoZche8q/sj61ff1ierqlS7RX6hbEU6ZpQSp7hU7H9gj/+ENIx7oARqa7lWkK3sSJ/23gZ7XClIALlkw8jJ+iKmiFHSYJtvC8VWAFNfsEKtXwiwGWVVzSgCBcSbiV3gbv09UC5qoJIwuDN2PBmD8jfKa26BGOPazap2A109G7KMS0JpRotEGAKQDUVSUVGKiKpqW83mJoEmsHxAptB5qmZnlkByuXVLjkYGTqY7VT306suf3KxWNI42fnxhJHCm2O+3I0ZyJEQ33q4SO70z7pr4plj3TTuUKgl+yKoSMn
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(56012099003)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VVhLVERlbnRHMzZWcG1vTlRoYmV0UDhrN0lqWmJSVlZuOVNlUEZlckprN2s5?=
 =?utf-8?B?R0dlZVdHOFppYzZsTk9nUFhxV3hQK0pCalM0d2JudmRDZUZ5YjJqdlhZZitj?=
 =?utf-8?B?UlI4RDJMRUQ1VER3ck9YRHdEbW16WGJ5NThVa0VqYlZoVmV2ZWN6bWg0T292?=
 =?utf-8?B?WGJDaUQ2eUFGLzFFdTNWY05CWkt2dnk0cUdZU2xFTnR4OHVzaHU5L2JGMVh2?=
 =?utf-8?B?Mk5SUnNDTWxIMi9kZWtRei9GSFRuT2g3dlRtMTVDbW9HNlo1emFWVGpYUFAx?=
 =?utf-8?B?MXpCUkcwMXhLeWdqcjIwZzAwOVIxVDVJaTJQVUVJVUt6cGVYUVdNUlRva0F4?=
 =?utf-8?B?QlB1bkhKc3gwZk1kYi9PbVlmRWpjRUNnUWNQK0djQjVyN3FHVVJVbTNQR1hq?=
 =?utf-8?B?NWlRejdacmxXRUJzRmVNbXIrVUZhR3JDNy9iVWlBWEd4bWY3M2pWQlRNZUQ1?=
 =?utf-8?B?SUYvdCs5aE1xdjhoamw2TXBPcTBnR2p5aU1YU1lvV1VGYUJjZ1M1N2JrSE5s?=
 =?utf-8?B?OGxDKzg4WXBudXhmTGZHTVJlWjEwTUtNNjEzQkk4V1dqc2lDRzNUZ1lTbU9q?=
 =?utf-8?B?V3BqK0g4MEM3MVMwTzlSUkJzVm51OWRoQmFVRVRWdHBOelY3eENKUWREVG5C?=
 =?utf-8?B?L0ZWYmJXZTJMQW55bkYreVo3c1YzRmM2RHUwZ0JuU1ErYTA4Vml6WmhMRnRP?=
 =?utf-8?B?TWFPZm1pZURxemlMMnVnaUxpakNlajZORitKU1BZQmhtVExmVVY0WURnQjZD?=
 =?utf-8?B?b3dGdTg5dk9GZXROakQzaGVybjFoU2NXZ3Q0RVppa3dSRXQ1VmFRVisvSDZa?=
 =?utf-8?B?ajFYeTJqOXE5bmYxamdmNDJ5b1lLSlBaRnBTNm0vbnVNblVwNWVEQUdQTlVH?=
 =?utf-8?B?OXlqd0xSeUg1NUcyN2dpWHE0d2tzUmZDa2JML08vRHRSbVc2KzByOTJwa0pw?=
 =?utf-8?B?NnQ5THIxQURTUUZFU2s5TGdiSTRnMUFFV21zb1VxdWREVk11VEFrMmJzMG83?=
 =?utf-8?B?ZjlkYVM5bzdDOHV1dnE3RUxmUnY5MldhN1ZoT08rZGFxMm8wcE1VSVM1Zmhk?=
 =?utf-8?B?MFo3OFE5ODBmUG0zZU1SaDNBTUFmSEI0cmxST1lkUGs2b0c0MnU0Kzhxbm1o?=
 =?utf-8?B?Z3R4OWovYXF5ZEEvQ0hBR0ZyanpOWXpMSTVWYmJVcFhVdmN2bGtYSkk3L1pT?=
 =?utf-8?B?OVNSN3dlV1A3eFptb2pnSFFNZXRmWTlROXNTQ0Y2VVc5bTgyNnl2aUoxZGZ5?=
 =?utf-8?B?YWN0OFhXQ1NSdzhVeFJQcjh3Yk5FNUMyTU00YzYwWmw1QlZBV2U1NXpuZGlW?=
 =?utf-8?B?ZjF6KzJlNWJmZnFndkhyV09aN1laT0JnUHg5ejYzUkt1dTBzVlRjUHJWODZw?=
 =?utf-8?B?MklRZFRXZXZ1NGpIMW5Yb0QzTFZmUVpEWjBWc2p5VkxUcFI0RkpIbmhuSTBl?=
 =?utf-8?B?d3ZmWS91NWhBSlkvYnF0eHVEZmtXWk9FNDgrV0Z2UlQrS3Y3WFovRVhBYW9O?=
 =?utf-8?B?Qk5leWdrNVBpU2srRVo4TTNqVXIzZ2t6aE9TWEVBcGVNakJoenZNZWZ3SGVu?=
 =?utf-8?B?eUFIU0U2eHhpU0M3OW9tVVIzUHN4ZGZqcXBZcXBhZzFjWmFDd0VvejNXQStY?=
 =?utf-8?B?RDJoTDVJbnlKbEFuNDdxSnl6b2ZrcmROSnJyMjY3d2Q3NkNVSm93TmdnaE51?=
 =?utf-8?B?Y0o1TUdNKytFTnBpb1V2d2dZU3c2N2h0SHk3M3dVWE9BcHFtVVNBK1d4SG9h?=
 =?utf-8?B?RW1KdC9GQmFyeENteksvN1BlOFAzdllWekJxb05URGlJRG1WNjZNTkIvSm9i?=
 =?utf-8?B?bUJMZTVWOFcvSVJHYVZsQlQxLzVhV3ZyN1RaNUk4aG43a01MYXlSSjZsU1R6?=
 =?utf-8?B?WndsSnBXV0wwemh1U2JNUnZxa01OengyWXQxdEhpR2hwYlFDQmJMZHFjZG1T?=
 =?utf-8?B?M3JVdWR4ZG5LSERkRVlDSHVXbFFSMGlLa3owUTZ4a2N2aHUxVVVydXVoV1Nr?=
 =?utf-8?B?MVkxQUc1b2ZpYzJhdU0zT3dyMVpsbVVwem55ajRySE5vVHVKcHVGaytjc1NM?=
 =?utf-8?B?cnhremNNQjBQQmtXTUVrSlhjN2hVdnR3TmlpNDJlWU4xdUNiMGdHVm5hcHlS?=
 =?utf-8?B?NCtGWW42NTlrdGdRS2VSd3MyNFVYMzF3M2tETytLSVN3UnJDNnBielpVcThP?=
 =?utf-8?B?andTK1ZqbmFiYm5mbmhHTXlxSy9jazNUemZYOUwvTWtUV0QzbXhNVGdIdkZ1?=
 =?utf-8?B?Q1p6Zi9TeGNPSzVMZXRnMmtjbkdScDJPaHJuRklLZEQ5cjhiVUhBRzE1OEY0?=
 =?utf-8?B?U29CbnRqWkZxNTJWWG1XWklldlVTOStJVkh6VmlIZTIzNGdMMEtOSjhNVG1K?=
 =?utf-8?Q?Yc8eM2W4OF96fD1Q=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a69975b-856e-4f3e-0835-08dea9b75604
X-MS-Exchange-CrossTenant-AuthSource: AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 08:30:02.1527
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +6L5c54DtHqjGPy1j/gPGXdodhXuL49CnhSI6pQJtL/xS9sujTbPK2Tv5BMyScouqArHgK4uawtwG8HMD4DxFucYLx+ol+n5W5u0Y+WHmwc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3958
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 May 2026 08:30:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236437

On Sat, May 02 2026, Richard Purdie <richard.purdie@linuxfoundation.org> wr=
ote:

> On Fri, 2026-05-01 at 20:36 +0200, Rasmus Villemoes via lists.openembedde=
d.org wrote:
> From: Rasmus Villemoes <ravi@prevas.dk>
>
> This is _not_ meant to be applied, but merely acts as a place to start
> a discussion.
>
>> In our CI setup (which is gitlab-based, but I'm not sure that's too
>> relevant), we sometimes see spurious errors like
>>
>> =C2=A0 touch: setting times of '[...]/rootfs/usr/share/common-
>> licenses/go2rtc/COPYING.MIT': Operation not permitted
>>
>>
>> I do understand that using hard links is quite valuable for saving
>> time and space (I see GPL-2.0-only having 135 links, so that alone is
>> a few MB), which is why I don't think this should be applied as-is.
>>
>> Could we do something like create a $TMPDIR/license-pool/, and
>> whenever encountering a src not inside TMPDIR, copy that file to
>> $TMPDIR/license-pool/<basename>-<sha256 of source> [if it doesn't
>> already exist], and then use the latter as src in the subsequent "can
>> we hardlink" logic? That would then also improve the case where the
>> meta-layers are (bind)mounted R/O, and we thus always end up copying.
>
> I agree it does look like there is a potential issue here.
>
> I'm not sure we have ever claimed isolation between the build metadata
> and the builds, I know that for example patch files are linked in, so
> that when you update patches, it updates the metadata more easily. I
> can see why you might want that, equally, the ability to update patches
> that way is a nice usability feature.
>
> Did you track down where the utime of the files was being changed? From
> the link, it looks like:
>
>     find  ${IMAGE_ROOTFS} -print0 | xargs -0 touch -h  --date=3D@$REPRODU=
CIBLE_TIMESTAMP_ROOTFS
>
> in reproducible_final_image_task in image.bbclass

Yes, it it precisely that command/function where it triggers.

> I think that function could be changed to clamp to anything newer than
> REPRODUCIBLE_TIMESTAMP_ROOTFS rather than changing all files, and that
> might actually avoid the issue.

I don't see how. First, how would that then serve the purpose of
producing something reproducible? It seems that the timestamps would or
could then depend on when the meta-data repo was cloned. Second, if the
mtime is still going to be changed sometimes under some conditions, the
problem is not really gone. And third, I think it would make the
implementation much more complicated, if one would need to make a
decision for each file for whether to touch it or not (i.e. the simple
find|xargs would no longer suffice).

Rasmus

