Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42550D6552F
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 17:40:24 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.43])
 by mx.groups.io with SMTP id smtpd.web10.52231.1732642820303760427
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Nov 2024 09:40:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=Ya4e3ipj;
 spf=pass (domain: axis.com, ip: 40.107.21.43, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FJ47hUQtIiY8I7HEv9mpguSzd6sl3EWFhs3sB2lsPXSI7JNRFmDVTS9ZpI9HuwnA1OZ2skctK76vK3yMRfar+iKenJa+XdY0y48mDf7jEwuFT4VtWlZjzQhOjSx2W+fwEtNz5++GAOxv+isBKBe8Soa5YRSUd0Rriasw7fa5G9GqXrgDuLCe08rHraHUkKTRgAfFzN1nED3sc2rm/AQJREXV9oLDQrUzR+GZcsbpv83AmumS/y9umxXFKcKMMxnudAMO8O9rAzjxoGhi4YYQjNDXcPNaDTCTCgwj1714eaypOp7abPXaPDyPDtJZQ6Q+q6Q8Nc1VeusAud8jxBiX3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q/xi+XecMRwEYiCbiCTrHeOri4fhP1Y7qr/7GgxKymg=;
 b=ZVbCZAO0bdo0BvLlK9ezc9NrT4/RwHi67MXmoI0tZGkkNTlxHZu9MEAF97kOIIxrqvQIXQUUjghXUWJ5XWjPCXL/1NFvSQVccpsyl0NfOo13JEZAqHxLyYN8A88LEq23SwJAWKU1dQd4agSQGv6NqAWtAR4WYpGnYjO8kJCH510M3iWMo7Oo6Q5Rx7PzhttuLxQ8P3pCeHQqEYBKciD24VV/rWWXcm5o4sB6mwU6+K4RZPfijhKaK+RmPzXMffGABzsnSCfoNiKMqzW8+EiYxnLxa7lQSvvTnMXWczpQD42BAY053eL6j1PMAi1est9AVOXq/OgEnk+05CI6FbFb0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q/xi+XecMRwEYiCbiCTrHeOri4fhP1Y7qr/7GgxKymg=;
 b=Ya4e3ipj+Zax+XaeuEGnFTnSb1w5aIKMEI2l1Qzz3ZjQBzPjiLEBca3GHTxCTb9MUx5eYm4RaKf+x5lEPULxdUz9R2nPHZz2NnRk8mHr+w8VOV0lvwT2VkFq8jKcK2CA2S0dmS30fcP2IITWKrROSwONzOqX6tPHqShiTko+du0=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by PA4PR02MB6816.eurprd02.prod.outlook.com (2603:10a6:102:f6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Tue, 26 Nov
 2024 17:40:16 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%4]) with mapi id 15.20.8182.019; Tue, 26 Nov 2024
 17:40:16 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "denis.osterland@diehl.com" <denis.osterland@diehl.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 2/3] spdx: add support for WITH operator
Thread-Topic: [OE-core] [PATCH 2/3] spdx: add support for WITH operator
Thread-Index: AQHbPzEe9ldA+AmSgkeQ5fBpaK4ynrLJybbg
Date: Tue, 26 Nov 2024 17:40:15 +0000
Message-ID: 
 <DB5PR02MB1021389198BEE42937E4383AAEF2F2@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <b4f524ba554e48738c2307d44b8304ae@diehl.com>
In-Reply-To: <b4f524ba554e48738c2307d44b8304ae@diehl.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|PA4PR02MB6816:EE_
x-ms-office365-filtering-correlation-id: 9bbab465-9ae1-4417-1039-08dd0e41636c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?8tCQY+oOMldPdh7cabnCxxxxQg4IVXIOibui5j2fJFDybpwYCHi4LJJvRZ6y?=
 =?us-ascii?Q?P3CiDyorA+VU7kBz38hJNlSEga8dKt0NBlpGwsYz0JUKKw9G3Td1q6mYc3va?=
 =?us-ascii?Q?s5wbsVasZQa0rnLfMY4ijHe8k/7sa4hExmlNmHLekkeWsS9bG/lu23IKTC8Z?=
 =?us-ascii?Q?/f2OdIDaBzgFrJ9j54XHl+jmacW51sRgVI+rDlaqrgt4oCB+tTfZNvukgJdP?=
 =?us-ascii?Q?sL8YR2f8pD0aqGCk0O38paw0A9SDm4a3vgEIjUJEn5akhD9p2Bc/aqoar3/n?=
 =?us-ascii?Q?sPFIAk8xuAbv5u5S/0lMNE8M0dARjafXcnp5DXIPkF2OoKktJQHRzyRXLMcf?=
 =?us-ascii?Q?CnqGeHrgC6EdNYaE6ak7Jyw7R0ByN13/ngQ3vMATnzsgVEQeo4aPyCuvK9v1?=
 =?us-ascii?Q?4JE1f8WcJY/McsAZtkwI+xknF0Cu9+eklKkSDsxJPL5+UYayOMrlXgJ9vftr?=
 =?us-ascii?Q?xJYiPRRJfTJ0IF54R160o1zFMGHm32e8DbrcT7yEybfZIYlmEW9wY+guBcug?=
 =?us-ascii?Q?JJki0syAtdPyqGlevdFrk/2GP7A5OJVHhQJrs/CK4Ws7141fJk5QwndH39xu?=
 =?us-ascii?Q?VU+WYCLZVyJ/gcK9Uh1ConFq5WyRe9HmvQJVzHPAaMCkHZz7JzHAiMjWOSvX?=
 =?us-ascii?Q?KNJE7k3JpdIc/kiyaUw7LVydnTsqNj1K8aPYxUbSgc/VG4oEkdLIjDOLgTpU?=
 =?us-ascii?Q?r82EmClehyHBwacb+ZSNWIDZu8+kydku305AAIznQDe+EjgCf7ZtKebaRz+u?=
 =?us-ascii?Q?XRijvbrke3wCGqH6eU6p55onXBFHCVpVgiVHPbuaNV4Vp683o0zDMPp9S6J4?=
 =?us-ascii?Q?yX7SpREHzLJ7v8+MsPr/XER2ahhjOPEfkpVtOuBY2+leb9ET6uTIPVOiiV1C?=
 =?us-ascii?Q?hcn3p1RBoGRbq3clzhx610U81CmTEOrI3GUY+/P28y4ahDZDwe2RxPSSonXL?=
 =?us-ascii?Q?hOpEaqFJ44+fRl8kUE/fwqg/aUa+EvVg04yX76GGFdgqEB5fp3Oxc3ABWmM3?=
 =?us-ascii?Q?6eZJwVIxISiuSqpKYj6+Z65XngpPoM9X+bFz5uVgLysrI5Dnfq01x8BcEHI6?=
 =?us-ascii?Q?jdQKY0a3vdLuVz+RFRJRwqnfTirAjeejTgHsk+XAXj8Xapv9VlqyFKnzwtxP?=
 =?us-ascii?Q?HFNP4vvKEmh//N/T0OGbOCkBhSzT0afk41kYQ7neH3mdcdJoxe/3ExnkQTtb?=
 =?us-ascii?Q?WflpE9XBdzWDKSnZEjOF3vxCLfn8yTcFhWVtP4pfEj0h+b0DBldxlkTzFWJe?=
 =?us-ascii?Q?StkuAPicXinoM5eZC8F2jcswBQmm/cRuFhVDa+jKryVwX1flqwaZpWweKvzV?=
 =?us-ascii?Q?zGAHxj//1ZMDQUNMFb4OudhUt+OTOrpmJsn5E7675bpTHxTc8W9D677iWm7q?=
 =?us-ascii?Q?jYQjNScYJn/XXNCZD0QOyRWkANIL0KElYdI0aNdczcj8LObPhQ=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?UZN9LO3a+QOseSq4/vZMcyj8Yfbq0SxpZQ59We3q5lethKVxaqx2bHteurun?=
 =?us-ascii?Q?chimKy3t+iLMNS01THXOY9bOm/i2suQg69W94dOEL+3qJ53ZNXrutX7LnT4+?=
 =?us-ascii?Q?t78JYZQPwkjTPPblOAKFIhtb9a12siUNf0V+N8tBw3/u7ssjNRI/QQ2dJkuP?=
 =?us-ascii?Q?DkgjWoRpGPTeTnWpUrDlFwKSei/CfDZzCxc1N04pbDKGSgPEMAe8JIYboV1X?=
 =?us-ascii?Q?xEeDM6QUxOXQNtjYV8qycK/Gj4zIpHGfjBckf727dNfudSSj/dI5iA25PcPI?=
 =?us-ascii?Q?QSy+bXWY7rVeDjWwgp5lCkGrcQ6H9uwwUtHoPLbiX6sDIzsy7J8xMKXzXuPU?=
 =?us-ascii?Q?Sxxs80MoX9PPx653kz/Yk9AY75S7k+FJGoA1PfP0eUU4hYeOegemSM0LSVmc?=
 =?us-ascii?Q?rf7witbJba3gslU7mSIezHXydcWAAWbu2w438yBH0qZGqxhhlAsDzfSiZobf?=
 =?us-ascii?Q?ci7gpFB2t8zSAf++/+DU+7f3+a2gevDtwoYpmYO5WsiogErYcFGkmfwVaQXK?=
 =?us-ascii?Q?4zxdcsPvKLvFwkvlahsq4KLqH1wS80Le4odhFORf7itIkcZvVl+EWoQqcrKb?=
 =?us-ascii?Q?csaIJIYj8ZzoCQvRCpg3GpzA3BDzMLckLwiRJRUKl6TumRt45YOwIm0tVVrh?=
 =?us-ascii?Q?CDMtP3xL+KzjgQ8MC8NsTlID4InYkXymXqE06Q5dIY+kzO6CjCBcYsTx7ng/?=
 =?us-ascii?Q?ZeTCYnzESWbIA4Z3jAEfGAl8Wd2KW2JhlIGsoJZYWSazFpGmcyn8w+7dHHli?=
 =?us-ascii?Q?DAgHsSPVS1nNTtGDf68FVrle0TxsvvblaWArWK3wpsVEfKhrgtBStzcFTFVb?=
 =?us-ascii?Q?xjNHpm3PSWPk9KLXEv1fN0y0u9locNRL00loVHdGuGbBZtqV5XGK5+D5d+cU?=
 =?us-ascii?Q?C80uUDmf5P8KRkoaHuleE2kgZHOqlIgPCA16oqzMf45O45w4576NCeRCP3w9?=
 =?us-ascii?Q?2ny7+fBimUEjz933Ej3T3tMO2A7G7yZZo2HuFVpcVhzYK6wUZw2MhmEt6ggi?=
 =?us-ascii?Q?uVFKLkfkFTvyJKbwQX5wQk876R94in1uaJA9kaGQcMDF/gLhDtSNpGja7JVH?=
 =?us-ascii?Q?L00fOPYraikp4uMlvEPdZa7F+3bsBgOx/bWyiA2C8apX2lhaAEmx7dgskEH0?=
 =?us-ascii?Q?C/Rp/pW0i/ybFiq3lhKOY6QhUAULFRkkneFFrSIZLX4XguJziavdVZLu8Hlt?=
 =?us-ascii?Q?4Hwq/bXfWHVr0ye4xHgFN84q9OxiMXBtWe1kkh4Op/t1Ukwj36CWYTGHTwPd?=
 =?us-ascii?Q?TGzY7FKue5we3SQQQ8QQ4YT3VhkIgvSgi/N41OZB1nsaoAPNYOlJ3j6CanqM?=
 =?us-ascii?Q?Nab/Mr4pY5s2abF2cVOs3V9RHncAeEq0YlYMTJslLr+fKtkTCFShhON9+PSF?=
 =?us-ascii?Q?6LtzJQPJk5kQgw77OT+ACyhgVYRa0E5QC/+uESvpYeFfOzE7qI3CfnYlatHq?=
 =?us-ascii?Q?2hZ+Ws/g6e6lex+HfWmK0NhfxJXkWxAoLZGK9IGM1OnBwBBIlnRBYZEVHrwJ?=
 =?us-ascii?Q?9E3K5WpBE78HPbUzYIDFKzTveQLYGMt3J3oapYuwpp7ocBtijnRBkrq/w0M3?=
 =?us-ascii?Q?MvgrWd02kbzMMZP0oMU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bbab465-9ae1-4417-1039-08dd0e41636c
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2024 17:40:15.9744
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ni3Ll7smTtFafX/8khzx3PrDYSLSqcPf4uEG3X/rzasw67u9mmxExAzWdfp15fq7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR02MB6816
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 17:40:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207873

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Denis OSTERLAND-HEIM via lists.openembedded.o=
rg
> Sent: den 25 november 2024 12:57
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 2/3] spdx: add support for WITH operator
>=20
> Adds the + operator for use in LICENSE field.
> It is replaced by SPDX WITH operator.
>=20
> Signed-off-by: Denis Osterland-Heim <denis.osterland@diehl.com>
> ---
>  meta/lib/oe/license.py      | 4 ++--
>  meta/lib/oe/spdx30_tasks.py | 4 ++++
>  2 files changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/lib/oe/license.py b/meta/lib/oe/license.py
> index 3c15db782f..223f98acd5 100644
> --- a/meta/lib/oe/license.py
> +++ b/meta/lib/oe/license.py
> @@ -47,9 +47,9 @@ class InvalidLicense(LicenseError):
>      def __str__(self):
>          return "invalid characters in license '%s'" % self.license
>=20
> -license_operator_chars =3D '&|() '
> +license_operator_chars =3D '&|()+ '
>  license_operator =3D re.compile(r'([' + license_operator_chars + '])')
> -license_pattern =3D re.compile(r'[a-zA-Z0-9.+_\-]+$')
> +license_pattern =3D re.compile(r'[a-zA-Z0-9._\-]+$')
>=20
>  class LicenseVisitor(ast.NodeVisitor):
>      """Get elements based on OpenEmbedded license strings"""
> diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
> index 5aeed5cd6f..17a1ce44e7 100644
> --- a/meta/lib/oe/spdx30_tasks.py
> +++ b/meta/lib/oe/spdx30_tasks.py
> @@ -97,6 +97,9 @@ def add_license_expression(d, objset, license_expressio=
n, license_data):
>          if l =3D=3D "|":
>              return "OR"
>=20
> +        if l =3D=3D "+":
> +            return "WITH"
> +
>          if l =3D=3D "CLOSED":
>              return "NONE"
> @@ -115,6 +118,7 @@ def add_license_expression(d, objset, license_express=
ion, license_data):
>          .replace(")", " ) ")
>          .replace("|", " | ")
>          .replace("&", " & ")
> +        .replace("+", " + ")
>          .split()
>      )
>      spdx_license_expression =3D " ".join(convert(l) for l in lic_split)
> --
> 2.45.2

I have some concerns about this change:
* The above change does not really implement support for WITH. It=20
  only supports converting a LICENSE expression containing a=20
  WITH clause (expressed using the "+" operator) from bitbake=20
  format into SPDX format. All the actual handling of WITH clauses=20
  is missing.
* There are a lot of complexities related to the incompatible=20
  license handling (which is the main reason for the license=20
  handling in meta/lib/oe/license.py). There will be problems if=20
  someone  specifies a LICENSE as "Foo + Exception | Bar". E.g.,=20
  consider what should happen if "Foo" is in INCOMPATIBLE_LICENSE.
* We also used to use "+" to indicate "or later". This can be seen=20
  in obsolete_license_list(). Weird things will probably happen if=20
  an old LICENSE like "GPL2+ & LGPLv2+" is encountered.

It would probably be easier to just add a GPL-2.0-with-syscall-exception=20
(as was initially suggested), but containing the full GPL-2.0 license as=20
well as the exception (compare to, e.g., Apache-2.0-with-LLVM-exception.

I also note that out of the six licenses used in OE-Core/OpenEmbedded=20
that use exceptions:

Apache-2.0-with-LLVM-exception
GPL-2.0-with-GCC-exception
GPL-2.0-with-OpenSSL-exception
GPL-3-with-bison-exception
GPL-3.0-with-GCC-exception
GPL-3.0-with-autoconf-exception

only Apache-2.0-with-LLVM-exception and GPL-2.0-with-OpenSSL-exception=20
contain the actual license text. The other use an "insert <license> here"=20
reference. gcc has covered it by using "GPL-3.0-with-GCC-exception &=20
GPL-3.0-only", but that is not the case for most other recipes.

//Peter


