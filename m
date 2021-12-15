Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7AE7C43217
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 01:43:27 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.80])
 by mx.groups.io with SMTP id smtpd.web08.244.1639584527069971504
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 08:08:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=lt7cVYmR;
 spf=pass (domain: weidmueller.com, ip: 40.107.6.80,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EgKOaYurR/TZR3D4z12EsOh4vQM6uo1NWkq/kQVt7mMW0/W8R4/hXbJK3ILT0j7AG6i21GbhY8LahIyL9taWHVYxLz48V/efnEzMACMhMRTFV0r2O7G5Y1unQ6oxvhQ4kh67vXT15FpQpCILygLAG9aHYSaCDh47WJ8YrBcoXMcEOlDcU7qsO5S1TjYNqlDIJqAhtYxeQJE20uOcMaFcrYh6csD2SpwJ83CWb71MEmlWDrBRGpjNPHAyGVeCXfB4jsO9S/DcuelAK3a695yOrvL56EUdksxnJ11GnG2/g91wvp0j0omUmuk2XMDdXfGPeOD3700nKtbPky3bHBkTGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ktlikhEqPnPNewZrNyzVw68/Ddno7d2GXTs+5Sojr7Q=;
 b=h+z7yqUwk5QhNPRTQECTUDZieEw0DqAEPmZzbw5GrHPxsuUEqcon9v91FZkBCx5poLmUR0wP2gURu2rCFmta6y0Q0B0npqIPsQ4iDz3PiNDiwNMaHQXJJ0ZXMOzzlFL94kbs8yjKaAa0WqQr7fp1z/7sbpriWjov0l90kVAKYcoILY3QaGmKED+GQJIhyYZi3hDa0ZmZRQIpJxghoopNFrSe+ysX5gW/3zuy0VF5A89GVLYVx2MXA/8ytBT6sR3sx4T3CDTfaSsv1NkjLAacOhFgMQ5oczEfCBoouPq80yXvXHw+vBFN6MfNlmy51sM1akKVo8OuSYtHkBHspiWd0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ktlikhEqPnPNewZrNyzVw68/Ddno7d2GXTs+5Sojr7Q=;
 b=lt7cVYmRh6p5z21vTglfATJDb1qkJ0u7v2vuGZjpkdVf0gGCETQW2giz2+QFbJFTBx1RrcWoVExF3juDDm6JJ1G6xCWaj71hd472xhys4xWoG5n3YkQtx4mo6bZ87/GOFmjOsMtnrpySNjl/YeIdxQ0aIIuU8nsQu1WlKYmc9I8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PR2PR08MB4665.eurprd08.prod.outlook.com (2603:10a6:101:25::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.16; Wed, 15 Dec
 2021 16:08:37 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010%9]) with mapi id 15.20.4801.014; Wed, 15 Dec 2021
 16:08:37 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH v3 3/4] selftest: recipetool: Add test for split_pkg_licenses
 function
Date: Wed, 15 Dec 2021 17:08:12 +0100
Message-ID: 
 <20211215160813.23368-3-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: 
 <20211215160813.23368-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: 
 <20211215160813.23368-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM6P191CA0097.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8a::38) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0fa890ae-d9ed-4db4-3436-08d9bfe5270c
X-MS-TrafficTypeDiagnostic: PR2PR08MB4665:EE_
X-Microsoft-Antispam-PRVS: 
	<PR2PR08MB4665A4C255734FCB968AB0BBD7769@PR2PR08MB4665.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:404;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2IrtZHZom1aSqKZdK7pG/etcYLwOWkvUM3muueQgiQqpt7jhueT1obj5grCAO0JDwAkZgo96PQINNLmFua6dAs2FZrTjYWedeqhAZFtyCT/wILJ9HeGmytoeAD1yBtVnv+nZlc18Jf+LxZtUN3ZdZxrHuOdI2c8Un++yYVKNNZRoa+UtoQoHh+yMekj8upnZUTGY2VvnEnp9D4QU29eEJv7QzJVABO194ivMOVIo/LM6kaPuYz9wfjakFJD4R7fxXulBf9HNDhCR08x0obWvz0lwut07UoheXNeceqcI6rdb6RI52L8o9xknVeOJCCKMFG9dgeLurlU6HkuAdTk/s9yrXcMAmt53Icm4FIbnBS14ZlGewzcFuZQTIjw2yxhYqZ05617j6JtZkPMyNWIVU8uNuAgUXQwnt/8Bpzitk+RUp7/gzLil7HJWjorSJaSWgG6zD+Q2yrL109I6suaT5EKqL7iS7PZiWYuy3/KSRe58oD4s4zc7t2kJ+5zQl/aqbZzXLM61GoiMP8lyaZTb01Pekm7kBc2MFsLmklHkaZq5FqxUClMjLHMIkSiSw3krJ/02QoD+ePhUSx2ykmVoXxiAqhP5yaVk99mrjYAw+tseElzn2GXGBI8JJZIuDuq56z+rNDBINgZhum0O7Bu8mlJ947dw5ihJkY2zI5tY0hvZaPQBj0Qfm3ORvznq0eBWlG5bK+FvQq3sz4P+j4P6Og==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2906002)(6506007)(52116002)(38100700002)(316002)(1076003)(6666004)(38350700002)(6512007)(107886003)(4326008)(2616005)(6486002)(8676002)(66476007)(186003)(66556008)(6916009)(26005)(66946007)(36756003)(508600001)(8936002)(5660300002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cIyjNILnTh8L/gNPz3Hek07MRxzxCLPaQEKhL5cPqrIisFodIyp/1CZusD8I?=
 =?us-ascii?Q?bjhmluC9ZRUrYrZyGn2rZnELOVi16paYgSgULI/NxeEmC6Z+xdsgkLdrDIyN?=
 =?us-ascii?Q?pBAJNijaYxhf83+Um+5s3iRY9Eag585FgZHUYw3SNVdGo0jdhInGVmmL0Zq3?=
 =?us-ascii?Q?nKzKvPM+gsweAavf8/Uz26i9UxFCE7lP1W4R3xax2BFF5wGFXdUj10whtJr8?=
 =?us-ascii?Q?CzbLhaGwXARJHr0NYPTeyKhuSCSTLf+J8wVs/jtkthVv1Qg1AVf7fF72de3g?=
 =?us-ascii?Q?TzwlYdoMDfBF3rNkMEu2EeE9zrujdi+o0XoodLq/v+aw96eYpahFTJV9a83U?=
 =?us-ascii?Q?WAX25OYLST81O6BQ8d6U7GL8CzjTgeyKHB9Wcz++H0to4xvP73OLW7mZywkM?=
 =?us-ascii?Q?SWKuE8Vp3ee1cy+SZik4jMrPUu2neJ+vfQWlRz6QVHlCaiHGf7m32rVHCUtf?=
 =?us-ascii?Q?G1MVu6qyRJ71rNj0JaPkMZJ8uyiABcUHyLrYLmBhKKZvoBRBgsq5CAA93fyx?=
 =?us-ascii?Q?su3h0PSLRv/NRcx7UT97FTU1Sg7uOT+qbh9MlbUAxnfs5CwEEJvwXBYcq77E?=
 =?us-ascii?Q?e7TPMrNOcD5USfDuBskUVa/i2ouXeobT+4uT/L0xe+0DQURCN+yxrjD29413?=
 =?us-ascii?Q?NiZUoySb8eNCuPfT3rfofAp5PYq3D76I5n7pHpFY2jBx6xkCgh1SZSo7wFu9?=
 =?us-ascii?Q?DlEu8AvqnR6+LYva55hR+dT9fuXcxDG7vSq5eFdIiHWlgVlHYYv4uZqgPawS?=
 =?us-ascii?Q?8MgxDs/xn6av6LiFE+t0idcLiS/pj/t/MrDy9lMGy85zswhrR9jo4fpiUcfa?=
 =?us-ascii?Q?WR817ycByaDc5XGhD8CSiOWL5U0ryRtL1v1er6sZTunDLLKgFPW/hT9gMpEv?=
 =?us-ascii?Q?+mAk75ijD24REGJAPSSLDqTwBnUQSl55Kf3KVx4yLFDc5oBBdLHB5JHE8cma?=
 =?us-ascii?Q?Bwlf+zuG+fprvp/lFukjUZH7Qx8Yi5fidseKr7LhTK46x9YsgqvGCiqVtgoP?=
 =?us-ascii?Q?2nlO/jxR407Pkv+o+iv5J8rbb4QAWTGsd+U4ejjyv9fJrCEomhefTWBcccnd?=
 =?us-ascii?Q?Xuk3BSEkrnl+ZQkjTvr4VEyyipOHeoHUtOvBKQiS0hTzexQpkXYMlInEmAoi?=
 =?us-ascii?Q?oWFbKIxyWKogs6yfyjDMlUqCb42ZVVRZLxUhJjiyWj37aLcg90I+iSrwQJcD?=
 =?us-ascii?Q?6yATA9fZdp037ec6ffoubPiuCZwObc/LEl75EHK3fjASk7pTbVO83ZGICrNY?=
 =?us-ascii?Q?2hG/JUN79qf8julv4gx4GZGa3JmBiYVOwYO0tqZhJwKvQ6M9nlryB5F93AIA?=
 =?us-ascii?Q?G6zUtiIj/WB0dUXC9vr4sF1vMmEQQTWZUpZOUCkZQ+Eju3n/CSI8tYwh1h8f?=
 =?us-ascii?Q?wtSn4xwbfPInAW1yAT4ojoT20xm6F8U6tf4B/yIyZDskohdtAVEsOk4dAtjk?=
 =?us-ascii?Q?DChp4CEFqzgduNx+HKEjcWinUGYiJ1IjuVVjmHpN2y4BuI79unO82VA+UTr3?=
 =?us-ascii?Q?iqYSbMJEwKlLlm57N9npth8nrCSz/AIscW+4Tey86UAq8M9WlwXnkMRQBfnx?=
 =?us-ascii?Q?V1r+T8r3PZbYOnW0WEpDaf/8uQJM3e1JKG45lgqutHQ6hUPxF0MMrqgyeECv?=
 =?us-ascii?Q?sMhbzr4/wQ3W6z9Ve3YMG9Y=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0fa890ae-d9ed-4db4-3436-08d9bfe5270c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 16:08:37.4367
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 EcfciL59PVRD5YVACN7IFNa+X0rTXUy1Yi9rp1CWxJe+9USUafVV4JDKJ7/6qnw1KOxPzR7BS2ZYP+//a01yTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4665
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Dec 2021 01:43:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159734

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

(no changes since v1)

 meta/lib/oeqa/selftest/cases/recipetool.py | 64 ++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/sel=
ftest/cases/recipetool.py
index 95e4753976..1c73b2c5e0 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -541,9 +541,13 @@ class RecipetoolTests(RecipetoolBase):
=20
     @classmethod
     def setUpClass(cls):
+        import sys
+
         super(RecipetoolTests, cls).setUpClass()
         bb_vars =3D get_bb_vars(['BBPATH'])
         cls.bbpath =3D bb_vars['BBPATH']
+        libpath =3D os.path.join(get_bb_var('COREBASE'), 'scripts', 'lib',=
 'recipetool')
+        sys.path.insert(0, libpath)
=20
     def _copy_file_with_cleanup(self, srcfile, basedstdir, *paths):
         dstdir =3D basedstdir
@@ -588,6 +592,66 @@ class RecipetoolTests(RecipetoolBase):
             with open(srcfile, 'w') as fh:
                 fh.writelines(plugincontent)
=20
+    def test_recipetool_split_pkg_licenses(self):
+        from create import split_pkg_licenses
+        licvalues =3D [
+            # Duplicate licenses
+            ('BSD-2-Clause', 'x/COPYING', None),
+            ('BSD-2-Clause', 'x/LICENSE', None),
+            # Multiple licenses
+            ('MIT', 'x/a/LICENSE.MIT', None),
+            ('ISC', 'x/a/LICENSE.ISC', None),
+            # Alternative licenses
+            ('(MIT | ISC)', 'x/b/LICENSE', None),
+            # Alternative licenses without brackets
+            ('MIT | BSD-2-Clause', 'x/c/LICENSE', None),
+            # Multi licenses with alternatives
+            ('MIT', 'x/d/COPYING', None),
+            ('MIT | BSD-2-Clause', 'x/d/LICENSE', None),
+            # Multi licenses with alternatives and brackets
+            ('Apache-2.0 & ((MIT | ISC) & BSD-3-Clause)', 'x/e/LICENSE', N=
one)
+        ]
+        packages =3D {
+            '${PN}': '',
+            'a': 'x/a',
+            'b': 'x/b',
+            'c': 'x/c',
+            'd': 'x/d',
+            'e': 'x/e',
+            'f': 'x/f',
+            'g': 'x/g',
+        }
+        fallback_licenses =3D {
+            # Ignored
+            'a': 'BSD-3-Clause',
+            # Used
+            'f': 'BSD-3-Clause'
+        }
+        outlines =3D []
+        outlicenses =3D split_pkg_licenses(licvalues, packages, outlines, =
fallback_licenses)
+        expected_outlicenses =3D {
+            '${PN}': ['BSD-2-Clause'],
+            'a': ['ISC', 'MIT'],
+            'b': ['(ISC | MIT)'],
+            'c': ['(BSD-2-Clause | MIT)'],
+            'd': ['(BSD-2-Clause | MIT)', 'MIT'],
+            'e': ['(ISC | MIT)', 'Apache-2.0', 'BSD-3-Clause'],
+            'f': ['BSD-3-Clause'],
+            'g': ['Unknown']
+        }
+        self.assertEqual(outlicenses, expected_outlicenses)
+        expected_outlines =3D [
+            'LICENSE:${PN} =3D "BSD-2-Clause"',
+            'LICENSE:a =3D "ISC & MIT"',
+            'LICENSE:b =3D "(ISC | MIT)"',
+            'LICENSE:c =3D "(BSD-2-Clause | MIT)"',
+            'LICENSE:d =3D "(BSD-2-Clause | MIT) & MIT"',
+            'LICENSE:e =3D "(ISC | MIT) & Apache-2.0 & BSD-3-Clause"',
+            'LICENSE:f =3D "BSD-3-Clause"',
+            'LICENSE:g =3D "Unknown"'
+        ]
+        self.assertEqual(outlines, expected_outlines)
+
=20
 class RecipetoolAppendsrcBase(RecipetoolBase):
     def _try_recipetool_appendsrcfile(self, testrecipe, newfile, destfile,=
 options, expectedlines, expectedfiles):
--=20
2.30.2


