Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CFC0C433FE
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 12:38:59 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.73])
 by mx.groups.io with SMTP id smtpd.web10.10522.1639399132240763451
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 04:38:58 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=w6BXJfMY;
 spf=pass (domain: weidmueller.com, ip: 40.107.6.73,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F7XKrwGtx8i33gYzodFOi4/bbpARAnA39qH/16B/ugITbX4kfDB9/5Wn13pB3oA+I9c0HdnDHFl2oSCnNNcuxHieuGmNBYLRyGBDMABcUy3y0XAJUbKZloe/jLhv51jscuhakRsaJ3Tb+V5BFdkTJ67yZGMIUQ6T2RBB3b/C89pXPowLt0XBbvVzLAr9HFtiMyl7RjfQ//D6d/9oYlHhfn+O4hmBLN0345VeXl7GlE2fCfDdy/qjlNPDYGQDWOzE3opOxbt7eiqDLz8g6/O+evsG4LK7XbjCP8bKpvUSq4s2FDkBCBheulAyBR0Sacsn/bMkwy1zADQo1mCHx0lJ8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6BUd7yje1r4tbIeE2Zgm4hj6IVLfWiL3qiZYiTjL/30=;
 b=OlMXUk0cgNQZTiMlEh+rH8xfGtCIsLw6Ba4UUvBfNJc2O1HQpMm/rsIbNQQKzXafkEOnM6zv+4R4eHi5bsWejx713BUZy7pGxhsFe6UBzrKE+nCLfTzQXJy8m5yzWZZ/2aKfaOqu1PTb0HvGmrXLPZlIlbufVFtR4p8U1BaHw1/HK7/CiqGn/bZnCyzw84UGRDnDW5n3D5dMEhI6QdeN7CH0f1ZhMsQQIpPpyS4qfMKi25V9ru/lxHA+6LE2TK6AE7IDOFc8T5B6Gii5bc8qQY6t/tqDslqZEHgqE7BFplKrY4k6WrLbu9m2sEYa6miKPKm99fpdm5t26tftRdshMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6BUd7yje1r4tbIeE2Zgm4hj6IVLfWiL3qiZYiTjL/30=;
 b=w6BXJfMYylFdaMfyuPCSLotOw1LNw9VkNJb9GpC7PgAuCJq7AzWDeBTY6FEuv1L0SUPQFNDvM+9hDYeWYHpntNW4Wv4yHS2MUQfLHh2YsrHvkDz58T3P0WpvB/oZbEa15rfgwdD0IpmXppu8SDTkCUFGpv+gqGFwzE7/TSWutQA=
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
Subject: [RFC PATCH 3/3] selftest: recipetool: Add test for
 handle_license_vars function
Date: Mon, 13 Dec 2021 13:38:26 +0100
Message-ID: 
 <20211213123826.31605-3-stefan.herbrechtsmeier-oss@weidmueller.com>
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
 Mon, 13 Dec 2021 12:38:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2d5517fd-50ff-4827-1ceb-08d9be3583dc
X-MS-TrafficTypeDiagnostic: PR3PR08MB5595:EE_
X-Microsoft-Antispam-PRVS: 
	<PR3PR08MB559514AEE7E2F6840AD01C71D7749@PR3PR08MB5595.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MEt9U8wykcxuERujuDYsgiwG35Pv7Q/Fb/n4INaauWAoyBx7Nwwc62n11EFWSqfWyKnsG2tIm5kCQ6c6D6ZNzYBBl5wD9qnDMrliNVlYQZEQ/xu0DR5KHsgLbY1w6T5+wd9AafWMLxzQMK3PANwCGB+7rBvUID6t3Icx1YaWUvNCDV5LNnLuGSEdduUdmLicVcybMzQ9DQ+Hn+Nts3wEtvfOSfmWpni5tbXO8LyzJLEZ7MKtATHW9iotn5GtzQgkA6tdEhXCxuDKLckqaMr52lts/h7dm+R0PJmE4dIXa+VtXEFdJwCUKZQV2vbS6ca2jFIc+cX1pkgo34uu1NvC/VaUaaS4+aLeJkeTs4yHA2FZZJtLAH2x2/HGx4lMv/fneVm15hc5/eOsas47DTwdpaXBhq6a/oj0PxNr02IfOAX90KtOYz0h2R+xjuOd6Nwy9DluE0Bzp3PAq64RxJJm5Fsdvn/48YTAchgfvn/J8oEHcwkR5EXUEjA+8ROHuqqiyWRK/E0qOvlJ3jddL8u65wGKpL9AYVBxofdV/YesyDfKHcH5925FN2iRruf33FDiM0rXA1mHlnfmBqWS5mIx3O26OdfCmLruB7Fj5IEJDbnCB9gvylmbZSu7zdjBGF6AYS8tTm9q947xJUfDHjK5GhB8ioEqeXd6v0q/9MPzOxpjz04mdv4g3IUj1qQxhi6st1shckmY5sOhyPLeMNdrnA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(38350700002)(38100700002)(956004)(2616005)(26005)(83380400001)(186003)(86362001)(316002)(66946007)(52116002)(7696005)(6916009)(5660300002)(36756003)(2906002)(107886003)(8676002)(66556008)(508600001)(66476007)(1076003)(6666004)(8936002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qnzxPmzUMGxMbAKqLkXHy6moaK2jrc5CXCPzmQI6n6sDABbrgYOXRFm6KhTt?=
 =?us-ascii?Q?4gtM3AKPbIE1wfAECKqB+ejycy9S8oEDGtclp3PQR8S/4ZiikBVuchEHcGND?=
 =?us-ascii?Q?S7M4UtQt/Yro459zLoMQnzv9CdhePhqzobCjt4qe1FQAsT8Dxo5vCGNMmBmT?=
 =?us-ascii?Q?E/vkmDwoWO42k4fqgOr1ejBRfeT+3xhBJl98/nvYhTOyS3RRbBzRUbRCNXDH?=
 =?us-ascii?Q?Hs6wvtbBGjSuacNtvCJT7DIcbWRhBGUVB67vYhafbtdfHotSrw231Lta3RiD?=
 =?us-ascii?Q?9445LTZKPmhMf0Znunl0EIq7VAJ3SN0Bd+AABcmw7nWVT+cKf/Czc14bYJkB?=
 =?us-ascii?Q?QpcKq10/8888Ktm+7NtHp2LIMW9xwWmYX+wkDVB3K9JoVF4gTdNgWgz8BcJQ?=
 =?us-ascii?Q?TjxkhGKOim1HANN4UU0MkCXWHCZ7jIJgP5oMiY7CI1WZQy0khYgwVkyV/99W?=
 =?us-ascii?Q?FR0SRk6YvnN0y/t0uczdMWCcrlJk4bYtEU5idL/KD1L1bd9FavGgm5/ar8/2?=
 =?us-ascii?Q?aJZos4fEQwxOdHlFJcLD9QcP2BeC6Wzsp7wke0B7ysckiCWqK4+YNt3vvQpN?=
 =?us-ascii?Q?Wgvgyfi7/OzruSoaqQCdwuxX28TqXwDQWL9d8F+zusPkGpARo4kx1iSHqNcL?=
 =?us-ascii?Q?OnSUaxQr2YHS3FQN8Cs49vaChgEAgHYJ7wLNWEf4RymhrbX8Vao+TsypQ3Ps?=
 =?us-ascii?Q?Y97g5M7cwvrQ7gPAs78jZdzSy2Kx+hnD+BXvcnHtbUb10QnKbB76Oiyb7+Gr?=
 =?us-ascii?Q?sBqmsns2BrjGcIhYMT0H2CbXcRvCBgp38VWDHhmaTZQj3IBuygYWyKQ9/Sgg?=
 =?us-ascii?Q?1pWEZhHXuLhhrmxc2mgIFzYIhR/QxSFmrDgnqf+Xo8mtijMr6lQ1O/kP5gmC?=
 =?us-ascii?Q?wOz8Ej8JEJwOxrFpeZyvIbwAtpDqMdnEM4ugr4jW0TXeuRvo5CYqJauBVJnT?=
 =?us-ascii?Q?gXf6DP6uOdN97xTcDfe4Ro6LNNbFtG8wkJXkigp38rvgmvQqDE3D/WpHkMbF?=
 =?us-ascii?Q?lhk7HX6y45pET3opBS4H9/fYhP0LQm7l1TkOZ0myNedMk3vRipLG1X7CPEgw?=
 =?us-ascii?Q?XYpbuwa7qsKZMTqFNQRpSaJTgfriyCXMAANTgiOXXnOM5W5mHhj7p8F2tyXc?=
 =?us-ascii?Q?wbuHXjfTLHIpWt1JtXZVarwEjqbeHBgC/CLMu4eZhaTyb1jFuxd47z869kWq?=
 =?us-ascii?Q?NXVb6rsP0zuiyMckmxUm+IA79McUkakMZq8g7zLq6A+wh21iSr0IubfghZLm?=
 =?us-ascii?Q?Jak4WhPbWlBV/7xq++zH1FI2Xx1uwxvc0wajEo+mJ20s7RxLl4zno3zMZuDp?=
 =?us-ascii?Q?cGGMoHmGpZkblaEqziC1ztQ6iSQWlbhU4zNtj4ntr6mEOyc5Y7KAw7S+hOGD?=
 =?us-ascii?Q?8Eq2D45wkXLhYrZQm44K+iVTo04t+keu2bOeqXEDJsw/htd42HC9Bo0jGMOS?=
 =?us-ascii?Q?6wBmDfxE/2MIZt+J4VVieqqKrQBzvaY1GT5H8sD8WyGdQs22vfU3OrLfF8Yi?=
 =?us-ascii?Q?d+6jPB0oO0nr+uEoDrJX+sPu5Sp10GpP1fJWL3trXrDGKtf1RLNcCEb3c1U/?=
 =?us-ascii?Q?i4Q7rUVZktvd2+L4uxsYd3yzPCbvkaT5wp2X+0tmkEqrk9XL6fGfVV9lqT9i?=
 =?us-ascii?Q?ikQ8juDFBeHBK2u8kR9B7kg=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2d5517fd-50ff-4827-1ceb-08d9be3583dc
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2021 12:38:50.5396
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ayi9dlDImYKAz3fXLeQoIdQTJ0d4lR4NcVWTILNAw3Vk8UnDQjBD/NETlNyj6R+B8sJEH3jgNqO1KqvfK0lSkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5595
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Dec 2021 12:38:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159621

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

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


