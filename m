Return-Path: <anders.heimer@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 308A4CD98E6
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 08:25:33 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.40])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.149549.1781598328874555928
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 01:25:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=WibQHEj1;
 spf=pass (domain: est.tech, ip: 52.101.84.40, mailfrom: anders.heimer@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=beaAPHoq1FIofcUhQZDW4uKH0LFF6JLkHTW/qBB3/ilvp1HoulwQwg5SVlpSeYwqWgOJ/lGzWtGaHxuqkcLwZ/oB1OUajDzfTn5SI58J456DXKtbDz6PUeuFJOTMsxJJWg7hkn5uORd/REAYMr4tG4nGeJ0BQmDzCCZcdpyJ2usoiAlN1kekPbmRmmsaSYdSZyMksP7QcZHHeeTU4FLIVLfV9fDVeB7nx7kOSEfIk1FzkL1kVYI4MOY+HThNqeNt33sKB2BYElYynpNK32AYFnzQugpvYwqpLsSHxNjVedrpZlXxgtDV6MGw8+rtGtQxq5aY7nro+H72c/4KWLT+1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yrV0l06uZIujpA9XBnmHeqAl6XkDgBJcmOQ4SB1MXB4=;
 b=OuLsfVlXo/n8uZuD4ynzdsGiOAjJohCF2BMNcp8JGaSwPuRY9ugAPF6KRjXgabqpmeyQyAX3TLCs4eJoIYiMSbkg0Y+rRMOE2WQsVEeVqQPb1Oe/cerclZMSIaNaGwal/4e/rA8XtYuRphkXTkVkF4HnjrHcGu50fD595B+Bn/kVE+oxFCwxnJy5RrHygpoCwPzEc+tIXWemvKRkY+n58xVmda6bqN6O+4r8AXjD0Pawqc1UNVpw4i1C/hFElLL9O0Rmx5sTri6bXonpsvs8WYJPKpxKWRLI5Cgi5hOGslJqgdC7lz5+w/X3ZPlx8vliwrEgFBYU7fvDq0z70AFMNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yrV0l06uZIujpA9XBnmHeqAl6XkDgBJcmOQ4SB1MXB4=;
 b=WibQHEj1aJMn7owSi8reqCEQscTwcYg38DKQj8i64rKvuStaI7PcEfizm7jgzyg5biMOs3AuFZQ1+A7Ch43mTrlDHHyXGWK/5JabF3oOU64fXbuIU4BdkrTl08iNUPmRlstJkEXAOdTBZtZLXzOROCKxvv8JmNuyjY2T+vIdiudJZJiMIXpBuZsA5cEqN1GXan3Rxr2uocOoKehTLVhsmdoj84FMpCYvAzepO2So00kILi2gxqydMrGNzFH6+wXNNbVyBSySf8WkwM9PZ4n8pRwn5gDjnw2zYHKLxTXA38ljIXcw7wNI6RH0Mf3o7o23tncTlmKnoWSQBQv+9p+vSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:2ac::9) by
 DU0P189MB2156.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:3cb::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.18; Tue, 16 Jun 2026 08:25:23 +0000
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::90da:b700:f102:5c82]) by DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::90da:b700:f102:5c82%6]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 08:25:23 +0000
From: Anders Heimer <anders.heimer@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Anders Heimer <anders.heimer@est.tech>
Subject: [PATCH 2/2] oeqa/oelib: add copydebugsources tests
Date: Tue, 16 Jun 2026 10:25:16 +0200
Message-ID: <20260616082516.1553768-3-anders.heimer@est.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260616082516.1553768-1-anders.heimer@est.tech>
References: <20260616082516.1553768-1-anders.heimer@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PR3P189CA0036.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:53::11) To DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:2ac::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P189MB1641:EE_|DU0P189MB2156:EE_
X-MS-Office365-Filtering-Correlation-Id: 10a6b4ac-ae1e-4a55-2695-08decb80cf7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	i2nQw780TX/kFNMSFvvula8CCixysxHxnNfF/QPtHy++BWStKCeHfjioSMSEwsJA25UhUNLWu6xgZdHaBoq1xqRj6gzk9B6l2hAgeeKiFjNzv+wg45BVvjxGyjLMSWPYiShudqorDzyD/WB+ea7eg9N4njZNI9rIMoCzNWivpKyX54R22pJDnHquKIQBwsvSAtqYFPQkZ5aYWp/3gKUEW7FPHe8dmPSQQn8TngagmrXHd+5lyn7xFCyKFX1n3vMtWe6J4fGKxpcpf1hrK9Sh4UsvXMm3q3P5ldQUfdpwyBVYbhB07tZdNFJTWSXR9rs3um2MQdWmvJfCyHs4sO0UM+naZtd9+hGNuXXRV2rGnazN/V5bSk3iZ9LPVLAGg5nMR5QMofULXlabf3tL0Bfpc4J2wiXWmTRCjPtegYLKFkS3OcbR8WH56EgRDJQhCSMQQNHJyJ6KSvokptBRuLVZ4k3bAuqvbRyXevp3hhnlU4UyT9vq/vZih9gvmTWtBeggE1chbFxdXwwvPkm7N1PXUs0bh1TsJobvlQFFGQCE17bsvx9MTie97KRAQlymx0oi9y/NTjQP8liTAKxNRUanf00+PZM4n0KCibikmrO07e8Rien6aP9YvhruzG6u3NkwyKSAAPN3f7Sgf1QwZk5Kw+y81rSp7mDrktlDT8rfznrlRmVidIPk/ZTGBic/o7SV
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P189MB1641.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?gwMK0MlI6+ijZQCtms7v6VQApr/z49xKhGytWqmb48fSVvXjLQ8mhuFD2NWz?=
 =?us-ascii?Q?C1Gd4V3IrSvAcW/qwtmAwMExxiLp3rjCO/+Y3L3SuB0GZ0JZ994usBLd3JVv?=
 =?us-ascii?Q?YkcyzbpO/3f6R7SIUGeJN7MjUWetTOWeuxJa5QUYQNGaMH57H5U1Vi0oTugf?=
 =?us-ascii?Q?2DBJpHOHtAdcRb4/ho5b8zdOzOn4qimuMKkgTCwzZcexLY0PeJ10oaItqBNm?=
 =?us-ascii?Q?ATcwFmnhmMac3uSezFxN1rq6Uo80kycNbVWUBihi35gSNlMa2N9sro5F+1AS?=
 =?us-ascii?Q?qOfpMQu3/ZL917WMZL4LJpSMS1wkv77iYIJlvTZDtC0wck7Tfjq93BTnbQUx?=
 =?us-ascii?Q?GZWcj1bznQi+gFYnS1nIZcFx+YibY645u7DdwtJNofajfNg6T98lc2WEbBvZ?=
 =?us-ascii?Q?9du/pY3y2t6LjPV+vJ5ARFTYK2rqMdY6l1C5o6xbyT6A/oL/GWkSqDX5pZSa?=
 =?us-ascii?Q?aWATxLRvvHbUsYN7/V6XLJCC0grmaiQUk3N/KGAZ48U3mHIYU3oZzmGcDojl?=
 =?us-ascii?Q?2D6YwNL231PZ5MTonGrUUoh1rXjd2tXjIz9COd79mvUlFusEwmDmsYJpKDH1?=
 =?us-ascii?Q?AGBmVkzaWwdOSvUV1qRIsyilbt3LvdJEx/Ht50e+JriDwmzVzBb1LkzVgzbY?=
 =?us-ascii?Q?uMNBx44JiM9l4BXbwFtiEmD4IhxGnyinkDK1nLhNdbxjuuLccYdM2st4P4di?=
 =?us-ascii?Q?p9dRu1GA3WJ4KLPS5Jb/cRqYUj5varEFE+Zgk34noxQ19A/TqpNXee0rL0dm?=
 =?us-ascii?Q?gYvrY3cpJBQ2Ei9Y22o9N0BDRufslQ+uYlZQTOru7jWJWFUHNox7tI/z9HXe?=
 =?us-ascii?Q?8gki0q6xkMk5/L+IPlCLTbVS0rEzadeMl6AsGHcoWBuFbfq56hCOWfZ9GJoX?=
 =?us-ascii?Q?DlE43EyuQRFOhJ1Q0YmiE8dIUKSX+ZgGea+dt8PeU7BV/0PNl03M4R+1ZrAT?=
 =?us-ascii?Q?gARYSrNfGgq9Lop5HjF+4VRhg4KW3rxyE/QW37fcOCpfm7FgyjqPC8mFjNbR?=
 =?us-ascii?Q?YJAWfDWvHFyGXTN9XaD7Z8Eil1RYZUTEhb8mCrDBLadtSDdGlP6X9vDwxgqc?=
 =?us-ascii?Q?C7AWJFXKpERaIw3EXruPQrerjkTJmCfapgAKvankG9fMZxKXOes21h66fFqM?=
 =?us-ascii?Q?UP2MR3Lq2QEDKQ0mh4TLk82PkY4voH5cQSVAWbySmgn3OIJTvQ0jMdJzSk6s?=
 =?us-ascii?Q?3mevzonRRRFi0AAws+Za4luITuFQ/+XoFBfOfA5eStTdNJu/dpoGZyao9Le5?=
 =?us-ascii?Q?MZG+Fgx3QFb6u8NIB1ZB8z0O0FZ/hGezjEGyhAZCnUrN0EaSbDyyRmsXiqMl?=
 =?us-ascii?Q?RsPwLFlGVH+gzUfGTMxNhwYaRf+1WGrHjcAL5XZTfKN/FcYlUwvNuFNCBZ6n?=
 =?us-ascii?Q?GJ5ErSitM2ts/mEv00Joy35ZaKROaMFX3nlT6QP+Z/WoovoHIVx5ZrLfjs4Y?=
 =?us-ascii?Q?aeu3adRgxLafTjgCLZqocvsHE/aELEno0avX0uWNHpDklZUp5iTLFCz8sYY2?=
 =?us-ascii?Q?iL0yIzn9aHg4LFT7kDWCpfFE4fjnVgzykPOrZL1uKvnqywZyUA/eSD4OaHvX?=
 =?us-ascii?Q?JteceLXZJVwzyU/I73LGJXFqPIWaRaS3AQQiLXUnWmhA6Wx294rP41AMuaTb?=
 =?us-ascii?Q?IN3NEADzpwls/I6pWG/KyDKADq5r2ZlSTnxphQqQ3jN7g4ZOTDr65WjQ2OJp?=
 =?us-ascii?Q?x2GKyxEGuafOkijECfCgnhXWYOfTZ3Ok0JBLOxwVBMA15cYfkl5oCQUGtoYO?=
 =?us-ascii?Q?6cY5OItw7w=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 10a6b4ac-ae1e-4a55-2695-08decb80cf7e
X-MS-Exchange-CrossTenant-AuthSource: DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 08:25:23.1674
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oBN8Z2soprb8lbW7Ewxxm4mcRkMddE6ohV02/eunOR4fsOndA+mHwGfspKQitvOpsnTuvfoeIf07CHSkuOM+Dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB2156
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 08:25:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238879

Cover debug source copying, ignored source paths and externalsrc
relocation.

AI-Generated: Claude Opus 4.6

Signed-off-by: Anders Heimer <anders.heimer@est.tech>
---
 meta/lib/oeqa/selftest/cases/oelib/package.py | 239 ++++++++++++++++++
 1 file changed, 239 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/oelib/package.py

diff --git a/meta/lib/oeqa/selftest/cases/oelib/package.py b/meta/lib/oeqa/=
selftest/cases/oelib/package.py
new file mode 100644
index 0000000000..39c7d0661d
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/oelib/package.py
@@ -0,0 +1,239 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+import os
+import shutil
+import tempfile
+from unittest.case import TestCase
+
+class FakeDataStore:
+    def __init__(self, values):
+        self.values =3D values
+
+    def getVar(self, name):
+        return self.values.get(name)
+
+    def expand(self, value):
+        for name, replacement in self.values.items():
+            value =3D value.replace("${%s}" % name, replacement)
+        return value
+
+class TestCopyDebugSources(TestCase):
+    def setUp(self):
+        for tool in ("sort", "egrep", "fgrep", "sed", "cpio", "find", "mv"=
):
+            if shutil.which(tool) is None:
+                self.skipTest("Required tool %s not found" % tool)
+
+    def copydebugsources(self, debugsrcdir, sources, d):
+        try:
+            import oe.package
+        except ImportError:
+            self.skipTest("Cannot import oe.package")
+
+        oe.package.copydebugsources(debugsrcdir, sources, d)
+
+    def test_copydebugsources_copies_files_and_dereferences_links(self):
+        with tempfile.TemporaryDirectory(prefix=3D"oe-test-package-") as t=
mpdir:
+            source_root =3D os.path.join(tmpdir, "source")
+            second_source_root =3D os.path.join(tmpdir, "second-source")
+            workdir =3D os.path.join(tmpdir, "work")
+            pkgd =3D os.path.join(tmpdir, "pkgd")
+            debugsrcdir =3D "/usr/src/debug/testpkg/1.0"
+            second_debugsrcdir =3D "/usr/src/debug/secondpkg/1.0"
+
+            os.makedirs(os.path.join(source_root, "nested"))
+            os.makedirs(second_source_root)
+            os.makedirs(workdir)
+            os.makedirs(pkgd)
+
+            normal =3D os.path.join(source_root, "nested", "normal.c")
+            special =3D os.path.join(source_root, "nested", "name with ; s=
paces.c")
+            leading_dash =3D os.path.join(source_root, "nested", "-leading=
-dash.c")
+            target =3D os.path.join(source_root, "nested", "target.c")
+            link =3D os.path.join(source_root, "nested", "link.c")
+            ignored_src =3D os.path.join(source_root, "recipe-sysroot", "i=
gnored.c")
+            second =3D os.path.join(second_source_root, "second.c")
+
+            with open(normal, "w") as f:
+                f.write("normal\n")
+            with open(special, "w") as f:
+                f.write("special\n")
+            with open(leading_dash, "w") as f:
+                f.write("leading dash\n")
+            with open(target, "w") as f:
+                f.write("target\n")
+            os.symlink("target.c", link)
+            os.makedirs(os.path.dirname(ignored_src))
+            with open(ignored_src, "w") as f:
+                f.write("ignored\n")
+            with open(second, "w") as f:
+                f.write("second\n")
+
+            sources =3D [
+                os.path.join(debugsrcdir, "nested", "normal.c"),
+                os.path.join(debugsrcdir, "nested", "name with ; spaces.c"=
),
+                os.path.join(debugsrcdir, "nested", "-leading-dash.c"),
+                os.path.join(debugsrcdir, "nested", "link.c"),
+                os.path.join(debugsrcdir, "recipe-sysroot", "ignored.c"),
+                os.path.join(second_debugsrcdir, "second.c"),
+                "<internal>",
+            ]
+            d =3D FakeDataStore({
+                "WORKDIR": workdir,
+                "PKGD": pkgd,
+                "STRIP": "strip",
+                "OBJCOPY": "objcopy",
+                "S": os.path.join(workdir, "source"),
+                "CFLAGS": (
+                    "-ffile-prefix-map=3D%s=3D%s "
+                    "-ffile-prefix-map=3D%s=3D%s"
+                ) % (
+                    source_root,
+                    debugsrcdir,
+                    second_source_root,
+                    second_debugsrcdir,
+                ),
+            })
+
+            self.copydebugsources(debugsrcdir, sources, d)
+
+            copied_normal =3D os.path.join(pkgd, debugsrcdir.lstrip("/"),
+                                         "nested", "normal.c")
+            copied_special =3D os.path.join(pkgd, debugsrcdir.lstrip("/"),
+                                          "nested", "name with ; spaces.c"=
)
+            copied_leading_dash =3D os.path.join(pkgd, debugsrcdir.lstrip(=
"/"),
+                                               "nested", "-leading-dash.c"=
)
+            copied_link =3D os.path.join(pkgd, debugsrcdir.lstrip("/"),
+                                       "nested", "link.c")
+            copied_second =3D os.path.join(pkgd, second_debugsrcdir.lstrip=
("/"),
+                                         "second.c")
+            ignored =3D os.path.join(pkgd, debugsrcdir.lstrip("/"),
+                                   "recipe-sysroot", "ignored.c")
+
+            with open(copied_normal) as f:
+                self.assertEqual(f.read(), "normal\n")
+            with open(copied_special) as f:
+                self.assertEqual(f.read(), "special\n")
+            with open(copied_leading_dash) as f:
+                self.assertEqual(f.read(), "leading dash\n")
+            with open(copied_link) as f:
+                self.assertEqual(f.read(), "target\n")
+            with open(copied_second) as f:
+                self.assertEqual(f.read(), "second\n")
+            self.assertFalse(os.path.islink(copied_link))
+            self.assertFalse(os.path.exists(ignored))
+
+    def test_copydebugsources_ignores_missing_destroot(self):
+        with tempfile.TemporaryDirectory(prefix=3D"oe-test-package-") as t=
mpdir:
+            source_root =3D os.path.join(tmpdir, "source")
+            workdir =3D os.path.join(tmpdir, "work")
+            pkgd =3D os.path.join(tmpdir, "pkgd")
+            debugsrcdir =3D "/usr/src/debug/testpkg/1.0"
+            mapped_debugsrcdir =3D os.path.join(debugsrcdir, "mapped")
+
+            os.makedirs(source_root)
+            os.makedirs(workdir)
+            os.makedirs(pkgd)
+
+            sources =3D [
+                os.path.join(mapped_debugsrcdir, "recipe-sysroot", "ignore=
d.c"),
+                "<internal>",
+                "<built-in>",
+            ]
+            d =3D FakeDataStore({
+                "WORKDIR": workdir,
+                "PKGD": pkgd,
+                "STRIP": "strip",
+                "OBJCOPY": "objcopy",
+                "S": os.path.join(workdir, "source"),
+                "CFLAGS": "-ffile-prefix-map=3D%s=3D%s" % (
+                    source_root,
+                    mapped_debugsrcdir,
+                ),
+            })
+
+            self.copydebugsources(debugsrcdir, sources, d)
+
+            self.assertFalse(os.path.exists(pkgd + mapped_debugsrcdir))
+            self.assertFalse(os.path.exists(pkgd + debugsrcdir))
+
+    def test_copydebugsources_moves_externalsrc_relocation(self):
+        with tempfile.TemporaryDirectory(prefix=3D"oe-test-package-") as t=
mpdir:
+            source_root =3D os.path.join(tmpdir, "external-[source]")
+            workdir =3D os.path.join(tmpdir, "work")
+            pkgd =3D os.path.join(tmpdir, "pkgd")
+            debugsrcdir =3D "/usr/src/debug/testpkg/1.0"
+
+            os.makedirs(source_root)
+            os.makedirs(workdir)
+            os.makedirs(pkgd)
+
+            source =3D os.path.join(source_root, "real.c")
+            with open(source, "w") as f:
+                f.write("real\n")
+
+            relocation =3D pkgd + debugsrcdir + source_root
+            relocated_name =3D "-relocated with ; spaces.c"
+            os.makedirs(relocation)
+            with open(os.path.join(relocation, relocated_name), "w") as f:
+                f.write("relocated\n")
+
+            sources =3D [os.path.join(debugsrcdir, "real.c")]
+            d =3D FakeDataStore({
+                "WORKDIR": workdir,
+                "PKGD": pkgd,
+                "STRIP": "strip",
+                "OBJCOPY": "objcopy",
+                "S": source_root,
+                "CFLAGS": "-ffile-prefix-map=3D%s=3D%s" % (source_root, de=
bugsrcdir),
+            })
+
+            self.copydebugsources(debugsrcdir, sources, d)
+
+            copied_source =3D os.path.join(pkgd, debugsrcdir.lstrip("/"), =
"real.c")
+            moved_source =3D os.path.join(pkgd, debugsrcdir.lstrip("/"), r=
elocated_name)
+
+            with open(copied_source) as f:
+                self.assertEqual(f.read(), "real\n")
+            with open(moved_source) as f:
+                self.assertEqual(f.read(), "relocated\n")
+            self.assertFalse(os.path.exists(relocation))
+
+    def test_copydebugsources_ignores_empty_externalsrc_relocation(self):
+        with tempfile.TemporaryDirectory(prefix=3D"oe-test-package-") as t=
mpdir:
+            source_root =3D os.path.join(tmpdir, "external-source")
+            workdir =3D os.path.join(tmpdir, "work")
+            pkgd =3D os.path.join(tmpdir, "pkgd")
+            debugsrcdir =3D "/usr/src/debug/testpkg/1.0"
+
+            os.makedirs(source_root)
+            os.makedirs(workdir)
+            os.makedirs(pkgd)
+
+            source =3D os.path.join(source_root, "real.c")
+            with open(source, "w") as f:
+                f.write("real\n")
+
+            relocation =3D pkgd + debugsrcdir + source_root
+            os.makedirs(relocation)
+
+            sources =3D [os.path.join(debugsrcdir, "real.c")]
+            d =3D FakeDataStore({
+                "WORKDIR": workdir,
+                "PKGD": pkgd,
+                "STRIP": "strip",
+                "OBJCOPY": "objcopy",
+                "S": source_root,
+                "CFLAGS": "-ffile-prefix-map=3D%s=3D%s" % (source_root, de=
bugsrcdir),
+            })
+
+            self.copydebugsources(debugsrcdir, sources, d)
+
+            copied_source =3D os.path.join(pkgd, debugsrcdir.lstrip("/"), =
"real.c")
+
+            with open(copied_source) as f:
+                self.assertEqual(f.read(), "real\n")
+            self.assertFalse(os.path.exists(relocation))

