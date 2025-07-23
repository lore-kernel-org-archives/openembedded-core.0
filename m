Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0AC9C83F17
	for <webhook@archiver.kernel.org>; Wed, 23 Jul 2025 06:14:34 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.7])
 by mx.groups.io with SMTP id smtpd.web10.7485.1753251272492576578
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jul 2025 23:14:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=Cke8u3Cn;
 spf=pass (domain: siemens.com, ip: 52.101.70.7, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eIuEh9s+iODWZpeUrn80apn+i4hYWYRGRkIW4mm2eEynSqqZ5ibIr3IusUoTu7Z2WR71ckTzj+iT/Pe7WssWPQ+zQe7LNRTAdhI2UzHWXtzQRbTMBTesNLcwqIyZbLa8doUrcRABcU11tBdmxNTu7YZa5wRj7VSmCpK4wnk6vwbTEzTjkzNEPb1TbOHUsQq8kjB8e29l3AvBwamxKeMzaZRwIKCn8HDgLbV9i6m5dM5C8Ne/+i727XV1hyB7k41MJpH819drkMkMXpSEY2fGYIGaAnAvIHuCs8NGxTonTYkEAiuj2/nq+lU7ABj/PAnhmpawFg5chllK33El+TEt4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H7MlYdCF9dqi0l8xUUE3xtkKAVM6LGu5TLmxpjjE1ig=;
 b=UP6hKEKPUL30BaRY3a2Pbn+hgHIQyn7j/2CFT6L3OlSkhbA2yKSuaPBUOoWVCDJvVXRIneanM5NwGRfYxphkpC14l2Vr+scmgptqCPw4JkoVPY5hVIxbA2e77hEGUtDYPiXTIhi+oQCRsib2bSLEEwWJ7Bke1lUyQm2pHipwOW8VKsqUt4HiwOBDbhWSxzw7ZkHYzpdQfbsi5K9T+3769THUWa24AVkTT80CUBnbqfl30oedXjAQrDGyoKwHaIrdbDPfo0N+z09+JW6N7xglvEMXcG8UPDC4aHorCT/oxSk08EupZjGGZSQe1gEJgk57t91UReyAc1cvulLWLPQgkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H7MlYdCF9dqi0l8xUUE3xtkKAVM6LGu5TLmxpjjE1ig=;
 b=Cke8u3Cnzqle6X2BqRDsg+eEUGYqhj/YGwb/9mhxva6mETJscwkLaXr4MYvikXpL4k402/QHijwzNTA2gmCty6hVBGzQ8MRtvoFSnVYuA3z6JIy+2w/xeoUgpW+HoPYZLovI9moJCWhpShwhqZn8M8VhnpE5M24GY0QCBD3i6nvtvypsTLsUbrpVPH4RS7C4aXwKZxd0OjzlR8nq5MVSkgRHbodcjjftmR64fq2StJ79zvElKkRPww0YZ5YJhlilLUHRMKzqDVudSOUezPfFW2Sc68sAmTMV1gfZKn6ZHX7y9tZqnchT0bFptjRmCQXm6gXDmqQ0oDjwv4Ob86Jg/A==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by GVXPR10MB8682.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1e8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.26; Wed, 23 Jul
 2025 06:14:28 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%7]) with mapi id 15.20.8943.028; Wed, 23 Jul 2025
 06:14:28 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "ross.burton@arm.com"
	<ross.burton@arm.com>
Subject: RE: [OE-core] [PATCH 08/23] oeqa/sdk: add helpers to check for and
 install packages
Thread-Topic: [OE-core] [PATCH 08/23] oeqa/sdk: add helpers to check for and
 install packages
Thread-Index: AQHbwYfcTu4nt2aojkCYFO9m3WWvf7Q1KqxAgAqCMuA=
Date: Wed, 23 Jul 2025 06:14:28 +0000
Message-ID: 
 <AS1PR10MB5697200926409DD54A0C65DCFD5FA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250510084400.269726-1-ross.burton@arm.com>
 <20250510084400.269726-8-ross.burton@arm.com>
 <AS1PR10MB5697CDCCFB1F944F706B775BFD56A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: 
 <AS1PR10MB5697CDCCFB1F944F706B775BFD56A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=4f735346-8fcd-41b9-8380-f092e9b65944;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-07-16T13:38:09Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|GVXPR10MB8682:EE_
x-ms-office365-filtering-correlation-id: f0b84b03-3d66-47be-ab11-08ddc9b02e2c
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?sl/waC/PGzQqe+yPrizPVV1JS/v21tgHcpthuPBKvjrir7iKNH1OaawFTCdu?=
 =?us-ascii?Q?Py1pT1PPha1KBKJkSqllQT7z8J86qNCR+qCDW520a5NxyL5hJ2uQkXpsPQU4?=
 =?us-ascii?Q?K+3V90aMeayPAkAqdl133SX1qIpQLUDbkQKN6AmXvymtZkX+raZFA25yNcGJ?=
 =?us-ascii?Q?mEF6NVve3uTJJqlNLXW7rmmXfwz5ycQ9r54VCgE123ZjSg/UAySi+0X2dSXF?=
 =?us-ascii?Q?rQu5I5nsFMqCEpDs6rEaAIjbROLsPWssJwyopjkhnGtZYW+KyvfOkODypJk/?=
 =?us-ascii?Q?V3clPq2yhTelVlya/4sq3sVqQeoqnmTjLEUM1j+MT49snF4AgMmk9cp8m4xi?=
 =?us-ascii?Q?l1QG1bMoGdIxLGOlyvhCCEuVhNIIosHaqTZJCwY7djztMpIeahOBeSMgK/5s?=
 =?us-ascii?Q?v8/hxKcQJjEqnXTIfh+0aAzMGtllOJbyTeFO3epVYiEKdhHP4crPYX6ecArN?=
 =?us-ascii?Q?LmudE0a2ah1FerAQbAJMjwjXXVv+gKi6jTzNoGKvRc66URLxMcGgy1VZU20O?=
 =?us-ascii?Q?A34HGQ9FNArEcldnI6sWNg+0E3txk6+BFx35TEsjeUYwut6B90Mx75T7cnu1?=
 =?us-ascii?Q?WS5/Enz1rbzg5s7zgmTRHBJikYme7Nw+Y8i7uC0xuSJkA7NytlnmLHByFz1S?=
 =?us-ascii?Q?dMnkiQjizP3GRuGFND47wy5w3m7CspruO4RjEFpiaadgooSJOAN7P7M9iGpU?=
 =?us-ascii?Q?2CLGbyLl/5BMWkJWjIGoG0KhRCTcrZFyGACWgbfsgsBQMiny2y8BF+R+X6Qm?=
 =?us-ascii?Q?JUqYGwenXNSv3J0FAc+8KkOG9jRv5qwdrqfkYcl/CYggDDu+/IgJneaiatVn?=
 =?us-ascii?Q?PYhXnD75SkFYGKbX8UGtvR7OD1dcDmNxT1pIUPb1uLaXhAlIr6g3VK8yy6nn?=
 =?us-ascii?Q?nKtFiicCvcbh2a9rIOK8Tnbp1inWypftHXJTdQrrKijv6cCAGxk01ASk9dOv?=
 =?us-ascii?Q?dB0lg5uCvLTdoemlt3iu3/W58Y1LVrE5z+H53QzNvlpsxk6a9xHieo8ZqSvt?=
 =?us-ascii?Q?7sX/tG6eEHdKfGLislytaGu5qZW++ukdYXmy2KN2AKPVAlb40uPKjvb8O8fr?=
 =?us-ascii?Q?ajPXgINzprkOGJucbmqj5+AgVVck0Y/WYA5advsIim76BLenqCrlzxoc3fHf?=
 =?us-ascii?Q?ar+wbYL2jIAnmReS1zOhgSq5Sfx0UPK1kFuwn/RRK3HTQtd+MidcdWvXFhSf?=
 =?us-ascii?Q?WpiK1h69ovJG95k9PmzW0se6ceYGMOevqtk5SQGYY9Jz4A1Vjedt4MQ2LEXL?=
 =?us-ascii?Q?mH6NSgOwE3ZrjD389AmKbMTdekXreBSmsW55f8dicpK7bNtPzamPAJiySnVI?=
 =?us-ascii?Q?4on6k+B7HmDF0d7g0Rve1hmfNQt4N2kTP6mVoIcEWolon5s+wZQioNvLYPXO?=
 =?us-ascii?Q?x+KgElJgb0FOrr81TzhZJhJJ2MBFboKb5dSPCnKjYJrs349SGDHbTF5aNcdu?=
 =?us-ascii?Q?B3U8iwLd3x8=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?otP536nTaL+Tpj++ck3MukNrgpIIQfpzV9O/dFopK9RfWThg51ZIYkcewLJm?=
 =?us-ascii?Q?yws0Bd0LpfoXdiyiwhwiUBp2dgCQejOZTU/chLUR+cAA+iSmapjNiATea0Bq?=
 =?us-ascii?Q?jV+Eiao07uwOZu69PpxXoeplKKXXW/BYOvXx8TPpdzgWxMsuzRI+d+svZr2U?=
 =?us-ascii?Q?s1eyh32Tq+9K5VQ2Jr9qc6RQL/AbefbQx4POxXaDGL0l9IY3GXBAOfZNSpKN?=
 =?us-ascii?Q?hTvFyFf3fUt8+kqp4nxUubkZJz0BI8VaZ3Dh2wzpnpEQO3kau7Zf5oY3QtVk?=
 =?us-ascii?Q?INwwc7Y0UsyzNxDLmrhgRr8lf+H7yw5cw3oYCamQbZW3KPikDGAxSfPQC7U0?=
 =?us-ascii?Q?vg9SXI3NFhRuw1x2bBOXR9Owdz+li1cp55TQ7838SqMAlacJfa9cKa1NmHT0?=
 =?us-ascii?Q?+Wb4gZV1wEfvoZB3nnIIH8Jdjq9GPsJCq3LWGel1NDUskJAOHgHPagFP+MbF?=
 =?us-ascii?Q?KA4CaS9ODCOtGDpeIWSq8n82Y2Ugj2CpbBfK11ZCFYMa1DatZ4xaKRMxnvUg?=
 =?us-ascii?Q?yPeOkXuFjiDoJ3/27QAjmnTtALHHlfJLRNY4YSvQ8boIlTDkI/r4n3nh+ask?=
 =?us-ascii?Q?RRQrZgEMOKvKSIOY/yjx0SeC0gkG5jkBZ63/uK+TFNA0AC6g6Hr2k7CNe6Gq?=
 =?us-ascii?Q?BQNGO3pNh01EQd8CBJxBr1m9rD088vqCjGdM/RRlKHsQT0u4jgc6mQoH8drd?=
 =?us-ascii?Q?HGM7LGk8bqtMvQnAk6/YK+OKWpc4uZYv4mqarYkfyKJswmpeSbTfKO8f+9n3?=
 =?us-ascii?Q?UNvxwYlUgiaJ63QTLeZHhcZ8yqJjXR36OJuo1CfVz/ny7Ea23a8Jmro2I2b3?=
 =?us-ascii?Q?EebhouV6SLMmc8ZpvjkKqAdwbAqeRpQG4NPJ5xFzG3BxS+A0WvuHObg+b8SJ?=
 =?us-ascii?Q?mywN3wN+8DvuayxbWFQf2NNajbH+hHmTyXgVofhKvU7PofxNqPI58YguEofM?=
 =?us-ascii?Q?EfchrkSu/n07wFSu4N+fG1JpnvYM5oaXB06LpX4TfrLtxiqj69zrey6KS38r?=
 =?us-ascii?Q?HsZ8aLuWbxCZIDB8yrHZnGnGa1Xwi/nvn+rjQX+pa7/0++9rSfM1fO+/7Ywl?=
 =?us-ascii?Q?HTdGceCx/S840z/addngZi6ct+Bh6rdFQ5BHbl/PKa66kjMtEn4jI3bAQCQh?=
 =?us-ascii?Q?ZmIqqz4eiZPjv3ptLxN5rbm7Q1qf1izpsh45NVDjqGbU8Oiz1qZeWbSEzVZ+?=
 =?us-ascii?Q?tCcbwxbSb2rpYS8CwVfvlqV9Z4OLl9yBdAo4QJ6gT2m/3A2gugkfxXCc4six?=
 =?us-ascii?Q?CPV6AVw0rwGTOGUr0lWsc0fnRxKUy5PA9bHR3d052xNiO41j7Rf9TgdbZbhn?=
 =?us-ascii?Q?XB6KbYdH1TDuT0YFhOTY1kxYQSDE+n7LjVd15Fs9ac8YObaWmfWEiOsY5pys?=
 =?us-ascii?Q?mRDVGhK73Lc+ysITU4VKUz9DOJIu8gRFNqi2OIRwfnrzT+n4IMPZGlIoW40t?=
 =?us-ascii?Q?QkdiOCS7zkcAfGlOGcvcpR3WJhkCvUUwEH8Vqe2utnTYUzyXTVQDj92HfbB4?=
 =?us-ascii?Q?6swaW2nuTFVEv7Kd8PPzT0d+d1pvA3r5TCOgjdseScq8LXsFo8DcOwHyU1Hj?=
 =?us-ascii?Q?nsYD8eCBftNj/iQDgrZRjnXXKHeXFKvROmEcdIeR?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f0b84b03-3d66-47be-ab11-08ddc9b02e2c
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2025 06:14:28.2507
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xJydwB+fO7LRNz8K2fgSjDwqELq01qcQHaLahn+B6OlItnbV8lUGBbixMXILvS3Vb2Ow/yKnsfG9QKWQHNvK0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB8682
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 06:14:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220790

Khem,

you mentioned the maturin test failure problem on IRC yesterday.
This is the commit which broke it.
I'll propose a patch shortly.

Peter

> -----Original Message-----
> From: Marko, Peter (FT D EU SK BFS1)
> Sent: Wednesday, July 16, 2025 15:54
> To: ross.burton@arm.com; openembedded-core@lists.openembedded.org
> Subject: RE: [OE-core] [PATCH 08/23] oeqa/sdk: add helpers to check for a=
nd
> install packages
>=20
> Hi Ross,
>=20
> I have a problem when running oe-selftest after this commit.
> When I updated past this commit and commit which uses it:
> https://git.openembedded.org/openembedded-
> core/commit/?id=3D11277efd057685558a744e98082b5709e849dd2a
>=20
> I get following failure (on Debian12 VM):
> =3D=3D=3D
> Traceback (most recent call last):
>   File "/home/projects/builds/poky-build/poky/meta/lib/oeqa/core/case.py"=
, line 54,
> in _oeSetUp
>     self.setUpMethod()
>   File "/home/projects/builds/poky-build/poky/meta/lib/oeqa/sdk/cases/mat=
urin.py",
> line 35, in setUp
>     self.ensure_host_package("python3-maturin")
>   File "/home/projects/builds/poky-build/poky/meta/lib/oeqa/sdk/case.py",=
 line 47,
> in ensure_host_package
>     self._run('devtool sdk-install %s' % recipe)
>   File "/home/projects/builds/poky-build/poky/meta/lib/oeqa/sdk/case.py",=
 line 17,
> in _run
>     return subprocess.check_output(". %s > /dev/null; %s;" % \
>            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   File "/usr/lib/python3.11/subprocess.py", line 466, in check_output
>     return run(*popenargs, stdout=3DPIPE, timeout=3Dtimeout, check=3DTrue=
,
>            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   File "/usr/lib/python3.11/subprocess.py", line 571, in run
>     raise CalledProcessError(retcode, process.args,
> oeqa.utils.subprocesstweak.OETestCalledProcessError: <exception str() fai=
led>
>=20
> Stdout:
> Trying to install python3-maturin-native...
> =3D=3D=3D
>=20
> See below for comment in code which I see as problematic.
>=20
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Ross Burton via
> > lists.openembedded.org
> > Sent: Saturday, May 10, 2025 10:44
> > To: openembedded-core@lists.openembedded.org
> > Subject: [OE-core] [PATCH 08/23] oeqa/sdk: add helpers to check for and=
 install
> > packages
> >
> > The existing tests simply look at the manifest to determine if a test
> > should be ran or not based on dependencies. Whilst this works for
> > Traditional SDKs, it fails for Extensible SDKs if they've been built in
> > minimal mode, where the manifest will be empty.  However, minimal eSDKs
> > might well have available sstate to install the missing dependencies.
> >
> > Add a pair of helper functions to ensure that a package is available, o=
r
> > skip the test.  This handles nativesdk- vs -native (SDK vs eSDK) and
> > will try to sdk-install missing dependencies into an eSDK if they're no=
t
> > already installed.
> >
> > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > ---
> >  meta/lib/oeqa/sdk/case.py | 58
> > +++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 58 insertions(+)
> >
> > diff --git a/meta/lib/oeqa/sdk/case.py b/meta/lib/oeqa/sdk/case.py
> > index 46a3789f572..1fd3b3b5695 100644
> > --- a/meta/lib/oeqa/sdk/case.py
> > +++ b/meta/lib/oeqa/sdk/case.py
> > @@ -7,8 +7,10 @@
> >  import os
> >  import subprocess
> >  import shutil
> > +import unittest
> >
> >  from oeqa.core.case import OETestCase
> > +from oeqa.sdkext.context import OESDKExtTestContext
> >
> >  class OESDKTestCase(OETestCase):
> >      def _run(self, cmd):
> > @@ -16,6 +18,62 @@ class OESDKTestCase(OETestCase):
> >                  (self.tc.sdk_env, cmd), shell=3DTrue, executable=3D"/b=
in/bash",
> >                  stderr=3Dsubprocess.STDOUT, universal_newlines=3DTrue)
> >
> > +    def ensure_host_package(self, *packages, recipe=3DNone):
> > +        """
> > +        Check that the host variation of one of the packages listed is=
 available
> > +        in the SDK (nativesdk-foo for SDK, foo-native for eSDK). The p=
ackage is
> > +        a list for the case where debian-renaming may have occured, an=
d the
> > +        manifest could contain 'foo' or 'libfoo'.
> > +
> > +        If testing an eSDK and the package is not found, then try to i=
nstall the
> > +        specified recipe to install it from sstate.
> > +        """
> > +
> > +        # In a SDK the manifest is correct. In an eSDK the manifest ma=
y be
> > +        # correct (type=3Dfull) or not include packages that exist in =
sstate but
> > +        # not installed yet (minimal) so we should try to install the =
recipe.
> > +        for package in packages:
> > +            if isinstance(self.tc, OESDKExtTestContext):
> > +                package =3D package + "-native"
> > +            else:
> > +                package =3D "nativesdk-" + package
> > +
> > +            if self.tc.hasHostPackage(package):
> > +                break
> > +        else:
> > +            if isinstance(self.tc, OESDKExtTestContext):
> > +                recipe =3D (recipe or packages[0]) + "-native"
> > +                print("Trying to install %s..." % recipe)
> > +                self._run('devtool sdk-install %s' % recipe)
>=20
>=20
> The comment above says "try to install", however there is no check for fa=
ilure and
> skipping the test in such case.
> Before using this code the testscases were skipped unconditionally and di=
dn't try
> to install anything.
> Here it looks like it should always fail if the package is not part of sd=
k (and
> python3-maturin is not part of minimal/sato sdk images on autobuilder).
>=20
> I'm struggling to understand how this passes autobuilder tests green and =
my
> pribate builds are red.
> Autobuilder logs show that the maturin tests were skipped and python3-mat=
urin is
> never built.
> Do you have a hint for me how this code can skip the recipe?
>=20
> I was thinking about installing it on my host, but python3-maturin is onl=
y available
> from Debian 13 (which is not released yet).
>=20
> Would it be fine if I submit a patch doing try/except around this line?
> Or am I just missing something vital to understand the code and failure?
>=20
> > +            else:
> > +                raise unittest.SkipTest("Test %s needs one of %s" % (s=
elf.id(), ",
> > ".join(packages)))
> > +
> > +    def ensure_target_package(self, *packages, multilib=3DFalse, recip=
e=3DNone):
> > +        """
> > +        Check that at least one of the packages listed is available in=
 the SDK,
> > +        adding the multilib prefix if required. The target package is =
a list for
> > +        the case where debian-renaming may have occured, and the manif=
est
> could
> > +        contain 'foo' or 'libfoo'.
> > +
> > +        If testing an eSDK and the package is not found, then try to i=
nstall the
> > +        specified recipe to install it from sstate.
> > +        """
> > +
> > +        # In a SDK the manifest is correct. In an eSDK the manifest ma=
y be
> > +        # correct (type=3Dfull) or not include packages that exist in =
sstate but
> > +        # not installed yet (minimal) so we should try to install the =
recipe.
> > +        for package in packages:
> > +            if self.tc.hasTargetPackage(package, multilib=3Dmultilib):
> > +                break
> > +        else:
> > +            if isinstance(self.tc, OESDKExtTestContext):
> > +                recipe =3D recipe or packages[0]
> > +                print("Trying to install %s..." % recipe)
> > +                self._run('devtool sdk-install %s' % recipe)
> > +            else:
> > +                raise unittest.SkipTest("Test %s needs one of %s" % (s=
elf.id(), ",
> > ".join(packages)))
> > +
> > +
> >      def fetch(self, workdir, dl_dir, url, archive=3DNone):
> >          if not archive:
> >              from urllib.parse import urlparse
> > --
> > 2.43.0


