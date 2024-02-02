Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44BB0C48291
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 18:42:16 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.99])
 by mx.groups.io with SMTP id smtpd.web11.119.1706899326772330296
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Feb 2024 10:42:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=oDaIg+57;
 spf=pass (domain: axis.com, ip: 40.107.247.99, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RgsQTxq8aqzJWSvth1ZFKTNlL/SxOpl/FsyEtjZkYOwjTiCKOYPCKMwfg0+fLaMvIC1uLa4nV3u/HEXSkBvMdGd/3oHKuoB2dC940NconNu8Ferk++BdxpM4iGNCluwHlXM0kfnBrusi3mGZAhSoiu8lcrLTGGroA5Jx3EkKH+bkmcXEzUyaJ8YzyHViDmM9bPmZIG6ITxXA+hJZBPT29HdySYjBx2AV9kK2l4/JgzX0wQFW+Qk38ZebZAUrEvrT5/ecUSBDhkT/DKpPGRBGXW+58fOE9GUWbJYusWDoltYRYn5IFB6fGWE+WWxW7+Cqk2/l+qteRVsnOdwbVk7OUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G5x3c04CvUTPkWuwjonPPHn9S/SKF54AYkPyJm0eA7Y=;
 b=HdmvZPhlEK53p5l7qRbDWWNO850IsUkIqhr5jaQYrVETuF8C89wsJNUda6kFzfHAtpNzGr/T6Sn5ikMPTsfitwjCtbDn3CH6CHLYOLGgBhr/QWVJv3DkJOwnP3O9utSIyzIYDjFyf8CeVeDSxyRt67G2dHjdECJcSW7wAADdK+Qnjq4mUrNjfWOJXls9pGx4FQmxFFNeqy+1hLQlRBvRZtcZyFPHCOnX+Z1AtG+OqZKdOqYNJLeaekibZWw9WD2SzIHs63JOlmYwPEyPHsaGNBqnB5ByZVzKJTSgLdATFRSjau2o2EQXJu24n4nUGv6RtK6guy47wMrL79vjTj+abw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G5x3c04CvUTPkWuwjonPPHn9S/SKF54AYkPyJm0eA7Y=;
 b=oDaIg+57RX4RG/PY026j44ScGJItd3xlw+irSo6Cz1w0YLH1zKjvmHBU6zXefB9QKwl/NzVrorhktjaxY//BZjdpdDUURCmre3ZR5iWEjhEZenhdi8LL1lBIHQHYbnf8d5nJI6+8EdgGBorkpJ8j4Bnfsn9fWyIKfKuT9U7fvLo=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by DU0PR02MB8266.eurprd02.prod.outlook.com (2603:10a6:10:3a6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.26; Fri, 2 Feb
 2024 18:42:03 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::5b1d:259f:4ba1:8906]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::5b1d:259f:4ba1:8906%2]) with mapi id 15.20.7249.027; Fri, 2 Feb 2024
 18:42:03 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "joe.slater@windriver.com" <joe.slater@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "randy.macleod@windriver.com" <randy.macleod@windriver.com>
Subject: RE: [oe-core][PATCH 1/1] eudev: allow for predictable network
 interface names
Thread-Topic: [oe-core][PATCH 1/1] eudev: allow for predictable network
 interface names
Thread-Index: AQHaVHbalU/j8hVPdEa6n+NzvEYdHbD3Yi3w
Date: Fri, 2 Feb 2024 18:42:03 +0000
Message-ID: 
 <DB5PR02MB10213D24526FA67DBA19CA76AEF422@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20240131185342.3602428-1-joe.slater@windriver.com>
In-Reply-To: <20240131185342.3602428-1-joe.slater@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DU0PR02MB8266:EE_
x-ms-office365-filtering-correlation-id: 3fc95c23-756d-4dec-0dcb-08dc241ea5f7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 IrOg1iJfKsUrtZgcedO82hJoo9+E5QsWOY3OT2tyAfg2ZLs9Wl97PoVd8hOmKWRi1s5DmHmLCiz32AidOt7/8hwPImBQKO80efPLwVq9Bf8efeo70audTCHs+TOLqG2TQwjOxEzMQa5VojkJmoJ+GWvB5YgfUk1HXGPU3cH79T5olu9+T4SJzub41diuyx0PxW/ZQjsbDI/dmqiXrsBJxuouUQMAyfLY1RuhV+aOA9okSookF4RYf5imLHcUCE+md3iVVfD2Vz6W40slk65qZm3ITaYXL1TzkCa/q9LG1LmZRgjgULMw2d7np09D0WeS5a+hcKlKn2reSZFatqc3iObGZOJgyCak3+8eRLm/uMb+3HMUW3FBVAU8czAT9vqkJnAsjgwittoEn1oUw81Obx1Ug+pFGioOAJGmqekmiJxddeRyTDAlTlVk7v57Rcc0jHy8WrNW4yGAGW9yt83XAcsLKbBST+Pbygy8okSb95O9ybE46ggV3/wRhuPPw0qrvtlXIqVpx454S6nciHHu2/ZbtB3zAy+HQO90+mMmiIzAB5WfDPzhLSkKHugg+UaO+1W94h/4YkDp9csvQjV0GDiToUX6who1RV45mKhXS3TC5o1q2bGL6qlpzUUyc24y
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(136003)(366004)(376002)(346002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(44832011)(2906002)(5660300002)(41300700001)(86362001)(38100700002)(33656002)(478600001)(6506007)(53546011)(38070700009)(122000001)(7696005)(71200400001)(83380400001)(9686003)(26005)(66446008)(316002)(52536014)(66476007)(4326008)(8936002)(8676002)(66556008)(64756008)(110136005)(66946007)(55016003)(76116006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?9fVLREf2jc5OfkHP48rAJJFaqJ6bTO9XkLPNZF2geviUNvFKui9PBaSSbtrU?=
 =?us-ascii?Q?ITHqySwhUUAOSlYly7jYjdVXk74byb3YdP/WrLjzfGHjTYr8gCXzgaH2xe7L?=
 =?us-ascii?Q?aiFKv3viAU0DvV+be+fPE1j67fgNN7N08xQADnhcYDfTgQQw26fZF/qQGgCL?=
 =?us-ascii?Q?XIKijT1SvtzNOl9ZAY/VUYQxYTsI6PqOiUhesQ+d02pvf9Vgn0C5l4CFBmJP?=
 =?us-ascii?Q?w9oHVdJieZNPzXsoWqsvS+9oluh5bkZo2Z+w5goYeF7jnnEvxtZ0d377Q6pe?=
 =?us-ascii?Q?RqMi7KTpecGOaaXL2CBBtyqabrkWhGlz6zxXOSrCaEP0eV6+Xw7tE0mzZPNX?=
 =?us-ascii?Q?ve+Q0FlRVAeRHIcu0EGV4evHIn8wDKU+68jV7U9pTmwkD2t+tluAqw0OTtzW?=
 =?us-ascii?Q?THnf3fFPH8Amy9Cxq8xi+lSTBDgOFPa1Kiox8dcVl/UCNJpm9TCF/PtNHIqH?=
 =?us-ascii?Q?lgGeBKbB4nyHAjPMGteQCD8fkFXIsOjPGbPgShRZMw1/7p4X3Wb6kI5c5GAS?=
 =?us-ascii?Q?8o04+gUnwd/9rDh/nIZSLcsthrITDGPTFO3oMo4PowrRqgspKRIPGUfQ1CBS?=
 =?us-ascii?Q?rgRZeslT5Q6mvQ8B3fHwfs9wF2lOt34OefGyJXMrL2GPNEv5HTYksyciFdDd?=
 =?us-ascii?Q?XqtmXS3126RfdIbVLvzfv7PlXQ0vrMJfsWjqNOlbN6uQ7HmdGsCD8NPQRNbc?=
 =?us-ascii?Q?AvIlygeAQKq5JHK0vuSWI8VOzCt8ogIl+ioDEfi/gDYAam6TmhPgopCN/C4b?=
 =?us-ascii?Q?0Mb0KSTUFKCoJLBpdVcnSjmYlwVknQ1lM/t1dJ4dnkZZPqNl0b9LeiNSUBAP?=
 =?us-ascii?Q?8ts1mwRpHjD4EQIXsXqbgCjuRwLU6hEYtgYM0EhVVyglo4zbJTVH4nqg936k?=
 =?us-ascii?Q?MoU6tlv8WC8qX5e6hh6qfe4gJmiQZkzA/CZfF8/uyCfRjr2Kmo+ew0cc3UPG?=
 =?us-ascii?Q?0ntFr0wyZ9ay8SQWT+6rk1xx4/rMwuZ/2a8Q9RmU2rQfJC/GJ/lGXVKyqjTH?=
 =?us-ascii?Q?2F5Yw8/wzzN1AI8MAXWZ+vCHzfbrvQU7ebooKgvfTO72TsFDBUWdVv4+q1SY?=
 =?us-ascii?Q?e+xVvifwGXMXVmFkAPxUHcUZP6JUYPiw8uNDxsNyDda5Jsd4Km32ef4voBMw?=
 =?us-ascii?Q?ALPk0645rU6qIwsKTivvUcF966hSfXtrEOENbQbChn8tKanau6QM1zbw6ekW?=
 =?us-ascii?Q?uuFd0hKIEFi9au1vrjavXH50Mo30CSe9W2JGPruEj8RPQG4GZn4t/gmRYLQQ?=
 =?us-ascii?Q?IgAn+leU41z9R5AdbQA4N6xpUgnYz5n6xjvSLvepaF1yKrkRe1tmown8On8G?=
 =?us-ascii?Q?zFwS1ISW/PdozVnnhsWIR9J/I+6xbsA7v4tfeX3mZMs3EbbYfqT7KB210r6a?=
 =?us-ascii?Q?tu/6QJ9ypSz8IzEEvj7Ulc79Hz1uNODVQtQTU8RxWJVXMSvhFKS/hfSqIkdD?=
 =?us-ascii?Q?WPUUbpVkO8sShyRy+5Z8rxE5//9lJCER85lWCflVrs9JxU0ED+cUzDenDpw7?=
 =?us-ascii?Q?PUy561KYfsaxf5rfLk6yGoP+HIlXhJOFqxOMZlVhjbuYtpRJOKasIx3NuTao?=
 =?us-ascii?Q?Sv/j43BvvipxikyqOaM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fc95c23-756d-4dec-0dcb-08dc241ea5f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2024 18:42:03.1572
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yNL9dnQpUtsqyiloWolbpH7fboe6UsdE8RvKTM5nL/cb8uqlYt03PQgVd7KWajox
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB8266
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Feb 2024 18:42:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194812

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Joe Slater via lists.openembedded.org
> Sent: den 31 januari 2024 19:54
> To: openembedded-core@lists.openembedded.org
> Cc: joe.slater@windriver.com; randy.macleod@windriver.com
> Subject: [oe-core][PATCH 1/1] eudev: allow for predictable network interf=
ace names
>=20
> From: Joe Slater <joe.slater@windriver.com>
>=20
> Do not suppress renaming by eudev if 'pni-names' is
> a distro feature.  The previous behavior was to always
> suppress renaming.
>=20
> eudev is used when sysvinit is the init manager.
>=20
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  meta/recipes-core/udev/eudev_3.2.14.bb | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/recipes-core/udev/eudev_3.2.14.bb b/meta/recipes-core/u=
dev/eudev_3.2.14.bb
> index ddb3c3340f..18696679c8 100644
> --- a/meta/recipes-core/udev/eudev_3.2.14.bb
> +++ b/meta/recipes-core/udev/eudev_3.2.14.bb
> @@ -49,9 +49,10 @@ do_install:append() {
>  	install -d ${D}${sysconfdir}/udev/rules.d
>  	install -m 0644 ${WORKDIR}/local.rules ${D}${sysconfdir}/udev/rules.d/l=
ocal.rules
>=20
> -	# Use classic network interface naming scheme
> -	touch ${D}${sysconfdir}/udev/rules.d/80-net-name-slot.rules
> -
> +	# Use classic network interface naming scheme if no 'pni-names' distro =
feature
> +	if ${@bb.utils.contains('DISTRO_FEATURES', 'pni-names', 'false', 'true'=
, d)}; then

May I suggest to write that as:

	if ! ${@bb.utils.contains('DISTRO_FEATURES', 'pni-names', 'true', 'false',=
 d)}; then

At least I find it much easier to read code like this that mixes shell=20
code with Python code where bb.utils.contains() is only used to determine=20
whether a feature is set if it actually returns 'true' when the feature is =
set.
An alternative is to write it as:

	if [ ! "${@bb.utils.filter('DISTRO_FEATURES', 'pni-names', d)}" ]; then

> +		touch ${D}${sysconfdir}/udev/rules.d/80-net-name-slot.rules
> +	fi
>  }
>=20
>  do_install:prepend:class-target () {
> --
> 2.25.1

//Peter


