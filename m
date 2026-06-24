Return-Path: <anders.heimer@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87107CDE004
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 12:44:26 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.13])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6140.1782305058372622363
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jun 2026 05:44:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=DFQjduSE;
 spf=pass (domain: est.tech, ip: 40.107.159.13, mailfrom: anders.heimer@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A0Q1RmLealvCZVmGdmZijai2pNpFiQ8Ck6RMzLFhEXBF0crf0R6+miAPdm3lm3tDX3yYGMA3o/wmBM2JxYVBbenN44Mci20/eze9QWl7SQmHQ69ReylVB90RnOb64jlvRI6+pcHX1FqBdyY5+c97bkzTb4JJ+1LhMA+Irqj9TJDSGxj6K+abvebt599GRYKW1nENrJc1nwI+4jmcMOZBYsxCHfQSJDilLYmQjOEENNtmzku33i6mMvo/lAwZSuzrx3sO41kQ5/8Jrriq1+7WU+0k5/55V/21Oov2dDokOx8IXy+kcmT3j681uueriw8nPNHp2v8lhh3hflZ1QSNkig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3/DhFVIi4jNXVhDXQAOm+A68oiuS0+O2tR/Sdw+nroI=;
 b=NV8H9tOdyT3j5Wpmfc4t1KlisEzFygCUexCBmyck3rbN5EigdT5V0iaqWITNtNE9dH9zHlpDFujDBwB7bVjUPycOcFK+xA9uPOXKgiWvrS/PhsARs7TBuyLP+LpzX1c/q8QgF3lzk3NxM5mEqtzS9Js3UmMUz3+lPhNdIbb+L8SdY9n58JZvQpwkva6hwCVN1FLC4ViBIIZpWJPX5LFztv9uQkzFXMZAaGP+0cQ1mb0YC/5bRIcRzjkwf+4YgfymeqXVsH7nwLwMs6ffdHGC2LAjBWr0+hkqFC7u/uMTyAiZi2Gnf40M/30rvGnNlCY7TDzS2FvH8zMOx799Gh/dVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3/DhFVIi4jNXVhDXQAOm+A68oiuS0+O2tR/Sdw+nroI=;
 b=DFQjduSEIInDEInvycE78pBszd0N3Sqpwr5BkuyGtjYWQq6HJ1e5CmRu0TotP78/yfEp/Y6qYLnjjGFx4S2JWfCLdepswApgOIFwbrnybaOuL1FjGut1D1gKLhmm92UTrcEI3b6KjGdoeV5Y48KNLn0dZKR70weLj9WTdThp3yKbNSW/RzHDbQBMINxaqXoM6k7BEO3H9FdfmqemrlxbYgtDFiv1C1rzn5pNVCq02I9tQY2IabxYDD/UXSfWH05AqJE3UD23rI4iCzZ7HPWLDCw5cp4FBqzeY1Yr2bCgCHOA/yQjBbFXI88BrwECSoKL+cYVFwnODWfwm+ok2c2ktw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:2ac::9) by
 GV1P189MB2739.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:1c9::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.20; Wed, 24 Jun 2026 12:44:13 +0000
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::90da:b700:f102:5c82]) by DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::90da:b700:f102:5c82%6]) with mapi id 15.21.0159.013; Wed, 24 Jun 2026
 12:44:13 +0000
From: Anders Heimer <anders.heimer@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Anders Heimer <anders.heimer@est.tech>,
	Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH v2 2/9] oeqa/oelib: add runcmd tests
Date: Wed, 24 Jun 2026 14:44:00 +0200
Message-ID: <f1fc94375640da2f4b42d8d8954485781167672f.1782304923.git.anders.heimer@est.tech>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1782304923.git.anders.heimer@est.tech>
References: <cover.1782304923.git.anders.heimer@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU6P191CA0026.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:53f::17) To DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:2ac::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P189MB1641:EE_|GV1P189MB2739:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dad2a43-54bc-4bc9-206a-08ded1ee4bbf
X-LD-Processed: d2585e63-66b9-44b6-a76e-4f4b217d97fd,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|22082099003|18002099003|3023799007|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: hr9BrwsDas9XE6mQ8LSjaIUMBwIyeuzmUtb0VdhAw9Rf+6glt+0l0sMbS3iyUmsRWFfw/MQcXkhSYreCkXogfKo/mXos9PfheMZiJVOqKGwfZ3Jz3Ji/PK3Nq5NbbrIzior6AxbcY2ez3WuDobnfcZpc0S2dvxO/Aj/exoWNGtsVjSqdvFAvJRJK8pDMzVc0F29y8BV5ibkzH/M+G/SmCbi2w9oroHNyX7bIzowXyxEeQkzMyu3eLNohOySIVsxiLud3OR8D3kwzz9Gsdf9MG+efTEau4FntDrhaAgsBXkLwdl1C7pz04B8C34Hrf7QHp1qHYz1auCPHTPhvfekhenz15UyADE6whYUylWQzEmO+cu6KAaDWiyhLtFuzgDKcIxgYkkC72IpUPm9dvXw8cfXkgtJ08sYMnekJzLrUvlnDeHzRmjLYLqAlu8gZHboR7ZU6T7ipu7s3ZZhcQ5vbldI5QsLy8RH9TQIvtlyXOm80T+D5mmdeMJKJy9in9FQ6D4lo2FXr3PssN2roEFZ47RgzrX+zl0NGHy0x+Cdoj7jJIhU6loL5XMJuv/Q67PUWI+KQnhJcSKdmk7tsBd1Ipwweir/UI+UgVboIc73EZG9u4VGUVZ9X90xTT6Ds9i0oaEyywe1cJKQyr83K8UNML9bxUyVRLOhf+DMyb17cs/Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P189MB1641.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(22082099003)(18002099003)(3023799007)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FtUpKyp5S+xu8AKLysmHRehIdmfvSXlkrJhX21GnXLH5kZsm5XYIzGyNd1KZ?=
 =?us-ascii?Q?DwzogsDt5ERD8caH7T40CoLXU2WSYsXqbjS1QYK44uD6oiD6nYAspMlwBgCT?=
 =?us-ascii?Q?tQeU80Ck+RS5vw5lDkAdzfrD2BoNCFU8HzflwN/Q2bn7E1iveCfmmNr5YXnk?=
 =?us-ascii?Q?+6fv7/Oo6e8PWYTA1f2pXgUK4R2KvR85u0AeJFr7Obc9LvpboguZJGqpuMMh?=
 =?us-ascii?Q?vhqiBfKD/ImAInW5w9fex630lbfEDWvedmq91l/SJLClmLzZLmVgTb4+sndr?=
 =?us-ascii?Q?nlEsSmJR2SQzMB7vxIR4Yxxo1XIW7nwkhJdXY4OgNqpLcYz0fLJuFvKed5mF?=
 =?us-ascii?Q?Mqzo3XFHFCaEx0Zzt6Iy2hG2256adSR6JHePViSnNHtw5z3Bd29lDKMfZ4cP?=
 =?us-ascii?Q?3a0xI8mWmdpMk4fb2i2BMKyzUHiHVazYy9+oBty8eKqQvJn5YMxKVIz4r+Br?=
 =?us-ascii?Q?/eZt+skil4MvJ+RDTNqPrOW0H4EXVv3DpT26s6HcC9sU+9JjjnIAJzVf8C0l?=
 =?us-ascii?Q?yacQy+qyJQrZ7QFZ+H/6ZvC3ggXltbKXnLfOUj1AGIL+BBmWBJO4AEb2i31U?=
 =?us-ascii?Q?LMeDguqH5MH3rHgerbdDq2L+8ALRaUxo35yagtN4sed0DN9bdldfIzkzQFLW?=
 =?us-ascii?Q?zUogaKncA0tDzOIbXYOWrCvGjhR2cUOqtdq6FlZywTJkqCP7RxK43mZyQp28?=
 =?us-ascii?Q?Q1arWqvAhnkoNyZIPVEoGLGgvzv9d7fNgbMGsqXEgUwkL1f83GEtHuxsgPl+?=
 =?us-ascii?Q?bClI/coRyYBY8qPpSycHu5Ix4+IGc+tSH4d9MxJLwHBQuQ1Pu3lCy0rs7GLy?=
 =?us-ascii?Q?n7jnPFRFg720m+n7ymwR7RYBp4QkRTFxvaaNz2LADViVMavp+dEHX+dgRAHH?=
 =?us-ascii?Q?x30BlOuojmsWTuIqveJk6EsswEy71nRjj5ZetXfwZdw0TgLyPjAHgpz4nHzU?=
 =?us-ascii?Q?7v8G9gayJYE/+J4vy9Ym+/2E+0v2agkUJZVh+8gee5ASagXqPZXJStmgFVeC?=
 =?us-ascii?Q?FjFCVkNFtYnfy+zDukF+A0gI+53LbzzkxPNmLApVt1a8WItbfYB/sq/N4u+/?=
 =?us-ascii?Q?s7EP3IuAEPS8yn26CP3LBrtBvSeqrCWKBhgvC5LHExLz8iMQNcCFk2ehtGZ+?=
 =?us-ascii?Q?vNa0N/I+6xGSu3KS4944O7/TvS1bLqGamEhh4ecam2spv9QuPLTHUa63u2aa?=
 =?us-ascii?Q?ZOfbMLsJcQaZb+d8UAnEcYAJ1HUFyAchOn+fmDzt559DjEboedtbcLMsJTa6?=
 =?us-ascii?Q?8IojEWHXsjTMTs1GxfdV0hS6/UOR1gVYKMfh1U611K0c1mkqbfCBzVE0TCpc?=
 =?us-ascii?Q?8b7wqowqfczbT/jwR2yrfdLQlX7VH38Yzzx3xQcaWPcbKx6g6xERyZc8Blzk?=
 =?us-ascii?Q?mBRme8guTkB7nJSMMLar9QeMeqg/ESkNo1zujtos2NxvR0T0qtgq4UmFcABD?=
 =?us-ascii?Q?80FXngX5XniFjVnEB8tSidbijRUgCK300T/fsasnLmkc5x9lXpG9otA8laox?=
 =?us-ascii?Q?CtY/ON/JPQwFVbAqJcPrhkyKaZryF6IGq6XXLa4cZN3Vbqe2/MoxlW28NkGE?=
 =?us-ascii?Q?WXHQAlNMPNrQOfm6GYztMAQJbzxndNp/73YkNKqW9cpgBGoRdGuVIOcD/Z7M?=
 =?us-ascii?Q?aI1BV5QhkwIsHiYzf2uVlGF6Zds7Q4BhjzUNQAhrKzDHNLm0aRAqFW6t60Jm?=
 =?us-ascii?Q?NGBJne8EbZYLlbDJ2GI+aCDyoO+uo4dw9/p9wDjLfNBtBqYwhJgJVZLJ7pHs?=
 =?us-ascii?Q?oZzq36XEAw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dad2a43-54bc-4bc9-206a-08ded1ee4bbf
X-MS-Exchange-CrossTenant-AuthSource: DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 12:44:13.7583
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VDLLFanzEVoBiFCph6Wzjz468Hc5PMADFyH5sT3iFjRFya8HEKmh7wy+gSHa420Q+ePlMoutDWiSbuegwJptRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P189MB2739
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 12:44:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239496

Cover literal argv handling, explicit shell use, subprocess exit
status, and exec failure wrapping.

AI-Generated: Claude Opus 4.6

Reviewed-by: Daniel Turull <daniel.turull@ericsson.com>
Signed-off-by: Anders Heimer <anders.heimer@est.tech>
---
 meta/lib/oeqa/selftest/cases/oelib/patch.py | 45 +++++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/oelib/patch.py

diff --git a/meta/lib/oeqa/selftest/cases/oelib/patch.py b/meta/lib/oeqa/se=
lftest/cases/oelib/patch.py
new file mode 100644
index 0000000000..4cbfef4ce6
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/oelib/patch.py
@@ -0,0 +1,45 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+import sys
+from unittest.case import TestCase
+
+import oe.patch
+
+
+class TestRunCmd(TestCase):
+    def test_runcmd_preserves_argv_elements(self):
+        output =3D oe.patch.runcmd([
+            sys.executable,
+            "-c",
+            "import sys; print(sys.argv[1])",
+            "value with spaces;$(false)*",
+        ])
+        self.assertEqual(output, "value with spaces;$(false)*\n")
+
+    def test_runcmd_allows_explicit_shell(self):
+        output =3D oe.patch.runcmd([
+            "sh", "-c", 'printf "%s" "$1"', "sh", "shell value",
+        ])
+        self.assertEqual(output, "shell value")
+
+    def test_runcmd_reports_exit_status(self):
+        with self.assertRaises(oe.patch.CmdError) as ctx:
+            oe.patch.runcmd([
+                sys.executable,
+                "-c",
+                "raise SystemExit(7)",
+            ])
+
+        self.assertEqual(ctx.exception.status, 7)
+
+    def test_runcmd_wraps_exec_failure(self):
+        with self.assertRaises(oe.patch.CmdError) as ctx:
+            oe.patch.runcmd([
+                "/definitely-not-an-existing-executable",
+            ])
+
+        self.assertEqual(ctx.exception.status, 127)

