Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0026C25B48
	for <webhook@archiver.kernel.org>; Fri, 27 Oct 2023 20:13:28 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.82])
 by mx.groups.io with SMTP id smtpd.web10.16449.1698437606370933871
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Oct 2023 13:13:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=PQAdKqu6;
 spf=pass (domain: axis.com, ip: 40.107.241.82, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D1P6LwpWq6g4Ua07chI3JwglmYxqYo4zU2hFKiUkwH/vOjCHZIAUKoza5BF/cUvoXNyI9AlgUutQWloCWhCtrdvc0Oy0gH4aDVEIgtz25hyL26cIUW4efgwEvvJqT9tKSE1Frch2GWkXXxSn8h+02H06FBCyhzoUWOJBNOgfJk9/Sp2wzZpjL+mN+MkRAN/sPAeW4TOavQEL2XxrEYRSDkv1NDfAVa0OoaIemz1imecZGz0bPHE4zCtlYagdSAtTkjfyQi4Bb/IJVUr+Xz74O/1lBcLP4IYp+wfKKObvW+ABI6KKORIJy3hY9lqJWPgzXZheM7+57WVnvMMNYZ7iDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IPV5KcArsOfbmkufa2DMs5t/4Hjcs+5isnrP5mbAtfs=;
 b=bTq+TK2YJcwN6ZKEgSCrs5B7kCQcJhmjygd9Vw+PQ//lykmqQWq/IHLz94N4hFs470kAjo+rfbYUkJdTjEgCCgUKBR7bp2ksLRCkcAV2j4p0KntzAZgpYURSkq/y9+jDUhIvwp7t0CLi1ucw1hoHx/7Hdqm2F1bHq1+KxkfmZDK2rX2jxQYZ/bxlc/K3kEDKaK2Pzk8FhVTtpHsbD6baax2RyLOWAL++yNRb5b5HGDZWwEEqnr/VUF7LBU0FnablakVpjKk8qGquTitO/tc53DkfrTkD7+yGlTBnSgKX3+5xGge7nb+6kK3DDI2tgrYw+/0G5/XIKiSg9bpdRofnfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IPV5KcArsOfbmkufa2DMs5t/4Hjcs+5isnrP5mbAtfs=;
 b=PQAdKqu6RmravGq+AAJVMkPoJFD3b7FxkjF3ECz/sa/KQmc1A3UgKBkONdijRQh/XkzX/HfR/Qc6FdYwdEwAarnk8KlJEVTyy0Gpgi9RRrTBdlHTRpeOezCzJ38s5m7JTT449jAJpSvrWPQlP8YKtbkzDThk28wuS2EwjXKXxPI=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by PAWPR02MB9102.eurprd02.prod.outlook.com (2603:10a6:102:33a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.19; Fri, 27 Oct
 2023 20:13:22 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1b86:94ad:137d:4093]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1b86:94ad:137d:4093%6]) with mapi id 15.20.6907.032; Fri, 27 Oct 2023
 20:13:22 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Max Krummenacher <max.oss.09@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Max Krummenacher <max.krummenacher@toradex.com>, Randolph Sapp <rs@ti.com>
Subject: RE: [oe][OE-core][Patch 1/1] Revert "bin_package.bbclass: Inhibit the
 default dependencies"
Thread-Topic: [oe][OE-core][Patch 1/1] Revert "bin_package.bbclass: Inhibit
 the default dependencies"
Thread-Index: AQHZ2L4t06mbaUk2FUiu6ZgHPJ4IO7Becg5g
Date: Fri, 27 Oct 2023 20:13:22 +0000
Message-ID: 
 <DB5PR02MB102132C49C1C5BE09ADCDA67BEFDCA@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20230827080953.2005190-1-max.oss.09@gmail.com>
 <20230827080953.2005190-2-max.oss.09@gmail.com>
In-Reply-To: <20230827080953.2005190-2-max.oss.09@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|PAWPR02MB9102:EE_
x-ms-office365-filtering-correlation-id: a90a6d1a-07f5-48d4-4422-08dbd7292b38
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 re8jx8eeP6izPu1zf3/bw8yS3a/rcoCesnbaV9XkT+xO0ME76a0NM9KFwvMFAHnOTCJ5VzYqtdBFXlDbU+9drkQhEtAbZ5Rtv0RsWFtH8hE8Fp6HyV+lTQVq01d4njwpBl5b1gEUMP+ITjwGV8oGZnsF4nfSntnf5hpOCSTMymAyPGIOUsiW5gW6IKYiVOLzQ5egMql6ycznrJzK66xuJ+hokBAHrFavYuUH4ZGM+wxc2SHX3lX6Ae+9iJwILQySg+d3DNmGcNmaQS2OfKte0xRIdj5pfkBRTrIcr6dXJYjMgW1Scv+ASIcC+NaBhkKGKRugpZTXlxhGQ11Hfj6wrfDj9YGUAq9xAbArc+mgmOGdUKrg+mjWD3/76koLFCZ9CIgERs5TE32iBpNgN+7dEB9/xOEL54139rnhN5pzKntL4PfBCvotnObWfDsfdro5pfWHTI6FMukWL3uJkO3omfLuRn5+q5Vd8NzCh0plzugVWUzG3oeqwLhL4JxUU8SfJxc5MoqDWEvDo8A79BysCdi12QgHFDSjHSxr3BBl0sE3l/fijWMTW2QgWPuxgUH6DE97vfvUdk6N0L7nGzqE9LMI/N522zMChMho6C52Ksoe8nAQR9sGCnRCur3bqF7b
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(346002)(136003)(396003)(366004)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(52536014)(44832011)(55016003)(71200400001)(7696005)(6506007)(478600001)(9686003)(122000001)(66476007)(64756008)(66946007)(76116006)(53546011)(110136005)(33656002)(86362001)(66446008)(54906003)(26005)(66556008)(8936002)(8676002)(83380400001)(38100700002)(4326008)(41300700001)(38070700009)(5660300002)(316002)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?IGOYjCYKbSjzFBbSTAf4uVaRfmn9qbVwkWwPAuZHjU4egWG4QXZeJACshavD?=
 =?us-ascii?Q?Jo2LgKAeJKGHGoDa04cnKtHwyn5tDxZ1ZblfMJLhxG1w9PrWEeeG8Fvrnj3v?=
 =?us-ascii?Q?x0w36q+UMkur6bDdsiYGqb6shZJ8QiCFCYmoZo81lErfXIKFn3hBLXkeVx7p?=
 =?us-ascii?Q?Ga6xFey6iu9s8nCZckJsKpsWT3utxwLv0n9DxMV1GlXEbvYSEJh6j8aI4Q1s?=
 =?us-ascii?Q?9I6zzu1hhr0OBTCuhKncjyl18qKBp2RddGNXfCVswEwi+UTepmWngybzlCjn?=
 =?us-ascii?Q?iz9i5ednHOdCLauIwLd2HnGtAXpgAlphgK2hMN0/ycbxAypDlfX12QejoSaL?=
 =?us-ascii?Q?WZ9zSBMWmjq28NLKFS6e4HkW1Vo9S5pnFJi6JjVKOtOnC/88cVjwSYRbZdbk?=
 =?us-ascii?Q?6pHEApgFozfT180aHQx0QSmc1a5fKqTWBmybWZ/IzRi1h0qulYvRHiFad+s2?=
 =?us-ascii?Q?SN8H9RniOuzYgPqZxrIt+k2+gP7P6TPRkO56XqdXxfrNx2/SMSQckUb16Gv/?=
 =?us-ascii?Q?CDs2GOHMudoKBHVCYX0rDA/PhvcWJaolV9OF4+Pbec5BllIzQhRcXrnpAwZv?=
 =?us-ascii?Q?LlPXoQGLjrRNjH+DGs2dh/XTP/B3l9/yQ+xsmYMFwKRa//pco09H0pEIRMqA?=
 =?us-ascii?Q?fG2176p4RJn7OtgWQZ3aW41uf8nuCRH0uHApf4PD4a3fJdjNdcvl6lr7hPh0?=
 =?us-ascii?Q?xal6WrQeNTBPIwiv7YSrNV7EwPE6GQiFmyaGo4nDMMwjTpdlkmw6lfQ9Dczi?=
 =?us-ascii?Q?MPYQ5uBkqL+Wil17l7DBaN81G/YoC61ZBpE7oUTTVhYL6kr1GCxhmG3yM1Rr?=
 =?us-ascii?Q?hkv6Tuc4yecviw2rXvhy1Xze9OyEFhOtZjVlVnt1IU4acRnzK+ojfODzAhiv?=
 =?us-ascii?Q?tVqTuaKo7ikZxxi16+fh+dCrQQWrZbaO2jayCmnJh12qGoM4yXZDhNowbUOj?=
 =?us-ascii?Q?s/HOcUqgquXk6vJMeW8EgeXaXSctD/FPIWHTWjyHzVQVnj92VSkLQ0GMRrip?=
 =?us-ascii?Q?c5i1C8RDvH4H8OivL73pQYdNduKD81K5uPdCI7gUr1DuwJbOYjbuVIR6qKSq?=
 =?us-ascii?Q?/hONBULAIlSITLX15CmwrVf8XY0gO6BwGHn0YBuMKnidejjytyf48gxip9tJ?=
 =?us-ascii?Q?f0htdHKoMxHh2T54nxvzfK5rX9EkBJEi8xsgdbXeE1tGhaXou/fqI7HNms3N?=
 =?us-ascii?Q?6G3si5ud5yhUg5l8m9bO0Jn65zhDXjShQu9rB3jw10e2mTVLvGm0IbqzQ8sZ?=
 =?us-ascii?Q?muB0S8XjXUjDGEKm9omBTULzShQx+jO7/L1ziENHGE4zjwofJF1jEHLiZL82?=
 =?us-ascii?Q?yKsZeWi5yxWsebenBwj1YzsI05vy3KUC/C7ZH9aNlh0Hn9m+aXZnF4ycM/Iq?=
 =?us-ascii?Q?Lj8edkejf6z+oqDDLxOMzdP0s5X+tTvQEloIEcRwaU0sqQBhZ4/nMLsJI6j/?=
 =?us-ascii?Q?bZum+HFJyb2N6C5JoJF4no+aunJZUxoYtjim95winJmcS1uG7rWJsWIrpFJa?=
 =?us-ascii?Q?Al9362Sc12vHZuk7A5dOfPMeOLGVbzTHyexjidsrF3r/vV6e/BCCbHGQy6sS?=
 =?us-ascii?Q?hE1CFqAlXoVpn5xjhlY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a90a6d1a-07f5-48d4-4422-08dbd7292b38
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2023 20:13:22.1759
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r5a9weB7oatH28pC2m27jBaV6nfO2GUNIPpsnapX0Xo0/vZWGrBPxecXUWJjUcHV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR02MB9102
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Oct 2023 20:13:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189752

*ping* This needs to be applied to both master and nanbield.

//Peter

> -----Original Message-----
> From: Max Krummenacher <max.oss.09@gmail.com>
> Sent: den 27 augusti 2023 10:10
> To: openembedded-core@lists.openembedded.org; Peter Kjellerstedt <peter.k=
jellerstedt@axis.com>
> Cc: Max Krummenacher <max.krummenacher@toradex.com>; Randolph Sapp <rs@ti=
.com>
> Subject: [oe][OE-core][Patch 1/1] Revert "bin_package.bbclass: Inhibit th=
e default dependencies"
>=20
> From: Max Krummenacher <max.krummenacher@toradex.com>
>=20
> This reverts commit d1d09bd4d7be88f0e341d5fccbfbefeb98d4b727.
>=20
> The commit not only removes the dependencies on the cross compiler
> but also does not depend on e.g. virtual/${TARGET_PREFIX}compilerlibs
> and virtual/libc which in turn makes the file-rdeps qa check fail
> if installing binaries linked against e.g. libc or libstdc++.
>=20
> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> ---
>  meta/classes-recipe/bin_package.bbclass | 3 ---
>  1 file changed, 3 deletions(-)
>=20
> diff --git a/meta/classes-recipe/bin_package.bbclass b/meta/classes-recip=
e/bin_package.bbclass
> index 9dd2489725..3a1befc29c 100644
> --- a/meta/classes-recipe/bin_package.bbclass
> +++ b/meta/classes-recipe/bin_package.bbclass
> @@ -20,9 +20,6 @@
>  # they would be in ${WORKDIR}.
>  #
>=20
> -# Nothing is being built so there is no need for the cross-compiler.
> -INHIBIT_DEFAULT_DEPS =3D "1"
> -
>  # Skip the unwanted steps
>  do_configure[noexec] =3D "1"
>  do_compile[noexec] =3D "1"
> --
> 2.35.3


