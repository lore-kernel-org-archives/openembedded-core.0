Return-Path: <anders.heimer@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B227BC43458
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 15:05:17 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.58])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37112.1782486309137871765
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2026 08:05:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=K98+SZdv;
 spf=pass (domain: est.tech, ip: 40.107.159.58, mailfrom: anders.heimer@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yQrm4+rOkogCY7bZVTeRUiglQ+I3gndk8XGjT6jmW809ST764jQbOxb/+3CJx7hPFB5Sy8XNQeB4TqX23uCHPh3HmLUnAxGAXPK023QQArcse74HkWmJRTm7FN45hOF3OSjI2pzCUnPbA3xG3/Ci3k2fkydniXuUO9O4nxFgmULtcE8YFLU1Q0VaE0Ol1swiXCSIwJ2Tf0wGfxrfsdkgsA4hugG8tev5EnaIfjpT/M3M/OAJiYG5O6XZekOj1MJ29qD9B36q4yqJrGgYMHTpoX28mMk33yjmidKGhYZ9yJv/8a5mWByzlCa1FClvFQLlDktdqw49N8uORM/wAufZ9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ohX5BedPyBsVDeZTOX9bq93WbOD6skC/U4O3w9UXRA=;
 b=bk+JBgiirSDYhKxU/o6jIPCt+D7SxS/Pv6zeeBRoiS30T1+YdzIw6oxd9FvB60+pgokZXVG/V5dh+nu8i+Ow3U6gQXHblvc9MCdaXxk0iCUhrICAbFbdcYTNEZueMAL7A+2xHRcESWGKSZdJ/bCRQ8EArzYX5xE554Okcjb6pwP28BKyNjZ3bEevVedqibV2b5yq7NXgYD6jwuFUBCEmH309Gmari7fhD/PNYCT9gPtbIB/maf7SODt/xBY8/nqkPQ37Rh4L3o6Wmb2gib6SjmrHonduvIQdGZaNXgC9RJsMYYdojzHxxuNQOwEMtY0cxU9u162XWWU2d2OTU2jmiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ohX5BedPyBsVDeZTOX9bq93WbOD6skC/U4O3w9UXRA=;
 b=K98+SZdvGPAdgchTkkkdfLFe8S6QGoH6ANkE9tANq1v2J1j3GrF0M+fZTkfJzEokm+iQimjh7EfHbs3n5K/9Mz8N4Z+sVC2U7pWrsEsTSROQYywUkCJiSYXp+jAAHLc3tO7MNsee9D2qmgFB9p+kRDBvJ3VXAb4QUA9LNZcWOL/mx6HlSCsErZtNyFfB+oPDuCwx/l7dxoRJADRs4y/3EBU/ikpdhJelH0YQ66QpASOMlvNUxESoPxnFKZy+66tYTunDqI1PHlAnozWFp+Je1iAszv67dYcRvuN6yimU/rmsvy7WYbUU7u1IsIX9ecWZtm1IbWFkcIq1aOFHKDOUsQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:2ac::9) by
 AS1P189MB1912.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:4a2::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.16; Fri, 26 Jun 2026 15:05:06 +0000
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::90da:b700:f102:5c82]) by DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::90da:b700:f102:5c82%6]) with mapi id 15.21.0159.016; Fri, 26 Jun 2026
 15:05:06 +0000
From: Anders Heimer <anders.heimer@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Anders Heimer <anders.heimer@est.tech>
Subject: [PATCH v5 2/2] oeqa/selftest: add copydebugsources tests
Date: Fri, 26 Jun 2026 17:04:46 +0200
Message-ID: <4122a4a8f04e0eac77ed1d20524dcee20f74ac24.1782486000.git.anders.heimer@est.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1782486000.git.anders.heimer@est.tech>
References: <cover.1782486000.git.anders.heimer@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0155.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::16) To DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:2ac::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P189MB1641:EE_|AS1P189MB1912:EE_
X-MS-Office365-Filtering-Correlation-Id: efbfa1c6-983f-42e7-5d31-08ded3944ee3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 
	dUWOAKBGwKGo2nWCZnMeyXwWo9KvBpq0j5IKBeRkjFeDbwG73TVYlxbF6Mo0m9FRrgtoCHg9QXT8ZTW4BdS4blkG9kSHF8G/nVJOuDQcinOYOClDD6EQ6heclGnyvszrU9oSEqB3PqJpe2wHmjVYf7uXsCWN8hOSkCh40MqNdqc4nTp4HFi6rZShRpSTtssoj5VJCmzl+hIo8tr5/1zDM3W3kf6RmSfRurjJG691vjJ2n1/FWbfWoBGJUGJMTXpsHet2GTF/5ZmD6vcOiEKg7PC9To9pYCmx+riaSq+ng9+FxPdYu1WTrfb/oBC3wCOyzQiEVmEBENLUZVFJr5g1Mf2o/7Sy+L2iif+kzFBX4bmUMK8yoR2LtmNPGHTnINK3wh/PDhhK6iaxPmFo+u+pB//rOQySMzAkkDe6lCPFPGOnlG/WZCfSdsWxov3fGTVpL5iV6IydJb5ru2xwtc3+aoJLmbBS6m4O5Y7hm9KzI0lbtb1aQogPhkiZYWSwBTol/1vu/WyjatXFfoxpoVI6jMdlcaI/23DNQtSekey2/8wBxBpomJWtb7IgwclZbr8n3P7EP1AC8r+D0+9iUN/jpIeWLCkkzeAKmRXE/chAtYOl29EocRn8Ol359NHv6LRVMsumsIgD9ATF/ZOdLMG3wVGaHg7wnR1pvCAVamISMgM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P189MB1641.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hiloXtZ8jUcv0BriMZa0CtxxemcCMRxRGaLJi0E66PLoK1WR6EuQ/335f29k?=
 =?us-ascii?Q?04sm0c9E6pdh1QvYYnIYP2XGRf9Y/2CZ9I4QxEsji25WanfudnF54Qllxaes?=
 =?us-ascii?Q?TqezRokojmZybKRU2plK5zCVAmlKqIWsKTyOwcwfB9uX9SDE5iCvJvrVt7BZ?=
 =?us-ascii?Q?EWBp1X1abY5mmr2aUORAEPq2KsekUweP8+O6++uc3D0ao0qAUFb7J4cpQu6a?=
 =?us-ascii?Q?ycA4dA5Mf0qUih20p2oV2ptzr4+tyWzcvXReu9y5JW7xtS78uXWGlYC7GiHr?=
 =?us-ascii?Q?MGWuFCvct1aHE5DOEUlHePMrvHBfTQY2ScG/0IsVduxh/JDoa0dqruE8wPFg?=
 =?us-ascii?Q?sdUEjF1NgYHfiYHO+aVTdW7osbVg8g6lCRoj01TKxIofdr4ze2umz5Hbqxgy?=
 =?us-ascii?Q?7+iTNUABfrm45b86hFfCQ/QLwUttJJFXNHMOyj6TqAfQE9E2nylo0AHRj9Uu?=
 =?us-ascii?Q?UbQaF6zde37/3WrA+qI5rBb81LSNLCv3iv14MxFs5O70t5+ikMoraKhotbMl?=
 =?us-ascii?Q?UCelYC7rfMW2a8edgdkRN34na2rI9dRbOlzL6mg0UOlEuqDA22T7Q7FQkm6F?=
 =?us-ascii?Q?ny94n/bgNXBDWXmDkIz/1cHlepNuCT34P56AzDiJQXMizi4GZ9rqRmBvQTpa?=
 =?us-ascii?Q?0nnWZA+3oxSnt3AmpXCG3t9Yig6474E9hK6yiPrQ0nPxA8NixItNru+1jjix?=
 =?us-ascii?Q?7wimSYM1ZqpkAEuMYKqJt5fMXPeZ6fHtQG1G7OZ4A/IEPORCtkXlM74c9e2R?=
 =?us-ascii?Q?PdsbDapOVJvz5AbWbI6A9euDI4b7pv15LuL0F+H4X/8zPvxC2Uo6dSZHLX79?=
 =?us-ascii?Q?xjSrwr/LktQndQMYSdRjUa2n/pblI8q37nR4rIsPsZlvr8t7NzoT7TaDJDEn?=
 =?us-ascii?Q?bFNxpCOVK/kwFmuz8yNVI2gxRfKSDUOkoXEcSgMv5na1iRzUpsg6fJY2iIYY?=
 =?us-ascii?Q?y4xHeCDmu7wmHbMj7k7oTRSVsaTXQXKctVM4FzLikvBaIdcw2CAq48HHutZd?=
 =?us-ascii?Q?a600mj3lMGHjZpC0gN14graDMs/Cgjq1S8uCcXtd7hHApAMnJ/946O9LUBU0?=
 =?us-ascii?Q?K2pGGPCOUY0e1FRx8ivZQolvpA7kR5Hj2yXKbE2pEXyuM2njWzl0BpwuRsfl?=
 =?us-ascii?Q?mTzuZsIx9juiGaU9njk12ZLaPdAfC2w9OF6GAl2L63fsIDmrT7tdcs8tDX3H?=
 =?us-ascii?Q?V9mYCE+r12o/7epth+PYiWR5qhdZIBe1WEXdsRtSU5JTe+aYy96F6u/PCKTv?=
 =?us-ascii?Q?oLSOneAZw60qvBiNv0o54lRfVf9RChRWZiCMA52MsgDIpFys5d6YbvLZXzTh?=
 =?us-ascii?Q?Ri6akY4bw+hfxC2tM37dnUZxt+KyBFp7OmNoyc+8nA/5vkubw8Xp/B8fr3Hu?=
 =?us-ascii?Q?ZwXA7Rx/xZkkfjRq6ZAxDY8CqKhmuBoDtd8etOpvpQZikSurOeBLfQOormZG?=
 =?us-ascii?Q?zcjpjJadsEG8Aw41F87vq9WC0xS2soi82v1jg7zFWv/p/FKanl3HdS5NcD8m?=
 =?us-ascii?Q?pF8tDdAaULRL+foIUkm4VngQSKxLS5WxYmmUqdB1WpLmP7QkKdQFtAb2G36I?=
 =?us-ascii?Q?/iIXFUFT/Ws7qq9/4Po5iGywCsXOaerwCnMOUaMobkTVEYiP4nUuohWIb5QY?=
 =?us-ascii?Q?C5x2Rc1HG+zUZuMRC1LEU+IAdpgyv05kVspwow4F+qFd+ENg7pKENlLwI8YL?=
 =?us-ascii?Q?c4EvJwvuxnKpODTmFYGR7F/rZMptIn1aklPPaMdwacSSrPUgY5f57NZ8xTy3?=
 =?us-ascii?Q?ddZqa1nYGw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: efbfa1c6-983f-42e7-5d31-08ded3944ee3
X-MS-Exchange-CrossTenant-AuthSource: DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 15:05:06.6662
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dwVrFgouoCpdpXDNPJrjm5E/0t1sqTx4ghLOp3JQVHhli0UQBlf6cjVR82pXFf8PPAzHYML7MD2RBNaPdRFbrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1P189MB1912
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 15:05:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239645

Cover multiple source-prefix mappings, recipe-sysroot and compiler
entry filtering, filenames requiring safe argument handling, symlink
dereferencing, tolerated cpio copy failures, empty-directory cleanup,
and externalsrc relocation.

Exercise paths containing spaces and glob metacharacters, leading-dash
filenames, mv overwrite behavior, an empty relocation directory, and a
source copy failure which leaves the prefix-specific destination
uncreated.

AI-Generated: Claude Opus 4.6

Signed-off-by: Anders Heimer <anders.heimer@est.tech>
---
 meta/lib/oeqa/selftest/cases/oelib/package.py | 272 ++++++++++++++++++
 1 file changed, 272 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/oelib/package.py

diff --git a/meta/lib/oeqa/selftest/cases/oelib/package.py b/meta/lib/oeqa/=
selftest/cases/oelib/package.py
new file mode 100644
index 0000000000..16e13aece9
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/oelib/package.py
@@ -0,0 +1,272 @@
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
+import oe.path
+from oe.package import copydebugsources
+
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
+
+class TestCopyDebugSources(TestCase):
+    def setUp(self):
+        for tool in ("cpio", "find", "mv"):
+            if shutil.which(tool) is None:
+                self.skipTest("Required tool %s not found" % tool)
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
+            recipe_sysroot_basename =3D os.path.join(source_root, "nested"=
,
+                                                   "recipe-sysroot-file.c"=
)
+            internal =3D os.path.join(source_root, "nested", "compiler<int=
ernal>")
+            built_in =3D os.path.join(source_root, "nested", "compiler<bui=
lt-in>")
+            target =3D os.path.join(source_root, "nested", "target.c")
+            link =3D os.path.join(source_root, "nested", "link.c")
+            ignored_src =3D os.path.join(source_root, "recipe-sysroot", "i=
gnored.c")
+            ignored_native_src =3D os.path.join(source_root,
+                                             "foo-recipe-sysroot-native",
+                                             "ignored.c")
+            second =3D os.path.join(second_source_root, "second.c")
+
+            with open(normal, "w") as f:
+                f.write("normal\n")
+            with open(special, "w") as f:
+                f.write("special\n")
+            with open(leading_dash, "w") as f:
+                f.write("leading dash\n")
+            with open(recipe_sysroot_basename, "w") as f:
+                f.write("recipe sysroot basename\n")
+            with open(internal, "w") as f:
+                f.write("internal\n")
+            with open(built_in, "w") as f:
+                f.write("built in\n")
+            with open(target, "w") as f:
+                f.write("target\n")
+            os.symlink("target.c", link)
+            os.makedirs(os.path.dirname(ignored_src))
+            with open(ignored_src, "w") as f:
+                f.write("ignored\n")
+            os.makedirs(os.path.dirname(ignored_native_src))
+            with open(ignored_native_src, "w") as f:
+                f.write("ignored native\n")
+            with open(second, "w") as f:
+                f.write("second\n")
+
+            empty_dir =3D oe.path.join(pkgd, debugsrcdir, "empty", "dir")
+            os.makedirs(empty_dir)
+
+            sources =3D [
+                os.path.join(debugsrcdir, "nested", "normal.c"),
+                os.path.join(debugsrcdir, "nested", "name with ; spaces.c"=
),
+                os.path.join(debugsrcdir, "nested", "-leading-dash.c"),
+                os.path.join(debugsrcdir, "nested", "recipe-sysroot-file.c=
"),
+                os.path.join(debugsrcdir, "nested", "compiler<internal>"),
+                os.path.join(debugsrcdir, "nested", "compiler<built-in>"),
+                os.path.join(debugsrcdir, "nested", "link.c"),
+                os.path.join(debugsrcdir, "recipe-sysroot", "ignored.c"),
+                os.path.join(debugsrcdir, "foo-recipe-sysroot-native",
+                             "ignored.c"),
+                os.path.join(second_debugsrcdir, "second.c"),
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
+            copydebugsources(debugsrcdir, sources, d)
+
+            copied_normal =3D oe.path.join(pkgd, debugsrcdir,
+                                         "nested", "normal.c")
+            copied_special =3D oe.path.join(pkgd, debugsrcdir,
+                                          "nested", "name with ; spaces.c"=
)
+            copied_leading_dash =3D oe.path.join(pkgd, debugsrcdir,
+                                               "nested", "-leading-dash.c"=
)
+            copied_recipe_sysroot_basename =3D oe.path.join(
+                pkgd, debugsrcdir, "nested", "recipe-sysroot-file.c")
+            copied_internal =3D oe.path.join(pkgd, debugsrcdir,
+                                           "nested", "compiler<internal>")
+            copied_built_in =3D oe.path.join(pkgd, debugsrcdir,
+                                           "nested", "compiler<built-in>")
+            copied_link =3D oe.path.join(pkgd, debugsrcdir, "nested", "lin=
k.c")
+            copied_second =3D oe.path.join(pkgd, second_debugsrcdir, "seco=
nd.c")
+            ignored =3D oe.path.join(pkgd, debugsrcdir,
+                                   "recipe-sysroot", "ignored.c")
+            ignored_native =3D oe.path.join(pkgd, debugsrcdir,
+                                          "foo-recipe-sysroot-native",
+                                          "ignored.c")
+
+            with open(copied_normal) as f:
+                self.assertEqual(f.read(), "normal\n")
+            with open(copied_special) as f:
+                self.assertEqual(f.read(), "special\n")
+            with open(copied_leading_dash) as f:
+                self.assertEqual(f.read(), "leading dash\n")
+            with open(copied_recipe_sysroot_basename) as f:
+                self.assertEqual(f.read(), "recipe sysroot basename\n")
+            with open(copied_link) as f:
+                self.assertEqual(f.read(), "target\n")
+            with open(copied_second) as f:
+                self.assertEqual(f.read(), "second\n")
+            self.assertFalse(os.path.islink(copied_link))
+            self.assertFalse(os.path.exists(copied_internal))
+            self.assertFalse(os.path.exists(copied_built_in))
+            self.assertFalse(os.path.exists(ignored))
+            self.assertFalse(os.path.exists(ignored_native))
+            self.assertFalse(os.path.exists(empty_dir))
+
+    def test_copydebugsources_ignores_copy_failure(self):
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
+                os.path.join(mapped_debugsrcdir, "missing.c"),
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
+            copydebugsources(debugsrcdir, sources, d)
+
+            self.assertFalse(os.path.exists(oe.path.join(pkgd, mapped_debu=
gsrcdir)))
+            self.assertFalse(os.path.exists(oe.path.join(pkgd, debugsrcdir=
)))
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
+            relocation =3D oe.path.join(pkgd, debugsrcdir, source_root)
+            relocated_name =3D "-relocated with ; spaces.c"
+            os.makedirs(relocation)
+            with open(os.path.join(relocation, relocated_name), "w") as f:
+                f.write("relocated\n")
+            with open(oe.path.join(pkgd, debugsrcdir, relocated_name), "w"=
) as f:
+                f.write("old\n")
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
+            copydebugsources(debugsrcdir, sources, d)
+
+            copied_source =3D oe.path.join(pkgd, debugsrcdir, "real.c")
+            moved_source =3D oe.path.join(pkgd, debugsrcdir, relocated_nam=
e)
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
+            relocation =3D oe.path.join(pkgd, debugsrcdir, source_root)
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
+            copydebugsources(debugsrcdir, sources, d)
+
+            copied_source =3D oe.path.join(pkgd, debugsrcdir, "real.c")
+
+            with open(copied_source) as f:
+                self.assertEqual(f.read(), "real\n")
+            self.assertFalse(os.path.exists(relocation))

