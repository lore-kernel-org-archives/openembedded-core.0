Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1037C021A8
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 15:01:03 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.66.76])
 by mx.groups.io with SMTP id smtpd.web11.1128.1739286052946746079
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Feb 2025 07:00:58 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.com header.s=selector2 header.b=hD998XQx;
 spf=pass (domain: weidmueller.com, ip: 52.101.66.76, mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hujFoomGitZYlo7hC21R97EQQzg7Evn+iWwZTIk8+5OyJWcS5OItM+FhvIiLYtt52zA47682te+VqE6vWPNa7P8TAMgW/lmoJwaXCawcYjDWV2RdPU+XqP8Hkt64HnjbQEDTe2mN1DvGLUe+nOlug4RKFvAYFelVPbWfEDPQNMBDIcVnpxoSf8qoDD8R+7omEix8VGUSV/X8ZWItS4w8lbWFncm0dIk3G63ilE2RRf927SulH7OGm/T1aVrn4/64Z7fh+TyZbgs19b/QrYqUmrEF32p3/nzpwqrAXNdparo3PGUmSYkOk25it0RxE5ershTUjNB0GW/NmIKv+i0iwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T1deegp1Z+WeOn3GWoZStnqVXh0olY1VIPn/1fi4qH0=;
 b=OC3GR/hBuhNcn2fQIitO2sQhO+Z6dJ9df5kj+cZ+VhAo5Ka0jX5ziBNWM0uMgSdiV+1tdb6dMN4roBXjQIWQnWEn1JDC8NTmOivtxdG8eLyGke/vNHCgWxtskRM6Hu2peov/0ABTdMBRn9gdPZerV+KlnGd4Uo1wBGy1f/wnZNBObG2ykXrEMeePfWLxcpjmY0Lya+Ro6CzGxmS8YonNgM5vbmP4TSsIkqjG18dP5D0pO2j30dHN2FokIfYjlxcPWW7vIAiLJutvATkGwUMepQW4sRpIP1sSKYt16W35270a4weaFlCz3OFmd7IGQUQGCWMoDvqJf4EdZWkojd4ZXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=weidmueller.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T1deegp1Z+WeOn3GWoZStnqVXh0olY1VIPn/1fi4qH0=;
 b=hD998XQxSr6jUssSQk7gUgQdc9mnWs3wpG5wE2XU5nNDnsi7mq6nHQ2rDXYxZG3MOLqv6zk+HsOVyFusTou8qhrJNh7iPAsulE2mCpybmE2z5/K+lsAIMpjwi90oZ26Y0JFKoXOm4G7dgPzxyDeI8itN4IMznitBxylagmjZVsYhyOhCSBbtaZLiTSL80KOmUt2IJmMDuUqrsRU20TjVTLz24U7FQvs98qtZzyxPpBAx6Argf/wECA9XFk2qAO3WkHZpyxeiqebCUMAV8vNQmSgEp7vFwSEu5SbFVV/5NA6RhMElCS+cR7Em+Vm8ePVSwID+r0vD4mee9zAzEFJxmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from GV1PR08MB8426.eurprd08.prod.outlook.com (2603:10a6:150:8a::17)
 by DU0PR08MB9396.eurprd08.prod.outlook.com (2603:10a6:10:423::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.20; Tue, 11 Feb
 2025 15:00:53 +0000
Received: from GV1PR08MB8426.eurprd08.prod.outlook.com
 ([fe80::f9f5:b4bd:9e01:9013]) by GV1PR08MB8426.eurprd08.prod.outlook.com
 ([fe80::f9f5:b4bd:9e01:9013%7]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 15:00:53 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [RFC PATCH 09/30] oeqa: oelib: add vendor tests
Date: Tue, 11 Feb 2025 16:00:13 +0100
Message-ID: <20250211150034.18696-10-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250211150034.18696-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: <20250211150034.18696-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0103.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::16) To GV1PR08MB8426.eurprd08.prod.outlook.com
 (2603:10a6:150:8a::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8426:EE_|DU0PR08MB9396:EE_
X-MS-Office365-Filtering-Correlation-Id: 623c1584-9e4e-4494-d0ee-08dd4aacdf65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?WteyXqQ/i6UIh7HsHzjVHP9rUqfgA8I3B/tFFyAvFkAPbV+JKuN3D5Vekp8c?=
 =?us-ascii?Q?gAamv2Iq60kO7BqHkkOVeoMKrTcD5ChC7db8m+e3k+v/OfuFtFjIeIZWZLUp?=
 =?us-ascii?Q?MlVak/QjGZqCyQxFRdBkXI5DjbaHATYGlLy9RkRxmuhxjRyq3DtX8ELYhsRy?=
 =?us-ascii?Q?G/cZXERJVOGPXIT7Obkvz1ZmBrblyNx+UjxWMcy503AyF/frGDC0C3DbrM+D?=
 =?us-ascii?Q?ro41NIXjqZvL5bfU8/YIc0OsGaVEVcWBmjyu9JmFP06S3WX+KqdCcaQvvLrt?=
 =?us-ascii?Q?z8yDCTE3qDctj2E2AJ55z6LD0XOjZ0Qqk8kjVm+leO/OcKVVHRXvBWt3MzQb?=
 =?us-ascii?Q?YVSJV//wi18vszu4dfssuiUKz1VpAfNxvfiB+61wIquHKVGYP9HC/kAPJ/Sy?=
 =?us-ascii?Q?X0x8JfiLlrZ5SGNTPJGvvx9B71DBAcw1ZAeOHsyexXJWwvkYsPaU1nzRdi44?=
 =?us-ascii?Q?7Wj9/by6xtuTcSRrltMHxY0oMk4poyoXFvB34ZqP2hcBAzu9kMQHAH+SYo5M?=
 =?us-ascii?Q?npCRxvOof3748q5qpaMhDq5A0Mgzparrgkl5ef4Yk+TWeDb1ul/C414aYWrf?=
 =?us-ascii?Q?IG8hkcAuRvQYyPIvTpGVa0a8U2x4u7DQvFT/V8Mwh7K1xy/dSVoZ4qTb+Vte?=
 =?us-ascii?Q?AAeQrIpAtL6NcYg6XqixpxQ6ykUX/s1qlwtkRk+1SFn4vOiDeqqNEt2mbLVH?=
 =?us-ascii?Q?g0uBDuScVr7TzeBPCAxBwhsLEUpH3iTHCvi57AMTmvGUBNxiheiQf4Xqaoy6?=
 =?us-ascii?Q?D0PM3g9feSvKqsIGisnhVQyP7uUtF3/ITHpppMYmvB2D1v2LGXYLWoMGdQPO?=
 =?us-ascii?Q?Bhrgau2RuuqL5mwVAAna2yRZyIRNjM0bPG+mXBOjmpfzjfscFsmmgDEdCd1u?=
 =?us-ascii?Q?2mtFqA4Iqife/bNBMVlXRQ3jAcQFdTJmZlu4rUQwCmw1WV6nxTvSNVPALbls?=
 =?us-ascii?Q?Jefi2QYNU7xOW7Pne0fTcpdxQJYdBqstXrhJp8GaD6c1wgnCAZg9WTIo3gqG?=
 =?us-ascii?Q?2WszQxINxcWLgDE30Z3HSS71+mV72kixAqsEmqlQW1n5uv3L/gvRAijvdfJD?=
 =?us-ascii?Q?WYUIyK17ZKaQQtMY2famm9ZpoMhplq42OCYK/AVz8ZIxzAP6mOJDaG56UQlB?=
 =?us-ascii?Q?b2rJ1BXtsbSed1q6tW7ywns3r9LbDDngupIFrKkn20oM2k9Pm4nd+Pth5i5S?=
 =?us-ascii?Q?ORWFOeGri/CJDiIa7PeLsGQ+8r1csnAVRCMfNJpCiT/IuInZppn97sYXvcR4?=
 =?us-ascii?Q?wPRIUklxwvX3MVFvWwILwhPqE77iFV9BBRiN7QlfIHVUBISnHq5mxEcqxvwn?=
 =?us-ascii?Q?T1H7ON2YukdBgwmclgVjfR2dJoAJ9b3nux3XYxUdSrRb3fCs0NPKxRduPEcV?=
 =?us-ascii?Q?qc46YeWTZ4gKBlYB8pOQhsPez7kT?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB8426.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(13003099007)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1LRiCCkhPGb9tJWaHcJu5/oteH6NKGna9jM/JQtmns1h+UEoQe92XZKupYHs?=
 =?us-ascii?Q?lcUCn9+ACHkarM/Xn457Cr9WPnx2KZnjVfu3SnyEFFzhiZNDiXedEKamaXCh?=
 =?us-ascii?Q?r7/wpz1m/Pp2kzIUOkjm6ZqGDlBHPxNWRv+2ncm2R2/7m0fZOm4//O546N78?=
 =?us-ascii?Q?tRlgwi+U43Rx1gXy+9PJPlyWdez2gejcR4LIPRwIzan6kxiHNtynKbV3nk4a?=
 =?us-ascii?Q?zEtW7GeKQZiL8FJmWVNK3StVOtSm8uXw3re9qIUvpjENKVdNEs8e0F3qpiUj?=
 =?us-ascii?Q?dvKT4F9SNhIlbILqlRvFeHSTgG2enFAosL5ojL3zHdtxsO3ucf9X3ISJU05W?=
 =?us-ascii?Q?E1RobJJgVeWHBpFeO+pQH3jCkCR4XxQH/QuDcQOtmrIWN8VPwWJzocFbkMYT?=
 =?us-ascii?Q?0quUIrRtdMECaCs2XuXlYForNMcNCrl5AHGgWWlSAe602YbnWCYiS60TGzPg?=
 =?us-ascii?Q?dgg9WFR1izH6pe0YdWkPzbBHwGc1TjPZdvMQHTNFdm62p2a9uDtysG2EuvXy?=
 =?us-ascii?Q?txcujagIe7Oq0tdRhxvas9pDW93nBeFtkBp/cK9LpBq5OPDb1GYDi3Gv6L8+?=
 =?us-ascii?Q?KEGIASrph0ym+S5P9Lg9PHNRMtB9pMetcLF4xlRFZpnn74mUm0sxXx4+3gHQ?=
 =?us-ascii?Q?BjdHKbPrebPCNpWjHWR0AlhPGFasjBRLJ2U5TR0uukvtAWCxjC4DHEnQDGAx?=
 =?us-ascii?Q?JaVvsgslVGDmXGnIqUEg9nNh68UAjZQO22Z22B0Nsw4wVX/VFcdLVEaDHUyw?=
 =?us-ascii?Q?BuCTpzAwzC5aKpzfthlfz4krYHQHPXvUEieqz4OcE+yTwz7rG01GyfV2Xwrf?=
 =?us-ascii?Q?Qenh1OEJ5EFN52VoprzgDncbcAyxo8tsvuuLlA0dU68tgPBgLKfkV6KIxS7P?=
 =?us-ascii?Q?yJ26pxh7bLohSyEmMpWiZmuNG4uJB3/gXAwMWogHRu9/43VngcH3Y0pJQ1Mg?=
 =?us-ascii?Q?SjmJhb1pFSccp2cNZ+6Gffp0WKCNOkTe8ghyfNKLl4TGEhqjXXJixfm9kqMT?=
 =?us-ascii?Q?2mmCq6bJvgkwv0af6qgoktl0xiYXVlwobCz+CHhcaHuziEvsL/q/MpyWMRCI?=
 =?us-ascii?Q?EEsoHYdJONLsQuk0YbGKl9Pk+pf0evR2LqMJrf/qyY+I7hO7i1YblssJAoUP?=
 =?us-ascii?Q?XlRNCJwOEYcs2241jhqChsf/DlbA9zRxixq51pPRn03oLd044hGkksYD9D13?=
 =?us-ascii?Q?EBB4qPERTmk3fdPPYRm1Ith7wZdwgSBXJrNNd6XNlwbzwQVLxYuZ6fULP3Co?=
 =?us-ascii?Q?TF1UnVAy0OS4DELvM4ZD58EAWeuHNe0h9KLq30K2Mw05sTGSXYpIKROllpxF?=
 =?us-ascii?Q?5BwOpww0wQlNFlj2npmJEe0AK2XtKf2in7p0K19sfLb6eIry9gnZdHKyar8/?=
 =?us-ascii?Q?ZMSo1GTcUXOf63qx8wsNdUHWsb49WngDRyGOEkT16ZObT/gHI9j8XMY7/eku?=
 =?us-ascii?Q?YoJMqhHIUZiNdy25KZ7NqY7Gt6u06qj/w6gu+JEs0SVgh2jjHmpHHGdwPsND?=
 =?us-ascii?Q?Qb9YKicXaAtSIn8bMWJR2zfRjY2rVo5+XdBq7mAOlmCWtLqhY4x6LTYEBLH8?=
 =?us-ascii?Q?GBy0bP2IV0aKRSHc5mQw4cFiblc07kswwL+H8UNlMCBt79X5ZchieLBO2PIZ?=
 =?us-ascii?Q?hg=3D=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 623c1584-9e4e-4494-d0ee-08dd4aacdf65
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8426.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 15:00:50.0642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3hp8Uf7LHkbZp70XxfbSSXZVU6qdsu+5eYRVA8Vc1VIgb3b6WkXPHz/y1rokb5q8QveSWtOXdwdJgK3FHn6RXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9396
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 15:01:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211135

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Add tests for the vendor package

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

 meta/lib/oeqa/selftest/cases/oelib/vendor.py | 237 +++++++++++++++++++
 1 file changed, 237 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/oelib/vendor.py

diff --git a/meta/lib/oeqa/selftest/cases/oelib/vendor.py b/meta/lib/oeqa/s=
elftest/cases/oelib/vendor.py
new file mode 100644
index 0000000000..e245b25098
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/oelib/vendor.py
@@ -0,0 +1,237 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+import io
+import tempfile
+
+from unittest.case import TestCase
+from oe.vendor import cargo, go, npm
+
+class VendorTestCase(TestCase):
+    def setUp(self):
+        self._t =3D tempfile.TemporaryDirectory()
+        self.tmpdir =3D self._t.name
+        self.addCleanup(self._t.cleanup)
+
+class TestCargoVendor(VendorTestCase):
+    def create_cargo_lock_file(self, data):
+        import tomllib
+        filename =3D os.path.join(self.tmpdir, "Cargo.lock")
+        with open(filename, "w") as f:
+            for package in data.get("package", []):
+                f.write("\n[[package]]\n")
+                for key in package.keys():
+                    f.write(f'{key} =3D "{package[key]}"\n')
+        return filename
+
+    def test_valid(self):
+        filename =3D self.create_cargo_lock_file({
+            "package": [
+                {
+                    "name": "regex",
+                    "version": "1.4.0",
+                    "source": "registry+https://github.com/rust-lang/crate=
s.io-index",
+                    "checksum": "36f45b719a674bf4b828ff318906d6c133264c793=
eff7a41e30074a45b5099e2"
+                }, {
+                    "name": "regex",
+                    "version": "1.5.0",
+                    "source": "git+https://github.com/rust-lang/regex.git#=
9f9f693768c584971a4d53bc3c586c33ed3a6831"
+                }
+            ]
+        })
+        expected_uris =3D [
+            "https://proxy.com/cargo/api/v1/crates/regex/1.4.0/download;"
+                "name=3Dregex;"
+                "version=3D1.4.0;"
+                "type=3Dcargo;"
+                "subdir=3Ddummy-4.5.6/vendor;"
+                "downloadfilename=3Dcargo/regex-1.4.0.crate;"
+                "sha256sum=3D36f45b719a674bf4b828ff318906d6c133264c793eff7=
a41e30074a45b5099e2",
+            "git://github.com/rust-lang/regex.git;"
+                "protocol=3Dhttps;"
+                "nobranch=3D1;"
+                "subdir=3Ddummy-4.5.6/vendor/regex-1.5.0;"
+                "rev=3D9f9f693768c584971a4d53bc3c586c33ed3a6831"
+        ]
+        uris =3D cargo.resolve_src_uris(filename, "https://proxy.com/cargo=
",
+                                      "dummy-4.5.6", "vendor")
+        self.assertListEqual(uris, expected_uris)
+
+#
+# Go
+#
+class TestGoVendor(VendorTestCase):
+    def create_go_sum_file(self, data):
+        filename =3D os.path.join(self.tmpdir, "go.sum")
+        with open(filename, 'w') as f:
+            for module_path, version, hash in data:
+                f.write(f"{module_path} {version} {hash}\n")
+        return filename
+
+    def test_resolve_src_uris(self):
+        filename =3D self.create_go_sum_file([
+            (
+                "github.com/Azure/azure-sdk-for-go/sdk/storage/azblob",
+                "v1.0.0",
+                "h1:u/LLAOFgsMv7HmNL4Qufg58y+qElGOt5qv0z1mURkRY=3D"
+            ), (
+                "gopkg.in/ini.v1",
+                "v1.67.0/go.mod",
+                "h1:pNLf8WUiyNEtQjuu5G5vTm06TEv9tsIgeAvK8hOrP4k=3D"
+            )
+        ])
+        expected_src_uris =3D [
+            "https://proxy.com/go/github.com/!azure/azure-sdk-for-go/sdk/s=
torage/azblob/@v/v1.0.0.zip;"
+                "name=3Dgithub.com/Azure/azure-sdk-for-go/sdk/storage/azbl=
ob;"
+                "version=3Dv1.0.0;"
+                "vendor=3Dgo;"
+                "subdir=3Ddummy-cache/cache/download/github.com/!azure/azu=
re-sdk-for-go/sdk/storage/azblob/@v;"
+                "downloadfilename=3Dgo/github.com/!azure/azure-sdk-for-go/=
sdk/storage/azblob/@v/v1.0.0.zip;"
+                "unpack=3D0;"
+                "goh1sum=3Dbbf2cb00e160b0cbfb1e634be10b9f839f32faa12518eb7=
9aafd33d665119116",
+            "https://proxy.com/go/gopkg.in/ini.v1/@v/v1.67.0.mod;"
+                "name=3Dgopkg.in/ini.v1;"
+                "version=3Dv1.67.0;"
+                "subdir=3Ddummy-cache/cache/download/gopkg.in/ini.v1/@v;"
+                "downloadfilename=3Dgo/gopkg.in/ini.v1/@v/v1.67.0.mod;"
+                "unpack=3D0;"
+                "goh1sum=3Da4d2dff16522c8d12d423baee46e6f4e6d3a4c4bfdb6c22=
0780bcaf213ab3f89"
+        ]
+        src_uris =3D go.resolve_src_uris(filename, "https://proxy.com/go",
+                                       "dummy-cache")
+        self.assertListEqual(src_uris, expected_src_uris)
+
+#
+# npm
+#
+class TestNpmVendor(VendorTestCase):
+    def create_package_lock_file(self, data):
+        import json
+        filename =3D os.path.join(self.tmpdir, "package-lock.json")
+        with open(filename, 'w') as f:
+            json.dump(data, f)
+        return filename
+
+    def test_resolve_src_uris(self):
+        filename =3D self.create_package_lock_file({
+            "packages": {
+                "node_modules/array-flatten": {
+                    "version": "1.1.1",
+                    "resolved": "https://registry.npmjs.org/array-flatten/=
-/array-flatten-1.1.1.tgz",
+                    "integrity": "sha1-ml9pkFGx5wczKPKgCJaLZOopVdI=3D"
+                },
+                "node_modules/array-flatten/node_modules/@nodelib/fs.stat"=
: {
+                    "version": "2.0.5",
+                    "resolved": "https://registry.npmjs.org/@nodelib/fs.st=
at/-/fs.stat-2.0.5.tgz",
+                    "integrity": "sha512-RkhPPp2zrqDAQA/2jNhnztcPAlv64XdhI=
p7a7454A5ovI7Bukxgt7MX7udwAu3zg1DcpPU0rz3VV1SeaqvY4+A=3D=3D"
+                },
+                "node_modules/cookie": {
+                    "resolved": "git+https://github.com/jshttp/cookie.git#=
aec1177c7da67e3b3273df96cf476824dbc9ae09"
+                },
+                "node_modules/jsdoc-nr-template": {
+                    "version": "1.0.0",
+                    "resolved": "git+ssh://git@github.com/node-red/jsdoc-n=
r-template.git#3c7c8f96d585c7c5918a2e63519310e1297e162d"
+                },
+                "node_modules/accepts": {
+                    "version": "1.3.8",
+                    "resolved": "https://registry.npmjs.org/accepts/-/acce=
pts-1.3.8.tgz",
+                    "integrity": "sha512-PYAthTa2m2VKxuvSD3DPC/Gy+U+sOA1LA=
uT8mkmRuvw+NACSaeXEQ+NHcVF7rONl6qcaxV3Uuemwawk+7+SJLw=3D=3D",
+                    "inBundle": True
+                },
+                "node_modules/string-width-cjs": {
+                    "name": "string-width",
+                    "version": "4.2.3",
+                    "resolved": "https://registry.npmjs.org/string-width/-=
/string-width-4.2.3.tgz",
+                    "integrity": "sha512-wKyQRQpjJ0sIp62ErSZdGsjMJWsap5oRN=
ihHhu6G7JVO/9jIB6UyevL+tXuOqrng8j/cxKTWyWUwvSTriiZz/g=3D=3D"
+                },
+                "node_modules/example-package": {
+                    "name": "example-package",
+                    "version": "1.2.3",
+                    "resolved": "https://example.com/npm/example-package/-=
/example-package-1.2.3.tgz",
+                    "integrity": "sha512-wKyQRQpjJ0sIp62ErSZdGsjMJWsap5oRN=
ihHhu6G7JVO/9jIB6UyevL+tXuOqrng8j/cxKTWyWUwvSTriiZz/g=3D=3D"
+                },
+                "node_modules/tarball": {
+                    "name": "tarball",
+                    "resolved": "https://example.com/tarball.tgz",
+                    "integrity": "sha512-wKyQRQpjJ0sIp62ErSZdGsjMJWsap5oRN=
ihHhu6G7JVO/9jIB6UyevL+tXuOqrng8j/cxKTWyWUwvSTriiZz/g=3D=3D"
+                },
+                "node_modules/content-type": {
+                    "version": "1.0.4",
+                    "resolved": "https://registry.npmjs.org/content-type/-=
/content-type-1.0.4.tgz",
+                    "integrity": "sha512-hIP3EEPs8tB9AT1L+NUqtwOAps4mk2Zob=
89MWXMHjHWg9milF/j4osnnQLXBCBFBk/tvIG/tUc9mOUJiPBhPXA=3D=3D",
+                    "dev": True
+                },
+                "node_modules/karma": {
+                    "resolved": "",
+                    "link": True
+                },
+            }
+        })
+        expected_common_src_uris =3D [
+            "https://registry.com/npm/array-flatten/-/array-flatten-1.1.1.=
tgz;"
+                "name=3Darray-flatten;"
+                "version=3D1.1.1;"
+                "vendor=3Dnpm;"
+                "subdir=3Ddummy-4.5.6/node_modules/array-flatten;"
+                "downloadfilename=3Dnpm/array-flatten-1.1.1.tgz;"
+                "striplevel=3D1;"
+                "sha1sum=3D9a5f699051b1e7073328f2a008968b64ea2955d2",
+            "https://registry.com/npm/@nodelib/fs.stat/-/fs.stat-2.0.5.tgz=
;"
+                "name=3D@nodelib/fs.stat;"
+                "version=3D2.0.5;"
+                "vendor=3Dnpm;"
+                "subdir=3Ddummy-4.5.6/node_modules/array-flatten/node_modu=
les/@nodelib/fs.stat;"
+                "downloadfilename=3Dnpm/@nodelib-fs.stat-2.0.5.tgz;"
+                "striplevel=3D1;"
+                "sha512sum=3D46484f3e9db3aea0c0400ff68cd867ced70f025bfae17=
761229edaef8e78039a2f23b06e93182decc5fbb9dc00bb7ce0d437293d4d2bcf7555d5279a=
aaf638f8",
+            "git://github.com/jshttp/cookie.git;"
+                "protocol=3Dhttps;nobranch=3D1;"
+                "subdir=3Ddummy-4.5.6/node_modules/cookie;"
+                "rev=3Daec1177c7da67e3b3273df96cf476824dbc9ae09",
+            "git://github.com/node-red/jsdoc-nr-template.git;"
+                "protocol=3Dhttps;nobranch=3D1;"
+                "subdir=3Ddummy-4.5.6/node_modules/jsdoc-nr-template;"
+                "rev=3D3c7c8f96d585c7c5918a2e63519310e1297e162d",
+            "https://registry.com/npm/string-width/-/string-width-4.2.3.tg=
z;"
+                "name=3Dstring-width;"
+                "version=3D4.2.3;"
+                "vendor=3Dnpm;"
+                "subdir=3Ddummy-4.5.6/node_modules/string-width-cjs;"
+                "downloadfilename=3Dnpm/string-width-4.2.3.tgz;"
+                "striplevel=3D1;"
+                "sha512sum=3Dc0ac90450a63274b08a7ad84ad265d1ac8cc256b1aa79=
a1136284786ee86ec954effd8c807a5327af2feb57b8eaab9e0f23fdcc4a4d6c96530bd24eb=
8a2673fe",
+            "https://example.com/npm/example-package/-/example-package-1.2=
.3.tgz;"
+                "name=3Dexample-package;"
+                "version=3D1.2.3;"
+                "vendor=3Dnpm;"
+                "subdir=3Ddummy-4.5.6/node_modules/example-package;"
+                "downloadfilename=3Dnpm/example-package-1.2.3.tgz;"
+                "striplevel=3D1;"
+                "sha512sum=3Dc0ac90450a63274b08a7ad84ad265d1ac8cc256b1aa79=
a1136284786ee86ec954effd8c807a5327af2feb57b8eaab9e0f23fdcc4a4d6c96530bd24eb=
8a2673fe",
+            "https://example.com/tarball.tgz;"
+                "name=3Dtarball;"
+                "subdir=3Ddummy-4.5.6/node_modules/tarball;"
+                "striplevel=3D1;"
+                "sha512sum=3Dc0ac90450a63274b08a7ad84ad265d1ac8cc256b1aa79=
a1136284786ee86ec954effd8c807a5327af2feb57b8eaab9e0f23fdcc4a4d6c96530bd24eb=
8a2673fe"
+        ]
+        expected_dev_src_uris =3D [
+            "https://registry.com/npm/content-type/-/content-type-1.0.4.tg=
z;"
+                "name=3Dcontent-type;"
+                "version=3D1.0.4;"
+                "vendor=3Dnpm;"
+                "subdir=3Ddummy-4.5.6/node_modules/content-type;"
+                "downloadfilename=3Dnpm/content-type-1.0.4.tgz;"
+                "striplevel=3D1;"
+                "sha512sum=3D8483f71043ecf2d07d013d4bf8d52ab70380a6ce26936=
6686fcf4c5973078c75a0f668a517f8f8a2c9e740b5c108114193fb6f206fed51cf66394262=
3c184f5c"
+        ]
+        for dev in [False, True]:
+            src_uris =3D npm.resolve_src_uris(filename,
+                                            "https://registry.com/npm",
+                                            "dummy-4.5.6", dev)
+            expected_src_uris =3D expected_common_src_uris
+            if dev:
+                expected_src_uris +=3D expected_dev_src_uris
+            self.assertListEqual(src_uris, expected_src_uris)
--=20
2.39.5


