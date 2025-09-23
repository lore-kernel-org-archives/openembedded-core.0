Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 527BFCAC5AC
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 15:15:11 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.46])
 by mx.groups.io with SMTP id smtpd.web11.277.1758640501171623928
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Sep 2025 08:15:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=PimnRUpj;
 spf=pass (domain: axis.com, ip: 40.107.159.46, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ddFJ+W1RksWaw91XS6udjevRogJaVsz8qyP210Vjxobw0RVPun4sBJmaZo49517fvDbwySrMBhWNH59Xff4U0B8mMz4ZtMP5TSC4g7J6XjpslhQDDoNrY2NmePnu5QxkuPrqUgXxBiGULjNto1aDxD7Jgrt7uhMmANCLKk8dyDjYL5/NS3ADqjZHULcPq2QLrFuUGJvxKs8DEis5x96UK0gvdIfOoTNh2qhR/jidLCuGYTbwmj8baO1jQvM8wtLW8w5a7gviQ7qswGrWSeNMNjYRoxSsu167tUGuHVOY6hjIioNithJxrnhs8+I7V9KAIRl1Nf+gz2g22t6yhGMIXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CcaBBCpmN862aT8rs8i696Q00NfUPddrQrjnp1Jjf7s=;
 b=a/D6rOqIE2Nxinya9WIdtM0PNmXsFW5PagaMOpmektqnBxAY2VuN4JynA6XHNKhrFZ+12M3t+2YQSAcKbclYOJcsxuyJhSQg43oBZc/4ACZgzPV8uHfRhkxQrcumT1KV3SPK/a6HR3pG1YipT1kaKs5XS0cRu/UN4HReZyoBOYUgkm8GeN2VY1y1c3zmlj8xvppgx36DZJvukYJAVbP9rjQZmggG0F0faUEXYJoHazi9GC8drkqFfjClSFRpkuI91DkJ3Zv8X/Zd2YxLbHPsjpXLa7yjPFFfwaFamUhSfqJIsmvR1KW0vYfZJ79JavrpJekA15sQ8rlnI3j40D4/Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CcaBBCpmN862aT8rs8i696Q00NfUPddrQrjnp1Jjf7s=;
 b=PimnRUpj6HuFNNO7ToWg9eVrjbBSkgK3QgvOf/ml87KYzZgfYBEcTUeA8vbdfIm6QejPClKBw2m7Oze3wdPjOYpzvnok0u7A1LbWxzxKFxWYh31zXRsMto+TdIbfcQa0ZsJdBLC+E0So0n24Z3AXqUAbqK1CyXKoiSQIAbNAiTk=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by DU0PR02MB8361.eurprd02.prod.outlook.com (2603:10a6:10:3bb::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Tue, 23 Sep
 2025 15:14:57 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%7]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 15:14:57 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "ross.burton@arm.com" <ross.burton@arm.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 4/4] libdnf: remove obsolete path path
Thread-Topic: [OE-core] [PATCH 4/4] libdnf: remove obsolete path path
Thread-Index: AQHcK8w6rrCzX0Em/kK+TRG4p84wyrSg4ZkA
Date: Tue, 23 Sep 2025 15:14:57 +0000
Message-ID: 
 <DB5PR02MB1021385D2083103EE78504FF6EF1DA@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20250922142031.3625684-1-ross.burton@arm.com>
 <20250922142031.3625684-4-ross.burton@arm.com>
In-Reply-To: <20250922142031.3625684-4-ross.burton@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DU0PR02MB8361:EE_
x-ms-office365-filtering-correlation-id: a9e0e751-d3b5-4ff1-1c3c-08ddfab3f526
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?xoRm55xuBi3T/nFexj5oBcSkUyF/Qeqq9z3LpMnkn/WQs9mx2DQDTREm7M9s?=
 =?us-ascii?Q?SeCI0H5QvEYp0V1UNuCBL6y9r8AzxoCwJ3sVJBEGUWpfvOwrC1KnMoZE+6Jv?=
 =?us-ascii?Q?c1uxvLfXuRfD28kX6kFAJcA334gY8ogB7sw/hk16qKhtr7wP7lP2NlJV3LZX?=
 =?us-ascii?Q?q0bW9PT14vzmEp+aIwg6jqXy4vqv6agpQF3r9GFDrc6TR7zodkWbJzQFW4Wp?=
 =?us-ascii?Q?nyAVque5ke5ji7mIVbCg4GVxXMuzP8QQQ/AHejRIX5mE4JG4Hgdjnhq5wTJB?=
 =?us-ascii?Q?s+z5TJ9B39lc+GqokYHf509yVqHGqypi8G/wx7R3utYOm/28SI/5MDvjHPHA?=
 =?us-ascii?Q?+6Dmu9kKOQlCT0VXKjVKiDD/bEuW+HLaxqVSqT5oBkj22Pzlec8Vf34++9p+?=
 =?us-ascii?Q?RooknIA07Q90fwm4aSeRSMyP7MGL4UGUQ6VMQMwAQ1O6gv3/Jpo6FbP+wC0i?=
 =?us-ascii?Q?ilsmetE7QicvCLW3oPYhVeATwJvWz9hjUA/pzJbBz1+bycb9x4aBTq46+CNc?=
 =?us-ascii?Q?HOgdVMMAXjWzQXXAwnn1VLcRZjRTVFFirWF1TJBy+Dj9pVqjQGzDC5IS5pRo?=
 =?us-ascii?Q?kF73JST78kyaQzdUAE2alcArSdZV7kBbtM5BmN49E8a+MUicFcBPgGVupjux?=
 =?us-ascii?Q?vMOsBJFXMXj2pEtUyj2Sliz9IkA/OdleQy+x9dyYRkrcZ2RPWnL3tM43/Soy?=
 =?us-ascii?Q?j+VuCyZNUjU5ma0jAbLQGruQl+zaBnOXy4MkfNN9T+kpdiEgT1ai023KUc6i?=
 =?us-ascii?Q?XBLGf+bE4PLOs6bgHg5vexD218JydGHXwFUEsa8VtOmHfbQ1+rG/ea8Vt4Wc?=
 =?us-ascii?Q?Hkzd6o/gaOy8OV4Xc0WmdK+nTEcVZCM3uxPaBtncBNrFME9GeyHmTpwGxMde?=
 =?us-ascii?Q?IzGyFFD4PKVEM8a/8FD0saPQYEmtR87iEmCUho2zggeuO/dIrrFgkFn9Sx2d?=
 =?us-ascii?Q?q6cx6vJt40j4TUqYk64o2AX9BTn/r5nRm8bhGOCl5bGl+ppohwdtNjjIm4cv?=
 =?us-ascii?Q?g1jDI8pm9L35LXm+DfAMBI5A0jX2HdI3ZLF7Ya7NXf9Pvys6K5RN1ze9iKVY?=
 =?us-ascii?Q?Bq3ZZWX9t9KsS3RjzaD9cIuLTlG5nsyZlSPWa/vxRS2e1nrNOl4+UbKMfUFh?=
 =?us-ascii?Q?sOlYXqgVv3RdDYiYNK0UoqZVdNSZMtbXD+1qnYkQXQyV98iyqLXoIcE/+zIJ?=
 =?us-ascii?Q?rL9sxmIyfROh6RlvLFg5NLmX0RN9LptYdDTjNa5zexERiqj7xyd7zJ5KSZF6?=
 =?us-ascii?Q?y9CKscVr/zcQc4vY10PGFg13v7hoMpUkzcK8EU4ICoHZZAu6GnX8DJuylSOG?=
 =?us-ascii?Q?0fQlHYw4EgLAdIp7ScM4+57KQ+hc7wVKJ1H4a2z/C6pscmZZ5yZ9x66+Je1V?=
 =?us-ascii?Q?8t7RFv/PxU7e9/g5q01dEaCbf76nJs9ye8EDksu70HCNMbEGup1tM0wpBSut?=
 =?us-ascii?Q?jYU8alipX1Sw3x8lT56mkQfxZEHAUOl7Y30b0LaPn6kg89wFpOA0lJDmoVMJ?=
 =?us-ascii?Q?nPex5eP6vjkQcyY=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?/GbSxmFxqN22fJloPAzqeaiK7lktXLAtnsLb0o3a0xu8w+34ZWKXQuxh/oEk?=
 =?us-ascii?Q?wOJ+0L00HpLvuEe5WI6sh14wtx4k3U0B0boCoyaYzyOzRkobuvMTbbB9yFML?=
 =?us-ascii?Q?cfcez/Qy7G4vd/76aeIC2AFHktMWEXIoKmPBnDTuhQvjjbJJsI+X2TshPxSM?=
 =?us-ascii?Q?qC65ozyLB96ftNOYMUSQ1hWm0gLjNAPshpqLyoIL748VHzsbx+MuYkt7QlB3?=
 =?us-ascii?Q?EJwY6T9/bt9C0vsFqqV3aF2Pan5Rp9AVuhBoCeZslgivZ9hETrNtObozC6np?=
 =?us-ascii?Q?9BegidLyuFwmR4xnfJEe2K738frMKzWFK1x7MHUAVgLNUqQIWpieNggJY8KD?=
 =?us-ascii?Q?ovcST+xfGhjV346q0lvBrS5s/SKNxZibvbdQeGxgoWPqS6W+8sJrFNlaRylH?=
 =?us-ascii?Q?DIG4SamiHsD12MO+UUVnVfpyffqfefbYNK/QZO2YO9g/O2LzmBc8yWwLGiRr?=
 =?us-ascii?Q?qTOnBmsxVYPuMe7tDnT+NLpNkXs5fHscUuYtd1jW591R1cCckSSruvO1+a11?=
 =?us-ascii?Q?L9FR94C21eKfgumq0L1nK3cm/ljXIfj/PFA57G2btxnWpTwt1lXZZshxZFUn?=
 =?us-ascii?Q?zGthJkCf+X5t/IB0Wx7rz+tqJw+WMfZnMJRkyZUWJVVw4Kcq7EacwdsgC8hP?=
 =?us-ascii?Q?gDrg3TP/7+OiizHxr6vu6OTCUxZ3UB2o0T4HR0ul+ska3b8fNSzkw0mE/Kr4?=
 =?us-ascii?Q?K1xYEKRNnKpT0ozMTXw9OqYlud0CDrY8y1ulbafFKETNtyMDU8BGMn8ELYS3?=
 =?us-ascii?Q?9UOVA5nhvURx2URwI5ULj5uHkM5yzT1EfaGpRWcWLDeXO61W3QGOj8Nd3MQL?=
 =?us-ascii?Q?S+QW6fAuOx9hxr7wnZk8UO0o8/sdBvpO7wavJbc6+dYzcFpfqQ+Go/2Brjor?=
 =?us-ascii?Q?bT61filRX3ktw9OHQ44bBaX7BV79rr+L5nznMsGq2v1rY16udJyS4Lpsc+4o?=
 =?us-ascii?Q?O41qupbu2MQRvokeQekm+TknolI5aCiDOAauBCNmCvfvQoXo6EOxtrCjFN2z?=
 =?us-ascii?Q?ywH1xDIeu1EhBhxmh9Y6PnvQqe/sI/8RKucxqiK7T6GySD+TuTppNW2icRmE?=
 =?us-ascii?Q?ATArILIg1+Q9UGPaTOTgdWgH16eQOzwLe7941hcjt4mQx1VyE2Yr6m7XMA8K?=
 =?us-ascii?Q?ZI+q62YhAZ3kZPz7A8IlplU04fsPoqlcCovkQfHJxEZl+3Isix1l7slAlmLX?=
 =?us-ascii?Q?jqZV1pVWkk08qzK5jDCoWErdbMrSONML2Ga5T/8gS9LGURl0U9U9z5M9sbTE?=
 =?us-ascii?Q?X5eoSkLdaWuCdN/VmjWZ9M+2/l7MnT7P/ikFt9rNgLYAKot2Jr5PQhn+BN6E?=
 =?us-ascii?Q?KZzyDByv0z+HXSInmWJGNMab9PoZR53jRJwUW1XPWQQ8pI0xxliNPZlo0Gb3?=
 =?us-ascii?Q?wX3E+CNR8iFrGE1GFzzxEHT2a7zS+MwqdghGeIbjN+0jlatuqJaiVZtRAZT8?=
 =?us-ascii?Q?NLwACI6vNJZ24Bci7V9JcksoUYUeM9LUNgoqt4UpcMcRd/IdYvuynb90rvuP?=
 =?us-ascii?Q?ucORAQ7tlTnvt5gHvd5K50f+AubH2Z2cLM3fGesVM74D6lMU3h3WFXNMww?=
 =?us-ascii?Q?=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9e0e751-d3b5-4ff1-1c3c-08ddfab3f526
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2025 15:14:57.5073
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HU8wu1NJdip6+NRTZvqasNy00qoFfsttr9kxDPoUJLv7fHNApaHdUmLCqn5fHf5S
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB8361
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 15:15:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223893

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Ross Burton via lists.openembedded.org
> Sent: den 22 september 2025 16:21
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 4/4] libdnf: remove obsolete path path

path path -> path patch

//Peter

>=20
> We needed to remove the build path from the source tree because it was
> embedded into libdnf/dnf-repo.cpp.  However, this was replaced with an
> environment variable in 0.67.0 onwards[1].
>=20
> [1] libdnf 04d7fba0 ("Use environment variable in unittest instead of ugl=
y hack in libdnf")
>=20
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  .../libdnf/enable_test_data_dir_set.patch     | 36 -------------------
>  meta/recipes-devtools/libdnf/libdnf_0.74.0.bb |  1 -
>  2 files changed, 37 deletions(-)
>  delete mode 100644 meta/recipes-
> devtools/libdnf/libdnf/enable_test_data_dir_set.patch
>=20
> diff --git a/meta/recipes-devtools/libdnf/libdnf/enable_test_data_dir_set=
.patch b/meta/recipes-devtools/libdnf/libdnf/enable_test_data_dir_set.patch
> deleted file mode 100644
> index 6fc05d9ff8a..00000000000
> --- a/meta/recipes-devtools/libdnf/libdnf/enable_test_data_dir_set.patch
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -From 870f50ba4761317f2db018ac130a42087230dded Mon Sep 17 00:00:00 2001
> -From: Joe Slater <joe.slater@windriver.com>
> -Date: Wed, 22 Jul 2020 13:31:11 -0700
> -Subject: [PATCH] libdnf: allow reproducible binary builds
> -
> -Use a dummy directory for test data if not built WITH_TESTS.  Allow for =
overriding
> -TESTDATADIR, since the default is guaranteed to be wrong for target buil=
ds.
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ----
> - CMakeLists.txt | 7 ++++++-
> - 1 file changed, 6 insertions(+), 1 deletion(-)
> -
> -diff --git a/CMakeLists.txt b/CMakeLists.txt
> -index b1daacb..f461e54 100644
> ---- a/CMakeLists.txt
> -+++ b/CMakeLists.txt
> -@@ -131,7 +131,12 @@ add_definitions(-DGETTEXT_DOMAIN=3D"libdnf")
> - add_definitions(-DG_LOG_DOMAIN=3D"libdnf")
> -
> - # tests
> --add_definitions(-DTESTDATADIR=3D"${CMAKE_SOURCE_DIR}/data/tests")
> -+if(NOT WITH_TESTS)
> -+  set(TEST_DATA_DIR "/notests")
> -+elseif(NOT DEFINED TEST_DATA_DIR)
> -+  set(TEST_DATA_DIR "${CMAKE_SOURCE_DIR}/data/tests")
> -+endif()
> -+add_definitions(-DTESTDATADIR=3D\\"${TEST_DATA_DIR}\\")
> -
> - # librhsm
> - if(ENABLE_RHSM_SUPPORT)
> ---
> -2.43.0
> -
> diff --git a/meta/recipes-devtools/libdnf/libdnf_0.74.0.bb b/meta/recipes=
-devtools/libdnf/libdnf_0.74.0.bb
> index fafd8c5905a..720e7d6e6f7 100644
> --- a/meta/recipes-devtools/libdnf/libdnf_0.74.0.bb
> +++ b/meta/recipes-devtools/libdnf/libdnf_0.74.0.bb
> @@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd25=
5951079008b364516c"
>  SRC_URI =3D "git://github.com/rpm-software-management/libdnf;branch=3Ddn=
f-4-master;protocol=3Dhttps \
>             file://0004-Set-libsolv-variables-with-pkg-config-cmake-s-own=
-mo.patch \
>             file://0001-Get-parameters-for-both-libsolv-and-libsolvext-li=
bdn.patch \
> -           file://enable_test_data_dir_set.patch \
>             file://0001-drop-FindPythonInstDir.cmake.patch \
>             file://armarch.patch \
>             file://optional-check.patch \
> --
> 2.43.0


