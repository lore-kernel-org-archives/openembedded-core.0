Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CCE0C433F5
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 12:38:57 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.73])
 by mx.groups.io with SMTP id smtpd.web10.10522.1639399132240763451
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 04:38:56 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=McfNTVcE;
 spf=pass (domain: weidmueller.com, ip: 40.107.6.73,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nkK0RP0l8l3BCTswezAoTA1PLriy4kvehAJ3rtCSdUf3g8lzR5nnILDfzkj/KuOOoQXx62yywRWtFvq/wxgEObVDcnYNO7Xujz7wPaARlC6v2a+xTby63582Ak+nxKeY8z7v23ncAWp4Cd5XP+KN5lPi0rcSy1E+bTojkS8FxjeXkG/DgTVczFe+TdeMHg2czgojnt6G+sZawHGag029RV2XBN5WShji3yIWbibviZg/MO0oHcC3Le7/z3tNqiPEfkI33aNaVoxymtVRm3IscIMImR3bkOO0cqlH/M2JuWeAp8MxcOE2uLbOInrTNx6NjS++pq3XmzfGTP3YZqbnrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IXRmx/I2ByMTMCN15UQowS+7+ADzqgvNr5srUtOn6Bc=;
 b=KcBXB0pWX9/u0QcXBuxhjw8iTtza/bN+SdPOxqkO6i9MzghGm516sjON6PKmu7GIB6DM/PTK/tr1vOgldy7+iVwXeCLsyin6mgboEKOTY8Zv4zTB7fEfjTd3+F/AUQKA9k09fopwCjOa2rKGxmNNUZXKzSa2E3ehIAzd50k0aHtrNYYNGIZEPK1uiH0V/qETnulcw4p/CKSggUJAfB67OpzGXv9Jv2KvSnA423Btv+lxXS7EOwOdtvw1XsyzZ6sCBKIt3tcdWIan0zzAvOyyB5C/aLXnqm6YD05zK6E+PhFEq4HLFfCmEfGSgaQcIze31VCsDQIrwIvKMB0e7s7NoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IXRmx/I2ByMTMCN15UQowS+7+ADzqgvNr5srUtOn6Bc=;
 b=McfNTVcE1OtpRwvNwyYnh6f8K9gIY2TJq7WSm/bfXTMP9oqVEVEgsM4sCGJnKI99227oKK+a5Isi8mP74rp+nGUlIs+6wqCVrO7jhwmHVSzg/BQa6RxSM9ycnPZhNWkUpn3+cmcY98fOBON6Ri2I+ciiH0ALEVI9MmvH4fkO0pE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PR3PR08MB5595.eurprd08.prod.outlook.com (2603:10a6:102:83::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Mon, 13 Dec
 2021 12:38:50 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010%8]) with mapi id 15.20.4734.032; Mon, 13 Dec 2021
 12:38:50 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [RFC PATCH 2/3] selftest: recipetool: Add test for split_pkg_licenses
 function
Date: Mon, 13 Dec 2021 13:38:25 +0100
Message-ID: 
 <20211213123826.31605-2-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: 
 <20211213123826.31605-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: 
 <20211213123826.31605-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS9PR06CA0349.eurprd06.prod.outlook.com
 (2603:10a6:20b:466::24) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
Received: from DE10512.weidmueller.com (89.247.126.92) by
 AS9PR06CA0349.eurprd06.prod.outlook.com (2603:10a6:20b:466::24) with
 Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Mon, 13 Dec 2021 12:38:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cc684dbc-41c5-4248-4de3-08d9be358390
X-MS-TrafficTypeDiagnostic: PR3PR08MB5595:EE_
X-Microsoft-Antispam-PRVS: 
	<PR3PR08MB5595CAA4A6E5C44FB3AB6B48D7749@PR3PR08MB5595.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:404;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LSRkT91/Ooe50Y02ecUYmAodm4PFvKGNdFWtQucjT9yAKXlPDUSbKlpa/v2S+iVf4BEUZ33lc3PDzsf9vuiuheRKJ+gGbeUHa4fTc9xS9mBYu3mqnhBCda3ZKnIu74BxwuEliGCfC0RI5pF02vyT/AxkErbaRo9nh0LOUTIV/bQNtmAqKu6hKRzfYduVZ7l3dqsb2jWM2Lcq6diWUNitrHxgwXZWn8fuip/nwPzuKYCuQzBgWnCYHHZaxnRwHRQUkEoNfly88uJxWt7WpR+JJykEVFu1y74sbsYqd/LArwl6VJz6/cj7Ht2arrwJifW/xqLNIGhRm+AmozwZkgadz2qCXeHQ/xb0A6BrrtOlsdD5wrJknh/fokIZtQZ4eO7J3yd98UC9UP7mN2BYPakpFajRcT/ZU8CuTNtdYOFYMD+fJo2ZrmfQC8aXA4AcEZFQxh7hZOKS8ATNKHZ6L/pQwzSi/Br4YGdqDFhI/03Ef2UBsWGh1PJKWrvZ9vch0iMGdPD19n/E9E3OACTQtGRUJ/ZcmUe0PPS4eWhy0sR7XrBz3/xAC+J6csIVSu2InH0L9dNF/LdzO52K2a70TBhfl8q+s+ViJ69kJZ4zM2l4/YZBEnTbSSWcOLqCQgZS2HF+6kSvpl08kTQcK3kJFsaRmGJ+Rp59ZQnK1Q2tS22Q5uYhYvjWsSBoukGFPzgwGb3/+ZA8EjXAUyBeXaFguoPdPw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(38350700002)(38100700002)(956004)(2616005)(26005)(186003)(86362001)(316002)(66946007)(52116002)(7696005)(6916009)(5660300002)(36756003)(2906002)(107886003)(8676002)(66556008)(508600001)(66476007)(1076003)(6666004)(8936002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?LfGJCK9xIelRA89dKeLGtShIMADaAM1G1gOjDlWxhjWXXo4Yh4Tn1Bhq+Tiw?=
 =?us-ascii?Q?vP4pBmpXl3NIednP9Y2fsfED7wtH7NdAKhekuNZLbl45gR/LKX3NQPdEo+ev?=
 =?us-ascii?Q?SgCPKnEdXlmd7dPcdVuMo93H40sGuslh/4haVkXQfRwe3165fuBmKtbvKBtL?=
 =?us-ascii?Q?vOpcTAFvr5B3bFWClUrOxuFjNH8GGai7xd910oEMqoKI61EJPIF6p1aYeXKj?=
 =?us-ascii?Q?9Xrzjuvj25gfaVi1d4OyetogsPHv7X203UWAF5HZW4rq5fpd2kvMMShScjf0?=
 =?us-ascii?Q?gDgV6kSupm7DrsSeTY+MKScKOMGAvyLJ2pN2LyV8/io494pMOPuf4+9zfUBe?=
 =?us-ascii?Q?2UfzKgvPpGokztws73BvPdc3xywyMz+GiAfDRS5SpRT/xRHW+ZLygKi2dssI?=
 =?us-ascii?Q?qErmZ3bnp2iehS6XzPHDFlVCFzG/1e/B/bcAM40Wt15GYbsxgrCrDON8xJB+?=
 =?us-ascii?Q?wYNIk86UCxzEccbiFzbeH1S6gLk506Po8oSgJkyBDE03bD6upB2ohnjDxHaU?=
 =?us-ascii?Q?DJNcSO1Ai990qUh+JXOdWHZpzowjhCpUXfZ4RcdBGRDugE/MWf9kEPtYwTzP?=
 =?us-ascii?Q?ye7Y/QYO/Ivi0mBM5t7O5SmTcwI9D/Dsauv5eenH8e7TCHcJ8CoBGtd9A+gY?=
 =?us-ascii?Q?bM72qw5oZJGm5qb/VPgBGXMPiyMwxljYWaEoQex9YyIZPbfzon1dyUQARClS?=
 =?us-ascii?Q?NzB9XJLa/6rMJnY6TotP/v1s/9D16RpmzLUa3bZ2mZeWR6s0ZrfIGgU2BuD+?=
 =?us-ascii?Q?yRl7aU63E2dCWN3vuKWa2Q0P3WVjWwPwg9M0WpUHaxjDunuFMyLsaunNvIPq?=
 =?us-ascii?Q?EsYjBy6r7WZ/H5fNvc5keVHqLkQ/eR/49nKmr+feed3oU7bDltyCRujctNod?=
 =?us-ascii?Q?sms2RqNmrwR4/GOmyF5ClsY1HdzLKFj+F4rcPWeV2poFVGcmAxvBfI/neWlu?=
 =?us-ascii?Q?XYPvkQD3vSvwR8rVp52jrYMdL3d0GcL2esduZzRtMgK/cWunoePiyVcsPGn6?=
 =?us-ascii?Q?QwDCoKV/KyEPM42vcNdkfDYEIUA3cIWnJbBUFssaPQIGMs0OFCRqln1k5sCl?=
 =?us-ascii?Q?SxQTIvjLuw4kUryLE2jxspkXb0EsldchqKZ62edPKZiY3v49Iq/e8Eqv8ZoV?=
 =?us-ascii?Q?+6qhQQR4dXHdN+3osLDh9/RAggcb5o6/C0aFgPYE0gxr40+ihkNmLjEuYPz9?=
 =?us-ascii?Q?Mn6CKN9pyflHWo4UV3YPR97ps4DRqJBupMhLDoJQtgIqMFYhXqJWfiUh3TfM?=
 =?us-ascii?Q?uhK1INFmepfiX4qzEP+odvRM68Rk5a6RUbZOUcd25iZAY0Mz3j+lF5lZebDF?=
 =?us-ascii?Q?J9Rd8RC2KkSTgHziWcUwEIeVQKw/N7tjwbjn33HULz7sa32ARPK0lL80QCaO?=
 =?us-ascii?Q?4nzQbMMJHUAMZ5ca0bKiJok/3HfuvmKHzsOnjmaNWXD6mhkDZZUHeEGJGNJG?=
 =?us-ascii?Q?KPYFZjp7BnuUpY2xgB6zId5JIFPiNsHGHg7jCJ3fcyuVIVzBH+hjpvVUX/o0?=
 =?us-ascii?Q?uln41c/Dk0wJYz/AaGgnF8/KAUW06l2NzTO9b+QxWq8MsTUigvZP5f55QEvt?=
 =?us-ascii?Q?8UjD3tDdwUsDkfHvUIeFW6LHmZHO1f4Q+WleRNzd2Ps+InEX+OQYrn12JNlZ?=
 =?us-ascii?Q?bLbkJzLddBEJdxdPFKp2Tcs=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 cc684dbc-41c5-4248-4de3-08d9be358390
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2021 12:38:50.2200
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 tq9QOuryoaQk+kE9ktmEzQHpBCnIobIHBK18OMwVSclaXmEKK9ykLEI54BLMCpsoaFKAft8cVBw5R29nkTHtwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5595
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Dec 2021 12:38:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159620

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

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


