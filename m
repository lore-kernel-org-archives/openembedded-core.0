Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A8F5C282C6
	for <webhook@archiver.kernel.org>; Sat,  1 Mar 2025 00:28:24 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.46])
 by mx.groups.io with SMTP id smtpd.web10.427.1740788895657862486
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Feb 2025 16:28:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=er0wAU9O;
 spf=pass (domain: axis.com, ip: 40.107.247.46, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zNn9qkUDWbRfz6CHPw9ScGFbaOvY1mik+c9pQXQ2AGQWn6t1nAgBGQSlrG2dGsIlnYYe8bnTCEMuX8pav2aat2mFA/KrFdOsb2sR1B0pzCF1cSFqaWUr0aBcYmSUAQVXB47kbrAKoL0Pw4czQT5z0HfGVvpDg42v08LQXUwvBLIUlyjVjKe/UxYzuCrvyA+QjOeFItvjoYgocMjqQWC9nugnT05QCmO+JOqubnZBtNpAiL63elv3V9yaoQukSWm82ynYwqF4DfrJ+H+DRSlNgms3SlBF4F3R1JRtmvmLvwO98aQ5rEwWd+IATHDoelwzx5kYQQXhiUGey8DvQI0CIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NdhFiplPB0/Mss24I8xVqiCDaRPu+6nc2rsH7xjV6qw=;
 b=OmhqBqWXxyl5XPLfR2eEfCyZNdglwWXxJRd2cptagJ/7PG5rajJuhbf97iHZ9lE/yipczLBoH7pfCdVJcyhpRUVt7svcE2Vbx2G7MUxaCqceA40jNxGLbAQQZ6ETD3yQQW1aqCB423bfnBYGdxo/iYG7xfs00nbyRNrNBNg0Cfvk8YhOyFBOTilnxcr4AF2F7f9mQkWN/MD+w3EIcn08wxiPd34rJA3BaeYhuf3irFyHPVRyF/4lPE0Ng96c1mVA+D3RY2Ev/oOxT3JvNSLN6zkO4Gngt2rzl/ZFV3sngNxwSJMJgBqTWrTQENeymmk0lgobLYws/AjC9eaizbza8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NdhFiplPB0/Mss24I8xVqiCDaRPu+6nc2rsH7xjV6qw=;
 b=er0wAU9OGLhtJCSAnaCqUDOyuXh92aVCLJn1mAOmVGyPdOSmM5JZVuhF7sbp1ZsoRINW7jPgAH8RSSvfSO0FXoNdP3LDCzcmA7GvDy5rQzpn3n5wgdtus+lN17o2PbPoR0MvvinoUCvD6cYKsRX39UYntrCkMtmOq4sCjIlqH88=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by VI1PR02MB6061.eurprd02.prod.outlook.com (2603:10a6:800:18e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.21; Sat, 1 Mar
 2025 00:28:11 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%7]) with mapi id 15.20.8489.021; Sat, 1 Mar 2025
 00:28:10 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "quaresma.jose@gmail.com" <quaresma.jose@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Jose Quaresma <jose.quaresma@foundries.io>
Subject: RE: [OE-core] [RFC OE-core][PATCH 2/4] goarch: switch the default
 linking to static
Thread-Topic: [OE-core] [RFC OE-core][PATCH 2/4] goarch: switch the default
 linking to static
Thread-Index: AQHbifkHUGDqj9j2T0qzLiosQQdtObNdbFIg
Date: Sat, 1 Mar 2025 00:28:10 +0000
Message-ID: 
 <DB5PR02MB102131B3D99D7F4F7C5BE75CBEFCF2@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20250228155301.1033479-1-jose.quaresma@foundries.io>
 <20250228155301.1033479-2-jose.quaresma@foundries.io>
In-Reply-To: <20250228155301.1033479-2-jose.quaresma@foundries.io>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|VI1PR02MB6061:EE_
x-ms-office365-filtering-correlation-id: fabba605-6693-4b17-d25e-08dd5857f208
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?nJE6meDyNaWyb7ZXO8BYzlXHzzwcNW6m0iSSAYXfdBtgyOZ+qYWu2leWZr0S?=
 =?us-ascii?Q?UI3jr/mcgE7TDeBGiTvypk+0EUaa7qOFoto+JkuLJ4UoRxtZM0igFycA/4Cs?=
 =?us-ascii?Q?+U+uk79ZizHAyojU9y75+Izu9B6Aw9iGeiFdbjVf9U25BZZG+1eHtzVq7wZx?=
 =?us-ascii?Q?0CeLcWIzjHi2BCj/9V99ahkkHDiujNybPUUZXkGvwLR9jaDgTLiupZahWl/o?=
 =?us-ascii?Q?xI2VlT25ArYh2a3tIKl8Zch1PytRy6FfNcpKUCLNZZ8AX+m9mmnpDCorUVY8?=
 =?us-ascii?Q?RMytDV+V3F9zOB7OxCGEu7x/R6ZuASQKc9F0hIyjEna+F6Le6YOvV9HG8wxz?=
 =?us-ascii?Q?1P73g9a56fzx0pxAWy7HOcGSeh409flWycelX622vP4aPY9lj5fcCfkG8uPo?=
 =?us-ascii?Q?Yz64xYtKYsrlwhboSihDwMWmfkhxhvXrYekVa2fJqOMdL5rd79wbh0okOBfp?=
 =?us-ascii?Q?1VmcoYdlwV4W1610U5V6d+THx4vBE1nEMPSoGiX4iai3Bj0rRj4s2OTVRlya?=
 =?us-ascii?Q?rUy7qWvGqzVeNuKsRfkS8KV3YrMOPR5JOZ7F69A+lYutTJHZkkuI1yObU6ub?=
 =?us-ascii?Q?KQbF+PdyHUwGoi4tWQFriFTA8m8Gu8VpXuA/Ap1nDE/xkQEGjA/ybu8lI15P?=
 =?us-ascii?Q?Px6GPv7+29GQ6VYgw9JGj6ufygim+BAZ7hUoG5RP8kHMpOA53BZIo+f3l0Ve?=
 =?us-ascii?Q?fXlzD0Lz5qaX04RXsHR1RG4fjnuOzXad5f0iCxNc+5jm+b+qRmtXMNEyby/b?=
 =?us-ascii?Q?edloDH0K7xP+e6GbOflZJcnezpQSwXzgXre8gENN4F04YXAOk1s8yZh3wHcd?=
 =?us-ascii?Q?HkLSX0IWXgiSvOx5aOug83RptripGcW+EVwen/XFElilDeC28NnDvF+D7kpO?=
 =?us-ascii?Q?+boN0t2L2fqO0PQL17FD1tWUr7zozK2/paObts0jq//f3z7CUPEAWN9dZVMx?=
 =?us-ascii?Q?Tm/LWrs5J2x1mxhZ+UwmfX4aA9hPjjJRaH0Iy5MUlKh6WuArNzLB1MpUb9MW?=
 =?us-ascii?Q?qe9v2nFylt1WpSaZHG6SG7jeAz/PnVLj7zEJtDyQO7EkldqjSPI8WKD1zYSf?=
 =?us-ascii?Q?G7zYxA0RijjivxzZt2yGTZZjMuVhn0uAfVPr8RXNIP9u0NSYtfJufKfk+RQ5?=
 =?us-ascii?Q?trOH7yrENUdMiaukorE+BHxgRlTFVmGq1IiVuty30muXbQq5ipR4+V2HR00k?=
 =?us-ascii?Q?RxCUsvzCl0reqOTVBGxIup14GgUCkxI/kxvoys+VY8hUApVEPL2KOjUa4oWV?=
 =?us-ascii?Q?2fz10Qp7q5YSTRYCCL0Od43MePVycX6MM/wULIAgkNPIsipwxqI2TfbTLQi0?=
 =?us-ascii?Q?w5Sdw4NeCCioyF7Qlh1OrFVgD/imc3R3oTtLsnqzGyXL+bAqnoV9DvAvXeGX?=
 =?us-ascii?Q?TH/N6GYc827TV4Vmg6mvALCj1J9xf1q6RBB9YQ4Pj4synTn8zzRz3pzhnh88?=
 =?us-ascii?Q?QIqFInn40/lP0/A+pP1pTJQ0n4pJtmue?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?Qcx8crc65X6od4svZvoCWSG0BdMO/liN7N1uSnzY8jAemtdOizsZeQRSxcvM?=
 =?us-ascii?Q?lCcHLLxrOMLYdFFF2I+EtwHGXTm3gt4J4O0sFDKPoP1CPncYFwnUY5bXKzOi?=
 =?us-ascii?Q?PZasf5SFzMjfhqHC1fgUhnfeGiBdokDuRAQoXdfnfNZwRiETRxN32tK0Qn4q?=
 =?us-ascii?Q?Lx7HpA9B6ulMrL3bmvhtX6AdpMAshCs6d6BdA9+YtdXhxTpmyDP+ai7UCp7x?=
 =?us-ascii?Q?MzPVC8KjtFTKeShaOtidG9MebHuPhxku92FKTaZe4yK4XfXHWwj/jGW/krTE?=
 =?us-ascii?Q?sGVoHzsFLKoii6/Ms+de7In9HbRHqm5m01PSjqHTuGGN2pxwv3VMIR9Bb+fl?=
 =?us-ascii?Q?uJSOsTuI1hcZwNC7CLLYaCkzNH6DIaguqkfDVyvNaBRPKuncfNz9Xk9VrqD9?=
 =?us-ascii?Q?79YRT53XjMyEFbdK9eFgxQNPZ7vJe2dqZ4QMBctD2Il2spedBMbS7VS3+CUG?=
 =?us-ascii?Q?LNxhqe894EIExXdB+f2x7yUfUnfVJnvxbtiOm6nirQ9LjqR5EWs9BLRDeSe1?=
 =?us-ascii?Q?32juO+9jjVdMGtGzth1cab8i4o+wajY5G7jYyrBSqC68YYg4dpUcv6F1kUt/?=
 =?us-ascii?Q?cRi3NEAQJ8Gu7Msz6zSugtiKwFgct3H6fOZ1UiXu5ICWq/aZq4EX2yE5Tfzf?=
 =?us-ascii?Q?dhUqmD1dQ2nx+n31DUTzeNVB2nNUQ89AKx9HyCMUuZyHuODVHl8CwqapKdpF?=
 =?us-ascii?Q?FRYZWgUDa/qLk+S/Zx3kO5jixvcUnIoIivbnblCAkshjqgU0QRxp4bM0wfOm?=
 =?us-ascii?Q?kOcR2cD1HAkUmVFTSZ1Kpm0LY8gOuGV/CV9dT0F0TXUX/wG+kiKn9HZxjVpb?=
 =?us-ascii?Q?YIrdxskHghPLo8zXUbAyJ91Sb5MjVDn67ybvnXXkgN21Fmo7UHZ8fHrBFvII?=
 =?us-ascii?Q?TaMcVh5tZyKmcw3drboJIq/uQnABR6QGDpGniJpvZ+awvvmoJIiK0mmiXNED?=
 =?us-ascii?Q?S3R+YeXKvp5Fml7sBHZVJw7zHHtedlmB2iPa2Wq8O6hUMBp9KE5N9UfiL114?=
 =?us-ascii?Q?Lz3TSf5+u/uw+DK20PN4qqjYgafElIQTl2FZJiHkBcIiDxFhcvdtzHsuJQY+?=
 =?us-ascii?Q?M34IuVpbgusUzY5tnY4dGL7HSCQH3/4x4wi0mt+bBPZ6dzcGX743AQ22FJ0t?=
 =?us-ascii?Q?ZaXp1gkksiAY9sEYatj/3bsZNgHjDtLt8mF9BXWW+ChuvYUbI5jwEIt5I6n/?=
 =?us-ascii?Q?UYf3XPgcNgL09adjqeOroRJyOLrwAr/JKpX9hU0BGXli+gWb/I1zs0+2xVa8?=
 =?us-ascii?Q?DVbifFwDT8hDpF3jYF3XhMRG18fGmGrr6uvYIHwh//EH65EvZVjuhwvdJ6TY?=
 =?us-ascii?Q?sgUi1C7ZBLSFiiDiUqk/bi0l4qQRv50xR88UFFbDuSyhaCO4x8x5zACBRCT9?=
 =?us-ascii?Q?cO/UNpsSWRSgMrHuDlC6JdlUpY5lNDGdeE+xdk4g/QoR59OpCZiYTF8d8BxI?=
 =?us-ascii?Q?UU0qf2SKoJViEyvYHse5E7CuSXCjEH1dUBRBoYauScmoHVri14ZmjuBGfBKg?=
 =?us-ascii?Q?gWF3iq2DETj4BiyxA62eGwx1vfiAOczBgYRG3Sw+9DlRgrsoy+J/9IWfOwZx?=
 =?us-ascii?Q?9O4PFdtnAIHWi0mmXyE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fabba605-6693-4b17-d25e-08dd5857f208
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2025 00:28:10.1602
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GVk+2eFaNc7PcU3eIa6KRWRuDH9uNummLn9x5q6lIyUNu/cdfQUsZz0vb2EXootC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB6061
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Mar 2025 00:28:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212084

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Jose Quaresma via lists.openembedded.org
> Sent: den 28 februari 2025 16:53
> To: openembedded-core@lists.openembedded.org
> Cc: Jose Quaresma <jose.quaresma@foundries.io>
> Subject: [OE-core] [RFC OE-core][PATCH 2/4] goarch: switch the default li=
nking to static
>=20
> The dynamic linked standard library /usr/lib/go/pkg/linux_amd64_dynlink/l=
ibstd.so
> contains reference to TMPDIR that I couldn't fix and this breakes the go-=
runtime.

breakes -> breaks

>=20
> The static linking is the default and most used linking in the golang eco=
system.
> Even in more restricted environments such as embedded ones the space occu=
pied by
> the libstd.so and the golang aplications installed on target is considera=
bly high

aplications -> applications

> when few golang applications are used, being in the end higher than what =
it would
> be with static linking.
>=20
> When we use static linking we can only use the parts of libstd.so that we=
 realy

realy -> really

> need and thus we do not need to have unused features in the runtime syste=
m library.
> This way it ends up not even being necessary to install the libstd.so on =
the target,
> which reduces the total space when there are few applications as already =
mentioned.
>=20
> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> ---
>  meta/classes-recipe/goarch.bbclass | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/meta/classes-recipe/goarch.bbclass b/meta/classes-
> recipe/goarch.bbclass
> index 1ebe03864f..dfe1c64b3b 100644
> --- a/meta/classes-recipe/goarch.bbclass
> +++ b/meta/classes-recipe/goarch.bbclass
> @@ -38,12 +38,12 @@ BASE_GOARM:armv5 =3D '5'
>  # Go supports dynamic linking on a limited set of architectures.
>  # See the supportsDynlink function in go/src/cmd/compile/internal/gc/mai=
n.go

The above comment made more sense when GO_DYNLINK was set to 1 for=20
that limited set of architectures below...

>  GO_DYNLINK =3D ""
> -GO_DYNLINK:arm ?=3D "1"
> -GO_DYNLINK:aarch64 ?=3D "1"
> -GO_DYNLINK:x86 ?=3D "1"
> -GO_DYNLINK:x86-64 ?=3D "1"
> -GO_DYNLINK:powerpc64 ?=3D "1"
> -GO_DYNLINK:powerpc64le ?=3D "1"
> +GO_DYNLINK:arm ?=3D ""
> +GO_DYNLINK:aarch64 ?=3D ""
> +GO_DYNLINK:x86 ?=3D ""
> +GO_DYNLINK:x86-64 ?=3D ""
> +GO_DYNLINK:powerpc64 ?=3D ""
> +GO_DYNLINK:powerpc64le ?=3D ""
>  GO_DYNLINK:class-native ?=3D ""
>  GO_DYNLINK:class-nativesdk =3D ""

Any reason to keep the overrides?

>=20
> --
> 2.48.1

//Peter


