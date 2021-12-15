Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7C99C4321E
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 01:43:27 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.80])
 by mx.groups.io with SMTP id smtpd.web08.244.1639584527069971504
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 08:08:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=QkMS80QQ;
 spf=pass (domain: weidmueller.com, ip: 40.107.6.80,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kiXrXJ/kstvr5U1gj7pNjjK5BFMqrGsXodnXpQLEj6siMXsNBIzCwHTr9sgvKYMPb5O8tnevRXFn9Bg1o/SZYTlKiJweXf2rCmAzW/E4OPaKMyuONGcMmTqc9pnl1tK7cw92vDKA5o+SYw+8cB6xijwtaL+rAgQGAHjyPbEyKi88DHfXYZ/0Cwb4txiGKDpEdcYT22r54OtCHvP6ZpLCZxDhu31AiOJBGUitt44EF6Xe6jh/CH/wI2o4fTO0oQOfji/QYzVSrchZXeSsJxR2+AQTGGqUE9bAkp6hyGRVMtOX1DKw/rLo04ADXAee0Kg2oTTiRvgJH/WpJWmFfnp7NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ro61iFU6F5vAjZXAWQ20lo9bYzcmuYcz0HWZGyeSpQ8=;
 b=L3UDwWBaXKVR3jonxXWqlaT3cjyQRmr4iRFY7NAy5wzIcRQLtkUJ+eWLqad6vKjOBd28PpyJzViFkikdTxInJ4tYYxSJonG5HN+W40bOJN4b/CyQMaC4Um2JvokPDj8OfFqJrfYgaFo1GYdSHG0P5CbaiYNuMOFoO8IclT/GyVWudzkUCxKAbMuVLL1kOvM9vQ5I/Ye9hKYgr+ittfAZUzUVmwoWJvHJ55F5T8ZYhhbB2hazkCgyUEnwvXcN0wlf+07xpz+lCKVPZZrGK1W6mNMdMvHkYZgwOkmKH/6OebElljDUSvL88eYUgZIvbKHPC2Z0w3SzMHuoKMwhFoEyVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ro61iFU6F5vAjZXAWQ20lo9bYzcmuYcz0HWZGyeSpQ8=;
 b=QkMS80QQZtzXTEmCcd6ttC/F84/Nxl1k7HhtDmtNmPeKUxnZUad3dHjAjV02qoVX/AoOsU2hJr5tB4qz/3az5A911sgS2O8zIXY3QuCqi9r3/0TavVbYhUktslGmDxHlru4BvGiQhMW87XOshX0x8RqCwja51zq4sZ+lnR521bA=
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
Subject: [PATCH v3 4/4] selftest: recipetool: Add test for handle_license_vars
 function
Date: Wed, 15 Dec 2021 17:08:13 +0100
Message-ID: 
 <20211215160813.23368-4-stefan.herbrechtsmeier-oss@weidmueller.com>
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
X-MS-Office365-Filtering-Correlation-Id: 12eaaaaa-388a-444d-fc36-08d9bfe52741
X-MS-TrafficTypeDiagnostic: PR2PR08MB4665:EE_
X-Microsoft-Antispam-PRVS: 
	<PR2PR08MB4665A495E26EBF4131613E83D7769@PR2PR08MB4665.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yG/g4hDHpoXZf75OjWJA4kwGdHQOvhU1j/BPK+t1vab6JcGAP/wgFaCpKs0J6iOeCel7Rku/ZzBKFYQuzi/SzJkC7MYqPL+eaLMvMP6CMgCRRUGz0nnGSG3UmRZSP5PCKkJZGY0kPbE4rjkNPY6QHtRVd3A17/ZpwrDG/5sEd1/qT9oxBXyLYS5CpPD2TjdjZC9oQ4i79GVn2+rYPhTRrbeV12YfDHFze0tWM4KcKjc/pqLaUjrgaVu9wK/BIqZ8iKk2BTGs6oJSHOeTZleDpyl97DViZPzLe/o8JuzXi6VJFQXj7VjyOiWWokRmzC4dA1VgQVZ08bH68qvsWq2BdI6RmMzQBGDhyFzaBL9s5c/f4bHNxVRSTQ6WMNwWysIBK77pCzf+HP/eVB7t5aTu/XOhhQ85siCIS4vI4ZcpuIMOKlSXDUsMXIaAqm9FDtHhS26nWQukh1bkA2QvGDZMcAsr2n0u6LhX6l7jv+dnlX2l4eFt6ah7pGPdO7XC5HC0WVTrA+qtXK+lB7PSfqZVRhkDnv/j2VCdkznjYoWlgQofklkByw6m4Tv0m5irZgnFyCRs1IuRuxXgCpjlcOj0731Mcreke9y/xdE9xNnOjq5P4JwEt0UQ9iPtch2a5C0QF3Yn35SutWMEbFH8rrtL6GWsr+MJjkutjW4YA7ylPC07B2sG7HY8zVHoQOrEaFtfsGTHBKNM4a2w5vRSniFx2A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2906002)(6506007)(52116002)(38100700002)(316002)(1076003)(6666004)(38350700002)(6512007)(107886003)(4326008)(2616005)(6486002)(8676002)(66476007)(186003)(66556008)(6916009)(26005)(66946007)(36756003)(83380400001)(508600001)(8936002)(5660300002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jlsI6IAl600dLBJjOjwn6m5lHQX5LQM5SHmefYQSSfCPT+pW7rujYm0VCc4c?=
 =?us-ascii?Q?xUYKvZ/dpeIVm2L7jcosIMB9dhJn2ft0Qw0KiLtSJYUJEJTmpbQjxHRwXHvI?=
 =?us-ascii?Q?mZBvZqspWh6v3jbeVQcecGuAMWUxKLocPvKhE4cvfopFFM/uu2PRWTjrt5MV?=
 =?us-ascii?Q?vW2l6sH0VuC7xN0J+nFQ1/dC9ifDR6/KmSC5QMxAQBgxmHSqB6GiC3MGnN36?=
 =?us-ascii?Q?IYGCqmu4wr2dcwV7O64+HIPx+jkrom/CruEuXTzNlfzC+3Phsb8QTPe5sXM9?=
 =?us-ascii?Q?VXWkcEcirL9Lu3PWVzKU5uHLu44cx0OtSGItAvngEB8Eq/Bd9yFsoQRYyQkT?=
 =?us-ascii?Q?e+wfb3JwNmmCJczTnu/3fa2K05SDxECZUn1Z7PaXsiEQtfMzmNtZWnOA29W+?=
 =?us-ascii?Q?uDKPO7UvpyE1bvuWHr3rdiscnvxV76ytwl+RO37uXAhK4TEaSQ9hLuItu1FG?=
 =?us-ascii?Q?bzqdZ6EV+7XH+uPrM6YeiIu5M3ZPJiEKqs1dq/JafygR0NATIpyFCVTW8j2k?=
 =?us-ascii?Q?sQSNBDp1H2qNr3I3mo/Ug7llKCa0NImfrnFx9K+vaDxlQ1Qm0EPeevIu+DJn?=
 =?us-ascii?Q?fCBg/GOuRQ4bzgV8vmB42HCze6t7VEiraab5m03LA1PNDbV8WSyb7KHaseyo?=
 =?us-ascii?Q?HVzIXSdxbwWJMEMDXOwLrqzJBgEFJmvmh7gk/4CrqsB3p9QCl++zKKmKJCmU?=
 =?us-ascii?Q?6Gqb2xhsAB6hvzCnihTZm7bskjNW3Z30x/LEbZ0asW8b6frtuqzFy60pTdnn?=
 =?us-ascii?Q?AkxFWsLvt5EJkUiatvLSBwfkY3J+A0PGrH/SEbfFxo8zMvFkfPP6JWE7QJPK?=
 =?us-ascii?Q?IMvw5i7/9BRxJx2Xu2JwE58yr0rMzOR3dtUHFyKz1OdjDqwq/738iXqBG4WM?=
 =?us-ascii?Q?GMtYNcRlJyPn50UJgNfAOhClo//m1i547gpInGKierVTGVYnlUuESAgG0lWD?=
 =?us-ascii?Q?kp4VLlB+Lk2vIJAgunsOeQGsP/ULE3erCBai2kszYmMnk4TJdQPRD4uXS3+M?=
 =?us-ascii?Q?V8I48u0NBWz9+UF/vD+3OQ7OHHd7c6Ju+T1h1VsKkia55AKyt54cpHnvtMyn?=
 =?us-ascii?Q?cPqJDUGM2bS6C1JMuMW2j409YaMRok6HgTRMipbzpAkTScHAuJwhtzWrcWVk?=
 =?us-ascii?Q?1a8m3Dj0lS74D5pQRQhmf3kw+gSuESRi+uLILA0bajlfx1aL3V2s7iSduYer?=
 =?us-ascii?Q?KbMq7S6+nmQELL7f3Gb1F55sTw9FrwPIjx8MrqvS3mw8aLtI3icF6E6fr/Rc?=
 =?us-ascii?Q?VDVa81QuFU/9Z2rzvJQd3sSXxzdMhMnKEFjJgZM57Muo5wDylWqDAPAyKvKE?=
 =?us-ascii?Q?pueD1RMQucoOfHf6MV6JOeyEIrKN1MohJgdmvNxELDU0TvZF7Ar1bZnkTeMl?=
 =?us-ascii?Q?dkC76ks79iBbtjB4BCNA5NphfB83Tw+HaP5nVWhqL2EgyA1rdtUKZ6dsg817?=
 =?us-ascii?Q?H6HUQd3hhOszkqQxrJ1R7Tt/goetev9z0h1vLNGjdzeqIx6RARraP+pmTxVs?=
 =?us-ascii?Q?cK8lnsk+I2OE87f0tZlTrMYILWJMI6a+ecFhsLL4gsqhMR1b8ulcgOIMZVPs?=
 =?us-ascii?Q?ZuieZa59q7EsMUNefjy7Q+LbrIfqvFKmXKPUjIkxkgMncGCTZE89wbunAUVe?=
 =?us-ascii?Q?3ryH9OJg5HrvYW3H2KJdFPc=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 12eaaaaa-388a-444d-fc36-08d9bfe52741
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 16:08:37.8121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 s/Add8A/1vpsLFs23PlOH5wIBQS7alr03j8d16+vJcQ/fh0bKhY9jQP6OlrtuP/C/wO8jCailX1lBGWWqvwuaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4665
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Dec 2021 01:43:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159733

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>

---

Changes in v3:
- Sort LIC_FILES_CHKSUM values

 meta/lib/oeqa/selftest/cases/recipetool.py | 62 ++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/sel=
ftest/cases/recipetool.py
index 1c73b2c5e0..9db1ddb532 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -592,6 +592,68 @@ class RecipetoolTests(RecipetoolBase):
             with open(srcfile, 'w') as fh:
                 fh.writelines(plugincontent)
=20
+    def test_recipetool_handle_license_vars(self):
+        from create import handle_license_vars
+        from unittest.mock import Mock
+
+        commonlicdir =3D get_bb_var('COMMON_LICENSE_DIR')
+
+        d =3D bb.tinfoil.TinfoilDataStoreConnector
+        d.getVar =3D Mock(return_value=3Dcommonlicdir)
+
+        srctree =3D tempfile.mkdtemp(prefix=3D'recipetoolqa')
+        self.track_for_cleanup(srctree)
+
+        # Multiple licenses
+        licenses =3D ['MIT', 'ISC', 'BSD-3-Clause', 'Apache-2.0']
+        for licence in licenses:
+            shutil.copy(os.path.join(commonlicdir, licence), os.path.join(=
srctree, 'LICENSE.' + licence))
+        # Duplicate license
+        shutil.copy(os.path.join(commonlicdir, 'MIT'), os.path.join(srctre=
e, 'LICENSE'))
+
+        extravalues =3D {
+            # Duplicate and missing licenses
+            'LICENSE': 'Zlib & BSD-2-Clause & Zlib',
+            'LIC_FILES_CHKSUM': [
+                'file://README.md;md5=3D0123456789abcdef0123456789abcd'
+            ]
+        }
+        lines_before =3D []
+        handled =3D []
+        licvalues =3D handle_license_vars(srctree, lines_before, handled, =
extravalues, d)
+        expected_lines_before =3D [
+            '# WARNING: the following LICENSE and LIC_FILES_CHKSUM values =
are best guesses - it is',
+            '# your responsibility to verify that the values are complete =
and correct.',
+            '# NOTE: Original package / source metadata indicates license =
is: BSD-2-Clause & Zlib',
+            '#',
+            '# NOTE: multiple licenses have been detected; they have been =
separated with &',
+            '# in the LICENSE value for now since it is a reasonable assum=
ption that all',
+            '# of the licenses apply. If instead there is a choice between=
 the multiple',
+            '# licenses then you should change the value to separate the l=
icenses with |',
+            '# instead of &. If there is any doubt, check the accompanying=
 documentation',
+            '# to determine which situation is applicable.',
+            'LICENSE =3D "Apache-2.0 & BSD-2-Clause & BSD-3-Clause & ISC &=
 MIT & Zlib"',
+            'LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D0835ade698e0bcf850=
6ecda2f7b4f302 \\\n'
+            '                    file://LICENSE.Apache-2.0;md5=3D89aea4e17=
d99a7cacdbeed46a0096b10 \\\n'
+            '                    file://LICENSE.BSD-3-Clause;md5=3D5507944=
65ba0ec5312d6919e203a55f9 \\\n'
+            '                    file://LICENSE.ISC;md5=3Df3b90e78ea0cffb2=
0bf5cca7947a896d \\\n'
+            '                    file://LICENSE.MIT;md5=3D0835ade698e0bcf8=
506ecda2f7b4f302 \\\n'
+            '                    file://README.md;md5=3D0123456789abcdef01=
23456789abcd"',
+            ''
+        ]
+        self.assertEqual(lines_before, expected_lines_before)
+        expected_licvalues =3D [
+            ('MIT', 'LICENSE', '0835ade698e0bcf8506ecda2f7b4f302'),
+            ('Apache-2.0', 'LICENSE.Apache-2.0', '89aea4e17d99a7cacdbeed46=
a0096b10'),
+            ('BSD-3-Clause', 'LICENSE.BSD-3-Clause', '550794465ba0ec5312d6=
919e203a55f9'),
+            ('ISC', 'LICENSE.ISC', 'f3b90e78ea0cffb20bf5cca7947a896d'),
+            ('MIT', 'LICENSE.MIT', '0835ade698e0bcf8506ecda2f7b4f302')
+        ]
+        self.assertEqual(handled, [('license', expected_licvalues)])
+        self.assertEqual(extravalues, {})
+        self.assertEqual(licvalues, expected_licvalues)
+
+
     def test_recipetool_split_pkg_licenses(self):
         from create import split_pkg_licenses
         licvalues =3D [
--=20
2.30.2


