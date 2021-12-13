Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE100C433EF
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 15:06:14 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.88])
 by mx.groups.io with SMTP id smtpd.web08.12074.1639407970721331560
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 07:06:14 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=CyEG815W;
 spf=pass (domain: weidmueller.com, ip: 40.107.14.88,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KcyUSWOeX6AZ6nGlzPpmB6P45Y7Lyc5GBcKihK7x/xiHhq4J80KFoIIZ+UP7zDRajUvSDvit++rBLaYLX5N5VZK97fz9CFuBsiju3pZXnQ0uG3utoJYqZRxica/MKIME6A7uQ6nhq/EXEfmuh5k84hX+VBh93aJPNQRUjiCVzEZs+uabmnf4gIpHrLP8kkQJlm+0B105RcxjLUW/Yw/iePivg6sp78NJ1Sd2J5J1mwg8qbcJnMPbgmP4RBqHgTec+w9Iw33ebJ85gPOs99VfQz5uL5TYNe+cWcVvrlla7PupSB8IzGShwumxbVvL0pVR8tOVRFhRk6SkyjYF045MDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ktlikhEqPnPNewZrNyzVw68/Ddno7d2GXTs+5Sojr7Q=;
 b=JwK/V6uypDvpSEkwIx0W141d/r+8iRYjOyFLgOMnjOHwh/0JzKMET8s/T7UQLwyP+HqdhWTtZdeOadaD+jzqCzXeMa/Jx7sGuO6FUG2PaGqdAACPxg2TDFb0jCn8X/f//+Y0eea4D47yQ0NSGNvkkJJOUHeDp5mG6Xi4rox+tZaArYdPF6k9o7ntQ42l7GNHC/6awe5csuskK/DyLGUSXao/C4q63TUhUqyfjsEISAUoEdVHPvo3OXz9V4IElXBl8AMW0TzNYI4EJ65TDzVHRO1F+Tt7VRM5+6zXM0C5aOcxe32HbFjJeDKF2mweR0azu4/GVUEWaGWu82au3zgzEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ktlikhEqPnPNewZrNyzVw68/Ddno7d2GXTs+5Sojr7Q=;
 b=CyEG815W6fcsex2Upot9QprrPQvJzI2fAeGjFUyFZ1C1QQGG6KNCHc/KCPGNFyC5VHWw6MxiGeZIO8vozUui8xbPq5lmztNOxT/+GLj8iSaIcYR1DejB4dGWooYdX1H6pKYv1vNqD2LCEdCICzWr1hOpjShteY/rei30P4e+/MY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PA4PR08MB6317.eurprd08.prod.outlook.com (2603:10a6:102:ec::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Mon, 13 Dec
 2021 15:06:07 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010%8]) with mapi id 15.20.4734.032; Mon, 13 Dec 2021
 15:06:07 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [RFC PATCH v2 2/3] selftest: recipetool: Add test for
 split_pkg_licenses function
Date: Mon, 13 Dec 2021 16:05:45 +0100
Message-ID: 
 <20211213150546.22196-2-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: 
 <20211213150546.22196-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: 
 <20211213150546.22196-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM6P192CA0059.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:82::36) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
Received: from DE10512.weidmueller.com (89.247.126.92) by
 AM6P192CA0059.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:82::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Mon, 13 Dec 2021 15:06:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 042c17cc-0ad0-43dc-3310-08d9be4a172c
X-MS-TrafficTypeDiagnostic: PA4PR08MB6317:EE_
X-Microsoft-Antispam-PRVS: 
	<PA4PR08MB6317726A424E2297EFD309B0D7749@PA4PR08MB6317.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:404;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	M0g9toI6DxWlaS2qg2BY0SmSfYNWtKyON6OkXOBfHN2/8wmNi1uzE2W3HZBmK/jq5A0eaGXzpK9L+ddXi+ZlVGMOHyuLawXbgL8RFm5poXj+4Qmg7sv9lUpzM2G+sneeQWNOXTeuH8HV4ExVpjktWF2cNfi9ZZEO8Y0iImmQw6KbRC2gc4cdOYgXgAIErkGYYWo39mK2TouJhFCXZnSGP5Ti3c5cdRn1fNGQOF80NwGr2oPdQvGaLkNDteDJmd7/U+bks9Sv1mtQ1P7ZRM37WFuEUwtNQKItA/WQrwGPzkehOCDgg+uVhzODZgFMWRXCCrI9IhtLxDN3g8E/N4Kw4s3dZUCjJj403P/LI6cobxTJTJlR+UqElEMD0MJW0cEfyh1FeR6dOAAze0vfBbA9l+NuwsbIjIpbE5DSDcCK5m8AivLQOt80qYlWmZugJ0O0IUKUdY6rR0+c4QbbJ4nGyyKZ+2uIUo45u3cWU7bRh4jBq1DPi0d1FsAmpIGN2CWwzCRmCDJjVdFsYJs7T/nAaBKJ0ziVSTNu2jxg62uRSOf3NVpFnKIoBTQiECVKeYeP83JPb/wNCl8+VQFZTbIrZ2WEHWAEpcAyLF0mY89qXroKu3HNoV/2W43XBpQ1cYAddbPo1EPVk4OUIYiS0VvhrL8YAinYCjyp5EyRr2MeKmNISQba/9QxMVH1/VZa80E0P0Ph+7uaV6xoep96pwDXOQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(316002)(7696005)(6916009)(36756003)(52116002)(66946007)(6666004)(2906002)(1076003)(66476007)(66556008)(8676002)(5660300002)(107886003)(508600001)(38350700002)(86362001)(26005)(8936002)(186003)(6486002)(38100700002)(956004)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?PpPMTZKIleXXQuI/4wh05m8dampuLteoYRTx3HVVgbv4Yuc6GR9mDKyLcjpm?=
 =?us-ascii?Q?uMcJXSPsebhojFgTxO/X3nTouHVnqEhXvXzjPAVDqUWF7WIX/dqqhzsq66Pz?=
 =?us-ascii?Q?CMX7m1QvpSk9NzqaMRLAR/5gisKPLBxFmidRNUJUURTuMcqj0o+kPqNJU68w?=
 =?us-ascii?Q?YU86icS1F6B5xP7ykZ6ur8StyZNnkx3SvchDuHKVm2pEGar2XkhTxo0pAiM0?=
 =?us-ascii?Q?5WYbvl9sJYtS0FMtysOPR6FgXLzJBTpk0At6q5BJrpyfOrcOE/20y2ST3tg/?=
 =?us-ascii?Q?kPyKCZdx52S482e2RDI+AsQmiA79cU4wc5ld6io0Ct/yMJdObufGmt6xEwSA?=
 =?us-ascii?Q?rDiWFSG5P3AR6bkyxNxFVdROnhxSj0bG5rXYTUQHeaaKCg0+gZZbzIefR1Wo?=
 =?us-ascii?Q?kH7BPU+1MSABcXjZ2Rj/FwUYYRGd0YNwL3NT7Pb2j5vIVLo0NZyyTtwgXuj3?=
 =?us-ascii?Q?HlaHxo04PhqBCR2dM5NXYrJDzzpKiz0jBuLbYryt/T9FYxkgXi20NiNXDDJO?=
 =?us-ascii?Q?FqqxG7/DU2t7gonSMCuOPUdyV0eKLrNgUjJZ0Y2zrHQ7wdMWseLQpTsZk9jL?=
 =?us-ascii?Q?SvHU95ccySGEQXh/pHvWJGna0XAjS/E91M0B0JqBVrK8Ku6ZfdW+P8aB7mrq?=
 =?us-ascii?Q?ioipuKddRtnq8b50vgFMRiXjJvvsTZEzyeM754jgdD9Tbc0DRtoksZnzKobw?=
 =?us-ascii?Q?SYe+Z+Q0BeMA++otosKQRdUGl7by+L5m+MM51onpnxXynpWPUAB8kLcRn7/w?=
 =?us-ascii?Q?RzzIvsDKjwcp0mGMcjJCKuyhKmnDb54srY+nrFwZc/qKnAHnlZOXJThk2u/n?=
 =?us-ascii?Q?LQPck244plmyjRtHD7I9D8yV79tpqvFCCuFy+FgdLSmV0nXp1246RRqmfTRV?=
 =?us-ascii?Q?uKWKcRoCMk0M1KBLsW2TK5t3fc1NCB62EPboSzPssiUb5m41Sk486KN5lTp4?=
 =?us-ascii?Q?dupMchcWr9kRMxIFWBQ6hCH3JNkL0ej2ATg1A3t+r+ZXOkAUbRWfiuZaB8As?=
 =?us-ascii?Q?y651NtYVaaRZZQIIrb/QyTJKcOR0DCeUb1I2e0IrU64KOEpMwNqfX/QdJCko?=
 =?us-ascii?Q?5BL1+H1V1RFXR6cFCaOYi9z2yY2axoJc4Ent4pP4UJ3MlkBGk+VJ4svG1ck3?=
 =?us-ascii?Q?bVwVHYD9K0FXUzwEDvrwjPuSLA6TRHirrmWXlKcUHBdLaeQuCCxp3710WR8N?=
 =?us-ascii?Q?CzxkpsKPpP5cm2HTgGWChUzeh882bITeLwu9F37567fjFC3MPpmSZpb5VZPV?=
 =?us-ascii?Q?H3JdgVHmmukC5f+Yf6WpU5XwmVsQjoEPw2Pih+EQyBK98+diuPA/+EspuJQe?=
 =?us-ascii?Q?KntBMMr8ERTryOe7kscErkLQ2ZizIsfkI8N/i545uvv8ohFUw4EvqDN48d9A?=
 =?us-ascii?Q?yq15Xx9lOPUgRG2WH593DeENKHd1JCjASreU+U170Y0Vsb8gW03KcssKnEnn?=
 =?us-ascii?Q?xPTX12hLPAscHXqYPqa4rEUnD0KO5fE87WhLYwe42hKPks1Nv1FOkRP1sHHG?=
 =?us-ascii?Q?zDN/X7s1hltG44pCKoGD8AofWDOXd8ATiRlphhdcqm1I4njV6ACOhJHMH5q0?=
 =?us-ascii?Q?ogcSlSceZ5BO9Axhs/QU4v10qiVzpE1yYthV3xa0o48P3Ad76d6SBz/gzyVN?=
 =?us-ascii?Q?fjLZ+ROPIw6hYmHdXEfU2vE=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 042c17cc-0ad0-43dc-3310-08d9be4a172c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2021 15:06:07.7187
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Gcz783Z6wk739I5tf9YY/c9SsWgpgjRVUHTUZGbPzjRGk6TtlvNaEqFoYOp+se289BrcUBvpXBZGhgX6ClhkEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6317
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Dec 2021 15:06:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159640

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


