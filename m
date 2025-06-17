Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 734D4C71136
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 09:12:50 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.31])
 by mx.groups.io with SMTP id smtpd.web11.14460.1750151569630230841
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 02:12:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=rnaNOWEK;
 spf=pass (domain: axis.com, ip: 40.107.159.31, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jlhu+0lWt3fUbKCIi5zmfqSk+3BFlNMHkS3SZbDqJcPKMu3uoqL4+VsctSgfZ6K7VqcETb57Cp8exbKauz+Ts/OtSrwBg4ySf23+szVWA+/7xAQqW+l3lz2vWYG3YAGrUHzVDQhkLmWAGujqiSyOYQXr7IVRFeyXXdF0IjHkFMCgAtDdGclLW8vSb9AQzFh5FUy3vP9PdhCdR3LS4yIG64UjCYlWUVaO9ZUqjNJizNMLtzkhLNEzuC2rJTGiJGiI4Bqo5NJVOMkSvj9TrFfqsqPILRhT85Tpz5J9DbY35I6kIZz55fnZUrMjyNfjbIfnzZP4ZkkheZwz4HH83VcpxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8WxRGBOXtKbFIN3KHBgHb2KQcJbEiNnIJx7EoZrJADk=;
 b=AFrUFGjpZ/tv4lXnBw+I0hdDV2GrqYrrigYOZxM1n3k90iKkBc7zwOFlbCpcuYZEaBaSQAg/fl4gcvsuZVTCE6YUntdH4AztpYxZ8J4LQROcLV2hz3c/vstLKMpSTHfewgVzot0YOQ6iSeX74hAapfEgPtExH9TZ3iYvcLsMRUEliKR9M/dXkEWZ6AmwYORZC64gfKZIi6/yej5XTHz7hkIWQqYi0SN3UOJvFnoB/KdovfoRHDOgAoiB7jiWuCx30fSyGHk1JVIWuQqyGh5kwMbG827byRBktW3drkuzzciG5YyNw2BwM3qurQe2B1RV0k6KVgX2SFT41hdG0TmxYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8WxRGBOXtKbFIN3KHBgHb2KQcJbEiNnIJx7EoZrJADk=;
 b=rnaNOWEKlO2dHeLQSQ6wGvPb/ukrLDpRRiUkP39BZS2xFEaCHQXFa5AyDSSnu/BN5anwjfjXsuymaVvAa/GunaKgfnWi0PQS8IhAWD0Y7ZU5v/522iUvBFhfGXaDmzHymE2rCKohc30JPAutwdGB128Y8umc/oB8+APonVPLqL0=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by DBAPR02MB6424.eurprd02.prod.outlook.com (2603:10a6:10:191::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Tue, 17 Jun
 2025 09:12:46 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%5]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 09:12:45 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 2/5] toolchain: Provide abstraction for recipe
 specific toolchain selection
Thread-Topic: [OE-core] [PATCH 2/5] toolchain: Provide abstraction for recipe
 specific toolchain selection
Thread-Index: AQHb26JdU0yf+MYnRE6DwdY3cqL3VbQHFgxg
Date: Tue, 17 Jun 2025 09:12:45 +0000
Message-ID: 
 <DB5PR02MB102130026EDA1102924183010EF73A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20250612135955.1413300-1-richard.purdie@linuxfoundation.org>
 <20250612135955.1413300-2-richard.purdie@linuxfoundation.org>
In-Reply-To: <20250612135955.1413300-2-richard.purdie@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DBAPR02MB6424:EE_
x-ms-office365-filtering-correlation-id: 3ceafd40-ebef-48d9-332a-08ddad7f1f9c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?/n6BUXFwzjcLQ8uJXshS3ddr4S/qBbDpvifOcrW7xLscqBRvTp+VyDOd70jG?=
 =?us-ascii?Q?GBH2tpwyAgO7jWdmo5xqWwY2gSEXvZ2jJKj+JDPzesgW3bN6+VabAIjadyb+?=
 =?us-ascii?Q?BCDs71UUlvqeuPZKSsM94xWWkBd1l4bJWJfpa3rRPJiDQzRbFEKM3izA4vrh?=
 =?us-ascii?Q?RcfgUVOU/HvVhv/5mijdIwDkpRXz7Hp2HWlDXmmWCqTzpGQk/Rlw2ZhFknv5?=
 =?us-ascii?Q?8X/LBQ+ceFB5DMbA/u7CGSBCqmALZay/LMK7VSXE15nfPjko5jZzcKN9BYQ5?=
 =?us-ascii?Q?RmNGO+fRvBQB/zRchzUd3xgUVeyJAYr8Fq8oQN5ygxrjXdtA4jX9LhR03NTM?=
 =?us-ascii?Q?YzQ6vYU37Uyq70RWHn4yTbTUadgxm5h+6FeXoF+TYfRb8YaezP93mP8T6Dkg?=
 =?us-ascii?Q?GGsNAwlfVgzrPa+H35Jsvk2RzuHn6pMprAsUkN1DBqxLbLSMnLpX0LHezDyQ?=
 =?us-ascii?Q?8GeWoB26zGdLkftDOLJ3WDZkkSERnAHUUkg4JO3KcstcbIZvIgWOcgnQGTLS?=
 =?us-ascii?Q?EmzOjKhBIod1UGSQWRNKz6N5kwEwQMxbuTmYllkIKguABu95hzSVtcTvPhIX?=
 =?us-ascii?Q?tJ3RhefsLZ+Rf7qtBBQ/iGjiAwbj4wvTeuiq6ddVF64pdYWD/tHVrvIcl3QI?=
 =?us-ascii?Q?qRK6gFonlTaz/pVYTSqyJaEW+xtnMw/5yu2f7b3XsubeQlvy67tDhTFFGjOn?=
 =?us-ascii?Q?4QZdj3mqUKEAXysqeeGdGDMnU+y0dSLXenED6Sdo3rmq9vvY+aoqrRIjNRyD?=
 =?us-ascii?Q?ELldTfaOVpxhv5cSriBkVX+lurVJrAqE4sSrYMooJ8BPXIZEXhXpBRg8tpqK?=
 =?us-ascii?Q?eFK42GATQr2aepoBM9QiDJQ1bO1WZoZ+/gqV8rIy7IPi3R6VdBCvTB0fDIe8?=
 =?us-ascii?Q?/Gc9+nIpdNYu77ZcTuTP2nIpa70lLaIgeBYnST9huR+5JwZ/DQpXJqiSn8yS?=
 =?us-ascii?Q?wA4g4MmawOyKISoy6D6NuzUoKO6mPowSaKQcqA/69DKh/AmR7AucaPfE2yZO?=
 =?us-ascii?Q?559bZQf4Nyt0sL3cFTRYIGTQog4+b8R0YvI8puWblveqcEzVUgWch8/vFWrN?=
 =?us-ascii?Q?+wmfbi3V30BEZlTN1JlP5fy8Tr4SdLCtmh5qhtLRhOJaRCC/IoK9l/C5UKho?=
 =?us-ascii?Q?V/EpKB0/iAYWWYLdeRQKFeXx78vGmqhmiBCPb4AKcm6smNsG/7aBSJCZLdnh?=
 =?us-ascii?Q?OOAYwCj4N+AOs/VtL3GNl4MOYyfE7r6Ht96Qpm5lIRLQcW8yvVp6YwIRshW/?=
 =?us-ascii?Q?G8By8zmlJf14X8h+e+JhRMc6Q5cRcvwE7stLibIv/j9MZgjMidTB02KjjnH+?=
 =?us-ascii?Q?1sVNIPcjyBi1igh2FEIV2puj3hi2OMq4np5oJr8nJB7PkKJfSHbPlgVM8KUm?=
 =?us-ascii?Q?oDwnaqUrfvKk5PXlmV8AfCqUodhff2+Z9PvufbvNEe903E+UXyfSeoIKtfzF?=
 =?us-ascii?Q?yQaDGHdi3Rw8Gz7CnbvKmMrz9kP3YEUk2BqJzuxio05zRKAwQBV40w=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?dr7zzThOxGkirhduSlXzlsAIESXLKsR4Tpcim1YvWYWxjkHEm1IByMSARHzg?=
 =?us-ascii?Q?uRCvPoy8OKAOlCCOoEl6SfsEyZh6xTbo8FlUHo/oFAjivlXB+rZBElwLLKe3?=
 =?us-ascii?Q?eiN3EJmUcU9WxnwvHWLC76l1NHcF9ELxmRyR3swF/wiFjlQd+SyYGfJPeVjE?=
 =?us-ascii?Q?pfuoz4yrOMzTbXKPb9no7lH8loubPKVcN9OFmcjYisCXcljiTEs17KgjheRX?=
 =?us-ascii?Q?sRTlKMLB4f8DpgubkZq1ESO9+5/F5OQ0klNgr5Yx3jX9MvJ28soC7+b1ppws?=
 =?us-ascii?Q?WrkD/VJXBAI650Av2iqY2WNvFQC/iGomNntwrk+rmgZyrSnCCyOFTrPR8yUy?=
 =?us-ascii?Q?iyT6O+VLUs2gE8SSxpmdE61SW8Nu0wudVGJGOUq82wv7WyHDfN6jwLx12UzS?=
 =?us-ascii?Q?sOxs+vsSrHP+CA6cDZ8J9PE7hDK5Qg0ve6wjBbRzGZf2QOE6iYJc6QXNebTz?=
 =?us-ascii?Q?yaNuG2DjyPAtMj4devuwkFgwvRWsrCn/OVghCSznRvAQ855cRdprC40qp9On?=
 =?us-ascii?Q?Xa0ra/+wSrVIV+4idXKfrkvXdo1rcXKk2GV2J7xxy4npkHn4xGO01pWW6m1h?=
 =?us-ascii?Q?3adui5tFF3J9dFZ6giw7amZhkqFdnHIdHbPIq2irdG3wtwgZAzKhNWDDWSnf?=
 =?us-ascii?Q?Vqied4ndVA0HF/B8ngn9wzXrM3N3oIGjcXk9dflTRjrLsVu0rQ/xuZvYvmCF?=
 =?us-ascii?Q?yrpt56SeBBwpNelcklNjROBrhvOgZ2nvi6uUHRI+8imuumGFzAw5m35QAWzW?=
 =?us-ascii?Q?52x6pfrCiABwudFr4FKt5lgvnl+0B/ASGvp6J/9WZ1Y5EP3i6oVipIsVUKZC?=
 =?us-ascii?Q?9rnT6b4tge9c9mqrQMtLm827kmkSp8I3dv3EkxgxM1K+HsmyBh88Un8HBUrq?=
 =?us-ascii?Q?KAk5Ry89FNqR007KKH393/y91d3CBhJVnLNQIa5VuKpyPe19X06pcjIlyOn2?=
 =?us-ascii?Q?YbxN9i82s0ScP38I/sF6WQWv+ASDhocHcEmbRlF18vS84QCl9ZM6LBHqirsJ?=
 =?us-ascii?Q?K1jWyfAFCxzZK1qW0WuuVvUCTAleUzNTelKk0qCgJAO+qDcvIwEKkWKHXJBz?=
 =?us-ascii?Q?/LfrCZm1JwEfCpX4tUDfxnuoRMiAsVk2UakaCwHCWSiFnwMHXLMpBL/KQ6Wh?=
 =?us-ascii?Q?1ecP9MXZDRWUWpbmGYW9MnrCREDH1P4mBJAGeoRNudfuh3z4tQr1mJdeJzBz?=
 =?us-ascii?Q?3G7uHLuGv/6nZS0OKA7SeOsSi1EyfVS04BSkbIgtlJce8RP6tRlNEstu9ZSG?=
 =?us-ascii?Q?8DJSallz+SP5s1iS3S75P3Ionm7lJzCnqSrTtrXKmu+S8r1GUQWeCRjBQW8o?=
 =?us-ascii?Q?ydJI9NBjrZSyGn+shx29uVJeUlakeb5FXrkY8ou5DxAlga4Ya1SCX6zxQ2Of?=
 =?us-ascii?Q?tSctFqWQVP+nzvYgZ4JMZSXEgwU9JWRmyE8w69eNh//01aVKQo5n6e6IfzLO?=
 =?us-ascii?Q?4IlOSGM2kLWriFX5CFxtIXvtUqCpaJpyRNp9h+/NkwzqGeBN0lhRs5O/zqlV?=
 =?us-ascii?Q?nsdvOlueNIysxma0JrXSNgBXVDciF8+vm7YLe7ML1KasZJm7loXhXgFFd77y?=
 =?us-ascii?Q?UbnGPvXu6d2V5syrhyA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ceafd40-ebef-48d9-332a-08ddad7f1f9c
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2025 09:12:45.8832
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nqUAXHO7e0T2TjhRwuvvx8oUIm9gAZMGB69qfqX6+m1fQ02GUqwcgrpblWo0Yuwf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR02MB6424
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 09:12:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218865

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Richard Purdie via lists.openembedded.org
> Sent: den 12 juni 2025 16:00
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 2/5] toolchain: Provide abstraction for recipe
> specific toolchain selection
>=20
> This implements a toolchain selection mechanism, defaulting to gcc
> as per the existing defaults.
>=20
> Introduce a variable called TOOLCHAIN, which denotes the familiar
> name for toolchain e.g. "gcc" which selects GNU compiler + binutils
> as default C/C++ toolchain or "clang" which will use LLVM/Clang Compiler
>=20
> TOOLCHAIN variable has a global fallback to "gcc" in configuration
> metadata. A distro can switch to using say "clang" as default system
> compiler by defining
>=20
> TOOLCHAIN ?=3D "clang"
>=20
> In local.conf or other distro specific global configuration metadata
>=20
> It is also selectable at recipe scope, since not all packages are
> buildable with either clang or gcc, a recipe can explicitly demand
> a given toolchain e.g. glibc can not be built with clang therefore
> glibc recipe sets.
>=20
> TOOLCHAIN =3D "gcc"
>=20
> Based on ideas/work by Khem Raj <raj.khem@gmail.com>
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes-global/base.bbclass                         | 9 +++++++++
>  .../clang.inc =3D> classes/toolchain/clang.bbclass}        | 0
>  .../toolchain/gcc-native.bbclass}                        | 0
>  .../toolchain/gcc.inc =3D> classes/toolchain/gcc.bbclass}  | 0
>  meta/conf/bitbake.conf                                   | 3 ---
>  meta/recipes-devtools/binutils/binutils-cross.inc        | 2 ++
>  meta/recipes-devtools/clang/clang-cross_git.bb           | 1 +
>  meta/recipes-devtools/clang/clang-crosssdk_git.bb        | 1 +
>  8 files changed, 13 insertions(+), 3 deletions(-)
>  rename meta/{conf/toolchain/clang.inc =3D> classes/toolchain/clang.bbcla=
ss} (100%)
>  rename meta/{conf/toolchain/build-gcc.inc =3D> classes/toolchain/gcc-nat=
ive.bbclass} (100%)
>  rename meta/{conf/toolchain/gcc.inc =3D> classes/toolchain/gcc.bbclass} =
(100%)
>=20
> diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.=
bbclass
> index 4ac3b83eb5c..4809cca27de 100644
> --- a/meta/classes-global/base.bbclass
> +++ b/meta/classes-global/base.bbclass
> @@ -19,6 +19,15 @@ PACKAGECONFIG_CONFARGS ??=3D ""
>=20
>  inherit metadata_scm
>=20
> +TOOLCHAIN ??=3D "gcc"
> +TOOLCHAIN:class-native ??=3D "gcc"
> +TOOLCHAIN:class-cross ??=3D "gcc"
> +TOOLCHAIN:class-crosssdk ??=3D "gcc"
> +TOOLCHAIN:class-nativesdk ??=3D "gcc"
> +
> +inherit toolchain/gcc-native
> +inherit_defer toolchain/${TOOLCHAIN}

What if you want to use clang as your native compiler for everything,=20
i.e., even when building target recipes? Would something like this=20
make sense?

TOOLCHAIN_NATIVE ??=3D "gcc"

TOOLCHAIN ??=3D "gcc"
TOOLCHAIN:class-native ??=3D "${TOOLCHAIN_NATIVE}"
TOOLCHAIN:class-cross ??=3D "gcc"
TOOLCHAIN:class-crosssdk ??=3D "gcc"
TOOLCHAIN:class-nativesdk ??=3D "gcc"

inherit toolchain/${TOOLCHAIN_NATIVE}-native
inherit_defer toolchain/${TOOLCHAIN}

//Peter


