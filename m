Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF8CBC433EF
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 15:06:18 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.88])
 by mx.groups.io with SMTP id smtpd.web08.12074.1639407970721331560
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 07:06:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=HVSfgODI;
 spf=pass (domain: weidmueller.com, ip: 40.107.14.88,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EdvzRzZOHQTib0MH0Yag3kBP876w4jEYqryKDQxHjnrqX6GWXm218/MRt+wnmb0OXyqOAwFJknq+BvZ7J9ldJBrXbZMnkJuGE5zDxDuPFxSd0XDn6RXHp6/wFfH2dSkpNW+/snyn4Un7OSsk7MxvvrbCMcVMp0QfT+zSRxIyBvyS9DkzBVizhKsNd1VodUwVM2KOGRrVPP6YhPyC2d1uRemtJHE4H5SDBn2wsEmZqcRR8pIKg6SgvfKvjsBccacVoFcXFUG0Hock5R3S8GH+n7FdFMzitcAT666KbL9eMFxyJHsZMCR6sNkGOSalrZ5usHqjiisjqdoAgUrJCu5zOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mqOC5ozK7Bt+xh+/+jUXzTAT1bNWoJiTqWPAhwn/I4Q=;
 b=BuYl6bGXvysE0JPX+IBOLCxWrLfPx971lYmiAbyI2cdn6kfDQS3DTs+9f1wNcaVQ4cg6In7CJl0+SIwobxUAaxGi9eizXNUtPBZqpAmsylRsKtDqiXt2LbPsyMvtiIqY8dzIVaA1OM20bEzhflXFl0xID+O9TPi35fu5bBavvBKNrndCuX/FhTZvGUDjxM9cNKjLO0UwxSIxB5Sbp8LMJwFejd3DJ5TGaqpycEy1ExZjEhO/Lal7u6cmJzKD/jZTitwMtHVbBhMOvKBygHOy3B+EoTW+Eprt/3H95XgL2mC5PYttHTytJmdMdLCk9mbBfQpX9i7TIVNP9clRchb0uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mqOC5ozK7Bt+xh+/+jUXzTAT1bNWoJiTqWPAhwn/I4Q=;
 b=HVSfgODIgwbja4DKaScKcpzvEJXqgGx9xb0XW5NOwmOqvYuNwzTit27CAMqMZggWurRBZLC1Gk6otofnJsXtIl5A9Ts62Jvu/LTPZN+48+wcrclRsGLaxKjVAjS1LHd3Oqtk6vNGLXfpQEupCaBUfCjlzBn4bho5BVhErWCOkbo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PA4PR08MB6317.eurprd08.prod.outlook.com (2603:10a6:102:ec::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Mon, 13 Dec
 2021 15:06:08 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010%8]) with mapi id 15.20.4734.032; Mon, 13 Dec 2021
 15:06:08 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [RFC PATCH v2 3/3] selftest: recipetool: Add test for
 handle_license_vars function
Date: Mon, 13 Dec 2021 16:05:46 +0100
Message-ID: 
 <20211213150546.22196-3-stefan.herbrechtsmeier-oss@weidmueller.com>
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
X-MS-Office365-Filtering-Correlation-Id: 85fb4a35-974b-49aa-9d3c-08d9be4a176c
X-MS-TrafficTypeDiagnostic: PA4PR08MB6317:EE_
X-Microsoft-Antispam-PRVS: 
	<PA4PR08MB6317E7D0C19877C5B666A2A0D7749@PA4PR08MB6317.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Gh6lfF8w6HEpJI2Vni/qngfjD33Allro050k5kW4El5V/ZM8GNNvS6Rhvc3fDQPRm8CIpystk01fwqiGKg4aNWRhbHpd0DXndvzb13/efXrLWW3reD29Hp50/mZrJtZwZS7cfA9Wat4Ao9E8NAaTDl5pljflHYqQqzcJe5Jux8DmfqGFZQHy3ufH6x+F+5+aluqE7HxaIfQzwAhgYhjovMcHTAEqUSGuDK3ZoL4frO3s7Y4jQg7P4AQ8O/HtDt1vUslzkCAj7a//opYnrWpaGOAeclbXKMNKKcmDm18E7ml01fgJAk0poSQo1kWF567OPPe9knOkoYinJ6vJpu3+79avTXOO4aPLjvJVKcPItMy/KLBu+IVKgi9gIROzvHO6+xf9VX9GU5zbLh/+74II02wpNoyT0e/jIQ8jAM3UeBhXOnEAFrt8N5kqL6DMhyyatzrCCXpZzGjyEkJJ4i+Sj3xnhnE2RAcezIpvd9Fd0BnqTg5+AFBM3WGQIZrhinmm07NVNEw1N+TLSJR7vzpW0Grt1UeAOSFjgH/0yjx3iLJjBOJ3O0cIR2IWAK3WVOBuDV7RpdDgnd/MVsUdUWJrxzXgN40riUPgJpKHPxtaw4O7gvgncqYDJAA0YrziqPVz+32woNZiVY9nRsgZ8sEtLlibZfhpQH76pboHNZEtlIVAYwEQXpCwfL6O7arp1k6RMbzHZeigBDlclC+8CCXGbw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(316002)(7696005)(6916009)(36756003)(52116002)(66946007)(6666004)(2906002)(1076003)(66476007)(66556008)(8676002)(5660300002)(107886003)(508600001)(38350700002)(86362001)(26005)(8936002)(186003)(6486002)(38100700002)(956004)(2616005)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?U3gIYkGDDX3gMicOlM8c4g/0jaINViLIrTARu0ZLBdNWMOpcOGSQ192ohl6O?=
 =?us-ascii?Q?BSWQtjJD4ODQFYY9Jejt7PmBHxtaqe9CKkFUWf6sWGxO1SzanUq6wr21YSXY?=
 =?us-ascii?Q?oTcUHOjeTDLL+hAIEIQ/r8k+PXgGYA75hYhDUc4ydx+DISqOnpB1x4bpfQJD?=
 =?us-ascii?Q?5S9Jf/E77d1YcVivrEFoe8H10gmlaFpXvMC86SeNccJM8hiJlofh5bHtqsV9?=
 =?us-ascii?Q?CvBvE7goftXU4fcPjpYSKTUQTgBDOJwtJBwFGo3LELgNlVATihzTiTHBE/4a?=
 =?us-ascii?Q?tzkMJMSqvY3i9h1UlpxuMy1BzwSTFt8ZdoF5P3NSb9fvVvryqa8DIwwk7CAe?=
 =?us-ascii?Q?fILW3V9ag5NOD28/zoc98XQCKVl71Z/9fIa1FwrnyXy8cwCfuwQzJZRpTb8O?=
 =?us-ascii?Q?0UT+WJZ5wOjnjji4p4JdOfThN5mslyKqMfnbD/Cb3li2XxVCXqoFKNzsSEpw?=
 =?us-ascii?Q?dWy3wvoW4a1djhQHpkTjaoPGi2vz/s/+qizzxmI+ZQ6h3uuWXjj9d2khCcmx?=
 =?us-ascii?Q?aQhYin2AS8sXnNGdSi//iwNGx8XOLH50UFxi7PeiJ9IHADeL0CTR3X0pdFNy?=
 =?us-ascii?Q?GDlzseaCycw5nrxMTXx34U3Z5jDY8zLW9IiKpRe1qF9L5QF/WfC6BQP9GHsx?=
 =?us-ascii?Q?vRSEb2e0Cw1fkU6Zq7MgYgOvVwNxYuPLuCX+L5JmzFSwI+5e0T6ko+Z/OwVX?=
 =?us-ascii?Q?pPSprEmsVGioY8pSa3Z0/f/5zhV5XBPssSFzXy/enXRz//Cx5WEktcZ430eb?=
 =?us-ascii?Q?mR7xJmmpCm51bfpRLc9cDEfWHeOd5+tzTxTrcfh2zDmAqRTtpyZM4kJTTWS/?=
 =?us-ascii?Q?nZe2PM5Km8kcYIcO1yfiswXK3K7WENnro6Gw6uTxVN1+gJ9xcvhlEaOwR958?=
 =?us-ascii?Q?WP7o2YWvVwQvekqrY91g9+V6PXUji+dlRO8X/c26KQnLPervbsE68LWG82ZV?=
 =?us-ascii?Q?X9BX4ygHtOECB4tqGHQ++Sf20hjLYTtO29exnp2TuoCOsEUfjXBJhAlCKyxQ?=
 =?us-ascii?Q?rDb6EjoR6IbT7WZZh7vXkKKZ0Gj7Opf3yE2yLbvlJekO9XcTdPOXNB0BPEnh?=
 =?us-ascii?Q?RgpQJCjb8nt7CLb8s0hkSiyLBYgrto6qSE8P7qRSFuIfWbr1NXo30Ur1dv5G?=
 =?us-ascii?Q?sW/W9ZAg+Mlpqc5G354meGN6I95OAAlssGRq8XNScR0i3p8a/XYnLIa0X7J0?=
 =?us-ascii?Q?0THbY5994RQZVJnlD1+9EyY0xm+kvoJFGvPc9vyFgv3s14s4tAW5PfAEy36l?=
 =?us-ascii?Q?VcnedqIi7mbnOnz0W1sG74LPr8eyWEXn3OkfZAYCruXSpvb7N6CRzN4RpqzZ?=
 =?us-ascii?Q?3r2030Gb0jvVr0YkZFeBMwtLq/VCHvvN/waFG2Xl2QdIZXkC/LUnrUlU2BZC?=
 =?us-ascii?Q?IvSXj5voZJxMNvEOwKYjl06Dy4ZDthtn/egOHHZINre/hKZuNbFKNiyrruF3?=
 =?us-ascii?Q?r7Z9SWEadWA0LXvgSOqpb/6C+5bmFXuOATeypqA0Qq7qYQTRNK/Cj/DQcgMb?=
 =?us-ascii?Q?LZUsVdOdpCwLSNJsgVG3FsSeaDOQ9XFRnp2Bhdv4zAtLqTsnv4oaBWsQ+rnW?=
 =?us-ascii?Q?9fL7XpjrFs6PstIS91KwgAhrqQhkes2cNXDqy1r3MteWR84g5M4S8vGHDunf?=
 =?us-ascii?Q?5y5I2LBCgrhD3CWhbo7ukG8=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 85fb4a35-974b-49aa-9d3c-08d9be4a176c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2021 15:06:08.2802
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 fc4UEJ3Exw2BhLXQRQbcDKVlNYQt4W1jnxXXXto3FNVn/pwZY66SRkUp6igxyqapD3WiXlTmzG6S8qFL8hWXvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6317
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Dec 2021 15:06:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159642

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

(no changes since v1)

 meta/lib/oeqa/selftest/cases/recipetool.py | 62 ++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/sel=
ftest/cases/recipetool.py
index 1c73b2c5e0..5330d73cbf 100644
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
+            '                    file://LICENSE.MIT;md5=3D0835ade698e0bcf8=
506ecda2f7b4f302 \\\n'
+            '                    file://LICENSE.ISC;md5=3Df3b90e78ea0cffb2=
0bf5cca7947a896d \\\n'
+            '                    file://LICENSE.Apache-2.0;md5=3D89aea4e17=
d99a7cacdbeed46a0096b10 \\\n'
+            '                    file://LICENSE.BSD-3-Clause;md5=3D5507944=
65ba0ec5312d6919e203a55f9 \\\n'
+            '                    file://README.md;md5=3D0123456789abcdef01=
23456789abcd"',
+            ''
+        ]
+        self.assertEqual(lines_before, expected_lines_before)
+        expected_licvalues =3D [
+            ('MIT', 'LICENSE', '0835ade698e0bcf8506ecda2f7b4f302'),
+            ('MIT', 'LICENSE.MIT', '0835ade698e0bcf8506ecda2f7b4f302'),
+            ('ISC', 'LICENSE.ISC', 'f3b90e78ea0cffb20bf5cca7947a896d'),
+            ('Apache-2.0', 'LICENSE.Apache-2.0', '89aea4e17d99a7cacdbeed46=
a0096b10'),
+            ('BSD-3-Clause', 'LICENSE.BSD-3-Clause', '550794465ba0ec5312d6=
919e203a55f9')
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


