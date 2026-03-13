Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F4B2107BCCF
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 17:03:39 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.0])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20874.1773421415072515231
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Mar 2026 10:03:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=CxQZTG8P;
 spf=pass (domain: axis.com, ip: 40.107.130.0, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uPX1hJPwdcX4vBgIfSuqXkCfwvOmQYkS+TUKervyQDG7rlJxGfIG6m98NBElhjvAFL3XRXd0Su+d2nznjYsrqUcHVydUiRIYk+pG1tfSWmXAoLn8AKsNImfhlJ4SU46OT+/AE0mQMBolv+yEDFQ8guiDZHOS21Q+ZrV1tmYrfEk5W5UOpnArJ6CblDt2oJdy/0TbFuQmxw0XhXfVb7+eG0G9wd/67/651y3btAd9Pwvn+KVnfVRW7B7CXhRnoIrcbvHbIsd6Q051+C7165Vo2Sqgj8peyYa+q0BY3t8KcuDBz9JapZB5AQOSQAsBU9/pnc8LLhG7Wbf7VmKQNQs+SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jk8urMenpCS/GkpK7huTy+eZeM1cplSPaVz+7Q7GGzQ=;
 b=pqpp1y3Vbkku8zCM/3H68QcenHAlFR6H+w/LMGp14Vrg0GBzBRXnd/8p1vJjvCVVWDqc+692vVsFi1iCJB3PduXN0wTFbxgBEx+0KpmnffaR35Q/EsGAGWG85386Q6I0YLofY9RncaDN4DjCuhqBkaRQXNyE5TwSqlQHPQZfw993PwAGgUG+xM3DbUzu3LGYiQP0sE2BGtOhZsH89bTQZOk4mdrN7WCbM5Iv8SRQejnpKsSVRDhvuHwIKtJ4ELfvkHMnQTT7gd4jBoCnJ7USQROUF2j8xwW9VEBTV39K9x0l9hLXbFOVK4yPSh2YzM5XofWyHtvbLflRx9CiQGbD+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jk8urMenpCS/GkpK7huTy+eZeM1cplSPaVz+7Q7GGzQ=;
 b=CxQZTG8Py8sgs3Vz+4FleqKVOybMiuLVWfcSO4mYuyQKiA97BLcaRS0ofnoGDe8F/CFz8GZHtSTTk72+OKiZsH3FinkHVYACG6uzFupBKwS6w1VNGk7S0Px6PDKzr0xfPWOpwR0MT3fRrpZUau1GqjOqQTWy6wvWVxWZ5bJ9tTQ=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by AS8PR02MB8948.eurprd02.prod.outlook.com (2603:10a6:20b:5be::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.17; Fri, 13 Mar
 2026 17:03:30 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd%5]) with mapi id 15.20.9700.015; Fri, 13 Mar 2026
 17:03:30 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "git-patches@bmwtechworks.in" <git-patches@bmwtechworks.in>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: AshishKumar Mishra <ashishkumar.mishra@bmwtechworks.in>
Subject: RE: [OE-core] [PATCH] shared/fdset: add detailed debug logging to
 fdset_new_fill()
Thread-Topic: [OE-core] [PATCH] shared/fdset: add detailed debug logging to
 fdset_new_fill()
Thread-Index: AQHcsGgE6NFi4ugzGk6BWOgI5BullLWssz4g
Date: Fri, 13 Mar 2026 17:03:30 +0000
Message-ID: 
 <DB5PR02MB10213178F2C7117B4B314D3F7EF45A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20260310080942.47334-1-git-patches@bmwtechworks.in>
In-Reply-To: <20260310080942.47334-1-git-patches@bmwtechworks.in>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|AS8PR02MB8948:EE_
x-ms-office365-filtering-correlation-id: 513ad05b-5d4c-41bf-61a8-08de812273c0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|13003099007|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info: 
 mw51TFwMq9TIsgXkTXcjtclI4PwF6nRXa1TQq4cIzO6yPP0FTuN5VFJ5thxHPlxSgA27V6BUQC4UAvZFzKDJq6rVP3sd12oslV6FN4SqCleV8V+aS4SO6hVYdemC/H4XzJ8nrCilZgyurARf0mLpzQz7vn4ejEpGk40OZbdbY8M5V88pqRr/Ab+7rjf7H7T/lZ51KEWzxC/6+2/GUFs1txjWLeJDiSkpL14+GByWhbZO9jm4u+YHYqvvVG2/eIIv0kBro54KKMDC//kfxR0eapRpLkN27kFCWOB6mlKTvulAJpiL5BJFuklFndWBBoAN0upMZxoiSHPZiNKrE9pmD9xJ8Qj3VDLTY22QYX92AdUcBWfdPohYxw3OswgOwiGzinxfyqdZ0ORdXU/fplurD3ErK2v3WgUWeKy4r6Vfu/tITSnDPZ38h/2f+LfbAlBB9BhT5GPDwF+K2Fp+GDVQdqUkVRlNem1wBDK8UsalLTkCqQeL7mb5Ba7duXkEmyp44WKspyKNnmwptC5jeIiiwu8U6wl38XcGPAAboHQp+H+6sjcKiL9eRx3clXamzn8mDZlQ0x9JfZdKG7aYyCpWzeE5YnSO6EGKxDaSrwt6OF1d5+yYaSvCVPFztmsCqf6PRHsPwZrIULijMQ6SeOTP+v2FmiseDpvXPHldALTEY2Re5bq0CyNpGQk13yx6WNme8k+vnl2hAT1+aJ9m1ZXiY1MhIEY2l2HvB4FPwHs6RvrUejwVeRaDhjxUGllo5U4gwiCa3WqNtMwr/lHYIePrsmTYvBfkrxPPLfanrVJ6Y7U=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(13003099007)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?dAiiOJYahSkCNHr3Fhj3w2j4JYqh8A0GRpchReSjFeICD68qYsb/L0RiaJc3?=
 =?us-ascii?Q?ZB+aAoB4kZ29xiYBzZun6FHaWY7ObUhKXW0Tt3M68sn+WWdT+b1SJhduaqkE?=
 =?us-ascii?Q?0Cn0ootWJh28O6Gg6jLmgbu6L+1B9acVMLiMdx5uRGd4/EMaqbO+dHt2amOM?=
 =?us-ascii?Q?HZvXjtvGdEOZlmZFrNiKKZNhJyBBf0/UCsqItb/WyQFjjw2uwjdH6LDIPdC8?=
 =?us-ascii?Q?SsFoSgq+eYZV8usklh/JbcPRtVXT93Y3jjqIYrgvWGMaSx4hd7Af7aM9AKg/?=
 =?us-ascii?Q?TBeWhsICtqcnzkVuN4i6o/M2rTxHBjbnkxTvIpidO1milxsh8xcgtVZlvFAY?=
 =?us-ascii?Q?I2FjTEag3bgESrdhYyUair3CwFcq+17wbe+v4c1TKndkcroKUfACoxVyfw9S?=
 =?us-ascii?Q?chQyWpIoA5UkY5P6SW+l5hzXIuhUewf2I2z2nPXTN9qFKDz5mAw4hcf00U44?=
 =?us-ascii?Q?T+gv3mepPmbvQY2Gyj3slYTodPSKgiVhhcTBOUqutwhKBVT7m0GRG8opxXwT?=
 =?us-ascii?Q?nc7bshA0TjQf7korc5lbPOaBQEQkJu4nr/9dGxvUU8StVGx9qEpvmCzbp5Qt?=
 =?us-ascii?Q?8c+Q9OYeI0/Rh8hpHlTJY6Bsp3Qa3hib6dEyg6eV8vquyNXabUF5ygTtcgxx?=
 =?us-ascii?Q?ZG/33GI3ncTWs7XG4O2VB4uDRPrmWd6cpduhBzRqneMsXU5sM22zyYVmbqp9?=
 =?us-ascii?Q?Qae/x3wkM+CWq6efEFIVUNg13/+8qtS5cebAVrg5HUEY0HTajLiIp8Y/0vAp?=
 =?us-ascii?Q?OkQfocI24USL9P5nlL//uUD0GlVIm2EcKRrefeUu0+qgiGPH82iY1tjCEGrO?=
 =?us-ascii?Q?51r0TLx1vasexmqNaGHEDBUKr/I5UisYepk9wKesH9L2/bUiMVz3zJ7sdJQM?=
 =?us-ascii?Q?EUx1RhQa5zPh5HRMT70L15AChzyFpZdBn71wjfNtWsJWdcyPeDtNYB9m9YVB?=
 =?us-ascii?Q?tjHuM7w0M+w0nm6VlpixBLtyfJy0zqS0RZQuHUp1nts5qNfZvDbIAkY62yAG?=
 =?us-ascii?Q?6f5BGPRUgD0FwItdc81BaOJJL7TZh8zppKsgxJ+M2POJExJRMJiwvxxByXQD?=
 =?us-ascii?Q?bqpImBNEFHB82Wjta0ZuEDFzzvuxNzKeT7LeYMRepgZup+TWTgRUqh8e/Cws?=
 =?us-ascii?Q?/OQQObYlMG/bVvN1TVP7mOyriwUphR/H5SlzOA5XZEawWTjtgU1QEMPYNltV?=
 =?us-ascii?Q?DoJcbrP2Cij6kfFkhWa5s2kT7jORcSuAIK1+xpZe2S+wBIODdNJzrF2KWO/y?=
 =?us-ascii?Q?WL7XdvYNtQZD89ySOAc1hIGwQAWcH7fhUbkDTNXvXZl2wUmB2ePh6f8flk2g?=
 =?us-ascii?Q?6hHyP/i/wedz8E6/xmUwUSLcKcTm7DOvt/KjET5wrMEX6cM4oFof2yFwQuQ6?=
 =?us-ascii?Q?8ft6d2lnMYBXHNJ9F7rpX1PdR6tI/0NjsjWwJqj8SYXtQji8PUV+6NoQo/XK?=
 =?us-ascii?Q?DL0lX55Wfq//59qnbIGiQHKpwePMICFK2Fkfh2oxpAAYQQpsf6RZgi0Mnxcg?=
 =?us-ascii?Q?39lmcub+EhGJtvCkw4g28p/X7b/RFkL6YVfT4yUVupJSDA1Kzt096PEvRp05?=
 =?us-ascii?Q?t3SOGcjVbRU7/SMKVWY9xXb+0iNRjawXfEcrrKqkNO+XtxBlsboDlN3s27Y6?=
 =?us-ascii?Q?FawsBy/yJG4VKBsZw9d4hZrr8MsA8y5FG4qskOoo5c2zEvEIpjtV09otT1d5?=
 =?us-ascii?Q?/KxSmBLurq8Ub1rbRwYzVlqpwTM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 513ad05b-5d4c-41bf-61a8-08de812273c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2026 17:03:30.3889
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WB5Vwwj2fzVQMBrv3WnNtgwWp8FXmj3011jg7wPWgWvfdpvqAlMU/YapxkqPcdlH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB8948
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 17:03:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233065

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Ashish Kumar Mishra via lists.openembedded.or=
g
> Sent: den 10 mars 2026 09:10
> To: openembedded-core@lists.openembedded.org
> Cc: Ashish Kumar Mishra <git-patches@bmwtechworks.in>; AshishKumar Mishra=
 <ashishkumar.mishra@bmwtechworks.in>
> Subject: [OE-core] [PATCH] shared/fdset: add detailed debug logging to fd=
set_new_fill()

This changes the systemd recipe, so the commit subject prefix should=20
be "systemd:", e.g.:

systemd: Add detailed debug logging to fdset_new_fill()

> Currently, when fdset_new_fill() fails to open /proc/self/fd or
> encounters an error while processing individual file descriptors
> (such as fcntl or fstat failures), it returns a silent error code.
>=20
> For debugging rarely reproducible failures it becomes difficult to
> know the exact cause of failure
> This commit updates the function to use log_debug_errno() for all
> error paths and hence  provides better visibility into why FD collection
> failed, including the path of the problematic FD (via fd_get_path)
> and its inode type.
>=20
> Upstream-Status: Backport [https://github.com/systemd/systemd/pull/40385]

The Upstream-Status only go in the patch, not the commit message.

>=20
> Signed-off-by: AshishKumar Mishra <ashishkumar.mishra@bmwtechworks.in>
> ---
>  ...-detailed-debug-logging-to-fdset_new.patch | 97 +++++++++++++++++++
>  meta/recipes-core/systemd/systemd_259.3.bb    |  1 +
>  2 files changed, 98 insertions(+)
>  create mode 100644 meta/recipes-core/systemd/systemd/0018-shared-fdset-a=
dd-detailed-debug-logging-to-fdset_new.patch
>=20
> diff --git a/meta/recipes-core/systemd/systemd/0018-shared-fdset-add-deta=
iled-debug-logging-to-fdset_new.patch b/meta/recipes-core/systemd/systemd/0=
018-shared-fdset-add-detailed-debug-logging-to-fdset_new.patch
> new file mode 100644
> index 0000000000..849f5cfda1
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/0018-shared-fdset-add-detailed-de=
bug-logging-to-fdset_new.patch
> @@ -0,0 +1,97 @@
> +From 0565f9f27323a8f9e62d85f2add542af99cea06a Mon Sep 17 00:00:00 2001
> +From: AshishKumar Mishra <ashishkumar.mishra@bmwtechworks.in>
> +Date: Wed, 21 Jan 2026 14:13:29 +0530
> +Subject: [PATCH] shared/fdset: add detailed debug logging to fdset_new_f=
ill()
> +
> +Currently, when fdset_new_fill() fails to open /proc/self/fd or
> +encounters an error while processing individual file descriptors
> +(such as fcntl or fstat failures), it returns a silent error code.
> +
> +For debugging rarely reproducible failures it becomes difficult to
> +know the exact cause of failure
> +This commit updates the function to use log_debug_errno() for all
> +error paths and hence  provides better visibility into why FD collection
> +failed, including the path of the problematic FD (via fd_get_path)
> +and its inode type.
> +
> +Upstream-Status: Backport [https://github.com/systemd/systemd/pull/40385=
]
> +
> +Signed-off-by: AshishKumar Mishra <ashishkumar.mishra@bmwtechworks.in>
> +---
> + src/shared/fdset.c | 35 ++++++++++++++++++++++++++---------
> + 1 file changed, 26 insertions(+), 9 deletions(-)
> +

[cut]

//Peter

