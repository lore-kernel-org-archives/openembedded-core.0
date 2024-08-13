Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ED01C52D7B
	for <webhook@archiver.kernel.org>; Tue, 13 Aug 2024 13:15:43 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.92.57.23])
 by mx.groups.io with SMTP id smtpd.web11.71770.1723554938922928006
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Aug 2024 06:15:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=LX0lQkU3;
 spf=pass (domain: outlook.com, ip: 40.92.57.23, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a2IgQ2TXpIg9H85yFyQTMVS+QI1mR3OoNEKS6NfuXHy/tpKzIEBM56+APQ0237tE7JWhaTR2TtDZOTBh1eZF4jjSezgC/j5sOSiCsre8aw7qzFVJmOPSeX1r2+aV9pi9knFrC3HXtE+t7gBcqoySp+w8nbvX43MapbEy983PAhtMCFKVjj7xx+ChWajnANFegHGYdoQ3srVnLC0t82t9owQqsX3/+9jAiopvuomBuXMj+iefwkj1pQboASC77/dWW7spaTL1sQuBpoExCh2XzBJjIT0qjl7zKCIkeKnPymTUloqYOKRmdE/8kGf4v3ot/K2uivRWTdJlpfMDnAkauQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wBrRUcnEc35NlnzRZxLKRpZ4kcGKvF/1NZMa9Hwx5MI=;
 b=kvOyFlTmmJi0VauOjcbH5T4EpKbW6ZyJsbIFdZgz9aLRebqrD7Qi9kVBNFuaFhzQe0jedKrK28ZzzxNfOdmX9Tv3usCrlemdJktZu4I8PKKTUH4+KKwxUC1hDo7YBoiPrN36/tR+gEkI5Vmdm/GDZ1ooZWW0bgkR9uLd7RzGi/rpC5chMjhRLbIjOcGhHNzEvfgaBH1kRQNr8JBqeAJPOIRU13H2RFK4+TIX5GVCylN3lQWqZuAbwHEyKkZ2cNKSCQT9HamZK1+7Iz+eUkiXXMtmT1eqSauokhGaagd7CN/1FVED25+GkHkfBkq5NPnXsiLQmBJUo967gPFMAjmyNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wBrRUcnEc35NlnzRZxLKRpZ4kcGKvF/1NZMa9Hwx5MI=;
 b=LX0lQkU3JYn1WCuFn+VgEDUNU7BgYJ/R+Un0VtCcMY1WGyLT6guSyAYuaR6ZMGvmAEQFWdTFOiNCEo5fK0Q1FGhYdlNKIYz1KyeLvg8ZiL7nshioPJp5s8tVlRLOjLArEemxX/DOzkqAklG24i9apxfogAQ/o/gdYNBtPSPdVekS9/ZphCD8zZ7AtkkKXrfUilDpAst4fqUFVpujqBCdcYfGtFwPUOCQ7w67FzdF6/2MPImfipnTVd/x0u0beFE+CzmbDTHfKBicGF3v1iCLCmQwWRnK+lQBGZtcSnuUSG9XZZVyhiTkNsaK9vX5/Y6Ccl6uT13L8tQeoFfegWdi1g==
Received: from GV1PR07MB9120.eurprd07.prod.outlook.com (2603:10a6:150:80::7)
 by DU0PR07MB8970.eurprd07.prod.outlook.com (2603:10a6:10:40e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20; Tue, 13 Aug
 2024 13:15:31 +0000
Received: from GV1PR07MB9120.eurprd07.prod.outlook.com
 ([fe80::a630:7019:63e4:a48a]) by GV1PR07MB9120.eurprd07.prod.outlook.com
 ([fe80::a630:7019:63e4:a48a%4]) with mapi id 15.20.7849.018; Tue, 13 Aug 2024
 13:15:31 +0000
From: Konrad Weihmann <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH] python3-cython: fix upstream check
Date: Tue, 13 Aug 2024 13:15:17 +0000
Message-ID: <GV1PR07MB9120960AEA6C4316918EFA6BA8862@GV1PR07MB9120.eurprd07.prod.outlook.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-TMN: [9Des6SYIK7L7Cgl0/EQK28fVd5A7eLNLfN61RHRjWcteC+oDipjeHy0Cgfw+w0Pf]
X-ClientProxiedBy: FR5P281CA0026.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f1::11) To GV1PR07MB9120.eurprd07.prod.outlook.com
 (2603:10a6:150:80::7)
X-Microsoft-Original-Message-ID: <20240813131517.4085298-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR07MB9120:EE_|DU0PR07MB8970:EE_
X-MS-Office365-Filtering-Correlation-Id: 1acad7eb-1e10-46d0-36a3-08dcbb9a0207
X-Microsoft-Antispam: 
	BCL:0;ARA:14566002|8060799006|461199028|15080799003|5072599009|19110799003|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info: 
	KS3XefqMyzjTFu+J99V8dY8ttCNhLG6nDetUHrgK8AUJNPMO0Q4jvyurI53vlq3kylfMR4aLcnTQMu7V7vHGjfbE9voG0nUNoTZytkaZgE0LJlCgqiebOSvGpDnFPWkFwKHFILAu6SQmFtaJeRYPG+FypX7QnYt6/uz2Y58gBCd8ASdLvA5FFww630Yh978ByLE4y+Kzq7wiTq1nADaz5R07oHxcFoQE9O0phJgUHkUs3h8gnskO1od/7DZ/qF1JY2Y6GYUXru8hs1OCfjGnGTeel8Ca0sCiCxrTvjkrYwpE49e/F8W6EonV5Sdkkse1YY5NYh4IyORMdfVzgrzwysN7zPrlgJuSj5omSFmGK3gfhSNfsABJIKXNDujvzs7eFm3ZNeVwNan0rZE91P2v+NUf+GnseS04uHO19o6gkuYq05jfIpmB6o/jOOIpSTy7tT9dBaAz22I84uGNaymDnTLNpsyedL1m7imXe7Q5WE/MDuFUJUtYJVq3DBh9+lLp+23pmBe5x4AIZSaah9kqwXsrvixh+KDfY1lMcgPqBbUarKgkE1LxxozG/afOOJ9AoLdkpucU5sUhr0PPB5XkSXYaSZ7s17VTh9qsBapC9emgvykmT4FKc+TYcBiVg0JG/ak2vzeWKRrTOTjORaBYXt4DSpveKiyxxPksQeWmZX0SPH5kz5wqAyiTEny6wtcJG2wPQvunVxPfPX+8l7THwzSegmpTeFAIVVyIiK47Aus=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qiQ+3SmympZsW2SI1rOs0RaYo/5V3GEHQVpaQ9Ny2veQbWajtVDy/nEcJCtS?=
 =?us-ascii?Q?4+WKFsHbRVX34JChPsZZGbhNRNmZXm1dsEpAf7PGlOPrGfHGc7NXWnww8XtQ?=
 =?us-ascii?Q?JSAjBrcbs9Fdf7P8JYXER4yFQmkW/QAVAUJmxgYmmmj3czzzJ5Bg9K2wWE96?=
 =?us-ascii?Q?iSQ/wCUqvoyBKzU28DwqWEH3Dx8rQm+57v1gWb/Ugt1DasZ8WBXuY4+jbmAx?=
 =?us-ascii?Q?Zsxhl7lEEiYF0f6UnXuIHvKSvUFN6zE4PjsS8TPx4OPN1xtBjSEAK3UFGdxr?=
 =?us-ascii?Q?xkF9o+Vbi2C0U+pp8ma/JWR45lQx5M1zJ6sbMoXUD2oxECY/N0A8JPCMgjz4?=
 =?us-ascii?Q?okW9ySCnyJVY1tsqpxI7b7iHVhALhHtWSGudGHAHPR970zeuiic/lrDrP5HB?=
 =?us-ascii?Q?/C041aDwK6CmzWFeoYE13shio86mGqOFLTnWVILyB1vfokhYGT7MRry5mmfW?=
 =?us-ascii?Q?TuIIRXbjNWMPjFUtDtajPzAHuG+dTkCALj//I1oSW+8WZ/2B2P4SWCNzqksU?=
 =?us-ascii?Q?6dTaAT5IAv5ywxwvDCgIpyOJ/y8jEH1q1+3rc+PNYmWVuHvS1tA+ZvaB4Lit?=
 =?us-ascii?Q?l/qqqSWMKRCOSomUKayNngdO0XQhdqmnXpZOLawI9bvdLbJMh/upb5D9ZgUt?=
 =?us-ascii?Q?z4dm5SSBOHbOuI9QbcDC+krng8ZSe4qYei8AqphgkJnnf2rWFkYvPTWpnTl/?=
 =?us-ascii?Q?9UdZtDpirzrnlHJGLXbYwbOzHbdIwjl1+2hCsuJVb0rMwv6nsi3sApIa1tz6?=
 =?us-ascii?Q?L4Z8vokSoaTgGQIXIUAKl4bfT545xHy7T/aLo9NE2hFwAmuK1MvY67pbqWJL?=
 =?us-ascii?Q?GglODf56GNb3dHxAI9MC7cW6jQeOiZqNYxb5+StSxz114d/XlHiPnQ6NwCnm?=
 =?us-ascii?Q?DeujS9Ms9ZNTa8WG7lcwtFp0NGzr2YcAgn8NCPChosaHGUHgntVn5pofBxtq?=
 =?us-ascii?Q?OWqup8o+UWXRguFnodx+3X1OtbltTWwg7DdM5woeTVTf+ja1meD4dwgDBvn4?=
 =?us-ascii?Q?OG30nYaKbvRF+zXkjyoIvs5TxGlQwCNB+wdx+OoA6iM5r0gScYeFHax3ECcN?=
 =?us-ascii?Q?X8e6uUJm7+wTTtTPwFVQ2FmVNRfWlYM63FPJpJxeo4vMaHTrQE9d/Ef88qoC?=
 =?us-ascii?Q?bpyvBxi+1/PSY+Jo/z8aE3fteeeU1rQrh6Q7TFjznicdPZmOkldeX3dMSFBm?=
 =?us-ascii?Q?709pkO0Mk+IgwTgexI/U6Qx2VDSA71cjKPPPY8EmwrHbb5N/fM0AtrvMSAHz?=
 =?us-ascii?Q?T9d00cx4pAtJDXHg+Qx1gpBGldKUbWhNVI560DJwR1Zn9NLSTBjSXPojf5Ma?=
 =?us-ascii?Q?AUY=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1acad7eb-1e10-46d0-36a3-08dcbb9a0207
X-MS-Exchange-CrossTenant-AuthSource: GV1PR07MB9120.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2024 13:15:31.5146
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR07MB8970
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 13:15:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203278

as package name contains uppercase chars

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta/recipes-devtools/python/python3-cython_3.0.11.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-cython_3.0.11.bb b/meta/r=
ecipes-devtools/python/python3-cython_3.0.11.bb
index 2923664641..436dd5b000 100644
--- a/meta/recipes-devtools/python/python3-cython_3.0.11.bb
+++ b/meta/recipes-devtools/python/python3-cython_3.0.11.bb
@@ -11,6 +11,8 @@ SRC_URI[sha256sum] =3D "7146dd2af8682b4ca61331851e6aebce9=
fe5158e75300343f80c07ca80
=20
 inherit pypi setuptools3
=20
+UPSTREAM_CHECK_PYPI_PACKAGE =3D "Cython"
+
 # running build_ext a second time during install fails, because Python
 # would then attempt to import cythonized modules built for the target
 # architecture.
--=20
2.34.1


